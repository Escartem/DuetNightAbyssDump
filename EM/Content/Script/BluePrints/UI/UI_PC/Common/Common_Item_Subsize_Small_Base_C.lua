require("UnLua")
local M = Class({
  "BluePrints.UI.BP_UIState_C"
})

function M:Init(Content)
  self:OnListItemObjectSet(Content)
end

function M:OnListItemObjectSet(Content)
  Content.SelfWidget = self
  self:InitData(Content)
  self:InitView(Content)
  self.ItemDetails_MenuAnchor:CloseItemDetailsWidget()
  if self.IsPlayAnim then
    self:PlayInAnimation()
  end
  if self.AfterInitCallback then
    self.AfterInitCallback(self)
  end
end

function M:BP_OnEntryReleased()
  if self.Content then
    self.Content.SelfWidget = nil
  end
end

function M:InitData(Content)
  self.Content = Content
  self.ParentWidget = Content.ParentWidget
  self.CommonType = Content.CommonType
  self.ItemType = Content.ItemType
  self.Id = Content.Id or Content.UnitId
  self.Uuid = Content.Uuid
  self.Count = Content.Count
  self.NeedCount = Content.NeedCount
  self.MaxCount = Content.MaxCount
  self.Icon = Content.Icon
  self.Rarity = Content.Rarity
  self.UIName = Content.UIName
  self.IsSpecial = Content.IsSpecial
  self.NotInteractive = Content.NotInteractive
  self.ShowRedDot = Content.ShowRedDot
  self.ShowNewDot = Content.ShowNewDot
  self.IsShowDetails = Content.IsShowDetails
  self.MenuPlacement = Content.MenuPlacement
  self.Content.IsShowTips = false
  self.ItemDetails_MenuAnchor.ParentWidget = self
  self.IsCantItemSelection = Content.IsCantItemSelection
  self.HandleKeyDown = Content.HandleKeyDown
  self.IsPlayAnim = Content.IsPlayAnim or false
  self.bCanGet = Content.bCanGet
  self.HandleMouseDown = Content.HandleMouseDown
  self.IsGotState = Content.IsGot or false
  self.IsBonus = Content.IsBonus or false
  self.FirstRewardFlag = Content.FirstRewardFlag or false
  self.IsWalnutBonus = Content.IsWalnutBonus or false
  self.NotCountFormat = Content.NotCountFormat or false
  self.IsSold = Content.IsSold or false
  self.IsShadowEnabled = Content.IsShadowEnabled or false
  self.AfterInitCallback = Content.AfterInitCallback
  self.OnMouseButtonUpEvents = Content.OnMouseButtonUpEvents
  if self.OnMouseButtonUpEvents then
    self:BindEventOnMouseButtonUp(self.OnMouseButtonUpEvents.Obj, self.OnMouseButtonUpEvents.Callback, self.OnMouseButtonUpEvents.Params)
  end
  self._OnAddedToFocusPathEvent = Content.OnAddedToFocusPathEvent
  self._OnRemovedFromFocusPathEvent = Content.OnRemovedFromFocusPathEvent
end

function M:InitView(Content)
  self:StopAllAnimations()
  if self.Normal then
    self:PlayAnimation(self.Normal)
  end
  if not self.Id or 0 == self.Id then
    self.Switch_Type:SetActiveWidgetIndex(1)
    return
  else
    self.Switch_Type:SetActiveWidgetIndex(0)
  end
  self:BP_OnItemSelectionChanged(false)
  self:SetIcon(self.Icon)
  self:SetRarity(self.Rarity)
  self:SetIsGotState(self.IsGotState)
  self:SetRedDot(self.ShowRedDot)
  self:SetNewDot(self.ShowNewDot)
  self:SetBonus(self.IsBonus)
  self:SetWalnutBonus(self.IsWalnutBonus)
  if self.NeedCount and self.NeedCount > 0 then
    self:ShowFactionText(self.Count, self.NeedCount)
  else
    self:SetCount(self.Count, self.NotCountFormat)
  end
  if self.ItemType == "Weapon" then
    self:SetWeaponPhantomIcon(Content.Uuid)
  end
  if self.ItemType == "Walnut" then
    self:SetWalnutNum(self.Id)
  end
  if self.IsSold then
    self.Panel_Lock:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self.Text_Lock:SetText(GText("UI_Fishing_BuyFishingLure"))
  else
    self.Panel_Lock:SetVisibility(ESlateVisibility.Collapsed)
  end
  if not self.GameInputModeSubsystem then
    self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(self)
  end
end

function M:BindEventOnMouseButtonUp(Obj, Callback, Params)
  if not self.OnMouseButtonUpDel then
    self.OnMouseButtonUpDel = {}
    self.OnMouseButtonUpDelParam = {}
  end
  self.OnMouseButtonUpDel[Obj] = Callback
  self.OnMouseButtonUpDelParam[Obj] = Params
end

function M:ClearEventOnMouseButtonUp(Obj)
  if not self.OnMouseButtonUpDel then
    return
  end
  self.OnMouseButtonUpDel[Obj] = nil
  self.OnMouseButtonUpDelParam[Obj] = nil
end

function M:RemoveAllEvent()
end

local function _RealSetIcon(self, Icon)
  local IconDynaMaterial = self.Img_Item:GetDynamicMaterial()
  if IsValid(IconDynaMaterial) then
    if not IsValid(Icon) then
      DebugPrint("ZDX_\232\175\183\229\175\185\229\186\148\231\179\187\231\187\159\230\163\128\230\159\165Icon\230\152\175\229\144\166\230\173\163\231\161\174")
    else
      IconDynaMaterial:SetTextureParameterValue("IconMap", Icon)
    end
  else
    DebugPrint("ZDX_IconDynaMaterial\228\184\141\229\144\136\230\179\149")
  end
end

function M:SetIcon(Icon)
  if self.IsShadowEnabled then
    self.Img_Item:SetColorAndOpacity(UE4.UUIFunctionLibrary.StringToLinearColor("000000FF"))
  else
    self.Img_Item:SetColorAndOpacity(UE4.UUIFunctionLibrary.StringToLinearColor("FFFFFFFF"))
  end
  if self.ItemType == "Walnut" then
    assert(DataMgr.Walnut[self.Id])
    local IconPath = DataMgr.Walnut[self.Id].Icon
    self:LoadTextureAsync(IconPath, function(Texture)
      _RealSetIcon(self, Texture)
    end, "LoadIcon")
    return
  end
  if not Icon then
    DebugPrint("ZDX_\233\129\147\229\133\183\230\161\134\231\188\186\229\176\145Icon")
    return
  end
  if type(Icon) == "string" then
    self:LoadTextureAsync(Icon, function(Texture)
      _RealSetIcon(self, Texture)
    end, "LoadIcon")
  else
    _RealSetIcon(self, Icon)
  end
end

function M:LoadTextureAsync(TexturePath, cb, TaskName)
  rawset(self, "LoadResourceID", nil)
  local Handle = UE.UResourceLibrary.LoadObjectAsyncWithId(self, TexturePath, {
    self,
    function(self, Texture, ResourceID)
      if not IsValid(self) or nil ~= ResourceID and rawget(self, "LoadResourceID") ~= ResourceID then
        return
      end
      cb(Texture)
    end
  })
  if Handle then
    rawset(self, "LoadResourceID", Handle.ResourceID)
  end
end

function M:SetCount(Count, NotCountFormat)
  self.Text_Switch:SetActiveWidgetIndex(0)
  if Count and Count >= 0 then
    self.Panel_Num:SetVisibility(ESlateVisibility.Visible)
    local NumStr
    if NotCountFormat then
      NumStr = FormatNumber(Count, false)
      if self.MaxCount and self.MaxCount > 0 then
        NumStr = NumStr .. "~"
        NumStr = NumStr .. CommonUtils.GetCountStr(self.MaxCount, 3)
      end
    else
      NumStr = FormatNumber(Count, true)
      if self.MaxCount and self.MaxCount > 0 then
        NumStr = NumStr .. "~"
        NumStr = NumStr .. FormatNumber(self.MaxCount, true)
      end
    end
    self.Text_Num:SetText(NumStr)
  else
    self.Panel_Num:SetVisibility(ESlateVisibility.Collapsed)
  end
end

function M:SetRarity(Rarity)
  if not Rarity or Rarity < 1 or Rarity > 5 then
    self.Switch_Style:SetActiveWidgetIndex(1)
    self.Panel_QualityLine:SetVisibility(ESlateVisibility.Collapsed)
    self.Spacer_Switch:SetVisibility(ESlateVisibility.Visible)
    return
  end
  self.Switch_Style:SetActiveWidgetIndex(0)
  self.Panel_QualityLine:SetVisibility(ESlateVisibility.Visible)
  self.Spacer_Switch:SetVisibility(ESlateVisibility.Collapsed)
  self.Img_Line:SetBrushResourceObject(LoadObject("/Game/UI/UI_PNG/Common/Deco/Deco_Quality_" .. UIConst.RarityColorName[Rarity] .. ".Deco_Quality_" .. UIConst.RarityColorName[Rarity]))
  self.Quality:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  self.Quality.Img_Quality:SetBrushTintColor(self.Quality["Color_" .. Rarity])
end

function M:SetIsGotState(IsGot)
  if not self.Group_Got then
    return
  end
  self.IsGotState = IsGot
  if IsGot then
    self:PlayAnimation(self.IsGot)
    self.Group_Got:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  else
    self:PlayAnimation(self.IsNormal)
    self.Group_Got:SetVisibility(ESlateVisibility.Collapsed)
  end
end

function M:SetRedDot(ShowRedDot)
  if ShowRedDot then
    self.Reddot:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  else
    self.Reddot:SetVisibility(ESlateVisibility.Collapsed)
  end
end

function M:SetNewDot(ShowNewDot)
  if not self.New then
    return
  end
  if ShowNewDot then
    self.New:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  else
    self.New:SetVisibility(ESlateVisibility.Collapsed)
  end
end

function M:SetBonus(IsBonus)
  if IsBonus or self.FirstRewardFlag then
    self.Bonus:SetVisibility(ESlateVisibility.Visible)
    if self.FirstRewardFlag then
      self.Bonus.Text_Bonus:SetText(GText("UI_Dungeon_First_Reward_Tag"))
    elseif IsBonus then
      self.Bonus.Text_Bonus:SetText(GText("UI_Reward_Bonus"))
    end
  else
    self.Bonus:SetVisibility(ESlateVisibility.Collapsed)
  end
end

function M:SetWalnutBonus(IsWalnutBonus)
  if not self.Walnut then
    return
  end
  if IsWalnutBonus then
    local Widget = UIManager(self):_CreateWidgetNew("ItemWalnutTag")
    self.Walnut:AddChild(Widget)
    self.Walnut:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  else
    self.Walnut:SetVisibility(ESlateVisibility.Collapsed)
  end
end

function M:PlayInAnimation()
  if self.bCanGet then
    self:PlayAnimation(self.Receive_On)
  elseif self.IsSpecial then
    if self.ItemType == "Mod" then
      self:PlayAnimation(self.VX_MOD_In)
    elseif self.ItemType == "Resource" and DataMgr.Resource[self.Id].ResourceSType == "Coin" then
      self:PlayAnimation(self.VX_COIN_In)
    else
      self:PlayAnimation(self.VX_MAT_In)
    end
    self.NotInteractive = true
    AudioManager(self):PlayUISound(self, "event:/ui/common/level_end_item_unlock", nil, nil)
  elseif 5 == self.Rarity then
    self:PlayAnimation(self.Orange_In)
  elseif 4 == self.Rarity then
    self:PlayAnimation(self.purple_In)
  else
    self:PlayAnimation(self.Normal_In)
  end
end

function M:IsInAnimationPlaying()
  if self:IsAnimationPlaying(self.Orange_In) or self:IsAnimationPlaying(self.purple_In) or self:IsAnimationPlaying(self.Normal_In) or self:IsAnimationPlaying(self.VX_MOD_In) or self:IsAnimationPlaying(self.VX_COIN_In) or self:IsAnimationPlaying(self.VX_MAT_In) or self:IsAnimationPlaying(self.Gacha_In) then
    return true
  end
  return false
end

function M:SetSelected(IsSelected)
  if self.NotInteractive then
    return
  end
  if self.Content then
    self.Content.IsSelect = IsSelected
  end
  if IsSelected then
    self.VX_Loop:SetVisibility(ESlateVisibility.Visible)
    self:PlayAnimation(self.Selected_Loop, 0, 0)
  else
    self:StopAllAnimations()
    self.VX_Loop:SetVisibility(ESlateVisibility.Collapsed)
    self:PlayAnimation(self.Normal)
  end
end

function M:OnMouseEnter(MyGeometry, MouseEvent)
  if CommonUtils.GetDeviceTypeByPlatformName(self) == "Mobile" then
    return
  end
  if not self.Content or self.NotInteractive or self.Content.IsSelect or self.Content.IsShowTips or self:IsInAnimationPlaying() then
    return
  end
  self:StopAllAnimations()
  self:PlayAnimationForward(self.Hovered)
end

function M:OnMouseLeave(MyGeometry, MouseEvent)
  if CommonUtils.GetDeviceTypeByPlatformName(self) == "Mobile" then
    return
  end
  if not self.Content or self.NotInteractive or self.Content.IsSelect or self.Content.IsShowTips or self:IsInAnimationPlaying() then
    return
  end
  self:StopAllAnimations()
  self:PlayAnimation(self.Normal)
end

function M:OnMouseButtonDown(MyGeometry, MouseEvent)
  if self.NotInteractive or self.IsShowDetails and self.ItemDetails_MenuAnchor.ItemDetailsMenuAnchor:IsOpen() or self:IsInAnimationPlaying() then
    return UWidgetBlueprintLibrary.Handled()
  end
  self:StopAllAnimations()
  if CommonUtils.GetDeviceTypeByPlatformName(self) == "PC" then
    self:PlayAnimation(self.Pressed)
  end
  if self.HandleMouseDown then
    return UWidgetBlueprintLibrary.Handled()
  end
  return UWidgetBlueprintLibrary.Handled()
end

function M:OnTouchEnded(MyGeometry, TouchEvent)
  return self:OnMouseButtonUp(MyGeometry, TouchEvent)
end

function M:OnTouchStarted(MyGeometry, TouchEvent)
  return self:OnMouseButtonDown(MyGeometry, TouchEvent)
end

function M:OnMouseButtonUp(MyGeometry, MouseEvent)
  if self.NotInteractive or self:IsInAnimationPlaying() then
    return UWidgetBlueprintLibrary.Unhandled()
  end
  if not self.bCanGet and self.ItemType == "Walnut" then
    UIManager(self):LoadUINew("WalnutRewardDialog", self.Id)
    return UWidgetBlueprintLibrary.Unhandled()
  end
  if self.IsShowDetails then
    if self.ItemDetails_MenuAnchor.ItemDetailsMenuAnchor:IsOpen() then
      return UWidgetBlueprintLibrary.Unhandled()
    end
    local Content = {
      ItemType = self.ItemType,
      ItemId = self.Id,
      Uuid = self.Uuid,
      MenuPlacement = self.MenuPlacement,
      UIName = self.UIName,
      HandleKeyDown = self.HandleKeyDown
    }
    self.ItemDetails_MenuAnchor:OpenItemDetailsWidget(false, Content)
    self.Content.IsShowTips = true
    self.Content.IsSelect = true
  end
  AudioManager(self):PlayItemSound(self, self.Id, "Click", self.ItemType)
  if self.bCanGet then
    self:PlayAnimationReverse(self.Receive_On)
  end
  self:PlayAnimation(self.Click)
  if self.OnMouseButtonUpDel then
    for Obj, Callback in pairs(self.OnMouseButtonUpDel) do
      if self.OnMouseButtonUpDelParam[Obj] then
        Callback(Obj, table.unpack(self.OnMouseButtonUpDelParam[Obj]))
      else
        Callback(Obj)
      end
    end
  end
  return UWidgetBlueprintLibrary.Unhandled()
end

function M:OnAnimationFinished(InAnimation)
  if InAnimation == self.Click and not self.NotInteractive then
    self.VX_Loop:SetVisibility(ESlateVisibility.Visible)
    self:PlayAnimation(self.Selected_Loop, 0, 0)
  elseif self.VX_MOD_In and InAnimation == self.VX_MOD_In or self.VX_MAT_In and InAnimation == self.VX_MAT_In or self.VX_COIN_In and InAnimation == self.VX_COIN_In then
    self.NotInteractive = false
  end
end

function M:SetWeaponPhantomIcon(_Uuid)
  local Avatar = GWorld:GetAvatar()
  local Uuid = _Uuid
  if _Uuid and not CommonUtils.IsObjId(_Uuid) then
    Uuid = CommonUtils.Str2ObjId(_Uuid)
  end
  local Weapon = Uuid and Avatar.Weapons[Uuid]
  local AssisterId = Weapon and Weapon.AssisterId
  if AssisterId and DataMgr.Resource[AssisterId] then
    self.Phantom:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    if not self.PhantomWidget then
      self.PhantomWidget = Utils.UIManager(self):CreateWidget("/Game/UI/UI_PC/Common/Item_Subsize_Widget/Common_Item_Subsize_Phantom_PC.Common_Item_Subsize_Phantom_PC", false)
      self.Phantom:ClearChildren()
      self.Phantom:AddChild(self.PhantomWidget)
    end
    local CharId = DataMgr.Resource[AssisterId].UseParam
    if CharId and DataMgr.BattleChar[CharId] then
      self.PhantomWidget.Switch_Type:SetActiveWidgetIndex(2)
      local MiniIconPath = "Texture2D'/Game/UI/Texture/Dynamic/Image/Head/Mini/"
      local PhantomGuideIconImg = "T_Normal_" .. DataMgr.BattleChar[CharId].GuideIconImg
      local IconImage = LoadObject(MiniIconPath .. PhantomGuideIconImg .. "." .. PhantomGuideIconImg .. "'")
      self.PhantomWidget:SetCharIcon(IconImage)
    else
      self.Phantom:SetVisibility(UE4.ESlateVisibility.Collapsed)
    end
  else
    self.Phantom:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
end

function M:SetWalnutNum(ItemId)
  assert(DataMgr.Walnut[ItemId], "\230\160\184\230\161\131\228\184\141\229\173\152\229\156\168\239\188\154", ItemId)
  local WalnutNum = DataMgr.Walnut[ItemId].WalnutNumber
  if self.Walnut_Num then
    local NumWidget = UIManager(self):_CreateWidgetNew("ItemWalnutNum")
    for i = 3, 1, -1 do
      local Num = math.floor(WalnutNum % 10)
      WalnutNum = WalnutNum / 10
      NumWidget["Num_" .. i]:SetText(Num)
    end
    self.Walnut_Num:AddChild(NumWidget)
  end
end

function M:ShowFactionText(Hold, Need)
  self.Text_Switch:SetActiveWidgetIndex(1)
  self.Text_Hold:SetText(FormatNumber(Hold, true))
  self.Text_Need:SetText("/" .. tostring(FormatNumber(Need, true)))
  if Need <= Hold then
    self.Text_Hold:SetColorAndOpacity(UE4.UUIFunctionLibrary.StringToSlateColor("FFFFFFFF"))
  else
    self.Text_Hold:SetColorAndOpacity(UE4.UUIFunctionLibrary.StringToSlateColor("D82E30FF"))
  end
end

function M:Construct()
  M.Super.Construct(self)
  self.ItemDetails_MenuAnchor.ItemDetailsMenuAnchor.OnMenuOpenChanged:Add(self, self.OnMenuOpenChanged)
end

function M:Destruct()
  self.ItemDetails_MenuAnchor.ItemDetailsMenuAnchor.OnMenuOpenChanged:Remove(self, self.OnMenuOpenChanged)
  M.Super.Destruct(self)
end

function M:OnMenuOpenChanged(bIsOpen)
  if self.Event_OnMenuOpenChanged then
    self.Event_OnMenuOpenChanged(self.Obj, bIsOpen)
  end
end

function M:BindEvents(Obj, Events)
  Events = Events or {}
  self.Obj = Obj
  self.Event_OnMenuOpenChanged = Events.OnMenuOpenChanged
end

function M:OnFocusReceived(MyGeometry, InFocusEvent)
  if self.GameInputModeSubsystem and UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
    self.GameInputModeSubsystem:SetTargetUIFocusWidget(self)
    self.GameInputModeSubsystem:UpdateCurrentFocusWidgetPos()
  end
  return M.Super.OnFocusReceived(self, MyGeometry, InFocusEvent)
end

function M:OnAddedToFocusPath(InFocusEvent)
  if self._OnAddedToFocusPathEvent then
    self._OnAddedToFocusPathEvent(self.ParentWidget, self)
  end
end

function M:OnRemovedFromFocusPath(InFocusEvent)
  if self._OnRemovedFromFocusPathEvent then
    self._OnRemovedFromFocusPathEvent(self.ParentWidget, self)
  end
end

return M
