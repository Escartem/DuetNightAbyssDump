require("UnLua")
local MiscUtils = require("Utils.MiscUtils")
local EMCache = require("EMCache.EMCache")
local M = Class("BluePrints.UI.Shop.WBP_Shop_Base_New_C")
M._components = {
  "BluePrints.UI.UI_PC.Common.HorizontalListViewResizeComp",
  "BluePrints.UI.UI_PC.Common.LSFocusComp"
}

function M:Initialize(Initializer)
  self.Super.Initialize(self)
end

function M:OnLoaded(...)
  M.Super.OnLoaded(self)
  if not EMCache:Get("ShopUnlockTime", true) then
    EMCache:Set("ShopUnlockTime", TimeUtils.NowTime(), true)
  end
  self.bIsFocusable = true
  self.Filters = {
    "UI_Select_Default",
    "UI_Select_Time",
    "UI_RARITY_NAME",
    "UI_PRICE_NAME"
  }
  self.MainTabMap = {}
  self.SubTabMap = {}
  self.bFilterOwned = false
  self:PlayAnimationReverse(self.Filtrate_Normal)
  self.Text_CountdownTime:SetVisibility(ESlateVisibility.Collapsed)
  local MainTabIdx, SubTabIdx, ShopItemId, ShopSystemName, CloseCallBack, ClsoeCallBackObj = ...
  self.CloseCallBack = CloseCallBack
  self.ClsoeCallBackObj = ClsoeCallBackObj
  self.SelectShopItemId = ShopItemId
  self.List_Item:SetVisibility(ESlateVisibility.Visible)
  if ShopSystemName then
    local ShopBGM = DataMgr.Shop[ShopSystemName].PlaySystemUIBGM
    if ShopBGM then
      AudioManager(self):PlaySystemUIBGM(ShopBGM, nil, ShopSystemName)
    end
  end
  self:InitShop(MainTabIdx, SubTabIdx, ShopItemId, ShopSystemName)
  self._OriginVisibilityMap = self._OriginVisibilityMap or {}
  if "Shop" == self.ShopType and (170 == MainTabIdx or nil == MainTabIdx) then
    self:InitVideoPlayer()
    self:PlayVideoTOP()
  end
  if GWorld.GameInstance then
    GWorld.GameInstance:SetHighFrequencyMemoryCheckGCEnabled(true, "ShopMain")
  end
end

function M:ReceiveEnterState(StackAction)
  M.Super.ReceiveEnterState(self, StackAction)
  if 1 == StackAction and self:IsInVideoPage() then
    self:PlayVideoBG(false)
  end
  if self.ShopType then
    local ShopBGM = DataMgr.Shop[self.ShopType].PlaySystemUIBGM
    if ShopBGM then
      AudioManager(self):PlaySystemUIBGM(ShopBGM, nil, self.ShopType)
    end
  end
end

function M:ReceiveExitState(StackAction)
  M.Super.ReceiveExitState(self, StackAction)
end

function M:Construct()
  M.Super.Construct(self)
  self.List_Item.OnCreateEmptyContent:Bind(self, function(self)
    local Content = NewObject(self.ShopItemContentClass)
    Content.ShopId = nil
    return Content
  end)
  self.List_Jump.OnCreateEmptyContent:Bind(self, function(self)
    local Content = UIManager(self):_CreateWidgetNew("JumpShopItem")
    Content.JumpShopData = nil
    return Content
  end)
  self.Text_BottomTabTips:SetText(GText("UI_Banner_Reminder"))
  if UE.AHotUpdateGameMode.IsGlobalPak() then
    self.Text_BottomTabTips:SetVisibility(ESlateVisibility.Collapsed)
  else
    self.Text_BottomTabTips:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  end
  self.CheckBox_Own:BindEventOnClicked({
    Inst = self,
    Func = self.OnClickFilterOwned
  })
  self.Text_ShopItemEmpty:SetText(GText("UI_SHOP_SOLDOUT"))
  self.Text_None:SetText(GText("UI_SHOP_NOTOWNED"))
  self.ShopTab:BindEventOnTabSelected(self, self.OnMainTabChanged)
  if self.Common_Tab.WBP_Com_Tab_ResourceBar then
    self.Common_Tab.WBP_Com_Tab_ResourceBar:SetLastFocusWidget(self.List_Item)
  end
  self.List_Recommend.OnListViewScrolled:Add(self, self.OnUserScrolled)
  self:AddDispatcher(EventID.OnRechargeFinished, self, self.OnRechargeFinished)
  self:AddDispatcher(EventID.RefreshShop, self, self.RefreshShop)
  if self.Btn_Hide and self.Btn_Hide.Btn_Area then
    self.Btn_Hide.Btn_Area.OnClicked:Add(self, self.HideUIExceptVideoCallBack)
  end
  if self.Btn_Hide then
    self.Btn_Hide:SetVisibility(ESlateVisibility.Collapsed)
    if self.Btn_Hide.Panel_Name then
      self.Btn_Hide.Panel_Name:SetVisibility(ESlateVisibility.Collapsed)
    end
  end
end

function M:RefreshShop()
  if not self.bNeedRefreshShop then
    self.bNeedRefreshShop = true
    self:AddTimer(1, function()
      self:RefreshSubTabData(self.CurSubTabMap)
      self.bNeedRefreshShop = false
    end, false, 0, "RefreshShop", true)
  end
end

function M:InitShopTabInfo(MainTabIdx, SubTabIdx)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  local MainShopTabData = DataMgr.Shop[self.ShopType]
  assert(MainShopTabData, "\232\142\183\229\143\150\229\149\134\229\186\151\231\177\187\229\158\139\228\191\161\230\129\175\229\164\177\232\180\165:" .. self.ShopType)
  self:LoadShopTabInfo(MainShopTabData)
  self.Common_Tab:Init({
    DynamicNode = {
      "Back",
      "ResourceBar",
      "BottomKey"
    },
    BottomKeyInfo = {
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
            ClickCallback = self.CloseSelf,
            Owner = self
          }
        },
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "B",
            ClickCallback = self.CloseSelf,
            Owner = self
          }
        },
        Desc = GText("UI_BACK")
      }
    },
    StyleName = "Text",
    TitleName = GText(MainShopTabData.ShopName),
    OverridenTopResouces = self.OverridenTopResouces,
    OwnerPanel = self,
    BackCallback = self.CloseSelf
  })
  self.ShopTab:Init({
    LeftKey = "Q",
    RightKey = "E",
    Tabs = self.MainTabList,
    ChildWidgetBPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Tab/PC/WBP_Com_TabItem01_P.WBP_Com_TabItem01_P'"
  })
  if not MainTabIdx then
    self.ShopTab:SelectTab(1)
  else
    self.ShopTab:SelectTab(self.MainTabs[MainTabIdx])
    if self.Common_Toggle_TabGroup_PC then
      self.Common_Toggle_TabGroup_PC:SelectTab(self.SubTabMapIdx[SubTabIdx])
    end
  end
  if #self.MainTabList <= 1 then
    self.Group_Tab:SetVisibility(ESlateVisibility.Collapsed)
  else
    self.Group_Tab:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  end
  self:AddLSFocusTarget(nil, {
    self.Common_SortList_PC
  })
  self:AddLSFocusTarget(self.CheckBox_Own.Com_KeyImg, self.CheckBox_Own, "X", true)
  self:AddTabReddotListen()
end

function M:AddTabReddotListen()
  for _, MainTabId in pairs(DataMgr.Shop[self.ShopType].MainTabId) do
    local Data = DataMgr.ShopItem2ShopTab[MainTabId]
    if Data then
      for SubTabId, ShopItems in pairs(Data) do
        local ReddotName = DataMgr.ShopTabSub[SubTabId].ReddotNode
        if ReddotName then
          ReddotManager.AddListenerEx(ReddotName, self, function(self, Count, RdType, RdName)
            if Count > 0 then
              if RdType == EReddotType.Normal then
                self.Common_Toggle_TabGroup_PC:ShowTabRedDotByTabId(SubTabId, false, true, false)
              elseif RdType == EReddotType.New then
                self.Common_Toggle_TabGroup_PC:ShowTabRedDotByTabId(SubTabId, true, false, false)
              end
            else
              self.Common_Toggle_TabGroup_PC:ShowTabRedDotByTabId(SubTabId, false, false, false)
            end
          end)
        end
      end
      local ReddotName = DataMgr.ShopTabMain[MainTabId].ReddotNode
      if ReddotName then
        ReddotManager.AddListenerEx(ReddotName, self, function(self, Count, RdType, RdName)
          if Count > 0 then
            if RdType == EReddotType.Normal then
              self.ShopTab:ShowTabRedDotByTabId(MainTabId, false, true, false)
            elseif RdType == EReddotType.New then
              self.ShopTab:ShowTabRedDotByTabId(MainTabId, true, false, false)
            end
          else
            self.ShopTab:ShowTabRedDotByTabId(MainTabId, false, false, false)
          end
        end)
      end
    end
  end
end

function M:_ShowSubTabReddot(SubTabList)
  for _, SubTab in ipairs(SubTabList) do
    local SubTabId = SubTab.TabId
    local ReddotName = DataMgr.ShopTabSub[SubTabId].ReddotNode
    local Node = ReddotManager.GetTreeNode(ReddotName)
    if Node and Node.Count > 0 then
      local RdType = Node.ReddotType
      if RdType == EReddotType.Normal then
        self.Common_Toggle_TabGroup_PC:ShowTabRedDotByTabId(SubTabId, false, true, false)
      elseif RdType == EReddotType.New then
        self.Common_Toggle_TabGroup_PC:ShowTabRedDotByTabId(SubTabId, true, false, false)
      end
    else
      self.Common_Toggle_TabGroup_PC:ShowTabRedDotByTabId(SubTabId, false, false, false)
    end
  end
end

function M:RemoveTabReddotListen()
  for _, MainTabId in pairs(DataMgr.Shop[self.ShopType].MainTabId) do
    local Data = DataMgr.ShopItem2ShopTab[MainTabId]
    if Data then
      for SubTabId, ShopItems in pairs(Data) do
        local ReddotName = DataMgr.ShopTabSub[SubTabId].ReddotNode
        if ReddotName then
          ReddotManager.RemoveListener(ReddotName, self)
        end
      end
      local ReddotName = DataMgr.ShopTabMain[MainTabId].ReddotNode
      if ReddotName then
        ReddotManager.RemoveListener(ReddotName, self)
      end
    end
  end
end

function M:OnMainTabChanged(TabWidget)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  local MainTabId = self.MainTabMap[TabWidget.Idx]
  if not MainTabId then
    return
  end
  self:LoadMainTabInfo(MainTabId)
  if self.Common_Toggle_TabGroup_PC then
    self.Common_Toggle_TabGroup_PC:Init({
      LeftKey = "A",
      RightKey = "D",
      Tabs = self.SubTabList,
      ChildWidgetName = "TabSubItem6"
    })
    self.Common_Toggle_TabGroup_PC:BindEventOnTabSelected(self, self.OnSubTabChanged)
    if #self.SubTabList <= 1 then
      self.bShowSubTab = true
      self.Tab:SetVisibility(ESlateVisibility.Collapsed)
    else
      self.bShowSubTab = false
      self.Tab:SetVisibility(ESlateVisibility.Visible)
    end
    self.Common_Toggle_TabGroup_PC:SelectTab(1)
  end
  self:_ShowSubTabReddot(self.SubTabList)
end

function M:OnSubTabChanged(TabWidget)
  local SubTabData = self.SubTabMap[TabWidget.Idx]
  if not SubTabData then
    return
  end
  self:ClearSubTabReddot()
  self:RefreshSubTabData(SubTabData)
end

function M:ClearSubTabReddot()
  if not self.CurSubTabMap then
    return
  end
  local NodeName = self.CurSubTabMap.ReddotNode
  if NodeName then
    ReddotManager.ClearLeafNodeCount(NodeName, false, {bAll = 1})
  end
end

function M:RefreshSubTabData(SubTabData)
  self.TabType = SubTabData.TabType
  self.IsBannerPage = false
  self.IsJumpShopPage = false
  self:LoadSubTabInfo(SubTabData)
  self:SetIsDealWithVirtualAccept(false)
  self.Group_Recharge:SetVisibility(ESlateVisibility.Collapsed)
  self.Group_MonthCard:SetVisibility(ESlateVisibility.Collapsed)
  self.Group_PayGift:SetVisibility(ESlateVisibility.Collapsed)
  self.Group_Empty:SetVisibility(ESlateVisibility.Collapsed)
  self.List_Jump:SetVisibility(ESlateVisibility.Collapsed)
  self.Group_Recommend:SetVisibility(ESlateVisibility.Collapsed)
  self.Group_Item:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  self.Group_Bottom:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  self.Group_RecommendAnchor:SetVisibility(ESlateVisibility.Collapsed)
  if self.Common_Tab and self.Common_Tab.WBP_Com_Tab_ResourceBar then
    self.Common_Tab.WBP_Com_Tab_ResourceBar:SetLastFocusWidget(self.List_Item)
  end
  if SubTabData.TabType == "Banner" then
    self:PlayAnimationReverse(self.Change)
  else
    self:PlayAnimation(self.Change)
  end
  if self.ShopType == "Shop" and SubTabData.TabType ~= "Banner" then
    self:RemoveVideoBG()
  end
  if SubTabData.TabType == "Pay" then
    self.Group_Bottom:SetVisibility(ESlateVisibility.Collapsed)
    self:InitRechargePage(SubTabData)
    return
  end
  if SubTabData.TabType == "Card" then
    self.Group_Bottom:SetVisibility(ESlateVisibility.Collapsed)
    self:InitMonthCardPage(SubTabData)
    return
  end
  if SubTabData.TabType == "Banner" then
    self.Group_Bottom:SetVisibility(ESlateVisibility.Collapsed)
    self.Group_Item:SetVisibility(ESlateVisibility.Collapsed)
    if self.BannerIdMap then
      for index, Item in pairs(self.BannerIdMap) do
        Item:SetVisibility(ESlateVisibility.Collapsed)
      end
    end
    if self.Common_Tab and self.Common_Tab.WBP_Com_Tab_ResourceBar then
      self.Common_Tab.WBP_Com_Tab_ResourceBar:SetLastFocusWidget(self.List_Recommend)
    end
    self.IsBannerPage = true
    self:SetIsDealWithVirtualAccept(true)
    self:InitBannerPage()
    return
  end
  if SubTabData.TabType == "Complex" then
    self.Group_Bottom:SetVisibility(ESlateVisibility.Collapsed)
    self.IsJumpShopPage = true
    self:InitJumpShopPage()
    return
  end
  self.Group_Bottom:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  self.VB_ItemList:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  self:UpdateShopDetail(self.CurSubTabMap)
end

function M:CommonInitPage(OverlayWidget, WidgetName)
  self.VB_ItemList:SetVisibility(ESlateVisibility.Collapsed)
  self.Group_Bottom:SetVisibility(ESlateVisibility.Collapsed)
  OverlayWidget:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  local Widget = OverlayWidget:GetChildAt(0)
  if not Widget then
    Widget = UIManager(self):_CreateWidgetNew(WidgetName)
    OverlayWidget:AddChildToOverlay(Widget)
  end
  if Widget.Image_NotabSign then
    if self.bShowSubTab then
      Widget.Image_NotabSign:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    else
      Widget.Image_NotabSign:SetVisibility(ESlateVisibility.Collapsed)
    end
  end
  Widget:PlayAnimation(Widget.In)
  local Slot = UE4.UWidgetLayoutLibrary.SlotAsOverlaySlot(Widget)
  Slot:SetHorizontalAlignment(EHorizontalAlignment.HAlign_Fill)
  Slot:SetVerticalAlignment(EVerticalAlignment.VAlign_Fill)
  return Widget
end

function M:InitPayGiftPage(ShopItemsData)
  local Widget = self:CommonInitPage(self.Group_PayGift, "PayGiftPage")
  if self.Common_Tab and self.Common_Tab.WBP_Com_Tab_ResourceBar then
    self.Common_Tab.WBP_Com_Tab_ResourceBar:SetLastFocusWidget(Widget)
  end
  local GameInputModeSubsystem = UIManager(self):GetGameInputModeSubsystem(self)
  if 0 == #ShopItemsData then
    GameInputModeSubsystem:SetNavigateWidgetVisibility(false)
    self.Group_PayGift:SetVisibility(ESlateVisibility.Collapsed)
    self.Group_Empty:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self.Group_Bottom:SetVisibility(ESlateVisibility.Collapsed)
  else
    self.Group_Bottom:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self.Group_Empty:SetVisibility(ESlateVisibility.Collapsed)
  end
  Widget:InitPayGiftInfo(ShopItemsData)
end

function M:InitRechargePage(SubTabData)
  local Widget = self:CommonInitPage(self.Group_Recharge, "ShopRechargePage")
  if self.Common_Tab and self.Common_Tab.WBP_Com_Tab_ResourceBar then
    self.Common_Tab.WBP_Com_Tab_ResourceBar:SetLastFocusWidget(Widget)
  end
  local RechargeContent = {}
  for _, ShopData in pairs(DataMgr.ShopItem) do
    if ShopData.SubTabId == SubTabData.SubTabId then
      table.insert(RechargeContent, ShopData)
    end
  end
  table.sort(RechargeContent, function(a, b)
    return a.ItemId < b.ItemId
  end)
  local GameInputModeSubsystem = UIManager(self):GetGameInputModeSubsystem(self)
  if 0 == #RechargeContent then
    GameInputModeSubsystem:SetNavigateWidgetVisibility(false)
    self.Group_Recharge:SetVisibility(ESlateVisibility.Collapsed)
    self.Group_Empty:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  else
    self.Group_Empty:SetVisibility(ESlateVisibility.Collapsed)
  end
  Widget:InitRechargeInfo(RechargeContent)
  if not CommonUtils:IfExistSystemGuideUI(self) or self:HasAnyFocus() or self:HasFocusedDescendants() then
    Widget:SetFocus()
  end
end

function M:OnUserScrolled()
  UIUtils.UpdateListArrow(self.List_Recommend, self.Group_ListTop, self.Group_ListBottom)
end

function M:InitBannerPage(SelectBannerId)
  if not CommonUtils:IfExistSystemGuideUI(self) then
    self.List_Recommend:BP_ClearSelection()
    self.List_Recommend:SetFocus()
  end
  self.BannerList = ShopUtils:GetBannerInfo()
  self.VB_ItemList:SetVisibility(ESlateVisibility.Collapsed)
  self.Group_Recommend:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  self.Group_RecommendAnchor:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  local Path
  if CommonUtils.GetDeviceTypeByPlatformName(self) == "Mobile" then
    Path = CommonConst.ShopBannerMobilePath
  else
    Path = CommonConst.ShopBannerPCPath
  end
  self.BannerIdMap = {}
  local BannerData = ShopUtils:GetBannerInfo()
  self.SelectBannerId = SelectBannerId
  if not self.SelectBannerId then
    self.SelectBannerId = self.LastSelectBannerId
  end
  self.List_Recommend:ClearListItems()
  if not self.SelectBannerId then
    assert(BannerData[1], "\230\156\137\230\149\136Banner\230\149\176\233\135\143\228\184\141\232\182\179\228\184\128\228\184\170")
    self.SelectBannerId = BannerData[1].Id
  end
  for i, BannerInfo in ipairs(BannerData) do
    local Content = NewObject(UIUtils.GetCommonItemContentClass())
    Content.BannerId = BannerInfo.Id
    Content.ClickEvent = {
      Obj = self,
      Callback = self.OnBannerItemClick
    }
    Content.VirtualClickCallback = self.HandleVirtualClickInGamePad
    Content.OnKeyDownCallBack = self.HandleOnKeyDownCallBack
    Content.SetListItemCallBack = self.HandleSetListItemCallBack
    Content.Parent = self
    self.List_Recommend:AddItem(Content)
    if self.SelectBannerId == BannerInfo.Id then
      Content.bSelected = true
    else
      Content.bSelected = false
    end
    if self.SelectBannerId == BannerInfo.Id and not self.BannerIdMap[BannerInfo.Id] then
      local BannerBPPath = Path .. BannerInfo.Bp
      local BannerPageWidget = UIManager(self):CreateWidget(BannerBPPath)
      if BannerPageWidget then
        self.BannerIdMap[BannerInfo.Id] = BannerPageWidget
        self.BannerIdMap[BannerInfo.Id]:SetVisibility(ESlateVisibility.Collapsed)
        self.Group_RecommendAnchor:AddChild(self.BannerIdMap[BannerInfo.Id])
        local Slot = UE4.UWidgetLayoutLibrary.SlotAsOverlaySlot(self.BannerIdMap[BannerInfo.Id])
        Slot:SetHorizontalAlignment(EHorizontalAlignment.HAlign_Fill)
        Slot:SetVerticalAlignment(EVerticalAlignment.VAlign_Fill)
      end
    end
  end
  self.BannerBpMap = {}
  self.BannerBpMap[DataMgr.ShopBannerTab[self.SelectBannerId].Bp] = self.BannerIdMap[self.SelectBannerId]
  self:OnBannerItemClick(self.SelectBannerId, nil, nil)
  self:AddTimer(0.5, function()
    self:OnUserScrolled()
  end)
  if self.List_Recommend:GetNumItems() > 0 then
    self.List_Recommend:RequestPlayEntriesAnim()
  end
end

function M:HandleVirtualClickInGamePad(BannerId)
  local GameInputModeSubsystem = UIManager(self):GetGameInputModeSubsystem(self)
  local CurInputDeviceType = GameInputModeSubsystem and GameInputModeSubsystem:GetCurrentInputType() or nil
  if CurInputDeviceType and CurInputDeviceType ~= ECommonInputType.Gamepad then
    return
  end
  if not BannerId then
    return
  end
  local CurrentPage = self.BannerIdMap[BannerId]
  if CurrentPage and CurrentPage.OnGamePadDown then
    CurrentPage:OnGamePadDown(UIConst.GamePadKey.FaceButtonBottom)
  end
end

function M:HandleOnKeyDownCallBack(BannerId, MyGeometry, InKeyEvent)
  if not BannerId then
    return
  end
  local CurrentPage = self.BannerIdMap[BannerId]
  if CurrentPage and CurrentPage.OnKeyDown then
    return CurrentPage:OnKeyDown(MyGeometry, InKeyEvent)
  end
  return UIUtils.UnHandled
end

function M:HandleSetListItemCallBack(BannerId, ListItem)
  if not BannerId then
    return
  end
  local CurrentPage = self.BannerIdMap[BannerId]
  if CurrentPage and CurrentPage.SetListItem then
    CurrentPage:SetListItem(ListItem)
  end
end

function M:OnBannerItemClick(BannerId, Content, bPlaySound)
  if self.ShopType == "Shop" and not self:IsPlayVideoTOP() then
    if 1 == BannerId and not self:IsPlayVideoBG() then
      self:InitVideoPlayer()
      self:PlayVideoBG(false)
    elseif 1 ~= BannerId then
      self:RemoveVideoBG()
    end
  end
  if self.Btn_Hide then
    if 1 == BannerId then
      self.Btn_Hide:SetVisibility(ESlateVisibility.Visible)
    else
      self.Btn_Hide:SetVisibility(ESlateVisibility.Collapsed)
    end
  end
  if self.LastWidgetContent and self.LastWidgetContent.SelfWidget then
    self.LastWidgetContent.SelfWidget:UnSelect()
  end
  self.LastWidgetContent = Content
  self.SelectBannerId = BannerId
  if self.LastSelectBannerId and self.LastSelectBannerId ~= BannerId and self.BannerIdMap[self.LastSelectBannerId] then
    if self.BannerIdMap[self.LastSelectBannerId].PlayAnimationOut then
      self.BannerIdMap[self.LastSelectBannerId]:PlayAnimationOut()
    else
      self.BannerIdMap[self.LastSelectBannerId]:SetVisibility(ESlateVisibility.Collapsed)
    end
  end
  local BannerData = DataMgr.ShopBannerTab[BannerId]
  local Path
  if CommonUtils.GetDeviceTypeByPlatformName(self) == "Mobile" then
    Path = CommonConst.ShopBannerMobilePath
  else
    Path = CommonConst.ShopBannerPCPath
  end
  if not self.BannerIdMap[BannerId] then
    local BannerBPPath = Path .. BannerData.Bp
    local BannerPageWidget = UIManager(self):CreateWidget(BannerBPPath)
    self.BannerIdMap[BannerId] = BannerPageWidget
    self.Group_RecommendAnchor:AddChild(self.BannerIdMap[BannerId])
    local Slot = UE4.UWidgetLayoutLibrary.SlotAsOverlaySlot(self.BannerIdMap[BannerId])
    Slot:SetHorizontalAlignment(EHorizontalAlignment.HAlign_Fill)
    Slot:SetVerticalAlignment(EVerticalAlignment.VAlign_Fill)
  end
  if bPlaySound then
    AudioManager(self):PlayUISound(self, "event:/ui/activity/large_btn_click", nil, nil)
  end
  self.BannerBpMap[DataMgr.ShopBannerTab[BannerId].Bp] = self.BannerIdMap[BannerId]
  if self.BannerIdMap[BannerId].InitBannerPage then
    self.BannerIdMap[BannerId]:InitBannerPage(BannerId, self)
  end
  self.BannerIdMap[BannerId]:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  if self.BannerIdMap[BannerId].PlayAnimationIn then
    self.BannerIdMap[BannerId]:PlayAnimationIn()
  end
  self.LastSelectBannerId = BannerId
  self:UpdateCommonTabInfo()
end

function M:OnBannerExpire()
  if self.IsBannerPage then
    self.ShopTab:SelectTab(self.ShopTab.CurrentTab)
  end
end

function M:InitMonthCardPage(SubTabData)
  self.VB_ItemList:SetVisibility(ESlateVisibility.Collapsed)
  self.Group_MonthCard:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  local Count = self.Group_MonthCard:GetChildrenCount()
  local Widget
  if Count > 0 then
    Widget = self.Group_MonthCard:GetChildAt(0)
  end
  if not IsValid(Widget) then
    self.Group_MonthCard:ClearChildren()
    Widget = UIManager(self):_CreateWidgetNew("MonthCardPage")
    self.Group_MonthCard:AddChild(Widget)
  end
  Widget:InitBannerPage()
  local Slot = UE4.UWidgetLayoutLibrary.SlotAsOverlaySlot(Widget)
  Slot:SetHorizontalAlignment(EHorizontalAlignment.HAlign_Fill)
  Slot:SetVerticalAlignment(EVerticalAlignment.VAlign_Fill)
  if not CommonUtils:IfExistSystemGuideUI(self) then
    Widget:SetFocus()
  end
end

function M:InitJumpShopPage()
  if self.Common_Tab and self.Common_Tab.WBP_Com_Tab_ResourceBar then
    self.Common_Tab.WBP_Com_Tab_ResourceBar:SetLastFocusWidget(self.List_Jump)
  end
  self.VB_ItemList:SetVisibility(ESlateVisibility.Collapsed)
  self.List_Jump:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  local JumpShopList = ShopUtils:GetComplexInfo()
  self.List_Jump:ScrollIndexIntoView(0)
  self.List_Jump:ClearListItems()
  for index, JumpShopInfo in ipairs(JumpShopList) do
    local JumpConfig = DataMgr.InterfaceJump[JumpShopInfo.InterfaceJumpId]
    local PlayerAvatar = GWorld:GetAvatar()
    if ConditionUtils.CheckCondition(PlayerAvatar, JumpConfig.PortalUnlockCondition) then
      local Content = UIManager(self):_CreateWidgetNew("JumpShopItem")
      Content.JumpShopData = JumpShopInfo
      self.List_Jump:AddItem(Content)
    end
  end
  if self.List_Jump:GetNumItems() > 0 then
    self.List_Jump:RequestFillEmptyContent()
    self.List_Jump:RequestPlayEntriesAnim()
    self.List_Jump:SetNavigationRuleBase(EUINavigation.Up, EUINavigationRule.Stop)
    self.List_Jump:SetNavigationRuleBase(EUINavigation.Down, EUINavigationRule.Stop)
    self:AddTimer(0.01, function()
      if not CommonUtils:IfExistSystemGuideUI(self) then
        self.List_Jump:SetFocus()
      end
    end)
  end
end

function M:Close()
  if self.VideoPlayer then
    if self.VideoPlayer:IsPlaying() then
      self.VideoPlayer:Stop()
    end
    if self.VideoPlayer.MediaPlayer and self.OnPlayVideoTOPEnd then
      self.VideoPlayer.MediaPlayer.OnEndReached:Remove(self, self.OnPlayVideoTOPEnd)
    end
    self.VideoPlayer = nil
  end
  self.GameInputModeSubsystem:SetNavigateWidgetOpacity(1)
  if self.CloseCallBack then
    self.CloseCallBack(self.ClsoeCallBackObj)
  end
  self:ClearSubTabReddot()
  self:RemoveTabReddotListen()
  self.Super.Close(self)
end

function M:OnAnimationFinished(InAnimation)
  if InAnimation == self.Out then
    self:BlockAllUIInput(true)
    self:Close()
  elseif InAnimation == self.In then
    self:BlockAllUIInput(false)
    if self.SelectShopItemId then
      self:AddTimer(0.1, function()
        self:ShowItemDetail()
        self.SelectShopItemId = nil
      end, false, 0, "OpenShopItemDialog", true)
    end
  end
end

function M:Destruct()
  local Player = UGameplayStatics.GetPlayerCharacter(self, 0)
  if Player then
    Player:SetCanInteractiveTrigger(true)
  end
  AudioManager(self):StopSystemUIBGM(self.ShopType)
  self:HorizontalListViewResize_TearDown()
  self.Group_RecommendAnchor:ClearChildren()
  self:CleanTimer()
  self.List_Item.OnCreateEmptyContent:Unbind()
  self.List_Jump.OnCreateEmptyContent:Unbind()
  if self.Btn_Hide and self.Btn_Hide.Btn_Area then
    self.Btn_Hide.Btn_Area.OnClicked:Remove(self, self.HideUIExceptVideoCallBack)
  end
  if GWorld.GameInstance then
    GWorld.GameInstance:SetHighFrequencyMemoryCheckGCEnabled(false, "ShopMain")
  end
  self.Super.Destruct(self)
end

function M:OnGamePadSelect(ItemContent, bHover)
  if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad and bHover then
    ItemContent.SelfWidget:OnItemClick(true)
  end
end

function M:OnPreviewKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local IsHandled = false
  if "Gamepad_FaceButton_Bottom" == InKeyName and self.IsBannerPage and self.BannerMap and self.BannerMap[self.CurrentPageIndex] then
    local Banner = self.BannerMap[self.CurrentPageIndex]
    Banner:OnGoToInterface()
    IsHandled = true
  end
  if "SpaceBar" == InKeyName and self.List_Recommend:HasFocusedDescendants() and self.IsBannerPage then
    local BpName = DataMgr.ShopBannerTab[self.SelectBannerId].Bp
    local Banner = self.BannerBpMap[BpName]
    if Banner and Banner.OnGoToInterface then
      Banner:OnGoToInterface()
      IsHandled = true
    end
  end
  if IsHandled then
    return UE4.UWidgetBlueprintLibrary.Handled()
  end
  return UE4.UWidgetBlueprintLibrary.Unhandled()
end

function M:OnGamePadDown(InKeyName)
  local IsEventHandled = false
  if "Gamepad_LeftTrigger" == InKeyName or "Gamepad_RightTrigger" == InKeyName then
    if self.IsBannerPage then
    elseif self.Common_Toggle_TabGroup_PC then
      IsEventHandled = self.Common_Toggle_TabGroup_PC:Handle_KeyEventOnGamePad(InKeyName)
    end
  elseif "Gamepad_FaceButton_Right" == InKeyName then
    if not UIManager(self):GetUIObj("CommonDialog") then
      self:CloseSelf()
    end
    IsEventHandled = true
  elseif "Gamepad_RightShoulder" == InKeyName or "Gamepad_LeftShoulder" == InKeyName then
    IsEventHandled = self.ShopTab:Handle_KeyEventOnGamePad(InKeyName)
  else
    IsEventHandled = self.Common_Tab:Handle_KeyEventOnGamePad(InKeyName)
  end
  return IsEventHandled
end

function M:OnUpdateUIStyleByInputTypeChange(CurInputDevice, CurGamepadName)
  if CurInputDevice == ECommonInputType.Touch then
    return
  end
  if CurInputDevice == ECommonInputType.Gamepad then
    self:InitGamepadView()
  else
    self:InitKeyboardView()
  end
  if self.BannerIdMap then
    for _, Banner in pairs(self.BannerIdMap) do
      if Banner and Banner.RefreshOpInfoByInputDevice then
        Banner:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
      end
    end
  end
  if self.IsJumpShopPage and self.List_Jump then
    if CurInputDevice == ECommonInputType.Gamepad and (self:HasAnyFocus() or self:HasFocusedDescendants()) and not CommonUtils:IfExistSystemGuideUI(self) then
      self.List_Jump:SetFocus()
    end
  elseif self.IsBannerPage and CurInputDevice == ECommonInputType.Gamepad and (self:HasAnyFocus() or self:HasFocusedDescendants()) and not CommonUtils:IfExistSystemGuideUI(self) then
    self.List_Recommend:SetFocus()
  end
end

function M:InitGamepadView()
  self.CheckBox_Own.Com_KeyImg:SetVisibility(ESlateVisibility.Visible)
  self.CheckBox_Own.Com_KeyImg:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "X"}
    }
  })
end

function M:InitKeyboardView()
  self.CheckBox_Own.Com_KeyImg:SetVisibility(ESlateVisibility.Collapsed)
end

function M:OnSpaceBarDown()
  if self.IsBannerPage and self.BannerIdMap and self.SelectBannerId then
    local Banner = self.BannerIdMap[self.SelectBannerId]
    if Banner.OnPCKeyDown then
      Banner:OnPCKeyDown("SpaceBar")
    end
  end
end

function M:UpdateCommonTabInfo()
  if not (self.SelectBannerId and self.Common_Tab) or not self.Common_Tab.UpdateBottomKeyInfo then
    return
  end
  local TargetBannerData = DataMgr.ShopBannerTab[self.SelectBannerId]
  if TargetBannerData and TargetBannerData.Bp and TargetBannerData.Bp == "WBP_Shop_Recommend_WeaponSkin" then
    self.Common_Tab:UpdateBottomKeyInfo({
      {
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "X",
            Owner = self
          }
        },
        Desc = GText("UI_CTL_SkinPreview"),
        bLongPress = false
      },
      {
        KeyInfoList = {
          {
            Type = "Text",
            Text = "SpaceBar",
            ClickCallback = self.OnSpaceBarDown,
            Owner = self
          }
        },
        Desc = GText("UI_SHOP_PURCHASE"),
        bLongPress = false
      },
      {
        KeyInfoList = {
          {
            Type = "Text",
            Text = "Esc",
            ClickCallback = self.CloseSelf,
            Owner = self
          }
        },
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "B",
            ClickCallback = self.CloseSelf,
            Owner = self
          }
        },
        Desc = GText("UI_BACK")
      }
    })
  elseif TargetBannerData and TargetBannerData.Bp and TargetBannerData.Bp == "WBP_Shop_Recommend_Gift4_1" then
    self.Common_Tab:UpdateBottomKeyInfo({
      {
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "X",
            Owner = self
          }
        },
        Desc = GText("UI_CTL_SkinPreview"),
        bLongPress = false
      },
      {
        KeyInfoList = {
          {
            Type = "Text",
            Text = "SpaceBar",
            Owner = self.BannerBpMap[TargetBannerData.Bp],
            ClickCallback = self.BannerBpMap[TargetBannerData.Bp].OnGoToInterface
          }
        },
        Desc = GText("UI_SHOP_PURCHASE"),
        bLongPress = false
      },
      {
        KeyInfoList = {
          {
            Type = "Text",
            Text = "Esc",
            ClickCallback = self.CloseSelf,
            Owner = self
          }
        },
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "B",
            Owner = self
          }
        },
        Desc = GText("UI_BACK")
      }
    })
  elseif TargetBannerData and TargetBannerData.Bp and TargetBannerData.Bp == "WBP_Shop_Recommend_AvatarSkin" then
    self.Common_Tab:UpdateBottomKeyInfo({
      {
        KeyInfoList = {
          {
            Type = "Text",
            Text = "Tab",
            Owner = self,
            ClickCallback = self.HideUIExceptVideoCallBack
          }
        },
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "LS",
            Owner = self
          }
        },
        Desc = GText("UI_Dye_HideUI"),
        bLongPress = false
      },
      {
        KeyInfoList = {
          {
            Type = "Text",
            Text = "SpaceBar",
            Owner = self,
            ClickCallback = self.OnSpaceBarDown
          }
        },
        Desc = GText("UI_Banner_SkinGacha_Goto"),
        bLongPress = false
      },
      {
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "X",
            Owner = self
          }
        },
        Desc = GText("UI_CTL_SkinPreview"),
        bLongPress = false
      },
      {
        KeyInfoList = {
          {
            Type = "Text",
            Text = "Escape",
            ClickCallback = self.CloseSelf,
            Owner = self
          }
        },
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "B",
            Owner = self
          }
        },
        Desc = GText("UI_BACK"),
        bLongPress = false
      }
    })
  elseif TargetBannerData and TargetBannerData.Bp and TargetBannerData.Bp == "WBP_Shop_Banner_MonthCard" then
    self.Common_Tab:UpdateBottomKeyInfo({
      {
        KeyInfoList = {
          {
            Type = "Text",
            Text = "SpaceBar",
            Owner = self,
            ClickCallback = self.OnSpaceBarDown
          }
        },
        Desc = GText("UI_SHOP_PURCHASE"),
        bLongPress = false
      },
      {
        KeyInfoList = {
          {
            Type = "Text",
            Text = "Escape",
            ClickCallback = self.CloseSelf,
            Owner = self
          }
        },
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "B",
            Owner = self
          }
        },
        Desc = GText("UI_BACK"),
        bLongPress = false
      }
    })
  else
    self.Common_Tab:UpdateBottomKeyInfo({
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
            ClickCallback = self.CloseSelf,
            Owner = self
          }
        },
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "B",
            ClickCallback = self.CloseSelf,
            Owner = self
          }
        },
        Desc = GText("UI_BACK")
      }
    })
  end
end

function M:UpdateCommonTabInfoByReward()
  if not self.SelectBannerId then
    return
  end
  local TargetBannerData = DataMgr.ShopBannerTab[self.SelectBannerId]
  if TargetBannerData and TargetBannerData.Bp and TargetBannerData.Bp == "WBP_Shop_Recommend_Gift4_1" then
    self.Common_Tab:UpdateBottomKeyInfo({
      {
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "A",
            Owner = self
          }
        },
        Desc = GText("UI_Controller_Check"),
        bLongPress = false
      },
      {
        KeyInfoList = {
          {
            Type = "Text",
            Text = "Esc",
            ClickCallback = self.CloseSelf,
            Owner = self
          }
        },
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "B",
            ClickCallback = self.CloseSelf,
            Owner = self
          }
        },
        Desc = GText("UI_BACK")
      }
    })
  end
end

function M:IsInVideoPage()
  return self.ShopType == "Shop" and self.TabType == "Banner" and 1 == self.SelectBannerId
end

function M:OnKeyDown(MyGeometry, InKeyEvent)
  if self:IsPlayVideoTOP() then
    self:PlayVideoBG(true)
    return UWidgetBlueprintLibrary.Handled()
  end
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if self:IsInVideoPage() and ("Tab" == InKeyName or InKeyName == Const.GamepadLeftThumbstick) then
    self:HideUIExceptVideoCallBack()
    return UWidgetBlueprintLibrary.Handled()
  end
  return M.Super.OnKeyDown(self, MyGeometry, InKeyEvent)
end

function M:OnMouseButtonDown(MyGeometry, MouseEvent)
  if self:IsPlayVideoTOP() then
    self:PlayVideoBG(true)
    return UWidgetBlueprintLibrary.Handled()
  end
  return UWidgetBlueprintLibrary.UnHandled()
end

function M:OnMouseMove(MyGeometry, MouseEvent)
  if self:IsPlayVideoTOP() then
    local MouseMoveThreshold = 10
    self.LastMousePos = self.LastMousePos or {X = nil, Y = nil}
    local CurPos = UWidgetLayoutLibrary.GetMousePositionOnViewport(self)
    local LastPos = self.LastMousePos
    local ShouldHandle = false
    if LastPos.X and LastPos.Y then
      local Dx = CurPos.X - LastPos.X
      local Dy = CurPos.Y - LastPos.Y
      local Dist = math.sqrt(Dx * Dx + Dy * Dy)
      if MouseMoveThreshold <= Dist then
        DebugPrint(string.format("WBP_ShopMain_C:OnMouseMove, Dist: %f", Dist))
        ShouldHandle = true
      end
    end
    self.LastMousePos.X = CurPos.X
    self.LastMousePos.Y = CurPos.Y
    if ShouldHandle then
      self:PlayVideoBG(true)
      return UWidgetBlueprintLibrary.Handled()
    end
  end
  return UWidgetBlueprintLibrary.UnHandled()
end

function M:OnTouchStarted(MyGeometry, TouchEvent)
  if self:IsPlayVideoTOP() then
    self:PlayVideoBG(true)
    return UWidgetBlueprintLibrary.Handled()
  end
  return UWidgetBlueprintLibrary.UnHandled()
end

function M:InitVideoPlayer()
  self._OriginVisibilityMap = self._OriginVisibilityMap or {}
  self.bHideUIExceptVideo = false
  local BgVideoPath = DataMgr.ShopBannerTab[1].BgVideoPath
  self.VideoPlayer:SetUrlByMediaSource(LoadObject(BgVideoPath))
  self.VideoPlayer.Button_Skip:SetVisibility(ESlateVisibility.Collapsed)
  self.Group_Video:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Group_BG:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
end

function M:HideUIExceptVideoCallBack()
  if self:IsInVideoPage() then
    local flag = not self:IsPlayVideoTOP()
    if self:HideUIExceptVideo(flag) then
      self.bPlayVideoTOP = flag
    end
  end
end

function M:HideUIExceptVideo(flag, bSkipAnimation)
  if not bSkipAnimation and (self:IsAnimationPlaying(self.In_Info) or self:IsAnimationPlaying(self.Out_Info)) then
    return false
  end
  if flag == self.bHideUIExceptVideo then
    return true
  end
  self.bHideUIExceptVideo = flag
  if bSkipAnimation or self.bHasHideUIManually then
    self.bHasHideUIManually = flag
    local Count = self.Root:GetChildrenCount()
    for i = 0, Count - 1 do
      local Child = self.Root:GetChildAt(i)
      if Child ~= self.Group_Video then
        if flag then
          if self._OriginVisibilityMap[Child] == nil then
            self._OriginVisibilityMap[Child] = Child:GetVisibility()
          end
          Child:SetVisibility(ESlateVisibility.Hidden)
        elseif self._OriginVisibilityMap[Child] ~= nil then
          Child:SetVisibility(self._OriginVisibilityMap[Child])
        end
      end
    end
  end
  if not bSkipAnimation then
    if flag then
      self:PlayAnimation(self.Out_Info)
    else
      self:PlayAnimation(self.In_Info)
    end
  end
  if self.List_Recommend then
    self.List_Recommend:SetFocus()
  end
  if flag then
    self.GameInputModeSubsystem:SetNavigateWidgetOpacity(0)
  else
    self.GameInputModeSubsystem:SetNavigateWidgetOpacity(1)
  end
  local CurPos = UWidgetLayoutLibrary.GetMousePositionOnViewport(self)
  self.LastMousePos = {
    X = CurPos.X,
    Y = CurPos.Y
  }
  return true
end

function M:PlayVideoTOP()
  if CommonUtils:IfExistSystemGuideUI(self) then
    self:PlayVideoBG(false)
    return
  end
  local key = "HasPlayVideoTOPInShop"
  if EMCache:Get(key, true) then
    self:PlayVideoBG(false)
    return
  end
  EMCache:Set(key, true, true)
  self.bPlayVideoTOP = true
  self.bPlayVideoBG = false
  self:HideUIExceptVideo(true, true)
  self.Group_Video:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  self.Group_BG:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.VideoPlayer:SetLooping(true)
  self.VideoPlayer:Play()
  self.VideoPlayer.MediaPlayer.OnEndReached:Add(self, self.OnPlayVideoTOPEnd)
  if CommonUtils.GetDeviceTypeByPlatformName(GWorld.GameInstance) == "PC" then
    local GameInputSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(GWorld.GameInstance)
    GameInputSubsystem:SetMouseCursorVisable(false)
  end
end

function M:IsPlayVideoTOP()
  return self.bPlayVideoTOP
end

function M:IsPlayVideoBG()
  return self.bPlayVideoBG
end

function M:IsPlayVideo()
  return self:IsPlayVideoTOP() or self:IsPlayVideoBG()
end

function M:OnPlayVideoTOPEnd()
  self:PlayVideoBG(false)
end

function M:PlayVideoBG(bContinue)
  if not self:HideUIExceptVideo(false) then
    return
  end
  self.bPlayVideoTOP = false
  self.bPlayVideoBG = true
  self.VideoPlayer.MediaPlayer.OnEndReached:Remove(self, self.OnPlayVideoTOPEnd)
  if CommonUtils.GetDeviceTypeByPlatformName(GWorld.GameInstance) == "PC" then
    local GameInputSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(GWorld.GameInstance)
    GameInputSubsystem:SetMouseCursorVisable(true)
  end
  self.Group_Video:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  self.Group_BG:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.VideoPlayer:SetLooping(true)
  self.VideoPlayer:Play()
  if not bContinue then
    self.VideoPlayer.MediaPlayer:Rewind()
  end
end

function M:RemoveVideoBG()
  self.bPlayVideoBG = false
  self.Group_Video:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.VideoPlayer:Stop()
  self.Group_BG:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
end

AssembleComponents(M)
return M
