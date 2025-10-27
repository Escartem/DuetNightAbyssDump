require("UnLua")
local WBP_Settlement_FailTips_C = Class("BluePrints.UI.BP_EMUserWidget_C")

function WBP_Settlement_FailTips_C:InitialTips(DungeonId, IsInHardBoss)
  self.Text01:SetText(GText("UI_DungeonFail_Tips1"))
  self.Text02:SetText(GText("UI_DungeonFail_Tips2"))
  self.List_Tips:ClearListItems()
  local GuideCombinationId = -1
  if IsInHardBoss then
    GuideCombinationId = DataMgr.HardBossMain[DungeonId].GuidanceTitle
  else
    local ChapterId = DataMgr.DungeonId2ChapterId[DungeonId]
    if ChapterId then
      GuideCombinationId = DataMgr.SelectDungeon[ChapterId].GuidanceTitle
    else
      ChapterId = DataMgr.WeeklyDungeonId2ChapterId[DungeonId]
      if ChapterId then
        GuideCombinationId = DataMgr.WeeklySelectDungeon[ChapterId].GuidanceTitle
      else
        DebugPrint("zwk \229\164\177\232\180\165\231\187\147\231\174\151\229\189\147\229\137\141\229\137\175\230\156\172Id\230\151\162\230\178\161\230\156\137\229\135\186\231\142\176\229\156\168SelectDungeon\232\161\168\228\185\159\230\178\161\230\156\137\229\135\186\231\142\176\229\156\168WeeklySelectDungeon\232\161\168\228\184\173\239\188\140\233\187\152\232\174\164\228\189\191\231\148\168200001\229\164\177\232\180\165\230\140\135\229\188\149\231\187\132\229\144\136\239\188\140\229\189\147\229\137\141\229\137\175\230\156\172ID:", DungeonId)
        GuideCombinationId = 200001
      end
    end
  end
  local GuideCombinationInfo = DataMgr.FailureGuidanceCombination[GuideCombinationId]
  for _, v in ipairs(GuideCombinationInfo.GuidanceModuleId) do
    local GuidanceInfo = DataMgr.FailureGuidance[v]
    local Tips = NewObject(UE4.LoadClass(UIConst.SETTLEMENTFAILURETIPS))
    Tips.Title = GuidanceInfo.GuidanceTitle
    Tips.Text = GuidanceInfo.GuidanceText
    Tips.Icon = LoadObject(GuidanceInfo.GuidanceIcon)
    self.List_Tips:AddItem(Tips)
  end
  local IsScrollDisable = self.List_Tips:IsDisableScroll()
  self.List_Tips:SetAllowOverscroll(IsScrollDisable)
end

function WBP_Settlement_FailTips_C:OnAnalogValueChanged(MyGeometry, InAnalogInputEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InAnalogInputEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if InKeyName == UIConst.GamePadKey.RightAnalogX then
    local DeltaOffset = 1 * UKismetInputLibrary.GetAnalogValue(InAnalogInputEvent) * 5
    local CurrentOffset = self.List_Tips:GetScrollOffset()
    local NextOffset = math.clamp(CurrentOffset + DeltaOffset, 0, self.List_Tips:GetScrollOffsetOfEnd())
    self.List_Tips:SetScrollOffset(NextOffset)
    return UIUtils.Handled
  end
  return UIUtils.Unhandled
end

return WBP_Settlement_FailTips_C
