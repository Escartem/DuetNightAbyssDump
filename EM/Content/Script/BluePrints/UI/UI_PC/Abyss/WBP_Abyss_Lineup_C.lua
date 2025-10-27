local ArmoryUtils = require("BluePrints.UI.WBP.Armory.ArmoryUtils")
local TimeUtils = require("Utils.TimeUtils")
local EMCache = require("EMCache.EMCache")
local UIUtils = require("Utils.UIUtils")
local WBP_Abyss_Lineup_C = Class({
  "BluePrints.UI.BP_EMUserWidget_C",
  "BluePrints.Common.TimerMgr"
})
local NullUUid = CommonConst.AbyssTeamNoChar
local NullUnitId = CommonConst.AbyssTeamNoPet
WBP_Abyss_Lineup_C._components = {
  "BluePrints.UI.WBP.Abyss.MainComponent.Abyss_CharMainComponent",
  "BluePrints.UI.WBP.Abyss.MainComponent.Abyss_PetMainComponent",
  "BluePrints.UI.WBP.Abyss.MainComponent.Abyss_WeaponMainComponent"
}
WBP_Abyss_Lineup_C.ESlotName = {
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
WBP_Abyss_Lineup_C.SlotName2Type = {
  [WBP_Abyss_Lineup_C.ESlotName.Char] = "Char",
  [WBP_Abyss_Lineup_C.ESlotName.Pet] = "Pet",
  [WBP_Abyss_Lineup_C.ESlotName.RangedWeapon] = "Ranged",
  [WBP_Abyss_Lineup_C.ESlotName.MeleeWeapon] = "Melee",
  [WBP_Abyss_Lineup_C.ESlotName.Phantom1] = "Char",
  [WBP_Abyss_Lineup_C.ESlotName.PhantomWeapon1] = "Weapon",
  [WBP_Abyss_Lineup_C.ESlotName.Phantom2] = "Char",
  [WBP_Abyss_Lineup_C.ESlotName.PhantomWeapon2] = "Weapon"
}
WBP_Abyss_Lineup_C.SlotType2DataType = {
  Char = "Char",
  Pet = "Pet",
  Weapon = "Weapon",
  Ranged = "Weapon",
  Melee = "Weapon"
}
WBP_Abyss_Lineup_C.SlotName2TextMap = {
  [WBP_Abyss_Lineup_C.ESlotName.Char] = GText("UI_Armory_Char"),
  [WBP_Abyss_Lineup_C.ESlotName.Pet] = GText("MAIN_UI_PET"),
  [WBP_Abyss_Lineup_C.ESlotName.RangedWeapon] = GText("Ranged") .. GText("UI_SHOP_SUBTAB_NAME_WEAPON"),
  [WBP_Abyss_Lineup_C.ESlotName.MeleeWeapon] = GText("Melee") .. GText("UI_SHOP_SUBTAB_NAME_WEAPON"),
  [WBP_Abyss_Lineup_C.ESlotName.Phantom1] = GText("UI_STAT_Sigil") .. "1",
  [WBP_Abyss_Lineup_C.ESlotName.PhantomWeapon1] = GText("UI_STAT_Sigil") .. "1" .. GText("UI_SHOP_SUBTAB_NAME_WEAPON"),
  [WBP_Abyss_Lineup_C.ESlotName.Phantom2] = GText("UI_STAT_Sigil") .. "2",
  [WBP_Abyss_Lineup_C.ESlotName.PhantomWeapon2] = GText("UI_STAT_Sigil") .. "2" .. GText("UI_SHOP_SUBTAB_NAME_WEAPON")
}
WBP_Abyss_Lineup_C.EDirection = {
  Left = 1,
  Right = 2,
  Up = 3,
  Down = 4
}
WBP_Abyss_Lineup_C.GamepadIcons = {
  "Controller_SwitchTeam"
}

function WBP_Abyss_Lineup_C:Construct()
  self.Platform = CommonUtils.GetDeviceTypeByPlatformName(GWorld.GameInstance)
  self.TypeTabs = {
    [self.SlotName2Type[self.ESlotName.RangedWeapon]] = self.List_Lineup.Type_Range,
    [self.SlotName2Type[self.ESlotName.MeleeWeapon]] = self.List_Lineup.Type_Melee
  }
  self.List_Lineup.Type_Range:Init(self.SlotName2Type[self.ESlotName.RangedWeapon], self)
  self.List_Lineup.Type_Melee:Init(self.SlotName2Type[self.ESlotName.MeleeWeapon], self)
  self.List_Lineup.Tab_Primary:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self.Btn_Save:SetText(GText("UI_RegionMap_Save"))
  self.Btn_Save:Init(self, self.SaveLineup)
  self.Btn_Click.OnClicked:Add(self, self.OnBackgroundClicked)
  self:InitSelectiveList()
  self:InitItemDetailWidget()
  self:InitGamepadKeys()
  self:InitListenEvent()
end

function WBP_Abyss_Lineup_C:IsMobile()
  return self.Platform == CommonConst.CLIENT_DEVICE_TYPE.MOBILE
end

function WBP_Abyss_Lineup_C:InitGamepadKeys()
  if self:IsMobile() then
    return
  end
  self.Icon_Key_Save:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "X"}
    }
  })
  self.Controller_SwitchTeam:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "Vertical"}
    },
    Desc = GText("UI_Abyss_SwitchTeam")
  })
end

function WBP_Abyss_Lineup_C:InitWidget()
  self.bInList = false
  self.CurDungeonPanel = self.Team_Detail1
  local Avatar = ArmoryUtils:GetAvatar()
  if not Avatar then
    DebugPrint("lhr@\233\152\181\229\174\185\233\133\141\231\189\174\231\149\140\233\157\162Avatar\232\142\183\229\143\150\229\164\177\232\180\165")
    return
  end
  self.Btn_Save:SetForbidden(true)
  if self.Dungeons then
    for DungeonIndex, DungeonPanel in pairs(self.Dungeons) do
      if DungeonPanel then
        DungeonPanel:ClearAllSlots(true)
      else
        DebugPrint("lhr@WBP_Abyss_Lineup_C:Enter, \233\152\181\229\174\185\233\157\162\230\157\191\229\136\157\229\167\139\229\140\150\229\164\177\232\180\165")
      end
    end
  end
  self.Dungeons = {}
  self.Uuid2SlotMap = {}
  self.CurSlotType = ""
  self.CurSlotName = self.ESlotName.Null
  self.CurWeaponType = self.CurWeaponType or self.SlotName2Type[self.ESlotName.MeleeWeapon]
  self:CharMain_InitWidget()
  self:WeaponMain_InitWidget()
  self:PetMain_InitWidget()
end

function WBP_Abyss_Lineup_C:Destruct()
  if IsValid(self.GameInputModeSubsystem) then
    self.GameInputModeSubsystem.OnInputMethodChanged:Remove(self, self.RefreshOpInfoByInputDevice)
  end
  if self.SetFocusTimer then
    self:RemoveTimer(self.SetFocusTimer)
    self.SetFocusTimer = nil
  end
end

function WBP_Abyss_Lineup_C:InitTable()
  self.BottomKeyInfo = {
    {
      GamePadInfoList = {
        {
          Type = "Img",
          ImgShortPath = "A",
          Owner = self
        }
      },
      Desc = GText("UI_Tips_Ensure"),
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
      Desc = GText("UI_CTL_Add/Remove"),
      bLongPress = false
    },
    {
      KeyInfoList = {
        {
          Type = "Text",
          Text = "Escape",
          ClickCallback = self.OnReturnKeyDown,
          Owner = self
        }
      },
      GamePadInfoList = {
        {
          Type = "Img",
          ImgShortPath = "B",
          ClickCallback = self.OnReturnKeyDown,
          Owner = self
        }
      },
      Desc = GText("UI_BACK"),
      bLongPress = false
    }
  }
  local TabKeyInfo = {}
  for _, KeyInfo in ipairs(self.BottomKeyInfo) do
    table.insert(TabKeyInfo, KeyInfo)
  end
  self.TabConfigData = {
    TitleName = GText("Abyss_PartySetup"),
    DynamicNode = {"Back", "BottomKey"},
    StyleName = "Text",
    OwnerPanel = self.Root,
    BackCallback = self.Root.OnClickBack,
    BottomKeyInfo = TabKeyInfo
  }
  self.Root:InitOtherPageTab(self.TabConfigData, {}, true)
  self:ShowConfirmBtn(false)
  self:ShowAddAndRemoveBtn(false)
end

function WBP_Abyss_Lineup_C:AddTabItem(idx)
  local TabUI = self.Root.Com_Tab
  if not TabUI then
    return
  end
  local BottomKeyInfo = TabUI.ConfigData.BottomKeyInfo
  BottomKeyInfo[idx] = self.BottomKeyInfo[idx]
end

function WBP_Abyss_Lineup_C:RemoveTabItem(idx)
  local TabUI = self.Root.Com_Tab
  if not TabUI then
    return
  end
  local BottomKeyInfo = TabUI.ConfigData.BottomKeyInfo
  BottomKeyInfo[idx] = {}
end

function WBP_Abyss_Lineup_C:ShowConfirmBtn(bShow)
  local TabUI = self.Root.Com_Tab
  if not TabUI then
    return
  end
  if self:IsMobile() then
    return
  end
  if bShow then
    self:AddTabItem(1)
  else
    self:RemoveTabItem(1)
  end
  TabUI:UpdateHotKeyInfo(self.CurGamepadName)
end

function WBP_Abyss_Lineup_C:ShowAddAndRemoveBtn(bShow)
  local TabUI = self.Root.Com_Tab
  if not TabUI then
    return
  end
  if self:IsMobile() then
    return
  end
  if bShow then
    self:AddTabItem(2)
  else
    self:RemoveTabItem(2)
  end
  TabUI:UpdateHotKeyInfo(self.CurGamepadName)
end

function WBP_Abyss_Lineup_C:OnBackgroundClicked()
  if self.bItemDetailsShowed then
    self:ShowItemDetails(false)
  end
  self:SetContentIsSelected(self.SelectedContent, false)
end

function WBP_Abyss_Lineup_C:Enter(LevelInfo, SelectedDungeon, SelectedSlot)
  self.Saved = true
  self.InList = nil
  self.ReturnPressed = false
  self.bItemDetailsShowed = false
  self.AbyssId = LevelInfo.AbyssId
  self.TeamInfos = LevelInfo.TeamInfos
  self.LevelIndex = LevelInfo.LevelIndex
  self:InitWidget()
  self:RefreshBaseInfo()
  self:InitDungeons(LevelInfo.DungeonIds, SelectedDungeon)
  self:InitDetailPanels()
  self:ClearListenEvent()
  local SelectedSlot = SelectedSlot or self.ESlotName.Char
  if self.CurDungeonPanel then
    self.CurDungeonPanel:SelectSlot(SelectedSlot, false, true)
  end
  self:DelaySetFocusTarget(nil, 0.2)
end

function WBP_Abyss_Lineup_C:InitDungeons(DungeonIds, SelectedDungeon)
  if not DungeonIds or type(DungeonIds) ~= "table" then
    DebugPrint("lhr@WBP_Abyss_Lineup_C:Enter, \229\137\175\230\156\172Id\230\151\160\230\149\136")
    return
  end
  self.DungeonIds = DungeonIds
  if 1 == #DungeonIds then
    self.Team_Detail2:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.Dungeons = {
      [1] = self.Team_Detail1
    }
  else
    self.Team_Detail2:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    self.Dungeons = {
      [1] = self.Team_Detail1,
      [2] = self.Team_Detail2
    }
  end
  local SelectedDungeon = SelectedDungeon or 1
  self.CurDungeonPanel = self.Dungeons[SelectedDungeon]
  for DungeonIndex, DungeonPanel in pairs(self.Dungeons) do
    if DungeonPanel then
      DungeonPanel:Init(DungeonIndex, self, self.DungeonIds[DungeonIndex], DungeonIndex == SelectedDungeon)
    else
      DebugPrint("lhr@WBP_Abyss_Lineup_C:InitDungeons, \233\152\181\229\174\185\233\157\162\230\157\191\229\136\157\229\167\139\229\140\150\229\164\177\232\180\165")
    end
  end
end

function WBP_Abyss_Lineup_C:InitDetailPanels()
  local Avatar = ArmoryUtils:GetAvatar()
  if not Avatar then
    DebugPrint("WBP_Abyss_Lineup_C:InitDetailPanels, \233\133\141\231\189\174\233\157\162\230\157\191\229\136\157\229\167\139\229\140\150\229\164\177\232\180\165\239\188\140Avatar\230\151\160\230\149\136")
    return
  end
  for SlotName, EName in pairs(self.ESlotName) do
    for DungeonIndex, DungeonPanel in pairs(self.Dungeons) do
      local Uuid = self.TeamInfos[DungeonIndex][SlotName]
      if Uuid and self:CheckUnit(Uuid) then
        local SlotType = self.SlotName2Type[EName]
        local DataType = self.SlotType2DataType[SlotType]
        local Unit = Avatar[DataType .. "s"][Uuid]
        if not Unit then
          GWorld.logger.error("WBP_Abyss_Lineup_C:InitDetailPanels@\232\175\165Uuid\229\175\185\229\186\148\231\154\132\231\137\169\229\147\129\229\183\178\229\164\177\230\149\136" .. CommonUtils.ObjId2Str(Uuid))
        end
        local UnitData = Unit and Unit:Data()
        local Content = {
          Type = DataType,
          Icon = UnitData and UnitData.Icon,
          Rarity = UnitData and (UnitData.Rarity or UnitData[DataType .. "Rarity"]),
          GachaIcon = UnitData and UnitData.GachaIcon,
          Uuid = Uuid
        }
        if "Weapon" == DataType then
          local Tags = {
            CommonConst.ArmoryTag.Melee,
            CommonConst.ArmoryTag.Ranged
          }
          for _, WeaponTag in pairs(Tags) do
            if Unit and Unit:HasTag(WeaponTag) then
              Content.Tag = WeaponTag
              self:CallFunctionByName(WeaponTag .. "Main_Init")
              break
            end
          end
        else
          self:CallFunctionByName(SlotType .. "Main_Init")
        end
        DungeonPanel:UpdateSlot(EName, Content)
      end
    end
  end
end

function WBP_Abyss_Lineup_C:CheckUnit(UnitId)
  if type(UnitId) == "number" then
    return UnitId ~= NullUnitId
  else
    return UnitId ~= NullUUid
  end
end

function WBP_Abyss_Lineup_C:InitSelectiveList()
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
  self.PetOrderByAttrNames = {
    "BreakNum",
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

function WBP_Abyss_Lineup_C:SetDetailPanelLocation(SelectedDungeon, IsInit)
  local SetLocationAnimName = ""
  if 1 == SelectedDungeon then
    SetLocationAnimName = "Expand"
  elseif 2 == SelectedDungeon then
    SetLocationAnimName = "Fold"
  end
  if IsInit then
    SetLocationAnimName = SetLocationAnimName .. "_Normal"
  end
  EMUIAnimationSubsystem:EMPlayAnimation(self, self[SetLocationAnimName])
end

function WBP_Abyss_Lineup_C:SelectDungeon(SelectedDungeon, SlotSelected)
  local PreDungeonIndex = self.CurDungeonPanel.DungeonIndex
  if PreDungeonIndex == SelectedDungeon then
    return
  end
  if not SlotSelected then
    self.Dungeons[PreDungeonIndex]:UnSelectSlot(self.CurSlotName)
    self.Dungeons[SelectedDungeon]:SelectSlot(self.ESlotName.Char, false, true)
  end
  for DungeonIndex, DungeonPanel in pairs(self.Dungeons) do
    if DungeonIndex == SelectedDungeon then
      self.CurDungeonPanel = DungeonPanel
      DungeonPanel:ExpandPanel()
    else
      DungeonPanel:CollapsePanel()
    end
  end
  self:DelaySetFocusTarget(nil, 0.2)
end

function WBP_Abyss_Lineup_C:SlotSelectionChanged(SlotName, DungeonIndex, bToList)
  if self.Dungeons[DungeonIndex] == nil then
    return
  end
  if not self:IsListAllowRefresh() then
    return
  end
  local bSlotChanged = false
  local PreDungeonIndex = self.CurDungeonPanel.DungeonIndex
  if DungeonIndex ~= PreDungeonIndex then
    self:SelectDungeon(DungeonIndex, true)
    bSlotChanged = true
  end
  local PreSlotName = self.CurSlotName
  self.CurSlotName = SlotName
  local CurSlotType = self.SlotName2Type[SlotName]
  if self.CurSlotName ~= PreSlotName then
    bSlotChanged = true
  end
  self:DelaySetFocusTarget(bToList)
  if bSlotChanged then
    self.CurSlotType = CurSlotType
    self.Dungeons[PreDungeonIndex]:UnSelectSlot(PreSlotName)
    self.CurDungeonPanel:CheckSlot(SlotName)
    self.CurDungeonPanel.CurSlotName = self.CurSlotName
    if self.CurSlotType == "Weapon" then
      self.List_Lineup.Tab_Primary:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
      local WeaponType = self.CurDungeonPanel:GetWeaponType(self.CurSlotName)
      self:PhantomWeaponTypeChanged(WeaponType, false, true)
      return
    else
      self.List_Lineup.Tab_Primary:SetVisibility(UE4.ESlateVisibility.Collapsed)
    end
    self:ReInitListItems()
  end
end

function WBP_Abyss_Lineup_C:ReInitListItems()
  local Uuid = self.CurDungeonPanel:GetCurrentUuid(self.CurSlotName)
  self["Current" .. self.CurSlotType .. "Uuid"] = Uuid
  self:CallFunctionByName(self.CurSlotType .. "Main_Init")
  self:InitItemDetailWidget()
  self:FillSelectiveList()
end

function WBP_Abyss_Lineup_C:OnListInited(bListEmpty)
  self.bListEmpty = bListEmpty
  if self.bItemDetailsShowed then
    self:ShowItemDetails(false)
  end
  self:SetContentIsSelected(self.SelectedContent, false)
  self:UpdateTeamIcons()
end

function WBP_Abyss_Lineup_C:InitItemDetailWidget()
  if self.ItemDetailsWidget then
    self.ItemDetailsWidget:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.ItemDetailsWidget:DestroyObject()
  end
  self.ItemDetailsWidget = UIManager(self):_CreateWidgetNew("ItemDetailsMain")
  self:AttachTipsWidget(self.ItemDetailsWidget)
  self.ItemDetailsWidget:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.ItemDetailsWidget.Key_Confirm:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "A"}
    },
    Desc = GText("UI_Add")
  })
  self.ItemDetailsWidget.Key_Confirm:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  self.ItemDetailsWidget.Key_Back:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self.ItemDetailsWidget.bIsFocusable = false
  self.bItemDetailsShowed = false
  self.ItemDetailsContent = nil
end

function WBP_Abyss_Lineup_C:GetCurrentContent()
  return self[self.CurSlotType .. "Main_CurContent"]
end

function WBP_Abyss_Lineup_C:CallFunctionByName(FunctionName, ...)
  if self[FunctionName] then
    return self[FunctionName](self, ...)
  end
end

function WBP_Abyss_Lineup_C:RemoveTeamIcons(DungeonIndex)
  local DungeonPanel = self.Dungeons[DungeonIndex]
  if not DungeonPanel then
    DebugPrint("lhr@WBP_Abyss_Lineup_C:RemoveTeamIcons, DungeonIndex\229\175\185\229\186\148\231\154\132\229\133\179\229\141\161\233\152\181\229\174\185\233\157\162\230\157\191\230\151\160\230\149\136")
    return
  end
  for SlotName, Slot in pairs(DungeonPanel.Slots) do
    if Slot and not Slot.IsEmpty then
      local Type = self.SlotName2Type[SlotName]
      if "Weapon" == Type then
        Type = DungeonPanel:GetWeaponType(SlotName)
      end
      self[Type .. "Main_CurContent"] = nil
      local Content = self[Type .. "ItemContentsMap"][Slot.Uuid]
      Content.TeamIdx = nil
      self:SetContentIsChosen(Content, false)
    end
  end
end

function WBP_Abyss_Lineup_C:UpdateTeamIcons()
  for DungeonIndex, DungeonPanel in pairs(self.Dungeons) do
    for SlotName, Slot in pairs(DungeonPanel.Slots) do
      if Slot and not Slot.IsEmpty then
        local Type = self.SlotName2Type[SlotName]
        local IsPhantomWeapon = false
        if "Weapon" == Type then
          Type = DungeonPanel:GetWeaponType(SlotName)
          if Type ~= self.CurSlotType then
          else
            IsPhantomWeapon = true
            else
              if Type == self.CurSlotType then
                goto lbl_33
              end
              goto lbl_52
            end
            ::lbl_33::
            local Content = self[Type .. "ItemContentsMap"][Slot.Uuid]
            if Content then
              Content.TeamIdx = DungeonIndex
              if IsPhantomWeapon then
                local PhantomUuid = DungeonPanel:GetCurrentUuid(SlotName - 1)
                Content.TeamCharId = self.CharItemContentsMap[PhantomUuid].UnitId
              end
            end
          end
      end
      ::lbl_52::
    end
  end
end

function WBP_Abyss_Lineup_C:UpdateSingleTeamIcon(Uuid, bVisble, Type)
  local Type = Type or self.CurSlotType
  local Content = self[Type .. "ItemContentsMap"][Uuid]
  if not Content then
    DebugPrint("lhr@UpdateSingleTeamIcon: Uuid\230\178\161\230\156\137\229\175\185\229\186\148\231\154\132Content")
    return
  end
  Content.TeamIdx = bVisble and Content.TeamIdx or nil
end

function WBP_Abyss_Lineup_C:FillSelectiveList()
  self.List_Lineup:BindEvents(self, {
    SortFuncion = self.SortItemContents,
    FilterFunction = self.FilterItemContents,
    OnItemIsHoverChanged = self.OnItemIsHoverChanged
  })
  if self[self.CurSlotType .. "FilterTags"] then
    self.Filters = self:CreateFilters(self[self.CurSlotType .. "FilterTags"], self[self.CurSlotType .. "FilterNames"], self[self.CurSlotType .. "FilterIcons"])
  else
    self.Filters = nil
  end
  self.List_Lineup:Init(self, {
    Filters = self.Filters,
    OrderByDisplayNames = self.OrderByDisplayNames,
    SortType = CommonConst.DESC,
    ItemContents = self[self.CurSlotType .. "ItemContentsArray"],
    Type = self.CurSlotType
  })
end

function WBP_Abyss_Lineup_C:PhantomWeaponTypeChanged(Type, IsPlaySound, bSlotChanged)
  if Type == self.SlotName2Type[self.ESlotName.RangedWeapon] or Type == self.SlotName2Type[self.ESlotName.MeleeWeapon] then
    if not bSlotChanged and not self:IsListAllowRefresh() then
      return
    end
    if self.CurWeaponType then
      if not bSlotChanged and Type == self.CurWeaponType then
        return
      end
      self.TypeTabs[self.CurWeaponType]:SetIsChecked(false)
    end
    self.TypeTabs[Type]:SetIsChecked(true, IsPlaySound)
    self.CurWeaponType = Type
    self.CurSlotType = self.CurWeaponType
    self:ReInitListItems()
    self:DelaySetFocusTarget(bSlotChanged)
  else
    DebugPrint("lhr@PhantomWeaponTypeChanged:\228\188\160\229\133\165\230\173\166\229\153\168\231\177\187\229\158\139\230\151\160\230\149\136,", Type)
  end
end

function WBP_Abyss_Lineup_C:IsListAllowRefresh()
  if not self.List_Lineup then
    return false
  end
  return self.List_Lineup.bAllowRefreshList
end

function WBP_Abyss_Lineup_C:CreateFilters(InTags, InTexts, InIcons)
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

function WBP_Abyss_Lineup_C:OnItemIsHoverChanged(ItemContent, bHovered)
  if not ItemContent.Uuid then
    return
  end
  if not self.UsingGamepad then
    return
  end
  if not self.List_Lineup:IsInLSMode() then
    self:ShowItemDetails(bHovered and not self:IsChar(), ItemContent)
  end
end

function WBP_Abyss_Lineup_C:OnListItemClicked(Content)
  if not Content.Uuid then
    return
  end
  if self.Saved then
    self.Btn_Save:SetForbidden(false)
  end
  self.Saved = false
  if not self.UsingGamepad then
    self:ShowItemDetails(not self:IsChar(), Content)
  end
  if Content.TeamIdx then
    local CurrentUuid = self.CurDungeonPanel:GetCurrentUuid(self.CurSlotName)
    if Content.Uuid == CurrentUuid then
      self.CurDungeonPanel:ClearSlot(self.CurSlotName)
      self:SetContentIsChosen(Content, false)
      if not self.UsingGamepad then
        self:SetContentIsSelected(Content, true)
      end
    else
      local OtherSlotInfo = self.Uuid2SlotMap[Content.Uuid]
      local Type = self.SlotName2Type[self.CurSlotName]
      if "Weapon" == Type then
        Type = self.CurDungeonPanel:GetWeaponType(self.CurSlotName)
      end
      local CurContent = self[Type .. "ItemContentsMap"][CurrentUuid]
      self.CurDungeonPanel:UpdateSlot(self.CurSlotName, Content)
      self.Dungeons[OtherSlotInfo.DungeonIndex]:UpdateSlot(OtherSlotInfo.SlotName, CurContent)
      local PreIndex = Content.TeamIdx
      local PreChar = Content.TeamCharId
      self:CallFunctionByName(self.CurSlotType .. "Main_OnListItemClicked", Content)
      if CurContent and CurContent.SelfWidget then
        CurContent.TeamIdx = PreIndex
        CurContent.TeamCharId = PreChar
        CurContent.SelfWidget:SetTeamIcon(PreIndex, PreChar)
      end
      UIManager(GWorld.GameInstance):ShowUITip(UIConst.Tip_CommonToast, GText(Content.UnitName) .. GText("Abyss_Party_Replaced") .. "<Highlight>" .. self.CurDungeonPanel.Name .. "\194\183" .. self.SlotName2TextMap[self.CurSlotName] .. "</>")
      return
    end
  end
  self:CallFunctionByName(self.CurSlotType .. "Main_OnListItemClicked", Content)
end

function WBP_Abyss_Lineup_C:IsChar()
  return self.CurSlotType == CommonConst.ArmoryType.Char
end

function WBP_Abyss_Lineup_C:GetZOrder()
  return self.Root:GetZOrder()
end

function WBP_Abyss_Lineup_C:OnFocusReceived(MyGeometry, InFocusEvent)
  self:SetFocusTarget()
  return UIUtils.Handle
end

function WBP_Abyss_Lineup_C:SortItemContents(InOutContentArray, SortByIdx, SortType)
  local FirstContent = self[self.CurSlotType .. "Main_CurContent"] or self[self.CurSlotType .. "Main_CmpContent"]
  local OrderByAttrNames
  if self.CurSlotType == "Pet" then
    OrderByAttrNames = self.PetOrderByAttrNames
    if 2 == SortByIdx then
      SortByIdx = 3
    end
  else
    OrderByAttrNames = self.OrderByAttrNames
  end
  local SortByAttrNames = {
    OrderByAttrNames[SortByIdx]
  }
  for index, value in ipairs(OrderByAttrNames) do
    if index ~= SortByIdx then
      table.insert(SortByAttrNames, value)
    end
  end
  ArmoryUtils:SortItemContents(InOutContentArray, SortByAttrNames, SortType, FirstContent)
end

function WBP_Abyss_Lineup_C:FilterItemContents(InContentArray, FilterIdxes)
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

function WBP_Abyss_Lineup_C:NewItemContent(Target, Type, Tag)
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
  Obj.OnMouseButtonUpEvents = {
    Obj = self,
    Callback = function()
      self:OnListItemClicked(Obj)
    end
  }
  return Obj
end

function WBP_Abyss_Lineup_C:NewPetItemContent(Target)
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
  Obj.OnMouseButtonUpEvents = {
    Obj = self,
    Callback = function()
      self:OnListItemClicked(Obj)
    end
  }
  return Obj
end

function WBP_Abyss_Lineup_C:ShowItemDetails(bShow, Content)
  if bShow then
    if self.bListEmpty then
      return
    end
    if Content.Type == "Char" then
      return
    end
    if self.ItemDetailsContent ~= Content then
      self.ItemDetailsWidget:RefreshItemInfo(Content, true)
    end
    self.ItemDetailsWidget:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    self.ItemDetailsWidget:StopAnimation(self.ItemDetailsWidget.Out)
    self.ItemDetailsWidget:PlayAnimation(self.ItemDetailsWidget.In)
    self.bItemDetailsShowed = true
  elseif self.ItemDetailsWidget then
    self.bItemDetailsShowed = false
    self.ItemDetailsWidget:StopAnimation(self.ItemDetailsWidget.In)
    self.ItemDetailsWidget:PlayAnimation(self.ItemDetailsWidget.Out)
  end
  self.ItemDetailsContent = Content
end

function WBP_Abyss_Lineup_C:AttachTipsWidget(Widget)
  self.Pos_Tip:AddChild(Widget)
end

function WBP_Abyss_Lineup_C:SetContentIsChosen(Content, IsChosen)
  if Content then
    if Content.SelfWidget then
      self:SetContentIsSelected(Content, IsChosen)
      Content.SelfWidget:SetTeamIcon(IsChosen and Content.TeamIdx, Content.TeamCharId)
      self:PlaySelectSound(IsChosen, Content.Type)
    elseif not IsChosen then
      Content.TeamIdx = nil
      Content.TeamCharId = nil
    end
  end
end

function WBP_Abyss_Lineup_C:SetContentIsSelected(Content, IsSelected)
  if Content then
    Content.IsSelect = IsSelected
    if Content.SelfWidget then
      Content.SelfWidget:SetSelected(IsSelected)
    end
    if IsSelected then
      self:SetContentIsSelected(self.SelectedContent, false)
      self.SelectedContent = Content
    else
      self.SelectedContent = nil
    end
  end
end

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

function WBP_Abyss_Lineup_C:PlaySelectSound(IsSelected, Type)
  if not IsSelected then
    AudioManager(self):PlayUISound(self, SelectSoundPaths.Default, nil, nil)
  else
    AudioManager(self):PlayUISound(self, SelectSoundPaths[Type], nil, nil)
    AudioManager(self):PlayUISound(self, EquipSoundPaths[Type], nil, nil)
  end
end

function WBP_Abyss_Lineup_C:SaveLineup()
  if self.Saved then
    if self.UsingGamepad then
      self.Btn_Save:SetForbidden(true)
      UIManager(GWorld.GameInstance):ShowUITip(UIConst.Tip_CommonToast, GText("UI_PersonInfo_Saved"))
    else
      self:OnReturnKeyDown()
    end
    return
  end
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    DebugPrint("lhr@\233\152\181\229\174\185\233\133\141\231\189\174\231\149\140\233\157\162\228\191\157\229\173\152\229\164\177\232\180\165\239\188\154Avatar\232\142\183\229\143\150\229\164\177\232\180\165")
    return
  end
  local TeamTable = {
    [1] = {
      Char = NullUUid,
      MeleeWeapon = NullUUid,
      RangedWeapon = NullUUid,
      Phantom1 = NullUUid,
      PhantomWeapon1 = NullUUid,
      Phantom2 = NullUUid,
      PhantomWeapon2 = NullUUid,
      Pet = NullUnitId
    },
    [2] = {
      Char = NullUUid,
      MeleeWeapon = NullUUid,
      RangedWeapon = NullUUid,
      Phantom1 = NullUUid,
      PhantomWeapon1 = NullUUid,
      Phantom2 = NullUUid,
      PhantomWeapon2 = NullUUid,
      Pet = NullUnitId
    }
  }
  for DungeonIndex, DungeonPanel in pairs(self.Dungeons) do
    for SlotName, EName in pairs(self.ESlotName) do
      local Uuid = DungeonPanel:GetCurrentUuid(EName)
      if Uuid then
        TeamTable[DungeonIndex][SlotName] = Uuid
      end
    end
  end
  
  local function Callback(RetCode)
    if RetCode == ErrorCode.RET_SUCCESS then
      self.Saved = true
    elseif DataMgr.ErrorCode[RetCode] then
      local ErrorContent = DataMgr.ErrorCode[RetCode].ErrorCodeContent
      UIManager(self):ShowUITip(UIConst.Tip_CommonTop, ErrorContent)
    end
    if self.UsingGamepad then
      self.Btn_Save:SetForbidden(true)
      UIManager(GWorld.GameInstance):ShowUITip(UIConst.Tip_CommonToast, GText("UI_PersonInfo_Saved"))
    else
      self:OnReturnKeyDown()
    end
  end
  
  Avatar:SaveAbyssTeam(Callback, self.AbyssId, self.LevelIndex, TeamTable)
end

function WBP_Abyss_Lineup_C:GetCurModType()
  return self.SlotType2DataType[self.SlotName2Type[self.CurSlotName]]
end

function WBP_Abyss_Lineup_C:GetModType(SlotName)
  return self.SlotType2DataType[self.SlotName2Type[SlotName]]
end

function WBP_Abyss_Lineup_C:InitListenEvent()
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
  if IsValid(self.GameInputModeSubsystem) then
    self.GameInputModeSubsystem.OnInputMethodChanged:Add(self, self.RefreshOpInfoByInputDevice)
  end
end

function WBP_Abyss_Lineup_C:RefreshBaseInfo()
  if IsValid(self.GameInputModeSubsystem) then
    self:RefreshOpInfoByInputDevice(self.GameInputModeSubsystem:GetCurrentInputType(), self.GameInputModeSubsystem:GetCurrentGamepadName())
  end
end

function WBP_Abyss_Lineup_C:OnPreviewKeyDown(MyGeometry, InKeyEvent)
  if CommonUtils:IfExistSystemGuideUI(self) then
    return UE4.UWidgetBlueprintLibrary.Handled()
  end
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local IsHandled = false
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) then
    if "Gamepad_DPad_Up" == InKeyName then
      if not self.bInList and self.Dungeons and #self.Dungeons > 1 then
        local DungeonIndex = self.CurDungeonPanel.DungeonIndex
        if DungeonIndex > 1 then
          self:SelectDungeon(DungeonIndex - 1)
        end
        IsHandled = true
      end
    elseif "Gamepad_DPad_Down" == InKeyName then
      if not self.bInList and self.Dungeons and #self.Dungeons > 1 then
        local DungeonIndex = self.CurDungeonPanel.DungeonIndex
        if DungeonIndex < #self.Dungeons then
          self:SelectDungeon(DungeonIndex + 1)
        end
        IsHandled = true
      end
    elseif "Gamepad_DPad_Left" == InKeyName then
      if not self.bInList then
        IsHandled = true
      end
    elseif "Gamepad_DPad_Right" == InKeyName and not self.bInList then
      IsHandled = true
    end
  end
  if IsHandled then
    return UE4.UWidgetBlueprintLibrary.Handled()
  end
  return UE4.UWidgetBlueprintLibrary.Unhandled()
end

function WBP_Abyss_Lineup_C:OnKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local IsHandled = true
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) then
    if "Gamepad_FaceButton_Right" == InKeyName then
    elseif "Gamepad_Special_Right" == InKeyName then
      if not self.bInList and not self.CurDungeonPanel.Btn_MonsterInfo.IsPressing then
        self.CurDungeonPanel.Btn_MonsterInfo:OnBtnPressed()
      end
    elseif "Gamepad_Special_Left" == InKeyName then
      if not self.bInList and not self.CurDungeonPanel.Btn_Entry.IsPressing then
        self.CurDungeonPanel.Btn_Entry:OnBtnPressed()
      end
    elseif "Gamepad_FaceButton_Left" == InKeyName then
      if not self.Btn_Save.IsPressing then
        self.Btn_Save:OnBtnPressed()
      end
    elseif "Gamepad_LeftShoulder" == InKeyName then
      if self.bInList and (self.CurSlotName == self.ESlotName.PhantomWeapon1 or self.CurSlotName == self.ESlotName.PhantomWeapon2) then
        self:PhantomWeaponTypeChanged("Melee", true)
      end
    elseif "Gamepad_RightShoulder" == InKeyName then
      if self.bInList and (self.CurSlotName == self.ESlotName.PhantomWeapon1 or self.CurSlotName == self.ESlotName.PhantomWeapon2) then
        self:PhantomWeaponTypeChanged("Ranged", true)
      end
    elseif "Gamepad_LeftThumbstick" == InKeyName then
      if not self.bInList then
        self.CurDungeonPanel.Btn_Clear:OnBtnClicked()
      end
    elseif "Gamepad_FaceButton_Top" == InKeyName then
      if not self.bInList then
        self.CurDungeonPanel.Btn_Mod:OnBtnClicked()
      end
    else
      IsHandled = false
    end
  elseif "Escape" == InKeyName then
  elseif "Q" == InKeyName then
    if self.bInList and (self.CurSlotName == self.ESlotName.PhantomWeapon1 or self.CurSlotName == self.ESlotName.PhantomWeapon2) then
      self:PhantomWeaponTypeChanged("Melee", true)
    end
  elseif "E" == InKeyName then
    if self.bInList and (self.CurSlotName == self.ESlotName.PhantomWeapon1 or self.CurSlotName == self.ESlotName.PhantomWeapon2) then
      self:PhantomWeaponTypeChanged("Ranged", true)
    end
  else
    IsHandled = false
  end
  return IsHandled and UE4.UWidgetBlueprintLibrary.Handled() or UE4.UWidgetBlueprintLibrary.UnHandled()
end

function WBP_Abyss_Lineup_C:OnKeyUp(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if self.bInList and self.List_Lineup:OnListKeyUp(MyGeometry, InKeyEvent) then
    return UE4.UWidgetBlueprintLibrary.Handled()
  end
  local IsHandled = true
  if "Gamepad_FaceButton_Right" == InKeyName or "Escape" == InKeyName then
    if not self.bInList then
      if not self.ReturnPressed then
        self.ReturnPressed = true
        self:OnReturnKeyDown()
      else
        self.ReturnPressed = false
      end
    else
      self:SetFocusTarget(false)
    end
  elseif "Gamepad_Special_Right" == InKeyName then
    if not self.bInList then
      self.CurDungeonPanel.Btn_MonsterInfo:OnBtnReleased()
      self.CurDungeonPanel.Btn_MonsterInfo:OnBtnClicked()
    end
  elseif "Gamepad_Special_Left" == InKeyName then
    if not self.bInList then
      self.CurDungeonPanel.Btn_Entry:OnBtnReleased()
      self.CurDungeonPanel.Btn_Entry:OnBtnClicked()
      self.ReturnPressed = true
    end
  elseif "Gamepad_FaceButton_Left" == InKeyName then
    self.Btn_Save:OnBtnReleased()
    self.Btn_Save:OnBtnClicked()
  else
    IsHandled = false
  end
  return IsHandled and UE4.UWidgetBlueprintLibrary.Handled() or UE4.UWidgetBlueprintLibrary.UnHandled()
end

function WBP_Abyss_Lineup_C:OnAnalogValueChanged(MyGeometry, InAnalogInputEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InAnalogInputEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if "Gamepad_LeftX" == InKeyName or "Gamepad_LeftY" == InKeyName then
    local LeftDelta = UKismetInputLibrary.GetAnalogValue(InAnalogInputEvent)
    if (LeftDelta and LeftDelta > 0.5 or LeftDelta < -0.5) and IsValid(self.GameInputModeSubsystem) and not self.UsingGamepad then
      self:RefreshOpInfoByInputDevice(ECommonInputType.Gamepad, self.GameInputModeSubsystem:GetCurrentGamepadName())
    end
    return UIUtils.Unhandled
  end
  return UIUtils.Handled
end

function WBP_Abyss_Lineup_C:CreateCDTimer()
  self.CdTimer = self:AddTimer(0.15, function()
    self.CdTimer = nil
  end, nil, nil, nil, true)
end

function WBP_Abyss_Lineup_C:ClearListenEvent()
  for _, DungeonPanel in pairs(self.Dungeons) do
    DungeonPanel:ClearListenEvent()
  end
end

function WBP_Abyss_Lineup_C:ResetListenEvent()
  for _, DungeonPanel in pairs(self.Dungeons) do
    DungeonPanel:ResetListenEvent()
  end
end

function WBP_Abyss_Lineup_C:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  if self:IsMobile() then
    return
  end
  local IsUseKeyAndMouse = CurInputDevice == ECommonInputType.MouseAndKeyboard
  if IsUseKeyAndMouse then
    self.UsingGamepad = false
    if self.bItemDetailsShowed then
      self:ShowItemDetails(false)
    end
    self:SetContentIsSelected(self.SelectedContent, false)
  else
    self.UsingGamepad = true
    self.CurGamepadName = CurGamepadName
    if self:HasFocusedDescendants() or self:HasAnyUserFocus() then
      self:SetFocusTarget()
    end
  end
  self:OnUpdateUIStyleByInputTypeChange(CurInputDevice, CurGamepadName)
end

function WBP_Abyss_Lineup_C:OnUpdateUIStyleByInputTypeChange(CurInputDevice, CurGamepadName)
  if self:IsMobile() then
    return
  end
  if CurInputDevice == ECommonInputType.Gamepad then
    self.Controller_Save:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    if self.bInList then
      self.List_Lineup:OnUpdateUIStyleByInputTypeChange(CurInputDevice, CurGamepadName)
      return
    end
    for _, IconName in pairs(self.GamepadIcons) do
      if self[IconName] then
        self[IconName]:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
      end
    end
    self.List_Lineup:OnUpdateUIStyleByInputTypeChange(ECommonInputType.Touch)
    self.CurDungeonPanel:OnUpdateUIStyleByInputTypeChange(CurInputDevice, CurGamepadName)
  else
    self.Controller_Save:SetVisibility(UE4.ESlateVisibility.Collapsed)
    for _, IconName in pairs(self.GamepadIcons) do
      if self[IconName] then
        self[IconName]:SetVisibility(UE4.ESlateVisibility.Collapsed)
      end
    end
    self.List_Lineup:OnUpdateUIStyleByInputTypeChange(CurInputDevice, CurGamepadName)
    self.CurDungeonPanel:OnUpdateUIStyleByInputTypeChange(CurInputDevice, CurGamepadName)
  end
end

function WBP_Abyss_Lineup_C:SwitchGamepadUIMode(bToList)
  if not self.UsingGamepad then
    return
  end
  if bToList then
    self.List_Lineup:OnUpdateUIStyleByInputTypeChange(ECommonInputType.Gamepad)
    for _, IconName in pairs(self.GamepadIcons) do
      if self[IconName] then
        self[IconName]:SetVisibility(UE4.ESlateVisibility.Collapsed)
      end
    end
    self.CurDungeonPanel:OnUpdateUIStyleByInputTypeChange(ECommonInputType.MouseAndKeyboard)
    self:ShowConfirmBtn(false)
    self:ShowAddAndRemoveBtn(true)
  else
    self.List_Lineup:OnUpdateUIStyleByInputTypeChange(ECommonInputType.Touch)
    for _, IconName in pairs(self.GamepadIcons) do
      if self[IconName] then
        self[IconName]:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
      end
    end
    self.CurDungeonPanel:OnUpdateUIStyleByInputTypeChange(ECommonInputType.Gamepad)
    self:ShowConfirmBtn(true)
    self:ShowAddAndRemoveBtn(false)
    self:SetContentIsSelected(self.SelectedContent, false)
  end
end

function WBP_Abyss_Lineup_C:DelaySetFocusTarget(bToList, OverriddenDelayTime)
  if self.SetFocusTimer then
    self:RemoveTimer(self.SetFocusTimer)
  end
  self.SetFocusTimer = self:AddTimer(OverriddenDelayTime or 0.1, function()
    self:SetFocusTarget(bToList)
    self.SetFocusTimer = nil
  end, nil, nil, nil, true)
end

function WBP_Abyss_Lineup_C:SetFocusTarget(bToList)
  if not self.UsingGamepad then
    return
  end
  if nil ~= bToList then
    if bToList == self.bInList then
      return
    end
    self.bInList = bToList
  end
  if self.bInList then
    local Content = self:GetCurrentContent() or self.List_Lineup.List_Select:GetItemAt(0)
    if Content then
      self.GameInputModeSubsystem:SetTargetUIFocusWidget(Content.SelfWidget)
      self.GameInputModeSubsystem:UpdateCurrentFocusWidgetPos()
      self.List_Lineup.List_Select:BP_NavigateToItem(Content)
    else
      self.List_Lineup:SetCurrentTabItemFocus()
    end
  else
    local CurDungeonPanel = self.CurDungeonPanel
    local FocusTarget = CurDungeonPanel
    if CurDungeonPanel then
      local CurrentSlot = CurDungeonPanel.Slots[self.CurSlotName]
      if CurrentSlot then
        FocusTarget = CurrentSlot
      end
    end
    if FocusTarget then
      FocusTarget:SetFocus()
    end
  end
  self:SwitchGamepadUIMode(self.bInList)
end

function WBP_Abyss_Lineup_C:BP_GetDesiredFocusTarget()
  self:SetFocusTarget()
  return nil
end

function WBP_Abyss_Lineup_C:ShowReturnConfirmWindow()
  local CommonDialogParams = {}
  if self.ReturnTimer then
    self:RemoveTimer(self.ReturnTimer)
  end
  
  function CommonDialogParams.LeftCallbackFunction()
    self:SetFocus()
  end
  
  function CommonDialogParams.OnCloseCallbackFunction()
    self:SetFocus()
    self.ReturnTimer = self:AddTimer(1, function()
      self.ReturnPressed = false
    end, nil, nil, nil, true)
  end
  
  function CommonDialogParams.RightCallbackFunction()
    self.Root:OpenSubUI(self.PreWidgetInfo, true)
  end
  
  self:ShowConfirmWindow(100149, CommonDialogParams, self.Root)
end

function WBP_Abyss_Lineup_C:ShowConfirmWindow(PopupId, Params, ParentWidget)
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  local UIManager = GameInstance:GetGameUIManager()
  UIManager:ShowCommonPopupUI(PopupId, Params, ParentWidget)
end

function WBP_Abyss_Lineup_C:OnReturnKeyDown()
  if not self.Saved then
    self:ShowReturnConfirmWindow()
    return
  end
  local SelectPage = self.Root:OpenSubUI(self.PreWidgetInfo, true)
  if self.SetFocusTimer then
    self:RemoveTimer(self.SetFocusTimer)
    self.SetFocusTimer = nil
  end
end

function WBP_Abyss_Lineup_C:SwitchIn(...)
  local LevelParams, DungeonIndex, SlotName = ...
  self:InitTable()
  self:Enter(LevelParams, DungeonIndex, SlotName)
  if self:IsAnyAnimationPlaying() then
    self:StopAllAnimations()
  end
  self:PlayAnimation(self.In)
  self:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
end

function WBP_Abyss_Lineup_C:SwitchOut()
  self:ResetListenEvent()
  self:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  if not self.BindOutAnimation then
    self:BindToAnimationFinished(self.Out, {
      self,
      function()
        self:SetVisibility(UIConst.VisibilityOp.Collapsed)
      end
    })
    self.BindOutAnimation = true
  end
  self:PlayAnimation(self.Out)
end

AssembleComponents(WBP_Abyss_Lineup_C)
return WBP_Abyss_Lineup_C
