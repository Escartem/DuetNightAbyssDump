require("UnLua")
local GachaCommon = require("BluePrints.UI.WBP.Gacha.GachaCommon")
local GachaController = require("BluePrints.UI.WBP.Gacha.GachaController")
local GachaModel = require("BluePrints.UI.WBP.Gacha.GachaModel")
local M = Class({
  "BluePrints.UI.BP_UIState_C"
})

function M:Construct()
  self:AddInputMethodChangedListen()
  self.Btn_Back:SetText(GText("UI_BACK"))
  self.Btn_Back:SetDefaultGamePadImg(DataMgr.KeyboardText[UIConst.GamePadKey.FaceButtonRight].KeyText)
  self.Btn_Back:BindEventOnClicked(self, self.PlayOutAnim)
  
  function self.Btn_Back.SoundFunc()
    AudioManager(self):PlayUISound(self, "event:/ui/common/click", nil, nil)
  end
  
  self.Btn_Back:SetDefaultGamePadImg(UIConst.GamePadImgKey.FaceButtonRight)
  self.Btn_Again:SetDefaultGamePadImg(UIConst.GamePadImgKey.FaceButtonTop)
  self.Btn_Again:SetGamePadIconVisible(true)
  self.Btn_Again:BindEventOnClicked(self, self.OnClickGachaAgain)
  
  function self.Btn_Again.SoundFunc()
    AudioManager(self):PlayUISound(self, "event:/ui/common/gacha_btn_click_normal", nil, nil)
  end
  
  self.Btn_Again:SetGamePadImg(UIConst.GamePadImgKey.FaceButtonTop)
  self.Btn_Share:BindEventOnClicked(self, self.OnBtnShareClicked)
  
  function self.Btn_Share.SoundFunc()
    AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_small", nil, nil)
  end
  
  self.Text_ExtrasTitle:SetText(GText("GACHA_BONUS"))
  self.Key_GamePad03:CreateGamepadKey(DataMgr.KeyboardText[UIConst.GamePadKey.SpecialRight].KeyText)
  self.KeyImg_GamePad:CreateGamepadKey(DataMgr.KeyboardText[UIConst.GamePadKey.RightThumb].KeyText)
  self.Key_GamePad02:CreateCommonKey({
    KeyInfoList = {
      {
        ImgShortPath = UIConst.GamePadImgKey.LeftThumb,
        Type = "Img"
      }
    },
    Desc = GText("UI_Controller_Check")
  })
end

function M:Init(...)
  self.RewardLst, self.RebateData, self.GachaId, self.ShowSkinType, self.ShowSkinId, self.Parent, self.OnClosedFun = ...
  self.Parent.CantClick = false
  self.CantClick = false
  self.bSharePage = false
  self.RewardMap = {}
  for i, RewardData in ipairs(self.RewardLst) do
    if not self.RewardMap[GachaCommon.GachaItemTypeMap[RewardData.Sign]] then
      self.RewardMap[GachaCommon.GachaItemTypeMap[RewardData.Sign]] = {}
    end
    if self.RewardMap[GachaCommon.GachaItemTypeMap[RewardData.Sign]][RewardData.ResultId] then
      self.RewardMap[GachaCommon.GachaItemTypeMap[RewardData.Sign]][RewardData.ResultId] = self.RewardMap[GachaCommon.GachaItemTypeMap[RewardData.Sign]][RewardData.ResultId] + RewardData.Count
    else
      self.RewardMap[GachaCommon.GachaItemTypeMap[RewardData.Sign]][RewardData.ResultId] = RewardData.Count
    end
    RewardData.Index = i
  end
  table.sort(self.RewardLst, function(a, b)
    local TypeA = GachaCommon.GachaItemTypeMap[a.Sign]
    local TypeB = GachaCommon.GachaItemTypeMap[b.Sign]
    local DataA = DataMgr[TypeA][a.ResultId]
    local DataB = DataMgr[TypeB][b.ResultId]
    local RarityA = DataA.Rarity or DataA[TypeA .. "Rarity"] or 0
    local RarityB = DataB.Rarity or DataB[TypeB .. "Rarity"] or 0
    if RarityA == RarityB then
      return a.Index < b.Index
    end
    return RarityA > RarityB
  end)
  self.bSingle = #self.RewardLst == GachaCommon.GachaOneResult
  self:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  self:SetIsDealWithVirtualAccept(false)
  self:BlockAllUIInput(true)
  AudioManager(self):PlayUISound(self, "event:/ui/common/gacha_result_show", nil, nil)
  self:PlayAnimation(self.In)
  local GameInputModeSubsystem = UIManager(self):GetGameInputModeSubsystem(self)
  GameInputModeSubsystem:SetNavigateWidgetOpacity(0)
  self:InitRewardList()
  self:RefreshResourceBar()
  self.Group_Share:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  self:RefreshGachaResInfo()
  local GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(GWorld.GameInstance)
  self:OnUpdateUIStyleByInputTypeChange(GameInputModeSubsystem:GetCurrentInputType(), GameInputModeSubsystem:GetCurrentGamepadName())
end

function M:InitRewardList()
  self:CleanTimer()
  self.HasExtraReward = false
  if not next(self.RebateData) then
    self.HB_Extras:SetVisibility(ESlateVisibility.Collapsed)
  else
    self.HasExtraReward = true
    self.HB_Item1:SetVisibility(ESlateVisibility.Collapsed)
    self.HB_Item2:SetVisibility(ESlateVisibility.Collapsed)
    self.HB_Extras:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    local index = 1
    for ItemId, Num in pairs(self.RebateData) do
      if index > 2 then
        break
      end
      self["Item" .. index]:Init({
        Id = ItemId,
        Icon = LoadObject(DataMgr.Resource[ItemId].Icon),
        ItemType = "Resource",
        UIName = "GahcaMain",
        IsShowDetails = true,
        MenuPlacement = EMenuPlacement.MenuPlacement_MenuRight
      })
      self["Text_ItemNum" .. index]:SetText("\195\151" .. Num)
      self["HB_Item" .. index]:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
      index = index + 1
    end
  end
  if self.RewardLst then
    if self.bSingle then
      self.Single_Item:SetVisibility(ESlateVisibility.Visible)
      self.WS_Item:SetActiveWidgetIndex(1)
      local Data = self.RewardLst[1]
      local ItemType = GachaCommon.GachaItemTypeMap[Data.Sign]
      local ItemData = DataMgr[ItemType][Data.ResultId]
      local bNew, bConvert = self:IsNewOrConvertItem(ItemType, Data.ResultId, Data.Count)
      assert(ItemData, "\230\156\170\230\137\190\229\136\176\232\175\165\230\172\161\230\138\189\229\141\161\229\165\150\229\138\177\231\154\132\228\191\161\230\129\175:Id:" .. Data.ResultId .. " Type:" .. ItemType)
      local Content = NewObject(UIUtils.GetCommonItemContentClass())
      Content.Id = Data.ResultId
      Content.Icon = ItemUtils.GetItemIconPath(Data.ResultId, ItemType)
      Content.Count = Data.Count
      Content.Start = Data.Star
      Content.ParentWidget = self
      Content.ItemType = ItemType
      Content.Rarity = ItemData.Rarity or ItemData[ItemType .. "Rarity"] or 1
      Content.bNew = bNew
      Content.bDisableCommonClick = bConvert
      Content.IsShowDetails = not bConvert
      Content.bConvert = bConvert
      if Content.bConvert then
        Content.NotInteractive = true
      end
      Content.bNeedFocus = true
      self.Single_Item:Init(Content)
      self.Btn_Again:SetText(GText("UI_SkinGacha_Again_One"))
    else
      self.WS_Item:SetActiveWidgetIndex(0)
      for i = 1, 10 do
        self:AddTimer(self.IntervalTime * (i // 6), function()
          local Data = self.RewardLst[i]
          local ItemWidget = self["Item_" .. i]
          local ItemType = GachaCommon.GachaItemTypeMap[Data.Sign]
          local ItemData = DataMgr[ItemType][Data.ResultId]
          local bNew, bConvert = self:IsNewOrConvertItem(ItemType, Data.ResultId, Data.Count)
          assert(ItemData, "\230\156\170\230\137\190\229\136\176\232\175\165\230\172\161\230\138\189\229\141\161\229\165\150\229\138\177\231\154\132\228\191\161\230\129\175:Id:" .. Data.ResultId .. " Type:" .. ItemType)
          local Content = NewObject(UIUtils.GetCommonItemContentClass())
          Content.Id = Data.ResultId
          Content.Icon = ItemUtils.GetItemIconPath(Data.ResultId, ItemType)
          Content.Count = Data.Count
          Content.ParentWidget = self
          Content.ItemType = ItemType
          Content.Rarity = ItemData.Rarity or ItemData[ItemType .. "Rarity"] or 1
          Content.bNew = bNew
          Content.bDisableCommonClick = bConvert
          Content.IsShowDetails = not bConvert
          Content.bConvert = bConvert
          if Content.bConvert then
            Content.NotInteractive = true
          end
          if 1 == i then
            Content.bNeedFocus = true
          end
          Content.DelayTime = self.IntervalTime * (1 - i // 6)
          ItemWidget:Init(Content)
        end)
      end
      self.Btn_Again:SetText(GText("UI_SkinGacha_Again_Ten"))
    end
  end
  self:AddTimer(0.01, function()
    self:SetPageFocus()
  end)
  local GachaInfo = DataMgr.SkinGacha[self.GachaId]
  if DataMgr.GachaProbability[GachaInfo.ProbabilityId].ShowGetStar5Times == nil or GachaInfo.GachaLimitIsShow then
    self.Text_RemainTimes:SetVisibility(UE4.ESlateVisibility.Collapsed)
  else
    self.Text_RemainTimes:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    local Avatar = GWorld:GetAvatar()
    if Avatar then
      local AdditionalCount = GachaModel:GetSkinGachaAlreadyTimes(GachaInfo.GachaType)
      if AdditionalCount < DataMgr.GachaProbability[GachaInfo.ProbabilityId].ShowGetStar5Times then
        local RemainGachaTimes = math.floor(DataMgr.GachaProbability[GachaInfo.ProbabilityId].ShowGetStar5Times - AdditionalCount)
        local GuaranteeText = DataMgr.SkinGachaType[GachaInfo.GachaType].GachaGuaranteeDes
        if GachaInfo.RewardUpId then
          local ItemId, ItemType = GachaModel:GetSkinGachaUpInfo(self.GachaId)
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
  if self.ShowSkinType then
    local IconObj
    local UpItemId, UpItemType = GachaModel:GetSkinGachaUpInfo(self.GachaId)
    local ShowSkinData = DataMgr[self.ShowSkinType][self.ShowSkinId]
    if UpItemId and self.ShowSkinType == UpItemType and self.ShowSkinId == UpItemId then
      assert(GachaInfo.RewardUpDisplay, "\230\156\170\230\137\190\229\136\176\232\175\165\230\172\161\230\138\189\229\141\161\231\137\185\230\174\138\229\177\149\231\164\186\229\165\150\229\138\177\231\154\132\228\191\161\230\129\175:Id:" .. self.ShowSkinId .. " Type:" .. self.ShowSkinType)
      IconObj = LoadObject(GachaInfo.RewardUpDisplay)
    else
      assert(ShowSkinData, "\230\156\170\230\137\190\229\136\176\232\175\165\230\172\161\230\138\189\229\141\161\231\137\185\230\174\138\229\177\149\231\164\186\229\165\150\229\138\177\231\154\132\228\191\161\230\129\175:Id:" .. self.ShowSkinId .. " Type:" .. self.ShowSkinType)
      IconObj = LoadObject(ShowSkinData.BigIcon)
    end
    assert(IconObj, "\230\156\170\230\137\190\229\136\176\229\175\185\229\186\148\231\154\174\232\130\164\231\154\132BigIcon\228\191\161\230\129\175:Id:" .. self.ShowSkinId .. " Type:" .. self.ShowSkinType)
    self.TypeTag:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    if self.ShowSkinType == "Skin" then
      self.WS_Icon:SetActiveWidgetIndex(0)
      self.Image_AvatarIcon:SetBrushResourceObject(IconObj)
    elseif self.ShowSkinType == "WeaponSkin" then
      self.WS_Icon:SetActiveWidgetIndex(1)
      self.Image_WeaponIcon:SetBrushResourceObject(IconObj)
    else
      self.TypeTag:SetVisibility(ESlateVisibility.Collapsed)
      self.WS_Icon:SetActiveWidgetIndex(2)
      self.Image_Icon:SetBrushResourceObject(IconObj)
    end
    self.Text_SkinName:SetText(GText(ShowSkinData.Name or ShowSkinData[self.ShowSkinType .. "Name"]))
    self.Com_QualityTag:Init(ShowSkinData.Rarity)
  end
end

function M:IsNewOrConvertItem(Type, Id)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  local Count = AvatarUtils:GetTargetDataStatistics(Avatar, Type, Id)
  local ItemData = DataMgr[Type][Id]
  assert(ItemData, "\230\138\189\229\141\161\231\187\147\230\158\156\233\129\147\229\133\183\228\184\141\229\173\152\229\156\168\239\188\154Type:" .. Type .. " Id:" .. Id)
  if self.RewardMap[Type][Id] == Count then
    self.RewardMap[Type][Id] = -1
    return true, false
  elseif ItemData.RegainItemId then
    return false, true
  end
  return false, false
end

function M:RefreshResourceBar()
  local ItemIdLst = {}
  if DataMgr.SystemUI.GachaMain.TabCoin then
    for key, value in ipairs(DataMgr.SystemUI.GachaMain.TabCoin) do
      table.insert(ItemIdLst, value)
    end
  end
  for _, ResourceId in ipairs(DataMgr.SkinGacha[self.GachaId].GachaCostRes) do
    table.insert(ItemIdLst, ResourceId)
  end
  self.HB_ResourceBar:ClearChildren()
  local ItemList = {}
  for i, CoinId in ipairs(ItemIdLst) do
    local ResourceBarWidget = self:CreateWidgetNew("ResourceBar", false)
    local CoinIcon = LoadObject(DataMgr.Resource[CoinId].Icon)
    ResourceBarWidget.Common_Item_Icon:Init({
      UIName = "GachaMain",
      IsShowDetails = true,
      IsCantItemSelection = true,
      MenuPlacement = EMenuPlacement.MenuPlacement_MenuRight,
      Id = CoinId,
      Icon = CoinIcon,
      ItemType = "Resource",
      HandleMouseDown = true
    })
    ItemList[i] = ResourceBarWidget
    ResourceBarWidget:SetResourceId(CoinId)
    self.HB_ResourceBar:AddChild(ResourceBarWidget)
    ResourceBarWidget:SetNavigationRuleBase(EUINavigation.Up, EUINavigationRule.Stop)
    ResourceBarWidget:SetNavigationRuleBase(EUINavigation.Down, EUINavigationRule.Stop)
  end
  for Index, ItemUI in pairs(ItemList) do
    if Index + 1 <= #ItemList then
      ItemUI:SetNavigationRuleExplicit(EUINavigation.Right, ItemList[Index + 1])
    end
    if Index - 1 > 0 then
      ItemUI:SetNavigationRuleExplicit(EUINavigation.Left, ItemList[Index - 1])
    end
  end
end

function M:RefreshGachaResInfo()
  local GachaData = DataMgr.SkinGacha[self.GachaId]
  local GachaTimes = 0
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
  if self.bSingle then
    GachaTimes = GachaData.GachaTimes
    self.Panel_TimeLimit:SetVisibility(ESlateVisibility.Collapsed)
    if TimeLimitResourceCount > 0 then
      self.Com_CostAgain:InitContent({
        ResourceId = TimeLimitResourceId,
        bShowDenominator = false,
        Numerator = GachaTimes,
        IsGamePadIconVisible = false,
        NotInteractive = true
      })
    else
      self.Com_CostAgain:InitContent({
        ResourceId = ShowResourceId,
        bShowDenominator = false,
        Numerator = GachaTimes,
        IsGamePadIconVisible = false,
        NotInteractive = true
      })
    end
  else
    GachaTimes = GachaData.GachaCostNum10
    if TimeLimitResourceCount >= GachaData.GachaCostNum10 then
      self.Panel_TimeLimit:SetVisibility(ESlateVisibility.Collapsed)
      self.Com_CostAgain:InitContent({
        ResourceId = TimeLimitResourceId,
        bShowDenominator = false,
        Numerator = GachaTimes,
        IsGamePadIconVisible = false,
        NotInteractive = true
      })
    elseif TimeLimitResourceCount > 0 and TimeLimitResourceCount + ShowResourceCount >= GachaData.GachaCostNum10 then
      self.Com_CostAgain:InitContent({
        ResourceId = ShowResourceId,
        bShowDenominator = false,
        Numerator = GachaTimes - TimeLimitResourceCount,
        IsGamePadIconVisible = false,
        NotInteractive = true
      })
      self.Panel_TimeLimit:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
      self.Com_CostAgainOther:InitContent({
        ResourceId = TimeLimitResourceId,
        bShowDenominator = false,
        Numerator = TimeLimitResourceCount,
        IsGamePadIconVisible = false,
        NotInteractive = true
      })
    else
      self.Panel_TimeLimit:SetVisibility(ESlateVisibility.Collapsed)
      self.Com_CostAgain:InitContent({
        ResourceId = ShowResourceId,
        bShowDenominator = false,
        Numerator = GachaTimes,
        IsGamePadIconVisible = false,
        NotInteractive = true
      })
    end
  end
end

function M:OnClickGachaAgain()
  if self.Parent.bGachaing or self.Parent.CantClick or self.CantClick then
    return
  end
  if self:IsAnimationPlaying(self.In) or self:IsAnimationPlaying(self.Out) then
    return
  end
  local Ret = GachaController:TryGacha(self.GachaId, self.bSingle)
  if 1 == Ret then
    self.Parent:PurchaseGachaResource(self.bSingle, true)
    return
  end
  self.Parent.bGachaing = true
  self:PlayOutAnim()
end

function M:OnBtnShareClicked()
  if self:IsAnimationPlaying(self.In) or self:IsAnimationPlaying(self.Out) or self.Parent.bGachaing or self.CantClick then
    return
  end
  self.Group_Top:SetVisibility(UE4.ESlateVisibility.Hidden)
  self.Down_Info:SetVisibility(UE4.ESlateVisibility.Hidden)
  local GameInputModeSubsystem = UIManager(self):GetGameInputModeSubsystem(self)
  GameInputModeSubsystem:SetNavigateWidgetOpacity(0)
  self.bSharePage = true
  self.CantClick = true
  self:AddTimer(0.033, function()
    self.Parent:TakeGachaScreenShot(self, self.OnShareCallback)
  end)
end

function M:OnShareCallback()
  self:SetPageFocus()
  self.CantClick = false
  self.Group_Top:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  self.Down_Info:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  if UIUtils.UtilsGetCurrentInputType() ~= ECommonInputType.Gamepad or self.CanFocusChangeItem then
  end
  self.bSharePage = false
  local GameInputModeSubsystem = UIManager(self):GetGameInputModeSubsystem(self)
  GameInputModeSubsystem:SetNavigateWidgetOpacity(1)
end

function M:OnUpdateUIStyleByInputTypeChange(CurInputType, CurGamepadName)
  if not self:Isvisible() then
    return
  end
  if CurInputType == UE4.ECommonInputType.Gamepad then
    self.Key_GamePad03:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self.KeyImg_GamePad:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self.Key_GamePad02:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self:SetPageFocus()
  else
    self.Key_GamePad03:SetVisibility(ESlateVisibility.Collapsed)
    self.KeyImg_GamePad:SetVisibility(ESlateVisibility.Collapsed)
    self.Key_GamePad02:SetVisibility(ESlateVisibility.Collapsed)
  end
end

function M:SetPageFocus()
  if self.Parent.bNeedUpdate then
    return
  end
  if self.bSharePage then
    self.Parent.GachaScreenShotWidget:SetFocus()
    return
  end
  if self.bSingle then
    self.Single_Item:SetFocus()
  else
    self.Item_1:SetFocus()
  end
end

function M:OnKeyDown(MyGeometry, InKeyEvent)
  if self.Parent.bNeedUpdate then
    return
  end
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local IsEventHandled = false
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) then
    IsEventHandled = self:OnGamePadDown(InKeyName)
  elseif "Escape" == InKeyName and not self.Parent.bGachaing and not self.Parent.CantClick then
    IsEventHandled = true
    self:PlayOutAnim()
  end
  if IsEventHandled then
    return UE4.UWidgetBlueprintLibrary.Handled()
  else
    return UE4.UWidgetBlueprintLibrary.UnHandled()
  end
end

function M:OnGamePadDown(InKeyName)
  local IsEventHandled = false
  if InKeyName == UIConst.GamePadKey.FaceButtonTop then
    IsEventHandled = true
    self:OnClickGachaAgain()
  elseif InKeyName == UIConst.GamePadKey.FaceButtonRight then
    if self.bFocusOnExtraReward or self.bFocusOnResourceBar then
      self.bFocusOnExtraReward = false
      self.bFocusOnResourceBar = false
      self:SetPageFocus()
    else
      self:PlayOutAnim()
    end
    IsEventHandled = true
  elseif InKeyName == UIConst.GamePadKey.SpecialRight then
    IsEventHandled = true
    self:OnBtnShareClicked()
  elseif InKeyName == UIConst.GamePadKey.RightThumb then
    if self.HB_ResourceBar:GetChildAt(0) then
      self.bFocusOnResourceBar = true
      self.HB_ResourceBar:GetChildAt(0):SetFocus()
    end
  elseif InKeyName == UIConst.GamePadKey.LeftThumb and self.HasExtraReward then
    self.bFocusOnExtraReward = true
    self.Item1:SetFocus()
  end
  return IsEventHandled
end

function M:PlayOutAnim()
  if self:IsAnimationPlaying(self.Out) then
    return
  end
  if self.OnClosedFun then
    self.OnClosedFun(self.Parent)
  end
  if self.Parent then
    self.Parent.CantClick = false
    self.Parent.bGachaRes = false
  end
  AudioManager(self):SetEventSoundParam(self.Parent, "GachaAmb", {ToEnd = 1})
  self:PlayAnimation(self.Out)
end

function M:OnAnimationFinished(InAnim)
  if InAnim == self.Out then
    self:CloseSelf()
  elseif InAnim == self.In then
    local GameInputModeSubsystem = UIManager(self):GetGameInputModeSubsystem(self)
    GameInputModeSubsystem:SetNavigateWidgetOpacity(1)
    self:BlockAllUIInput(false)
  end
end

function M:CloseSelf()
  self:BlockAllUIInput(false)
  self:SetVisibility(UE4.ESlateVisibility.Collapsed)
end

return M
