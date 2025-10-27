require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:Init(ActivityConfigData, PageConfigData, PlayerAvatar)
  self.EventId = ActivityConfigData.EventId
  self:UpdatePage()
end

function M:UpdatePage()
  self.IsShow = self:IsPrerequisiteSatisfied()
  if self.IsShow then
    self:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  else
    self:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return false
  end
  local Rate = math.floor((DataMgr.ModDropConstant.EventBonus.ConstantValue or 0) / 100)
  local DropTotalTimes = DataMgr.ModDropConstant.DailyModDungeonAmount.ConstantValue or 0
  local EliteRushTotalTimes = DataMgr.ModDropConstant.DailyFreeTicketAmount.ConstantValue or 0
  local RemainDropTimes = DropTotalTimes - (Avatar.DoubleModDrop[self.EventId] and Avatar.DoubleModDrop[self.EventId].DropTimes or 0)
  local RemainEliteRushTimes = EliteRushTotalTimes - (Avatar.DoubleModDrop[self.EventId] and Avatar.DoubleModDrop[self.EventId].EliteRushTimes or 0)
  local Text_DoubleModDrop, Text_EliteRush
  if 0 == RemainDropTimes then
    Text_DoubleModDrop = GText("UI_Event_ModDrop_DropRemain") .. "<Warning>" .. RemainDropTimes .. "</>" .. "/" .. DropTotalTimes
  else
    Text_DoubleModDrop = GText("UI_Event_ModDrop_DropRemain") .. RemainDropTimes .. "/" .. DropTotalTimes
  end
  if 0 == RemainEliteRushTimes then
    Text_EliteRush = GText("UI_Event_ModDrop_ChallengeRemain") .. "<Warning>" .. RemainEliteRushTimes .. "</>" .. "/" .. EliteRushTotalTimes
  else
    Text_EliteRush = GText("UI_Event_ModDrop_ChallengeRemain") .. RemainEliteRushTimes .. "/" .. EliteRushTotalTimes
  end
  self.Text_ModUpTitle:SetText(GText("UI_Event_ModDrop_Title2_1"))
  self.Text_NewModView:SetText(GText("UI_Event_ModDrop_Title2_2"))
  self.Text_DoubleModTitle:SetText(GText("UI_Event_ModDrop_ChallengeName"))
  self.Text_ModUpTodayTimes:SetText(Text_DoubleModDrop)
  self.Text_NewModTodayTimes:SetText(Text_EliteRush)
  self.Text_TimesTips:SetText(GText("UI_Event_ModDrop_Reset"))
  self.Text_ModUpNum:SetText("+" .. Rate .. "%")
end

function M:IsPrerequisiteSatisfied()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return false
  end
  local DoubleModEventInfo = DataMgr.EventMain[self.EventId]
  if not DoubleModEventInfo then
    ScreenPrint("EventMain\232\161\168\228\184\173\230\137\190\228\184\141\229\136\176m\233\173\148\228\185\139\230\165\148\230\180\187\229\138\168\231\155\184\229\133\179\228\191\161\230\129\175\239\188\129\232\175\187\229\143\150\231\154\132EventId:" .. self.EventId)
    return false
  end
  local PrerequisiteQuestId = {}
  if DoubleModEventInfo.PretextTasks1 then
    table.insert(PrerequisiteQuestId, DoubleModEventInfo.PretextTasks1)
  end
  for _, QuestId in pairs(DoubleModEventInfo.PretextTasks2 or {}) do
    table.insert(PrerequisiteQuestId, QuestId)
  end
  for _, QuestId in pairs(PrerequisiteQuestId) do
    local QuestChain = Avatar.QuestChains[QuestId]
    if not QuestChain then
      ScreenPrint("\233\173\148\228\185\139\230\165\148 \233\133\141\231\189\174\228\186\134\228\184\128\228\184\170\228\184\141\229\173\152\229\156\168\231\154\132\228\187\187\229\138\161\233\147\190Id\239\188\129\232\175\183\231\173\150\229\136\146\230\163\128\230\159\165\239\188\129Id:" .. QuestId)
      return false
    end
    if not QuestChain:IsFinish() then
      return false
    end
  end
  return true
end

return M
