require("UnLua")
local WBP_Rouge_SlotLine_C = Class("BluePrints.UI.BP_EMUserWidget_C")

function WBP_Rouge_SlotLine_C:Construct()
  self.CurState = nil
end

function WBP_Rouge_SlotLine_C:Init(State)
  self:SetVisibility(UE4.ESlateVisibility.HitTestInvisible)
  self:ChangeState(State)
end

function WBP_Rouge_SlotLine_C:ChangeState(NewState)
  if NewState == self.CurState then
    return
  end
  local LastState = self.CurState
  self.CurState = NewState
  self:StopAllAnimations()
  if self.CurState == "Active" then
    if "CanActiveByFront" == LastState then
      self:PlayAnimation(self.Unlock)
    else
      self:PlayAnimation(self.Unlock_Loop)
    end
  elseif self.CurState == "CanActiveByFront" then
    self:PlayAnimation(self.Normal)
  elseif self.CurState == "CanActiveByPost" then
    if "CantActive" == LastState then
      self:PlayAnimation(self.Unlock)
    else
      self:PlayAnimation(self.Unlock_Loop)
    end
  elseif self.CurState == "CantActive" then
    self:PlayAnimation(self.Normal)
  end
end

return WBP_Rouge_SlotLine_C
