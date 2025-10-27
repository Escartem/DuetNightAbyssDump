require("UnLua")
local WBP_Build_Roulette_P_C = Class({
  "BluePrints.UI.BP_EMUserWidget_C",
  "BluePrints.Common.TimerMgr"
})

function WBP_Build_Roulette_P_C:Construct()
  self.Btn_Click.OnClicked:Add(self, self.OnClickCallback)
  self.IsEmpty = false
  self:InitBtn()
end

function WBP_Build_Roulette_P_C:InitSlot(Params)
  self.Owner = Params.Owner
  self.Id = Params.Id
  self.Type = Params.Type
  self.Avatar = GWorld:GetAvatar()
  self:SetTitleName()
  self:UpdateCurSquadInfo()
end

function WBP_Build_Roulette_P_C:PlayRefreshAnimation()
  if not self.IsEmpty then
    self:PlayAnimation(self.Refresh)
  end
end

function WBP_Build_Roulette_P_C:UpdateCurSquadInfo()
  self.Owner:UpdateCurSquadInfo("WheelIndex", self.Id or 1)
end

function WBP_Build_Roulette_P_C:OnClickCallback()
  AudioManager(self):PlayUISound(nil, "event:/ui/common/click_btn_confirm", nil, nil)
  if self.Owner.IsInClickCD then
    DebugPrint("thy    InClickCD")
    return
  end
  if self.IsClicking then
    self.Owner:FocusOnItemList()
    return
  end
  self.MyClickCD = self.Owner.ClickCD
  self.AlreadyRemoved = false
  self.Owner.IsInClickCD = true
  self:AddTimer(0.05, function()
    self.MyClickCD = math.max(self.MyClickCD - 0.05, 0)
    if 0 == self.MyClickCD and not self.AlreadyRemoved then
      self.Owner.IsInClickCD = false
      self.AlreadyRemoved = true
      self:RemoveTimer("ClickCD")
      return
    end
  end, true, 0, "ClickCD", true)
  if self.Owner.CurSlot then
    self.Owner.CurSlot.IsClicking = false
    if self.Owner.CurSlot.PlayNormalAnimation then
      self.Owner.CurSlot:PlayNormalAnimation()
    else
      self.Owner.CurSlot:PlayAnimation(self.Owner.CurSlot.Normal)
    end
  end
  self.Owner.CurSlot = self
  self.Owner.CurSlotType = self.Type
  self.Owner:SwitchToRouletteList()
  self:PlayAnimation(self.Click)
  self.IsClicking = true
end

function WBP_Build_Roulette_P_C:ClearSlot()
  local Params = {
    Owner = self.Owner,
    Type = self.Type,
    Id = 1
  }
  self:InitSlot(Params)
end

function WBP_Build_Roulette_P_C:GetItemId()
  return self.Id
end

function WBP_Build_Roulette_P_C:SetTitleName()
  local RomanNum = Const.RomanNum
  local RouletteIndex = GText(RomanNum[self.Id])
  self.Text_Num:SetText(RouletteIndex)
  local Text = self.Avatar.WheelsName[self.Id]
  if "" == Text then
    Text = GText("UI_Squad_BattleWheel_TITLE" .. self.Id)
  end
  self.Text_Name:SetText(Text)
end

function WBP_Build_Roulette_P_C:ChangeWheelIndex(Index)
  self.Id = Index
  local Text = self.Avatar.WheelsName[self.Id]
  if "" == Text then
    Text = GText("UI_Squad_BattleWheel_TITLE" .. self.Id)
  end
  self.Text_Name:SetText(Text)
  self.Text_Num:SetText(self:GetRomanNum(self.Id))
  self.Owner:UpdateCurSquadInfo("WheelIndex", self.Id or 1)
end

function WBP_Build_Roulette_P_C:GetRomanNum(Index)
  local RomanNum = Const.RomanNum
  local RouletteIndex = GText(RomanNum[Index])
  return RouletteIndex
end

function WBP_Build_Roulette_P_C:InitBtn()
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

function WBP_Build_Roulette_P_C:OnBtnClickPressed()
  if self.IsClicking then
    return
  end
  self:PlayAnimation(self.Press)
end

function WBP_Build_Roulette_P_C:OnBtnClickHovered()
  if self.IsClicking then
    return
  end
  self:PlayAnimation(self.Hover)
end

function WBP_Build_Roulette_P_C:OnBtnClickUnhovered()
  if self.IsClicking then
    return
  end
  self:PlayAnimation(self.UnHover)
end

return WBP_Build_Roulette_P_C
