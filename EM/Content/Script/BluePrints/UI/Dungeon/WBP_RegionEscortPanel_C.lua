require("UnLua")
local M = Class({
  "BluePrints.UI.Dungeon.WBP_EscortPanelBase_C"
})
local FortState = {
  Invincible = 1,
  Normal = 2,
  LowHp = 3
}

function M:OnLoaded(...)
  M.Super.OnLoaded(self, ...)
  self.FortUI = self:CreateWidgetNew("ProcessEscortPoint")
  self.Point:ClearChildren()
  self.Point:AddChildToCanvas(self.FortUI)
  self.FortUICanvasPanel = UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(self.FortUI)
  self.FortUICanvasPanel:SetAutoSize(true)
  self:UpdateFortState(FortState.Invincible)
  self:UpdateLength(0)
  local Mat = self.FortUI.BG_Bar_Clolor:GetDynamicMaterial()
  if Mat then
    Mat:SetScalarParameterValue("Percent", 0.0)
  end
  self:InitUIParams()
end

function M:InitUIParams()
  self.RegionHijactTextMap = {
    [1] = "DUNGEON_PAOTAI_201",
    [2] = "DUNGEON_PAOTAI_202"
  }
  local IsSucc, UIParams = CommonUtils.GetDungeonUIParams("RegionHijackFloatPanel")
  if not IsSucc then
    return
  end
  for i = 1, 2 do
    self.RegionHijactTextMap[i] = UIParams["HijackPanel_" .. i]
  end
end

function M:HideSelfAndSubWidget()
  self:SetVisibility(ESlateVisibility.Collapsed)
  self.FortUI:SetVisibility(ESlateVisibility.Collapsed)
end

function M:ShowSelfAndSubWidget()
  self:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  self.FortUI:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
end

function M:InitText()
  self.Text_Title:SetText(GText(self.RegionHijactTextMap[1]))
  self.Text_Percent:SetText(tostring(0))
  self:PlayAnimation(self.Text_Refresh)
end

function M:UpdateHp(Percent)
  local Mat = self.FortUI.BG_Bar_Clolor:GetDynamicMaterial()
  if Mat then
    Mat:SetScalarParameterValue("Percent", 1.0 - Percent)
  end
  if Percent > 0.5 then
    self:UpdateFortState(FortState.Normal)
  else
    self:UpdateFortState(FortState.LowHp)
  end
end

function M:UpdateLength(Percent)
  local Mat = self.Bar_Progress:GetDynamicMaterial()
  if Mat then
    Mat:SetScalarParameterValue("Percent", Percent)
  end
  if self.FortUICanvasPanel then
    self.FortUICanvasPanel:SetPosition(FVector2D(320 * Percent, 0))
  end
  if Percent >= 0.995 then
    self.Text_Title:SetText(GText(self.RegionHijactTextMap[2]))
    self.Text_Percent:SetText(tostring(math.floor(100)))
    if self.LastPercent and self.LastPercent < 0.995 then
      self:PlayAnimation(self.Text_Refresh)
    end
  else
    self.Text_Percent:SetText(tostring(math.floor(Percent * 100)))
  end
  self.LastPercent = Percent
end

function M:UpdateFortState(NewState)
  if not NewState or not self.FortUI then
    return
  end
  if NewState ~= self.FortState then
    self.FortUI:StopAllAnimations()
    if NewState == FortState.Invincible then
      self.FortUI:PlayAnimation(self.FortUI.Invincible)
    elseif NewState == FortState.Normal then
      self.FortUI:PlayAnimation(self.FortUI.Normal)
    else
      self.FortUI:PlayAnimation(self.FortUI.ResidualBlood)
    end
  end
  self.FortState = NewState
end

function M:AfterAddToParent()
  local BattleMain = UIManager(self):GetUIObj("BattleMain")
  if BattleMain and BattleMain.Pos_ProcessEscort then
    BattleMain.Pos_ProcessEscort:ClearChildren()
    BattleMain.Pos_ProcessEscort:AddChild(self)
    BattleMain.Pos_ProcessEscort:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  end
end

function M:ReceiveClose()
  self:AddDispatcher(EventID.QuestStart, self, function()
    local UIManager = GWorld.GameInstance:GetGameUIManager()
    if UIManager then
      UIManager:UnLoadUINew("RegionHijackFloatPanel")
    end
  end)
end

return M
