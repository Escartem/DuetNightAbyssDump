require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:Init(PlayerLevel, PlayerName, bVoteContinue)
  self.Text_Level:SetText(PlayerLevel)
  self.Text_Name:SetText(PlayerName)
  if bVoteContinue then
    self:PlayAnimation(self.Bubble_Right_In)
  elseif nil == bVoteContinue then
    self:PlayAnimation(self.Bubble_Middle_In)
  else
    self:PlayAnimation(self.Bubble_Left_In)
  end
end

return M
