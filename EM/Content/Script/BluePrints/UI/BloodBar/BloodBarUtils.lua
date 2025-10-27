require("Unlua")
local BloodBarUtils = {}
BloodBarUtils.AllBloodState = {
  OverReach = "OverReach",
  Dead = "Dead",
  Other = "Other"
}

function BloodBarUtils:LoadSubWidget(Container, WidgetName, ...)
  if not Container then
    return
  end
  local SubWidget
  if self.CreateWidgetNew then
    SubWidget = self:CreateWidgetNew(WidgetName)
  else
    local BPPath = DataMgr.WidgetUI[WidgetName].BPPath
    SubWidget = UE4.UWidgetBlueprintLibrary.Create(self, LoadClass(BPPath))
  end
  Container:AddChild(SubWidget)
  SubWidget:Init(...)
  return Container:GetChildAt(0)
end

function BloodBarUtils:SetDeductEffect(OldHeight, OldLength, DeductImage, LastPercent, NowPercent, RenderOpacity, OriginalPositionX)
  OriginalPositionX = OriginalPositionX or 0
  local DeductEffectSlot = UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(DeductImage)
  if not DeductEffectSlot then
    return
  end
  local Height = OldHeight
  local Lenght = (LastPercent - NowPercent) * OldLength
  local Position = DeductEffectSlot:GetPosition()
  Position.X = OriginalPositionX + NowPercent * OldLength
  DeductEffectSlot:SetPosition(Position)
  DeductEffectSlot:SetSize(FVector2D(Lenght, Height))
  DeductImage:SetRenderOpacity(RenderOpacity)
  DeductImage:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
end

function BloodBarUtils:PlayDeduct()
end

return BloodBarUtils
