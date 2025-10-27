require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:InitItem(Index, RageValue)
  self.Index = Index
  self.RageValue = RageValue
  self:SetNormal()
  self.IsRed = false
  self.IsComplete = false
end

function M:SetRed()
  if self.IsRed then
    return
  end
  self.IsRed = true
  self:PlayAnimation(self.Red_In)
  self.Red:SetVisibility(UE4.ESlateVisibility.Visible)
  self.Panel_Complete:SetVisibility(UE4.ESlateVisibility.Collapsed)
  AudioManager(self):PlayUISound(self, "event:/ui/common/week_level_target_found", nil, nil)
end

function M:SetNormal()
  self.Red:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self.Panel_Complete:SetVisibility(UE4.ESlateVisibility.Collapsed)
end

function M:SetComplete()
  if self.IsComplete then
    return
  end
  self.IsComplete = true
  self:PlayAnimation(self.Complete_In)
  self.Red:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self.Panel_Complete:SetVisibility(UE4.ESlateVisibility.Visible)
  AudioManager(self):PlayUISound(self, "event:/ui/common/week_level_target_finish", nil, nil)
end

return M
