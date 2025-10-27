require("UnLua")
local M = Class("BluePrints.UI.BP_UIState_C")

function M:Initialize(Initializer)
  self.Super.Initialize(self, Initializer)
  self.BoardSize = FVector2D(30, 30)
  self.ScreenLocation = FVector2D(0, 0)
  self.TargetWorldLoc = FVector(0, 0, 0)
end

function M:Construct()
  self.Super.Construct(self)
  self:StopAllAnimations()
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  local UIManager = GameInstance:GetGameUIManager()
  local ViewportSize = UIManager:GetViewportSize()
  self.DesignedSize = FVector2D(0.846 * ViewportSize.X / 2, 0.864 * ViewportSize.Y / 2)
  self.CenterPos = FVector2D(ViewportSize.X / 2, ViewportSize.Y / 2)
end

function M:InitDefeatedCharacter(InCharacter)
  self.DefeatedCharacter = InCharacter
  self.MainPlayer = UGameplayStatics.GetPlayerCameraManager(self, 0)
  self.InteractiveComponent = self.DefeatedCharacter.PenalizeInteractiveComponent
  self.ScreenLocation = FVector2D(0, 0)
  self.TargetWorldLoc = FVector(0, 0, 0)
  self:ChangeUIDefeatedState(self.InteractiveComponent.bEnter)
  self.PlayerController = UGameplayStatics.GetPlayerController(self, 0)
end

function M:ChangeUIDefeatedState(bCanExecute)
  self.bCanExecute = bCanExecute
  if bCanExecute then
  else
    self.Icon_GuideExecute:SetVisibility(ESlateVisibility.HitTestInvisible)
  end
end

function M:UpdateGuidePos(IsOutElliptic, IndicatorAngle, ScreenLocation)
  if IsOutElliptic then
    self.Common_Arrows:SetVisibility(ESlateVisibility.HitTestInvisible)
    self.Common_Arrows:SetRenderTransformAngle(IndicatorAngle + 90)
    self.Icon_GuideExecute:SetVisibility(ESlateVisibility.HitTestInvisible)
  else
    self.Common_Arrows:SetVisibility(ESlateVisibility.Collapsed)
    self.Icon_GuideExecute:SetVisibility(ESlateVisibility.Collapsed)
  end
  self.Panel_Execute.Slot:SetPosition(ScreenLocation)
end

return M
