require("UnLua")
local SkillUtils = require("Utils.SkillUtils")
local UpgradeUtils = require("Utils.UpgradeUtils")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C",
  "BluePrints.Common.DelayFrameComponent"
})
M._components = {
  "BluePrints.UI.BP_EMUserWidgetUtils_C"
}

function M:Construct()
  self:AddDispatcher(EventID.OnCharGradeLevelUp, self, self.OnCharGradeLevelUp)
  self:AddDispatcher(EventID.OnMenuClose, self, self.OnClickBtnFullClose)
  self.UnLockedText = GText("UI_UNLOCKED")
  self.UnLockText = GText("UI_UNLOCK")
  self.bIsFocusable = true
  self.IsOpenDetails = false
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
  self.GameInputModeSubsystem.OnInputMethodChanged:Add(self, self.RefreshOpInfoByInputDevice)
  self.CurInputDeviceType = self.GameInputModeSubsystem:GetCurrentInputType()
  self:AddDispatcher(EventID.OnPurchaseShopItem, self, self.OnPurchaseShopItem)
end

function M:Init(Params)
  self.Params = Params
  self.Parent = Params.Parent
  self.Char = Params.Target
  self.Type = Params.Type
  self.Tag = Params.Tag
  self.IsPreviewMode = Params.IsPreviewMode or Params.IsTargetUnowned
  self._OnAddedToFocusPath = Params.OnAddedToFocusPath
  self._OnRemovedFromFocusPath = Params.OnRemovedFromFocusPath
  self.NewChar = false
  self:InitTraceMain()
end

function M:InitTraceMain()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  local Char = self.Char
  if self.CharId and self.CharId ~= Char.CharId and not self.IsOpenDetails then
    self.NewChar = true
  end
  self.CharId = Char.CharId
  self.CharGradeLevel = Char.GradeLevel
  self.MaxGradeLevel = tonumber(DataMgr.GlobalConstant.CharCardLevelMax.ConstantValue)
  self.Attribute = DataMgr.BattleChar[self.CharId].Attribute
  self.Line_Attr:SetColorAndOpacity(self[self.Attribute])
  local BgTopAllChildren = self.Panel_BgTop:GetAllChildren():ToTable() or {}
  for index, value in ipairs(BgTopAllChildren) do
    value:SetColorAndOpacity(self[self.Attribute])
  end
  local BgBottomAllChildren = self.Panel_BgBottom:GetAllChildren():ToTable() or {}
  for index, value in ipairs(BgBottomAllChildren) do
    value:SetColorAndOpacity(self[self.Attribute])
  end
  local AllVXChildren = self.VX:GetAllChildren():ToTable() or {}
  for index, value in ipairs(AllVXChildren) do
    value:SetColorAndOpacity(self[self.Attribute .. "_VX"])
  end
  for i = 1, self.CharGradeLevel do
    if self["InronItem_" .. i] then
      self["InronItem_" .. i]:Init(self, i, false)
      if self.NewChar or (not (self.Details and self.SelectTraceId) or self.SelectTraceId ~= i) and (not self.LastFocusItem or self.LastFocusItem ~= self["InronItem_" .. i] or not not self["InronItem_" .. i]:HasAnyUserFocus()) then
        self["InronItem_" .. i]:SetNormalState()
      end
      self["InronItem_" .. i].Num_Intron:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    end
  end
  for j = self.CharGradeLevel + 1, self.MaxGradeLevel do
    if self["InronItem_" .. j] then
      self["InronItem_" .. j]:Init(self, j, true)
      if self.NewChar or (not (self.Details and self.SelectTraceId) or self.SelectTraceId ~= j) and (not self.LastFocusItem or self.LastFocusItem ~= self["InronItem_" .. j] or not not self["InronItem_" .. j]:HasAnyUserFocus()) then
        self["InronItem_" .. j]:SetNormalState()
      end
      self["InronItem_" .. j].Num_Intron:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    end
  end
  if self["InronItem_" .. self.CharGradeLevel + 1] then
    self["InronItem_" .. self.CharGradeLevel + 1]:SetReddotState(self:CheckCharCanUpGradeLevel())
  end
  for k = 1, self.MaxGradeLevel do
    if self["InronItem_" .. k] then
      self["InronItem_" .. k]:PlayActivatableNormal()
    end
  end
  self.SelectTraceId = -1
  if self.LastFocusItem ~= nil and self.CurInputDeviceType == ECommonInputType.Gamepad and not self.IsOpenDetails and self.ShouldFocusLast then
    self.LastFocusItem:SetFocus()
    self.ShouldFocusLast = false
  end
end

function M:LoadSkillDetailsUI()
  local ArmoryMain = UIManager(self):GetArmoryUIObj()
  if ArmoryMain and ArmoryMain.ActorController then
    self.ActorController = ArmoryMain.ActorController
    self.ActorController:SetMontageAndCamera(CommonConst.ArmoryType.Char, nil, CommonConst.ArmoryType.Grade, "Detail")
  end
  self.Details = UIManager(self):LoadUINew("ArmoryTraceDetails", self, self.SelectTraceId, self.SelectMod)
  self:AddDelayFrameFunc(function()
    for i = 1, self.MaxGradeLevel do
      if self["InronItem_" .. i] then
        self["InronItem_" .. i].IsClick = false
        self["InronItem_" .. i]:SetNormalState()
      end
    end
  end, 2, "PlayItemNormalAnim")
end

function M:OnTraceDetailsDestruct(SelectTraceId)
  local ArmoryMain = UIManager(self):GetArmoryUIObj()
  if ArmoryMain then
    ArmoryMain:SetVisibility(UIConst.VisibilityOp.Collapsed)
    ArmoryMain.Panel_SubUI:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  end
  self.SelectTraceId = SelectTraceId
  self.DetailsClose = true
  self.Details = nil
  self.IsOpenDetails = false
  self.ShouldFocusLast = true
  if self["InronItem_" .. self.SelectTraceId] then
    self.LastFocusItem = self["InronItem_" .. self.SelectTraceId]
  end
end

function M:OnClickTraceItem(TraceId)
  if self.IsOutAnimPlayed then
    return
  end
  if self.SelectTraceId == TraceId then
    return
  end
  if not self.Details or self.Details.InFinished then
    if TraceId <= self.CharGradeLevel then
      AudioManager(self):PlayUISound(self, "event:/ui/armory/suyuan_point_click", nil, nil)
    else
      AudioManager(self):PlayUISound(self, "event:/ui/armory/suyuan_point_click_unlock", nil, nil)
    end
  end
  if self["InronItem_" .. self.SelectTraceId] then
    self["InronItem_" .. self.SelectTraceId].IsClick = false
    self["InronItem_" .. self.SelectTraceId]:SetNormalState()
    self["InronItem_" .. self.SelectTraceId]:CollapseVX()
    self.LastFocusItem = self["InronItem_" .. self.SelectTraceId]
  end
  self.SelectTraceId = TraceId
  if self.SelectTraceId ~= self.CharGradeLevel + 1 and self["InronItem_" .. self.CharGradeLevel + 1] then
    self["InronItem_" .. self.CharGradeLevel + 1]:SetReddotState(self:CheckCharCanUpGradeLevel())
  end
  self.SelectMod = 1
  if self.IsPreviewMode then
    self.SelectMod = 4
  elseif self.SelectTraceId <= self.CharGradeLevel then
    self.SelectMod = 1
  elseif self.SelectTraceId == self.CharGradeLevel + 1 then
    self.SelectMod = 2
  else
    self.SelectMod = 3
  end
  if self.IsOpenDetails and self.Details then
    self.Details:UpdateDetailInfo(self.SelectTraceId, self.SelectMod)
  else
    self:LoadSkillDetailsUI()
  end
end

function M:InitResourceNeeded()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  local Char = self.Char
  local ResourceNeeded = {}
  if DataMgr.CharCardLevelUp[Char.CharId][self.SelectTraceId - 1] then
    local Data = DataMgr.CharCardLevelUp[Char.CharId][self.SelectTraceId - 1]
    ResourceNeeded = Char:CalculateCharGradeLevelUpResources(Data)
  end
  self.Details.HB_Item:ClearChildren()
  for Key, Value in pairs(ResourceNeeded) do
    local Resource = Avatar.Resources[Key]
    local ResourceConf = DataMgr.Resource[Key]
    local TypeId2ShopItem = DataMgr.TypeId2ShopItem[CommonConst.DataType.Resource]
    local ShopItemId = TypeId2ShopItem and TypeId2ShopItem[Key] and TypeId2ShopItem[Key][1]
    local ShopItemData = ShopItemId and DataMgr.ShopItem[ShopItemId]
    local FakeContent = {
      Id = Key,
      Icon = ResourceConf.Icon,
      Count = Resource and Resource.Count or 0,
      ItemType = CommonConst.ItemType.Resource,
      Rarity = ResourceConf.Rarity,
      IsShowDetails = true,
      ShopItemId = ShopItemId
    }
    if Value <= FakeContent.Count then
      FakeContent.Count = Value
    end
    local Item = UIManager(self):_CreateWidgetNew("ComItemUniversalM")
    Item:BindEvents(self, {
      OnMenuOpenChanged = self.OnTipsOpenChanged
    })
    Item.bIsFocusable = true
    self.Details.HB_Item:AddChild(Item)
    local Res = {}
    if Value <= FakeContent.Count then
      Res = {
        1,
        FakeContent,
        nil
      }
    elseif Value > FakeContent.Count then
      local NeedNum = Value - FakeContent.Count
      local TypeId2ShopItem2 = DataMgr.TypeId2ShopItem[CommonConst.DataType.Resource]
      local ShopItemId2 = TypeId2ShopItem2 and TypeId2ShopItem2[Key] and TypeId2ShopItem2[Key][1]
      local ShopItemData2 = ShopItemId2 and DataMgr.ShopItem[ShopItemId2]
      if ShopItemData2 then
        local Resource2 = Avatar.Resources[ShopItemData2.PriceType] or {Count = 0}
        local NeedCount = ShopItemData2.Price * NeedNum
        local NeedContent = {
          Id = ShopItemData2.PriceType,
          Icon = DataMgr.Resource[ShopItemData2.PriceType].Icon,
          ItemType = CommonConst.DataType.Resource,
          Rarity = DataMgr.Resource[ShopItemData2.PriceType].Rarity,
          Count = NeedCount,
          ShopItemId = ShopItemId2,
          Price = ShopItemData2.Price,
          IsShowDetails = true
        }
        local AddKey = UIManager(self):_CreateWidgetNew("ArmoryAddKey")
        self.Details.HB_Item:AddChild(AddKey)
        local Slot = UE4.UWidgetLayoutLibrary.SlotAsWrapBoxSlot(AddKey)
        if Slot then
          Slot:SetVerticalAlignment(EVerticalAlignment.VAlign_Center)
        end
        local ItemNeed = UIManager(self):_CreateWidgetNew("ComItemUniversalM")
        self.Details.HB_Item:AddChild(ItemNeed)
        if NeedCount <= Resource2.Count then
          Res = {
            2,
            FakeContent,
            NeedContent
          }
        else
          NeedContent.CountTextRed = true
          Res = {
            3,
            FakeContent,
            NeedContent
          }
        end
        ItemNeed:Init(NeedContent)
      else
        FakeContent.CountTextRed = true
        Res = {
          4,
          nil,
          nil
        }
      end
    end
    Item:Init(FakeContent)
    FakeContent.NeedCount = Value
    return Res
  end
end

function M:OnTipsOpenChanged(bIsOpen)
  if self.Details then
    self.Details:OnTipsOpenChanged(bIsOpen)
  end
end

function M:GetTraceDesc()
  if DataMgr.BattleChar[self.CharId].CharGradeDescription and DataMgr.BattleChar[self.CharId].CharGradeDescription[self.SelectTraceId] then
    local CharGradeDescription = GText(DataMgr.BattleChar[self.CharId].CharGradeDescription[self.SelectTraceId])
    for Index, value in pairs(DataMgr.BattleChar[self.CharId].CharGradeParameter) do
      local CharGradeParameter = value
      local Parameter = SkillUtils.CalcSkillDesc(CharGradeParameter, self.SelectTraceId)
      local SignIndex = string.find(Parameter, "%%", 1)
      if SignIndex then
        Parameter = Parameter .. "%"
      end
      CharGradeDescription = string.gsub(CharGradeDescription, "#" .. Index, Parameter)
    end
    return CharGradeDescription
  end
  return ""
end

function M:OnClickBtnFullClose()
  if -1 == self.SelectTraceId then
    return
  else
    if self["InronItem_" .. self.SelectTraceId] then
      self["InronItem_" .. self.SelectTraceId].IsClick = false
      self["InronItem_" .. self.SelectTraceId]:SetNormalState()
    end
    if self["InronItem_" .. self.CharGradeLevel + 1] then
      self["InronItem_" .. self.CharGradeLevel + 1].IsClick = false
    end
    self.SelectTraceId = -1
  end
end

function M:OnClickBTN(Type, Resource1, Resource2)
  if self.CharGradeLevel == self.MaxGradeLevel or self.SelectTraceId ~= self.CharGradeLevel + 1 then
    return
  end
  if 4 == Type then
    UIManager(self):ShowUITip("CommonToastMain", "UI_FORGING_MATERIAL_NOTENOUGH")
    return
  end
  if 1 == Type then
    if -1 ~= self.SelectTraceId then
      self["InronItem_" .. self.CharGradeLevel + 1]:SetReddotState(false)
    end
    local Avatar = GWorld:GetAvatar()
    if Avatar then
      self.Parent:BlockAllUIInput(true)
      local Char = self.Char
      local CallServerFunc = Avatar.UpCharGradeLevel
      CallServerFunc(Avatar, Char.Uuid, tonumber(Char.GradeLevel))
    end
  elseif 2 == Type then
    local Avatar = GWorld:GetAvatar()
    local Resource1Data = {}
    Resource1Data.Count = Avatar.Resources[Resource1.Id] and Avatar.Resources[Resource1.Id].Count or 0
    Resource1Data.ResourceName = DataMgr.Resource[Resource1.Id] and DataMgr.Resource[Resource1.Id].ResourceName or ""
    local BuyCount = Resource1.NeedCount - Resource1.Count
    local Params = {
      LeftItems = {
        {
          ItemId = Resource2.Id,
          ItemType = Resource2.ItemType,
          Count = Resource2.Count
        }
      },
      RightItems = {
        {
          ItemId = Resource1.Id,
          ItemType = Resource2.ItemType,
          Count = BuyCount
        }
      },
      ShortTextParams = {
        Resource2.Count,
        BuyCount,
        GText(Resource1Data.ResourceName)
      },
      RightCallbackFunction = function()
        self.Parent:BlockAllUIInput(true)
        self.IsWatingForBuyResource = true
        Avatar:PurchaseShopItem(Resource1.ShopItemId, BuyCount, true)
      end
    }
    UIManager(self):ShowCommonPopupUI(100247, Params, self)
  elseif 3 == Type then
    UIManager(self):ShowCommonPopupUI(100248, {
      RightCallbackFunction = function()
        PageJumpUtils:JumpToShopPage(CommonConst.GachaJumpToShopMainTabId, nil, nil, "Shop")
      end
    }, self)
  end
end

function M:OnPurchaseShopItem(Ret)
  if not self.IsWatingForBuyResource then
    return
  end
  self.Parent:BlockAllUIInput(false)
  if not ErrorCode:Check(Ret) then
    return
  end
  if self.IsWatingForBuyResource then
    self.IsWatingForBuyResource = false
    if -1 ~= self.SelectTraceId then
      self["InronItem_" .. self.CharGradeLevel + 1]:SetReddotState(false)
    end
    local Avatar = GWorld:GetAvatar()
    if Avatar then
      self.Parent:BlockAllUIInput(true)
      local Char = self.Char
      local CallServerFunc = Avatar.UpCharGradeLevel
      CallServerFunc(Avatar, Char.Uuid, tonumber(Char.GradeLevel))
    end
  end
end

function M:CheckCharCanUpGradeLevel()
  if self.IsPreviewMode then
    return
  end
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  local Char = self.Char
  return UpgradeUtils.CheckCharCanUpgradeCardLevel(Char)
end

function M:OnCharGradeLevelUp(Ret, CharUuid, CurrentGradeLevel)
  self.Parent:BlockAllUIInput(false)
  if ErrorCode:Check(Ret) then
    local Avatar = GWorld:GetAvatar()
    self.Char = Avatar.Chars[self.Char.Uuid]
    self.CharGradeLevel = CurrentGradeLevel + 1
    if self["InronItem_" .. self.SelectTraceId] then
      AudioManager(self):PlayUISound(self, "event:/ui/armory/card_level_unlock", nil, nil)
      self["InronItem_" .. self.SelectTraceId]:PlayUnLockAnim()
    end
    if self["InronItem_" .. self.CharGradeLevel + 1] then
      self["InronItem_" .. self.CharGradeLevel + 1]:SetReddotState(self:CheckCharCanUpGradeLevel())
    end
    if self.Details then
      self.Details:UpdateDetailInfo(self.SelectTraceId, 1)
    end
  end
end

function M:ClickToNextTraceItem()
  self.Parent:BlockAllUIInput(false)
end

function M:PlayInAnim()
  self.IsOutAnimPlayed = false
  self:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  if not self.IsOpenDetails and not self.DetailsClose then
    self:StopAllAnimations()
    self:FlushAnimations()
    self:PlayAnimation(self.In)
    AudioManager(self):PlayUISound(self, "event:/ui/armory/suyuan_points_show", nil, nil)
    if self.InronItem_1 then
      self.LastFocusItem = self.InronItem_1
    end
  end
  self.DetailsClose = false
end

function M:PlayOutAnim()
  self.IsOutAnimPlayed = true
  self:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  self:StopAllAnimations()
  self:FlushAnimations()
  self:PlayAnimation(self.Out)
  for i = 1, self.MaxGradeLevel do
    if self["InronItem_" .. i] then
      self["InronItem_" .. i]:CollapseNiagara()
    end
  end
  return self.Out:GetEndTime()
end

function M:SetDetailsUnlockPlaying(IsPlaying)
  if self.Details then
    self.Details.UnlockPlaying = IsPlaying
  end
end

function M:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  self.IsGamepadInput = CurInputDevice == ECommonInputType.Gamepad
  self.CurInputDeviceType = CurInputDevice
end

function M:OnTraceItemFocused(TraceId)
  if (self.IsGamepadInput and self.IsOpenDetails or self.IsOpenDetails and self.CurInputDeviceType == ECommonInputType.GamePad) and self["InronItem_" .. TraceId] then
    self["InronItem_" .. TraceId].IsClick = false
    self["InronItem_" .. TraceId]:SetClickState()
    self.LastFocusItem = self["InronItem_" .. TraceId]
  end
end

function M:OnFocusReceived(MyGeometry, InFocusEvent)
  return UWidgetBlueprintLibrary.SetUserFocus(UWidgetBlueprintLibrary.Handled(), self.InronItem_1)
end

function M:OnAddedToFocusPath()
  if self._OnAddedToFocusPath then
    self._OnAddedToFocusPath(self.Parent, self)
  end
end

function M:OnRemovedFromFocusPath()
  if self._OnRemovedFromFocusPath then
    self._OnRemovedFromFocusPath(self.Parent, self)
  end
end

function M:OnPopUIKeyDown(InKeyName)
  if not self.PopupUI then
    return
  end
  if InKeyName == UIConst.GamePadKey.RightThumb then
    local ItemWidget = self.PopupUI:GetContentWidgetByName("ItemSubsize")
    if ItemWidget then
      local Item = ItemWidget.Item:GetChildAt(0)
      if Item then
        local Events = {
          OnMenuOpenChanged = self.ItemMenuAnchorChanged
        }
        Item:BindEvents(self, Events)
        Item:OpenItemMenu()
      end
    end
  end
end

function M:ItemMenuAnchorChanged(bIsOpen)
  if not self.PopupUI then
    return
  end
  local CurMode = UIUtils.UtilsGetCurrentInputType()
  if CurMode ~= ECommonInputType.Gamepad then
    return
  end
  if bIsOpen then
    self.PopupUI:SetGamepadBtnKeyVisibility(false)
    self.PopupUI:HideGamepadShortcut(self.OpenTipsButtonIndex)
  else
    self.PopupUI:SetGamepadBtnKeyVisibility(true)
    self.PopupUI:ShowGamepadShortcut(self.OpenTipsButtonIndex)
  end
end

function M:InitKeySetting()
end

AssembleComponents(M)
return M
