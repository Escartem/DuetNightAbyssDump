require("UnLua")
local M = Class("BluePrints.UI.BP_UIState_C")
local ArmoryUtils = require("BluePrints.UI.WBP.Armory.ArmoryUtils")
local HeroUSDKUtils = require("Utils.HeroUSDKUtils")
M._components = {
  "BluePrints.UI.WBP.Armory.MainComponent.Armory_PointerInputComponent",
  "BluePrints.UI.Shop.SkinPreview.SkinPreview_CharacterComponent",
  "BluePrints.UI.Shop.SkinPreview.SkinPreview_WeaponComponent",
  "BluePrints.UI.WBP.Armory.ActorController.PreviewActorComponent"
}

function M:Construct()
  M.Super.Construct(self)
  self.KeyDownEvents = {}
  self.RepeatKeyDownEvents = {}
  self.TabStyleName = "Text"
  self.UKey = "U"
  self.EscapeKey = EKeys.Escape.KeyName
  self.GamePadHideUIKey = UIConst.GamePadKey.FaceButtonLeft
  self.GamePadBackKey = UIConst.GamePadKey.FaceButtonRight
  self.GamePadConfirmKey = UIConst.GamePadKey.FaceButtonBottom
  self.GamePadOpenSuitKey = UIConst.GamePadKey.FaceButtonTop
  self.LeftShoulderKey = UIConst.GamePadKey.LeftShoulder
  self.RightShoulderKey = UIConst.GamePadKey.RightShoulder
  self.LeftTriggerKey = UIConst.GamePadKey.LeftTriggerThreshold
  self.RightTriggerKey = UIConst.GamePadKey.RightTriggerThreshold
  self.DPadLeftKey = UIConst.GamePadKey.DPadLeft
  self.DPadRightKey = UIConst.GamePadKey.DPadRight
  self.MenuKey = UIConst.GamePadKey.SpecialRight
  self.ViewKey = UIConst.GamePadKey.SpecialLeft
  self.ZoomKey = "Mouse_Button"
  self.ReplayKey = "R"
  self.ESCKeyInfoList = {
    KeyInfoList = {
      {
        Type = "Text",
        Text = CommonUtils:GetKeyText(EKeys.Escape.KeyName),
        ClickCallback = self.CloseSelf,
        Owner = self
      }
    },
    GamePadInfoList = {
      {
        Type = "Img",
        ImgShortPath = "B",
        ClickCallback = self.CloseSelf,
        Owner = self
      }
    },
    Desc = GText("UI_BACK")
  }
  self.HideUI_KeyInfoList = {
    KeyInfoList = {
      {
        Type = "Text",
        Text = CommonUtils:GetKeyText("U"),
        ClickCallback = self.OnHideUIKeyDown,
        Owner = self
      }
    },
    GamePadInfoList = {
      {Type = "Img", ImgShortPath = "X"}
    },
    Desc = GText("UI_Dye_HideUI")
  }
  self.ZoomKeyInfoList = {
    KeyInfoList = {
      {
        Type = "Text",
        Text = CommonUtils:GetKeyText(self.ZoomKey),
        Owner = self
      }
    },
    GamePadInfoList = {
      {Type = "Or"},
      GamePadSubKeyInfoList = {
        {
          Type = "Img",
          ImgShortPath = "LT",
          Owner = self
        },
        {
          Type = "Img",
          ImgShortPath = "RT",
          Owner = self
        }
      }
    },
    Desc = GText("UI_Dye_Zoom"),
    bLongPress = false
  }
  self.RightThumbstickAnalogBottomKeyInfoList = {
    GamePadInfoList = {
      {Type = "Img", ImgShortPath = "RH"}
    },
    Desc = GText("UI_CTL_RotatePreview")
  }
  self.MenuKeyInfoList = {
    GamePadInfoList = {
      {Type = "Img", ImgShortPath = "Menu"}
    },
    Desc = GText("UI_CTL_ExplainSet")
  }
  self.ReplayKeyInfoList = {
    KeyInfoList = {
      {
        Type = "Text",
        Text = CommonUtils:GetKeyText(self.ReplayKey),
        ClickCallback = self.OnReplayGesture,
        Owner = self
      }
    },
    GamePadInfoList = {
      {Type = "Img", ImgShortPath = "Y"}
    },
    Desc = GText("UI_Replay"),
    bLongPress = false
  }
  self.MainTabsStyle = {
    TitleName = GText("UI_Armory_Appearance"),
    LeftKey = "NotShow",
    RightKey = "NotShow",
    Tabs = {},
    DynamicNode = {
      "Back",
      "ResourceBar"
    },
    BottomKeyInfo = {},
    StyleName = "Text",
    OwnerPanel = self,
    LastFocusWidget = self,
    OnResourceBarAddedToFocusPath = function()
      self.Btn_Function:SetGamePadVisibility(ESlateVisibility.Collapsed)
      self.Key_GamePad_L:SetVisibility(ESlateVisibility.Collapsed)
      self.Key_GamePad_R:SetVisibility(ESlateVisibility.Collapsed)
    end,
    OnResourceBarRemovedFromFocusPath = function()
      if self.IsGamepadInput then
        self.Btn_Function:SetGamePadVisibility(ESlateVisibility.SelfHitTestInvisible)
        self.Key_GamePad_L:SetVisibility((self.bFirst or self.ShopItemData.SinglePreview) and ESlateVisibility.Collapsed or ESlateVisibility.SelfHitTestInvisible)
        self.Key_GamePad_R:SetVisibility((self.bLast or self.ShopItemData.SinglePreview) and ESlateVisibility.Collapsed or ESlateVisibility.SelfHitTestInvisible)
      end
    end,
    BackCallback = self.OnBackKeyDown
  }
  local ConfigData = {
    ClickCallback = self.OnClickSuitPreviewDialog,
    OwnerWidget = self
  }
  self.Btn_Preview:Init(ConfigData)
  
  function self.Btn_Preview.SoundFunc()
    AudioManager(self):PlayUISound(self.Btn_Preview, "event:/ui/common/click_btn_small", nil, nil)
  end
  
  self:ResetPreviewCheckBox()
  self.CheckBox_Preview:RemoveEventOnCheckStateChanged(self)
  self.CheckBox_Preview:AddEventOnCheckStateChanged(self, self.OnSwitchSuitPreview)
  self.Btn_Function:BindEventOnClicked(self, self.PurChase)
  self.Btn_Function:TryOverrideSoundFunc(function()
  end)
  self.Btn_Selective:BindEventOnClicked(self, self.OnClickDyeingPreview)
  self.Btn_Selective:TryOverrideSoundFunc(function()
  end)
  self.Btn_L:BindEventOnClicked(self, self.OnClickPreviousSkin)
  self.Btn_R:BindEventOnClicked(self, self.OnClickNextSkin)
  self.Image_Click.OnMouseButtonDownEvent:Unbind()
  self.Image_Click.OnMouseButtonDownEvent:Bind(self, self.On_Image_Click_MouseButtonDown)
  if CommonUtils.GetDeviceTypeByPlatformName(self) == "Mobile" then
    self.Btn_Hide.OnCheckStateChanged:Add(self, self.OnHideUIKeyDown)
    self.Btn_Hide:SetCheckedState(ECheckBoxState.Unchecked)
  end
  self.Text_Preview:SetText(GText("UI_SkinPreview_ShowSuit"))
  self.Text_Color:SetText(GText("UI_SkinPreview_Dye"))
  self.Btn_Function:SetText(GText("UI_SHOP_PURCHASE"))
  self.Panel_Buy:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  self.Btn_Preview:SetVisibility(ESlateVisibility.Collapsed)
  self.Text_Char_None:SetVisibility(ESlateVisibility.Collapsed)
  self.WBP_Com_Cost:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  self.Num_Price:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  self.bForbiddenButton = false
  self.bSelfHidden = false
  if CommonUtils.GetDeviceTypeByPlatformName(self) == "PC" then
    self.Btn_Function:SetDefaultGamePadImg("A")
    self.Key_GamePad_L:CreateCommonKey({
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "Left"}
      }
    })
    self.Key_GamePad_R:CreateCommonKey({
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "Right"}
      }
    })
    self.Key_Preview:CreateCommonKey({
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "Y"}
      }
    })
    self.Key_Color:CreateCommonKey({
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "View"}
      }
    })
    self.Key_GamePad_L:SetVisibility(ESlateVisibility.Collapsed)
    self.Key_GamePad_R:SetVisibility(ESlateVisibility.Collapsed)
    self.Key_Preview:SetVisibility(ESlateVisibility.Collapsed)
    self.Key_Color:SetVisibility(ESlateVisibility.Collapsed)
  end
  self.Tab_Change.Text_Alive:SetText(GText("UI_Armory_Meleeweapon"))
  self.Tab_Change.Text_Dying:SetText(GText("UI_Armory_Longrange"))
  self.IsGamepadInput = UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad
end

function M:Destruct()
  self.CheckBox_Preview:RemoveEventOnCheckStateChanged(self)
  self.Btn_Function:UnBindEventOnClickedByObj(self)
  self.Btn_Selective:UnBindEventOnClickedByObj(self)
  self.Image_Click.OnMouseButtonDownEvent:Unbind()
  M.Super.Destruct(self)
end

function M:OnLoaded(...)
  M.Super.OnLoaded(self)
  self.ShopItemData, self.ParentWidget = ...
  if not self.ShopItemData.SinglePreview then
    self.Index2ShopSkin, self.ShopSkin2Index, self.SkinCount = ShopUtils:GetShopSkinList()
    if self.Index2ShopSkin == nil or self.ShopSkin2Index == nil or self.SkinCount == nil then
      self.ShopItemData.SinglePreview = true
      self.ShopItemData.HidePurchase = false
    end
  end
  self.Tab_Skin:Init(self.MainTabsStyle)
  if self.Tab_Skin.WBP_Com_Tab_ResourceBar then
    self.Tab_Skin.WBP_Com_Tab_ResourceBar:SetLastFocusWidget(self)
  end
  self.Tab_Change:Init({
    Parent = self,
    TabIdx = 1,
    OnTabClicked = self.OnTabChangeClicked
  })
  self:InitKeySetting()
  self.UIName = self:GetUIConfigName()
  self:UpdateUI()
  AudioManager(self):PlayUISound(self, "event:/ui/armory/open", "SkinPreviewIn", nil)
  self:PlayAnimation(self.In)
  self:BlockAllUIInput(true)
  self:SetFocus()
end

function M:InitKeySetting()
  self.KeyDownEvents[self.EscapeKey] = self.OnBackKeyDown
  self.KeyDownEvents[self.UKey] = self.OnHideUIKeyDown
  self.KeyDownEvents[self.ReplayKey] = self.OnReplayGesture
  self.KeyDownEvents[self.GamePadBackKey] = self.OnBackKeyDown
  self.RepeatKeyDownEvents[self.LeftTriggerKey] = self.OnCameraScrollBackwardKeyDown
  self.RepeatKeyDownEvents[self.RightTriggerKey] = self.OnCameraScrollForwardKeyDown
  self.KeyDownEvents[self.GamePadHideUIKey] = self.OnHideUIKeyDown
  self.KeyDownEvents[self.MenuKey] = self.OnClickSuitPreviewDialog
  self.KeyDownEvents[self.ViewKey] = self.OnClickDyeingPreview
  self.KeyDownEvents[self.GamePadOpenSuitKey] = self.OnClickSuitPreview
  self.KeyDownEvents[self.GamePadConfirmKey] = self.PurChase
  self.KeyDownEvents[self.DPadLeftKey] = self.OnClickPreviousSkin
  self.KeyDownEvents[self.DPadRightKey] = self.OnClickNextSkin
  self.KeyDownEvents[self.LeftShoulderKey] = function(self)
    if self.ShopItemData.ItemType ~= "WeaponAccessory" then
      return
    end
    self.Tab_Change:TriggerSwitch("Left")
  end
  self.KeyDownEvents[self.RightShoulderKey] = function(self)
    if self.ShopItemData.ItemType ~= "WeaponAccessory" then
      return
    end
    self.Tab_Change:TriggerSwitch("Right")
  end
  if CommonUtils.GetDeviceTypeByPlatformName(self) == "PC" then
    self.BottomKeyInfo = {}
    table.insert(self.BottomKeyInfo, self.MenuKeyInfoList)
    table.insert(self.BottomKeyInfo, self.ReplayKeyInfoList)
    table.insert(self.BottomKeyInfo, self.HideUI_KeyInfoList)
    table.insert(self.BottomKeyInfo, self.ZoomKeyInfoList)
    table.insert(self.BottomKeyInfo, self.RightThumbstickAnalogBottomKeyInfoList)
    table.insert(self.BottomKeyInfo, self.ESCKeyInfoList)
    self.Tab_Skin:UpdateBottomKeyInfo(self.BottomKeyInfo)
  elseif CommonUtils.GetDeviceTypeByPlatformName(self) == "Mobile" then
    self.KeyDownEvents = {}
    self.RepeatKeyDownEvents = {}
  end
end

function M:OnClickSuitPreview()
  if self.ShopItemData.SuitRewardId == nil or 0 == #self.ShopItemData.SuitRewardId then
    return
  end
  if self.bBlockClickSuitPreview or self.bBlockClickChangeSkin then
    return
  end
  self.CheckBox_Preview:OnBtnClicked()
end

function M:OnSwitchSuitPreview(IsChecked)
  self.bBlockClickSuitPreview = true
  self.CheckBox_Preview.ButtonArea:SetVisibility(ESlateVisibility.HitTestInvisible)
  self:AddTimer(0.6, function(self)
    self.bBlockClickSuitPreview = false
    self.CheckBox_Preview.ButtonArea:SetVisibility(ESlateVisibility.Visible)
  end)
  self.SwitchSuitChecked = IsChecked
  if IsChecked then
    local Rewards = DataMgr.Reward[self.ShopItemData.SuitRewardId[1]]
    self.ActorController:HidePlayerActor(self.UIName, false)
    self:HideSingleWeapon(true)
    if self.ShopItemData.ItemType == "Skin" then
      local CharId = DataMgr.Skin[self.ShopItemData.TypeId].CharId
      local CharSkinId = self.ShopItemData.TypeId
      local AppearanceInfo = {
        CharId = CharId,
        SkinId = CharSkinId,
        AccessorySuit = {}
      }
      for i = 1, #Rewards.Id do
        local SkinType = Rewards.Type[i]
        local SkinId = Rewards.Id[i]
        if "WeaponSkin" == SkinType then
          local WeaponData = self:CreatePreviewTargetData({Type = "Weapon", SkinId = SkinId})
          self.ActorController:ChangeWeaponModel(WeaponData)
          self.ActorController:ChangePlayerWeaponSkin(SkinId)
          local Tag = WeaponData:HasTag("Melee") and "Melee" or "Ranged"
          self.ActorController:SetMontageAndCamera("Weapon", Tag)
        elseif "CharAccessory" == SkinType then
          local AccessoryType = DataMgr.CharAccessory[SkinId].AccessoryType
          AppearanceInfo.AccessorySuit[CommonConst.NewCharAccessoryTypes[AccessoryType]] = SkinId
        elseif "WeaponAccessory" == SkinType then
          self.ActorController:ChangePlayerWeaponAccessory(SkinId)
        end
      end
      self.ActorController:ChangeCharAppearance(AppearanceInfo)
    elseif self.ShopItemData.ItemType == "WeaponSkin" or self.ShopItemData.ItemType == "CharAccessory" or self.ShopItemData.ItemType == "WeaponAccessory" then
      if self.ShopItemData.ItemType == "WeaponSkin" or self.ShopItemData.ItemType == "WeaponAccessory" then
        self:HideSingleWeapon(true)
        self.ActorController.ArmoryHelper:SetOriginalRotation(FRotator(0, 90, 0))
      end
      local AppearanceInfo = {
        CharId = -1,
        SkinId = -1,
        AccessorySuit = {}
      }
      for i = 1, #Rewards.Id do
        local SkinType = Rewards.Type[i]
        local SkinId = Rewards.Id[i]
        if "Skin" == SkinType then
          local CharData = self:CreatePreviewTargetData({Type = "Char", SkinId = SkinId})
          self.ActorController:ChangeCharModel(CharData, true, true)
          local CharId = DataMgr.Skin[SkinId].CharId
          AppearanceInfo.CharId = CharId
          AppearanceInfo.SkinId = SkinId
          self:HideZoomKey(false)
        elseif "WeaponSkin" == SkinType then
          self:HidePlayerWeapon(false)
          local WeaponData = self:CreatePreviewTargetData({Type = "Weapon", SkinId = SkinId})
          self.ActorController:ChangeWeaponModel(WeaponData)
          self.ActorController:ChangePlayerWeaponSkin(SkinId)
          local Tag = WeaponData:HasTag("Melee") and "Melee" or "Ranged"
          self.ActorController.DelayFrame = 30
          self.ActorController.bPlaySameMontage = true
          self.ActorController:SetMontageAndCamera("Weapon", Tag)
        elseif "CharAccessory" == SkinType then
          local AccessoryType = DataMgr.CharAccessory[SkinId].AccessoryType
          AppearanceInfo.AccessorySuit[CommonConst.NewCharAccessoryTypes[AccessoryType]] = SkinId
          self:HideZoomKey(false)
        elseif "WeaponAccessory" == SkinType then
          self:HidePlayerWeapon(false)
          self.ActorController:ChangePlayerWeaponAccessory(SkinId)
        end
      end
      self.ActorController:ChangeCharAppearance(AppearanceInfo)
      self.ActorController.DelayFrame = 30
    end
  elseif self.ShopItemData.ItemType == "Skin" then
    local CharId = DataMgr.Skin[self.ShopItemData.TypeId].CharId
    local CharSkinId = self.ShopItemData.TypeId
    local AppearanceInfo = {
      CharId = CharId,
      SkinId = CharSkinId,
      AccessorySuit = {}
    }
    self.ActorController:ChangeCharAppearance(AppearanceInfo)
    self.ActorController.DelayFrame = 30
    self.ActorController:SetMontageAndCamera(CommonConst.ArmoryType.Char, nil, nil)
    self.ActorController.bStandaloneWeapon = true
    self:HideZoomKey(false)
  elseif self.ShopItemData.ItemType == "WeaponSkin" then
    self.ActorController:HidePlayerActor(self.UIName, true)
    self:HidePlayerWeapon(true)
    local WeaponData = self:CreatePreviewTargetData({
      Type = "Weapon",
      SkinId = self.ShopItemData.TypeId
    })
    self.ActorController.ExCameraOffset = FVector(40, 0, 0)
    self.ActorController.ArmoryHelper:SetOriginalRotation(FRotator(0, 0, 0))
    self.ActorController:ChangeSingleWeapon(WeaponData)
    self.ActorController:ChangeWeaponSkin(self.ShopItemData.TypeId)
    self.ActorController.ArmoryHelper.EnableCameraScrolling = false
    self.ActorController.bStandaloneWeapon = true
    self:HideZoomKey(true)
  elseif self.ShopItemData.ItemType == "CharAccessory" then
    local Avatar = GWorld:GetAvatar()
    local AccessoryData = DataMgr.CharAccessory[self.ShopItemData.TypeId]
    local Char = Avatar.Chars[Avatar.CurrentChar]
    local Params = {
      Type = "Char",
      SkinId = Char.AppearanceSuits[Char.CurrentAppearanceIndex].SkinId
    }
    local Data = self:CreatePreviewTargetData(Params)
    self.ActorController:ChangeCharModel(Data, true, true)
    self.ActorController:ChangeCharAccessory(AccessoryData.AccessoryId, AccessoryData.AccessoryType)
    self:UpdateAccessoryCamera(AccessoryData.AccessoryId, AccessoryData.AccessoryType)
    self.ActorController:StopPlayerMontage()
    self:HideZoomKey(false)
  elseif self.ShopItemData.ItemType == "WeaponAccessory" then
    self.ActorController:HidePlayerActor(self.UIName, true)
    local Avatar = GWorld:GetAvatar()
    local WeaponAccessoryData = DataMgr.WeaponAccessory[self.ShopItemData.TypeId]
    if not WeaponAccessoryData then
      return nil
    end
    self.ActorController:ResetActorRotation()
    if 1 == self.Tab_Change.TabIdx then
      self.ActorController.ExCameraOffset = FVector(40, 0, 0)
      self.ActorController:ChangeSingleWeapon(Avatar.Weapons[Avatar.MeleeWeapon])
      self.ActorController:ChangeWeaponAccessory(WeaponAccessoryData.WeaponAccessoryId)
    elseif 2 == self.Tab_Change.TabIdx then
      self.ActorController.ExCameraOffset = FVector(40, 0, 0)
      self.ActorController:ChangeSingleWeapon(Avatar.Weapons[Avatar.RangedWeapon])
      self.ActorController:ChangeWeaponAccessory(WeaponAccessoryData.WeaponAccessoryId)
    end
    self.ActorController.ArmoryHelper.EnableCameraScrolling = false
    self:HideZoomKey(true)
  end
end

function M:OnBackKeyDown()
  if self.bSelfHidden then
    return self:OnHideUIKeyDown()
  else
    self:CloseSelf()
  end
end

function M:OnHideUIKeyDown()
  self.bSelfHidden = not self.bSelfHidden
  if self.bSelfHidden then
    self:SetRenderOpacity(0)
    self.Image_Click.Slot:SetZOrder(10)
  else
    self:SetRenderOpacity(1)
    self.Image_Click.Slot:SetZOrder(-1)
  end
end

function M:OnClickSuitPreviewDialog()
  if self.ShopItemData.SuitRewardId == nil or 0 == #self.ShopItemData.SuitRewardId then
    return
  end
  local Rewards = DataMgr.Reward[self.ShopItemData.SuitRewardId[1]]
  if Rewards then
    local Params = {
      ItemId = Rewards.Id,
      ItemType = Rewards.Type
    }
    UIManager(self):ShowCommonPopupUI(100240, Params, self)
  end
end

function M:OnReplayGesture()
  if self.ShopItemData.ItemType ~= "Resource" then
    return
  end
  self.ActorController.ArmoryPlayer:InvokeResourceBPFunction(self.ShopItemData.TypeId)
end

function M:OnClickDyeingPreview()
  if self.bBlockClickSuitPreview or self.bBlockClickChangeSkin then
    return
  end
  if self.ShopItemData.ItemType ~= "Skin" and self.ShopItemData.ItemType ~= "WeaponSkin" then
    return
  end
  if self.SwitchSuitChecked then
    self.CheckBox_Preview:OnBtnClicked()
  end
  AudioManager(self):PlayUISound(self.Btn_Selective, "event:/ui/common/click_btn_small", nil, nil)
  local Params = {
    Target = self.Params.Target,
    Type = self.Params.Type,
    SkinId = self.Params.SkinId,
    IsPreviewMode = self.IsPreviewMode,
    Parent = self,
    OpenPreviewDyeFromShopItem = true,
    OnCloseCallback = function()
      local Avatar = ArmoryUtils:GetAvatar()
      if self.Params.Type == CommonConst.ArmoryType.Char then
        self.Params.Target = Avatar.Chars[self.Params.Target.Uuid] or self.Params.Target
      else
        self.ActorController.ArmoryHelper.EnableCameraScrolling = false
        self.Params.Target = Avatar.Weapons[self.Params.Target.Uuid] or self.Params.Target
      end
    end
  }
  if Params.Target and 1 == Params.Target.Uuid then
    Params.Target.Uuid = Params.SkinId
    local RealAvatar = ArmoryUtils:GetAvatar()
    if RealAvatar and self.Type == CommonConst.ArmoryType.Char and RealAvatar.Chars then
      for CharUuid, RealChar in pairs(RealAvatar.Chars) do
        if RealChar.CharId == Params.Target.CharId then
          Params.Target = RealChar
          Params.bRealCharOrWeapon = true
          break
        end
      end
    elseif self.Type == CommonConst.ArmoryType.Weapon and RealAvatar.Weapons then
      for WeaponUuid, RealWeapon in pairs(RealAvatar.Weapons) do
        if RealWeapon.WeaponId == Params.Target.WeaponId then
          Params.Target = RealWeapon
          Params.bRealCharOrWeapon = true
          break
        end
      end
    end
  elseif Params.Target and 1 ~= Params.Target.Uuid then
    Params.bRealCharOrWeapon = true
  end
  Params.IsPreviewMode = true
  local UIConfig = DataMgr.SystemUI.ArmoryDye
  if self.Parent then
    UIManager(self):LoadUI(UIConst.LoadInConfig, UIConfig.UIName, self.Parent:GetZOrder(), Params)
  else
    UIManager(self):LoadUI(UIConst.LoadInConfig, UIConfig.UIName, 100, Params)
  end
end

function M:OnTabChangeClicked(TabIdx)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  if self.SwitchSuitChecked then
    self.CheckBox_Preview:OnBtnClicked()
  elseif 1 == TabIdx then
    self.ActorController.ExCameraOffset = FVector(40, 0, 0)
    self.ActorController:ChangeSingleWeapon(Avatar.Weapons[Avatar.MeleeWeapon])
    self.ActorController:ChangeWeaponAccessory(self.Params.AccessoryId)
  elseif 2 == TabIdx then
    self.ActorController.ExCameraOffset = FVector(40, 0, 0)
    self.ActorController:ChangeSingleWeapon(Avatar.Weapons[Avatar.RangedWeapon])
    self.ActorController:ChangeWeaponAccessory(self.Params.AccessoryId)
  end
end

function M:ResetPreviewCheckBox()
  local Checked = self.CheckBox_Preview:GetChecked()
  self.CheckBox_Preview.IsChecked = false
  self.CheckBox_Preview.ButtonArea:SetVisibility(ESlateVisibility.Visible)
  self.SwitchSuitChecked = false
  if Checked then
    self.CheckBox_Preview:PlayAnimation(self.CheckBox_Preview.Close_Normal)
  end
end

function M:OnClickPreviousSkin()
  if self.bFirst or self.bBlockClickChangeSkin or self.bBlockClickSuitPreview or self.ShopItemData.SinglePreview then
    return
  end
  self:ResetPreviewCheckBox()
  self.LastItemType = self.ShopItemData.ItemType
  self:SwitchToSkin(self.Index - 1)
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_addMulti", nil, nil)
end

function M:OnClickNextSkin()
  if self.bLast or self.bBlockClickChangeSkin or self.bBlockClickSuitPreview or self.ShopItemData.SinglePreview then
    return
  end
  self:ResetPreviewCheckBox()
  self.LastItemType = self.ShopItemData.ItemType
  self:SwitchToSkin(self.Index + 1)
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_addMulti", nil, nil)
end

function M:SwitchToSkin(targetIndex)
  local SkinInfo = self:GetSkinInfo(targetIndex)
  if not SkinInfo then
    return
  end
  self.ShopItemData = SkinInfo
  if self.ShopItemData.ItemType == "WeaponAccessory" or self.ShopItemData.ItemType == "CharAccessory" then
    AudioManager(self):PlayItemSound(self, self.ShopItemData.TypeId, "Equip", self.ShopItemData.ItemType)
  end
  self:UpdateUI()
  self:PlayAnimation(self.Change)
  self:BlockAllUIInput(true)
end

function M:UpdateUI()
  self.Avatar = GWorld:GetAvatar()
  if not self.Avatar then
    return
  end
  self.Btn_Selective:UnBindEventOnClickedByObj(self)
  if self.ShopItemData.ItemType == "CharAccessory" then
    self.Params = self:UpdateCharAccessoryParams(self.ShopItemData, self.Avatar)
    self:UpdateCharAccessoryDescription(self.ShopItemData)
  elseif self.ShopItemData.ItemType == "WeaponAccessory" then
    self.Params = self:UpdateWeaponAccessoryParams(self.ShopItemData, self.Avatar)
    self:UpdateWeaponAccessoryDescription(self.ShopItemData)
  elseif self.ShopItemData.ItemType == "Skin" then
    self.Params = self:UpdateSkinParams(self.ShopItemData)
    self:UpdateCharSkinDescription(self.ShopItemData)
  elseif self.ShopItemData.ItemType == "WeaponSkin" then
    self.Params = self:UpdateWeaponSkinParams(self.ShopItemData)
  elseif self.ShopItemData.ItemType == "Resource" then
    self.Params = self:UpdateCharGestureParams(self.ShopItemData, self.Avatar)
    self:UpdateCharGestureDescription(self.ShopItemData)
  end
  if not self.ShopItemData.HidePurchase then
    self.CurrentCount = 1
    self.UnitPrice = ShopUtils:GetShopItemPrice(self.ShopItemData.ItemId)
    self.CutoffData = ShopUtils:GetShopItemCutoffData(self.ShopItemData.ItemId)
    if self.CutoffData ~= nil then
      self.WBP_Com_Cost:InitContent({
        ResourceId = self.ShopItemData.PriceType,
        bShowDenominator = false,
        Numerator = self.CutoffData.CutoffPrice
      })
      self.WBP_Com_Cost:SetGamePadIconVisible(false)
      local Resource = DataMgr.Resource[self.ShopItemData.PriceType]
      local Icon = LoadObject(Resource.Icon)
      self.WBP_Com_Cost.Common_Item_Icon:Init({
        Id = self.ShopItemData.PriceType,
        Icon = Icon,
        ItemType = "Resource",
        UIName = "CommonDialog",
        NotInteractive = true,
        IsShowDetails = false,
        IsCantItemSelection = false,
        MenuPlacement = EMenuPlacement.MenuPlacement_MenuRight,
        HandleMouseDown = false,
        HandleKeyDown = false
      })
      self.Text_Undiscounted_Price:SetText(self.ShopItemData.Price)
    else
      self.WBP_Com_Cost:InitContent({
        ResourceId = self.ShopItemData.PriceType,
        bShowDenominator = false,
        Numerator = self.ShopItemData.Price
      })
      self.WBP_Com_Cost:SetGamePadIconVisible(false)
      local Resource = DataMgr.Resource[self.ShopItemData.PriceType]
      local Icon = LoadObject(Resource.Icon)
      self.WBP_Com_Cost.Common_Item_Icon:Init({
        Id = self.ShopItemData.PriceType,
        Icon = Icon,
        ItemType = "Resource",
        UIName = "CommonDialog",
        NotInteractive = true,
        IsShowDetails = false,
        IsCantItemSelection = false,
        MenuPlacement = EMenuPlacement.MenuPlacement_MenuRight,
        HandleMouseDown = false,
        HandleKeyDown = false
      })
      self.Text_Undiscounted_Price:SetText("")
    end
  end
  self.bBlockClickChangeSkin = true
  self.Btn_L.Btn:SetVisibility(ESlateVisibility.HitTestInvisible)
  self.Btn_R.Btn:SetVisibility(ESlateVisibility.HitTestInvisible)
  self:AddTimer(0.6, function(self)
    self.bBlockClickChangeSkin = false
    self.Btn_L.Btn:SetVisibility(ESlateVisibility.Visible)
    self.Btn_R.Btn:SetVisibility(ESlateVisibility.Visible)
  end)
  self:UpdatePreviewActor()
  if self.ShopItemData.ItemType == "WeaponSkin" then
    self:UpdateWeaponSkinDescription(self.ShopItemData)
  end
  if not self.ShopItemData.HidePurchase then
    self.MainTabsStyle.OverridenTopResouces = {
      self.ShopItemData.PriceType,
      100
    }
    if CommonUtils.GetDeviceTypeByPlatformName(self) == "PC" then
      self.Tab_Skin:OverrideTopResource(self.MainTabsStyle.OverridenTopResouces, true)
    elseif CommonUtils.GetDeviceTypeByPlatformName(self) == "Mobile" then
      self.Tab_Skin:OverrideTopResource(self.MainTabsStyle.OverridenTopResouces)
      self.Tab_Skin:ResetDynamicNode()
    end
  end
  if CommonUtils.GetDeviceTypeByPlatformName(self) == "Mobile" then
    self.Tab_Skin.Panel_Tab:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  end
  if self.ShopItemData.SuitRewardId then
    self.Panel_Preview:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self.Text_Preview:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self.Btn_Preview:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self.CheckBox_Preview:SetVisibility(ESlateVisibility.Visible)
  else
    self.Panel_Preview:SetVisibility(ESlateVisibility.Collapsed)
    self.Text_Preview:SetVisibility(ESlateVisibility.Collapsed)
    self.Btn_Preview:SetVisibility(ESlateVisibility.Collapsed)
    self.CheckBox_Preview:SetVisibility(ESlateVisibility.Collapsed)
  end
  if not self.ShopItemData.SinglePreview then
    self.Index, self.bFirst, self.bLast = self:GetSkinIndex(self.ShopItemData.ItemId)
    self.Btn_L:SetVisibility(self.bFirst and ESlateVisibility.Collapsed or ESlateVisibility.SelfHitTestInvisible)
    self.Btn_R:SetVisibility(self.bLast and ESlateVisibility.Collapsed or ESlateVisibility.SelfHitTestInvisible)
  else
    self.Btn_L:SetVisibility(ESlateVisibility.Collapsed)
    self.Btn_R:SetVisibility(ESlateVisibility.Collapsed)
  end
  if not self.ShopItemData.HidePurchase then
    self.Btn_Function:UnBindButtonPerformances()
    self.canPurchase = ShopUtils:CanPurchase(self.ShopItemData, self.ShopItemData.PriceType, ShopUtils:GetShopItemPrice(self.ShopItemData.ItemId))
    local failReason = self.ShopItemData.PurchaseFailRes
    self.WidgetSwitcher_BtnState:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    if 1 == failReason or 6 == failReason then
      self.Panel_Buy:SetVisibility(ESlateVisibility.Collapsed)
      self.WidgetSwitcher_BtnState:SetActiveWidgetIndex(1)
      self.Text_Desc:SetText(GText("UI_SHOP_ALREADYOWNED"))
      self.bForbiddenButton = true
    elseif 2 == failReason or 3 == failReason then
      local CurrentCount = self.Avatar:GetResourceNum(self.ShopItemData.PriceType)
      local Cost = ShopUtils:GetShopItemPrice(self.ShopItemData.ItemId)
      self.Panel_Buy:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
      self.WidgetSwitcher_BtnState:SetActiveWidgetIndex(0)
      self.WBP_Com_Cost:SetIsEnough(CurrentCount >= Cost)
      self.Btn_Function:ForbidBtn(true)
      self.Btn_Function.Button_Area.OnClicked:Add(self, self.PurChase)
      self.bForbiddenButton = false
    elseif 4 == failReason or 5 == failReason then
      self.Panel_Buy:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
      self.WidgetSwitcher_BtnState:SetActiveWidgetIndex(0)
      self.WBP_Com_Cost:SetIsEnough(false)
      self.Btn_Function:ForbidBtn(false)
      self.Btn_Function:BindButtonPerformances()
      self.bForbiddenButton = false
    elseif self.canPurchase then
      self.Panel_Buy:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
      self.WidgetSwitcher_BtnState:SetActiveWidgetIndex(0)
      self.WBP_Com_Cost:SetIsEnough(true)
      self.Btn_Function:ForbidBtn(false)
      self.Btn_Function:BindButtonPerformances()
      self.bForbiddenButton = false
    end
  else
    self.WidgetSwitcher_BtnState:SetVisibility(ESlateVisibility.Collapsed)
    self.Panel_Buy:SetVisibility(ESlateVisibility.Collapsed)
    self.bForbiddenButton = true
  end
  if self.IsGamepadInput then
    self.Key_GamePad_L:SetVisibility((self.bFirst or self.ShopItemData.SinglePreview) and ESlateVisibility.Collapsed or ESlateVisibility.SelfHitTestInvisible)
    self.Key_GamePad_R:SetVisibility((self.bLast or self.ShopItemData.SinglePreview) and ESlateVisibility.Collapsed or ESlateVisibility.SelfHitTestInvisible)
    if self.ShopItemData.SuitRewardId then
      self.Tab_Skin:UpdateSingleBottomKeyInfo(1, self.MenuKeyInfoList)
      self.Tab_Skin:SetSingleBottomKeyInfoVisibility(1, ESlateVisibility.SelfHitTestInvisible)
      self.Key_Preview:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
      self.Btn_Preview:SetVisibility(ESlateVisibility.Collapsed)
    else
      self.Tab_Skin:UpdateSingleBottomKeyInfo(1, {})
      self.Tab_Skin:SetSingleBottomKeyInfoVisibility(1, ESlateVisibility.Collapsed)
      self.Key_Preview:SetVisibility(ESlateVisibility.Collapsed)
    end
    if self.ShopItemData.ItemType == "WeaponAccessory" or self.ShopItemData.ItemType == "CharAccessory" then
      self.Key_Color:SetVisibility(ESlateVisibility.Collapsed)
    else
      self.Key_Color:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    end
  end
  self:UpdateReplayTips()
end

function M:UpdatePreviewActor()
  if not self.Params then
    return
  end
  self.Params.Target = self:CreatePreviewTargetData(self.Params)
  if not self.ActorController then
    self.ActorController = self:CreatePreviewActor(self.Params)
    if self.ShopItemData.ItemType == "WeaponSkin" or self.ShopItemData.ItemType == "WeaponAccessory" then
      self.ActorController.ExCameraOffset = FVector(40, 0, 0)
    end
    self.ActorController:OnOpened()
    self.ActorController.bPlayRoleChangedSound = false
    if self.ShopItemData.ItemType == "Skin" then
      local CharId = DataMgr.Skin[self.ShopItemData.TypeId].CharId
      local CharSkinId = self.ShopItemData.TypeId
      local AppearanceInfo = {
        CharId = CharId,
        SkinId = CharSkinId,
        AccessorySuit = {}
      }
      self.ActorController:ChangeCharAppearance(AppearanceInfo)
      self.ActorController:SetMontageAndCamera("Char", nil, nil)
    elseif self.ShopItemData.ItemType == "WeaponSkin" then
      self.ActorController:ChangeWeaponSkin(self.ShopItemData.TypeId)
      local Tag = self.Params.Target:HasTag("Melee") and "Melee" or "Ranged"
      self.ActorController:SetMontageAndCamera("Weapon", Tag)
      self.ActorController.ArmoryHelper.EnableCameraScrolling = false
    elseif self.ShopItemData.ItemType == "Resource" then
      self:ClearCharAccessory()
      self.ActorController:ChangeWeaponModel(self.Avatar.Weapons[self.Avatar.MeleeWeapon])
      self.ActorController:ChangeWeaponModel(self.Avatar.Weapons[self.Avatar.RangedWeapon])
      self.EffectCreatureHideTags = {}
      if self.ActorController.ArmoryPlayer.EffectCreatureHideTags then
        for k, v in pairs(self.ActorController.ArmoryPlayer.EffectCreatureHideTags) do
          self.EffectCreatureHideTags[k] = v
          self.ActorController.ArmoryPlayer:HideAllEffectCreature(k, false)
        end
      end
      self.ActorController:SetArmoryMontageTag(self.ActorController.ArmoryPlayer, "Armory")
      local GestureData = DataMgr.Resource[self.ShopItemData.TypeId]
      self.ActorController:SetArmoryCameraTag(GestureData.CameraName or "Char", "", "")
      self.ActorController.ArmoryPlayer:InvokeResourceBPFunction(self.ShopItemData.TypeId)
    end
    if self.Params.AccessoryId then
      self:UpdateAccessoryCamera(self.Params.AccessoryId, self.Params.AccessoryType)
      if self.Params.Type == CommonConst.ArmoryType.Char then
        self:ClearCharAccessory()
        if self.Params.AccessoryType == CommonConst.CharAccessoryTypes.FX_Body or self.Params.AccessoryType == CommonConst.CharAccessoryTypes.FX_Footprint or self.Params.AccessoryType == CommonConst.CharAccessoryTypes.FX_Teleport or self.Params.AccessoryType == CommonConst.CharAccessoryTypes.FX_Dead then
          self.ActorController:ShowPlayerFXAccessory(self.Params.AccessoryId, self.Params.AccessoryType)
          if self.Params.AccessoryType == CommonConst.CharAccessoryTypes.FX_Footprint then
            self.ActorController:HidePlayerActor(self.UIName, true)
          end
        else
          self.ActorController:StopPlayerMontage()
          self.ActorController:ChangeCharAccessory(self.Params.AccessoryId, self.Params.AccessoryType)
        end
      else
        self.ActorController:ChangeWeaponAccessory(self.Params.AccessoryId)
        self.ActorController.ArmoryHelper.EnableCameraScrolling = false
      end
    end
  else
    self.ActorController:StopPlayerFX()
    self.ActorController:DestoryCreature(CommonConst.CharAccessoryTypes.FX_Dead)
    self.ActorController:DestoryCreature(CommonConst.CharAccessoryTypes.FX_Body)
    if self.ActorController.ArmoryPlayer then
      self.ActorController.ArmoryPlayer:RemoveAllEffectCreature()
    end
    if self.ShopItemData.ItemType == "Skin" then
      self.ActorController:HidePlayerActor(self.UIName, false)
      self:HidePlayerWeapon(true)
      self:HideSingleWeapon(true)
      local CharId = DataMgr.Skin[self.ShopItemData.TypeId].CharId
      local CharSkinId = self.ShopItemData.TypeId
      local AppearanceInfo = {
        CharId = CharId,
        SkinId = CharSkinId,
        AccessorySuit = {}
      }
      self.Params.Target = self:CreatePreviewTargetData({Type = "Char", SkinId = CharSkinId})
      self.ActorController.bStandaloneWeapon = false
      self.ActorController.ArmoryHelper:SetOriginalRotation(FRotator(0, 90, 0))
      self.ActorController.ExCameraOffset = FVector(0, 0, 0)
      self.ActorController:ChangeCharModel(self.Params.Target, true, true)
      self.ActorController.ArmoryHelper:SetPlayer(self.ActorController.ArmoryPlayer)
      self.ActorController:ChangeCharAppearance(AppearanceInfo)
      self.ActorController.DelayFrame = 30
      self.ActorController:SetMontageAndCamera("Char", nil, nil)
    elseif self.ShopItemData.ItemType == "WeaponSkin" then
      self.ActorController:HidePlayerActor(self.UIName, true)
      self:HidePlayerWeapon(true)
      local WeaponData = self:CreatePreviewTargetData({
        Type = "Weapon",
        SkinId = self.ShopItemData.TypeId
      })
      self.ActorController.bStandaloneWeapon = true
      self.ActorController.ExCameraOffset = FVector(40, 0, 0)
      self.ActorController:ChangeSingleWeapon(WeaponData)
      self.ActorController:ChangeWeaponSkin(self.ShopItemData.TypeId)
      self.ActorController.ArmoryHelper.EnableCameraScrolling = false
    elseif self.ShopItemData.ItemType == "CharAccessory" then
      self.ActorController:HidePlayerActor(self.UIName, false)
      self:HidePlayerWeapon(true)
      self:HideSingleWeapon(true)
      local AccessoryData = DataMgr.CharAccessory[self.ShopItemData.TypeId]
      local Char = self.Avatar.Chars[self.Avatar.CurrentChar]
      local CharSkinId = Char.AppearanceSuits[Char.CurrentAppearanceIndex].SkinId
      local Params = {Type = "Char", SkinId = CharSkinId}
      local Data = self:CreatePreviewTargetData(Params)
      self.ActorController.ArmoryHelper:SetOriginalRotation(FRotator(0, 90, 0))
      self.ActorController.ExCameraOffset = FVector(0, 0, 0)
      self.ActorController:ChangeCharModel(Data, true, true)
      local AppearanceInfo = {
        CharId = Char.CharId,
        SkinId = CharSkinId,
        AccessorySuit = {}
      }
      self.ActorController:ChangeCharAppearance(AppearanceInfo)
      self.ActorController.ArmoryHelper:SetPlayer(self.ActorController.ArmoryPlayer)
      self.ActorController.bPlaySameMontage = true
      self:UpdateAccessoryCamera(AccessoryData.AccessoryId, AccessoryData.AccessoryType)
      self.ActorController:StopPlayerMontage()
      if self.Params.AccessoryType == CommonConst.CharAccessoryTypes.FX_Body or self.Params.AccessoryType == CommonConst.CharAccessoryTypes.FX_Footprint or self.Params.AccessoryType == CommonConst.CharAccessoryTypes.FX_Teleport or self.Params.AccessoryType == CommonConst.CharAccessoryTypes.FX_Dead then
        self.ActorController:ShowPlayerFXAccessory(self.Params.AccessoryId, self.Params.AccessoryType)
        if self.Params.AccessoryType == CommonConst.CharAccessoryTypes.FX_Footprint then
          self.ActorController:HidePlayerActor(self.UIName, true)
        end
      else
        self.ActorController:ChangeCharAccessory(self.Params.AccessoryId, self.Params.AccessoryType)
      end
    elseif self.ShopItemData.ItemType == "WeaponAccessory" then
      self.ActorController:HidePlayerActor(self.UIName, true)
      self:HidePlayerWeapon(true)
      self:HideSingleWeapon(false)
      local WeaponAccessoryData = DataMgr.WeaponAccessory[self.ShopItemData.TypeId]
      if not WeaponAccessoryData then
        return nil
      end
      if 2 == self.Tab_Change.TabIdx then
        self.Tab_Change:BtnSwitchToLeft()
        self.ActorController.ExCameraOffset = FVector(40, 0, 0)
        self.ActorController:ChangeSingleWeapon(self.Avatar.Weapons[self.Avatar.MeleeWeapon])
        self.ActorController:ChangeWeaponAccessory(WeaponAccessoryData.WeaponAccessoryId)
      else
        self.ActorController.ExCameraOffset = FVector(40, 0, 0)
        self.ActorController:ChangeSingleWeapon(self.Avatar.Weapons[self.Avatar.MeleeWeapon], "WeaponAccessory" == self.LastItemType)
        self.ActorController:ChangeWeaponAccessory(WeaponAccessoryData.WeaponAccessoryId)
      end
      self.ActorController.ArmoryHelper.EnableCameraScrolling = false
    elseif self.ShopItemData.ItemType == "Resource" then
      self.ActorController:HidePlayerActor(self.UIName, false)
      self:HidePlayerWeapon(true)
      self:HideSingleWeapon(true)
      local Char = self.Avatar.Chars[self.Avatar.CurrentChar]
      local CharSkinId = Char.AppearanceSuits[Char.CurrentAppearanceIndex].SkinId
      local Params = {Type = "Char", SkinId = CharSkinId}
      local Data = self:CreatePreviewTargetData(Params)
      self.ActorController.ArmoryHelper:SetOriginalRotation(FRotator(0, 90, 0))
      self.ActorController.ExCameraOffset = FVector(0, 0, 0)
      self.ActorController:ChangeCharModel(Data, true, true)
      local AppearanceInfo = {
        CharId = Char.CharId,
        SkinId = CharSkinId,
        AccessorySuit = {}
      }
      self.ActorController:ChangeCharAppearance(AppearanceInfo)
      self.ActorController.ArmoryHelper:SetPlayer(self.ActorController.ArmoryPlayer)
      self.ActorController:SetArmoryMontageTag(self.ActorController.ArmoryPlayer, "Armory")
      self.ActorController.ArmoryPlayer:InvokeResourceBPFunction(self.ShopItemData.TypeId)
      local GestureData = DataMgr.Resource[self.ShopItemData.TypeId]
      self.ActorController:SetArmoryCameraTag(GestureData.CameraName or "Char", "", "")
    end
  end
end

function M:ClearCharAccessory()
  self.ActorController:StopPlayerFX()
  self.ActorController:DestoryCreature(CommonConst.CharAccessoryTypes.FX_Dead)
  self.ActorController:DestoryCreature(CommonConst.CharAccessoryTypes.FX_Body)
  if self.ActorController.ArmoryPlayer then
    self.ActorController.ArmoryPlayer:RemoveAllEffectCreature()
  end
  local Char = self.Avatar.Chars[self.Avatar.CurrentChar]
  local CharSkinId = Char.AppearanceSuits[Char.CurrentAppearanceIndex].SkinId
  local AppearanceInfo = {
    CharId = Char.CharId,
    SkinId = CharSkinId,
    AccessorySuit = {}
  }
  self.ActorController:ChangeCharAppearance(AppearanceInfo)
end

function M:UpdateReplayTips()
  if CommonUtils.GetDeviceTypeByPlatformName(self) == "PC" then
    self.Btn_Selective:BindEventOnClicked(self, self.OnClickDyeingPreview)
    if self.ShopItemData.ItemType == "Resource" then
      self.KeyDownEvents[self.GamePadOpenSuitKey] = self.OnReplayGesture
      self:HideReplayKey(false)
    else
      self.KeyDownEvents[self.GamePadOpenSuitKey] = self.OnClickSuitPreview
      self:HideReplayKey(true)
    end
  elseif CommonUtils.GetDeviceTypeByPlatformName(self) == "Mobile" then
    if self.ShopItemData.ItemType == "Resource" then
      self:Set_Icon(false)
      self.Text_Color:SetText(GText("UI_Replay"))
      self.Btn_Selective:BindEventOnClicked(self, self.OnReplayGesture)
      self.HorizontalBox_Color:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    elseif self.ShopItemData.ItemType == "WeaponAccessory" or self.ShopItemData.ItemType == "CharAccessory" then
      self.HorizontalBox_Color:SetVisibility(ESlateVisibility.Collapsed)
    else
      self:Set_Icon(true)
      self.Text_Color:SetText(GText("UI_SkinPreview_Dye"))
      self.Btn_Selective:BindEventOnClicked(self, self.OnClickDyeingPreview)
      self.HorizontalBox_Color:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    end
  end
end

function M:GetOverrideTopResource()
  return {
    self.ShopItemData.PriceType,
    100
  }
end

function M:PurChase()
  if self.bForbiddenButton or self.bSelfHidden then
    return
  end
  if self.canPurchase then
    AudioManager(self):PlayUISound(self.Btn_Function, "event:/ui/activity/shop_small_btn_click", nil, nil)
  end
  if 2 == self.ShopItemData.PurchaseFailRes then
    UIManager(self):ShowUITip("CommonToastMain", string.format(GText("UI_Shop_Toast_No_Coin"), GText(DataMgr.Resource[self.ShopItemData.PriceType].ResourceName)), 1.0)
    return
  elseif 3 == self.ShopItemData.PurchaseFailRes then
    UIManager(self):ShowUITip("CommonToastMain", string.format(GText("UI_Shop_Toast_Locked"), self.ShopItemData.UnlockLevel), 1.0)
    return
  elseif 4 == self.ShopItemData.PurchaseFailRes then
    local PopUpId = 100136
    local Avatar = GWorld:GetAvatar()
    if not Avatar then
      return
    end
    local ItemName = ItemUtils:GetDropName(self.ShopItemData.TypeId, self.ShopItemData.ItemType)
    local PriceCount = Avatar.Resources[self.ShopItemData.PriceType] and Avatar.Resources[self.ShopItemData.PriceType].Count or 0
    local PopoverText = GText(DataMgr.CommonPopupUIContext[PopUpId].PopoverText)
    if string.find(PopoverText, "&ResourceName&") then
      PopoverText = string.gsub(PopoverText, "&ResourceName&", GText(DataMgr.Resource[CommonConst.Coins.Coin4].ResourceName))
    end
    if string.find(PopoverText, "&ResourceName1&") then
      PopoverText = string.gsub(PopoverText, "&ResourceName1&", GText(DataMgr.Resource[CommonConst.Coins.Coin4].ResourceName))
    end
    if string.find(PopoverText, "&ResourceName2&") then
      PopoverText = string.gsub(PopoverText, "&ResourceName2&", GText(ItemName))
    end
    if string.find(PopoverText, "&Num1&") then
      PopoverText = string.gsub(PopoverText, "&Num1&", self.CurrentCount * self.UnitPrice - PriceCount)
    end
    if string.find(PopoverText, "&Num2&") then
      PopoverText = string.gsub(PopoverText, "&Num2&", self.CurrentCount)
    end
    
    local function Confirm()
      local Coin4Count = 0
      if Avatar.Resources[CommonConst.Coins.Coin4] then
        Coin4Count = Avatar.Resources[CommonConst.Coins.Coin4].Count
      end
      if Coin4Count < self.CurrentCount * self.UnitPrice - PriceCount then
        local function JumpToShop()
          self:CloseSelf()
          
          local UIName = DataMgr.Shop.Shop.ShopUIName
          local ShopMainPage = UIManager(self):GetUIObj(UIName)
          ShopMainPage:InitShop(110, nil, nil, "Shop", nil, nil)
        end
        
        local Params = {}
        Params.Title = GText("UI_COMMONPOP_TITLE_100137")
        Params.ShortText = GText("UI_COMMONPOP_TEXT_100137")
        Params.LeftCallbackObj = self
        Params.RightCallbackObj = self
        Params.RightCallbackFunction = JumpToShop
        UIManager(self):ShowCommonPopupUI(100137, Params, self)
      else
        self:SendExchangeRequest(ShopItemData.ItemId, self.CurrentCount)
      end
    end
    
    local ItemList = {}
    local Coin4Count = Avatar.Resources[CommonConst.Coins.Coin4] and Avatar.Resources[CommonConst.Coins.Coin4].Count or 0
    table.insert(ItemList, {
      ItemId = CommonConst.Coins.Coin4,
      ItemType = CommonConst.ItemType.Resource,
      ItemNum = Coin4Count,
      ItemNeed = self.CurrentCount * self.UnitPrice - PriceCount
    })
    local Params = {
      RightCallbackFunction = Confirm,
      ItemList = ItemList,
      ShortText = PopoverText
    }
    UIManager(self):ShowCommonPopupUI(PopUpId, Params)
    return
  elseif 5 == self.ShopItemData.PurchaseFailRes then
    local function JumpToShop(self)
      self:CloseSelf()
      
      local UIName = DataMgr.Shop.Shop.ShopUIName
      local ShopMainPage = UIManager(self):GetUIObj(UIName)
      ShopMainPage:InitShop(110, nil, nil, "Shop", nil, nil)
    end
    
    local PopupId
    if self.ShopItemData.PriceType == CommonConst.Coins.Coin1 then
      PopupId = 100137
    elseif self.ShopItemData.PriceType == CommonConst.Coins.Coin4 then
      PopupId = 100263
    end
    if not PopupId then
      return
    end
    local Params = {}
    Params.LeftCallbackObj = self
    Params.RightCallbackObj = self
    Params.RightCallbackFunction = JumpToShop
    UIManager(self):ShowCommonPopupUI(PopupId, Params, self)
    return
  end
  local RemainTimes = ShopUtils:GetShopItemPurchaseLimit(self.ShopItemData.ItemId)
  local CommonPopupUIID
  if self.ShopItemData.ItemType == "CharAccessory" or self.ShopItemData.ItemType == "WeaponAccessory" or self.ShopItemData.ItemType == "Skin" or self.ShopItemData.ItemType == "WeaponSkin" or "Resource" == self.ShopItemData.ItemType then
    if 0 == RemainTimes then
      CommonPopupUIID = 100042
    else
      CommonPopupUIID = 100041
    end
  end
  if not CommonPopupUIID then
    return
  end
  local Funds = {}
  Funds[1] = {}
  Funds[1].FundId = self.ShopItemData.PriceType
  Funds[1].FundNeed = ShopUtils:GetShopItemPrice(self.ShopItemData.ItemId)
  UIManager(self):ShowCommonPopupUI(CommonPopupUIID, {
    ShopItemData = self.ShopItemData,
    ShopType = 0,
    Funds = Funds,
    ShowParentTabCoin = true,
    SingleItemNotInteractive = true,
    LeftCallbackObj = self,
    LeftCallbackFunction = function()
      local SkinPreview = UIManager(self):GetUIObj("SkinPreview")
      if SkinPreview then
        SkinPreview:SetFocus()
      end
    end,
    RightCallbackObj = self,
    RightCallbackFunction = function()
      self:PurchaseShopItem()
    end,
    ForbiddenRightCallbackObj = self,
    ForbiddenRightCallbackFunction = function(Obj, PackageData)
      PackageData.Content_1.CallFunc(PackageData.Content_1.CallObj)
    end,
    DontFocusParentWidget = true,
    CloseBtnCallbackObj = self,
    CloseBtnCallbackFunction = function()
      local SkinPreview = UIManager(self):GetUIObj("SkinPreview")
      if SkinPreview then
        SkinPreview:SetFocus()
      end
    end,
    ForbidRightBtn = not self.canPurchase
  }, self)
end

function M:PurchaseShopItem()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  if DataMgr.ShopItem2PayGoods[self.ShopItemData.ItemId] then
    local Avatar = GWorld:GetAvatar()
    if not Avatar then
      return false
    end
    if not HeroUSDKSubsystem():IsHeroSDKEnable() then
      local GMFunctionLibrary = require("BluePrints.UI.GMInterface.GMFunctionLibrary")
      GMFunctionLibrary.ExecConsoleCommand(self:GetGameInstance(), "sgm pgi " .. DataMgr.ShopItem2PayGoods[self.ShopItemData.ItemId])
      return
    end
    Avatar:RequestPay(DataMgr.ShopItem2PayGoods[self.ShopItemData.ItemId], function(ret, OrderId, CallbackUrl)
      if not ErrorCode:Check(ret) then
        return
      end
      local PaymentParameters = FHeroUPaymentParameters()
      PaymentParameters.goodsId = DataMgr.ShopItem2PayGoods[self.ShopItemData.ItemId]
      PaymentParameters.cpOrder = OrderId
      PaymentParameters.callbackUrl = CallbackUrl
      local GameRoleInfo = HeroUSDKUtils.GenHeroHDCGameRoleInfo()
      HeroUSDKSubsystem():HeroSDKPay(PaymentParameters, GameRoleInfo)
      local TrackInfo = {}
      TrackInfo.product_id = DataMgr.ShopItem2PayGoods[self.ShopItemData.ItemId]
      if self.ShopItemData.ItemId then
        TrackInfo.item_id = self.ShopItemData.ItemId
        TrackInfo.product_type = DataMgr.ShopItem[self.ShopItemData.ItemId].ItemType
      end
      TrackInfo.game_order_id = OrderId
      TrackInfo.order_create_time = TimeUtils.NowTime()
      HeroUSDKSubsystem(self):UploadTrackLog_Lua("charge_client", TrackInfo)
    end)
    return
  end
  if 0 ~= self.ShopItemData.PurchaseFailRes then
    if 1 == self.ShopItemData.PurchaseFailRes then
      UIManager(GWorld.GameInstance):ShowError(ErrorCode.RET_SHOPITEM_REMAIN_PURCHASE_TIMES_EQUAL_ZERO, 1.0, "CommonToastMain")
    elseif 2 == self.ShopItemData.PurchaseFailRes then
      UIManager(self):ShowUITip("CommonToastMain", string.format(GText("UI_Shop_Toast_No_Coin"), GText(DataMgr.Resource[self.ShopItemData.PriceType].ResourceName)), 1.0)
    elseif 3 == self.ShopItemData.PurchaseFailRes then
      UIManager(self):ShowUITip("CommonToastMain", string.format(GText("UI_Shop_Toast_Locked"), self.ShopItemData.UnlockLevel), 1.0)
    elseif 6 == self.ShopItemData.PurchaseFailRes then
      UIManager(GWorld.GameInstance):ShowError(ErrorCode.RET_SHOPITEM_UNIQUE_ALREDAY_OWNED, 1.0, "CommonToastMain")
    end
    return
  end
  self:BlockAllUIInput(true)
  Avatar:PurchaseShopItem(self.ShopItemData.ItemId, 1)
end

function M:RefreshPurchaseState()
  if 0 == ShopUtils:GetShopItemPurchaseLimit(self.ShopItemData.ItemId) then
    self.Panel_Buy:SetVisibility(ESlateVisibility.Collapsed)
    self.WidgetSwitcher_BtnState:SetActiveWidgetIndex(1)
    self.Text_Desc:SetText(GText("UI_SHOP_ALREADYOWNED"))
    self.bForbiddenButton = true
  end
end

function M:CloseSelf()
  self:StopAnimation(self.In)
  self:PlayAnimation(self.Out)
  AudioManager(self):SetEventSoundParam(self, "SkinPreviewIn", {ToEnd = 1})
  if self.ActorController then
    if self.EffectCreatureHideTags then
      for k, v in pairs(self.EffectCreatureHideTags) do
        self.ActorController.ArmoryPlayer:HideAllEffectCreature(k, v)
      end
    end
    self.ActorController:OnClosed()
  end
end

function M:OnKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local KeyDownEvent = self.KeyDownEvents[InKeyName]
  if KeyDownEvent then
    local Reply, IsHandled = KeyDownEvent(self)
    if IsHandled then
      return Reply
    end
  elseif not self.bSelfHidden then
    self.Tab_Skin:Handle_KeyEventOnGamePad(InKeyName)
  end
  return UE4.UWidgetBlueprintLibrary.Handled()
end

function M:OnRepeatKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local RepeatKeyDownEvent = self.RepeatKeyDownEvents[InKeyName]
  if RepeatKeyDownEvent then
    local Reply, IsHandled = RepeatKeyDownEvent(self)
    if IsHandled then
      return Reply
    end
  end
  return UIUtils.Unhandled
end

function M:On_Image_Click_MouseButtonDown(MyGeometry, MouseEvent)
  return self:OnPointerDown(MyGeometry, MouseEvent)
end

function M:OnMouseWheel(MyGeometry, MouseEvent)
  return self:OnMouseWheelScroll(MyGeometry, MouseEvent)
end

function M:OnMouseButtonUp(MyGeometry, MouseEvent)
  return self:OnPointerUp(MyGeometry, MouseEvent)
end

function M:OnMouseMove(MyGeometry, MouseEvent)
  return self:OnPointerMove(MyGeometry, MouseEvent)
end

function M:OnTouchEnded(MyGeometry, InTouchEvent)
  return self:OnPointerUp(MyGeometry, InTouchEvent)
end

function M:OnTouchMoved(MyGeometry, InTouchEvent)
  return self:OnPointerMove(MyGeometry, InTouchEvent)
end

function M:OnCameraScrollBackwardKeyDown()
  self:ScrollCamera(1)
end

function M:OnCameraScrollForwardKeyDown()
  self:ScrollCamera(-1)
end

function M:OnAnalogValueChanged(MyGeometry, InAnalogInputEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InAnalogInputEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if "Gamepad_RightX" == InKeyName then
    if self.ActorController then
      local DeltaX = UKismetInputLibrary.GetAnalogValue(InAnalogInputEvent) * 10
      self.ActorController:OnDragging({X = DeltaX})
    end
    return UIUtils.Handled
  end
  return UIUtils.Unhandled
end

function M:OnMouseCaptureLost()
  self:OnPointerCaptureLost()
end

function M:OnBackgroundClicked()
  if self.bSelfHidden then
    self:OnHideUIKeyDown()
  end
end

function M:OnAnimationFinished(InAnimation)
  if InAnimation == self.Out then
    M.Super.Close(self)
    self:Close()
    self:RefreshShopUI()
  elseif InAnimation == self.In or InAnimation == self.Change then
    self:BlockAllUIInput(false)
  end
end

function M:RefreshShopUI()
  local Shop = UIManager(self):GetLastJumpPage()
  if Shop then
    if Shop.RefreshSubTabData then
      Shop:RefreshSubTabData(Shop.CurSubTabMap, true, true)
    elseif Shop.UpdateShopDetail then
      Shop:UpdateShopDetail(Shop.CurSubTabMap)
    end
    return
  end
  local ShopMain = UIManager(GWorld.GameInstance):GetUIObj("ShopMain")
  if ShopMain then
    ShopMain:RefreshSubTabData(ShopMain.CurSubTabMap, true, true)
  end
  local CommonShopActivity = UIManager(GWorld.GameInstance):GetUIObj("ShopActivity")
  if CommonShopActivity then
    CommonShopActivity:RefreshSubTabData(CommonShopActivity.CurSubTabMap, true, true)
  end
  local ActivityShop = UIManager(GWorld.GameInstance):GetUIObj("ActivityShop")
  if ActivityShop then
    ActivityShop:UpdateShopDetail(ActivityShop.CurSubTabMap)
  end
end

function M:OnUpdateUIStyleByInputTypeChange(CurInputDevice, CurGamepadName)
  M.Super.OnUpdateUIStyleByInputTypeChange(self, CurInputDevice, CurGamepadName)
  if CommonUtils.GetDeviceTypeByPlatformName(self) == "Mobile" then
    return
  end
  self.IsGamepadInput = CurInputDevice == ECommonInputType.Gamepad
  if self.ActorController.ArmoryHelper.EnableCameraScrolling == false then
    self:HideZoomKey(true)
  else
    self:HideZoomKey(false)
  end
  if self.ShopItemData.ItemType ~= "Resource" then
    self:HideReplayKey(true)
  else
    self:HideReplayKey(false)
  end
  if self.IsGamepadInput then
    if self.ShopItemData.SuitRewardId then
      self.Tab_Skin:UpdateSingleBottomKeyInfo(1, self.MenuKeyInfoList)
      self.Key_Preview:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
      self.Btn_Preview:SetVisibility(ESlateVisibility.Collapsed)
    else
      self.Tab_Skin:UpdateSingleBottomKeyInfo(1, {})
    end
    if self.ShopItemData.ItemType == "WeaponAccessory" or self.ShopItemData.ItemType == "CharAccessory" then
      self.Key_Color:SetVisibility(ESlateVisibility.Collapsed)
    else
      self.Key_Color:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    end
    if not self.bFirst and not self.ShopItemData.SinglePreview then
      self.Key_GamePad_L:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    end
    if not self.bLast and not self.ShopItemData.SinglePreview then
      self.Key_GamePad_R:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    end
  else
    if self.ShopItemData.SuitRewardId then
      self.Key_Preview:SetVisibility(ESlateVisibility.Collapsed)
      self.Btn_Preview:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    end
    self.Key_GamePad_L:SetVisibility(ESlateVisibility.Collapsed)
    self.Key_GamePad_R:SetVisibility(ESlateVisibility.Collapsed)
    self.Key_Preview:SetVisibility(ESlateVisibility.Collapsed)
    self.Key_Color:SetVisibility(ESlateVisibility.Collapsed)
  end
end

function M:GetSkinIndex(ShopItemId)
  local Index = self.ShopSkin2Index[ShopItemId]
  local bFirst = 1 == Index
  local bLast = Index == self.SkinCount
  return Index, bFirst, bLast
end

function M:GetSkinInfo(Index)
  local ShopItemId = self.Index2ShopSkin[Index]
  local ShopItemData
  if ShopItemId and DataMgr.ShopItem[ShopItemId] then
    ShopItemData = setmetatable({}, {
      __index = DataMgr.ShopItem[ShopItemId]
    })
  end
  return ShopItemData
end

function M:HidePlayerWeapon(IsHidden)
  if not self.ActorController:GetPlayerWeaponActor() then
    return
  end
  self.ActorController:GetPlayerWeaponActor():SetActorHideTag(self.UIName, IsHidden)
end

function M:HideSingleWeapon(IsHidden)
  if not self.ActorController:GetSingleWeaponActor() then
    return
  end
  self.ActorController:GetSingleWeaponActor():SetActorHideTag(self.UIName, IsHidden)
end

function M:HideZoomKey(IsHidden)
  if CommonUtils.GetDeviceTypeByPlatformName(self) == "Mobile" then
    return
  end
  if IsHidden then
    self.Tab_Skin:UpdateSingleBottomKeyInfo(4, {})
    self.Tab_Skin:SetSingleBottomKeyInfoVisibility(4, ESlateVisibility.Collapsed)
  else
    self.Tab_Skin:UpdateSingleBottomKeyInfo(4, self.ZoomKeyInfoList)
    self.Tab_Skin:SetSingleBottomKeyInfoVisibility(4, ESlateVisibility.SelfHitTestInvisible)
  end
end

function M:HideReplayKey(IsHidden)
  if CommonUtils.GetDeviceTypeByPlatformName(self) == "Mobile" then
    return
  end
  if IsHidden then
    self.Tab_Skin:UpdateSingleBottomKeyInfo(2, {})
    self.Tab_Skin:SetSingleBottomKeyInfoVisibility(2, ESlateVisibility.Collapsed)
  else
    self.Tab_Skin:UpdateSingleBottomKeyInfo(2, self.ReplayKeyInfoList)
    self.Tab_Skin:SetSingleBottomKeyInfoVisibility(2, ESlateVisibility.SelfHitTestInvisible)
  end
end

function M:UpdateSkinNameFontByRarity(Rarity)
  local rarityFontMap = {
    [6] = self.Font_Red,
    [5] = self.Font_Gold,
    [4] = self.Font_Purple,
    [3] = self.Font_Blue
  }
  local fontToSet = rarityFontMap[Rarity]
  if fontToSet then
    self.Text_SkinName:SetFont(fontToSet)
  end
end

AssembleComponents(M)
return M
