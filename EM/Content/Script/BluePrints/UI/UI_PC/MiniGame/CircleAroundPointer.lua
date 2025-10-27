require("UnLua")
local CircleAroundPointer = Class({
  "BluePrints.UI.BP_UIState_C"
})

function CircleAroundPointer:Construct()
  self.IsDestroied = false
  self.BeginTick = false
  self:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self.IsPlayingTriggerAnim = false
  self:AddDispatcher(EventID.CircleAroundGameStart, self, self.GameStart)
  self:AddDispatcher(EventID.CircleAroundTryToTriggerPointer, self, self.TriggerPointer)
  self:AddDispatcher(EventID.CircleAroundGameFailed, self, self.GameFailed)
end

function CircleAroundPointer:GameStart()
  self:PlayAnimation(self.In)
end

function CircleAroundPointer:GameFailed()
  self:PlayAnimation(self.Fail)
end

function CircleAroundPointer:InitPointer(Owner, PointerStartAngle, FaultAngle, Speed)
  self:SetVisibility(UE4.ESlateVisibility.Visible)
  self.Owner = Owner
  self:SetRenderTransformAngle(PointerStartAngle)
  self.FaultAngle = FaultAngle
  self.AngleSpeed = 360 / Speed
  self.State = "Normal"
  self.PreCanTriggerSwitchIndex = nil
  self.CanTriggerSwitchIndex = nil
  self.BeginTick = true
end

function CircleAroundPointer:Tick(MyGeometry, InDeltaTime)
  if not self.BeginTick or self.IsPlayingTriggerAnim then
    return
  end
  local Angle = self:GetRenderTransformAngle()
  local low = math.ceil((Angle - self.FaultAngle) / 15)
  local high = math.floor((Angle + self.FaultAngle) % 360 / 15)
  if low > high then
    low = low - 24
  end
  self.CanTriggerSwitchIndex = self.Owner:CheckIfInputRegionHasSwitch(low, high)
  if self.CanTriggerSwitchIndex ~= nil and self.State ~= "CanTrigger" then
    AudioManager(self):PlayUISound(self, "event:/ui/minigame/mech_rotate_pointer_highlight", "", nil)
    self.State = "CanTrigger"
    self.Owner.BlockArray[self.CanTriggerSwitchIndex + 1]:ChangeHoverState("Hover")
  elseif not self.CanTriggerSwitchIndex and self.State ~= "Normal" then
    self.State = "Normal"
    if self.PreCanTriggerSwitchIndex then
      self.Owner.BlockArray[self.PreCanTriggerSwitchIndex + 1]:ChangeHoverState("UnHover")
    end
  end
  self.PreCanTriggerSwitchIndex = self.CanTriggerSwitchIndex
  local DetalAngle = self.AngleSpeed * InDeltaTime
  self:SetRenderTransformAngle((Angle + DetalAngle) % 360)
end

function CircleAroundPointer:TriggerPointer()
  self:PlayAnimation(self.Press)
  if self.State == "CanTrigger" and not self.IsPlayingTriggerAnim and self.BeginTick then
    self.IsPlayingTriggerAnim = true
    self.Owner:TriggerBlock(self.CanTriggerSwitchIndex + 1)
    self.IsPlayingTriggerAnim = false
  end
end

return CircleAroundPointer
