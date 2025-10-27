require("UnLua")
local WBP_GM_Menu_Base_C = Class("BluePrints.UI.BP_UIState_C")

function WBP_GM_Menu_Base_C:Construct(...)
  self.Overridden.Construct(self)
  self.bIsFocusable = true
  self:SetFocus()
end

function WBP_GM_Menu_Base_C:InitMenu(Command)
  self.Command = Command
  if self.Bg_AutoSize and self.Vertical_AutoSize then
    local BGSlot = UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(self.Bg_AutoSize)
    BGSlot:SetAutoSize(false)
    self.OriginalBG_Size = BGSlot:GetSize()
    local VB_Slot = UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(self.Vertical_AutoSize)
    self.OriginalVB_Size = VB_Slot:GetSize()
    local ListSlot = UE4.UWidgetLayoutLibrary.SlotAsVerticalBoxSlot(self.List)
    local SlateSize = FSlateChildSize()
    SlateSize.Value = 1
    SlateSize.SizeRule = UE4.ESlateSizeRule.Auto
    ListSlot:SetSize(SlateSize)
    local TemSize = FVector2D(self.OriginalVB_Size.X, 0)
    VB_Slot:SetSize(TemSize)
    TemSize = FVector2D(self.OriginalBG_Size.X, 0)
    BGSlot:SetSize(TemSize)
  end
end

function WBP_GM_Menu_Base_C:OnEntryNumChanged(Entry)
  if not (self.Bg_AutoSize and self.Vertical_AutoSize) or not Entry.Panel_Size then
    return
  end
  local ListEntryLength = self.List:GetDisplayedEntryWidgets():Length()
  if ListEntryLength > self.EntryNumForScroll then
    return
  end
  local TopHeight = 0.0
  local BottomHeight = 0.0
  if self.Panel_Top then
    TopHeight = self.Panel_Top:GetDesiredSize().Y
  end
  if self.Panel_Bottom then
    BottomHeight = self.Panel_Bottom:GetDesiredSize().Y
  end
  local EntrySlot = UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(Entry.Panel_Size)
  local EntrySize = EntrySlot:GetSize()
  local space = self.List.EntrySpacing
  if ListEntryLength <= 1 then
    space = 0
  end
  local NewHeight = (EntrySize.Y + space) * ListEntryLength - space + TopHeight + BottomHeight
  local HeightScale = NewHeight / self.OriginalVB_Size.Y
  local VB_Slot = UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(self.Vertical_AutoSize)
  local VB_Size = VB_Slot:GetSize()
  VB_Size.Y = self.OriginalVB_Size.Y * HeightScale + 1
  VB_Slot:SetSize(VB_Size)
  local BG_Slot = UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(self.Bg_AutoSize)
  local BG_Size = BG_Slot:GetSize()
  BG_Size.Y = self.OriginalBG_Size.Y * HeightScale
  BG_Slot:SetSize(BG_Size)
  if ListEntryLength >= self.EntryNumForScroll then
    self:ShowScrollbar(NewHeight)
  end
end

function WBP_GM_Menu_Base_C:ShowScrollbar(NewHeight)
  local TopHeight = 0.0
  local TopSizeValue = 0.0
  local BottomHeight = 0.0
  local BottomSizeValue = 0.0
  local SlateSize = FSlateChildSize()
  if self.Panel_Top then
    TopHeight = self.Panel_Top:GetDesiredSize().Y
    TopSizeValue = TopHeight / NewHeight
    local PtSlott = UE4.UWidgetLayoutLibrary.SlotAsVerticalBoxSlot(self.Panel_Top)
    SlateSize.Value = TopSizeValue
    SlateSize.SizeRule = UE4.ESlateSizeRule.Fill
    PtSlott:SetSize(SlateSize)
  end
  if self.Panel_Bottom then
    BottomHeight = self.Panel_Bottom:GetDesiredSize().Y
    BottomSizeValue = BottomHeight / NewHeight
    local PbSlott = UE4.UWidgetLayoutLibrary.SlotAsVerticalBoxSlot(self.Panel_Bottom)
    SlateSize.Value = BottomSizeValue
    SlateSize.SizeRule = UE4.ESlateSizeRule.Fill
    PbSlott:SetSize(SlateSize)
  end
  local ListSlot = UE4.UWidgetLayoutLibrary.SlotAsVerticalBoxSlot(self.List)
  SlateSize.Value = 1 - TopSizeValue - BottomSizeValue
  SlateSize.SizeRule = UE4.ESlateSizeRule.Fill
  ListSlot:SetSize(SlateSize)
end

function WBP_GM_Menu_Base_C:RefreshItems()
  local Entrys = self.List:GetDisplayedEntryWidgets()
  local Length = Entrys:Length()
  for i = 1, Length do
    if Entrys[i].SetItem then
      Entrys[i]:SetItem()
    end
  end
end

function WBP_GM_Menu_Base_C:OnKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if "Escape" == InKeyName then
    self:Close()
  end
  return UE4.UWidgetBlueprintLibrary.Handled()
end

return WBP_GM_Menu_Base_C
