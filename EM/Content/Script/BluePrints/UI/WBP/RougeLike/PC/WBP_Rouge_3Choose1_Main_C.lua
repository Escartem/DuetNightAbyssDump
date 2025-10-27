require("UnLua")
local EMCache = require("EMCache.EMCache")
local M = Class("BluePrints.UI.BP_UIState_C")

function M:Construct()
  self.BtnCD = 0.5
  self.BlessingWidgets = {}
  self.TreasureWidgets = {}
  self.ActivateNeedMap = {}
  for i = 1, 3 do
    local BlessingWidgetName = string.format("Item_Blessing0%s", i)
    local BlessingWidget = self[BlessingWidgetName]
    local TreasureWidgetName = string.format("Item_Treasure0%s", i)
    local TreasureWidget = self[TreasureWidgetName]
    if BlessingWidget then
      table.insert(self.BlessingWidgets, BlessingWidget)
    end
    if TreasureWidget then
      table.insert(self.TreasureWidgets, TreasureWidget)
    end
  end
  local Avatar = GWorld:GetAvatar()
  self.CoinId = Avatar and Avatar:GetCurrentRougeLikeTokenId() or 0
  self.Btn_Refresh.Btn_Click.OnClicked:Add(self, self.OnRefreshAward)
  self.Btn_Refresh.Btn_Click.OnHovered:Add(self, self.OnRougeBtnHover)
  local CoinIcon = LoadObject(DataMgr.Resource[self.CoinId].Icon)
  self.Btn_Refresh.Common_Item_Icon:Init({
    UIName = "Rouge_3Choose1_Main",
    IsShowDetails = true,
    IsCantItemSelection = true,
    Id = self.CoinId,
    Icon = CoinIcon,
    ItemType = "Resource",
    HandleMouseDown = true
  })
  self.Btn_SortDesc:AddEventOnCheckStateChanged(self, self.SwitchDesc)
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
end

function M:InitUIInfo(Name, IsInUIMode, EventList, ...)
  self.Super.InitUIInfo(self, Name, IsInUIMode, EventList, ...)
  self.AwardList, self.IsEventAward = ...
  self:ShowNextAward()
  self:InitResourceBar()
  self:InitRougeBtn()
  if self.AwardType == "Blessing" then
    self:InitSuitVariables()
    self:SetListView()
    self:UpdateSuitInfo(self.SelectedSuit, self.CurrentListIndex)
  end
  AudioManager(self):PlayUISound(self, "event:/ui/roguelike/choose_point_hud_show", "Switch3Choose1", nil)
  self:SetFocus()
  if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
    self:InitGamepadView()
  elseif UIUtils.UtilsGetCurrentInputType() == ECommonInputType.MouseAndKeyboard then
    self:InitKeyboardView()
  end
end

function M:InitSuitVariables()
  self.SuitIdToCount = {}
  self.SuitIdToIndex = {}
  self.BlessingGroupData = DataMgr.BlessingGroup
  local Index = 0
  local MaxSuitId = 1
  local MaxSuitCount = 0
  for _, v in pairs(self.BlessingGroupData) do
    local SuitCount = GWorld.RougeLikeManager.BlessingGroup:Find(v.GroupId)
    SuitCount = SuitCount or 0
    if MaxSuitCount < SuitCount then
      MaxSuitCount = SuitCount
      MaxSuitId = v.GroupId
    end
    self.SuitIdToCount[v.GroupId] = SuitCount
    self.SuitIdToIndex[v.GroupId] = Index
    for _, ActiveNeed in ipairs(v.ActivateNeed) do
      if self.ActivateNeedMap[v.GroupId] == nil then
        self.ActivateNeedMap[v.GroupId] = {}
      end
      table.insert(self.ActivateNeedMap[v.GroupId], ActiveNeed + GWorld.RougeLikeManager.BlessingGroupDiscount)
    end
    Index = Index + 1
  end
  self.MaxSuitNum = Index
  self.SelectedSuit = MaxSuitId
  self.CurrentListIndex = self.SuitIdToIndex[self.SelectedSuit]
end

function M:InitRougeBtn()
  if self.Btn_Bag then
    self.Btn_Bag.Text_Btn:SetText(GText("UI_RougeLike_Bag"))
    self.Btn_Bag.Btn_Click.OnClicked:Add(self, function()
      AudioManager(self):PlayUISound(self, "event:/ui/roguelike/btn_black_small_click", nil, nil)
      UIManager(self):LoadUINew("RougeBag")
    end)
    self.Btn_Bag.Btn_Click.OnHovered:Add(self, function()
      AudioManager(self):PlayUISound(self, "event:/ui/roguelike/btn_black_hover", nil, nil)
    end)
    self.Btn_Bag.Key_Bag:CreateCommonKey({
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "Menu"}
      }
    })
  end
  if self.AwardType == "Blessing" then
    self.Btn_Right.Btn.OnClicked:Add(self, self.TabToRight)
    self.Btn_Left.Btn.OnClicked:Add(self, self.TabToLeft)
    if self.Left_GamePad then
      self.Left_GamePad:CreateCommonKey({
        KeyInfoList = {
          {Type = "Img", ImgShortPath = "LB"}
        }
      })
      self.Right_GamePad:CreateCommonKey({
        KeyInfoList = {
          {Type = "Img", ImgShortPath = "RB"}
        }
      })
    end
  end
  self.Btn_Confirm.Text_BtnTitle:SetText(GText("UI_RougeLike_BlessingConfirm"))
  self.Btn_Confirm.Btn_Click.OnClicked:Add(self, self.OnConfirmBtnClicked)
  self.Btn_Confirm.Btn_Click.OnHovered:Add(self, self.OnRougeBtnHover)
  self.Btn_Confirm.Panel_Group_Currency:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self.Btn_Confirm.Group_PriceBG:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self.Btn_Confirm.Btn_Click:SetIsEnabled(false)
  self.Btn_Confirm:PlayAnimation(self.Btn_Confirm.Forbidden)
  self.Btn_Confirm.Key_GamePad:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "A"}
    }
  })
  self.Btn_GiveUp.Text_Btn:SetText(GText("UI_RougeLike_GiveUpSelect"))
  self.Btn_GiveUp.Btn_Click.OnClicked:Add(self, self.ShowRefundPopupUI)
  self.Btn_GiveUp.Btn_Click.OnHovered:Add(self, self.OnGiveUpBtnHover)
  self.Btn_GiveUp.Key_Gamepad:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "X"}
    }
  })
  self.Text_SortDesc:SetText(GText("RLBlessing_SimpleDesc_Switch"))
  if self.Key_Gamepad_Desc then
    self.Key_Gamepad_Desc:CreateCommonKey({
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "View"}
      }
    })
  end
  local IsSimpleDesc = EMCache:Get("RougeSimpleDesc")
  self.Btn_SortDesc:SetChecked(IsSimpleDesc, true)
  if self.Key_Tip then
    local BottomKeyInfo = {
      {
        KeyInfoList = {
          {Type = "Img", ImgShortPath = "RV"}
        },
        Desc = GText("UI_CTL_Rougelike_SlideItems")
      }
    }
    self.Key_Tip:UpdateKeyInfo(BottomKeyInfo)
  end
  if self.AwardType == "Blessing" and CommonUtils.GetDeviceTypeByPlatformName(self) ~= "Mobile" then
    self.Key_SuitDetail:CreateCommonKey({
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "LS"}
      },
      Desc = GText("UI_CTL_ExplainSet")
    })
    self.Key_SuitDetail:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    self.UsedSuitDetail = self.Key_Tip
  end
end

function M:ShowTreasureSuitGamePadKey()
  if self.Key_Tip then
    local BottomKeyInfo = {
      {
        KeyInfoList = {
          {Type = "Img", ImgShortPath = "LS"}
        },
        Desc = GText("UI_CTL_ExplainSet")
      },
      {
        KeyInfoList = {
          {Type = "Img", ImgShortPath = "RV"}
        },
        Desc = GText("UI_CTL_Rougelike_SlideItems")
      }
    }
    self.Key_Tip:UpdateKeyInfo(BottomKeyInfo)
  end
end

function M:HideTreasureSuitGamePadKey()
  if self.Key_Tip then
    local BottomKeyInfo = {
      {
        KeyInfoList = {
          {Type = "Img", ImgShortPath = "RV"}
        },
        Desc = GText("UI_CTL_Rougelike_SlideItems")
      }
    }
    self.Key_Tip:UpdateKeyInfo(BottomKeyInfo)
  end
end

function M:InitResourceBar()
  self.Panel_ResourceBar:ClearChildren()
  self.ResourceBarWidget = self:CreateWidgetNew("ResourceBarNode")
  self.Panel_ResourceBar:AddChild(self.ResourceBarWidget)
  self.ResourceBarWidget:InitResourceBar({
    self.CoinId
  })
  local ResourceBarIcon = UIUtils.UtilsGetKeyIconPathInGamepad("RS", "Generic")
  self.ResourceBarWidget:SetGamePadKeyImgByPath(ResourceBarIcon)
end

function M:InitRefreshButton(AwardType)
  if "Treasure" == AwardType then
    self.Btn_Refresh:SetVisibility(ESlateVisibility.Collapsed)
    return
  else
    self.Btn_Refresh:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  end
  if not GWorld.RougeLikeManager then
    return
  end
  self.Btn_Refresh.Btn_Click:SetForbidden(false)
  self.StartTime = UE4.UGameplayStatics.GetRealTimeSeconds(self)
  local RefreshTime = GWorld.RougeLikeManager.RefreshTime
  local MaxRefreshTime = GWorld.RougeLikeManager.MaxRefreshTime
  self.ResetCost = GWorld.RougeLikeManager.RefreshCost
  local Avatar = GWorld:GetAvatar()
  local Currency = Avatar.Resources:QueryResourceCount(self.CoinId)
  local CostText
  if Currency < self.ResetCost then
    CostText = "<W>" .. self.ResetCost .. "</>"
    self.Btn_Refresh:PlayAnimation(self.Btn_Refresh.Forbidden)
    self.Btn_Refresh.Btn_Click:SetForbidden(true)
  else
    CostText = tostring(self.ResetCost)
  end
  if RefreshTime >= MaxRefreshTime then
    self.Btn_Refresh:PlayAnimation(self.Btn_Refresh.Forbidden)
    self.Btn_Refresh.Btn_Click:SetForbidden(true)
  end
  self.Btn_Refresh.Text_BtnTitle:SetText(GText("UI_RougeLike_RefreshSelect"))
  self.Btn_Refresh.Text_BtnTimes:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  self.Btn_Refresh.Text_BtnNum_Front:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  self.Btn_Refresh.Text_BtnNum_Back:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  self.Btn_Refresh.Text_BtnTimes:SetText(GText(MaxRefreshTime - RefreshTime .. "/" .. MaxRefreshTime))
  self.Btn_Refresh.Text_Reset:SetText(GText(CostText))
  self.Btn_Refresh.Key_GamePad:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "Y"}
    }
  })
end

function M:UpdateSuitInfo(SuitId, Index)
  AudioManager(self):PlayUISound(self, "event:/ui/roguelike/choose_point_affix_refresh", nil, nil)
  self:PlayAnimation(self.Switch)
  self.CurrentListIndex = Index
  local CurrentCount = self.SuitIdToCount[SuitId]
  if self.PreAddSuit and self.PreAddSuit == SuitId then
    CurrentCount = CurrentCount + 1
  end
  self.Text_SuitNum:SetText(CurrentCount)
  self.Text_SuitTitle:SetText(GText(self.BlessingGroupData[SuitId].Name))
  self:SetSuitImage(SuitId, CurrentCount, self.PreAddSuit)
  self.ScrollBox_Suit:ClearChildren()
  for i = 1, 4 do
    local DetailWidget = UIManager(self):CreateWidget("/Game/UI/WBP/RougeLike/Widget/Suit/WBP_Rouge_SuitDetail_SubItem.WBP_Rouge_SuitDetail_SubItem", false)
    local DetailInfo = {}
    if self.PreAddSuit and self.PreAddSuit == SuitId then
      DetailInfo = RougeUtils:GenSuitDetail(SuitId, i, true)
    else
      DetailInfo = RougeUtils:GenSuitDetail(SuitId, i, false)
    end
    DetailInfo.Parent = self
    DetailWidget:InitUIInfo(DetailInfo)
    self.ScrollBox_Suit:AddChild(DetailWidget)
  end
  self.List_BottomTab:SetSelectedIndex(Index)
  if CommonUtils.GetDeviceTypeByPlatformName(self) == "Mobile" then
    return
  end
  self:SelectSuitItem(self.CurrentSelectSuitItem)
  self.ScrollBox_Suit:SetScrollOffset(0)
end

function M:SetSuitImage(SuitId, CurrentCount, PreAddSuit)
  local Icon = LoadObject(self.BlessingGroupData[SuitId].BigIcon)
  self.Image_SuitIcon.Image_SuitIcon:SetBrushFromTexture(Icon)
  local IconDynaMaterial = self.Image_SuitIcon.Image_SuitIcon_Color:GetDynamicMaterial()
  if IconDynaMaterial then
    IconDynaMaterial:SetTextureParameterValue("Mask", Icon)
  end
  if PreAddSuit and PreAddSuit == SuitId then
    self.Text_SuitNum:SetColorAndOpacity(self.CanUnlockNumColor)
  else
    self.Text_SuitNum:SetColorAndOpacity(self.NormalColor)
  end
  for i = 1, 4 do
    if CurrentCount < self.ActivateNeedMap[SuitId][i] then
      self.Image_SuitIcon:PlayAnimation(self.Image_SuitIcon[i - 1])
      break
    end
    if 4 == i then
      self.Image_SuitIcon:PlayAnimation(self.Image_SuitIcon[i])
    end
  end
end

function M:UpdateAllCompadKeyDefinition()
  self:AddTimer(0.01, function()
    if not self then
      return
    end
    for i = 1, 3 do
      local BlessingWidgetName = string.format("Item_Blessing0%s", i)
      local BlessingWidget = self[BlessingWidgetName]
      if BlessingWidget and BlessingWidget ~= self.CurrentSelectItem then
        BlessingWidget:UpdateCompadKeyDefinition(false)
      elseif BlessingWidget then
        BlessingWidget:UpdateCompadKeyDefinition(true)
      end
    end
  end)
end

function M:SetListView()
  self.List_BottomTab:ClearListItems()
  local Index = 0
  for _, v in pairs(self.BlessingGroupData) do
    local Content = NewObject(self.SuitInfoContentClass)
    Content.SuitId = v.GroupId
    Content.Count = self.SuitIdToCount[v.GroupId]
    Content.Index = Index
    if self.CurrentListIndex == Content.Index then
      Content.IsSelected = true
    end
    Content.ActivateNeedMap = self.ActivateNeedMap
    if self.PreAddSuit and self.PreAddSuit == v.GroupId then
      Content.Count = Content.Count + 1
      Content.IsPreAdd = true
    end
    Content.Parent = self
    Content.UseBigFont = false
    self.List_BottomTab:AddItem(Content)
    Index = Index + 1
  end
end

function M:TabToRight()
  if self.AwardType == "Blessing" and self.CurrentListIndex < self.MaxSuitNum - 1 then
    AudioManager(self):PlayUISound(self, "event:/ui/common/click_mid", nil, nil)
    local SuitId = self.List_BottomTab:GetItemAt(self.CurrentListIndex + 1).SuitId
    self:UpdateSuitInfo(SuitId, self.CurrentListIndex + 1)
    if self.bInSuitScroll then
      self:AddTimer(0.1, function()
        local TopChildWidget = self.ScrollBox_Suit:GetChildAt(0)
        if TopChildWidget then
          TopChildWidget:SetFocus()
        end
      end)
    end
  end
end

function M:TabToLeft()
  if self.AwardType == "Blessing" and self.CurrentListIndex > 0 then
    AudioManager(self):PlayUISound(self, "event:/ui/common/click_mid", nil, nil)
    local SuitId = self.List_BottomTab:GetItemAt(self.CurrentListIndex - 1).SuitId
    self:UpdateSuitInfo(SuitId, self.CurrentListIndex - 1)
    if self.bInSuitScroll then
      self:AddTimer(0.1, function()
        local TopChildWidget = self.ScrollBox_Suit:GetChildAt(0)
        if TopChildWidget then
          TopChildWidget:SetFocus()
        end
      end)
    end
  end
end

function M:ShowNextAward()
  self.ItemSelectInfo = self.AwardList[1]
  self.AwardType = self.ItemSelectInfo.Type
  self:InitRefreshButton(self.AwardType)
  local InfoList = self.ItemSelectInfo.AwardsId
  if self.AwardType == "Blessing" then
    self.Text_Title:SetText(GText("UI_RougeLike_SelectBlessing"))
  elseif self.AwardType == "Treasure" then
    if self:CheckIfSupportAward() then
      self.Text_Title:SetText(GText("UI_MRT_ExtraTreasure"))
    else
      self.Text_Title:SetText(GText("UI_RougeLike_SelectTreasure"))
    end
  end
  for i = 1, 3 do
    assert(self[self.AwardType .. "Widgets"][i], "\230\178\161\230\137\190\229\136\176AwardWidgets")
    if InfoList[i] then
      self[self.AwardType .. "Widgets"][i]:OnLoaded({
        AwardType = self.AwardType,
        AwardId = InfoList[i].ItemId
      }, self)
    else
      self[self.AwardType .. "Widgets"][i]:SetVisibility(ESlateVisibility.Collapsed)
    end
  end
  self:SwitchDesc(self.Btn_SortDesc:GetChecked())
  table.remove(self.AwardList, 1)
end

function M:ChooseItem(AwardId)
  local Avatar = GWorld:GetAvatar()
  assert(Avatar, "Avatar\228\184\141\229\173\152\229\156\168")
  local GameMode = UE4.UGameplayStatics.GetGameMode(GWorld.GameInstance)
  assert(GameMode, "GameMode\228\184\141\229\173\152\229\156\168")
  self.AwardId = AwardId
  GWorld.RougeLikeManager.Last3Choose1AwardId = AwardId
  if self.AwardType == "Blessing" then
    if GWorld.RougeLikeManager.Blessings:FindRef(AwardId) then
      return
    end
    Avatar:GetBlessing(AwardId, function()
      self:PlayItemsFadeAnimations(AwardId)
      self.CurrentSelectId = nil
      self.CurrentSelectItem = nil
      self:Close()
    end)
  elseif self.AwardType == "Treasure" then
    if GWorld.RougeLikeManager.Treasures:FindRef(AwardId) then
      return
    end
    Avatar:GetTreasure(AwardId, function()
      self:PlayItemsFadeAnimations(AwardId)
      self:Close()
    end)
  end
end

function M:SelectItem(AwardId, SelectWidget)
  if self.AwardType == "Blessing" then
    local SuitId = DataMgr.RougeLikeBlessing[AwardId].BlessingGroup
    self.PreAddSuit = SuitId
    local CurIndex = self.SuitIdToIndex[SuitId]
    if not self.CurrentSelectId and self.List_BottomTab:GetItemAt(CurIndex) then
      self.List_BottomTab:GetItemAt(CurIndex).UI.IsPreAdd = true
      self.List_BottomTab:GetItemAt(CurIndex).UI:BP_OnItemSelectionChanged(true)
    else
      local PrevIndex = self.SuitIdToIndex[DataMgr.RougeLikeBlessing[self.CurrentSelectId].BlessingGroup]
      if PrevIndex ~= CurIndex and self.List_BottomTab:GetItemAt(PrevIndex) then
        self.List_BottomTab:GetItemAt(PrevIndex).UI.IsPreAdd = false
        self.List_BottomTab:GetItemAt(PrevIndex).UI:BP_OnItemSelectionChanged(false)
        self.List_BottomTab:GetItemAt(CurIndex).UI.IsPreAdd = true
      end
    end
    self:UpdateSuitInfo(SuitId, self.SuitIdToIndex[SuitId])
    self:UpdateAllCompadKeyDefinition()
  elseif self.AwardType == "Treasure" then
    local TreasureNum = UIUtils.GetTreasureGroupNum(AwardId)
    local CurrentTreasureNum = UIUtils.GetCurrentTreasureGroupNum(AwardId)
    local Text = "<G>" .. tostring(CurrentTreasureNum + 1) .. "</>" .. "/" .. tostring(TreasureNum)
    if TreasureNum > 0 then
      if CurrentTreasureNum + 1 == TreasureNum then
        SelectWidget.Rouge_SuitSign:PlayAnimation(SelectWidget.Rouge_SuitSign.Active)
      end
      SelectWidget.Rouge_SuitSign.Text_SuitTitle:SetText(Text)
      self:ShowTreasureSuitGamePadKey()
    else
      self:HideTreasureSuitGamePadKey()
    end
    if self.CurrentSelectId ~= AwardId then
      TreasureNum = UIUtils.GetTreasureGroupNum(self.CurrentSelectId)
      CurrentTreasureNum = UIUtils.GetCurrentTreasureGroupNum(self.CurrentSelectId)
      Text = tostring(CurrentTreasureNum) .. "/" .. tostring(TreasureNum)
      if TreasureNum > 0 then
        if CurrentTreasureNum + 1 == TreasureNum then
          SelectWidget.Rouge_SuitSign:PlayAnimation(self.CurrentSelectItem.Rouge_SuitSign.Normal)
        end
        self.CurrentSelectItem.Rouge_SuitSign.Text_SuitTitle:SetText(Text)
      end
    end
  end
  self.Btn_Confirm:PlayAnimation(self.Btn_Confirm.Normal)
  self.Btn_Confirm.Btn_Click:SetIsEnabled(true)
  self.CurrentSelectId = AwardId
  self.CurrentSelectItem = SelectWidget
  self:PlayItemsUnSelectAnimations(AwardId)
end

function M:OnConfirmBtnClicked()
  DebugPrint("\230\163\128\230\181\139\229\136\176\231\161\174\232\174\164\230\140\137\233\148\174\230\140\137\228\184\139")
  if not self.IsInit then
    DebugPrint("\232\191\152\230\156\170\229\136\157\229\167\139\229\140\150\229\174\140\230\136\144\239\188\140\228\184\141\229\133\129\232\174\184\233\128\137\230\139\169\229\165\150\229\138\177")
    return
  end
  if not self.CurrentSelectId then
    return
  end
  self.CurrentTime = UE4.UGameplayStatics.GetRealTimeSeconds(self)
  if self.ConfirmStartTime and self.CurrentTime - self.ConfirmStartTime < self.BtnCD then
    return
  end
  self.ConfirmStartTime = UE4.UGameplayStatics.GetRealTimeSeconds(self)
  AudioManager(self):PlayUISound(self, "event:/ui/roguelike/choose_point_confirm", nil, nil)
  AudioManager(self):PlayUISound(self, "event:/ui/roguelike/btn_black_mid_click", nil, nil)
  self:ChooseItem(self.CurrentSelectId)
end

function M:OnRefreshAward()
  if not self.Btn_Refresh then
    return
  end
  self.CurrentTime = UE4.UGameplayStatics.GetRealTimeSeconds(self)
  if self.CurrentTime - self.StartTime < self.BtnCD then
    return
  end
  AudioManager(self):PlayUISound(self, "event:/ui/roguelike/btn_black_mid_click", nil, nil)
  local Avatar = GWorld:GetAvatar()
  local Currency = Avatar.Resources:QueryResourceCount(self.CoinId)
  if Currency < self.ResetCost then
    UIManager(GWorld.GameInstance):ShowUITip("CommonToastMain", GText("UI_Rou_Toast_27006"))
    return
  end
  local RefreshTime = GWorld.RougeLikeManager.RefreshTime
  local MaxRefreshTime = GWorld.RougeLikeManager.MaxRefreshTime
  if RefreshTime >= MaxRefreshTime then
    UIManager(GWorld.GameInstance):ShowUITip("CommonToastMain", GText("UI_Rou_Toast_27012"))
    return
  end
  self.StartTime = UE4.UGameplayStatics.GetRealTimeSeconds(self)
  if Avatar then
    Avatar:RefreshAward(self.AwardType, function()
      self:FillNewAward()
      self:PlayAnimation(self.Refresh)
      self:PlayItemsRefreshAnimations()
      self:AddTimer(self[self.AwardType .. "Widgets"][1].Refresh_Out:GetEndTime(), self.ShowNextAward)
      AudioManager(self):PlayUISound(self, "event:/ui/roguelike/choose_point_refresh", nil, nil)
      self.ResourceBarWidget:UpdateResource()
      self:InitRefreshButton(self.AwardType)
      self:UpdateSuitInfo(self.SelectedSuit, self.CurrentListIndex)
    end)
  end
end

function M:FillNewAward()
  if not GWorld.RougeLikeManager then
    return
  end
  local InfoList = {}
  local RandomAwards = GWorld.RougeLikeManager["Random" .. self.AwardType .. "s"]
  for i = 1, RandomAwards:Length() do
    local ItemId = RandomAwards[i]
    table.insert(InfoList, {ItemId = ItemId})
  end
  if self.AwardType == "Blessing" then
    if self.PreAddSuit then
      local CurIndex = self.SuitIdToIndex[self.PreAddSuit]
      self.List_BottomTab:GetItemAt(CurIndex).UI.IsPreAdd = false
      self.List_BottomTab:GetItemAt(CurIndex).UI:BP_OnItemSelectionChanged(false)
      self:SetSuitImage(self.PreAddSuit, CurIndex)
    end
    self.PreAddSuit = nil
  end
  local Award = {
    Type = self.AwardType,
    Event = "3Choose1",
    AwardsId = InfoList
  }
  table.insert(self.AwardList, 1, Award)
end

function M:PlayItemsFadeAnimations(AwardId)
  for i = 1, 3 do
    if self[self.AwardType .. "Widgets"][i].AwardId == AwardId then
      self[self.AwardType .. "Widgets"][i]:PlayAnimationForward(self[self.AwardType .. "Widgets"][i].Btn_Click)
    else
      self[self.AwardType .. "Widgets"][i]:PlayAnimationForward(self[self.AwardType .. "Widgets"][i].Auto_Out)
    end
  end
end

function M:PlayItemsUnSelectAnimations(AwardId)
  for i = 1, 3 do
    if self[self.AwardType .. "Widgets"][i].AwardId ~= AwardId and self[self.AwardType .. "Widgets"][i].IsSelected then
      if self[self.AwardType .. "Widgets"][i]:IsAnimationPlaying(self[self.AwardType .. "Widgets"][i].Click) then
        self[self.AwardType .. "Widgets"][i]:StopAnimation(self[self.AwardType .. "Widgets"][i].Click)
      end
      self[self.AwardType .. "Widgets"][i].IsSelected = false
      self[self.AwardType .. "Widgets"][i]:PlayAnimationForward(self[self.AwardType .. "Widgets"][i].UnSelect)
    end
  end
end

function M:PlayItemsRefreshAnimations()
  for i = 1, 3 do
    self[self.AwardType .. "Widgets"][i]:PlayAnimationForward(self[self.AwardType .. "Widgets"][i].Refresh_Out)
    self.CurrentSelectId = nil
    self.CurrentSelectItem = nil
  end
  self.Btn_Confirm:PlayAnimation(self.Btn_Confirm.Forbidden)
  self.Btn_Confirm.Btn_Click:SetIsEnabled(false)
end

function M:OnUpdateUIStyleByInputTypeChange(CurInputType, CurGamepadName)
  self.Super.OnUpdateUIStyleByInputTypeChange(self, CurInputType, CurGamepadName)
  if CurInputType == ECommonInputType.Gamepad then
    self:InitGamepadView()
  else
    self:InitKeyboardView()
  end
end

function M:OnKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if InKeyName == Const.GamepadFaceButtonLeft then
    self:ShowRefundPopupUI()
  elseif InKeyName == Const.GamepadFaceButtonUp then
    self:OnRefreshAward()
  elseif InKeyName == Const.GamepadFaceButtonDown then
    self:OnConfirmBtnClicked()
  elseif InKeyName == Const.GamepadLeftTrigger then
    self.IsLeftTriggerDown = true
  elseif InKeyName == Const.GamepadSpecialRight then
    UIManager(self):LoadUINew("RougeBag")
  elseif InKeyName == Const.GamepadSpecialLeft then
    self.Btn_SortDesc:OnBtnClicked()
  elseif InKeyName == Const.GamepadLeftShoulder then
    self:TabToLeft()
  elseif InKeyName == Const.GamepadRightShoulder then
    self:TabToRight()
  elseif InKeyName == Const.GamepadRightThumbstick then
    self.ResourceBarWidget:SetLastFocusWidget(self.CurrentSelectItem.Button_Select or nil)
    self.ResourceBarWidget:SetFocus()
  elseif InKeyName == Const.GamepadLeftThumbstick then
    if self.AwardType == "Blessing" then
      local TopChildWidget = self.ScrollBox_Suit:GetChildAt(0)
      if TopChildWidget then
        TopChildWidget:SetFocus()
      end
      self:ShowOtherGamepadKey(false)
    else
      if self.CurrentSelectItem then
        self.CurrentSelectItem.Rouge_SuitSign.Com_BtnQa:OnViewInfoClick()
      end
      self:HideTreasureSuitGamePadKey()
    end
    self.bInSuitScroll = true
  elseif InKeyName == Const.GamepadFaceButtonRight and self.bInSuitScroll then
    if self.AwardType == "Blessing" then
      if self.CurrentSelectItem then
        self.CurrentSelectItem.Button_Select:SetFocus()
      else
        self.Item_Blessing01.Button_Select:SetFocus()
      end
    end
    self.bInSuitScroll = false
    if self.Key_Tip then
      local BottomKeyInfo = {
        {
          KeyInfoList = {
            {Type = "Img", ImgShortPath = "RV"}
          },
          Desc = GText("UI_CTL_Rougelike_SlideItems")
        }
      }
      self.Key_Tip:UpdateKeyInfo(BottomKeyInfo)
    end
    self:ShowOtherGamepadKey(true)
  end
  return UE4.UWidgetBlueprintLibrary.Handled()
end

function M:ShowOtherGamepadKey(bShow)
  local Visibility = bShow and UIConst.VisibilityOp.SelfHitTestInvisible or UIConst.VisibilityOp.Collapsed
  self.Btn_Confirm.Key_GamePad:SetVisibility(Visibility)
  self.Btn_Refresh.Key_GamePad:SetVisibility(Visibility)
  if self.Key_GamePad_Desc then
    self.Key_GamePad_Desc:SetVisibility(Visibility)
  end
  self.Left_GamePad:SetVisibility(Visibility)
  self.Right_GamePad:SetVisibility(Visibility)
  self.Btn_Bag.Key_Bag:SetVisibility(Visibility)
  self.Btn_GiveUp.Key_GamePad:SetVisibility(Visibility)
  self.Key_SuitDetail:SetVisibility(Visibility)
  self.ResourceBarWidget.KeyImg_GamePad:SetVisibility(Visibility)
end

function M:SelectSuitItem(SelectSuitItem)
  if self.Key_Tip and self.bInSuitScroll then
    local BottomKeyInfo
    if SelectSuitItem and SelectSuitItem.ExplanationId and #SelectSuitItem.ExplanationId > 0 then
      BottomKeyInfo = {
        {
          KeyInfoList = {
            {Type = "Img", ImgShortPath = "A"}
          },
          Desc = GText("UI_CTL_Explain")
        },
        {
          KeyInfoList = {
            {Type = "Img", ImgShortPath = "B"}
          },
          Desc = GText("UI_BACK")
        }
      }
    else
      BottomKeyInfo = {
        {
          KeyInfoList = {
            {Type = "Img", ImgShortPath = "B"}
          },
          Desc = GText("UI_BACK")
        }
      }
    end
    self.Key_Tip:UpdateKeyInfo(BottomKeyInfo)
  end
end

function M:OnKeyUp(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if InKeyName == Const.GamepadLeftTrigger then
    self.IsLeftTriggerDown = nil
  end
  return UE4.UWidgetBlueprintLibrary.Handled()
end

function M:OnAnalogValueChanged(MyGeometry, InAnalogInputEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InAnalogInputEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local AddOffset = UKismetInputLibrary.GetAnalogValue(InAnalogInputEvent) * 5
  if "Gamepad_RightY" == InKeyName or "Gamepad_LeftY" == InKeyName then
    if self.IsLeftTriggerDown and self.ScrollBox_Suit then
      local CurScrollOffset = self.ScrollBox_Suit:GetScrollOffset()
      local ScrollOffset = math.clamp(CurScrollOffset - AddOffset, 0, self.ScrollBox_Suit:GetScrollOffsetOfEnd())
      self.ScrollBox_Suit:SetScrollOffset(ScrollOffset)
    elseif self.CurrentSelectItem then
      local CurScrollOffset = self.CurrentSelectItem.ScrollBox_Desc:GetScrollOffset()
      local ScrollOffset = math.clamp(CurScrollOffset - AddOffset, 0, self.CurrentSelectItem.ScrollBox_Desc:GetScrollOffsetOfEnd())
      self.CurrentSelectItem.ScrollBox_Desc:SetScrollOffset(ScrollOffset)
    end
  end
  return UE4.UWidgetBlueprintLibrary.UnHandled()
end

function M:InitGamepadView()
  if self.Key_L then
    self.Key_L:SetActiveWidgetIndex(1)
  end
  if self.Key_R then
    self.Key_R:SetActiveWidgetIndex(1)
  end
  self.Btn_Bag.Key_Bag:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  self.Key_Tip:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  if self.AwardType == "Blessing" then
    self.Key_SuitDetail:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  end
  self.Btn_Refresh.Key_GamePad:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  self.Btn_Refresh.ImageSlot:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Btn_Confirm.Key_GamePad:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  self.Btn_Confirm.ImageSlot:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Btn_GiveUp.Key_GamePad:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  self.Key_GamePad_Desc:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  if not UIUtils.HasAnyFocus(self) then
    return
  end
  if self.CurrentSelectItem then
    self.CurrentSelectItem.Button_Select:SetFocus()
  else
    self[self.AwardType .. "Widgets"][1].Button_Select:SetFocus()
  end
end

function M:InitKeyboardView()
  if self.Key_L then
    self.Key_L:SetActiveWidgetIndex(0)
  end
  if self.Key_R then
    self.Key_R:SetActiveWidgetIndex(0)
  end
  self.Btn_Bag.Key_Bag:SetVisibility(UIConst.VisibilityOp.Collapsed)
  if self.Key_Tip then
    self.Key_Tip:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  if self.Key_SuitDetail then
    self.Key_SuitDetail:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  self.Btn_Refresh.Key_GamePad:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Btn_Refresh.ImageSlot:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  self.Btn_Confirm.Key_GamePad:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Btn_Confirm.ImageSlot:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  self.Btn_GiveUp.Key_GamePad:SetVisibility(UIConst.VisibilityOp.Collapsed)
  if self.Key_GamePad_Desc then
    self.Key_GamePad_Desc:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  self:UpdateAllCompadKeyDefinition()
end

function M:Close()
  AudioManager(self):SetEventSoundParam(self, "Switch3Choose1", {ToEnd = 1})
  self.Super.Close(self)
end

function M:RealClose()
  self.Super.RealClose(self)
  GWorld.RougeLikeManager:OnChooseAwardFinished()
  if CommonUtils.GetDeviceTypeByPlatformName(self) == "Mobile" then
    EventManager:FireEvent(EventID.OnHomeBaseBtnPlayAnim, "RougeBag", "Rouge_Get_Phone")
  else
    EventManager:FireEvent(EventID.OnHomeBaseBtnPlayAnim, "RougeBag", "Rouge_Get")
  end
  if self.AwardType == "Blessing" then
    EventManager:FireEvent(EventID.OnGetAwardUIClose)
  end
  GWorld.RougeLikeManager:ShowNextAward(self.AwardList)
end

function M:SwitchDesc(IsChecked)
  if self.AwardType == "Blessing" then
    for _, Widget in ipairs(self.BlessingWidgets) do
      Widget:SwitchDesc(IsChecked)
    end
  else
    for _, Widget in ipairs(self.TreasureWidgets) do
      Widget:SwitchDesc(IsChecked)
    end
  end
  EMCache:Set("RougeSimpleDesc", IsChecked)
end

function M:CheckIfSupportAward()
  return 1 == GWorld.RougeLikeManager.RoomIndex and 0 == GWorld.RougeLikeManager.PassRooms:Num()
end

function M:ShowRefundPopupUI()
  AudioManager(self):PlayUISound(self, "event:/ui/roguelike/btn_black_small_click", nil, nil)
  local RefundNum
  if GWorld.RougeLikeManager.bCanGetToken then
    RefundNum = DataMgr.RougeLikeSeason[GWorld.RougeLikeManager.SeasonId].MRTRefund
  else
    RefundNum = 0
  end
  local PopupText = string.format(GText("UI_RougeLike_GiveUpSelect_Tip"), RefundNum)
  local Params = {
    RightCallbackObj = self,
    RightCallbackFunction = self.RefundAward,
    ShortText = PopupText
  }
  UIManager(self):ShowCommonPopupUI(100143, Params)
end

function M:OnGiveUpBtnHover()
  AudioManager(self):PlayUISound(self, "event:/ui/roguelike/btn_black_hover", nil, nil)
end

function M:OnRougeBtnHover()
  AudioManager(self):PlayUISound(self, "event:/ui/roguelike/btn_black_hover", nil, nil)
end

function M:RefundAward()
  local Avatar = GWorld:GetAvatar()
  local GameMode = UE4.UGameplayStatics.GetGameMode(GWorld.GameInstance)
  Avatar:RougeLikeRefundMRT(self.AwardType, function()
    EventManager:FireEvent(EventID.OnRougeDealEventReward)
    self:PlayItemsFadeAnimations(nil)
    self:Close()
  end)
end

return M
