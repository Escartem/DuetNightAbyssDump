require("UnLua")
local ArmoryUtils = require("BluePrints.UI.WBP.Armory.ArmoryUtils")
local SkillUtils = require("Utils.SkillUtils")
local EMCache = require("EMCache.EMCache")
local M = Class("BluePrints.UI.BP_UIState_C")
local PetBehavior = {
  PetMixStart = "PetMixStart",
  PetMixSuccess = "PetMixSuccess"
}

function M:Construct()
  self.Btn_Confirm:SetText(GText("Pet_Affix_Activat"))
  self.Btn_Confirm:TryOverrideSoundFunc(function()
    AudioManager(self):PlayUISound(nil, "event:/ui/common/click_btn_confirm", nil, nil)
  end)
  self.Btn_Confirm.Button_Area.OnClicked:Add(self, self.OnBtnConfirmClicked)
  self.Btn_Add.OnClicked:Add(self, self.OnBigBtnAdd)
  self.Btn_Switch.Button_Area.OnClicked:Add(self, self.OnSmallBtnAdd)
  self.Entry_Pet_Mix.Button_Area.OnClicked:Add(self, self.OnBtnAddClicked)
  self:BindAllAnimation()
  self.Text_Select:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Entry_Pet_Mix.Text_Select:SetText(GText("Pet_Affix_Fuse_SelectAffix"))
  self.Hint_Locked:SetText(GText("Pet_Affix_UnableFuse_Locked"))
  self:BindToAnimationFinished(self.Finish, {
    self,
    self.OnFinish
  })
  self:AddDispatcher(EventID.OnResourcesChanged, self, self.OnResourcesChanged)
  self:RefreshBaseInfo()
  self:AddDispatcher(EventID.OnPetLocked, self, self.OnPetLocked)
end

function M:ReceiveEnterState(StackAction)
  M.Super.ReceiveEnterState(self, StackAction)
  local ArmoryMain = UIManager(self):GetArmoryUIObj()
  if ArmoryMain then
    self.ArmoryPlayer = ArmoryMain.ActorController.ArmoryPlayer
    self.ArmoryHelper = ArmoryMain.ActorController.ArmoryHelper
    self.ArmoryPlayer:SetActorHideTag("PetMix", true)
  end
end

function M:Destruct()
  self.ArmoryPlayer:SetActorHideTag("PetMix", false)
  self.Btn_Confirm.Button_Area.OnClicked:Clear()
  self.Btn_Add.OnClicked:Clear()
  self.Super.Destruct(self)
end

function M:OnBackKeyDown()
  self:PlayAnimation(self.Out)
  self:Close()
end

function M:Close()
  if self.EffectCreature then
    self.EffectCreature:SetActorHiddenInGame(true)
    self._Player:RemoveEffectCreature(self.EffectCreatureId)
    self.EffectCreature = nil
  end
  self.Super.Close(self)
end

function M:InitUIInfo(Name, IsInUIMode, EventList, ...)
  M.Super.InitUIInfo(self, Name, IsInUIMode, EventList, ...)
  self.Params = (...)
  self.User = self.Params.User
  self.Parent = self.Params.Parent
  self.Target = self.Params.Target
  self.CurEntryContent = CommonUtils:DeepCopy(self.Params.CurEntryContent)
  self.SelectedEntryContent = nil
  self.IsPreviewMode = self.Params.IsPreviewMode
  self._Avatar = GWorld:GetAvatar()
  self.AutoIndex = self.Params.CurEntryContent.Index
  self:InitUI()
  local ArmoryMain = UIManager(self):GetArmoryUIObj()
  if ArmoryMain and ArmoryMain.ActorController then
    local Avatar = GWorld:GetAvatar()
    local CameraTag1
    if 1 == Avatar.Sex then
      CameraTag1 = "Nvzhu"
    else
      CameraTag1 = "Nanzhu"
    end
    if self.User == CommonConst.ArmoryType.Pet then
      ArmoryMain.ActorController:SetArmoryCameraTag(CameraTag1, "Mix", nil, self.User)
    end
  end
end

function M:InitUI()
  self.TabConfigData = {
    TitleName = GText("Pet_Affix_Fuse"),
    LeftKey = "Q",
    RightKey = "E",
    DynamicNode = {"Back", "BottomKey"},
    BottomKeyInfo = {
      {
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "RV",
            Owner = self
          }
        },
        Desc = GText("UI_CTL_Pet_SwitchAffix"),
        bLongPress = false
      },
      {
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "A",
            Owner = self
          }
        },
        Desc = GText("UI_CTL_Pet_Select"),
        bLongPress = false
      },
      {
        KeyInfoList = {
          {
            Type = "Text",
            Text = "Esc",
            ClickCallback = self.OnBackKeyDown,
            Owner = self
          }
        },
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "B",
            ClickCallback = self.OnBackKeyDown
          }
        },
        Desc = GText("UI_BACK"),
        bLongPress = false
      }
    },
    StyleName = "Text",
    BackCallback = self.OnBackKeyDown,
    OwnerPanel = self
  }
  self.Tab_PetMix:Init(self.TabConfigData, true)
  self:InitResourceItem()
  self:InitEntryContent()
  self.Panel_Add:SetVisibility(UIConst.VisibilityOp.Visible)
  self.Entry_Pet_Mix:Init({})
  if self.CurInputDevice == ECommonInputType.MouseAndKeyboard then
    self.Entry_Pet_Mix:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  else
    self.Entry_Pet_Mix:SetVisibility(UIConst.VisibilityOp.Visible)
  end
  self.Entry_Pet_Mix:PlayAnimation(self.Entry_Pet_Mix.In)
  self.Entry_Pet_Mix.WidgetSwitcher_State:SetActiveWidgetIndex(3)
  self.Btn_Switch:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Btn_Confirm:SetGamePadImg("X")
  self.Btn_Confirm:ForbidBtn(true)
  self.VX:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self:PlayAnimation(self.In)
  self:SetFocus()
end

function M:OnResourcesChanged(ResourceId)
  if ResourceId == self.ResourceID then
    self:InitResourceItem()
  end
end

function M:InitResourceItem()
  local ResourceData = DataMgr.PetEntryP[3]
  local resourceConfig = DataMgr.Resource[ResourceData.ResourceID]
  self.ResourceID = ResourceData.ResourceID
  if ResourceData and resourceConfig then
    local Content = {
      ItemType = "Resource",
      ResourceId = ResourceData.ResourceID,
      Count = ResourceData.ResourceCount,
      Icon = resourceConfig.Icon,
      Rarity = resourceConfig.Rarity or 1,
      IsShowDetails = true,
      bShowDenominator = true
    }
    Content.OnMenuOpenChangedEvents = {
      Obj = self,
      Callback = self.OnMenuOpenChanged
    }
    local hasCount = self._Avatar:GetResourceNum(ResourceData.ResourceID) or 0
    Content.Numerator = hasCount
    Content.Denominator = ResourceData.ResourceCount
    if hasCount < ResourceData.ResourceCount then
      self.IsCostEnough = false
    else
      self.IsCostEnough = true
    end
    self.Counsume_Cost:SetVisibility(UIConst.VisibilityOp.Visible)
    self.Counsume_Cost:InitContent(Content)
  end
end

function M:OnMenuOpenChanged(bIsOpen)
  if self.CurInputDevice == ECommonInputType.Gamepad then
    self.Tab_PetMix:SetBottomKeyInfoVisible(not bIsOpen)
    self.Btn_Confirm:SetPCVisibility(bIsOpen)
  end
end

function M:InitEntryContent()
  local Pet = self.Target
  local BreakData = DataMgr.PetBreak[Pet.PetId]
  local MaxEntry = 0
  if BreakData then
    MaxEntry = BreakData[#BreakData].EntryNum or 0
  end
  local UnlockedEntryNum = BreakData[Pet.BreakNum].EntryNum or 0
  self.EntryItemWidgets = {}
  if Pet:IsResourcePet() then
    for i = 1, 4 do
      if self["EntryItem_" .. i] then
        self["EntryItem_" .. i]:SetVisibility(UIConst.VisibilityOp.Collapsed)
      end
    end
    self.EntryItemWidgets = {
      self.EntryItem_3
    }
    if self.EntryItem_3 then
      self.EntryItem_3:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    end
  else
    for i = 1, 4 do
      if self["EntryItem_" .. i] then
        self["EntryItem_" .. i]:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
      end
    end
    if Pet:IsPremium() then
      self.EntryItemWidgets = {
        self.EntryItem_1,
        self.EntryItem_2,
        self.EntryItem_3,
        self.EntryItem_4
      }
    else
      self.EntryItemWidgets = {
        self.EntryItem_1,
        self.EntryItem_2,
        self.EntryItem_3
      }
      self.EntryItem_4:SetVisibility(UIConst.VisibilityOp.Collapsed)
    end
  end
  self.EntryContents = {}
  for i = 1, Pet:IsResourcePet() and 1 or Pet:IsPremium() and 4 or 3 do
    local EntryId = 0 ~= Pet.Entry[i] and Pet.Entry[i] or nil
    local Data = DataMgr.PetEntry[EntryId]
    local Content = {
      Index = i,
      Owner = self,
      OnClicked = self.OnEntryClicked
    }
    if Data then
      Content.EntryId = EntryId
      Content.Name = GText(Data.PetEntryName)
      Content.Rarity = Data.Rarity
      Content.Desc = SkillUtils.CalcPetEntryDesc(EntryId)
    end
    Content.IsEmpty = not EntryId or EntryId <= 0
    Content.IsLocked = UnlockedEntryNum < i
    if self.EntryItemWidgets and self.EntryItemWidgets[i] then
      self.EntryItemWidgets[i]:Init(Content)
      if self.CurInputDevice == ECommonInputType.Gamepad then
        self.EntryItemWidgets[i].Button_Area:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
      else
        self.EntryItemWidgets[i].Button_Area:SetVisibility(UIConst.VisibilityOp.Visible)
      end
    end
    table.insert(self.EntryContents, Content)
  end
  if not self.CurEntryContent then
    return
  end
  if self.CurEntryContent.IsSelected then
    self.Entry_Pet_Now:Init(self.CurEntryContent)
    local selectedIndex = self.CurEntryContent.Index
    if self.EntryItemWidgets and self.EntryItemWidgets[selectedIndex] then
      self.EntryItemWidgets[selectedIndex]:OnBtnClicked()
    end
  else
    local selectedIndex
    if self.AutoIndex then
      selectedIndex = self.AutoIndex
    else
      for i, content in ipairs(self.EntryContents) do
        if not content.IsLocked and content.IsEmpty then
          selectedIndex = i
          break
        end
      end
      selectedIndex = selectedIndex or 1
    end
    if self.EntryItemWidgets and self.EntryItemWidgets[selectedIndex] then
      self.EntryItemWidgets[selectedIndex]:OnBtnClicked()
    end
  end
end

function M:UpdateSelectedEntryItem()
  local Pet = self.Target
  local BreakData = DataMgr.PetBreak[Pet.PetId]
  local MaxEntry = 0
  if BreakData then
    MaxEntry = BreakData[#BreakData].EntryNum or 0
  end
  local UnlockedEntryNum = BreakData[Pet.BreakNum].EntryNum or 0
  local selectedIndex = self.CurEntryContent.Index
  local selectedEntryWidget = self.EntryItemWidgets[selectedIndex]
  if selectedEntryWidget then
    local EntryId = 0 ~= Pet.Entry[selectedIndex] and Pet.Entry[selectedIndex] or nil
    local Data = DataMgr.PetEntry[EntryId]
    local Content = {
      Index = selectedIndex,
      Owner = self,
      OnClicked = self.OnEntryClicked
    }
    if Data then
      Content.EntryId = EntryId
      Content.Name = GText(Data.PetEntryName)
      Content.Rarity = Data.Rarity
      Content.Desc = SkillUtils.CalcPetEntryDesc(EntryId)
    end
    Content.IsEmpty = not EntryId or EntryId <= 0
    Content.IsLocked = UnlockedEntryNum < selectedIndex
    selectedEntryWidget:Init(Content)
    selectedEntryWidget:SetIsSelected(true)
    selectedEntryWidget:PlayAnimation(selectedEntryWidget.RefreshColor)
    AudioManager(self):PlayUISound(nil, "event:/ui/common/light_refresh", nil, nil)
    self.CurEntryContent = Content
  end
  self:BlockAllUIInput(false)
end

function M:OnBtnConfirmClicked()
  if not self.SelectedEntryContent then
    UIManager(self):ShowUITip(UIConst.Tip_CommonToast, GText("Pet_Affix_Fuse_SelectAffix"))
    return
  end
  if not self.IsCostEnough then
    return
  end
  if self.CurEntryContent.IsEmpty then
    self:ReallyMix()
  else
    self:ShowWarningPopup()
  end
end

function M:ShowWarningPopup()
  local Params = {}
  Params.RightCallbackFunction = self.ReallyMix
  Params.RightCallbackObj = self
  UIManager(self):ShowCommonPopupUI(100220, Params)
end

function M:ReallyMix()
  local function CallBack(ErrCode)
    if ErrCode == ErrorCode.RET_SUCCESS then
      self.Parent:UpdateEntryInfos(self.Params.Target)
      
      self.Target = self.Parent.Pet
      if self.CurInputDevice == ECommonInputType.Gamepad then
        self:SetFocus()
      end
      self.VB_Consume:SetVisibility(UIConst.VisibilityOp.Collapsed)
      self.Btn_Switch:SetVisibility(UIConst.VisibilityOp.Collapsed)
      self:PlayAnimation(self.Finish)
      AudioManager(self):PlayUISound(nil, "event:/ui/common/pet_potential_active", nil, nil)
      self:PlayPetVoice(PetBehavior.PetMixStart)
      self.IsFinishing = true
      self.Entry_Pet_Mix.VX_GlowLine:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
      self.Entry_Pet_Now.VX_GlowLine:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    else
      local ErrorCodeData = DataMgr.ErrorCode[ErrCode]
      UIManager(self):ShowUITip(UIConst.Tip_CommonToast, GText(ErrorCodeData.ErrorCodeContent))
      self:BlockAllUIInput(false)
    end
  end
  
  self._Avatar:PetEntryReplace(CallBack, self.Params.Target.UniqueId, self.CurEntryContent.Index, self.SelectedPet.UniqueId, self.SelectedEntryContent.Index)
  self:BlockAllUIInput(true)
  self:AddTimer(5, function()
    self:BlockAllUIInput(false)
  end)
end

function M:OnFinish()
  self:PlayPetVoice(PetBehavior.PetMixSuccess)
  self.Entry_Pet_Mix.WidgetSwitcher_State:SetActiveWidgetIndex(3)
  self.Entry_Pet_Mix.VX_GlowLine:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Entry_Pet_Now:Init(self.SelectedEntryContent)
  self.SelectedEntryContent = nil
  self.Entry_Pet_Now:PlayAnimation(self.Entry_Pet_Now.TextRefresh)
  self.Entry_Pet_Now.VX_GlowLine:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.VX:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.VB_Consume:SetVisibility(UIConst.VisibilityOp.Visible)
  self.Panel_Add:SetVisibility(UIConst.VisibilityOp.Visible)
  self.IsFinishing = false
  if self.CurInputDevice == ECommonInputType.Gamepad then
    self.Btn_Add:SetFocus()
  end
  self.Btn_Switch:SetVisibility(UIConst.VisibilityOp.Collapsed)
  if self.EffectCreature then
    self.EffectCreature:SetActorHiddenInGame(true)
    self._Player:RemoveEffectCreature(self.EffectCreatureId)
    self.EffectCreature = nil
    self.EffectCreatureId = nil
  end
  self.Btn_Confirm:ForbidBtn(true)
  self:InitResourceItem()
  self:AddTimer(self.Entry_Pet_Now.TextRefresh:GetEndTime(), function()
    self:UpdateSelectedEntryItem()
  end)
end

function M:PlayPetVoice(Behavior)
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  local PetData = self.Target:Data()
  local PetNameTag = PetData and PetData.PetNameTag
  if Behavior == PetBehavior.PetMixStart then
    AudioManager(self):StopSound(Player, "PetMixStart")
    AudioManager(self):PlayPetVoice(Player, PetNameTag, "vo_upset", "PetMixStart")
  elseif Behavior == PetBehavior.PetMixSuccess then
    AudioManager(self):StopSound(Player, "PetMixSuccess")
    AudioManager(self):PlayPetVoice(Player, PetNameTag, "vo_happy", "PetMixSuccess")
  end
end

function M:OnBigBtnAdd()
  AudioManager(self):PlayUISound(nil, "event:/ui/common/click_mid", nil, nil)
  self:OnBtnAddClicked()
end

function M:OnSmallBtnAdd()
  AudioManager(self):PlayUISound(nil, "event:/ui/common/click_btn_small", nil, nil)
  self:OnBtnAddClicked()
end

function M:OnBtnAddClicked()
  self:PlayAnimation(self.Clicked)
  local UIConfig = DataMgr.SystemUI.PetMixEntry
  UIManager(self):LoadUINew(UIConfig.UIName, {
    OnDestructObj = self,
    OnDestructCallback2 = self.OnPetMixEntryDestructed,
    Target = self.Target,
    EntryContent = self.CurEntryContent,
    Type = 1
  })
end

function M:OnPetMixEntryDestructed(SelectedPetEntryContent, Pet)
  if not SelectedPetEntryContent then
    return
  end
  if self.IsCostEnough then
    self.Btn_Confirm:ForbidBtn(false)
  else
    self.Btn_Confirm:ForbidBtn(true)
  end
  self.VB_Consume:SetVisibility(UIConst.VisibilityOp.Visible)
  self.VX:SetVisibility(UIConst.VisibilityOp.Visible)
  self.SelectedEntryContent = SelectedPetEntryContent
  self.SelectedPet = Pet
  SelectedPetEntryContent.IsSelected = false
  SelectedPetEntryContent.Owner = self
  SelectedPetEntryContent._OnClicked = self.OnBtnAddClicked
  self.Entry_Pet_Mix:Init(SelectedPetEntryContent)
  self.Entry_Pet_Mix:PlayAnimation(self.Entry_Pet_Mix.In)
  self.Panel_Add:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Btn_Switch:SetVisibility(UIConst.VisibilityOp.Visible)
  self.Entry_Pet_Mix:SetVisibility(UIConst.VisibilityOp.Visible)
  self.Entry_Pet_Mix.Button_Area:SetFocus()
  local PetData = DataMgr.Pet[Pet.UnitId]
  if self.EffectCreatureId and self.EffectCreatureId == PetData.EffectCreatureId then
    ScreenPrint("\228\184\141\229\136\155\229\187\186\229\174\160\231\137\169")
    return
  elseif self.EffectCreatureId and self.EffectCreatureId ~= PetData.EffectCreatureId and self.EffectCreature then
    self.EffectCreature:SetActorHiddenInGame(true)
    self._Player:RemoveEffectCreature(self.EffectCreatureId)
  end
  self.EffectCreatureId = PetData.EffectCreatureId
  local BattlePet = self.ArmoryPlayer:GetBattlePet()
  self._Player = UGameplayStatics.GetPlayerCharacter(self, 0)
  self.EffectCreature = self._Player:CreateEffectCreature(self.EffectCreatureId, FTransform(), true, "Root")
  self.EffectCreature.OwnerPlayer = self.ArmoryPlayer
  local ActorTransform = self.ArmoryPlayer:GetTransform()
  self.EffectCreature:K2_SetActorTransform(FTransform(ActorTransform.Rotation, ActorTransform.Translation, ActorTransform.Scale3D), false, nil, false)
  local MixPetOffset = self:GetDPIAdjustedMixPetOffset()
  self.EffectCreature.SkeletalMesh:K2_AddRelativeLocation(MixPetOffset, false, nil, false)
  self.EffectCreature:SetActorHiddenInGame(false)
  self.EffectCreature.SkeletalMesh:SetTickableWhenPaused(true)
end

function M:OnEntryClicked(Content)
  if not self.CurEntryContent or self.CurEntryContent.Index ~= Content.Index then
    AudioManager(self):PlayUISound(self, "event:/ui/common/pet_potential_click", nil, nil)
  end
  self.Entry_Pet_Now:Init(Content)
  ArmoryUtils:SetContentIsSelected(self.CurEntryContent, false)
  self.CurEntryContent = Content
  ArmoryUtils:SetContentIsSelected(self.CurEntryContent, true)
  if Content and Content.IsLocked then
    self.Btn_Confirm:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.WidgetSwitcher_State:SetActiveWidgetIndex(1)
    return
  else
    self.WidgetSwitcher_State:SetActiveWidgetIndex(0)
  end
  if Content.IsEmpty then
    self.Btn_Confirm:SetText(GText("Pet_Affix_Activat"))
    self.Btn_Confirm:SetVisibility(UIConst.VisibilityOp.Visible)
  else
    self.Btn_Confirm:SetText(GText("Pet_Affix_Replace"))
    self.Btn_Confirm:SetVisibility(UIConst.VisibilityOp.Visible)
  end
end

function M:OnKeyDown(MyGeometry, InKeyEvent)
  local ParentHandled = M.Super.OnKeyDown(self, MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if "Escape" == InKeyName then
    self:OnBackKeyDown()
  end
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) then
    if InKeyName == Const.GamepadFaceButtonRight then
      if self.CounsumeTipActivated or self.Counsume_Cost.Common_Item_Icon.ItemDetails_MenuAnchor.ItemDetailsMenuAnchor:IsOpen() then
        self.CounsumeTipActivated = false
        self.Counsume_Cost:InActivate()
        self.Btn_Add:SetFocus()
        return UIUtils.Handled
      end
      self:OnBackKeyDown()
    elseif InKeyName == Const.RightStickUp then
      if self.CurEntryContent.Index > 1 then
        self.EntryItemWidgets[self.CurEntryContent.Index - 1]:OnBtnClicked()
      end
    elseif InKeyName == Const.RightStickDown then
      if self.CurEntryContent.Index < CommonUtils.Size(self.EntryItemWidgets) then
        self.EntryItemWidgets[self.CurEntryContent.Index + 1]:OnBtnClicked()
      end
    elseif InKeyName == Const.GamepadFaceButtonLeft then
      self:OnBtnConfirmClicked()
    elseif InKeyName == Const.GamepadLeftThumbstick then
      self.Counsume_Cost:Activate()
      self.CounsumeTipActivated = true
    end
  end
  return UIUtils.Handled
end

function M:BindAllAnimation()
  self.Btn_Add.OnHovered:Add(self, self.OnBtnAddHovered)
  self.Btn_Add.OnUnhovered:Add(self, self.OnBtnAddUnhovered)
  self.Btn_Add.OnPressed:Add(self, self.OnBtnAddPressed)
end

function M:OnBtnAddHovered()
  self:PlayAnimation(self.Hover)
end

function M:OnBtnAddUnhovered()
  self:PlayAnimation(self.UnHover)
end

function M:OnBtnAddPressed()
  self:PlayAnimation(self.Press)
end

function M:OnFocusReceived(MyGeometry, InFocusEvent)
  if self.Panel_Add:IsVisible() then
    if not self.Btn_Add:HasAnyUserFocus() then
      self.Btn_Add:SetFocus()
    end
  elseif self.IsFinishing then
    self:SetFocus()
  else
    self.Entry_Pet_Mix.Button_Area:SetFocus()
  end
  self:InitNavigationRules()
  return M.Super.OnFocusReceived(self, MyGeometry, InFocusEvent)
end

function M:InitNavigationRules()
  self.Btn_Add:SetNavigationRuleBase(EUINavigation.Right, EUINavigationRule.Stop)
  self.Entry_Pet_Mix:SetNavigationRuleBase(EUINavigation.Right, EUINavigationRule.Stop)
end

function M:RefreshBaseInfo()
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
  if IsValid(self.GameInputModeSubsystem) then
    self:RefreshOpInfoByInputDevice(self.GameInputModeSubsystem:GetCurrentInputType(), self.GameInputModeSubsystem:GetCurrentGamepadName())
  end
end

function M:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  self.Super.RefreshOpInfoByInputDevice(self, CurInputDevice, CurGamepadName)
  self.CurGamepadName = CurGamepadName
  local IsUseKeyAndMouse = CurInputDevice == ECommonInputType.MouseAndKeyboard
  local ActiveWidgetIndex = IsUseKeyAndMouse and 0 or 1
  if IsUseKeyAndMouse then
    self.Counsume_Cost.Common_Item_Icon:SetVisibility(UIConst.VisibilityOp.Visible)
  else
    self.Counsume_Cost.Common_Item_Icon:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  end
  self.CurInputDevice = CurInputDevice
end

function M:OnPetLocked(ErrCode, UniqueId, IsLocked)
  if not ErrorCode:Check(ErrCode) then
    return
  end
  if not self.SelectedPet then
    return
  end
  if UniqueId == self.SelectedPet.UniqueId then
    if not IsLocked and self.IsCostEnough then
      self.Btn_Confirm:ForbidBtn(true)
    else
      self.Btn_Confirm:ForbidBtn(false)
    end
  else
  end
end

function M:GetDPIAdjustedMixPetOffset()
  local OriginalOffset = self.EffectCreature.MixPetOffset or FVector(0, 63, 25)
  local IsMobile = CommonUtils.GetDeviceTypeByPlatformName(self) == "Mobile"
  if not IsMobile then
    return OriginalOffset
  end
  local DPIScale = self:GetCurrentDPIScale()
  local DeviceScale = self:GetMobileDeviceScale()
  local AdjustedX = OriginalOffset.X * DPIScale * DeviceScale
  local AdjustedY = OriginalOffset.Y * DPIScale * DeviceScale
  local AdjustedZ = OriginalOffset.Z * DPIScale * DeviceScale
  DebugPrint(string.format("PetMix DPI\232\176\131\230\149\180: \229\142\159\229\167\139\229\129\143\231\167\187(%.2f,%.2f,%.2f) -> \232\176\131\230\149\180\229\144\142(%.2f,%.2f,%.2f), DPI\231\188\169\230\148\190:%.2f, \232\174\190\229\164\135\231\188\169\230\148\190:%.2f", OriginalOffset.X, OriginalOffset.Y, OriginalOffset.Z, AdjustedX, AdjustedY, AdjustedZ, DPIScale, DeviceScale))
  return FVector(AdjustedX, AdjustedY, AdjustedZ)
end

function M:GetCurrentDPIScale()
  local HUDScale = EMCache:Get("HUDScale")
  if not HUDScale or 0 == HUDScale then
    local HUDSizeConf = DataMgr.Option.HUDSize
    if HUDSizeConf then
      for i, ValStr in ipairs(HUDSizeConf.UnFoldText) do
        if i == math.floor(tonumber(HUDSizeConf.DefaultValue)) then
          HUDScale = tonumber(table.pack(string.gsub(ValStr, "%%", ""))[1]) * 0.01
          break
        end
      end
    end
    if not HUDScale or 0 == HUDScale then
      HUDScale = 1.0
    end
  end
  return HUDScale
end

function M:GetMobileDeviceScale()
  local ViewportSize = UWidgetLayoutLibrary.GetViewportSize(self)
  local ScreenWidth = ViewportSize.X
  local ScreenHeight = ViewportSize.Y
  local BaseWidth = UIConst.DPIBaseOnSize.Mobile.X
  local BaseHeight = UIConst.DPIBaseOnSize.Mobile.Y
  local WidthScale = ScreenWidth / BaseWidth
  local HeightScale = ScreenHeight / BaseHeight
  local DeviceScale = math.min(WidthScale, HeightScale)
  DeviceScale = math.max(0.5, math.min(2.0, DeviceScale))
  return DeviceScale
end

return M
