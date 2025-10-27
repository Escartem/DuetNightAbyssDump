require("UnLua")
local TimeUtils = require("Utils.TimeUtils")
local StrLib = require("BluePrints.Common.DataStructure")
local Deque = StrLib.Deque
local M = Class({
  "BluePrints.UI.BP_UIState_C",
  "BluePrints.Common.DelayFrameComponent"
})

function M:Init(Content)
  self:OnListItemObjectSet(Content)
end

function M:OnListItemObjectSet(Content)
  Content.SelfWidget = self
  self.WidgetMap = self.WidgetMap or {}
  self:RemoveAllEvent()
  self:InitData(Content)
  self:InitCompView()
  if self.AfterInitCallback then
    self.AfterInitCallback(self)
  end
end

function M:InitData(Content)
  self.Content = Content
  self.ParentWidget = Content.ParentWidget
  self.Id = Content.Id or Content.UnitId
  self.ItemType = Content.ItemType
  self.Rarity = Content.Rarity
  self.Icon = Content.Icon
  self.Uuid = Content.Uuid
  self.Count = Content.Count
  self.NeedCount = Content.NeedCount
  self.MaxCount = Content.MaxCount
  self.NotCountFormat = Content.NotCountFormat
  self.SelectNeedCount = Content.SelectNeedCount
  self.SelectTotalCount = Content.SelectTotalCount
  self.bShowNotHaveStyle = Content.bShowNotHaveStyle
  self.PetEntryId = Content.PetEntryId
  self.CountTextRed = Content.CountTextRed
  self.ItemName = Content.ItemName
  self.Level = Content.Level
  self.NotInteractive = Content.NotInteractive
  self.bPlayInAnim = Content.bPlayInAnim
  self.bSpecial = Content.bSpecial
  self.bCanGet = Content.bCanGet
  self.CanGetStyle = Content.CanGetStyle
  self.bHideGamePad = Content.bHideGamePad
  self.IsShowDetails = Content.IsShowDetails
  self.MenuPlacement = Content.MenuPlacement
  self.UIName = Content.UIName
  self.bShowAccess = Content.bShowAccess
  self.bCustomStype = Content.bCustomStype
  self.ItemDetailsButton01EventInfo = Content.ItemDetailsButton01EventInfo
  self.ItemDetailsButton02EventInfo = Content.ItemDetailsButton02EventInfo
  self.ItemDetailsLockEventInfo = Content.ItemDetailsLockEventInfo
  self.Item.ItemDetails_MenuAnchor.ParentWidget = self
  self.ItemDetailKeyDownEvent = Content.ItemDetailKeyDownEvent
  self.ItemDetailHandleKeyDown = Content.ItemDetailHandleKeyDown
  self.Content.IsShowTips = false
  self.RedDotType = Content.RedDotType
  self.bHasGot = Content.bHasGot
  self.BonusType = Content.BonusType or 0
  self.ExtraBonusText = Content.ExtraBonusText
  self.bSold = Content.bSold
  self.LockType = Content.LockType
  self.bShadow = Content.bShadow
  self.bOutline = Content.bOutline
  self.bAsyncLoadIcon = Content.bAsyncLoadIcon
  self.bUnrevealed = Content.bUnrevealed
  self.bRare = Content.bRare
  self.bInGear = Content.bInGear
  self.TryOutText = Content.TryOutText
  self.TimeLimitData = Content.TimeLimitData
  self.bAdd = Content.bAdd
  self.HandleMouseDown = Content.HandleMouseDown
  self.bDisableCommonClick = Content.bDisableCommonClick
  self.AfterInitCallback = Content.AfterInitCallback
  self.OnFocusReceivedEvent = Content.OnFocusReceivedEvent
  self.OnAddedToFocusPathEvent = Content.OnAddedToFocusPathEvent
  self.OnRemovedFromFocusPathEvent = Content.OnRemovedFromFocusPathEvent
  self.OnMouseEnterEvent = Content.OnMouseEnterEvent
  self.OnMouseLeaveEvent = Content.OnMouseLeaveEvent
  self.OnMouseButtonDownEvent = Content.OnMouseButtonDownEvent
  self.JumpReturnCallBack = Content.JumpReturnCallBack
  self.OnMouseButtonUpEvents = Content.OnMouseButtonUpEvents
  self.OnMenuOpenChangedEvents = Content.OnMenuOpenChangedEvents
  if self.OnMenuOpenChangedEvents then
    self:BindEventOnMenuOpenChanged(self.OnMenuOpenChangedEvents.Obj, self.OnMenuOpenChangedEvents.Callback)
  end
  if self.OnMouseButtonUpEvents then
    self:BindEventOnMouseButtonUp(self.OnMouseButtonUpEvents.Obj, self.OnMouseButtonUpEvents.Callback, self.OnMouseButtonUpEvents.Params)
  end
  self.bDontRemoveSubWidget = true
  if Content.bAllUseAsyncLoadWidget ~= nil then
    self.bAllUseAsyncLoadWidget = Content.bAllUseAsyncLoadWidget
  else
    self.bAllUseAsyncLoadWidget = true
  end
end

function M:InitCommonView()
  self:ClearBackGroundHeight()
  if self.Item.ItemDetails_MenuAnchor then
    self.Item.ItemDetails_MenuAnchor:CloseItemDetailsWidget()
  end
  self:SetOutline(false)
  self:SetRarity(self.Rarity)
  if self.bAdd then
    self:SetAdd(self.bAdd)
    return
  end
  if not self.Id or 0 == self.Id then
    self.Item.WidgetSwitcher_State:SetActiveWidgetIndex(1)
    return
  else
    self.Item.WidgetSwitcher_State:SetActiveWidgetIndex(0)
  end
  self:SetIcon(self.Icon)
  self:SetSelected(self.Content.IsSelect)
  self:SetDraftType(self.ItemType == "Draft")
  if self.bPlayInAnim then
    self:PlayInAnimation()
  end
end

function M:SetIcon(IconPath)
  if self.ItemType == "Walnut" then
    IconPath = DataMgr.Walnut[self.Id].Icon
    self:SetWalnutNum(self.Id)
  end
  if self.bAsyncLoadIcon then
    self:LoadTextureAsync(IconPath, function(Texture)
      if not Texture then
        Texture = LoadObject("Texture2D'/Game/UI/Texture/Dynamic/Image/Head/Monster/T_Head_Empty.T_Head_Empty'")
        DebugPrint(ErrorTag, string.format("\231\148\168\233\148\153\229\155\190\230\160\135\232\183\175\229\190\132\228\186\134\239\188\129\239\188\129\239\188\129\232\191\153\233\135\140\231\148\168\233\187\152\232\174\164\231\154\132\229\155\190\230\160\135\233\161\182\228\184\128\228\184\139\n \233\148\153\232\175\175\231\154\132\232\183\175\229\190\132\230\152\175\239\188\154%s", IconPath))
      end
      if Texture then
        local __IconDynaMaterial = self.Item.Item_BG:GetDynamicMaterial()
        if __IconDynaMaterial then
          __IconDynaMaterial:SetTextureParameterValue("IconMap", Texture)
        end
      end
    end, "LoadIcon")
  else
    local Icon = LoadObject(IconPath)
    if not Icon then
      Icon = LoadObject("Texture2D'/Game/UI/Texture/Dynamic/Image/Head/Monster/T_Head_Empty.T_Head_Empty'")
      DebugPrint(ErrorTag, string.format("\231\148\168\233\148\153\229\155\190\230\160\135\232\183\175\229\190\132\228\186\134\239\188\129\239\188\129\239\188\129\232\191\153\233\135\140\231\148\168\233\187\152\232\174\164\231\154\132\229\155\190\230\160\135\233\161\182\228\184\128\228\184\139\n \233\148\153\232\175\175\231\154\132\232\183\175\229\190\132\230\152\175\239\188\154%s", IconPath))
    end
    local DynamicMaterial = self.Item.Item_BG:GetDynamicMaterial()
    if not IsValid(DynamicMaterial) then
      DebugPrint("ZDX_DynamicMaterial\228\184\141\229\144\136\230\179\149")
    end
    DynamicMaterial:SetTextureParameterValue("IconMap", Icon)
  end
end

function M:SetDraftType(IsDraftType)
  local function Callback(CoroutineObj)
    if IsDraftType then
      if self.DraftItemWidget and not IsValid(self.DraftItemWidget) then
        self.WidgetMap[self.DraftItemWidget] = nil
      end
      if not self.WidgetMap[self.DraftItemWidget] then
        self.DraftItemWidget = self:CreateWidgetAsync("DraftCompendiumItem", CoroutineObj)
      end
      self:AddWidgetToNode(self.DraftItemWidget)
    elseif self.DraftItemWidget and self.WidgetMap[self.DraftItemWidget] then
      self:RemoveWidgetFromNode(self.DraftItemWidget)
    end
  end
  
  self:AsyncLoadWidgetCommon("DraftItemWidget", "SetDraftTypeTask", Callback)
end

function M:LoadTextureAsync(TexturePath, cb, TaskName)
  rawset(self, TaskName, nil)
  local Handle = UE.UResourceLibrary.LoadObjectAsyncWithId(self, TexturePath, {
    self,
    function(self, Texture, ResourceID)
      if not IsValid(self) or nil ~= ResourceID and rawget(self, TaskName) ~= ResourceID then
        return
      end
      cb(Texture)
    end
  })
  if Handle then
    rawset(self, TaskName, Handle.ResourceID)
  end
end

function M:SetRarity(Rarity)
  local DynamicMaterial = self.Item.Item_BG:GetDynamicMaterial()
  DynamicMaterial:SetScalarParameterValue("IconOpacity", 1)
  if not IsValid(DynamicMaterial) then
    DebugPrint("ZDX_DynamicMaterial\228\184\141\229\144\136\230\179\149")
  end
  if not Rarity or Rarity < 1 or Rarity > 6 then
    DynamicMaterial:SetScalarParameterValue("Index", 0)
    return
  end
  DynamicMaterial:SetScalarParameterValue("Index", Rarity)
end

function M:SetWalnutNum(ItemId)
end

function M:BP_OnEntryReleased()
  if self.Content then
    self.Content.SelfWidget = nil
  end
end

function M:OnMouseEnter(MyGeometry, MouseEvent)
  if CommonUtils.GetDeviceTypeByPlatformName(self) == "Mobile" then
    return
  end
  if not self.Content or self.NotInteractive or self.Content.IsSelect or self.Content.IsShowTips or self:IsInAnimationPlaying() then
    return
  end
  if self.OnMouseEnterEvent and self.OnMouseEnterEvent.Callback then
    self.OnMouseEnterEvent.Callback(self.OnMouseEnterEvent.Params)
  end
  self.Item:StopAllAnimations()
  self.Item:PlayAnimation(self.Item.Hover)
end

function M:OnMouseLeave(MyGeometry, MouseEvent)
  if CommonUtils.GetDeviceTypeByPlatformName(self) == "Mobile" then
    return
  end
  if not self.Content or self.NotInteractive or self.Content.IsSelect or self.Content.IsShowTips or self:IsInAnimationPlaying() then
    return
  end
  if self.OnMouseLeaveEvent and self.OnMouseLeaveEvent.Callback then
    self.OnMouseLeaveEvent.Callback(self.OnMouseLeaveEvent.Obj, self.OnMouseLeaveEvent.Params)
  end
  self.bMouseButtonDown = false
  self.Item:StopAllAnimations()
  self.Item:PlayAnimation(self.Item.UnHover)
end

function M:OnMouseButtonDown(MyGeometry, MouseEvent)
  local HandleResult = UWidgetBlueprintLibrary.Unhandled()
  if self.HandleMouseDown then
    HandleResult = UWidgetBlueprintLibrary.Handled()
  end
  if self.NotInteractive or self.IsShowDetails and self.Item.ItemDetails_MenuAnchor.ItemDetailsMenuAnchor:IsOpen() or self:IsInAnimationPlaying() then
    return HandleResult
  end
  self:StopAllAnimations()
  if CommonUtils.GetDeviceTypeByPlatformName(self) == "PC" then
    self.Item:PlayAnimation(self.Item.Press)
  end
  local CanCallBack = true
  if self.OnMouseButtonDownEvent and self.OnMouseButtonDownEvent.Params and self.OnMouseButtonDownEvent.Params.bIgnoreRightMouseDown and UE4.UKismetInputLibrary.PointerEvent_GetEffectingButton(MouseEvent) == UE4.EKeys.RightMouseButton then
    CanCallBack = false
  end
  if self.OnMouseButtonDownEvent and self.OnMouseButtonDownEvent.Callback and CanCallBack then
    self.OnMouseButtonDownEvent.Callback(self.OnMouseButtonDownEvent.Obj, self.OnMouseButtonDownEvent.Params)
  end
  self.bMouseButtonDown = true
  return HandleResult
end

function M:OnMouseButtonUp(MyGeometry, MouseEvent)
  if self.NotInteractive or self:IsInAnimationPlaying() or not self.bMouseButtonDown then
    return UWidgetBlueprintLibrary.Unhandled()
  end
  self.bMouseButtonDown = false
  AudioManager(self):PlayItemSound(self, self.Id, "Click", self.ItemType)
  if not self.bDisableCommonClick then
    if self.ItemType == "Walnut" then
      UIManager(self):LoadUINew("WalnutRewardDialog", self.Id, self.UIName)
      return UWidgetBlueprintLibrary.Handled()
    end
    if self.ItemType == "Skin" or self.ItemType == "WeaponSkin" then
      if DataMgr.SystemUI[self.UIName] and DataMgr.SystemUI[self.UIName].IsBanAccess then
        UIManager(self):ShowUITip("CommonToastMain", GText("UI_COMMONPOP_TITLE_100059"))
        return UWidgetBlueprintLibrary.Handled()
      end
      if not self.Id or not self.ItemType then
        return UWidgetBlueprintLibrary.Handled()
      end
      PageJumpUtils:CloseFrontDialog()
      local Content = {}
      Content.TypeId = self.Id
      Content.ItemType = self.ItemType
      Content.SinglePreview = true
      Content.HidePurchase = true
      UIManager(self):LoadUINew("SkinPreview", Content, self.ParentWidget)
      return UWidgetBlueprintLibrary.Handled()
    end
  end
  if self.IsShowDetails and not self.OwningList then
    if self.Item.ItemDetails_MenuAnchor.ItemDetailsMenuAnchor:IsOpen() then
      return UWidgetBlueprintLibrary.Unhandled()
    end
    self:OpenItemMenu()
  end
  if not self.IsShowDetails then
    self.Item:PlayAnimation(self.Item.Click)
  end
  self.Item:PlayAnimation(self.Item.Click)
  if self.OnMouseButtonUpEvent then
    for Obj, Callback in pairs(self.OnMouseButtonUpEvent) do
      if self.OnMouseButtonUpEventParam[Obj] then
        Callback(Obj, table.unpack(self.OnMouseButtonUpEventParam[Obj]))
      else
        Callback(Obj)
      end
    end
  end
  return UWidgetBlueprintLibrary.Unhandled()
end

function M:OnTouchEnded(MyGeometry, TouchEvent)
  return self:OnMouseButtonUp(MyGeometry, TouchEvent)
end

function M:OnTouchStarted(MyGeometry, TouchEvent)
  return self:OnMouseButtonDown(MyGeometry, TouchEvent)
end

function M:BindEventOnMouseButtonUp(Obj, Callback, Params)
  if not self.OnMouseButtonUpEvent then
    self.OnMouseButtonUpEvent = {}
    self.OnMouseButtonUpEventParam = {}
  end
  self.OnMouseButtonUpEvent[Obj] = Callback
  self.OnMouseButtonUpEventParam[Obj] = Params
end

function M:ClearEventOnMouseButtonUp(Obj)
  if not self.OnMouseButtonUpEvent then
    return
  end
  self.OnMouseButtonUpEvent[Obj] = nil
  self.OnMouseButtonUpEventParam[Obj] = nil
end

function M:RemoveAllEvent()
  self.OnMouseButtonUpEvent = {}
  self.OnMouseButtonUpEventParam = {}
end

function M:OnFocusReceived(MyGeometry, InFocusEvent)
  if self.OnFocusReceivedEvent then
    local Obj = self.OnFocusReceivedEvent.Obj
    local Callback = self.OnFocusReceivedEvent.Callback
    Callback(Obj)
  end
  return M.Super.OnFocusReceived(self, MyGeometry, InFocusEvent)
end

function M:OnAddedToFocusPath(InFocusEvent)
  if self.OnAddedToFocusPathEvent then
    local Obj = self.OnAddedToFocusPathEvent.Obj
    local Callback = self.OnAddedToFocusPathEvent.Callback
    local Params = self.OnAddedToFocusPathEvent.Params
    Callback(Obj, Params)
  end
end

function M:OnRemovedFromFocusPath(InFocusEvent)
  if self.OnRemovedFromFocusPathEvent then
    local Obj = self.OnRemovedFromFocusPathEvent.Obj
    local Callback = self.OnRemovedFromFocusPathEvent.Callback
    local Params = self.OnRemovedFromFocusPathEvent.Params
    Callback(Obj, Params)
  end
end

function M:Construct()
  M.Super.Construct(self)
  self.WidgetMap = {}
  self.Item.ItemDetails_MenuAnchor.ItemDetailsMenuAnchor.OnMenuOpenChanged:Add(self, self.OnMenuOpenChanged)
end

function M:Destruct()
  self.Item.ItemDetails_MenuAnchor.ItemDetailsMenuAnchor.OnMenuOpenChanged:Remove(self, self.OnMenuOpenChanged)
  for TaskName, _ in pairs(self.ComItemAsyncTasks or {}) do
    ForceStopAsyncTask(self, TaskName)
  end
  self.ComItemAsyncTasks = nil
  self.bMaxHeight = nil
  M.Super.Destruct(self)
end

function M:OnMenuOpenChanged(bIsOpen)
  self.Content.IsShowTips = bIsOpen
  self.Content.IsSelect = bIsOpen
  if self.Event_OnMenuOpenChanged then
    self.Event_OnMenuOpenChanged(self.Obj, bIsOpen, self.Content)
  end
end

function M:BindEventOnMenuOpenChanged(Obj, Callback)
  if not Obj or not Callback then
    return
  end
  local Event = {}
  Event.OnMenuOpenChanged = Callback
  self:BindEvents(Obj, Event)
end

function M:BindEvents(Obj, Events)
  Events = Events or {}
  self.Obj = Obj
  self.Event_OnMenuOpenChanged = Events.OnMenuOpenChanged
end

function M:AddWidgetToNode(Widget)
  if not self.Node_Widget or not Widget then
    return
  end
  if not self.WidgetMap then
    self.WidgetMap = {}
  end
  if self.WidgetMap[Widget] == nil then
    local Slot = self.Node_Widget:AddChild(Widget)
    Slot:SetVerticalAlignment(EVerticalAlignment.HAlign_Fill)
    Slot:SetHorizontalAlignment(EHorizontalAlignment.HAlign_Fill)
  end
  Widget:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  self.WidgetMap[Widget] = true
end

function M:RemoveWidgetFromNode(Widget, bForce)
  if not self.Node_Widget or not Widget then
    return
  end
  if self.bDontRemoveSubWidget and not bForce then
    Widget:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.WidgetMap[Widget] = true
  else
    if self.WidgetMap[Widget] then
      Widget:RemoveFromParent()
    end
    self.WidgetMap[Widget] = nil
  end
end

function M:InitCompView()
  self:InitCommonView()
  self.OwningList = UE4.UUserListEntryLibrary.GetOwningListView(self)
  if self.OwningList then
    self.OwningList.BP_OnItemClicked:Remove(self, self.OnOwningListItemClicked)
    self.OwningList.BP_OnItemClicked:Add(self, self.OnOwningListItemClicked)
  end
end

function M:OnOwningListItemClicked(Content)
  if Content ~= self.Content or self.NotInteractive then
    return
  end
  if self.IsShowDetails then
    self:OpenItemMenu()
  end
end

function M:OpenItemMenu()
  if self.Item.ItemDetails_MenuAnchor.ItemDetailsMenuAnchor:IsOpen() then
    return
  end
  local Content = {
    ItemType = self.ItemType,
    ItemId = self.Id,
    Uuid = self.Uuid,
    MenuPlacement = self.MenuPlacement,
    UIName = self.UIName,
    bShowAccess = self.bShowAccess,
    bCustomStype = self.bCustomStype,
    KeyDownEvent = self.ItemDetailKeyDownEvent,
    HandleKeyDown = self.ItemDetailHandleKeyDown,
    bHideGamePad = self.bHideGamePad,
    JumpReturnCallBack = self.JumpReturnCallBack
  }
  self.Item.ItemDetails_MenuAnchor:OpenItemDetailsWidget(false, Content)
  if self.Item.ItemDetails_MenuAnchor.CommonItemDetails then
    self.Item.ItemDetails_MenuAnchor.CommonItemDetails:InitButtonEvent(self.ItemDetailsButton02EventInfo)
    self.Item.ItemDetails_MenuAnchor.CommonItemDetails:InitButton01Event(self.ItemDetailsButton01EventInfo)
    self.Item.ItemDetails_MenuAnchor.CommonItemDetails:InitLockedEvent(self.ItemDetailsLockEventInfo)
  end
end

function M:PlayInAnimation()
end

function M:IsInAnimationPlaying()
end

function M:OnAnimationFinished(InAnimation)
  if InAnimation ~= self.Click or not self.NotInteractive then
  end
end

function M:SetSelected(IsSelected)
  if self.NotInteractive then
    return
  end
  if self.Content then
    self.Content.IsSelect = IsSelected
  end
  self.Item:StopAllAnimations()
  if IsSelected then
    self.Item:PlayAnimation(self.Item.Click)
  else
    self.Item:PlayAnimation(self.Item.Normal)
  end
end

function M:SetIsGot(IsGot)
  local function Callback(Coroutine)
    self.Content.bHasGot = IsGot
    
    if IsGot then
      if not self.WidgetMap[self.IsGotWidget] then
        self.IsGotWidget = self:CreateWidgetAsync("ComItemHasGot", CoroutineObj)
      end
      self:AddWidgetToNode(self.IsGotWidget)
    elseif self.WidgetMap[self.IsGotWidget] then
      self:RemoveWidgetFromNode(self.IsGotWidget)
    end
  end
  
  if IsGot then
    self:AsyncLoadWidgetCommon("IsGotWidget", "SetIsGotTask", Callback)
  else
    Callback()
  end
end

function M:SetIsCanGet(IsCanGet, StyleStr)
  local function Callback(CoroutineObj)
    self.Content.bCanGet = IsCanGet
    
    self.Content.CanGetStyle = StyleStr
    if IsCanGet then
      if not self.WidgetMap[self.CanGetWidget] then
        self.CanGetWidget = self:CreateWidgetAsync("ComItemCanGet", CoroutineObj)
      end
      self:AddWidgetToNode(self.CanGetWidget)
      self.CanGetWidget:SetStyle(StyleStr)
    elseif self.WidgetMap[self.CanGetWidget] then
      self:RemoveWidgetFromNode(self.CanGetWidget)
    end
  end
  
  if IsCanGet then
    self:AsyncLoadWidgetCommon("CanGetWidget", "SetIsCanGetTack", Callback)
  else
    Callback()
  end
end

function M:SetLock(LockType)
  self:AsyncLoadWidgetCommon(nil, "SetLockTack", function(CoroutineObj)
    if 1 ~= LockType then
      self:RemoveGroupWidget("ComItemLock")
    end
    if self.WidgetMap[self.LockedCenterWidget] and 2 ~= LockType then
      self:RemoveWidgetFromNode(self.LockedCenterWidget)
    end
    if 1 == LockType then
      self.LockedRightWidget = self:GetOrCreateGroupWidget("ComItemLock", CoroutineObj)
    elseif 2 == LockType then
      if not self.LockedCenterWidget then
        self.LockedCenterWidget = self:CreateWidgetAsync("ComItemLockCenter", CoroutineObj)
      end
      self:AddWidgetToNode(self.LockedCenterWidget)
    end
  end)
end

function M:SetCount(Count, NeedCount, MaxCount, bNotCountFormat, bShowNotHaveStyle)
  local function Callback(CoroutineObj)
    if self.WidgetMap[self.CountWidget] then
      self:RemoveWidgetFromNode(self.CountWidget, true)
      
      self:ClearBackGroundHeight(true)
    end
    if DataMgr.RewardType[self.ItemType] and DataMgr.RewardType[self.ItemType].UniqueType then
      return
    end
    if not Count then
      self:ClearBackGroundHeight(true)
      return
    end
    local bCountFormat = not bNotCountFormat
    if NeedCount then
      self.CountWidget = self:CreateWidgetAsync("ComItemNeedCount", CoroutineObj)
      self.CountWidget.Text_Hold:SetText(FormatNumber(Count, bCountFormat))
      self.CountWidget.Text_Total:SetText("/" .. tostring(FormatNumber(NeedCount, bCountFormat)))
      if Count >= NeedCount then
        self.CountWidget.Text_Hold:SetColorAndOpacity(UE4.UUIFunctionLibrary.StringToSlateColor("FFFFFFFF"))
      else
        self.CountWidget.Text_Hold:SetColorAndOpacity(UE4.UUIFunctionLibrary.StringToSlateColor("D82E30FF"))
      end
    elseif MaxCount then
      self.CountWidget = self:CreateWidgetAsync("ComItemNumber", CoroutineObj)
      local NumStr = FormatNumber(Count, bCountFormat)
      NumStr = NumStr .. "~" .. FormatNumber(MaxCount, bCountFormat)
      self.CountWidget.Text_Num:SetText(NumStr)
    elseif Count then
      self.CountWidget = self:CreateWidgetAsync("ComItemNumber", CoroutineObj)
      local NumStr = FormatNumber(Count, bCountFormat)
      self.CountWidget.Text_Num:SetText(NumStr)
      if self.CountTextRed then
        self.CountWidget.Text_Num:SetColorAndOpacity(UE4.UUIFunctionLibrary.StringToSlateColor("D82E30FF"))
      end
    end
    if bShowNotHaveStyle and Count <= 0 then
      self:SetItemGreyStyle(self.CountWidget, true)
    else
      self:SetItemGreyStyle(self.CountWidget, false)
    end
    if not (self.ItemType == "Walnut" and self.Count) or self.Count > 0 then
      self:AddWidgetToNode(self.CountWidget)
    else
      self:SetItemGreyStyle(self.CountWidget, true)
    end
    self:AddDelayFrameFunc(function()
      self:AdjustBackGroundHeight(self.CountWidget, "SetCount  " .. Count)
    end)
  end
  
  if self.bAllUseAsyncLoadWidget then
    self:AsyncLoadWidgetCommon(nil, "SetCountTask", Callback)
  else
    Callback()
  end
end

function M:SetBonus(BonusType, ExtraText)
  self:AsyncLoadWidgetCommon(nil, "SetBonusTask", function(CoroutineObj)
    if self.WidgetMap[self.BonusWidget] then
      self:RemoveWidgetFromNode(self.BonusWidget)
    end
    if not BonusType or 0 == BonusType then
      return
    end
    if 1 == BonusType then
      self.BonusWidget = self:CreateWidgetAsync("ComItemBonus", CoroutineObj)
      if not ExtraText then
        ExtraText = GText("UI_Reward_Bonus")
      end
      self.BonusWidget.Text_Bonus:SetText(ExtraText)
    elseif 2 == BonusType then
      self.BonusWidget = self:CreateWidgetAsync("ComItemBonus", CoroutineObj)
      if not ExtraText then
        ExtraText = GText("UI_Dungeon_First_Reward_Tag")
      end
      self.BonusWidget.Text_Bonus:SetText(ExtraText)
    elseif 3 == BonusType then
      self.BonusWidget = self:CreateWidgetAsync("ComItemWalnutTag", CoroutineObj)
    end
    self:AddWidgetToNode(self.BonusWidget)
  end)
end

function M:SetName(Name)
  self:AsyncLoadWidgetCommon("NameWidget", "SetNameTask", function(CoroutineObj)
    if Name then
      if not self.WidgetMap[self.NameWidget] then
        self.NameWidget = self:CreateWidgetAsync("ComItemName", CoroutineObj)
      end
      if type(Name) == "number" then
        self.NameWidget.Text_Name:SetText(Name)
      else
        self.NameWidget.Text_Name:SetText(GText(Name))
      end
      self:AddWidgetToNode(self.NameWidget)
      self:AdjustBackGroundHeight(self.NameWidget, "SetName   " .. Name)
    elseif self.WidgetMap[self.NameWidget] then
      self:RemoveWidgetFromNode(self.NameWidget)
      self:ClearBackGroundHeight(true)
    end
  end)
end

function M:SetLevel(Level)
  local function Callback(CoroutineObj)
    if Level then
      if not self.WidgetMap[self.LevelWidget] then
        self.LevelWidget = self:CreateWidgetAsync("ComItemLevel", CoroutineObj)
      end
      self.LevelWidget.Text_Lv:SetText(Level)
      self.LevelWidget:SetVisibility(UIConst.VisibilityOp.Visible)
      self:AdjustBackGroundHeight(self.LevelWidget, "SetLevel  " .. Level)
      self:AddWidgetToNode(self.LevelWidget)
    elseif self.WidgetMap[self.LevelWidget] then
      self:RemoveWidgetFromNode(self.LevelWidget)
      self:ClearBackGroundHeight(true)
    end
  end
  
  if self.bAllUseAsyncLoadWidget then
    self:AsyncLoadWidgetCommon("LevelWidget", "SetLevelTask", Callback)
  else
    Callback()
  end
end

function M:SetRedDot(RedDotType)
  self:AsyncLoadWidgetCommon(nil, "SetRedDotTask", function(CoroutineObj)
    if self.WidgetMap[self.ComItemReddot] then
      self:RemoveWidgetFromNode(self.ComItemReddot)
    end
    if self.WidgetMap[self.ComItemNewReddot] then
      self:RemoveWidgetFromNode(self.ComItemNewReddot)
    end
    if RedDotType == UIConst.RedDotType.CommonRedDot then
      if not self.ComItemReddot then
        self.ComItemReddot = self:CreateWidgetAsync("ComItemReddot", CoroutineObj)
      end
      self:AddWidgetToNode(self.ComItemReddot)
      self:CheckWidgetIsTop(self.ComItemReddot)
    elseif RedDotType == UIConst.RedDotType.NewRedDot then
      if not self.ComItemNewReddot then
        self.ComItemNewReddot = self:CreateWidgetAsync("ComItemNewReddot", CoroutineObj)
      end
      self:AddWidgetToNode(self.ComItemNewReddot)
      self:CheckWidgetIsTop(self.ComItemNewReddot)
    elseif RedDotType == UIConst.RedDotType.GreyRedDot then
      if not self.ComItemReddot then
        self.ComItemReddot = self:CreateWidgetAsync("ComItemReddot", CoroutineObj)
      end
      self.ComItemReddot:EMShowReddot(true, EReddotType.Gray, 0)
      self:AddWidgetToNode(self.ComItemReddot)
      self:CheckWidgetIsTop(self.ComItemReddot)
    end
  end)
end

function M:SetShadow(bShadow)
  self:AsyncLoadWidgetCommon(nil, "SetShadowTask", function(CoroutineObj)
    if bShadow then
      if not self.WidgetMap[self.ShadowWidget] then
        self.ShadowWidget = self:CreateWidgetAsync("ComItemShadow", CoroutineObj)
      end
      self:AddWidgetToNode(self.ShadowWidget)
    elseif self.WidgetMap[self.ShadowWidget] then
      self:RemoveWidgetFromNode(self.ShadowWidget)
    end
  end)
end

function M:SetOutline(bOutline)
  self.Item:SetIconShadow(bOutline)
end

function M:SetAdd(bAdd)
  if bAdd then
    local function Callback(CoroutineObj)
      local DynamicMaterial = self.Item.Item_BG:GetDynamicMaterial()
      
      self:SetRarity(0)
      DynamicMaterial:SetScalarParameterValue("IconOpacity", 0)
      self.Item.WidgetSwitcher_State:SetActiveWidgetIndex(0)
      if not self.AddWidget then
        self.AddWidget = self:CreateWidgetAsync("ComItemAdd", CoroutineObj)
      end
      self:AddWidgetToNode(self.AddWidget)
      self:ClearBackGroundHeight(true)
    end
    
    if self.bAllUseAsyncLoadWidget then
      self:AsyncLoadWidgetCommon(nil, "SetAddTask", Callback)
    else
      Callback()
    end
  end
end

function M:SetSelectNum(SelectNeedCount, SelectTotalCount)
  local function Callback(CoroutineObj)
    if SelectNeedCount or SelectTotalCount then
      if not self.WidgetMap[self.SelectCountWidget] then
        self.SelectCountWidget = self:CreateWidgetAsync("ComItemSelectCount", CoroutineObj)
      end
      self.SelectCountWidget.Text_Hold:SetText(SelectNeedCount)
      self.SelectCountWidget.Text_Total:SetText(SelectTotalCount)
      self:AddWidgetToNode(self.SelectCountWidget)
      if not SelectNeedCount or not SelectTotalCount then
        self.SelectCountWidget.Split_1:SetVisibility(ESlateVisibility.Collapsed)
      else
        self.SelectCountWidget.Split_1:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
      end
    elseif self.WidgetMap[self.SelectCountWidget] then
      self:RemoveWidgetFromNode(self.SelectCountWidget)
    end
  end
  
  if self.bAllUseAsyncLoadWidget then
    self:AsyncLoadWidgetCommon("SelectCountWidget", "SetSelectNumTask", Callback)
  else
    Callback()
  end
end

function M:SetWeaponPhantomIcon(Uuid)
  self:AsyncLoadWidgetCommon(nil, "SetWeaponPhantomIconTask", function(CoroutineObj)
    if self.WidgetMap[self.PhantomTagWidget] then
      self:RemoveWidgetFromNode(self.PhantomTagWidget)
    end
    if not Uuid then
      return
    end
    local Avatar = GWorld:GetAvatar()
    if Uuid and type(Uuid) == "string" and not CommonUtils.IsObjId(Uuid) then
      Uuid = CommonUtils.Str2ObjId(Uuid)
    end
    local Weapon = Uuid and Avatar.Weapons[Uuid]
    local AssisterId = Weapon and Weapon.AssisterId
    if AssisterId and DataMgr.Resource[AssisterId] then
      self.PhantomTagWidget = self:CreateWidgetAsync("ComItemPhantomTag", CoroutineObj)
      self.PhantomTagWidget.Switch_Type:SetActiveWidgetIndex(1)
      local CharId = DataMgr.Resource[AssisterId].UseParam
      self:LoadTextureAsync(UIUtils.GetCharMiniIconPath(CharId), function(Texture)
        self.PhantomTagWidget.Img_Role:SetBrushFromTexture(Texture)
      end, "SetWeaponPhantomIcon_LoadIcon")
      self:AddWidgetToNode(self.PhantomTagWidget)
    end
  end)
end

function M:SetWeaponMiniPhantomIcon(CharId)
  self:AsyncLoadWidgetCommon(nil, "SetWeaponMiniPhantomIconTask", function(CoroutineObj)
    if self.WidgetMap[self.PhantomTagWidget] then
      self:RemoveWidgetFromNode(self.PhantomTagWidget)
    end
    if CharId then
      self.PhantomTagWidget = self:CreateWidgetAsync("ComItemPhantomTag", CoroutineObj)
      self.PhantomTagWidget.Switch_Type:SetActiveWidgetIndex(1)
      self:LoadTextureAsync(UIUtils.GetCharMiniIconPath(CharId), function(Texture)
        self.PhantomTagWidget.Img_Role:SetBrushFromTexture(Texture)
      end, "SetWeaponMiniPhantomIcon_LoadIcon")
      self:AddWidgetToNode(self.PhantomTagWidget)
    end
  end)
end

function M:SetItemGreyStyle(NumWidget, bShowGrey)
  if bShowGrey then
    NumWidget:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self:SetRenderOpacity(0.6)
  else
    NumWidget:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    self:SetRenderOpacity(1.0)
  end
end

function M:SetItemConflict(bConflict)
  self:_SetItemConflictImpl(bConflict, GText("UI_Armory_Conflict"))
end

function M:_SetItemConflictImpl(bConflict, Text)
  local function Callback(CoroutineObj)
    if bConflict then
      if not self.WidgetMap[self.ConflictWidget] then
        self.ConflictWidget = self:CreateWidgetAsync("ComItemConflict", Coroutine)
      end
      self.ConflictWidget.Text_SoldOut:SetText(Text)
      self:AddWidgetToNode(self.ConflictWidget)
    elseif self.WidgetMap[self.ConflictWidget] then
      self:RemoveWidgetFromNode(self.ConflictWidget)
    end
  end
  
  if self.bAllUseAsyncLoadWidget then
    self:AsyncLoadWidgetCommon("ConflictWidget", "SetItemConflictTask", Callback)
  else
    Callback()
  end
end

function M:SetItemSold(bSold)
  self:AsyncLoadWidgetCommon("SoldWidget", "SetItemSoldTask", function(CoroutineObj)
    if bSold then
      if not self.WidgetMap[self.SoldWidget] then
        self.SoldWidget = self:CreateWidgetAsync("ComItemConflict", CoroutineObj)
      end
      self.SoldWidget.Text_SoldOut:SetText(GText("UI_Fishing_BuyFishingLure"))
      self:AddWidgetToNode(self.SoldWidget)
    elseif self.WidgetMap[self.SoldWidget] then
      self:RemoveWidgetFromNode(self.SoldWidget)
    end
  end)
end

function M:SetItemMinus(bMinus)
  local function Callback(CoroutineObj)
    if bMinus then
      if not self.WidgetMap[self.MinusWidget] then
        self.MinusWidget = self:CreateWidgetAsync("ComItemMinus", CoroutineObj)
      end
      self:AddWidgetToNode(self.MinusWidget)
    elseif self.WidgetMap[self.MinusWidget] then
      self:RemoveWidgetFromNode(self.MinusWidget, true)
    end
  end
  
  if self.bAllUseAsyncLoadWidget then
    self:AsyncLoadWidgetCommon("MinusWidget", "SetItemMinusTask", Callback)
  else
    Callback()
  end
end

function M:SetItemMoney(CurrencyId, CurrencyNum)
  local function Callback(CoroutineObj)
    if CurrencyId and CurrencyNum then
      self.MoneyWidget = self:GetOrCreateGroupWidget("ComItemMoney", CoroutineObj)
      
      self:LoadTextureAsync(DataMgr.Resource[CurrencyId].Icon, function(Texture)
        self.MoneyWidget.Img_Coin:SetBrushResourceObject(Texture)
        self.MoneyWidget.Text_Cost:SetText(CurrencyNum)
      end, "SetItemMoney_LoadIcon")
    else
      self:RemoveGroupWidget("ComItemMoney")
    end
  end
  
  if self.bAllUseAsyncLoadWidget then
    self:AsyncLoadWidgetCommon("MoneyWidget", "SetItemMoneyTask", Callback)
  else
    Callback()
  end
end

function M:SetItemSelect(bSelect)
  local function Callback(CoroutineObj)
    if bSelect then
      if not self.WidgetMap[self.SelectWidget] then
        self.SelectWidget = self:CreateWidgetAsync("ComItemSelect", CoroutineObj)
      end
      self:AddWidgetToNode(self.SelectWidget)
    elseif self.WidgetMap[self.SelectWidget] then
      self:RemoveWidgetFromNode(self.SelectWidget)
    end
  end
  
  if self.bAllUseAsyncLoadWidget then
    self:AsyncLoadWidgetCommon("SelectWidget", "SetItemSelectTask", Callback)
  else
    Callback()
  end
end

function M:SetItemSet(bSet, TipText)
  self:AsyncLoadWidgetCommon("SetWidget", "SetItemSetTask", function(CoroutineObj)
    if bSet then
      if not self.WidgetMap[self.SetWidget] then
        self.SetWidget = self:CreateWidgetAsync("ComItemSet", CoroutineObj)
      end
      self:AddWidgetToNode(self.SetWidget)
      self.SetWidget.TipText:SetText(TipText or GText("UI_SHOWNPC_SETTLED"))
    elseif self.WidgetMap[self.SetWidget] then
      self:RemoveWidgetFromNode(self.SetWidget)
    end
  end)
end

function M:SetItemUnrevealed(bUnrevealed)
  self:AsyncLoadWidgetCommon("UnrevealedWidget", "SetItemUnrevealedTask", function(CoroutineObj)
    if bUnrevealed then
      if not self.WidgetMap[self.UnrevealedWidget] then
        self.UnrevealedWidget = self:CreateWidgetAsync("ComItemUnreveal", CoroutineObj)
      end
      self:AddWidgetToNode(self.UnrevealedWidget)
    elseif self.WidgetMap[self.UnrevealedWidget] then
      self:RemoveWidgetFromNode(self.UnrevealedWidget)
    end
  end)
end

function M:SetItemLevelCard(LevelCardNum)
  self:AsyncLoadWidgetCommon("LevelCardWidget", "SetItemLevelCardTask", function(CoroutineObj)
    if LevelCardNum then
      self.LevelCardWidget = self:GetOrCreateGroupWidget("ComItemCardLevel", CoroutineObj)
      self.LevelCardWidget.Text_Level:SetText(LevelCardNum)
      local CardLevelData = DataMgr.WeaponCardLevel[self.Id]
      if CardLevelData and LevelCardNum >= CardLevelData.CardLevelMax then
        self.LevelCardWidget:SetMaxGradeLevelColor()
      else
        self.LevelCardWidget:SetNormalGradeLevelColor()
      end
    else
      self:RemoveGroupWidget("ComItemCardLevel")
    end
  end)
end

function M:SetItemStartLevel(StartLevelNum)
  self:AsyncLoadWidgetCommon("StartLevelWidget", "SetItemStartLevelTask", function(CoroutineObj)
    if StartLevelNum then
      self.StartLevelWidget = self:GetOrCreateGroupWidget("ComItemStartLevel", CoroutineObj)
      self.StartLevelWidget.Text_StarLevel:SetText(StartLevelNum)
    else
      self:RemoveGroupWidget("ComItemStartLevel")
    end
  end)
end

function M:SetPhantomWeaponIcon(UnitId, IsPhantom)
  local function Callback(CoroutineObj)
    if IsPhantom then
      if not self.WidgetMap[self.PhantomWidget] then
        self.PhantomWidget = self:CreateWidgetAsync("ComItemPhantomTag", CoroutineObj)
      end
      local Avatar = GWorld:GetAvatar()
      local resource = Avatar.Resources[UnitId]
      local WeaponUuid = resource and resource.WeaponUuid
      local IconPath = "/Game/UI/Texture/Static/Atlas/Armory/T_Armory_ArmedPhantom.T_Armory_ArmedPhantom"
      if WeaponUuid then
        local Weapon = Avatar.Weapons[WeaponUuid]
        if Weapon then
          IconPath = DataMgr.Weapon[Weapon.WeaponId].Icon
        end
      end
      self:LoadTextureAsync(IconPath, function(IconImage)
        self.PhantomWidget.Img_Phantom_On:SetBrushResourceObject(IconImage)
      end, "SetPhantomWeaponIcon_LoadIcon")
      self:AddWidgetToNode(self.PhantomWidget)
    elseif self.WidgetMap[self.PhantomWidget] then
      self:RemoveWidgetFromNode(self.PhantomWidget)
    end
  end
  
  if self.bAllUseAsyncLoadWidget then
    self:AsyncLoadWidgetCommon("PhantomWidget", "SetPhantomWeaponIconTask", Callback)
  else
    Callback()
  end
end

function M:SetAttrIcon(AttrIcon)
  self:AsyncLoadWidgetCommon("AttrIconWidget", "SetAttrIconTask", function(CoroutineObj)
    if AttrIcon then
      if not self.WidgetMap[self.AttrIconWidget] then
        self.AttrIconWidget = self:CreateWidgetAsync("ComItemAttributeTag", CoroutineObj)
      end
      if type(AttrIcon) == "string" then
        self:LoadTextureAsync(AttrIcon, function(Texture)
          self.AttrIconWidget.Attribute:SetBrushResourceObject(Texture)
        end, "SetAttrIcon_LoadIcon")
      else
        self.AttrIconWidget.Attribute:SetBrushResourceObject(AttrIcon)
      end
      self:AddWidgetToNode(self.AttrIconWidget)
    elseif self.WidgetMap[self.AttrIconWidget] then
      self:RemoveWidgetFromNode(self.AttrIconWidget)
    end
  end)
end

function M:SetTeamIcon(TeamIdx, CharId)
  self:AsyncLoadWidgetCommon(nil, "SetTeamIconTask", function(CoroutineObj)
    if not TeamIdx then
      if self.WidgetMap[self.TeamWidget] then
        self:RemoveWidgetFromNode(self.TeamWidget)
      end
      if self.WidgetMap[self.TeamCharWidget] then
        self:RemoveWidgetFromNode(self.TeamCharWidget)
      end
      self.Content.TeamIdx = nil
      self.Content.TeamCharId = nil
      return
    end
    if not CharId then
      if self.WidgetMap[self.TeamCharWidget] then
        self:RemoveWidgetFromNode(self.TeamCharWidget)
      end
    else
      if not self.WidgetMap[self.TeamCharWidget] then
        self.TeamCharWidget = self:CreateWidgetAsync("ComItemPhantomTag", CoroutineObj)
      end
      self.TeamCharWidget.Switch_Type:SetActiveWidgetIndex(1)
      local MiniIconPath = "Texture2D'/Game/UI/Texture/Dynamic/Image/Head/Mini/"
      local PhantomGuideIconImg = "T_Normal_" .. DataMgr.BattleChar[CharId].GuideIconImg
      local IconPath = MiniIconPath .. PhantomGuideIconImg .. "." .. PhantomGuideIconImg .. "'"
      self:LoadTextureAsync(IconPath, function(Texture)
        self.TeamCharWidget.Img_Role:SetBrushResourceObject(Texture)
      end, "SetTeamIcon_LoadIcon")
      self:AddWidgetToNode(self.TeamCharWidget)
    end
    if not self.WidgetMap[self.TeamWidget] then
      self.TeamWidget = self:CreateWidgetAsync("ComItemAbyssTeam", CoroutineObj)
    end
    local Color = self.TeamWidget["Color_BG_" .. TeamIdx]
    if Color then
      self.TeamWidget.BG:SetColorAndOpacity(Color)
    end
    self:AddWidgetToNode(self.TeamWidget)
  end)
end

function M:SetRareTag(bRare)
  self:AsyncLoadWidgetCommon("RareWidget", "SetRareTagTask", function(CoroutineObj)
    if bRare then
      if not self.WidgetMap[self.RareWidget] then
        self.RareWidget = self:CreateWidgetAsync("ComItemRareTag", CoroutineObj)
      end
      self:AddWidgetToNode(self.RareWidget)
    elseif self.WidgetMap[self.RareWidget] then
      self:RemoveWidgetFromNode(self.RareWidget)
    end
  end)
end

function M:SetInGear(bInGear)
  self:AsyncLoadWidgetCommon("InGearWidget", "SetInGearTask", function(CoroutineObj)
    if bInGear then
      if not self.WidgetMap[self.InGearWidget] then
        self.InGearWidget = self:CreateWidgetAsync("ComItemInGear", CoroutineObj)
      end
      self:AddWidgetToNode(self.InGearWidget)
    elseif self.WidgetMap[self.InGearWidget] then
      self:RemoveWidgetFromNode(self.InGearWidget)
    end
  end)
end

function M:SetTryOutText(TryOutText)
  self:AsyncLoadWidgetCommon("TryOutWidget", "SetTryOutTextTask", function(CoroutineObj)
    if TryOutText then
      if not self.WidgetMap[self.TryOutWidget] then
        self.TryOutWidget = self:CreateWidgetAsync("ComItemTryOut", CoroutineObj)
        self:AddWidgetToNode(self.TryOutWidget)
      end
      self.TryOutWidget.TipText:SetTexT(GText(TryOutText))
      self:AddWidgetToNode(self.TryOutWidget)
    else
      self:RemoveWidgetFromNode(self.TryOutWidget)
    end
  end)
end

function M:SetPetPremium(bPremium)
  local function Callback(CoroutineObj)
    if not self.Item then
      DebugPrint(ErrorTag, "SetPetPremium::\230\178\161\230\156\137Item\230\142\167\228\187\182\228\184\141\231\172\166\229\144\136\233\128\154\231\148\168\233\129\147\229\133\183\230\161\134\231\187\147\230\158\132")
      
      return
    end
    local DynamicMat = self.Item.Item_BG:GetDynamicMaterial()
    if bPremium then
      DynamicMat:SetScalarParameterValue("Colorful_Alpha", self.Item.Colorful_Pet)
      if not self.WidgetMap[self.PetRareWidget] then
        self.PetRareWidget = self:CreateWidgetAsync("ComItemPetRare", CoroutineObj)
      end
      self:AddWidgetToNode(self.PetRareWidget)
    else
      DynamicMat:SetScalarParameterValue("Colorful_Alpha", self.Item.Colorful_Normal)
    end
  end
  
  self:AsyncLoadWidgetCommon("PetRareWidget", "SetPetPremiumTask", Callback)
end

local USE_ASYNC = false

function M:AsyncLoadWidgetCommon(WidgetName, TaskName, Callback)
  if not self.ComItemAsyncTasks then
    self.ComItemAsyncTasks = {}
  end
  if USE_ASYNC and (not (WidgetName and self.WidgetMap[self[WidgetName]]) or not IsValid(self[WidgetName])) then
    self.ComItemAsyncTasks[TaskName] = 1
    ForceStopAsyncTask(self, TaskName)
    
    local function CallbackWrapper(CoroutineObj)
      Callback(CoroutineObj)
      self.ComItemAsyncTasks[TaskName] = nil
    end
    
    RunAsyncTask(self, TaskName, CallbackWrapper)
  else
    Callback()
  end
end

function M:SetPetEntryId(PetEntries)
  local function Callback(CoroutineObj)
    if PetEntries then
      if not self.WidgetMap[self.PetEntryIdWidget] then
        self.PetEntryIdWidget = self:CreateWidgetAsync("ComItemPetEntry", CoroutineObj)
      end
      self:AddWidgetToNode(self.PetEntryIdWidget)
      if self.PetEntryIdWidget then
        if type(PetEntries) == "number" then
          self.PetEntryIdWidget.WBP_Armory_Pet_EntryTag:InitByPetEntryId(PetEntries)
          for _, OtherWidget in pairs(self.PetEntryIdWidget.Panel_PetEntryTag:GetAllChildren()) do
            if OtherWidget ~= self.PetEntryIdWidget.WBP_Armory_Pet_EntryTag then
              OtherWidget:SetVisibility(UIConst.VisibilityOp.Collapsed)
            end
          end
        else
          local Len = #PetEntries
          for i, PetEntryId in pairs(PetEntries) do
            if i > self.PetEntryIdWidget.Panel_PetEntryTag:GetChildrenCount() then
              local NewEntryTag = self:CreateWidgetAsync(nil, CoroutineObj, "/Game/UI/WBP/Armory/Widget/Pet/WBP_Armory_Pet_EntryTag.WBP_Armory_Pet_EntryTag")
              self.PetEntryIdWidget.Panel_PetEntryTag:AddChild(NewEntryTag)
            end
            local EntryTag = self.PetEntryIdWidget.Panel_PetEntryTag:GetChildAt(i - 1)
            EntryTag:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
            EntryTag:InitByPetEntryId(PetEntryId, Len > 1)
          end
          for i = Len, self.PetEntryIdWidget.Panel_PetEntryTag:GetChildrenCount() - 1 do
            local OtherWidget = self.PetEntryIdWidget.Panel_PetEntryTag:GetChildAt(i)
            OtherWidget:SetVisibility(UIConst.VisibilityOp.Collapsed)
          end
        end
      end
      if self:IsExistTimer(self.AdjustBGTimer) then
        self:RemoveTimer(self.AdjustBGTimer)
      end
      self:DefaultBackGroundHeight()
    else
      self:RemoveWidgetFromNode(self.PetEntryIdWidget)
      self:ClearBackGroundHeight(true)
    end
  end
  
  self:AsyncLoadWidgetCommon("PetEntryIdWidget", "SetPetEntryIdTask", Callback)
end

function M:SetPetStarLevel(PetStarLevel)
  local function Callback(CoroutineObj)
    if not self.Item then
      DebugPrint(ErrorTag, "SetPetStarLevel::\230\178\161\230\156\137Item\230\142\167\228\187\182\228\184\141\231\172\166\229\144\136\233\128\154\231\148\168\233\129\147\229\133\183\230\161\134\231\187\147\230\158\132")
      
      return
    end
    if PetStarLevel > 0 then
      if not self.WidgetMap[self.PetStarLevelWidget] then
        self.PetStarLevelWidget = self:CreateWidgetAsync("ComItemPetStarLevel", CoroutineObj)
      end
      self:AddWidgetToNode(self.PetStarLevelWidget)
      for i = 1, self.PetStarLevelWidget.Panel_PetStar:GetChildrenCount() do
        local PetStar = self.PetStarLevelWidget["PetStar_" .. i]
        if i <= PetStarLevel then
          PetStar.PetStar:SetActiveWidgetIndex(1)
        else
          PetStar.PetStar:SetActiveWidgetIndex(0)
        end
      end
    else
      self:RemoveWidgetFromNode(self.PetStarLevelWidget)
    end
  end
  
  self:AsyncLoadWidgetCommon("PetStarLevelWidget", "SetPetStarLevelTask", Callback)
end

function M:SetItemPolarity(Polarity, PolarityNum)
  local function Callback(CoroutineObj)
    if Polarity then
      if not self.WidgetMap[self.PolarityWidget] then
        self.PolarityWidget = self:CreateWidgetAsync("ComItemPolarity", CoroutineObj)
      end
      self.PolarityWidget:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
      local PolarityChar = DataMgr.ModPolarity[Polarity].Char
      if PolarityChar and Polarity ~= CommonConst.NonePolarity then
        self.PolarityWidget.Icon_Polarity:SetText(PolarityChar)
        self.PolarityWidget.Icon_Polarity:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
      else
        self.PolarityWidget.Icon_Polarity:SetVisibility(ESlateVisibility.Collapsed)
      end
      self.PolarityWidget.Text_Polarity:SetText(PolarityNum)
      self:AddWidgetToNode(self.PolarityWidget)
    elseif self.WidgetMap[self.PolarityWidget] then
      self:RemoveWidgetFromNode(self.PolarityWidget)
    end
  end
  
  if self.bAllUseAsyncLoadWidget then
    self:AsyncLoadWidgetCommon("PolarityWidget", "SetItemPolarityTask", Callback)
  else
    Callback()
  end
end

function M:SetAura(bAura)
  local function Callback(CoroutineObj)
    if self.ItemType == "Mod" and nil == bAura then
      local HaloMod = DataMgr.Mod[self.Id]
      
      if HaloMod and HaloMod.ApplySlot and 1 == #HaloMod.ApplySlot and 9 == HaloMod.ApplySlot[1] then
        bAura = true
      end
    end
    if bAura then
      if not self.WidgetMap[self.AuraWidget] then
        self.AuraWidget = self:CreateWidgetAsync("ComItemAura", CoroutineObj)
      end
      self:AddWidgetToNode(self.AuraWidget)
    else
      self:RemoveWidgetFromNode(self.AuraWidget)
    end
  end
  
  self:AsyncLoadWidgetCommon("AuraWidget", "SetAuraTask", Callback)
end

function M:GetOrCreateGroupWidget(WidgetName, CoroutineObj)
  if not self.ItemGroup then
    self.ItemGroup = self:CreateWidgetNew("ComItemGroup")
  end
  self:AddWidgetToNode(self.ItemGroup)
  return self.ItemGroup:CreateAndAddWidgetAsyc(WidgetName, CoroutineObj)
end

function M:RemoveGroupWidget(WidgetName)
  if not self.ItemGroup then
    return
  end
  self.ItemGroup:RemoveWidget(WidgetName)
  self[WidgetName] = nil
  if self.ItemGroup:GetWidgetCount() < 1 then
    self:RemoveWidgetFromNode(self.ItemGroup)
  end
end

function M:SetTimeLimitData(TimeLimitData)
  local function Callback(CoroutineObj)
    if self.ItemType == "Resource" and DataMgr.LimitedTimeResource[self.Id] then
      local LimitedData = ItemUtils.GetItemLimitedInfo(self.Id)
      
      if not LimitedData then
        self:RemoveWidgetFromNode(self.TimeLimitWidget)
        return
      end
      local NowTime = TimeUtils.NowTime()
      if not self.WidgetMap[self.TimeLimitWidget] then
        self.TimeLimitWidget = self:CreateWidgetAsync("ComItemTimeLimit", CoroutineObj)
        self:AddWidgetToNode(self.TimeLimitWidget)
      end
      if self.bSmall then
        self.TimeLimitWidget.Text_Time:SetVisibility(ESlateVisibility.Collapsed)
      else
        self.TimeLimitWidget.Text_Time:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
      end
      local diff = os.difftime(LimitedData.EndTime, NowTime)
      if diff < 86400 then
        self.TimeLimitWidget.BG:SetColorAndOpacity(self.TimeLimitWidget.Color_Red)
      else
        self.TimeLimitWidget.BG:SetColorAndOpacity(self.TimeLimitWidget.Color_Orange)
      end
      local TimeText
      if diff >= 604800 then
        self.TimeLimitWidget.Text_Time:SetVisibility(ESlateVisibility.Collapsed)
      elseif diff > 86400 then
        TimeText = math.floor(diff / 86400)
        self.TimeLimitWidget.Text_Time:SetText(TimeText .. GText("UI_GameEvent_TimeRemain_Day"))
      elseif diff > 3600 then
        TimeText = math.floor(diff / 3600)
        self.TimeLimitWidget.Text_Time:SetText(TimeText .. GText("UI_GameEvent_TimeRemain_Hour"))
      else
        TimeText = math.floor(diff / 60)
        self.TimeLimitWidget.Text_Time:SetText(TimeText .. GText("UI_GameEvent_TimeRemain_Min"))
      end
    else
      self:RemoveWidgetFromNode(self.TimeLimitWidget)
    end
  end
  
  if self.bAllUseAsyncLoadWidget then
    self:AsyncLoadWidgetCommon("TimeLimitWidget", "SetTimeLimitDataTask", Callback)
  else
    Callback()
  end
end

function M:AdjustBackGroundHeight(TextWidget, Reason)
  if not IsValid(TextWidget) then
    return
  end
  DebugPrint(WarningTag, "AdjustBackGroundHeight::\231\156\139\231\156\139\229\142\159\229\155\160", Reason)
  if 1 == TextWidget:GetVisibility() or 2 == TextWidget:GetVisibility() then
    return
  end
  if not TextWidget.GetTextWidget and not TextWidget.GetDesireWidget then
    DebugPrint(ErrorTag, "AdjustBackGroundHeight::\228\188\160\229\133\165\231\154\132TextWidget\229\191\133\233\161\187\232\166\129\230\156\137GetTextWidget\229\146\140GetDesireWidget\230\142\165\229\143\163")
    return
  end
  if not self.Item then
    DebugPrint(ErrorTag, "AdjustBackGroundHeight::\230\178\161\230\156\137Item\230\142\167\228\187\182\228\184\141\231\172\166\229\144\136\233\128\154\231\148\168\233\129\147\229\133\183\230\161\134\231\187\147\230\158\132")
    return
  end
  if self:IsExistTimer(self.AdjustBGTimer) then
    self:RemoveTimer(self.AdjustBGTimer)
  end
  self:DefaultBackGroundHeight()
  local Layout = TextWidget:GetDesireWidget()
  Layout:ForceLayoutPrePass()
  local Interval = self.Content and self.Content.AdjustBackGroundHeightDelay or 0.05
  if self.Content then
    self.Content.AdjustBackGroundHeightDelay = nil
  end
  local _, TimerKey = self:AddTimer(Interval, function()
    if not IsValid(TextWidget) then
      return
    end
    local Text = TextWidget:GetTextWidget()
    local Layout = TextWidget:GetDesireWidget()
    if not Text or not Layout then
      DebugPrint(ErrorTag, "AdjustBackGroundHeight::GetTextWidget\229\146\140GetDesireWidget\230\142\165\229\143\163\228\184\141\232\131\189\232\191\148\229\155\158\231\169\186\231\154\132\229\128\188")
      return
    end
    local DynamicMat = self.Item.Item_BG:GetDynamicMaterial()
    local OnelineDesireHeight = UIUtils.CalcOnelineTextDesireHeight(Text)
    local DesireHeight = Layout:GetDesiredSize().Y
    if 0 == DesireHeight then
      Layout:ForceLayoutPrepass()
      DesireHeight = Layout:GetDesiredSize().Y
    end
    if 0 == DesireHeight then
      DebugPrint(ErrorTag, "AdjustBackGroundHeight::\230\150\135\230\156\172\230\152\190\231\164\186\229\140\186\229\159\159\231\154\132\233\171\152\229\186\166\228\184\1860,\228\184\141\229\186\148\232\175\165\229\134\141\232\176\131\230\149\180\232\131\140\230\153\175\228\186\134")
      self:ClearBackGroundHeight()
      return
    end
    if DesireHeight <= OnelineDesireHeight * 1.5 then
      self:DefaultBackGroundHeight()
    elseif 3 == self.Item.ComItemType then
      self:_RealSetBottomBlackHeight(DynamicMat, self.Item.BottomBlack_Max)
      self.bMaxHeight = true
    end
  end)
  self.AdjustBGTimer = TimerKey
end

function M:DefaultBackGroundHeight()
  if not self.Item then
    DebugPrint(ErrorTag, "DefaultBackGroundHeight::\230\178\161\230\156\137Item\230\142\167\228\187\182\228\184\141\231\172\166\229\144\136\233\128\154\231\148\168\233\129\147\229\133\183\230\161\134\231\187\147\230\158\132")
    return
  end
  if not self.Item.ComItemType then
    DebugPrint(ErrorTag, Traceback(ErrorTag, "DefaultBackGroundHeight::Item\230\142\167\228\187\182\230\178\161\230\156\137ComItemType\229\143\152\233\135\143\230\158\154\228\184\190\230\157\165\230\143\143\232\191\176\233\129\147\229\133\183\230\161\134\231\177\187\229\158\139\239\188\140\233\156\128\232\166\129\230\137\190\232\147\157\229\155\190\229\138\160\228\184\128\228\184\170", true))
    return
  end
  local DynamicMat = self.Item.Item_BG:GetDynamicMaterial()
  if 1 == self.Item.ComItemType then
    self:_RealSetBottomBlackHeight(DynamicMat, self.Item.BottomBlack_S)
  elseif 2 == self.Item.ComItemType then
    self:_RealSetBottomBlackHeight(DynamicMat, self.Item.BottomBlack_M)
  elseif 3 == self.Item.ComItemType then
    self:_RealSetBottomBlackHeight(DynamicMat, self.Item.BottomBlack_L)
  end
end

function M:ClearBackGroundHeight(bForce)
  if not self.Item then
    DebugPrint(ErrorTag, "ClearBackGroundHeight::\230\178\161\230\156\137Item\230\142\167\228\187\182\228\184\141\231\172\166\229\144\136\233\128\154\231\148\168\233\129\147\229\133\183\230\161\134\231\187\147\230\158\132")
    return
  end
  if not self.bMaxHeight and not bForce then
    return
  end
  if self:IsExistTimer(self.AdjustBGTimer) then
    return
  end
  self.bMaxHeight = false
  local DynamicMat = self.Item.Item_BG:GetDynamicMaterial()
  self:_RealSetBottomBlackHeight(DynamicMat, self.Item.BottomBlack_None)
end

function M:_RealSetBottomBlackHeight(DynamicMat, Height)
  DynamicMat:SetScalarParameterValue("BottomBlackHeight", Height)
  if self.OnSetBottomBlackHeight then
    self:OnSetBottomBlackHeight(Height)
  end
end

function M:CheckWidgetIsTop(Widget)
  if not IsValid(Widget) then
    return
  end
  local ChildrenCount = self.Node_Widget:GetChildrenCount()
  if ChildrenCount <= 1 then
    return
  end
  local CurrentIndex = self.Node_Widget:GetChildIndex(Widget)
  if -1 == CurrentIndex then
    return
  end
  if CurrentIndex == ChildrenCount - 1 then
    return
  end
  self.Node_Widget:RemoveChild(Widget)
  local Slot = self.Node_Widget:AddChild(Widget)
  Slot:SetVerticalAlignment(EVerticalAlignment.HAlign_Fill)
  Slot:SetHorizontalAlignment(EHorizontalAlignment.HAlign_Fill)
end

return M
