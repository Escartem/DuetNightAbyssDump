require("UnLua")
local ArmoryUtils = require("BluePrints.UI.WBP.Armory.ArmoryUtils")
local SkillUtils = require("Utils.SkillUtils")
local PetEntryAchivePath = "WidgetBlueprint'/Game/UI/WBP/Armory/Widget/Pet/WBP_Armory_PetEntryAchive.WBP_Armory_PetEntryAchive'"
local M = Class()
M._components = {
  "BluePrints.UI.UI_PC.Common.HorizontalListViewResizeComp"
}

function M:Construct()
  self.Super.Construct(self)
end

function M:ModifySortWidgetParams(Params)
end

function M:OnBackKeyDown()
  AudioManager(self):SetEventSoundParam(self, "PetIndex", {ToEnd = 1})
  self.PetEntryAchive:PlayAnimation(self.PetEntryAchive.Auto_Out)
  self:Close()
end

function M:InitComp(SelectedPetEntryID)
  self.SelectedPetEntryID = SelectedPetEntryID
  self.Btn_Close:Init("Close", self, self.OnBackKeyDown)
  self.PetEntryAchive = UIManager(self):CreateWidget(PetEntryAchivePath)
  self.Group_Page:ClearChildren()
  self.Group_Page:AddChildToOverlay(self.PetEntryAchive)
  local ContentOverlaySlot = UE4.UWidgetLayoutLibrary.SlotAsOverlaySlot(self.PetEntryAchive)
  ContentOverlaySlot:SetHorizontalAlignment(EHorizontalAlignment.HAlign_Fill)
  ContentOverlaySlot:SetVerticalAlignment(EVerticalAlignment.VAlign_Fill)
  self.HB_Key:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  self.Tab_Archive:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.PetEntryAchive.Text_Lock:SetText(GText("Pet_Affix_AutoLock"))
  self.PetEntryAchive.Text_Hold:SetText(GText("Pet_Affix_Hold"))
  self.PetEntryAchive.List_Item.BP_OnItemClicked:Add(self, self.OnItemClicked)
  self.PetEntryAchive.Text_Empty:SetText(GText("Pet_Affix_Without"))
  self.PetEntryAchive.Text_Empty_1:SetText(GText("Pet_Affix_Archive_LockToast"))
  self.SortType = CommonConst.DESC
  self.SortSelection = 1
  local Params = {}
  self:ModifySortWidgetParams(Params)
  self.PetEntryAchive.Pet_Sort:SetNavigationRuleBase(EUINavigation.Right, EUINavigationRule.Stop)
  self.PetEntryAchive.Pet_Sort:Init(self, {
    GText("UI_RARITY_NAME"),
    GText("Pet_Affix_Type")
  }, CommonConst.DESC, Params)
  self.PetEntryAchive.Pet_Sort:BindEventOnSelectionsChanged(self, self.OnSortSelectionChanged)
  self.PetEntryAchive.Pet_Sort:BindEventOnSortTypeChanged(self, self.OnSortTypeChanged)
  self.PetEntryAchive.List_Item.OnCreateEmptyContent:Bind(self, function(self)
    return NewObject(UIUtils.GetCommonItemContentClass())
  end)
  self.ReddotNodeName = "PetEntry"
  if not ReddotManager.GetTreeNode(self.ReddotNodeName) then
    ReddotManager.AddNode(self.ReddotNodeName, nil, 1)
  end
  self.PetEntryAchive.Switch_Lock:AddEventOnCheckStateChanged(self, self.OnLockStateChanged)
  if self.CurInputDevice == ECommonInputType.Gamepad then
    self.PetEntryAchive.Key_Lock:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  else
    self.PetEntryAchive.Key_Lock:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

function M:LockPetEntry(IsChecked, LockBagPet)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  
  local function Cb(ErrCode)
    if 0 == ErrCode then
      local Avatar = GWorld:GetAvatar()
      local PetEntryLockSetting = Avatar.PetEntryLockSetting
      for i = 0, self.PetEntryAchive.List_Item:GetNumItems() - 1 do
        local ItemContent = self.PetEntryAchive.List_Item:GetItemAt(i)
        if ItemContent and ItemContent.Id then
          local IsLocked = PetEntryLockSetting[ItemContent.Id] ~= nil
          local LockType = IsLocked and 1 or 0
          if ItemContent.IsLocked ~= IsLocked then
            ItemContent.IsLocked = IsLocked
            ItemContent.LockType = LockType
            if ItemContent.SelfWidget then
              ItemContent.SelfWidget:SetLock(LockType)
            end
          end
        end
      end
    end
    self:BlockAllUIInput(false)
  end
  
  self:BlockAllUIInput(true)
  Avatar:PetEntryLock(self.SelectedContent.Id, IsChecked, LockBagPet, Cb)
end

function M:OnLockStateChanged(IsChecked)
  print("OnLockStateChanged", IsChecked)
  if not IsChecked then
    if not self.SelectedContent.IsLocked then
      return
    end
    self.SelectedContent.IsLocked = false
    self.SelectedContent.LockType = 0
    self.SelectedContent.SelfWidget:SetLock(0)
    self:LockPetEntry(IsChecked, false)
    return
  elseif self.SelectedContent.IsLocked then
    return
  end
  
  local function CancelFunc()
    self:LockPetEntry(IsChecked, false)
  end
  
  local function ConfirmFunc()
    self:LockPetEntry(IsChecked, true)
  end
  
  local function CloseBtnFunc()
    self.PetEntryAchive.Switch_Lock:SetChecked(false, true)
    self:SelectItem(self.SelectedContent)
  end
  
  UIManager():ShowCommonPopupUI(100221, {
    LeftCallbackFunction = CancelFunc,
    RightCallbackFunction = ConfirmFunc,
    CloseBtnCallbackFunction = CloseBtnFunc
  }, self)
end

function M:InitTab()
  local Tabs = {}
  local ConfigData = {
    Owner = self,
    LeftKey = "NotShow",
    RightKey = "NotShow",
    SoundFuncReceiver = self,
    SoundFunc = self.MainTabClickSoundFunc,
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
            ClickCallback = self.OnBackKeyDown
          }
        },
        Desc = GText("UI_BACK"),
        bLongPress = false
      }
    }
  }
  self.Tab_Archive:Init(ConfigData)
  self.Tab_Archive:BindEventOnTabSelected(self, self.OnTabChange)
  local TabId = 1
  self.Tab_Archive:SelectTab(TabId)
  self.Tab_Archive:SetVisibility(UIConst.VisibilityOp.Collapsed)
end

function M:ReallyInitUIInfo(Name, IsInUIMode, EventList, Params)
  self:CreateContents()
  if 0 == #self.ContentArray then
    self.PetEntryAchive.WidgetSwitcher_State:SetActiveWidgetIndex(1)
  else
    self.PetEntryAchive.WidgetSwitcher_State:SetActiveWidgetIndex(0)
  end
  self:OnSortTypeChanged(self.SortType)
  self:SelectItem(self.SelectedContent or self.PetEntryAchive.List_Item:GetItemAt(0))
  self:AddReddotListener()
  AudioManager(self):PlayUISound(self, "event:/ui/armory/open", "PetIndex", nil)
  self.PetEntryAchive.Key_Lock:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "X"}
    }
  })
  if self.CurInputDevice == ECommonInputType.Gamepad then
    self:UpdateBottomKeyInfo(true)
  elseif CommonUtils.GetDeviceTypeByPlatformName(self) == "Mobile" then
    self.WBP_Com_KeyTextDesc:SetVisibility(UIConst.VisibilityOp.Collapsed)
  else
    self:UpdateBottomKeyInfo(false)
  end
  self.PetEntryAchive:PlayAnimation(self.PetEntryAchive.Auto_In)
end

function M:UpdateBottomKeyInfo(IsGamepad)
  if IsGamepad then
    self.WBP_Com_KeyTextDesc:CreateCommonKey({
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "B"}
      },
      Desc = GText("UI_BACK")
    })
  else
    self.WBP_Com_KeyTextDesc:CreateCommonKey({
      KeyInfoList = {
        {
          Type = "Text",
          Text = "Esc",
          ClickCallback = self.OnBackKeyDown,
          Owner = self
        }
      },
      Desc = GText("UI_BACK")
    })
  end
end

function M:CreateContents()
  self.ContentArray = {}
  self.ContentMap = {}
  local Avatar = GWorld:GetAvatar()
  local PetEntryLockSetting = Avatar.PetEntryLockSetting
  for key, value in pairs(DataMgr.PetEntry) do
    local Content = NewObject(UIUtils.GetCommonItemContentClass())
    Content.Id = value.PetEntryID
    Content.Rarity = value.Rarity
    Content.ItemName = GText(value.PetEntryName)
    Content.BattlePetID = value.BattlePetID
    Content.IconPath = value.Icon
    Content.Icon = value.Icon
    Content.ItemType = "PetEntry"
    Content.Desc = SkillUtils.CalcPetEntryDesc(value.PetEntryID)
    Content.OnAddedToFocusPathEvent = {
      Obj = self,
      Callback = self.OnAddedToFocusPathEvent,
      Params = Content
    }
    if PetEntryLockSetting[key] then
      Content.IsLocked = true
      Content.LockType = 1
    else
      Content.IsLocked = false
      Content.LockType = 0
    end
    table.insert(self.ContentArray, Content)
    self.ContentMap[Content.Id] = Content
  end
  local EntryCount = {}
  for _, Pet in pairs(Avatar.Pets) do
    for _, EntryId in pairs(Pet.Entry) do
      EntryCount[EntryId] = EntryCount[EntryId] or 0
      EntryCount[EntryId] = EntryCount[EntryId] + 1
    end
  end
  local CacheDetail = ReddotManager.GetLeafNodeCacheDetail(self.ReddotNodeName) or {}
  for key, value in pairs(Avatar.PetUnlockedEntrys) do
    local Content = self.ContentMap[key]
    if Content then
      Content.IsOwned = true
      Content.EntryCount = EntryCount[key]
      if Content.IsOwned and not CacheDetail[Content.Id] then
        Content.RedDotType = UIConst.RedDotType.NewRedDot
      end
    end
  end
  for _, Content in pairs(self.ContentMap) do
    if not Content.IsOwned then
      Content.bShadow = true
    end
  end
end

function M:OnAddedToFocusPathEvent(Content)
  if self.CurInputDevice == ECommonInputType.Gamepad then
    self:OnItemClicked(Content)
  end
end

function M:OnItemClicked(Content)
  if Content and not Content.Id then
    return
  end
  if self.SelectedContent == Content then
    return
  end
  AudioManager(self):PlayUISound(self, "event:/ui/common/combat_bag_cell_place_common", nil, nil)
  self:SelectItem(Content)
  self:UpdateLockState(Content)
end

function M:SelectItem(Content)
  ArmoryUtils:SetItemIsSelected(self.SelectedContent, false)
  self.SelectedContent = Content
  ArmoryUtils:SetItemIsSelected(self.SelectedContent, true)
  self.PetEntryAchive.WidgetSwitcher_State:SetActiveWidgetIndex(0)
  self.PetEntryAchive.Text_EntryName:SetText(Content.ItemName)
  self.PetEntryAchive.Text_Desc:SetText(Content.Desc)
  self.PetEntryAchive.Num_Hold:SetText(Content.EntryCount or 0)
  if Content.IsOwned then
    self:TryReadReddot(Content)
  end
  self:UpdateLockState(Content)
  self.PetEntryAchive.List_Item:BP_NavigateToItem(Content)
end

function M:UpdateLockState(Content)
  if Content.IsLocked then
    if not self.PetEntryAchive.Switch_Lock:GetChecked() then
      self.PetEntryAchive.Switch_Lock:SetChecked(true, true)
    end
  elseif self.PetEntryAchive.Switch_Lock:GetChecked() then
    self.PetEntryAchive.Switch_Lock:SetChecked(false, true)
  end
end

function M:OnSortSelectionChanged(Idx)
  self.SortSelection = Idx
  if 2 == Idx then
    ArmoryUtils:SortItemContents(self.ContentArray, {"Id", "Rarity"}, self.SortType)
  else
    ArmoryUtils:SortItemContents(self.ContentArray, {"Rarity", "Id"}, self.SortType)
  end
  self:FillListview()
end

function M:OnSortTypeChanged(SortType)
  self.SortType = SortType
  self:OnSortSelectionChanged(self.SortSelection)
end

function M:FillListview()
  self.PetEntryAchive.List_Item:ClearListItems()
  for _, value in ipairs(self.ContentArray) do
    self.PetEntryAchive.List_Item:AddItem(value)
  end
  self.PetEntryAchive.List_Item:ScrollToTop()
  self.PetEntryAchive.List_Item:RequestFillEmptyContent()
  self:HorizontalListViewResize_SetUp(self.Panel_ItemList, self.PetEntryAchive.List_Item, 0)
  if self.SelectedPetEntryID then
    for _, Content in pairs(self.ContentArray) do
      if Content.Id == self.SelectedPetEntryID then
        self.SelectedContent = Content
        break
      end
    end
  end
end

function M:TryReadReddot(Content)
  if not Content then
    return
  end
  if Content.RedDotType then
    Content.RedDotType = nil
    local CacheDetail = ReddotManager.GetLeafNodeCacheDetail(self.ReddotNodeName) or {}
    CacheDetail[Content.Id] = true
    if Content.SelfWidget then
      Content.SelfWidget:SetRedDot(Content.RedDotType)
    end
  end
end

function M:AddReddotListener()
  self:RemoveReddotListener()
end

function M:RemoveReddotListener()
  if self.ReddotNodeName then
  end
end

function M:Destruct()
  self.Super.Destruct(self)
  self:RemoveReddotListener()
  self:HorizontalListViewResize_TearDown()
end

function M:ReallyOnKeyDown(MyGeometry, InKeyEvent)
  local ParentHandled = self.Super.OnKeyDown(self, MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if "Escape" == InKeyName then
    self:OnBackKeyDown()
  end
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) then
    if InKeyName == Const.GamepadFaceButtonRight then
      self:OnBackKeyDown()
    elseif InKeyName == UIConst.GamePadKey.LeftThumb then
      self.PetEntryAchive.Pet_Sort:SetFocus()
    end
    if InKeyName == UIConst.GamePadKey.FaceButtonLeft then
      self.PetEntryAchive.Switch_Lock:OnBtnClicked()
    end
  end
  return UE4.UWidgetBlueprintLibrary.Handled()
end

function M:ReallyDestruct()
  self.Super.Destruct(self)
  self:RemoveReddotListener()
  self:HorizontalListViewResize_TearDown()
end

function M:ReallyOnFocusReceived(MyGeometry, InFocusEvent)
  return UWidgetBlueprintLibrary.SetUserFocus(UWidgetBlueprintLibrary.Handled(), self:BP_GetDesiredFocusTarget())
end

function M:ReallyRefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  if CommonUtils.GetDeviceTypeByPlatformName(self) == "Mobile" then
    return
  end
  self.CurGamepadName = CurGamepadName
  local IsGamepad = CurInputDevice == ECommonInputType.Gamepad
  local ActiveWidgetIndex = IsGamepad and 0 or 1
  if IsGamepad then
    if not self.PetEntryAchive.List_Item:HasAnyUserFocus() and not self.PetEntryAchive.List_Item:HasFocusedDescendants() and self:HasAnyUserFocus() then
      if self.SelectedContent then
        self.PetEntryAchive.List_Item:BP_NavigateToItem(self.SelectedContent)
      else
        self.PetEntryAchive.List_Item:BP_NavigateToItem(self.PetEntryAchive.List_Item:GetItemAt(0))
      end
    end
    self.PetEntryAchive.Key_Lock:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    self:UpdateBottomKeyInfo(true)
  else
    self.PetEntryAchive.Key_Lock:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self:UpdateBottomKeyInfo(false)
  end
  self.CurInputDevice = CurInputDevice
end

function M:BP_GetDesiredFocusTarget()
  return self.SelectedContent.SelfWidget or self.PetEntryAchive.List_Item
end

AssembleComponents(M)
return M
