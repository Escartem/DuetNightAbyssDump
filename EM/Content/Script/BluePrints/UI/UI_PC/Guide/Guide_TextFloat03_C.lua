local Guide_TextFloat03_PC = Class("BluePrints.UI.BP_UIState_C")

function Guide_TextFloat03_PC:OnLoaded(...)
  self.Super.OnLoaded(self, ...)
  self.Horizontal:SetVisibility(ESlateVisibility.Collapsed)
  self:StopAllAnimations()
  self:PlayAnimation(self.In)
  self:RemoveTimer("CloseMonsterPanel")
end

function Guide_TextFloat03_PC:ShowDungeonToast(TextMapIndex, Duration)
  self.Horizontal:SetVisibility(ESlateVisibility.Collapsed)
  self.Text_Float01_1:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  self:AddTimer(Duration, self.CloseMonsterPanel, false, 0, "CloseMonsterPanel")
  local Text = GText(TextMapIndex)
  self.Text_Float01_1:SetText(Text)
end

function Guide_TextFloat03_PC:CloseMonsterPanel()
  self:Close()
end

function Guide_TextFloat03_PC:OnClose_Internal()
  self.Super.Close(self)
end

function Guide_TextFloat03_PC:InitEnterEnergySupplyInfo(BuffName, BuffIconPath)
  self:RemoveTimer("CloseMonsterPanel")
  self.Text_Float01:SetVisibility(ESlateVisibility.Collapsed)
  local Text = GText("DUNGEON_SURVIVALPRO_100")
  self.Text_Float01_1:SetText(Text)
  self.Bg:SetVisibility(ESlateVisibility.Collapsed)
  self.Horizontal:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  if BuffIconPath then
    local BuffIcon = LoadObject(BuffIconPath)
    if BuffIcon then
      self.Img_Icon:SetBrushResourceObject(BuffIcon)
    end
  end
  if BuffName then
    self.Text_Float02:SetText(BuffName)
  end
  self:AddTimer(5.0, self.CloseMonsterPanel, false, 0, "CloseMonsterPanel")
end

function Guide_TextFloat03_PC:InitExitEnergySupplyInfo()
  self:RemoveTimer("CloseMonsterPanel")
  self.Horizontal:SetVisibility(ESlateVisibility.Collapsed)
  self.Text_Float01:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  self.Text_Float01_1:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  local Text = GText("DUNGEON_SURVIVALPRO_101")
  self.Text_Float01_1:SetText(Text)
  self:AddTimer(5.0, self.CloseMonsterPanel, false, 0, "CloseMonsterPanel")
end

function Guide_TextFloat03_PC:InitEnergyRanOutInfo()
  self.Horizontal:SetVisibility(ESlateVisibility.Collapsed)
  self.Text_Float01:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  local Text = GText("DUNGEON_SURVIVALPRO_109")
  if Text then
    self.Text_Float01_1:SetText(Text)
  end
  self:RemoveTimer("CloseMonsterPanel")
  self:AddTimer(5.0, self.CloseMonsterPanel, false, 0, "CloseMonsterPanel")
end

function Guide_TextFloat03_PC:InitSurvivalValueMaxInfo()
  self.Horizontal:SetVisibility(ESlateVisibility.Collapsed)
  self.Text_Float01:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  local Text = GText("DUNGEON_SURVIVALPRO_108")
  if Text then
    self.Text_Float01_1:SetText(Text)
  end
  self:RemoveTimer("CloseMonsterPanel")
  self:AddTimer(5.0, self.CloseMonsterPanel, false, 0, "CloseMonsterPanel")
end

function Guide_TextFloat03_PC:InitEnergySupplyBuffInfo(BuffName, BuffIconPath, BuffChangeStr)
  self.Text_Float01_1:SetVisibility(ESlateVisibility.Collapsed)
  self.Horizontal:SetVisibility(ESlateVisibility.Collapsed)
  self.Text_Float01:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  self.Text_Float02:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  self.Text_Float01:SetText(BuffName)
  local BuffIcon = LoadObject(BuffIconPath)
  self.Img_Icon:SetBrushResourceObject(BuffIcon, false)
  self.Text_Float02:SetText(BuffChangeStr)
  self:AddTimer(5.0, self.CloseMonsterPanel, false, 0, "CloseMonsterPanel")
end

return Guide_TextFloat03_PC
