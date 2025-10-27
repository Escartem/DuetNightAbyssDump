require("UnLua")
local M = Class("BluePrints.UI.BP_UIState_C")
M._components = {}

function M:Construct()
  self.M = M
  M.Super.Construct(self)
  self:InitListenEvent()
  self:RefreshBaseInfo()
end

function M:InitUIInfo(Name, IsInUIMode, EventList, Params)
  M.Super.InitUIInfo(self, Name, IsInUIMode, EventList, Params)
  local ComponentName
  if 1 == Params.Type then
    ComponentName = "BluePrints.UI.WBP.Armory.WBP_Armory_PetMixIndex_Base_C"
  elseif 2 == Params.Type then
    ComponentName = "BluePrints.UI.WBP.Armory.WBP_Armory_PetIndex_Base_C"
  end
  if ComponentName then
    self:SetComponent(ComponentName)
  end
  self.OnDestructObj = Params.OnDestructObj
  self.OnDestructCallback = Params.OnDestructCallback
  if self.InitComp then
    self:InitComp()
  end
  if self.ReallyInitUIInfo then
    self.ReallyInitUIInfo(self, Name, IsInUIMode, EventList, Params)
  end
  self:PlayAnimation(self.In)
end

function M:OnKeyDown(MyGeometry, InKeyEvent)
  if self.ReallyOnKeyDown then
    return self:ReallyOnKeyDown(MyGeometry, InKeyEvent)
  end
  return UE4.UWidgetBlueprintLibrary.Handled()
end

function M:InitListenEvent()
  local PlayerController = self:GetOwningPlayer()
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
  if IsValid(self.GameInputModeSubsystem) then
    self.GameInputModeSubsystem.OnInputMethodChanged:Add(self, self.RefreshOpInfoByInputDevice)
  end
end

function M:RefreshBaseInfo()
  if IsValid(self.GameInputModeSubsystem) then
    self:RefreshOpInfoByInputDevice(self.GameInputModeSubsystem:GetCurrentInputType(), self.GameInputModeSubsystem:GetCurrentGamepadName())
  end
end

function M:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  M.Super.RefreshOpInfoByInputDevice(self, CurInputDevice, CurGamepadName)
  if self.ReallyRefreshOpInfoByInputDevice then
    self:ReallyRefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  end
  self.CurInputDevice = CurInputDevice
end

function M:ReallyDestruct()
  if self.ReallyRefreshOpInfoByInputDevice then
    self:ReallyRefreshOpInfoByInputDevice()
  end
end

function M:OnFocusReceived()
  if self.ReallyOnFocusReceived then
    return self:ReallyOnFocusReceived()
  end
end

function M:Destruct()
  self:PlayAnimation(self.Out)
  if self.OnDestructCallback then
    self:OnDestructCallback(self.OnDestructObj)
  end
  M.Super.Destruct(self)
end

AssembleComponents(M)
return M
