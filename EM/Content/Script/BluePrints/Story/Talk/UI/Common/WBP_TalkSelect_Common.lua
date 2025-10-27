require("UnLua")
local MiscUtils = require("Utils.MiscUtils")
local Scroll_Mouse = MiscUtils.LazyLoadObject("/Game/UI/Texture/Dynamic/Atlas/Key/PC/T_Key_MouseScroll.T_Key_MouseScroll")
local Scroll_Xbox = MiscUtils.LazyLoadObject("/Game/UI/Texture/Dynamic/Atlas/Key/XBOX/T_Key_LV.T_Key_LV")
local Scroll_PS = MiscUtils.LazyLoadObject("/Game/UI/Texture/Dynamic/Atlas/Key/PS5/T_Key_LV.T_Key_LV")
local M = Class()

function M:New()
  local Obj = setmetatable({}, {__index = M})
  return Obj
end

function M:Init(ParentWidget)
  self.ItemUIPathName = "/Game/UI/WBP/Story/Widget/WBP_Story_TalkItem.WBP_Story_TalkItem"
  self.ItemClickedInfo = nil
  self.DelayDestoryCount = 0
  self.MouseWheelTime = 0
  self.ParentWidget = ParentWidget
  self.ScrollBox_TalkOptions = self.ParentWidget.ScrollBox_Talk
  self.Img_Mouse = self.ParentWidget.Img_Mouse
  self.CurrentSelectItemIdx = -1
  self.LastSelectItemIdx = -1
  self:ListenUpDownEvents()
end

function M:ReceiveTick(InDeltaTime)
  if self.MouseWheelTime > 0 then
    self.MouseWheelTime = self.MouseWheelTime - InDeltaTime
  end
end

function M:BindItemClicked(InObj, InFunc)
  self.ItemClickedInfo = {}
  self.ItemClickedInfo.Obj = InObj
  self.ItemClickedInfo.Func = InFunc
end

function M:UnBindItemClicked()
  self.ItemClickedInfo = nil
end

function M:OnItemClicked(InItemIdx)
  if self.ItemClickedInfo then
    self.ItemClickedInfo.Func(self.ItemClickedInfo.Obj, InItemIdx)
  end
end

function M:OnItemClickStart()
  local ChildMaxIndex = self.ScrollBox_TalkOptions:GetChildrenCount() - 1
  for i = 0, ChildMaxIndex do
    local Child = self.ScrollBox_TalkOptions:GetChildAt(i)
    Child:Clear()
  end
  self.ParentWidget:OnItemClickedStart()
end

function M:AddItem(InItem)
  local UIManager = UIManager(GWorld.GameInstance)
  local ItemUI = UIManager:CreateWidget(self.ItemUIPathName)
  self.ScrollBox_TalkOptions:AddChild(ItemUI)
  local ListIdx = self:GetItemIndex(ItemUI)
  ItemUI:Init(self, InItem, InItem.Index, ListIdx)
  local LastItem = self.ScrollBox_TalkOptions:GetChildAt(ListIdx - 1)
  ItemUI:SetNavigationRuleBase(EUINavigation.Up, EUINavigationRule.Stop)
  ItemUI:SetNavigationRuleBase(EUINavigation.Left, EUINavigationRule.Stop)
  ItemUI:SetNavigationRuleBase(EUINavigation.Right, EUINavigationRule.Stop)
  ItemUI:SetNavigationRuleBase(EUINavigation.Down, EUINavigationRule.Stop)
  if LastItem then
    LastItem:SetNavigationRuleExplicit(EUINavigation.Down, ItemUI)
    ItemUI:SetNavigationRuleExplicit(EUINavigation.Up, LastItem)
  end
end

function M:SetItemsVisibility(InVisibility)
  local ChildMaxIndex = self.ScrollBox_TalkOptions:GetChildrenCount() - 1
  for i = 0, ChildMaxIndex do
    local Child = self.ScrollBox_TalkOptions:GetChildAt(i)
    Child:SetVisibility(InVisibility)
  end
end

function M:ClearListItems()
  self.ScrollBox_TalkOptions:ClearChildren()
  self:UnlistenUpDownEvents()
end

function M:ListenUpDownEvents()
  self.ParentWidget:ListenForInputAction("TalkUpSelect", EInputEvent.IE_Pressed, true, {
    self.ParentWidget,
    function()
      self:UpSelectAction()
    end
  })
  self.ParentWidget:ListenForInputAction("TalkDownSelect", EInputEvent.IE_Pressed, true, {
    self.ParentWidget,
    function()
      self:DownSelectAction()
    end
  })
end

function M:UnlistenUpDownEvents()
  self.ParentWidget:StopListeningForInputAction("TalkUpSelect", EInputEvent.IE_Pressed)
  self.ParentWidget:StopListeningForInputAction("TalkDownSelect", EInputEvent.IE_Pressed)
end

function M:UpdateImgMouse()
  if CommonUtils.GetDeviceTypeByPlatformName(GWorld.GameInstance) == "Mobile" then
    return
  end
  local TalkOptionNum = self.ScrollBox_TalkOptions:GetChildrenCount()
  if TalkOptionNum < 2 then
    self.Img_Mouse:SetVisibility(UE4.ESlateVisibility.Collapsed)
  else
    self.Img_Mouse:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  end
end

function M:UpSelectAction()
  self:SwitchUpDownSelectAction(true)
end

function M:DownSelectAction()
  self:SwitchUpDownSelectAction(false)
end

function M:SwitchUpDownSelectAction(bUp)
  if self.MouseWheelTime > 0 then
    return
  end
  local TargetIdx = self:GetTargetSelectIdx(bUp)
  if not self:CheckTargetSelectIdx(TargetIdx) then
    return
  end
  DebugPrint("UpDownSelectAction", self.CurrentSelectItemIdx, bUp)
  self.MouseWheelTime = 0.1
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_add", "", nil)
  self:SelectNewItem(TargetIdx)
end

function M:GetTargetSelectIdx(bUp)
  if bUp then
    return self.CurrentSelectItemIdx - 1
  else
    return self.CurrentSelectItemIdx + 1
  end
end

function M:CheckTargetSelectIdx(TargetIdx)
  local MaxIdx = self.ScrollBox_TalkOptions:GetChildrenCount() - 1
  if TargetIdx < 0 or TargetIdx > MaxIdx then
    return false
  end
  return true
end

function M:SelectNewItem(NewItemIdx, bIsDefault)
  if bIsDefault then
    self.CurrentSelectItemIdx = NewItemIdx
    local SelectItemUI = self.ScrollBox_TalkOptions:GetChildAt(self.CurrentSelectItemIdx)
    if SelectItemUI then
      SelectItemUI:OnSelectItem(true)
      self.ScrollBox_TalkOptions:ScrollWidgetIntoView(SelectItemUI, true)
    end
    return
  end
  if self.CurrentSelectItemIdx == NewItemIdx then
    return
  end
  self.LastSelectItemIdx = self.CurrentSelectItemIdx
  self.CurrentSelectItemIdx = NewItemIdx
  local LastSelectItemUI = self.ScrollBox_TalkOptions:GetChildAt(self.LastSelectItemIdx)
  if LastSelectItemUI then
    LastSelectItemUI:OnUnselectItem()
  end
  local SelectItemUI = self.ScrollBox_TalkOptions:GetChildAt(self.CurrentSelectItemIdx)
  if SelectItemUI then
    SelectItemUI:OnSelectItem()
    self.ScrollBox_TalkOptions:ScrollWidgetIntoView(SelectItemUI, true)
  end
end

function M:SetDefaultItem()
  self:SelectNewItem(0, true)
end

function M:GetItemIndex(Item)
  local ChildMaxIndex = self.ScrollBox_TalkOptions:GetChildrenCount() - 1
  for i = 0, ChildMaxIndex do
    local Child = self.ScrollBox_TalkOptions:GetChildAt(i)
    if Child == Item then
      return i
    end
  end
  return -1
end

function M:GetCurrentItem()
  return self.ScrollBox_TalkOptions:GetChildAt(self.CurrentSelectItemIdx)
end

function M:UpdateKeyImg(IsGamePad, GamepadName)
  local ChildMaxIndex = self.ScrollBox_TalkOptions:GetChildrenCount() - 1
  for i = 0, ChildMaxIndex do
    local Child = self.ScrollBox_TalkOptions:GetChildAt(i)
    if Child then
      Child:UpdateKeyImg(IsGamePad)
    end
  end
  if IsGamePad then
    if "XBOX" == GamepadName then
      self.Img_Mouse:SetBrushResourceObject(Scroll_Xbox:get())
    else
      self.Img_Mouse:SetBrushResourceObject(Scroll_PS:get())
    end
  else
    self.Img_Mouse:SetBrushResourceObject(Scroll_Mouse:get())
  end
end

return M
