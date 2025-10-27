local FTalkTriggerComponent = require("BluePrints.Story.Talk.Component.TalkTriggerComponent")
local ETalkNodeFinishType = require("StoryCreator.StoryLogic.StorylineUtils").ETalkNodeFinishType
local M = Class("BluePrints.Story.FlowGraph.FlowNode.TalkFlowNode.FlowNode_OptionNode")

function M:ReceiveBeginPlay()
end

function M:GetLastCheckSuccessId()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return nil
  end
  for _, OptionData in pairs(self.Options) do
    if Avatar and Avatar:IsImpressionCheckSuccess(OptionData.DialogueId) then
      return OptionData.DialogueId
    end
  end
end

function M:GetRecordOptionData(OptionDialogueId)
  local Option = DataMgr.Dialogue[OptionDialogueId]
  local OptionType
  if Option.ImprPlusId then
    OptionType = "Plus"
  elseif Option.ImprCheckId then
    OptionType = "Check"
  end
  local OptionData = {
    bImpression = true,
    OptionType = OptionType,
    Options = self:GetConditionOptions(),
    VisitedOptions = self:IsFinalConnected() and self.SelectOptions or {},
    SelectedOption = OptionDialogueId
  }
  return OptionData
end

function M:Skip()
  local LastCheck = self:GetLastCheckSuccessId()
  if LastCheck then
    self:SelectOption(LastCheck)
  else
    local Message = string.format("\229\189\147\229\137\141Option\232\138\130\231\130\185\228\184\141\229\143\175\228\187\165\232\183\179\232\191\135, \228\184\141\229\186\148\232\175\165\232\181\176\232\191\135\230\157\165")
    UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "\229\175\185\232\175\157FLowNode\229\135\186\233\148\153", Message)
  end
end

function M:CanSkip()
  return self:GetLastCheckSuccessId() ~= nil and not self.bForbidSkip
end

function M:SelectOption(OptionId, FinishType)
  if FinishType == ETalkNodeFinishType.Fail then
    self:FailSelectOption(OptionId)
  else
    self:FinishSelectOption(OptionId)
  end
end

function M:GetSavedOptions()
  local LastCheckId = self:GetLastCheckSuccessId()
  if LastCheckId then
    return {LastCheckId}
  end
  return {}
end

return M
