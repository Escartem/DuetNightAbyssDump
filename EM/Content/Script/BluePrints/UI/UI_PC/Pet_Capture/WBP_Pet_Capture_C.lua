require("UnLua")
local PetBehavior = {
  Happy = "Happy",
  Upset = "Upset",
  Hello = "Hello",
  Idle = "Idle"
}
local WBP_Pet_Capture_C = Class("BluePrints.UI.BP_UIState_C")

function WBP_Pet_Capture_C:Construct()
  self.Btn_Confirm:BindEventOnClicked(self, self.OnConfirmClicked)
  self.Btn_Confirm:SetDefaultGamePadImg("X")
  self.Btn_Confirm:SetText(GText("UI_PATCH_ENSURE"))
  self.Text_Choose:SetText(GText("UI_Pet_ChooseSnacks"))
  if self.Key_Throw then
    self.Key_Throw:CreateCommonKey({
      KeyInfoList = {
        {Type = "Text", Text = "SpaceBar"}
      }
    })
  end
  if self.Key_Controller_Throw then
    self.Key_Controller_Throw:CreateCommonKey({
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "A"}
      }
    })
  end
  local ThrowText = CommonUtils.GetDeviceTypeByPlatformName(self) ~= "Mobile" and "UI_Pet_ThrowFood_PC" or "UI_Pet_ThrowFood_Phone"
  self.Text_Throw:SetText(GText(ThrowText))
  self.Button_Throw.OnClicked:Add(self, self.ThrowSnack)
  self.Snack_Green.Button_Area.OnClicked:Add(self, self.OnSelectSnackClicked1)
  self.Snack_Blue.Button_Area.OnClicked:Add(self, self.OnSelectSnackClicked2)
  self.Snack_Purple.Button_Area.OnClicked:Add(self, self.OnSelectSnackClicked3)
  self.Snack_Gold.Button_Area.OnClicked:Add(self, self.OnSelectSnackClicked4)
  self:InitSnackButton(self.Snack_Green, 0)
  self:InitSnackButton(self.Snack_Blue, DataMgr.GlobalConstant.ItemIDPetFoodLV1.ConstantValue)
  self:InitSnackButton(self.Snack_Purple, DataMgr.GlobalConstant.ItemIDPetFoodLV2.ConstantValue)
  self:InitSnackButton(self.Snack_Gold, DataMgr.GlobalConstant.ItemIDPetFoodLV3.ConstantValue)
  self.SnackClickMap = {}
  self.SnackClickMap[self.Snack_Green] = {}
  self.SnackClickMap[self.Snack_Blue] = {}
  self.SnackClickMap[self.Snack_Purple] = {}
  self.SnackClickMap[self.Snack_Gold] = {}
  self:AddDispatcher(EventID.CharDie, self, self.OnPlayerDead)
end

function WBP_Pet_Capture_C:Destruct()
  self:ClearAllButtonEvent(self.Snack_Purple)
  self:ClearAllButtonEvent(self.Snack_Blue)
  self:ClearAllButtonEvent(self.Snack_Green)
  self:ClearAllButtonEvent(self.Snack_Gold)
  self.Button_Throw.OnClicked:Clear()
  WBP_Pet_Capture_C.Super.Destruct(self)
end

function WBP_Pet_Capture_C:ClearAllButtonEvent(ButtonArea)
  ButtonArea.Button_Area.OnClicked:Clear()
  ButtonArea.Button_Area.OnHovered:Clear()
  ButtonArea.Button_Area.OnUnhovered:Clear()
  ButtonArea.Button_Area.OnPressed:Clear()
  ButtonArea.Button_Area.OnReleased:Clear()
  ButtonArea:UnbindAllFromAnimationFinished(ButtonArea.UnHover)
end

function WBP_Pet_Capture_C:OnLoaded(Owner)
  self:SetFocus()
  self.Super.OnLoaded(self)
  self.PetId = Owner.UnitId
  self.PetData = DataMgr.Pet[self.PetId]
  self.Owner = Owner
  self.ArrowValue = -298
  self.CurPetModelId = Owner:GetCharModelComponent():GetCurrentModelId()
  self.OriginPetModelId = self.CurPetModelId
  self.PetCaptureInteractive = self.Owner.PetNpcGameComponent
  self.Color_Bar.Color_Gauge:SetVisibility(ESlateVisibility.Collapsed)
  self.Color_Bar.Panel_Select:SetVisibility(ESlateVisibility.Collapsed)
  self.Panel_Tip:SetVisibility(ESlateVisibility.Collapsed)
  self.Btn_Confirm:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  self.Panel_Snacks:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  self.Panel_Text:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  self.Color_Bar.Text_Name:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  self.Color_Bar.List_Star:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  self.Color_Bar.Panel_Attribute:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  self.Color_Bar.Text_Name:SetText(GText(self.PetData.Name))
  self.Text_Probability:SetText(GText("UI_Pet_SuccessRate"))
  local Rarity = self.PetData.Rarity
  self.Color_Bar.List_Star:ClearListItems()
  for i = 1, Rarity do
    local Obj = NewObject(UIUtils.GetCommonItemContentClass())
    self.Color_Bar.List_Star:AddItem(Obj)
  end
  local PetType = 1 == self.PetData.PetType and "Pet_BattlePet" or "Pet_ResourcePet"
  self.Color_Bar.Text_Activation:SetText(GText(PetType))
  self.Color_Bar.Text_Inactivation:SetText(GText(PetType))
  self.Color_Bar.WS_Attribute:SetActiveWidgetIndex(1 == self.PetData.PetType and 0 or 1)
  AudioManager(self):PlayUISound(self, "event:/ui/armory/open_pet_idle", "PetIdle", nil)
  AudioManager(self):PlayUISound(self, "event:/ui/armory/open", "OpenPetCapture", nil)
  self:PlayAnimation(self.In)
  self:InitTabInfo()
  self:InitSnacks()
  self:SwitchCamera(false)
  self:InitGamepadUI()
  self.SelectStart = false
  self.ExistReason = 3
  self:PlayPetVoice(PetBehavior.Hello)
end

function WBP_Pet_Capture_C:InitGamepadUI()
  local bIsMobile = CommonUtils.GetDeviceTypeByPlatformName(self) == "Mobile"
  if bIsMobile then
    return
  end
  local GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(self)
  local IsGamePad = GameInputModeSubsystem and GameInputModeSubsystem:GetCurrentInputType() == ECommonInputType.Gamepad
  self.Key_Controller_L:SetVisibility(ESlateVisibility.Collapsed)
  self.Key_Controller_R:SetVisibility(ESlateVisibility.Collapsed)
  self.Key_Controller_Check:SetVisibility(ESlateVisibility.Collapsed)
  self.WS_Type:SetActiveWidgetIndex(IsGamePad and 1 or 0)
  self.Snack_Green.Button_Area:SetFocus()
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
  self.Snack_Green.Button_Area:SetFocus()
  self.CurFocusWidget = self.Snack_Green.Button_Area
  self.Snack_Green.Button_Area:SetNavigationRuleCustom(EUINavigation.Up, {
    self,
    function()
      self.CurFocusWidget = self.Snack_Green.Item_Snacks
      return self.Snack_Green.Item_Snacks
    end
  })
  self.Snack_Blue.Button_Area:SetNavigationRuleCustom(EUINavigation.Up, {
    self,
    function()
      self.CurFocusWidget = self.Snack_Blue.Item_Snacks
      return self.Snack_Blue.Item_Snacks
    end
  })
  self.Snack_Purple.Button_Area:SetNavigationRuleCustom(EUINavigation.Up, {
    self,
    function()
      self.CurFocusWidget = self.Snack_Purple.Item_Snacks
      return self.Snack_Purple.Item_Snacks
    end
  })
  self.Snack_Gold.Button_Area:SetNavigationRuleCustom(EUINavigation.Up, {
    self,
    function()
      self.CurFocusWidget = self.Snack_Gold.Item_Snacks
      return self.Snack_Gold.Item_Snacks
    end
  })
  self.Snack_Green.Button_Area:SetNavigationRuleCustom(EUINavigation.Right, {
    self,
    function()
      self.CurFocusWidget = self.Snack_Blue.Button_Area
      return self.Snack_Blue.Button_Area
    end
  })
  self.Snack_Blue.Button_Area:SetNavigationRuleCustom(EUINavigation.Left, {
    self,
    function()
      self.CurFocusWidget = self.Snack_Green.Button_Area
      return self.Snack_Green.Button_Area
    end
  })
  self.Snack_Blue.Button_Area:SetNavigationRuleCustom(EUINavigation.Right, {
    self,
    function()
      self.CurFocusWidget = self.Snack_Purple.Button_Area
      return self.Snack_Purple.Button_Area
    end
  })
  self.Snack_Purple.Button_Area:SetNavigationRuleCustom(EUINavigation.Left, {
    self,
    function()
      self.CurFocusWidget = self.Snack_Blue.Button_Area
      return self.Snack_Blue.Button_Area
    end
  })
  self.Snack_Purple.Button_Area:SetNavigationRuleCustom(EUINavigation.Right, {
    self,
    function()
      self.CurFocusWidget = self.Snack_Gold.Button_Area
      return self.Snack_Gold.Button_Area
    end
  })
  self.Snack_Gold.Button_Area:SetNavigationRuleCustom(EUINavigation.Left, {
    self,
    function()
      self.CurFocusWidget = self.Snack_Purple.Button_Area
      return self.Snack_Purple.Button_Area
    end
  })
  self.Snack_Green.Item_Snacks:SetNavigationRuleCustom(EUINavigation.Right, {
    self,
    function()
      self.CurFocusWidget = self.Snack_Blue.Item_Snacks
      return self.Snack_Blue.Item_Snacks
    end
  })
  self.Snack_Blue.Item_Snacks:SetNavigationRuleCustom(EUINavigation.Left, {
    self,
    function()
      self.CurFocusWidget = self.Snack_Green.Item_Snacks
      return self.Snack_Green.Item_Snacks
    end
  })
  self.Snack_Blue.Item_Snacks:SetNavigationRuleCustom(EUINavigation.Right, {
    self,
    function()
      self.CurFocusWidget = self.Snack_Purple.Item_Snacks
      return self.Snack_Purple.Item_Snacks
    end
  })
  self.Snack_Purple.Item_Snacks:SetNavigationRuleCustom(EUINavigation.Left, {
    self,
    function()
      self.CurFocusWidget = self.Snack_Blue.Item_Snacks
      return self.Snack_Blue.Item_Snacks
    end
  })
  self.Snack_Purple.Item_Snacks:SetNavigationRuleCustom(EUINavigation.Right, {
    self,
    function()
      self.CurFocusWidget = self.Snack_Gold.Item_Snacks
      return self.Snack_Gold.Item_Snacks
    end
  })
  self.Snack_Gold.Item_Snacks:SetNavigationRuleCustom(EUINavigation.Left, {
    self,
    function()
      self.CurFocusWidget = self.Snack_Purple.Item_Snacks
      return self.Snack_Purple.Item_Snacks
    end
  })
  self.Snack_Green.Item_Snacks:SetNavigationRuleCustom(EUINavigation.Down, {
    self,
    function()
      self.CurFocusWidget = self.Snack_Green.Button_Area
      return self.Snack_Green.Button_Area
    end
  })
  self.Snack_Blue.Item_Snacks:SetNavigationRuleCustom(EUINavigation.Down, {
    self,
    function()
      self.CurFocusWidget = self.Snack_Blue.Button_Area
      return self.Snack_Blue.Button_Area
    end
  })
  self.Snack_Purple.Item_Snacks:SetNavigationRuleCustom(EUINavigation.Down, {
    self,
    function()
      self.CurFocusWidget = self.Snack_Purple.Button_Area
      return self.Snack_Purple.Button_Area
    end
  })
  self.Snack_Gold.Item_Snacks:SetNavigationRuleCustom(EUINavigation.Down, {
    self,
    function()
      self.CurFocusWidget = self.Snack_Gold.Button_Area
      return self.Snack_Gold.Button_Area
    end
  })
end

function WBP_Pet_Capture_C:OnUpdateUIStyleByInputTypeChange(CurInputDevice, CurGamepadName)
  local bIsMobile = CommonUtils.GetDeviceTypeByPlatformName(self) == "Mobile"
  if bIsMobile then
    return
  end
  self.CurInputDeviceType = UIUtils.UtilsGetCurrentInputType()
  self.CurGamepadName = UIUtils.UtilsGetCurrentGamepadName()
  local GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(self)
  local IsGamePad = GameInputModeSubsystem and GameInputModeSubsystem:GetCurrentInputType() == ECommonInputType.Gamepad
  self.WS_Type:SetActiveWidgetIndex(IsGamePad and 1 or 0)
end

function WBP_Pet_Capture_C:OnKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if "SpaceBar" == InKeyName then
    self:ThrowSnack()
  elseif "Escape" == InKeyName or "Gamepad_FaceButton_Right" == InKeyName then
    self:ExitPetCapture()
  elseif "Gamepad_FaceButton_Left" == InKeyName and not self.SelectStart then
    self:OnConfirmClicked()
    self.Button_Throw:SetFocus()
  elseif "Gamepad_Special_Right" == InKeyName then
    local UIManager = GWorld.GameInstance:GetGameUIManager()
    if not UIManager then
      return
    end
    UIManager:ShowCommonPopupUI(100130)
  end
  return UE4.UWidgetBlueprintLibrary.Handled()
end

function WBP_Pet_Capture_C:InitTabInfo()
  self.Tab_Pet_Capture:Init({
    TitleName = GText("UI_Pet_Title"),
    DynamicNode = {"Back", "BottomKey"},
    BottomKeyInfo = {
      {
        KeyInfoList = {
          {
            Type = "Text",
            Text = "Esc",
            ClickCallback = self.ExitPetCapture,
            Owner = self
          }
        },
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "B",
            ClickCallback = self.ExitPetCapture,
            Owner = self
          }
        },
        Desc = GText("UI_BACK")
      }
    },
    StyleName = "Text",
    OwnerPanel = self,
    BackCallback = self.ExitPetCapture
  })
end

function WBP_Pet_Capture_C:OnSelectSnackClicked1()
  self:PressSnackButton(self.Snack_Green, 0, 0)
  self:ShowSpecialPet(false)
end

function WBP_Pet_Capture_C:OnSelectSnackClicked2()
  self:PressSnackButton(self.Snack_Blue, DataMgr.GlobalConstant.ItemIDPetFoodLV1.ConstantValue, 1)
  self:ShowSpecialPet(false)
end

function WBP_Pet_Capture_C:OnSelectSnackClicked3()
  self:PressSnackButton(self.Snack_Purple, DataMgr.GlobalConstant.ItemIDPetFoodLV2.ConstantValue, 2)
  self:ShowSpecialPet(false)
end

function WBP_Pet_Capture_C:OnSelectSnackClicked4()
  if not self.PetData.PremiumTransform and not self.PetData.Premium then
    UIManager(self):ShowUITip("CommonToastMain", GText("Pet_PremiumTransform_Lock"), 1.5)
    return
  end
  self:PressSnackButton(self.Snack_Gold, DataMgr.GlobalConstant.ItemIDPetFoodLV3.ConstantValue, 3)
  self:ShowSpecialPet(true)
end

function WBP_Pet_Capture_C:ShowSpecialPet(IsShow)
  if self.IsShowSpecialPet == nil then
    self.IsShowSpecialPet = false
  end
  if self.IsShowSpecialPet == IsShow then
    return
  end
  local PremiumTransform = self.PetData.PremiumTransform
  if not PremiumTransform then
    return
  end
  local PetData = DataMgr.Pet[PremiumTransform]
  local CharModelComponent = self.Owner:GetCharModelComponent()
  if not CharModelComponent then
    return
  end
  self.IsShowSpecialPet = IsShow
  if IsShow then
    self.Owner:SetPetEffectCreatureFXById(PremiumTransform)
    CharModelComponent:UpdateCurrentModel(PetData.ModelId)
    local ModelConfig = DataMgr.Model[PetData.ModelId]
    self.Owner:UpdateModelSkin(ModelConfig.PetModelId)
    self.Owner.FXComponent:PlayEffectByIDParams(301, {bTickEvenWhenPaused = true, NotAttached = true})
  else
    self.Owner:RemovePetEffectCreatureFXById(PremiumTransform)
    CharModelComponent:UpdateCurrentModel(self.PetData.ModelId)
    local ModelConfig = DataMgr.Model[self.PetData.ModelId]
    self.Owner:UpdateModelSkin(ModelConfig.PetModelId)
    self.Owner.FXComponent:PlayEffectByIDParams(302, {bTickEvenWhenPaused = true, NotAttached = true})
  end
end

function WBP_Pet_Capture_C:PressSnackButton(PressButton, SnackId, Level)
  if self.PreSelectSnackButton == PressButton then
    return
  end
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  if 0 ~= SnackId then
    local FoodCount = Avatar:GetResourceNum(SnackId)
    if FoodCount < 1 then
      PressButton:PlayAnimation(PressButton.Forbidden)
      AudioManager(self):PlayUISound(self, "event:/ui/common/pet_click_err", nil, nil)
      UIManager(self):ShowUITip("CommonToastMain", GText("UI_Pet_FoodNotEnough"), 1.5)
      return
    end
    AudioManager(self):PlayUISound(self, "event:/ui/common/pet_click", nil, nil)
  else
    AudioManager(self):PlayUISound(self, "event:/ui/common/pet_click", nil, nil)
  end
  local MiniGameConfig = DataMgr.MiniGameCapture[self.PetData.MiniGameCaptureId]
  self:UpdateFoodLvProbability(MiniGameConfig["FoodLV" .. Level])
  self:PlayProbabilityAnimation()
  self.PreSelectSnackButton:StopAllAnimations()
  self.PreSelectSnackButton:PlayAnimation(PressButton.Normal)
  self.PreSelectSnackButton.WidgetSwitcher_State:SetActiveWidgetIndex(1)
  self.Color_Bar:StopAllAnimations()
  self.Color_Bar:PlayAnimation(self.Color_Bar.Change)
  PressButton:StopAllAnimations()
  PressButton:PlayAnimation(PressButton.Click)
  self.SnackId = SnackId
  self.SnackClickMap[self.PreSelectSnackButton].IsClick = false
  self.SnackClickMap[PressButton].IsClick = true
  self.PreSelectSnackButton = PressButton
  local PetFavFoodThreshold = DataMgr.GlobalConstant.PetFavFoodThreshold and DataMgr.GlobalConstant.PetFavFoodThreshold.ConstantValue or 0.6
  for i = 1, #self.ProbabilityPercent do
    local ProbabilityItem = self.ProbabilityPercent[i]
    if PetFavFoodThreshold <= ProbabilityItem.Probability and ProbabilityItem.Percent > 0 then
      self:PlayPetVoice(PetBehavior.Hello)
      return
    end
  end
  self:PlayPetVoice(PetBehavior.Upset)
end

function WBP_Pet_Capture_C:InitSnackButton(SnackButton, SnackId)
  SnackButton.Button_Area.OnHovered:Add(self, function()
    if not self.SnackClickMap[SnackButton].IsClick then
      SnackButton:PlayAnimation(SnackButton.Hover)
      self.SnackClickMap[SnackButton].IsHover = true
    end
  end)
  SnackButton.Button_Area.OnUnhovered:Add(self, function()
    if not self.SnackClickMap[SnackButton].IsClick then
      SnackButton:PlayAnimation(SnackButton.UnHover)
      self.SnackClickMap[SnackButton].IsHover = false
    end
  end)
  SnackButton.Button_Area.OnPressed:Add(self, function()
    if not self.SnackClickMap[SnackButton].IsClick then
      SnackButton:PlayAnimation(SnackButton.Press)
    end
  end)
  SnackButton.Button_Area.OnReleased:Add(self, function()
    if not self.SnackClickMap[SnackButton].IsClick and self.SnackClickMap[SnackButton].IsHover then
      SnackButton:StopAllAnimations()
      SnackButton:PlayAnimation(SnackButton.Hover)
    end
  end)
  SnackButton:BindToAnimationFinished(SnackButton.UnHover, {
    SnackButton,
    function()
      local Avatar = GWorld:GetAvatar()
      if not Avatar then
        return
      end
      if not self.SnackClickMap[SnackButton].IsClick then
        if SnackId == DataMgr.GlobalConstant.ItemIDPetFoodLV3.ConstantValue and not self.PetData.PremiumTransform and not self.PetData.Premium then
          SnackButton:PlayAnimation(SnackButton.Forbidden)
          return
        end
        if 0 ~= SnackId then
          local FoodCount = Avatar:GetResourceNum(SnackId)
          if FoodCount < 1 then
            SnackButton:PlayAnimation(SnackButton.Forbidden)
          else
            SnackButton:PlayAnimation(SnackButton.Normal)
          end
        else
          SnackButton:PlayAnimation(SnackButton.Normal)
        end
      end
    end
  })
end

function WBP_Pet_Capture_C:InitSnacks()
  self.Snack_Green.WidgetSwitcher_State:SetActiveWidgetIndex(2)
  local MiniGameConfig = DataMgr.MiniGameCapture[self.PetData.MiniGameCaptureId]
  self:UpdateFoodLvProbability(MiniGameConfig.FoodLV0)
  self:InitProbabilitySlot()
  self.PreSelectSnackButton = self.Snack_Green
  self.SnackClickMap[self.Snack_Green].IsClick = true
  self.SnackId = 0
  self.Snack_Green:PlayAnimation(self.Snack_Green.Click)
  self.SnackBlueIcon = "/Game/UI/Texture/Dynamic/Atlas/Prop/Item/T_Resource_PetFood01.T_Resource_PetFood01"
  local Item = self.Snack_Green.Item_Snacks
  Item:SetIcon(self.SnackBlueIcon)
  Item:SetName("\226\136\158")
  Item.Content = {}
  Item:SetRarity(2)
  Item:BindEventOnMouseButtonUp(self, function()
    UIManager(self):ShowUITip("CommonToastMain", GText("UI_Pet_FoodLV0"), 1.5)
  end)
  self:UpdateSnackWidget(self.Snack_Blue, DataMgr.GlobalConstant.ItemIDPetFoodLV1.ConstantValue)
  self:UpdateSnackWidget(self.Snack_Purple, DataMgr.GlobalConstant.ItemIDPetFoodLV2.ConstantValue)
  self:UpdateSnackWidget(self.Snack_Gold, DataMgr.GlobalConstant.ItemIDPetFoodLV3.ConstantValue)
  local Avatar = GWorld:GetAvatar()
  local FoodCount = Avatar:GetResourceNum(DataMgr.GlobalConstant.ItemIDPetFoodLV3.ConstantValue)
  self.Snack_Gold:SetVisibility((FoodCount > 0 or Avatar.PetShowPremiumTransform) and ESlateVisibility.Visible or ESlateVisibility.Collapsed)
  if not self.PetData.PremiumTransform and not self.PetData.Premium then
    self.Snack_Gold:PlayAnimation(self.Snack_Gold.Forbidden)
  end
end

function WBP_Pet_Capture_C:UpdateSnackWidget(SnackWidget, SnackId)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  local FoodCount = Avatar:GetResourceNum(SnackId)
  local ResRarity = ItemUtils.GetItemRarity(SnackId, "Resource")
  local ResourceIcon = ItemUtils.GetItemIconPath(SnackId, "Resource")
  SnackWidget.Item_Snacks:Init({
    UIName = "PetCapture",
    Id = SnackId,
    ItemType = "Resource",
    Rarity = ResRarity,
    Icon = ResourceIcon,
    Count = FoodCount,
    NeedCount = 1,
    IsShowDetails = true,
    MenuPlacement = EMenuPlacement.MenuPlacement_CenteredAboveAnchor
  })
  if FoodCount < 1 then
    SnackWidget:PlayAnimationForward(SnackWidget.Forbidden)
    SnackWidget.WidgetSwitcher_State:SetActiveWidgetIndex(0)
  else
    SnackWidget:PlayAnimationForward(SnackWidget.Normal)
    SnackWidget.WidgetSwitcher_State:SetActiveWidgetIndex(1)
  end
end

function WBP_Pet_Capture_C:OnConfirmClicked()
  if self.SelectStart then
    return
  end
  self.SelectStart = true
  self:SetFocus()
  self.Btn_Confirm:SetVisibility(ESlateVisibility.Collapsed)
  self.Panel_Snacks:SetVisibility(ESlateVisibility.Collapsed)
  self.Panel_Text:SetVisibility(ESlateVisibility.Collapsed)
  self.Panel_Tip:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  self:BindToAnimationFinished(self.Tip_In, {
    self,
    self.StartSelect
  })
  self:PlayAnimationForward(self.Tip_In)
  self.Color_Bar.Color_Gauge:PlayAnimationForward(self.Color_Bar.Color_Gauge.In)
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_confirm", nil, nil)
end

function WBP_Pet_Capture_C:StartSelect()
  self.Color_Bar.Color_Gauge:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  if self.ColorBarHandle then
    ULTweenBPLibrary.KillIfIsTweening(self, self.ColorBarHandle)
  end
  local ResourceIcon
  if 0 == self.SnackId then
    ResourceIcon = LoadObject(self.SnackBlueIcon)
  else
    ResourceIcon = ItemUtils.GetItemIcon(self.SnackId, "Resource")
  end
  if ResourceIcon then
    self.Color_Bar.Color_Gauge.Img_Snack:SetBrushResourceObject(ResourceIcon)
  end
  local Padding = UE4.FMargin(0, 0, 0, 0)
  Padding.Left = -298
  self.Color_Bar.Color_Gauge.Slot:SetPadding(Padding)
  self:MoveRightSelectArrow()
  AudioManager(self):PlayUISound(self, "event:/ui/common/pet_slider_move", "PetCaptureStartSelect", nil)
  if CommonUtils.GetDeviceTypeByPlatformName(self) == "Mobile" then
    self:MoveCamera(self.Owner.Camera, true)
    EMUIAnimationSubsystem:EMPlayAnimation(self, self.Change)
  end
  self.Color_Bar.Text_Name:SetVisibility(ESlateVisibility.Collapsed)
  self.Color_Bar.List_Star:SetVisibility(ESlateVisibility.Collapsed)
  self.Color_Bar.Panel_Attribute:SetVisibility(ESlateVisibility.Collapsed)
  self:PlayPetVoice(PetBehavior.Hello)
end

function WBP_Pet_Capture_C:MoveRightSelectArrow()
  local Padding = UE4.FMargin(0, 0, 0, 0)
  local MiniGameConfig = DataMgr.MiniGameCapture[self.PetData.MiniGameCaptureId]
  self.MoveSelectArrowHandle = ULTweenBPLibrary.FloatTo(self, {
    self,
    function(_, Value)
      if not self.SelectStart then
        ULTweenBPLibrary.KillIfIsTweening(self, self.MoveSelectArrowHandle)
        return
      end
      self.ArrowValue = Value
      Padding.Left = Value
      self.Color_Bar.Color_Gauge.Slot:SetPadding(Padding)
      if 298 == Value then
        self:MoveLeftSelectArrow()
      end
    end
  }, -298, 298, MiniGameConfig.PointerSpeed, 0, 0)
end

function WBP_Pet_Capture_C:MoveLeftSelectArrow()
  local Padding = UE4.FMargin(0, 0, 0, 0)
  local MiniGameConfig = DataMgr.MiniGameCapture[self.PetData.MiniGameCaptureId]
  self.MoveSelectArrowHandle = ULTweenBPLibrary.FloatTo(self, {
    self,
    function(_, Value)
      if not self.SelectStart then
        ULTweenBPLibrary.KillIfIsTweening(self, self.MoveSelectArrowHandle)
        return
      end
      self.ArrowValue = Value
      Padding.Left = Value
      self.Color_Bar.Color_Gauge.Slot:SetPadding(Padding)
      if -298 == Value then
        self:MoveRightSelectArrow()
      end
    end
  }, 298, -298, MiniGameConfig.PointerSpeed, 0, 0)
end

function WBP_Pet_Capture_C:ThrowSnack()
  if not self.SelectStart then
    return
  end
  self:TryCapturePet()
  self.Color_Bar:PlayAnimationForward(self.Color_Bar.Throw)
  self.Color_Bar.Color_Gauge:PlayAnimationForward(self.Color_Bar.Color_Gauge.Throw)
  self.SelectStart = false
  AudioManager(self):StopSound(self, "PetCaptureStartSelect")
  AudioManager(self):PlayUISound(self, "event:/ui/common/pet_slider_end", nil, nil)
  CommonUtils:CloseGuideTouchIfExist(self)
  self:PlayPetVoice(PetBehavior.Idle)
end

function WBP_Pet_Capture_C:TryCapturePet()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  ULTweenBPLibrary.KillIfIsTweening(self, self.MoveSelectArrowHandle)
  local Probability = 0
  local Interval = 298
  local Value = 1
  local ArrowValue = self.ArrowValue
  self.ArrowValue = self.ArrowValue + 298
  local Padding = UE4.FMargin(0, 0, 0, 0)
  if Interval >= self.ArrowValue then
    local Offset = Interval - self.ArrowValue
    local Percent = Offset / Interval
    local LastPercent = 1
    for i = 1, #self.ProbabilityPercent do
      if Percent <= self.ProbabilityPercent[i].Percent then
        Probability = self.ProbabilityPercent[i].Probability
        Value = self.ProbabilityPercent[i].Value
        LastPercent = LastPercent - self.ProbabilityPercent[i].Value
        if 1 == i then
          Value = Value * 2
        end
        break
      else
        LastPercent = LastPercent - self.ProbabilityPercent[i].Value
      end
    end
    Padding.Left = 300 * LastPercent
  elseif Interval < self.ArrowValue then
    local Offset = self.ArrowValue - Interval
    local Percent = math.min(Offset / Interval, 1)
    local LastPercent = 0
    local StopIndex = 0
    for i = 1, #self.ProbabilityPercent do
      if Percent <= self.ProbabilityPercent[i].Percent then
        Probability = self.ProbabilityPercent[i].Probability
        Value = self.ProbabilityPercent[i].Value
        if 1 == i then
          Value = Value * 2
          LastPercent = 1 - self.ProbabilityPercent[i].Value
        end
        StopIndex = i
        break
      else
        LastPercent = self.ProbabilityPercent[i].Percent
      end
    end
    if 1 == StopIndex then
      Padding.Left = 300 * LastPercent
    else
      Padding.Left = 300 * LastPercent + 300
    end
  end
  self.Color_Bar.Panel_Select:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  self.Color_Bar.Panel_Select.Slot:SetPadding(Padding)
  self.Color_Bar.Img_Block:SetBrushSize(FVector2D(600 * Value + 64, 128))
  local MiniGameConfig = DataMgr.MiniGameCapture[self.PetData.MiniGameCaptureId]
  local XMax = MiniGameConfig.Xmax
  local Percent = ArrowValue / 298
  local XValue = Percent * XMax
  
  local function RPCCallback(ErrCode, UniqueId)
    self.ExistReason = 2
    self.Owner:HidePetNotifyEarly(ErrCode)
    local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
    local SceneMgrComponent = GameInstance:GetSceneManager()
    if IsValid(SceneMgrComponent) and self.Owner.Eid == SceneMgrComponent.NearestPetGuideEid then
      SceneMgrComponent:CloseOneGuideIconByTargetEid(self.Owner.Eid)
      SceneMgrComponent.NearestPetGuideEid = 0
    end
    self:AddTimer(0.7, function()
      self.PetCaptureInteractive:CapturePetCallBack(ErrCode, Probability * 100, UniqueId)
      self:PlayOutAnim()
    end)
  end
  
  local GameMode = UGameplayStatics.GetGameMode(self.Owner)
  if 0 ~= self.Owner.DynamicUniqueId then
    Avatar:TryCapturePetDynamicQuest(self.SnackId, XValue, self.Owner.DynamicUniqueId, RPCCallback)
  elseif GameMode and GameMode:IsInRegion() then
    DebugPrint("WBP_Pet_Capture_C:TryCapturePet: TryCapturePetRegion", self.Owner.RegionDataType, self.Owner.WorldRegionEid)
    Avatar:TryCapturePetRegion(self.SnackId, XValue, self.PetId, self.Owner.RegionDataType, self.Owner.WorldRegionEid, RPCCallback)
  else
    Avatar:TryCapturePetDungeon(self.SnackId, XValue, self.PetId, RPCCallback)
  end
  RPCCallback = nil
end

function WBP_Pet_Capture_C:UpdateFoodLvProbability(FoodLv)
  local GameMode = UGameplayStatics.GetGameMode(self.Owner)
  if 0 == self.Owner.DynamicUniqueId and (not GameMode or not GameMode:IsInRegion()) then
    FoodLv = -0.99
  end
  local Probability = {
    1,
    0.8,
    0.6,
    0.4,
    0.2
  }
  local MiniGameConfig = DataMgr.MiniGameCapture[self.PetData.MiniGameCaptureId]
  local XFactor = MiniGameConfig.XFactor
  local YFactor = MiniGameConfig.yFactor
  local Xmax = MiniGameConfig.Xmax
  local Index = 6
  local PrePercent = 0
  self.ProbabilityPercent = {}
  if not self.CurColorBarSize then
    self.CurColorBarSize = {}
  end
  local SurplusValue = 1
  for i = 1, #Probability do
    local Percent = math.sqrt(-math.log((Probability[i] + FoodLv) / YFactor / 0.4) * 2) * XFactor / Xmax
    Percent = math.min(Percent, 1)
    local SizeStruct = FSlateChildSize()
    if Percent > 0 then
      local Value = Percent - PrePercent
      SurplusValue = SurplusValue - Value
      table.insert(self.ProbabilityPercent, {
        Percent = Percent,
        Probability = Probability[i],
        Value = Value
      })
      SizeStruct.Value = Value
      local CurColorValue = self.CurColorBarSize[i] and self.CurColorBarSize[i].CurValue or Value
      self.CurColorBarSize[i] = {
        TargetValue = Value,
        CurValue = CurColorValue,
        ColorIndex = Index
      }
      PrePercent = Percent
    else
      SizeStruct.Value = 0
      local CurColorValue = self.CurColorBarSize[i] and self.CurColorBarSize[i].CurValue or 0
      self.CurColorBarSize[i] = {
        TargetValue = 0,
        CurValue = CurColorValue,
        ColorIndex = Index
      }
    end
  end
  table.insert(self.ProbabilityPercent, {
    Percent = 1,
    Probability = 0.01,
    Value = 1 - PrePercent
  })
  local SizeStruct = FSlateChildSize()
  local Value = SurplusValue > 0 and SurplusValue or 0
  SizeStruct.Value = Value
  local CurColorValue = self.CurColorBarSize[6] and self.CurColorBarSize[6].CurValue or Value
  self.CurColorBarSize[6] = {
    TargetValue = Value,
    CurValue = CurColorValue,
    ColorIndex = 6
  }
  if self.ProbabilityPercent[#self.ProbabilityPercent].Value >= 1 then
    UIManager(self):ShowUITip("CommonToastMain", GText("UI_Pet_Toast_LowSuccRate"), 1.5)
  end
  if #self.ProbabilityPercent >= 1 and 1 == self.ProbabilityPercent[1].Probability and 1 == self.ProbabilityPercent[1].Percent then
    self.Color_Bar.Text_Probability:SetText("100%UP")
    self.Color_Bar.Text_Probability:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  elseif #self.ProbabilityPercent >= 1 and self.ProbabilityPercent[#self.ProbabilityPercent].Probability == 0.01 and UKismetMathLibrary.NearlyEqual_FloatFloat(self.ProbabilityPercent[#self.ProbabilityPercent].Value, 1) then
    self.Color_Bar.Text_Probability:SetText("1%")
    self.Color_Bar.Text_Probability:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  else
    self.Color_Bar.Text_Probability:SetVisibility(ESlateVisibility.Collapsed)
  end
end

function WBP_Pet_Capture_C:InitProbabilitySlot()
  local SizeStruct = FSlateChildSize()
  for i = 1, #self.CurColorBarSize do
    local ColorBar = self.CurColorBarSize[i]
    SizeStruct.Value = ColorBar.TargetValue
    self.Color_Bar["Block_" .. ColorBar.ColorIndex + i].Slot:SetSize(SizeStruct)
    self.Color_Bar["Block_" .. ColorBar.ColorIndex - i + 1].Slot:SetSize(SizeStruct)
  end
end

function WBP_Pet_Capture_C:PlayProbabilityAnimation()
  local SizeStruct = FSlateChildSize()
  if self.ProbabilityHandle then
    ULTweenBPLibrary.KillIfIsTweening(self, self.ProbabilityHandle)
  end
  self.ProbabilityHandle = ULTweenBPLibrary.FloatTo(self, {
    self,
    function(_, Value)
      for i = 1, #self.CurColorBarSize do
        local ColorBar = self.CurColorBarSize[i]
        local Interval = ColorBar.TargetValue - ColorBar.CurValue
        ColorBar.CurValue = ColorBar.CurValue + Interval * Value
        SizeStruct.Value = ColorBar.CurValue
        self.Color_Bar["Block_" .. ColorBar.ColorIndex + i].Slot:SetSize(SizeStruct)
        self.Color_Bar["Block_" .. ColorBar.ColorIndex - i + 1].Slot:SetSize(SizeStruct)
      end
    end
  }, 0, 1, 0.5, 0, 0)
end

function WBP_Pet_Capture_C:ExitPetCapture()
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  local UIManager = GameInstance:GetGameUIManager()
  local Params = {
    ShortText = GText("UI_Pet_Popup_Quit"),
    LeftCallbackObj = self,
    LeftCallbackFunction = self.ReturnFocus,
    RightCallbackObj = self,
    RightCallbackFunction = self.PlayOutAnim
  }
  UIManager:ShowCommonPopupUI(100010, Params)
end

function WBP_Pet_Capture_C:ReturnFocus()
  self:SetFocus()
end

function WBP_Pet_Capture_C:PlayOutAnim()
  if self:IsAnimationPlaying(self.Out) or self.IsBeginToClose then
    return
  end
  self:BindToAnimationFinished(self.Out, {
    self,
    self.Close
  })
  self:PlayAnimationForward(self.Out)
  AudioManager(self):SetEventSoundParam(self, "OpenPetCapture", {ToEnd = 1})
  AudioManager(self):SetEventSoundParam(self, "PetIdle", {ToEnd = 1})
end

function WBP_Pet_Capture_C:SwitchCamera(IsPlayer)
  local PlayerController = UGameplayStatics.GetPlayerController(self, 0)
  if IsPlayer then
    if IsValid(self.CameraHandle) then
      ULTweenBPLibrary.KillIfIsTweening(self, self.CameraHandle)
    end
    local PlayerCharacter = UGameplayStatics.GetPlayerCharacter(self, 0)
    if not IsStandAlone(self) then
      local Players = PlayerCharacter:GetAllTeammates()
      for Index, Teammate in pairs(Players) do
        if Teammate:IsPlayer() and PlayerCharacter.Eid ~= Teammate.Eid then
          Teammate:SetActorHideTag("PetCapture", false)
        end
      end
    end
    PlayerController:SetViewTargetWithBlend(PlayerCharacter, 0, EViewTargetBlendFunction.VTBlend_Linear, 0, false)
    UE4.UAsyncCameraLookToTargetAction.CameraLookToActor(self.Owner, self.Owner, 0)
  else
    local Camera = self.Owner.Camera
    Camera:K2_SetRelativeLocation(self.Owner.CameraLocation, false, nil, false)
    PlayerController:SetViewTargetWithBlend(self.Owner, 0, EViewTargetBlendFunction.VTBlend_Linear, 0, false)
    self:MoveCamera(Camera, false)
    local PlayerCharacter = UGameplayStatics.GetPlayerCharacter(self, 0)
    if not IsStandAlone(self) then
      local Players = PlayerCharacter:GetAllTeammates()
      for Index, Teammate in pairs(Players) do
        if Teammate:IsPlayer() and PlayerCharacter.Eid ~= Teammate.Eid then
          Teammate:SetActorHideTag("PetCapture", true)
        end
      end
    end
  end
end

function WBP_Pet_Capture_C:MoveCamera(Camera, IsSelecting)
  local CamOffset = self.PetData.MiniGameCamOffset or FVector(0, 0, 0)
  CamOffset = CommonUtils.GetDeviceTypeByPlatformName(self) ~= "Mobile" and FVector(0, 0, 0) or FVector(CamOffset[1], CamOffset[2], CamOffset[3])
  local StartLocation = self.PetData.MiniGamCamInitialLocation
  StartLocation = FVector(StartLocation[1], StartLocation[2], StartLocation[3]) + CamOffset
  local EndLocation = self.PetData.MiniGamCamStayLocation
  EndLocation = FVector(EndLocation[1], EndLocation[2], EndLocation[3]) + CamOffset
  if IsSelecting then
    self.CameraHandle = ULTweenBPLibrary.Vector3To(self, {
      self,
      function(_, Value)
        Camera:K2_SetRelativeLocation(Value, false, nil, false)
      end
    }, EndLocation, EndLocation - CamOffset, 0.5, 0, 17)
  else
    self.CameraHandle = ULTweenBPLibrary.Vector3To(self, {
      self,
      function(_, Value)
        Camera:K2_SetRelativeLocation(Value, false, nil, false)
      end
    }, StartLocation, EndLocation, 0.5, 0, 17)
  end
end

function WBP_Pet_Capture_C:Close()
  ULTweenBPLibrary.KillIfIsTweening(self, self.MoveSelectArrowHandle)
  self:SwitchCamera(true)
  if IsValid(self.Owner) then
    self:ShowSpecialPet(false)
    self.Owner:OnPetMiniGameSwitch(self.ExistReason)
    self.PetCaptureInteractive:ResetPetState()
  end
  EventManager:RemoveEvent(EventID.CharDie, self)
  self.Super.Close(self)
end

function WBP_Pet_Capture_C:OnPlayerDead(Eid)
  local Character = Battle(self):GetEntity(Eid)
  if Character:IsMainPlayer() then
    self:Close()
  end
end

function WBP_Pet_Capture_C:PlayPetVoice(Behavior)
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  local PetNameTag = self.PetData and self.PetData.PetNameTag
  if Behavior == PetBehavior.Happy then
    AudioManager(self):StopSound(Player, "PetVoice")
    AudioManager(self):PlayPetVoice(Player, PetNameTag, "vo_happy", "PetVoice")
  elseif Behavior == PetBehavior.Upset then
    AudioManager(self):StopSound(Player, "PetUpset")
    AudioManager(self):PlayPetVoice(Player, PetNameTag, "vo_upset", "PetVoice")
  elseif Behavior == PetBehavior.Hello then
    AudioManager(self):StopSound(Player, "PetHello")
    AudioManager(self):PlayPetVoice(Player, PetNameTag, "vo_hello", "PetVoice")
  elseif Behavior == PetBehavior.Idle then
    AudioManager(self):StopSound(Player, "PetIdle")
    AudioManager(self):PlayPetVoice(Player, PetNameTag, "vo_idle", "PetVoice")
  end
end

return WBP_Pet_Capture_C
