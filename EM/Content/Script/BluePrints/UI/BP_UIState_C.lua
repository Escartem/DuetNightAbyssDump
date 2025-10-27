require("UnLua")
local BP_UIState_C = Class({
  "BluePrints.UI.BP_EMUserWidget_C",
  "BluePrints.Common.DelayFrameComponent",
  "BluePrints.UI.BP_EMUserWidgetUtils_C"
})

function BP_UIState_C:Initialize(Initializer)
  rawset(self, "IsInit", false)
  rawset(self, "WidgetName", nil)
  rawset(self, "IsUIPopUp", nil)
  rawset(self, "UWidget", nil)
  rawset(self, "HideTags", {})
  rawset(self, "UIStateTag", nil)
  rawset(self, "bIsPauseWorldRendering", nil)
  rawset(self, "ListenEvent", {})
  rawset(self, "IsAllowEscape", false)
  rawset(self, "IsBeginToClose", false)
  rawset(self, "IsMarkToUnload", false)
  rawset(self, "IsGlobalUI", false)
  rawset(self, "IsDestroied", false)
  rawset(self, "IsSetEntitysVisibilityWithAnim", false)
  rawset(self, "IsAddInDeque", false)
end

function BP_UIState_C:EMPreConstruct()
  self.UWidget = self.GetUWidgetSoul and self:GetUWidgetSoul() or self.WidgetTree.RootWidget
  self.WidgetName = self:GetName()
  if not self.GameInputModeSubsystem then
    self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(self)
  end
end

function BP_UIState_C:Construct()
  self.Overridden.Construct(self)
end

function BP_UIState_C:CreateWidgetNew(UIName, ...)
  return UIManager(self):_CreateWidgetNew(UIName)
end

function BP_UIState_C:CreateWidgetAsync(UIName, CoroutineOrCBFunc, ...)
  return UIManager(self):CreateWidgetAsync(UIName, CoroutineOrCBFunc, ...)
end

function BP_UIState_C:LoadUINew(UIName, ...)
  return UIManager(self):LoadUINew(UIName, ...)
end

function BP_UIState_C:SetBaseName(Name)
  self.ConfigName = Name
end

function BP_UIState_C:GetUIConfigName()
  local NameText = self.ConfigName or self.WidgetName
  if NameText then
    return NameText
  end
  return self:GetName()
end

function BP_UIState_C:SetIsPauseWorldRendering(bIsPauseRendering)
  self.bIsPauseWorldRendering = bIsPauseRendering
end

function BP_UIState_C:SetUIStateTag(StateTag)
  self.UIStateTag = StateTag
end

function BP_UIState_C:UpdateArgs(Args)
  self.ExtraArgs = self.ExtraArgs or {}
  for k, v in pairs(Args) do
    self.ExtraArgs[k] = v
  end
  self.IsAllowEscape = self.ExtraArgs.IsAllowEscape
end

function BP_UIState_C:InitUIInfo(Name, IsInUIMode, EventList, ...)
  DebugPrint("Hy@ UIState\229\158\139\231\149\140\233\157\162\230\137\147\229\188\128 InitUIInfo\239\188\140\229\144\141\231\167\176\239\188\154", self:GetUIConfigName())
  self:SetBaseName(Name)
  self:BindInOutAnimationWithConfigParam()
  self.IsInUIMode = IsInUIMode
  if self.IsInUIMode then
    self:SetInputUIOnly(true)
  end
  local Params = {
    ...
  }
  if self.Auto_In ~= nil then
    local WrapFunc
    
    function WrapFunc()
      self:UIOnLoaded(table.unpack(Params))
      self:UnbindFromAnimationFinished(self.Auto_In, {self, WrapFunc})
    end
    
    self:BindToAnimationFinished(self.Auto_In, {self, WrapFunc})
    self:PlayAnimationForward(self.Auto_In)
  else
    self:UIOnLoaded(...)
  end
  if nil ~= EventList then
    for i, v in ipairs(EventList) do
      if type(self[v]) == "function" then
        self:AddDispatcher(v, self, self[v])
      end
    end
  end
end

function BP_UIState_C:BindInOutAnimationWithConfigParam()
  local SystemUIConfig = DataMgr.SystemUI[self:GetUIConfigName()]
  if nil ~= SystemUIConfig and nil ~= SystemUIConfig.IsHideBattleUnit and SystemUIConfig.IsHideBattleUnit ~= UIConst.EnumHideBattleUnitStyle.NormalShowAndHideAll and SystemUIConfig.IsHideBattleUnit ~= UIConst.EnumHideBattleUnitStyle.NormalShowAndHideAllExceptSelf then
    local InAnimation = nil ~= self.In and self.In or self.Auto_In
    local OutAnimation = nil ~= self.Out and self.Out or self.Auto_Out
    if InAnimation then
      self:BindToAnimationStarted(InAnimation, {
        self,
        self.OnInAnimationStarted
      })
      self:BindToAnimationFinished(InAnimation, {
        self,
        self.OnInAnimationFinished
      })
    end
    if OutAnimation then
      self:BindToAnimationStarted(OutAnimation, {
        self,
        self.OnOutAnimationStarted
      })
      self:BindToAnimationFinished(OutAnimation, {
        self,
        self.OnOutAnimationFinished
      })
    end
  end
end

function BP_UIState_C:SetComponent(CompModulePath)
  self.assembledComponents = self.assembledComponents or {}
  if not self.assembledComponents[CompModulePath] then
    self._components = {CompModulePath}
    AssembleComponents(self)
    self.assembledComponents[CompModulePath] = true
  end
end

function BP_UIState_C:UIOnLoaded(...)
  self.IsInit = true
  self:AddInputMethodChangedListen()
  self:OnLoaded(...)
  if self.GameInputModeSubsystem then
    self:OnUpdateUIStyleByInputTypeChange(self.GameInputModeSubsystem:GetCurrentInputType(), self.GameInputModeSubsystem:GetCurrentGamepadName())
  end
end

function BP_UIState_C:OnLoaded(...)
end

function BP_UIState_C:SetUIVisibilityTag(VisibiltyTag, Invisible)
  local IsVisibilityChange = false
  if not IsValid(self) then
    return IsVisibilityChange
  end
  if self.HideTags == nil then
    self.HideTags = {}
  end
  if Invisible then
    self.HideTags[VisibiltyTag] = 1
  else
    self.HideTags[VisibiltyTag] = nil
  end
  local IsHide = not IsEmptyTable(self.HideTags)
  if IsHide then
    if self:GetVisibility() ~= ESlateVisibility.Collapsed then
      if self.bIsActive then
        self:DeactivateWidget()
      else
        self:SetVisibility(UE4.ESlateVisibility.Collapsed)
      end
      SystemGuideManager:HideUIEvent(self.WidgetName)
      IsVisibilityChange = true
    end
  elseif self:GetVisibility() ~= UE4.ESlateVisibility.SelfHitTestInvisible then
    if self.bIsActive then
      self:ActivateWidget()
    else
      self:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    end
    SystemGuideManager:ShowUIEvent(self.WidgetName)
    IsVisibilityChange = true
  end
  return IsVisibilityChange
end

function BP_UIState_C:IsHide()
  if self.HideTags == nil then
    return false
  end
  local IsHide = not IsEmptyTable(self.HideTags)
  return IsHide
end

function BP_UIState_C:ClearAllHideTags()
  self.HideTags = {}
end

function BP_UIState_C:ListenForInputAction(ActionName, EventType, bConsume, Callback)
  if EventType < 0 or EventType > 5 then
    GWorld.logger.error(self.WidgetName .. "\228\184\138\231\187\145\229\174\154\231\154\132" .. ActionName .. "\231\155\145\229\144\172\228\186\139\228\187\182 \232\190\147\229\133\165\231\177\187\229\158\139\230\156\137\233\151\174\233\162\152\239\188\140\232\175\183\230\163\128\230\159\165\230\139\188\229\134\153\239\188\129")
    return
  end
  
  local function ActionCallback()
    local IsBanned = UIManager(self):CheckIsActionBanned(ActionName)
    if not IsBanned then
      Callback[2](Callback[1])
    else
      DebugPrint("Tianyi@ Action: " .. ActionName .. " IsBanned")
    end
  end
  
  self.Overridden.ListenForInputAction(self, ActionName, EventType, bConsume, {
    Callback[1],
    ActionCallback
  })
end

function BP_UIState_C:StopListeningForInputAction(ActionName, EventType)
  if EventType < 0 or EventType > 5 then
    GWorld.logger.error(ActionName .. "\231\154\132stop\231\155\145\229\144\172\228\186\139\228\187\182 \232\190\147\229\133\165\231\177\187\229\158\139\230\156\137\233\151\174\233\162\152\239\188\140\232\175\183\230\163\128\230\159\165\230\139\188\229\134\153\239\188\129")
    return
  end
  self.Overridden.StopListeningForInputAction(self, ActionName, EventType)
end

function BP_UIState_C:UIActionCallback(ActionName, KeyEvent)
  DebugPrint("Tianyi@ UIActionCallback ActionName = " .. ActionName .. " KeyEvent = " .. KeyEvent)
end

function BP_UIState_C:ReceiveEnterState(StackAction)
  self.Overridden.ReceiveEnterState(self, StackAction)
  local UIManager = UIManager(self)
  if UIManager:GetWidgetObjInTopStack() == self then
    if rawget(self, "CurrentCameraViewTarget") ~= nil then
      self:CameraToViewTarget(self.CurrentCameraViewTarget)
    elseif 0 == StackAction then
      rawset(self, "OriginalViewTarget", self:GetOwningPlayer():GetViewTarget())
    end
  end
end

function BP_UIState_C:ReceiveExitState(StackAction)
  local UIManager = UIManager(self)
  if UIManager:GetWidgetObjInTopStack() == self then
    if 1 == StackAction and 1 == UIManager:StateCount() then
      self:DoRecoverCamera()
    else
      self:SetCurrentCameraViewTarget()
    end
  end
  self.Overridden.ReceiveExitState(self, StackAction)
end

function BP_UIState_C:CameraToViewTarget(ViewTarget)
  local Controller = self:GetOwningPlayer()
  if Controller and Controller:GetViewTarget() ~= ViewTarget then
    Controller:SetViewTargetWithBlend(ViewTarget, 0, UE4.EViewTargetBlendFunction.VTBlend_Linear, 0, false)
  end
end

function BP_UIState_C:DoRecoverCamera()
  if IsValid(self.OriginalViewTarget) then
    self:CameraToViewTarget(self.OriginalViewTarget)
  else
    self:CameraToViewTarget(UGameplayStatics.GetPlayerCharacter(self, 0))
  end
end

function BP_UIState_C:OnPreviewKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if (InKeyName == Const.GamepadSpecialLeft or InKeyName == Const.GamepadSpecialRight) and TeamController and TeamController:IsTeamPopupBarOpenInGamepad() then
    DebugPrint(LXYTag, "OnPreviewKeyDown:::\231\187\132\233\152\159\231\155\184\229\133\179\231\154\132\229\188\185\230\157\161\230\173\163\229\156\168\230\137\147\229\188\128...")
    return UIUtils.UnHandled
  end
  if "Enter" == InKeyName or "Gamepad_Special_Left" == InKeyName then
    local SystemUIConfig = DataMgr.SystemUI[self.ConfigName or self.WidgetName] or {}
    if SystemUIConfig.IsChat then
      EventManager:FireEvent(EventID.OpenChatView, InKeyName)
    end
  end
  return UIUtils.Unhandled
end

function BP_UIState_C:OnKeyUp(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if (InKeyName == Const.GamepadSpecialLeft or InKeyName == Const.GamepadSpecialRight) and TeamController and TeamController:IsTeamPopupBarOpenInGamepad() then
    DebugPrint(LXYTag, "OnKeyUp:::\231\187\132\233\152\159\231\155\184\229\133\179\231\154\132\229\188\185\230\157\161\230\173\163\229\156\168\230\137\147\229\188\128...")
    return UIUtils.Unhandled
  end
  local IsEventHandled = false
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) and InKeyName == UIConst.GamePadKey.SpecialLeft then
    local SystemUIConfig = DataMgr.SystemUI[self.ConfigName or self.WidgetName] or {}
    if SystemUIConfig.IsChat then
      IsEventHandled = true
      EventManager:FireEvent(EventID.InterruptChatView)
    end
  end
  if IsEventHandled then
    return UE4.UWidgetBlueprintLibrary.Handled()
  else
    return UE4.UWidgetBlueprintLibrary.UnHandled()
  end
end

function BP_UIState_C:GetUWidget()
  return self.UWidget
end

function BP_UIState_C:SetCurrentCameraViewTarget(ViewTarget)
  if nil == ViewTarget then
    rawset(self, "CurrentCameraViewTarget", self:GetOwningPlayer():GetViewTarget())
  else
    rawset(self, "CurrentCameraViewTarget", ViewTarget)
  end
end

function BP_UIState_C:GetCurrentCameraViewTarget()
  return rawget(self, "CurrentCameraViewTarget")
end

function BP_UIState_C:IsUIVisible()
  return self:IsVisible()
end

function BP_UIState_C:RawSeek(Nodekey)
  return self:SeekWidgetByName(Nodekey)
end

function BP_UIState_C:Seek(Nodekey, WrapType)
  local WidgetObj
  if nil ~= WrapType then
    local Obj = self:SeekWidgetByName(Nodekey)
    WidgetObj = WrapType:New(Obj)
  else
    WidgetObj = self:SeekWidgetByName(Nodekey)
  end
  return WidgetObj
end

function BP_UIState_C:GetWorldPosition(Widget)
  return self.Overridden.GetWorldPosition(self, Widget)
end

function BP_UIState_C:SetWorldPosition(Widget, Pos)
  if nil == Widget then
    return
  end
  Widget:SetRenderTranslation(Pos)
end

function BP_UIState_C:PauseAnimByName(AnimName)
  local Animation = self:GetAnimationByName(AnimName)
  if nil ~= Animation then
    self:PauseAnimation(Animation)
  end
end

function BP_UIState_C:StopAnimByName(AnimName)
  local Animation = self:GetAnimationByName(AnimName)
  if nil ~= Animation then
    self:StopAnimation(Animation)
  end
end

function BP_UIState_C:IsSpecialAnimPlaying(AnimName)
  local Animation = self:GetAnimationByName(AnimName)
  if nil ~= Animation then
    return self:IsAnimationPlaying(Animation)
  end
  return false
end

function BP_UIState_C:SetInputUIOnly(IsUIOnly)
  local PreMode, CurMode, CurDeviceType = "PreMode", "CurMode", CommonUtils.GetDeviceTypeByPlatformName(self)
  if not self.GameInputModeSubsystem then
    self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(self)
  end
  PreMode = self.GameInputModeSubsystem:GetCurrentInputMode()
  local UINameText = self.WidgetName or self.ConfigName
  if IsUIOnly then
    local Params = FGameInputModeParams()
    if self.bIsFocusable then
      Params.WidgetToFocus = self
    end
    if CurDeviceType == CommonConst.CLIENT_DEVICE_TYPE.PC then
      Params.bShowMouseCursor = true
    end
    Params.MouseLockMode = EMouseLockMode.DoNotLock
    self.GameInputModeSubsystem:EnableInputMode(UINameText, EGameInputMode.UI, Params)
  else
    self.GameInputModeSubsystem:DisableInputMode(UINameText)
  end
  CurMode = self.GameInputModeSubsystem:GetCurrentInputMode()
  if PreMode ~= CurMode then
    DebugPrint("InputModeChange => PreMode:" .. PreMode .. "," .. "CurMode:" .. CurMode .. " The Reason UIName is " .. UINameText)
    EventManager:FireEvent(EventID.SetInputMode, IsUIOnly)
  end
end

function BP_UIState_C:Hide(HideTag)
  if self.IsMarkToUnload then
    DebugPrint("Hy@==UIState\229\158\139\231\149\140\233\157\162\231\167\187\233\153\164\229\189\147\229\184\167\233\156\128\232\166\129Hide\239\188\140\231\155\180\230\142\165\229\191\189\231\149\165", self:GetUIConfigName())
    return
  end
  if self.IgnoreHideTags and CommonUtils.HasValue(self.IgnoreHideTags, HideTag) then
    return
  end
  HideTag = HideTag or UIConst.CommonHideTagName.DefaultTag
  local IsVisibilityChange = self:SetUIVisibilityTag(HideTag, true)
  if IsVisibilityChange then
    AudioManager(self):PauseObjectAllEvent(self, true)
    if self.IsInUIMode then
      self:SetInputUIOnly(false)
    end
    if self.bIsPauseWorldRendering then
      UIManager(self):SetPauseWorldRenderingSwitch(self.ConfigName, false)
    end
    if self.IsUIPopUp == true and HideTag ~= UIConst.CommonHideTagName.UIStackChange then
      UIManager(self):OpenResidentUI(self.WidgetName)
    end
    if self.IsStopGame then
      self:UISetGamePaused(self.WidgetName or self.ConfigName, false)
    end
    if self.KeyboardSetName and self.IsBanningAction then
      UIManager(self):SetBannedActionCallback(self.KeyboardSetName, false, self:GetName())
      self.IsBanningAction = nil
    end
  end
end

function BP_UIState_C:Show(ShowTag)
  if self.IsMarkToUnload then
    DebugPrint("Hy@==UIState\229\158\139\231\149\140\233\157\162\231\167\187\233\153\164\229\189\147\229\184\167\233\156\128\232\166\129Show\239\188\140\231\155\180\230\142\165\229\191\189\231\149\165", self:GetUIConfigName())
    return
  end
  ShowTag = ShowTag or UIConst.CommonHideTagName.DefaultTag
  local IsVisibilityChange = self:SetUIVisibilityTag(ShowTag, false)
  if IsVisibilityChange then
    AudioManager(self):PauseObjectAllEvent(self, false)
    if self.IsInUIMode then
      self:SetInputUIOnly(true)
    end
    if self.bIsPauseWorldRendering then
      UIManager(self):SetPauseWorldRenderingSwitch(self.ConfigName, true)
    end
    if self.IsUIPopUp == true and ShowTag ~= UIConst.CommonHideTagName.UIStackChange then
      UIManager(self):CloseResidentUI(self.WidgetName)
    end
    if self.IsStopGame then
      self:UISetGamePaused(self.WidgetName or self.ConfigName, true)
    end
    if self.KeyboardSetName and not self.IsBanningAction then
      UIManager(self):SetBannedActionCallback(self.KeyboardSetName, true, self:GetName())
      self.IsBanningAction = true
    end
  end
end

function BP_UIState_C:OnInAnimationStarted()
  local SystemUIConfig = DataMgr.SystemUI[self:GetUIConfigName()]
  self:DealWithBattleUnitVisibility(SystemUIConfig.IsHideBattleUnit, true, "AnimStart")
end

function BP_UIState_C:OnInAnimationFinished()
  local SystemUIConfig = DataMgr.SystemUI[self:GetUIConfigName()]
  self:DealWithBattleUnitVisibility(SystemUIConfig.IsHideBattleUnit, true, "AnimFinished")
end

function BP_UIState_C:OnOutAnimationStarted()
  local IsSecondaryUI = UIManager(self):StateCount() > 1
  if not IsSecondaryUI then
    local MenuWorld = UIManager(self):GetUIObj(UIConst.MenuWorld)
    if not MenuWorld then
      UIUtils.CheckAndPlayBattleMainInAnim(self:GetUIConfigName())
    end
  end
  local SystemUIConfig = DataMgr.SystemUI[self:GetUIConfigName()]
  self:DealWithBattleUnitVisibility(SystemUIConfig.IsHideBattleUnit, false, "AnimStart")
end

function BP_UIState_C:OnOutAnimationFinished()
  local SystemUIConfig = DataMgr.SystemUI[self:GetUIConfigName()]
  self:DealWithBattleUnitVisibility(SystemUIConfig.IsHideBattleUnit, false, "AnimFinished")
end

function BP_UIState_C:DealWithBattleUnitVisibility(HideBattleUnitType, bHideOrShow, AnimType)
  self.IsSetEntitysVisibilityWithAnim = bHideOrShow
  if HideBattleUnitType == UIConst.EnumHideBattleUnitStyle.DelayHideAll or HideBattleUnitType == UIConst.EnumHideBattleUnitStyle.DelayHideAllExceptSelf then
    if "AnimFinished" == AnimType then
      UIManager(self):SetEntitiesVisibility(self:GetUIConfigName(), HideBattleUnitType - 12 == UIConst.EnumHideBattleUnitStyle.NormalShowAndHideAll, HideBattleUnitType - 12 == UIConst.EnumHideBattleUnitStyle.NormalShowAndHideAllExceptSelf, bHideOrShow)
    end
  elseif (HideBattleUnitType == UIConst.EnumHideBattleUnitStyle.InstantShowAll or HideBattleUnitType == UIConst.EnumHideBattleUnitStyle.InstantShowAllExceptSelf) and "AnimStart" == AnimType then
    UIManager(self):SetEntitiesVisibility(self:GetUIConfigName(), HideBattleUnitType - 10 == UIConst.EnumHideBattleUnitStyle.NormalShowAndHideAll, HideBattleUnitType - 10 == UIConst.EnumHideBattleUnitStyle.NormalShowAndHideAllExceptSelf, bHideOrShow)
  end
end

function BP_UIState_C:Close()
  if not self or not IsValid(self) then
    return
  end
  DebugPrint("Hy@ UIState\229\158\139\231\149\140\233\157\162\229\133\179\233\151\173 Close\239\188\140\229\144\141\231\167\176\239\188\154", self:GetUIConfigName())
  if not self.IsInit then
    return
  end
  self.IsBeginToClose = true
  if self.Auto_Out then
    self:BindToAnimationFinished(self.Auto_Out, {
      self,
      self.RealClose
    })
    self:PlayAnimationForward(self.Auto_Out)
  else
    self:RealClose()
  end
end

function BP_UIState_C:RealClose()
  self.IsMarkToUnload = true
  if self.GamePausedHandle then
    self:RemoveTimer(self.GamePausedHandle)
    self.GamePausedHandle = nil
  end
  self:UnbindFromAnimationFinished(self.Auto_Out, {
    self,
    self.RealClose
  })
  if self.KeyboardSetName and self.IsBanningAction then
    UIManager(self):SetBannedActionCallback(self.KeyboardSetName, false, self:GetName())
    self.IsBanningAction = nil
  end
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self) or GWorld.GameInstance
  local UIManager = GameInstance:GetGameUIManager()
  if nil ~= UIManager then
    UIManager:UnLoadUI(self.ConfigName, self.WidgetName)
  end
end

function BP_UIState_C:DestroyObject()
  self.Overridden.DestroyObject(self)
end

function BP_UIState_C:Destruct()
  AudioManager(self):PauseObjectAllEvent(self, false)
  AudioManager(self):StopObjectAllSound(self)
  self.IsInit = false
  if rawget(self, "bIsFrequentlyUI") then
    self.IsDestroied = true
  end
  if self.IsInUIMode then
    self:SetInputUIOnly(false)
  end
  if self.bIsPauseWorldRendering then
    UIManager(self):SetPauseWorldRenderingSwitch(self.ConfigName, false)
  end
  if rawget(self, "IsStopGame") then
    self:UISetGamePaused(self.WidgetName or self.ConfigName, false)
    self.IsStopGame = nil
  end
  if rawget(self, "IsSetEntitysVisibilityWithAnim") then
    UIManager(self):SetEntitiesVisibility(self:GetUIConfigName(), true, true, false)
  end
  if rawget(self, "GlobalGameUITag") then
    local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
    local GlobalTag = GameInstance:GetGlobalGameUITag()
    if GlobalTag == self.GlobalGameUITag then
      local allUI = UIManager(self).UIInstances:ToTable()
      local TopUI, MaxZOrder
      for _, widget in pairs(allUI) do
        if widget:IsInViewport() and widget.GlobalGameUITag and self ~= widget and (nil == MaxZOrder or MaxZOrder < widget:GetZOrder()) then
          MaxZOrder = widget:GetZOrder()
          TopUI = widget
        end
      end
      if TopUI then
        GameInstance:SetGlobalGameUITag(TopUI.GlobalGameUITag)
      else
        GameInstance:SetGlobalGameUITag("")
      end
    end
  end
  self:RemoveAllDispatcher()
  self:CleanTimer()
  self.Overridden.Destruct(self)
end

function BP_UIState_C:CheckIsFrequentlyUI()
  return self.bIsFrequentlyUI
end

function BP_UIState_C:SetIsFrequentlyUI(bIsFrequentlyUI)
  self.bIsFrequentlyUI = bIsFrequentlyUI
end

function BP_UIState_C:SetGamePausedDelay(DelayTime)
  self.GamePausedDelayTime = DelayTime
end

function BP_UIState_C:UISetGamePaused(UIName, IsPause)
  if nil == UIName then
    return
  end
  if IsStandAlone(self) then
    local GameMode = UE4.UGameplayStatics.GetGameMode(self)
    if GameMode and GameMode.SetGamePaused then
      GameMode:SetGamePaused(UIName, IsPause)
    end
    UIManager(self):SetUIPauseGame(UIName, IsPause)
    EventManager:FireEvent(EventID.OnUIPauseGame)
  end
end

function BP_UIState_C:BlockAllUIInput(bBlock, Reason)
  self:BlockAllUIInput_CPP(bBlock, Reason or self.WidgetName)
end

function BP_UIState_C:OnFocusReceived(MyGeometry, InFocusEvent)
  DebugPrint("BP_UIState_C OnFocusReceived, UIName is", self:GetUIConfigName())
  return UIUtils.Handle
end

function BP_UIState_C:HasAnyFocus()
  return self:HasAnyUserFocus() or self:HasFocusedDescendants()
end

function BP_UIState_C:NavigateToDefaultWidget(bIsDelaySet)
  if not self.GameInputModeSubsystem then
    self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(self)
  end
  
  local function SetToDesiredFocusWidget()
    if self.GameInputModeSubsystem:GetCurrentInputType() == ECommonInputType.Gamepad then
      local DefaultFocusWidget = self:GetDesiredFocusTarget()
      if nil ~= DefaultFocusWidget then
        DebugPrint("BP_UIState_C OnFocusReceived, DefaultFocusWidget is", DefaultFocusWidget:GetName())
        DefaultFocusWidget:SetFocus()
      end
    end
  end
  
  if bIsDelaySet then
    self:AddTimer(0.1, SetToDesiredFocusWidget, false, 0, "SetToDesiredFocusWidget")
  else
    SetToDesiredFocusWidget()
  end
end

function BP_UIState_C:OnKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if (InKeyName == Const.GamepadSpecialLeft or InKeyName == Const.GamepadSpecialRight) and TeamController and TeamController:IsTeamPopupBarOpenInGamepad() then
    DebugPrint(LXYTag, "OnKeyDown:::\231\187\132\233\152\159\231\155\184\229\133\179\231\154\132\229\188\185\230\157\161\230\173\163\229\156\168\230\137\147\229\188\128...")
    return UIUtils.Unhandled
  end
  if ("Escape" == InKeyName or "Android_Back" == InKeyName) and self.IsAllowEscape then
    if not self.IsBeginToClose and self.IsInit then
      self:Close()
    end
    return UIUtils.Handle
  end
  return UIUtils.Unhandled
end

function BP_UIState_C:HideAllChildrenNode(ParentNode, IsExcludeSelf, bHide)
  local VisiblityOp = bHide and UIConst.VisibilityOp.Collapsed or UIConst.VisibilityOp.SelfHitTestInvisible
  local AllChildren = ParentNode:GetAllChildren()
  for i = 1, AllChildren:Length() do
    local ChildItem = AllChildren:GetRef(i)
    ChildItem:SetVisibility(VisiblityOp)
  end
  if IsExcludeSelf then
    ParentNode:SetVisibility(VisiblityOp)
  end
end

function BP_UIState_C:HideAllUIWithOutSelf(IsHide, Tag, bRadio)
  local ExceptUIName = TSet(FName)
  ExceptUIName:Add(self.WidgetName or self.ConfigName)
  UIManager(self):HideAllUI_EX(ExceptUIName, IsHide, Tag, bRadio)
end

function BP_UIState_C:SequenceEvent_PlayUISound(EventPath, EventKey)
  AudioManager(self):PlayUISound(self, EventPath, nil, nil)
end

function BP_UIState_C:CloseAfterAutoIn()
  if self.Auto_In ~= nil then
    self:BindToAnimationFinished(self.Auto_In, {
      self,
      self.Close
    })
  end
end

return BP_UIState_C
