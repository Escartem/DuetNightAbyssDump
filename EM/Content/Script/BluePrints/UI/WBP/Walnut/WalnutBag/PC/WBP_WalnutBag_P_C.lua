require("UnLua")
local WalnutBagController = require("BluePrints.UI.WBP.Walnut.WalnutBag.WalnutBagController")
local WalnutBagModel = WalnutBagController:GetModel()
local WalnutBagCommon = require("BluePrints.UI.WBP.Walnut.WalnutBag.WalnutBagCommon")
local M = Class({
  "BluePrints.UI.BP_UIState_C",
  "BluePrints.UI.WBP.Walnut.WalnutBag.Base.WalnutBagListBase"
})
M._components = {
  "BluePrints.UI.WBP.Walnut.WalnutBag.Base.WalnutBagBaseView",
  "BluePrints.UI.UI_PC.Common.HorizontalListViewResizeComp",
  "BluePrints.UI.UI_PC.Common.LSFocusComp"
}

function M:Initialize(Initializer)
  self.Super.Initialize(self)
  self.CurTabId = nil
  self.NpcId = WalnutBagCommon.NpcId
  self.AllTabInfo = {}
  self.AllReddotItemsId = {}
  self.CurFocusWidget = nil
  self.BottomKeyInfoList = nil
  self.NeedSelectTabId = nil
  self.NeedSelectItemId = nil
  self.NeedSelectGridIndex = -1
  self.CurSelectGridIndex = 1
  self.CurSelectWalnutContent = nil
  self.BagSellState = false
  self.DesireSaleStuffObjList = {}
  self.CurSelectStuffContent = nil
  self.bIsWalnutSelling = false
end

function M:Construct()
  self.Super.Construct(self)
  self:RefreshBaseInfo()
end

function M:Close()
  local SellPageMainUI = UIManager(self):GetUIObj(WalnutBagCommon.WalnutSelectUIName)
  if nil ~= SellPageMainUI then
    SellPageMainUI:Close()
  end
  WalnutBagModel:ClearReddotCount()
  self:HorizontalListViewResize_TearDown()
  self.CheckBox_Own:UnInitCommonCheckBox()
  self:_StopListFramingInAnim()
  M.Super.Close(self)
end

function M:OnFocusReceived(MyGeometry, InFocusEvent)
  self.Walnut_Detail:ResetInfo()
  self:RefreshBottomKeyInfo()
  return M.Super.OnFocusReceived(self, MyGeometry, InFocusEvent)
end

function M:ReceiveEnterState(StackAction)
  M.Super.ReceiveEnterState(self, StackAction)
  if 1 == StackAction then
    self:RefreshList(true, WalnutBagCommon.AllOptionName.TabClick)
    if self.GameInputModeSubsystem then
      self:OnUpdateUIStyleByInputTypeChange(self.GameInputModeSubsystem:GetCurrentInputType(), self.GameInputModeSubsystem:GetCurrentGamepadName())
    end
  end
  self.AllReddotItemsId = WalnutBagModel:GetAllNewItemsId()
end

function M:ReceiveExitState(StackAction)
  self.Super.ReceiveExitState(self, StackAction)
  if 0 == StackAction then
    local SellPageMainUI = UIManager(self):GetUI(WalnutBagCommon.WalnutSelectUIName)
    if nil ~= SellPageMainUI then
      SellPageMainUI:PlayOutAnim()
    end
  end
end

function M:InitTabInfo()
  self.AllTabInfo = {
    {
      Text = GText("UI_TAB_NAME_ALL"),
      IconPath = "/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_All.T_Tab_All",
      TabId = 1,
      IsNew = not IsEmptyTable(self.AllReddotItemsId)
    }
  }
  for key, BagTabData in pairs(DataMgr.WalnutType) do
    local IsShowNew = false
    if self.AllReddotItemsId[BagTabData.WalnutType] ~= nil then
      IsShowNew = true
    end
    table.insert(self.AllTabInfo, {
      Text = GText(BagTabData.Name),
      IconPath = BagTabData.TabIcon,
      TabId = key + 1,
      IsNew = IsShowNew
    })
  end
  self.BottomKeyInfoList = {
    {
      KeyInfoList = {
        {
          Type = "Text",
          Text = "Esc",
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
      Desc = GText("UI_BACK")
    }
  }
  self.Tab_WalnutBag:Init({
    LeftKey = "Q",
    RightKey = "E",
    Tabs = self.AllTabInfo,
    DynamicNode = {
      "Back",
      "Tip",
      "BottomKey"
    },
    BottomKeyInfo = self.BottomKeyInfoList,
    StyleName = "TextImage",
    OwnerPanel = self,
    TitleName = GText("MAIN_UI_WALNUTBAG"),
    BackCallback = self.OnReturnKeyDown
  })
  self.Tab_WalnutBag:BindEventOnTabSelected(self, self.WalnutTabItemClick)
  self.Btn_Sell:SetGamePadImg("X")
  self:AddDelayFrameFunc(function()
    self.Tab_WalnutBag:SelectTabById(self.NeedSelectTabId or WalnutBagCommon.DefaultSelectTabId)
  end, 1, "FillWithWalnutItemInfo")
end

function M:InitListenEvent()
  self:AddDispatcher(EventID.OnUpdateWalnutItem, self, self.OnUpdateWalnutItemByAction)
end

function M:OnLoaded(...)
  M.Super.OnLoaded(self, ...)
  self.NeedSelectTabId, self.NeedSelectItemId = ...
  self:PlayInAnim()
  self:SwitchToNpcCamera(true)
  self:InitBtnExplanation()
  self.Com_BtnExplanation.Com_KeyImg:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "Menu"}
    }
  })
end

function M:InitBtnExplanation()
  local BtnExplanationConfigData = {}
  BtnExplanationConfigData.ClickCallback = self.OnBtnExplanationClickCallback
  BtnExplanationConfigData.OwnerWidget = self
  BtnExplanationConfigData.PopupId = 100224
  BtnExplanationConfigData.Desc = "UI_Walnut_Gacha_Des"
  self.Com_BtnExplanation:Init(BtnExplanationConfigData)
end

function M:OnBtnExplanationClickCallback()
  print("lgc@ OnBtnExplanationClickCallback")
end

function M:RefreshBottomKeyInfo(FocusTypeName)
  FocusTypeName = FocusTypeName or "DefaultWidget"
  if self.CurFocusWidget == FocusTypeName then
    return
  end
  if "ViewStuff" == FocusTypeName then
    local BottomKeyInfoList = {
      {
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "A",
            Owner = self
          }
        },
        Desc = GText("UI_Controller_CheckDetails")
      },
      {
        KeyInfoList = {
          {
            Type = "Text",
            Text = "Esc",
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
        Desc = GText("UI_BACK")
      }
    }
    self.Tab_WalnutBag:UpdateBottomKeyInfo(BottomKeyInfoList)
  elseif "ViewMethod" == FocusTypeName then
    local BottomKeyInfoList = {
      {
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "A",
            Owner = self
          }
        },
        Desc = GText("UI_Controller_Go")
      },
      {
        KeyInfoList = {
          {
            Type = "Text",
            Text = "Esc",
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
        Desc = GText("UI_BACK")
      }
    }
    self.Tab_WalnutBag:UpdateBottomKeyInfo(BottomKeyInfoList)
  elseif "NotAnyKey" == FocusTypeName then
    local BottomKeyInfoList = {}
    self.Tab_WalnutBag:UpdateBottomKeyInfo(BottomKeyInfoList)
  elseif "WalnutSell" == FocusTypeName then
    local BottomKeyInfoList = {
      {
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "X",
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
        Desc = GText("UI_Tips_Ensure")
      },
      {
        KeyInfoList = {
          {
            Type = "Text",
            Text = "Esc",
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
        Desc = GText("UI_BACK")
      }
    }
    self.Tab_WalnutBag:UpdateBottomKeyInfo(BottomKeyInfoList)
  elseif "SelectWalnutSell" == FocusTypeName then
    local BottomKeyInfoList = {
      {
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "A",
            Owner = self
          }
        },
        Desc = GText("UI_CTL_Add")
      },
      {
        KeyInfoList = {
          {
            Type = "Text",
            Text = "Esc",
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
        Desc = GText("UI_BACK")
      }
    }
    self.Tab_WalnutBag:UpdateBottomKeyInfo(BottomKeyInfoList)
  elseif self.BottomKeyInfoList then
    self.Tab_WalnutBag:UpdateBottomKeyInfo(self.BottomKeyInfoList)
  end
  self.CurFocusWidget = FocusTypeName
end

function M:WalnutTabItemClick(TabWidget)
  local TabId = TabWidget:GetTabId()
  self.CurTabId = TabId
  self.Walnut_Detail:SetVisibility(UE4.ESlateVisibility.Hidden)
  self.ListCanvas:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  self:RefreshList(true, WalnutBagCommon.AllOptionName.TabClick)
  self:HorizontalListViewResize_SetUp(self.Panel_ItemList, self.List_Item, 0)
end

function M:OnUpdateWalnutItemByAction(OpAction, ErrCode, ...)
  if not ErrorCode:Check(ErrCode, UIConst.Tip_CommonToast) then
    return
  end
  if "WalnutBulkSale" == OpAction then
    local SaleItemSucc, SaleItemFail = ...
    local SellCount, IsNeedRefreshAll, bIsIgnore = 0, true, false
    if not bIsIgnore then
      if IsNeedRefreshAll then
        self:ReGenerateBagList()
      else
        self.NeedSelectGridIndex = 0
        self:JumpToSelectItem(false)
        self:RefreshAllGridIndex()
      end
    end
    local AllRewards, bIsNotShowGetItemPage = {}, true
    local ItemKeys = "Resources"
    AllRewards[ItemKeys] = {}
    bIsNotShowGetItemPage = false
    for k, v in pairs(SaleItemSucc) do
      AllRewards[ItemKeys][k] = v
    end
    if not bIsNotShowGetItemPage then
      self:ShowGetItemPage(AllRewards)
    end
  end
  self.bIsWalnutSelling = false
end

function M:IsCanChangeToGamePadViewMode()
  if self.CurFocusWidget == "DefaultWidget" then
    return true
  else
    return not self.Walnut_Detail:IsInGamePadViewMode()
  end
end

function M:UpdateUIStyleInPlatform(IsUseGamePad, CurGamepadName)
  IsUseGamePad = IsUseGamePad and self:IsCanChangeToGamePadViewMode()
  self.Walnut_Detail:UpdateUIStyleInPlatform(IsUseGamePad)
  self.Btn_Goto:UpdateUIStyleInPlatform(IsUseGamePad)
  self.Tab_WalnutBag:UpdateUIStyleInPlatform(IsUseGamePad)
  self.Com_BtnExplanation:UpdateUIStyleInPlatform(IsUseGamePad)
  if IsUseGamePad then
    self.InputBox:ChangeKeyByInputDevice(ECommonInputType.Gamepad)
    self:RefreshOpInfoByInputDeviceForLSComp(ECommonInputType.Gamepad, CurGamepadName)
    self.Btn_Sell.Key_GamePad:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  else
    self.InputBox:ChangeKeyByInputDevice(ECommonInputType.MouseAndKeyboard)
    self:RefreshOpInfoByInputDeviceForLSComp(ECommonInputType.MouseAndKeyboard, CurGamepadName)
    self.Btn_Sell.Key_GamePad:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  if self.BagSellState then
    local SellPageMainUI = UIManager(self):GetUI("WalnutSelectToList")
    if nil ~= SellPageMainUI then
      SellPageMainUI:UpdateUIStyleInPlatform(IsUseGamePad)
    end
  end
end

function M:UpdateFocusInGamepad()
  if self.BagSellState then
    local SellPageMainUI = UIManager(self):GetUI("WalnutSelectToList")
    if nil ~= SellPageMainUI then
      if SellPageMainUI.bIsOpenList then
        SellPageMainUI.List_Item:SetFocus()
      else
        self.List_Item:SetFocus()
      end
    end
  end
end

function M:OnKeyDown(MyGeometry, InKeyEvent)
  local IsEventHandled = false
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) then
    if self.Walnut_Detail:IsVisible() then
      IsEventHandled = self.Walnut_Detail:Handle_KeyDownOnGamePad(InKeyName)
    end
    if not IsEventHandled then
      IsEventHandled = self:OnGamePadButtonDown(InKeyName)
    end
  elseif self.BagSellState then
    IsEventHandled = true
    if "Escape" == InKeyName then
      self:OnReturnKeyDown()
    end
  else
    IsEventHandled = self.Tab_WalnutBag:Handle_KeyEventOnPC(InKeyName)
  end
  if IsEventHandled then
    return UE4.UWidgetBlueprintLibrary.Handled()
  else
    return UE4.UWidgetBlueprintLibrary.UnHandled()
  end
end

function M:OnGamePadButtonDown(InKeyName)
  local IsEventHandled = false
  if InKeyName == UIConst.GamePadKey.FaceButtonLeft then
    IsEventHandled = self:Handle_KeyDownOnGamePad(InKeyName)
  elseif self.BagSellState then
    local SellPageMainUI = UIManager(self):GetUI("WalnutSelectToList")
    if nil ~= SellPageMainUI then
      IsEventHandled = SellPageMainUI:OnGamePadButtonDown(InKeyName)
    end
  else
    IsEventHandled = self:Handle_KeyDownOnGamePad(InKeyName)
  end
  IsEventHandled = IsEventHandled or self.Tab_WalnutBag:Handle_KeyEventOnGamePad(InKeyName)
  return IsEventHandled
end

function M:Handle_KeyDownOnGamePad(InKeyName)
  if InKeyName == UIConst.GamePadKey.FaceButtonLeft then
    if self.BagSellState then
      if self.HoverItem then
        self:OnHoverItemKeyPressed()
      end
    else
      self:OnSellButtonClicked()
    end
    return true
  elseif InKeyName == UIConst.GamePadKey.RightThumb then
    self:RefreshBottomKeyInfo()
    self.InputBox:SetText("")
    return true
  elseif InKeyName == UIConst.GamePadKey.FaceButtonTop then
    self:RefreshBottomKeyInfo()
    self.Btn_Goto:OnGoToButtonClicked()
    return true
  elseif InKeyName == UIConst.GamePadKey.SpecialRight then
    self.Com_BtnExplanation:OnBtnClick()
    return true
  elseif InKeyName == UIConst.GamePadKey.LeftThumb then
    self:RefreshBottomKeyInfo()
    self.InputBox:SetFocus()
    return true
  end
  return false
end

function M:OnKeyUp(MyGeometry, InKeyEvent)
  local IsEventHandled = false
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  IsEventHandled = self:OnGamePadButtonUp(InKeyName)
  if IsEventHandled then
    return UE4.UWidgetBlueprintLibrary.Handled()
  end
  self:OnKeyDownForLSComp(MyGeometry, InKeyEvent)
  return M.Super.OnKeyUp(self, MyGeometry, InKeyEvent)
end

function M:OnGamePadButtonUp(InKeyName)
  local IsEventHandled = false
  if self.BagSellState then
    local SellPageMainUI = UIManager(self):GetUI("WalnutSelectToList")
    if nil ~= SellPageMainUI then
      IsEventHandled = SellPageMainUI:OnGamePadButtonUp(InKeyName)
    end
  end
  return IsEventHandled
end

function M:OnReturnKeyDown()
  if self.bIsWalnutSelling then
    return
  end
  local SellPageMainUI = UIManager(self):GetUI("WalnutSelectToList")
  if nil ~= SellPageMainUI then
    SellPageMainUI:PlayOutAnim()
    return
  end
  local CommonDialog = UIManager(self):GetUIObj("CommonDialog")
  if nil ~= CommonDialog then
    CommonDialog:Close()
    return
  end
  if self:CheckIsCanCloseSelf() then
    self:PlayOutAnim()
  end
end

function M:EnterWalnutSellState()
  if self.bIsWalnutSelling then
    return
  end
  self.Tab_WalnutBag:EnterViewSingleMode()
  self:RefreshList(true, "ShowHaveWalnutOnly")
  self.DesireSaleWalnutObjList = {}
  self.BagSellState = true
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  local UIManager = GameInstance:GetGameUIManager()
  if nil ~= UIManager then
    local SelectWalnutDatas
    if self.CurSelectContent then
      if self:CheckIsCanAddToSaleList(self.CurSelectContent, false) then
        local WalnutUuid = self.CurSelectContent.Id
        local WalnutServerData = self:GetWalnutServerData(WalnutUuid)
        local WalnutStateTagInfo = {
          Name = "IsToChoose",
          ExtraData = {
            1,
            WalnutServerData.StuffCount,
            WalnutServerData.Price,
            WalnutServerData.CoinId
          }
        }
        self.CurSelectContent.StateTagInfo = WalnutStateTagInfo
        if self.CurSelectContent.SelfWidget then
          self.CurSelectContent.SelfWidget:SetStuffStyleByStateTag(self.CurSelectContent)
        end
        self.DesireSaleStuffObjList[WalnutUuid] = self.CurSelectContent
      elseif self.CurSelectContent.SelfWidget then
        self.CurSelectContent.SelfWidget:SetSelected(false)
      else
        self.CurSelectContent.IsSelect = false
      end
    end
    if self:IsAnimationPlaying(self.Sell_Close) then
      self:StopAnimation(self.Sell_Close)
    end
    self:PlayAnimation(self.Sell)
    UIManager:LoadUI(UIConst.WALNUTBAGSALESELECT, WalnutBagCommon.WalnutSelectUIName, WalnutBagCommon.WalnutBagSellPageZOrder, self, self.LeaveWalnutSellState, self.RemoveItemSaleState, self.RealToSaleWalnuts)
  end
  self:UpdateAllItemsStyle(false)
end

function M:LeaveWalnutSellState()
  self.Tab_WalnutBag:LeaveViewSingleMode()
  self:RefreshList(true, WalnutBagCommon.AllOptionName.TabClick)
  self.BagSellState = false
  local tempList = self.DesireSaleStuffObjList
  local Length = self.List_Item:GetNumItems()
  for i = 0, Length - 1 do
    local Item = self.List_Item:GetItemAt(i)
    if Item.SelfWidget then
      Item.SelfWidget:SetSelectNum()
    end
  end
  self:SetFocus_Lua()
  if self:IsAnimationPlaying(self.Sell) then
    self:StopAnimation(self.Sell)
  end
  self:PlayAnimation(self.Sell_Close)
end

function M:RemoveWalnutSaleState()
end

function M:RealToSaleWalnuts(AllStuffContentList, AllStuffSellInfo)
  local PlayerAvatar = GWorld:GetAvatar()
  local WalnutList = {}
  local WalnutId
  for k, v in pairs(AllStuffContentList) do
    WalnutId = math.tointeger(v.Uuid)
    WalnutList[WalnutId] = AllStuffSellInfo[k]
  end
  if not IsEmptyTable(WalnutList) then
    PlayerAvatar:WalnutBulkSale(WalnutList)
  end
  local SellPageMainUI = UIManager(self):GetUI(WalnutBagCommon.WalnutSelectUIName)
  if nil ~= SellPageMainUI then
    SellPageMainUI:PlayOutAnim()
  end
  self.bIsWalnutSelling = true
end

function M:GetWalnutServerData(WalnutId)
  local PlayerAvatar = GWorld:GetAvatar()
  local StuffServerData = {}
  if nil == PlayerAvatar then
    return
  end
  StuffServerData.Id = WalnutId
  StuffServerData.Count = PlayerAvatar.Walnuts:GetCount(WalnutId) or 0
  return StuffServerData
end

function M:OnHoverItemKeyPressed()
  if self.HoverItem then
    EventManager:FireEvent(EventID.OnRemoveWalnutItemInList, self.HoverItem.Uuid)
    self:RefreshBottomKeyInfo("SelectWalnutSell")
  end
end

function M:ShowGetItemPage(AllRewards)
  if self.GameInputModeSubsystem:GetCurrentInputType() == ECommonInputType.Gamepad then
    self:AddTimer(0.1, function()
      UIUtils.ShowGetItemPageAndOpenBagIfNeeded(nil, nil, nil, AllRewards, false, nil, self, true)
    end)
  else
    UIUtils.ShowGetItemPageAndOpenBagIfNeeded(nil, nil, nil, AllRewards, false, nil, self, true)
  end
end

AssembleComponents(M)
return M
