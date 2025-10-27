local GameModeCompleteNode = Class("StoryCreator.StoryLogic.StorylineNodes.Node")
local TaskUtils = require("BluePrints.UI.TaskPanel.TaskUtils")

function GameModeCompleteNode:Init()
  self.QuestHintMessageId = 0
  self.IsShowGuide = false
  self.GuidePointName = ""
end

function GameModeCompleteNode:Start(Context)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  self.Context = Context
  self:TrytoSetQuestExtraInfo()
  self:TrytoSetQuestInterfaceJump()
  self:ExecuteTaskHintShow()
  if self.IsShowGuide then
    MissionIndicatorManager:ActiveMissionIndicatorByNode(self)
  end
  EventManager:RemoveEvent(EventID.OnGameModeComplete, self)
  EventManager:AddEvent(EventID.OnGameModeComplete, self, self.OnGameModeCountUpdate)
  self:OnGameModeCountUpdate(true)
end

function GameModeCompleteNode:OnGameModeCountUpdate(IsStart)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  local QuestChainId = tonumber(self.Context.QuestChainId)
  local QuestChain = Avatar.QuestChains[QuestChainId]
  if not QuestChain then
    return
  end
  local QuestId = tonumber(self.QuestId)
  local QuestData = QuestChain.QuestSaveDatas:GetQuestData(QuestId)
  if not QuestData then
    return
  end
  if IsStart then
    local TaskInfo = {
      TaskChainId = QuestChainId,
      TaskId = QuestId,
      TaskName = GText(DataMgr.QuestChain[QuestChainId] and DataMgr.QuestChain[QuestChainId].QuestChainName),
      TaskDescription = GText(self.QuestDescription),
      IsChainFirstTask = self.bIsStartQuest,
      IsChapterStart = self.bIsStartChapter
    }
    Avatar:DoRefreshTaskItemUIInfo("Add", TaskInfo)
    Avatar:DoRefreshTaskItemUIInfo("Modify", TaskInfo, {
      QuestData:GetCurrentProgress(),
      self.GameModeKeyCount,
      QuestChainId,
      QuestId,
      self
    })
  else
    Avatar:DoRefreshTaskItemUIInfo("Modify", nil, {
      QuestData:GetCurrentProgress(),
      self.GameModeKeyCount,
      QuestChainId,
      QuestId,
      self
    })
  end
  if QuestData:GetCurrentProgress() < self.GameModeKeyCount then
    return
  end
  local TaskInfo = {
    TaskChainId = QuestChainId,
    TaskId = QuestId,
    IsChainLastTask = self.bIsEndQuest,
    IsChapterEnd = self.bIsEndChapter
  }
  Avatar:DoRefreshTaskItemUIInfo("Delete", TaskInfo)
  self:ExecuteTaskHintHide()
  if self.IsShowGuide then
    MissionIndicatorManager:ReactiveMissionIndicatorByNode(self)
  end
  self:Finish("Success")
  EventManager:RemoveEvent(EventID.OnGameModeComplete, self)
end

function GameModeCompleteNode:Clear()
  EventManager:RemoveEvent(EventID.OnGameModeComplete, self)
  if self.IsShowGuide then
    MissionIndicatorManager:ReactiveMissionIndicatorByNode(self)
  end
end

function GameModeCompleteNode:TrytoSetQuestExtraInfo()
  local QuestChainId = tonumber(self.Context.QuestChainId)
  local QuestId = tonumber(self.QuestId)
  if 0 == QuestChainId or 0 == QuestId then
    return
  end
  TaskUtils:SetQuestExtraInfo(QuestChainId, QuestId, {
    NodeKey = self.Key,
    Node = self
  })
end

function GameModeCompleteNode:TrytoSetQuestInterfaceJump()
  TaskUtils:SetQuestInterfaceJump(self.QuestId, 0 ~= self.InterfaceJumpId, self.IsShowGuide, self.InterfaceJumpId)
end

function GameModeCompleteNode:OnCancelTrack()
  if self.QuestHintMessageId > 0 or self.QuestHintMessageId ~= nil then
    local TaskUIObj = TaskUtils:GetTaskBarWidget()
    if TaskUIObj.Tips.Visibility == UE4.ESlateVisibility.SelfHitTestInvisible then
      TaskUIObj.Tips:SetVisibility(UE4.ESlateVisibility.Collapsed)
    end
  end
end

function GameModeCompleteNode:OnChooseTrack()
  if self.QuestHintMessageId > 0 or self.QuestHintMessageId ~= nil then
    local TaskUIObj = TaskUtils:GetTaskBarWidget()
    if TaskUIObj and TaskUIObj.Tips then
      TaskUIObj.Tips:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    end
  end
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    local QuestChainId = tonumber(self.Context.QuestChainId)
    local QuestChain = Avatar.QuestChains[QuestChainId]
    if not QuestChain then
      return
    end
    local QuestId = tonumber(self.QuestId)
    local QuestData = QuestChain.QuestSaveDatas:GetQuestData(QuestId)
    if not QuestData then
      return
    end
    if QuestData then
      Avatar:DoRefreshTaskItemUIInfo("Modify", nil, {
        QuestData:GetCurrentProgress(),
        self.GameModeKeyCount,
        QuestChainId,
        QuestId,
        self
      })
    end
  end
end

function GameModeCompleteNode:ExecuteTaskHintShow()
  if 0 == self.QuestHintMessageId or self.QuestHintMessageId == nil then
    return
  end
  if nil == DataMgr.Message[self.QuestHintMessageId] or nil == DataMgr.Message[self.QuestHintMessageId].MessageContentPC or nil == DataMgr.Message[self.QuestHintMessageId].MessageContentPhone then
    ScreenPrint(string.format("GameModeCompleteNode, \228\187\187\229\138\161\230\143\144\231\164\186\228\191\161\230\129\175\233\148\153\232\175\175\239\188\140MessageId\228\184\141\229\173\152\229\156\168 %s:", tostring(self.QuestHintMessageId)))
    return
  end
  local TaskUIObj = TaskUtils:GetTaskBarWidget()
  local MessageId = CommonUtils.ChooseOptionByPlatform(DataMgr.Message[self.QuestHintMessageId].MessageContentPC, DataMgr.Message[self.QuestHintMessageId].MessageContentPhone)
  local MessageContent = GText(MessageId)
  
  local function GenAndParseActionMapContent(Panel, SourceContent)
    local FirstIndex = string.find(SourceContent, "&")
    if not FirstIndex then
      Panel.Text_Tips01:SetText(SourceContent)
      Panel.Key:SetVisibility(UE4.ESlateVisibility.Collapsed)
      Panel.Text_Tips02:SetVisibility(UE4.ESlateVisibility.Collapsed)
      return SourceContent
    end
    Panel.Key:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    Panel.Text_Tips01:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    Panel.Text_Tips02:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    local SecondIndex = string.find(SourceContent, "&", FirstIndex + 1)
    local ActionContent = string.sub(SourceContent, FirstIndex, SecondIndex)
    local ActionMapText = GText(CommonUtils:StringReplaceActionName(ActionContent))
    Panel.Key:CreateCommonKey({
      KeyInfoList = {
        {Type = "Text", Text = ActionMapText}
      }
    })
    local sub1 = string.sub(SourceContent, 1, FirstIndex - 1)
    local sub2 = string.sub(SourceContent, SecondIndex + 1)
    Panel.Text_Tips01:SetText(sub1)
    Panel.Text_Tips02:SetText(sub2)
  end
  
  GenAndParseActionMapContent(TaskUIObj, MessageContent)
  TaskUIObj:PlayAnimation(TaskUIObj.Tooltip_In)
  TaskUIObj.Panel_Tips:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  TaskUIObj.Tips:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
end

function GameModeCompleteNode:ExecuteTaskHintHide()
  local TaskUIObj = TaskUtils:GetTaskBarWidget()
  if TaskUIObj.Visibility == UE4.ESlateVisibility.SelfHitTestInvisible then
    TaskUIObj:PlayAnimation(TaskUIObj.Tooltip_Out)
  end
end

function GameModeCompleteNode:ClearWhenQuestSuccess()
  TaskUtils:ClearQuestExtraInfo(self.Context.QuestChainId, self.QuestId, self.Key)
  TaskUtils:RemoveQuestInterfaceJump(self.QuestId)
end

function GameModeCompleteNode:StopQuest()
  EventManager:RemoveEvent(EventID.OnGameModeComplete, self)
  if self.IsShowGuide then
    MissionIndicatorManager:ReactiveMissionIndicatorByNode(self)
  end
  TaskUtils:ClearQuestExtraInfo(self.Context.QuestChainId, self.QuestId, self.Key)
end

return GameModeCompleteNode
