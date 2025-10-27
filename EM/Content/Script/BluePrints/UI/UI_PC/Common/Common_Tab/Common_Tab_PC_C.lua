require("UnLua")
local M = Class("BluePrints.UI.BP_UIState_C")

function M:Construct()
  self.SoundFunc = self.PlayClickSound
  self.SoundFuncReceiver = self
end

function M:Init(ConfigData, DontPlayInAnim)
  self.ConfigData = ConfigData
  self.BackCallback = ConfigData.BackCallback
  self.InfoCallback = ConfigData.InfoCallback
  self.OwnerPanel = ConfigData.OwnerPanel
  self.StyleName = ConfigData.StyleName or "Text"
  self.TitleName = ConfigData.TitleName
  self.SoundFunc = ConfigData.SoundFunc or self.PlayClickSound
  self.SoundFuncReceiver = ConfigData.SoundFuncReceiver or self
  self.DeviceTypeByPlatformName = CommonUtils.GetDeviceTypeByPlatformName(self)
  if ConfigData.LeftKey then
    self.Key_Left:CreateCommonKey({
      KeyInfoList = {
        {
          Type = "Text",
          Text = ConfigData.LeftKey
        }
      }
    })
    if self.DeviceTypeByPlatformName == "PC" then
      self.Key_Left:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    else
      self.Key_Left:SetVisibility(UIConst.VisibilityOp.Collapsed)
    end
  else
    self.Key_Left:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  if ConfigData.RightKey then
    self.Key_Right:CreateCommonKey({
      KeyInfoList = {
        {
          Type = "Text",
          Text = ConfigData.RightKey
        }
      }
    })
    if self.DeviceTypeByPlatformName == "PC" then
      self.Key_Right:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    else
      self.Key_Right:SetVisibility(UIConst.VisibilityOp.Collapsed)
    end
  else
    self.Key_Right:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  self.CurrentTab = nil
  self.bEnableSelectTab = true
  self.ResourceBarWidget = {}
  self.BottomKeyWidget = {}
  self:ResetDynamicNode()
  self:UpdateTabs(self.ConfigData.Tabs or {})
  if not DontPlayInAnim then
    self:PlayInAnim()
  end
  self:AddDispatcher(EventID.OnPropSetResources, self, self.OnPropSetResources)
  self:AddDispatcher(EventID.OnChangeActionPoint, self, self.OnPropSetResources)
end

function M:ResetDynamicNode()
  local DynamicNodeName = {
    "Panel_Back",
    "Panel_ResourceBar",
    "Panel_Tip"
  }
  if self.DeviceTypeByPlatformName == "PC" then
    table.insert(DynamicNodeName, "Panel_Key")
    self.BackgroundBlur_Bottom:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    self.Bg_Bottom:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  else
    self.Panel_Key:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.BackgroundBlur_Bottom:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.Bg_Bottom:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  for i, v in ipairs(DynamicNodeName) do
    if nil ~= self[v] then
      self[v]:ClearChildren()
      self[v]:SetVisibility(UIConst.VisibilityOp.Collapsed)
    end
  end
  if nil == self.ConfigData.DynamicNode then
    return
  end
  for i, v in ipairs(self.ConfigData.DynamicNode) do
    if "Back" == v then
      if not IsValid(self.BackWidget) then
        self.BackWidget = Utils.UIManager(self):CreateWidget("/Game/UI/UI_PC/Common/Common_Tab/Common_Tab_Back_PC.Common_Tab_Back_PC", false)
      end
      self.Panel_Back:AddChild(self.BackWidget)
      self.BackWidget.TextBlock_Back:SetText(GText("UI_BACK"))
      self.BackWidget.Btn_Back.OnClicked:Add(self, self.OnReturnClick)
      self.Panel_Back:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    elseif "ResourceBar" == v then
      local SystemUIConfig = DataMgr.SystemUI[self.OwnerPanel.ConfigName] or {}
      local TopResource = SystemUIConfig.TabCoin
      if nil ~= TopResource then
        for i, CoinId in ipairs(TopResource) do
          local ResourceBarWidget = self.ResourceBarWidget[CoinId]
          if not IsValid(ResourceBarWidget) then
            ResourceBarWidget = Utils.UIManager(self):CreateWidget("/Game/UI/UI_PC/Common/Common_Resourcebar_PC.Common_Resourcebar_PC", false)
            self.ResourceBarWidget[CoinId] = ResourceBarWidget
          end
          local CoinIcon = LoadObject(DataMgr.Resource[CoinId].Icon)
          ResourceBarWidget.Common_Item_Icon:Init({
            UIName = SystemUIConfig.UIName,
            IsShowDetails = true,
            IsCantItemSelection = true,
            MenuPlacement = EMenuPlacement.MenuPlacement_MenuRight,
            Id = CoinId,
            Icon = CoinIcon,
            ItemType = "Resource",
            HandleMouseDown = true
          })
          ResourceBarWidget:SetResourceId(CoinId)
          self.Panel_ResourceBar:AddChild(ResourceBarWidget)
        end
        self.Panel_ResourceBar:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
      else
        self.Panel_ResourceBar:SetVisibility(UIConst.VisibilityOp.Collapsed)
      end
    elseif "Tip" == v then
      if not IsValid(self.TipsWidget) then
        self.TipsWidget = Utils.UIManager(self):CreateWidget("/Game/UI/UI_PC/Common/Common_Tab/Common_Tab_Tip_PC.Common_Tab_Tip_PC", false)
      end
      self.Panel_Tip:AddChild(self.TipsWidget)
      self.TipsWidget.Btn_Info.OnClicked:Add(self, self.OnInfoClick)
      self.Panel_Tip:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    elseif "BottomKey" == v and self.DeviceTypeByPlatformName == "PC" then
      self:UpdateBottomKeyInfo(self.ConfigData.BottomKeyInfo or {})
    end
  end
end

function M:UpdateBottomKeyInfo(BottomKeyInfo)
  local BottomKeyWidgetIdx = 1
  for i, KeyInfo in ipairs(BottomKeyInfo) do
    local BottomKeyWidget = self.BottomKeyWidget[i]
    if not IsValid(BottomKeyWidget) then
      BottomKeyWidget = Utils.UIManager(self):CreateWidget("/Game/UI/UI_PC/Common/Common_Key/Common_Key_Btn_Desc_PC.Common_Key_Btn_Desc_PC", false)
      self.BottomKeyWidget[i] = BottomKeyWidget
    end
    self.Panel_Key:AddChild(BottomKeyWidget)
    BottomKeyWidget:CreateCommonKey({
      KeyInfoList = KeyInfo.KeyInfoList,
      Desc = KeyInfo.Desc
    })
    BottomKeyWidgetIdx = BottomKeyWidgetIdx + 1
  end
  for i = BottomKeyWidgetIdx, #self.BottomKeyWidget do
    local BottomKeyWidget = self.BottomKeyWidget[i]
    if IsValid(BottomKeyWidget) then
      BottomKeyWidget:RemoveFromParent()
    end
    self.BottomKeyWidget[BottomKeyWidgetIdx] = nil
  end
  self.Panel_Key:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
end

function M:UpdateBottomKeyInfo_Quick(Infos)
  local BottomKeyInfos = {}
  for ImgShortPath, TextMap in pairs(Info) do
    local BottomKeyInfo = {
      GamePadInfoList = {
        {Type = "Img", ImgShortPath = ImgShortPath}
      },
      Desc = TextMap
    }
    table.insert(BottomKeyInfos, BottomKeyInfo)
  end
  self:UpdateBottomKeyInfo(BottomKeyInfos)
end

function M:UpdateResource()
  for k, v in pairs(self.ResourceBarWidget) do
    if IsValid(v) then
      v:RefreshResourceInfo()
    end
  end
end

function M:UpdateTopTitle(TitleName)
  self.TitleName = TitleName
  self.Title_Tab:SetText(self.TitleName)
end

function M:UpdateTabs(Tabs)
  self.Tabs = Tabs
  if #Tabs < 1 then
    self.RetainerBox:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.EMScrollBox_TabItem:SetVisibility(UIConst.VisibilityOp.Collapsed)
    if self.TitleName ~= nil then
      self.Title_Tab:SetText(self.TitleName)
      self.Title_Tab:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    end
    return
  end
  if 1 == #Tabs then
    self.Key_Left:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.Key_Right:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  self.EMScrollBox_TabItem:ClearChildren()
  for i = 0, #Tabs - 1 do
    local Child, TabItemClass
    if self.StyleName == "Image" then
      TabItemClass = LoadClass("/Game/UI/UI_PC/Common/Common_Tab/Common_Tab_Avatar_Item_PC.Common_Tab_Avatar_Item_PC_C")
    elseif self.StyleName == "Text" then
      TabItemClass = LoadClass("/Game/UI/UI_PC/Common/Common_Tab/Common_Tab_Item_PC.Common_Tab_Item_PC_C")
    elseif self.StyleName == "Icon" then
      TabItemClass = LoadClass("/Game/UI/UI_PC/Common/Common_Tab/Common_Toggle_GuideBookTabItem_PC.Common_Toggle_GuideBookTabItem_PC_C")
    end
    if nil ~= TabItemClass then
      Child = UE4.UWidgetBlueprintLibrary.Create(self, TabItemClass)
      if IsValid(Child) then
        self.EMScrollBox_TabItem:AddChild(Child)
        Child:Update(i + 1, Tabs[i + 1])
        Child:BindEventOnSwitchOn(self, self.OnTabSwitchOn)
        Child:BindSoundFunc(self.SoundFunc, self.SoundFuncReceiver)
      end
    end
  end
  self.RetainerBox:SetVisibility(UIConst.VisibilityOp.Visible)
  self.Title_Tab:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.EMScrollBox_TabItem:SetVisibility(UIConst.VisibilityOp.Visible)
end

function M:OnReturnClick()
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_return", nil, nil)
  if type(self.BackCallback) == "function" then
    self.BackCallback(self.OwnerPanel)
  end
end

function M:OnInfoClick()
  if type(self.InfoCallback) == "function" then
    self.InfoCallback(self.OwnerPanel)
  end
end

function M:OnTabSwitchOn(TabWidget)
  if TabWidget and self.Tabs[TabWidget.Idx] then
    if self.CurrentTab and TabWidget.Idx ~= self.CurrentTab then
      self.EMScrollBox_TabItem:GetChildAt(self.CurrentTab - 1):SetSwitchOn(false)
      local CurChildWidget = self.EMScrollBox_TabItem:GetChildAt(TabWidget.Idx - 1)
      self.EMScrollBox_TabItem:ScrollWidgetIntoView(CurChildWidget)
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
    local ChildWidget = self.EMScrollBox_TabItem:GetChildAt(math.max(Idx - 1, 0))
    ChildWidget:SetSwitchOn(true)
    self.EMScrollBox_TabItem:ScrollWidgetIntoView(ChildWidget)
  end
end

function M:ShowTabRedDot(Idx, IsNew, Upgradeable, OhterReddot)
  if self.Tabs[Idx] then
    local TabWidget = self.EMScrollBox_TabItem:GetChildAt(math.max(Idx - 1, 0))
    TabWidget:SetReddot(IsNew, Upgradeable, OhterReddot)
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

function M:SetEnableSelectTab(bEnable)
  self.bEnableSelectTab = bEnable
  local AllItemCount = self.EMScrollBox_TabItem:GetChildrenCount()
  for i = 1, AllItemCount do
    local Child = self.EMScrollBox_TabItem:GetChildAt(i - 1)
    Child:SetClickEnable(bEnable)
  end
end

function M:Destruct()
  self:PlayOutAnim()
  self.Super.Destruct(self)
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
  if self.BackWidget then
    local img = LoadObject("/Game/UI/UI_PC/Common/Material/Noise/MI_Common_Noise_" .. AttrName .. ".MI_Common_Noise_" .. AttrName)
    self.BackWidget.VX_BackWave:SetBrushFromMaterial(img)
  end
end

function M:OnPropSetResources(ResourceId, OldValue)
  if self.ResourceBarWidget and self.ResourceBarWidget[ResourceId] then
    self.ResourceBarWidget[ResourceId]:RefreshResourceInfo()
  end
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

return M
