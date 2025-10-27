local FCheckOptionConditionNode = require("BluePrints.Story.StoryIteration.CheckOptionConditionNode")
local ImpressionTypes = require("BluePrints.UI.UI_PC.Impression.ImpressionConst").ImpressionTypes
local FTalkTriggerComponent = require("BluePrints.Story.Talk.Component.TalkTriggerComponent")
local FIterationStartNode = require("BluePrints.Story.StoryIteration.IterationStartNode")
local FIterationEndNode = require("BluePrints.Story.StoryIteration.IterationEndNode")
local FDialogueNode = require("BluePrints.Story.StoryIteration.DialogueNode")
local ReviewUtils = require("BluePrints.UI.WBP.StoryReview.StoryReviewUtils")
local FOptionNode = require("BluePrints.Story.StoryIteration.OptionNode")
local TalkUtils = require("BluePrints.Story.Talk.View.TalkUtils")
local ETalkType = require("BluePrints.Story.Talk.Base.ETalkType")
local EDialogueNodeType = TalkUtils.EDialogueNodeType
local FStoryIterationGraph = {}
local RecordChainComponent = "BluePrints.Story.StoryIteration.Components.RecordChainComponent"

function FStoryIterationGraph:New(Dialogues, InitialDialogueId, TalkTask)
  local StoryIterationGraph = setmetatable({}, {__index = FStoryIterationGraph})
  StoryIterationGraph.TalkTask = TalkTask
  StoryIterationGraph.BasicTalkType = TalkTask:GetBasicTalkType()
  StoryIterationGraph.TalkTriggerComponent = FTalkTriggerComponent:New()
  StoryIterationGraph.bShowInStoryReview = TalkTask.TalkTaskData.bShowInStoryReview
  StoryIterationGraph:Init(Dialogues, InitialDialogueId)
  return StoryIterationGraph
end

function FStoryIterationGraph:Init(Dialogues, InitialDialogueId)
  if not InitialDialogueId or not Dialogues[InitialDialogueId] then
    DebugPrint("lhr@FStoryIterationGraph:Init, Dialogue is nil", InitialDialogueId)
    return
  end
  self:InitNodeMaps()
  self.Dialogues = Dialogues
  self.EndNode = FIterationEndNode:New(self)
  self.CurrentNode = FIterationStartNode:New(Dialogues, InitialDialogueId, self)
  self:SetComponent(RecordChainComponent)
end

function FStoryIterationGraph:InitNodeMaps()
  self.CheckConditionNodeMap = {}
  self.DialogueNodeMap = {}
  self.OptionNodeMap = {}
end

function FStoryIterationGraph:GetOrCreateNode(NodeType, DialogueId)
  local Node = self:GetNode(NodeType, DialogueId)
  if nil ~= Node then
    return Node
  end
  if "Dialogue" == NodeType then
    Node = FDialogueNode:New(self.Dialogues, DialogueId, self)
  elseif "Option" == NodeType then
    Node = FOptionNode:New(self.Dialogues, DialogueId, self)
  elseif "CheckOptionCondition" == NodeType then
    Node = FCheckOptionConditionNode:New(self.Dialogues, DialogueId, self)
  elseif "Start" == NodeType then
    DebugPrint("FStoryIterationGraph@GetOrCreateNode: \228\184\141\232\131\189\229\136\155\229\187\186Start\232\138\130\231\130\185")
    return
  elseif "End" == NodeType then
    DebugPrint("FStoryIterationGraph@GetOrCreateNode: \228\184\141\232\131\189\229\136\155\229\187\186End\232\138\130\231\130\185")
    return
  else
    DebugPrint("FStoryIterationGraph@GetOrCreateNode: NodeType\230\151\160\230\149\136", NodeType)
    return
  end
  return Node
end

function FStoryIterationGraph:GetNode(NodeType, DialogueId)
  if "End" == NodeType then
    return self.EndNode
  elseif "Dialogue" == NodeType then
    return self.DialogueNodeMap[DialogueId]
  elseif "Option" == NodeType then
    return self.OptionNodeMap[DialogueId]
  elseif "CheckOptionCondition" == NodeType then
    return self.CheckConditionNodeMap[DialogueId]
  end
end

function FStoryIterationGraph:Iterate(...)
  self.CurrentNode:Iterate(...)
end

function FStoryIterationGraph:OnNodeEnter(Node)
  if not Node then
    DebugPrint("FStoryIterationGraph@OnNodeEnter: Node\230\151\160\230\149\136")
    return
  end
  if self.CurrentNode == Node then
    DebugPrint("FStoryIterationGraph@OnNodeEnter: \233\135\141\229\164\141\232\191\155\229\133\165\232\138\130\231\130\185")
    return
  end
  self.CurrentNode = Node
end

function FStoryIterationGraph:OnNodeRecord(Node, ...)
end

function FStoryIterationGraph:Skip()
  local bSkipFail = self.CurrentNode:Skip()
  return not bSkipFail
end

function FStoryIterationGraph:IsBlack()
  return self.BasicTalkType == ETalkType.Black
end

function FStoryIterationGraph:IsCinematic()
  return self.BasicTalkType == ETalkType.Cinematic
end

function FStoryIterationGraph:UsingImpressionUI()
  return self.TalkTask.TalkType == "Impression" or self.TalkTask.TalkType == "QuestImpression"
end

function FStoryIterationGraph:GetCurrentNode()
  return self.CurrentNode
end

function FStoryIterationGraph:GetDesiredNode(Node)
  if Node then
    return Node:GetDesiredNode()
  end
  return nil
end

function FStoryIterationGraph:RecordOption(OptionData, bTalkOption)
  DebugPrint("lhr@RecordOption", TalkUtils:DialogueIdToContent(OptionData.SelectedOption))
  if OptionData then
    local DialogueData = DataMgr.Dialogue[OptionData.SelectedOption]
    if OptionData.bImpression then
      local OptionType = OptionData.OptionType
      local ImpressionId = DialogueData["Impr" .. OptionType .. "Id"]
      local OptionInfo = DataMgr["Impression" .. OptionType][ImpressionId]
      local ImpressionConfigId, OptionValue = "Common", 0
      for _, ImpressionType in pairs(ImpressionTypes) do
        OptionValue = OptionInfo[ImpressionType .. OptionType]
        if OptionValue > 0 then
          ImpressionConfigId = ImpressionType
          break
        end
      end
      if OptionData.OptionType == "Check" then
        local AreaId = OptionInfo.RegionId
        local Avatar = GWorld:GetAvatar()
        if not Avatar then
          DebugPrint("FStoryIterationGraph@RecordOption\230\151\182\239\188\140Avatar\228\184\141\229\173\152\229\156\168")
          return
        end
        local ImpressionInfo = Avatar:GetRegionImpression(AreaId)
        local PlayerValue = ImpressionInfo:GetImpressionValueByType(ImpressionConfigId)
        self.CheckHandle = ReviewUtils.AddOptionWithImpressionCheck(ImpressionConfigId, PlayerValue, OptionData.Options, OptionData.SelectedOption, OptionData.VisitedOptions)
      elseif OptionData.OptionType == "Plus" then
        if "Common" ~= ImpressionConfigId then
          ReviewUtils.AddOptionWithImpressionValue(ImpressionConfigId, OptionValue, OptionData.Options, OptionData.SelectedOption, OptionData.VisitedOptions)
        else
          ReviewUtils.AddOptionWithNormal(OptionData.Options, OptionData.SelectedOption, OptionData.VisitedOptions)
        end
      end
      if bTalkOption then
        self:OnNodeRecord({
          NodeType = EDialogueNodeType.Option,
          IsImpression = true
        }, OptionData.SelectedOption)
      end
    else
      ReviewUtils.AddOptionWithNormal(OptionData.Options, OptionData.SelectedOption, OptionData.VisitedOptions)
    end
  end
end

function FStoryIterationGraph:RecordCheckResult(CheckRes, CheckValue)
  if self.CheckHandle then
    self.CheckHandle:InsertCheckData(CheckRes, CheckValue)
  end
end

function FStoryIterationGraph:SetRestartTag(RestartDialogueId)
  self.RestartDialogueId = RestartDialogueId
end

function FStoryIterationGraph:GetRestartTag()
  return self.RestartDialogueId
end

function FStoryIterationGraph:SetComponent(CompModulePath)
  self.assembledComponents = self.assembledComponents or {}
  if not self.assembledComponents[CompModulePath] then
    self._components = {CompModulePath}
    AssembleComponents(self)
    self.assembledComponents[CompModulePath] = true
  end
end

return FStoryIterationGraph
