require("UnLua")
local WBP_TaskBar_OptionalTask_C = Class("BluePrints.UI.BP_UIState_C")

function WBP_TaskBar_OptionalTask_C:Initialize(Initializer)
  self.TargetMap = {}
end

function WBP_TaskBar_OptionalTask_C:OnLoaded()
end

function WBP_TaskBar_OptionalTask_C:AddDestroyTarget(ImageType, Text)
  local Widget = self:CreateWidgetNew("DestroyTarget")
  if Widget then
    self.VBox_Sabotage:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self.VBox_Sabotage:AddChildToVerticalBox(Widget)
    self.TargetMap[ImageType] = Widget
    Widget:SetImageAndText(ImageType, Text)
  end
end

function WBP_TaskBar_OptionalTask_C:RemoveDestroyTarget(ImageType)
  for key, value in pairs(self.TargetMap) do
    if key == ImageType then
      value:RemoveFromParent()
      self.TargetMap[key] = nil
      break
    end
  end
end

function WBP_TaskBar_OptionalTask_C:RemoveAllDestroyTarget()
  for key, value in pairs(self.TargetMap) do
    value:RemoveFromParent()
  end
  self.TargetMap = {}
end

return WBP_TaskBar_OptionalTask_C
