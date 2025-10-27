require("UnLua")
local SkillUtils = require("Utils.SkillUtils")
local ArmoryUtils = require("BluePrints.UI.WBP.Armory.ArmoryUtils")
local Handled = UWidgetBlueprintLibrary.Handled()
local M = Class({
  "BluePrints.UI.BP_UIState_C",
  "BluePrints.UI.WBP.Armory.Mod.IntensifyModCommonComp",
  "BluePrints.UI.UI_PC.Common.LSFocusComp"
})

function M:Construct()
  M.Super.Construct(self)
  self.Button_Element.OnHovered:Add(self, self.OnBtnElementHovered)
  self.Button_Element.OnUnhovered:Add(self, self.OnBtnElementUnhovered)
  self.IsAutoFilled = false
  self.ConsumedContentsMap = {}
  self.ConsumedContentsArray = {}
  self.Btn_CloseTip.OnClicked:Add(self, self.OnBackgroundClicked)
  self.assembledComponents = {}
  self.BackGround:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self:AddLSFocusTarget(nil, {
    self.Selective_Listing.Common_Sort_List
  })
  self.WidgetSwitcher_Hint:SetVisibility(UIConst.VisibilityOp.Collapsed)
end

function M:Destruct()
  if self.DestructComp then
    self:DestructComp()
  end
  self.Btn_CloseTip.OnClicked:Clear()
  M.Super.Destruct(self)
end

function M:ReceiveEnterState(StackAction)
  M.Super.ReceiveEnterState(self, StackAction)
  if self.ReceiveEnterStateComp then
    self:ReceiveEnterStateComp()
  end
end

M.CompMap = {
  Enhance = {
    [CommonConst.ArmoryType.Weapon] = "BluePrints.UI.WBP.Armory.CardLevel.CardLevel_C_WeaponComp",
    [CommonConst.ArmoryType.Mod] = "BluePrints.UI.WBP.Armory.Mod.Armory_ModEnhance_Component"
  },
  LevelUp = {
    [CommonConst.ArmoryType.Weapon] = "BluePrints.UI.WBP.Armory.Armory_CharOrWeaponLvup_Component",
    [CommonConst.ArmoryType.Char] = "BluePrints.UI.WBP.Armory.Armory_CharOrWeaponLvup_Component",
    [CommonConst.ArmoryType.Mod] = "BluePrints.UI.WBP.Armory.Mod.Armory_ModLevelUp_Component",
    [CommonConst.ArmoryType.Pet] = "BluePrints.UI.WBP.Armory.Armory_PetLvup_Component"
  },
  BreakLevelUp = {
    [CommonConst.ArmoryType.Weapon] = "BluePrints.UI.WBP.Armory.Armory_CharOrWeaponBreakLvup_Component",
    [CommonConst.ArmoryType.Char] = "BluePrints.UI.WBP.Armory.Armory_CharOrWeaponBreakLvup_Component",
    [CommonConst.ArmoryType.Pet] = "BluePrints.UI.WBP.Armory.Armory_PetBreakLvup_Component"
  }
}

function M:InitUIInfo(Name, IsInUIMode, EventList, ...)
  M.Super.InitUIInfo(self, Name, IsInUIMode, EventList, ...)
  self._Avatar = GWorld:GetAvatar()
  if not self._Avatar then
    DebugPrint(ErrorTag, LXYTag, "WBP_Armory_Intensify_P_C:InitUIInfo", "Avatar\228\184\141\229\173\152\229\156\168")
    return
  end
  local User, Target, SubWidget, Params = ...
  local behaviorType = Params and Params.BehaviourType or "LevelUp"
  local typeCompMap = M.CompMap[behaviorType]
  if not typeCompMap then
    DebugPrint(ErrorTag, LXYTag, "WBP_Armory_Intensify_P_C:InitUIInfo", "behaviorType\229\143\130\230\149\176\233\148\153\232\175\175, behaviorType =", behaviorType)
    return
  else
    local componentName = typeCompMap[User]
    self:SetComponent(componentName)
  end
  self.Target = Target
  self.SubWidget = SubWidget
  self.Params = Params
  self.User = User
  self.SelectedContents = {}
  self.IsSwitch = Params and Params.IsSwitch or false
  self.Selective_Listing:BindEvents(self, {
    OnListItemClicked = self.OnListItemClicked,
    SortFuncion = self.SortSelectiveList,
    OnListItemInited = self.OnListItemInited,
    OnItemIsHoverChanged = self.OnItemIsHoverChanged
  })
  self.VB_Node:ClearChildren()
  self:CallFunctionByBehaviorType(behaviorType, ...)
  if self.Key_Consume then
    self.Key_Consume:CreateCommonKey({
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "RS"}
      },
      Desc = GText("UI_CTL_Armory_Consumables")
    })
    self.Key_Consume:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  local ArmoryMain = UIManager(self):GetArmoryUIObj()
  if ArmoryMain and ArmoryMain.ActorController then
    if User == CommonConst.ArmoryType.Char then
      ArmoryMain.ActorController:SetArmoryCameraTag(User, "LevelUp")
    elseif User == CommonConst.ArmoryType.Weapon then
      ArmoryMain.ActorController:SetArmoryCameraTag(User, "0", "LevelUp")
    elseif User == CommonConst.ArmoryType.Pet then
      local Avatar = GWorld:GetAvatar()
      local CameraTag1
      if 1 == Avatar.Sex then
        CameraTag1 = "Nvzhu"
      else
        CameraTag1 = "Nanzhu"
      end
      ArmoryMain.ActorController:SetArmoryCameraTag(CameraTag1, "LevelUp", nil, User)
    end
  end
  self:SetFocus()
end

function M:CallFunctionByBehaviorType(BehaviorType, ...)
  if self["Init" .. BehaviorType .. "Comp"] then
    return self["Init" .. BehaviorType .. "Comp"](self, ...)
  end
end

function M:InitTab(TitleName)
  local function BackCb()
    self:Close(true)
  end
  
  self.BottomKeyInfo = {
    {
      GamePadInfoList = {
        {Type = "Img", ImgShortPath = "RS"}
      },
      Desc = GText("UI_CTL_Remove")
    },
    {
      GamePadInfoList = {
        {Type = "Img", ImgShortPath = "A"}
      },
      Desc = GText("UI_Controller_Check")
    },
    {
      GamePadInfoList = {
        {Type = "Img", ImgShortPath = "A"}
      },
      Desc = GText("UI_RougeLike_BlessingConfirm")
    },
    {
      GamePadInfoList = {
        {Type = "Img", ImgShortPath = "A"}
      },
      Desc = GText("UI_CTL_Add/Remove")
    },
    {
      KeyInfoList = {
        {
          Type = "Text",
          Text = "Esc",
          ClickCallback = BackCb,
          Owner = self
        }
      },
      GamePadInfoList = {
        {
          Type = "Img",
          ImgShortPath = "B",
          ClickCallback = BackCb,
          Owner = self
        }
      },
      Desc = GText("UI_BACK")
    }
  }
  local TabKeyInfo = {}
  for _, KeyInfo in ipairs(self.BottomKeyInfo) do
    table.insert(TabKeyInfo, KeyInfo)
  end
  local TableInfo = {
    TitleName = TitleName,
    DynamicNode = {
      "Back",
      "BottomKey",
      "ResourceBar"
    },
    BottomKeyInfo = TabKeyInfo,
    InfoCallback = "NotShow",
    BackCallback = BackCb,
    OwnerPanel = self
  }
  self.Tab_Intensify:Init(TableInfo)
  if CommonUtils.GetDeviceTypeByPlatformName(self) == "Mobile" then
    self.Tab_Intensify.Panel_Tab:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  else
    self.Tab_Intensify.Panel_Tab:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  self:ShowRemoveBtn(false)
  self:ShowCheckBtn(false)
  self:ShowChooseBtn(false)
  self:ShowAddAndRemoveBtn(false)
end

function M:AddTabItem(idx)
  if not self.Tab_Intensify then
    return
  end
  local BottomKeyInfo = self.Tab_Intensify.ConfigData.BottomKeyInfo
  BottomKeyInfo[idx] = self.BottomKeyInfo[idx]
end

function M:RemoveTabItem(idx)
  if not self.Tab_Intensify then
    return
  end
  local BottomKeyInfo = self.Tab_Intensify.ConfigData.BottomKeyInfo
  BottomKeyInfo[idx] = {}
end

function M:ShowRemoveBtn(bShow)
  if not self.Tab_Intensify then
    return
  end
  if ModController:IsMobile() then
    return
  end
  if bShow then
    self:AddTabItem(1)
  else
    self:RemoveTabItem(1)
  end
  self.Tab_Intensify:UpdateHotKeyInfo()
end

function M:ShowCheckBtn(bShow)
  if not self.Tab_Intensify then
    return
  end
  if ModController:IsMobile() then
    return
  end
  if bShow then
    self:AddTabItem(2)
  else
    self:RemoveTabItem(2)
  end
  self.Tab_Intensify:UpdateHotKeyInfo()
end

function M:ShowChooseBtn(bShow)
  if not self.Tab_Intensify then
    return
  end
  if ModController:IsMobile() then
    return
  end
  if bShow then
    self:AddTabItem(3)
  else
    self:RemoveTabItem(3)
  end
  self.Tab_Intensify:UpdateHotKeyInfo()
end

function M:ShowAddAndRemoveBtn(bShow)
  if not self.Tab_Intensify then
    return
  end
  if ModController:IsMobile() then
    return
  end
  if bShow then
    self:AddTabItem(4)
  else
    self:RemoveTabItem(4)
  end
  self.Tab_Intensify:UpdateHotKeyInfo()
end

function M:ShowBackBtn(bShow)
  if not self.Tab_Intensify then
    return
  end
  if ModController:IsMobile() then
    return
  end
  if bShow then
    self:AddTabItem(4)
  else
    self:RemoveTabItem(4)
  end
  self.Tab_Intensify:UpdateHotKeyInfo()
end

function M:ItemMenuAnchorChanged(bOpen)
  if bOpen then
    self:ShowBackBtn(false)
  else
    self:ShowBackBtn(true)
  end
end

function M:OnBackgroundClicked()
  EventManager:FireEvent(EventID.OnMenuClose)
  if self.OnBackgroundClickedComp then
    self:OnBackgroundClickedComp()
  end
end

function M:OnExpandList(bListExpand, bRefreshList, bSkip)
  if self.bListExpand == bListExpand and not bRefreshList then
    return
  end
  self.bListExpand = bListExpand
  if bListExpand then
    AudioManager(self):PlayUISound(self, "event:/ui/common/sub_panel_expand", "CardLevel_Selective_Listing_In", nil)
    self.Selective_Listing:SetRenderOpacity(1)
    self.Selective_Listing:StopAnimation(self.Selective_Listing.Out)
    self.Selective_Listing:PlayAnimation(self.Selective_Listing.In)
    self.Panel_Info:SetVisibility(UIConst.VisibilityOp.Collapsed)
    if bRefreshList then
      self:RefreshListComp()
    end
  elseif self.Selective_Listing:IsVisible() then
    AudioManager(self):SetEventSoundParam(self, "CardLevel_Selective_Listing_In", {ToEnd = 1})
    self.Selective_Listing:StopAnimation(self.Selective_Listing.In)
    self.Selective_Listing:PlayAnimation(self.Selective_Listing.Out)
    if bSkip then
      self.Selective_Listing:SetRenderOpacity(0)
    end
    self.Panel_Info:SetVisibility(UIConst.VisibilityOp.Visible)
  end
  if self.OnExpandListComp then
    self:OnExpandListComp(bListExpand, bRefreshList)
  end
end

function M:OnBtnElementHovered()
  self.Stats:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
end

function M:OnBtnElementUnhovered()
  self.Stats:SetVisibility(UIConst.VisibilityOp.Collapsed)
end

function M:SetStars(StarCount)
  self.ListView_Star:ClearListItems()
  for i = 1, StarCount do
    self.ListView_Star:AddItem(NewObject(UIUtils.GetCommonItemContentClass()))
  end
end

function M:ShowItemDetails(bShow, Content, bNotSelect)
  self.bItemDetailsShowed = bShow
  if bShow then
    if self.ItemDetailsContent ~= Content then
      if not self.ItemDetailsContent or self.ItemDetailsContent.Type ~= Content.Type then
        self:RefreshItemDetailWidget(Content)
        self:OnItemTypeChanged(Content.Type)
      end
      self.ItemDetailsWidget:RefreshItemInfo(Content, true)
      if Content.LockType then
        if self:IsContentLocked(Content) then
          self.ItemDetailsWidget.Switcher_Lock:SetActiveWidgetIndex(0)
        else
          self.ItemDetailsWidget.Switcher_Lock:SetActiveWidgetIndex(1)
        end
      end
    end
    self.ItemDetailsWidget:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    self.ItemDetailsWidget:StopAnimation(self.ItemDetailsWidget.Out)
    self.ItemDetailsWidget:PlayAnimation(self.ItemDetailsWidget.In)
    if not bNotSelect then
      Content.IsSelected = true
      if Content.UI then
        Content.UI:SetIsSelected(true)
      end
    end
  elseif self.ItemDetailsWidget then
    self.ItemDetailsWidget:StopAnimation(self.ItemDetailsWidget.In)
    self.ItemDetailsWidget:PlayAnimation(self.ItemDetailsWidget.Out)
    if not bNotSelect and self.ItemDetailsContent then
      self.ItemDetailsContent.IsSelected = false
      if self.ItemDetailsContent.UI then
        self.ItemDetailsContent.UI:SetIsSelected(false)
      end
    end
  end
  self.ItemDetailsContent = Content
  if self.CurInputDeviceType == ECommonInputType.Gamepad then
    self.ItemDetailsWidget.Panel_Controller:SetVisibility(ESlateVisibility.Collapsed)
  end
end

function M:ComparePetLevel(Pet1, Pet2, SortType)
  if not Pet1 or not Pet2 then
    return false
  end
  if not Pet1.Level or not Pet2.Level then
    return false
  end
  SortType = SortType or CommonConst.DESC
  if Pet1.BreakNum and Pet2.BreakNum and Pet1.BreakNum ~= Pet2.BreakNum then
    if SortType == CommonConst.DESC then
      return Pet1.BreakNum > Pet2.BreakNum
    else
      return Pet1.BreakNum < Pet2.BreakNum
    end
  end
  if SortType == CommonConst.DESC then
    return Pet1.Level > Pet2.Level
  end
  return Pet1.Level < Pet2.Level
end

function M:OnItemTypeChanged(Type)
end

function M:IsContentLocked(Content)
  return Content.LockType and 0 ~= Content.LockType
end

function M:GetAllListContent()
  return self.Selective_Listing.AllItemContents
end

function M:OnListItemClicked(ItemContent)
  if not ItemContent.Uuid then
    return
  end
  self:ShowItemDetails(true, ItemContent)
end

function M:OnItemIsHoverChanged(ItemContent, bHovered)
  if not ItemContent.Uuid then
    return
  end
  if self.CurInputDeviceType ~= ECommonInputType.Gamepad then
    return
  end
  if self.bListExpand and not self:IsInLSMode() then
    self:ShowItemDetails(true, ItemContent, true)
  end
end

function M:RefreshItemDetailWidget(Content)
  if self.ItemDetailsWidget then
    self.ItemDetailsWidget:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.ItemDetailsWidget:DestroyObject()
  end
  self.ItemDetailsWidget = self:CreateWidgetNew("ItemDetailsMain")
  self.Selective_Listing:AttachTipsWidget(self.ItemDetailsWidget)
  self.ItemDetailsWidget.Btn_Locked:UnBindEventOnClickedByObj(self)
  if Content.LockType ~= nil then
    self.ItemDetailsWidget:InitLockedEvent({
      LockedButtonClickCallBack = function()
        self:OnDetailLockBtnClickComp()
      end
    })
  end
  self.ItemDetailsWidget:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self:SetFocus()
end

function M:OnKeyDown(MyGeometry, InKeyEvent)
  local IsHandled = false
  local IsHandleGamepadButtonRight = false
  if M.Super.OnKeyDown(self, MyGeometry, InKeyEvent) == UIUtils.Handled then
    IsHandled = true
  end
  if self:OnKeyDownForLSComp(MyGeometry, InKeyEvent) then
    IsHandled = true
  end
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if self.OnKeyDownComp and self:OnKeyDownComp(MyGeometry, InKeyName) then
    IsHandled = true
    IsHandleGamepadButtonRight = true
  end
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) and self.bItemDetailsShowed and self.ItemDetailsWidget and self.ItemDetailsWidget:OnGamePadDown(InKeyName) then
    IsHandled = true
  end
  if not IsHandleGamepadButtonRight and InKeyName == UIConst.GamePadKey.FaceButtonRight then
    self:Close()
    IsHandled = true
  end
  return UIUtils.Handled
end

function M:OnKeyUp(MyGeometry, InKeyEvent)
  local IsHandled = false
  if M.Super.OnKeyUp(self, MyGeometry, InKeyEvent) == UIUtils.Handled then
    IsHandled = true
  end
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if self.OnKeyUpComp and self:OnKeyUpComp(MyGeometry, InKeyName) then
    IsHandled = true
  end
  if IsHandled then
    return UIUtils.Handled
  end
  return UIUtils.UnHandled
end

function M:OnPreviewKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local IsHandled = false
  if self.OnPreviewKeyDownComp then
    if self:OnPreviewKeyDownComp(MyGeometry, InKeyName) then
      IsHandled = true
    end
    if InKeyName == UIConst.GamePadKey.DPadRight or InKeyName == UIConst.GamePadKey.DPadLeft then
      IsHandled = true
    end
  end
  if IsHandled then
    return UE4.UWidgetBlueprintLibrary.Handled()
  end
  return UE4.UWidgetBlueprintLibrary.Unhandled()
end

function M:RefreshBaseInfo()
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
  if IsValid(self.GameInputModeSubsystem) then
    self:RefreshOpInfoByInputDevice(self.GameInputModeSubsystem:GetCurrentInputType(), self.GameInputModeSubsystem:GetCurrentGamepadName())
  end
end

function M:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  if self.RefreshOpInfoByInputDeviceComp then
    self:RefreshOpInfoByInputDeviceComp(CurInputDevice, CurGamepadName)
  end
end

function M:OnFocusReceived(MyGeometry, InFocusEvent)
  if self.OnFocusReceivedComp then
    self:OnFocusReceivedComp(MyGeometry, InFocusEvent)
  end
  return M.Super.OnFocusReceived(self, MyGeometry, InFocusEvent)
end

function M:Show(ShowTag)
  M.Super.Show(self, ShowTag)
  self:RefreshListComp()
end

function M:Close(bForce)
  if self:IsPlayingAnimation(self.Auto_In) then
    return
  end
  if self.CloseComp then
    self:CloseComp()
  end
  if not bForce and self.bListExpand then
    if self.bItemDetailsShowed then
      self:ShowItemDetails(false)
    end
    self:OnExpandList(false, true)
    self:SetFocus()
    return
  end
  if AudioManager(self):IsSoundPlaying(self, "CardLevel_Selective_Listing_In") then
    AudioManager(self):SetEventSoundParam(self, "CardLevel_Selective_Listing_In", {ToEnd = 1})
  end
  if self.User ~= CommonConst.ArmoryType.Mod then
    local ArmoryMain = UIManager(self):GetArmoryUIObj()
    if ArmoryMain then
      ArmoryMain:UpdateMontageAndCamera()
    end
  end
  M.Super.Close(self)
end

function M:RealClose()
  if self.RealCloseComp then
    self:RealCloseComp()
  end
  M.Super.RealClose(self)
end

function M:UpdateWeaponTagIcon()
  local TargetWeapon = self.Target
  local MeleeTags, MeleeTagNames, RangedTags, RangedTagNames = UIUtils.GetAllWeaponTags()
  local WeaponTags, WeaponTagNames, WeaponTag
  if TargetWeapon:HasTag("Melee") then
    WeaponTags, WeaponTagNames = MeleeTags, MeleeTagNames
  else
    WeaponTags, WeaponTagNames = RangedTags, RangedTagNames
  end
  for _, value in ipairs(WeaponTags) do
    if TargetWeapon:HasTag(value) then
      WeaponTag = value
      break
    end
  end
  if WeaponTag then
    self.Panel_Element:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  else
    self.Panel_Element:SetVisibility(UIConst.VisibilityOp.Collapsed)
    return
  end
  local WeaponTagData = DataMgr.WeaponTag[WeaponTag]
  if not WeaponTagData then
    return
  end
  local IconPath = WeaponTagData.Icon or ""
  local AttributeIcon = LoadObject(IconPath)
  self.Image_Element:SetBrushResourceObject(AttributeIcon)
  self.Stats_ListView:ClearListItems()
  for idx, Tag in ipairs(WeaponTags) do
    local Data = DataMgr.WeaponTag[Tag]
    self.Stats_ListView:AddItem(self:NewWeaponTagIconContent(Data and Data.Icon, WeaponTagNames[idx], Tag == WeaponTag))
  end
end

function M:NewWeaponTagIconContent(IconPath, TagName, IsSelected)
  local Obj = NewObject(UIUtils.GetCommonItemContentClass())
  Obj.Icon = IconPath or ""
  Obj.Text = GText(TagName)
  Obj.IsSelected = IsSelected
  return Obj
end

function M:In()
  if self.IsSwitch then
    self:PlayAnimation(self.RefreshMax)
    return
  end
  if CommonUtils.GetDeviceTypeByPlatformName(self) == "Mobile" then
    self.Tab_Intensify:Play_Com_Tab_M_In()
  else
    self.Tab_Intensify:Play_WBP_Com_Tab_P_In()
  end
end

function M:Out()
  if self.Selective_Listing:IsVisible() then
    self.Selective_Listing:WBP_Armory_Selective_Listing_Out()
  end
  self.Tab_Intensify:Play_WBP_Com_Tab_P_Out()
end

function M:SequenceEvent_0()
  if self.Selective_Listing:IsVisible() then
    self.Selective_Listing:WBP_Armory_Selective_Listing_Out()
  end
  self.Tab_Intensify:Play_Com_Tab_M_Out()
end

function M:ShowWarning(Text)
  if not Text then
    self.Panel_Warning:SetVisibility(UIConst.VisibilityOp.Collapsed)
  else
    self.Panel_Warning:SetVisibility(UIConst.VisibilityOp.Visible)
    self.Text_Warning:SetText(Text)
  end
end

function M:RefreshListComp()
end

function M:SortSelectiveList(InOutContentArray, SortBy, SortType)
end

function M:OnListItemInited()
end

function M:OnBackgroundClickedComp()
end

function M:OnDetailLockBtnClickComp()
end

return M
