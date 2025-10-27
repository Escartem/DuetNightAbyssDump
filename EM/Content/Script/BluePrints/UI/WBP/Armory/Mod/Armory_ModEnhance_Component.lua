local ModModel = ModController:GetModel()
local ArmoryUtils = require("BluePrints.UI.WBP.Armory.ArmoryUtils")

local function SetItemChosen(Content, bChosen)
  if not Content then
    return
  end
  if Content.IsChosen == bChosen then
    return
  end
  Content.IsChosen = bChosen
  if IsValid(Content.UI) then
    Content.UI:SetIsChosen(bChosen)
  end
end

local function SetItemSelected(Content, bSelected)
  if not Content then
    return
  end
  if Content.IsSelected == bSelected then
    return
  end
  Content.IsSelected = bSelected
  if IsValid(Content.UI) then
    Content.UI:SetIsSelected(bSelected)
  end
end

local function OnItemMouseButtonUpEvent(IntensifyMain, Content, MouseEvent)
  IntensifyMain:SelectContentChanged(Content)
  if not Content.IsChosen then
    local Res = IntensifyMain.EnhanceWidget:AddComsumerItem(Content)
    if Res then
      SetItemChosen(Content, true)
    end
  else
    SetItemChosen(Content, false)
    IntensifyMain.EnhanceWidget:OnItemMinusBtnClick(Content)
  end
end

local Component = {}

function Component:InitEnhanceComp(...)
  ModController:RegisterEvent(self)
  self.Panel_Limit:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Text_Limit:SetText(GText("UI_ModEnhance_Max"))
  self.Panel_Element:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Panel_Mod:SetVisibility(UIConst.VisibilityOp.Visible)
  self.PanelModSlot = UWidgetLayoutLibrary.SlotAsCanvasSlot(self.Panel_Mod)
  self.Panel_Info:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  self.Stats:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.WidgetSwitcher_Mode:SetActiveWidgetIndex(1)
  self.Selective_Listing:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  self.Selective_Listing.TileView_Select_Role.EntryWidgetClass = LoadClass("/Game/UI/WBP/Armory/Widget/Unit/WBP_Armory_Item_L_Mod.WBP_Armory_Item_L_Mod")
  self.Btn_Enhance:SetText(GText("UI_FUNC_INCREASE"))
  self.Btn_Enhance:BindEventOnClicked(self, self.OnBtnEnhanceClick)
  self.Btn_Enhance:BindForbidStateExecuteEvent(self, function()
    if self.bDisableWarning then
      return
    end
    ModController:ShowToast(GText("UI_Mod_Toast_EnhanceNotEnough"))
  end)
  self.Btn_Enhance:ForbidBtn(true)
  self.Btn_Auto:SetText(GText("UI_WeaponStrength_Auto"))
  self.Btn_Auto:BindEventOnClicked(self, self.OnBtnAutoClick)
  self.Btn_Auto:BindForbidStateExecuteEvent(self, function()
    if self.bDisableWarning then
      return
    end
    ModController:ShowToast(GText("UI_Toast_WeaponStrength_NoAuto"))
  end)
  self:InitTab(GText("UI_Armory_Mod") .. GText("UI_FUNC_INCREASE") .. "/" .. GText(self.Target:GetName()))
  local User, Target, SubWidget, Params = ...
  self.Target = Target
  self.Type = User or Target:GetTypeName()
  self.CurrentMode = Params.BehaviourType
  self.PreviewLevel = self.Target.CurrentModCardLevel + 1
  self.bTakeOff = false
  self:InitEnhanceWidget()
  self:AddTimer(0.2, self.RefreshBaseInfo)
  self:UpdateTopResourceBar()
end

function Component:SelectContentChanged(Content)
  SetItemSelected(self.SelectedModContent, false)
  if not self.SelectedModContent or Content ~= self.SelectedModContent then
    self.SelectedModContent = Content
    SetItemSelected(self.SelectedModContent, true)
  end
end

function Component:InitEnhanceWidget()
  if not self.EnhanceWidget then
    self.EnhanceWidget = self:CreateWidgetNew(ModCommon.ModEnhance)
    self.VB_Node:AddChild(self.EnhanceWidget)
  end
  local Params = {
    Parent = self,
    Target = self.Target,
    Type = self.Type,
    NowLevel = self.Target.CurrentModCardLevel,
    MaxLevel = self.Target.ModCardLevelMax
  }
  self.EnhanceWidget:SetCallbacks({
    OnItemAddClickCallback = self.OnItemAddClickCallback,
    OnModItemMoveCallback = self.OnModItemMoveCallback,
    OnPreviewLevelChangedCallback = self.OnPreviewLevelChangedCallback,
    OnItemMinusBtnClickCallback = self.OnItemMinusBtnClickCallback,
    OnLevelUpSuccessCallback = self.OnLevelUpSuccessCallback,
    OnLevelUpSuccessFinishedCallback = self.OnLevelUpSuccessFinishedCallback,
    OnLevelUpFinalCallback = self.Close
  })
  self.EnhanceWidget:Init(Params)
  self:SetModDataUI()
  self:PlayModUICameraAnim()
  self.Btn_Enhance:SetDefaultGamePadImg("Y")
  self.Btn_Auto:SetDefaultGamePadImg("X")
end

function Component:OnBtnAutoClick()
  if not self.bListExpand then
    self:OnExpandList(true, true)
    if 0 == #self.Selective_Listing.FilteredContents then
      ModController:ShowToast(GText("UI_Toast_WeaponStrength_NoAuto"))
    end
  end
  if self.EnhanceWidget.ComsumerCount > 0 then
    self.EnhanceWidget:RemoveAllAddedComsumer()
  else
    local AutoSelectContents = {}
    for i = 1, self.EnhanceWidget.MaxComsumerCount do
      if i > #self.Selective_Listing.FilteredContents then
        break
      end
      local Content = self.Selective_Listing.FilteredContents[i]
      SetItemChosen(Content, true)
      table.insert(AutoSelectContents, Content)
    end
    self.EnhanceWidget:AddComsumerItems(AutoSelectContents)
  end
end

function Component:OnBtnEnhanceClick()
  if self.CurrentMode ~= ModCommon.Enhance then
    return
  end
  local Comsumers, bAnyLevelUp = self.EnhanceWidget:GetComsumersParam()
  
  local function Callback()
    ModController:TryOpenOverCostWarningDialog(self.Target, self.PreviewLevel + self.Target.MaxLevel, function()
      ModController:SendModCardLevelUp(self.Target, Comsumers, self.bTakeOff)
    end, self)
  end
  
  local PopupId = bAnyLevelUp and ModCommon.ModCardlevelDialog2 or ModCommon.ModCardlevelDialog
  UIManager(self):ShowCommonPopupUI(PopupId, {RightCallbackFunction = Callback}, self)
end

function Component:RealCloseComp()
  self.Btn_Enhance:UnBindEventOnClickedByObj(self)
  self.Btn_Auto:UnBindEventOnClickedByObj(self)
  self:CloseForModCommon()
end

function Component:RefreshListComp()
  local ModContents = {}
  for Uuid, _ in pairs(ModModel.TargetMods) do
    local Mod = ModModel:GetMod(Uuid)
    if self.Target:IsCardLevelNeedModId(Mod.ModId) and Uuid ~= self.Target.Uuid then
      for i = 1, Mod.Count do
        local Obj = ArmoryUtils:NewModItemContent(Mod)
        Obj.Parent = self
        Obj.bEnhance = true
        Obj.MouseButtonUpEvent = OnItemMouseButtonUpEvent
        table.insert(ModContents, Obj)
      end
    end
  end
  self:SortSelectiveList(ModContents, 1, CommonConst.ASC)
  self.Selective_Listing:Init(self, {
    ItemContents = ModContents,
    SortType = CommonConst.ASC,
    OrderByDisplayNames = {
      "UI_LEVEL_SELECT"
    }
  })
  self.Selective_Listing:SetEmptyStateText("")
  self.Btn_Auto:ForbidBtn(false)
  if 0 == #ModContents then
    self.Btn_Auto:ForbidBtn(true)
    self.Selective_Listing:SetEmptyStateText(GText("UI_Armory_ModListIsEmpty"))
  end
end

function Component:SortSelectiveList(InOutContentArray, SortBy, SortType)
  self.SortType = SortType
  if not self.SortFunc then
    self.SortFunc = {}
    self.SortFunc[-1] = function(M1, M2)
      if M1.Level ~= M2.Level then
        return CommonUtils:Compare(M1.Level, M2.Level, self.SortType)
      end
      if M1.CardLevel ~= M2.CardLevel then
        return CommonUtils:Compare(M1.CardLevel, M2.CardLevel, self.SortType)
      end
      return CommonUtils:Compare(M1.UnitId, M2.UnitId, self.SortType)
    end
    self.SortFunc[1] = function(M1, M2)
      if M1.ModId == self.Target.ModId and M2.ModId == self.Target.ModId then
        return self.SortFunc[-1](M1, M2)
      end
      if M1.ModId == self.Target.ModId then
        return true
      end
      if M2.ModId == self.Target.ModId then
        return false
      end
      return self.SortFunc[-1](M1, M2)
    end
  end
  table.sort(InOutContentArray, self.SortFunc[SortBy])
  self.SortType = nil
end

function Component:ReceiveEnterStateComp()
  self:OnExpandList(self.bListExpand, true)
  if self.EnhanceWidget then
    local Params = {
      Parent = self,
      Target = self.Target,
      Type = self.Type,
      NowLevel = self.Target.CurrentModCardLevel,
      MaxLevel = self.Target.ModCardLevelMax
    }
    self.EnhanceWidget:UpdateWidgetData(Params)
  end
end

function Component:OnItemAddClickCallback()
  if not self.bListExpand then
    self:OnExpandList(true, true)
  else
    ModController:ShowToast(GText("UI_Armory_Toast_Material"))
  end
end

function Component:OnModItemMoveCallback(MoveModConent)
  local Content = self.Selective_Listing:GetItemAt(MoveModConent.IndexInList)
  Content.IndexInEnhance = MoveModConent.IndexInEnhance
end

function Component:OnPreviewLevelChangedCallback(InPreviewLevel)
  local Attrs, ComparedAttrs = {}, {}
  self.PreviewLevel = InPreviewLevel
  if self.PreviewLevel == self.Target.CurrentModCardLevel then
    ComparedAttrs = nil
  end
  local DesireLevel = self.PreviewLevel + self.Target.MaxLevel
  self:UpdateModCostUI(Attrs, ComparedAttrs, DesireLevel)
  self:UpdateAttrListUI(Attrs, ComparedAttrs, DesireLevel)
  local RealLevel = self.Target.CurrentModCardLevel + self.Target.MaxLevel
  local Desc = ArmoryUtils:GenModPassiveEffectDesc(self.Target:Data(), RealLevel, DesireLevel)
  if InPreviewLevel > self.Target.CurrentModCardLevel then
    self.Btn_Enhance:ForbidBtn(false)
  else
    self.Btn_Enhance:ForbidBtn(true)
  end
  if self.EnhanceWidget.ComsumerCount > 0 then
    self.Btn_Auto:SetText(GText("ModFilter_ClearAll"))
  else
    self.Btn_Auto:SetText(GText("UI_WeaponStrength_Auto"))
  end
  self.EnhanceWidget:UpdateCostBar(InPreviewLevel)
  return Attrs, ComparedAttrs, Desc
end

function Component:OnItemMinusBtnClickCallback(DelContent)
  if not self.bListExpand then
    self:OnExpandList(true, true)
  end
  if self.EnhanceWidget.ComsumerCount > 0 then
    self.Btn_Auto:SetText(GText("ModFilter_ClearAll"))
  else
    self.Btn_Auto:SetText(GText("UI_WeaponStrength_Auto"))
  end
  local Content = self.Selective_Listing:GetItemAt(DelContent.IndexInList)
  Content.IndexInEnhance = nil
  SetItemChosen(Content, false)
end

function Component:OnLevelUpSuccessCallback()
  local Attrs = {}
  local NowLevel = self.Target.CurrentModCardLevel + self.Target.MaxLevel
  self:UpdateModCostUI(Attrs, nil, NowLevel)
  self:UpdateAttrListUI(Attrs, nil, NowLevel)
  self:UpdateTopResourceBar()
  local Desc = ArmoryUtils:GenModPassiveEffectDesc(self.Target:Data(), NowLevel)
  return Attrs, Desc
end

function Component:NotifyOnModCardLevelUp(ModUuid, Comsumers)
  self.Target = ModModel:GetMod(ModUuid)
  self:OnBackgroundClicked()
  self:OnExpandList(false, true)
  self:ShowWarning(false)
  self.Btn_Auto:ForbidBtn(true)
  self.Btn_Enhance:ForbidBtn(true)
  self.bDisableWarning = true
  if self.Target:IsFinalMaxLevel() then
    self.Panel_Limit:SetVisibility(UIConst.VisibilityOp.Visible)
  end
  self.EnhanceWidget:OnLevelUpSuccess()
end

function Component:OnLevelUpSuccessFinishedCallback()
  self:OnExpandList(true, true)
  self.PreviewLevel = self.PreviewLevel + 1
  local Params = {
    Parent = self,
    Target = self.Target,
    Type = self.Type,
    NowLevel = self.Target.CurrentModCardLevel,
    MaxLevel = self.Target.ModCardLevelMax
  }
  self.EnhanceWidget:UpdateWidgetData(Params)
  self.bDisableWarning = false
end

function Component:OnBackgroundClickedComp()
  self:SelectContentChanged(nil)
  if self.bItemDetailsShowed then
    self:ShowItemDetails(false)
  end
end

function Component:RefreshOpInfoByInputDeviceComp(CurInputDevice, CurGamepadName)
  self.CurInputDeviceType = CurInputDevice
  if CurInputDevice == ECommonInputType.Gamepad then
    self:ReNavigateToListItem()
    local Item = self.Selective_Listing.TileView_Select_Role:GetItemAt(0)
    if Item and Item.UI then
      self.Selective_Listing.Common_Sort_List.Btn_Filter_List:SetNavigationRuleExplicit(EUINavigation.Up, Item.UI)
    end
    for i = 1, 5 do
      local Item = self.EnhanceWidget["Item_" .. i]
      if Item then
        Item:SetNavigationRuleBase(EUINavigation.Up, EUINavigationRule.Stop)
        Item:SetNavigationRuleBase(EUINavigation.Down, EUINavigationRule.Stop)
      end
    end
    self:ShowCheckBtn(false)
    self:ShowChooseBtn(true)
  end
end

function Component:OnFocusReceivedComp(MyGeometry, InFocusEvent)
  if self.CurInputDeviceType == ECommonInputType.Gamepad then
    self:ReNavigateToListItem()
  end
end

function Component:ReNavigateToListItem()
  if self.bListExpand then
    if self.Selective_Listing.TileView_Select_Role:GetNumItems() > 0 then
      local SelectedItem = self.Selective_Listing.TileView_Select_Role:BP_GetSelectedItem()
      if SelectedItem then
        self.Selective_Listing.TileView_Select_Role:BP_NavigateToItem(SelectedItem)
      else
        self.Selective_Listing.TileView_Select_Role:NavigateToIndex(0)
      end
    else
      self.EnhanceWidget.Item_1:SetFocus()
    end
  else
    self.EnhanceWidget.Item_1:SetFocus()
  end
end

function Component:OnKeyDownComp(MyGeometry, InKeyName)
  if InKeyName == UIConst.GamePadKey.FaceButtonLeft then
    self.Btn_Auto:OnBtnClicked()
  elseif InKeyName == UIConst.GamePadKey.FaceButtonTop then
    self.Btn_Enhance:OnBtnClicked()
  elseif InKeyName == UIConst.GamePadKey.LeftThumb then
    self.Selective_Listing.Common_Sort_List.Btn_Filter_List:SetFocus()
  end
end

return Component
