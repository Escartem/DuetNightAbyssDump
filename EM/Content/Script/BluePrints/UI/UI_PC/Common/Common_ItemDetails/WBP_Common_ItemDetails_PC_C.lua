require("UnLua")
local Handled = UE4.UWidgetBlueprintLibrary.Handled()
local M = Class({
  "BluePrints.UI.BP_UIState_C"
})

function M:Construct()
  M.Super.Construct(self)
  self.Panel_Detail:SetRenderOpacity(0)
  self.bIsFocusable = true
  self:PlayAnimation(self.In)
  if CommonUtils.GetDeviceTypeByPlatformName(self) == "Mobile" then
    self:OverrideSizeX(self.PhoneSizeBoxWidth)
  else
    self:OverrideSizeX(self.PCSizeBoxWidth)
  end
  self.bShowLock = false
  self.Text_WeaponLevel01:SetText(GText("UI_LEVEL_NAME"))
  self.Text_Level01:SetText(GText("UI_LEVEL_NAME"))
  self.Text_Method:SetText(GText("UI_Tips_Obtining"))
  self.Line:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self:AddInputMethodChangedListen()
  self.Btn02_Mod:SetVisibility(ESlateVisibility.Collapsed)
  self.Btn01_Mod:SetVisibility(ESlateVisibility.Collapsed)
  self.Img_Aura:SetVisibility(ESlateVisibility.Collapsed)
  self.List_ModStar:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Btn02PadKey = UIConst.GamePadKey.FaceButtonTop
  self.Btn01PadKey = UIConst.GamePadKey.FaceButtonLeft
  self.LockPadKey = UIConst.GamePadKey.SpecialRight
  self._bFocusOnce = true
end

function M:Destruct()
  self.btn02_mod:UnBindEventOnClickedByObj(self)
  self.btn01_mod:UnBindEventOnClickedByObj(self)
  self.Btn_Locked:UnBindEventOnClickedByObj(self)
  M.Super.Destruct(self)
end

function M:InitItemBaseInfo(ItemInfo)
  self.Text_Hold01:SetText(GText("UI_Bag_Sellconfirm_Hold"))
  self.Panel_Hold:SetVisibility(ESlateVisibility.Collapsed)
  local FontMaterial = self.Text_ItemName:GetDynamicFontMaterial()
  if 6 == ItemInfo.Rarity then
    FontMaterial:SetTextureParameterValue("IconTex", self.Img_Text_6)
  elseif 5 == ItemInfo.Rarity then
    FontMaterial:SetTextureParameterValue("IconTex", self.Img_Text_5)
  elseif 4 == ItemInfo.Rarity then
    FontMaterial:SetTextureParameterValue("IconTex", self.Img_Text_4)
  elseif 3 == ItemInfo.Rarity then
    FontMaterial:SetTextureParameterValue("IconTex", self.Img_Text_3)
  elseif 2 == ItemInfo.Rarity then
    FontMaterial:SetTextureParameterValue("IconTex", self.Img_Text_2)
  elseif 1 == ItemInfo.Rarity then
    FontMaterial:SetTextureParameterValue("IconTex", self.Img_Text_1)
  else
    FontMaterial:SetTextureParameterValue("IconTex", self.Img_Text_0)
  end
  self.Text_ItemName:SetText(GText(ItemInfo.Name or ItemInfo[self.Type .. "Name"]))
end

function M:RefreshItemInfo(Content, bNotFocus)
  self.Content = Content
  if not Content.IsArmoryMod and not bNotFocus and self._bFocusOnce then
    self:SetFocus()
    self._bFocusOnce = false
  end
  self.Btn02_Mod:SetVisibility(ESlateVisibility.Collapsed)
  self.Btn01_Mod:SetVisibility(ESlateVisibility.Collapsed)
  self.EMScrollBox_1:ScrollToStart()
  self.Type = Content.ItemType or Content.Type
  self.ItemId = Content.ItemId or Content.Id or Content.UnitId
  if Content.HandleKeyDown ~= nil then
    self.HandleKeyDown = Content.HandleKeyDown
  else
    self.HandleKeyDown = true
  end
  self.KeyDownEvent = Content.ItemDetailKeyDownEvent or Content.KeyDownEvent
  self.OnAddedToFocusPathEvent = Content.OnItemDetailAddedToFocusPathEvent or Content.OnAddedToFocusPathEvent
  self.OnRemovedFromFocusPathEvent = Content.OnItemRemovedFromFocusPathEvent or Content.OnRemovedFromFocusPathEvent
  self.Content = Content
  self.JumpReturnCallBack = Content.JumpReturnCallBack
  if self.Type ~= "Tips" then
    local ItemInfo
    if self.ItemId then
      ItemInfo = DataMgr[self.Type][self.ItemId]
      assert(ItemInfo, "\230\178\161\230\156\137\230\137\190\229\136\176\231\137\169\229\147\129\228\191\161\230\129\175" .. self.Type .. "," .. self.ItemId)
    else
      ItemInfo = {
        Name = Content.Name
      }
    end
    self.Text_Hold01:SetText(GText("UI_Bag_Sellconfirm_Hold"))
    local Rarity = ItemInfo.Rarity or ItemInfo[self.Type .. "Rarity"]
    if 6 == Rarity then
      self.OutLine_Quality:SetBrushFromTexture(self.Img_Line_6)
    elseif 5 == Rarity then
      self.OutLine_Quality:SetBrushFromTexture(self.Img_Line_5)
    elseif 4 == Rarity then
      self.OutLine_Quality:SetBrushFromTexture(self.Img_Line_4)
    elseif 3 == Rarity then
      self.OutLine_Quality:SetBrushFromTexture(self.Img_Line_3)
    elseif 2 == Rarity then
      self.OutLine_Quality:SetBrushFromTexture(self.Img_Line_2)
    elseif 1 == Rarity then
      self.OutLine_Quality:SetBrushFromTexture(self.Img_Line_1)
    end
    local FontMaterial = self.Text_ItemName:GetDynamicFontMaterial()
    if 6 == Rarity then
      FontMaterial:SetTextureParameterValue("IconTex", self.Img_Text_6)
    elseif 5 == Rarity then
      FontMaterial:SetTextureParameterValue("IconTex", self.Img_Text_5)
    elseif 4 == Rarity then
      FontMaterial:SetTextureParameterValue("IconTex", self.Img_Text_4)
    elseif 3 == Rarity then
      FontMaterial:SetTextureParameterValue("IconTex", self.Img_Text_3)
    elseif 2 == Rarity then
      FontMaterial:SetTextureParameterValue("IconTex", self.Img_Text_2)
    elseif 1 == Rarity then
      FontMaterial:SetTextureParameterValue("IconTex", self.Img_Text_1)
    else
      FontMaterial:SetTextureParameterValue("IconTex", self.Img_Text_0)
    end
    if not Rarity or 0 == Rarity then
      self.OutLine_Quality:SetVisibility(ESlateVisibility.Collapsed)
    else
      self.OutLine_Quality:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    end
    self.Text_ItemName:SetText(GText(ItemInfo.Name or ItemInfo[self.Type .. "Name"]))
  end
  self:InitItemDetails(self.Type, self.ItemId, Content.Uuid)
  self.Panel_Controller:SetVisibility(ESlateVisibility.Collapsed)
  local GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(GWorld.GameInstance)
  self:OnUpdateUIStyleByInputTypeChange(GameInputModeSubsystem:GetCurrentInputType(), GameInputModeSubsystem:GetCurrentGamepadName())
end

function M:OverrideSizeX(SizeX)
  self.SizeBox:SetWidthOverride(SizeX)
end

function M:InitItemDetails(ItemType, ItemId, Uuid)
  self.VerticalBox_Info:ClearChildren()
  self.Switch_Show:SetActiveWidgetIndex(0)
  local Avatar = GWorld:GetAvatar()
  self.Panel_Extra:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Switch_Bg:SetActiveWidgetIndex(0)
  self.Switch_Frame:SetActiveWidgetIndex(0)
  if self.Content and self.Content.DetailsButtonClickCallback then
    self.Switch_Bg:SetActiveWidgetIndex(1)
    self.Switch_Frame:SetActiveWidgetIndex(1)
    self.Panel_Extra:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    self.Line:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.Btn02_Mod:SetVisibility(ESlateVisibility.Visible)
    self.btn02_mod:SetText(self.Content.DetailsButtonText)
    self.btn02_mod:BindEventOnClicked(self.Content.Parent, self.Content.DetailsButtonClickCallback, self.Content)
  end
  local ItemInfoWidget
  if "Mod" == ItemType then
    if self.Content.IsArmoryMod then
      ItemInfoWidget = self:CreateWidgetNew("ArmoryModItemDetails")
    else
      ItemInfoWidget = self:CreateWidgetNew("ModItemDetails")
    end
    local HaloMod = DataMgr.Mod[self.ItemId]
    if HaloMod and HaloMod.ApplySlot and 1 == #HaloMod.ApplySlot and 9 == HaloMod.ApplySlot[1] then
      self.Img_Aura:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    else
      self.Img_Aura:SetVisibility(ESlateVisibility.Collapsed)
    end
  elseif "Tips" == ItemType or "Resource" == ItemType or "CharAccessory" == ItemType or "WeaponAccessory" == ItemType or "CharPartMesh" == ItemType or "RougeLikeBlessing" == ItemType or "RougeLikeTreasure" == ItemType or "HeadSculpture" == ItemType or "HeadFrame" == ItemType or "Skin" == ItemType or "WeaponSkin" == ItemType or "Title" == ItemType or "TitleFrame" == ItemType then
    if Avatar.Resources[ItemId] and Avatar.Resources[ItemId]:IsInfiniteBattleItem() and self:IsHasChar(ItemId) then
      self.Switch_Show:SetActiveWidgetIndex(1)
      ItemInfoWidget = self:CreateWidgetNew("PhantomItemDetails")
    else
      self.Panel_Extra:SetVisibility(UIConst.VisibilityOp.Collapsed)
      self.Switch_Bg:SetActiveWidgetIndex(0)
      self.Switch_Frame:SetActiveWidgetIndex(0)
      ItemInfoWidget = self:CreateWidgetNew("ResourceItemDetails")
    end
  elseif "Draft" == ItemType then
    ItemInfoWidget = self:CreateWidgetNew("DraftItemDetails")
  elseif "Weapon" == ItemType then
    self.Switch_Show:SetActiveWidgetIndex(2)
    ItemInfoWidget = self:CreateWidgetNew("WeaponItemDetails")
  elseif "Reward" == ItemType then
    ItemInfoWidget = self:CreateWidgetNew("RewardItemDetails")
  elseif "Pet" == ItemType then
    self.Switch_Show:SetActiveWidgetIndex(2)
    ItemInfoWidget = self:CreateWidgetNew("PetItemDetails")
  elseif "TreasureGroup" == ItemType then
    self.Text_Describe:SetVisibility(ESlateVisibility.Collapsed)
    if not self.Content.bGuide then
      self.Text_Describe:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
      self.Panel_Hold:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
      self.Switch_Show:SetActiveWidgetIndex(4)
      if self.Content.bActive then
        self.Text_Describe:SetText(GText("RLGroup_Active"))
      else
        self.Text_Describe:SetText(GText("RLGroup_InActive"))
      end
    else
      self.Panel_Hold:SetVisibility(ESlateVisibility.Collapsed)
    end
    ItemInfoWidget = self:CreateWidgetNew("DescribeDetails")
    ItemInfoWidget.Text_Describe:SetText(GText(DataMgr.TreasureGroup[ItemId].GroupEffectDesc))
    self.VerticalBox_Info:AddChild(ItemInfoWidget)
    return
  elseif self.Parent then
    self.Parent:Close()
    return
  end
  if not ("Resource" ~= ItemType and ("Mod" ~= ItemType or self.Content.IsArmoryMod)) or "CharPartMesh" == ItemType or "Draft" == ItemType or self.Content.bShowAccess then
    self:SetAccessItem(ItemType, ItemId)
  else
    self.Panel_Method:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  if ItemInfoWidget then
    self.ItemInfoWidget = ItemInfoWidget
    ItemInfoWidget.ParentWidget = self
    ItemInfoWidget:InitItemInfo(ItemType, ItemId, Uuid, self.Content)
    self.VerticalBox_Info:AddChild(ItemInfoWidget)
  end
end

function M:SetAccessItem(ItemType, ItemId)
  self.Method:ClearChildren(ItemType, ItemId)
  local ItemInfo = DataMgr[ItemType][ItemId]
  assert(ItemInfo, "\228\184\141\229\173\152\229\156\168\232\175\165\231\137\169\229\147\129\239\188\154", ItemType, ItemId)
  self.Key_Controller_Method:SetVisibility(ESlateVisibility.Collapsed)
  self.Panel_Method:SetVisibility(ESlateVisibility.Collapsed)
  if ItemInfo.AccessKey then
    for _, Access in pairs(ItemInfo.AccessKey) do
      PageJumpUtils:GetItemAccess(self, ItemId, ItemType, Access, self.Content.UIName, self.JumpReturnCallBack)
    end
    PageJumpUtils:SortAccessItem(self.Method)
    if self.Method:GetChildrenCount() > 0 then
      self.Panel_Method:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
      local CurMode = UIUtils.UtilsGetCurrentInputType()
      if CurMode == ECommonInputType.Gamepad and self:GetFirstJumpItem() then
        self.Key_Controller_Method:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
      end
    end
  end
end

function M:IsHasChar(ItemId)
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    for _, v in pairs(Avatar.Chars) do
      if v.CharId == DataMgr.Resource[ItemId].UseParam then
        return true
      end
    end
  end
  return false
end

function M:InitButtonStyle()
  self.Switch_Bg:SetActiveWidgetIndex(1)
  self.Switch_Frame:SetActiveWidgetIndex(1)
  self.Panel_Extra:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  self.Panel_Button:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  self.Line:SetVisibility(UIConst.VisibilityOp.Collapsed)
end

function M:RealInitButtonEvent(Widget, ButtonClickCallBack, ButtonClickText, bNotCloseTips)
  local function CallBack()
    if not bNotCloseTips and self.ParentWidget then
      self.ParentWidget:CloseItemDetailsWidget(true)
    end
    ButtonClickCallBack()
  end
  
  self:InitButtonStyle()
  Widget:SetText(GText(ButtonClickText))
  Widget:UnBindEventOnClickedByObj(self)
  Widget:BindEventOnClicked(self, CallBack)
end

function M:InitButtonEvent(Content)
  if not Content or not Content.ButtonClickCallBack then
    return
  end
  self.Btn02_Mod:SetVisibility(ESlateVisibility.Visible)
  if Content.ButtonClickPadKey then
    self.Btn02PadKey = Content.ButtonClickPadKey
  end
  self.WS_Icon_R:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  if 1 == Content.ButtonIcon then
    self.WS_Icon_R:SetActiveWidgetIndex(0)
  elseif 2 == Content.ButtonIcon then
    self.WS_Icon_R:SetActiveWidgetIndex(1)
  elseif 3 == Content.ButtonIcon then
    self.WS_Icon_R:SetActiveWidgetIndex(2)
  else
    self.WS_Icon_R:SetVisibility(ESlateVisibility.Collapsed)
  end
  self.Btn02_Mod:SetGamePadImg(DataMgr.KeyboardText[self.Btn02PadKey].KeyText)
  self:RealInitButtonEvent(self.Btn02_Mod, Content.ButtonClickCallBack, Content.ButtonClickText, Content.bNotCloseTips)
end

function M:HideButtons()
  self.Btn02_Mod:SetVisibility(ESlateVisibility.Collapsed)
  self.Btn01_Mod:SetVisibility(ESlateVisibility.Collapsed)
end

function M:InitButton01Event(Content)
  if not Content or not Content.ButtonClickCallBack then
    return
  end
  self.Btn01_Mod:SetVisibility(ESlateVisibility.Visible)
  if Content.ButtonClickPadKey then
    self.Btn01PadKey = Content.ButtonClickPadKey
  end
  self.WS_Icon_L:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  if 1 == Content.ButtonIcon then
    self.WS_Icon_L:SetActiveWidgetIndex(0)
  elseif 2 == Content.ButtonIcon then
    self.WS_Icon_L:SetActiveWidgetIndex(1)
  elseif 3 == Content.ButtonIcon then
    self.WS_Icon_L:SetActiveWidgetIndex(2)
  else
    self.WS_Icon_L:SetVisibility(ESlateVisibility.Collapsed)
  end
  self.Btn01_Mod:SetGamePadImg(DataMgr.KeyboardText[self.Btn01PadKey].KeyText)
  self:RealInitButtonEvent(self.Btn01_Mod, Content.ButtonClickCallBack, Content.ButtonClickText, Content.bNotCloseTips)
end

function M:InitLockedEvent(Content)
  if not Content or not Content.LockedButtonClickCallBack then
    return
  end
  if Content.LockPadKey then
    self.LockPadKey = Content.LockPadKey
  end
  self.bShowLock = true
  self.Btn_Locked:SetVisibility(ESlateVisibility.Visible)
  self.Switcher_Lock:SetActiveWidgetIndex(1)
  self.bLocked = false
  
  local function Callback()
    self.bLocked = not self.bLocked
    if self.bLocked then
      self.Switcher_Lock:SetActiveWidgetIndex(0)
    else
      self.Switcher_Lock:SetActiveWidgetIndex(1)
    end
    Content.LockedButtonClickCallBack()
  end
  
  self.Btn_Locked:BindEventOnClicked(self, Callback)
end

function M:SetConflictLine(bShow, Text, ColorNumber)
  if bShow then
    self.Line:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self.Line.Text_Level:SetText(GText(Text))
    if 1 == ColorNumber then
      self.Line.Bg02:SetColorAndOpacity(self.Line.Red)
    elseif 2 == ColorNumber then
      self.Line.Bg02:SetColorAndOpacity(self.Line.Yellow)
    else
      self.Line.Bg02:SetColorAndOpacity(self.Line.White)
    end
  else
    self.Line:SetVisibility(ESlateVisibility.Collapsed)
  end
end

function M:GetFirstJumpItem()
  local Items = self.Method:GetAllChildren():ToTable()
  local Item
  for k, v in pairs(Items) do
    if not v.IsText then
      Item = v
      break
    end
  end
  return Item
end

function M:FocusJumpItem()
  local Item = self:GetFirstJumpItem()
  if Item then
    local GameInputSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(self)
    GameInputSubsystem:SetShowFocusedWidget(nil)
    Item.Btn_Click:SetFocus()
  end
end

function M:OnKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local IsEventHandled = false
  if self.KeyDownEvent then
    local Reply
    Reply, IsEventHandled = self.KeyDownEvent.Callback(self.KeyDownEvent.Obj, MyGeometry, InKeyEvent, self.KeyDownEvent.Params)
    if IsEventHandled then
      return Reply
    end
  end
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) then
    IsEventHandled = self:OnGamePadDown(InKeyName)
  else
  end
  if IsEventHandled then
    return UE4.UWidgetBlueprintLibrary.Handled()
  else
    return UE4.UWidgetBlueprintLibrary.UnHandled()
  end
end

function M:TryGoToFirstItem()
  local Item = self:GetFirstJumpItem()
  if Item then
    self.bFocusItem = true
    self:FocusJumpItem()
    return true
  end
  return false
end

function M:OnGamePadDown(InKeyName)
  local IsEventHandled = self.HandleKeyDown
  if InKeyName == UIConst.GamePadKey.FaceButtonRight then
    if self.bFocusItem then
      self.bFocusItem = false
      self:SetFocus()
    elseif self.ParentWidget then
      self.ParentWidget:CloseItemDetailsWidget(true)
      local RootWidget = self.ParentWidget.ParentWidget
      if RootWidget and RootWidget.bIsFocusable then
        RootWidget:SetFocus()
      end
    end
  elseif InKeyName == UIConst.GamePadKey.SpecialLeft then
    self:TryGoToFirstItem()
  elseif InKeyName == self.LockPadKey then
    self.Btn_Locked:OnBtnClicked()
  elseif InKeyName == self.Btn02PadKey then
    self.Btn02_Mod:OnBtnClicked()
  elseif InKeyName == self.Btn01PadKey then
    self.Btn01_Mod:OnBtnClicked()
  end
  return IsEventHandled
end

function M:OnAnalogValueChanged(MyGeometry, InAnalogInputEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InAnalogInputEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if InKeyName == UIConst.GamePadKey.RightAnalogY then
    local DeltaOffset = -1 * UKismetInputLibrary.GetAnalogValue(InAnalogInputEvent) * 5
    local CurrentOffset = self.EMScrollBox_1:GetScrollOffset()
    local NextOffset = math.clamp(CurrentOffset + DeltaOffset, 0, self.EMScrollBox_1:GetScrollOffsetOfEnd())
    self.EMScrollBox_1:SetScrollOffset(NextOffset)
  end
  if self.HandleKeyDown then
    return UE4.UWidgetBlueprintLibrary.Handled()
  else
    return UE4.UWidgetBlueprintLibrary.UnHandled()
  end
end

function M:SetCallbacks(Callbacks)
  self.CallObj = Callbacks.CallObj
  self.OnMouseButtonDownCallback = Callbacks.OnMouseButtonDownCallback
end

function M:OnMouseButtonDown(MyGeometry, MouseEvent)
  if self.OnMouseButtonDownCallback then
    self.OnMouseButtonDownCallback(self.CallObj, MyGeometry, MouseEvent)
  end
  return Handled
end

function M:OnMouseButtonUp(MyGeometry, MouseEvent)
  return Handled
end

function M:OnMouseMove(MyGeometry, MouseEvent)
  return Handled
end

function M:OnMouseWheel(MyGeometry, MouseEvent)
  return Handled
end

function M:OnMouseButtonDoubleClick(MyGeometry, MouseEvent)
  return Handled
end

function M:OnMouseEnter(MyGeometry, MouseEvent)
  if self.Content.bIsHoverState and self.Parent and UIUtils.UtilsGetCurrentInputType() ~= ECommonInputType.Gamepad then
    self.Parent:Close()
  end
end

function M:OnUpdateUIStyleByInputTypeChange(CurInputDevice, CurGamepadName)
  local bHoverState = self.Content and not self.Content.bIsHoverState
  if CurInputDevice == UE4.ECommonInputType.Gamepad and bHoverState then
    if self.bShowLock then
      self.Key_Lock:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    end
    if self.Content and not self.Content.bHideGamePad then
      self.Panel_Controller:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    end
    if self:GetFirstJumpItem() then
      self.Key_Controller_Method:SetVisibility(ESlateVisibility.Visible)
    end
    self:InitGamepadView(CurGamepadName)
    self.Key_Confirm:SetVisibility(ESlateVisibility.Collapsed)
  elseif CurInputDevice == UE4.ECommonInputType.MouseAndKeyboard then
    self.Key_Lock:SetVisibility(ESlateVisibility.Collapsed)
    self.Panel_Controller:SetVisibility(ESlateVisibility.Collapsed)
    self.Key_Controller_Method:SetVisibility(ESlateVisibility.Collapsed)
  elseif CurInputDevice == UE4.ECommonInputType.Gamepad and self.Content and self.Content.ConfirmDesc then
    self.Key_Confirm:CreateCommonKey({
      KeyInfoList = {
        {
          Type = "Img",
          ImgLongPath = UIUtils.UtilsGetKeyIconPathInGamepad("A", CurGamepadName)
        }
      },
      Desc = GText(self.Content.ConfirmDesc)
    })
    if self.Content and not self.Content.bHideGamePad then
      self.Panel_Controller:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    end
    self.Key_Back:SetVisibility(ESlateVisibility.Collapsed)
    self.Key_Confirm:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  end
end

function M:InitGamepadView(CurGamepadName)
  self.Key_Back:CreateCommonKey({
    KeyInfoList = {
      {
        Type = "Img",
        ImgLongPath = UIUtils.UtilsGetKeyIconPathInGamepad("B", CurGamepadName)
      }
    },
    Desc = GText("UI_Tips_Close")
  })
  self.Key_Lock:CreateCommonKey({
    KeyInfoList = {
      {
        Type = "Img",
        ImgShortPath = DataMgr.KeyboardText[self.LockPadKey or UIConst.GamePadKey.SpecialRight].KeyText
      }
    }
  })
  self.Key_Controller_Method:CreateCommonKey({
    KeyInfoList = {
      {
        Type = "Img",
        ImgShortPath = DataMgr.KeyboardText[UIConst.GamePadKey.SpecialLeft].KeyText
      }
    }
  })
end

function M:OnAddedToFocusPath(InFocusEvent)
  if self.OnAddedToFocusPathEvent and type(self.OnAddedToFocusPathEvent) == "table" then
    self.OnAddedToFocusPathEvent.Callback(self.OnAddedToFocusPathEvent.Obj, self.OnAddedToFocusPathEvent.Params)
  end
end

function M:OnRemovedFromFocusPath(InFocusEvent)
  if self.OnRemovedFromFocusPathEvent and type(self.OnRemovedFromFocusPathEvent) == "table" then
    self.OnRemovedFromFocusPathEvent.Callback(self.OnRemovedFromFocusPathEvent.Obj, self.OnRemovedFromFocusPathEvent.Params)
  end
end

function M:PlayInAnim()
  self:StopAnimation(self.Out)
  self:PlayAnimation(self.In)
end

function M:PlayOutAnim()
  self:StopAnimation(self.In)
  self:PlayAnimation(self.Out)
end

return M
