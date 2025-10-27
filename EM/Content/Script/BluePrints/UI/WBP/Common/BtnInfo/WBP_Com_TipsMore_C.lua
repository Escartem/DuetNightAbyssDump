require("UnLua")
local M = Class({
  "BluePrints.Common.TimerMgr",
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:Construct()
  self.bIsStretch = false
  self.VisibilityType = self:GetVisibility()
  self:SetVisibility(UE4.ESlateVisibility.Visible)
end

function M:InitMessage(MessageContent)
  if MessageContent then
    self:SetText(MessageContent)
  end
end

function M:SetText(Text)
  self.Text_Guide:SetText(Text)
end

function M:ChangeSizeBoxSize(MaxLength)
  self.MaxLength = MaxLength or self.MaxLength
  local BubbleSizeBoxSlot = UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(self.Panel_Text)
  local OldSize = BubbleSizeBoxSlot:GetSize()
  local NewSize = UE4.FVector2D(self.MaxLength, OldSize.Y)
  BubbleSizeBoxSlot:SetSize(NewSize)
  local TextGuideSlot = UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(self.Text_Guide)
  TextGuideSlot:SetSize(UE4.FVector2D(NewSize.X - 10, TextGuideSlot:GetSize().Y))
end

function M:GetTextRealSize()
  self.Text_Guide:ForceLayoutPrepass()
  local final_size = self:TextSizeWithOffsets()
  return final_size
end

function M:TextSizeWithOffsets()
  self.Text_Guide:ForceLayoutPrepass()
  local final_size = self.Text_Guide:GetDesiredSize()
  final_size = final_size + UE4.FVector2D(100, 100)
  return final_size
end

function M:SetWidgetOpacity(Opacity)
  self:SetRenderOpacity(Opacity)
end

return M
