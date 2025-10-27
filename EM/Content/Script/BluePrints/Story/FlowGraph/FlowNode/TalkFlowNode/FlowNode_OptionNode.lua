local FTalkTriggerComponent = require("BluePrints.Story.Talk.Component.TalkTriggerComponent")
local M = Class("BluePrints.Story.FlowGraph.FlowNode.TalkFlowNode.FlowNode_TalkNodeBase")

function M:GetConditionOptions()
  local Options = {}
  for _, OptionData in ipairs(self.Options) do
    if FTalkTriggerComponent:CheckDialogueCondition(OptionData.DialogueId) then
      table.insert(Options, OptionData.DialogueId)
    end
  end
  if self.bRandomCount then
    self.SelectOptions = {}
    local RandomOptions = {}
    local FinialOptionNum = math.min(#Options, self.RandomCount)
    for i = 1, FinialOptionNum do
      local RandomIndex = math.random(1, #Options)
      local RandOption = Options[RandomIndex]
      table.insert(RandomOptions, RandOption)
      table.remove(Options, RandomIndex)
    end
    Options = RandomOptions
  elseif self:IsFinalConnected() then
    local NewOptions = {}
    for _, OptionId in ipairs(Options) do
      if not self.SelectOptions[OptionId] then
        table.insert(NewOptions, OptionId)
      end
    end
    for _, OptionId in ipairs(Options) do
      if self.SelectOptions[OptionId] then
        table.insert(NewOptions, OptionId)
      end
    end
    Options = NewOptions
  end
  return Options
end

function M:GetRecordOptionData(OptionDialogueId)
  local OptionData = {
    bImpression = false,
    OptionType = nil,
    Options = self:GetConditionOptions(),
    VisitedOptions = self:IsFinalConnected() and self.SelectOptions or {},
    SelectedOption = OptionDialogueId
  }
  return OptionData
end

function M:IterForward()
  local DialogueFlowGraphComponent = self:TryGetFlowGraphComponent()
  local DialogueRecordComponent = self:TryGetRecordComponent()
  local Options = self:GetConditionOptions()
  local AllVisit = true
  for _, OptionId in pairs(Options) do
    if not self.SelectOptions[OptionId] then
      AllVisit = false
      break
    end
  end
  if AllVisit and self:HasFinalDialogue() then
    self:FinishToFinal()
  elseif #Options > 0 then
    DialogueFlowGraphComponent:PlayOptions(Options, self.SelectOptions, function(OptionDialogueId, FinishType)
      self:SelectOption(OptionDialogueId, FinishType)
      DialogueRecordComponent:OnOptionRecord(OptionDialogueId, self:GetRecordOptionData(OptionDialogueId))
    end, self)
  else
    self:FinishToDefault()
  end
end

function M:Start()
  self.Options = self.OptionData:ToTable()
  self.SelectOptions = {}
  local DialogueFlowGraphComponent = self:TryGetFlowGraphComponent()
  if not DialogueFlowGraphComponent then
    local Message = string.format("\229\189\147\229\137\141Option\232\138\130\231\130\185\239\188\140\230\179\168\229\134\140\231\154\132Task\228\184\141\229\173\152\229\156\168 DialogueFlowGraphComponent\239\188\140\232\175\183\230\179\168\229\134\140")
    UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "\229\175\185\232\175\157FLowNode\229\135\186\233\148\153", Message)
    return
  end
  local DialogueRecordComponent = self:TryGetRecordComponent()
  if not DialogueRecordComponent then
    local Message = string.format("\229\189\147\229\137\141Dialogue\232\138\130\231\130\185\239\188\140\230\179\168\229\134\140\231\154\132Task\228\184\141\229\173\152\229\156\168 DialogueRecordComponent\239\188\140\232\175\183\230\179\168\229\134\140")
    UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "\229\175\185\232\175\157FLowNode\229\135\186\233\148\153", Message)
    return
  end
  self:IterForward()
end

function M:Skip()
  local DialogueFlowGraphComponent = self:TryGetFlowGraphComponent()
  for _, OptionId in ipairs(self:GetConditionOptions()) do
    if not self.SelectOptions[OptionId] then
      DialogueFlowGraphComponent:SelectOption(OptionId)
      return
    end
  end
  if not self:HasFinalDialogue() then
    local Message = string.format("\229\189\147\229\137\141Option\232\138\130\231\130\185\239\188\140\232\183\179\232\191\135\230\151\182\228\184\141\229\173\152\229\156\168Final \229\135\186\229\143\163\239\188\140\230\151\160\230\179\149\230\173\163\229\184\184\232\183\179\232\191\135\239\188\140\232\175\183\230\163\128\230\159\165\239\188\140\230\136\150\232\128\133\228\184\141\232\166\129\233\135\141\229\164\141\232\191\158\230\142\165\229\136\176\232\175\165\232\138\130\231\130\185")
    UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "\229\175\185\232\175\157FLowNode\229\135\186\233\148\153", Message)
  end
end

function M:CanSkip()
  return not self.bForbidSkip
end

function M:Pause()
end

function M:Resume()
end

function M:SelectOption(OptionId, FinishType)
  self.SelectOptions[OptionId] = true
  self:FinishSelectOption(OptionId)
end

function M:GetSavedOptions()
  local Avatar = GWorld:GetAvatar()
  local Res = {}
  if not Avatar then
    return Res
  end
  local FlowExportBranchImpr = DataMgr.FlowExportBranchImpr
  for _, OptionId in pairs(self.Options) do
    local bSelected = false
    if FlowExportBranchImpr[OptionId] then
      for _, ImprOptionId in pairs(FlowExportBranchImpr[OptionId]) do
        if Avatar:IsImpressionCheckSuccess(OptionId) then
          bSelected = true
          break
        end
      end
    end
    if bSelected then
      table.insert(Res, OptionId)
    end
  end
  return Res
end

return M
