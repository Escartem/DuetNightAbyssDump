require("UnLua")
local EMCache = require("EMCache.EMCache")
local M = Class("BluePrints.UI.UI_PC.Common.Common_Dialog.Common_Dialog_ContentBase")

function M:InitContent(Params, PopupData, Owner)
  self.RootPage = Params.RootPage
  self.LureContentList = {}
  if Params.RodId then
    self.CurrentTabIdx = 1
    self:InitRodContent()
  else
    self.CurrentTabIdx = 2
    self:InitLureContent()
  end
  self:BindDialogEvent("OnTitleTabSelected", self.UpdateContent)
  self.BtnText:BindEventOnClicked(self, self.OnWearBtnClick)
  self.List_Item.BP_OnItemSelectionChanged:Add(self, self.OnItemSelectionChanged)
  self.List_Item:SetFocus()
end

function M:InitLureContent()
  self.List_Item:ClearListItems()
  local LureNum = 0
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    local LureList = {}
    for LureId, Data in pairs(DataMgr.FishingLure) do
      LureNum = LureNum + 1
      local Num = Avatar:GetResourceNum(Data.ResourceId)
      local Rarity = DataMgr.Resource[Data.ResourceId].Rarity
      local Level = Data.FishingRodLevel
      local FishingLureSort = Data.FishingLureSort or 1
      table.insert(LureList, {
        LureId = LureId,
        Rarity = Rarity,
        Num = Num,
        Level = Level,
        FishingLureSort = FishingLureSort
      })
    end
    table.sort(LureList, function(a, b)
      return a.FishingLureSort > b.FishingLureSort
    end)
    for _, Data in pairs(LureList) do
      self:InitLureIcon(Data.LureId, Data.Num, Data.Level)
    end
    self.Text_Tips_Num:SetText(#LureList)
  else
    self.RootPage.FishingLureId = 101
  end
  self:RemoveTimer("InitRodContent")
  self:AddTimer(0.1, function()
    local TotalNumX, TotalNumY = UIUtils.GetTileViewContentMaxCount(self.List_Item, "XY", true, true)
    local TotalNum = TotalNumX * TotalNumY
    print(_G.LogTag, "LXZ InitContent", TotalNumX, TotalNumY, TotalNum, LureNum)
    for i = 1, TotalNum - LureNum do
      local Content = self:NewItemContent(nil, 0, nil)
      self.List_Item:AddItem(Content)
    end
    self.List_Item:SetEmptyGridItemCount(TotalNum - LureNum)
    local Idx = self.List_Item:GetIndexForItem(self.SelectLureContent)
    local Widget = URuntimeCommonFunctionLibrary.GetEntryWidgetFromItem(self.List_Item, Idx)
    if Widget then
      Widget:SetFocus()
    end
  end, false, 0, "InitLureContent")
  self.BtnText:TryOverrideSoundFunc(function()
    AudioManager(self):PlayUISound(self, "event:/ui/common/weapon_replace", nil, nil)
  end)
  self.Text_Btn:SetText(GText("UI_Bag_Equipped"))
  self.List_Item.BP_OnItemClicked:Clear()
  self.List_Item.BP_OnItemClicked:Add(self, self.OnLureItemClicked)
  self.Text_Tips:SetText(GText("UI_FORGING_CURRENT"))
  self:PlayAnimation(self.Pattern_Change)
  self:UISetGamePaused("CommonDialog", false)
end

function M:InitRodContent()
  self.List_Item:ClearListItems()
  local RodNum = 0
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    local RodList = {}
    for RodId, Data in pairs(DataMgr.FishingRod) do
      RodNum = RodNum + 1
      local Num = Avatar:GetResourceNum(Data.ResourceId)
      if Num >= 1 then
        local Rarity = DataMgr.Resource[Data.ResourceId].Rarity
        local Level = Data.FishingRodLevel
        table.insert(RodList, {
          RodId = RodId,
          Rarity = Rarity,
          Num = Num,
          Level = Level
        })
      end
    end
    table.sort(RodList, function(a, b)
      if a.Level ~= b.Level then
        return a.Level > b.Level
      end
      if a.Rarity ~= b.Rarity then
        return a.Level > b.Level
      end
      if a.RodId ~= b.RodId then
        return a.RodId < b.RodId
      end
    end)
    for _, Data in pairs(RodList) do
      self:InitRodIcon(Data.RodId, Data.Num, Data.Level)
    end
    self.Text_Tips_Num:SetText(#RodList)
  else
    for RodId, Data in pairs(DataMgr.FishingRod) do
      RodNum = RodNum + 1
      self:InitRodIcon(RodId, 1)
    end
  end
  self:RemoveTimer("InitLureContent")
  self:AddTimer(0.1, function()
    local TotalNumX, TotalNumY = UIUtils.GetTileViewContentMaxCount(self.List_Item, "XY", true, true)
    local TotalNum = TotalNumX * TotalNumY
    print(_G.LogTag, "LXZ InitContent", TotalNumX, TotalNumY, TotalNum, RodNum)
    for i = 1, TotalNum - RodNum do
      local Content = self:NewItemContent(nil, 0, nil)
      self.List_Item:AddItem(Content)
    end
    self.List_Item:SetEmptyGridItemCount(TotalNum - RodNum)
    local Idx = self.List_Item:GetIndexForItem(self.SelectRodContent)
    local Widget = URuntimeCommonFunctionLibrary.GetEntryWidgetFromItem(self.List_Item, Idx)
    if Widget then
      Widget:SetFocus()
    end
  end, false, 0, "InitRodContent")
  self.BtnText:TryOverrideSoundFunc(function()
    AudioManager(self):PlayUISound(self, "event:/ui/common/weapon_replace", nil, nil)
  end)
  self.Text_Btn:SetText(GText("UI_Bag_Equipped"))
  self.List_Item.BP_OnItemClicked:Clear()
  self.List_Item.BP_OnItemClicked:Add(self, self.OnRodItemClicked)
  self.Text_Tips:SetText(GText("UI_FORGING_CURRENT"))
  self:PlayAnimation(self.Pattern_Change)
  self:UISetGamePaused("CommonDialog", false)
end

function M:InitRodIcon(RodId, Num, Level)
  local ResourceId = DataMgr.FishingRod[RodId].ResourceId
  local Count = self.RootPage.Angling_Main:GetResourceCount(ResourceId)
  if Count < 1 then
    return
  end
  local Content = self:NewItemContent("Resource", ResourceId, Level, nil, RodId)
  if Content then
    if self.RootPage.FishingRodId == RodId then
      Content.IsSelect = true
      Content.bSelectTag = true
      self.SelectRodContent = Content
      self.WearRodContent = Content
      self:RefreshSelectRodDetail(Content)
    end
    self.List_Item:AddItem(Content)
    if self.RootPage.FishingRodId == RodId then
      self.List_Item:BP_SetSelectedItem(Content)
    end
  end
end

function M:InitLureIcon(LureId, Num, Level)
  local ResourceId = DataMgr.FishingLure[LureId].ResourceId
  local Count = self.RootPage.Angling_Main:GetResourceCount(ResourceId)
  local Content = self:NewItemContent("Resource", ResourceId, Level, Count, LureId)
  if Content then
    if self.RootPage.FishingLureId == LureId then
      Content.IsSelect = true
      Content.bSelectTag = true
      self.SelectLureContent = Content
      self.WearLureContent = Content
      self:RefreshSelectLureDetail(Content)
    end
    self.List_Item:AddItem(Content)
    self.LureContentList[ResourceId] = Content
    if self.RootPage.FishingLureId == LureId then
      self.List_Item:BP_SetSelectedItem(Content)
    end
  end
end

function M:OnRodItemClicked(Content)
  print(_G.LogTag, "LXZ OnRodItemClicked", Content, self.SelectRodContent)
  if Content == self.SelectRodContent then
    return
  end
  Content.IsSelect = true
  Content.SelfWidget:SetSelected(true)
  if self.SelectRodContent then
    self.SelectRodContent.IsSelect = false
    self.SelectRodContent.SelfWidget:SetSelected(false)
  end
  self.SelectRodContent = Content
  local GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(self)
  if GameInputModeSubsystem then
    local bIsGamepad = GameInputModeSubsystem:GetCurrentInputType() == ECommonInputType.Gamepad
    if bIsGamepad then
      self:OnWearBtnClick()
    else
      self:RefreshSelectRodDetail(Content)
    end
  end
end

function M:OnLureItemClicked(Content)
  print(_G.LogTag, "LXZ OnLureItemClicked", Content, self.SelectLureContent)
  if Content == self.SelectLureContent then
    return
  end
  Content.IsSelect = true
  Content.SelfWidget:SetSelected(true)
  if self.SelectLureContent then
    self.SelectLureContent.IsSelect = false
    self.SelectLureContent.SelfWidget:SetSelected(false)
  end
  self.SelectLureContent = Content
  local GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(self)
  if GameInputModeSubsystem then
    local bIsGamepad = GameInputModeSubsystem:GetCurrentInputType() == ECommonInputType.Gamepad
    if bIsGamepad then
      self:OnWearBtnClick()
    else
      self:RefreshSelectLureDetail(Content)
    end
  end
end

function M:RefreshSelectRodDetail(Content)
  self.CurrentRodId = Content.RodOrLureId
  local Data = DataMgr.Resource[Content.Id]
  if not Data then
    print(_G.LogTag, "Error: Item Data is nil, ItemType:", "Resource", "ItemId:", Content.Id)
    return nil
  end
  print(_G.LogTag, "LXZ RefreshSelectRodDetail", Content.RodOrLureId, self.RootPage.FishingRodId, Content.Count)
  if Content.RodOrLureId == self.RootPage.FishingRodId then
    self.Switcher_Btn:SetActiveWidgetIndex(1)
  else
    self.Switcher_Btn:SetActiveWidgetIndex(0)
  end
  assert(Content.Icon, "\229\189\147\229\137\141\229\183\178\232\163\133\229\164\135\233\177\188\231\171\191\229\155\190\230\160\135 \228\188\160\229\133\165Icon\232\183\175\229\190\132\228\184\186\231\169\186")
  local Icon = LoadObject(Content.Icon)
  self.Icon_Head:SetBrushFromTexture(Icon)
  self.Text_RoleName:SetText(GText(Data.ResourceName))
  self.Text_Unlock:SetText(GText(Data.IpDes))
  self.BtnText:SetText(GText("UI_Armory_Weapon_Equipe"))
  self:PlayAnimation(self.Pattern_Change)
end

function M:RefreshSelectLureDetail(Content)
  self.CurrentLureId = Content.RodOrLureId
  local Data = DataMgr.Resource[Content.Id]
  if not Data then
    print(_G.LogTag, "Error: Item Data is nil, ItemType:", "Resource", "ItemId:", Content.Id)
    return nil
  end
  print(_G.LogTag, "LXZ RefreshSelectRodDetail", Content.RodOrLureId, self.RootPage.FishingLureId, Content.Count)
  if Content.RodOrLureId == self.RootPage.FishingLureId then
    self.Switcher_Btn:SetActiveWidgetIndex(1)
  else
    self.Switcher_Btn:SetActiveWidgetIndex(0)
  end
  assert(Content.Icon, "\229\189\147\229\137\141\229\183\178\232\163\133\229\164\135\233\177\188\233\165\181\229\155\190\230\160\135 \228\188\160\229\133\165Icon\232\183\175\229\190\132\228\184\186\231\169\186")
  local Icon = LoadObject(Content.Icon)
  self.Icon_Head:SetBrushFromTexture(Icon)
  self.Text_RoleName:SetText(GText(Data.ResourceName))
  self.Text_Unlock:SetText(GText(Data.DetailDes))
  if 0 == Content.Count then
    self.BtnText:SetText(GText("UI_Skin_GotoBuy"))
  else
    self.BtnText:SetText(GText("UI_Armory_Weapon_Equipe"))
  end
  self:PlayAnimation(self.Pattern_Change)
end

function M:OnWearBtnClick()
  print(_G.LogTag, "LXZ OnWearBtnClick", self.CurrentTabIdx)
  if 1 == self.CurrentTabIdx then
    self.RootPage.FishingRodId = self.CurrentRodId
    if self.WearRodContent == self.SelectRodContent then
      return
    end
    UIManager(self):ShowUITip(UIConst.Tip_CommonTop, GText("UI_Fishing_RodEquippedSucc"))
    self.WearRodContent.SelfWidget:SetItemSelect(false)
    self.WearRodContent = self.SelectRodContent
    self.WearRodContent.SelfWidget:SetItemSelect(true)
    self.Switcher_Btn:SetActiveWidgetIndex(1)
    self.RootPage.Angling_Main:RefreshFishRod(self.CurrentRodId)
    self.RootPage:UpdateFishingRodModelId()
  else
    if self.WearLureContent == self.SelectLureContent then
      return
    end
    if 0 == self.SelectLureContent.Count then
      local ShopItemId = DataMgr.FishingLure[self.CurrentLureId].ItemId
      PageJumpUtils:JumpToShopPage(801, 8010, ShopItemId, "FishingShop")
    else
      self.RootPage.FishingLureId = self.CurrentLureId
      UIManager(self):ShowUITip(UIConst.Tip_CommonTop, GText("UI_Fishing_LureEquippedSucc"))
      self.WearLureContent.SelfWidget:SetItemSelect(false)
      self.WearLureContent = self.SelectLureContent
      self.WearLureContent.SelfWidget:SetItemSelect(true)
      self.Switcher_Btn:SetActiveWidgetIndex(1)
      self.RootPage.Angling_Main:RefreshFishLure(self.CurrentLureId)
    end
  end
end

function M:OnGetLure(ResourceId)
  print(_G.LogTag, "LXZ OnGetLure", ResourceId)
  if not self.LureContentList[ResourceId] then
    return
  end
  local Content = self.LureContentList[ResourceId]
  local Count = 1
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    Count = Avatar:GetResourceNum(ResourceId)
  end
  Content.Count = Count
  Content.SelfWidget:SetCount(Count)
  if self.CurrentLureId == Content.RodOrLureId then
    self:RefreshSelectLureDetail(Content)
  end
end

function M:NewItemContent(ItemType, ItemId, Level, Count, RodOrLureId)
  if 0 == ItemId then
    local Class = UIUtils.GetCommonItemContentClass()
    local Obj = NewObject(Class)
    return Obj
  end
  local ItemData = DataMgr[ItemType][ItemId]
  if not ItemData then
    print(_G.LogTag, "Error: Item Data is nil, ItemType:", ItemType, "ItemId", ItemId)
    return nil
  end
  local Class = UIUtils.GetCommonItemContentClass()
  local Obj = NewObject(Class)
  Obj.ItemType = ItemType
  Obj.Id = ItemId
  Obj.Rarity = ItemData.Rarity or ItemData.WeaponRarity or 1
  Obj.Icon = ItemData.Icon
  Obj.bSelectTag = false
  Obj.IsNew = true
  Obj.bInteractive = true
  Obj.Parent = self
  Obj.IsShowDetails = false
  Obj.OnBtnAddClicked = self.OnClickRodIcon
  Obj.RodOrLureId = RodOrLureId
  Obj.Level = Level
  Obj.Count = Count
  Obj.NotCountFormat = true
  return Obj
end

function M:UpdateContent(TabWidget, Index)
  print(_G.LogTag, "LXZ UpdateContent", TabWidget:GetName(), Index)
  self.CurrentTabIdx = TabWidget.Idx
  if 1 == TabWidget.Idx then
    self:InitRodContent()
  else
    self:InitLureContent()
  end
end

function M:BP_GetDesiredFocusTarget()
  return self.List_Item
end

function M:OnItemSelectionChanged(Content, bIsSelected)
  print(_G.LogTag, "LXZ OnItemSelectionChanged", bIsSelected)
  if not bIsSelected then
    return
  end
  local GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(self)
  if GameInputModeSubsystem then
    local bIsGamepad = GameInputModeSubsystem:GetCurrentInputType() == ECommonInputType.Gamepad
    if bIsGamepad then
      if 1 == self.CurrentTabIdx then
        self:RefreshSelectRodDetail(Content)
      else
        self:RefreshSelectLureDetail(Content)
      end
    end
  end
end

function M:OnKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) then
    if "Gamepad_FaceButton_Right" == InKeyName then
      self.RootPage.Angling_Main:OnDialogClose()
    elseif "Gamepad_RightThumbstick" == InKeyName then
      self.RootPage.Angling_Main.Com_Tab.WBP_Com_Tab_ResourceBar:FocusToResource()
    end
  end
  return UE4.UWidgetBlueprintLibrary.UnHandled()
end

return M
