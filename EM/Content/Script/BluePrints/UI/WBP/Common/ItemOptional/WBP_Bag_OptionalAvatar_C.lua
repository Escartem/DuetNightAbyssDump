require("UnLua")
local StuffIconObject = require("BluePrints.UI.WBP.Bag.Widget.BagStuffIconObject")
local M = Class("BluePrints.UI.UI_PC.Common.Common_Dialog.Common_Dialog_ContentBase")

function M:InitContent(Params, PopupData, Owner)
  M.Super.InitContent(self, Params, PopupData, Owner)
  self.OptionalItemsList = Params.OptionalItemsList
  self.ChooseCallbackFunction = Params.ChooseCallbackFunction
  self.FunctionCallbackObj = Params.FunctionCallbackObj
  self.OriginalTips = Params.Tips
  self.CurrentChooseWidget = nil
  self.AllItemsWidget = {}
  self.ParentWidget = Params.ParentWidget
  self.CurrentChooseInfo = Params.ParentWidget.CurrentChooseInfo or nil
  self:ShowGamepadShortcutBtn({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "LS"}
    },
    Desc = GText("UI_Controller_CheckDetails")
  })
  self:ShowGamepadShortcutBtn({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "A"}
    },
    Desc = GText("UI_CTL_Select")
  })
  self:InitAllOptionalItemsInfo()
end

function M:InitAllOptionalItemsInfo()
  self.WB_Avatar:ClearChildren()
  for i, v in ipairs(self.OptionalItemsList) do
    v.__idx = i
  end
  table.sort(self.OptionalItemsList, function(a, b)
    local aNot = 0 == (a.HaveCountNumber or 0)
    local bNot = 0 == (b.HaveCountNumber or 0)
    if aNot ~= bNot then
      return aNot
    end
    return a.__idx < b.__idx
  end)
  for _, v in ipairs(self.OptionalItemsList) do
    v.__idx = nil
  end
  for Index, ItemInfo in ipairs(self.OptionalItemsList) do
    ItemInfo.Index = Index
    local Item = self:CreateWidgetNew("ComOptionalAvatarItem")
    self.WB_Avatar:AddChildToWrapBox(Item)
    Item:Init(ItemInfo.StuffType, ItemInfo, self.ChangeChooseClickCallback, self)
    table.insert(self.AllItemsWidget, Item)
  end
  local AllCanNavigateCount = #self.AllItemsWidget
  for Idx, TargetWidget in ipairs(self.AllItemsWidget) do
    if TargetWidget then
      TargetWidget:SetNavigationRuleBase(EUINavigation.Up, EUINavigationRule.Stop)
      TargetWidget:SetNavigationRuleBase(EUINavigation.Down, EUINavigationRule.Stop)
      if 1 == Idx then
        TargetWidget:SetNavigationRuleBase(EUINavigation.Left, EUINavigationRule.Stop)
        TargetWidget:SetNavigationRuleExplicit(EUINavigation.Right, self.AllItemsWidget[Idx + 1])
      elseif Idx == AllCanNavigateCount then
        TargetWidget:SetNavigationRuleExplicit(EUINavigation.Left, self.AllItemsWidget[Idx - 1])
        TargetWidget:SetNavigationRuleBase(EUINavigation.Right, EUINavigationRule.Stop)
      else
        TargetWidget:SetNavigationRuleExplicit(EUINavigation.Left, self.AllItemsWidget[Idx - 1])
        TargetWidget:SetNavigationRuleExplicit(EUINavigation.Right, self.AllItemsWidget[Idx + 1])
      end
    end
  end
  if self.CurrentChooseInfo then
    self:ResetChooseInfo()
  end
end

function M:ChangeChooseClickCallback(bSelectState, ChooseInfo)
  if self.CurrentChooseWidget then
    self.CurrentChooseWidget:SetSelected(false)
  end
  self.CurrentChooseInfo = ChooseInfo
  if bSelectState then
    self.CurrentChooseWidget = ChooseInfo.ChooseWidget
    if type(self.ChooseCallbackFunction) == "function" then
      self.ChooseCallbackFunction(self.FunctionCallbackObj, self.CurrentChooseInfo)
    end
    self.Owner:ForbidRightBtn(false)
    local ResourceName = DataMgr.Resource[self.CurrentChooseInfo.ResourceId].ResourceName
    self:AddTimer(0.01, function()
      self:BroadcastDialogEvent("UpdateDialogTipText", {
        Tips = {
          string.format(GText("UI_Consumable_Effect"), GText(ResourceName), self.CurrentChooseInfo.ChooseName)
        },
        DialogItemIndex = 1,
        bShowTip = true
      })
    end)
  else
    self.CurrentChooseWidget = nil
    self.Owner:ForbidRightBtn(true)
    self:BroadcastDialogEvent("UpdateDialogTipText", {
      Tips = self.OriginalTips,
      DialogItemIndex = 1,
      bShowTip = true
    })
  end
end

function M:ResetChooseInfo()
  local ChooseWidget = self.AllItemsWidget[self.CurrentChooseInfo.ChooseIndex]
  ChooseWidget:OnBtnChooseClicked()
end

function M:ScrollToTargetItem(TargetItem)
  self.ScrollBox_Avatar:ScrollWidgetIntoView(TargetItem)
end

function M:BP_GetDesiredFocusTarget()
  return self.CurrentChooseWidget or self.ScrollBox_Avatar
end

function M:OnBtnYes()
  if self.Owner then
    if self.CurrentChooseInfo == nil then
      self.Owner:OnForbiddenRightBtnClicked()
    else
      self.Owner:OnRightBtnClicked()
    end
  end
end

function M:HideSelf(bIsHide, IsNeedFocus)
  if self.Owner then
    if bIsHide then
      self.Owner:SetVisibility(UIConst.VisibilityOp.Collapsed)
    else
      self.Owner:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    end
    if IsNeedFocus then
      self.GameInputModeSubsystem:SetNavigateWidgetOpacity(0)
      self:AddTimer(0.6, function()
        self.GameInputModeSubsystem:SetNavigateWidgetOpacity(1)
        self:SetFocus()
      end)
    end
  end
end

function M:CloseDialog()
  if self.Owner then
    self.Owner:Close()
  end
end

function M:GetCurrentHoverItem()
  local TargetWidget
  local AllChildren = self.WB_Avatar:GetAllChildren()
  for i = 1, AllChildren:Length() do
    local ChildItem = AllChildren:GetRef(i)
    if ChildItem:CheckIsInHovered() then
      TargetWidget = ChildItem
      break
    end
  end
  return TargetWidget
end

function M:OnContentKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local IsEventHandled = false
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) then
    if InKeyName == UIConst.GamePadKey.LeftThumb then
      local CurrentHoveredWidget = self:GetCurrentHoverItem()
      if nil ~= CurrentHoveredWidget then
        CurrentHoveredWidget:OnBtnCheckClicked()
        IsEventHandled = true
      end
    elseif InKeyName == UIConst.GamePadKey.FaceButtonLeft then
      self:OnBtnYes()
      IsEventHandled = true
    end
  end
  return IsEventHandled
end

return M
