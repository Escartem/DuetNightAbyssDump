local M = Class()

function M:Init()
  self:GetModel():Init()
  self._Model = self:GetModel()
  self:GetEventName()
  self.bInited = true
  self.bTipIgnoreBattle = false
  self.Platform = CommonUtils.GetDeviceTypeByPlatformName(GWorld.GameInstance)
  GWorld.GameInstance:BindGamepadEvent()
  self.IsDestroied = nil
  self.TimerKeys = {}
end

function M:IsPC()
  return self.Platform == CommonConst.CLIENT_DEVICE_TYPE.PC
end

function M:IsGamepad()
  return GWorld.GameInstance.CurInputDeviceType == ECommonInputType.Gamepad
end

function M:GetInputDeviceName()
  return GWorld.GameInstance.CurInputDeviceName
end

function M:IsMobile()
  return self.Platform == CommonConst.CLIENT_DEVICE_TYPE.MOBILE
end

function M:GetUIMgr(WorldContext)
  if IsValid(self.UIManager) then
    return self.UIManager
  end
  WorldContext = WorldContext or GWorld.GameInstance
  self.UIManager = UIManager(WorldContext)
  return self.UIManager
end

function M:Destory()
  self.bInited = false
  for TimerKey in pairs(self.TimerKeys) do
    self:StopTimer(TimerKey)
  end
  EventManager.EventDic[self:GetEventName()] = nil
  self:GetModel():Destory()
  self._Model = nil
  GWorld.GameInstance:UnBindGamepadEvent()
  self.IsDestroied = true
end

function M:GetAvatar()
  return self:GetModel():GetAvatar()
end

function M:GetModel()
  assert(false, "\232\175\183\229\156\168\228\189\160\231\187\167\230\137\191\231\154\132Controller\233\135\140\229\174\158\231\142\176\228\189\160\231\154\132 GetModel()")
end

function M:GetEventName()
  assert(false, "\232\175\183\229\156\168\228\189\160\231\187\167\230\137\191\231\154\132Controller\233\135\140\229\174\158\231\142\176\228\189\160\231\154\132 GetEventName()")
end

function M:OpenView(WorldContext, ViewNameOrMainUIId, ...)
  assert(ViewNameOrMainUIId, "ViewName is nil")
  local ViewName, ViewObj
  if type(ViewNameOrMainUIId) == "string" then
    ViewName = ViewNameOrMainUIId
    WorldContext = WorldContext or GWorld.GameInstance
    ViewObj = self:GetUIMgr(WorldContext):LoadUINew(ViewName, ...)
  elseif type(ViewNameOrMainUIId) == "number" then
    local MainUIId = ViewNameOrMainUIId
    UIUtils.OpenSystem(MainUIId, ...)
    ViewName = DataMgr.MainUI[MainUIId].SystemUIName
    ViewObj = self:GetView(WorldContext, ViewName)
  end
  return ViewObj
end

function M:GetView(WorldContext, ViewName)
  assert(ViewName, "ViewName is nil")
  WorldContext = WorldContext or GWorld.GameInstance
  assert(IsValid(WorldContext), "WorldContext is not valid")
  local ViewObj = self:GetUIMgr(WorldContext):GetUIObj(ViewName)
  return ViewObj
end

function M:OpenViewAsync(WorldContext, ViewName, Coroutine, ...)
  assert(ViewName, "ViewName is nil")
  WorldContext = WorldContext or GWorld.GameInstance
  local ViewObj = self:GetUIMgr(WorldContext):LoadUIAsync(ViewName, Coroutine, ...)
  return ViewObj
end

function M:GetViewAsync(WorldContext, ViewName, Coroutine)
  assert(ViewName, "ViewName is nil")
  WorldContext = WorldContext or GWorld.GameInstance
  assert(IsValid(WorldContext), "WorldContext is not valid")
  local ViewObj = self:GetUIMgr(WorldContext):GetUIObjAsync(ViewName, Coroutine)
  return ViewObj
end

function M:ShowToast(Text, Duration, ExtraData)
  if nil == Duration then
    Duration = 1.5
  end
  if nil == Text then
    Text = GText("UI_REGISTER_COMINGSOON")
  end
  DebugPrint(LXYTag, "Controller::ShowToast::Content", Text)
  local TipType = UIConst.Tip_CommonToast
  local BattleView = self:GetUIMgr():GetUIObj(DataMgr.SystemUI.BattleMain.UIName)
  if BattleView:IsVisible() and not self.bTipIgnoreBattle then
    TipType = UIConst.Tip_CommonTop
  end
  self:GetUIMgr():ShowUITip(TipType, Text, Duration, false, ExtraData)
end

function M:CheckError(ErrCode, bShowTip, ...)
  if ErrCode == ErrorCode.RET_SUCCESS then
    return true
  end
  if nil == bShowTip then
    bShowTip = true
  end
  local TipType = UIConst.Tip_CommonToast
  local BattleView = self:GetUIMgr():GetUIObj(DataMgr.SystemUI.BattleMain.UIName)
  if BattleView and BattleView:IsVisible() and not self.bTipIgnoreBattle then
    TipType = UIConst.Tip_CommonTop
  end
  DebugPrint(LXYTag, "Controller::CheckError::ErrCode", ErrorCode:Name(ErrCode))
  if bShowTip then
    self:GetUIMgr():ShowError(ErrCode, 1.5, TipType, ...)
  end
  return false
end

function M:RegisterEvent(EventObj, EventFunc)
  EventFunc = EventFunc or function(self, EventId, ...)
    local Func = self["Notify" .. EventId]
    if Func then
      Func(self, ...)
    end
  end
  if EventObj.AddDispatcher then
    EventObj:AddDispatcher(self:GetEventName(), EventObj, EventFunc)
  else
    EventManager:AddEvent(self:GetEventName(), EventObj, EventFunc)
  end
end

function M:UnRegisterEvent(EventObj)
  if EventObj.RemoveDispatcher then
    EventObj:RemoveDispatcher(self:GetEventName())
  else
    EventManager:RemoveEvent(self:GetEventName(), EventObj)
  end
end

function M:NotifyEvent(EventId, ...)
  EventManager:FireEvent(self:GetEventName(), EventId, ...)
end

function M:AddTimer(Interval, Func, IsLoop, Delay, Key, IsRealTime, ...)
  if nil == IsRealTime then
    IsRealTime = true
  end
  if not IsValid(GWorld.GameInstance) then
    return
  end
  local _, TimerKey, TimerInfo
  
  local function TempFunc(...)
    if not IsLoop then
      self.TimerKeys[TimerKey] = nil
    end
    Func(...)
  end
  
  _, TimerKey = GWorld.GameInstance:AddTimer(Interval, TempFunc, IsLoop, Delay, Key, IsRealTime, ...)
  self.TimerKeys[TimerKey] = 1
  DebugPrint(self:GetEventName() .. " Controller:AddTimer " .. TimerKey)
  return TimerKey
end

function M:StopTimer(TimerKey)
  if not TimerKey then
    return
  end
  DebugPrint(self:GetEventName() .. "Controller:StopTimer " .. TimerKey)
  if not IsValid(GWorld.GameInstance) then
    return
  end
  if not self.TimerKeys[TimerKey] then
    return
  end
  if GWorld.GameInstance:IsExistTimer(TimerKey) then
    GWorld.GameInstance:RemoveTimer(TimerKey, true)
    self.TimerKeys[TimerKey] = nil
  end
end

function M:IsExistTimer(TimerKey)
  if not self.TimerKeys then
    self.TimerKeys = {}
  end
  if not self.TimerKeys[TimerKey] then
    return false
  end
  return GWorld.GameInstance:IsExistTimer(TimerKey)
end

return M
