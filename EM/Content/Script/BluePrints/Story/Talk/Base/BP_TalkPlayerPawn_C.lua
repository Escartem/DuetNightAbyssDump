require("UnLua")
local M = Class()

function M:ReceiveBeginPlay()
  self.bEnableChangeView = true
  self.bIsTouchPressed = false
end

function M:ReceiveEndPlay(EndPlayReason)
end

function M:Init(Player, TalkContext)
end

function M:SetEnableChangeView(bEnable)
  self.bEnableChangeView = bEnable
end

function M:ViewTurn(Value)
  if self.bEnableChangeView == false then
    return
  end
  self.Overridden.ViewTurn(self, Value)
end

function M:ViewLookUp(Value)
  if self.bEnableChangeView == false then
    return
  end
  self.Overridden.ViewLookUp(self, Value)
end

function M:InputTouch_Pressed(Location, FingerIndex)
  if 0 == FingerIndex and self.bIsTouchPressed == false then
    self.bIsTouchPressed = true
    self.Overridden.InputTouch_Pressed(self, Location, FingerIndex)
  end
end

function M:InputTouch_Released(Location, FingerIndex)
  if 0 == FingerIndex and self.bIsTouchPressed == true then
    self.bIsTouchPressed = false
    self.Overridden.InputTouch_Released(self, Location, FingerIndex)
  end
end

function M:InputTouch_Moved(Location, FingerIndex)
  if 0 == FingerIndex and self.bIsTouchPressed == true then
    self.Overridden.InputTouch_Moved(self, Location, FingerIndex)
  end
end

return M
