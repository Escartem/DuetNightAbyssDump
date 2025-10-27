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
end

function M:PlayInAnimation()
  if 5 == self.Rarity then
    self:PlayAnimation(self.Reward_In_Orange)
  elseif 4 == self.Rarity then
    self:PlayAnimation(self.Reward_In_Purple)
  elseif 3 == self.Rarity then
    self:PlayAnimation(self.Reward_In_Blue)
  elseif 2 == self.Rarity then
    self:PlayAnimation(self.Reward_In_Green)
  elseif 1 == self.Rarity then
    self:PlayAnimation(self.Reward_In_White)
  end
end

return M
