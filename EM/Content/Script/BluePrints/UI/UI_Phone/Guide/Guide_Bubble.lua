require("UnLua")
local Guide_Bubble = Class({
  "BluePrints.UI.BP_UIState_C"
})

function Guide_Bubble:Construct()
  self.bIsStretch = false
  self.bIsAuto = false
  self:ChangeSizeBoxSize()
  self:SetWidgetOpacity(0)
  self.VisibilityType = self:GetVisibility()
end

function Guide_Bubble:InitUIInfo(Name, IsInUIMode, EventList, MessageContent, MessageLoc, GamePadKey)
  self.Super.InitUIInfo(self, Name, IsInUIMode, EventList, MessageContent, MessageLoc)
  self:InitMessage(MessageContent, MessageLoc, GamePadKey)
end

function Guide_Bubble:OnLoaded()
  self:AddTimer(0.02 * UE4.UGameplayStatics.GetGlobalTimeDilation(self), function()
    self:SetWidgetOpacity(1)
  end)
end

function Guide_Bubble:InitMessage(MessageContent, MessageLoc, GamePadKey)
  if MessageContent then
    self:SetText(MessageContent)
  end
  if MessageLoc then
    self:SelectArrow(MessageLoc)
  end
  if GamePadKey then
    self.WS_Type:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    self.Controller_Single:CreateGamepadKey(GamePadKey)
  else
    self.WS_Type:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
  self:AddTimer(0.02 * UE4.UGameplayStatics.GetGlobalTimeDilation(self), function()
    self:SetWidgetOpacity(1)
  end)
end

function Guide_Bubble:SetText(Text)
  self.Text_Guide:SetText(Text)
end

function Guide_Bubble:ChangeSizeBoxSize(MaxLength)
  self.MaxLength = MaxLength or self.MaxLength
  local BubbleSizeBoxSlot = UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(self.Panel_Text)
  local OldSize = BubbleSizeBoxSlot:GetSize()
  local NewSize = UE4.FVector2D(self.MaxLength, OldSize.Y)
  BubbleSizeBoxSlot:SetSize(NewSize)
  local TextGuideSlot = UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(self.Text_Guide)
  if TextGuideSlot then
    TextGuideSlot:SetSize(UE4.FVector2D(NewSize.X - 10, TextGuideSlot:GetSize().Y))
  end
end

function Guide_Bubble:SelectArrow(MessageLoc)
  local ArrowMap = TMap(FVector2D, UWidget)
  ArrowMap:Add(FVector2D(0, -1), self.Img_Up)
  ArrowMap:Add(FVector2D(-1, 0), self.Img_Left)
  ArrowMap:Add(FVector2D(1, 0), self.Img_Right)
  ArrowMap:Add(FVector2D(0, 1), self.Img_Down)
  ArrowMap:Add(FVector2D(-1, -1), self.Img_Lup)
  ArrowMap:Add(FVector2D(1, -1), self.Img_Rup)
  ArrowMap:Add(FVector2D(-1, 1), self.Img_Ldown)
  ArrowMap:Add(FVector2D(1, 1), self.Img_Rdown)
  for k, v in pairs(ArrowMap) do
    local TmpArrow = v
    if MessageLoc ~= -k then
      TmpArrow:SetVisibility(UE4.ESlateVisibility.Collapsed)
    else
      TmpArrow:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    end
  end
end

function Guide_Bubble:GetTextRealSize()
  self.Text_Guide:ForceLayoutPrepass()
  local final_size = self:TextSizeWithOffsets()
  return final_size
end

function Guide_Bubble:TextSizeWithOffsets()
  self:ForceLayoutPrepass()
  local final_size = self:GetDesiredSize()
  final_size = final_size + UE4.FVector2D(100, 100)
  return final_size
end

function Guide_Bubble:SetWidgetOpacity(Opacity)
  self:SetRenderOpacity(Opacity)
end

return Guide_Bubble
