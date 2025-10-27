require("UnLua")
local EMCache = require("EMCache.EMCache")
local ArmoryUtils = require("BluePrints.UI.WBP.Armory.ArmoryUtils")
local ModModel = ModController:GetModel()
local WBP_ModArchive_Archive_C = Class({
  "BluePrints.UI.BP_UIState_C",
  "BluePrints.Common.DelayFrameComponent"
})

function WBP_ModArchive_Archive_C:Construct()
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
  self.CurInputDeviceType = self.GameInputModeSubsystem:GetCurrentInputType()
  self.Node_ResourceBar:BindEvents(self, {
    OnAddedToFocusPath = self.OnResourceBarAddedToFocusPath,
    OnRemovedFromFocusPath = self.OnResourceBarRemovedFromFocusPath,
    OnMenuOpenChanged = self.OnMenuOpenChanged
  })
  self.Btn_Reward:UnBindEventOnClicked(self, self.OnClickGetAllRewards)
  self.Btn_Reward:BindEventOnClicked(self, self.OnClickGetAllRewards)
  self.Btn_Reward:SetGamePadImg("Y")
  if self.Key_Rewards then
    self.Key_Rewards:CreateGamepadKey("View")
  end
end

function WBP_ModArchive_Archive_C:OnSelected(Params)
  if Params then
    self.Owner = Params.Owner
    self.Index = Params.Index
  end
  self:SetFocus()
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
  self.GameInputModeSubsystem.OnInputMethodChanged:Add(self, self.RefreshOpInfoByInputDevice)
  self.CurInputDeviceType = self.GameInputModeSubsystem:GetCurrentInputType()
  if self.CurInputDeviceType == ECommonInputType.GamePad then
    self.Owner:SwitchComKeyTipsState(7)
  else
    self.Owner:SwitchComKeyTipsState(1)
  end
  self.HasSelected = true
  self.AllMods = DataMgr.ModGuideBookArchive
  self.UIName = self.Owner.WidgetName
  self.Keys = {}
  for archiveId, _ in pairs(self.AllMods) do
    table.insert(self.Keys, archiveId)
  end
  self.CurSelectItem = nil
  self:RefreshInfo()
end

function WBP_ModArchive_Archive_C:InitTab()
  local Tabs = {}
  for i, v in pairs(DataMgr.ModGuideBookArchiveTab) do
    local Tab = {
      Text = GText(v.Name),
      Idx = i
    }
    table.insert(Tabs, Tab)
  end
  local ConfigData = {
    Owner = self,
    ChildWidgetName = "TabSubTextItem",
    Tabs = Tabs,
    SoundFuncReceiver = self,
    SoundFunc = self.TabClickSoundFunc
  }
  self.ArchiveTab:Init(ConfigData)
  self.ArchiveTab:BindEventOnTabSelected(self, self.OnTabSelected)
  if self.CurTab then
    self.ArchiveTab:SelectTab(self.CurTab)
  else
    self.ArchiveTab:SelectTab(1)
  end
  self.TabNum = #Tabs
end

function WBP_ModArchive_Archive_C:OnTabSelected()
  DebugPrint("zwkjkj OnTabSelected")
  self.FirstSelected = true
  local NextTab = self.ArchiveTab:GetCurrentTabIndex()
  if self.CurTab then
    self.PreTab = self.CurTab
  end
  self.CurTab = NextTab
  self.List_ModArchive:ClearListItems()
  table.sort(self.Keys, function(a, b)
    local ModInfoA = self.AllMods[a]
    local ModInfoB = self.AllMods[b]
    local CanA = self:CheckHasGetReward(ModInfoA.ArchiveId)
    local CanB = self:CheckHasGetReward(ModInfoB.ArchiveId)
    if CanA ~= CanB then
      return not CanA
    end
    return ModInfoA.ArchiveId < ModInfoB.ArchiveId
  end)
  self:InitTabList()
end

function WBP_ModArchive_Archive_C:InitTabList()
  local Index = 0
  self:HandlePreTab()
  self.GroupInfo = {}
  self.Widgets = {}
  self.CanGetRewardGroups = {}
  local ModBookModsViewState = EMCache:Get("ModBookModsViewState", true)
  for i, ArchiveId in ipairs(self.Keys) do
    local ModInfo = self.AllMods[ArchiveId]
    if ModInfo.TabId == self.CurTab then
      Index = Index + 1
      local Content = NewObject(UIUtils.GetCommonItemContentClass())
      Content.Owner = self
      Content.Index = Index
      Content.Id = ModInfo.ArchiveId
      Content.ModList = ModInfo.ModList
      Content.RewardId = ModInfo.RewardId
      Content.UnlockCondition = ModInfo.UnlockCondition
      Content.ShowCondition = ModInfo.ShowCondition
      Content.Name = ModInfo.Name
      Content.TabId = ModInfo.TabId
      if ModBookModsViewState and ModBookModsViewState[ModInfo.ArchiveId] then
        Content.RedDotNewStates = ModBookModsViewState[ModInfo.ArchiveId]
      end
      
      function Content.AfterInitCallback(Widget)
      end
      
      local bCanGetReward = self:CheckCanGetReward(ModInfo.ArchiveId, ModInfo.ModList)
      Content.bCanGetReward = bCanGetReward
      self.List_ModArchive:AddItem(Content)
      self.GroupInfo[Index] = ModInfo
    end
  end
  self:RefreshBtnRewardState()
  DebugPrint("zwkkkkk InitTabList ", self:GetName(), self.CurGroupIndex, self.CurSelectedItemIndex, self.CurGroupId)
  self.List_ModArchive:NavigateToIndex(0)
end

function WBP_ModArchive_Archive_C:CheckCanGetReward(ArchiveId, ModList)
  local Avatar = GWorld:GetAvatar()
  for _, ModId in pairs(ModList) do
    if not Avatar.HoldMods[ModId] or Avatar.HoldModRewards[ArchiveId] then
      self.CanGetRewardGroups[ArchiveId] = false
      return false
    end
  end
  local Info = DataMgr.ModGuideBookArchive[ArchiveId]
  if not (not Info.ShowCondition or ConditionUtils.CheckCondition(Avatar, Info.ShowCondition)) or Info.UnlockCondition and not ConditionUtils.CheckCondition(Avatar, Info.UnlockCondition) then
    self.CanGetRewardGroups[ArchiveId] = false
    return false
  end
  self.CanGetRewardGroups[ArchiveId] = true
  return true
end

function WBP_ModArchive_Archive_C:CheckCanGetRewardOrder(ArchiveId, ModList)
  local Avatar = GWorld:GetAvatar()
  for _, ModId in pairs(ModList) do
    if not Avatar.HoldMods[ModId] or Avatar.HoldModRewards[ArchiveId] then
      return false
    end
  end
  return true
end

function WBP_ModArchive_Archive_C:CheckHasGetReward(ArchiveId)
  local Avatar = GWorld:GetAvatar()
  if Avatar.HoldModRewards[ArchiveId] then
    return true
  end
  return false
end

function WBP_ModArchive_Archive_C:CheckRewardRemain()
  for i, v in pairs(self.CanGetRewardGroups) do
    DebugPrint("\230\163\128\230\159\165\228\184\173 ", i, v)
    if v then
      return true
    end
  end
  return false
end

function WBP_ModArchive_Archive_C:RefreshBtnRewardState()
  DebugPrint("zwkzwk \229\136\183\230\150\176\230\140\137\233\146\174\231\138\182\230\128\129 ")
  if self:CheckRewardRemain() then
    self.Group_GetAll:SetVisibility(ESlateVisibility.Visible)
    if self.CurInputDeviceType == ECommonInputType.Gamepad then
      if self.Widgets[self.CurGroupIndex] then
        local Res = self.Widgets[self.CurGroupIndex]:CheckRewardCanGet()
        self.Owner:SwitchComKeyTipsState(7)
      end
    else
      self.Owner:SwitchComKeyTipsState(4)
    end
  else
    self.Group_GetAll:SetVisibility(ESlateVisibility.Collapsed)
    if self.CurInputDeviceType == ECommonInputType.Gamepad then
      self.Owner:SwitchComKeyTipsState(7)
    else
      self.Owner:SwitchComKeyTipsState(1)
    end
  end
  self.Node_ResourceBar:UpdateResource()
end

function WBP_ModArchive_Archive_C:OnGamepadFirstSelect()
  if self.Widgets and self.Widgets[1] then
    DebugPrint("\231\172\172\228\184\128\230\172\161Select Widget", self.Widgets[1]:GetName())
    if self.Owner.ShouldShowTips then
      return
    end
    if self.Owner.TabMain[self.Index] then
      local DelayFrame = 2
      self:AddDelayFrameFunc(function()
        if self.FirstSelected then
          self.List_ModArchive:SetSelectedIndex(0)
          self.List_ModArchive:ScrollIndexIntoView(0)
          self.Widgets[1]:SetItemSelected(1)
          self.Widgets[1].Mods[1]:SetFocus()
          self:TrySetMousePosition()
        end
      end, DelayFrame, "SelectFirstMod")
    else
      self.List_ModArchive:SetSelectedIndex(0)
      self.List_ModArchive:ScrollIndexIntoView(0)
      self.Widgets[1]:SetItemSelected(1)
      self.Widgets[1].Mods[1]:SetFocus()
      self:TrySetMousePosition()
    end
  end
end

function WBP_ModArchive_Archive_C:OnShowTipsClose()
  self:OnGamepadFirstSelect()
end

function WBP_ModArchive_Archive_C:UpdateListWidgets(Widget)
  DebugPrint("zwkkkkkkk Widget", Widget.Info.Index, #Widget.Info.ModList, Widget:GetName())
  self.Widgets[Widget.Info.Index] = Widget
end

function WBP_ModArchive_Archive_C:OnItemClicked(ModInfo, LockState, GroupIndex, Index, Widget, GroupId)
  DebugPrint("zwkkk123 GroupIndex", GroupIndex)
  self.FirstSelected = false
  if self.CurGroupIndex and self.CurGroupIndex ~= GroupIndex and self.Widgets and self.Widgets[self.CurGroupIndex] then
    self.Widgets[self.CurGroupIndex]:OnOtherArchiveItemSelected()
    self.Widgets[self.CurGroupIndex]:SetRewardTextVisibility(false)
  end
  self.CurGroupIndex = GroupIndex
  self.CurSelectedItemIndex = Index
  self.CurGroupId = GroupId
  if self.Widgets[self.CurGroupIndex] then
    self.Widgets[self.CurGroupIndex]:SetRewardTextVisibility(true)
    if self.CurInputDeviceType == ECommonInputType.GamePad then
      self.Owner:SwitchComKeyTipsState(7)
    end
  end
  self:SetTipsInfo(ModInfo, LockState)
  if self.CurInputDeviceType == ECommonInputType.Gamepad then
    self.Btn_Reward:SetGamePadVisibility(ESlateVisibility.SelfHitTestInvisible)
    self.Key_Rewards:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    if self.CanFocusTips then
    else
    end
  end
  self.CurItemWidget = Widget
  self.IsInViewTips = false
  local ModBookModsViewState = EMCache:Get("ModBookModsViewState", true)
  if ModBookModsViewState[GroupId] and ModBookModsViewState[GroupId][ModInfo.Id] then
    ModBookModsViewState[GroupId][ModInfo.Id] = false
    Widget:SetRedDot(nil)
    local ReddotNode = DataMgr.ModGuideBookArchiveTab[self.CurTab].ReddotNode
    local CacheDetail = ReddotManager.GetLeafNodeCacheDetail(ReddotNode)
    if CacheDetail.NewNum then
      CacheDetail.NewNum = CacheDetail.NewNum - 1
      if CacheDetail.States and CacheDetail.States[ModInfo.Id] then
        CacheDetail.States[ModInfo.Id] = false
      end
    end
    ReddotManager.DecreaseLeafNodeCount(ReddotNode, 1, CacheDetail)
  end
  EMCache:Set("ModBookModsViewState", ModBookModsViewState, true)
  self.Owner:RefreshDot()
end

function WBP_ModArchive_Archive_C:SetTipsInfo(ModInfo, LockState)
  if 2 == LockState then
    self.VB_Tips:SetVisibility(ESlateVisibility.Collapsed)
    self.List_ModStar:SetVisibility(ESlateVisibility.Collapsed)
    self.Text_ItemName:SetVisibility(ESlateVisibility.Collapsed)
    self.Panel_Hold:SetVisibility(ESlateVisibility.Collapsed)
    self.Group_Empty:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self.Text_Empty:SetText(GText("UI_ModGuideBook_Task_Block"))
    return
  else
    self.VB_Tips:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self.List_ModStar:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self.Text_ItemName:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self.Panel_Hold:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self.Group_Empty:SetVisibility(ESlateVisibility.Collapsed)
  end
  self.Text_ItemName:SetText(GText(ModInfo.TypeName) .. GText(ModInfo.Name))
  local FontMaterial = self.Text_ItemName:GetDynamicFontMaterial()
  if ModInfo.Rarity and ModInfo.Rarity > 0 then
    FontMaterial:SetTextureParameterValue("IconTex", self["Img_Text_" .. ModInfo.Rarity])
  else
    FontMaterial:SetTextureParameterValue("IconTex", self.Img_Text_0)
  end
  local PlayerAvatar = ModController:GetAvatar()
  local Count = 0
  if PlayerAvatar and ModInfo.Id and PlayerAvatar.GetModCount2ModId then
    Count = PlayerAvatar:GetModCount2ModId(ModInfo.Id)
  end
  self.Text_Hold02:SetText(Count)
  self.Text_Describe:SetText(GText(ModInfo.FunctionDes))
  self.Text_Polarity01:SetText(GText("UI_Tips_Polarity_Cost"))
  if ModInfo.Polarity ~= CommonConst.NonePolarity then
    self.Text_Polarity:SetVisibility(UIConst.VisibilityOp.Visible)
    local PolarityText = ModModel:GetPolarityText(ModInfo.Polarity)
    self.Text_Polarity:SetText(PolarityText)
  else
    self.Text_Polarity:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  self.Text_MaxLevel:SetText(ModInfo.MaxLevel)
  self.Text_Level:SetText(ModInfo.MaxLevel)
  self.Text_Polarity02:SetText(ModInfo.Cost + ModInfo.MaxLevel * ModInfo.CostChange)
  self:UpdataEffectDetails(ModInfo, ModInfo.MaxLevel)
  if self.Text_Tag then
    self.Text_Tag:SetVisibility(UIConst.VisibilityOp.Visible)
    local AppTypeTexts = {}
    for i, TagText in ipairs(DataMgr.ModTag[ModInfo.ApplicationType].ModTagText) do
      table.insert(AppTypeTexts, GText(TagText))
    end
    local AppTypeText = GText("UI_Tips_ModApplicationType") .. table.concat(AppTypeTexts, ", ")
    self.Text_Tag:SetText(AppTypeText)
  end
  self.Com_Tips_Line:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  self.Com_Tips_Line.Text_Level:SetText(GText("UI_ModTips_MaxLvPreview"))
  self.Com_Tips_Line.Bg02:SetColorAndOpacity(self.Com_Tips_Line.Yellow)
  self.Content = {Test = 1}
  self.Text_Hold01:SetText(GText("UI_Bag_Sellconfirm_Hold"))
  self.Text_TaskRewards:SetText(GText("UI_Tips_Obtining"))
  self:SetAccessItem("Mod", ModInfo.Id)
  self.List_ModStar:ClearListItems()
  local StarNum = ModInfo.Rarity
  local StarNum = ModInfo.ModCardLevelMax
  if StarNum and StarNum > 0 then
    self.List_ModStar:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    for i = 1, StarNum do
      local Content = NewObject(UIUtils.GetCommonItemContentClass())
      Content.bActivate = false
      self.List_ModStar:AddItem(Content)
    end
  else
    self.List_ModStar:SetVisibility(ESlateVisibility.Collapsed)
  end
  if ModInfo and ModInfo.ApplySlot and 1 == #ModInfo.ApplySlot and 9 == ModInfo.ApplySlot[1] then
    self.Icon_Halo:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  else
    self.Icon_Halo:SetVisibility(ESlateVisibility.Collapsed)
  end
end

function WBP_ModArchive_Archive_C:UpdataEffectDetails(ModDataInfo, ModLevel)
  self.EffectDetails:ClearChildren()
  local ModAttrs = ModDataInfo.AddAttrs
  if ModAttrs then
    for _, ModAttr in ipairs(ModAttrs) do
      local AttrConfig = DataMgr.AttrConfig[ModAttr.AttrName]
      if not AttrConfig then
      else
        local _, ValueStr = ArmoryUtils:GenModAttrData(ModAttr, ModLevel, AttrConfig, ModDataInfo.Id)
        local ModAttrText = GText(AttrConfig.Name) .. ValueStr
        local EffectItem = UIManager(self):_CreateWidgetNew("CommonItemDetailsEffect")
        EffectItem.Text_Effect:SetText(ModAttrText)
        EffectItem.Switch_Type:SetActiveWidgetIndex(0)
        self.EffectDetails:AddChild(EffectItem)
      end
    end
  end
  if ModDataInfo.PassiveEffectsDesc then
    local ModDescText = ArmoryUtils:GenModPassiveEffectDesc(ModDataInfo, ModLevel)
    local EffectItem = UIManager(self):_CreateWidgetNew("CommonItemDetailsEffect")
    EffectItem.Text_Effect01:SetText(GText("UI_MOD_Effect") .. ModDescText)
    EffectItem.Switch_Type:SetActiveWidgetIndex(1)
    self.EffectDetails:AddChild(EffectItem)
  end
end

function WBP_ModArchive_Archive_C:GetMods()
  if not self.HasMod then
    self.HasMod = {}
  end
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    for ModId, GetTime in pairs(Avatar.HoldMods) do
      DebugPrint("zwki ", ModId, GetTime)
      self.HasMod[ModId] = true
    end
  end
end

function WBP_ModArchive_Archive_C:GetAllModItem()
  for i = 1, self.List_ModArchive:GetNumItems() do
    local v = self.List_ModArchive:GetItemAt(i - 1)
    if not (v and v.SelfWidget) or v.SelfWidget.Mods then
    end
  end
end

function WBP_ModArchive_Archive_C:OnClickGetAllRewards()
  local Avatar = GWorld:GetAvatar()
  
  local function CallBack(ErrCode, Rewards)
    DebugPrint("zwzwkzwk ", ErrorCode, ErrorCode:Check(ErrCode), self:GetName())
    if ErrorCode:Check(ErrCode) then
      UIUtils.ShowGetItemPageAndOpenBagIfNeeded(nil, nil, nil, Rewards, false, function()
        if self.CurInputDeviceType == ECommonInputType.MouseAndKeyboard then
          self:SetFocus()
        end
      end, self, false)
      for _, Widget in pairs(self.Widgets) do
        if Widget then
          Widget:SetReward()
        end
      end
      local ModBookCanGetRewards = EMCache:Get("ModBookCanGetRewards", true)
      for ArchiveId, bCanGetReward in pairs(self.CanGetRewardGroups) do
        if bCanGetReward then
          self.CanGetRewardGroups[ArchiveId] = false
        end
        if ModBookCanGetRewards and ModBookCanGetRewards[ArchiveId] then
          ModBookCanGetRewards[ArchiveId] = false
        end
        EMCache:Set("ModBookCanGetRewards", ModBookCanGetRewards, true)
        self.Owner:RefreshDot()
      end
      local ReddotNode = DataMgr.ModGuideBookArchiveTab[self.CurTab].ReddotNode
      local CacheDetail = ReddotManager.GetLeafNodeCacheDetail(ReddotNode)
      local RedNum = 0
      if CacheDetail.RedNum then
        RedNum = CacheDetail.RedNum
        CacheDetail.RedNum = 0
      end
      ReddotManager.DecreaseLeafNodeCount(ReddotNode, RedNum, CacheDetail)
      if CacheDetail.NewNum and CacheDetail.NewNum > 0 then
        self.ArchiveTab:ShowTabRedDot(self.CurTab, true, false)
      else
        self.ArchiveTab:ShowTabRedDot(self.CurTab, false, false)
      end
      self:RefreshBtnRewardState()
    end
  end
  
  local Ids = {}
  for ArchiveId, bCanGetReward in pairs(self.CanGetRewardGroups) do
    if bCanGetReward then
      table.insert(Ids, ArchiveId)
    end
  end
  Avatar:GetAllModGuideBookArchiveReward(Ids, CallBack)
end

function WBP_ModArchive_Archive_C:SetAccessItem(ItemType, ItemId)
  self.Method:ClearChildren(ItemType, ItemId)
  local ItemInfo = DataMgr[ItemType][ItemId]
  assert(ItemInfo, "\228\184\141\229\173\152\229\156\168\232\175\165\231\137\169\229\147\129\239\188\154", ItemType, ItemId)
  self.Panel_Method:SetVisibility(ESlateVisibility.Collapsed)
  self.Access = {}
  if ItemInfo.AccessKey then
    for _, Access in pairs(ItemInfo.AccessKey) do
      PageJumpUtils:GetItemAccess(self, ItemId, ItemType, Access, self.UIName)
    end
    PageJumpUtils:SortAccessItem(self.Method)
    local Tips = self.Method:GetChildrenCount()
    if Tips > 0 then
      self.Panel_Method:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
      local TipsChildren = self.Method:GetAllChildren()
      for i = 1, TipsChildren:Length() do
        local Child = TipsChildren:Get(i)
        if Child.JumpFunc then
          local Func = Child.JumpFunc
          
          function Child.JumpFunc()
            CommonUtils:CloseGuideTouchIfExist(self)
            Func()
          end
          
          self.CanFocusTips = true
          table.insert(self.Access, Child)
        end
      end
    end
  end
end

function WBP_ModArchive_Archive_C:TabClickSoundFunc()
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_level_03", nil, nil)
end

function WBP_ModArchive_Archive_C:TrySetMousePosition()
  if self.CurInputDeviceType == ECommonInputType.Gamepad then
    ULowEntryExtendedStandardLibrary.SetMousePositionInPercentages(0.0, 0.0)
  end
end

function WBP_ModArchive_Archive_C:TryGetAllRewards()
  if self:CheckRewardRemain() then
    self:OnClickGetAllRewards()
  end
end

function WBP_ModArchive_Archive_C:RefreshInfo()
  DebugPrint("\232\129\154\231\132\166\229\155\158\230\157\165\228\186\134 WBP_ModArchive_Archive_C")
  local PreGroupId = 0
  if self.CurGroupIndex then
    PreGroupId = self.CurGroupId
  end
  local PreIndex = 0
  if self.CurSelectedItemIndex then
    PreIndex = self.CurSelectedItemIndex
  end
  self:GetMods()
  self:InitTab()
  self:SetVisibility(ESlateVisibility.Visibility)
  self:PlayAnimation(self.In)
  self.Btn_Reward:SetText(GText("UI_Achievement_GetAllReward"))
  local SystemUIConfig = DataMgr.SystemUI.ModArchiveMain
  local TopResource = SystemUIConfig.TabCoin
  self.Node_ResourceBar:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  self.Node_ResourceBar:InitResourceBar(TopResource)
  local ResourceBarIcon = UIUtils.UtilsGetKeyIconPathInGamepad("RS", self.CurGamepadName)
  self.Node_ResourceBar:SetGamePadKeyImgByPath(ResourceBarIcon)
end

function WBP_ModArchive_Archive_C:ReceiveEnterState(StackAction)
  WBP_ModArchive_Archive_C.Super.ReceiveEnterState(self, StackAction)
  DebugPrint("zwkkk ReceiveEnterState WBP_ModArchive_Archive_C")
end

function WBP_ModArchive_Archive_C:RefreshTabNew(SubTabNew)
  for i = 1, self.TabNum do
    if SubTabNew[i] then
      self.ArchiveTab:ShowTabRedDot(i, true, false)
    else
      self.ArchiveTab:ShowTabRedDot(i, false, false)
    end
  end
end

function WBP_ModArchive_Archive_C:RefreshTabReddot(SubTabRed)
  for i = 1, self.TabNum do
    if SubTabRed[i] then
      self.ArchiveTab:ShowTabRedDot(i, false, true)
    end
  end
end

function WBP_ModArchive_Archive_C:AddTabReddotListen()
  for i = 1, #DataMgr.ModGuideBookArchiveTab do
    local ReddotName = DataMgr.ModGuideBookArchiveTab[i].ReddotNode
    if ReddotName then
      ReddotManager.AddListenerEx(ReddotName, self, function(self, Count, RdType, RdName)
        if Count > 0 then
          if RdType == EReddotType.Normal then
            if self.ArchiveTab then
              self.ArchiveTab:ShowTabRedDot(i, false, true)
            end
          elseif RdType == EReddotType.New and self.ArchiveTab then
            self.ArchiveTab:ShowTabRedDot(i, true, false)
          end
        elseif self.ArchiveTab then
          self.ArchiveTab:ShowTabRedDot(i, false, false)
        end
      end)
    end
  end
end

function WBP_ModArchive_Archive_C:OnNodeChange(Count, RdType, RdName)
  if Count > 0 then
    if RdType == EReddotType.Normal then
      if self.ArchiveTab then
        self.ArchiveTab:ShowTabRedDot(self.CurTab, false, true)
      end
    elseif RdType == EReddotType.New and self.ArchiveTab then
      self.ArchiveTab:ShowTabRedDot(self.CurTab, true, false)
    end
  elseif self.ArchiveTab then
    self.ArchiveTab:ShowTabRedDot(self.CurTab, false, false)
  end
end

function WBP_ModArchive_Archive_C:RemoveTabReddotListen()
  for i = 1, #DataMgr.ModGuideBookArchiveTab do
    local ReddotName = DataMgr.ModGuideBookArchiveTab[i].ReddotNode
    if ReddotName then
      ReddotManager.RemoveListener(ReddotName, self)
    end
  end
end

function WBP_ModArchive_Archive_C:OnTipsOpenChanged(bIsOpen)
  self.Owner:OnTipsOpenChanged(bIsOpen)
  if self.CurInputDeviceType ~= ECommonInputType.GamePad then
    return
  end
  if bIsOpen then
    self.Node_ResourceBar:HideGamePadKey(true)
    self.ArchiveTab.Key_Left:SetVisibility(ESlateVisibility.Hidden)
    self.ArchiveTab.Key_Right:SetVisibility(ESlateVisibility.Hidden)
  else
    self.Node_ResourceBar:HideGamePadKey(false)
    self.ArchiveTab.Key_Left:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self.ArchiveTab.Key_Right:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  end
end

function WBP_ModArchive_Archive_C:OnMenuOpenChanged(bIsOpen)
  self.Owner:OnTipsOpenChanged(bIsOpen)
  if self.CurInputDeviceType ~= ECommonInputType.GamePad then
    return
  end
end

function WBP_ModArchive_Archive_C:HandlePreTab()
  if not self.GroupInfo then
    return
  end
  local ModBookModsViewState = EMCache:Get("ModBookModsViewState", true)
  if not ModBookModsViewState then
    return
  end
  local Num = 0
  for _, ModInfo in pairs(self.GroupInfo) do
    if ModInfo then
      for i = 1, #ModInfo.ModList do
        local ModId = ModInfo.ModList[i]
        if ModBookModsViewState and ModBookModsViewState[ModInfo.ArchiveId] and ModBookModsViewState[ModInfo.ArchiveId][ModId] then
          Num = Num + 1
          ModBookModsViewState[ModInfo.ArchiveId][ModId] = false
        end
      end
    end
  end
  EMCache:Set("ModBookModsViewState", ModBookModsViewState, true)
  self.Owner:RefreshDot()
  if self.PreTab then
    local ReddotNode = DataMgr.ModGuideBookArchiveTab[self.PreTab].ReddotNode
    local CacheDetail = ReddotManager.GetLeafNodeCacheDetail(ReddotNode)
    local DecreaseNum = 0
    if CacheDetail.NewNum then
      DecreaseNum = CacheDetail.NewNum
      CacheDetail.NewNum = 0
      CacheDetail.States = nil
    end
    ReddotManager.DecreaseLeafNodeCount(ReddotNode, DecreaseNum, CacheDetail)
  end
end

function WBP_ModArchive_Archive_C:PreClose()
  if not self.PreTab then
    self.PreTab = 1
  end
  self:HandlePreTab()
end

function WBP_ModArchive_Archive_C:OnKeyDown(MyGeometry, InKeyEvent)
  local IsEventHandled = false
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) then
    DebugPrint("zwk    Key_IsGamepadKey", InKeyName)
    IsEventHandled = self:Handle_OnGamePadDown(InKeyName)
  else
    DebugPrint("zwk    Key_IsPC", InKeyName)
    IsEventHandled = self:Handle_OnPCDown(InKeyName)
  end
  if IsEventHandled then
    return UE4.UWidgetBlueprintLibrary.Handled()
  else
    return UE4.UWidgetBlueprintLibrary.UnHandled()
  end
end

function WBP_ModArchive_Archive_C:Handle_OnPCDown(InKeyName)
  if "A" == InKeyName then
    self.ArchiveTab:TabToLeft()
    return true
  elseif "D" == InKeyName then
    self.ArchiveTab:TabToRight()
    return true
  elseif "SpaceBar" == InKeyName then
    self:OnSpaceBarKeyDown()
    return true
  end
  return false
end

function WBP_ModArchive_Archive_C:OnSpaceBarKeyDown()
  self:TryGetAllRewards()
end

function WBP_ModArchive_Archive_C:Handle_OnGamePadDown(InKeyName)
  DebugPrint("zwkkk  Handle_OnGamePadDown", InKeyName, self:GetName())
  if "Gamepad_DPad_Up" == InKeyName or "Gamepad_LeftStick_Up" == InKeyName then
    return true
  elseif "Gamepad_FaceButton_Right" == InKeyName then
    if self.IsInViewTips and self.CurItemWidget then
      DebugPrint("\232\191\148\229\155\158\232\129\154\231\132\166\239\188\154", self.CurItemWidget:GetName())
      self.CurItemWidget:SetFocus()
      self.IsInViewTips = false
      self.Owner:SwitchComKeyTipsState(7)
    elseif self.Widgets[self.CurGroupIndex] and self.Widgets[self.CurGroupIndex].RewardInFocus then
      self.Widgets[self.CurGroupIndex].RewardInFocus = false
      if self.CurItemWidget then
        self.CurItemWidget:SetFocus()
        self.Widgets[self.CurGroupIndex]:SetRewardTextVisibility(true)
        self.IsInViewRewards = false
        self.Owner:SwitchComKeyTipsState(7)
      end
    else
      self.Owner:OnClose()
    end
    return true
  elseif "Gamepad_FaceButton_Top" == InKeyName then
    self:TryGetAllRewards()
    return true
  elseif "Gamepad_FaceButton_Left" == InKeyName then
    return true
  elseif "Gamepad_RightThumbstick" == InKeyName then
    if self.CurItemWidget then
      self.Node_ResourceBar:SetLastFocusWidget(self.CurItemWidget)
    end
    self.Node_ResourceBar:FocusToResource()
    return true
  elseif "Gamepad_LeftThumbstick" == InKeyName then
    if self.Widgets[self.CurGroupIndex] and not self.IsInViewTips then
      self.Widgets[self.CurGroupIndex]:OnLBKeyDown()
      if self.Widgets[self.CurGroupIndex].Item_Title.IsShowDetails then
        self.Owner:SwitchComKeyTipsState(2)
      else
        self.Owner:SwitchComKeyTipsState(6)
      end
      self.IsInViewRewards = true
    end
    return true
  elseif "Gamepad_LeftTrigger" == InKeyName then
    self.ArchiveTab:TabToLeft()
    return true
  elseif "Gamepad_RightTrigger" == InKeyName then
    self.ArchiveTab:TabToRight()
    return true
  elseif "Gamepad_Special_Left" == InKeyName then
    if self.CanFocusTips and not self.IsInViewTips and #self.Access > 0 and not self.IsInViewRewards then
      self.IsInViewTips = true
      self.Access[1]:SetFocus()
      self.Owner:SwitchComKeyTipsState(3)
    end
    return true
  end
  return false
end

function WBP_ModArchive_Archive_C:OnKeyUp(MyGeometry, InKeyEvent)
  local IsEventHandled = false
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) then
    IsEventHandled = self:Handle_OnGamePadUp(InKeyName)
  end
  if IsEventHandled then
    return UE4.UWidgetBlueprintLibrary.Handled()
  else
    return UE4.UWidgetBlueprintLibrary.UnHandled()
  end
end

function WBP_ModArchive_Archive_C:Handle_OnGamePadUp(InKeyName)
  DebugPrint("zwkkk  Handle_OnGamePadUp", InKeyName, self:GetName())
  if "Gamepad_FaceButton_Bottom" == InKeyName then
    return true
  end
  return false
end

function WBP_ModArchive_Archive_C:OnResourceBarAddedToFocusPath()
  DebugPrint("zwkkkkk OnResourceBarAddedToFocusPath")
  self:EnterResourceSelectMode()
  self.Node_ResourceBar:UpdateResource()
end

function WBP_ModArchive_Archive_C:OnResourceBarRemovedFromFocusPath()
  DebugPrint("zwkkkkk OnResourceBarRemovedFromFocusPath")
  self:ExitResourceSelectMode()
end

function WBP_ModArchive_Archive_C:EnterResourceSelectMode()
  if self.CurInputDeviceType == ECommonInputType.Gamepad then
    self.ArchiveTab.Key_Left:SetVisibility(UIConst.VisibilityOp.Hidden)
    self.ArchiveTab.Key_Right:SetVisibility(UIConst.VisibilityOp.Hidden)
  end
end

function WBP_ModArchive_Archive_C:ExitResourceSelectMode()
  if self.CurInputDeviceType == ECommonInputType.Gamepad then
    self.ArchiveTab.Key_Left:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    self.ArchiveTab.Key_Right:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    DebugPrint("zwkkkkk \231\166\187\229\188\128\232\181\132\230\186\144\233\128\137\230\139\169", self.CurGroupIndex, self.CurSelectedItemIndex)
  end
end

function WBP_ModArchive_Archive_C:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  DebugPrint("zwkkk   RefreshOpInfoByInputDevice ", CurInputDevice, CurGamepadName)
  if self.CurInputDeviceType == CurInputDevice then
    return
  end
  self.CurInputDeviceType = CurInputDevice
  self.CurGamepadName = CurGamepadName
  self:UpdateOnInputDeviceTypeChange()
end

function WBP_ModArchive_Archive_C:UpdateOnInputDeviceTypeChange()
  if self.CurInputDeviceType == ECommonInputType.Gamepad then
    if self.Widgets[self.CurGroupIndex] and self.Widgets[self.CurGroupIndex].Key_TitleReward and not self.Widgets[self.CurGroupIndex].Item_Title:HasAnyUserFocus() then
      self.Widgets[self.CurGroupIndex].Key_TitleReward:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    end
    self.Key_Rewards:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  elseif self.CurInputDeviceType == ECommonInputType.MouseAndKeyboard then
    if self.Widgets[self.CurGroupIndex] and self.Widgets[self.CurGroupIndex].Key_TitleReward then
      self.Widgets[self.CurGroupIndex].Key_TitleReward:SetVisibility(ESlateVisibility.Collapsed)
    end
    if self.Key_Rewards then
      self.Key_Rewards:SetVisibility(ESlateVisibility.Collapsed)
    end
  end
end

return WBP_ModArchive_Archive_C
