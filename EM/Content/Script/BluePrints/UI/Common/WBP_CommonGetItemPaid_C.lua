require("UnLua")
local RewardBox = require("BluePrints.Client.CustomTypes.SimpleRewardBox")
local BattlePassUtils = require("BluePrints.UI.WBP.BattlePass.BattlePassUtils")
local M = Class("BluePrints.UI.BP_UIState_C")

function M:OnLoaded(...)
  self.Super.OnLoaded(self, ...)
  AudioManager(self):PlayUISound(self, "event:/ui/common/get_award_items", nil, nil)
  self:PlayAnimation(self.In)
  self.Text_GetItem:SetText(GText("UI_COMMONPOP_TITLE_100017"))
  self.Text_Tip:SetText(GText("UI_TRAIN_CLOSE"))
  self.Text_Paid:SetText(GText("BattlePass_Rank2RewardPreview"))
  local ShopItemType, ShopItemId, Count, PurchaseRewards, ExtraRewards, func, ParentWidget, ActorController = ...
  DebugPrint("gmy@WBP_CommonGetItemPaid_C M:OnLoaded", PurchaseRewards, ExtraRewards, ActorController)
  self.ActorController = ActorController
  if func then
    self:BindActionOnClosed(func, ParentWidget)
  end
  self.RewardList = {}
  self.WrapBox_Content:ClearChildren()
  self:AddTimer(self.InTime, function()
    self:InitGetItemInfo(ShopItemType, ShopItemId, Count, PurchaseRewards)
    self:InitExtraRewardList()
  end, false, 0, nil, true)
  self.IsShowDetails = false
  self.CurInputDeviceType = UIUtils.UtilsGetCurrentInputType()
  self.CurGamepadName = UIUtils.UtilsGetCurrentGamepadName()
  self:OnUpdateUIStyleByInputTypeChange(self.CurInputDeviceType, self.CurGamepadName)
  self:InitInputOptions()
end

function M:InitInputOptions()
  self.Key_Goto:CreateCommonKey({
    KeyInfoList = {
      {
        Type = "Text",
        Text = "F",
        Owner = self,
        ClickCallback = function(o)
          self:JumpToPurchase()
        end
      }
    },
    Desc = GText("BattlePass_JumpToPurchase"),
    bEnableEvent = true,
    bButton = true,
    bLongPress = false
  })
  self.Btn_Goto:SetText(GText("BattlePass_JumpToPurchase"))
  self.Btn_Goto:BindEventOnClicked(self, function()
    self:JumpToPurchase()
  end)
  self.Key_Goto_GamePad:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "Y"}
    },
    Desc = GText("BattlePass_JumpToPurchase")
  })
  self.Key_Close_GamePad:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "B"}
    },
    Desc = GText("UI_BACK")
  })
end

function M:JumpToPurchase()
  if self.ActorController then
    UIManager(self):LoadUINew("BattlePassPurchase", self.ActorController)
    if self.ActorController then
      self.ActorController:SetMontageAndCamera(CommonConst.ArmoryType.Char, "Skin", CommonConst.ArmoryTag.Appearance, "Purchase")
    end
  end
  self:Close()
end

function M:InitGetItemInfo(ShopItemType, ShopItemId, Count, PurchaseRewards)
  if PurchaseRewards then
    local RewardType = DataMgr.RewardType
    for ItemType, _ in pairs(RewardType) do
      local Rewards = PurchaseRewards[ItemType .. "s"]
      if Rewards then
        local RewardInfo = DataMgr[ItemType]
        for ItemId, ItemCount in pairs(Rewards) do
          local count = 0
          if type(ItemCount) == "table" then
            count = RewardBox:GetCount(ItemCount)
          end
          if type(ItemCount) == "number" then
            count = ItemCount
          end
          self.RewardList[ItemId] = {
            TableName = ItemType,
            ItemCount = count,
            Rarity = RewardInfo[ItemId].Rarity or RewardInfo[ItemId][ItemType .. "Rarity"]
          }
        end
      end
    end
    self.RewardInfoList = {}
    for key, Value in pairs(self.RewardList) do
      table.insert(self.RewardInfoList, {ItemId = key, ItemInfo = Value})
    end
    local i = 1
    table.sort(self.RewardInfoList, function(A, B)
      local RarityA = A.ItemInfo.Rarity or 1
      local RarityB = B.ItemInfo.Rarity or 1
      if RarityA > RarityB then
        return true
      elseif RarityA == RarityB then
        return A.ItemId < B.ItemId
      else
        return false
      end
    end)
    local index = 0
    for _, Value in pairs(self.RewardInfoList) do
      local ItemId, ItemInfo = Value.ItemId, Value.ItemInfo
      self:AddTimer(self.IntervalTime * (i - 1), function()
        local Item = self:CreateWidgetNew("ComItemUniversalL")
        local Content = self:NewItemContent(ItemInfo.TableName, ItemId, ItemInfo.ItemCount)
        self:InitListItem(self.WrapBox_Content, Item, Content)
        index = index + 1
        if index == #self.RewardInfoList then
          self:SetItemNavigation()
        end
      end, false, 0, nil, true)
    end
  elseif nil ~= ShopItemType then
    local Item = self:CreateWidgetNew("ComItemUniversalL")
    local Content = self:NewItemContent(ShopItemType, ShopItemId, Count)
    self:InitListItem(self.WrapBox_Content, Item, Content)
  end
end

function M:InitExtraRewardList()
  self.Avatar = self.Avatar or GWorld:GetAvatar()
  if not self.Avatar then
    return
  end
  DebugPrint("gmy@WBP_CommonGetItemPaid_C M:InitExtraRewardList", self.Avatar.BattlePassUnlockRank2)
  self.Panel_Paid:SetVisibility(self.Avatar.BattlePassUnlockRank2 and ESlateVisibility.Collapsed or ESlateVisibility.SelfHitTestInvisible)
  if self.Avatar.BattlePassUnlockRank2 then
    return
  end
  local NowLevel = self.Avatar.BattlePassLevel
  self:SetRewardList(1, NowLevel)
end

function M:SetRewardList(StartLevel, EndLevel)
  DebugPrint("gmy@WBP_BattlePass_PurchaseDialog_C M:GetRewardList", StartLevel, EndLevel)
  local NowVersion = self.Avatar.BattlePassVersion
  local BattlePassRewardData = BattlePassUtils:GetBattlePassReward(NowVersion)
  local Rewards = {}
  for Level = StartLevel, EndLevel do
    if BattlePassRewardData and BattlePassRewardData[Level] then
      local RewardInfo = BattlePassRewardData[Level]
      if not self.Avatar.BattlePassUnlockRank2 then
        table.insert(Rewards, RewardInfo.Rank2Reward)
      end
    else
      DebugPrint("gmy@WBP_BattlePass_PurchaseDialog_C M:GetRewardList", Level)
    end
  end
  self.List_Paid:ClearListItems()
  local RewardItemList = {}
  local ItemId2Content = {}
  for _, RewardId in pairs(Rewards) do
    local RewardInfo = DataMgr.Reward[RewardId]
    if RewardInfo then
      local Ids = RewardInfo.Id or {}
      local RewardCount = RewardInfo.Count or {}
      local TableName = RewardInfo.Type or {}
      for i = 1, #Ids do
        local ItemId = Ids[i]
        if nil == ItemId2Content[ItemId] then
          table.insert(RewardItemList, ItemId)
          local Content = NewObject(UIUtils.GetCommonItemContentClass())
          Content.UIName = "GetItemPage"
          Content.IsShowDetails = true
          Content.Id = ItemId
          Content.Count = RewardUtils:GetCount(RewardCount[i])
          Content.Icon = ItemUtils.GetItemIconPath(ItemId, TableName[i])
          Content.Rarity = ItemUtils.GetItemRarity(ItemId, TableName[i])
          Content.ItemType = TableName[i]
          Content.Parent = self
          Content.bHasGot = false
          ItemId2Content[ItemId] = Content
        else
          local Content = ItemId2Content[ItemId]
          Content.Count = Content.Count + RewardUtils:GetCount(RewardCount[i])
        end
      end
    end
  end
  table.sort(RewardItemList, function(ItemId1, ItemId2)
    local ItemContent1 = ItemId2Content[ItemId1]
    local ItemContent2 = ItemId2Content[ItemId2]
    local Rarity1 = ItemContent1.Rarity
    local Rarity2 = ItemContent2.Rarity
    if Rarity1 == Rarity2 then
      return ItemId1 < ItemId2
    else
      return Rarity1 > Rarity2
    end
  end)
  for _, ItemId in ipairs(RewardItemList) do
    local Content = ItemId2Content[ItemId]
    if Content then
      Content.bIsResetFocus = true
      Content.OnMenuOpenChangedEvents = {
        Obj = self,
        Callback = self.PaidItemMenuAnchorChanged
      }
      self.List_Paid:AddItem(Content)
    end
  end
end

function M:SetItemNavigation()
  self:AddTimer(0.01, function()
    local LastItem
    local ItemMap = {}
    for Index, ItemUI in pairs(self.WrapBox_Content:GetAllChildren()) do
      if Index > 1 then
        LastItem = self.WrapBox_Content:GetChildAt(Index - 2)
      end
      if LastItem then
        LastItem:SetNavigationRuleExplicit(EUINavigation.Right, ItemUI)
        ItemUI:SetNavigationRuleExplicit(EUINavigation.Left, LastItem)
      end
    end
    for Index, Item in pairs(self.WrapBox_Content:GetAllChildren()) do
      local MyGeometry = Item:GetCachedGeometry()
      local Position = USlateBlueprintLibrary.LocalToAbsolute(MyGeometry, UE4.USlateBlueprintLibrary.GetLocalTopLeft(MyGeometry))
      if ItemMap[Position.X] then
        ItemMap[Position.X]:SetNavigationRuleExplicit(EUINavigation.Down, Item)
        Item:SetNavigationRuleExplicit(EUINavigation.Up, ItemMap[Position.X])
      end
      ItemMap[Position.X] = Item
    end
  end, false, 0, nil, true)
end

function M:InitListItem(ContainerWidget, Item, Content)
  ContainerWidget:AddChild(Item)
  Item:Init(Content)
  local Events = {}
  Events.OnMenuOpenChanged = self.ItemMenuAnchorChanged
  Item:BindEvents(self, Events)
end

function M:ItemMenuAnchorChanged(bIsOpen)
  self.IsShowDetails = bIsOpen
  if bIsOpen then
    self.bCantClose = bIsOpen
  end
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  local GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
  self:OnUpdateUIStyleByInputTypeChange(GameInputModeSubsystem:GetCurrentInputType(), GameInputModeSubsystem:GetCurrentGamepadName())
end

function M:BP_GetDesiredFocusTarget()
  return self.WrapBox_Content:GetChildAt(0)
end

function M:AddOrUpdateItemToList(ItemId, ItemCount, ItemTableName)
  if self.RewardList[ItemId] ~= nil then
    local AllChildren = self.WrapBox_Content:GetAllChildren()
    for i = 1, AllChildren:Length() do
      local SubItem = AllChildren:GetRef(i)
      if SubItem.Content and SubItem.Content.UnitId == ItemId then
        if type(SubItem.SetCount) == "function" then
          SubItem:SetCount(math.floor(SubItem.Content.Count + ItemCount + 0.5))
        else
          SubItem.Content.Count = SubItem.Content.Count + ItemCount
        end
      end
    end
  else
    ItemCount = math.floor(ItemCount + 0.5)
    self.RewardList[ItemId] = {TableName = ItemTableName, ItemCount = ItemCount}
    local Item = self:CreateWidgetNew("ComItemUniversalL")
    local Content = self:NewItemContent(ItemTableName, ItemId, ItemCount)
    self:InitListItem(self.WrapBox_Content, Item, Content)
  end
end

function M:NewItemContent(ItemType, ItemId, Count)
  local ItemData = DataMgr[ItemType][ItemId]
  local Obj = NewObject(UIUtils.GetCommonItemContentClass())
  Obj.ItemType = ItemType
  Obj.Id = ItemId
  local Name
  if "Draft" == ItemType then
    local ProductData = DataMgr[ItemData.ProductType][ItemData.ProductId]
    Name = GText("UI_FORGING_BLUEPRINT") .. GText(ProductData[ItemData.ProductType .. "Name"] or ProductData.Name)
  else
    Name = ItemUtils:GetDropName(ItemId, ItemType)
  end
  Obj.Count = Count
  Obj.Rarity = ItemUtils.GetItemRarity(ItemId, ItemType)
  if "HeadSculpture" == ItemType then
    Obj.Icon = ItemData.HeadPath
  else
    Obj.Icon = ItemUtils.GetItemIconPath(ItemId, ItemType)
  end
  Obj.IsShowDetails = true
  Obj.UIName = "GetItemPage"
  return Obj
end

function M:BindActionOnClosed(func, ParentWidget)
  self.OnClosed = func
  self.ParentWidget = ParentWidget
end

function M:CloseSelf()
  if self.bCantClose then
    self.bCantClose = false
    return
  end
  self:RemoveTimer("InitGetItemInfo")
  if not self.bAnimClose then
    self:AddTimer(0.5, function()
      self.bAnimClose = true
    end, false, 0, nil, true)
    return
  end
  local UIState = UIManager(self):GetCurrentState()
  if UIState then
    UIState:SetFocus()
  end
  self:PlayAnimation(self.Out)
end

function M:OnAnimationFinished(Animation)
  if Animation == self.Out then
    self:Close()
    if self.OnClosed then
      if self.ParentWidget ~= nil then
        self.OnClosed(self.ParentWidget)
      else
        self:OnClosed()
      end
    end
  end
end

function M:OnUpdateUIStyleByInputTypeChange(CurInputDevice, CurGamepadName)
  DebugPrint("gmy@WBP_CommonGetItemPaid_C M:OnUpdateUIStyleByInputTypeChange", CurInputDevice)
  if CurInputDevice == ECommonInputType.Touch then
    self.WidgetSwitcher_MP:SetActiveWidgetIndex(1)
    self.Text_Tip:SetVisibility(ESlateVisibility.Collapsed)
  elseif CurInputDevice == ECommonInputType.MouseAndKeyboard then
    self.WidgetSwitcher_MP:SetActiveWidgetIndex(0)
    self.Text_Tip:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  elseif CurInputDevice == ECommonInputType.Gamepad then
    self.WidgetSwitcher_MP:SetActiveWidgetIndex(2)
    self.Text_Tip:SetVisibility(ESlateVisibility.Collapsed)
  end
end

function M:OnKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local IsEventHandled = false
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) then
    IsEventHandled = self:OnGamePadDown(InKeyName)
  elseif "Escape" == InKeyName then
    self:CloseSelf()
    IsEventHandled = true
  elseif "F" == InKeyName then
    self:JumpToPurchase()
    IsEventHandled = true
  end
  if IsEventHandled then
    return UE4.UWidgetBlueprintLibrary.Handled()
  else
    return UE4.UWidgetBlueprintLibrary.UnHandled()
  end
end

function M:OnGamePadDown(InKeyName)
  local IsEventHandled = false
  if InKeyName == Const.GamepadFaceButtonRight then
    self:CloseSelf()
    IsEventHandled = true
  elseif InKeyName == Const.GamepadFaceButtonUp then
    self:JumpToPurchase()
  end
  return IsEventHandled
end

function M:PaidItemMenuAnchorChanged(bIsOpen)
  if not bIsOpen then
    self:AddTimer(0.1, function()
    end)
  end
end

return M
