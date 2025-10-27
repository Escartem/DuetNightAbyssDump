require("UnLua")
local EMCache = require("EMCache.EMCache")
local GachaModel = require("BluePrints.UI.WBP.Gacha.GachaModel")
local GachaCommon = require("BluePrints.UI.WBP.Gacha.GachaCommon")
local GachaController = require("BluePrints.UI.WBP.Gacha.GachaController")
local M = Class({
  "BluePrints.UI.BP_UIState_C"
})

function M:Construct()
  self.IsPCPlatform = CommonUtils.GetDeviceTypeByPlatformName(self) == "PC"
  self.Btn_Detail:SetText(GText("UI_GACHA_DETAIL"))
  self.Btn_Detail:BindEventOnClicked(self, self.OnClickBtnDetails)
  self.Btn_History:SetText(GText("UI_GACHA_LIST"))
  self.Btn_History:SetDefaultGamePadImg(DataMgr.KeyboardText[UIConst.GamePadKey.SpecialLeft].KeyText)
  self.Btn_Detail:SetDefaultGamePadImg(DataMgr.KeyboardText[UIConst.GamePadKey.SpecialRight].KeyText)
  self.Btn_Once:SetDefaultGamePadImg(DataMgr.KeyboardText[UIConst.GamePadKey.FaceButtonLeft].KeyText)
  self.Btn_Tentimes:SetDefaultGamePadImg(DataMgr.KeyboardText[UIConst.GamePadKey.FaceButtonRight].KeyText)
  if self.Key_Exchange then
    self.Key_Exchange:CreateGamepadKey(DataMgr.KeyboardText[UIConst.GamePadKey.LeftThumb].KeyText)
  end
  self.Btn_Once:SetGamePadIconVisible(true)
  self.Btn_Tentimes:SetGamePadIconVisible(true)
  self.Btn_History:BindEventOnClicked(self, self.OnClickBtnHistory)
  self.Btn_Once:SetText(GText("UI_SkinGacha_One"))
  self.Btn_Once:BindEventOnClicked(self, self.OnClickBtnGachaOnce)
  
  function self.Btn_Once.SoundFunc()
    AudioManager(self):PlayUISound(self, "event:/ui/common/gacha_btn_click_normal", nil, nil)
  end
  
  self.Btn_Tentimes:SetText(GText("UI_SkinGacha_Ten"))
  self.Btn_Tentimes:BindEventOnClicked(self, self.OnClickBtnGachaTentimes)
  
  function self.Btn_Tentimes.SoundFunc()
    AudioManager(self):PlayUISound(self, "event:/ui/common/gacha_btn_click_normal", nil, nil)
  end
  
  self.Com_Time.Text_TimeTitle:SetText(GText("UI_SkinGacha_Remain_Time"))
  self.Group_ShopExchange:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  self.Btn_ShopExChange:SetText(GText("UI_SkinGacha_Shop_Goto"))
  self.Btn_ShopExChange:BindEventOnClicked(self, self.OnClickBtnShop)
  
  function self.Btn_ShopExChange.SoundFunc()
    AudioManager(self):PlayUISound(self, "event:/ui/activity/shop_small_btn_click", nil, nil)
  end
  
  self.Btn_ShopExChange:SetDefaultGamePadImg(DataMgr.KeyboardText.Gamepad_Dpad_Left.KeyText)
  self.Group_ListTop:SetVisibility(ESlateVisibility.Collapsed)
  self.Group_ListBottom:SetVisibility(ESlateVisibility.Collapsed)
  self.OpenKey = CommonUtils:GetActionMappingKeyName("OpenGacha")
  self:UnLoadNavMeshLevel()
  self:InitListenEvent()
end

function M:Destruct()
  AudioManager(self):StopSystemUIBGM(self.CurrentGachaId)
  self.Super.Destruct(self)
end

function M:UnLoadNavMeshLevel()
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

function M:ReceiveEnterState(StackAction)
  self.bCanNotClick = false
  M.Super.ReceiveEnterState(self, StackAction)
  self:RefreshGachaInfo(self.TabId)
end

function M:InitListenEvent()
  self:AddDispatcher(EventID.OnDrawGacha, self, self.OnDrawGacha)
  self:AddDispatcher(EventID.OnGachaPoolUpdate, self, self.OnGachaPoolUpdate)
end

function M:OnLoaded(Params)
  M.Super.OnLoaded(self, Params)
  self.GachaRecordsCache = nil
  self.BGWidgetMap = {}
  self.TitleWidgetMap = {}
  self.Group_TitleAnchor:ClearChildren()
  self.LoadUIAnchor:ClearChildren()
  self.PoolStaticBG:ClearChildren()
  self:InitCommonTab()
  local GachaTabId
  if Params then
    GachaTabId = Params.InitGachaTabId
  end
  self:InitGachaUI(GachaTabId)
end

function M:InitGachaUI(SkinGachaTabId)
  self.bInGachaMain = true
  self.bGachaing = false
  self.ExchangeBtnCanClick = false
  self.bCanNotClick = false
  self.bNeedUpdate = false
  self.GachaPoolDict = GachaModel:GetEffectiveGachaInfo()
  self.GachaTabInfoLst = GachaModel:GetGachaTabInfo()
  if SkinGachaTabId then
    self.TabId = SkinGachaTabId
  end
  if not self.TabId then
    for _, GachaTabData in ipairs(self.GachaTabInfoLst) do
      if self.GachaPoolDict[GachaTabData.TabId] then
        self.TabId = GachaTabData.TabId
        break
      end
    end
  end
  if not self.TabId then
    UIManager(self):ShowUITip("CommonToastMain", GText("GACHA_Toast_Nona"), 2)
    self:AddTimer(0.1, function()
      self:Close()
    end)
  end
  self.Image_Black:SetRenderOpacity(0)
  self:PlayAnimation(self.In)
  AudioManager(self):PlayUISound(self, "event:/ui/armory/open", "GachaMainIn", nil)
  self:BlockAllUIInput(true)
  self:FillGachaItem()
end

function M:InitCommonTab()
  self.Com_Tab:Init({
    DynamicNode = {
      "Back",
      "ResourceBar",
      "BottomKey"
    },
    BottomKeyInfo = {
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
    TitleName = GText("UI_SkinGacha_System_Name"),
    OwnerPanel = self,
    bShowBubble = true,
    OnResourceBarAddedToFocusPath = function()
      self.Btn_ShopExChange:SetGamePadVisibility(ESlateVisibility.Collapsed)
    end,
    OnResourceBarRemovedFromFocusPath = function()
      self.Btn_ShopExChange:SetGamePadVisibility(ESlateVisibility.SelfHitTestInvisible)
      self.Btn_ShopExChange:RefreshIconAndGamePadVisibility()
    end,
    BackCallback = self.CloseSelf
  })
  self.Btn_Once:SetGamePadImg(UIConst.GamePadImgKey.FaceButtonLeft)
  self.Btn_TenTimes:SetGamePadImg(UIConst.GamePadImgKey.FaceButtonTop)
end

function M:FillGachaItem()
  self.LastWidgetContent = nil
  self.PoolItemMap = {}
  self.List_Pool:ClearListItems()
  for i, GachaInfo in ipairs(self.GachaTabInfoLst) do
    if self.GachaPoolDict[GachaInfo.TabId] then
      local Content = NewObject(UIUtils.GetCommonItemContentClass())
      if self.TabId == GachaInfo.TabId then
        Content.bSelected = true
      else
        Content.bSelected = false
      end
      Content.TabId = GachaInfo.TabId
      Content.TabName = GachaInfo.TabName
      Content.Icon = GachaInfo.Icon
      Content.Parent = self
      Content.ClickEvent = {
        Obj = self,
        Callback = self.OnGachaTypeItemClick
      }
      self.PoolItemMap[GachaInfo.TabId] = Content
      self.List_Pool:AddItem(Content)
    end
  end
  self:AddTabReddotListen()
end

function M:OnGachaTypeItemClick(TabId, Content, bPlaySound)
  if self.LastWidgetContent and self.LastWidgetContent.SelfWidget then
    self.LastWidgetContent.SelfWidget:UnSelect()
  end
  self.LastWidgetContent = Content
  self.List_Pool:BP_SetItemSelection(Content, true)
  self:BlockAllUIInput(true)
  self:PlayAnimation(self.Change)
  if bPlaySound then
    AudioManager(self):PlayUISound(self, "event:/ui/activity/large_btn_click", nil, nil)
  end
  self.TabId = TabId
  self:RefreshGachaInfo(self.TabId)
end

function M:RefreshGachaInfo(TabId)
  if not TabId then
    return
  end
  if not next(self.GachaPoolDict) then
    return
  end
  local GachaLstData = self.GachaPoolDict[TabId]
  if not GachaLstData then
    return
  end
  local GachaData = DataMgr.SkinGacha[GachaLstData[1]]
  assert(GachaData, "\230\138\189\229\141\161\228\191\161\230\129\175\228\184\141\229\173\152\229\156\168:" .. GachaLstData[1])
  local GachaBGM = GachaData.BgBGM
  if GachaBGM then
    AudioManager(self):PlaySystemUIBGM(GachaBGM, nil, GachaLstData[1])
  end
  if self.CurrentGachaId ~= GachaLstData[1] then
    AudioManager(self):StopSystemUIBGM(self.CurrentGachaId)
  end
  self.CurrentGachaId = GachaLstData[1]
  self:CheckShopLockState()
  self:RefreshGachaBG(GachaData)
  self:RefreshGachaTitle(GachaData)
  self:RefreshCumulativeDrawReward()
  self:RefreshRemainGachaTimes()
  self:RefreshGuaranteedDict()
  self:RefreshGachaQualityTips(GachaData)
  self.Text_PoolGachaDetail:SetText(string.format(GText(GachaData.GachaDes), GText(GachaData.GachaName)))
  self:RemoveTimer("RefreshGacha")
  if GachaData.IsHIdeCountdown then
    self.Com_Time:SetVisibility(ESlateVisibility.Collapsed)
  else
    self.Com_Time:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self:UpdateGachaTime(GachaData.GachaEndTime)
    self:AddTimer(1, self.UpdateGachaTime, true, 0, "RefreshGacha", true, GachaData.GachaEndTime)
  end
  self:RefreshGachaResInfo()
end

function M:RefreshGachaResInfo()
  local GachaData = DataMgr.SkinGacha[self.CurrentGachaId]
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  local TabCoinInfo = {}
  if DataMgr.SystemUI.GachaMain.TabCoin then
    for key, value in ipairs(DataMgr.SystemUI.GachaMain.TabCoin) do
      table.insert(TabCoinInfo, value)
    end
  end
  for _, ResourceId in ipairs(GachaData.GachaCostRes) do
    table.insert(TabCoinInfo, ResourceId)
  end
  self.Com_Tab:OverrideTopResource(TabCoinInfo, true)
  self:RefreshGachaCostInfo()
  if self.GetItemPage then
    self.GetItemPage:RefreshGachaResInfo()
  end
end

function M:RefreshGachaCostInfo()
  local GachaData = DataMgr.SkinGacha[self.CurrentGachaId]
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  local ShowResourceId
  local ShowResourceCount = 0
  local TimeLimitResourceId
  local TimeLimitResourceCount = 0
  for _, ResourceId in ipairs(GachaData.GachaCostRes) do
    if ItemUtils.GetItemLimitedInfo(ResourceId) then
      TimeLimitResourceId = ResourceId
      TimeLimitResourceCount = Avatar:GetResourceNum(TimeLimitResourceId)
    else
      ShowResourceId = ResourceId
      ShowResourceCount = Avatar:GetResourceNum(ShowResourceId)
    end
  end
  if TimeLimitResourceCount >= GachaData.GachaCostNum10 then
    self.Com_CostOnce:InitContent({
      ResourceId = TimeLimitResourceId,
      bShowDenominator = false,
      Numerator = GachaData.GachaTimes,
      IsGamePadIconVisible = false,
      NotInteractive = true
    })
    self.Com_CostTenTimes_1:InitContent({
      ResourceId = TimeLimitResourceId,
      bShowDenominator = false,
      Numerator = GachaData.GachaCostNum10,
      IsGamePadIconVisible = false,
      NotInteractive = true
    })
    self.Panel_TimeLimit:SetVisibility(ESlateVisibility.Collapsed)
  elseif TimeLimitResourceCount > 0 and TimeLimitResourceCount + ShowResourceCount >= GachaData.GachaCostNum10 then
    self.Com_CostOnce:InitContent({
      ResourceId = TimeLimitResourceId,
      bShowDenominator = false,
      Numerator = GachaData.GachaTimes,
      IsGamePadIconVisible = false,
      NotInteractive = true
    })
    self.Com_CostTenTimes_1:InitContent({
      ResourceId = ShowResourceId,
      bShowDenominator = false,
      Numerator = GachaData.GachaCostNum10 - TimeLimitResourceCount,
      IsGamePadIconVisible = false,
      NotInteractive = true
    })
    self.Panel_TimeLimit:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self.Com_CostTenTimes_2:InitContent({
      ResourceId = TimeLimitResourceId,
      bShowDenominator = false,
      Numerator = TimeLimitResourceCount,
      IsGamePadIconVisible = false,
      NotInteractive = true
    })
  elseif TimeLimitResourceCount > 0 and TimeLimitResourceCount + ShowResourceCount < GachaData.GachaCostNum10 then
    self.Com_CostOnce:InitContent({
      ResourceId = TimeLimitResourceId,
      bShowDenominator = false,
      Numerator = GachaData.GachaTimes,
      IsGamePadIconVisible = false,
      NotInteractive = true
    })
    self.Com_CostTenTimes_1:InitContent({
      ResourceId = ShowResourceId,
      bShowDenominator = false,
      Numerator = GachaData.GachaCostNum10,
      IsGamePadIconVisible = false,
      NotInteractive = true
    })
    self.Panel_TimeLimit:SetVisibility(ESlateVisibility.Collapsed)
  else
    self.Com_CostOnce:InitContent({
      ResourceId = ShowResourceId,
      bShowDenominator = false,
      Numerator = GachaData.GachaTimes,
      IsGamePadIconVisible = false,
      NotInteractive = true
    })
    self.Com_CostTenTimes_1:InitContent({
      ResourceId = ShowResourceId,
      bShowDenominator = false,
      Numerator = GachaData.GachaCostNum10,
      IsGamePadIconVisible = false,
      NotInteractive = true
    })
    self.Panel_TimeLimit:SetVisibility(ESlateVisibility.Collapsed)
  end
end

function M:RefreshGachaBG(GachaData)
  self.VideoPlayer:Stop()
  if self.CurrentBgMusic then
    AudioManager(self):StopSound(self, self.CurrentBgMusic)
  end
  if 1 == GachaData.GachaDisplayType then
    local BgPath = GachaData.GachaDisplayPath
    if GachaData.BgMusic then
      self.CurrentBgMusic = GachaData.BgMusic
      AudioManager(self):PlayUISound(self, GachaData.BgMusic, self.CurrentBgMusic, nil)
    end
    self.VideoPlayer:SetUrlByMediaSource(LoadObject(BgPath))
    self.VideoPlayer:SetLooping(true)
    self.VideoPlayer:Play()
    self.WS_BG:SetActiveWidgetIndex(1)
  elseif 2 == GachaData.GachaDisplayType then
    self.WS_BG:SetActiveWidgetIndex(0)
    if not self.BGWidgetMap[self.CurrentGachaId] then
      local BgPath = GachaData.GachaDisplayPath
      if self.IsPCPlatform then
        BgPath = CommonConst.GachaBackgroundAddrPC .. GachaData.GachaDisplayPath .. "." .. GachaData.GachaDisplayPath
      else
        BgPath = CommonConst.GachaBackgroundAddrMobile .. GachaData.GachaDisplayPath .. "." .. GachaData.GachaDisplayPath
      end
      local BgUI = UIManager(self):CreateWidget(BgPath, false)
      assert(BgUI, "\230\138\189\229\141\161\232\131\140\230\153\175\232\181\132\230\186\144\228\184\141\229\173\152\229\156\168\239\188\154BgPath:" .. BgPath .. " GachaId: " .. self.CurrentGachaId)
      self.BGWidgetMap[self.CurrentGachaId] = BgUI
      self.PoolStaticBG:AddChild(self.BGWidgetMap[self.CurrentGachaId])
      local Slot = UE4.UWidgetLayoutLibrary.SlotAsOverlaySlot(self.BGWidgetMap[self.CurrentGachaId])
      Slot:SetHorizontalAlignment(EHorizontalAlignment.HAlign_Fill)
      Slot:SetVerticalAlignment(EVerticalAlignment.VAlign_Fill)
    end
    self.BGWidgetMap[self.CurrentGachaId]:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    if self.LastBgWidget and self.LastBgWidget ~= self.BGWidgetMap[self.CurrentGachaId] then
      self.LastBgWidget:SetVisibility(ESlateVisibility.Collapsed)
    end
    self.LastBgWidget = self.BGWidgetMap[self.CurrentGachaId]
  end
end

function M:RefreshGachaTitle(GachaData)
  if not self.TitleWidgetMap[self.CurrentGachaId] then
    local TitleBPPath = GachaData.GachaNameBp
    local TitleUI = UIManager(self):CreateWidget(TitleBPPath, false)
    assert(TitleUI, "\230\138\189\229\141\161\230\160\135\233\162\152\232\181\132\230\186\144\228\184\141\229\173\152\229\156\168\239\188\154BTitleBPPath:" .. TitleBPPath .. " GachaId: " .. self.CurrentGachaId)
    self.TitleWidgetMap[self.CurrentGachaId] = TitleUI
    self.Group_TitleAnchor:AddChild(self.TitleWidgetMap[self.CurrentGachaId])
  end
  self.TitleWidgetMap[self.CurrentGachaId]:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  self.TitleWidgetMap[self.CurrentGachaId]:PlayAnimation(self.TitleWidgetMap[self.CurrentGachaId].In)
  if self.LastTitleWidget and self.LastTitleWidget ~= self.TitleWidgetMap[self.CurrentGachaId] then
    self.LastTitleWidget:SetVisibility(ESlateVisibility.Collapsed)
  end
  self.TitleWidgetMap[self.CurrentGachaId].Text_MainTitle:SetText(GText(GachaData.GachaName))
  self.LastTitleWidget = self.TitleWidgetMap[self.CurrentGachaId]
end

function M:RefreshGachaQualityTips(GachaData)
  local GachaRarity = GachaData.GachaCoreDesColor
  local GachaCoreDes = GachaData.GachaCoreDes
  self.Com_QualityTag:SetVisibility(ESlateVisibility.Collapsed)
  if GachaRarity then
    self.Com_QualityTag:Init(GachaRarity)
    self.Com_QualityTag:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  end
  if GachaCoreDes then
    self.Com_QualityTag:SetCustomizedTextTag(GText(GachaCoreDes))
  end
end

function M:RefreshRemainGachaTimes()
  local GachaInfo = DataMgr.SkinGacha[self.CurrentGachaId]
  if DataMgr.GachaProbability[GachaInfo.ProbabilityId].ShowGetStar5Times == nil or GachaInfo.GachaLimitIsShow then
    self.Text_RemainTimes:SetVisibility(UE4.ESlateVisibility.Collapsed)
  else
    self.Text_RemainTimes:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    local Avatar = GWorld:GetAvatar()
    if Avatar then
      local AdditionalCount = GachaModel:GetSkinGachaAlreadyTimes(GachaInfo.GachaType) or 0
      if AdditionalCount < DataMgr.GachaProbability[GachaInfo.ProbabilityId].ShowGetStar5Times then
        local RemainGachaTimes = math.floor(DataMgr.GachaProbability[GachaInfo.ProbabilityId].ShowGetStar5Times - AdditionalCount)
        local GuaranteeText = DataMgr.SkinGachaType[GachaInfo.GachaType].GachaGuaranteeDes
        if GachaInfo.RewardUpId then
          local ItemId, ItemType = GachaModel:GetSkinGachaUpInfo(self.CurrentGachaId)
          if ItemId then
            local Name = ItemUtils.GetItemName(ItemId, ItemType)
            self.Text_RemainTimes:SetText(string.format(GText(GuaranteeText), RemainGachaTimes, GText(Name)))
          end
        else
          self.Text_RemainTimes:SetText(string.format(GText(GuaranteeText), RemainGachaTimes))
        end
      end
    end
  end
end

function M:RefreshCumulativeDrawReward()
  if not next(self.GachaPoolDict) then
    return
  end
  local GachaLstData = self.GachaPoolDict[self.TabId]
  if not GachaLstData then
    return
  end
  local GachaData = DataMgr.SkinGacha[GachaLstData[1]]
  self.HB_Exchange:SetVisibility(ESlateVisibility.Collapsed)
  self.ExchangeBtn.RedDot:SetVisibility(ESlateVisibility.Collapsed)
  self.ExchangeBtn.bCanReceive = false
  self.ExchangeBtn.Btn_Click.OnClicked:Clear()
  self.ExchangeBtnCanClick = false
  if DataMgr.SkinGachaCumulative[GachaData.GachaId] then
    self.HB_Exchange:SetVisibility(ESlateVisibility.Visible)
    local RewardId, NeedCount, LastReward = GachaModel:GetSkinGachaCurrentCumulativeInfo(self.CurrentGachaId)
    if RewardId then
      self.ExchangeBtn.Btn_Click.OnClicked:Add(self, self.OpenCumulativeDrawReward)
      self.ExchangeBtnCanClick = true
      if NeedCount <= 0 then
        self.ExchangeBtn.bCanReceive = true
        self.ExchangeBtn.RedDot:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
        self.ExchangeBtn:PlayAnimation(self.ExchangeBtn.Reward)
        self.ExchangeBtn.Text_ExchangeDesc:SetText(GText("UI_SkinGacha_Cumulative_Get"))
      else
        self.ExchangeBtn:PlayAnimation(self.ExchangeBtn.Normal)
        self.ExchangeBtn.Text_ExchangeDesc:SetText(string.format(GText("UI_SkinGacha_Cumulative_Remain"), NeedCount))
      end
    else
      RewardId = LastReward
      self.ExchangeBtn:SetIsForbidden(true)
      self.ExchangeBtn.Text_ExchangeDesc:SetText(GText("UI_SkinGacha_Cumulative_Finish"))
    end
    local RewardData = DataMgr.Reward[RewardId]
    local Type = RewardData.Type[1]
    local Id = RewardData.Id[1]
    local Icon = ItemUtils.GetItemIcon(Id, Type)
    local Rarity = ItemUtils.GetItemRarity(Id, Type)
    local LightRarity = self.ExchangeBtn["Color_" .. Rarity]
    self.ExchangeBtn.Image_Light:SetColorAndOpacity(LightRarity)
    local GlowRarity, Niagara
    if 5 == Rarity then
      GlowRarity = self.ExchangeBtn.Yellow
      Niagara = LoadObject("NiagaraSystem'/Game/UI/WBP/Common/VX/GachaNew/NI_Gacha_ExchangeBtn_01.NI_Gacha_ExchangeBtn_01'")
    elseif 4 == Rarity then
      GlowRarity = self.ExchangeBtn.Purple
      Niagara = LoadObject("NiagaraSystem'/Game/UI/WBP/Common/VX/GachaNew/NI_Gacha_ExchangeBtn_02.NI_Gacha_ExchangeBtn_02'")
    elseif 3 == Rarity then
      GlowRarity = self.ExchangeBtn.Blue
      Niagara = LoadObject("NiagaraSystem'/Game/UI/WBP/Common/VX/GachaNew/NI_Gacha_ExchangeBtn_03.NI_Gacha_ExchangeBtn_03'")
    elseif 2 == Rarity then
      GlowRarity = self.ExchangeBtn.Green
    elseif 1 == Rarity then
      GlowRarity = self.ExchangeBtn.Grey
    end
    self.ExchangeBtn.VX_RewardGlow:SetColorAndOpacity(GlowRarity)
    if Niagara then
      self.ExchangeBtn.VX_Particle:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
      self.ExchangeBtn.VX_Particle:UpdateNiagaraSystemReference(Niagara)
      self.ExchangeBtn.VX_Particle:ActivateSystem(true)
    else
      self.ExchangeBtn.VX_Particle:SetVisibility(ESlateVisibility.Collapsed)
      self.ExchangeBtn.VX_Particle:DeactivateSystem()
    end
    assert(Icon, "\230\138\189\229\141\161\231\180\175\232\174\161\229\165\150\229\138\177\229\155\190\230\160\135\228\184\141\229\144\136\230\179\149, Id:" .. Id .. " Type:" .. Type)
    self.ExchangeBtn.Image_ExchangeIcon:SetBrushResourceObject(Icon)
  end
  GachaModel:CheckReddot()
  local GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(GWorld.GameInstance)
  self:OnUpdateUIStyleByInputTypeChange(GameInputModeSubsystem:GetCurrentInputType(), GameInputModeSubsystem:GetCurrentGamepadName())
end

function M:UpdateGachaTime(GachaEndTime)
  local CurrentTime = TimeUtils.NowTime()
  local RemainRefreshTime = GachaEndTime - CurrentTime
  if RemainRefreshTime <= 0 then
    self:RemoveTimer("RefreshGacha")
    self:InitGachaUI(self.TabId)
  end
  local RemainTimeStr = ShopUtils:GetRefreshTimeStr(RemainRefreshTime)
  self.Com_Time.Text_TimeDesc:SetText(RemainTimeStr)
end

function M:GetGachaAnime()
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
  self.GachaAnime.Parent = self
  return self.GachaAnime
end

function M:GetGachaResultSpecialShow(Data, RebateData)
  self.bGachaing = false
  self.bSpecialShow = true
  local ShowData = {}
  for _, v in pairs(Data) do
    local Type = GachaCommon.GachaItemTypeMap[v.Sign]
    if not ShowData[Type .. "s"] then
      ShowData[Type .. "s"] = {}
    end
    if not ShowData[Type .. "s"][v.ResultId] then
      ShowData[Type .. "s"][v.ResultId] = v.Count
    else
      ShowData[Type .. "s"][v.ResultId] = ShowData[Type .. "s"][v.ResultId] + v.Count
    end
  end
  UIUtils.ShowGetCharWeaponPage(ShowData, function()
    self.bSpecialShow = false
    self:GetGachaResultPage(Data, RebateData)
  end, self, true)
end

function M:GetGachaResultPage(Data, RebateData)
  if self.bNeedUpdate then
    return
  end
  self.bSpecialShow = false
  self.bGachaing = false
  self.bGachaRes = true
  self.GetItemPage = nil
  local Type, Id = self:GetShowSkin(Data)
  if Type then
    if not self.GachaGetItemPageSP then
      self.GachaGetItemPageSP = self:CreateWidgetNew("GachaGetItemPageSP")
      self.LoadUIAnchor:AddChild(self.GachaGetItemPageSP)
      local CanvasSlot = UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(self.GachaGetItemPageSP)
      local Anchors = FAnchors()
      Anchors.Minimum = FVector2D(0, 0)
      Anchors.Maximum = FVector2D(1, 1)
      CanvasSlot:SetAnchors(Anchors)
      CanvasSlot:SetOffsets(FMargin(0, 0, 0, 0))
      self.GachaGetItemPageSP:SetVisibility(UIConst.VisibilityOp.Collapsed)
      CanvasSlot:SetZOrder(5)
    end
    self.GachaGetItemPageSP:Init(Data, RebateData, self.CurrentGachaId, Type, Id, self, function()
      self.bGachaRes = false
      if not self.bGachaing and not self.bGachaRes and not self.bSpecialShow then
        self:SetAnimationCurrentTime(self.Gacha, self.Gacha:GetEndTime())
        self:PlayAnimationReverse(self.Gacha)
        self.List_Pool:SetFocus()
        self:RefreshGachaInfo(self.TabId)
        self.bInGachaMain = true
      end
    end)
    self.GetItemPage = self.GachaGetItemPageSP
  else
    if not self.GachaGetItemPage then
      self.GachaGetItemPage = self:CreateWidgetNew("GachaGetItemPage")
      self.LoadUIAnchor:AddChild(self.GachaGetItemPage)
      local CanvasSlot = UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(self.GachaGetItemPage)
      local Anchors = FAnchors()
      Anchors.Minimum = FVector2D(0, 0)
      Anchors.Maximum = FVector2D(1, 1)
      CanvasSlot:SetAnchors(Anchors)
      CanvasSlot:SetOffsets(FMargin(0, 0, 0, 0))
      self.GachaGetItemPage:SetVisibility(UIConst.VisibilityOp.Collapsed)
      CanvasSlot:SetZOrder(5)
    end
    self.GachaGetItemPage:Init(Data, RebateData, self.CurrentGachaId, nil, nil, self, function()
      self.bGachaRes = false
      if not self.bGachaing and not self.bGachaRes and not self.bSpecialShow then
        self:SetAnimationCurrentTime(self.Gacha, self.Gacha:GetEndTime())
        self:PlayAnimationReverse(self.Gacha)
        self.List_Pool:SetFocus()
        self:RefreshGachaInfo(self.TabId)
        self.bInGachaMain = true
      end
    end)
    self.GetItemPage = self.GachaGetItemPage
  end
end

function M:GetShowSkin(Data)
  local GachaInfo = DataMgr.SkinGacha[self.CurrentGachaId]
  local UpItemId, UpItemType = GachaModel:GetSkinGachaUpInfo(self.CurrentGachaId)
  local MaxRarity = -1
  local ResType, ResId
  for _, RewardData in ipairs(Data) do
    local Type = GachaCommon.GachaItemTypeMap[RewardData.Sign]
    local Id = RewardData.ResultId
    if DataMgr.GachaRewardType[Type] and DataMgr.GachaRewardType[Type].HighlightDisplay or Type == UpItemType and Id == UpItemId then
      local ItemData = DataMgr[Type][Id]
      local Rarity = ItemData.Rarity or ItemData[Type .. "Rarity"]
      if MaxRarity < Rarity then
        MaxRarity = Rarity
        ResType = Type
        ResId = Id
      end
    end
  end
  return ResType, ResId
end

function M:CheckShopLockState()
  local UIUnlockRuleId = "Shop"
  self.ShopIsUnlock = false
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    self.ShopIsUnlock = Avatar:CheckUIUnlocked(UIUnlockRuleId)
  end
  if self.ShopIsUnlock then
    self.Group_ShopExchange:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  else
    self.Group_ShopExchange:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
end

function M:PurchaseGachaResource(IsSingleGacha, bFromGachaRes)
  local GachaInfo = DataMgr.SkinGacha[self.CurrentGachaId]
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
                self.CantClick = false
                self:RefreshGachaResInfo()
                if IsSingleGacha then
                  self:OnClickBtnGachaOnce()
                else
                  self:OnClickBtnGachaTentimes()
                end
                if bFromGachaRes and self.GetItemPage then
                  self.GetItemPage:PlayOutAnim()
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
          self:PopupUIGamepadSetting()
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
      
      local PopupId
      if CoinId == CommonConst.Coins.Coin1 then
        PopupId = 100137
      elseif CoinId == CommonConst.Coins.Coin4 then
        PopupId = 100263
      end
      if not PopupId then
        return
      end
      local Params = {}
      Params.LeftCallbackObj = self
      Params.RightCallbackObj = self
      Params.RightCallbackFunction = JumpToShop
      self.PopupUI = UIManager(self):ShowCommonPopupUI(PopupId, Params, self)
    else
      local function Confirm()
        self.CantClick = true
        
        self.IsPurchaseForGacha = true
        Avatar:PurchaseShopItem(ShopItemId, math.ceil(ResourceNeedPurchaseCount / ShopData.TypeNum), true, function()
          self:RefreshGachaResInfo()
          self.CantClick = false
          if IsSingleGacha then
            self:OnClickBtnGachaOnce()
          else
            self:OnClickBtnGachaTentimes()
          end
          if bFromGachaRes and self.GetItemPage then
            self.GetItemPage:PlayOutAnim()
          end
        end)
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
      self.PopupUI = UIManager(self):ShowCommonPopupUI(PopUpId, Params)
      self:PopupUIGamepadSetting()
    end
  end
end

function M:PopupUIGamepadSetting()
  self.PopupUI.OpenTipsButtonIndex = self.PopupUI:InitGamepadShortcut({
    KeyInfoList = {
      {
        Type = "Img",
        ImgShortPath = UIConst.GamePadImgKey.LeftThumb
      }
    },
    Desc = GText("UI_Controller_CheckDetails")
  })
  self.PopupUI.ConfirmButtonIndex = self.PopupUI:InitGamepadShortcut({
    KeyInfoList = {
      {
        Type = "Img",
        ImgShortPath = UIConst.GamePadImgKey.FaceButtonBottom
      }
    },
    Desc = GText("UI_Tips_Ensure")
  })
  self.PopupUI.CancelButtonIndex = self.PopupUI:InitGamepadShortcut({
    KeyInfoList = {
      {
        Type = "Img",
        ImgShortPath = UIConst.GamePadImgKey.FaceButtonRight
      }
    },
    Desc = GText("UI_BACK")
  })
  self.PopupUI:HideGamepadShortcut(self.PopupUI.ConfirmButtonIndex)
  self.PopupUI:HideGamepadShortcut(self.PopupUI.CancelButtonIndex)
  local ItemWidget = self.PopupUI:GetContentWidgetByName("ItemSubsize")
  if ItemWidget then
    ItemWidget.OnContentKeyDown = self.OnContentKeyDown
    local Item = ItemWidget.Item:GetChildAt(0)
    Item:BindEventOnMenuOpenChanged(self, self.ItemMenuAnchorChanged)
  end
end

function M:ItemMenuAnchorChanged(bIsOpen)
  if UIUtils.UtilsGetCurrentInputType() ~= ECommonInputType.Gamepad then
    return
  end
  if self.PopupUI then
    if bIsOpen then
      self.PopupUI:HideGamepadShortcut(self.PopupUI.CancelButtonIndex)
      self.PopupUI:HideGamepadShortcut(self.PopupUI.ConfirmButtonIndex)
    else
      self.PopupUI:ShowGamepadShortcut(self.PopupUI.CancelButtonIndex)
      self.PopupUI:ShowGamepadShortcut(self.PopupUI.ConfirmButtonIndex)
    end
  end
end

function M:OnContentKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local IsEventHandled = false
  local Item = self.Item:GetChildAt(0)
  if InKeyName == UIConst.GamePadKey.LeftThumb then
    if Item then
      Item:SetFocus()
      self.Owner.ButtonBar:SetGamepadBtnKeyVisibility(false)
      self.Owner:ShowGamepadShortcut(self.Owner.ConfirmButtonIndex)
      self.Owner:ShowGamepadShortcut(self.Owner.CancelButtonIndex)
      self.Owner:HideGamepadShortcut(self.Owner.OpenTipsButtonIndex)
      IsEventHandled = true
    end
  elseif InKeyName == UIConst.GamePadKey.FaceButtonRight and Item:HasAnyFocus() then
    self.Owner.ButtonBar:SetGamepadBtnKeyVisibility(true)
    self.Owner:HideGamepadShortcut(self.Owner.ConfirmButtonIndex)
    self.Owner:HideGamepadShortcut(self.Owner.CancelButtonIndex)
    self.Owner:ShowGamepadShortcut(self.Owner.OpenTipsButtonIndex)
    self.Owner:SetFocus()
    IsEventHandled = true
  end
  return IsEventHandled
end

function M:OnDrawGacha(Ret, Data, RebateData)
  if Ret == ErrorCode.RET_SUCCESS then
    AudioManager(self):PlayUISound(self, "event:/ui/common/gacha_amb", "GachaAmb", nil)
    if self.bInGachaMain then
      self.bInGachaMain = false
      self:AddTimer(0.3, function(self)
        self.VideoPlayer:Stop()
        if self.CurrentBgMusic then
          AudioManager(self):StopSound(self, self.CurrentBgMusic)
        end
      end, false)
      self:SetAnimationCurrentTime(self.Gacha, 0)
      self:PlayAnimation(self.Gacha)
      self.PendingGachaData = Data
      self.PendingRebateData = RebateData
    else
      local GachaAnimeUI = self:GetGachaAnime()
      GachaAnimeUI:Init(Data, RebateData)
    end
    self.GachaRecordsCache = nil
    self:RefreshGuaranteedDict()
  elseif DataMgr.ErrorCode[Ret] then
    UIManager(self):ShowError(Ret, nil, UIConst.Tip_CommonToast)
  else
    local ErrorText = "Unknown_Error"
    UIManager(self):ShowUITip("CommonToastMain", GText(ErrorText), 1.5)
  end
end

function M:OnGetCumulativeDrawReward(Ret, Reward)
  if Ret == ErrorCode.RET_SUCCESS then
    UIUtils.ShowGetItemPageAndOpenBagIfNeeded(nil, nil, nil, Reward)
    self:RefreshGachaCostInfo()
  else
    UIManager(self):ShowError(Ret, 1.0, "CommonToastMain")
  end
  self:RefreshCumulativeDrawReward()
end

function M:OnGachaPoolUpdate()
  self:BlockAllUIInput(false)
  self.bNeedUpdate = true
  local CommonDialogParams = {}
  
  function CommonDialogParams.RightCallbackFunction()
    self.VideoPlayer:Stop()
    if self.CurrentBgMusic then
      AudioManager(self):StopSound(self, self.CurrentBgMusic)
    end
    self.VideoPlayer:Close()
    self:Close()
  end
  
  UIManager(self):ShowCommonPopupUI(100032, CommonDialogParams)
end

function M:OnClickBtnGachaOnce()
  if self.bCanNotClick then
    return
  end
  if self.bGachaing or self.CantClick then
    return
  end
  self:CloseMenuAnchor()
  local Ret = GachaController:TryGacha(self.CurrentGachaId, true)
  if 1 == Ret then
    self:PurchaseGachaResource(true)
  end
  if 0 == Ret then
    self.bGachaing = true
  end
end

function M:OnClickBtnGachaTentimes()
  if self.bCanNotClick then
    return
  end
  if self.bGachaing or self.CantClick then
    return
  end
  self:CloseMenuAnchor()
  local Ret = GachaController:TryGacha(self.CurrentGachaId, false)
  if 1 == Ret then
    self:PurchaseGachaResource(false)
  end
  if 0 == Ret then
    self.bGachaing = true
  end
end

function M:OnClickBtnShop()
  if self.bCanNotClick or self.bGachaing then
    return
  end
  self:CloseMenuAnchor()
  self.bCanNotClick = true
  local ShopSubTabId = DataMgr.SkinGachaType[DataMgr.SkinGacha[self.CurrentGachaId].GachaType].SubTabId
  local ShopMainTabId = DataMgr.ShopTabSub[ShopSubTabId].MainTabId
  local ShopType = DataMgr.ShopMainTab2ShopType[ShopMainTabId]
  AudioManager(self):PlayUISound(self, "event:/ui/activity/shop_small_btn_click", nil, nil)
  PageJumpUtils:JumpToShopPage(ShopMainTabId, ShopSubTabId, nil, ShopType)
end

function M:OnClickBtnDetails()
  if self.bCanNotClick or self.bGachaing or self.CantClick then
    return
  end
  self:CloseMenuAnchor()
  self.bCanNotClick = true
  local Params = {}
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
  Params.Parent = self
  
  local function DialogCallback()
    self.bCanNotClick = false
    local GameInputModeSubsystem = UIManager(self):GetGameInputModeSubsystem(self)
    GameInputModeSubsystem:SetNavigateWidgetOpacity(1)
  end
  
  Params.UseCachedWidget = {
    [1] = self:GetGachaDetailsUI()
  }
  Params.OnCloseCallbackObj = self
  Params.OnCloseCallbackFunction = DialogCallback
  Params.CurrentGachaId = self.CurrentGachaId
  self.DetailPopupUI = UIManager(self):ShowCommonPopupUI(100243, Params, self)
end

function M:GetGachaDetailsUI()
  if self.GachaDetailsUI and self.GachaDetailsUI:IsValid() then
    return self.GachaDetailsUI
  end
  self.GachaDetailsUI = self:CreateWidgetNew("GachaDetails")
  return self.GachaDetailsUI
end

function M:OnClickBtnHistory()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  if self.bCanNotClick or self.bGachaing then
    return
  end
  self:CloseMenuAnchor()
  self.bCanNotClick = true
  
  local function OpenRecordDialogue(Records, GuaranteedDict)
    self.bWaitingGachaRecord = false
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
    Params.CurrentGachaId = self.CurrentGachaId
    Params.OnCloseCallbackObj = self
    
    function Params.OnCloseCallbackFunction()
      self.bCanNotClick = false
    end
    
    self.DetailPopupUI = UIManager(self):ShowCommonPopupUI(100242, Params, self)
  end
  
  if self.GachaRecordsCache and self.GuaranteedDict then
    OpenRecordDialogue(self.GachaRecordsCache, self.GuaranteedDict)
  else
    if self.bWaitingGachaRecord then
      return
    end
    self.bWaitingGachaRecord = true
    Avatar:OpenGachaRecord(OpenRecordDialogue)
  end
end

function M:RefreshGuaranteedDict()
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    local function OpenRecordDialogue(Records, GuaranteedDict)
      self.GachaRecordsCache = Records
      
      self.GuaranteedDict = GuaranteedDict
      local GachaInfo = DataMgr.SkinGacha[self.CurrentGachaId]
      local ProbabilityId = GachaInfo.ProbabilityId
      local ProbabilityInfo = DataMgr.GachaProbability[ProbabilityId]
      local GachaType = GachaInfo.GachaType
      if ProbabilityInfo and ProbabilityInfo.ShowGetStar5Times then
        local AlreadyGachaTimes = 0
        if self.GuaranteedDict and self.GuaranteedDict[GachaType] then
          AlreadyGachaTimes = self.GuaranteedDict[GachaType]
        end
      end
    end
    
    if self.GachaRecordsCache and self.GuaranteedDict then
      OpenRecordDialogue(self.GachaRecordsCache, self.GuaranteedDict)
    else
      Avatar:OpenGachaRecord(OpenRecordDialogue)
    end
  end
end

function M:HandleRecords(Records)
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

function M:GetHistoryTab()
  local NowTime = TimeUtils.NowTime()
  local HistoryTab = {}
  local DialogueTab = {}
  local TabMapGacha = {}
  local TabIndex = 1
  for key, value in pairs(DataMgr.SkinGacha) do
    if NowTime >= value.GachaStartTime and NowTime < value.GachaEndTime then
      if 2 == value.GachaHistoryType and self.CurrentGachaId ~= key then
        table.insert(HistoryTab, {
          GachaId = key,
          GachaType = DataMgr.SkinGachaType[value.GachaType].GachaTypeName
        })
      end
      if self.CurrentGachaId == key then
        DialogueTab[TabIndex] = {
          Text = GText(DataMgr.SkinGachaType[value.GachaType].GachaTypeName),
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

function M:OpenCumulativeDrawReward()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  if self.bCanNotClick or self.bGachaing then
    return
  end
  self:CloseMenuAnchor()
  self.bCanNotClick = true
  local GachaInfo = GachaModel:GetGachaAvatarInfo(self.CurrentGachaId)
  local RewardLstData = GachaModel:GetSkinGachaCumulativeInfo(self.CurrentGachaId)
  local Params = {}
  local CumulativeRewardMaxNum = RewardLstData[#RewardLstData] and RewardLstData[#RewardLstData].RewardTarget or 0
  local ConfigData = {
    Items = {},
    Text_Total = "UI_SkinGacha_Cumulative_Progress",
    ReceiveAllCallBack = function(RewardItem, Content)
      Avatar:GetGachaCumulativeReward(function(Ret, Reward)
        local RewardId, NeedCount = GachaModel:GetSkinGachaCurrentCumulativeInfo(self.CurrentGachaId)
        for i = 0, Content.SelfWidget.List_Item:GetNumItems() - 1 do
          local Item = Content.SelfWidget.List_Item:GetItemAt(i)
          Item.ConfigData.CanReceive = GachaInfo.DrawCounts >= Item.ConfigData.RewardData.RewardTarget and not GachaInfo.CumulativeRewardGot:HasElement(i + 1)
          Item.ConfigData.RewardsGot = Avatar.SkinGachaPool[self.CurrentGachaId].CumulativeRewardGot:HasElement(i + 1)
          if Item.SelfWidget then
            Item.SelfWidget:RefreshBtn(Item.ConfigData.RewardsGot)
          end
        end
        Content.SelfWidget:RefreshButton(RewardId and NeedCount <= 0)
        self:OnGetCumulativeDrawReward(Ret, Reward)
      end, self.CurrentGachaId, -1)
    end,
    ReceiveAllParam = {},
    SortType = 2,
    Rewards = {},
    NowNum = CumulativeRewardMaxNum < GachaInfo.DrawCounts and CumulativeRewardMaxNum or GachaInfo.DrawCounts,
    NumMax = RewardLstData[#RewardLstData] and RewardLstData[#RewardLstData].RewardTarget or 0,
    ReceiveButtonText = "UI_Event_MidTerm_GetAll"
  }
  local Item
  for i, RewardData in ipairs(RewardLstData) do
    Item = {
      Text = string.format(GText("UI_SkinGacha_Cumulative_Goal"), RewardData.RewardTarget),
      ItemId = i,
      CanReceive = GachaInfo.DrawCounts >= RewardData.RewardTarget and not GachaInfo.CumulativeRewardGot:HasElement(i),
      RewardsGot = Avatar.SkinGachaPool[self.CurrentGachaId].CumulativeRewardGot:HasElement(i),
      InProgress = false,
      Rewards = {},
      Nums = 1,
      NotreachText = "UI_SkinGacha_Cumulative_Wait",
      Hint = string.format(GText("UI_SkinGacha_Cumulative_Goal"), RewardData.RewardTarget),
      LeftAligned = true,
      ReceiveButtonText = "UI_Event_MidTerm_GetPrize",
      ReceiveCallBack = function(RewardItem, Content)
        Avatar:GetGachaCumulativeReward(function(Ret, Reward)
          local RewardId, NeedCount = GachaModel:GetSkinGachaCurrentCumulativeInfo(self.CurrentGachaId)
          Content.ConfigData.CanReceive = GachaInfo.DrawCounts >= RewardData.RewardTarget and not GachaInfo.CumulativeRewardGot:HasElement(i)
          Content.ConfigData.RewardsGot = Avatar.SkinGachaPool[self.CurrentGachaId].CumulativeRewardGot:HasElement(i)
          Content.SelfWidget:RefreshBtn(0 == Ret)
          Content.Owner:RefreshButton(RewardId and NeedCount <= 0)
          self:OnGetCumulativeDrawReward(Ret, Reward)
        end, self.CurrentGachaId, i)
      end,
      ReceiveParm = {},
      RewardData = RewardData
    }
    local Rewards = {}
    local RewardIfno = DataMgr.Reward[RewardData.RewardId]
    if RewardIfno then
      local Ids = RewardIfno.Id or {}
      local RewardCount = RewardIfno.Count or {}
      local TableName = RewardIfno.Type or {}
      for i = 1, #Ids do
        local ItemId = Ids[i]
        local Count = RewardUtils:GetCount(RewardCount[i])
        local Rarity = ItemUtils.GetItemRarity(ItemId, TableName[i])
        local ItemType = TableName[i]
        local RewardContent = {
          ItemType = ItemType,
          ItemId = ItemId,
          Count = Count,
          Rarity = Rarity
        }
        table.insert(Rewards, RewardContent)
      end
    end
    Item.Rewards = Rewards
    table.insert(ConfigData.Items, Item)
  end
  Params.ConfigData = ConfigData
  Params.Title = GText("UI_SkinGacha_Cumulative_Title")
  Params.OnCloseCallbackObj = self
  
  function Params.OnCloseCallbackFunction()
    self.bCanNotClick = false
  end
  
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_large_crystal", nil, nil)
  self.DetailPopupUI = UIManager(self):ShowCommonPopupUI(100158, Params, self)
end

function M:TakeGachaScreenShot(Widget, OnHideCallback)
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

function M:GetScreenShotWidget()
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

function M:CheckBubbleShow()
  if not self.ShopIsUnlock or not self.bAlreadyIn then
    return
  end
  self:CloseMenuAnchor()
  local GachaInfo = DataMgr.SkinGacha[self.CurrentGachaId]
  if not GachaInfo.BubbleShowGoods then
    return
  end
  local sourceData = DataMgr.ShopItem[GachaInfo.BubbleShowGoods]
  if not sourceData then
    return
  end
  local ShopItemData = setmetatable({}, {__index = sourceData})
  local CanPurchase = ShopUtils:CanPurchase(ShopItemData, ShopItemData.PriceType, ShopUtils:GetShopItemPrice(ShopItemData.ItemId))
  if 1 == ShopItemData.PurchaseFailRes then
    return
  end
  local DataKey = Utils.GDate_YMD_Timestamp(TimeUtils.NowTime())
  local BubbleShowCache = EMCache:Get(DataKey, true)
  if nil == BubbleShowCache or BubbleShowCache[self.CurrentGachaId] == nil then
    local ItemName = ItemUtils:GetDropName(ShopItemData.TypeId, ShopItemData.ItemType)
    local Text = string.format(GText("UI_SkinGacha_Shop_Bubble"), ItemName)
    self:OpenMenuAnchor(Text)
    if nil == BubbleShowCache then
      BubbleShowCache = {}
    end
    BubbleShowCache[self.CurrentGachaId] = 1
    EMCache:Set(DataKey, BubbleShowCache, true)
  end
end

function M:OpenMenuAnchor(Text)
  if self.Tips_MenuAnchor:IsOpen() then
    return
  end
  self.Tips_MenuAnchor:Open(false)
  if self.TipsDetail then
    self.TipsDetail:Init({
      Text = Text,
      OnCloseEvent = {
        Obj = self,
        Callback = self.CloseMenuAnchor
      }
    })
    self.TipsDetail:Open()
  end
end

function M:CloseMenuAnchor()
  if not self.Tips_MenuAnchor:IsOpen() then
    return
  end
  self.Tips_MenuAnchor:Close()
end

function M:AddTabReddotListen()
  for TabId, Data in pairs(DataMgr.SkinGachaTab) do
    local ReddotName = DataMgr.SkinGachaTab[TabId].ReddotNode
    if ReddotName then
      ReddotManager.AddListenerEx(ReddotName, self, function(self, Count, RdType, RdName)
        if Count > 0 then
          if RdType == EReddotType.Normal then
            self:ShowTabRedDotByTabId(TabId, true)
          elseif RdType == EReddotType.New then
            self:ShowTabRedDotByTabId(TabId, true)
          end
        else
          self:ShowTabRedDotByTabId(TabId, false)
        end
      end)
    end
  end
end

function M:RemoveTabReddotListen()
  for TabId, Data in pairs(DataMgr.SkinGachaTab) do
    local ReddotName = DataMgr.SkinGachaTab[TabId].ReddotNode
    if ReddotName then
      ReddotManager.RemoveListener(ReddotName, self)
    end
  end
end

function M:ShowTabRedDotByTabId(TabId, bShow)
  if self.PoolItemMap[TabId] and self.PoolItemMap[TabId].SelfWidget then
    self.PoolItemMap[TabId].SelfWidget:SetReddot(bShow)
  end
end

function M:OnAnimationFinished(InAnim)
  if InAnim == self.In then
    self:BlockAllUIInput(false)
    self.bAlreadyIn = true
    self:CheckBubbleShow()
  elseif InAnim == self.Out then
    self:BlockAllUIInput(false)
    self:Close()
  elseif InAnim == self.Change then
    self:CheckBubbleShow()
    self:BlockAllUIInput(false)
  elseif InAnim == self.Gacha then
    if self.PendingGachaData == nil or nil == self.PendingRebateData then
      return
    end
    local GachaAnimeUI = self:GetGachaAnime()
    GachaAnimeUI:Init(self.PendingGachaData, self.PendingRebateData)
    self.PendingGachaData = nil
    self.PendingRebateData = nil
  end
end

function M:Close()
  if self.GachaGetItemPage then
    self.GachaGetItemPage:RemoveFromParent()
  end
  self.Group_TitleAnchor:ClearChildren()
  self.LoadUIAnchor:ClearChildren()
  self.PoolStaticBG:ClearChildren()
  self:RemoveTabReddotListen()
  if self.IsUnLoadNavMesh then
    local GameInstance = GWorld.GameInstance
    local Player = UE4.UGameplayStatics.GetPlayerCharacter(GameInstance, 0)
    DebugPrint("---\229\134\176\230\185\150\229\159\142\229\133\179\233\151\173\230\138\189\229\141\161\230\129\162\229\164\141\229\175\188\232\136\170\231\189\145\230\160\188---")
    URuntimeCommonFunctionLibrary.LoadNavMeshLevel(Player:GetWorld())
  end
  self.Super.Close(self)
end

function M:CloseSelf()
  if not self.bGachaing and not self.CantClick and not self.bGachaRes and not self.bSpecialShow and not self.bWaitingGachaRecord then
    self.VideoPlayer:Stop()
    if self.CurrentBgMusic then
      AudioManager(self):StopSound(self, self.CurrentBgMusic)
    end
    self.VideoPlayer:Close()
    self:BlockAllUIInput(true)
    if self.IsAddInDeque then
      self:PlayAnimationForward(self.Out, UIConst.AnimOutSpeedWithPageJump.LittleFastSpeed)
    else
      self:PlayAnimation(self.Out)
    end
    AudioManager(self):SetEventSoundParam(self, "GachaMainIn", {ToEnd = 1})
  end
end

function M:OnKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local IsEventHandled = false
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) then
    IsEventHandled = self:OnGamePadDown(InKeyName)
  elseif ("Escape" == InKeyName or InKeyName == self.OpenKey) and not self.bGachaing and not self.CantClick and not self.bGachaRes and not self.bSpecialShow and not self.bWaitingGachaRecord then
    IsEventHandled = true
    self:CloseSelf()
  end
  if IsEventHandled then
    return UE4.UWidgetBlueprintLibrary.Handled()
  else
    return UE4.UWidgetBlueprintLibrary.UnHandled()
  end
end

function M:OnUpdateUIStyleByInputTypeChange(CurInputType, CurGamepadName)
  self.Super.OnUpdateUIStyleByInputTypeChange(self, CurInputType, CurGamepadName)
  if CurInputType == ECommonInputType.Gamepad then
    if self.ExchangeBtnCanClick then
      self.Key_Exchange:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    end
    self:SetFocus_Lua()
  else
    self.Key_Exchange:SetVisibility(ESlateVisibility.Collapsed)
  end
end

function M:SetFocus_Lua()
  if self.bGachaing then
    self.GachaAnime:SetFocus()
    return
  end
  if self.bGachaRes then
    self.GetItemPage:SetPageFocus()
    return
  end
  if self:HasAnyFocus() then
    self.List_Pool:SetFocus()
  end
end

function M:OnGamePadSelect(ItemContent, bHover)
  if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad and bHover then
    ItemContent.SelfWidget:OnItemClick()
  end
end

function M:OnGamePadDown(InKeyName)
  if self.bGachaing then
    if InKeyName == UIConst.GamePadKey.FaceButtonBottom then
      self.GachaAnime:OnParentKeyDown()
    end
    return true
  end
  if self.bGachaRes then
    if self.GetItemPage then
      self.GetItemPage.Parent = self
      self.GetItemPage:OnGamePadDown(InKeyName)
    end
    return true
  end
  if self.bSpecialShow then
    return false
  end
  local IsEventHandled = false
  if InKeyName == UIConst.GamePadKey.SpecialRight then
    self:OnClickBtnDetails()
  elseif InKeyName == UIConst.GamePadKey.SpecialLeft then
    self:OnClickBtnHistory()
  elseif InKeyName == UIConst.GamePadKey.FaceButtonLeft then
    if self.Group_Once:IsVisible() then
      self:OnClickBtnGachaOnce()
    end
  elseif InKeyName == UIConst.GamePadKey.FaceButtonTop then
    self:OnClickBtnGachaTentimes()
  elseif InKeyName == UIConst.GamePadKey.DPadLeft then
    self:OnClickBtnShop()
  elseif InKeyName == UIConst.GamePadKey.LeftThumb then
    if self.ExchangeBtnCanClick then
      self:OpenCumulativeDrawReward()
    end
  else
    IsEventHandled = self.Com_Tab:Handle_KeyEventOnGamePad(InKeyName)
  end
  return IsEventHandled
end

return M
