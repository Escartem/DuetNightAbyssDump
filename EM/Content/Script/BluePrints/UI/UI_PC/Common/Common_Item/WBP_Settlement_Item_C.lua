require("UnLua")
local M = Class({
  "BluePrints.UI.UI_PC.Common.Common_Item.WBP_Com_Item_Base_C"
})

function M:InitData(Content)
  self.Super.InitData(self, Content)
end

function M:InitCommonView()
  self.Node_Widget:ClearChildren()
  self.Super.InitCommonView(self)
end

function M:InitCompView()
  self.Super.InitCompView(self)
  self:SetCount(self.Count, self.NeedCount, self.MaxCount, self.NotCountFormat)
  self:SetBonus(self.BonusType, self.ExtraBonusText)
  self:SetRedDot(self.RedDotType)
end

function M:PlayInAnimation()
  if self.Content.IsSpecial then
    if self.ItemType == "Mod" then
      self:PlayAnimation(self.VX_MOD_In)
    elseif self.ItemType == "Resource" and DataMgr.Resource[self.Id].ResourceSType == "Coin" then
      self:PlayAnimation(self.VX_COIN_In)
    else
      self:PlayAnimation(self.VX_MAT_In)
    end
    self.NotInteractive = true
    AudioManager(self):PlayUISound(self, "event:/ui/common/level_end_item_unlock", nil, nil)
  else
    self:PlayAnimation(self.Normal_In)
  end
end

function M:IsInAnimationPlaying()
  if self:IsAnimationPlaying(self.Orange_In) or self:IsAnimationPlaying(self.purple_In) or self:IsAnimationPlaying(self.Normal_In) or self:IsAnimationPlaying(self.VX_MOD_In) or self:IsAnimationPlaying(self.VX_COIN_In) or self:IsAnimationPlaying(self.VX_MAT_In) then
    return true
  end
  return false
end

function M:OnAnimationFinished(InAnimation)
  if InAnimation == self.VX_MOD_In or InAnimation == self.VX_MAT_In or InAnimation == self.VX_COIN_In then
    self.NotInteractive = false
  end
end

return M
