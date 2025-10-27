require("UnLua")
local WBP_MultiDestroyPoint_C = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function WBP_MultiDestroyPoint_C:Construct()
  self.StateToName = {
    [1] = "Lock",
    [2] = "CountDown",
    [3] = "CanStart",
    [4] = "Complete"
  }
  self.CurState = 1
end

function WBP_MultiDestroyPoint_C:InitWidget(Owner, Index)
  self.Owner = Owner
  self.PointIndex = Index
end

function WBP_MultiDestroyPoint_C:SetState(NewState)
  if self.CurState == NewState then
    return false
  end
  local CurStateName = self.StateToName[self.CurState]
  self["Panel_" .. CurStateName]:SetVisibility(ESlateVisibility.Collapsed)
  self:PlayAnimation(self[CurStateName .. "_Out"])
  if self["OnExit_" .. CurStateName] then
    self["OnExit_" .. CurStateName](self)
  end
  local NewStateName = self.StateToName[NewState]
  self["Panel_" .. NewStateName]:SetVisibility(ESlateVisibility.HitTestInvisible)
  self:PlayAnimation(self[NewStateName .. "_In"])
  if self["OnEnter_" .. NewStateName] then
    self["OnEnter_" .. NewStateName](self)
  end
  self.CurState = NewState
  return true
end

function WBP_MultiDestroyPoint_C:OnEnter_CountDown()
  self.Owner.CurCountDownIndex = self.PointIndex
end

function WBP_MultiDestroyPoint_C:SetCountDownImagePercet(Percent)
  if self.CountDownDynamicMaterial == nil then
    self.CountDownDynamicMaterial = self.BG_Bar_Color:GetDynamicMaterial()
  end
  self.CountDownDynamicMaterial:SetScalarParameterValue("Percent", Percent)
end

return WBP_MultiDestroyPoint_C
