local ArmoryUtils = require("BluePrints.UI.WBP.Armory.ArmoryUtils")
local ActorController = require("BluePrints.UI.WBP.Armory.ActorController.Armory_ActorController")
local TimeUtils = require("Utils.TimeUtils")
local EMCache = require("EMCache.EMCache")
local UIUtils = require("Utils.UIUtils")
require("UnLua")
local WBP_SquadBuild_Main_P_C = Class("BluePrints.UI.BP_UIState_C")
local UnHandled = UE.UWidgetBlueprintLibrary.UnHandled()

function WBP_SquadBuild_Main_P_C:Construct()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  Avatar:TryCreateDefaultSquad()
  self.TypeTabs = {
    [self.SlotName2Type[self.ESlotName.RangedWeapon]] = self.List_Build.Type_Range,
    [self.SlotName2Type[self.ESlotName.MeleeWeapon]] = self.List_Build.Type_Melee
  }
  self.List_Build.Type_Range:Init(self.SlotName2Type[self.ESlotName.RangedWeapon], self)
  self.List_Build.Type_Melee:Init(self.SlotName2Type[self.ESlotName.MeleeWeapon], self)
  self.List_Build.Tab_Primary:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self:RegisterBtnIconInGampad()
  self:AddLSFocusTarget(self.List_Build.Sort.Controller, {
    self.List_Build.Sort
  })
end

function WBP_SquadBuild_Main_P_C:Destruct()
  WBP_SquadBuild_Main_P_C.Super.Destruct(self)
  AudioManager(self):SetEventSoundParam(self, "OpenSquad", {ToEnd = 1})
  self:QuitSquadSetting()
end

WBP_SquadBuild_Main_P_C._components = {
  "BluePrints.UI.UI_PC.Common.LSFocusComp",
  "BluePrints.UI.WBP.Abyss.MainComponent.Abyss_CharMainComponent",
  "BluePrints.UI.WBP.Abyss.MainComponent.Abyss_PetMainComponent",
  "BluePrints.UI.WBP.Abyss.MainComponent.Abyss_WeaponMainComponent"
}
local SelectSoundPaths = {
  Char = "event:/ui/armory/click_select_role",
  Weapon = "event:/ui/armory/click_select_weapon",
  Pet = "event:/ui/common/click_select_pet",
  Default = "event:/ui/common/click_mid"
}
local EquipSoundPaths = {
  Char = "event:/ui/common/role_replace",
  Weapon = "event:/ui/common/weapon_replace",
  Pet = "event:/ui/common/role_replace"
}
WBP_SquadBuild_Main_P_C.ESlotName = {
  Char = 1,
  MeleeWeapon = 2,
  RangedWeapon = 3,
  Phantom1 = 4,
  PhantomWeapon1 = 5,
  Phantom2 = 6,
  PhantomWeapon2 = 7,
  Pet = 8,
  Null = 0
}
WBP_SquadBuild_Main_P_C.SlotType2DataType = {
  Char = "Char",
  Pet = "Pet",
  Weapon = "Weapon",
  Ranged = "Weapon",
  Melee = "Weapon"
}
WBP_SquadBuild_Main_P_C.GamepadArea = {
  "SquadList",
  "RightDetatilInSquadList",
  "RightDetatilInSingleSquad"
}
WBP_SquadBuild_Main_P_C.SlotName2Type = {
  [WBP_SquadBuild_Main_P_C.ESlotName.Char] = "Char",
  [WBP_SquadBuild_Main_P_C.ESlotName.Pet] = "Pet",
  [WBP_SquadBuild_Main_P_C.ESlotName.RangedWeapon] = "Ranged",
  [WBP_SquadBuild_Main_P_C.ESlotName.MeleeWeapon] = "Melee",
  [WBP_SquadBuild_Main_P_C.ESlotName.Phantom1] = "Char",
  [WBP_SquadBuild_Main_P_C.ESlotName.PhantomWeapon1] = "Weapon",
  [WBP_SquadBuild_Main_P_C.ESlotName.Phantom2] = "Char",
  [WBP_SquadBuild_Main_P_C.ESlotName.PhantomWeapon2] = "Weapon"
}
WBP_SquadBuild_Main_P_C.SlotName2TextMap = {
  [WBP_SquadBuild_Main_P_C.ESlotName.Char] = GText("UI_Armory_Char"),
  [WBP_SquadBuild_Main_P_C.ESlotName.Pet] = GText("MAIN_UI_PET"),
  [WBP_SquadBuild_Main_P_C.ESlotName.RangedWeapon] = GText("Ranged") .. GText("UI_SHOP_SUBTAB_NAME_WEAPON"),
  [WBP_SquadBuild_Main_P_C.ESlotName.MeleeWeapon] = GText("Melee") .. GText("UI_SHOP_SUBTAB_NAME_WEAPON"),
  [WBP_SquadBuild_Main_P_C.ESlotName.Phantom1] = GText("UI_STAT_Sigil") .. "1",
  [WBP_SquadBuild_Main_P_C.ESlotName.PhantomWeapon1] = GText("UI_STAT_Sigil") .. "1" .. GText("UI_SHOP_SUBTAB_NAME_WEAPON"),
  [WBP_SquadBuild_Main_P_C.ESlotName.Phantom2] = GText("UI_STAT_Sigil") .. "2",
  [WBP_SquadBuild_Main_P_C.ESlotName.PhantomWeapon2] = GText("UI_STAT_Sigil") .. "2" .. GText("UI_SHOP_SUBTAB_NAME_WEAPON")
}

function WBP_SquadBuild_Main_P_C:InitUIInfo(Name, IsInUIMode, EventList, ...)
  self.Super.InitUIInfo(self, Name, IsInUIMode, EventList, ...)
  self.SelectIndex, self.IsOpenAddSquad = ...
  self.IsFromDungeonPage = self.SelectIndex or self.IsOpenAddSquad
  self:InitSquadData()
  self:UpdateGamepadIcon()
  self:InitTabUI()
  self:InitLeftListItemInfo()
  self:SwitchToSquadList(false)
  self:InitTextAndBtn()
  self:HideNpc()
  AudioManager(self):PlayFMODSound(self, nil, "event:/ui/armory/open", "OpenSquad")
end

function WBP_SquadBuild_Main_P_C:OnLoaded(...)
end

function WBP_SquadBuild_Main_P_C:InitRightDetailPanel()
  if self.IsDraging then
    return
  end
  self.CurSelectSquadIndex = self.CurSelectSquadIndex > self.SquadListLen and 1 or self.CurSelectSquadIndex
  if self.CurSelectSquadIndex > self.SquadListLen then
    self.SquadInfo = self.CurSquadInfo
  else
    self.SquadInfo = self.SquadInfoList[self.CurSelectSquadIndex]
  end
  self:InitCurSquadInfo()
  self:UpdateRightDetailPanel()
end

function WBP_SquadBuild_Main_P_C:InitLeftListItemInfo()
  self.TypeTabs = {
    [self.SlotName2Type[self.ESlotName.RangedWeapon]] = self.List_Build.Type_Range,
    [self.SlotName2Type[self.ESlotName.MeleeWeapon]] = self.List_Build.Type_Melee
  }
  self.List_Build.Type_Range:Init(self.SlotName2Type[self.ESlotName.RangedWeapon], self)
  self.List_Build.Type_Melee:Init(self.SlotName2Type[self.ESlotName.MeleeWeapon], self)
  self.List_Build.Tab_Primary:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self:CharMain_InitWidget()
  self:WeaponMain_InitWidget()
  self:PetMain_InitWidget()
end

function WBP_SquadBuild_Main_P_C:HideNpc()
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  local UIManager = GameInstance:GetGameUIManager()
  UIManager:HideNpcActor(true, "StyleOfPlay")
end

function WBP_SquadBuild_Main_P_C:InitTextAndBtn()
  self.Text_Default:SetText(GText("UI_Squad_ListName"))
  self.Text_Has:SetText(self.SquadListLen)
  self.Text_All:SetText(self.SquadMax)
  self.Text_SortTip:SetText(GText("UI_Squad_Adjust_Sort"))
  self.Text_Character:SetText(GText("UI_Armory_Char"))
  self.Text_Phantom01:SetText(GText("UI_Squad_Sigil1"))
  self.Text_Phantom02:SetText(GText("UI_Squad_Sigil2"))
  self.Btn_Add:BindEventOnClicked(self, function()
    AudioManager(self):PlayUISound(nil, "event:/ui/common/click_btn_confirm", nil, nil)
    self:AddSquad()
  end)
  self.Btn_Add:SetText(GText("UI_Squad_Add"))
  self:UpdateBtnInfo(self.Btn_Armory, GText("UI_BAG_Gotoarmory"), self.GoToArmory)
  self:UpdateBtnInfo(self.Btn_Save, GText("UI_RegionMap_Save"), self.SaveSquad)
  self:UpdateBtnInfo(self.Btn_Cancel, GText("UI_RegionMap_Cancel"), self.CancelCreateSquadAndBackToSquadList)
  self:UpdateBtnInfo(self.Btn_Delete, nil, function()
    self:DeleteSquad()
    AudioManager(self):PlayUISound(nil, "event:/ui/common/click_btn_small", nil, nil)
  end)
  self:UpdateBtnInfo(self.Btn_Edit, GText("UI_Squad_Edit"), function()
    self:EditorSquad()
    AudioManager(self):PlayUISound(nil, "event:/ui/common/click_btn_confirm", nil, nil)
  end)
  self:UpdateBtnInfo(self.Btn_EditName, nil, self.EditSquadName)
  self:SwitchBtnPanel("SquadList")
end

function WBP_SquadBuild_Main_P_C:SwitchBtnPanel(PanelType)
  if "SquadList" == PanelType then
    self.HB_Detail:SetVisibility(ESlateVisibility.Collapsed)
    self.HB_Edit:SetVisibility(ESlateVisibility.Visible)
  else
    self.HB_Detail:SetVisibility(ESlateVisibility.Visible)
    self.HB_Edit:SetVisibility(ESlateVisibility.Collapsed)
  end
end

function WBP_SquadBuild_Main_P_C:EditSquadName()
  self.IsFocusList = self:CheckIsInItemList()
  self.IsEditSquadName = true
  self.NameEditDialog = UIManager(self):ShowCommonPopupUI(100133, {
    OnCloseCallbackObj = self,
    OnCloseCallbackFunction = self.OnCloseInputDialogCallback,
    EditTextConfig = {
      Owner = self,
      IsMultiLine = false,
      Text = self.Text_DefaultName:GetText(),
      HintText = GText("UI_Squad_InputHint"),
      TextLimit = DataMgr.GlobalConstant.NicknameMaxLen.ConstantValue,
      bNeedCheckStringSensitive = true,
      OnCheckStringSensitive = function(self, IsSensitive, Name)
        if IsSensitive then
          self:TextCommitted()
        end
      end,
      Events = {
        OnTextChanged = function(self, Text)
          self.SquadNameTemp = Text
          if Text == self.CurSquadInfo.Name then
            self.NameEditDialog:GetButtonBar().Btn_Yes:UnBindEventOnClickedByObj(self)
            self.NameEditDialog:GetButtonBar().Btn_Yes:ForbidBtn(true)
          elseif "" == Text then
            self.NameEditDialog:GetButtonBar().Btn_Yes:UnBindEventOnClickedByObj(self)
            self.NameEditDialog:GetButtonBar().Btn_Yes:ForbidBtn(true)
            self.NameEditDialog:GetButtonBar().Btn_Yes:BindForbidStateExecuteEvent(self, self.NoStrWarning)
          else
            self.NameEditDialog:GetButtonBar().Btn_Yes:ForbidBtn(false)
          end
        end
      }
    },
    Owner = self,
    Title = GText("UI_SquadName_Change")
  }, self)
end

function WBP_SquadBuild_Main_P_C:OnCloseInputDialogCallback()
  self.IsEditSquadName = false
  if self.IsFocusList then
    self:FocusOnItemList()
  else
    self:AddDelayFrameFunc(function()
      self:FocusOnRightDetailPanel()
    end, 2, "DelayFocusItem")
    return
  end
end

function WBP_SquadBuild_Main_P_C:TextCommitted()
  self.Text_DefaultName:SetText(self.SquadNameTemp)
  self:UpdateCurSquadInfo("Name", self.SquadNameTemp)
end

function WBP_SquadBuild_Main_P_C:NoStrWarning()
  self.NameEditDialog.VB_Node:GetChildAt(1):ShowTips(GText("UI_REGISTER_EMPTY"), 2)
end

function WBP_SquadBuild_Main_P_C:AllSlotPlayAnimation(Animation, SlotIndex)
  SlotIndex = SlotIndex and SlotIndex or -1
  for key, value in pairs(self.RightSlots) do
    if value.Index ~= SlotIndex then
      value:StopAllAnimations()
      if "Normal" == Animation and value.PlayNormalAnimation then
        value:PlayNormalAnimation()
      elseif value.Item then
        value.Item:PlayAnimation(value.Item[Animation])
      else
        value:PlayAnimation(value[Animation])
      end
    end
  end
end

function WBP_SquadBuild_Main_P_C:CancelCreateSquadAndBackToSquadList()
  DebugPrint("thy   \229\143\150\230\182\136\231\188\150\232\190\145\231\132\182\229\144\142\232\191\148\229\155\158\233\152\181\229\174\185\229\136\151\232\161\168")
  AudioManager(self):PlayUISound(nil, "event:/ui/common/click_btn_cancel", nil, nil)
  self.IsNeedSave = self:CheckChangeSquadInfo()
  self.IsNeedPlayRefreshAnimation = true
  if self.IsNeedSave then
    if self.CancelPopUI and not self.CancelPopUI.IsClosing then
      return
    end
    self.CancelPopUI = self:ShowCommonPopupUI(100171, self.SwitchToSquadListWithAnimation)
    return
  end
  if self.IsOpenAddSquad then
    self.IsOpenAddSquad = false
    self.IsFromDungeonPage = false
    self:Close()
    return
  end
  self:SwitchToSquadList(true)
end

function WBP_SquadBuild_Main_P_C:JumpToAddSquad()
  self.IsOpenAddSquad = true
  self.IsFromDungeonPage = true
  self:AddSquad()
end

function WBP_SquadBuild_Main_P_C:JumpToEditSquadByIndex(CurIndex)
  self.CurSelectSquadIndex = CurIndex
  self.IsFromDungeonPage = true
  self:SwitchToSquadList(true)
end

function WBP_SquadBuild_Main_P_C:SwitchToSquadListWithAnimation()
  if self.IsOpenAddSquad then
    self.IsOpenAddSquad = false
    self.IsFromDungeonPage = false
    self:Close()
    return
  end
  self:SwitchToSquadList(true)
end

function WBP_SquadBuild_Main_P_C:UpdateBtnInfo(BtnWidget, Text, Callback)
  BtnWidget.Button_Area.OnClicked:Clear()
  BtnWidget.Button_Area.OnClicked:Add(self, Callback)
  if Text then
    BtnWidget:SetText(Text)
  end
end

function WBP_SquadBuild_Main_P_C:DeleteSquad()
  DebugPrint("thy   \229\136\160\233\153\164\233\152\181\229\174\185")
  local Params = {
    RightCallbackObj = self,
    RightCallbackFunction = self.RealDeleteSquad,
    ShortText = string.format(GText("UI_Squad_DeleteReConfirm"), self.CurSquadInfo.Name)
  }
  self.DeleteSquadTips = UIManager(self):ShowCommonPopupUI(100170, Params, self)
end

function WBP_SquadBuild_Main_P_C:RealDeleteSquad()
  local SquadWidget = self:GetSquadWidgetInSquadList(self.CurSelectSquadIndex)
  if not SquadWidget then
    return
  end
  self.Avatar:DeleteSquad(nil, SquadWidget.FakeIndex)
  self.CurSelectSquadIndex = 1
  UIManager(self):ShowUITip("CommonToastMain", GText("UI_Squad_DeleteSuccess"))
end

function WBP_SquadBuild_Main_P_C:EditorSquad()
  DebugPrint("thy   \231\188\150\232\190\145\233\152\181\229\174\185")
  self:UpdateBtnInfo(self.Btn_Save, GText("UI_RegionMap_Save"), self.SaveSquad)
  self:ResetAllSlotsClickState()
  self.Character:OnClickCallback()
end

function WBP_SquadBuild_Main_P_C:SaveSquad()
  DebugPrint("thy   \228\191\157\229\173\152\233\152\181\229\174\185")
  AudioManager(self):PlayUISound(nil, "event:/ui/common/click_btn_confirm", nil, nil)
  local IsMainRoleSlotLack = false
  if self.Btn_Save.IsForbidden then
    if self:CheckForceSlotIsLack() then
      for key, value in pairs(self.PlayerForceSlot) do
        if value.Uuid == "" or value.Uuid == nil then
          value.Item:PlayAnimation(value.Item.FlashRed)
          IsMainRoleSlotLack = true
        end
      end
      if self.PhantomSlot.Head_Phantom01.Uuid and not self.PhantomSlot.Weapon_Phantom01.Uuid then
        self.PhantomSlot.Weapon_Phantom01.Item:PlayAnimation(self.PhantomSlot.Weapon_Phantom01.Item.FlashRed)
      end
      if self.PhantomSlot.Head_Phantom02.Uuid and not self.PhantomSlot.Weapon_Phantom02.Uuid then
        self.PhantomSlot.Weapon_Phantom02.Item:PlayAnimation(self.PhantomSlot.Weapon_Phantom02.Item.FlashRed)
      end
      if IsMainRoleSlotLack then
        UIManager(self):ShowUITip("CommonToastMain", GText("UI_Squad_Essential_Miss"))
      else
        UIManager(self):ShowUITip("CommonToastMain", GText("UI_Squad_Miss_SigilWeapon"))
      end
    elseif not self:CheckChangeSquadInfo() then
      UIManager(self):ShowUITip("CommonToastMain", GText("UI_Squad_NoEdit"))
    end
    return
  end
  if not self:CheckIsFull() then
    self.SaveSquadTip = self:ShowCommonPopupUI(100172, self.RealSaveSquad)
    return
  end
  self:RealSaveSquad()
end

function WBP_SquadBuild_Main_P_C:CheckForceSlotIsLack()
  for key, value in pairs(self.PlayerForceSlot) do
    if value.Uuid == "" or value.Uuid == nil then
      return true
    end
  end
  if self.PhantomSlot.Head_Phantom01.Uuid and not self.PhantomSlot.Weapon_Phantom01.Uuid then
    return true
  end
  if self.PhantomSlot.Head_Phantom02.Uuid and not self.PhantomSlot.Weapon_Phantom02.Uuid then
    return true
  end
  return false
end

function WBP_SquadBuild_Main_P_C:CheckIsFull()
  for WidgetName, Widget in pairs(self.RightSlots) do
    if Widget.IsEmpty then
      return false
    end
  end
  return true
end

function WBP_SquadBuild_Main_P_C:RealSaveSquad()
  local IsNeedSave, Info = self:CheckChangeSquadInfo()
  if self.IsOpenAddSquad then
    self.CurSelectSquadIndex = self.SquadListLen + 1
  end
  if IsNeedSave then
    if self.SquadListLen < self.CurSelectSquadIndex then
      self.Avatar:CreateSquad(nil, Info)
      UIManager(self):ShowUITip("CommonToastMain", GText("UI_Squad_Save") .. self.CurSquadInfo.Name)
    else
      self.Avatar:UpdateSquad(nil, self.CurSelectSquadIndex, Info)
      UIManager(self):ShowUITip("CommonToastMain", GText("UI_EditSuccess"))
    end
  end
  if self.IsOpenAddSquad then
    self.IsOpenAddSquad = false
    self.IsFromDungeonPage = false
    self:Close()
    return
  end
  self.IsNeedPlayRefreshAnimation = true
end

function WBP_SquadBuild_Main_P_C:UpdateCurSquadInfo(Key, value)
  if self.CurSquadInfo then
    self.CurSquadInfo[Key] = value
    self.AddSquadAndEdit = true
    self.Btn_Save:ForbidBtn(self:CheckForceSlotIsLack() or not self:CheckChangeSquadInfo())
  end
end

function WBP_SquadBuild_Main_P_C:CheckChangeSquadInfo()
  if not self.CurSquadInfo then
    return false
  end
  if self.SquadListLen < self.CurSelectSquadIndex then
    if self.AddSquadAndEdit then
      return true, self.CurSquadInfo
    end
    return false
  end
  local Info = {}
  local IsNeedSave = false
  for key, value in pairs(self.CurSquadInfo) do
    if self.SquadInfo and self.SquadInfo[key] ~= value then
      if self.SquadInfo[key] ~= nil or "" ~= value and 0 ~= value then
        Info[key] = value
        IsNeedSave = true
      end
    elseif not self.SquadInfo and "" ~= value and 0 ~= value then
      Info[key] = value
      IsNeedSave = true
    end
  end
  return IsNeedSave, Info
end

function WBP_SquadBuild_Main_P_C:ShowCommonPopupUI(UIId, RightCallback)
  local Params = {}
  Params.RightCallbackObj = self
  Params.RightCallbackFunction = RightCallback
  return UIManager(self):ShowCommonPopupUI(UIId, Params, self)
end

function WBP_SquadBuild_Main_P_C:InitSquadData()
  self.Avatar = GWorld:GetAvatar()
  if not self.Avatar then
    return
  end
  self.SquadList = self.Avatar.Squad
  self.RightSlots = {
    Char = self.Character,
    MeleeWeapon = self.Melee,
    RangedWeapon = self.Ranged,
    Pet = self.Pet,
    Phantom1 = self.Head_Phantom01,
    PhantomWeapon1 = self.Weapon_Phantom01,
    Phantom2 = self.Head_Phantom02,
    PhantomWeapon2 = self.Weapon_Phantom02,
    WheelIndex = self.Roulette
  }
  self.PlayerAboutSlots = {
    Char = self.Character,
    Melee = self.Melee,
    Ranged = self.Ranged,
    Pet = self.Pet
  }
  self.PlayerForceSlot = {
    Char = self.Character,
    Melee = self.Melee,
    Ranged = self.Ranged
  }
  self.PhantomSlot = {
    Head_Phantom01 = self.Head_Phantom01,
    Weapon_Phantom01 = self.Weapon_Phantom01,
    Head_Phantom02 = self.Head_Phantom02,
    Weapon_Phantom02 = self.Weapon_Phantom02
  }
  self.LeftWidgetList = {
    [1] = self.Panel_Default,
    [2] = self.Panel_List,
    [3] = self.Panel_Roulette
  }
  self.CurSelectSquadIndex = self.SelectIndex or 1
  self.SquadMax = DataMgr.GlobalConstant.SquadMax.ConstantValue or 10
  self.IsDraging = false
  self.CurPhantomWeaponType = "Melee"
  self.IsInClickCD = false
  self.ClickCD = 0.3
  self.FirstIn = true
end

function WBP_SquadBuild_Main_P_C:CreateActorController()
  if self.ActorController then
    return
  end
  self.ActorController = ActorController:New({
    ViewUI = self,
    IsPreviewMode = true,
    Char = self.Avatar.Chars[self.SquadInfoList[self.CurSelectSquadIndex].Char],
    bNeedEndCamera = false
  })
  self.ActorController:OnOpened(0)
end

function WBP_SquadBuild_Main_P_C:InitTabUI(Text)
  self.CurTitle = Text
  self.MainTab = {
    TitleName = self.CurTitle or GText("UI_Squad"),
    ShowSquadBuildBtn = true,
    Tabs = {},
    DynamicNode = {"Back", "BottomKey"},
    BottomKeyInfo = {
      {
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "A",
            ClickCallback = self.OnBackKeyDown,
            Owner = self
          }
        },
        Desc = GText("UI_CTL_Squad_Select")
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
            ClickCallback = self.OnBackKeyDown,
            Owner = self
          }
        },
        Desc = GText("UI_BACK")
      }
    },
    BackCallback = self.OnBackKeyDown,
    OwnerPanel = self
  }
  self.Com_Tab:Init(self.MainTab)
end

function WBP_SquadBuild_Main_P_C:InitBottomTab(IsSelect, BtnNum, SelelctText)
  self.MainTab = {
    TitleName = self.CurTitle or GText("UI_Squad"),
    ShowSquadBuildBtn = true,
    Tabs = {},
    DynamicNode = {"Back", "BottomKey"},
    BackCallback = self.OnBackKeyDown,
    OwnerPanel = self
  }
  local BottomKeyInfo
  if 2 == BtnNum then
    if IsSelect then
    end
    BottomKeyInfo = {
      {
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "A",
            Owner = self
          }
        },
        Desc = SelelctText or GText("UI_CTL_Squad_Select") or GText("UI_Tips_Ensure")
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
            ClickCallback = self.OnBackKeyDown,
            Owner = self
          }
        },
        Desc = GText("UI_BACK")
      }
    }
  elseif 3 == BtnNum then
    if self.IsInEditor and self.CurFocusSlot and self.CurFocusSlot.Uuid ~= nil and 0 ~= self.CurFocusSlot.Uuid then
      if IsSelect then
      end
      BottomKeyInfo = {
        {
          GamePadInfoList = {
            {
              Type = "Img",
              ImgShortPath = "Y",
              ClickCallback = self.ClearCurSlot,
              Owner = self
            }
          },
          Desc = GText("UI_CTL_Remove")
        },
        {
          GamePadInfoList = {
            {
              Type = "Img",
              ImgShortPath = "A",
              Owner = self
            }
          },
          Desc = SelelctText or GText("UI_CTL_Squad_Select") or GText("UI_Tips_Ensure")
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
              ClickCallback = self.OnBackKeyDown,
              Owner = self
            }
          },
          Desc = GText("UI_BACK")
        }
      }
    else
      if IsSelect then
      end
      BottomKeyInfo = {
        {
          GamePadInfoList = {
            {
              Type = "Img",
              ImgShortPath = "A",
              Owner = self
            }
          },
          Desc = SelelctText or GText("UI_CTL_Squad_Select") or GText("UI_Tips_Ensure")
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
              ClickCallback = self.OnBackKeyDown,
              Owner = self
            }
          },
          Desc = GText("UI_BACK")
        }
      }
    end
  else
    BottomKeyInfo = {
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
            ClickCallback = self.OnBackKeyDown,
            Owner = self
          }
        },
        Desc = GText("UI_BACK")
      }
    }
  end
  self.MainTab.BottomKeyInfo = BottomKeyInfo
  self.Com_Tab:Init(self.MainTab)
end

function WBP_SquadBuild_Main_P_C:InitBottomTabOnSortStateInGamePad()
  self.MainTab = {
    TitleName = self.CurTitle or GText("UI_Squad"),
    ShowSquadBuildBtn = true,
    Tabs = {},
    DynamicNode = {"Back", "BottomKey"},
    BackCallback = self.OnBackKeyDown,
    OwnerPanel = self
  }
  local BottomKeyInfo = {
    {
      GamePadInfoList = {
        {
          Type = "Img",
          ImgShortPath = "LV",
          Owner = self
        }
      },
      Desc = GText("UI_CTL_Squad_AdjustSorting")
    },
    {
      GamePadInfoList = {
        {
          Type = "Img",
          ImgShortPath = "B",
          ClickCallback = self.OnBackKeyDown,
          Owner = self
        }
      },
      Desc = GText("UI_CTL_Squad_ExitSorting")
    }
  }
  self.MainTab.BottomKeyInfo = BottomKeyInfo
  self.Com_Tab:Init(self.MainTab)
end

function WBP_SquadBuild_Main_P_C:OnBackKeyDown()
  if self.Panel_Tips:IsVisible() then
    self:CloseTips()
    return
  end
  if self.IsInEditor then
    self:CancelCreateSquadAndBackToSquadList()
    return
  end
  self.IsNeedPlayRefreshAnimation = true
  self.IsOpenAddSquad = false
  self.IsFromDungeonPage = false
  self:Close()
end

function WBP_SquadBuild_Main_P_C:SwitchGamePadIconVisibilityBySortState(bShow)
  if self.CurInputDeviceType == ECommonInputType.Gamepad then
    if bShow then
      self.Btn_Add.Key_GamePad:SetVisibility(ESlateVisibility.Visible)
      self.Btn_Edit.Key_GamePad:SetVisibility(ESlateVisibility.Visible)
    else
      self.Btn_Add.Key_GamePad:SetVisibility(ESlateVisibility.Collapsed)
      self.Btn_Edit.Key_GamePad:SetVisibility(ESlateVisibility.Collapsed)
    end
  end
end

function WBP_SquadBuild_Main_P_C:SwitchLeftWidgetByIndex(Index)
  self.CurLeftWidgetIndex = Index
  for key, value in pairs(self.LeftWidgetList) do
    if Index == key then
      self.LeftWidgetList[key]:SetVisibility(ESlateVisibility.Visible)
    else
      self.LeftWidgetList[key]:SetVisibility(ESlateVisibility.Collapsed)
    end
  end
end

function WBP_SquadBuild_Main_P_C:SelectCurSquad(Index)
  for i = 1, self.SquadListLen do
    if self:GetSquadWidgetInSquadList(i) then
      if i == Index then
        if self:GetSquadWidgetInSquadList(i).IsAddSquad then
          return
        end
        self:GetSquadWidgetInSquadList(i).IsSelect = true
        if not self.IsDraging then
          self:GetSquadWidgetInSquadList(i):CheckSortIcon()
          self:GetSquadWidgetInSquadList(i):PlayAnimation(self:GetSquadWidgetInSquadList(i).Click)
        end
      else
        self:GetSquadWidgetInSquadList(i).IsSelect = false
        self:GetSquadWidgetInSquadList(i):CheckSortIcon()
        self:GetSquadWidgetInSquadList(i):PlayAnimation(self:GetSquadWidgetInSquadList(i).Normal)
      end
    end
  end
end

function WBP_SquadBuild_Main_P_C:NewItemContent(Target, Type, Tag)
  local Obj = NewObject(UIUtils.GetCommonItemContentClass())
  Obj.Uuid = Target.Uuid
  Obj.Type = Type
  Obj.Tag = Tag
  Obj.UnitId = Target[Type .. "Id"]
  Obj.UnitName = Target[Type .. "Name"]
  Obj.Rarity = Target[Type .. "Rarity"]
  Obj.Icon = Target:Data().Icon
  Obj.GachaIcon = Target:Data().GachaIcon
  Obj.Level = Target.Level
  Obj.GradeLevel = Target.GradeLevel
  Obj.AnimNameWithCreate = "In_OnlyOpacity"
  local Element = DataMgr["Battle" .. Type][Obj.UnitId].Attribute
  if Element then
    local IconName = "Armory_" .. Element
    Obj.AttrIcon = "/Game/UI/Texture/Dynamic/Atlas/Armory/T_" .. IconName .. ".T_" .. IconName
  end
  Obj.SortPriority = Target:Data().SortPriority or 0
  return Obj
end

function WBP_SquadBuild_Main_P_C:NewPetItemContent(Target)
  local Obj = NewObject(UIUtils.GetCommonItemContentClass())
  Obj.Uuid = Target.UniqueId
  Obj.Type = CommonConst.ArmoryType.Pet
  Obj.Tag = CommonConst.ArmoryType.Pet
  Obj.UnitId = Target.PetId
  local Data = DataMgr.Pet[Obj.UnitId]
  Obj.UnitName = Data.Name
  Obj.Rarity = Data.Rarity
  Obj.Icon = Data.Icon
  Obj.Level = Target.Level
  Obj.BreakNum = Target.BreakNum
  Obj.SortPriority = Data.SortPriority or 0
  return Obj
end

function WBP_SquadBuild_Main_P_C:ResetSquadList()
  self:UpdateSquadListInfo()
  self:UpdateSquadList()
end

function WBP_SquadBuild_Main_P_C:PlayAllSlotRefreshAnimation()
  if not self.IsNeedPlayRefreshAnimation then
    return
  end
  for SlotName, Slot in pairs(self.RightSlots) do
    if Slot.PlayRefreshAnimation then
      Slot:PlayRefreshAnimation()
    end
  end
  self.IsNeedPlayRefreshAnimation = false
end

function WBP_SquadBuild_Main_P_C:ClearCurSlot()
  if self.CurFocusSlot then
    self.CurFocusSlot:ClearSlot()
  else
    self.CurSlot:ClearSlot()
  end
  self:InitBottomTab(false, 2)
end

function WBP_SquadBuild_Main_P_C:CallFunctionByName(FunctionName, ...)
  if self[FunctionName] then
    return self[FunctionName](self, ...)
  end
end

function WBP_SquadBuild_Main_P_C:UpdateUpTabTitleName(Text)
  self:InitTabUI(Text)
end

function WBP_SquadBuild_Main_P_C:PhantomWeaponTypeChanged(Type)
  if Type then
    self.CurPhantomWeaponType = Type
    self.List_Build.Tab_Primary:SetVisibility(ESlateVisibility.Visible)
    self:InitItemVarInfo(Type)
    self:ReInitListItems()
    if "Melee" == Type then
      self.List_Build.Type_Melee:SetIsChecked(true, true)
      self.List_Build.Type_Range:SetIsChecked(false)
    else
      self.List_Build.Type_Range:SetIsChecked(true, true)
      self.List_Build.Type_Melee:SetIsChecked(false)
    end
  else
    self.List_Build.Tab_Primary:SetVisibility(ESlateVisibility.Collapsed)
  end
end

function WBP_SquadBuild_Main_P_C:ReInitListItems()
  self:CallFunctionByName(self.CurSlotType .. "Main_Init")
  self:FillSelectiveList()
end

function WBP_SquadBuild_Main_P_C:InitCurSquadInfo(IsAddSquad)
  self.CurSquadInfo = {
    Name = GText("UI_Squad_ListName") .. self.CurSelectSquadIndex,
    Char = "",
    ModSuit = 0,
    MeleeWeapon = "",
    MeleeWeaponModSuit = 0,
    RangedWeapon = "",
    RangedWeaponModSuit = 0,
    Pet = 0,
    WheelIndex = 1,
    Phantom1 = "",
    PhantomWeapon1 = "",
    Phantom2 = "",
    PhantomWeapon2 = ""
  }
  self.AddSquadAndEdit = false
  if not IsAddSquad and self.SquadInfo then
    for key, value in pairs(self.SquadInfo) do
      self.CurSquadInfo[key] = value
    end
    if "" == self.SquadInfo.Name then
      self.CurSquadInfo.Name = GText("Squad_DefaultName1")
    end
  end
end

function WBP_SquadBuild_Main_P_C:EnterSquadSetting()
end

function WBP_SquadBuild_Main_P_C:QuitSquadSetting()
  self.ActorController:OnClosed()
  self.ActorController:OnDestruct()
end

function WBP_SquadBuild_Main_P_C:CheckThisContentIsEquippedByOtherSlot(Uuid, SlotName)
  for Name, Widget in pairs(self.RightSlots) do
    if Widget.Uuid and Widget.Uuid == Uuid and Widget:GetName() ~= SlotName then
      return true, Name
    end
  end
  return false, nil
end

function WBP_SquadBuild_Main_P_C:CurSlotNameToRightSlotsKey(CurSlotName)
  for Name, Widget in pairs(self.RightSlots) do
    if Widget:GetName() == CurSlotName then
      return Name
    end
  end
end

function WBP_SquadBuild_Main_P_C:GetSquadWidgetInSquadList(CurIndex)
  local Item = self.List_Default:GetItemAt(CurIndex - 1) or self.List_Default:GetItemAt(0)
  return Item.SelfWidget
end

function WBP_SquadBuild_Main_P_C:GetSquadContent(TargetIndex)
  for i = 1, self.SquadListLen do
    local Item = self.List_Default:GetItemAt(i - 1)
    if Item.SelfWidget.FakeIndex == TargetIndex then
      return self.List_Default:GetItemAt(i - 1).SelfWidget
    end
  end
end

function WBP_SquadBuild_Main_P_C:GetSquadContentListIndex(TargetIndex)
  for i = 1, self.SquadListLen do
    local Item = self.List_Default:GetItemAt(i - 1)
    if Item.SelfWidget.FakeIndex == TargetIndex then
      return i
    end
  end
end

function WBP_SquadBuild_Main_P_C:HideOrShowItemInDraging(CurIndex)
  for i = 1, self.SquadListLen do
    local item = self:GetSquadWidgetInSquadList(i)
    if item then
      if i == CurIndex then
        item:HideOrShowItemUIInfo(false)
      else
        item:HideOrShowItemUIInfo(true)
      end
    end
  end
end

function WBP_SquadBuild_Main_P_C:PlaySelectSound(IsSelected, Type)
  if not IsSelected then
    AudioManager(self):PlayUISound(self, SelectSoundPaths.Default, nil, nil)
  else
    AudioManager(self):PlayUISound(self, SelectSoundPaths[Type], nil, nil)
    AudioManager(self):PlayUISound(self, EquipSoundPaths[Type], nil, nil)
  end
end

function WBP_SquadBuild_Main_P_C:SetContentIsChosen(Content, IsChosen)
end

function WBP_SquadBuild_Main_P_C:SwitchToSquadList(NeedAnimation)
  self:SwitchLeftWidgetByIndex(1)
  self.IsInEditor = false
  self:UpdateSquadListInfo()
  self:UpdateSquadList()
  self:CheckSquadListArr()
  self:SwitchBtnPanel("SquadList")
  self:CreateActorController()
  self:UpdateUpTabTitleName(GText("UI_Squad"))
  self:ResetAllSlotsClickState()
  self:AllSlotPlayAnimation("Normal")
  self:InitSquadListUI()
  self:InitRightDetailPanel()
  self:InitCurSquadInfo()
  self:SelectCurSquadInSquadList(nil, true)
  self.Btn_EditName:SetVisibility(ESlateVisibility.Collapsed)
  if self.IsInSortState then
    self:SwitchGamePadIconVisibilityBySortState(false)
  else
    self:SwitchGamePadIconVisibilityBySortState(true)
  end
  if NeedAnimation then
    self:PlayAnimation(self.Auto_In)
  end
  self.Text_Has:SetText(self.SquadListLen)
  self:AddDelayFrameFunc(function()
    self:PlayAllSlotRefreshAnimation()
    if self.CurSelectSquadIndex > self.SquadListLen then
      self.CurSelectSquadIndex = self.SquadListLen
    end
    if self.IsInSortState then
      self:GetSquadWidgetInSquadList(self.CurSelectSquadIndex):CheckArrowState()
      self:SwitchAddSquadItemVisibility(false)
      self:InitBottomTabOnSortStateInGamePad()
      self:FocusOnSquadListInSortState()
      return
    end
    if self.IsDraging then
      self:HideOrShowItemInDraging(self.CurSelectSquadIndex)
      self:SwitchAddSquadItemVisibility(false)
      self:InitBottomTabOnSortStateInGamePad()
      return
    end
    self:FocusOnSquadList()
    self:SwitchAddSquadItemVisibility(true)
    self:HideOrShowItemInDraging()
  end, 2, "DelayShow")
end

function WBP_SquadBuild_Main_P_C:InitSquadListUI()
  if self.SquadListLen > 1 then
    self.Text_SortTip:SetVisibility(ESlateVisibility.Visible)
  else
    self.Text_SortTip:SetVisibility(ESlateVisibility.Collapsed)
  end
end

function WBP_SquadBuild_Main_P_C:SelectCurSquadInSquadList(ParmaIndex, IsOnlyPlayAnimation)
  self.CurSelectSquadIndex = ParmaIndex or self.CurSelectSquadIndex or 1
  self.NeedRemove = false
  self:AddTimer(0.1, function()
    if self:GetSquadWidgetInSquadList(self.CurSelectSquadIndex) and not self.NeedRemove then
      self.IsOnlyPlayAnimation = IsOnlyPlayAnimation
      self:SelectCurSquad(self.CurSelectSquadIndex)
      self.NeedRemove = true
      self:RemoveTimer("SelectCurSquad")
    end
  end, true, 0, "SelectCurSquad", true)
end

function WBP_SquadBuild_Main_P_C:UpdateSquadListInfo()
  self.SquadInfoList = {}
  self.SquadListLen = 0
  self:UpdateSquadListFromAvatar()
  for key, value in pairs(self.SquadList) do
    local SquadInfo = {}
    self.SquadListLen = self.SquadListLen + 1
    SquadInfo.SquadName = value.Name
    for Name, Id in pairs(value.Props) do
      if "Char" == Name or "Phantom1" == Name or "Phantom2" == Name then
        if "" ~= Id and self.Avatar.Chars[Id] then
          SquadInfo[Name .. "Id"] = self.Avatar.Chars[Id].CharId
          SquadInfo[Name] = Id
        end
      elseif self:IsSubstringContained(Name, "ModSuit") then
        SquadInfo[Name] = Id
      elseif self:IsSubstringContained(Name, "Weapon") then
        if "" ~= Id and self.Avatar.Weapons[Id] and 0 ~= self.Avatar.Weapons[Id].WeaponId then
          SquadInfo[Name .. "Id"] = self.Avatar.Weapons[Id].WeaponId
          SquadInfo[Name] = Id
        end
      else
        SquadInfo[Name] = Id
      end
    end
    table.insert(self.SquadInfoList, SquadInfo)
  end
end

function WBP_SquadBuild_Main_P_C:UpdateSquadListFromAvatar()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  self.Avatar = Avatar
  self.SquadList = self.Avatar.Squad
end

function WBP_SquadBuild_Main_P_C:UpdateSquadList()
  local IsScrollDisable = self.List_Default:IsDisableScroll()
  self.List_Default:SetAllowOverscroll(IsScrollDisable)
  self.List_Default:ClearListItems()
  for key, value in pairs(self.SquadInfoList) do
    local Content = NewObject(UIUtils.GetCommonItemContentClass())
    Content.SquadInfo = value
    Content.ClickCallback = self.ClickSelectSquadItem
    Content.IsNeedSort = #self.SquadInfoList > 1
    Content.Owner = self
    Content.Index = key
    Content.IsAddSquad = false
    self.List_Default:AddItem(Content)
  end
  if #self.SquadInfoList < 10 then
    local Content = NewObject(UIUtils.GetCommonItemContentClass())
    Content.Owner = self
    Content.ClickCallback = self.AddSquad
    Content.IsAddSquad = true
    Content.Index = #self.SquadInfoList + 1
    self.List_Default:AddItem(Content)
  end
end

function WBP_SquadBuild_Main_P_C:CheckSquadListArr()
  if self.SquadListLen > 1 then
    self.CanvasPanel_1:SetVisibility(ESlateVisibility.Visible)
  else
    self.CanvasPanel_1:SetVisibility(ESlateVisibility.Collapsed)
  end
  if self.SquadListLen == self.SquadMax then
    self.Btn_Add:SetVisibility(ESlateVisibility.Collapsed)
    self.Hint_Max:SetVisibility(ESlateVisibility.Visible)
    self.Hint_Max.WidgetSwitcher_State:SetActiveWidgetIndex(0)
    self.Hint_Max.Text_Hint_Normal:SetText(GText("UI_Squad_Max"))
  else
    self.Btn_Add:SetVisibility(ESlateVisibility.Visible)
    self.Hint_Max:SetVisibility(ESlateVisibility.Collapsed)
  end
end

function WBP_SquadBuild_Main_P_C:ClickSelectSquadItem(Index)
  DebugPrint("thy    \231\130\185\229\135\187\233\162\132\232\174\190\233\152\181\229\174\185\229\136\151\232\161\168\230\151\182\231\154\132\229\155\158\232\176\131", self.CurSelectSquadIndex, Index, self.IsDraging)
  if self.IsInEditor then
    return
  end
  if self.FirstIn then
    self.FirstIn = false
    return
  end
  if self.CurInputDeviceType == ECommonInputType.Gamepad and self.IsOnlyPlayAnimation then
    self.IsOnlyPlayAnimation = false
    return
  end
  self.IsOnlyPlayAnimation = false
  if self.CurSelectSquadIndex ~= Index then
    self:PlayAnimation(self.Refresh)
  end
  self.SquadInfo = self.SquadInfoList[Index]
  self:InitCurSquadInfo()
  self.CurSelectSquadIndex = Index
  self:InitRightDetailPanel()
  self:UpdateSlotIcon()
end

function WBP_SquadBuild_Main_P_C:AddSquad()
  DebugPrint("thy    \230\150\176\230\183\187\229\138\160\228\184\128\228\184\170\233\162\132\232\174\190\233\152\181\229\174\185\231\154\132\229\155\158\232\176\131")
  self.SquadInfo = nil
  self:ClearAllSlots(true)
  self.CurSelectSquadIndex = self.SquadListLen + 1
  self:InitCurSquadInfo(true)
  self.Text_DefaultName:SetText(self.CurSquadInfo.Name)
  self:ResetAllSlotsClickState()
  self.Character:OnClickCallback()
  self:UpdateUpTabTitleName(GText("UI_Squad_Add"))
  self:PlayAnimation(self.Auto_In)
end

function WBP_SquadBuild_Main_P_C:ResetAllSlotsClickState()
  for key, value in pairs(self.RightSlots) do
    value.IsClicking = false
  end
end

function WBP_SquadBuild_Main_P_C:ClearAllSlots(IsAddSquad)
  for key, value in pairs(self.RightSlots) do
    value:ClearSlot(IsAddSquad)
  end
end

function WBP_SquadBuild_Main_P_C:WeakClearAllSlots()
  for key, value in pairs(self.RightSlots) do
    if value.WeakClearSlotInfo then
      value:WeakClearSlotInfo()
    end
  end
end

function WBP_SquadBuild_Main_P_C:SwitchToSelectItemList(CurSlot, ItemType)
  if self.CurSlot and self.CurSlot ~= CurSlot then
    if self.CurSlot.PlayNormalAnimation then
      self.CurSlot:PlayNormalAnimation()
    else
      self.CurSlot:PlayAnimation(self.CurSlot.Normal)
    end
    self.CurSlot.IsClicking = false
  end
  self.CurSlot = CurSlot
  self.IsInEditor = true
  self.PreContent = self.CurSlot.ItemInfo
  self.CurClickItemInfo = nil
  self:ClearSlotCachedData()
  self:SwitchLeftWidgetByIndex(2)
  self:SwitchBtnPanel()
  self:UpdateUpTabTitleName(GText("UI_Squad_Edit"))
  self:InitItemVarInfo(ItemType)
  self:CallFunctionByName(ItemType .. "Main_Init")
  self:InitSelectiveList()
  self:FillSelectiveList()
  self:ShowOrHidePhantomWeaponUI()
  self:UpdateSlotIcon()
  self.Btn_Save:ForbidBtn(self:CheckForceSlotIsLack() or not self:CheckChangeSquadInfo())
  if self.CurInputDeviceType == ECommonInputType.Gamepad then
    self.Btn_EditName:SetVisibility(ESlateVisibility.HitTestInvisible)
  else
    self.Btn_EditName:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  end
  self:AddDelayFrameFunc(function()
    self:FocusOnRightDetailPanel()
  end, 2, "DelayFocusItem")
  self:PlayAnimation(self.Left_In)
  return
end

function WBP_SquadBuild_Main_P_C:UpdateSlotIcon()
  for WidgetName, Widget in pairs(self.RightSlots) do
    if Widget.AddDelelteIcon then
      Widget:AddDelelteIcon()
    end
    if Widget.CheckIsNeedLackState then
      Widget:CheckIsNeedLackState()
    end
  end
end

function WBP_SquadBuild_Main_P_C:BindEventInListView()
  self.List_Build.List_Select.BP_OnItemClicked:Remove(self, self.ClickListItem)
  self.List_Build.List_Select.BP_OnItemClicked:Add(self, self.ClickListItem)
end

function WBP_SquadBuild_Main_P_C:ShowOrHidePhantomWeaponUI()
  if self:IsSubstringContained(self:CurSlotNameToRightSlotsKey(self.CurSlot:GetName()), "PhantomWeapon") then
    self.List_Build.Image_WeaponBG:SetVisibility(ESlateVisibility.Visible)
    self.List_Build.Tab_Primary:SetVisibility(ESlateVisibility.Visible)
  else
    self.List_Build.Image_WeaponBG:SetVisibility(ESlateVisibility.Collapsed)
    self.List_Build.Tab_Primary:SetVisibility(ESlateVisibility.Collapsed)
  end
end

function WBP_SquadBuild_Main_P_C:UpdateRightDetailPanel()
  self:WeakClearAllSlots()
  self.Text_DefaultName:SetText(self.CurSquadInfo.Name)
  self.Avatar = GWorld:GetAvatar()
  local RoleParams = {
    Uuid = self.SquadInfo.Char,
    Id = self.SquadInfo.CharId,
    ModSuit = self.SquadInfo.ModSuit,
    Type = "Char",
    Owner = self
  }
  self.Character:InitSlot(RoleParams)
  local MeleeWeaponParams = {
    Uuid = self.SquadInfo.MeleeWeapon,
    Id = self.SquadInfo.MeleeWeaponId,
    ModSuit = self.SquadInfo.MeleeWeaponModSuit,
    Type = "Melee",
    Owner = self
  }
  self.Melee:InitSlot(MeleeWeaponParams)
  local RangedWeaponParams = {
    Uuid = self.SquadInfo.RangedWeapon,
    Id = self.SquadInfo.RangedWeaponId,
    ModSuit = self.SquadInfo.RangedWeaponModSuit,
    Type = "Ranged",
    Owner = self
  }
  self.Ranged:InitSlot(RangedWeaponParams)
  local PetParams = {
    Uuid = self.SquadInfo.Pet,
    Id = self.Avatar and self.SquadInfo.Pet and self.Avatar.Pets[self.SquadInfo.Pet] and self.Avatar.Pets[self.SquadInfo.Pet].PetId,
    Type = "Pet",
    Owner = self
  }
  self.Pet:InitSlot(PetParams)
  local Phantom1Params = {
    Uuid = self.SquadInfo.Phantom1,
    Id = self.SquadInfo.Phantom1Id,
    Type = "Char",
    Owner = self
  }
  self.Head_Phantom01:InitSlot(Phantom1Params)
  local Phantom1WeaponParams = {
    Uuid = self.SquadInfo.PhantomWeapon1,
    Id = self.SquadInfo.PhantomWeapon1Id,
    Type = self:GetWeaponTypeById(self.SquadInfo.PhantomWeapon1Id),
    Owner = self
  }
  self.Weapon_Phantom01:InitSlot(Phantom1WeaponParams)
  local Phantom2Params = {
    Uuid = self.SquadInfo.Phantom2,
    Id = self.SquadInfo.Phantom2Id,
    Type = "Char",
    Owner = self
  }
  self.Head_Phantom02:InitSlot(Phantom2Params)
  local Phantom2WeaponParams = {
    Uuid = self.SquadInfo.PhantomWeapon2,
    Id = self.SquadInfo.PhantomWeapon2Id,
    Type = self:GetWeaponTypeById(self.SquadInfo.PhantomWeapon2Id),
    Owner = self
  }
  self.Weapon_Phantom02:InitSlot(Phantom2WeaponParams)
  local RouletteParams = {
    Id = self.SquadInfo.WheelIndex or 1,
    Type = "Roulette",
    Owner = self
  }
  self.Roulette:InitSlot(RouletteParams)
  self:AddDelayFrameFunc(function()
    if self.IsOpenAddSquad then
      self:AddSquad()
    end
  end, 1, "AddSquadDelay")
  return
end

function WBP_SquadBuild_Main_P_C:GetWeaponTypeById(WeaponId)
  if not WeaponId then
    DebugPrint("thy    GetWeaponTypeById \230\178\161\230\156\137\230\143\144\228\190\155\230\173\166\229\153\168Id")
    return
  end
  local WeaponTypeList = DataMgr.BattleWeapon[WeaponId].WeaponTag
  if WeaponTypeList then
    for _, value in pairs(WeaponTypeList) do
      if "Melee" == value or "Ranged" == value then
        return value
      end
    end
  end
  DebugPrint("thy    GetWeaponTypeById \230\178\161\230\156\137\230\137\190\229\136\176\230\173\166\229\153\168\231\177\187\229\158\139", WeaponId)
  return "Melee"
end

function WBP_SquadBuild_Main_P_C:InitItemVarInfo(ItemType)
  self.CurSlotType = ItemType
end

function WBP_SquadBuild_Main_P_C:FillSelectiveList()
  self.List_Build:BindEvents(self, {
    OnListItemClicked = self.ClickListItem,
    SortFuncion = self.SortItemContents,
    FilterFunction = self.FilterItemContents
  })
  if self[self.CurSlotType .. "FilterTags"] then
    self.Filters = self:CreateFilters(self[self.CurSlotType .. "FilterTags"], self[self.CurSlotType .. "FilterNames"], self[self.CurSlotType .. "FilterIcons"])
  else
    self.Filters = nil
  end
  self.List_Build:Init(self, {
    Filters = self.Filters,
    OrderByDisplayNames = self.OrderByDisplayNames,
    SortType = CommonConst.DESC,
    ItemContents = self[self.CurSlotType .. "ItemContentsArray"]
  })
end

function WBP_SquadBuild_Main_P_C:CreateFilters(InTags, InTexts, InIcons)
  local Filters = {}
  for i, _ in ipairs(InTags) do
    table.insert(Filters, {
      Tag = InTags[i],
      Text = InTexts[i],
      Icon = InIcons[i]
    })
  end
  return Filters
end

function WBP_SquadBuild_Main_P_C:FilterItemContents(InContentArray, FilterIdxes)
  local SlotType = self.CurSlotType
  local DataType = self.SlotType2DataType[SlotType]
  local FilteredItems = {}
  local FilterFunc
  if "Char" == DataType then
    function FilterFunc(FilterTag, Content)
      local Data = DataMgr.BattleChar[Content.UnitId]
      
      return FilterTag == Data.Attribute
    end
  elseif "Weapon" == DataType then
    local Avatar = ArmoryUtils:GetAvatar()
    
    function FilterFunc(FilterTag, Content)
      local Weapon = Avatar.Weapons[Content.Uuid]
      return Weapon:HasTag(FilterTag)
    end
  elseif "Pet" == DataType then
    function FilterFunc()
      return true
    end
  end
  if FilterFunc then
    for _, Content in ipairs(InContentArray) do
      for _, Idx in ipairs(FilterIdxes) do
        if FilterFunc(self[SlotType .. "FilterTags"][Idx], Content) then
          table.insert(FilteredItems, Content)
          break
        end
      end
    end
  end
  return FilteredItems
end

function WBP_SquadBuild_Main_P_C:SortItemContents(InOutContentArray, SortByIdx, SortType)
  local FirstContent = self[self.CurSlotType .. "Main_CurContent"] or self[self.CurSlotType .. "Main_CmpContent"]
  local SortByAttrNames = {
    self.OrderByAttrNames[SortByIdx]
  }
  for index, value in ipairs(self.OrderByAttrNames) do
    if index ~= SortByIdx then
      table.insert(SortByAttrNames, value)
    end
  end
  ArmoryUtils:SortItemContents(InOutContentArray, SortByAttrNames, SortType, FirstContent)
end

function WBP_SquadBuild_Main_P_C:SetItemSelectState(Content, IsSelected)
  if Content then
    Content.IsSelected = IsSelected
    if Content.SelfWidget then
      local IsPhantom, Pos = self:IsSubstringContained(self.CurSlot:GetName(), "Weapon_Phantom")
      if self.PhantomSlot[self.CurSlot:GetName()] and IsPhantom then
        if self["Head_Phantom0" .. Pos].ItemInfo then
          Content.SelfWidget:SetWeaponMiniPhantomIcon(IsSelected and self["Head_Phantom0" .. Pos].ItemInfo.UnitId or nil)
        end
      else
        Content.SelfWidget:SetInGear(Content.IsSelected)
      end
    end
  end
end

function WBP_SquadBuild_Main_P_C:ClickListItem(Content)
  if Content.Uuid == nil or Content.Uuid == "" then
    return
  end
  if not self.CurClickItemInfo then
    self.CurClickItemInfo = self.CurSlot.ItemInfo
  end
  if not self.PreContent then
    self.PreContent = self.CurSlot.ItemInfo
  end
  if self.CurClickItemInfo and self.CurClickItemInfo.SelfWidget then
    self.CurClickItemInfo.SelfWidget:SetSelected(false)
  end
  Content.SelfWidget:SetSelected(true)
  if Content.Tag == "Pet" or Content.Tag == "Char" then
    AudioManager(self):PlayUISound(nil, EquipSoundPaths[Content.Tag], nil, nil)
  else
    AudioManager(self):PlayUISound(nil, EquipSoundPaths.Weapon, nil, nil)
  end
  self.CurClickItemInfo = Content
  if not self:CheckSlotTypeIsAboutMainRole(self.CurSlot) then
    self:MakeSureCallback()
    return
  end
  self:OpenTips()
end

function WBP_SquadBuild_Main_P_C:HandleOnlyChooseItemIcon(Content)
  if self.CurSlot.Type == "Char" then
    if not Content.IsSelected then
      if self.CurClickItemInfo then
        self:SetItemSelectState(self.CurClickItemInfo, false)
      else
        self:SetItemSelectState(self.CurSlot.ItemInfo, false)
      end
      self:SetItemSelectState(Content, true)
    end
  else
    if self.CurClickItemInfo then
      self:SetItemSelectState(self.CurClickItemInfo, false)
      self.CurClickItemInfo.SelfWidget:SetWeaponMiniPhantomIcon()
    else
      self:SetItemSelectState(self.CurSlot.ItemInfo, false)
      if self.CurSlot.ItemInfo and self.CurSlot.ItemInfo.SelfWidget then
        self.CurSlot.ItemInfo.SelfWidget:SetWeaponMiniPhantomIcon()
      end
    end
    self:SetItemSelectState(Content, false)
    Content.SelfWidget:SetWeaponMiniPhantomIcon()
    local CachedWidget = self:CheckCachedOnlyShowItem(Content)
    if CachedWidget then
      if self.CurClickItemInfo then
        CachedWidget:ShowListItemStateOnce(self.CurClickItemInfo)
        self:CachedOnlyShowChooseItemInSlot(CachedWidget, self.CurClickItemInfo)
      else
        CachedWidget:ShowListItemStateOnce(self.CurSlot.ItemInfo)
        self:CachedOnlyShowChooseItemInSlot(CachedWidget, self.CurSlot.ItemInfo)
      end
    else
      local Widget = self:CheckContentIsSet(Content)
      if Widget then
        if self.CurClickItemInfo then
          Widget:ShowListItemStateOnce(self.CurClickItemInfo)
          self:CachedOnlyShowChooseItemInSlot(Widget, self.CurClickItemInfo)
        else
          Widget:ShowListItemStateOnce(self.CurSlot.ItemInfo)
          self:CachedOnlyShowChooseItemInSlot(Widget, self.CurSlot.ItemInfo)
        end
      end
    end
    self.CurSlot:ShowListItemStateOnce(Content)
  end
end

function WBP_SquadBuild_Main_P_C:ClearSlotCachedData()
  for WidgetName, Widget in pairs(self.RightSlots) do
    Widget.CachedOnlyShowItem = nil
  end
end

function WBP_SquadBuild_Main_P_C:CachedOnlyShowChooseItemInSlot(TargetWidget, Content)
  self:ClearSlotCachedData()
  TargetWidget.CachedOnlyShowItem = Content
end

function WBP_SquadBuild_Main_P_C:CheckCachedOnlyShowItem(Content)
  for WidgetName, Widget in pairs(self.RightSlots) do
    if Widget.CachedOnlyShowItem and Widget.CachedOnlyShowItem == Content then
      return Widget
    end
  end
  return nil
end

function WBP_SquadBuild_Main_P_C:CheckContentIsSet(Content)
  for WidgetName, Widget in pairs(self.RightSlots) do
    if Widget.ItemInfo == Content then
      return Widget
    end
  end
  return nil
end

function WBP_SquadBuild_Main_P_C:CheckSlotTypeIsAboutMainRole(Slot)
  for key, value in pairs(self.PlayerAboutSlots) do
    if Slot == value then
      return true
    end
  end
  return false
end

function WBP_SquadBuild_Main_P_C:OnBGClick()
  self:CloseTips()
  return UIUtils.Unhandled
end

function WBP_SquadBuild_Main_P_C:CloseTips(IsChoose)
  if self.Pos_Tips:GetChildAt(0) then
    self.IsPetTipsOpen = false
    self:InitBottomTab(false, 2)
    self:UnbindFromAnimationFinished(self.Tips_Out, {
      self,
      function()
        self.Panel_Tips:SetVisibility(ESlateVisibility.Collapsed)
      end
    })
    self:BindToAnimationFinished(self.Tips_Out, {
      self,
      function()
        self.Panel_Tips:SetVisibility(ESlateVisibility.Collapsed)
      end
    })
    self:PlayAnimation(self.Tips_Out)
    self.SquadItemTip:CloseWidget()
    self.Pos_Tips:ClearChildren()
    if self.CurClickItemInfo and self.CurClickItemInfo.SelfWidget then
      self.CurClickItemInfo.SelfWidget:SetSelected(false)
    end
    if self.CurSlot.ItemInfo and self.CurSlot.ItemInfo.SelfWidget then
      self.CurSlot.ItemInfo.SelfWidget:SetSelected(true)
    end
    if self.CurInputDeviceType == ECommonInputType.Gamepad then
      self.List_Build.Sort.Controller:SetVisibility(ESlateVisibility.Visible)
    end
  end
  if not IsChoose then
    self:RevertAllItemIcon()
  end
  self:FocusOnItemList()
end

function WBP_SquadBuild_Main_P_C:RevertAllItemIcon()
  self:SetItemSelectState(self.CurClickItemInfo, false)
  for WidgetName, Widget in pairs(self.RightSlots) do
    if Widget.CachedOnlyShowItem then
      Widget.CachedOnlyShowItem.SelfWidget:SetWeaponMiniPhantomIcon()
      self:SetItemSelectState(Widget.CachedOnlyShowItem, false)
    end
  end
  for WidgetName, Widget in pairs(self.RightSlots) do
    if Widget.UpdateListItemState then
      Widget:UpdateListItemState(Widget.ItemInfo)
    end
  end
  self.CurClickItemInfo = nil
  self.PreContent = nil
end

function WBP_SquadBuild_Main_P_C:OpenTips()
  self.Pos_Tips:ClearChildren()
  self.SquadItemTip = self:CreateWidgetNew("SquadItemTips")
  self.Pos_Tips:AddChild(self.SquadItemTip)
  self.IsPetTipsOpen = true
  self.Panel_Tips:SetVisibility(ESlateVisibility.Visible)
  self.Panel_Tips:SetRenderOpacity(0)
  self:PlayAnimation(self.Tips_In)
  self.List_Build.Sort.Controller:SetVisibility(ESlateVisibility.Collapsed)
  if self.CurClickItemInfo.Type ~= "Pet" then
    self:InitBottomTab(true, 2, GText("PROLOGUE_SELECTGUN_TIP_4"))
  else
    self:InitBottomTab(true, 1)
  end
  self.SquadItemTip:SetVisibility(ESlateVisibility.Visible)
  local Params = {
    ItemInfo = self.CurClickItemInfo,
    Owner = self,
    MakeSureCallback = self.MakeSureCallback,
    GoToArmory = self.GoToArmory
  }
  self.SquadItemTip:InitWidget(Params)
  self:SetCurFocusArea("Tip")
end

function WBP_SquadBuild_Main_P_C:GoToArmory()
  AudioManager(self):PlayUISound(nil, "event:/ui/common/click_btn_confirm", nil, nil)
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(GWorld.GameInstance, 0)
  local bInSkillAndSafeToCancel = Player:CharacterInTag("Skill") and Player:IsSafeToCancelSkill()
  if Player:CanEnterInteractive() and (Player:CharacterInTag("Interactive") or Player:CharacterInTag("Idle") or bInSkillAndSafeToCancel) and Player.PlayerAnimInstance and (Player.PlayerAnimInstance.IdletagName == "0" or Player.PlayerAnimInstance.IdletagName == "EmoIdle") and (not self.IsFromDungeonPage or not UIManager(self):GetArmoryUIObj()) then
    if bInSkillAndSafeToCancel then
      Player:StopSkill(UE.ESkillStopReason.ArmoryCancel)
    end
  else
    UIManager(self):ShowUITip("CommonToastMain", GText("UI_Toast_Armory_Forbid"))
    return
  end
  local Params = {}
  if self.CurClickItemInfo then
    Params = {
      bNoEndCamera = true,
      bHideSquadBuildBtn = true,
      bHideBoxBtn = true,
      bHideDeployBtn = true,
      OnCloseDelegate = {
        self,
        function()
          if not self.CurSquadInfo.Char or self.CurSquadInfo.Char == "" then
            self:HideOrShowModel(true)
          else
            self:HideOrShowModel(false)
          end
        end
      }
    }
  else
    Params = {
      bNoEndCamera = true,
      bHideSquadBuildBtn = true,
      bHideBoxBtn = true,
      bHideDeployBtn = true,
      MainTabName = ArmoryUtils.ArmoryMainTabNames.BattleWheel,
      BattleWheelIndex = self.Roulette.Id
    }
  end
  if self.CurSlotType == "Char" then
    Params.MainTabName = ArmoryUtils.ArmoryMainTabNames.Char
    Params.CharUuids = {
      self.CurClickItemInfo.Uuid
    }
    Params.bHideMeleeTab = true
    Params.bHideRangedTab = true
    Params.bHideWeaponTab = true
    Params.bHidePetTab = true
    Params.bHideBattleWheel = true
    Params.bHideUltraTab = true
  elseif self.CurSlotType == "Melee" then
    Params.MainTabName = ArmoryUtils.ArmoryMainTabNames.Melee
    Params.WeaponUuids = {
      self.CurClickItemInfo.Uuid
    }
    Params.bHideCharTab = true
    Params.bHideRangedTab = true
    Params.bHideWeaponTab = true
    Params.bHidePetTab = true
    Params.bHideBattleWheel = true
    Params.bHideUltraTab = true
  elseif self.CurSlotType == "Ranged" then
    Params.MainTabName = ArmoryUtils.ArmoryMainTabNames.Ranged
    Params.WeaponUuids = {
      self.CurClickItemInfo.Uuid
    }
    Params.bHideMeleeTab = true
    Params.bHideCharTab = true
    Params.bHideWeaponTab = true
    Params.bHidePetTab = true
    Params.bHideBattleWheel = true
    Params.bHideUltraTab = true
  elseif self.CurSlotType == "Pet" then
    Params.MainTabName = ArmoryUtils.ArmoryMainTabNames.Pet
    Params.PetUniqueIds = {
      self.CurClickItemInfo.Uuid
    }
    Params.bHideCharTab = true
    Params.bHideMeleeTab = true
    Params.bHideRangedTab = true
    Params.bHideWeaponTab = true
    Params.bHideBattleWheel = true
    Params.bHideUltraTab = true
  else
    Params.MainTabName = ArmoryUtils.ArmoryMainTabNames.BattleWheel
    Params.bHideCharTab = true
    Params.bHideMeleeTab = true
    Params.bHideRangedTab = true
    Params.bHideWeaponTab = true
    Params.bHidePetTab = true
    Params.bHideUltraTab = true
  end
  self:CloseTips()
  UIManager(self):LoadUINew("ArmoryDetail", Params)
end

function WBP_SquadBuild_Main_P_C:HideOrShowModel(bHide)
  self.ActorController.ArmoryPlayer:SetActorHideTag("SuqadRole", bHide)
end

function WBP_SquadBuild_Main_P_C:MakeSureCallback(ModIndex)
  local Parmas = {
    ItemInfo = self.CurClickItemInfo,
    Uuid = self.CurClickItemInfo.Uuid,
    Id = self.CurClickItemInfo.UnitId,
    Rarity = self.CurClickItemInfo.Rarity,
    ModSuit = ModIndex or self.PreSlot and self.PreSlot.ModSuit,
    Type = self.CurSlotType,
    IsNeedPhantomIcon,
    Num = self:IsNeedPhantomIcon(),
    Owner = self
  }
  self.CurSlot:ClearItemFlag()
  if self:CheckSelectItemIsRepeatInCurAllSlot() then
    self.PreSlot:ClearItemFlag()
    if self.CurSlot:GetIsEmpty() or not self:WeaponIsValidForSlot() then
      self.PreSlot:ClearSlot()
    else
      local PreParmas = self.CurSlot:GetParams()
      PreParmas.ItemInfo = self.CurSlot.ItemInfo
      PreParmas.ModSuit = PreParmas.ModSuit and PreParmas.ModSuit > 0 and PreParmas.ModSuit or self.PreSlot.ModSuit
      self.PreSlot:InitSlot(PreParmas)
    end
    self:PopChangeRoleToastByType(Parmas)
  end
  self.CurSlot:InitSlot(Parmas)
  self.PreContent = self.CurSlot.ItemInfo
  self:CloseTips(true)
end

function WBP_SquadBuild_Main_P_C:CheckIsMainRoleWeapon(Slot)
  for WidgetName, Widget in pairs(self.PlayerForceSlot) do
    if Widget == Slot then
      return true
    end
  end
  return false
end

function WBP_SquadBuild_Main_P_C:WeaponIsValidForSlot()
  if self:CheckSlotTypeIsAboutMainRole(self.PreSlot) and self.PreSlot and self.CurSlot.Params.Type ~= self.PreSlot.Type then
    return false
  end
  return true
end

function WBP_SquadBuild_Main_P_C:PopChangeRoleToastByType(Parmas)
  local WidgetName = self.CurSlot:GetName()
  local IsPhantom, PhantomNum = self:IsSubstringContained(WidgetName, "Head_Phantom0")
  local IsPhantomWeapon, PhantomWeaponNum = self:IsSubstringContained(WidgetName, "Weapon_Phantom0")
  if "Character" == WidgetName then
    UIManager(self):ShowUITip("CommonToastMain", string.format(GText("UI_Squad_SwitchChar_Toast"), GText(self:GetCharName(Parmas.Id))))
  elseif IsPhantom then
    UIManager(self):ShowUITip("CommonToastMain", string.format(GText("UI_Squad_SwitchSigil_Toast"), GText(self:GetCharName(Parmas.Id)), GText("UI_Squad_Sigil" .. PhantomNum)))
  elseif IsPhantomWeapon then
    UIManager(self):ShowUITip("CommonToastMain", string.format(GText("UI_Squad_SwitchSigil_Toast"), GText(self:GetWeaponName(Parmas.Id)), GText("UI_Squad_Sigil" .. PhantomWeaponNum)))
  elseif "Melee" == WidgetName or "Ranged" == WidgetName then
    UIManager(self):ShowUITip("CommonToastMain", string.format(GText("UI_Squad_SwitchChar_Toast"), GText(self:GetWeaponName(Parmas.Id))))
  end
end

function WBP_SquadBuild_Main_P_C:GetCharName(CharId)
  return DataMgr.Char[CharId] and DataMgr.Char[CharId].CharName
end

function WBP_SquadBuild_Main_P_C:GetWeaponName(WeaponId)
  return DataMgr.Weapon[WeaponId] and DataMgr.Weapon[WeaponId].WeaponName
end

function WBP_SquadBuild_Main_P_C:IsNeedPhantomIcon()
  local IsNeedPhantomIcon, Num = self:IsSubstringContained(self.CurSlot:GetName(), "Weapon_Phantom")
  return IsNeedPhantomIcon, Num
end

function WBP_SquadBuild_Main_P_C:IsSubstringContained(parentStr, subStr)
  local startPos, endPos = string.find(parentStr, subStr)
  if nil ~= startPos then
    return nil ~= startPos, string.sub(parentStr, -1)
  end
  return nil, nil
end

function WBP_SquadBuild_Main_P_C:CheckSelectItemIsRepeatInCurAllSlot()
  for key, value in pairs(self.RightSlots) do
    if value:GetItemId() == self.CurClickItemInfo.Uuid and value:GetName() ~= self.CurSlot:GetName() and "WheelIndex" ~= key then
      self.PreSlot = value
      return true
    end
  end
  return false
end

function WBP_SquadBuild_Main_P_C:InitSelectiveList()
  self.OrderByDisplayNames = {
    "UI_LEVEL_SELECT",
    "UI_RARITY_NAME"
  }
  self.OrderByAttrNames = {
    "Level",
    "Rarity",
    "SortPriority",
    "UnitId"
  }
  self.CharFilterTags, self.CharFilterNames = UIUtils.GetAllElementTypes()
  self.CharFilterIcons = {}
  for key, Tag in pairs(self.CharFilterTags) do
    local IconName = "Armory_" .. Tag
    table.insert(self.CharFilterIcons, "/Game/UI/Texture/Dynamic/Atlas/Armory/T_" .. IconName .. ".T_" .. IconName)
  end
  self.MeleeFilterTags, self.MeleeFilterNames, self.RangedFilterTags, self.RangedFilterNames = UIUtils.GetAllWeaponTags()
  self.MeleeFilterIcons = {}
  for _, Tag in ipairs(self.MeleeFilterTags) do
    local Data = DataMgr.WeaponTag[Tag]
    table.insert(self.MeleeFilterIcons, Data and Data.Icon)
  end
  self.RangedFilterIcons = {}
  for _, Tag in ipairs(self.RangedFilterTags) do
    local Data = DataMgr.WeaponTag[Tag]
    table.insert(self.RangedFilterIcons, Data and Data.Icon)
  end
end

function WBP_SquadBuild_Main_P_C:SwitchToRouletteList()
  self:SwitchLeftWidgetByIndex(3)
  self.IsInEditor = true
  self:SwitchBtnPanel()
  self:GetWheelNum()
  self:UpdateRouletteUI()
  self:ResetAllSlotsClickState()
  if self.CurInputDeviceType == ECommonInputType.Gamepad then
    self.Btn_EditName:SetVisibility(ESlateVisibility.HitTestInvisible)
  else
    self.Btn_EditName:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  end
  self:PlayAnimation(self.Left_In)
  self:FocusOnItemList()
  self:InitBottomTab(false, 2)
end

function WBP_SquadBuild_Main_P_C:GetWheelNum()
  self.Avatar = GWorld:GetAvatar()
  self.WheelNum = nil
  if self.Avatar then
    for key, value in pairs(self.Avatar.Wheels) do
      self.WheelNum = key
    end
  end
  self.WheelNum = self.WheelNum or 3
end

function WBP_SquadBuild_Main_P_C:UpdateRouletteUI()
  local IsScrollDisable = self.List_Default:IsDisableScroll()
  self.List_Roulette:SetAllowOverscroll(IsScrollDisable)
  self.List_Roulette:ClearListItems()
  for i = 1, self.WheelNum do
    local Content = NewObject(UIUtils.GetCommonItemContentClass())
    Content.ClickCallback = self.UpdateRouletteSlot
    Content.Owner = self
    Content.Index = i
    Content.IsSelect = i == self.Roulette.Id
    self.List_Roulette:AddItem(Content)
  end
end

function WBP_SquadBuild_Main_P_C:UpdateWheelArr(Item)
  if not self.WheelArr or 3 == #self.WheelArr then
    self.WheelArr = {}
  end
  table.insert(self.WheelArr, Item)
end

function WBP_SquadBuild_Main_P_C:UpdateRouletteSlot(Index)
  self.Roulette:ChangeWheelIndex(Index)
  for i = 1, self.WheelNum do
    if i ~= Index then
      local Item = self.WheelArr[i]
      Item.IsSelect = false
      Item:PlayAnimation(Item.Normal)
    end
  end
end

function WBP_SquadBuild_Main_P_C:Handle_OnPCDown(InKeyName)
  if "Escape" == InKeyName then
    self:OnBackKeyDown()
    return true
  elseif "Q" == InKeyName then
    if self.CurSlot.IsPhantomWeapon then
      if self.CurPhantomWeaponType ~= "Melee" then
        self:PhantomWeaponTypeChanged("Melee")
      end
      return true
    end
  elseif "E" == InKeyName and self.CurSlot.IsPhantomWeapon then
    if self.CurPhantomWeaponType ~= "Ranged" then
      self:PhantomWeaponTypeChanged("Ranged")
    end
    return true
  end
  return false
end

function WBP_SquadBuild_Main_P_C:OnUpdateUIStyleByInputTypeChange(CurInputType, CurGamepadName)
  self.CurInputDeviceType = CurInputType
  self.CurGamepadName = CurGamepadName
  self:InitUI()
  self:SwitchSlotDeleteIconVisible()
end

function WBP_SquadBuild_Main_P_C:SwitchSlotDeleteIconVisible()
  for _, Wdiget in pairs(self.RightSlots) do
    if Wdiget.AddDelelteIcon then
      Wdiget:AddDelelteIcon()
    end
  end
end

function WBP_SquadBuild_Main_P_C:InitUI()
  if self.CurInputDeviceType == ECommonInputType.MouseAndKeyboard or self.CurInputDeviceType == ECommonInputType.Touch then
    self.Btn_Add.Key_GamePad:SetVisibility(ESlateVisibility.Collapsed)
    self:UpdateGamepadIcon()
    self.IsInSortState = false
    self.Com_Tab:SetFocus()
    if self.IsInEditor then
      self.Btn_EditName:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    end
    self:AddDelayFrameFunc(function()
      self:SwitchAddSquadItemVisibility(true)
      if self:GetSquadWidgetInSquadList(self.CurSelectSquadIndex) then
        self:GetSquadWidgetInSquadList(self.CurSelectSquadIndex):HideAllArrow()
      end
    end, 2, "HideAllArrow")
    return
  end
  self:AddDelayFrameFunc(function()
    self.CurGamepadArea = nil
    self.IsInSortState = false
    self:SwitchGamePadIconVisibilityBySortState(true)
    if self.IsInEditor then
      self.Btn_EditName:SetVisibility(ESlateVisibility.HitTestInvisible)
      self:FocusOnRightDetailPanel()
    else
      self:FocusOnSquadList()
    end
  end, 2, "SwitchGamePad")
end

function WBP_SquadBuild_Main_P_C:RegisterBtnIconInGampad()
  self.Btn_Add:SetDefaultGamePadImg("Y")
  self.Btn_Edit:SetDefaultGamePadImg("X")
  self.Btn_Save:SetDefaultGamePadImg("X")
  self.Btn_Cancel:SetDefaultGamePadImg("B")
  self.Btn_Armory:SetDefaultGamePadImg("View")
end

function WBP_SquadBuild_Main_P_C:UpdateGamepadIcon(bShowSort, bShowDelete, bShowEdit)
  if self.Key_Controller_EditName then
    self.Key_Controller_Sort:CreateCommonKey({
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "LS"}
      }
    })
    if bShowSort and self.SquadListLen > 1 then
      self.Key_Controller_Sort:SetVisibility(ESlateVisibility.Visible)
    else
      self.Key_Controller_Sort:SetVisibility(ESlateVisibility.Collapsed)
    end
  end
  if self.Key_Controller_Delete then
    self.Key_Controller_Delete:CreateCommonKey({
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "RS"}
      }
    })
    if bShowDelete then
      self.Key_Controller_Delete:SetVisibility(ESlateVisibility.Visible)
    else
      self.Key_Controller_Delete:SetVisibility(ESlateVisibility.Collapsed)
    end
  end
  if self.Key_Controller_EditName then
    self.Key_Controller_EditName:CreateCommonKey({
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "Menu"}
      }
    })
    if bShowEdit then
      self.Key_Controller_EditName:SetVisibility(ESlateVisibility.Visible)
    else
      self.Key_Controller_EditName:SetVisibility(ESlateVisibility.Collapsed)
    end
  end
end

function WBP_SquadBuild_Main_P_C:FocusOnSquadList()
  if self.CurInputDeviceType ~= ECommonInputType.Gamepad then
    return
  end
  if self:CheckHasTip() then
    return
  end
  self:SetCurFocusArea("SquadList")
  self:GetSquadWidgetInSquadList(self.CurSelectSquadIndex):SetFocus()
  self:UpdateGamepadIcon(true, true)
  self.Btn_Add.Key_GamePad:SetVisibility(ESlateVisibility.Visible)
  self.Btn_EditName:SetVisibility(ESlateVisibility.Collapsed)
  self.Key_Controller_EditName:SetVisibility(ESlateVisibility.Collapsed)
  self:InitBottomTab(true, 2)
end

function WBP_SquadBuild_Main_P_C:FocusOnSquadListInSortState()
  if self.CurInputDeviceType ~= ECommonInputType.Gamepad then
    return
  end
  if self:CheckHasTip() then
    return
  end
  self:SetCurFocusArea("SquadListInSort")
  self:GetSquadWidgetInSquadList(self.CurSelectSquadIndex):SetFocus()
  self:UpdateGamepadIcon()
end

function WBP_SquadBuild_Main_P_C:FocusOnRightDetailPanel()
  if self.CurInputDeviceType ~= ECommonInputType.Gamepad then
    return
  end
  if self:CheckHasTip() then
    return
  end
  if not self.CurSlot or not self.IsInEditor then
    self.Character:SetFocus()
  else
    self.CurSlot:SetFocus()
  end
  self.Btn_Add.Key_GamePad:SetVisibility(ESlateVisibility.Collapsed)
  if self.IsInEditor then
    self:SetCurFocusArea("SlotInEdit")
    self:UpdateGamepadIcon(false, false, true)
    self.Btn_Save.Key_GamePad:SetRenderOpacity(1)
    self.Btn_Save.Key_GamePad:SetVisibility(ESlateVisibility.Visible)
    self.Btn_Cancel.Key_GamePad:SetVisibility(ESlateVisibility.Visible)
    if self.CurInputDeviceType == ECommonInputType.Gamepad then
      self.Btn_EditName:SetVisibility(ESlateVisibility.HitTestInvisible)
    else
      self.Btn_EditName:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    end
    self.Key_Controller_EditName:SetVisibility(ESlateVisibility.Visible)
    self.List_Build.Sort.Controller:SetVisibility(ESlateVisibility.Collapsed)
  else
    self:SetCurFocusArea("SlotInView")
    self:UpdateGamepadIcon(false, true, true)
    self.Btn_Save.Key_GamePad:SetRenderOpacity(0)
    self.Btn_Save.Key_GamePad:SetVisibility(ESlateVisibility.Collapsed)
    self.Btn_Cancel.Key_GamePad:SetVisibility(ESlateVisibility.Collapsed)
    self.Btn_EditName:SetVisibility(ESlateVisibility.Collapsed)
    self.Key_Controller_EditName:SetVisibility(ESlateVisibility.Collapsed)
  end
  self:InitBottomTab(false, 3)
end

function WBP_SquadBuild_Main_P_C:FocusOnItemList()
  if self.CurInputDeviceType ~= ECommonInputType.Gamepad then
    return
  end
  if self:CheckHasTip() then
    return
  end
  self:SetCurFocusArea("ListItem")
  if self.Panel_List:IsVisible() then
    self.CurClickItemInfo = self.CurSlot and self.CurSlot.ItemInfo
    if self.CurClickItemInfo and self.CurClickItemInfo.UI then
      self.CurClickItemInfo.UI:SetFocus()
    else
      self.List_Build.List_Select:SetFocus()
      self.List_Build.List_Select:SetSelectedIndex(0)
    end
    self.List_Build.Sort.Controller:SetVisibility(ESlateVisibility.Visible)
  else
    self.List_Roulette:SetFocus()
    self.List_Roulette:SetSelectedIndex(0)
  end
  self:InitBottomTab(false, 2)
  self.Btn_Save.Key_GamePad:SetRenderOpacity(0)
  self.Btn_Save.Key_GamePad:SetVisibility(ESlateVisibility.Collapsed)
  self.Btn_Cancel.Key_GamePad:SetVisibility(ESlateVisibility.Collapsed)
  self:UpdateGamepadIcon(false, true)
end

function WBP_SquadBuild_Main_P_C:CheckHasTip()
  if self.CurInputDeviceType ~= ECommonInputType.Gamepad then
    return
  end
  if self.Pos_Tips:GetChildAt(0) then
    if self.CurSlotType ~= "Pet" then
      self.SquadItemTip.Edit_Tips.ModType01:SetFocus()
    else
      self.SquadItemTip:SetFocus()
    end
    self:SetCurFocusArea("Tip")
    return true
  elseif self.IsEditSquadName then
    self.NameEditDialog:SetFocus()
    self:SetCurFocusArea("Tip")
    return true
  elseif self.DeleteSquadTips and not self.DeleteSquadTips.IsClosing then
    self.DeleteSquadTips.UWidget:SetFocus()
    self:SetCurFocusArea("Tip")
    return true
  elseif self.SaveSquadTip and not self.SaveSquadTip.IsClosing then
    self.SaveSquadTip.UWidget:SetFocus()
    self:SetCurFocusArea("Tip")
    return true
  elseif self.CancelPopUI and not self.CancelPopUI.IsClosing then
    self.CancelPopUI.UWidget:SetFocus()
    self:SetCurFocusArea("Tip")
    return true
  else
    return false
  end
end

function WBP_SquadBuild_Main_P_C:SetCurFocusArea(CurFocusArea)
  self.CurGamepadArea = CurFocusArea
  DebugPrint("thy   SetCurFocusArea", self.CurGamepadArea)
end

function WBP_SquadBuild_Main_P_C:SquadListMoveInGamePadWithDPad(IsUp)
  if self.CurGamepadArea == "SquadListInSort" and self.IsInSortState then
    local Index = IsUp and math.max(self.CurSelectSquadIndex - 1, 1) or math.min(self.CurSelectSquadIndex + 1, self.SquadListLen)
    if Index ~= self.CurSelectSquadIndex then
      self:GetSquadWidgetInSquadList(self.CurSelectSquadIndex):HideAllArrow()
      self:PlayAnimation(self.UpdateList)
      self:AddDelayFrameFunc(function()
        self:GetSquadWidgetInSquadList(self.CurSelectSquadIndex):ChangeTwoItemInListView(self.List_Default, self.CurSelectSquadIndex, Index)
      end, 5, "DelayChange")
    else
      self:FocusOnSquadListInSortState()
      self:GetSquadWidgetInSquadList(self.CurSelectSquadIndex):CheckArrowState()
    end
  end
  return true
end

function WBP_SquadBuild_Main_P_C:CheckIsInItemList()
  return self.List_Build.List_Select:HasFocusedDescendants() or self.List_Roulette:HasFocusedDescendants()
end

function WBP_SquadBuild_Main_P_C:SwitchAddSquadItemVisibility(bShow)
  if self.SquadListLen == self.SquadMax or 1 == self.SquadListLen then
    return
  end
  for i = 1, self.List_Default:GetNumItems() do
    local Item = self:GetSquadWidgetInSquadList(i)
    if Item then
      if Item.IsAddSquad then
        if bShow then
          Item:SetVisibility(ESlateVisibility.Visible)
        else
          Item:SetVisibility(ESlateVisibility.Collapsed)
        end
      else
        Item:SetVisibility(ESlateVisibility.Visible)
      end
    end
  end
end

function WBP_SquadBuild_Main_P_C:Handle_OnGamePadDown(InKeyName)
  if "Gamepad_FaceButton_Right" == InKeyName then
    if self.Pos_Tips:GetChildAt(0) then
      self:CloseTips()
      return true
    end
    if self.CurGamepadArea == "ListItem" then
      self:FocusOnRightDetailPanel()
      return true
    elseif self.CurGamepadArea == "SlotInView" then
      self:FocusOnSquadList()
      return true
    elseif self.CurGamepadArea == "SlotInEdit" then
      self:CancelCreateSquadAndBackToSquadList()
      return true
    elseif self.CurGamepadArea == "SquadListInSort" and self.IsInSortState then
      self.IsInSortState = false
      self:SwitchGamePadIconVisibilityBySortState(true)
      self:SwitchAddSquadItemVisibility(true)
      self:FocusOnSquadList()
      self:GetSquadWidgetInSquadList(self.CurSelectSquadIndex):HideAllArrow()
      return true
    else
      self:OnBackKeyDown()
      return true
    end
  elseif "Gamepad_FaceButton_Top" == InKeyName then
    if self.CurGamepadArea == "SquadList" or self.CurGamepadArea == "SlotInView" then
      self:AddSquad()
    elseif self.CurGamepadArea == "SlotInEdit" then
      self:ClearCurSlot()
    end
    return true
  elseif "Gamepad_FaceButton_Bottom" == InKeyName then
    if self.FocusInAddSquad then
      self:AddSquad()
      self.FocusInAddSquad = false
      return true
    end
    if self.CurGamepadArea == "SquadList" then
      self:FocusOnRightDetailPanel()
      return true
    elseif self.CurGamepadArea == "SlotInView" then
      self:FocusOnRightDetailPanel()
      return true
    elseif self.CurGamepadArea == "SlotInEdit" then
      self:FocusOnItemList()
      return true
    end
  elseif "Gamepad_FaceButton_Left" == InKeyName then
    if self.CurGamepadArea == "Tip" then
      if self.CurSlotType == "Pet" then
        self:MakeSureCallback()
      else
        self:MakeSureCallback(self.SquadItemTip.Edit_Tips.SelectModIndex)
      end
      return true
    end
    if self.IsPetTipsOpen then
      self.IsPetTipsOpen = false
      return true
    end
    if self.CurGamepadArea == "SquadList" then
      self:EditorSquad()
    elseif self.CurGamepadArea == "SquadList" or self.CurGamepadArea == "SlotInView" then
      if not self.IsInEditor then
        self:EditorSquad()
        return true
      end
    elseif self.CurGamepadArea == "SlotInEdit" then
      self:SaveSquad()
      return true
    end
  elseif "Gamepad_DPad_Up" == InKeyName then
    if self.IsInCd and self.IsInSortState then
      DebugPrint("thy    IsInCD")
      return true
    else
      self:CreateCDTimer()
    end
    return self:SquadListMoveInGamePadWithDPad(true)
  elseif "Gamepad_DPad_Down" == InKeyName then
    if self.IsInCd and self.IsInSortState then
      DebugPrint("thy    IsInCD")
      return true
    else
      self:CreateCDTimer()
    end
    return self:SquadListMoveInGamePadWithDPad(false)
  elseif "Gamepad_DPad_Left" == InKeyName then
    if self.CurGamepadArea == "SquadList" then
      return true
    end
  elseif "Gamepad_DPad_Right" == InKeyName then
    if self.CurGamepadArea == "SquadList" then
      return true
    end
  elseif "Gamepad_LeftStick_Right" == InKeyName then
    if self.CurGamepadArea == "SquadList" then
      return true
    end
  elseif "Gamepad_LeftStick_Left" == InKeyName then
    if self.CurGamepadArea == "SquadList" then
      return true
    end
    return true
  elseif "Gamepad_LeftStick_Up" == InKeyName then
    if self.IsInCd and self.IsInSortState then
      DebugPrint("thy    IsInCD")
      return true
    else
      self:CreateCDTimer()
    end
    return self:SquadListMoveInGamePadWithDPad(true)
  elseif "Gamepad_LeftStick_Down" == InKeyName then
    if self.IsInCd and self.IsInSortState then
      DebugPrint("thy    IsInCD")
      return true
    else
      self:CreateCDTimer()
    end
    return self:SquadListMoveInGamePadWithDPad(false)
  elseif "Gamepad_Special_Right" == InKeyName then
    if self.Pos_Tips:GetChildAt(0) or UIManager(self):IsHaveMenuAnchorOpen() then
      return true
    end
    if self.CurGamepadArea == "SlotInEdit" then
      self:EditSquadName()
    end
    return true
  elseif "Gamepad_Special_Left" == InKeyName then
    if self.Panel_Roulette:IsVisible() or self.Panel_Tips:IsVisible() then
      self:GoToArmory()
    end
    return true
  elseif "Gamepad_RightThumbstick" == InKeyName then
    if self.Pos_Tips:GetChildAt(0) or UIManager(self):IsHaveMenuAnchorOpen() then
      return
    end
    if self.CurGamepadArea == "SquadList" then
      self:DeleteSquad()
    end
    return true
  elseif "Gamepad_LeftThumbstick" == InKeyName then
    if self.Pos_Tips:GetChildAt(0) or UIManager(self):IsHaveMenuAnchorOpen() then
      return true
    end
    if self.CurGamepadArea == "SquadListInSort" then
      if self.IsInSortState then
        self.IsInSortState = false
        self:InitBottomTab(true, 2)
        self:SwitchGamePadIconVisibilityBySortState(true)
        self:SwitchAddSquadItemVisibility(true)
        self:GetSquadWidgetInSquadList(self.CurSelectSquadIndex):HideAllArrow()
        self:FocusOnSquadList()
      end
    elseif self.CurGamepadArea == "SquadList" and self.SquadListLen > 1 then
      self.IsInSortState = true
      self:InitBottomTabOnSortStateInGamePad()
      self:SwitchGamePadIconVisibilityBySortState(false)
      self:SwitchAddSquadItemVisibility(false)
      self:GetSquadWidgetInSquadList(self.CurSelectSquadIndex):CheckArrowState()
      self:FocusOnSquadListInSortState()
    end
    return true
  elseif "Gamepad_LeftTrigger" == InKeyName then
    if self.CurSlot.IsPhantomWeapon then
      if self.CurPhantomWeaponType ~= "Melee" then
        self:PhantomWeaponTypeChanged("Melee")
      end
      return true
    end
  elseif "Gamepad_RightTrigger" == InKeyName and self.CurSlot.IsPhantomWeapon then
    if self.CurPhantomWeaponType ~= "Ranged" then
      self:PhantomWeaponTypeChanged("Ranged")
    end
    return true
  end
  return false
end

function WBP_SquadBuild_Main_P_C:CheckLeftStickKeyName()
  local InKeyName
  if self.MoveDeltaX and 0 ~= self.MoveDeltaX then
    if self.MoveDeltaX > 0.5 then
      InKeyName = "Gamepad_LeftStick_Right"
    elseif self.MoveDeltaX < -0.5 then
      InKeyName = "Gamepad_LeftStick_Left"
    end
  end
  if not InKeyName and self.MoveDeltaY and 0 ~= self.MoveDeltaY then
    if self.MoveDeltaY > 0.5 then
      InKeyName = "Gamepad_LeftStick_Up"
    elseif self.MoveDeltaY < -0.5 then
      InKeyName = "Gamepad_LeftStick_Down"
    end
  end
  return InKeyName
end

function WBP_SquadBuild_Main_P_C:OnAnalogValueChanged(MyGeometry, InAnalogInputEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InAnalogInputEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if "Gamepad_LeftX" == InKeyName then
    self.MoveDeltaX = UKismetInputLibrary.GetAnalogValue(InAnalogInputEvent)
  elseif "Gamepad_LeftY" == InKeyName then
    self.MoveDeltaY = UKismetInputLibrary.GetAnalogValue(InAnalogInputEvent)
  end
  self:Handle_OnGamePadDown(self:CheckLeftStickKeyName())
  return self.Unhandle
end

function WBP_SquadBuild_Main_P_C:OnKeyDown(MyGeometry, InKeyEvent)
  local IsEventHandled = false
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) then
    IsEventHandled = self:Handle_OnGamePadDown(InKeyName)
  else
    IsEventHandled = self:Handle_OnPCDown(InKeyName)
  end
  if IsEventHandled then
    return UE4.UWidgetBlueprintLibrary.Handled()
  else
    return UE4.UWidgetBlueprintLibrary.UnHandled()
  end
end

function WBP_SquadBuild_Main_P_C:OnPreviewKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local IsHandled = false
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) then
    if "Gamepad_DPad_Up" == InKeyName then
      if self.IsInCd then
        return
      else
        self:CreateCDTimer()
      end
      return self:SquadListMoveInGamePadWithDPad(true)
    elseif "Gamepad_DPad_Down" == InKeyName then
      if self.IsInCd then
        return
      else
        self:CreateCDTimer()
      end
      return self:SquadListMoveInGamePadWithDPad(false)
    end
  end
  if IsHandled then
    return UE4.UWidgetBlueprintLibrary.Handled()
  end
  return UE4.UWidgetBlueprintLibrary.Unhandled()
end

function WBP_SquadBuild_Main_P_C:CreateCDTimer()
  self.IsInCd = true
  self.CdTime = 1
  self:AddTimer(0.1, function()
    self.CdTime = self.CdTime - 0.1
    if self.CdTime < 0 then
      self.IsInCd = false
      self:RemoveTimer("CD")
    end
  end, true, 0, "CD", true)
end

function WBP_SquadBuild_Main_P_C:OnFocusReceived(MyGeometry, InFocusEvent)
  self:AddDelayFrameFunc(function()
    if self.IsInEditor then
      self:FocusOnRightDetailPanel()
    else
      self:FocusOnSquadList()
    end
  end, 3, "DelayFocusSquadList")
  return true
end

AssembleComponents(WBP_SquadBuild_Main_P_C)
return WBP_SquadBuild_Main_P_C
