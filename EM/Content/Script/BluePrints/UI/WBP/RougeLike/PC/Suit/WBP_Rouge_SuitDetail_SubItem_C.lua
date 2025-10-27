require("UnLua")
local M = Class({
  "BluePrints.UI.BP_UIState_C"
})

function M:Construct()
end

function M:InitUIInfo(DetailInfo)
  self:StopAllAnimations()
  self.IsActive = DetailInfo.IsActive
  local RomanNum = Const.RomanNum[DetailInfo.TextGroupLevel]
  self.Text_Lv:SetText(RomanNum)
  self.WS_IsActive:SetActiveWidgetIndex(self.IsActive)
  self.ExplanationId = DetailInfo.ExplanationId
  local DetailInfoWithLine = GText(DetailInfo.TextSuitDesc)
  if self.ExplanationId ~= nil and #self.ExplanationId > 0 then
    DetailInfoWithLine = UIUtils.GenRougeCombatTermDesc(DetailInfoWithLine, self.ExplanationId)
  end
  self.Text_SuitDesc:SetText(DetailInfoWithLine)
  if DetailInfo.IsUnlockFeedback then
    self:PlayAnimation(self.Unlock_Feedback)
  elseif 0 == self.IsActive then
    local RichText = "<Warning>" .. DetailInfo.TextCurrentNum .. "</>" .. "/" .. DetailInfo.TextUnlockNum
    self.Text_SuitNum:SetText(RichText)
    self:PlayAnimation(self.Lock)
  elseif 1 == self.IsActive then
    local RichText = "<G>" .. DetailInfo.TextCurrentNum .. "</>" .. "/" .. DetailInfo.TextUnlockNum
    self.Text_SuitNum:SetText(RichText)
    self:PlayAnimation(self.Unlocked)
  elseif 2 == self.IsActive then
    local RichText = "<G>" .. DetailInfo.TextCurrentNum .. "</>" .. "/" .. DetailInfo.TextUnlockNum
    self.Text_SuitNum:SetText(RichText)
    AudioManager(self):PlayUISound(self, "event:/ui/roguelike/suit_pre_active", nil, nil)
    self:PlayAnimation(self.Pre_Unlock)
  end
  self.Parent = DetailInfo.Parent
  self.Btn_Click.OnClicked:Add(self, self.OnBtn_ClickClicked)
  self.Btn_Click.OnHovered:Add(self, self.OnBtn_ClickHover)
  if self.In then
    self:PlayAnimation(self.In)
  end
end

function M:OnBtn_ClickClicked()
  if not self.ExplanationId then
    return
  end
  UIManager(self):LoadUINew("Rouge_Definition", self.ExplanationId).Button_Close:SetFocus()
end

function M:OnBtn_ClickHover()
  if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
    self:AddDelayFrameFunc(function()
      self:SelectItem()
    end, 1)
    if self.Parent and type(self.Parent.OnHoverItemChange) == "function" then
      self.Parent:OnHoverItemChange(self)
    end
    if self.Parent and self.Parent.ScrollBox_Suit then
      self.Parent.ScrollBox_Suit:ScrollWidgetIntoView(self.CurrentHoverItem, true, UE4.EDescendantScrollDestination.Center)
    end
  end
end

function M:SelectItem()
  DebugPrint("\230\163\128\230\181\139\229\136\176\232\162\171\233\128\137\228\184\173")
  self.IsSelected = true
  if self.Parent then
    self.Parent.CurrentSelectSuitItem = self
  end
  if self.Parent and self.Parent.SelectSuitItem then
    self.Parent:SelectSuitItem(self)
  end
end

return M
