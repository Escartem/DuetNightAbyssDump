require("UnLua")
local WBP_Build_Roulette_S_C = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function WBP_Build_Roulette_S_C:OnListItemObjectSet(Content)
  self.ClickCallback = Content.ClickCallback
  self.Owner = Content.Owner
  self.Index = Content.Index
  self.IsSelect = Content.IsSelect
  self.Avatar = GWorld:GetAvatar()
  self:Init()
end

function WBP_Build_Roulette_S_C:Init()
  self:InitBtn()
  self:SetText()
  self:AdditemInArr(self)
  self:CheckIsSelect()
end

function WBP_Build_Roulette_S_C:CheckIsSelect()
  if self.IsSelect then
    self:PlayAnimation(self.Click)
  end
end

function WBP_Build_Roulette_S_C:AdditemInArr(Widget)
  self.Owner:UpdateWheelArr(Widget)
end

function WBP_Build_Roulette_S_C:GetRomanNum(Index)
  local RomanNum = Const.RomanNum
  local RouletteIndex = GText(RomanNum[Index])
  return RouletteIndex
end

function WBP_Build_Roulette_S_C:SetText()
  local Text = self.Avatar.WheelsName[self.Index]
  if "" == Text then
    Text = GText("UI_Squad_BattleWheel_TITLE" .. self.Index)
  end
  self.Text_Name:SetText(Text)
  self.Text_Num:SetText(self:GetRomanNum(self.Index))
end

function WBP_Build_Roulette_S_C:InitBtn()
  self.Btn_Click.OnClicked:Add(self, function()
    self:OnBtnClickClicked()
  end)
  self.Btn_Click.OnPressed:Add(self, function()
    self:OnBtnClickPressed()
  end)
  self.Btn_Click.OnHovered:Add(self, function()
    self:OnBtnClickHovered()
  end)
  self.Btn_Click.OnUnhovered:Add(self, function()
    self:OnBtnClickUnhovered()
  end)
  self:PlayAnimation(self.Normal)
end

function WBP_Build_Roulette_S_C:OnBtnClickClicked()
  AudioManager(self):PlayUISound(nil, "event:/ui/common/click_btn_large", nil, nil)
  if self.IsSelect then
    self.Owner:InitBottomTab(false, 1)
    return
  end
  self.IsSelect = true
  self.Owner:InitBottomTab(false, 1)
  self:PlayAnimation(self.Click)
  if self.ClickCallback then
    self.ClickCallback(self.Owner, self.Index)
  end
end

function WBP_Build_Roulette_S_C:OnBtnClickPressed()
  if self.IsSelect then
    self.Owner:InitBottomTab(false, 1)
    return
  end
  self.Owner:InitBottomTab(false, 2)
  self:PlayAnimation(self.Press)
end

function WBP_Build_Roulette_S_C:OnBtnClickHovered()
  if self.IsSelect then
    self.Owner:InitBottomTab(false, 1)
    return
  end
  self.Owner:InitBottomTab(false, 2)
  self:PlayAnimation(self.Hover)
end

function WBP_Build_Roulette_S_C:OnBtnClickUnhovered()
  if self.IsSelect then
    self.Owner:InitBottomTab(false, 1)
    return
  end
  self.Owner:InitBottomTab(false, 2)
  self:PlayAnimation(self.UnHover)
end

return WBP_Build_Roulette_S_C
