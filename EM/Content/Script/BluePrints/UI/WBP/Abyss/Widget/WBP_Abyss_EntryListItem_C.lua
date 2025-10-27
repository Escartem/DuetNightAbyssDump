require("UnLua")
local M = Class("Blueprints.UI.BP_UIState_C")

function M:Construct()
end

function M:Init(ConfigData)
  self.BuffInfo = ConfigData.BuffInfo
  self.BuffId = ConfigData.AbyssBuffID
  self.AbyssBuffType = ConfigData.AbyssBuffType
  self.AbyssBuffName = ConfigData.AbyssBuffName
  self.AbyssEntryConfig = ConfigData.AbyssBuffParameter
  self.Icon = ConfigData.Icon
  self.AbyssBuffDes = ConfigData.AbyssBuffDes
  self.BuffLockToast = ConfigData.BuffLockToast
  self.Unlocked = ConfigData.Unlocked
  self.Text_Name:SetText(GText(self.AbyssBuffName) or "\230\151\160")
  self.Islocked = ConfigData.Islocked
  self.Text_Lock:SetText(GText(self.BuffLockToast))
  if self.Islocked then
    self:PlayAnimation(self.Locked)
  else
    self.AbyssBuffDes = UIUtils.GenAbyssEntryDesc(GText(self.AbyssBuffDes), self.AbyssEntryConfig, 0)
    self.Text_Descirbe:SetText(GText(self.AbyssBuffDes) or "\230\151\160")
    if self.Unlocked then
      self:PlayAnimation(self.UnLock)
    else
      self:PlayAnimation(self.Normal)
    end
  end
  if self.Icon then
    local Obj = LoadObject(self.Icon)
    if Obj then
      self.Icon_Entry:SetBrushResourceObject(Obj)
    end
  end
  if 1 == self.AbyssBuffType then
    self.Text_Name:SetColorAndOpacity(self.Color_Green)
  else
    self.Text_Name:SetColorAndOpacity(self.Color_Red)
  end
end

function M:OnListItemObjectSet(Content)
  Content.SelfWidget = self
  self.Content = Content
  self.Owner = Content.Owner
  self:Init(Content.ConfigData)
end

function M:RefreshBaseInfo()
  local GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(self)
  if IsValid(GameInputModeSubsystem) then
    self:RefreshOpInfoByInputDevice(GameInputModeSubsystem:GetCurrentInputType())
    GameInputModeSubsystem.OnInputMethodChanged:Add(self, self.RefreshOpInfoByInputDevice)
  end
end

function M:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  if self.CurInputDeviceType == CurInputDevice then
    return
  end
  self.CurInputDeviceType = CurInputDevice
  self:UpdateHotKeyInfo(CurGamepadName)
end

function M:UpdateHotKeyInfo(CurGamepadName)
  if self.CurInputDeviceType == ECommonInputType.Gamepad then
    self:CreateHotKeyAndAddToParent(self.Key_Left, "Img", "LT")
    self:CreateHotKeyAndAddToParent(self.Key_Right, "Img", "RT")
  else
    self:CreateHotKeyAndAddToParent(self.Key_Left, "Text", self.ConfigData.LeftKey or "A")
    self:CreateHotKeyAndAddToParent(self.Key_Right, "Text", self.ConfigData.RightKey or "D")
  end
end

function M:CreateHotKeyAndAddToParent(PanelWidget, KeyType, KeyContent)
  PanelWidget:ClearChildren()
  local HotKeyWidget
  if "Img" == KeyType then
    HotKeyWidget = UIManager(self):CreateWidget("/Game/UI/WBP/Common/Key/WBP_Com_KeyImg.WBP_Com_KeyImg", false)
  else
    HotKeyWidget = UIManager(self):CreateWidget("/Game/UI/WBP/Common/Key/WBP_Com_KeyText.WBP_Com_KeyText", false)
    HotKeyWidget.IsButton = false
  end
  if nil ~= HotKeyWidget then
    if "Img" == KeyType then
      HotKeyWidget:CreateCommonKey({
        KeyInfoList = {
          {Type = "Img", ImgShortPath = KeyContent}
        }
      })
    else
      HotKeyWidget:CreateCommonKey({
        KeyInfoList = {
          {Type = "Text", Text = KeyContent}
        }
      })
    end
  end
  PanelWidget:AddChildToOverlay(HotKeyWidget)
end

function M:BindEventOnTabSelected(Obj, Event)
  self.ObjTabSelected = Obj
  self.EventTabSelected = Event
end

function M:SelectTab(Idx)
  if self.Tabs[Idx] then
    self.List_Tab:GetChildAt(math.max(Idx - 1, 0)):SetSwitchOn(true)
  end
end

function M:Handle_KeyEventOnPC(InKeyName)
  local IsEventHandled = true
  if InKeyName == UE4.EKeys.A.KeyName then
    self:TabToLeft()
  elseif InKeyName == UE4.EKeys.D.KeyName then
    self:TabToRight()
  else
    IsEventHandled = false
  end
  return IsEventHandled
end

function M:Handle_KeyEventOnGamePad(InKeyName)
  local IsEventHandled = true
  if "Gamepad_LeftTrigger" == InKeyName then
    self:TabToLeft()
  elseif "Gamepad_RightTrigger" == InKeyName then
    self:TabToRight()
  else
    IsEventHandled = false
  end
  return IsEventHandled
end

return M
