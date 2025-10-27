require("UnLua")
local M = Class("BluePrints.UI.UI_PC.Common.Common_Item_Subsize_Small_Base_C")

function M:PlayInAnimation()
  if self.Rarity then
    if 1 == self.Rarity then
      self:PlayAnimation(self.Reward_In_White)
    elseif 2 == self.Rarity then
      self:PlayAnimation(self.Reward_In_Green)
    elseif 3 == self.Rarity then
      self:PlayAnimation(self.Reward_In_Blue)
    elseif 4 == self.Rarity then
      self:PlayAnimation(self.Reward_In_Purple)
    elseif 5 == self.Rarity then
      self:PlayAnimation(self.Reward_In_Orange)
    else
      DebugPrint("ZDX_\233\129\147\229\133\183\230\161\134\231\154\132\231\168\128\230\156\137\229\186\166\228\184\141\231\172\166\229\144\136\232\166\129\230\177\130")
      return
    end
  end
end

function M:IsInAnimationPlaying()
  if self:IsAnimationPlaying(self.Reward_In_Orange) or self:IsAnimationPlaying(self.Reward_In_Purple) or self:IsAnimationPlaying(self.Reward_In_Blue) or self:IsAnimationPlaying(self.Reward_In_Green) or self:IsAnimationPlaying(self.Reward_In_White) then
    return true
  end
  return false
end

return M
