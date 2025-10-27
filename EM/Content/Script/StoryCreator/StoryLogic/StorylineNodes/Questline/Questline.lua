local StorylineUtils = require("StoryCreator.StoryLogic.StorylineUtils")
local Questline = Class("StoryCreator.StoryLogic.StorylineNodes.Storyline.BaseStoryline")

function Questline:Init(QuestlineData, Storyline, StoryNode)
  Questline.Super.Init(self, QuestlineData, Storyline, StoryNode)
  self.Data = QuestlineData
  self.Storyline = Storyline
  self.StoryNode = StoryNode
  self.QuestChainId = Storyline.QuestChainId
  self.FileName = Storyline.FileName
  self.FilePath = Storyline.FilePath
  self.QuestData = QuestlineData.propsData
  self.QuestId = self.QuestData.QuestId
  self.QuestData.QuestChainId = self.QuestChainId
  self.RunningNodeList = {}
  self.bLockRunningNodeList = false
  self.FinishedNodeList = {}
  self.STLData = {}
  self:BuildQuestline()
end

function Questline:BuildQuestline()
  local NodeData
  if _G.bEnableNewSTLDataFeature then
    NodeData = self.Data.graphData.nodeData
  else
    NodeData = self.Data.questNodeData.nodeData
  end
  for NodeId, NodeData in pairs(NodeData) do
    local Node = StorylineUtils.CreateQuestNode(NodeData.type, self)
    if Node.IsStartNode then
      self:SetStartNode(Node)
    elseif Node.IsEndNode then
      self:SetEndNode(Node)
    elseif Node.IsSuccessNode then
      self:SetSuccessNode(Node)
    elseif Node.IsFailNode then
      self:SetFailNode(Node)
    end
    Node:BuildNode(NodeId, NodeData, self.QuestData)
    self:AddNode(NodeId, Node)
  end
  if not self:GetStartNode() then
    local Message = "\228\187\187\229\138\161\230\178\161\230\156\137StartNode\232\191\158\231\186\191" .. [[

FileName:]] .. self.FileName .. [[

QuestChainId:]] .. self.QuestChainId .. [[

QuestId:]] .. self.QuestId .. [[

StoryNodeKey:]] .. self.Data.key
    UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "\228\187\187\229\138\161\230\178\161\230\156\137StartNode\232\191\158\231\186\191", Message)
    return
  end
  local LineData
  if _G.bEnableNewSTLDataFeature then
    LineData = self.Data.graphData.lineData
  else
    LineData = self.Data.questNodeData.lineData
  end
  self:BuildAdjacencyMap(LineData, "startQuest", "endQuest")
  self.HasStarted = false
  self.HasFinished = true
end

function Questline:StartQuest(NodeId)
  if self.Storyline.HasFinished then
    local Message = "\229\188\128\229\167\139\228\187\187\229\138\161\230\151\182\239\188\140\228\187\187\229\138\161\233\147\190\229\183\178\231\187\147\230\157\159" .. [[

FileName:]] .. self.FileName .. [[

QuestChainId:]] .. self.QuestChainId .. [[

QuestId:]] .. self.QuestId .. [[

StoryNodeKey:]] .. self.Data.key
    UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "\229\188\128\229\167\139\228\187\187\229\138\161\230\151\182\239\188\140\228\187\187\229\138\161\233\147\190\229\183\178\231\187\147\230\157\159", Message)
    return
  end
  if self.HasStarted then
    local Message = "\228\187\187\229\138\161\229\183\178\229\188\128\229\167\139" .. [[

FileName:]] .. self.FileName .. [[

QuestChainId:]] .. self.QuestChainId .. [[

QuestId:]] .. self.QuestId .. [[

StoryNodeKey:]] .. self.Data.key
    UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "\228\187\187\229\138\161\229\183\178\229\188\128\229\167\139", Message)
    return
  end
  if NodeId and 0 ~= NodeId then
    self.StartedNode = self:GetNode(NodeId)
    if not self.StartedNode then
      local Message = "NodeId\228\184\141\229\173\152\229\156\168" .. [[

FileName:]] .. self.FileName .. [[

QuestChainId:]] .. self.QuestChainId .. [[

QuestId:]] .. self.QuestId .. [[

StoryNodeKey:]] .. self.Data.key .. [[

QuestNodeKey:]] .. NodeId
      UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "NodeId\228\184\141\229\173\152\229\156\168", Message)
      return
    end
  else
    self.StartedNode = self._StartNode
  end
  DebugPrint("Questline Start", self.QuestId)
  self.RunningNodeList = {}
  self.HasStarted = true
  self.HasFinished = false
  self:HandleActivateSkill(self.QuestId, "Start")
  self:StartNode(self.StartedNode)
end

function Questline:HandleActivateSkill(QuestId, QuestLineState)
  local QuestActiveSkillConfig = DataMgr.QuestActiveSkill[QuestId]
  if not QuestActiveSkillConfig then
    return
  end
  if QuestActiveSkillConfig.QuestStartorSuccess ~= QuestLineState then
    return
  end
  local Controller = UE4.UGameplayStatics.GetPlayerController(GWorld.GameInstance, 0)
  local PlayerController = Controller:Cast(UE4.ASinglePlayerController)
  local ActivateHandle = QuestActiveSkillConfig.InactiveorActive == "Active"
  if QuestActiveSkillConfig.ActiveType == "Lock" then
    local SkillNamesArray = TArray(0)
    for _, SkillType in pairs(QuestActiveSkillConfig.SkillId) do
      if PlayerController:CheckSkillInActive(ESkillName[SkillType]) then
        if ActivateHandle then
          SkillNamesArray:Add(ESkillName[SkillType])
        end
      elseif not ActivateHandle then
        SkillNamesArray:Add(ESkillName[SkillType])
      end
    end
    if ActivateHandle then
      PlayerController:ActiveSkills(SkillNamesArray, "UnLock")
    else
      PlayerController:InActiveSkills(SkillNamesArray, "Lock")
    end
  else
    local SkillNamesArray = TArray(0)
    for _, SkillType in pairs(QuestActiveSkillConfig.SkillId) do
      if PlayerController:CheckSkillInActive(ESkillName[SkillType]) then
        if ActivateHandle then
          SkillNamesArray:Add(ESkillName[SkillType])
        end
      elseif not ActivateHandle then
        SkillNamesArray:Add(ESkillName[SkillType])
      end
    end
    if ActivateHandle then
      PlayerController:UnEmptySkills(SkillNamesArray)
    else
      PlayerController:EmptySkills(SkillNamesArray)
    end
  end
end

function Questline:StartNode(NextNode, InportInfo)
  if self.Storyline.HasFinished then
    local Message = string.format([[
FileName: %s
NodeInfo: %s]], self.FileName, NextNode:ToString())
    UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "Storyline \229\183\178\231\187\147\230\157\159\239\188\140\229\188\128\229\167\139\232\138\130\231\130\185\229\164\177\232\180\165", Message)
    return
  end
  if self.HasFinished then
    local Message = string.format([[
FileName: %s
NodeInfo: %s]], self.FileName, NextNode:ToString())
    UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "Questline \229\183\178\231\187\147\230\157\159\239\188\140\229\188\128\229\167\139\232\138\130\231\130\185\229\164\177\232\180\165", Message)
    return
  end
  if self.bLockRunningNodeList then
    local Message = string.format([[
FileName: %s
NodeInfo: %s]], self.FileName, NextNode:ToString())
    UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "Questline \229\183\178\233\148\129\229\174\154\239\188\140\229\188\128\229\167\139\232\138\130\231\130\185\229\164\177\232\180\165", Message)
    return
  end
  if NextNode.HasStopped then
    return
  end
  if "Stop" == InportInfo then
    NextNode.HasStopped = true
    DebugPrint("----------------------------------------------------------StopNode ", NextNode:ToString())
    NextNode:Stop()
  else
    NextNode.HasStarted = true
    NextNode.HasFinished = false
    self.RunningNodeList[NextNode.Key] = NextNode
    DebugPrint("----------------------------------------------------------StartNode ", NextNode:ToString())
    self:TryAddAfterSpecialQuestFailMark(NextNode)
    NextNode:Start(self, InportInfo)
  end
end

function Questline:FinishNode(Node, OutPortNames, Result)
  if self.Storyline.HasFinished then
    local Message = string.format([[
FileName: %s
NodeInfo: %s]], self.FileName, Node:ToString())
    UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "Storyline \229\183\178\231\187\147\230\157\159\239\188\140\229\174\140\230\136\144\232\138\130\231\130\185\229\164\177\232\180\165", Message)
    return
  end
  if self.HasFinished then
    local Message = string.format([[
FileName: %s
NodeInfo: %s]], self.FileName, Node:ToString())
    UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "Questline \229\183\178\231\187\147\230\157\159\239\188\140\229\174\140\230\136\144\232\138\130\231\130\185\229\164\177\232\180\165", Message)
    return
  end
  if self.bLockRunningNodeList then
    local Message = string.format([[
FileName: %s
NodeInfo: %s]], self.FileName, Node:ToString())
    UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "Questline \229\183\178\233\148\129\229\174\154\239\188\140\229\174\140\230\136\144\232\138\130\231\130\185\229\164\177\232\180\165", Message)
    return
  end
  if Node.HasFinished then
    local Message = string.format([[
FileName: %s
NodeInfo: %s]], self.FileName, Node:ToString())
    UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "QuestNode \229\183\178\231\187\147\230\157\159", Message)
    return
  end
  DebugPrint("----------------------------------------------------------FinishNode", Result, Node:ToString())
  Node.HasFinished = true
  Node.HasStarted = false
  table.insert(self.FinishedNodeList, Node)
  self.RunningNodeList[Node.Key] = nil
  if Node == self._SuccessNode then
    self:FinishQuest("Success", true)
    return
  elseif Node == self._FailNode then
    self:FinishQuest("Fail", false)
    return
  elseif Node.bIsConditionNode then
    self:FinishQuest(Node:GetPortName(), true)
    return
  end
  for _, OutPortName in pairs(OutPortNames) do
    local NodeInfoList = self:GetNextNodeInfoListByPortName(Node, OutPortName)
    if NodeInfoList then
      for _, NextNodeInfo in pairs(NodeInfoList) do
        if self.HasFinished then
          DebugPrint("OutPort Have Multiple Connections,But Questline Is Finished. nNodeInfo:", Node:ToString())
          return
        end
        local NextNode = NextNodeInfo.Node
        local InPortName = NextNodeInfo.InPortName
        self:StartNode(NextNode, InPortName)
      end
    end
  end
end

function Questline:FinishQuest(OutPortName, bSucceeded)
  if self.Storyline.HasFinished then
    local Message = "\231\187\147\230\157\159\228\187\187\229\138\161\230\151\182\239\188\140\228\187\187\229\138\161\233\147\190\229\183\178\231\187\147\230\157\159" .. [[

FileName:]] .. self.FileName .. [[

QuestChainId:]] .. self.QuestChainId .. [[

QuestId:]] .. self.QuestId .. [[

StoryNodeKey:]] .. self.Data.key
    UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "\231\187\147\230\157\159\228\187\187\229\138\161\230\151\182\239\188\140\228\187\187\229\138\161\233\147\190\229\183\178\231\187\147\230\157\159", Message)
    return
  end
  if self.HasFinished then
    local Message = "\228\187\187\229\138\161\229\183\178\231\187\147\230\157\159" .. [[

FileName:]] .. self.FileName .. [[

QuestChainId:]] .. self.QuestChainId .. [[

QuestId:]] .. self.QuestId .. [[

StoryNodeKey:]] .. self.Data.key
    UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "\228\187\187\229\138\161\229\183\178\231\187\147\230\157\159", Message)
    return
  end
  self.HasFinished = true
  self.HasStarted = false
  self:ClearQuest()
  self:ClearNodeWhenQuestFinish(bSucceeded)
  DebugPrint("Questline Finish", self.QuestId)
  self.StoryNode:FinishQuest(OutPortName, bSucceeded)
end

function Questline:ClearQuest()
  self.bLockRunningNodeList = true
  local RunningNodes = {}
  for _, Node in pairs(self.RunningNodeList) do
    table.insert(RunningNodes, Node)
  end
  for _, Node in pairs(RunningNodes) do
    if Node.Clear then
      Node:Clear()
    end
    Node.HasFinished = true
    Node.HasStarted = false
    table.insert(self.FinishedNodeList, Node)
    self:CheckAfterSpecialQuestFailMark(Node)
  end
  self.bLockRunningNodeList = false
  self.RunningNodeList = {}
  if self.QuestChainId > 0 and self.QuestId > 0 then
    local StorySubsystem = UE4.USubsystemBlueprintLibrary.GetGameInstanceSubsystem(GWorld.GameInstance, UStorySubsystem:StaticClass())
    if StorySubsystem then
      StorySubsystem:ClearVarByQuestChainId(self.QuestChainId)
    end
  end
end

function Questline:ClearNodeWhenQuestFinish(IsSuccess)
  if IsSuccess then
    for _, Node in ipairs(self.FinishedNodeList) do
      if Node.HasFinished then
        Node:ClearWhenQuestSuccess()
      end
    end
  else
    for i = #self.FinishedNodeList, 1, -1 do
      local Node = self.FinishedNodeList[i]
      if Node.HasFinished then
        Node:ClearWhenQuestFail()
      end
    end
  end
  self.FinishedNodeList = {}
end

function Questline:StopQuest(IgnoreFinishClear)
  self.HasFinished = true
  self.HasStarted = false
  self:ClearQuest()
  if not IgnoreFinishClear then
    self:ClearNodeWhenQuestFinish(false)
    self:QuestlineEnd("Stop")
  end
end

function Questline:RestartQuest()
  self:ClearQuest()
  self:ClearNodeWhenQuestFinish(false)
  self:BuildQuestline()
  self:StartQuest()
end

function Questline:SuccessQuest()
  self:ClearQuest()
  self._SuccessNode:Start(self)
end

function Questline:FailQuest()
  self:ClearQuest()
  self._FailNode:Start(self)
end

function Questline:PrintInfo()
  DebugPrint("---------------------------QuestInfo---------------------------")
  DebugPrint("QuestId: ", self.QuestId)
  DebugPrint("\228\187\187\229\138\161\230\143\143\232\191\176: ", self.QuestDescriptionComment)
  for _, Node in pairs(self.RunningNodeList) do
    DebugPrint("---------------------------NodeInfo---------------------------")
    DebugPrint(Node:ToString())
    DebugPrint("---------------------------NodeInfo---------------------------")
  end
  DebugPrint("---------------------------QuestInfo---------------------------")
end

function Questline:AddCallback(Owner, Interval, func, IsLoop, NodeKey, HandleName, IsRealTime, ...)
  self.Storyline:AddCallback(Owner, Interval, func, IsLoop, NodeKey, HandleName, IsRealTime, ...)
end

function Questline:RemoveCallback(NodeKey, HandleName, IsRealTime)
  self.Storyline:RemoveCallback(NodeKey, HandleName, IsRealTime)
end

function Questline:SaveSuitUpdateData(FunctionName, SuitType, SuitSubType, SuitKey, ...)
  if not self.STLData then
    self.STLData = {}
  end
  local SuitValue = {
    ...
  }
  if #SuitValue <= 1 then
    SuitValue = table.unpack(SuitValue)
  end
  local SuitUpdateData = {
    FunctionName = FunctionName,
    SuitType = SuitType,
    SuitSubType = SuitSubType,
    Param = {SuitKey = SuitKey, SuitValue = SuitValue}
  }
  table.insert(self.STLData, SuitUpdateData)
end

function Questline:StopStory()
  self.StoryNode:StopStory()
end

function Questline:GetAllLineData()
  if _G.bEnableNewSTLDataFeature then
    return self.Data.graphData.lineData
  else
    return self.Data.questNodeData.lineData
  end
end

function Questline:GetPayload(...)
  if self.Storyline then
    return self.Storyline:GetPayload(...)
  else
    return nil
  end
end

function Questline:AddPayload(Key, Value)
  if self.Storyline then
    self.Storyline:AddPayload(Key, Value)
  end
end

function Questline:TryAddAfterSpecialQuestFailMark(Node)
  if self:GetPayload("SpecialQuestFail") then
    Node.StartAfterSpecialQuestFail = true
  end
end

function Questline:CheckAfterSpecialQuestFailMark(Node)
  if Node.StartAfterSpecialQuestFail then
    local Message = "\231\137\185\230\174\138\228\187\187\229\138\161\229\164\177\232\180\165\229\144\142\232\191\144\232\161\140\228\186\134\229\188\130\230\173\165\232\138\130\231\130\185" .. [[

FileName:]] .. self.FileName .. [[

SpecialQuestId:]] .. self:GetPayload("SpecialQuestId") .. [[

NodeInfo:]] .. Node:ToString()
    UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "\231\137\185\230\174\138\228\187\187\229\138\161\229\164\177\232\180\165\229\144\142\232\191\144\232\161\140\228\186\134\229\188\130\230\173\165\232\138\130\231\130\185", Message)
  end
end

function Questline:QuestlineEnd(Reason)
  if "Stop" == Reason then
    local Avatar = GWorld:GetAvatar()
    local GameMode = UE4.UGameplayStatics.GetGameMode(GWorld.GameInstance)
    if self.QuestChainId > 0 and self.QuestId > 0 and Avatar and GameMode then
      local TaskInfo = {
        TaskChainId = self.QuestChainId,
        TaskId = self.QuestId,
        IsChainLastTask = self.QuestData.bIsEndQuest,
        IsChapterEnd = self.QuestData.bIsEndChapter
      }
      Avatar:DoRefreshTaskItemUIInfo("Add", TaskInfo)
      GameMode:RecoverDataByQuestChainId(self.QuestChainId, self.QuestId)
    end
  end
end

return Questline
