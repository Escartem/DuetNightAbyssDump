require("UnLua")
local TimeUtils = require("Utils.TimeUtils")
local PageJumpUtils = require("Utils.PageJumpUtils")
local EMCache = require("EMCache.EMCache")
local G = Class({
  "Blueprints.UI.BP_UIState_C"
})

function G:Construct()
  self.PoolTab_1.Btn_Click.OnClicked:Add(self, self.OnLeftSubTabClicked)
  self.PoolTab_2.Btn_Click.OnClicked:Add(self, self.OnRightSubTabClicked)
  self.Btn_Detail:SetText(GText("UI_GACHA_DETAIL"))
  self.Btn_Detail:BindEventOnClicked(self, self.OnClickBtnRecord)
  self.Btn_History:SetText(GText("UI_GACHA_LIST"))
  self.Btn_History:BindEventOnClicked(self, self.OnClickBtnHistory)
  self.Btn_Gacha_Choose.Text_ChooseBtn:SetText(GText("UI_Gacha_Start_Select"))
  self.Btn_Gacha_Choose.Btn_Choose.OnClicked:Add(self, self.OnClickBtnSelect)
  self.Btn_Gacha_Choose.Btn_Choose.OnHovered:Add(self, self.OnHoverBtnSelect)
  self.Btn_Change.Button_Area.OnClicked:Add(self, self.OnClickBtnChange)
  self.Btn_Shop:BindEventOnClicked(self, self.OnClickBtnShop)
  self.Btn_Once:BindEventOnClicked(self, self.OnClickBtnGachaOnce)
  
  function self.Btn_Once.SoundFunc()
    AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_confirm", nil, nil)
  end
  
  self.Btn_Tentimes:SetText(GText("UI_GACHA_TEN"))
  self.Btn_Tentimes:BindEventOnClicked(self, self.OnClickBtnGachaTentimes)
  
  function self.Btn_Tentimes.SoundFunc()
    AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_confirm", nil, nil)
  end
  
  self.IsGachaMainInvalid = false
end

function G:InitUIInfo(Name, IsInUIMode, EventList, ...)
  self.Super.InitUIInfo(self, Name, IsInUIMode, EventList, ...)
  AudioManager(self):PlayUISound(self, "event:/ui/armory/open", "GachaMain", nil)
end

function G:OnLoaded(...)
  self.Super.OnLoaded(self, ...)
  self.IsAutoClose = false
  self.InitParams = (...) or {}
  self.IsAutoClose = self.InitParams.IsAutoClose
  self.CallBackObj = self.InitParams.CallBackObj
  self.CallBackFunc = self.InitParams.CallBackFunc
  self.InitGachaTabId = self.InitParams.InitGachaTabId
  self.NowTabId = 1
  self.LoadUIAnchor:ClearChildren()
  self.Bg_Anchor:ClearChildren()
  self:UnLoadNavMeshLevel()
  self:InitRpcEvent()
  self:InitGachaList()
  self:InitValidGachaPool()
end

function G:InitValidGachaPool()
  local Avatar = GWorld:GetAvatar()
  local GachaData = DataMgr.Gacha
  if not Avatar then
    return
  end
  local ValidGachaPool = {}
  local ValidGachaTabMapPool = {}
  for GachaId, Gacha in pairs(Avatar.GachaPool) do
    if 1 == Gacha.Usable then
      local GachaInfo = GachaData[GachaId]
      if GachaInfo then
        local ConditionId = GachaInfo.ConditionId
        local ConditionSucc = true
        if ConditionId then
          ConditionSucc = ConditionUtils.CheckCondition(Avatar, ConditionId)
        end
        if ConditionSucc then
          ValidGachaPool[GachaId] = {
            GachaId = GachaId,
            Sequence = GachaInfo.Sequence or 0,
            GachaName = GachaInfo.GachaName,
            GachaType = GachaInfo.GachaType
          }
        end
      end
    end
  end
  for TabId, TabInfo in pairs(DataMgr.GachaTab) do
    for _, GachaId in pairs(TabInfo.GachaId) do
      if ValidGachaPool[GachaId] then
        if ValidGachaTabMapPool[TabId] then
          table.insert(ValidGachaTabMapPool[TabId], ValidGachaPool[GachaId])
        else
          ValidGachaTabMapPool[TabId] = {}
          table.insert(ValidGachaTabMapPool[TabId], ValidGachaPool[GachaId])
        end
      end
    end
  end
  self.ValidGachaTab = {}
  for TabId, Data in pairs(ValidGachaTabMapPool) do
    table.sort(Data, function(a, b)
      if a.Sequence == b.Sequence then
        return a.GachaId > b.GachaId
      else
        return a.Sequence > b.Sequence
      end
    end)
    table.insert(self.ValidGachaTab, {
      TabId = TabId,
      TabSequence = DataMgr.GachaTab[TabId].Sequence or 0,
      ValidGachaPools = Data
    })
  end
  table.sort(self.ValidGachaTab, function(a, b)
    if a.TabSequence == b.TabSequence then
      return a.TabId < b.TabId
    else
      return a.TabSequence > b.TabSequence
    end
  end)
  if #self.ValidGachaTab <= 0 then
    self.IsGachaMainInvalid = true
    DebugPrint(ErrorTag, "---jzn---\229\141\161\230\177\160\230\138\189\229\185\178\228\186\134---")
    self:OnClickBtnClose()
    return
  end
  self:CheckShopLockState()
  self:InitGachaMain(self.InitGachaTabId)
  self:RefreshResourceConsume()
  self:PlayInAnim()
  self:InitGachaCountDown()
end

function G:UnLoadNavMeshLevel()
  local GameInstance = GWorld.GameInstance
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(GameInstance, 0)
  local RegionId = Player:GetRegionId()
  self.IsUnLoadNavMesh = false
  if RegionId == CommonConst.GachaRegionId then
    DebugPrint("----jzn---\229\134\176\230\185\150\229\159\142\230\137\147\229\188\128\230\138\189\229\141\161\229\141\184\232\189\189\229\175\188\232\136\170\231\189\145\230\160\188---")
    self.IsUnLoadNavMesh = true
    URuntimeCommonFunctionLibrary.UnloadNavMeshLevel(Player:GetWorld())
  end
end

function G:CheckShopLockState()
  local UIUnlockRuleId = "Shop"
  self.ShopIsUnlock = false
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    self.ShopIsUnlock = Avatar:CheckUIUnlocked(UIUnlockRuleId)
  end
  if self.ShopIsUnlock then
    self.Group_Shop:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  else
    self.Group_Shop:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
end

function G:InitGachaMain(InitGachaTabId)
  self.CommonTabInfo = {}
  self.GachaIdMapBg = {}
  self.GachaRecordsCache = nil
  self.GuaranteedDict = nil
  self.IsPCPlatform = CommonUtils.GetDeviceTypeByPlatformName(self) == "PC"
  self.VoiceEventInstance = nil
  self.OpenUI = "GachaMain"
  self:InitCommonTab(InitGachaTabId)
  self.Group_UpItem:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self:SetFocus()
end

function G:InitCommonTab(InitGachaTabId)
  if self.IsPCPlatform then
    self.Common_Tab = self.Com_Tab_P
    self.Common_Tab:Init({
      DynamicNode = {
        "Back",
        "ResourceBar",
        "BottomKey"
      },
      LeftKey = "NotShow",
      RightKey = "NotShow",
      bShowBubble = true,
      TitleName = GText("MAIN_UI_GACHA"),
      InfoCallback = "NotShow",
      BottomKeyInfo = {
        Desc = GText("UI_BACK")
      },
      StyleName = "Text",
      OwnerPanel = self,
      BackCallback = self.OnClickBtnClose
    })
    self.Common_Tab.BackgroundBlur_Bottom:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.Common_Tab.Bg_Bottom:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.Key_GamePad_Shop:CreateCommonKey({
      KeyInfoList = {
        {
          ImgShortPath = UIConst.GamePadImgKey.LeftThumb,
          Type = "Img"
        }
      },
      Desc = GText("UI_CTL_Shop_Main")
    })
    self.Key_GamePad_History:CreateCommonKey({
      KeyInfoList = {
        {
          ImgShortPath = UIConst.GamePadImgKey.SpecialLeft,
          Type = "Img"
        }
      },
      Desc = GText("UI_GACHA_LIST")
    })
    self.Key_GamePad_Detail:CreateCommonKey({
      KeyInfoList = {
        {
          ImgShortPath = UIConst.GamePadImgKey.SpecialRight,
          Type = "Img"
        }
      },
      Desc = GText("UI_GACHA_DETAIL")
    })
    self.Key_Change:CreateGamepadKey(UIConst.GamePadImgKey.DPadUp)
    self.Key_GamePad_L:CreateGamepadKey(UIConst.GamePadImgKey.LeftTriggerThreshold)
    self.Key_GamePad_R:CreateGamepadKey(UIConst.GamePadImgKey.RightTriggerThreshold)
    self.Key_ListLeft:CreateGamepadKey(UIConst.GamePadImgKey.LeftShoulder)
    self.Key_ListRight:CreateGamepadKey(UIConst.GamePadImgKey.RightShoulder)
    self.Btn_Gacha_Choose.Key_BtnSign:CreateGamepadKey(UIConst.GamePadImgKey.FaceButtonTop)
    self.Btn_Once:SetGamePadImg(UIConst.GamePadImgKey.FaceButtonLeft)
    self.Btn_TenTimes:SetGamePadImg(UIConst.GamePadImgKey.FaceButtonTop)
  else
    self.Common_Tab = self.Com_Tab_M
    self.Common_Tab:Init({
      DynamicNode = {
        "Back",
        "ResourceBar"
      },
      InfoCallback = "NotShow",
      bShowBubble = true,
      TitleName = GText("MAIN_UI_GACHA"),
      StyleName = "Text",
      OwnerPanel = self,
      BackCallback = self.OnClickBtnClose
    })
    self.Common_Tab.Panel_Tab:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
  if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
    self:InitGamepadView()
  else
    self:InitKeyboardView()
  end
  self:InitListPool(InitGachaTabId)
end

function G:InitListPool(InitGachaTabId)
  local TabIndex = 0
  self.NowTabId = 1
  self.NowSubTabId = 1
  self.MaxTabNum = 0
  for i = 0, self.List_Pool:GetNumItems() - 1 do
    local Item = self.List_Pool:GetItemAt(i)
    if Item and Item.SelfWidget then
      Item.SelfWidget.IsSelected = false
    end
  end
  self.List_Pool:ClearListItems()
  
  local function AddListItem()
    TabIndex = TabIndex + 1
    local Data = self.ValidGachaTab[TabIndex]
    if Data then
      self.MaxTabNum = TabIndex
      local PoolContent = NewObject(UIUtils.GetCommonItemContentClass())
      PoolContent.Id = TabIndex
      PoolContent.TabId = Data.TabId
      PoolContent.IsSelected = false
      if InitGachaTabId then
        if InitGachaTabId == Data.TabId then
          self.NowTabId = TabIndex
          PoolContent.IsSelected = true
        end
      elseif self.NowTabId == TabIndex then
        PoolContent.IsSelected = true
      end
      PoolContent.IsShowUp = false
      PoolContent.IsEmpty = false
      for key, value in pairs(Data.ValidGachaPools) do
        local GachaInfo = DataMgr.Gacha[value.GachaId]
        if GachaInfo and GachaInfo.IsShowSpecialTitle then
          PoolContent.IsShowUp = true
        end
      end
      PoolContent.ParentWidget = self
      self.List_Pool:AddItem(PoolContent)
    else
      self:AddTimer(0.01, function()
        local ListItemUIs = self.List_Pool:GetDisplayedEntryWidgets()
        local EmptyCount = UIUtils.GetListViewContentMaxCount(self.List_Pool, ListItemUIs) - ListItemUIs:Length()
        for i = 1, EmptyCount do
          local Content = NewObject(UIUtils.GetCommonItemContentClass())
          Content.IsEmpty = true
          self.List_Pool:AddItem(Content)
        end
      end)
      self:AddTimer(0.033, function()
        self.List_Pool:ScrollIndexIntoView(0)
      end)
      if self:IsExistTimer("AddListItem") then
        self:RemoveTimer("AddListItem")
      end
    end
  end
  
  self:AddTimer(0.033, AddListItem, true, 0.1, "AddListItem", true)
  self.NowGachaId = self.ValidGachaTab[self.NowTabId].ValidGachaPools[self.NowSubTabId].GachaId
end

function G:InitRpcEvent()
  self:AddDispatcher(EventID.OnDrawGacha, self, self.OnDrawGacha)
  self:AddDispatcher(EventID.OnGachaPoolUpdate, self, self.OnGachaPoolUpdate)
  self:AddDispatcher(EventID.OnPurchaseShopItemSuccess, self, self.OnPurchaseShopItemSuccess)
  self:AddDispatcher(EventID.GameViewportInputKeyReleased, self, self.HandleKeyReleased)
end

function G:InitGachaCountDown()
  self:AddTimer(1.0, self.RefreshGachaCountDown, true, 0.1, "RefreshGachaCountDown", true)
end

function G:RefreshGachaCountDown()
  local GachaInfo = DataMgr.Gacha[self.NowGachaId]
  if self.NowGachaId and GachaInfo and not GachaInfo.IsHideCountdown then
    self.HB_Time:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    local RemainTimeDict, TimeCount = UIUtils.GetLeftTimeStrStyle2(GachaInfo.GachaEndTime)
    self.Com_Time:SetTimeText(GText("UI_Mail_Date_Remain"), RemainTimeDict)
  else
    self.HB_Time:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
end

function G:OnGachaPoolUpdate()
  local CommonDialogParams = {}
  
  function CommonDialogParams.RightCallbackFunction()
    self:OnClickBtnClose()
  end
  
  UIManager(self):ShowCommonPopupUI(100032, CommonDialogParams)
end

function G:OnUpdateUIStyleByInputTypeChange(CurInputType, CurGamepadName)
  self.Super.OnUpdateUIStyleByInputTypeChange(self, CurInputType, CurGamepadName)
  if not self.IsPCPlatform then
    return
  end
  if self:CheckScreenShotWidget() then
    return
  end
  if self.GachaAnime and self.GachaAnime:IsValid() and self.GachaAnime:IsVisible() then
    self.GachaAnime:OnParentUpdateUIStyleByInputTypeChange(CurInputType, CurGamepadName)
    return
  end
  if self.GachaSelect and self.GachaSelect:IsValid() and self.GachaSelect:IsVisible() then
    self.GachaSelect:OnParentUpdateUIStyleByInputTypeChange(CurInputType, CurGamepadName)
    return
  end
  if CurInputType == ECommonInputType.Gamepad then
    self:InitGamepadView()
  else
    self:InitKeyboardView()
  end
end

function G:CheckScreenShotWidget()
  if self.GachaScreenShotWidget and self.GachaScreenShotWidget:IsValid() and self.GachaScreenShotWidget:IsVisible() then
    self.GachaScreenShotWidget:SetFocus()
    return true
  end
  return false
end

function G:InitGamepadView()
  local GameInputModeSubsystem = UIManager(self):GetGameInputModeSubsystem(self)
  GameInputModeSubsystem:SetNavigateWidgetOpacity(1)
  if self.OpenUI == "GachaMain" then
    if not self.CantClick and self:HasAnyFocus() then
      self:SetFocus()
    end
  elseif self.OpenUI == "GachaOnce" then
    if self.GachaOnceUI then
      self.GachaOnceUI:SetFocus()
      self.GachaOnceUI.GamePadState = "GachaOnceMain"
    end
  elseif self.OpenUI == "GachaTen" and self.GachaTentimesUI then
    self.GachaTentimesUI:SetFocus()
    self.GachaOnceUI.GamePadState = "TenTimesMain"
  end
  self.Switch_Key:SetActiveWidgetIndex(1)
  self.Btn_Gacha_Choose.WS_BtnSign:SetActiveWidgetIndex(1)
  self.Key_Change:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  self.Key_GamePad_L:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  self.Key_GamePad_R:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  self.Key_ListLeft:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  self.Key_ListRight:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  self.Btn_Once.Img_GamePad:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  self.Btn_TenTimes.Img_GamePad:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
end

function G:InitKeyboardView()
  if not self.IsPCPlatform then
    return
  end
  self.Switch_Key:SetActiveWidgetIndex(0)
  self.Btn_Gacha_Choose.WS_BtnSign:SetActiveWidgetIndex(0)
  self.Btn_Once.Img_GamePad:SetVisibility(ESlateVisibility.Collapsed)
  self.Btn_TenTimes.Img_GamePad:SetVisibility(ESlateVisibility.Collapsed)
  self.Key_Change:SetVisibility(ESlateVisibility.Collapsed)
  self.Key_GamePad_L:SetVisibility(ESlateVisibility.Collapsed)
  self.Key_GamePad_R:SetVisibility(ESlateVisibility.Collapsed)
  self.Key_ListLeft:SetVisibility(ESlateVisibility.Collapsed)
  self.Key_ListRight:SetVisibility(ESlateVisibility.Collapsed)
end

function G:HandleKeyReleased(Key)
  if self.GachaAnime and self.GachaAnime:IsValid() and self.GachaAnime:IsVisible() then
    self.GachaAnime:HandleKeyReleased(Key)
    return
  end
  if Key.KeyName == UIConst.GamePadKey.DPadUp and 0 == self.WS_BottomBtn:GetActiveWidgetIndex() and self.Group_Change:IsVisible() then
    self:OnClickBtnSelect()
  end
end

function G:OnKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  if self.GachaAnime and self.GachaAnime:IsValid() and self.GachaAnime:IsVisible() then
    return self.GachaAnime:OnParentKeyDown(MyGeometry, InKeyEvent)
  end
  if self.GachaSelect and self.GachaSelect:IsValid() and self.GachaSelect:IsVisible() then
    return self.GachaSelect:OnParentKeyDown(MyGeometry, InKeyEvent)
  end
  if self.CantClick then
    return UE4.UWidgetBlueprintLibrary.Unhandled()
  end
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local IsEventHandled = false
  if UE4.UKismetStringLibrary.StartsWith(InKeyName, "GamePad") then
    IsEventHandled = self:OnGamePadDown(InKeyName)
  elseif "Escape" == InKeyName then
    self:OnClickBtnClose()
  elseif "Q" == InKeyName and 1 ~= self.NowTabId then
    self:GachaTabToLeft()
  elseif "E" == InKeyName and self.NowTabId ~= self.MaxTabNum then
    self:GachaTabToRight()
  end
  return UE4.UWidgetBlueprintLibrary.Handled()
end

function G:OnGamePadDown(InKeyName)
  local IsEventHandled = false
  if InKeyName == UIConst.GamePadKey.LeftShoulder and 1 ~= self.NowTabId then
    self:GachaTabToLeft()
  elseif InKeyName == UIConst.GamePadKey.RightShoulder and self.NowTabId ~= self.MaxTabNum then
    self:GachaTabToRight()
  elseif InKeyName == UIConst.GamePadKey.LeftTriggerThreshold then
    if #self.NowTabValidGachaPools > 1 then
      self.PoolTab_1:SetSwitchOn(true)
      self:OnLeftSubTabClicked()
    end
  elseif InKeyName == UIConst.GamePadKey.RightTriggerThreshold then
    if #self.NowTabValidGachaPools > 1 then
      self.PoolTab_2:SetSwitchOn(true)
      self:OnRightSubTabClicked()
    end
  elseif InKeyName == UIConst.GamePadKey.SpecialRight then
    self:OnClickBtnRecord()
  elseif InKeyName == UIConst.GamePadKey.SpecialLeft then
    self:OnClickBtnHistory()
  elseif InKeyName == UIConst.GamePadKey.FaceButtonLeft then
    if self.Group_Once:IsVisible() then
      self:OnClickBtnGachaOnce()
    end
  elseif InKeyName == UIConst.GamePadKey.FaceButtonTop then
    if 1 == self.WS_BottomBtn:GetActiveWidgetIndex() then
      self:OnClickBtnSelect()
    elseif self.Group_TenTimes:IsVisible() then
      self:OnClickBtnGachaTentimes()
    end
  elseif InKeyName == UIConst.GamePadKey.LeftThumb then
    self:OnClickBtnShop()
  else
    IsEventHandled = self.Common_Tab:Handle_KeyEventOnGamePad(InKeyName)
  end
  return IsEventHandled
end

function G:GachaTabToLeft()
  local PreTabIndex = self.NowTabId - 1 - 1
  local Item = self.List_Pool:GetItemAt(PreTabIndex)
  self.List_Pool:ScrollIndexIntoView(PreTabIndex)
  if Item and Item.SelfWidget then
    Item.SelfWidget:OnListItemObjectClicked()
  end
end

function G:GachaTabToRight()
  local NextTabIndex = self.NowTabId + 1 - 1
  local Item = self.List_Pool:GetItemAt(NextTabIndex)
  self.List_Pool:ScrollIndexIntoView(NextTabIndex + 1)
  if Item and Item.SelfWidget then
    Item.SelfWidget:OnListItemObjectClicked()
  end
end

function G:OnTabSelected(Content)
  if self.IsGachaMainInvalid then
    return
  end
  if self.CurContent and self.CurContent ~= Content then
    self.CurContent.SelfWidget:SetUnselected()
  end
  self.NowSubTabId = 1
  self.PoolTab_1:SetSwitchOn(true)
  self.PoolTab_2:SetSwitchOn(false)
  self.CurContent = Content
  self.NowTabId = Content.Id
  self.NowTabValidGachaPools = self.ValidGachaTab[self.NowTabId].ValidGachaPools
  if 1 == #self.NowTabValidGachaPools then
    self.Group_Tab:SetVisibility(UE4.ESlateVisibility.Collapsed)
  else
    self.Group_Tab:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  end
  for Index, Data in pairs(self.NowTabValidGachaPools) do
    if self["PoolTab_" .. Index] then
      self["PoolTab_" .. Index].Text_SubTab:SetText(GText(Data.GachaType))
      local GachaInfo = DataMgr.Gacha[Data.GachaId]
      if GachaInfo and GachaInfo.IsShowSpecialTitle then
        self["PoolTab_" .. Index].Reddot_UpSign:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
      else
        self["PoolTab_" .. Index].Reddot_UpSign:SetVisibility(UE4.ESlateVisibility.Collapsed)
      end
    end
  end
  self:RefreshSelectedGachaPool()
end

function G:RefreshSelectedGachaPool()
  self.PreGachaId = self.NowGachaId
  self.NowGachaId = self.NowTabValidGachaPools[self.NowSubTabId].GachaId
  local GachaInfo = DataMgr.Gacha[self.NowGachaId]
  local GachaOnceTimes = GachaInfo.GachaTimes or 1
  self.Btn_Once:SetText(string.format(GText("UI_GACHA_ONE"), GachaOnceTimes))
  self.PoolDescItem_1.Text_PoolDetail:SetText(GText(GachaInfo.GachaDes))
  self.PoolDescItem_1:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  self.PoolDescItem_2:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self.PoolDescItem_3:SetVisibility(UE4.ESlateVisibility.Collapsed)
  if GachaInfo.IsShowSpecialTitle then
    if not self.GachaUpTitleSign then
      self:GetGachaUpTitleSign()
    end
    self.GachaUpTitleSign:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    self.GachaUpTitleSign:StopAnimation(self.GachaUpTitleSign.Out)
    self.GachaUpTitleSign:PlayAnimation(self.GachaUpTitleSign.In)
    self.GachaUpTitleSignIsIn = true
  elseif self.GachaUpTitleSign and self.GachaUpTitleSignIsIn then
    self.GachaUpTitleSignIsIn = false
    self.GachaUpTitleSign:StopAnimation(self.GachaUpTitleSign.In)
    self.GachaUpTitleSign:PlayAnimation(self.GachaUpTitleSign.Out)
  end
  self.Title_Shuimu.Text_MainTitle:SetText(GText(GachaInfo.GachaName))
  self.Title_Shuimu.Text_SubTitle:SetText(GText(GachaInfo.GachaType))
  self:PlayAnimation(self.Switch_In)
  AudioManager(self):PlayUISound(self, "event:/ui/common/gacha_pool_switch", nil, nil)
  self:RefreshBackground()
  self:RefreshResourceConsume()
  self:RefreshGachaCountDown()
  self:RefreshGuaranteedDict()
  self:RefreshGachaBgSound()
  self:CheckIsSelectGacha()
end

function G:OnLeftSubTabClicked()
  if 1 == self.NowSubTabId then
    return
  end
  self.PoolTab_2:SetSwitchOn(false)
  self:OnSubTabSelected(1)
end

function G:OnRightSubTabClicked()
  if 2 == self.NowSubTabId then
    return
  end
  self.PoolTab_1:SetSwitchOn(false)
  self:OnSubTabSelected(2)
end

function G:OnSubTabSelected(SubTabId)
  self.NowSubTabId = SubTabId
  self:RefreshSelectedGachaPool()
end

function G:RefreshBackground()
  local GachaInfo = DataMgr.Gacha[self.NowGachaId]
  if not self.GachaIdMapBg[self.NowGachaId] or DataMgr.GachaSelect[self.NowGachaId] then
    local BgPath
    if self.IsPCPlatform then
      BgPath = CommonConst.GachaBackgroundAddrPC .. GachaInfo.GachaBp .. "." .. GachaInfo.GachaBp
    else
      BgPath = CommonConst.GachaBackgroundAddrMobile .. GachaInfo.GachaBp .. "." .. GachaInfo.GachaBp
    end
    local Avatar = GWorld:GetAvatar()
    if Avatar and DataMgr.GachaSelect[self.NowGachaId] then
      local GachaSelectInfo = DataMgr.GachaSelect[self.NowGachaId]
      local GachaPool = Avatar.GachaPool[self.NowGachaId]
      local GachaSelfSelect = GachaPool.SelfSelect
      if 0 ~= GachaSelfSelect then
        for key, value in ipairs(GachaSelectInfo.ItemId) do
          if GachaSelfSelect == value then
            local BpName = GachaSelectInfo.GachaBp[key]
            if self.IsPCPlatform then
              BgPath = CommonConst.GachaBackgroundAddrPC .. BpName .. "." .. BpName
              break
            end
            BgPath = CommonConst.GachaBackgroundAddrMobile .. BpName .. "." .. BpName
            break
          end
        end
      end
    end
    local BgUI = UIManager(self):CreateWidget(BgPath, false)
    if not BgUI then
      DebugPrint(ErrorTag, "---jzn---Gacha---Bg---error---", self.NowGachaId, GachaInfo.GachaBp)
    end
    self.Bg_Anchor:AddChild(BgUI)
    local OverlaySlot = UE4.UWidgetLayoutLibrary.SlotAsOverlaySlot(BgUI)
    OverlaySlot:SetPadding(FMargin(0, 0, 0, 0))
    OverlaySlot:SetHorizontalAlignment(EHorizontalAlignment.HAlign_Fill)
    OverlaySlot:SetVerticalAlignment(EVerticalAlignment.VAlign_Fill)
    self.GachaIdMapBg[self.NowGachaId] = BgUI
  end
  local AllBgCount = self.Bg_Anchor:GetChildrenCount()
  for i = 1, AllBgCount do
    local Child = self.Bg_Anchor:GetChildAt(i - 1)
    if Child == self.GachaIdMapBg[self.PreGachaId] then
      Child:StopAnimation(Child.In)
      Child:PlayAnimation(Child.Out)
      Child:BindToAnimationFinished(Child.Out, {
        Child,
        function()
          Child:UnbindAllFromAnimationFinished(Child.Out)
          Child:SetVisibility(UE4.ESlateVisibility.Collapsed)
        end
      })
      if not Child.Out then
        Child:SetVisibility(UE4.ESlateVisibility.Collapsed)
      end
    else
      Child:SetVisibility(UE4.ESlateVisibility.Collapsed)
    end
  end
  self.GachaIdMapBg[self.NowGachaId]:StopAnimation(self.GachaIdMapBg[self.NowGachaId].Out)
  self.GachaIdMapBg[self.NowGachaId]:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  local CacheData = EMCache:Get("GachaSystem")
  if nil == CacheData then
    CacheData = {}
    EMCache:Set("GachaSystem", CacheData)
  end
  local IsSpecialSpine = false
  if CacheData[self.NowGachaId] == true or not GachaInfo.GachaSpineIn then
    self.GachaIdMapBg[self.NowGachaId]:PlayAnimation(self.GachaIdMapBg[self.NowGachaId].In)
  else
    if self.GachaIdMapBg[self.NowGachaId].Special_In then
      self.GachaIdMapBg[self.NowGachaId]:PlayAnimation(self.GachaIdMapBg[self.NowGachaId].Special_In)
      IsSpecialSpine = true
    else
      self.GachaIdMapBg[self.NowGachaId]:PlayAnimation(self.GachaIdMapBg[self.NowGachaId].In)
    end
    self.GachaIdMapBg[self.NowGachaId]:PlayAnimation(self.GachaIdMapBg[self.NowGachaId].Special_In)
    CacheData[self.NowGachaId] = true
    EMCache:Set("GachaSystem", CacheData)
  end
  if self.GachaIdMapBg[self.NowGachaId].Spine_Char then
    if IsSpecialSpine then
      self.GachaIdMapBg[self.NowGachaId].Spine_Char:SetAnimation(0, "In_Gacha", false)
    else
      self.GachaIdMapBg[self.NowGachaId].Spine_Char:SetAnimation(0, "In", false)
    end
    self.GachaIdMapBg[self.NowGachaId].Spine_Char:AddAnimation(0, "Loop", true, 0)
  end
  local PoolType = self.GachaIdMapBg[self.NowGachaId].PoolType or 0
  if PoolType and self.Title_Shuimu[PoolType] then
    self.Title_Shuimu:PlayAnimation(self.Title_Shuimu[PoolType])
  end
  local TargetTitle = self.GachaIdMapBg[self.NowGachaId].CharTitle
  if not TargetTitle then
    return
  end
  TargetTitle:SetVisibility(UE4.ESlateVisibility.Collapsed)
  local GachaStarMap = DataMgr.GachaStarMap[self.NowGachaId]
  if GachaStarMap and GachaStarMap.Char5Up then
    for TargetId, _ in pairs(GachaStarMap.Char5Up) do
      local CharInfo = DataMgr.Char[TargetId]
      local BattleCharInfo = DataMgr.BattleChar[TargetId]
      if CharInfo and BattleCharInfo then
        self:InitTargetTitle(true, TargetTitle, CharInfo.CharName, CharInfo.CharRarity, TargetId)
        break
      end
    end
  end
  if GachaStarMap and GachaStarMap.Weapon5Up then
    for TargetId, _ in pairs(GachaStarMap.Weapon5Up) do
      local WeaponInfo = DataMgr.Weapon[TargetId]
      if WeaponInfo then
        self:InitTargetTitle(false, TargetTitle, WeaponInfo.WeaponName, WeaponInfo.WeaponRarity, TargetId)
        break
      end
    end
  end
end

function G:InitTargetTitle(IsChar, Title, TargetName, TargetRarity, TargetId)
  Title.Text_CharName:SetText(GText(TargetName))
  for i = 1, CommonConst.GachaRarityMax do
    if Title["Gacha_Star_" .. i] then
      Title["Gacha_Star_" .. i]:SetVisibility(UE4.ESlateVisibility.Collapsed)
    end
  end
  for i = 1, TargetRarity do
    if Title["Gacha_Star_" .. i] then
      Title["Gacha_Star_" .. i]:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    end
  end
  Title.WS_Type:SetVisibility(UE4.ESlateVisibility.Collapsed)
  if IsChar then
    Title.WS_Type:SetActiveWidgetIndex(0)
    local BattleCharInfo = DataMgr.BattleChar[TargetId]
    local TargetProperty = BattleCharInfo.Attribute
    if TargetProperty then
      local IconName = "Armory_" .. TargetProperty
      local AttributeIcon = LoadObject("/Game/UI/Texture/Dynamic/Atlas/Armory/T_" .. IconName .. ".T_" .. IconName)
      if AttributeIcon then
        Title.Image_CharType:SetBrushResourceObject(AttributeIcon)
        Title.WS_Type:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
      end
    end
  else
    Title.WS_Type:SetActiveWidgetIndex(1)
    local BattleWeaponInfo = DataMgr.BattleWeapon[TargetId]
    if not BattleWeaponInfo then
      return
    end
    for _, Tag in pairs(BattleWeaponInfo.WeaponTag) do
      local TagInfo = DataMgr.WeaponTag[Tag]
      if TagInfo and TagInfo.WeaponTagfilter and TagInfo.Icon then
        local AttributeIcon = LoadObject(TagInfo.Icon)
        if AttributeIcon then
          local RoleMaterial = Title.Image_WeaponIcon:GetDynamicMaterial()
          RoleMaterial:SetTextureParameterValue("MainTex", AttributeIcon)
          Title.WS_Type:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
        end
        break
      end
    end
  end
  Title:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
end

function G:RefreshGachaBgSound()
  local GachaInfo = DataMgr.Gacha[self.NowGachaId]
  local GachaBgSound = GachaInfo.GachaBgSound
  if GachaBgSound then
    AudioManager(self):StopSound(self, "GachaBgSound")
    local FinalGachaBgSound = "event:" .. GachaBgSound
    AudioManager(self):PlayUISound(self, FinalGachaBgSound, "GachaBgSound", nil)
  else
    AudioManager(self):StopSound(self, "GachaBgSound")
  end
end

function G:RefreshGachaImg()
  local GachaInfo = DataMgr.Gacha[self.NowGachaId]
  local Avatar = GWorld:GetAvatar()
  if GachaInfo.GachaTimes then
    self.Group_Once:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  else
    self.Group_Once:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
  if GachaInfo.GachaCostNum10 then
    self.Group_TenTimes:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  else
    self.Group_TenTimes:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
  local ShowResourceId
  local ShowResourceCount = 0
  local TimeLimitResourceId
  local TimeLimitResourceCount = 0
  self.Text_OnceCostNum:SetText("<Warning>" .. CommonConst.GachaOneResult .. "</>")
  local TenCost = GachaInfo.GachaCostNum10
  self.Text_TenTimesCostNum:SetText("<Warning>" .. TenCost .. "</>")
  self.Panel_TimeLimit:SetVisibility(UE4.ESlateVisibility.Collapsed)
  local GachaTentimesUI = self:GetGachaTentimesUI()
  GachaTentimesUI.Panel_TimeLimit:SetVisibility(UE4.ESlateVisibility.Collapsed)
  GachaTentimesUI.Text_TenTimesCostNum:SetText("<Warning>" .. TenCost .. "</>")
  local TabCoinInfo = {}
  if DataMgr.SystemUI.GachaMain.TabCoin then
    for key, value in ipairs(DataMgr.SystemUI.GachaMain.TabCoin) do
      table.insert(TabCoinInfo, value)
    end
  end
  for _, ResourceId in ipairs(GachaInfo.GachaCostRes) do
    if ItemUtils.GetItemLimitedInfo(ResourceId) then
      TimeLimitResourceId = ResourceId
      TimeLimitResourceCount = Avatar:GetResourceNum(TimeLimitResourceId)
    else
      ShowResourceId = ResourceId
      ShowResourceCount = Avatar:GetResourceNum(ShowResourceId)
    end
  end
  if TimeLimitResourceCount > 0 then
    self.Text_OnceCostNum:SetText("<Default>" .. CommonConst.GachaOneResult .. "</>")
    if TenCost <= TimeLimitResourceCount then
      self.Text_TenTimesCostNum:SetText("<Default>" .. TenCost .. "</>")
      GachaTentimesUI.Text_TenTimesCostNum:SetText("<Default>" .. TenCost .. "</>")
      self:InitCostItem(self.Item_TenTimesIcon, TimeLimitResourceId)
      self:InitGachaTenCostItem(TimeLimitResourceId)
    elseif TenCost > TimeLimitResourceCount + ShowResourceCount then
      if TenCost <= ShowResourceCount then
        self.Text_TenTimesCostNum:SetText("<Default>" .. TenCost .. "</>")
        GachaTentimesUI.Text_TenTimesCostNum:SetText("<Default>" .. TenCost .. "</>")
      end
      self:InitCostItem(self.Item_TenTimesIcon, ShowResourceId)
      self:InitGachaTenCostItem(ShowResourceId)
    else
      self.Text_TenTimesCostNum:SetText("<Default>" .. TenCost - TimeLimitResourceCount .. "</>")
      GachaTentimesUI.Text_TenTimesCostNum:SetText("<Default>" .. TenCost - TimeLimitResourceCount .. "</>")
      self.Text_TimeLimitCostNum:SetText(TimeLimitResourceCount)
      GachaTentimesUI.Text_TimeLimitCostNum:SetText(TimeLimitResourceCount)
      self:InitGachaTenCostItem(ShowResourceId, TimeLimitResourceId)
      self:InitCostItem(self.Item_TenTimesIcon, ShowResourceId)
      self:InitCostItem(self.Item_TimeLimitIcon, TimeLimitResourceId)
      self.Panel_TimeLimit:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
      GachaTentimesUI.Panel_TimeLimit:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    end
    self:InitCostItem(self.Item_OnceIcon, TimeLimitResourceId)
  else
    if ShowResourceCount >= CommonConst.GachaOneResult then
      self.Text_OnceCostNum:SetText("<Default>" .. CommonConst.GachaOneResult .. "</>")
    end
    if TenCost <= ShowResourceCount then
      self.Text_TenTimesCostNum:SetText("<Default>" .. TenCost .. "</>")
      GachaTentimesUI.Text_TenTimesCostNum:SetText("<Default>" .. TenCost .. "</>")
    end
    self:InitCostItem(self.Item_OnceIcon, ShowResourceId)
    self:InitCostItem(self.Item_TenTimesIcon, ShowResourceId)
    self:InitGachaTenCostItem(ShowResourceId)
  end
  for _, ResourceId in ipairs(GachaInfo.GachaCostRes) do
    table.insert(TabCoinInfo, ResourceId)
  end
  self.Common_Tab:OverrideTopResource(TabCoinInfo)
  self.Common_Tab:ResetDynamicNode()
end

function G:InitCostItem(ItemWidget, ResourceId)
  local IconPath = DataMgr.Resource[ResourceId].Icon
  local Icon = LoadObject(IconPath)
  local Content = {}
  Content.Id = ResourceId
  Content.Icon = Icon
  Content.NotInteractive = true
  ItemWidget:Init(Content)
end

function G:InitGachaTenCostItem(ShowResourceId, TimeLimitResourceId)
  local IconPath = DataMgr.Resource[ShowResourceId].Icon
  local Icon = LoadObject(IconPath)
  local Content = {}
  Content.Id = ShowResourceId
  Content.Icon = Icon
  Content.NotInteractive = true
  local GachaTentimesUI = self:GetGachaTentimesUI()
  GachaTentimesUI.Item_TenTimesIcon:Init(Content)
  GachaTentimesUI:RefreshResourceBar(ShowResourceId)
  if TimeLimitResourceId then
    local IconPath = DataMgr.Resource[TimeLimitResourceId].Icon
    local Icon = LoadObject(IconPath)
    local Content = {}
    Content.Id = TimeLimitResourceId
    Content.Icon = Icon
    Content.NotInteractive = true
    GachaTentimesUI.Item_TimeLimitIcon:Init(Content)
  end
end

function G:RefreshGuaranteedDict()
  local Avatar = GWorld:GetAvatar()
  self.HB_PoolGachaDetail:SetVisibility(UE4.ESlateVisibility.Collapsed)
  if Avatar then
    local function OpenRecordDialogue(Records, GuaranteedDict)
      self.GachaRecordsCache = Records
      
      self.GuaranteedDict = GuaranteedDict
      local GachaInfo = DataMgr.Gacha[self.NowGachaId]
      local ProbabilityId = GachaInfo.ProbabilityId
      local ProbabilityInfo = DataMgr.GachaProbability[ProbabilityId]
      local GachaType = GachaInfo.GachaType
      if ProbabilityInfo and ProbabilityInfo.ShowGetStar5Times then
        local AlreadyGachaTimes = 0
        if self.GuaranteedDict and self.GuaranteedDict[GachaType] then
          AlreadyGachaTimes = self.GuaranteedDict[GachaType]
        end
        local RemainGachaTimes = ProbabilityInfo.ShowGetStar5Times - AlreadyGachaTimes
        self.Text_PoolGachaDetail_1:SetText(string.format(GText("GACHAMAIN_TITLE_SHOWTIMES"), RemainGachaTimes))
        self.HB_PoolGachaDetail:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
      end
    end
    
    if self.GachaRecordsCache and self.GuaranteedDict then
      OpenRecordDialogue(self.GachaRecordsCache, self.GuaranteedDict)
    else
      Avatar:OpenGachaRecord(OpenRecordDialogue)
    end
  end
end

function G:HandleRecords(Records)
  local RecordSum = #Records
  local RecordList = {}
  if 0 == RecordSum then
    return RecordList
  end
  for key, value in ipairs(Records) do
    if not RecordList[value.GachaId] then
      RecordList[value.GachaId] = {}
    end
    table.insert(RecordList[value.GachaId], value)
  end
  return RecordList
end

function G:GetHistoryTab()
  local NowTime = TimeUtils.NowTime()
  local HistoryTab = {}
  local DialogueTab = {}
  local TabMapGacha = {}
  local TabIndex = 1
  for key, value in pairs(DataMgr.Gacha) do
    if NowTime >= value.GachaStartTime and NowTime < value.GachaEndTime then
      if 2 == value.GachaHistoryType and self.NowGachaId ~= key then
        table.insert(HistoryTab, {
          GachaId = key,
          GachaType = value.GachaType
        })
      end
      if self.NowGachaId == key then
        DialogueTab[TabIndex] = {
          Text = GText(value.GachaType),
          TabId = TabIndex
        }
        TabMapGacha[TabIndex] = key
      end
    end
  end
  table.sort(HistoryTab, function(a, b)
    return a.GachaId > b.GachaId
  end)
  for key, value in ipairs(HistoryTab) do
    TabIndex = TabIndex + 1
    DialogueTab[TabIndex] = {
      Text = GText(value.GachaType),
      TabId = TabIndex
    }
    TabMapGacha[TabIndex] = value.GachaId
  end
  return DialogueTab, TabMapGacha
end

function G:CheckIsSelectGacha()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  self.WS_BottomBtn:SetActiveWidgetIndex(0)
  self.Group_Change:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self.Group_History:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  if self.Key_GamePad_History then
    self.Key_GamePad_History:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  end
  if DataMgr.GachaSelect[self.NowGachaId] then
    local GachaPool = Avatar.GachaPool[self.NowGachaId]
    local GachaSelfSelect = GachaPool.SelfSelect
    if 0 == GachaPool.Already5StarCount then
      self.Group_Change:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
      if 0 == GachaSelfSelect then
        self.WS_BottomBtn:SetActiveWidgetIndex(1)
        self.Group_History:SetVisibility(UE4.ESlateVisibility.Collapsed)
        if self.Key_GamePad_History then
          self.Key_GamePad_History:SetVisibility(UE4.ESlateVisibility.Collapsed)
        end
      end
    end
    if GachaSelfSelect then
      local TargetTitle = self.GachaIdMapBg[self.NowGachaId].CharTitle
      local CharInfo = DataMgr.Char[GachaSelfSelect]
      local BattleCharInfo = DataMgr.BattleChar[GachaSelfSelect]
      if CharInfo and BattleCharInfo then
        self:InitTargetTitle(true, TargetTitle, CharInfo.CharName, CharInfo.CharRarity, GachaSelfSelect)
      end
    end
  end
end

function G:OnClickBtnHistory()
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    local function OpenRecordDialogue(Records, GuaranteedDict)
      self.GachaRecordsCache = Records
      
      self.GuaranteedDict = GuaranteedDict
      local RecordTable = self:HandleRecords(Records)
      local Params = {}
      Params.Parent = self
      local Tabs, TabMapGacha = self:GetHistoryTab()
      Params.TabConfigData = {
        PlatformName = CommonUtils.GetDeviceTypeByPlatformName(self),
        LeftKey = "A",
        RightKey = "D",
        Tabs = Tabs,
        SoundFunc = function()
          AudioManager(self):PlayUISound(self, "event:/ui/common/click_level_01", nil, nil)
        end
      }
      Params.RecordTable = RecordTable
      Params.TabMapGacha = TabMapGacha
      self.DetailPopupUI = UIManager(self):ShowCommonPopupUI(100197, Params, self)
    end
    
    if self.GachaRecordsCache and self.GuaranteedDict then
      OpenRecordDialogue(self.GachaRecordsCache, self.GuaranteedDict)
    else
      Avatar:OpenGachaRecord(OpenRecordDialogue)
    end
  end
end

function G:OnClickBtnRecord()
  local Params = {}
  Params.Parent = self
  local Tabs = {
    [1] = {
      Text = GText("UI_GACHA_PROBDETAIL"),
      TabId = 1
    },
    [2] = {
      Text = GText("UI_GACHA_DESDETAIL"),
      TabId = 2
    }
  }
  Params.TabConfigData = {
    PlatformName = CommonUtils.GetDeviceTypeByPlatformName(self),
    LeftKey = "A",
    RightKey = "D",
    Tabs = Tabs,
    SoundFunc = function()
      AudioManager(self):PlayUISound(self, "event:/ui/common/click_level_01", nil, nil)
    end
  }
  Params.IsGacha = true
  
  local function DialogCallback()
    local GameInputModeSubsystem = UIManager(self):GetGameInputModeSubsystem(self)
    GameInputModeSubsystem:SetNavigateWidgetOpacity(1)
  end
  
  Params.UseCachedWidget = {
    [1] = self:GetGachaDetailsUI()
  }
  Params.OnCloseCallbackObj = self
  Params.OnCloseCallbackFunction = DialogCallback
  self.DetailPopupUI = UIManager(self):ShowCommonPopupUI(100113, Params, self)
end

function G:OnClickBtnGachaOnce()
  if self.CantClick then
    return
  end
  self:TryGacha(true)
end

function G:OnClickBtnGachaTentimes()
  if self.CantClick then
    return
  end
  self:TryGacha(false)
end

function G:TryGacha(IsSingle)
  self.CantClick = true
  self.IsSingle = IsSingle
  local GachaTimes = CommonConst.GachaTenResults
  if IsSingle then
    GachaTimes = CommonConst.GachaOneResult
  end
  if self:CheckCanGacha(IsSingle) then
    self:RefreshOwnedAssets()
    self:CallDrawGacha(self.NowGachaId, GachaTimes)
  else
    self.CantClick = false
    self:PurchaseGachaResource(IsSingle)
  end
end

function G:OnClickBtnShop()
  if self.CantClick then
    return
  end
  if not self.ShopIsUnlock then
    return
  end
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_level_01", nil, nil)
  local GachaInfo = DataMgr.Gacha[self.NowGachaId]
  local CostData = GachaInfo.GachaCostRes
  if not CostData then
    return
  end
  local res, JumpShopFunc
  for _, ResourceId in ipairs(CostData) do
    res, JumpShopFunc = PageJumpUtils:CreateJumpToShopAccess("Resource", "Shop", ResourceId)
    if res then
      break
    end
  end
  if res then
    JumpShopFunc()
  end
end

function G:PurchaseGachaResource(IsSingleGacha)
  local GachaInfo = DataMgr.Gacha[self.NowGachaId]
  local ResourceCountNeeded
  local CostData = GachaInfo.GachaCostRes
  if not CostData then
    return
  end
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  local ResourceOwnedCount = 0
  for _, ResourceId in ipairs(GachaInfo.GachaCostRes) do
    ResourceOwnedCount = ResourceOwnedCount + Avatar:GetResourceNum(ResourceId)
  end
  local ShopItemInfo, ShopResourceId
  for _, ResourceId in pairs(CostData) do
    if DataMgr.ShopItem2ShopSubId.Resource.Shop[ResourceId] then
      local len = #DataMgr.ShopItem2ShopSubId.Resource.Shop[ResourceId]
      ShopItemInfo = DataMgr.ShopItem2ShopSubId.Resource.Shop[ResourceId][len]
      ShopResourceId = ResourceId
      break
    end
  end
  if IsSingleGacha then
    ResourceCountNeeded = GachaInfo.GachaTimes
  else
    ResourceCountNeeded = GachaInfo.GachaCostNum10
  end
  local ResourceNeedPurchaseCount = ResourceCountNeeded - ResourceOwnedCount
  if ShopItemInfo then
    local ShopItemId = ShopItemInfo.ShopItemId
    local ShopData = DataMgr.ShopItem[ShopItemId]
    local CoinId = ShopData.PriceType
    local CoinNeededCount = math.ceil(ShopUtils:GetShopItemPrice(ShopItemId) * math.ceil(ResourceNeedPurchaseCount / ShopData.TypeNum))
    local Coin1OwnedCount = Avatar:GetResourceNum(CoinId)
    if CoinNeededCount > Coin1OwnedCount then
      if CoinId == CommonConst.Coins.Coin1 then
        local Coin4 = CommonConst.Coins.Coin4
        local Coin4OwnedCount = Avatar:GetResourceNum(Coin4)
        local Coin1NeededCount = CoinNeededCount - Coin1OwnedCount
        if Coin4OwnedCount >= Coin1NeededCount then
          local function Confirm()
            self.CantClick = true
            
            local function OnPurchaseShopItemUseCoin1(Ret)
              if Ret == ErrorCode.RET_SUCCESS then
                self:RefreshResourceConsume()
                local GachaTentimesUI = self:GetGachaTentimesUI()
                GachaTentimesUI:RefreshGachaTentimesBtn()
                self:RefreshOwnedAssets()
                if self.IsSingle then
                  self:CallDrawGacha(self.NowGachaId, CommonConst.GachaOneResult)
                else
                  self:CallDrawGacha(self.NowGachaId, CommonConst.GachaTenResults)
                end
              elseif DataMgr.ErrorCode[Ret] then
                self.CantClick = false
                UIManager(self):ShowError(Ret, nil, UIConst.Tip_CommonToast)
              else
                self.CantClick = false
                local ErrorText = "Unknown_Error"
                UIManager(self):ShowUITip("CommonToastMain", GText(ErrorText), 1.5)
              end
            end
            
            Avatar:PurchaseShopItemUseCoin1(ShopItemId, math.ceil(ResourceNeedPurchaseCount / ShopData.TypeNum), OnPurchaseShopItemUseCoin1)
          end
          
          local ItemList = {}
          table.insert(ItemList, {
            ItemId = Coin4,
            ItemType = CommonConst.ItemType.Resource,
            ItemNum = Coin4OwnedCount,
            ItemNeed = Coin1NeededCount
          })
          local PopUpId = 100136
          local ResourceData = DataMgr.Resource[CoinId]
          local PopoverText = GText(DataMgr.CommonPopupUIContext[PopUpId].PopoverText)
          if string.find(PopoverText, "&ResourceName&") then
            PopoverText = string.gsub(PopoverText, "&ResourceName&", GText(ResourceData.ResourceName))
          end
          if string.find(PopoverText, "&ResourceName1&") then
            PopoverText = string.gsub(PopoverText, "&ResourceName1&", GText(DataMgr.Resource[Coin4].ResourceName))
          end
          if string.find(PopoverText, "&ResourceName2&") then
            PopoverText = string.gsub(PopoverText, "&ResourceName2&", GText(ResourceData.ResourceName))
          end
          if string.find(PopoverText, "&Num1&") then
            PopoverText = string.gsub(PopoverText, "&Num1&", Coin1NeededCount)
          end
          if string.find(PopoverText, "&Num2&") then
            PopoverText = string.gsub(PopoverText, "&Num2&", Coin1NeededCount)
          end
          local Params = {
            RightCallbackFunction = Confirm,
            ItemList = ItemList,
            ShortText = PopoverText
          }
          self.PopupUI = UIManager(self):ShowCommonPopupUI(PopUpId, Params)
          return
        end
      end
      
      local function JumpToShop()
        if self.ShopIsUnlock then
          PageJumpUtils:JumpToShopPage(CommonConst.GachaJumpToShopMainTabId, nil, nil, "Shop")
        else
          local UIUnlockRuleName = "Shop"
          local UIUnlockDesc = DataMgr.UIUnlockRule[UIUnlockRuleName].UIUnlockDesc
          UIManager(self):ShowUITip("CommonToastMain", GText(UIUnlockDesc), 1.5)
        end
      end
      
      local Params = {}
      Params.LeftCallbackObj = self
      Params.RightCallbackObj = self
      Params.RightCallbackFunction = JumpToShop
      self.PopupUI = UIManager(self):ShowCommonPopupUI(100137, Params, self)
    else
      local function Confirm()
        self.CantClick = true
        
        self.IsPurchaseForGacha = true
        Avatar:PurchaseShopItem(ShopItemId, math.ceil(ResourceNeedPurchaseCount / ShopData.TypeNum), true)
      end
      
      local ItemList = {}
      table.insert(ItemList, {
        ItemId = CoinId,
        ItemType = CommonConst.ItemType.Resource,
        ItemNum = Coin1OwnedCount,
        ItemNeed = CoinNeededCount
      })
      local PopUpId = 100136
      local ResourceData = DataMgr.Resource[ShopResourceId]
      local PopoverText = GText(DataMgr.CommonPopupUIContext[PopUpId].PopoverText)
      if string.find(PopoverText, "&ResourceName&") then
        PopoverText = string.gsub(PopoverText, "&ResourceName&", GText(ResourceData.ResourceName))
      end
      if string.find(PopoverText, "&ResourceName1&") then
        PopoverText = string.gsub(PopoverText, "&ResourceName1&", GText(DataMgr.Resource[CoinId].ResourceName))
      end
      if string.find(PopoverText, "&ResourceName2&") then
        PopoverText = string.gsub(PopoverText, "&ResourceName2&", GText(ResourceData.ResourceName))
      end
      if string.find(PopoverText, "&Num1&") then
        PopoverText = string.gsub(PopoverText, "&Num1&", CoinNeededCount)
      end
      if string.find(PopoverText, "&Num2&") then
        PopoverText = string.gsub(PopoverText, "&Num2&", ResourceNeedPurchaseCount)
      end
      local Params = {
        RightCallbackFunction = Confirm,
        ItemList = ItemList,
        ShortText = PopoverText
      }
      Params.OnKeyDownCallbackObj = self
      Params.OnKeyDownCallbackFunction = self.OnPopUIKeyDown
      self.PopupUI = UIManager(self):ShowCommonPopupUI(PopUpId, Params)
      self.OpenTipsButtonIndex = self.PopupUI:InitGamepadShortcut({
        KeyInfoList = {
          {
            Type = "Img",
            ImgShortPath = UIConst.GamePadImgKey.LeftThumb
          }
        },
        Desc = GText("UI_Controller_CheckDetails")
      })
    end
  end
end

function G:OnPopUIKeyDown(InKeyName)
  if not self.PopupUI then
    return
  end
  if InKeyName == UIConst.GamePadKey.LeftThumb then
    local ItemWidget = self.PopupUI:GetContentWidgetByName("ItemSubsize")
    if ItemWidget then
      local Item = ItemWidget.Item:GetChildAt(0)
      if Item then
        Item:SetFocus()
      end
    end
  end
end

function G:OnHoverBtnSelect()
  AudioManager(self):PlayUISound(self, "event:/ui/common/hover_btn_large_crystal", nil, nil)
end

function G:OnClickBtnSelect()
  if self.CantClick then
    return
  end
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_large_crystal", nil, nil)
  local GetGachaSelectUI = self:GetGachaSelect()
  GetGachaSelectUI:Init(self)
end

function G:OnClickBtnChange()
  if self.CantClick then
    return
  end
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_small_crystal", nil, nil)
  local GetGachaSelectUI = self:GetGachaSelect()
  GetGachaSelectUI:Init(self)
end

function G:CallDrawGacha(GachaId, Counts)
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    self.CantClick = true
    Avatar:DrawGacha(GachaId, tonumber(Counts))
  end
end

function G:OnDrawGacha(Ret, Data)
  if Ret == ErrorCode.RET_SUCCESS then
    AudioManager(self):PlayUISound(self, "event:/ui/common/gacha_amb", "GachaAmb", nil)
    local GachaAnimeUI = self:GetGachaAnime()
    GachaAnimeUI:Init(self, Data)
    self.GachaRecordsCache = nil
    self.GuaranteedDict = nil
    if self.GachaTentimesUI and self.GachaTentimesUI:IsVisible() then
      self.GachaTentimesUI:SetVisibility(UE4.ESlateVisibility.Collapsed)
    end
    self:RefreshResourceConsume()
    self:RefreshGuaranteedDict()
    self:CheckIsSelectGacha()
  elseif DataMgr.ErrorCode[Ret] then
    self.CantClick = false
    UIManager(self):ShowError(Ret, nil, UIConst.Tip_CommonToast)
  else
    self.CantClick = false
    local ErrorText = "Unknown_Error"
    UIManager(self):ShowUITip("CommonToastMain", GText(ErrorText), 1.5)
  end
end

function G:ShowGachaTentimesResult(ResultData, CanGachaAgain)
  local GachaTentimesUI = self:GetGachaTentimesUI()
  GachaTentimesUI:Init(self, ResultData, CanGachaAgain)
end

function G:CheckCanGacha(IsSingleGacha)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return false
  end
  local ResourceNeeded = CommonConst.GachaOneResult
  local GachaInfo = DataMgr.Gacha[self.NowGachaId]
  local ResourceCount = 0
  for _, ResourceId in ipairs(GachaInfo.GachaCostRes) do
    ResourceCount = ResourceCount + Avatar:GetResourceNum(ResourceId)
  end
  if IsSingleGacha then
    ResourceNeeded = CommonConst.GachaOneResult
  else
    ResourceNeeded = GachaInfo.GachaCostNum10
  end
  return ResourceCount >= ResourceNeeded
end

function G:RefreshResourceConsume()
  self:RefreshRemainGachaTimes()
  self:RefreshGachaImg()
end

function G:OnPurchaseShopItemSuccess(ShopType, ShopCount)
  self:RefreshResourceConsume()
  local GachaTentimesUI = self:GetGachaTentimesUI()
  GachaTentimesUI:RefreshGachaTentimesBtn()
  self:RefreshOwnedAssets()
  if not self.IsPurchaseForGacha then
    return
  end
  self.IsPurchaseForGacha = false
  if self.IsSingle then
    self:CallDrawGacha(self.NowGachaId, CommonConst.GachaOneResult)
  else
    self:CallDrawGacha(self.NowGachaId, CommonConst.GachaTenResults)
  end
end

function G:RefreshRemainGachaTimesDay()
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    local AlreadyTimes = Avatar.GachaDrawCounts
    local GachaLimitDay = DataMgr.GlobalConstant.GachaLimitDay.ConstantValue
    if GachaLimitDay < 0 then
      self.RemainGachaTimesDay:SetVisibility(UE4.ESlateVisibility.Collapsed)
    else
      local RemainGachaTimesDay = math.floor(math.max(GachaLimitDay - AlreadyTimes, 0))
      self.RemainGachaTimesDay:SetText(string.format(GText("UI_GACHA_REMAIN_DAY"), RemainGachaTimesDay))
      self.RemainGachaTimesDay:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    end
  end
end

function G:RefreshRemainGachaTimes()
  local GachaInfo = DataMgr.Gacha[self.NowGachaId]
  if GachaInfo.GachaLimit == nil or GachaInfo.GachaLimitIsShow then
    self.Text_RemainTimes:SetVisibility(UE4.ESlateVisibility.Collapsed)
  else
    self.Text_RemainTimes:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    local Avatar = GWorld:GetAvatar()
    if Avatar then
      local GachaPool = Avatar.GachaPool[self.NowGachaId]
      if GachaPool.DrawCounts < GachaInfo.GachaLimit then
        local RemainGachaTimes = math.floor(GachaInfo.GachaLimit - GachaPool.DrawCounts)
        self.Text_RemainTimes:SetText(string.format(GText("UI_GACHA_REMAIN"), RemainGachaTimes))
      end
    end
  end
end

function G:RefreshOwnedAssets()
  self.OwnedChar = {}
  self.OwnedWeapon = {}
  self.OwnedCharGrade = {}
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    for _, Char in pairs(Avatar.Chars) do
      self.OwnedChar[Char.CharId] = true
      self.OwnedCharGrade[Char.CharId] = Char.GradeLevel
    end
    for _, Weapon in pairs(Avatar.Weapons) do
      self.OwnedWeapon[Weapon.WeaponId] = true
    end
  end
end

function G:InitGachaList()
  self.GachaCharList = {}
  self.GachaWeaponList = {}
  self.GachaUpList = {}
  self.UpTargetList = {}
  for GachaId, GachaInfo in pairs(DataMgr.Gacha) do
    self.UpTargetList[GachaId] = {}
    local UpList = {
      [6] = {},
      [5] = {},
      [4] = {},
      [3] = {},
      [2] = {},
      [1] = {}
    }
    if GachaInfo.UPChar then
      for key, value in pairs(GachaInfo.UPChar) do
        local Rarity = DataMgr.Char[key].CharRarity
        local Info = {
          Type = "Char",
          TargetId = key,
          TargetRarity = Rarity,
          Probability = value,
          Type = "Char"
        }
        table.insert(self.UpTargetList[GachaId], Info)
        table.insert(UpList[Rarity], Info)
      end
    elseif GachaInfo.UPWeapon then
      for key, value in pairs(GachaInfo.UPWeapon) do
        local Rarity = DataMgr.Weapon[key].WeaponRarity
        local Info = {
          Type = "Weapon",
          TargetId = key,
          TargetRarity = Rarity,
          Probability = value,
          Type = "Weapon"
        }
        table.insert(self.UpTargetList[GachaId], Info)
        table.insert(UpList[Rarity], Info)
      end
    end
    self.GachaUpList[GachaId] = UpList
    local CharList = {
      [6] = {},
      [5] = {},
      [4] = {},
      [3] = {},
      [2] = {},
      [1] = {}
    }
    local WeaponList = {
      [6] = {},
      [5] = {},
      [4] = {},
      [3] = {},
      [2] = {},
      [1] = {}
    }
    for key, value in pairs(GachaInfo.GachaCharContent) do
      local Rarity = DataMgr.Char[value].CharRarity
      table.insert(CharList[Rarity], value)
    end
    for key, value in pairs(GachaInfo.GachaWeaponContent) do
      local Rarity = DataMgr.Weapon[value].WeaponRarity
      table.insert(WeaponList[Rarity], value)
    end
    self.GachaCharList[GachaId] = CharList
    self.GachaWeaponList[GachaId] = WeaponList
  end
end

function G:GetGachaDetailsUI()
  if self.GachaDetailsUI and self.GachaDetailsUI:IsValid() then
    return self.GachaDetailsUI
  end
  self.GachaDetailsUI = self:CreateWidgetNew("GachaDetails")
  return self.GachaDetailsUI
end

function G:GetGachaRecordUI()
  if self.GachaRecordUI and self.GachaRecordUI:IsValid() then
    return self.GachaRecordUI
  end
  local GachaRecordUI = self:CreateWidgetNew("GachaRecord")
  self.LoadUIAnchor:AddChild(GachaRecordUI)
  local CanvasSlot = UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(GachaRecordUI)
  local Anchors = FAnchors()
  Anchors.Minimum = FVector2D(0, 0)
  Anchors.Maximum = FVector2D(1, 1)
  CanvasSlot:SetAnchors(Anchors)
  CanvasSlot:SetOffsets(FMargin(0, 0, 0, 0))
  GachaRecordUI:SetVisibility(UIConst.VisibilityOp.Collapsed)
  CanvasSlot:SetZOrder(5)
  self.GachaRecordUI = GachaRecordUI
  return self.GachaRecordUI
end

function G:GetGachaOnceUI()
  if self.GachaOnceUI and self.GachaOnceUI:IsValid() then
    return self.GachaOnceUI
  end
  local GachaOnceUI = self:CreateWidgetNew("GachaOnce")
  self.LoadUIAnchor:AddChild(GachaOnceUI)
  local CanvasSlot = UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(GachaOnceUI)
  local Anchors = FAnchors()
  Anchors.Minimum = FVector2D(0, 0)
  Anchors.Maximum = FVector2D(1, 1)
  CanvasSlot:SetAnchors(Anchors)
  CanvasSlot:SetOffsets(FMargin(0, 0, 0, 0))
  GachaOnceUI:SetVisibility(UIConst.VisibilityOp.Collapsed)
  CanvasSlot:SetZOrder(5)
  self.GachaOnceUI = GachaOnceUI
  return self.GachaOnceUI
end

function G:GetGachaTentimesUI()
  if self.GachaTentimesUI and self.GachaTentimesUI:IsValid() then
    return self.GachaTentimesUI
  end
  local GachaTentimesUI = self:CreateWidgetNew("GachaTentimes")
  self.LoadUIAnchor:AddChild(GachaTentimesUI)
  local CanvasSlot = UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(GachaTentimesUI)
  local Anchors = FAnchors()
  Anchors.Minimum = FVector2D(0, 0)
  Anchors.Maximum = FVector2D(1, 1)
  CanvasSlot:SetAnchors(Anchors)
  CanvasSlot:SetOffsets(FMargin(0, 0, 0, 0))
  GachaTentimesUI:SetVisibility(UIConst.VisibilityOp.Collapsed)
  CanvasSlot:SetZOrder(5)
  self.GachaTentimesUI = GachaTentimesUI
  return self.GachaTentimesUI
end

function G:GetGachaUpTitleSign()
  if self.GachaUpTitleSign and self.GachaUpTitleSign:IsValid() then
    return self.GachaUpTitleSign
  end
  local GachaUpTitleSign = self:CreateWidgetNew("GachaUpTitle")
  self.Group_PoolUpTitle:AddChild(GachaUpTitleSign)
  local OverlaySlot = UE4.UWidgetLayoutLibrary.SlotAsOverlaySlot(GachaUpTitleSign)
  OverlaySlot:SetPadding(FMargin(0, 0, 0, 0))
  GachaUpTitleSign.Text_UpTitleText:SetText(GText("GACHA_TITLE_100UP"))
  GachaUpTitleSign.Text_UpSubTitle:SetText(GText("GACHA_SUBTITLE_100UP"))
  GachaUpTitleSign:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.GachaUpTitleSign = GachaUpTitleSign
  return self.GachaUpTitleSign
end

function G:GetGachaAnime()
  if self.GachaAnime and self.GachaAnime:IsValid() then
    return self.GachaAnime
  end
  local GachaAnime = self:CreateWidgetNew("GachaAnime")
  self.LoadUIAnchor:AddChild(GachaAnime)
  local CanvasSlot = UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(GachaAnime)
  local Anchors = FAnchors()
  Anchors.Minimum = FVector2D(0, 0)
  Anchors.Maximum = FVector2D(1, 1)
  CanvasSlot:SetAnchors(Anchors)
  CanvasSlot:SetOffsets(FMargin(0, 0, 0, 0))
  GachaAnime:SetVisibility(UIConst.VisibilityOp.Collapsed)
  CanvasSlot:SetZOrder(5)
  self.GachaAnime = GachaAnime
  return self.GachaAnime
end

function G:GetGachaSelect()
  if self.GachaSelect and self.GachaSelect:IsValid() then
    return self.GachaSelect
  end
  local GachaSelect = self:CreateWidgetNew("GachaSelect")
  self.LoadUIAnchor:AddChild(GachaSelect)
  local CanvasSlot = UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(GachaSelect)
  local Anchors = FAnchors()
  Anchors.Minimum = FVector2D(0, 0)
  Anchors.Maximum = FVector2D(1, 1)
  CanvasSlot:SetAnchors(Anchors)
  CanvasSlot:SetOffsets(FMargin(0, 0, 0, 0))
  GachaSelect:SetVisibility(UIConst.VisibilityOp.Collapsed)
  CanvasSlot:SetZOrder(5)
  self.GachaSelect = GachaSelect
  return self.GachaSelect
end

function G:GetScreenShotWidget()
  if not IsValid(self.GachaScreenShotWidget) then
    local Widget = UIManager(self):CreateWidget(UIConst.ScreenshotWidget)
    self.LoadUIAnchor:AddChild(Widget)
    local CanvasSlot = UWidgetLayoutLibrary.SlotAsCanvasSlot(Widget)
    local Anchors = FAnchors()
    Anchors.Minimum = FVector2D(0, 0)
    Anchors.Maximum = FVector2D(1, 1)
    CanvasSlot:SetZOrder(6)
    CanvasSlot:SetAnchors(Anchors)
    CanvasSlot:SetOffsets(FMargin(0, 0, 0, 0))
    self.GachaScreenShotWidget = Widget
  end
  return self.GachaScreenShotWidget
end

function G:PlayGuideGachaVoice(VoiceName, ExStoryInfo)
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  local RealEventPath, SelectKey, OralPath, EventExist = AudioManager(self):GetEventData(VoiceName, ExStoryInfo)
  if EventExist then
    local PlayStruct = FPlayFMODSoundStruct()
    PlayStruct.FMODEventPath = RealEventPath
    PlayStruct.EventKey = "GachaVoice"
    PlayStruct.bStopWhenAttachedToDestoryed = true
    PlayStruct.bPlayAs2D = true
    PlayStruct.SelectKey = SelectKey
    PlayStruct = UE4.UAudioManager.SetObjectToFPlayFMODSoundStruct(PlayStruct, Player)
    AudioManager(self):PlayFMODSound_Async(PlayStruct)
  end
end

function G:PlayCharVoice(CharName, Voice, VoiceName)
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  self.VoiceEventInstance = AudioManager(self):PlayCharVoice(Player, CharName, Voice, nil, VoiceName)
end

function G:StopCharVoice(VoiceName)
  if self.VoiceEventInstance then
    self.VoiceEventInstance = nil
  end
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  AudioManager(self):StopSound(Player, VoiceName)
end

function G:SplitPlayerInfo(PlayerInfo)
  if not PlayerInfo then
    return ""
  end
  if string.sub(PlayerInfo, -1) == "_" then
    return string.sub(PlayerInfo, 1, -2)
  end
  return PlayerInfo
end

function G:TakeGachaScreenShot(Widget, OnHideCallback)
  ULowEntryExtendedStandardLibrary.SetMousePositionInPercentages(1, 1)
  local OutColorData = TArray(FColor)
  local OutSize = FVector(0, 0, 0)
  local IsSuccess = URuntimeCommonFunctionLibrary.TakeUIScreenShot(Widget, OutColorData, OutSize)
  if not IsSuccess then
    return
  end
  local Image = ULowEntryExtendedStandardLibrary.PixelsToTexture2D(math.floor(OutSize.X), math.floor(OutSize.Y), OutColorData)
  if not IsValid(Image) then
    return
  end
  if not IsValid(self.GachaScreenShotWidget) then
    self:GetScreenShotWidget()
  end
  if IsValid(self.GachaScreenShotWidget) then
    self.GachaScreenShotWidget:Init(Image, Widget, OnHideCallback)
    self.GachaScreenShotWidget:SetFocus()
  end
end

function G:PlayInAnim()
  self:PlayAnimation(self.In)
  self.CantClick = true
  self:BindToAnimationFinished(self.In, {
    self,
    self.PlayInAnimFinished
  })
  self.Common_Tab:PlayAnimation(self.Common_Tab.In)
end

function G:PlayInAnimFinished()
  self.CantClick = false
end

function G:OnClickBtnClose()
  self.CantClick = true
  self:StopAnimation(self.In)
  self:PlayAnimation(self.Out)
  if self.Common_Tab then
    self.Common_Tab:PlayAnimation(self.Common_Tab.Out)
  end
  if self.GachaIdMapBg and self.GachaIdMapBg[self.NowGachaId] then
    self.GachaIdMapBg[self.NowGachaId]:PlayAnimation(self.GachaIdMapBg[self.NowGachaId].Out)
  end
  AudioManager(self):SetEventSoundParam(self, "GachaMain", {ToEnd = 1})
  self:BindToAnimationFinished(self.Out, {
    self,
    self.Close
  })
end

function G:Close()
  if self.IsUnLoadNavMesh then
    local GameInstance = GWorld.GameInstance
    local Player = UE4.UGameplayStatics.GetPlayerCharacter(GameInstance, 0)
    DebugPrint("---\229\134\176\230\185\150\229\159\142\229\133\179\233\151\173\230\138\189\229\141\161\230\129\162\229\164\141\229\175\188\232\136\170\231\189\145\230\160\188---")
    URuntimeCommonFunctionLibrary.LoadNavMeshLevel(Player:GetWorld())
  end
  if self.CallBackObj and self.CallBackFunc then
    self.CallBackFunc(self.CallBackObj)
  end
  self.Super.Close(self)
end

function G:Destruct()
  if self.GachaRecordUI then
    self.GachaRecordUI:RemoveFromParent()
  end
  if self.GachaOnceUI then
    self.GachaOnceUI:RemoveFromParent()
  end
  if self.GachaTentimesUI then
    self.GachaTentimesUI:RemoveFromParent()
  end
  if self.GachaUpTitleSign then
    self.GachaUpTitleSign:RemoveFromParent()
  end
  self.Bg_Anchor:ClearChildren()
  self.LoadUIAnchor:ClearChildren()
  self.Super.Destruct(self)
end

return G
