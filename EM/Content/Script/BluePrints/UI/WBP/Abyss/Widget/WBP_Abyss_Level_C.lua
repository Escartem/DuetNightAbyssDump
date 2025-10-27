local WBP_Abyss_Level = Class("BluePrints.UI.BP_EMUserWidget_C")

function WBP_Abyss_Level:Construct()
  self.Btn_Click.OnClicked:Add(self, self.OnBtnClicked)
  self.Btn_Click.OnHovered:Add(self, self.OnBtnHovered)
  self.Btn_Click.OnUnhovered:Add(self, self.OnBtnUnhovered)
  self.Btn_Click.OnPressed:Add(self, self.OnBtnPressed)
  self.Btn_Click.OnReleased:Add(self, self.OnBtnReleased)
  self:BindToAnimationFinished(self.Click, {
    self,
    function()
      if self.IsHovering then
        self:OnBtnHovered()
      end
    end
  })
  self.IsTipMode = false
  local ConfigData = {}
  ConfigData.OwnerWidget = self
  ConfigData.MenuPlacement = EMenuPlacement.MenuPlacement_CenteredAboveAnchor
  
  function ConfigData.SoundFunc()
    AudioManager(self):PlayUISound(nil, "event:/ui/common/click_btn_small", nil, nil)
  end
  
  ConfigData.TextContent = GText("Abyss_InfiniteNode_Tips")
  self.Btn_Qa:SetVisibility(UIConst.VisibilityOp.Visible)
  self.Btn_Qa:Init(ConfigData)
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
  if IsValid(self.GameInputModeSubsystem) then
    self:RefreshOpInfoByInputDevice(self.GameInputModeSubsystem:GetCurrentInputType(), self.GameInputModeSubsystem:GetCurrentGamepadName())
  end
  self:InitListenEvent()
  self:InitWidgetInfoInGamePad()
end

function WBP_Abyss_Level:Destruct()
  self:ClearListenEvent()
end

function WBP_Abyss_Level:OnListItemObjectSet(Content)
  if self.Content then
    if self.Content.IsLastNormalLevel then
      self:SetNavigationRuleBase(EUINavigation.Down, EUINavigationRule.Escape)
    elseif self.Content.IsNodeLevel then
      self:SetNavigationRuleBase(EUINavigation.Up, EUINavigationRule.Escape)
    end
  end
  self.Content = Content
  self.Content.Entry = self
  self.AbyssId = Content.AbyssId
  self.AbyssLevelId = Content.AbyssLevelId
  self.Index = Content.Index
  self.IsEndless = Content.IsEndless
  self.IsLocked = Content.IsLocked
  self.IsReceive = false
  self.SumLevelStar = Content.SumLevelStar
  self.GotLevelStar = Content.GotLevelStar
  self.IsJumpTip = Content.IsJumpTip
  self.Root = Content.Root
  local AbyssType = DataMgr.AbyssSeason[self.AbyssId].AbyssType
  self.WS_BackGround:SetActiveWidgetIndex(AbyssType - 1)
  self:StopAllBtnAnimations()
  if self.Root.AbyssLevelPlayInAnimation then
    self:PlayAnimation(self.In)
  end
  if self.IsJumpTip then
    self.WS_Type:SetActiveWidgetIndex(1)
    return
  else
    self.WS_Type:SetActiveWidgetIndex(0)
  end
  if self.Content.PlayNodeLevelUnlockAnimation then
    self:PlayAnimation(self.Unlock)
    local EMCache = require("EMCache.EMCache")
    EMCache:Set("LastUnlockNodeLevel", self.Index)
    self.Content.PlayNodeLevelUnlockAnimation = false
  end
  if self.Content.IsLastNormalLevel then
    self.Panel_Node:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self:SetNavigationRuleCustom(EUINavigation.Down, {
      self,
      self.NavigateToNodeLevel
    })
  elseif self.Content.IsNodeLevel then
    self.Panel_Node:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    self.Text_Node:SetText(string.format(GText("Abyss_InfiniteNode"), tostring(self.Content.NodeIndex)))
    self:SetNavigationRuleCustom(EUINavigation.Up, {
      self,
      self.NavigateToLastNormalLevel
    })
  else
    self.Panel_Node:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  self:BindEventOnClicked(self.Content.Root, self.Content.Root.OnClickedAbyssLevelCell, self)
  self.Text_LevelName:SetText(string.format(GText("Abyss_LevelName"), self.Index))
  self.Text_Now:SetText(self.GotLevelStar)
  self.Text_All:SetText(self.SumLevelStar)
  if self.IsEndless then
    self.Switch_Mode:SetActiveWidgetIndex(1)
  else
    self.Switch_Mode:SetActiveWidgetIndex(0)
    self.Text_LevelNum:SetText(EnText("UI_Chardata_Data_Num_" .. self.Index))
  end
  if self.IsEndless and self.Index == self.Root.MaxLevelNum then
    self.Panel_More:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  else
    self.Panel_More:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  if self.IsLocked then
    self.IsReceive = false
    self.Lock:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    self.Reward:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.Received:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self:PlayAnimation(self.Locked)
  else
    self.Lock:SetVisibility(UIConst.VisibilityOp.Collapsed)
    if self.GotLevelStar == self.SumLevelStar then
      self.IsReceive = true
      self.Reward:SetVisibility(UIConst.VisibilityOp.Collapsed)
      self.Received:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
      self:PlayAnimation(self.Receive)
    else
      self.IsReceive = false
      self.Reward:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
      self.Received:SetVisibility(UIConst.VisibilityOp.Collapsed)
      self:PlayAnimation(self.UnLock_Normal)
    end
  end
end

function WBP_Abyss_Level:BindEventOnClicked(Obj, Func, ...)
  if not Obj or not Func then
    return
  end
  self.Obj = Obj
  self.Func = Func
  self.Params = {
    ...
  }
end

function WBP_Abyss_Level:OnBtnClicked()
  if self.IsLocked then
    AudioManager(self):PlayUISound(nil, "event:/ui/common/click_btn_disable", nil, nil)
  else
    AudioManager(self):PlayUISound(nil, "event:/ui/activity/drama_chapter_btn_click", nil, nil)
  end
  self:StopAllBtnAnimations()
  self:PlayAnimation(self.Click)
  if self.Obj and self.Func then
    self.Func(self.Obj, table.unpack(self.Params))
  end
end

function WBP_Abyss_Level:OnBtnHovered()
  if not self.IsLocked then
    AudioManager(self):PlayUISound(nil, "event:/ui/activity/drama_chapter_btn_hover", nil, nil)
  end
  self.IsHovering = true
  if self.IsReceive then
    self:PlayAnimation(self.Receive)
  elseif self.IsLocked then
    self:PlayAnimation(self.Locked)
  else
    self:PlayAnimation(self.UnLock_Normal)
  end
  self:PlayAnimation(self.Hover)
end

function WBP_Abyss_Level:OnBtnUnhovered()
  self.IsHovering = false
  if not self.IsPressing then
    self:StopAllBtnAnimations()
    self:PlayAnimation(self.Unhover)
  end
end

function WBP_Abyss_Level:OnBtnPressed()
  self.IsPressing = true
  self:StopAllBtnAnimations()
  self:PlayAnimation(self.Press)
end

function WBP_Abyss_Level:OnBtnReleased()
  self.IsPressing = false
  if not self.IsHovering then
    self:StopAllBtnAnimations()
    self:PlayAnimationReverse(self.Press)
  else
    self:StopAllBtnAnimations()
    if self.IsReceive then
      self:PlayAnimation(self.Receive)
    elseif self.IsLocked then
      self:PlayAnimation(self.Locked)
    else
      self:PlayAnimation(self.UnLock_Normal)
    end
  end
end

function WBP_Abyss_Level:StopAllBtnAnimations()
  self:StopAnimation(self.Normal)
  self:StopAnimation(self.UnLock_Normal)
  self:StopAnimation(self.Receive)
  self:StopAnimation(self.Press)
  self:StopAnimation(self.Unhover)
  self:StopAnimation(self.Hover)
  self:StopAnimation(self.Click)
end

function WBP_Abyss_Level:BP_GetDesiredFocusTarget()
  self.IsTipMode = false
  self.Content.Root:TryChangeCurFocusedMissionList(self)
  return self.Btn_Click
end

function WBP_Abyss_Level:NavigateToNodeLevel()
  return self.Content.Root:NavigateToNodeLevel(self)
end

function WBP_Abyss_Level:NavigateToLastNormalLevel()
  return self.Content.Root:NavigateToLastNormalLevel(self)
end

function WBP_Abyss_Level:InitListenEvent()
  if IsValid(self.GameInputModeSubsystem) then
    self.GameInputModeSubsystem.OnInputMethodChanged:Add(self, self.RefreshOpInfoByInputDevice)
  end
end

function WBP_Abyss_Level:ClearListenEvent()
  if IsValid(self.GameInputModeSubsystem) then
    self.GameInputModeSubsystem.OnInputMethodChanged:Remove(self, self.RefreshOpInfoByInputDevice)
  end
end

function WBP_Abyss_Level:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  if CurInputDevice == ECommonInputType.Touch then
    return
  end
  local IsUseKeyAndMouse = CurInputDevice == ECommonInputType.MouseAndKeyboard
  self:UpdateUIStyleInPlatform(IsUseKeyAndMouse)
end

function WBP_Abyss_Level:UpdateUIStyleInPlatform(IsUseKeyAndMouse)
  if IsUseKeyAndMouse then
    self:InitKeyboardView()
  else
    self:InitGamepadView()
  end
end

function WBP_Abyss_Level:InitGamepadView()
end

function WBP_Abyss_Level:InitKeyboardView()
  self.Key_Controller_Qa:SetVisibility(UIConst.VisibilityOp.Collapsed)
end

function WBP_Abyss_Level:InitWidgetInfoInGamePad()
  self.Key_Controller_Qa:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "LS"}
    }
  })
end

function WBP_Abyss_Level:OnKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local IsEventHandled = false
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) and "Gamepad_LeftThumbstick" == InKeyName then
    IsEventHandled = true
    if self.IsTipMode then
      self:LeaveTipMode()
    else
      self:EnterTipMode()
    end
  else
  end
  if IsEventHandled then
    return UE4.UWidgetBlueprintLibrary.Handled()
  else
    return UE4.UWidgetBlueprintLibrary.UnHandled()
  end
end

function WBP_Abyss_Level:EnterTipMode()
  self.IsTipMode = true
  self.Btn_Qa:OnViewInfoClick(true)
end

function WBP_Abyss_Level:LeaveTipMode()
  self.IsTipMode = false
  self.Btn_Qa:OnViewInfoClick(false)
end

function WBP_Abyss_Level:HideIcon()
  if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
    self.Key_Controller_Qa:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

function WBP_Abyss_Level:ShowIcon()
  if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
    self.Key_Controller_Qa:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  end
end

return WBP_Abyss_Level
