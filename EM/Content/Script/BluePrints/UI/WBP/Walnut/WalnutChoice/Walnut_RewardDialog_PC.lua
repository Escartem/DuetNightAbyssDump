require("UnLua")
local M = Class("BluePrints.UI.BP_UIState_C")

function M:InitUIInfo(Name, IsInUIMode, EventList, ...)
  self.Super.InitUIInfo(self, Name, IsInUIMode, EventList, ...)
  local Param = {
    ...
  }
  if Param[1] then
    self.WalnutId = Param[1]
  end
  if Param[2] then
    self.UIName = Param[2]
  else
    self.UIName = ""
    DebugPrint("Error WBP_Walnut_RewardDialog InitUIInfo UIName is nil")
  end
  DebugPrint("WBP_Walnut_RewardDialog InitUIInfo WalnutId: ", self.WalnutId, "UIName: ", self.UIName)
  self:SetFocus()
  self:InitWalnutPlate(self.WalnutId)
  self:InitDescription(self.WalnutId)
  self:InitCommonKey()
  if self.Key_Access then
    self.Key_Access:CreateCommonKey({
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "View"}
      }
    })
  end
  self:BindEvents()
  self:InitListenEvents()
  if self.GameInputModeSubsystem:GetCurrentInputType() == ECommonInputType.Gamepad then
    self:PCToGamepad()
  else
    self:GamePadToPC()
  end
  AudioManager(self):PlayUISound(self, "event:/ui/common/mihan_level_before_choose_show", "CheckTeamWalnut", nil)
end

function M:BindEvents()
  self.BtnClose.Btn_Close.OnClicked:Add(self, self.Close)
end

function M:InitListenEvents()
  self:AddDispatcher(EventID.UnLoadUI, self, self.OnSystemUIUnLoad)
end

function M:InitWalnutPlate(WalnutId)
  self.WalnutPlate:SetWalnutContent(WalnutId, false)
  self.WalnutPlate.Ordinal_1st.MainUI = self
  self.WalnutPlate.Ordinal_2nd.MainUI = self
  self.WalnutPlate.Ordinal_3rd.MainUI = self
  self.WalnutPlate.MainUI = self
  self.WalnutPlate.Reward_1st.MainUI = self
  self.WalnutPlate.Reward_2nd.MainUI = self
  self.WalnutPlate.Reward_2nd_2.MainUI = self
  self.WalnutPlate.Reward_3rd_1.MainUI = self
  self.WalnutPlate.Reward_3rd_2.MainUI = self
  self.WalnutPlate.Reward_3rd_3.MainUI = self
  self.WalnutChoice = nil
end

function M:InitDescription(WalnutId)
  local WalnutData = DataMgr.Walnut[WalnutId]
  local WalnutTypeData = DataMgr.WalnutType[WalnutData.WalnutType]
  self.Text_Title:SetText(GText(WalnutData.Name))
  self.Text_Hold:SetText(GText("UI_Bag_Sellconfirm_Hold"))
  local Avatar = GWorld:GetAvatar()
  local Count = 0
  local WalnutsInBag = Avatar.Walnuts.WalnutBag
  for WId, Number in pairs(WalnutsInBag) do
    if WId == WalnutId then
      Count = Number
    end
  end
  self.Num_Hold:SetText(tostring(Count))
  self.Text_Describe:SetText(GText("WALNUT_FUNCTION"))
  self.Text_LongDescribe:SetText(GText(WalnutTypeData.IpDes))
  self.Text_Access:SetText(GText("UI_Tips_Obtining"))
  if self.ScrollBox_Dialog then
    self.ScrollBox_Dialog:SetScrollbarVisibility(UE4.ESlateVisibility.Hidden)
    self.ScrollBox_Dialog:SetControlScrollbarInside(true)
  end
  self:InitAccess(WalnutData.AccessKey, WalnutId)
end

function M:InitCommonKey()
  if ModController:IsMobile() then
    return
  end
  self.Panel_Key_GamePad:ClearChildren()
  for i = 1, 3 do
    local MenuKeyWidget = Utils.UIManager(self):CreateWidget("/Game/UI/WBP/Common/Key/WBP_Com_KeyTextDesc.WBP_Com_KeyTextDesc", false)
    self.Panel_Key_GamePad:AddChild(MenuKeyWidget)
  end
  self.Panel_Key_GamePad:SetVisibility(UE4.ESlateVisibility.Collapsed)
end

function M:InitAccess(AccessKey, ItemId)
  self.Method:ClearChildren()
  if AccessKey then
    for _, Access in pairs(AccessKey) do
      PageJumpUtils:GetItemAccess(self, ItemId, "Walnut", Access, self.UIName)
    end
    PageJumpUtils:SortAccessItem(self.Method)
  end
end

function M:UpdateCommonKeys(...)
  local Param = {
    ...
  }
  for i = 0, 2 do
    local CurerentKey = self.Panel_Key_GamePad:GetChildAt(i)
    if CurerentKey then
      if Param[i * 2 + 1] ~= nil and Param[i * 2 + 2] ~= nil then
        CurerentKey:SetVisibility(UE4.ESlateVisibility.Visible)
        CurerentKey:CreateCommonKey({
          KeyInfoList = {
            {
              Type = "Img",
              ImgShortPath = Param[i * 2 + 1]
            }
          },
          Desc = Param[i * 2 + 2]
        })
      else
        CurerentKey:SetVisibility(UE4.ESlateVisibility.Collapsed)
      end
    end
  end
end

function M:GamePadToPC()
  if ModController:IsMobile() then
    return
  end
  self.Panel_Key_GamePad:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self.Key_Access:SetVisibility(UE4.ESlateVisibility.Collapsed)
end

function M:PCToGamepad()
  if ModController:IsMobile() then
    return
  end
  self:SetFocus()
  self.Panel_Key_GamePad:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  self.Key_Access:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  self:UpdateCommonKeys("LS", GText("UI_Controller_CheckReward"), "B", GText("UI_Controller_Close"))
  self.State = 0
end

function M:InitGameInputMode()
  DebugPrint("InitGameInputMode")
  if not self.Panel_Key_GamePad then
    return
  end
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
  self.IsFocusInit = false
  if IsValid(self.GameInputModeSubsystem) then
    self:RefreshOpInfoByInputDevice(self.GameInputModeSubsystem:GetCurrentInputType(), self.GameInputModeSubsystem:GetCurrentGamepadName())
    self.GameInputModeSubsystem.OnInputMethodChanged:Add(self, self.RefreshOpInfoByInputDevice)
  end
end

function M:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  DebugPrint("RefreshOpInfoByInputDevice", CurInputDevice, CurGamepadName)
  if self.CurInputDeviceType == CurInputDevice then
    return
  end
  local IsUseKeyAndMouse = CurInputDevice == ECommonInputType.MouseAndKeyboard
  if IsUseKeyAndMouse then
    self:GamePadToPC()
  else
    self:PCToGamepad()
  end
  self.CurInputDeviceType = CurInputDevice
  self.Super.RefreshOpInfoByInputDevice(self, CurInputDevice, CurGamepadName)
end

function M:OnKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local IsEventHandled = false
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) then
    if "Gamepad_FaceButton_Right" == InKeyName then
      if 2 == self.State or 4 == self.State then
        self:SetFocus()
        self.State = 0
        self:UpdateCommonKeys("LS", GText("UI_Controller_CheckReward"), "B", GText("UI_Controller_Close"))
        self.Key_Access:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
      elseif 1 == self.State then
        if self.WalnutPlate.Ordinal_1st.Tips_MenuAnchor:HasFocusedDescendants() then
          self.WalnutPlate.Ordinal_1st:SetFocus()
        elseif self.WalnutPlate.Ordinal_2nd.Tips_MenuAnchor:HasFocusedDescendants() then
          self.WalnutPlate.Ordinal_2nd:SetFocus()
        elseif self.WalnutPlate.Ordinal_3rd.Tips_MenuAnchor:HasFocusedDescendants() then
          self.WalnutPlate.Ordinal_3rd:SetFocus()
        else
          self:SetFocus()
          self.State = 0
          self:UpdateCommonKeys("LS", GText("UI_Controller_CheckReward"), "B", GText("UI_Controller_Close"))
        end
      else
        self:Close()
      end
      IsEventHandled = true
    elseif "Gamepad_Special_Right" == InKeyName then
    elseif "Gamepad_LeftThumbstick" == InKeyName then
      if 0 == self.State then
        self.WalnutPlate.Reward_1st.Button_Area:SetFocus()
        self.State = 2
        self:UpdateCommonKeys("A", GText("UI_Controller_CheckDetails"), "B", GText("UI_Tips_Close"))
        IsEventHandled = true
      end
    elseif "Gamepad_Special_Left" == InKeyName then
      self:UpdateCommonKeys("A", GText("UI_Controller_Go"), "B", GText("UI_Controller_Close"))
      self.State = 4
      self:UpdateCommonKeys("A", GText("UI_Controller_Go"), "B", GText("UI_Tips_Close"))
      if self.Method:GetChildrenCount() > 0 then
        self.Method:GetChildAt(0):SetFocus()
      end
      self.Key_Access:SetVisibility(UE4.ESlateVisibility.Collapsed)
      IsEventHandled = true
    end
  elseif "Escape" == InKeyName and self.IsAllowEscape then
    if not self.IsBeginToClose and self.IsInit then
      self:Close()
    end
    IsEventHandled = true
  end
  if IsEventHandled then
    return UE4.UWidgetBlueprintLibrary.Handled()
  else
    return UE4.UWidgetBlueprintLibrary.UnHandled()
  end
end

function M:Close()
  AudioManager(self):SetEventSoundParam(self, "CheckTeamWalnut", {ToEnd = 1})
  self.WalnutChoice = nil
  self.Super.Close(self)
end

function M:OnSystemUIUnLoad(UIName)
  if UIName == self.UIName then
    self:Close()
  end
end

return M
