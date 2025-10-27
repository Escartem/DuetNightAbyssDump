require("UnLua")
local TimeUtils = require("Utils.TimeUtils")
local ItemUtils = require("Utils.ItemUtils")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C",
  "BluePrints.Common.TimerMgr"
})

function M:Construct()
  self.SoundFunc = self.PlayClickSound
  self.SoundFuncReceiver = self
  self.Panel_Team:SetVisibility(UIConst.VisibilityOp.Collapsed)
end

function M:Destruct()
  if self.BubbleTimers then
    for TimerId, _ in pairs(self.BubbleTimers) do
      if self:IsExistTimer(TimerId) then
        self:RemoveTimer(TimerId)
      end
    end
    self.BubbleTimers = nil
  end
  self:ClearListenEvent()
end

function M:Init(ConfigData, NotPlayInAnim)
  self.ConfigData = ConfigData
  self.BackCallback = ConfigData.BackCallback
  self.InfoCallback = ConfigData.InfoCallback
  self.OwnerPanel = ConfigData.OwnerPanel
  self.StyleName = ConfigData.StyleName or "Text"
  self.TitleName = ConfigData.TitleName
  self.SubTitleName = ConfigData.SubTitleName
  self.OverridenTopResouces = ConfigData.OverridenTopResouces
  self.PopupInfoId = ConfigData.PopupInfoId
  self.SoundFunc = ConfigData.SoundFunc or self.PlayClickSound
  self.SoundFuncReceiver = ConfigData.SoundFuncReceiver or self
  self.DeviceTypeByPlatformName = ConfigData.PlatformName or CommonUtils.GetDeviceTypeByPlatformName(self)
  self.CurrentTab = nil
  self.bEnableSelectTab = true
  self.ResourceBarWidget = {}
  self.ShowSquadBuildBtn = ConfigData.ShowSquadBuildBtn
  self.bShowBubble = ConfigData.bShowBubble
  self:ResetDynamicNode()
  self:UpdateTabs(self.ConfigData.Tabs or {})
  self:RefreshBaseInfo()
  if NotPlayInAnim then
    self:StopAnimation(self.In)
  end
  self:InitListenEvent()
end

function M:InitListenEvent()
  EventManager:RemoveEvent(EventID.OnPropSetResources, self, self.OnPropSetResources)
end

function M:ClearListenEvent()
  EventManager:RemoveEvent(EventID.OnPropSetResources, self)
end

function M:RefreshBaseInfo()
  if self.TitleName ~= nil then
    self.Text_Title:SetText(self.TitleName)
    self.Text_Title:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  else
    self.Text_Title:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  self:UpdateTopSubTitle()
  self.Btn_Tip.Button_Area.OnClicked:Clear()
  self.Btn_Tip.Button_Area.OnClicked:Add(self, self.OnInfoClick)
  self:UpdateTopRightTips()
  self.Btn_Back.Btn_Back.OnClicked:Clear()
  self.Btn_Back.Btn_Back.OnClicked:Add(self, self.OnReturnClick)
end

function M:ResetDynamicNode()
  local DynamicNodeName = {
    Panel_ResourceBar = {NeedRemoveChild = true}
  }
  for k, v in pairs(DynamicNodeName) do
    if nil ~= self[k] then
      if v.NeedRemoveChild then
        self[k]:ClearChildren()
      end
      self[k]:SetVisibility(UIConst.VisibilityOp.Collapsed)
    end
  end
  if nil == self.ConfigData.DynamicNode then
    return
  end
  for i, v in ipairs(self.ConfigData.DynamicNode) do
    if "ResourceBar" == v then
      local UIWidgetName = self.OwnerPanel.ConfigName or self.OwnerPanel.WidgetName
      local SystemUIConfig = DataMgr.SystemUI[UIWidgetName] or {}
      local TopResource = self.OverridenTopResouces or SystemUIConfig.TabCoin
      if nil ~= TopResource then
        self.Panel_ResourceBar:ClearChildren()
        self.ResourceBarWidget = {}
        for i, CoinId in ipairs(TopResource) do
          local ResourceBarWidget = self.ResourceBarWidget[CoinId]
          if not IsValid(ResourceBarWidget) then
            ResourceBarWidget = UIManager(self):_CreateWidgetNew("ResourceBar")
            self.ResourceBarWidget[CoinId] = ResourceBarWidget
          end
          local CoinIconPath = DataMgr.Resource[CoinId].Icon
          ResourceBarWidget.Common_Item_Icon:Init({
            UIName = UIWidgetName,
            IsShowDetails = true,
            IsCantItemSelection = true,
            MenuPlacement = EMenuPlacement.MenuPlacement_MenuRight,
            Id = CoinId,
            Icon = CoinIconPath,
            ItemType = "Resource",
            HandleMouseDown = true
          })
          ResourceBarWidget:SetResourceId(CoinId)
          self.Panel_ResourceBar:AddChild(ResourceBarWidget)
          if self.bShowBubble then
            self:CheckAndShowLimitedResourceBubble(CoinId, ResourceBarWidget)
          end
        end
        self.Panel_ResourceBar:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
      else
        self.Panel_ResourceBar:SetVisibility(UIConst.VisibilityOp.Collapsed)
      end
    end
  end
  local SystemUIConfig = DataMgr.SystemUI[self.OwnerPanel.ConfigName or self.OwnerPanel.WidgetName] or {}
  local IsChat = SystemUIConfig.IsChat
  if IsChat then
    local ChatUI = UIManager(self):CreateWidget("/Game/UI/WBP/Chat/Mobile/WBP_Chat_CommonEnter_M.WBP_Chat_CommonEnter_M", false)
    if self.Panel_Chat then
      self.Panel_Chat:ClearChildren()
      self.Panel_Chat:AddChildToOverlay(ChatUI)
    end
  elseif self.Panel_Chat then
    self.Panel_Chat:ClearChildren()
  end
end

function M:SetBgRenderOpacity(Value)
  self.Bg_Bottom:SetRenderOpacity(Value)
  self.Bg_Top:SetRenderOpacity(Value)
end

function M:OverrideTopResource(OverridenTopResouces, bIsRequestRefresh)
  self.OverridenTopResouces = OverridenTopResouces
  if bIsRequestRefresh then
    self:ResetDynamicNode()
  end
end

function M:SetPopupInfoId(PopupInfoId, IsNeedRefresh)
  self.PopupInfoId = PopupInfoId
  if IsNeedRefresh then
    self:UpdateTopRightTips()
  end
end

function M:UpdateInfoBySelectTabItem(TabWidget)
  self:UpdateTopRightTips()
  self:UpdateTopSubTitle(TabWidget:GetShowText())
end

function M:UpdateResource()
  for k, v in pairs(self.ResourceBarWidget) do
    if IsValid(v) then
      v:RefreshResourceInfo()
    end
  end
end

function M:UpdateTopRightTips()
  local function RealUpdateTopRightTips()
    if self.PopupInfoId ~= nil or type(self.InfoCallback) == "function" then
      self.Panel_Tip:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    else
      self.Panel_Tip:SetVisibility(UIConst.VisibilityOp.Collapsed)
    end
  end
  
  if self.PopupInfoId == nil and nil ~= self.OwnerPanel and type(self.OwnerPanel.GetUIConfigName) == "function" then
    local UIConfigName = self.OwnerPanel:GetUIConfigName()
    local SystemUIConfig = DataMgr.SystemUI[UIConfigName] or {}
    self.PopupInfoId = SystemUIConfig.PopupInfoId
  end
  RealUpdateTopRightTips()
end

function M:UpdateTopTitle(TitleName)
  self.TitleName = TitleName
  if nil ~= TitleName then
    self.Text_Title:SetText(TitleName)
    self.Text_Title:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  else
    self.Text_Title:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

function M:UpdateTopSubTitle(SubTitleName)
  self.SubTitleName = SubTitleName or self.SubTitleName
  if self.SubTitleName ~= nil then
    self.Split:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    self.Text_SubTitle:SetText(self.SubTitleName)
    self.Text_SubTitle:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  else
    self.Split:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.Text_SubTitle:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

function M:UpdateTabs(Tabs)
  local function SortFunc(ComPareA, ComPareB)
    local IsALocked = ComPareA.IsLocked
    
    local IsBLocked = ComPareB.IsLocked
    if IsALocked == IsBLocked then
      local SortA = ComPareA.SortId
      local SortB = ComPareB.SortId
      if nil ~= SortA and nil ~= SortB then
        return SortA > SortB
      else
        local TabIdA = ComPareA.TabId or 1
        local TabIdB = ComPareB.TabId or 1
        return TabIdA < TabIdB
      end
    else
      return not IsALocked
    end
  end
  
  table.sort(Tabs, SortFunc)
  self.Tabs = Tabs
  if #Tabs < 1 then
    self.Panel_Tab:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.EMScrollBox_TabItem:SetVisibility(UIConst.VisibilityOp.Collapsed)
    return
  end
  for index = 1, #Tabs do
    local CurChildWidget = self.EMScrollBox_TabItem:GetChildAt(index - 1)
    if not CurChildWidget then
      local TabItemClass
      if self.StyleName == "Image" then
        TabItemClass = LoadClass("/Game/UI/WBP/Common/Tab/Mobile/WBP_Com_TabItem_M.WBP_Com_TabItem_M_C")
      elseif self.StyleName == "Armory" then
        TabItemClass = LoadClass("/Game/UI/WBP/Common/Tab/Mobile/WBP_Com_TabArmItem_M.WBP_Com_TabArmItem_M_C")
      elseif self.StyleName == "TextImage" then
        TabItemClass = LoadClass("/Game/UI/WBP/Common/Tab/Mobile/WBP_Com_TabItem_M.WBP_Com_TabItem_M")
      else
        TabItemClass = LoadClass("/Game/UI/WBP/Common/Tab/Mobile/WBP_Com_TabItem_M.WBP_Com_TabItem_M_C")
      end
      if nil ~= TabItemClass then
        CurChildWidget = UE4.UWidgetBlueprintLibrary.Create(self, TabItemClass)
        if IsValid(CurChildWidget) then
          self.EMScrollBox_TabItem:AddChild(CurChildWidget)
        end
      end
    end
    if CurChildWidget then
      CurChildWidget:Update(index, Tabs[index])
      CurChildWidget:BindEventOnSwitchOn(self, self.OnTabSwitchOn)
      CurChildWidget:BindSoundFunc(self.SoundFunc, self.SoundFuncReceiver)
      CurChildWidget:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    end
  end
  local CurChildCount = self.EMScrollBox_TabItem:GetChildrenCount()
  for ExtraIdx = #Tabs + 1, CurChildCount do
    local ExtraChildWidget = self.EMScrollBox_TabItem:GetChildAt(ExtraIdx - 1)
    if ExtraChildWidget then
      ExtraChildWidget:SetVisibility(UIConst.VisibilityOp.Collapsed)
    end
  end
  self.EMScrollBox_TabItem:SetVisibility(UIConst.VisibilityOp.Visible)
  if self.ConfigData.ForceHideTabs then
    self.Panel_Tab:SetVisibility(UIConst.VisibilityOp.Collapsed)
  else
    self.Panel_Tab:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  end
  if self.ShowSquadBuildBtn then
    self.Entrance_Build:SetVisibility(ESlateVisibility.Visibility)
    self.Entrance_Build:InitUI()
  end
end

function M:OnReturnClick()
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_return", nil, nil)
  if type(self.BackCallback) == "function" then
    self.BackCallback(self.OwnerPanel)
  end
end

function M:OnInfoClick()
  if self.PopupInfoId ~= nil then
    local Params = {
      RightCallbackFunction = function()
        if type(self.InfoCallback) == "function" then
          self.InfoCallback(self.OwnerPanel)
        end
      end
    }
    UIManager(self):ShowCommonPopupUI(self.PopupInfoId, Params)
  elseif type(self.InfoCallback) == "function" then
    self.InfoCallback(self.OwnerPanel)
  end
end

function M:OnTabSwitchOn(TabWidget)
  if TabWidget and self.Tabs[TabWidget.Idx] then
    if self.CurrentTab and TabWidget.Idx ~= self.CurrentTab then
      local CurSwitchChildWidget = self.EMScrollBox_TabItem:GetChildAt(self.CurrentTab - 1)
      if nil ~= CurSwitchChildWidget then
        CurSwitchChildWidget:SetSwitchOn(false)
      end
      local CurChildWidget = self.EMScrollBox_TabItem:GetChildAt(TabWidget.Idx - 1)
      self.EMScrollBox_TabItem:ScrollWidgetIntoView(CurChildWidget)
    end
    self.CurrentTab = TabWidget.Idx
    self:UpdateInfoBySelectTabItem(TabWidget)
  end
  if self.EventTabSelected then
    self.EventTabSelected(self.ObjTabSelected, TabWidget, self.Tabs[TabWidget.Idx])
  end
end

function M:BindEventOnTabSelected(Obj, Event)
  self.ObjTabSelected = Obj
  self.EventTabSelected = Event
end

function M:SelectTab(Idx)
  if self.Tabs[Idx] then
    local ChildWidget = self.EMScrollBox_TabItem:GetChildAt(math.max(Idx - 1, 0))
    ChildWidget:SetSwitchOn(true)
    self.EMScrollBox_TabItem:ScrollWidgetIntoView(ChildWidget)
  end
end

function M:SelectTabById(TabId)
  local AllItemCount = self.EMScrollBox_TabItem:GetChildrenCount()
  for i = 1, AllItemCount do
    local ChildWidget = self.EMScrollBox_TabItem:GetChildAt(i - 1)
    if TabId == ChildWidget:GetTabId() then
      ChildWidget:SetSwitchOn(true)
      self.EMScrollBox_TabItem:ScrollWidgetIntoView(ChildWidget)
      break
    end
  end
end

function M:ShowTabRedDot(Idx, IsNew, Upgradeable, OhterReddot)
  if self.Tabs[Idx] then
    local TabWidget = self.EMScrollBox_TabItem:GetChildAt(math.max(Idx - 1, 0))
    TabWidget:SetReddot(IsNew, Upgradeable, OhterReddot)
  end
end

function M:ShowTabRedDotByTabId(TabId, IsNew, Upgradeable, OhterReddot)
  local AllItemCount = self.EMScrollBox_TabItem:GetChildrenCount()
  for i = 1, AllItemCount do
    local TabWidget = self.EMScrollBox_TabItem:GetChildAt(i - 1)
    if TabId == TabWidget:GetTabId() then
      TabWidget:SetReddot(IsNew, Upgradeable, OhterReddot)
      break
    end
  end
end

function M:TabToLeft()
  if not self.bEnableSelectTab then
    return
  end
  if self.CurrentTab and self.CurrentTab - 1 >= 1 then
    local ChildWidget = self.EMScrollBox_TabItem:GetChildAt(self.CurrentTab - 2)
    ChildWidget:SetSwitchOn(true, true)
    self.EMScrollBox_TabItem:ScrollWidgetIntoView(ChildWidget)
    self.SoundFunc(self.SoundFuncReceiver, self.CurrentTab - 1)
  end
end

function M:TabToRight()
  if not self.bEnableSelectTab then
    return
  end
  if self.CurrentTab and self.CurrentTab + 1 <= #self.Tabs then
    local ChildWidget = self.EMScrollBox_TabItem:GetChildAt(self.CurrentTab)
    ChildWidget:SetSwitchOn(true, true)
    self.EMScrollBox_TabItem:ScrollWidgetIntoView(ChildWidget)
    self.SoundFunc(self.SoundFuncReceiver, self.CurrentTab + 1)
  end
end

function M:EnableTabByIndex(bEnable, TabIndex)
  self.bEnableSelectTab = bEnable
  local AllItemCount = self.EMScrollBox_TabItem:GetChildrenCount()
  if nil ~= TabIndex then
    for i = 1, AllItemCount do
      local Child = self.EMScrollBox_TabItem:GetChildAt(i - 1)
      if TabIndex == Child.Idx then
        Child:SetClickEnable(bEnable)
        break
      end
    end
  else
    for i = 1, AllItemCount do
      local Child = self.EMScrollBox_TabItem:GetChildAt(i - 1)
      Child:SetClickEnable(bEnable)
    end
  end
end

function M:UnLockTabByIndex(bUnLock, TabIndex)
  local AllItemCount = self.EMScrollBox_TabItem:GetChildrenCount()
  if nil ~= TabIndex then
    for i = 1, AllItemCount do
      local Child = self.EMScrollBox_TabItem:GetChildAt(i - 1)
      if TabIndex == Child.Idx then
        Child:SetLockInfo(bUnLock)
        break
      end
    end
  else
    for i = 1, AllItemCount do
      local Child = self.EMScrollBox_TabItem:GetChildAt(i - 1)
      Child:SetLockInfo(bUnLock)
    end
  end
end

function M:PlayInAnim()
  if self.In == nil then
    return -1
  end
  self:StopAnimation(self.Out)
  self:PlayAnimation(self.In)
  return self.In:GetEndTime()
end

function M:PlayOutAnim()
  if self.Out == nil then
    return -1
  end
  self:StopAnimation(self.In)
  self:PlayAnimation(self.Out)
  return self.Out:GetEndTime()
end

function M:PlayTabInAnim()
  self:StopAnimation(self.Panel_Tab_Out)
  self:PlayAnimation(self.Panel_Tab_In)
end

function M:PlayTabOutAnim()
  self:StopAnimation(self.Panel_Tab_In)
  self:PlayAnimation(self.Panel_Tab_Out)
end

function M:SetBackBtnAttrColor(AttrName, bAsyncLoadIcon)
  AttrName = AttrName or "Fire"
  if self.Btn_Back then
    local IconPath = "/Game/UI/UI_PC/Common/Material/Noise/MI_Common_Noise_" .. AttrName .. ".MI_Common_Noise_" .. AttrName
    if bAsyncLoadIcon then
      self:LoadTextureAsync(IconPath, function(Texture)
        if not Texture then
          DebugPrint(ErrorTag, string.format("SetBackBtnAttrColor \231\148\168\233\148\153\229\155\190\230\160\135\232\183\175\229\190\132\228\186\134\239\188\129\239\188\129\239\188\129\233\148\153\232\175\175\231\154\132\232\183\175\229\190\132\230\152\175\239\188\154%s", IconPath))
          return
        end
        if Texture then
          self.Btn_Back.VX_BackWave:SetBrushFromMaterial(Texture)
        end
      end, "LoadBackBtnIcon")
    else
      local img = LoadObject(IconPath)
      self.Btn_Back.VX_BackWave:SetBrushFromMaterial(img)
    end
  end
end

function M:OnPropSetResources(ResourceId)
  if self.ResourceBarWidget and self.ResourceBarWidget[ResourceId] then
    self.ResourceBarWidget[ResourceId]:RefreshResourceInfo()
  end
end

function M:EnterViewSingleMode()
  self.Panel_Tab:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Panel_ResourceBar:SetVisibility(UIConst.VisibilityOp.Collapsed)
end

function M:LeaveViewSingleMode()
  self.Panel_Tab:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  self.Panel_ResourceBar:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
end

function M:PlayClickSound()
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_level_01", nil, nil)
end

function M:UpdateReddots()
  for _, Tab in pairs(self.Tabs) do
    if IsValid(Tab.UI) and Tab.UI.SetReddot then
      Tab.UI:SetReddot(Tab.IsNew, Tab.Upgradeable, Tab.OtherReddot)
    end
  end
end

function M:Handle_KeyEventOnTouch(InKeyName)
  local IsEventHandled = true
  if InKeyName == UE4.EKeys.Escape.KeyName then
    self:OnReturnClick()
  else
    IsEventHandled = false
  end
  return IsEventHandled
end

function M:Handle_KeyEventOnGamePad(InKeyName)
  return false
end

function M:CheckAndShowLimitedResourceBubble(ResourceId, ResourceBarWidget)
  local ResourceInfo = DataMgr.Resource[ResourceId]
  local LimitedInfo = ItemUtils.GetItemLimitedInfo(ResourceId)
  if ResourceInfo and LimitedInfo then
    local Avatar = GWorld:GetAvatar()
    if Avatar then
      local Count = Avatar:GetResourceNum(ResourceId)
      if Count > 0 then
        local NowTime = TimeUtils.NowTime()
        if LimitedInfo.EndTime then
          local TimeDiff = LimitedInfo.EndTime - NowTime
          if TimeDiff > 0 and TimeDiff < CommonConst.SECOND_IN_DAY then
            local ConfigData = {
              Text = GText("UI_GachaTicket_Bubble"),
              TextColor = 1
            }
            ResourceBarWidget:ShowBubble(ConfigData)
            self:HideLimitedResourceBubbleAfterDelay(ResourceBarWidget, 3.0)
          elseif TimeDiff >= CommonConst.SECOND_IN_DAY and TimeDiff < CommonConst.SECOND_IN_WEEKDAY then
            local ConfigData = {
              Text = GText("UI_GachaTicket_Bubble"),
              TextColor = 0
            }
            ResourceBarWidget:ShowBubble(ConfigData)
            self:HideLimitedResourceBubbleAfterDelay(ResourceBarWidget, 3.0)
          end
        end
      end
    end
  end
end

function M:HideLimitedResourceBubbleAfterDelay(ResourceBarWidget, DelayTime)
  if not self.BubbleTimers then
    self.BubbleTimers = {}
  end
  local TimerId = "LimitedResourceBubble_" .. tostring(ResourceBarWidget.RId)
  if self:IsExistTimer(TimerId) then
    self:RemoveTimer(TimerId)
  end
  
  local function HideBubbleFunc()
    if IsValid(ResourceBarWidget) then
      ResourceBarWidget:HideBubble()
    end
    if self:IsExistTimer(TimerId) then
      self:RemoveTimer(TimerId)
    end
    if self.BubbleTimers then
      self.BubbleTimers[TimerId] = nil
    end
  end
  
  self:AddTimer(DelayTime, HideBubbleFunc, false, 0.1, TimerId, true)
  self.BubbleTimers[TimerId] = true
end

function M:UpdateSingleBottomKeyInfo(SubKeyIndex, SingleKeyInfo)
end

return M
