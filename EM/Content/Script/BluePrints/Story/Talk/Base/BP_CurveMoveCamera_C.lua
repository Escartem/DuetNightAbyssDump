require("UnLua")
local M = Class()

function M:ReceiveBeginPlay()
  EventManager:AddEvent(EventID.OnCurveCameraStartMove, self, self.StartMove)
  EventManager:AddEvent(EventID.OnSelectWeapon, self, self.K2_DestroyActor)
end

function M:ReceiveEndPlay()
  EventManager:RemoveEvent(EventID.OnCurveCameraStartMove, self)
  EventManager:RemoveEvent(EventID.OnSelectWeapon, self)
end

function M:ReceiveTick(DeltaSeconds)
  self:MoveCamera(DeltaSeconds)
  if not self.SelectUI and self.CurrentTime >= self.MoveTime then
    self.SelectUI = UIManager(self):LoadUI(UIConst.STORYWEAPONSELECT, "StoryWeaponSelect", UIConst.ZORDER_FOR_DESKTOP_TEMP)
  end
end

function M:StartMove(MoveTime)
  self.CanMoveCamera = true
  self.MoveTime = MoveTime
end

return M
