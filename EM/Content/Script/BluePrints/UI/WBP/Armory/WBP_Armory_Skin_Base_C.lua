require("UnLua")
local ArmoryUtils = require("BluePrints.UI.WBP.Armory.ArmoryUtils")
local ActorController = require("BluePrints.UI.WBP.Armory.ActorController.Armory_ActorController")
local M = Class("BluePrints.UI.BP_UIState_C")
M._components = {
  "BluePrints.UI.WBP.Armory.MainComponent.Armory_PointerInputComponent",
  "BluePrints.UI.WBP.Armory.MainComponent.Armory_ReddotTree_Component",
  "BluePrints.UI.WBP.Armory.ActorController.PreviewActorComponent"
}
local TempVector = FVector2D(0, 0)
local GoToShopState = {
  CanGoToShop = "CanGoToShop",
  ItemIdNil = "ItemIdNil",
  ItemNotExist = "ItemNotExist",
  ItemNotOnSale = "ItemNotOnSale",
  SkinNotValid = "SkinNotValid"
}

function M:Construct()
  M.Super.Construct(self)
  self:UnbindAllFromAnimationFinished(self.In)
  self:UnbindAllFromAnimationFinished(self.Out)
  self:BindToAnimationFinished(self.In, {
    self,
    self.OnInAnimFinished
  })
  self:BindToAnimationFinished(self.Out, {
    self,
    self.OnOutAnimFinished
  })
  self.Image_Click.OnMouseButtonDownEvent:Unbind()
  self.Image_Click.OnMouseButtonDownEvent:Bind(self, self.On_Image_Click_MouseButtonDown)
  self.ScrollBox_Skin.OnMouseButtonUp:Clear()
  self.ScrollBox_Skin.OnMouseButtonUp:Add(self, self.OnSkinScrollBoxMouseButtonUp)
  self.ScrollBox_Skin.InertialScrollEnd:Clear()
  self.ScrollBox_Skin.InertialScrollEnd:Add(self, self.OnSkinScrollBoxInertialScrollEnd)
  self.ScrollBox_Skin:SetScrollBarVisibility(ESlateVisibility.Collapsed)
  self:AddDispatcher(EventID.OnCharAccessorySetted, self, self.OnCharAccessoryChanged)
  self:AddDispatcher(EventID.OnCharAccessoryRemoved, self, self.OnCharAccessoryChanged)
  self:AddDispatcher(EventID.OnCharAppearanceChanged, self, self.OnCharAppearanceChanged)
  self:AddDispatcher(EventID.OnCharShowPartMesh, self, self.OnCharShowPartMesh)
  self:AddDispatcher(EventID.OnCharCornerVisibilityChanged, self, self.OnCharCornerVisibilityChanged)
  self:AddDispatcher(EventID.OnCharSkinChanged, self, self.OnCharSkinChanged)
  self:AddDispatcher(EventID.OnNewCharSkinObtained, self, self.OnNewCharSkinObtained)
  self:AddDispatcher(EventID.OnNewCharAccessoryObtained, self, self.OnNewCharAccessoryObtained)
  self:AddDispatcher(EventID.OnWeaponAccessoryChanged, self, self.OnWeaponAccessoryChanged)
  self:AddDispatcher(EventID.OnWeaponSkinChanged, self, self.OnWeaponSkinChanged)
  self:AddDispatcher(EventID.OnPurchaseShopItem, self, self.OnPurchaseShopItem)
  self:AddDispatcher(EventID.OnWeaponColorsChanged, self, self.OnWeaponColorsChanged)
  self:AddDispatcher(EventID.OnNewWeaponSkinObtained, self, self.OnNewWeaponSkinObtained)
  self:AddDispatcher(EventID.OnNewWeaponAccessoryObtained, self, self.OnNewWeaponAccessoryObtained)
  self.List_Accessory.BP_OnItemClicked:Clear()
  self.List_Accessory.BP_OnItemClicked:Add(self, self.OnAccessoryItemClicked)
  self.List_Accessory.OnCreateEmptyContent:Bind(self, function(self)
    return NewObject(UIUtils.GetCommonItemContentClass())
  end)
  self.Btn_L.Btn.OnClicked:Clear()
  self.Btn_L.Btn.OnClicked:Add(self, self.BtnLClicked)
  self.Btn_R.Btn.OnClicked:Clear()
  self.Btn_R.Btn.OnClicked:Add(self, self.BtnRClicked)
  self.BtnWidgetState = {
    Unequipped = 0,
    Equipped = 1,
    Locked = 2
  }
  local RenderOpacityMin, RenderOpacityMax = self.Curve_SkinWidgetRenderOpacity:GetValueRange()
  self.SkinWidgetRenderOpacityRange = RenderOpacityMax - RenderOpacityMin
  local ScaleMin, ScaleMax = self.Curve_SkinWidgetScale:GetValueRange()
  self.SkinWidgetScaleMax = ScaleMax
  self.SkinWidgetScaleRange = ScaleMax - ScaleMin
  self.SkinTabIdx = 1
  self.AccessoryTabIdx = 2
  self.TopTabs = {
    {
      Text = GText(DataMgr.AppearanceTab[self.SkinTabIdx].Text),
      IconPath = DataMgr.AppearanceTab[self.SkinTabIdx].IconPath
    },
    {
      Text = GText(DataMgr.AppearanceTab[self.AccessoryTabIdx].Text),
      IconPath = DataMgr.AppearanceTab[self.AccessoryTabIdx].IconPath
    }
  }
  self.TabConfig = {
    TitleName = GText("UI_Armory_Appearance"),
    LeftKey = self.TabLeftKey,
    RightKey = self.TabRightKey,
    Tabs = self.TopTabs,
    StyleName = self.TabStyleName,
    DynamicNode = {
      "Back",
      "ResourceBar",
      "BottomKey"
    },
    BottomKeyInfo = {},
    BackCallback = self.OnBackKeyDown,
    OwnerPanel = self
  }
  self.NoneAccessoryId = DataMgr.GlobalConstant.EmptyCharAccessoryID.ConstantValue
end

function M:AddTopTabReddotListen()
  if self.NoReddot then
    return
  end
  
  local function SetTopTabReddot(TabIdx, IsNew)
    local Content = self.TopTabs[TabIdx]
    Content.IsNew = IsNew
    if IsValid(Content.UI) then
      Content.UI:SetReddot(Content.IsNew)
    end
  end
  
  if self.Type == CommonConst.ArmoryType.Char then
    self:AddCharAppearanceReddotListen(function()
      local LeafNodeName = CommonConst.DataType.Char .. CommonConst.DataType.Skin .. self.Target.CharId
      local NewSkinNode = ReddotManager.GetTreeNode(LeafNodeName)
      local NewSkinCount = NewSkinNode and NewSkinNode.Count or 0
      local Avatar = GWorld:GetAvatar()
      local CommonChar = Avatar.CommonChars[self.Target.CharId]
      if not CommonChar then
        return
      end
      local NewAccessoryCount = 0
      for _, Type in pairs(CommonConst.CharAccessoryTypes) do
        local LeafNodeName = CommonConst.DataType.CharAccessory .. Type
        local NewAccessoryNode = ReddotManager.GetTreeNode(LeafNodeName)
        NewAccessoryCount = NewAccessoryCount + (NewAccessoryNode and NewAccessoryNode.Count or 0)
        for key, Skin in pairs(CommonChar.OwnedSkins) do
          LeafNodeName = LeafNodeName .. Skin.SkinId
          NewAccessoryNode = ReddotManager.GetTreeNode(LeafNodeName)
          NewAccessoryCount = NewAccessoryCount + (NewAccessoryNode and NewAccessoryNode.Count or 0)
        end
      end
      SetTopTabReddot(1, NewSkinCount > 0)
      SetTopTabReddot(2, NewAccessoryCount > 0)
    end, self.Target.CharId)
  else
    self:AddWeaponAppearanceReddotListen(function()
      local NewSkinCount = 0
      local Data = DataMgr.Weapon[self.Target.WeaponId]
      if Data and Data.SkinApplicationType then
        for _, value in pairs(Data.SkinApplicationType) do
          local NodeName = CommonConst.DataType.WeaponSkin .. (value or "")
          local NewSkinNode = ReddotManager.GetTreeNode(NodeName)
          NewSkinCount = NewSkinCount + (NewSkinNode and NewSkinNode.Count or 0)
        end
      end
      local NewAccessoryNode = ReddotManager.GetTreeNode(CommonConst.DataType.WeaponAccessory)
      local NewAccessoryCount = NewAccessoryNode and NewAccessoryNode.Count or 0
      SetTopTabReddot(1, NewSkinCount > 0)
      SetTopTabReddot(2, NewAccessoryCount > 0)
    end, self.Target.WeaponId)
  end
end

function M:OnNewCharSkinObtained(SkinId, CharId)
  self:AddTimer(0.01, function()
    self:OnNewSkinObtained(SkinId)
  end)
end

function M:OnNewCharAccessoryObtained(AccessoryId)
  self:AddTimer(0.01, function()
    self:OnNewAccessoryObtained(AccessoryId)
  end)
end

function M:OnNewAccessoryObtained(AccessoryId)
  local Content = self.Map_AccessoryContents[AccessoryId]
  if not Content then
    return
  end
  Content.IsHide = nil
  if self.NoReddot then
    Content.RedDotType = nil
  else
    Content.RedDotType = UIConst.RedDotType.NewRedDot
  end
  Content.LockType = nil
  if Content.SelfWidget then
    Content.SelfWidget:SetRedDot(Content.RedDotType)
    Content.SelfWidget:SetLock(Content.LockType)
  end
  if Content == self.ComparedContent then
    self:UpdateAccessoryDetails(self.ComparedContent)
  end
  if self.Type == CommonConst.ArmoryType.Char then
    self:CheckCharAccessoryContentReddot(AccessoryId)
    self:InitCharAccessoryList()
  else
    self:CheckWeaponAccessoryContentReddot(AccessoryId)
    self:InitWeaponAccessoryList()
  end
end

function M:OnNewWeaponAccessoryObtained(AccessoryId)
  self:AddTimer(0.1, function()
    self:OnNewAccessoryObtained(AccessoryId)
  end)
end

function M:OnNewWeaponSkinObtained(SkinId)
  self:AddTimer(0.1, function()
    self:OnNewSkinObtained(SkinId)
  end)
end

function M:OnNewSkinObtained(SkinId)
  local Content = self.SkinMap[SkinId]
  if Content then
    Content.LockType = nil
    if not self.NoReddot then
      Content.IsNew = true
    end
    if Content.Widget then
      Content.Widget.LockType = Content.LockType
      Content.Widget:SetReddot(Content.IsNew)
      Content.Widget:InitButton()
      Content.Widget:InitTextStyle()
    end
    if self.SelectedSkinId == SkinId then
      self:UpdateSkinDetails(Content)
    end
  end
end

function M:RemoveTopTabReddotListen()
  if self.NoReddot then
    return
  end
  self:RemoveCharAppearanceReddotListen()
  self:RemoveWeaponAppearanceReddotListen()
end

function M:On_Image_Click_MouseButtonDown(MyGeometry, MouseEvent)
  return self:OnPointerDown(MyGeometry, MouseEvent)
end

function M:OnMouseWheel(MyGeometry, MouseEvent)
  return self:OnMouseWheelScroll(MyGeometry, MouseEvent)
end

function M:OnMouseButtonUp(MyGeometry, MouseEvent)
  return self:OnPointerUp(MyGeometry, MouseEvent)
end

function M:OnMouseMove(MyGeometry, MouseEvent)
  return self:OnPointerMove(MyGeometry, MouseEvent)
end

function M:OnTouchEnded(MyGeometry, InTouchEvent)
  return self:OnPointerUp(MyGeometry, InTouchEvent)
end

function M:OnTouchMoved(MyGeometry, InTouchEvent)
  return self:OnPointerMove(MyGeometry, InTouchEvent)
end

function M:OnMouseCaptureLost()
  self:OnPointerCaptureLost()
end

function M:OnBackgroundClicked()
  if self.bSelfHidden then
    self:OnHideUIKeyDown()
  end
end

function M:OnBackKeyDown()
  if self.bSelfHidden then
    return self:OnHideUIKeyDown()
  else
    if self.CurrentTopTabIdx ~= self.SkinTabIdx and self.IsAccessoryContentsCreated then
      self:RecoverAccessory()
    end
    if self.OpenPreviewDyeFromChat then
      if self.ActorController then
        self.ActorController:OnClosed()
      end
      self:Close()
    else
      self:PlayOutAnim()
    end
  end
end

function M:OnConfirmBtnClicked()
  if self.CurrentTopTabIdx == self.SkinTabIdx then
    AudioManager(self):PlayUISound(nil, "event:/ui/common/click_btn_confirm", nil, nil)
  else
    AudioManager(self):PlayUISound(nil, "event:/ui/common/role_replace", nil, nil)
  end
  if self.Type == CommonConst.ArmoryType.Char then
    if self.CurrentTopTabIdx == self.SkinTabIdx and not self.CurrentLockContent then
      self:OnCharSkinConfirmBtnClicked()
    elseif self.CurrentTopTabIdx == self.SkinTabIdx and self.CurrentLockContent then
      self:OnCharSkinGoToShopBtnClicked()
    else
      self:OnCharAccessoryConfirmBtnClicked()
    end
  elseif self.CurrentTopTabIdx == self.SkinTabIdx and not self.CurrentLockContent then
    self:OnWeaponSkinConfirmBtnClicked()
  elseif self.CurrentTopTabIdx == self.SkinTabIdx and self.CurrentLockContent then
    self:OnWeaponSkinGoToShopBtnClicked()
  else
    self:OnWeaponAccessoryConfirmBtnClicked()
  end
end

function M:OnSkinItemClicked(Content)
  if not self.IsTargetUnowned and Content.bDyeable and not Content.LockType and self.SelectedSkinId == Content.SkinId then
    self:OpenDye()
    return
  end
  self:SelectSkinByContent(Content)
end

function M:BtnLClicked()
  local SelectedSkinContent = self.SelectedSkinId and self.SkinMap[self.SelectedSkinId]
  if not SelectedSkinContent then
    return
  end
  local Content = self.SkinArray[SelectedSkinContent.Idx - 1]
  if Content then
    self:SelectSkinByContent(Content)
  end
end

function M:BtnRClicked()
  local SelectedSkinContent = self.SelectedSkinId and self.SkinMap[self.SelectedSkinId]
  if not SelectedSkinContent then
    return
  end
  local Content = self.SkinArray[SelectedSkinContent.Idx + 1]
  if Content then
    self:SelectSkinByContent(Content)
  end
end

function M:InitUIInfo(Name, IsInUIMode, EventList, Params)
  M.Super.InitUIInfo(self, Name, IsInUIMode, EventList, Params)
  AudioManager(self):PlayUISound(self, "event:/ui/armory/open", "SkinOpen", nil)
  Params = Params or {}
  self.Params = Params
  self.SelectedSkinId = nil
  self.Target = Params.Target
  self.Type = Params.Type
  self.OnCloseCallback = Params.OnCloseCallback
  self.Parent = Params.Parent
  self.IsTargetUnowned = Params.IsTargetUnowned
  self.IsCharacterTrialMode = Params.IsCharacterTrialMode
  self.IsPreviewMode = Params.IsPreviewMode
  self.NoReddot = self.IsPreviewMode or self.IsCharacterTrialMode or self.IsTargetUnowned
  self.OpenPreviewDyeFromChat = Params.OpenPreviewDyeFromChat
  self.OpenPreviewDyeFromShopItem = Params.OpenPreviewDyeFromShopItem
  self.OpenPreviewDyeFromChatColors = Params.Colors
  if self.Parent and self.Parent.ActorController then
    self.ActorController = self.Parent.ActorController
  end
  self.UIName = self:GetUIConfigName()
  if not self.ActorController then
    self.InAnimStyle = 1
  end
  if not self.InAnimStyle then
    self:Init(Params)
  end
  self:PlayInAnim()
end

function M:Init(Params)
  if not self.ActorController then
    self.IsPreviewMode = true
    self.Target = self:CreatePreviewTargetData(Params)
    Params.Target = self.Target
    Params.EPreviewSceneType = CommonConst.EPreviewSceneType.PreviewCommon
    Params.ViewUI = self
    self.ActorController = self:CreatePreviewActor(Params)
    self.ActorController:OnOpened()
    self.TabConfig.Tabs = nil
    self.TabConfig.LeftKey = nil
    self.TabConfig.RightKey = nil
  end
  if self.IsPreviewMode or self.IsCharacterTrialMode then
    self.TabConfig.DynamicNode = {"Back", "BottomKey"}
  end
  if self.IsPreviewMode then
    self.WidgetSwitcher_BtnState:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.WidgetSwitcher_State:SetVisibility(UIConst.VisibilityOp.Collapsed)
  else
    self.WidgetSwitcher_BtnState:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    self.WidgetSwitcher_State:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  end
  self.IsSkinWidgetNotReady = true
  self.Tab_Skin:Init(self.TabConfig)
  self.AppearanceSutiIndex = self.Target.CurrentAppearanceIndex
  local AppearanceSuit = self.Target:GetAppearance(self.AppearanceSutiIndex)
  self.SelectedSkinId = AppearanceSuit.SkinId
  self.JumpToCharAccessoryType = Params.AccessoryType
  self.Tab_Skin:BindEventOnTabSelected(nil, nil)
  if Params.AccessoryId or Params.AccessoryType then
    self.JumpToAccessoryId = Params.AccessoryId
    self.Tab_Skin:SelectTab(self.AccessoryTabIdx)
    self:OnTopTabSelected({
      Idx = self.AccessoryTabIdx
    })
  else
    self.JumpToSkinId = Params.SkinId
    self.Tab_Skin:SelectTab(self.SkinTabIdx)
    self:OnTopTabSelected({
      Idx = self.SkinTabIdx
    })
  end
  self.Tab_Skin:BindEventOnTabSelected(self, self.OnTopTabSelected)
  if self.IsCharacterTrialMode then
    self:InitSkinWidgets()
  end
  self:AddTopTabReddotListen()
  if self.OpenPreviewDyeFromChat then
    self:AddTimer(0.1, function()
      if not self then
        return
      end
      self:StopAllAnimations()
      self:OpenDye()
    end)
  end
end

function M:OnLoaded(...)
  M.Super.OnLoaded(self, ...)
end

function M:OnTopTabSelected(TabWidget, Content)
  self:LetSkinVarUninited()
  self.CurrentTopTabIdx = TabWidget.Idx
  if self.Type == CommonConst.ArmoryType.Char then
    if self.CurrentTopTabIdx == self.SkinTabIdx then
      if self.IsAccessoryContentsCreated then
        self:RecoverAccessory()
      end
      self:InitCharSkin()
    else
      self.Tab_Accessory:SetVisibility(UIConst.VisibilityOp.Visible)
      self:InitCharAccessory()
    end
  elseif self.CurrentTopTabIdx == self.SkinTabIdx then
    if self.IsAccessoryContentsCreated then
      self:RecoverAccessory()
    end
    self:InitWeaponSkin()
  else
    self.Tab_Accessory:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self:InitWeaponAccessory()
  end
end

function M:LetSkinVarUninited()
  self.IsSkinWidgetNotReady = true
  self.CenterClosestSkinWidgetIdx = nil
  self.CenterClosestSkinWidgetDis = nil
end

function M:Tick()
  if self.IsSkinWidgetNotReady or self.IsPreviewMode or not self.SkinWidgets then
    return
  end
  local ViewportScale = UWidgetLayoutLibrary.GetViewportScale(self)
  local ScrollBoxCenterX = UIUtils.CalcWidgetCenter(self.ScrollBox_Skin).X
  local SkinWidgetDis2Center = {}
  for index, Widget in ipairs(self.SkinWidgets) do
    local Dis = ScrollBoxCenterX - UIUtils.CalcWidgetCenter(Widget).X
    table.insert(SkinWidgetDis2Center, {
      Idx = index,
      AbsDis = math.abs(Dis),
      Dis = Dis
    })
  end
  table.sort(SkinWidgetDis2Center, function(a, b)
    return a.AbsDis < b.AbsDis
  end)
  if SkinWidgetDis2Center[1].Idx ~= self.CenterClosestSkinWidgetIdx then
    self:UpdateSkinDetailsByIdx(SkinWidgetDis2Center[1].Idx)
  end
  self.CenterClosestSkinWidgetIdx = SkinWidgetDis2Center[1].Idx
  self.CenterClosestSkinWidgetDis = SkinWidgetDis2Center[1].AbsDis
  local SkinWidgetOffset = self.SkinWidgetOffsetX * ViewportScale
  local TotalWidgetNumber = #SkinWidgetDis2Center
  local Widget, Forward, PerScale, AbsDis, RenderScale, RenderOpacity, Percent, Quotient
  for i = 1, #SkinWidgetDis2Center do
    Widget = self.SkinWidgets[SkinWidgetDis2Center[i].Idx]
    Widget.Slot:SetZOrder(TotalWidgetNumber - i)
    AbsDis = SkinWidgetDis2Center[i].AbsDis
    Percent = AbsDis % SkinWidgetOffset / SkinWidgetOffset
    Quotient = AbsDis // SkinWidgetOffset
    RenderScale = self.Curve_SkinWidgetScale:GetFloatValue(Percent)
    RenderScale = RenderScale - self.SkinWidgetScaleRange * Quotient
    RenderScale = math.clamp(RenderScale, 0, self.SkinWidgetScaleMax)
    TempVector.X, TempVector.Y = RenderScale, RenderScale
    Widget:SetRenderScale(TempVector)
    RenderOpacity = self.Curve_SkinWidgetRenderOpacity:GetFloatValue(Percent)
    RenderOpacity = RenderOpacity - self.SkinWidgetRenderOpacityRange * Quotient
    RenderOpacity = math.clamp(RenderOpacity, 0, 1)
    Widget:SetRenderOpacity(RenderOpacity)
    Forward = SkinWidgetDis2Center[i].Dis > 0 and 1 or 0
    if SkinWidgetOffset >= AbsDis then
      PerScale = self.Curve_SkinWidgetRotation:GetFloatValue(AbsDis / SkinWidgetOffset)
    else
      PerScale = 1
    end
    self:RotateSkinWidget(Widget, PerScale, Forward)
  end
end

function M:RotateSkinWidget(Widget, PerScale, bForward)
  local TextMI = Widget.RetainerBox_Text:GetEffectMaterial()
  TextMI:SetScalarParameterValue("PerScale", PerScale)
  TextMI:SetScalarParameterValue("OpenClockwise", bForward)
  local ImgMI = Widget.Img_Item:GetDynamicMaterial()
  ImgMI:SetScalarParameterValue("PerScale", PerScale)
  ImgMI:SetScalarParameterValue("OpenClockwise", bForward)
end

function M:OnSkinScrollBoxInertialScrollEnd(Offset)
  if self.IsSkinWidgetNotReady then
    return
  end
  if self.CenterClosestSkinWidgetIdx and self.CenterClosestSkinWidgetDis > 0.1 then
    self:SelectSkinByIdx(self.CenterClosestSkinWidgetIdx)
  end
end

function M:OnSkinScrollBoxMouseButtonUp()
  if self.IsSkinWidgetNotReady then
    return
  end
  if self.CenterClosestSkinWidgetIdx and self.CenterClosestSkinWidgetDis > 0.1 then
    self:SelectSkinByIdx(self.CenterClosestSkinWidgetIdx)
  end
end

function M:InitSkinWidgets()
  self.Panel_ScrollSkin:ClearChildren()
  self.SkinWidgets = {}
  self.SkinWidgetSizeX = 0
  if self.SkinArray == nil then
    return
  end
  for index, value in ipairs(self.SkinArray) do
    value.Idx = index
    local SkinWidget = self:CreateSkinWidget()
    SkinWidget:SetIsShowNavigateGuide(false)
    SkinWidget.Button_Area:SetIsShowNavigateGuide(false)
    SkinWidget.Button_Tips:SetIsShowNavigateGuide(false)
    value.IsCurrentUse = self.SkinArray[index].SkinId == self.CurrentSkinContent.SkinId
    value.IsCharacterTrialMode = self.IsCharacterTrialMode
    self:AddSkinWidgetToScrollPanel(SkinWidget, index)
    SkinWidget:OnListItemObjectSet(value)
  end
end

function M:AddSkinWidgetToScrollPanel(Widget, Idx)
  self.Panel_ScrollSkin:AddChild(Widget)
  local Slot = Widget.Slot
  local SkinWidgetBtnSize = Widget.Button_Area.Slot:GetSize()
  Slot:SetSize(SkinWidgetBtnSize)
  TempVector.X, TempVector.Y = self.SkinWidgetOffsetX * (Idx - 1), 0
  Slot:SetPosition(TempVector)
  local Anchor = Slot:GetAnchors()
  Anchor.Maximum.X, Anchor.Maximum.Y = 0, 0.5
  Anchor.Minimum.X, Anchor.Minimum.Y = 0, 0.5
  Slot:SetAnchors(Anchor)
  TempVector.X, TempVector.Y = 0, 0.5
  Slot:SetAlignment(TempVector)
  table.insert(self.SkinWidgets, Widget)
end

function M:CreateSkinWidget()
  local Widget = UIManager(self):CreateWidget("/Game/UI/WBP/Armory/Widget/Appearance/WBP_Armory_AppearanceItem.WBP_Armory_AppearanceItem", false)
  if not self.SkinWidgetSizeInited then
    self.SkinWidgetOffsetX = Widget.Main.Slot:GetSize().X
    self.SkinWidgetSizeX = Widget.Button_Area.Slot:GetSize().X
    self.SkinWidgetSizeInited = true
  end
  return Widget
end

function M:SelectSkinById(SkinId, bImmediately)
  SkinId = SkinId or self.CurrentSkinContent.SkinId
  self:SelectSkinByContent(self.SkinMap[SkinId], bImmediately)
end

function M:SelectSkinByIdx(Idx, bImmediately)
  self:SelectSkinByContent(self.SkinArray[Idx], bImmediately)
end

function M:SelectSkinByContent(Content, bImmediately)
  if not Content then
    return
  end
  if self.IsPreviewMode then
    self:UpdateSkinDetailsByIdx(Content.Idx)
  else
    local Padding = self.SkinWidgetOffsetX * (Content.Idx - 1)
    self.ScrollBox_Skin:EndInertialScrolling()
    self.ScrollBox_Skin:ScrollWidgetIntoView(self.Spacer_LeftOffset, not bImmediately, EDescendantScrollDestination.TopOrLeft, -Padding)
  end
end

function M:UpdateSkinDetailsByIdx(Idx)
  self:UpdateSkinDetails(self.SkinArray[Idx])
  self:UpdateDirBtnByIdx(Idx)
end

function M:UpdateDirBtnByIdx(Idx)
  if Idx <= 1 then
    self.Btn_L:SetVisibility(UIConst.VisibilityOp.Collapsed)
  else
    self.Btn_L:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  end
  if Idx >= #self.SkinArray then
    self.Btn_R:SetVisibility(UIConst.VisibilityOp.Collapsed)
  else
    self.Btn_R:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  end
end

function M:UpdateSkinDetails(Content)
  if not Content then
    return
  end
  if Content.SkinId ~= self.SelectedSkinId and not self:IsAnimationPlaying(self.In) then
    self:PlayAnimation(self.Change)
  end
  self.Panel_Buy:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.SelectedSkinId = Content.SkinId
  if Content.Name and Content.Name ~= "" then
    self.VB_Info:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  else
    self.VB_Info:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  local SkinNameFont = {
    nil,
    nil,
    "Font_Blue",
    "Font_Purple",
    "Font_Gold",
    "Font_Red"
  }
  if Content.Rarity and SkinNameFont[Content.Rarity] and self[SkinNameFont[Content.Rarity]] then
    self.Text_Name:SetFont(self[SkinNameFont[Content.Rarity]])
  end
  self.Text_Name:SetText(Content.Name)
  self.Text_Info:SetText(Content.Text)
  self.Text_SkinName_World:SetText(Content.Name_World)
  self.Image_Element:SetVisibility(ESlateVisibility.Collapsed)
  self.Text_Char_None:SetVisibility(ESlateVisibility.Collapsed)
  self.Tag_Quality:SetVisibility(ESlateVisibility.Collapsed)
  if Content.ElementType then
    local IconName = "Armory_" .. Content.ElementType
    local AttributeIcon = LoadObject("/Game/UI/Texture/Dynamic/Atlas/Armory/T_" .. IconName .. ".T_" .. IconName)
    self.Image_Element:SetBrushResourceObject(AttributeIcon)
    self.Image_Element:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  end
  if Content.WeaponTypeIcon then
    local TagIcon = LoadObject(Content.WeaponTypeIcon)
    self.Image_Element:SetBrushResourceObject(TagIcon)
    self.Image_Element:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  end
  if Content.CharName then
    self.Text_CharName:SetText(Content.CharName)
  else
    self.Text_CharName:SetText("")
  end
  if Content.NotOwned then
    self.Text_Char_None:SetText(GText("UI_SkinPreview_CharNotOwned"))
    self.Text_Char_None:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  end
  if Content.Rarity then
    self.Tag_Quality:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self.Tag_Quality:Init(Content.Rarity)
  end
  self:UpdateSkinWidgetStyle(Content)
  self:UpdateFunctionBtn(Content)
  self:UpdateActorAppearance(self.SelectedSkinId)
  if Content.IsNew and not self.NoReddot then
    ArmoryUtils:SetItemReddotRead(Content, true)
  end
end

function M:UpdateSkinWidgetStyle(Content)
  for index, Widget in ipairs(self.SkinWidgets) do
    Widget:ShowDyeBtn(false)
    Widget:SetUnSelect()
    Widget:InitTextStyle()
  end
  local CurrentWidget = self.SkinWidgets[Content.Idx]
  if CurrentWidget then
    CurrentWidget:InitTextStyle()
    if Content.bDyeable and not Content.LockType then
      CurrentWidget:ShowDyeBtn(true)
    end
  end
end

function M:UpdateFunctionBtn(Content)
  self.Btn_Function:UnBindEventOnClickedByObj(self)
  self.CurrentLockContent = nil
  if self.CurrentSkinContent == Content then
    self.WidgetSwitcher_BtnState:SetActiveWidgetIndex(self.BtnWidgetState.Equipped)
    if self.IsTargetUnowned then
      self.Text_Desc:SetText(GText("UI_CharPreview_Accessory_In_Trial"))
    else
      self.Text_Desc:SetText(GText("UI_Accessory_Equipped"))
    end
  else
    if Content.LockType then
      self.WidgetSwitcher_BtnState:SetActiveWidgetIndex(self.BtnWidgetState.Unequipped)
      self.CurrentLockContent = Content
      local CurGoToShopState = self:CheckSkinGoToShopState()
      if CurGoToShopState == GoToShopState.CanGoToShop then
        self.Btn_Function:SetText(GText("UI_Skin_GotoBuy"))
        self.Btn_Function:ForbidBtn(false)
      elseif CurGoToShopState == GoToShopState.ItemNotOnSale then
        self.WidgetSwitcher_BtnState:SetActiveWidgetIndex(self.BtnWidgetState.Equipped)
        self.Text_Desc:SetText(GText("UI_Skin_CannotBuy"))
      elseif CurGoToShopState == GoToShopState.ItemIdNil or CurGoToShopState == GoToShopState.ItemNotExist or CurGoToShopState == GoToShopState.SkinNotValid then
        self.WidgetSwitcher_BtnState:SetActiveWidgetIndex(self.BtnWidgetState.Equipped)
        self.Text_Desc:SetText(GText("UI_Skin_CannotBuy"))
      end
    else
      self.WidgetSwitcher_BtnState:SetActiveWidgetIndex(self.BtnWidgetState.Unequipped)
      if self.IsTargetUnowned then
        self.Btn_Function:SetText(GText("UI_CharPreview_Cannot_Equip"))
        self.Btn_Function:ForbidBtn(true)
      else
        self.Btn_Function:SetText(GText("UI_Accessory_Equip"))
        self.Btn_Function:ForbidBtn(false)
      end
    end
    self.Btn_Function:BindEventOnClicked(self, self.OnConfirmBtnClicked)
    self.ConfirmBtnFunc = self.OnConfirmBtnClicked
  end
  if self.IsCharacterTrialMode then
    if self.CurrentSkinContent == Content then
      self.WidgetSwitcher_BtnState:SetActiveWidgetIndex(self.BtnWidgetState.Equipped)
      self.Text_Desc:SetText(GText("UI_CharPreview_Accessory_In_Trial"))
    elseif Content.LockType then
      self.WidgetSwitcher_BtnState:SetActiveWidgetIndex(self.BtnWidgetState.Locked)
      self.Text_Lock:SetText(GText("UI_Aaccessory_Locked"))
      self.Btn_Function:ForbidBtn(true)
    else
      self.WidgetSwitcher_BtnState:SetActiveWidgetIndex(self.BtnWidgetState.Unequipped)
      self.Btn_Function:SetText(GText("UI_CharPreview_Cannot_Equip"))
      self.Btn_Function:ForbidBtn(true)
    end
  end
end

function M:UpdateActorAppearance(SkinId)
  self:UpdateActorSkin(SkinId)
  self:UpdateActorColors(SkinId)
end

function M:UpdatePartMesh(SkinId)
  if self.Type ~= CommonConst.ArmoryType.Char or not self.ActorController then
    return
  end
  local Avatar = ArmoryUtils:GetAvatar()
  local Skin = self.Target:GetSkin(SkinId or self.Target:GetAppearance().SkinId, Avatar)
  self.ActorController:ShowPartMesh(Skin and Skin.IsShowPartMesh)
end

function M:UpdateActorSkin(SkinId)
  if self.Type == CommonConst.ArmoryType.Char then
    if not self.ActorController then
      return
    end
    local AppearanceSuitInfo = self.Target:DumpAppearanceSuit(ArmoryUtils:GetAvatar(), self.AppearanceSutiIndex)
    AppearanceSuitInfo.SkinId = SkinId
    AppearanceSuitInfo.Colors = self.Target:DumpColors(ArmoryUtils:GetAvatar(), SkinId)
    self.ActorController:ChangeCharAppearance(AppearanceSuitInfo)
    if SkinId ~= self.LastCharSkinId then
      self.ActorController.DelayFrame = 30
      self.ActorController.bPlaySameMontage = true
      self.ActorController:SetMontageAndCamera(CommonConst.ArmoryType.Char, "", "", "")
    end
    self.LastCharSkinId = SkinId
  else
    self.ActorController:ChangeWeaponSkin(SkinId)
  end
end

function M:UpdateActorColors(SkinId)
  if self.Type == CommonConst.ArmoryType.Char then
  else
    local ColorInfo = self.Target:DumpColors(SkinId)
    self.ActorController:ChangeWeaponColor(ColorInfo)
  end
end

function M:InitCharSkin()
  if self.ActorController then
    self.ActorController.DelayFrame = 1
    self.ActorController.bNoDisappearFX = true
    self.ActorController:SetMontageAndCamera(CommonConst.ArmoryType.Char, "", "", "")
    self.ActorController:HidePlayerActor(self.UIName, false)
  end
  local SkinId = self.JumpToSkinId or self.SelectedSkinId
  if self.JumpToSkinId then
    self.LastCharSkinId = self.JumpToSkinId
  end
  self.JumpToSkinId = nil
  self.WidgetSwitcher_State:SetActiveWidgetIndex(1)
  self:InitCharSkinList(self.Target)
  self:SelectSkinById(SkinId, true)
  self:AddTimer(0.01, function()
    self.IsSkinWidgetNotReady = false
  end)
end

function M:InitCharSkinList(Char)
  if self.bCharSkinListInited then
    return
  end
  self.bCharSkinListInited = true
  self.SkinMap = {}
  self.SkinArray = {}
  local Avatar = GWorld:GetAvatar()
  local DefaultSkinId = Char:GetDefaultSkinId()
  self.DefaultSkinId = DefaultSkinId
  local LeafNodeName = CommonConst.DataType.Char .. CommonConst.DataType.Skin .. Char.CharId
  local CacheDetail = {}
  if not self.NoReddot then
    CacheDetail = ReddotManager.GetLeafNodeCacheDetail(LeafNodeName) or {}
  end
  for SkinId, Data in pairs(DataMgr.Skin) do
    if Data.CharId == Char.CharId then
      local Obj = {
        SkinId = SkinId,
        IconPath = Data.LongIcon,
        Name = GText(Data.SkinName),
        Name_World = EnText(Data.SkinName),
        Rarity = Data.Rarity,
        Text = GText(Data.SkinDescribe),
        CharId = Char.CharId,
        ItemType = CommonConst.DataType.Skin,
        Owner = self,
        OnClicked = self.OnSkinItemClicked,
        bDyeable = SkinId ~= DefaultSkinId,
        IsNoAnimation = SkinId == DefaultSkinId,
        IsTargetUnowned = self.IsTargetUnowned,
        IsNew = 1 == CacheDetail[SkinId]
      }
      if Char:GetSkin(SkinId, Avatar) then
        Obj.LockType = false
      else
        Obj.LockType = SkinId ~= DefaultSkinId
      end
      local CharInfo = DataMgr.BattleChar[Data.CharId]
      if CharInfo then
        Obj.ElementType = CharInfo.Attribute
        Obj.CharName = GText(CharInfo.CharName)
      end
      if Avatar and not Avatar:CheckCharEnough({
        [Data.CharId] = 1
      }) then
        Obj.NotOwned = true
      end
      Obj.IsEquipped = false
      self.SkinMap[SkinId] = Obj
      self:OnSkinContentCreated(Obj)
      table.insert(self.SkinArray, Obj)
    end
  end
  table.sort(self.SkinArray, function(a, b)
    return a.SkinId < b.SkinId
  end)
  local AppearanceSuit = Char:GetAppearance()
  local SkinId = AppearanceSuit and AppearanceSuit.SkinId
  SkinId = SkinId or DefaultSkinId
  if SkinId and self.SkinMap[SkinId] then
    self.CurrentSkinContent = self.SkinMap[SkinId]
    self.CurrentSkinContent.IsEquipped = true
  end
  self:InitSkinWidgets()
end

function M:OnSkinContentCreated()
end

function M:OnCharSkinConfirmBtnClicked()
  if not self.SelectedSkinId or self.SelectedSkinId <= 0 then
    return
  end
  self:BlockAllUIInput(true)
  local Avatar = GWorld:GetAvatar()
  Avatar:ChangeCharAppearanceSkin(self.Target.Uuid, self.AppearanceSutiIndex, self.SelectedSkinId)
end

function M:CheckSkinGoToShopState()
  if not self.SelectedSkinId or self.SelectedSkinId <= 0 then
    return GoToShopState.SkinNotValid
  end
  local SkinInfo
  if self.Type == CommonConst.ArmoryType.Char then
    SkinInfo = DataMgr.Skin[self.SelectedSkinId]
  else
    SkinInfo = DataMgr.WeaponSkin[self.SelectedSkinId]
  end
  if not SkinInfo then
    return GoToShopState.SkinNotValid
  end
  local ItemId = SkinInfo.GoShopTypeId
  if not ItemId or ItemId <= 0 then
    return GoToShopState.ItemIdNil
  end
  local ShopItemData = DataMgr.ShopItem[ItemId]
  if not ShopItemData then
    return GoToShopState.ItemNotExist
  end
  local Avatar = GWorld:GetAvatar()
  if Avatar and not Avatar:CheckIsEffective(ItemId) then
    return GoToShopState.ItemNotOnSale
  end
  return GoToShopState.CanGoToShop
end

function M:OnCharSkinGoToShopBtnClicked()
  if not self.SelectedSkinId or self.SelectedSkinId <= 0 then
    return
  end
  local SkinInfo = DataMgr.Skin[self.SelectedSkinId]
  if not SkinInfo then
    return
  end
  local ItemId = SkinInfo.GoShopTypeId
  if not ItemId then
    return
  end
  local ShopItemData = DataMgr.ShopItem[ItemId]
  if not ShopItemData then
    return
  end
  local bSuccess, JumpToPage = PageJumpUtils:CreateJumpToShopAccess(ShopItemData.ItemType, "Shop", ShopItemData.TypeId)
  if bSuccess and JumpToPage then
    JumpToPage()
  else
    UIManager(self):ShowUITip(UIConst.Tip_CommonToast, GText("\231\154\174\232\130\164\232\161\168\229\175\185\229\186\148\231\154\132\229\149\134\229\147\129Id\229\143\175\232\131\189\230\178\161\233\133\141\229\175\185,\233\186\187\231\131\166\231\173\150\229\136\146\230\163\128\230\159\165\228\184\128\228\184\139"))
  end
end

function M:OnWeaponSkinGoToShopBtnClicked()
  if not self.SelectedSkinId or self.SelectedSkinId <= 0 then
    return
  end
  local SkinInfo = DataMgr.WeaponSkin[self.SelectedSkinId]
  if not SkinInfo then
    return
  end
  local ItemId = SkinInfo.GoShopTypeId
  if not ItemId then
    return
  end
  local ShopItemData = DataMgr.ShopItem[ItemId]
  if not ShopItemData then
    return
  end
  local bSuccess, JumpToPage = PageJumpUtils:CreateJumpToShopAccess(ShopItemData.ItemType, "Shop", ShopItemData.TypeId)
  if bSuccess and JumpToPage then
    JumpToPage()
  else
    UIManager(self):ShowUITip(UIConst.Tip_CommonToast, GText("\231\154\174\232\130\164\232\161\168\229\175\185\229\186\148\231\154\132\229\149\134\229\147\129Id\229\143\175\232\131\189\230\178\161\233\133\141\229\175\185,\233\186\187\231\131\166\231\173\150\229\136\146\230\163\128\230\159\165\228\184\128\228\184\139"))
  end
end

function M:OnCharSkinChanged(Ret, CharUuid, AppearanceIndex, SkinId)
  self:BlockAllUIInput(false)
  if not ErrorCode:Check(Ret) then
    return
  end
  self:ResetTarget()
  if self.CurrentSkinContent then
    self:SetSkinIsCurrentUse(self.CurrentSkinContent, false)
  end
  self.CurrentSkinContent = self.SkinMap[SkinId]
  self:SetSkinIsCurrentUse(self.CurrentSkinContent, true)
  self:UpdateFunctionBtn(self.CurrentSkinContent)
end

function M:SetSkinIsCurrentUse(Content, IsCurrentUse)
  if not Content then
    return
  end
  Content.IsCurrentUse = IsCurrentUse
  local CurrentWidget = self.SkinWidgets[Content.Idx]
  if CurrentWidget then
    CurrentWidget:SetIsCurrentUse(Content.IsCurrentUse)
  end
end

function M:InitCharAccessory()
  self.WidgetSwitcher_State:SetActiveWidgetIndex(0)
  self:CreateCharAccessoryTabInfo()
  self:CreateCharAccessoryContents(self.Target, self.SelectedSkinId)
  self:CharAccessoryJumpTo()
end

function M:CharAccessoryJumpTo()
  local AccessoryId, AccessoryType = self.JumpToAccessoryId, self.JumpToCharAccessoryType
  local Content = self.Map_AccessoryContents[AccessoryId]
  if Content then
    local AccessoryTab = self.AccessoryTabsMap[Content.AccessoryType]
    if AccessoryTab then
      self.Tab_Accessory:SelectTab(AccessoryTab.Idx)
      return
    end
  else
    local AccessoryTab = self.AccessoryTabsMap[AccessoryType]
    if AccessoryTab then
      self.Tab_Accessory:SelectTab(AccessoryTab.Idx)
      return
    end
  end
  self.Tab_Accessory:SelectTab(1)
end

function M:CreateCharAccessoryTabInfo(Recreate)
  if self.IsAccessoryTabInited and not Recreate then
    return
  end
  self.IsAccessoryTabInited = true
  self.CurrentAccessoryTabIdx = nil
  self.AccessoryTypes = {
    CommonConst.CharAccessoryTypes.Head,
    CommonConst.CharAccessoryTypes.Face,
    CommonConst.CharAccessoryTypes.Waist,
    CommonConst.CharAccessoryTypes.Back,
    CommonConst.CharAccessoryTypes.FX_Dead,
    CommonConst.CharAccessoryTypes.FX_Teleport,
    CommonConst.CharAccessoryTypes.FX_Footprint,
    CommonConst.CharAccessoryTypes.FX_Body
  }
  self.FXAccessoryTypes = {
    [CommonConst.CharAccessoryTypes.FX_Dead] = true,
    [CommonConst.CharAccessoryTypes.FX_Teleport] = true,
    [CommonConst.CharAccessoryTypes.FX_Footprint] = true,
    [CommonConst.CharAccessoryTypes.FX_Body] = true
  }
  self.HidePlayerAccessoryTypes = {
    [CommonConst.CharAccessoryTypes.FX_Dead] = true,
    [CommonConst.CharAccessoryTypes.FX_Footprint] = true
  }
  self.AccessoryTabsMap = {}
  self.AccessoryTabsArray = {}
  for i, value in ipairs(self.AccessoryTypes) do
    local Tab = {
      Owner = self,
      AccessoryType = value,
      Text = "",
      Idx = i,
      IconPath = "/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_Fashion_" .. value .. ".T_Tab_Fashion_" .. value
    }
    self.AccessoryTabsMap[Tab.AccessoryType] = Tab
    table.insert(self.AccessoryTabsArray, Tab)
    self:OnAccessoryTabContentCreated(Tab)
  end
  self.TabConfigData = {
    ChildWidgetName = "TabSubIconItem",
    Tabs = self.AccessoryTabsArray,
    SoundFunc = function(self)
      AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_sort_tab", nil, nil)
    end,
    SoundFuncReceiver = self
  }
  self.Tab_Accessory:Init(self.TabConfigData)
  self.Tab_Accessory:BindEventOnTabSelected(self, self.OnCharAccessoryTabClicked)
end

function M:OnAccessoryTabContentCreated(Content)
end

function M:CreateCharAccessoryContents(Char, SkinId, bRecreate)
  self.IsAccessoryContentsCreated = true
  self.CurrentContent = nil
  self.ComparedContent = nil
  self.NoneAccessory = NewObject(UIUtils.GetCommonItemContentClass())
  self.NoneAccessory.Id = self.NoneAccessoryId
  self.NoneAccessory.AccessoryId = self.NoneAccessoryId
  self.NoneAccessory.Parent = self
  self.NoneAccessory.Icon = UIUtils.GetNoneAccessoryIconPath()
  self.NoneAccessory.ItemType = CommonConst.DataType.CharAccessory
  self.BP_AccessoryContents:Clear()
  self.BP_AccessoryContents:Add(self.NoneAccessory)
  self.Map_AccessoryContents = {}
  self.DefaultCharAccessoryIds = {
    [CommonConst.CharAccessoryTypes.FX_Dead] = DataMgr.GlobalConstant.DefautFXDead.ConstantValue,
    [CommonConst.CharAccessoryTypes.FX_Teleport] = DataMgr.GlobalConstant.DefautFXTeleport.ConstantValue
  }
  for _, Data in pairs(DataMgr.CharAccessory) do
    local Content = self:CreateCharAccessoryContent(Data)
    if Content then
      Content.SoundDataName = "CharAccessory"
      self.BP_AccessoryContents:Add(Content)
      self.Map_AccessoryContents[Data.AccessoryId] = Content
    end
  end
  self.PartMeshAccessory = nil
  self.HornAccessory = nil
  local AppearanceSuit = Char:GetAppearance()
  local Avatar = GWorld:GetAvatar()
  local Skin = Char:GetSkin(SkinId or AppearanceSuit.SkinId, Avatar)
  for _, Data in pairs(DataMgr.CharPartMesh) do
    local Content = self:CreateCharAccessoryContent(Data)
    if Content then
      Content.SoundDataName = "CharPartMesh"
      self.BP_AccessoryContents:Add(Content)
      self.Map_AccessoryContents[Data.AccessoryId] = Content
      if Content.PartName == "PartMesh" then
        self.PartMeshAccessory = Content
        self.PartMeshAccessory.bSelectTag = false
        if Skin then
          if AppearanceSuit.Accessory[CommonConst.NewCharAccessoryTypes[Content.AccessoryType]] <= 0 then
            self.PartMeshAccessory.bSelectTag = Skin.IsShowPartMesh
          else
            self.PartMeshAccessory.bSelectTag = false
          end
          self.PartMeshAccessory.LockType = nil
        else
          self.PartMeshAccessory.LockType = 2
        end
      elseif Content.PartName == "Horn" then
        self.HornAccessory = Content
        self.HornAccessory.bSelectTag = AppearanceSuit.IsCornerVisible
        self.HornAccessory.LockType = nil
      end
    end
  end
  for _, AccessoryId in pairs(Avatar.CharAccessorys) do
    local Content = self.Map_AccessoryContents[AccessoryId]
    if Content then
      Content.IsHide = nil
      Content.LockType = nil
    end
  end
  for _, AccessoryId in pairs(Avatar.CharAccessorys) do
    self:CheckCharAccessoryContentReddot(AccessoryId)
  end
  self:AddAccessoryTabReddotListen()
  local CharAccessory = AppearanceSuit.Accessory
  for _, AccessoryType in ipairs(self.AccessoryTypes) do
    local AccessoryTypeIndex = CommonConst.NewCharAccessoryTypes[AccessoryType]
    if AccessoryTypeIndex then
      local AccessoryId = CharAccessory[AccessoryTypeIndex] or -1
      if AccessoryId == self.NoneAccessoryId then
        self[AccessoryType .. "Content"] = self.NoneAccessory
      else
        self[AccessoryType .. "Content"] = self.Map_AccessoryContents[AccessoryId]
      end
    end
  end
  if self.PartMeshAccessory and self.PartMeshAccessory.bSelectTag then
    self[self.PartMeshAccessory.AccessoryType .. "Content"] = self.PartMeshAccessory
  end
  if self.HornAccessory and self.HornAccessory.bSelectTag then
    self[self.HornAccessory.AccessoryType .. "Content"] = self.HornAccessory
  end
  for _, AccessoryType in ipairs(self.AccessoryTypes) do
    if self[AccessoryType .. "Content"] then
      self[AccessoryType .. "Content"].bSelectTag = true
    end
  end
end

function M:CheckCharAccessoryContentReddot(AccessoryId)
  if self.NoReddot then
    return
  end
  local Content = self.Map_AccessoryContents[AccessoryId]
  if not Content then
    return
  end
  local CharAccessoryData = DataMgr.CharAccessory[AccessoryId]
  if CharAccessoryData and CharAccessoryData.AccessoryType then
    local NodeName = CommonConst.DataType.CharAccessory .. CharAccessoryData.AccessoryType
    for _, _SkinId in ipairs(CharAccessoryData.Skin or {""}) do
      if ReddotManager.GetTreeNode(NodeName .. _SkinId) then
        local CacheDetail = ReddotManager.GetLeafNodeCacheDetail(NodeName .. _SkinId)
        Content.RedDotType = 1 == CacheDetail[AccessoryId] and UIConst.RedDotType.NewRedDot
        if Content.RedDotType then
          self.AccessoryTabsMap[CharAccessoryData.AccessoryType].IsNew = true
          break
        end
      end
    end
  end
end

function M:CreateCharAccessoryContent(Data)
  if Data.AccessoryType then
    if Data.AccessoryId == self.DefaultCharAccessoryIds[Data.AccessoryType] then
      return
    end
    local bCreateContent = true
    if Data.Skin then
      bCreateContent = false
      local SkinId = self.SelectedSkinId
      for _, Id in ipairs(Data.Skin) do
        if Id == SkinId then
          bCreateContent = true
          break
        end
      end
    end
    if bCreateContent then
      local Obj = NewObject(UIUtils.GetCommonItemContentClass())
      Obj.ItemType = CommonConst.DataType.CharAccessory
      Obj.Icon = Data.Icon or ""
      Obj.Id = Data.AccessoryId
      Obj.AccessoryId = Data.AccessoryId
      Obj.SortPriority = Data.SortPriority or 0
      Obj.IsHide = Data.IsHide
      Obj.LockType = 2
      Obj.Rarity = Data.Rarity or 0
      Obj.bSelectTag = false
      Obj.IsSelect = false
      Obj.AccessoryType = Data.AccessoryType
      Obj.PartName = Data.PartName
      Obj.UnlockOptionText = GText(Data.UnlockOption or "")
      Obj.Parent = self
      return Obj
    end
  end
end

function M:AddAccessoryTabReddotListen()
  if self.NoReddot then
    return
  end
  local SkinId = self.SelectedSkinId
  if not self.TabNodeNames then
    self.TabNodeNames = {}
  end
  for AccessoryType, Tab in pairs(self.AccessoryTabsMap) do
    local NodeName = AccessoryType
    local LeafNodes = {}
    local LeafNodeName = CommonConst.DataType.CharAccessory .. AccessoryType
    LeafNodes[LeafNodeName] = ReddotManager.GetTreeNode(LeafNodeName) and 1 or nil
    LeafNodeName = LeafNodeName .. SkinId
    LeafNodes[LeafNodeName] = ReddotManager.GetTreeNode(LeafNodeName) and 1 or nil
    if not self.TabNodeNames[NodeName] and not IsEmptyTable(LeafNodes) then
      ReddotManager.AddListener(NodeName, self, function(self, Count)
        Tab.IsNew = Count > 0
        if Tab.UI then
          Tab.UI:SetReddot(Tab.IsNew)
        end
      end, LeafNodes)
      self.TabNodeNames[NodeName] = 1
    end
  end
end

function M:RemoveAccessoryTabReddotListen()
  if self.NoReddot then
    return
  end
  for NodeName, _ in pairs(self.TabNodeNames or {}) do
    ReddotManager.RemoveListener(NodeName, self)
  end
  self.TabNodeNames = nil
end

function M:SetCurrentTabItemsReddotsRead()
  if self.NoReddot then
    return
  end
  if self.FilteredContents then
    for key, Content in pairs(self.FilteredContents) do
      if Content.RedDotType then
        ArmoryUtils:SetItemReddotRead(Content, true)
      end
    end
  end
end

function M:OnCharAccessoryTabClicked(TabWidget)
  local Tab = self.AccessoryTabsArray[TabWidget.Idx]
  if self.ActorController then
    self.ActorController:ResetActorRotation()
    if self.HidePlayerAccessoryTypes[Tab.AccessoryType] then
      self.ActorController:HidePlayerActor(self.UIName, true)
    else
      self.ActorController:HidePlayerActor(self.UIName, false)
    end
  end
  self:RecoverAccessory()
  self:SetCurrentTabItemsReddotsRead()
  self.CurrentAccessoryTabIdx = Tab.Idx
  self.CurrentAccessoryTabWidget = TabWidget
  self.NoneAccessory.bSelectTag = false
  self.NoneAccessory.IsSelect = false
  self.NoneAccessory.AccessoryType = Tab.AccessoryType
  self.NoneAccessory.Id = self.DefaultCharAccessoryIds[Tab.AccessoryType] or self.NoneAccessoryId
  self.NoneAccessory.AccessoryId = self.NoneAccessory.Id
  self.CurrentContent = self.NoneAccessory
  if self.ComparedContent then
    self.ComparedContent.IsSelect = false
  end
  self.ComparedContent = nil
  self:InitCharAccessoryList()
  self.JumpToAccessoryId = nil
  self.JumpToCharAccessoryType = nil
  self.CurrentContent.bSelectTag = true
  self.ComparedContent = self.ComparedContent or self.CurrentContent
  self.CurrentContent.IsSelect = true
  self:SelectAccessoryItem(self.ComparedContent)
  if self.NoneAccessory.SelfWidget then
    self.NoneAccessory.SelfWidget:OnListItemObjectSet(self.NoneAccessory)
  end
  self.List_Accessory:BP_ScrollItemIntoView(self.CurrentContent)
end

function M:InitCharAccessoryList()
  local Tab = self.AccessoryTabsArray[self.CurrentAccessoryTabIdx]
  local Len = self.BP_AccessoryContents:Length()
  local FilteredContents = {}
  for i = 1, Len do
    local Content = self.BP_AccessoryContents[i]
    if Content.AccessoryId and Content.AccessoryType == Tab.AccessoryType and Content.AccessoryId ~= self.NoneAccessory.Id and not Content.IsHide then
      table.insert(FilteredContents, Content)
    end
  end
  self:InitList(FilteredContents)
end

function M:InitList(FilteredContents)
  self.FilteredContents = FilteredContents
  self.List_Accessory:ClearListItems()
  table.sort(FilteredContents, function(a, b)
    if a.LockType and b.LockType or not a.LockType and not b.LockType then
      if a.SortPriority == b.SortPriority then
        return a.AccessoryId > b.AccessoryId
      end
      return a.SortPriority > b.SortPriority
    else
      return b.LockType
    end
  end)
  self.List_Accessory:SetVisibility(UIConst.VisibilityOp.Visible)
  self.List_Accessory:AddItem(self.NoneAccessory)
  for _, Content in ipairs(FilteredContents) do
    if self.JumpToAccessoryId and self.JumpToAccessoryId == Content.AccessoryId then
      self.ComparedContent = Content
    end
    if Content.bSelectTag then
      self.CurrentContent = Content
      if self.IsCharacterTrialMode then
        Content.TryOutText = GText("UI_CharPreview_Accessory_In_Trial")
      end
    end
    self.List_Accessory:AddItem(Content)
  end
  self.List_Accessory:RequestFillEmptyContent()
  self.List_Accessory:RequestPlayEntriesAnim()
end

function M:RecoverAccessory()
  if self.Type == CommonConst.ArmoryType.Char then
    self.ActorController:DestoryCreature(CommonConst.CharAccessoryTypes.FX_Dead)
    self.ActorController:DestoryCreature(CommonConst.CharAccessoryTypes.FX_Body)
    self.ActorController:StopPlayerFX()
    self.ActorController:StopPlayerMontage()
  end
  if not self.ComparedContent or self.ComparedContent == self.CurrentContent then
    return
  end
  if self.Type == CommonConst.ArmoryType.Char then
    self.ActorController:ChangeCharAccessory(self.CurrentContent.AccessoryId, self.CurrentContent.AccessoryType)
  else
    self.ActorController:ChangeWeaponAccessory(self.CurrentContent.AccessoryId)
  end
end

function M:OnAccessoryItemClicked(Content)
  self:TrySelectAccessoryItem(Content)
end

function M:TrySelectAccessoryItem(Content)
  if self.ComparedContent == Content or not Content.Icon then
    return
  end
  AudioManager(self):PlayUISound(self, "event:/ui/common/click", nil, nil)
  if Content.AccessoryId then
    AudioManager(self):PlayItemSound(self, Content.AccessoryId, "Equip", Content.SoundDataName)
  end
  self:SelectAccessoryItem(Content)
end

function M:SelectAccessoryItem(Content)
  ArmoryUtils:SetItemIsSelected(self.ComparedContent, false)
  self.ComparedContent = Content
  ArmoryUtils:SetItemIsSelected(self.ComparedContent, true)
  self:UpdateAccessoryDetails(Content)
  if self.Type == CommonConst.ArmoryType.Char then
    self.ActorController:StopPlayerFX()
    if self.FXAccessoryTypes[Content.AccessoryType] then
      self.ActorController:ShowPlayerFXAccessory(Content.AccessoryId, Content.AccessoryType)
    else
      self.ActorController:StopPlayerMontage()
      self.ActorController:ChangeCharAccessory(Content.AccessoryId, Content.AccessoryType)
    end
  else
    self.ActorController:ChangeWeaponAccessory(Content.AccessoryId)
  end
end

function M:OnCharAccessoryConfirmBtnClicked()
  if not self.ComparedContent then
    return
  end
  if self.ComparedContent.LockType then
    return
  end
  self:BlockAllUIInput(true)
  local Avatar = GWorld:GetAvatar()
  if self.ComparedContent == self.NoneAccessory then
    if self.CurrentContent == self.PartMeshAccessory then
      Avatar:SetCharSkinShowPart(self.Target.Uuid, self.SelectedSkinId, false)
    elseif self.CurrentContent == self.HornAccessory then
      Avatar:SetCharCornerVisibility(self.Target.Uuid, self.AppearanceSutiIndex, false)
    else
      Avatar:RemoveCharAppearanceAccessory(self.Target.Uuid, self.AppearanceSutiIndex, self.CurrentContent.AccessoryId)
    end
  elseif self.ComparedContent == self.PartMeshAccessory then
    Avatar:SetCharSkinShowPart(self.Target.Uuid, self.SelectedSkinId, true)
  elseif self.ComparedContent == self.HornAccessory then
    Avatar:SetCharCornerVisibility(self.Target.Uuid, self.AppearanceSutiIndex, true)
  else
    Avatar:SetCharAppearanceAccessory(self.Target.Uuid, self.AppearanceSutiIndex, self.ComparedContent.AccessoryId)
  end
end

function M:OnCharAccessoryChanged(Ret, CharUuid, CharAccessoryIndex)
  self:BlockAllUIInput(false)
  if Ret == ErrorCode.RET_SUCCESS then
    local Avatar = GWorld:GetAvatar()
    self.Target = Avatar.Chars[CharUuid]
    self:OnEquipedCharAccessoryContentChanged()
    self:UpdateAccessoryDetails(self.CurrentContent)
  else
    UIManager(self):ShowError(Ret, 1.5)
  end
end

function M:OnCharAppearanceChanged(Ret, CharUuid, CharAccessoryIndex)
  self:BlockAllUIInput(false)
  if Ret == ErrorCode.RET_SUCCESS then
    local Avatar = GWorld:GetAvatar()
    self.Target = Avatar.Chars[CharUuid]
  else
    UIManager(self):ShowError(Ret, 1.5)
  end
end

function M:OnCharShowPartMesh(Ret, CharUuid, CharAccessorySuitIndex, IsShowPartMesh)
  self:BlockAllUIInput(false)
  if Ret == ErrorCode.RET_SUCCESS then
    local Avatar = GWorld:GetAvatar()
    self.Target = Avatar.Chars[CharUuid]
    self:OnEquipedCharAccessoryContentChanged()
    self:UpdateAccessoryDetails(self.CurrentContent)
  else
    UIManager(self):ShowError(Ret, 1.5)
  end
end

function M:OnCharCornerVisibilityChanged(Ret, CharUuid)
  self:BlockAllUIInput(false)
  if Ret == ErrorCode.RET_SUCCESS then
    local Avatar = GWorld:GetAvatar()
    self.Target = Avatar.Chars[CharUuid]
    self:OnEquipedCharAccessoryContentChanged()
    self:UpdateAccessoryDetails(self.CurrentContent)
  else
    UIManager(self):ShowError(Ret, 1.5)
  end
end

function M:InitWeaponSkin()
  local SkinId = self.JumpToSkinId or self.SelectedSkinId
  self.JumpToSkinId = nil
  self.WidgetSwitcher_State:SetActiveWidgetIndex(1)
  self:InitWeaponSkinList()
  self:SelectSkinById(SkinId, true)
  self:AddTimer(0.01, function()
    self.IsSkinWidgetNotReady = false
  end)
end

function M:InitWeaponSkinList()
  if self.bWeaponSkinListInited then
    return
  end
  self.bWeaponSkinListInited = true
  self.SkinMap = {}
  self.SkinArray = {}
  local Avatar = GWorld:GetAvatar()
  local CurWeaponId = self.Target.WeaponId
  local CurSkin = self.Target:GetCurrentSkin() or {}
  local CurSkinId = CurSkin.SkinId or CurWeaponId
  local LeafNodeNamePre = CommonConst.DataType.WeaponSkin
  for SkinId, Data in pairs(DataMgr.WeaponSkin) do
    if UIUtils.CanApplyWeaponSkin(CurWeaponId, Data.ApplicationType) then
      local CacheDetail = {}
      if not self.NoReddot then
        CacheDetail = ReddotManager.GetLeafNodeCacheDetail(LeafNodeNamePre .. (Data.ApplicationType or "")) or {}
      end
      local Obj = {
        SkinId = Data.SkinID,
        IconPath = Data.LongIcon,
        Name = GText(Data.Name),
        Name_World = EnText(Data.Name),
        Rarity = Data.Rarity,
        Text = GText(Data.Dec),
        Owner = self,
        OnClicked = self.OnSkinItemClicked,
        bDyeable = true,
        IsNew = 1 == CacheDetail[SkinId],
        ItemType = CommonConst.DataType.WeaponSkin,
        IsTargetUnowned = self.IsTargetUnowned
      }
      if Avatar.OwnedWeaponSkins[SkinId] then
        Obj.LockType = false
      else
        Obj.LockType = SkinId ~= CurWeaponId
      end
      local WeaponTypeInfo = DataMgr.WeaponTypeContrast[Data.ApplicationType]
      if WeaponTypeInfo then
        Obj.CharName = string.format(GText("UI_SkinPreview_WeaponType"), GText(WeaponTypeInfo.WeaponTagTextmap))
        Obj.WeaponTypeIcon = WeaponTypeInfo.Icon
      end
      self.SkinMap[Obj.SkinId] = Obj
      table.insert(self.SkinArray, Obj)
      self:OnSkinContentCreated(Obj)
    end
  end
  table.sort(self.SkinArray, function(a, b)
    return a.SkinId < b.SkinId
  end)
  local WeaponData = self.Target:Data()
  local DefaultSkin = {
    SkinId = CurWeaponId,
    IconPath = WeaponData.LongIcon or WeaponData.GachaIcon,
    Owner = self,
    OnClicked = self.OnSkinItemClicked,
    bDyeable = true,
    IsTargetUnowned = self.IsTargetUnowned
  }
  self.SkinMap[DefaultSkin.SkinId] = DefaultSkin
  table.insert(self.SkinArray, 1, DefaultSkin)
  self:OnSkinContentCreated(DefaultSkin)
  if CurSkinId and self.SkinMap[CurSkinId] then
    self.CurrentSkinContent = self.SkinMap[CurSkinId]
    self.CurrentSkinContent.IsEquipped = true
  end
  self:InitSkinWidgets()
end

function M:OnWeaponSkinChanged(Ret, WeaponUuid, SkinId)
  self:BlockAllUIInput(false)
  if not ErrorCode:Check(Ret) then
    return
  end
  self:ResetTarget()
  if self.CurrentSkinContent then
    self:SetSkinIsCurrentUse(self.CurrentSkinContent, false)
  end
  self.CurrentSkinContent = self.SkinMap[SkinId]
  self:SetSkinIsCurrentUse(self.CurrentSkinContent, true)
  self:UpdateFunctionBtn(self.CurrentSkinContent)
end

function M:OnWeaponSkinConfirmBtnClicked()
  if not self.SelectedSkinId or self.SelectedSkinId <= 0 then
    return
  end
  self:BlockAllUIInput(true)
  local Avatar = GWorld:GetAvatar()
  Avatar:ChangeWeaponAppearanceSkin(self.Target.Uuid, self.SelectedSkinId)
end

function M:InitWeaponAccessory()
  self.WidgetSwitcher_State:SetActiveWidgetIndex(0)
  self:CreateWeaponAccessoryContents(self.Target)
  if self.ArmoryHelper then
    self.ArmoryHelper:ResetRotation()
  end
  self.NoneAccessory.bSelectTag = false
  self.NoneAccessory.IsSelect = false
  self.CurrentContent = self.NoneAccessory
  if #self.Array_WeaponAccessoryContents <= 0 then
    self.List_Accessory:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self:UpdateAccessoryDetails(self.CurrentContent)
    return
  end
  if self.ComparedContent then
    self.ComparedContent.IsSelect = false
  end
  self.ComparedContent = nil
  self:InitWeaponAccessoryList()
  self:SelectAccessoryItem(self.ComparedContent)
  self.List_Accessory:BP_ScrollItemIntoView(self.ComparedContent)
end

local function AddWeaponAccessoryContent(self, AccessoryId)
  local Data = DataMgr.WeaponAccessory[AccessoryId]
  local Content = self:CreateWeaponAccessoryContent(Data)
  if Content then
    Content.SoundDataName = "WeaponAccessory"
    self.BP_AccessoryContents:Add(Content)
    self.Map_AccessoryContents[AccessoryId] = Content
    table.insert(self.Array_WeaponAccessoryContents, Content)
    self:CheckWeaponAccessoryContentReddot(AccessoryId)
    self:OnAccessoryContentCreated(Content)
  end
end

function M:CheckWeaponAccessoryContentReddot(AccessoryId)
  if self.NoReddot then
    return
  end
  local Content = self.Map_AccessoryContents[AccessoryId]
  if not Content then
    return
  end
  local CacheDetail = {}
  local ReddotName = CommonConst.DataType.WeaponAccessory
  if ReddotManager.GetTreeNode(ReddotName) then
    CacheDetail = ReddotManager.GetLeafNodeCacheDetail(CommonConst.DataType.WeaponAccessory) or {}
  end
  Content.RedDotType = 1 == CacheDetail[AccessoryId] and UIConst.RedDotType.NewRedDot
end

function M:CreateWeaponAccessoryContents(Weapon, bRecreate)
  if self.IsAccessoryContentsCreated and not bRecreate then
    return
  end
  self.IsAccessoryContentsCreated = true
  self.CurrentContent = nil
  self.ComparedContent = nil
  self.NoneAccessory = NewObject(UIUtils.GetCommonItemContentClass())
  self.NoneAccessory.Id = -1
  self.NoneAccessory.Parent = self
  self.NoneAccessory.Icon = UIUtils.GetNoneAccessoryIconPath()
  self.NoneAccessory.ItemType = CommonConst.DataType.WeaponAccessory
  self.BP_AccessoryContents:Clear()
  self.BP_AccessoryContents:Add(self.NoneAccessory)
  self:OnAccessoryContentCreated(self.NoneAccessory)
  self.Map_AccessoryContents = {}
  self.Array_WeaponAccessoryContents = {}
  for AccessoryId, Data in pairs(DataMgr.WeaponAccessory) do
    AddWeaponAccessoryContent(self, AccessoryId)
  end
  local Avatar = GWorld:GetAvatar()
  for key, AccessoryId in pairs(Avatar.WeaponAccessorys) do
    local Content = self.Map_AccessoryContents[AccessoryId]
    if Content then
      Content.IsHide = nil
      Content.LockType = nil
    end
  end
  local AppearanceSuit = Weapon:GetAppearance()
  for _, AccessoryId in pairs(AppearanceSuit.Accessory) do
    local Content = self.Map_AccessoryContents[AccessoryId]
    if Content then
      Content.bSelectTag = true
    end
  end
end

function M:OnAccessoryContentCreated(Content)
end

function M:CreateWeaponAccessoryContent(Data)
  local Obj = NewObject(UIUtils.GetCommonItemContentClass())
  Obj.ItemType = CommonConst.DataType.WeaponAccessory
  Obj.Icon = Data.Icon or ""
  Obj.Id = Data.WeaponAccessoryId
  Obj.AccessoryId = Data.WeaponAccessoryId
  Obj.SortPriority = Data.SortPriority or 0
  Obj.LockType = 2
  Obj.IsHide = Data.IsHide
  Obj.bSelectTag = false
  Obj.IsSelect = false
  Obj.UnlockOptionText = GText(Data.UnlockOption or "")
  Obj.Parent = self
  Obj.Rarity = Data.Rarity or 0
  return Obj
end

function M:InitWeaponAccessoryList()
  self.List_Accessory:ClearListItems()
  table.sort(self.Array_WeaponAccessoryContents, function(a, b)
    if a.LockType and b.LockType or not a.LockType and not b.LockType then
      if a.SortPriority == b.SortPriority then
        return a.AccessoryId > b.AccessoryId
      end
      return a.SortPriority > b.SortPriority
    else
      return b.LockType
    end
  end)
  self.List_Accessory:AddItem(self.NoneAccessory)
  self.List_Accessory:SetVisibility(UIConst.VisibilityOp.Visible)
  self.FilteredContents = {}
  for _, Content in ipairs(self.Array_WeaponAccessoryContents) do
    if not Content.IsHide then
      if self.JumpToAccessoryId and self.JumpToAccessoryId == Content.AccessoryId then
        self.ComparedContent = Content
      end
      if Content.bSelectTag then
        self.CurrentContent = Content
      end
      self.List_Accessory:AddItem(Content)
      table.insert(self.FilteredContents, Content)
    end
  end
  self.JumpToAccessoryId = nil
  self.CurrentContent.bSelectTag = true
  self.ComparedContent = self.ComparedContent or self.CurrentContent
  self.ComparedContent.IsSelect = true
end

function M:OnWeaponAccessoryConfirmBtnClicked()
  if not self.ComparedContent then
    return
  end
  if self.ComparedContent.LockType then
    return
  end
  self:BlockAllUIInput(true)
  local Avatar = GWorld:GetAvatar()
  if self.ComparedContent.AccessoryId then
    Avatar:ChangeWeaponAppearanceAccessory(self.Target.Uuid, self.ComparedContent.AccessoryId)
  else
    Avatar:ChangeWeaponAppearanceAccessory(self.Target.Uuid, -1)
  end
end

function M:OnWeaponAccessoryChanged(Ret, WeaponUuid, AccessoryId)
  self:BlockAllUIInput(false)
  if not ErrorCode:Check(Ret) then
    return
  end
  self:ResetTarget()
  self:OnEquipedCharAccessoryContentChanged()
  self:UpdateAccessoryDetails(self.CurrentContent)
end

function M:IsNoneAccessory(Content)
end

function M:UpdateAccessoryDetails(Content)
  if self.Type == "Char" then
    local AccessoryType
    if self.CurrentAccessoryTabIdx then
      local CurrentTab = self.AccessoryTabsArray[self.CurrentAccessoryTabIdx]
      AccessoryType = CurrentTab and CurrentTab.AccessoryType
    end
    self:UpdateAccessoryCamera(Content.AccessoryId, AccessoryType)
  end
  self.Panel_Buy:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Btn_Function:UnBindEventOnClickedByObj(self)
  if self.CurrentContent == Content then
    self.WidgetSwitcher_BtnState:SetActiveWidgetIndex(self.BtnWidgetState.Equipped)
    self.Text_Desc:SetText(GText("UI_Accessory_Equipped"))
    if self.IsCharacterTrialMode or self.IsTargetUnowned then
      self.Btn_Function:SetText(GText("UI_CharPreview_Accessory_In_Trial"))
    end
  elseif Content.LockType then
    local ShopItemId = self:GetShopItemByAccessoryId(Content.AccessoryId)
    local ShopItemData = ShopItemId and DataMgr.ShopItem[ShopItemId]
    local CanBuy = false
    local Price
    if ShopItemData then
      Price = ShopUtils:GetShopItemPrice(ShopItemData.ItemId)
      ShopItemData = setmetatable({}, {__index = ShopItemData})
      local CanPurchase = ShopUtils:CanPurchase(ShopItemData, ShopItemData.PriceType, Price)
      CanBuy = ShopUtils:GetShopItemCanShow(ShopItemId) and CanPurchase
    end
    if CanBuy then
      if not self.IsPreviewMode then
        self.Panel_Buy:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
      end
      self.WidgetSwitcher_BtnState:SetActiveWidgetIndex(self.BtnWidgetState.Unequipped)
      self.Btn_Function:SetText(GText("UI_SHOP_PURCHASE"))
      local ShopItemData = DataMgr.ShopItem[ShopItemId]
      local PriceType = ShopItemData.PriceType
      local Avatar = GWorld:GetAvatar()
      local ResourceCount = Avatar.Resources[PriceType] and Avatar.Resources[PriceType].Count or 0
      local FakeDenominator
      if Price > ResourceCount then
        FakeDenominator = Price + ResourceCount
      else
        FakeDenominator = Price
      end
      self.WBP_Com_Cost:InitContent({
        ResourceId = ShopItemData.PriceType,
        Denominator = FakeDenominator,
        Numerator = Price
      })
      if Price > ResourceCount then
        self.Btn_Function:ForbidBtn(true)
      else
        self.Btn_Function:ForbidBtn(false)
        self.Btn_Function:BindEventOnClicked(self, self.OnBuyBtnClicked)
        self.ConfirmBtnFunc = self.OnBuyBtnClicked
      end
    else
      self.WidgetSwitcher_BtnState:SetActiveWidgetIndex(self.BtnWidgetState.Locked)
      if Content.UnlockOptionText and Content.UnlockOptionText ~= "" then
        self.Text_Lock:SetText(Content.UnlockOptionText)
        self.Btn_Function:ForbidBtn(true)
      else
        self.Text_Lock:SetText(GText("UI_Aaccessory_Locked"))
        self.Btn_Function:ForbidBtn(true)
      end
    end
    if self.IsCharacterTrialMode then
      self.WidgetSwitcher_BtnState:SetActiveWidgetIndex(self.BtnWidgetState.Locked)
      if Content.UnlockOptionText and Content.UnlockOptionText ~= "" then
        self.Text_Lock:SetText(Content.UnlockOptionText)
      else
        self.Text_Lock:SetText(GText("UI_Aaccessory_Locked"))
      end
    end
  else
    self.WidgetSwitcher_BtnState:SetActiveWidgetIndex(self.BtnWidgetState.Unequipped)
    self.Btn_Function:SetText(GText("UI_Accessory_Equip"))
    self.Btn_Function:BindEventOnClicked(self, self.OnConfirmBtnClicked)
    self.ConfirmBtnFunc = self.OnConfirmBtnClicked
    self.Btn_Function:ForbidBtn(false)
    if self.IsCharacterTrialMode or self.IsTargetUnowned then
      self.Btn_Function:SetText(GText("UI_CharPreview_Cannot_Equip"))
      self.Btn_Function:ForbidBtn(true)
    end
  end
  if Content == self.NoneAccessory then
    self.VB_Info:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.Tag_Quality:SetVisibility(ESlateVisibility.Collapsed)
    return
  end
  self.VB_Info:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  local Data
  if self.Type == CommonConst.ArmoryType.Char then
    Data = DataMgr.CharAccessory[Content.AccessoryId] or DataMgr.CharPartMesh[Content.AccessoryId]
    self.Text_CharName:SetText(GText(UIConst.AccessoryTypeTextMap[Data.AccessoryType] or ""))
  else
    Data = DataMgr.WeaponAccessory[Content.AccessoryId]
    self.Text_CharName:SetText(GText(UIConst.AccessoryTypeTextMap.WeaponAccessory))
  end
  local SkinNameFont = {
    nil,
    nil,
    "Font_Blue",
    "Font_Purple",
    "Font_Gold",
    "Font_Red"
  }
  if Data.Rarity and SkinNameFont[Data.Rarity] and self[SkinNameFont[Data.Rarity]] then
    self.Text_Name:SetFont(self[SkinNameFont[Data.Rarity]])
  end
  self.Text_Name:SetText(GText(Data.Name))
  self.Text_Info:SetText(GText(Data.Des))
  self.Text_SkinName_World:SetText(EnText(Data.Name))
  self.Text_Char_None:SetVisibility(ESlateVisibility.Collapsed)
  self.Image_Element:SetVisibility(ESlateVisibility.Collapsed)
  self.Tag_Quality:SetVisibility(ESlateVisibility.Collapsed)
  local AccessoryIconPath = ArmoryUtils:GetCharNoneAccessoryIconPaths()[Data.AccessoryType]
  if AccessoryIconPath then
    local AccessoryIcon = LoadObject(AccessoryIconPath)
    self.Image_Element:SetBrushResourceObject(AccessoryIcon)
    self.Image_Element:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  end
  if Data.Rarity then
    self.Tag_Quality:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self.Tag_Quality:Init(Data.Rarity)
  end
  if not self:IsAnimationPlaying(self.In) then
    self:PlayAnimation(self.Change)
  end
  if Content ~= self.NoneAccessory and Content.RedDotType and not self.NoReddot then
    ArmoryUtils:SetItemReddotRead(Content, true)
  end
end

function M:OnBuyBtnClicked()
  local ShopItemId = self:GetShopItemByAccessoryId(self.ComparedContent.AccessoryId)
  local ShopItemData = DataMgr.ShopItem[ShopItemId]
  if not ShopItemData then
    return
  end
  local Price = ShopUtils:GetShopItemPrice(ShopItemData.ItemId)
  UIManager(self):ShowCommonPopupUI(100041, {
    ShopItemData = ShopItemData,
    ShopType = 0,
    Funds = {
      {
        FundId = ShopItemData.PriceType,
        FundNeed = Price
      }
    },
    ShowParentTabCoin = true,
    RightCallbackObj = self,
    RightCallbackFunction = self.PurchaseAccessory
  }, self)
end

function M:PurchaseAccessory()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  local ShopItemId = self:GetShopItemByAccessoryId(self.ComparedContent.AccessoryId)
  local ShopItemData = DataMgr.ShopItem[ShopItemId]
  if not ShopItemData then
    return
  end
  self:BlockAllUIInput(true)
  Avatar:PurchaseShopItem(ShopItemData.ItemId, 1)
end

function M:OnPurchaseShopItem(Ret)
  self:BlockAllUIInput(false)
  if Ret ~= ErrorCode.RET_SUCCESS then
    return
  end
end

function M:OnWeaponColorsChanged()
  self:ResetTarget()
end

function M:OnEquipedCharAccessoryContentChanged()
  ArmoryUtils:SetItemSelectTag(self.CurrentContent, false)
  ArmoryUtils:SetItemSelectTag(self.ComparedContent, true)
  self.CurrentContent = self.ComparedContent
  if self.CurrentContent.AccessoryType then
    self[self.CurrentContent.AccessoryType .. "Content"] = self.CurrentContent
  end
end

function M:GetShopItemByAccessoryId(AccessoryId)
  local ItemType = self.Type .. "Accessory"
  local Data = DataMgr.TypeId2ShopItem[ItemType]
  return Data and Data[AccessoryId] and Data[AccessoryId][1]
end

function M:OnHideUIKeyDown()
  self.bSelfHidden = not self.bSelfHidden
  if self.bSelfHidden then
    self:SetRenderOpacity(0)
    self.Image_Click.Slot:SetZOrder(10)
  else
    self:SetRenderOpacity(1)
    self.Image_Click.Slot:SetZOrder(-1)
  end
end

function M:ResetTarget()
  if self.IsPreviewMode then
    return
  end
  local Avatar = ArmoryUtils:GetAvatar()
  if self.Type == CommonConst.ArmoryType.Char then
    self.Target = Avatar.Chars[self.Target.Uuid] or self.Target
  else
    self.Target = Avatar.Weapons[self.Target.Uuid] or self.Target
  end
end

function M:OpenDye()
  local Params = {
    Target = self.Target,
    Type = self.Type,
    SkinId = self.SelectedSkinId,
    IsPreviewMode = self.IsPreviewMode,
    Parent = self,
    OnCloseCallback = function()
      self:ResetTarget()
    end
  }
  if Params.Target and 1 == Params.Target.Uuid then
    Params.Target.Uuid = Params.SkinId
    local RealAvatar = ArmoryUtils:GetAvatar()
    if RealAvatar and self.Type == CommonConst.ArmoryType.Char and RealAvatar.Chars then
      for CharUuid, RealChar in pairs(RealAvatar.Chars) do
        if RealChar.CharId == Params.Target.CharId then
          Params.Target = RealChar
          Params.bRealCharOrWeapon = true
          break
        end
      end
    elseif self.Type == CommonConst.ArmoryType.Weapon and RealAvatar.Weapons then
      for WeaponUuid, RealWeapon in pairs(RealAvatar.Weapons) do
        if RealWeapon.WeaponId == Params.Target.WeaponId then
          Params.Target = RealWeapon
          Params.bRealCharOrWeapon = true
          break
        end
      end
    end
  elseif Params.Target and 1 ~= Params.Target.Uuid then
    Params.bRealCharOrWeapon = true
  end
  local UIConfig = DataMgr.SystemUI.ArmoryDye
  if self.Parent then
    UIManager(self):LoadUI(UIConst.LoadInConfig, UIConfig.UIName, self:GetZOrder(), Params)
  else
    UIManager(self):LoadUI(UIConst.LoadInConfig, UIConfig.UIName, 100, Params)
  end
end

function M:PlayInAnim()
  self:BlockAllUIInput(true)
  if self.InAnimStyle then
    self.ComBgSwitch = self:CreateWidgetNew("ComBgSwitch")
    if self.ComBgSwitch then
      self.ComBgSwitch:AddToViewport(self:GetZOrder())
      self.ComBgSwitch:PlayAnimation(self.ComBgSwitch.In)
      self.ComBgSwitch:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
      self:SetRenderOpacity(0)
      self:AddTimer(0.3, function()
        self:SetRenderOpacity(1)
        self:Init(self.Params)
        self:StopAnimation(self.Out)
        self:PlayAnimation(self.In)
      end, false, 0, "DelayInit")
    end
  else
    self:StopAnimation(self.Out)
    self:PlayAnimation(self.In)
  end
end

function M:PlayOutAnim()
  self:StopAnimation(self.In)
  self:PlayAnimation(self.Out)
  if self.IsPreviewMode and self.ActorController then
    self.ActorController:OnClosed()
  end
  AudioManager(self):SetEventSoundParam(self, "SkinOpen", {ToEnd = 1})
  self:BlockAllUIInput(true)
end

function M:OnInAnimFinished()
  self:BlockAllUIInput(false)
end

function M:OnOutAnimFinished()
  self:Close()
end

function M:RealClose()
  M.Super.RealClose(self)
  if self.OnCloseCallback then
    self.OnCloseCallback(self.Parent)
  end
end

function M:Destruct()
  M.Super.Destruct(self)
  self:RemoveAccessoryTabReddotListen()
  if self.ActorController then
    self.ActorController:HidePlayerActor(self.UIName, false)
  end
  self:RemoveTimer("DelayInit")
  if IsValid(self.ComBgSwitch) then
    self.ComBgSwitch:RemoveFromParent()
  end
  self:RemoveTopTabReddotListen()
  if self.CurrentSkinContent and not self.IsPreviewMode then
    self:UpdateActorAppearance(self.CurrentSkinContent.SkinId)
  end
end

AssembleComponents(M)
return M
