require("UnLua")
local S = Class("BluePrints.UI.BP_EMUserWidget_C")

function S:Construct()
end

function S:Init(Parent)
  self.Parent = Parent
end

function S:OnBtnDragClicked()
  self.Parent:OnClickBlankArea()
end

function S:Handle_KeyDownOnGamePad(InKeyName)
end

function S:Handle_KeyUpOnGamePad(InKeyName)
end

function S:Gamepad_SetHovered(bIsHovered)
end

function S:GetBottomKeyInfos()
end

function S:GetFirstWidgetToNavigate()
  return self
end

function S:GetLastWidgetToNavigate()
  return self
end

return S
