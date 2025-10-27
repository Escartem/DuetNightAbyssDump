require("UnLua")
local WalnutBagController = require("BluePrints.UI.WBP.Walnut.WalnutBag.WalnutBagController")
local WalnutBagModel = WalnutBagController:GetModel()
local M = Class({
  "BluePrints.UI.BP_UIState_C"
})

function M:Initialize(Initializer)
  self.Super.Initialize(self)
  self.ParentWidget = nil
  self.bIsOpenList = false
  self.InitStuffDataInList = nil
  self.CurStuffCountInList = 0
  self.CurSelectStuffContentInList = nil
  self.AllTypeCoinInfo = {}
  self.AllTypeRewardsInfo = {}
  self.AllRewardContentList = {}
  self.NeedDealWithStuffData = {}
  self.NeedDealWithStuffCount = {}
  self.ItemId2GridIndex = {}
  self.CloseCallback = nil
  self.RemoveCallback = nil
  self.ConfirmCallback = nil
  self.CurFocusWidget = "DefaultWidget"
end

function M:OnLoaded(...)
  self.Super.OnLoaded(self, ...)
  self.List_Item:ClearListItems()
  self.ParentWidget, self.CloseCallback, self.RemoveCallback, self.ConfirmCallback, self.InitStuffDataInList, self.CurrentMode = ...
  if CommonUtils.GetDeviceTypeByPlatformName(self) == CommonConst.CLIENT_DEVICE_TYPE.MOBILE then
    local CanvasSlot = UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(self.Panel_Content)
    if nil ~= CanvasSlot then
      CanvasSlot:SetSize(FVector2D(0, 0))
    end
  end
  self:PlayInAnim()
end

function M:OnFocusReceived(MyGeometry, InFocusEvent)
  self.CurFocusWidget = "DefaultWidget"
  if self.ParentWidget then
    self.ParentWidget:RefreshBottomKeyInfo("DefaultWidget")
  end
  return M.Super.OnFocusReceived(self, MyGeometry, InFocusEvent)
end

function M:InitListenEvent()
  self:AddDispatcher(EventID.OnAddWalnutItemToList, self, self.AddWalnutItemToList)
  self:AddDispatcher(EventID.OnRemoveWalnutItemInList, self, self.RemoveWalnutItemInList)
end

function M:PlayInAnim()
  if self:IsAnimationPlaying(self.In) then
    return
  end
  self:PlayAnimationForward(self.In)
  self:RefreshBaseInfo()
  self:InitListenEvent()
end

function M:PlayOutAnim()
  if not self or self:IsAnimationPlaying(self.Out) then
    return
  end
  if self.bIsOpenList or self:IsAnimationPlaying(self.CloseList) then
    local function PlayCloseAnimFinished()
      self.List_Item:SetVisibility(UE4.ESlateVisibility.Collapsed)
      
      self.Panel_Sell_List:SetVisibility(UE4.ESlateVisibility.Collapsed)
      self.bIsOpenList = false
      self:BindToAnimationFinished(self.Out, {
        self,
        self.Close
      })
      self:PlayAnimationForward(self.Out)
    end
    
    self:UnbindAllFromAnimationFinished(self.CloseList)
    self:BindToAnimationFinished(self.CloseList, {self, PlayCloseAnimFinished})
    self:PlayAnimationForward(self.CloseList)
  else
    self:BindToAnimationFinished(self.Out, {
      self,
      self.Close
    })
    self:PlayAnimationForward(self.Out)
  end
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_return", nil, nil)
  if self.ParentWidget then
    self.ParentWidget:LeaveWalnutSellState()
  end
end

function M:RefreshBaseInfo()
  if CommonUtils.GetDeviceTypeByPlatformName(self) == CommonConst.CLIENT_DEVICE_TYPE.PC then
    self.Key_Check:CreateCommonKey({
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "RS"}
      }
    })
    self.Key_View:CreateCommonKey({
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "Menu"}
      }
    })
  end
  self.Com_NumInput:Init({
    MinusBtnCallback = self.OnClickToMinusStuff,
    AddBtnCallback = self.OnClickToAddStuff,
    MinBtnCallback = self.OnClickToMinStuff,
    MaxBtnCallback = self.OnClickToMaxStuff,
    InputCallback = self.OnInputStuffNum,
    LeaveFocusWidget = self.ParentWidget,
    ViewGamePad = "LeftThumb",
    OwnerPanel = self
  })
  self.Com_NumInput:SetSimpleMode(true)
  self.Com_Slider:Init({
    MinusBtnCallback = self.OnClickToMinusStuff,
    AddBtnCallback = self.OnClickToAddStuff,
    SliderChangeCallback = self.SliderChangeCallback,
    SoundResPath = {
      Minus = "event:/ui/common/click_btn_minus"
    },
    OwnerPanel = self,
    EnableMiniBtn = false,
    EnableMaxBtn = false
  })
  self.ItemBox:ClearChildren()
  self.Num_Select:SetText(tostring("0"))
  self.Num_Select_Max:SetText(tostring("999"))
  self.Text_Num:SetText(GText("UI_Bag_Sell_Amount"))
  self.Text_Select:SetText(GText("UI_Bag_Sell_Select"))
  self.Text_Total:SetText(GText("UI_Bag_Decompose_Expect"))
  self.Text_Empty:SetText(GText("UI_BAG_Nochosen"))
  self.Button_Purchase:SetGamePadImg("Y")
  self.Button_Purchase:SetText(GText("UI_BAG_Sell"))
  self.Button_Purchase:BindEventOnClicked(self, self.TryToSaleWalnut)
  self.WidgetSwitcher_State:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self.Button_List:BindEventOnClicked(self, self.ClickToOpenStuffList)
  self.Back_Area.OnClicked:Clear()
  self.Back_Area.OnClicked:Add(self, self.ClickToOpenStuffList)
  if self.InitStuffDataInList ~= nil then
    self:AddBagItemToList(self.InitStuffDataInList)
    self.CurSelectStuffContentInList = self.List_Item:GetItemAt(0)
    self.Panel_Empty:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.Panel_KeyCount:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    self.Button_Purchase:ForbidBtn(false)
  else
    self.CurSelectStuffContentInList = nil
    self.Panel_Empty:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    self.Panel_Total:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.Panel_KeyCount:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.Button_Purchase:ForbidBtn(true)
  end
  self.List_Item.BP_OnItemSelectionChanged:Add(self, self.OnSelectStuffItemChanged)
  
  function self.Button_List.SoundFunc(Btn)
    AudioManager(self):PlayUISound(self.Button_List, "event:/ui/common/click_btn_small", nil, nil)
  end
  
  if self.ParentWidget then
    if type(self.ParentWidget.SetFocus_Lua) == "function" then
      self.ParentWidget:SetFocus_Lua()
    else
      self.ParentWidget:SetFocus()
    end
  end
  local IsUseGamePad = self.GameInputModeSubsystem:GetCurrentInputType() == ECommonInputType.Gamepad and self:IsCanChangeToGamePadViewMode()
  self:UpdateUIStyleInPlatform(IsUseGamePad)
end

function M:UpdateUIStyleInPlatform(IsUseGamePad)
  if CommonUtils.GetDeviceTypeByPlatformName(self) == CommonConst.CLIENT_DEVICE_TYPE.MOBILE then
    return
  end
  local ActiveWidgetIndex = IsUseGamePad and 1 or 0
  if IsUseGamePad then
    self.Key_Check:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    self.Key_View:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  else
    self.Key_Check:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.Key_View:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

function M:UpdateCurFocusInfo(NewFocusName)
  self.CurFocusWidget = NewFocusName
end

function M:SetFocus_Lua()
  if self.bIsOpenList then
    self.List_Item:SetFocus()
    self:UpdateCurFocusInfo("ToSellListView")
  elseif self.ParentWidget then
    self:UpdateCurFocusInfo("DefaultWidget")
    if self.ParentWidget.SetFocus_Lua then
      self.ParentWidget:SetFocus_Lua()
    else
      self.ParentWidget:SetFocus()
    end
  end
end

function M:ClickToOpenStuffList()
  if self:IsAnimationPlaying(self.OpenList) or self:IsAnimationPlaying(self.CloseList) then
    return
  end
  if self.bIsOpenList then
    local function PlayCloseAnimFinished()
      local ChooseItem = self.List_Item:BP_GetSelectedItem()
      
      if ChooseItem and ChooseItem.SelfWidget then
        ChooseItem.SelfWidget:SetSelected(false)
      end
      self.List_Item:BP_ClearSelection()
      self.List_Item:SetVisibility(UE4.ESlateVisibility.Collapsed)
      self.Panel_Sell_List:SetVisibility(UE4.ESlateVisibility.Collapsed)
      self.bIsOpenList = false
      self.Com_NumInput:OverrideFocusToWidget(self.ParentWidget)
      if self.ParentWidget then
        self.ParentWidget:SetFocus_Lua()
      end
    end
    
    self:UnbindAllFromAnimationFinished(self.CloseList)
    self:BindToAnimationFinished(self.CloseList, {self, PlayCloseAnimFinished})
    self:PlayAnimationForward(self.CloseList)
  else
    local function PlayOpenAnimFinished()
      self.bIsOpenList = true
      
      local AllItemCount = self.List_Item:GetNumItems()
      for i = 0, AllItemCount - 1 do
        local ItemObj = self.List_Item:GetItemAt(i)
        if ItemObj and ItemObj.SelfWidget ~= nil then
          if 0 == i then
            ItemObj.SelfWidget:SetSelected(true)
            self:OnListSelectStuffClicked(ItemObj, "SelectFirstItem")
          else
            ItemObj.SelfWidget:SetSelected(false)
          end
          local NowSaleStuffCount = self.NeedDealWithStuffCount[ItemObj.Uuid] or 1
          ItemObj.SelfWidget:SetSelectNum(Utils.FormatNumber(NowSaleStuffCount, true))
        end
      end
      self.List_Item:SetFocus()
      self.Com_NumInput:OverrideFocusToWidget(self)
      self:UpdateCurFocusInfo("ToSellListView")
    end
    
    self.List_Item:SetFocus()
    self:UnbindAllFromAnimationFinished(self.OpenList)
    self:BindToAnimationFinished(self.OpenList, {self, PlayOpenAnimFinished})
    self:PlayAnimationForward(self.OpenList)
    self.List_Item:SetVisibility(UE4.ESlateVisibility.Visible)
    self.Panel_Sell_List:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  end
end

function M:OnSelectStuffItemChanged(SelectItem, bIsSelect)
  if not SelectItem then
    return
  end
  if self.bIsOpenList and self.GameInputModeSubsystem:GetCurrentInputType() == ECommonInputType.Gamepad then
    self:OnListSelectStuffClicked(SelectItem, "ChangeHoverInGamepad")
  end
end

function M:TryToSaleWalnut()
  if self.CurStuffCountInList <= 0 then
    UIManager(self):ShowUITip(UIConst.Tip_CommonToast, GText("UI_BAG_Nochosen"))
    return
  end
  local CommonDialogParams, bIsNeedShowWarning, PlayerAvatar, bIsNeedShowTips = {}, false, GWorld:GetAvatar(), false
  CommonDialogParams.StuffInfoList = {}
  for ItemUuid, ItemData in pairs(self.NeedDealWithStuffData) do
    local StuffServerData = {
      Id = ItemData.StuffId
    }
    if nil ~= StuffServerData then
      local StuffDataDict = WalnutBagModel:GetWalnutStuffData(StuffServerData, self)
      StuffDataDict.StuffCount = self.NeedDealWithStuffCount[ItemUuid]
      table.insert(CommonDialogParams.StuffInfoList, StuffDataDict)
    end
  end
  CommonDialogParams.LeftText = GText("UI_Bag_Sell_Waiting")
  CommonDialogParams.RightText = GText("UI_Bag_Sell_Get")
  CommonDialogParams.RewardList = {}
  for k, v in pairs(self.AllTypeCoinInfo) do
    if v > 0 then
      local ValueCount = 0
      if k == CommonConst.Coins.Coin3 then
        local LimitedCoinNum, CurCoinNumDaily = self:GetCoin3DataInfo()
        if LimitedCoinNum < CurCoinNumDaily + v and not CommonDialogParams.IsShowEmptyText then
          bIsNeedShowTips = true
          CommonDialogParams.Tips = {
            GText("UI_Bag_ModExtract_Warning")
          }
        end
        ValueCount = math.min(math.floor(v + 0.5), math.floor(LimitedCoinNum - CurCoinNumDaily + 0.5))
      else
        ValueCount = math.floor(v + 0.5)
      end
      local RewardInfo = DataMgr.Resource[k]
      local RewardObject = {}
      RewardObject.StuffId = k
      RewardObject.StuffIcon = ItemUtils.GetItemIconPath(k, "Resource")
      RewardObject.ParentWidget = self
      RewardObject.StuffType = "Resource"
      RewardObject.Rarity = RewardInfo.Rarity or 1
      RewardObject.IsShowDetails = true
      RewardObject.UIName = "WalnutSelectToList"
      RewardObject.Count = ValueCount
      table.insert(CommonDialogParams.RewardList, RewardObject)
    end
  end
  if bIsNeedShowTips then
    CommonDialogParams.bHideDialogItem = false
    CommonDialogParams.DialogItemIndex = nil
  else
    CommonDialogParams.bHideDialogItem = true
    CommonDialogParams.DialogItemIndex = 1
  end
  
  function CommonDialogParams.RightCallbackFunction()
    self:ConfirmDealWithItems()
  end
  
  local ConfirmParams = {}
  if bIsNeedShowWarning then
    ConfirmParams.ShortText = GText("UI_COMMONPOP_TEXT_100038")
  end
  if ConfirmParams.ShortText then
    function ConfirmParams.RightCallbackFunction(_, Data)
      self:UpdatePopupSelectedInfo(Data, BagCommon.LastStuffSellTimeStamp)
      
      UIManager(self):ShowCommonPopupUI(100164, CommonDialogParams, self)
    end
    
    UIManager(self):ShowCommonPopupUI(100165, ConfirmParams, self)
  else
    UIManager(self):ShowCommonPopupUI(100164, CommonDialogParams, self)
  end
end

function M:AddWalnutItemToList(StuffData)
  self:FillWithStuffSellData(StuffData)
  self:RefreshCoinInfo()
  self.Num_Select:SetText(tostring(self.CurStuffCountInList))
  if 1 == self.CurStuffCountInList then
    self.Panel_KeyCount:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    self.Button_Purchase:ForbidBtn(false)
    self.Panel_Empty:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
  self:RefreshKeyCount()
end

function M:RemoveWalnutItemInList(StuffUuid)
  local StuffContent = self.NeedDealWithStuffData[StuffUuid]
  if nil ~= StuffContent then
    local IsRemoveSelectedItem = self:RemoveFromSellList(StuffContent)
    self:RefreshCoinInfo()
    self:AfterRemoveItemFromList(StuffContent, IsRemoveSelectedItem)
  end
end

function M:RemoveFromSellList(StuffContent)
  local NeedRemoveStuffContent
  local AllItemCount = self.List_Item:GetNumItems()
  for i = 0, AllItemCount - 1 do
    local ItemObj = self.List_Item:GetItemAt(i)
    if ItemObj and ItemObj.Uuid == StuffContent.Uuid then
      NeedRemoveStuffContent = ItemObj
      break
    end
  end
  if nil == NeedRemoveStuffContent then
    DebugPrint("WBP_WalnutBag_Sell_View_C=RemoveFromSellList Error, StuffUuid is ", StuffContent.Uuid)
    return false
  end
  local StuffCoinId = NeedRemoveStuffContent.CoinId
  local IsRemoveSelectedItem = NeedRemoveStuffContent.IsSelect
  self.List_Item:RemoveItem(NeedRemoveStuffContent)
  self.CurStuffCountInList = math.max(self.CurStuffCountInList - 1, 0)
  self.NeedDealWithStuffData[StuffContent.Uuid] = nil
  if nil ~= self.AllTypeCoinInfo[StuffCoinId] then
    self.AllTypeCoinInfo[StuffCoinId] = self.AllTypeCoinInfo[StuffCoinId] - StuffContent.Price * self.NeedDealWithStuffCount[StuffContent.Uuid]
    if self.AllTypeCoinInfo[StuffCoinId] <= 0 then
      self.AllTypeCoinInfo[StuffCoinId] = nil
    end
  end
  return IsRemoveSelectedItem
end

function M:AfterRemoveItemFromList(StuffContent, IsRemoveSelectedItem)
  self.NeedDealWithStuffCount[StuffContent.Uuid] = nil
  self.Num_Select:SetText(tostring(math.max(self.CurStuffCountInList, 0)))
  if self.CurStuffCountInList <= 0 then
    self.CurSelectGridIndex = nil
    self.CurSelectStuffContentInList = nil
    self.Panel_Empty:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    self.Panel_Total:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.Button_Purchase:ForbidBtn(true)
    self.Panel_KeyCount:SetVisibility(UE4.ESlateVisibility.Collapsed)
  elseif IsRemoveSelectedItem then
    self.List_Item:SetSelectedIndex(0)
    local SelectItemObj = self.List_Item:GetItemAt(0)
    self:OnListSelectStuffClicked(SelectItemObj, "SelectFirstItem")
    if self.GameInputModeSubsystem:GetCurrentInputType() == ECommonInputType.Gamepad and SelectItemObj and SelectItemObj.SelfWidget then
      SelectItemObj.SelfWidget:SetFocus()
    end
  end
  if type(self.RemoveCallback) == "function" then
    self.RemoveCallback(self.ParentWidget, StuffContent.Uuid)
  end
end

function M:FillWithStuffSellData(StuffData)
  StuffData.ParentWidget = self
  StuffData.GridIndex = self.CurStuffCountInList + 1
  local AddStuffCount = 1
  if self.NeedDealWithStuffData[StuffData.Uuid] ~= nil then
    StuffData.GridIndex = self.ItemId2GridIndex[StuffData.Uuid]
    self.NeedDealWithStuffCount[StuffData.Uuid] = self.NeedDealWithStuffCount[StuffData.Uuid] + 1
    local temp = self.List_Item:GetItemAt(StuffData.GridIndex - 1)
    self:OnListSelectStuffClicked(temp, "AddNewItem")
  else
    StuffData.GridIndex = self.CurStuffCountInList + 1
    StuffData.StateTagInfo = {
      Name = "InSelectList",
      ExtraData = {
        AddStuffCount,
        StuffData.StuffCount,
        StuffData.Price,
        StuffData.CoinId,
        self.RemoveWalnutItemInList
      }
    }
    StuffData.ClickCallback = self.OnListSelectStuffClicked
    StuffData.bDisableCommonClick = true
    local StuffObj = WalnutBagModel:CreateBagItemContent(StuffData)
    self.NeedDealWithStuffData[StuffObj.Uuid] = StuffObj
    self.NeedDealWithStuffCount[StuffObj.Uuid] = AddStuffCount
    self.List_Item:AddItem(StuffObj)
    local SelectItemObj = self.List_Item:GetItemAt(self.CurStuffCountInList)
    self:OnListSelectStuffClicked(SelectItemObj, "AddNewItem")
    self.CurStuffCountInList = self.CurStuffCountInList + 1
    self.ItemId2GridIndex[StuffObj.Uuid] = StuffObj.GridIndex
  end
  local StuffCoinId = StuffData.CoinId
  if nil ~= self.AllTypeCoinInfo[StuffCoinId] then
    self.AllTypeCoinInfo[StuffCoinId] = self.AllTypeCoinInfo[StuffCoinId] + StuffData.Price * AddStuffCount
  else
    self.AllTypeCoinInfo[StuffCoinId] = StuffData.Price * AddStuffCount
  end
end

function M:RefreshCoinInfo()
  local AllChildren = self.ItemBox:GetAllChildren()
  local TotalRewardTypeNum, ExtraShowCoinNum = 0, 0
  for i = 1, AllChildren:Length() do
    local Widget = self.ItemBox:GetChildAt(i - 1)
    Widget:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
  for k, v in pairs(self.AllTypeCoinInfo) do
    if v > 0 then
      TotalRewardTypeNum = TotalRewardTypeNum + 1
      local RewardItemWidget
      if TotalRewardTypeNum > AllChildren:Length() then
        RewardItemWidget = UIManager(self):_CreateWidgetNew("ComItemUniversalS")
        self.ItemBox:AddChildToWrapBox(RewardItemWidget)
      else
        RewardItemWidget = self.ItemBox:GetChildAt(TotalRewardTypeNum - 1)
      end
      local RewardInfo = DataMgr.Resource[k]
      local RewardObject = {}
      RewardObject.Id = k
      RewardObject.Icon = ItemUtils.GetItemIconPath(k, "Resource")
      RewardObject.ParentWidget = self
      RewardObject.ItemType = "Resource"
      RewardObject.Rarity = RewardInfo.Rarity or 1
      RewardObject.IsShowDetails = true
      RewardObject.UIName = "WalnutSelectToList"
      RewardObject.Count = math.floor(v + 0.5)
      RewardItemWidget:Init(RewardObject)
      RewardItemWidget:SetVisibility(UE4.ESlateVisibility.Visible)
    end
  end
  self.ItemBox:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  self.Panel_Total:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  self.ItemBox_Overflow:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self.Text_Overflow:SetVisibility(UE4.ESlateVisibility.Collapsed)
end

function M:RefreshKeyCount()
  if self.CurSelectStuffContentInList then
    local InitDealWithStuffCount = self.NeedDealWithStuffCount[self.CurSelectStuffContentInList.Uuid]
    local MaxDealWithStuffCount = self.NeedDealWithStuffData[self.CurSelectStuffContentInList.Uuid].Count
    self.Com_NumInput:OverrideValueLimit(InitDealWithStuffCount, MaxDealWithStuffCount, 1, true)
    self.Com_Slider:OverrideValueLimit(InitDealWithStuffCount, MaxDealWithStuffCount, 1, true)
  end
end

function M:ConfirmDealWithItems()
  if self.ConfirmCallback ~= nil then
    self.ConfirmCallback(self.ParentWidget, self.NeedDealWithStuffData, self.NeedDealWithStuffCount)
  end
  if self.ParentWidget then
    if type(self.ParentWidget.SetFocus_Lua) == "function" then
      self.ParentWidget:SetFocus_Lua()
    else
      self.ParentWidget:SetFocus()
    end
  end
end

function M:OnInputStuffNum(NewValue, OldValue)
  if self.CurSelectStuffContentInList == nil then
    return
  end
  local StuffCoinId = self.CurSelectStuffContentInList.CoinId
  if nil ~= self.AllTypeCoinInfo[StuffCoinId] then
    self.AllTypeCoinInfo[StuffCoinId] = math.max(0, self.AllTypeCoinInfo[StuffCoinId] + self.NeedDealWithStuffData[self.CurSelectStuffContentInList.Uuid].Price * (NewValue - OldValue))
  else
    self.AllTypeCoinInfo[StuffCoinId] = math.max(0, self.NeedDealWithStuffData[self.CurSelectStuffContentInList.Uuid].Price * (NewValue - OldValue))
  end
  self:RefreshCoinInfo(StuffCoinId)
  self:OnUpdateCurSelectItemSaleInfo(NewValue, true)
end

function M:SliderChangeCallback(Value)
  if self.CurSelectStuffContentInList == nil then
    return
  end
  local StuffCoinId = self.CurSelectStuffContentInList.CoinId
  if nil ~= self.AllTypeCoinInfo[StuffCoinId] then
    self.AllTypeCoinInfo[StuffCoinId] = self.AllTypeCoinInfo[StuffCoinId] + self.NeedDealWithStuffData[self.CurSelectStuffContentInList.Uuid].Price * (Value - self.NeedDealWithStuffCount[self.CurSelectStuffContentInList.Uuid])
    self.NeedDealWithStuffCount[self.CurSelectStuffContentInList.Uuid] = Value
    self.Com_NumInput.Text_Num:SetText(Value)
    if self.NeedDealWithStuffCount[self.CurSelectStuffContentInList.Uuid] <= 0 then
      self.NeedDealWithStuffCount[self.CurSelectStuffContentInList.Uuid] = 0
      self:RemoveWalnutItemInList(self.CurSelectStuffContentInList.Uuid)
    end
  end
  self:RefreshCoinInfo(StuffCoinId)
  self:OnUpdateCurSelectItemSaleInfo(Value, true)
end

function M:OnClickToMinusStuff()
  if self.CurSelectStuffContentInList == nil then
    return
  end
  local StuffCoinId = self.CurSelectStuffContentInList.CoinId
  if nil ~= self.AllTypeCoinInfo[StuffCoinId] then
    self.AllTypeCoinInfo[StuffCoinId] = self.AllTypeCoinInfo[StuffCoinId] - self.NeedDealWithStuffData[self.CurSelectStuffContentInList.Uuid].Price
    self.NeedDealWithStuffCount[self.CurSelectStuffContentInList.Uuid] = self.NeedDealWithStuffCount[self.CurSelectStuffContentInList.Uuid] - 1
    self.Com_NumInput.Text_Num:SetText(self.NeedDealWithStuffCount[self.CurSelectStuffContentInList.Uuid])
    if self.NeedDealWithStuffCount[self.CurSelectStuffContentInList.Uuid] <= 0 then
      self.NeedDealWithStuffCount[self.CurSelectStuffContentInList.Uuid] = 0
      self:RemoveWalnutItemInList(self.CurSelectStuffContentInList.Uuid)
      self.CurSelectStuffContentInList = nil
      self.CurSelectGridIndex = -1
    end
  end
  local Num = self.NeedDealWithStuffCount[self.CurSelectStuffContentInList.Uuid] or 0
  local StuffId = self.CurSelectStuffContentInList.StuffId or self.CurSelectStuffContentInList.Id
  self:RefreshCoinInfo(StuffCoinId)
  self:OnUpdateCurSelectItemSaleInfo(Num, true)
end

function M:OnClickToAddStuff()
  if self.CurSelectStuffContentInList == nil then
    return
  end
  local StuffCoinId = self.CurSelectStuffContentInList.CoinId
  if nil ~= self.AllTypeCoinInfo[StuffCoinId] then
    self.AllTypeCoinInfo[StuffCoinId] = self.AllTypeCoinInfo[StuffCoinId] + self.NeedDealWithStuffData[self.CurSelectStuffContentInList.Uuid].Price
    self.NeedDealWithStuffCount[self.CurSelectStuffContentInList.Uuid] = self.NeedDealWithStuffCount[self.CurSelectStuffContentInList.Uuid] + 1
    self.Com_NumInput.Text_Num:SetText(self.NeedDealWithStuffCount[self.CurSelectStuffContentInList.Uuid])
  end
  local Num = self.NeedDealWithStuffCount[self.CurSelectStuffContentInList.Uuid] or 0
  local StuffId = self.CurSelectStuffContentInList.StuffId or self.CurSelectStuffContentInList.Id
  self:RefreshCoinInfo(StuffCoinId)
  self:OnUpdateCurSelectItemSaleInfo(Num, true)
end

function M:OnUpdateCurSelectItemSaleInfo(Num, bIsNeedRefreshSliderBar)
  if self.CurSelectStuffContentInList == nil then
    return
  end
  if not self.CurSelectStuffContentInList.Uuid then
    self.CurSelectStuffContentInList.Uuid = tostring(self.CurSelectStuffContentInList.Id)
  end
  self.NeedDealWithStuffCount[self.CurSelectStuffContentInList.Uuid] = Num
  if self.CurSelectStuffContentInList.StateTagInfo and self.CurSelectStuffContentInList.StateTagInfo.ExtraData then
    self.CurSelectStuffContentInList.StateTagInfo.ExtraData[1] = Num
  end
  if self.CurSelectStuffContentInList.SelfWidget then
    self.CurSelectStuffContentInList.SelfWidget:SetSelectNum(Utils.FormatNumber(Num, true))
  end
  self.Com_NumInput:RefreshCurInputNumber(Num)
  if bIsNeedRefreshSliderBar then
    self.Com_Slider:RefreshCurInputNumber(Num)
  end
  if self.ParentWidget then
    self.ParentWidget:RefreshItemInfo(Num, math.tointeger(self.CurSelectStuffContentInList.Uuid))
  end
end

function M:OnListSelectStuffClicked(Content, ClickReason)
  if nil == Content then
    return
  end
  local GridIndex, StuffUuid = Content.GridIndex, Content.Uuid
  if IsValid(self.CurSelectStuffContentInList) and self.CurSelectStuffContentInList.Uuid == StuffUuid then
    self:RefreshKeyCount()
    return
  end
  if IsValid(self.CurSelectStuffContentInList) then
    if self.CurSelectStuffContentInList.SelfWidget then
      self.CurSelectStuffContentInList.SelfWidget:SetSelected(false)
    else
      self.CurSelectStuffContentInList.IsSelect = false
    end
  end
  self.CurSelectStuffContentInList = Content
  self:ClickChooseStuff(GridIndex, StuffUuid)
end

function M:ClickChooseStuff(GridIndex, StuffUuid)
  self.CurSelectGridIndex = GridIndex
  self:RefreshKeyCount()
  if IsValid(self.CurSelectStuffContentInList) then
    if self.CurSelectStuffContentInList.SelfWidget then
      self.CurSelectStuffContentInList.SelfWidget:SetSelected(true)
    else
      self.CurSelectStuffContentInList.IsSelect = true
    end
  end
end

function M:OnKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local IsEventHandled = false
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) then
    IsEventHandled = self:OnGamePadButtonDown(InKeyName)
  elseif InKeyName == UE4.EKeys.Escape.KeyName then
    self:PlayOutAnim()
    IsEventHandled = true
  end
  if IsEventHandled then
    return UE4.UWidgetBlueprintLibrary.Handled()
  else
    return UE4.UWidgetBlueprintLibrary.UnHandled()
  end
end

function M:IsCanChangeToGamePadViewMode()
  if self.CurFocusWidget == "DefaultWidget" then
    return true
  else
    local PlayerController = self:GetOwningPlayer()
    local AllChildren = self.ItemBox:GetAllChildren()
    for i = 1, AllChildren:Length() do
      local Widget = self.ItemBox:GetChildAt(i - 1)
      if Widget:HasUserFocus(PlayerController) then
        return false
      end
    end
    return true
  end
end

function M:OnKeyUp(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local IsEventHandled = false
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) then
    IsEventHandled = self:OnGamePadButtonUp(InKeyName)
  end
  if IsEventHandled then
    return UE4.UWidgetBlueprintLibrary.Handled()
  else
    return UE4.UWidgetBlueprintLibrary.UnHandled()
  end
end

function M:OnGamePadButtonDown(InKeyName)
  local IsEventHandled = false
  if self.CurSelectStuffContentInList then
    IsEventHandled = self.Com_Slider:Handle_KeyDownEventOnGamePad(InKeyName)
    IsEventHandled = IsEventHandled or self.Com_NumInput:Handle_KeyEventOnGamePad(InKeyName)
  end
  if not IsEventHandled then
    if InKeyName == UIConst.GamePadKey.FaceButtonRight then
      DebugPrint("OnGamePadButtonDown   ---  ", self.CurFocusWidget)
      if self.CurFocusWidget == "DefaultWidget" then
        self:PlayOutAnim()
        IsEventHandled = true
      elseif self.CurFocusWidget == "ToSellListView" then
        self.CurFocusWidget = "DefaultWidget"
        self:ClickToOpenStuffList()
        if self.ParentWidget then
          self.ParentWidget:RefreshBottomKeyInfo()
        end
        IsEventHandled = true
      elseif self.CurFocusWidget == "GetItemBox" then
        self.CurFocusWidget = "DefaultWidget"
        self:SetFocus_Lua()
        if self.ParentWidget then
          self.ParentWidget:RefreshBottomKeyInfo()
          self.ParentWidget:UpdateUIStyleInPlatform(true)
        end
        self.Key_Check:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
        IsEventHandled = true
      elseif self.Com_NumInput:CheckIsFocusInTextInput() then
        if self.bIsOpenList then
          self.CurFocusWidget = "ToSellListView"
          self.List_Item:SetFocus()
        else
          self.CurFocusWidget = "DefaultWidget"
          if self.ParentWidget then
            if self.ParentWidget.SetFocus_Lua then
              self.ParentWidget:SetFocus_Lua()
            else
              self.ParentWidget:SetFocus()
            end
          end
        end
        IsEventHandled = true
      else
        self.CurFocusWidget = "DefaultWidget"
        self:UpdateUIStyleInPlatform(true)
        if self.ParentWidget then
          self.ParentWidget:RefreshBottomKeyInfo()
          self.ParentWidget:UpdateUIStyleInPlatform(true)
          if self.ParentWidget.SetFocus_Lua then
            self.ParentWidget:SetFocus_Lua()
          else
            self.ParentWidget:SetFocus()
          end
        end
        IsEventHandled = true
      end
    elseif InKeyName == UIConst.GamePadKey.RightThumb then
      self.CurFocusWidget = "GetItemBox"
      local Widget = self.ItemBox:GetChildAt(0)
      if Widget then
        Widget:SetFocus()
        self:UpdateUIStyleInPlatform(false)
        if self.ParentWidget then
          self.ParentWidget:RefreshBottomKeyInfo("GetItemBox")
          self.ParentWidget:UpdateUIStyleInPlatform(false)
        end
      end
    elseif InKeyName == UIConst.GamePadKey.SpecialRight then
      if self.CurFocusWidget ~= "GetItemBox" and self.CurFocusWidget ~= "NumInputEdit" then
        if self.bIsOpenList then
          self.CurFocusWidget = "DefaultWidget"
        else
          self.CurFocusWidget = "ToSellListView"
        end
        self:ClickToOpenStuffList()
        if self.ParentWidget then
          self.ParentWidget:RefreshBottomKeyInfo(self.CurFocusWidget)
        end
      end
    elseif InKeyName == UIConst.GamePadKey.FaceButtonTop then
      if not self.Com_NumInput:CheckIsFocusInTextInput() then
        self:TryToSaleWalnut()
      end
    elseif InKeyName == UIConst.GamePadKey.FaceButtonLeft and self.CurSelectStuffContentInList and self.CurSelectStuffContentInList.bMinus then
      self:RemoveWalnutItemInList(self.CurSelectStuffContentInList.Uuid)
      if self.CurSelectStuffContentInList then
        self.ParentWidget:RefreshBottomKeyInfo("ToSellListView")
      else
        self.ParentWidget:RefreshBottomKeyInfo()
      end
    end
  end
  return IsEventHandled
end

function M:OnGamePadButtonUp(InKeyName)
  local IsEventHandled = false
  if self.CurSelectStuffContentInList then
    IsEventHandled = self.Com_Slider:Handle_KeyUpEventOnGamePad(InKeyName)
  end
  return IsEventHandled
end

return M
