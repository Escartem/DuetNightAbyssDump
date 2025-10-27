require("UnLua")
local ArmoryUtils = require("BluePrints.UI.WBP.Armory.ArmoryUtils")
local SkillUtils = require("Utils.SkillUtils")
local M = Class()
local PetEntryPath = "/Game/UI/WBP/Armory/Widget/Pet/WBP_Armory_Pet_Entry.WBP_Armory_Pet_Entry"
local PetArchivePath = "WidgetBlueprint'/Game/UI/WBP/Armory/Widget/Pet/WBP_Armory_PetAchive.WBP_Armory_PetAchive'"
M._components = {
  "BluePrints.UI.UI_PC.Common.LSFocusComp",
  "BluePrints.UI.UI_PC.Common.HorizontalListViewResizeComp"
}

function M:Construct()
  self.IsClose = false
end

function M:Init()
  self.Btn_Close:Init("Close", self, self.OnBackKeyDown)
  self.SortType = CommonConst.DESC
  self.SortSelection = 1
  self.WBP_Armory_PetAchive = UIManager(self):CreateWidget(PetArchivePath)
  self.Group_Page:ClearChildren()
  self.Group_Page:AddChildToOverlay(self.WBP_Armory_PetAchive)
  local ContentOverlaySlot = UE4.UWidgetLayoutLibrary.SlotAsOverlaySlot(self.WBP_Armory_PetAchive)
  ContentOverlaySlot:SetHorizontalAlignment(EHorizontalAlignment.HAlign_Fill)
  ContentOverlaySlot:SetVerticalAlignment(EVerticalAlignment.VAlign_Fill)
  self.WBP_Armory_PetAchive.List_Item.BP_OnItemClicked:Add(self, self.OnItemClicked)
  self.Text_Title:SetText(GText("Pet_Affix_Fuse"))
  self.WBP_Armory_PetAchive.Text_Select:SetText(GText("Pet_Affix_Fuse_SelectPet"))
  self.WBP_Armory_PetAchive.Btn_Confirm:TryOverrideSoundFunc(function()
    AudioManager(self):PlayUISound(nil, "event:/ui/common/click_btn_confirm", nil, nil)
  end)
  self.WBP_Armory_PetAchive.Btn_Confirm:SetText(GText("UI_CONFIRM_SELECTION"))
  self.WBP_Armory_PetAchive.Btn_Confirm:BindEventOnClicked(self, self.OnConfirmClicked)
  self.WBP_Armory_PetAchive.Btn_Confirm:ForbidBtn(true)
  self.WBP_Armory_PetAchive.Btn_Confirm:BindForbidStateExecuteEvent(self, self.OnForbidBtnClick)
  self.WBP_Armory_PetAchive.Text_Empty:SetText(GText("AvailablePet_Empty"))
  self.WBP_Armory_PetAchive.Com_EmptyBg_1.Text_Empty:SetText(GText("AvailablePet_Empty"))
  self.WBP_Armory_PetAchive.Pet_Sort:Init(self, {
    GText("Pet_Affix_Type"),
    GText("UI_RARITY_NAME")
  }, CommonConst.DESC)
  self.WBP_Armory_PetAchive.Pet_Sort:BindEventOnSelectionsChanged(self, self.OnSortSelectionChanged)
  self.WBP_Armory_PetAchive.Pet_Sort:BindEventOnSortTypeChanged(self, self.OnSortTypeChanged)
  self.WBP_Armory_PetAchive.Switcher_Lock:SetActiveWidgetIndex(1)
  self.WBP_Armory_PetAchive.List_Item.OnCreateEmptyContent:Bind(self, function(self)
    return NewObject(UIUtils.GetCommonItemContentClass())
  end)
  self.SelectedPetEntryContent = nil
  self.PetSiftId = 1006
  self.WBP_Armory_PetAchive.Pet_Sift:SetSiftModelId(self.PetSiftId)
  self.WBP_Armory_PetAchive.Pet_Sift:BindEventOnSelectionsChanged(self, self.OnSiftSelectionsChanged)
  self.WBP_Armory_PetAchive.Pet_Sift:BindEventOnAddedToFocusPath(self, self.OnSiftAddedToFocusPath)
  self.WBP_Armory_PetAchive.Pet_Sift:BindEventOnRemovedFromFocusPath(self, self.OnSiftRemovedFromFocusPath)
  self.WBP_Armory_PetAchive.Btn_Locked.Button_Area.OnClicked:Add(self, self.LockOrUnlockPet)
  self:InitKeyInfo()
  self:RefreshBaseInfo()
  self:InitTab()
  AudioManager(self):PlayUISound(self, "event:/ui/armory/open", "PetMixIndex", nil)
  self:AddDispatcher(EventID.OnPetLocked, self, self.OnPetLocked)
  self:PlayAnimation(self.In)
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(self)
end

function M:InitKeyInfo()
  if CommonUtils.GetDeviceTypeByPlatformName(self) ~= "Mobile" then
    local BottomKeyInfo = {
      {
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "RV",
            Owner = self
          }
        },
        Desc = GText("UI_CTL_Pet_SwitchSlot"),
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
    }
    self:UpdateBottomKeyInfo(BottomKeyInfo)
    self:UpdateBottomKeyView(false)
    self.WBP_Armory_PetAchive.Key_Lock:CreateCommonKey({
      KeyInfoList = {
        {
          Type = "Img",
          ImgShortPath = "Menu",
          Owner = self
        }
      },
      bLongPress = false
    })
  else
  end
end

function M:InitTab()
  local Tabs = {}
  Tabs[1] = {
    Text = GText("UI_TAB_NAME_ALL"),
    Idx = 1
  }
  Tabs[2] = {
    Text = GText("Pet_BattlePet"),
    Idx = 2
  }
  Tabs[3] = {
    Text = GText("Pet_ResourcePet"),
    Idx = 3
  }
  local ConfigData = {
    Owner = self,
    LeftKey = "Q",
    RightKey = "E",
    LeftGamePadKey = "LeftShoulder",
    RightGamePadKey = "RightShoulder",
    ChildWidgetName = "ModArchiveTabSubItem",
    Tabs = Tabs,
    SoundFuncReceiver = self,
    SoundFunc = self.MainTabClickSoundFunc
  }
  self.Tab_Archive:Init(ConfigData)
  self.Tab_Archive:BindEventOnTabSelected(self, self.OnTabChange)
  local TabId = 1
  self.Tab_Archive:SelectTab(TabId)
end

function M:UpdateBottomKeyInfo(BottomKeyInfo)
  self.HB_Key:ClearChildren()
  self.BottomKeyInfo = BottomKeyInfo
  self.BottomKeyWidget = {}
  local BottomKeyWidgetIdx = 1
  for i, KeyInfo in ipairs(BottomKeyInfo) do
    local BottomKeyWidget = self.BottomKeyWidget[i]
    if not IsValid(BottomKeyWidget) then
      BottomKeyWidget = UIManager(self):_CreateWidgetNew("ComKeyTextDesc")
      self.BottomKeyWidget[i] = BottomKeyWidget
    end
    self.HB_Key:AddChild(BottomKeyWidget)
    BottomKeyWidgetIdx = BottomKeyWidgetIdx + 1
  end
  for i = BottomKeyWidgetIdx, #self.BottomKeyWidget do
    local BottomKeyWidget = self.BottomKeyWidget[i]
    if IsValid(BottomKeyWidget) then
      BottomKeyWidget:RemoveFromParent()
    end
    self.BottomKeyWidget[BottomKeyWidgetIdx] = nil
  end
  self.HB_Key:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
end

function M:UpdateBottomKeyView(IsGamePad)
  if not self.BottomKeyWidget then
    return
  end
  local BottomKeyInfo = self.BottomKeyInfo
  if IsGamePad then
    for index, value in ipairs(BottomKeyInfo) do
      if value.GamePadInfoList then
        local NewValue = {
          KeyInfoList = value.GamePadInfoList,
          Desc = value.Desc,
          bLongPress = value.bLongPress
        }
        self.BottomKeyWidget[index]:CreateCommonKey(NewValue)
        self.BottomKeyWidget[index]:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
      elseif value.KeyInfoList then
        self.BottomKeyWidget[index]:SetVisibility(UIConst.VisibilityOp.Collapsed)
      end
    end
  else
    for index, value in ipairs(BottomKeyInfo) do
      if value.KeyInfoList then
        self.BottomKeyWidget[index]:CreateCommonKey(value)
        self.BottomKeyWidget[index]:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
      else
        self.BottomKeyWidget[index]:SetVisibility(UIConst.VisibilityOp.Collapsed)
      end
    end
  end
end

function M:OnKeyDownLeft()
  local Tab = self.Tab_Archive
  if Tab.CurrentTab >= 1 then
    Tab:TabToLeft()
    self:OnTabChange()
  end
end

function M:OnKeyDownRight()
  local Tab = self.Tab_Archive
  if Tab.CurrentTab and Tab.CurrentTab + 1 <= #Tab.Tabs then
    Tab:TabToRight()
    self:OnTabChange()
  end
end

function M:OnTabChange()
  self.ContentArray = self:FilterPetContentArray(self:GetCurrntKindPet())
  if self.ContentArray == nil then
    return
  end
  self:UnSelectPet()
  ArmoryUtils:SortEntryPets(self.ContentArray, self.SortSelection, 2 == self.SortType)
  self:FillListview()
end

function M:GetCurrntKindPet()
  local Tab = self.Tab_Archive
  if 2 == Tab.CurrentTab then
    return self.BattlePetsContent
  elseif 3 == Tab.CurrentTab then
    return self.ResourcePetsContent
  else
    return self.AllPetsContent
  end
end

function M:OnSiftSelectionsChanged(SelectedItems, ItemDatas)
  if self.IsClose then
    return
  end
  self.SelectedSiftItems = SelectedItems
  self.SiftItemDatas = ItemDatas
  self.ContentArray = self:FilterPetContentArray(self:GetCurrntKindPet())
  self:FillListview()
end

function M:FilterPetContentArray(ContentArray)
  if not self.SelectedSiftItems or next(self.SelectedSiftItems) == nil then
    return ContentArray
  end
  local FilteredPets = {}
  for _, PetItem in ipairs(ContentArray) do
    if self:IsPetMatchedWithSift(PetItem) then
      table.insert(FilteredPets, PetItem)
    end
  end
  self.FilteredPets = FilteredPets
  return FilteredPets
end

function M:OnBackKeyDown()
  self.IsClose = true
  self:Close()
end

function M:Close()
  self:CleanTimer()
  self:PlayAnimation(self.Out)
  self:BindToAnimationFinished(self.Out, {
    self,
    self.ReallyClose
  })
end

function M:ReallyClose()
  self.WBP_Armory_PetAchive.Pet_Sift:Close()
  self.M.Super.Close(self)
end

function M:ReallyInitUIInfo(Name, IsInUIMode, EventList, Params)
  self:Init()
  self.Target = Params.Target
  self.EntryContent = Params.EntryContent
  self.OnDestructObj = Params.OnDestructObj
  self.OnDestructCallback2 = Params.OnDestructCallback2
  self:CreateContents()
  self:OnSortTypeChanged(self.SortType)
  self:AddReddotListener()
  self.WBP_Armory_PetAchive.VB_Pet:SetVisibility(UIConst.VisibilityOp.Collapsed)
end

function M:CreateContents()
  local Avatar = GWorld:GetAvatar()
  self.ContentArray = {}
  self.ContentMap = {}
  self.BattlePetsContent = {}
  self.ResourcePetsContent = {}
  local PetData = DataMgr.Pet
  for UniqueId, Pet in pairs(Avatar.Pets) do
    if Avatar.CurrentPet == UniqueId then
    elseif self.Target.UniqueId == UniqueId then
    elseif self:IsAllEntriesZero(Pet.Entry) == true then
    else
      local Obj = ArmoryUtils:NewPetItemContentWithEntry(Pet)
      Obj.Parent = self
      Obj.ItemType = CommonConst.ArmoryType.Pet
      Obj.PetType = PetData[Pet.PetId].PetType
      Obj.BattlePet = PetData[Pet.PetId].BattlePetId
      Obj.OnAddedToFocusPathEvent = {
        Obj = self,
        Callback = self.OnAddedToFocusPathEvent,
        Params = Obj
      }
      Obj.IsSelected = false
      if not Obj.Icon then
        Obj.Icon = "/Game/UI/Texture/Dynamic/Image/Head/Pet/T_Head_Pet_Zisha01.T_Head_Pet_Zisha01"
      end
      table.insert(self.ContentArray, Obj)
      self.WBP_Armory_PetAchive.CacheContent:Add(Obj)
      if Obj.IsResourcePet then
        table.insert(self.ResourcePetsContent, Obj)
      else
        table.insert(self.BattlePetsContent, Obj)
      end
      self.ContentMap[Obj.Uuid] = Obj
    end
  end
  self.AllPetsContent = self.ContentArray
end

function M:IsAllEntriesZero(entryTable)
  for _, v in pairs(entryTable) do
    if 0 ~= v then
      return false
    end
  end
  return true
end

function M:OnAddedToFocusPathEvent(Content)
  if self.CurInputDevice == ECommonInputType.Gamepad and self.SelectedContent ~= Content then
    self:OnItemClicked(Content, true)
  end
end

function M:UnSelectPetEntryContent()
  if self.SelectedPetEntryContent then
    self.SelectedPetEntryContent.UI:SetIsSelected(false)
    self.SelectedPetEntryContent = nil
  end
end

function M:UnSelectPet()
  if self.Pet and self.Pet.SelfWidget and self.Pet.IsSelected then
    self.Pet.SelfWidget:SetSelected(false)
    self.Pet.IsSelected = false
  end
end

function M:OnItemClicked(Content, bAutoSelect)
  if not Content or not Content.UniqueId then
    return
  end
  ArmoryUtils:SetItemReddotRead(Content, true)
  if self.CurInputDevice == ECommonInputType.Gamepad and not bAutoSelect then
    if self.WBP_Armory_PetAchive.Btn_Confirm.IsForbidden then
      return
    end
    self:OnConfirmClicked()
    return
  end
  if 1 == Content.LockType then
    UIManager(self):ShowUITip(UIConst.Tip_CommonToast, GText("UI_Pet_Locked"))
    self.WBP_Armory_PetAchive.Btn_Confirm:ForbidBtn(true)
  else
    self.WBP_Armory_PetAchive.Btn_Confirm:ForbidBtn(false)
  end
  self:UnSelectPetEntryContent()
  self:UnSelectPet()
  self:ChangeItemSelected(Content, bAutoSelect)
  self.Pet = Content
  self.WBP_Armory_PetAchive.VB_Pet:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  ArmoryUtils:SetItemIsSelected(self.SelectedContent, false)
  self.SelectedContent = Content
  ArmoryUtils:SetItemIsSelected(self.SelectedContent, true)
  self.WBP_Armory_PetAchive.Text_PetName:SetText(Content.UnitName)
  local Level = Content.Level and Content.Level or 1
  self.WBP_Armory_PetAchive.Num_Level:SetText(Level)
  local MaxLevel = DataMgr.Pet[Content.UnitId].PetMaxLevel
  self.WBP_Armory_PetAchive.Num_Level_Max:SetText(MaxLevel)
  if Content.IsPremium then
    self.WBP_Armory_PetAchive.Text_PetAlive:SetText(GText("Pet_BattlePet"))
  else
    self.WBP_Armory_PetAchive.Text_PetAlive:SetText(GText("Pet_ResourcePet"))
  end
  if self.SelectedContent and 1 == self.SelectedContent.LockType then
    self.WBP_Armory_PetAchive.Switcher_Lock:SetActiveWidgetIndex(0)
  else
    self.WBP_Armory_PetAchive.Switcher_Lock:SetActiveWidgetIndex(1)
  end
  self:SetBreakUpLevel(Content)
  self:UpdatePetEntry(Content.PetEntry)
  self:AddTimer(0.1, function()
    self:AutoSelectFirstEntry()
  end)
end

function M:ChangeItemSelected(Content, bFastSelect)
  if not Content or not Content.SelfWidget then
    return
  end
  if Content.SelfWidget and Content.IsSelected then
    if bFastSelect then
      self:FastSetSelected(Content.SelfWidget, false)
    else
      Content.SelfWidget:SetSelected(false)
    end
    Content.IsSelected = false
  else
    if bFastSelect then
      self:FastSetSelected(Content.SelfWidget, true)
    else
      Content.SelfWidget:SetSelected(true)
    end
    Content.IsSelected = true
  end
end

function M:FastSetSelected(selfWidget)
  if selfWidget.NotInteractive then
    return
  end
  if selfWidget.Content then
    selfWidget.Content.IsSelect = true
  end
  selfWidget.Item:StopAllAnimations()
  selfWidget.Item:PlayAnimation(selfWidget.Item.Click)
  selfWidget.Item:SetAnimationCurrentTime(selfWidget.Item.Click, selfWidget.Item.Click:GetEndTime())
end

function M:SetBreakUpLevel(Content)
  if Content.IsResourcePet then
    self.WBP_Armory_PetAchive.Star:SetVisibility(UIConst.VisibilityOp.Collapsed)
  else
    self.WBP_Armory_PetAchive.Star:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  end
  local Level = Content.BreakNum
  for i = 1, 3 do
    if i <= Level then
      self.WBP_Armory_PetAchive["Switch_Star0" .. i]:SetActiveWidgetIndex(0)
    else
      self.WBP_Armory_PetAchive["Switch_Star0" .. i]:SetActiveWidgetIndex(1)
    end
  end
end

function M:AutoSelectFirstEntry()
  if self.FirstEntryContent then
    self.bAutoSelect = true
    self.FirstEntryContent.UI:OnBtnClicked()
    self.SelectedPetEntryContent = self.FirstEntryContent
  end
end

function M:UpdatePetEntry(PetEntry)
  self.WBP_Armory_PetAchive.VB_Entry:ClearChildren()
  local PetEntryIsEmpty = true
  self.PetEntryItems = {}
  self.FirstEntryContent = nil
  if PetEntry then
    for Idx, EntryId in pairs(PetEntry) do
      PetEntryIsEmpty = false
      local Data = DataMgr.PetEntry[EntryId]
      if not Data then
        ScreenPrint("\232\161\168\229\134\133\230\178\161\230\156\137\232\175\141\230\157\161ID\229\175\185\229\186\148\231\154\132\230\149\176\230\141\174\239\188\140\230\152\175\228\184\141\230\152\175\229\136\183\229\135\186\230\157\165\231\154\132\229\174\160\231\137\169\232\175\141\230\157\161\229\161\171\233\148\153\228\186\134\239\188\159")
        return
      end
      local PetEntryItem = UIManager(self):CreateWidget(PetEntryPath, false)
      local Content = {
        Owner = self,
        Index = Idx,
        EntryId = EntryId,
        Icon = GText(Data.Icon),
        Name = GText(Data.PetEntryName),
        Rarity = Data.Rarity,
        Desc = SkillUtils.CalcPetEntryDesc(EntryId),
        OnClicked = self.OnEntryClicked,
        IsSelected = false,
        IsEmpty = PetEntryIsEmpty
      }
      self.WBP_Armory_PetAchive.VB_Entry:AddChild(PetEntryItem)
      PetEntryItem:Init(Content)
      table.insert(self.PetEntryItems, PetEntryItem)
      if not self.FirstEntryContent then
        self.FirstEntryContent = Content
        self.CurEntryContent = Content
        self.FirstEntryContent.UI = PetEntryItem
      end
    end
  end
  if PetEntryIsEmpty then
    local Content = {Owner = self, IsEmpty = true}
    local EmptyPetEntryItem = UIManager(self):CreateWidget(PetEntryPath, false)
    self.WBP_Armory_PetAchive.VB_Entry:AddChild(EmptyPetEntryItem)
    EmptyPetEntryItem:Init(Content)
  end
end

function M:OnEntryClicked(Content)
  if not Content or not Content.EntryId then
    return
  end
  if not IsValid(self.WBP_Armory_PetAchive) or not IsValid(self.WBP_Armory_PetAchive.Btn_Confirm) then
    return
  end
  if self:IsHaveSameEntry(Content) then
    if 0 == self.Pet.LockType then
      UIManager(self):ShowUITip(UIConst.Tip_CommonToast, GText("Pet_SameAffix_UnableAdd"))
    end
    self.WBP_Armory_PetAchive.Btn_Confirm:ForbidBtn(true)
  elseif 0 == self.Pet.LockType then
    self.WBP_Armory_PetAchive.Btn_Confirm:ForbidBtn(false)
  end
  if self.SelectedPetEntryContent and self.SelectedPetEntryContent ~= Content and IsValid(self.SelectedPetEntryContent.UI) then
    self.SelectedPetEntryContent.UI:SetIsSelected(false)
  end
  if Content.IsSelected then
    Content.UI:SetIsSelected(false)
  else
    Content.UI:SetIsSelected(true)
    self.SelectedPetEntryContent = Content
  end
  self.CurEntryContent = Content
  if self.bAutoSelect then
    self.bAutoSelect = false
  else
    AudioManager(self):PlayUISound(self, "event:/ui/common/click_mid", nil, nil)
  end
end

function M:IsHaveSameEntry(Entry)
  local Entrise = self.Target.Props.Entry
  if not Entrise or not self.EntryContent then
    return
  end
  local SelectedPetEntryName = DataMgr.PetEntry[Entry.EntryId].PetEntryName
  for Index, EntryId in pairs(Entrise) do
    if 0 ~= EntryId then
      local HavedPetEntryName = DataMgr.PetEntry[EntryId].PetEntryName
      if SelectedPetEntryName == HavedPetEntryName and Index ~= self.EntryContent.Index then
        return true
      end
    end
  end
  return false
end

function M:CheckIsPremium()
  local Content = self.Pet
  if Content.IsPremium or Content.Rarity >= 5 or self.Pet.BreakNum > 0 then
    local function CancelFunc()
      Content.SelfWidget:SetFocus()
    end
    
    local function ConfirmFunc()
      self:ReallyMix()
    end
    
    UIManager():ShowCommonPopupUI(100174, {
      LeftCallbackFunction = CancelFunc,
      RightCallbackFunction = ConfirmFunc,
      CloseBtnCallbackFunction = CancelFunc
    }, self)
    return true
  else
    return false
  end
end

function M:OnConfirmClicked()
  if self:CheckIsPremium() then
    return
  else
    self:ReallyMix()
  end
end

function M:ReallyMix()
  if self.OnDestructCallback2 then
    self.OnDestructCallback2(self.OnDestructObj, self.SelectedPetEntryContent, self.Pet)
  end
  self:Close()
end

function M:OnForbidBtnClick()
  if self.Pet and 1 == self.Pet.LockType then
    UIManager(self):ShowUITip(UIConst.Tip_CommonToast, GText("UI_Pet_Locked"))
  else
    UIManager(self):ShowUITip(UIConst.Tip_CommonToast, GText("Pet_SameAffix_UnableAdd"))
  end
end

function M:OnSortSelectionChanged(Idx)
  self.SortSelection = Idx
  ArmoryUtils:SortEntryPets(self.ContentArray, Idx, 2 == self.SortType)
  self:FillListview()
end

function M:OnSortTypeChanged(SortType)
  self.SortType = SortType
  self:OnSortSelectionChanged(self.SortSelection)
end

function M:FillListview()
  self.WBP_Armory_PetAchive.List_Item:ClearListItems()
  for _, value in ipairs(self.ContentArray) do
    self.WBP_Armory_PetAchive.List_Item:AddItem(value)
  end
  self.WBP_Armory_PetAchive.List_Item:ScrollToTop()
  self.WBP_Armory_PetAchive.List_Item:RequestFillEmptyContent()
  if 0 == #self.ContentArray then
    self.WBP_Armory_PetAchive.WidgetSwitcher_Item:SetActiveWidgetIndex(1)
    self.WBP_Armory_PetAchive.VB_Pet:SetVisibility(UIConst.VisibilityOp.Hidden)
  else
    self.WBP_Armory_PetAchive.WidgetSwitcher_Item:SetActiveWidgetIndex(0)
    self.WBP_Armory_PetAchive.VB_Pet:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  end
  self:AddTimer(0.1, function()
    if self.ContentArray and CommonUtils.Size(self.ContentArray) > 0 then
      local Content = self.WBP_Armory_PetAchive.List_Item:GetItemAt(0)
      self:OnItemClicked(Content, true)
      if Content and Content.SelfWidget then
        self.WBP_Armory_PetAchive.List_Item:SetSelectedIndex(0)
        Content.SelfWidget:SetFocus()
      end
    else
      self:SetFocus()
    end
  end, nil, nil, nil, true)
end

function M:OnPetLocked(ErrCode, UniqueId, IsLocked)
  local CurrentContent = self.SelectedContent
  if not ErrorCode:Check(ErrCode) then
    return
  end
  if UniqueId ~= CurrentContent.UniqueId then
    ScreenPrint("\230\156\141\229\138\161\229\153\168\228\188\160\230\157\165\231\154\132\229\174\160\231\137\169ID\229\146\140\229\189\147\229\137\141\233\128\137\228\184\173\231\154\132\229\174\160\231\137\169ID\228\184\141\228\184\128\232\135\180")
    return
  end
  CurrentContent.IsLocked = IsLocked
  CurrentContent.LockType = IsLocked and 1 or 0
  if CurrentContent.SelfWidget then
    CurrentContent.SelfWidget:SetLock(CurrentContent.IsLocked and 1 or 0)
  end
  if self.WBP_Armory_PetAchive.Switcher_Lock then
    if 1 == CurrentContent.LockType then
      self.WBP_Armory_PetAchive.Switcher_Lock:SetActiveWidgetIndex(0)
    else
      self.WBP_Armory_PetAchive.Switcher_Lock:SetActiveWidgetIndex(1)
    end
  end
  self.WBP_Armory_PetAchive.Btn_Confirm:ForbidBtn(IsLocked)
end

function M:LockOrUnlockPet()
  if not self.SelectedContent then
    return
  end
  local Avatar = GWorld:GetAvatar()
  if 1 == self.SelectedContent.LockType then
    Avatar:UnLockPet(self.SelectedContent.UniqueId)
  else
    Avatar:LockPet(self.SelectedContent.UniqueId)
  end
end

function M:TryReadReddot(Content)
  if not Content then
    return
  end
  if Content.IsNew then
    Content.IsNew = false
    local CacheDetail = ReddotManager.GetLeafNodeCacheDetail(self.ReddotNodeName) or {}
    CacheDetail[Content.Id] = true
    if Content.UI then
      Content.UI:SetReddot(false)
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

function M:ReallyOnKeyDown(MyGeometry, InKeyEvent)
  local ParentHandled = self.M.Super.OnKeyDown(self, MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local IsHandled = self:OnKeyDownForLSComp(MyGeometry, InKeyEvent)
  DebugPrint("PetMixIndex:InKeyName" .. (IsHandled and "Handled" or "NoHandled"))
  if "Escape" == InKeyName then
    self:OnBackKeyDown()
  elseif "Q" == InKeyName then
    self.Tab_Archive:TabToLeft()
  elseif "E" == InKeyName then
    self.Tab_Archive:TabToRight()
  end
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) then
    if InKeyName == Const.GamepadFaceButtonRight then
      if not self.WBP_Armory_PetAchive.Function:HasFocusedDescendants() then
        self:OnBackKeyDown()
      else
        return UWidgetBlueprintLibrary.SetUserFocus(UWidgetBlueprintLibrary.Handled(), self.WBP_Armory_PetAchive.List_Item)
      end
    elseif InKeyName == Const.RightStickUp then
      if self.CurEntryContent and self.CurEntryContent.Index > 1 then
        self.PetEntryItems[self.CurEntryContent.Index - 1]:OnBtnClicked()
      end
    elseif InKeyName == Const.RightStickDown then
      if self.CurEntryContent and self.CurEntryContent.Index < CommonUtils.Size(self.PetEntryItems) then
        self.PetEntryItems[self.CurEntryContent.Index + 1]:OnBtnClicked()
      end
    elseif InKeyName == Const.GamepadRightShoulder then
      self.Tab_Archive:TabToRight()
    elseif InKeyName == Const.GamepadLeftShoulder then
      self.Tab_Archive:TabToLeft()
    elseif InKeyName == Const.GamepadSpecialRight then
      self:LockOrUnlockPet()
    end
  end
  return UE4.UWidgetBlueprintLibrary.Handled()
end

function M:ReallyDestruct()
  AudioManager(self):SetEventSoundParam(self, "PetMixIndex", {ToEnd = 1})
  self:RemoveReddotListener()
  self:HorizontalListViewResize_TearDown()
  self.M.Super.Destruct(self)
end

function M:ReallyOnFocusReceived(MyGeometry, InFocusEvent)
  if not self.WBP_Armory_PetAchive.List_Item:HasAnyUserFocus() then
    self.WBP_Armory_PetAchive.List_Item:SetFocus()
  end
  return self.M.Super.OnFocusReceived(self, MyGeometry, InFocusEvent)
end

function M:RefreshBaseInfo()
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
  if IsValid(self.GameInputModeSubsystem) then
    self:RefreshOpInfoByInputDevice(self.GameInputModeSubsystem:GetCurrentInputType(), self.GameInputModeSubsystem:GetCurrentGamepadName())
  end
  self:AddLSFocusTarget(nil, {
    self.WBP_Armory_PetAchive.Pet_Sort,
    self.WBP_Armory_PetAchive.Pet_Sift
  })
  self.WBP_Armory_PetAchive.Pet_Sift.Img_Key_L:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.WBP_Armory_PetAchive.Pet_Sift.ListWidgetOpening = false
end

function M:ReallyRefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  if CommonUtils.GetDeviceTypeByPlatformName(self) == "Mobile" then
    self.WBP_Armory_PetAchive.Key_Lock:SetVisibility(UIConst.VisibilityOp.Collapsed)
    return
  end
  self.CurGamepadName = CurGamepadName
  local IsUseKeyAndMouse = CurInputDevice == ECommonInputType.MouseAndKeyboard
  local ActiveWidgetIndex = IsUseKeyAndMouse and 0 or 1
  if IsUseKeyAndMouse then
    self:UpdateBottomKeyView(false)
    self.WBP_Armory_PetAchive.Key_Lock:SetVisibility(UIConst.VisibilityOp.Collapsed)
  else
    self:UpdateBottomKeyView(true)
    self.WBP_Armory_PetAchive.Key_Lock:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  end
  self.CurInputDevice = CurInputDevice
end

function M:IsPetMatchedWithSift(PetItem)
  local fieldMapping = {}
  local SiftModelId = self.PetSiftId
  local SubIds = DataMgr.SiftModel[SiftModelId].SubId
  for i, SiftId in ipairs(SubIds) do
    local SiftData = DataMgr.SiftDimens[SiftId]
    local field = SiftData.SelectionField[1]
    fieldMapping[i] = field
  end
  
  local function getFieldValueByIndex(PetItem, index)
    local fieldName = fieldMapping[index]
    local BattlePetIds = {}
    local PetEntryNum = 0
    for _, PetEntryId in ipairs(PetItem.PetEntry) do
      PetEntryNum = PetEntryNum + 1
      local BattlePetId = DataMgr.PetEntry[PetEntryId].BattlePetID
      if BattlePetId and not BattlePetIds[BattlePetId] then
        BattlePetIds[BattlePetId] = true
      end
    end
    if "PetEntry" == fieldName then
      return BattlePetIds
    elseif "PetEntryNum" == fieldName then
      return tostring(PetEntryNum)
    else
      local fieldValue = PetItem[fieldName]
      return tostring(fieldValue)
    end
  end
  
  for i, SiftItem in pairs(self.SelectedSiftItems) do
    local fieldValue = getFieldValueByIndex(PetItem, i)
    if not fieldValue then
      return false
    end
    local siftValues = {}
    for _, index in pairs(SiftItem) do
      local siftValue = self.SiftItemDatas[i].SelectionDatas[index]
      if siftValue then
        table.insert(siftValues, siftValue)
      end
    end
    local matched = false
    if "PetEntry" == fieldMapping[i] then
      if next(fieldValue) == nil then
        return false
      end
      for BattlePetId, _ in pairs(fieldValue) do
        for _, siftValue in pairs(siftValues) do
          if tostring(BattlePetId) == siftValue then
            matched = true
            break
          end
        end
      end
    else
      for _, siftValue in ipairs(siftValues) do
        if fieldValue == siftValue then
          matched = true
          break
        end
      end
    end
    if not matched then
      return false
    end
  end
  return true
end

function M:OnSiftAddedToFocusPath()
  self.WBP_Armory_PetAchive.Pet_Sort.Img_Key:SetVisibility(UIConst.VisibilityOp.Collapsed)
end

function M:OnSiftRemovedFromFocusPath()
  self.WBP_Armory_PetAchive.Pet_Sort.Img_Key:SetVisibility(UIConst.VisibilityOp.Visible)
end

AssembleComponents(M)
return M
