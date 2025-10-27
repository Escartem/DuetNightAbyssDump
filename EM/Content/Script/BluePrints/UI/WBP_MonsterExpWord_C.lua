require("UnLua")
local WBP_MonsterExpWord_C = Class("BluePrints.UI.WBP_JumpWordBase")

function WBP_MonsterExpWord_C:Initialize(Initializer)
  self.Super.Initialize(self)
  self.ShowNumValue = nil
  self.ShowPos = nil
end

function WBP_MonsterExpWord_C:OnLoaded(...)
  self.Super.OnLoaded(self, ...)
  self.ShowNumValue, self.ShowPos = ...
  local CanvasSlot = self.JumpWord.Slot
  CanvasSlot:SetPosition(self.ShowPos)
  self:TryShowExpWordTips()
end

function WBP_MonsterExpWord_C:TryShowExpWordTips()
  self.Text_Exp:SetText("+" .. tostring(math.abs(self.ShowNumValue)))
  self.Panel_Cure:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self.Panel_None:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self:PlayAnim("Exp")
  local AnimObj = self:GetAnimationByName("Exp")
  local AnimPlayTime = AnimObj:GetEndTime() or 1
  self:AddTimer(AnimPlayTime, self.Close)
end

return WBP_MonsterExpWord_C
