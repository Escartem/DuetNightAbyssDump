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
  self.SoundFunc = ConfigData.SoundFunc or self.PlayClickSound
  self.SoundFuncReceiver = ConfigData.SoundFuncReceiver or self
  self.DeviceTypeByPlatformName = ConfigData.PlatformName or CommonUtils.GetDeviceTypeByPlatformName(self)
  self.IconSignPath = ConfigData.IconSignPath
  self.CurrentTab = nil
  self.bEnableSelectTab = true
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
  self.Btn_Back.Btn_Back.OnClicked:Clear()
  self.Btn_Back.Btn_Back.OnClicked:Add(self, self.OnReturnClick)
  if self.IconSignPath then
    local IconSignTexture = LoadObject(self.IconSignPath)
    if IsValid(IconSignTexture) then
      self.Icon_Sign:SetBrushFromTexture(IconSignTexture)
    end
  end
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
        for i, CoinId in ipairs(TopResource) do
          local ResourceBar = self.ResourceBar[CoinId]
          if not IsValid(ResourceBar) then
            ResourceBar = UIManager(self):_CreateWidgetNew("ResourceBar")
            self.ResourceBar[CoinId] = ResourceBar
          end
          local CoinIcon = LoadObject(DataMgr.Resource[CoinId].Icon)
          ResourceBar.Common_Item_Icon:Init({
            UIName = UIWidgetName,
            IsShowDetails = true,
            IsCantItemSelection = true,
            MenuPlacement = EMenuPlacement.MenuPlacement_MenuRight,
            Id = CoinId,
            Icon = CoinIcon,
            ItemType = "Resource",
            HandleMouseDown = true
          })
          ResourceBar:SetResourceId(CoinId)
          if self.bShowBubble then
            self:CheckAndShowLimitedResourceBubble(CoinId, ResourceBar)
          end
        end
        self.ResourceBar:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
      else
        self.ResourceBar:SetVisibility(UIConst.VisibilityOp.Collapsed)
      end
    end
  end
end

function M:SetBgRenderOpacity(Value)
  self.Bg_Bottom:SetRenderOpacity(Value)
  self.Bg_Top:SetRenderOpacity(Value)
end

function M:OverrideTopResource(OverridenTopResouces)
  self.OverridenTopResouces = OverridenTopResouces
end

function M:UpdateResource()
  for k, v in pairs(self.ResourceBar) do
    if IsValid(v) then
      v:RefreshResourceInfo()
    end
  end
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
    self.ScrollBox_Tab:SetVisibility(UIConst.VisibilityOp.Collapsed)
    return
  end
  self.ScrollBox_Tab:ClearChildren()
  for i = 0, #Tabs - 1 do
    local Child, TabItemClass
    TabItemClass = LoadClass("/Game/UI/WBP/Common/Tab/Mobile/WBP_Com_TabItem_SP_M.WBP_Com_TabItem_SP_M_C")
    if nil ~= TabItemClass then
      Child = UE4.UWidgetBlueprintLibrary.Create(self, TabItemClass)
      if IsValid(Child) then
        self.ScrollBox_Tab:AddChild(Child)
        Child:Update(i + 1, Tabs[i + 1])
        Child:BindEventOnSwitchOn(self, self.OnTabSwitchOn)
        Child:BindSoundFunc(self.SoundFunc, self.SoundFuncReceiver)
      end
    end
  end
  self.ScrollBox_Tab:SetVisibility(UIConst.VisibilityOp.Visible)
end

function M:OnReturnClick()
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_return", nil, nil)
  if type(self.BackCallback) == "function" then
    self.BackCallback(self.OwnerPanel)
  end
end

function M:OnTabSwitchOn(TabWidget)
  if TabWidget and self.Tabs[TabWidget.Idx] then
    if self.CurrentTab and TabWidget.Idx ~= self.CurrentTab then
      local CurSwitchChildWidget = self.ScrollBox_Tab:GetChildAt(self.CurrentTab - 1)
      if nil ~= CurSwitchChildWidget then
        CurSwitchChildWidget:SetSwitchOn(false)
      end
      local CurChildWidget = self.ScrollBox_Tab:GetChildAt(TabWidget.Idx - 1)
      self.ScrollBox_Tab:ScrollWidgetIntoView(CurChildWidget)
    end
    self.CurrentTab = TabWidget.Idx
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
    local ChildWidget = self.ScrollBox_Tab:GetChildAt(math.max(Idx - 1, 0))
    ChildWidget:SetSwitchOn(true)
    self.ScrollBox_Tab:ScrollWidgetIntoView(ChildWidget)
  end
end

function M:SelectTabById(TabId)
  local AllItemCount = self.ScrollBox_Tab:GetChildrenCount()
  for i = 1, AllItemCount do
    local ChildWidget = self.ScrollBox_Tab:GetChildAt(i - 1)
    if TabId == ChildWidget:GetTabId() then
      ChildWidget:SetSwitchOn(true)
      self.ScrollBox_Tab:ScrollWidgetIntoView(ChildWidget)
      break
    end
  end
end

function M:ShowTabRedDot(Idx, IsNew, Upgradeable, OhterReddot)
  if self.Tabs[Idx] then
    local TabWidget = self.ScrollBox_Tab:GetChildAt(math.max(Idx - 1, 0))
    TabWidget:SetReddot(IsNew, Upgradeable, OhterReddot)
  end
end

function M:ShowTabRedDotByTabId(TabId, IsNew, Upgradeable, OhterReddot)
  local AllItemCount = self.ScrollBox_Tab:GetChildrenCount()
  for i = 1, AllItemCount do
    local TabWidget = self.ScrollBox_Tab:GetChildAt(i - 1)
    if TabId == TabWidget:GetTabId() then
      TabWidget:SetReddot(IsNew, Upgradeable, OhterReddot)
      break
    end
  end
end

function M:TabToUp()
  if not self.bEnableSelectTab then
    return
  end
  if self.CurrentTab and self.CurrentTab - 1 >= 1 then
    local ChildWidget = self.ScrollBox_Tab:GetChildAt(self.CurrentTab - 2)
    ChildWidget:SetSwitchOn(true, true)
    self.ScrollBox_Tab:ScrollWidgetIntoView(ChildWidget)
    self.SoundFunc(self.SoundFuncReceiver, self.CurrentTab - 1)
  end
end

function M:TabToDown()
  if not self.bEnableSelectTab then
    return
  end
  if self.CurrentTab and self.CurrentTab + 1 <= #self.Tabs then
    local ChildWidget = self.ScrollBox_Tab:GetChildAt(self.CurrentTab)
    ChildWidget:SetSwitchOn(true, true)
    self.ScrollBox_Tab:ScrollWidgetIntoView(ChildWidget)
    self.SoundFunc(self.SoundFuncReceiver, self.CurrentTab + 1)
  end
end

function M:EnableTabByIndex(bEnable, TabIndex)
  self.bEnableSelectTab = bEnable
  local AllItemCount = self.ScrollBox_Tab:GetChildrenCount()
  if nil ~= TabIndex then
    for i = 1, AllItemCount do
      local Child = self.ScrollBox_Tab:GetChildAt(i - 1)
      if TabIndex == Child.Idx then
        Child:SetClickEnable(bEnable)
        break
      end
    end
  else
    for i = 1, AllItemCount do
      local Child = self.ScrollBox_Tab:GetChildAt(i - 1)
      Child:SetClickEnable(bEnable)
    end
  end
end

function M:UnLockTabByIndex(bUnLock, TabIndex)
  local AllItemCount = self.ScrollBox_Tab:GetChildrenCount()
  if nil ~= TabIndex then
    for i = 1, AllItemCount do
      local Child = self.ScrollBox_Tab:GetChildAt(i - 1)
      if TabIndex == Child.Idx then
        Child:SetLockInfo(bUnLock)
        break
      end
    end
  else
    for i = 1, AllItemCount do
      local Child = self.ScrollBox_Tab:GetChildAt(i - 1)
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

function M:SetBackBtnAttrColor(AttrName)
  AttrName = AttrName or "Fire"
  if self.Btn_Back then
    local img = LoadObject("/Game/UI/UI_PC/Common/Material/Noise/MI_Common_Noise_" .. AttrName .. ".MI_Common_Noise_" .. AttrName)
    self.Btn_Back.VX_BackWave:SetBrushFromMaterial(img)
  end
end

function M:OnPropSetResources(ResourceId)
  if self.ResourceBar and self.ResourceBar[ResourceId] then
    self.ResourceBar[ResourceId]:RefreshResourceInfo()
  end
end

function M:EnterViewSingleMode()
end

function M:LeaveViewSingleMode()
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

function M:CheckAndShowLimitedResourceBubble(ResourceId, ResourceBar)
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
            ResourceBar:ShowBubble(ConfigData)
            self:HideLimitedResourceBubbleAfterDelay(ResourceBar, 3.0)
          elseif TimeDiff >= CommonConst.SECOND_IN_DAY and TimeDiff < CommonConst.SECOND_IN_WEEKDAY then
            local ConfigData = {
              Text = GText("UI_GachaTicket_Bubble"),
              TextColor = 0
            }
            ResourceBar:ShowBubble(ConfigData)
            self:HideLimitedResourceBubbleAfterDelay(ResourceBar, 3.0)
          end
        end
      end
    end
  end
end

function M:HideLimitedResourceBubbleAfterDelay(ResourceBar, DelayTime)
  if not self.BubbleTimers then
    self.BubbleTimers = {}
  end
  local TimerId = "LimitedResourceBubble_" .. tostring(ResourceBar.RId)
  if self:IsExistTimer(TimerId) then
    self:RemoveTimer(TimerId)
  end
  
  local function HideBubbleFunc()
    if IsValid(ResourceBar) then
      ResourceBar:HideBubble()
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

return M
