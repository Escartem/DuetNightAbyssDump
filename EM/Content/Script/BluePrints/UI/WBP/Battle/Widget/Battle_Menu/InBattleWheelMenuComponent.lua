require("UnLua")
local CommonUtils = require("Utils.CommonUtils")
local Component = {}
local WHEEL_STATE_SELECTING = 0
local WHEEL_STATE_NO_SELECTING = 2
local TOAST_DURATION = 3
local MOBILE_RADIUS = 38
local PC_RADIUS = 130
local WHEEL_DISPLAY_COUNT = 3
local WHEEL_BAG_CAPACITY = 8
local SUM_BAG_CAPACITY = 24
local GAMEPAD_SELECT_ICON_PATH = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Key/XBOX/T_Key_R.T_Key_R'"
local MOUSE_SELECT_ICON_PATH = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Key/PC/T_Key_Mouse.T_Key_Mouse'"

function Component:InitContent()
  self:ResetPanel()
  self:InitPanelInfo()
  self:InitSlots()
  self:SetEnterInputState()
  self:EnablePointerDetection(true)
  self.bPointerAllwaysEntered = true
  self:SetVisibility(UIConst.VisibilityOp.Visible)
  self.bIsFocusable = false
  self.PageTurner:InitPageTurner(WHEEL_DISPLAY_COUNT, self, self.UpdatePageTurner)
  SUM_BAG_CAPACITY = DataMgr.GlobalConstant.BattleWheelPlanNum.ConstantValue
  self:SetPosition(self.Main, FVector2D(0, 0))
end

function Component:ResetPanel()
  self.DisplayIndex = 1
  self.bIsClosing = false
  EventManager:FireEvent(EventID.OnDisplayIndexChanged, self.DisplayIndex)
end

function Component:OnLoaded()
end

function Component:InitPanelInfo()
  self.bIsMobile = self.bIsMobile or CommonUtils.GetDeviceTypeByPlatformName(self) == "Mobile"
  if self.bIsMobile then
    self:SetWheelRadius(MOBILE_RADIUS, math.huge)
    self.Icon_Side:SetVisibility(UIConst.VisibilityOp.Collapsed)
  else
    local CurMode = self.GameInputModeSubsystem:GetCurrentInputType()
    local ImagePath = MOUSE_SELECT_ICON_PATH
    if CurMode == ECommonInputType.Gamepad then
      ImagePath = GAMEPAD_SELECT_ICON_PATH
    end
    local IconImage = LoadObject(ImagePath)
    self.Icon_Side:SetBrushResourceObject(IconImage)
    self:SetWheelRadius(PC_RADIUS, math.huge)
    self.Icon_Side:SetVisibility(UIConst.VisibilityOp.Visible)
  end
  self:RefreshNonSelectCenter()
  self.WS_Num:SetVisibility(UIConst.VisibilityOp.Collapsed)
end

function Component:InitSlots()
  local Avatar = GWorld:GetAvatar()
  if nil == Avatar then
    return
  end
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  DebugPrint("gmy@InBattleWheelMenuComponent Component:InitSlots", Player.SquadWheelIndex)
  local SquadWheelIndex = Player.SquadWheelIndex
  if SquadWheelIndex > 0 then
    self.WheelIndex = SquadWheelIndex
  else
    self.WheelIndex = Avatar.WheelIndex or 1
  end
  local CurrentWheel = Avatar.Wheels[self.WheelIndex]
  self.Slots = {}
  for Index = 1, WHEEL_BAG_CAPACITY do
    local Slot = self:DisplaySlotIndex2WheelSlot(Index)
    local Resource
    if nil ~= Slot.ResourceId and 0 ~= Slot.ResourceId then
      Resource = Avatar.Resources[Slot.ResourceId]
    end
    local IconAnimationBP = Resource and Resource:Data().IconAnimationBP
    if IconAnimationBP then
      local PropSp = UIManager(self):CreateWidget(IconAnimationBP, false)
      if PropSp then
        self["Prop_" .. Index]:RemoveChild(self["Prop_Icon" .. Index])
        self["Prop_Icon" .. Index] = PropSp
        self["Prop_" .. Index]:AddChild(self["Prop_Icon" .. Index])
      end
    else
      local NormalPropBP = "/Game/UI/WBP/Battle/Widget/Battle_Menu/WBP_BattleMenu_Prop.WBP_BattleMenu_Prop"
      local Prop = UIManager(self):CreateWidget(NormalPropBP, false)
      if Prop then
        self["Prop_" .. Index]:RemoveChild(self["Prop_Icon" .. Index])
        self["Prop_Icon" .. Index] = Prop
        self["Prop_" .. Index]:AddChild(self["Prop_Icon" .. Index])
      end
    end
    local IconWidget = self["Prop_Icon" .. Index]
    if IconWidget and Resource then
      local bCanUse = self:CheckResourceCanUse(Resource.ResourceId)
      IconWidget:SetIconByPath(Resource.Icon)
      IconWidget:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
      IconWidget:SetIconState(bCanUse)
      self:SetIconCountText(IconWidget, Resource, Slot)
    elseif IconWidget then
      IconWidget:SetVisibility(UIConst.VisibilityOp.Collapsed)
    end
    self.Slots[Index] = IconWidget
  end
end

function Component:SelectAndCloseMenu(ForceSelectSlot)
  if not self.bIsClosing then
    self:TryUseSelectItem(ForceSelectSlot)
    self:OnClose()
    if self.MenuButton then
      self.MenuButton:ClearSelectSlot()
    end
    AudioManager(self):SetEventSoundParam(self, "BattleMenuShow", {ToEnd = 1})
  end
end

function Component:CloseMenu()
  DebugPrint("gmy@InBattleWheelMenuComponent Component:CloseMenu")
  if not self.bIsClosing then
    self:OnClose()
    if self.MenuButton then
      self.MenuButton:ClearSelectSlot()
    end
    AudioManager(self):SetEventSoundParam(self, "BattleMenuShow", {ToEnd = 1})
  end
end

function Component:TryUseSelectItem(ForceSelectSlot)
  DebugPrint("gmy@TryUseSelectItem", self.CurrentHoveredSlot, ForceSelectSlot)
  local MyPlayerController = UE4.UGameplayStatics.GetPlayerController(GWorld.GameInstance, 0)
  if not MyPlayerController.bEnableBattleWheel then
    return
  end
  local NowSelectingSlotIndex = self.CurrentHoveredSlot
  if ForceSelectSlot then
    NowSelectingSlotIndex = ForceSelectSlot
  end
  if NowSelectingSlotIndex then
    local Avatar = GWorld:GetAvatar()
    if nil == Avatar then
      return
    end
    local Slot = self:DisplaySlotIndex2WheelSlot(NowSelectingSlotIndex)
    if Slot then
      local ResourceId = Slot.ResourceId
      if ResourceId then
        local Resource = Avatar.Resources[ResourceId]
        if Resource then
          if Slot.ResourceCount > 0 or Resource:Data().Type == "InfiniteBattleItem" then
            local ConditionRes, ToastTextId = self:CheckResourceCanUse(ResourceId)
            if ConditionRes then
              Avatar:UseWheelItemInBattle(ResourceId)
            elseif ToastTextId then
              local ToastText = GText(ToastTextId)
              UIManager(self):ShowUITip("CommonToastMain", ToastText)
            else
              DebugPrint("gmy@Component:TryUseSelectItem ResourceId, ToastTextId", ResourceId, ToastTextId)
            end
          else
            local ToastText = string.format(GText(DataMgr.TextMap.BATTLE_MENU_ITEM_LACK.TextMapId), GText(DataMgr.TextMap[Resource.ResourceName].TextMapId))
            UIManager(self):ShowUITip("CommonToastMain", ToastText, TOAST_DURATION)
          end
        end
      end
    end
  end
end

function Component:SetEnterInputState()
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  self.bOldMouseVisible = PlayerController.bShowMouseCursor
  self.bIsMobile = self.bIsMobile or CommonUtils.GetDeviceTypeByPlatformName(self) == "Mobile"
  if self.bIsMobile then
    PlayerController.bShowMouseCursor = false
  else
    PlayerController.bShowMouseCursor = true
  end
  local GameInputSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(self)
  local Params = FGameInputModeParams()
  Params.bShowMouseCursor = PlayerController.bShowMouseCursor
  Params.MouseLockMode = EMouseLockMode.DoNotLock
  GameInputSubsystem:EnableInputMode("BattleWheelInputSetting", EGameInputMode.GameAndUI, Params)
end

function Component:SetExitInputState()
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  PlayerController.bShowMouseCursor = self.bOldMouseVisible
  local GameInputSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(self)
  GameInputSubsystem:DisableInputMode("BattleWheelInputSetting")
end

function Component:OnWheelCenterCalculated()
end

function Component:OnSlotHoverChanged(LastSlot, CurrentSlot)
  DebugPrint("gmy@OnSlotHoverChanged", LastSlot, CurrentSlot)
  if not self.bEnableHovered then
    return
  end
  if self:IsClosing() then
    return
  end
  if CurrentSlot then
    self:HoverSlot(CurrentSlot)
    if self.MenuButton then
      self.MenuButton:SelectSlot(CurrentSlot)
    end
    self:RefreshCenterTitle(CurrentSlot)
  else
    self:UnHoverSlot(CurrentSlot)
    self:RefreshNonSelectCenter()
    if self.MenuButton then
      self.MenuButton:SelectNoneSlot()
    end
  end
end

function Component:InitSlotBg()
end

function Component:GetSlotInfo(CurrentSlotIndex)
  local Avatar = GWorld:GetAvatar()
  if nil == Avatar then
    return
  end
  local CurrentWheel = Avatar.Wheels[self.WheelIndex]
  local Slot = CurrentWheel[CurrentSlotIndex]
  return Slot
end

function Component:SetIconCountText(IconWidget, Resource, Slot)
  if Resource:Data().Type == "InfiniteBattleItem" then
    local ResId = Resource.ResourceId
    if ResId then
      local ResData = DataMgr.Resource[ResId]
      if ResData then
        local ResourceSType = ResData.ResourceSType
        if "PhantomItem" == ResourceSType then
          local CharId = Resource.UseParam
          if CharId then
            local Avatar = GWorld:GetAvatar()
            if Avatar and Avatar.Chars then
              for _, CharInfo in pairs(Avatar.Chars) do
                if CharInfo.CharId == CharId then
                  local LevelText = GText("UI_LEVEL_NAME") .. CharInfo.Level
                  IconWidget:SetCount(LevelText)
                end
              end
            end
          end
        else
          IconWidget:SetCount("")
        end
      end
    end
  else
    local Count = Slot.ResourceCount or 0
    IconWidget:SetCount(Count)
    IconWidget:SetCountState(0 ~= Count)
  end
end

function Component:CheckResourceCanUse(ResourceId)
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  if not IsValid(Player) then
    return false
  end
  local CombatConditionIDs = DataMgr.Resource[ResourceId].CombatConditionID or {}
  local CombatConditionParams = DataMgr.Resource[ResourceId].CombatConditionParams or {}
  local ToastIds = DataMgr.Resource[ResourceId].CombatConditionToast or {}
  for Index, CombatConditionID in ipairs(CombatConditionIDs) do
    DebugPrint("gmy@InBattleWheelMenuComponent Component:CheckResourceCanUse", CombatConditionID)
    if CombatConditionID then
      local ConditionConfig = DataMgr.CombatCondition[CombatConditionID]
      if ConditionConfig then
        local ExtraVars = CombatConditionParams and CombatConditionParams[Index]
        local ConditionRes = Battle(self):CheckCondition_Lua(CombatConditionID, Player, nil, ExtraVars)
        if not ConditionRes then
          return false, ToastIds and ToastIds[Index]
        end
      end
    end
  end
  return true
end

function Component:OnClose()
  self.bIsClosing = true
  self:SetExitInputState()
end

function Component:HandleRemovedFromFocusPath(FocusEvent)
  if not self:IsClosing() then
    self:OnClose()
    UIManager(self):UnLoadUINew("InBattleWheelMenu")
  end
end

function Component:UpdateWheelConfig()
  self:SetWheelCenter(self.WidgetForCalcCenter)
  self:SetWheelRadius(self.DesiredInnerWheelRadius, self.DesiredOuterWheelRadius)
end

function Component:BindMenuButton(MenuButton)
  self.MenuButton = MenuButton
end

function Component:IsClosing()
  return self.bIsClosing or false
end

function Component:GetPointerPosition()
  if self.bIsMobile and self.MenuButton and self.MenuButton.TotalDeltaDis then
    local CenterPos = self:CalcWheelCenter()
    return self.MenuButton.TotalDeltaDis + CenterPos
  end
  return UWidgetLayoutLibrary.GetMousePositionOnPlatform()
end

function Component:OnHide()
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  local PlayerCharacter = UE4.UGameplayStatics.GetPlayerCharacter(GameInstance, 0)
  PlayerCharacter:CloseBattleWheel()
end

function Component:OnChangeDisplayWheel()
  DebugPrint("gmy@InBattleWheelMenuComponent Component:OnChangeDisplayWheel")
  self:BindToAnimationFinished(self.Switch_Out, {
    self,
    self.RealChangeDisplayWheel
  })
  self:PlayAnimationForward(self.Switch_Out)
end

function Component:RealChangeDisplayWheel()
  self.DisplayIndex = (self.DisplayIndex - 1 + 1) % WHEEL_DISPLAY_COUNT + 1
  EventManager:FireEvent(EventID.OnDisplayIndexChanged, self.DisplayIndex)
  DebugPrint("gmy@InBattleWheelMenuComponent Component:RealChangeDisplayWheel", self.DisplayIndex)
  self:UnbindFromAnimationFinished(self.Switch_Out, {
    self,
    self.RealChangeDisplayWheel
  })
  self:RefreshCenterTitle(self.CurrentHoveredSlot)
  self:InitSlots()
  self:RefreshPageTurner()
  self:AddTimer(0.01, function()
    self:PlayAnimation(self.Switch_In)
  end)
  AudioManager(self):PlayUISound(self, "event:/ui/common/combat_bag_change_page", nil, nil)
end

function Component:WheelIndex2DisplaySlotIndex(WheelIndex)
  return (WheelIndex - 1) % WHEEL_BAG_CAPACITY + 1
end

function Component:DisplaySlotIndex2WheelIndex(SlotIndex)
  return SlotIndex + (self.DisplayIndex - 1) * WHEEL_BAG_CAPACITY
end

function Component:DisplaySlotIndex2WheelSlot(SlotIndex)
  local Avatar = GWorld:GetAvatar()
  if nil == Avatar then
    return nil
  end
  if nil == SlotIndex then
    return nil
  end
  local WheelIndex = self:DisplaySlotIndex2WheelIndex(SlotIndex)
  local CurrentWheel = Avatar.Wheels[self.WheelIndex]
  local Slot = CurrentWheel[WheelIndex]
  return Slot
end

function Component:RefreshPageTurner()
  if 1 == self.DisplayIndex then
    self.PageTurner:PageStart()
  else
    self.PageTurner:PageRight()
  end
end

function Component:UpdatePageTurner()
end

function Component:RefreshCenterTitle(CurrentSlot)
  DebugPrint("gmy@InBattleWheelMenuComponent M:RefreshCenterTitle", CurrentSlot)
  if CurrentSlot then
    local SelectingSlot = self:DisplaySlotIndex2WheelSlot(CurrentSlot)
    if not IsEmptyTable(SelectingSlot) and 0 ~= SelectingSlot.ResourceId then
      local Avatar = GWorld:GetAvatar()
      if Avatar then
        local ResourceItem = Avatar.Resources[SelectingSlot.ResourceId]
        self:SetWheelMiddleStyle(WHEEL_STATE_SELECTING)
        self.Text_Tips:SetText(GText(ResourceItem.ResourceName))
        return
      end
    end
  end
  self:RefreshNonSelectCenter()
end

function Component:RefreshNonSelectCenter()
  if self.bIsMobile then
    self:SetWheelMiddleStyle(WHEEL_STATE_SELECTING)
    if self.DisplayIndex then
      local TitleText = GText("BATTLE_WHEEL_DISPLAY_TITLE" .. self.DisplayIndex)
      self.Text_Tips:SetText(TitleText)
    end
  else
    self:SetWheelMiddleStyle(WHEEL_STATE_NO_SELECTING)
  end
end

function Component:HandleJoystickSelect(LastSlot)
  DebugPrint("gmy@InBattleWheelMenuComponent Component:HandleJoystickSelect", LastSlot)
  local WheelSlot = self:DisplaySlotIndex2WheelSlot(LastSlot)
  DebugPrint("gmy@InBattleWheelMenuComponent Component:HandleJoystickSelect", LastSlot, WheelSlot and WheelSlot.ResourceId)
  if WheelSlot and 0 ~= WheelSlot.ResourceId then
    self:SelectAndCloseMenu(LastSlot)
    if IsValid(self.Owner) then
      self.Owner:Close()
    end
  end
end

function Component:CalcGamepadPointerDiff(Diff)
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  if not PlayerController then
    return
  end
  Diff.X = PlayerController.YawInput
  Diff.Y = -PlayerController.PitchInput
end

return Component
