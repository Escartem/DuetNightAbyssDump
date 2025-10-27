require("UnLua")
local BattleGrenades_C = Class("BluePrints.UI.BP_UIState_C")

function BattleGrenades_C:Tick(MyGeometry, InDeltaTime)
  local Controller = UE4.UGameplayStatics.GetPlayerController(self, 0)
  local PlayerCharacter = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  local location = self.Target:K2_GetActorLocation()
  local distance, _ = UE4.UKismetMathLibrary.Vector_Distance(PlayerCharacter:K2_GetActorLocation(), location)
  local modDistance = math.modf(distance / 100)
  if distance > 2500 then
    self.Root:SetRenderOpacity(0)
  else
    self.Root:SetRenderOpacity(1)
  end
  local color = FLinearColor(0.175, 0.005, 0.009, 1)
  if self.Range and distance <= self.Range then
    color = FLinearColor(0.84, 0.02, 0.03, 1)
  end
  self.grenades:SetColorAndOpacity(color)
  local slateColor = FSlateColor()
  slateColor.SpecifiedColor = color
  self.Text_Distance:SetColorAndOpacity(slateColor)
  self.Text_Distance:SetText(modDistance .. "m")
  local screenLocation = FVector2D(0, 0)
  local inScreen = UE4.UUIFunctionLibrary.WorldPostionToScreenPosition(Controller, location, screenLocation)
  if not (screenLocation.X >= 0 and screenLocation.X <= self.ScreenCenter.X * 2 and screenLocation.Y >= 0 and screenLocation.Y <= self.ScreenCenter.Y * 2) or not inScreen then
    local centerTransLocation = screenLocation - self.ScreenCenter
    if 0 == centerTransLocation.X then
      if centerTransLocation.Y > 0 then
        screenLocation = FVector2D(0, self.ScreenCenter.Y)
      else
        screenLocation = FVector2D(0, -self.ScreenCenter.Y)
      end
    else
      local k = centerTransLocation.Y / centerTransLocation.X
      if k >= self.StandK or k <= -self.StandK then
        if centerTransLocation.Y > 0 then
          screenLocation = FVector2D(self.ScreenCenter.Y / k, self.ScreenCenter.Y)
        else
          screenLocation = FVector2D(-self.ScreenCenter.Y / k, -self.ScreenCenter.Y)
        end
      elseif centerTransLocation.x > 0 then
        screenLocation = FVector2D(self.ScreenCenter.X, self.ScreenCenter.X * k)
      else
        screenLocation = FVector2D(-self.ScreenCenter.X, -self.ScreenCenter.X * k)
      end
    end
    screenLocation = screenLocation + self.ScreenCenter
  end
  self.Root.Slot:SetPosition(screenLocation)
  if self.Target.HasOverlaped and not self.HasOverlaped then
    self.HasOverlaped = true
    self:PlayAnim("Loop_Normal", 0, 0)
    self.FastTime = UGameplayStatics.GetTimeSeconds(self) + self.Target.ConfigData.DelayEffect - 1
  end
  if self.FastTime and self.FastTime < UGameplayStatics.GetTimeSeconds(self) then
    self.FastTime = nil
    self:PlayAnim("Loop_Fast", 0, 0)
  end
end

function BattleGrenades_C:OnLoaded(Target)
  self.Target = Target
  self.Data = DataMgr.SkillCreature[Target.CreatureId]
  if self.Data and self.Data.Vars and self.Data.Vars.Range then
    self.Range = self.Data.Vars.Range
  end
  self:PlayAnim("in")
  local UIManger = UE4.UGameplayStatics.GetGameInstance(self):GetGameUIManager()
  self.ScreenCenter = UIManger:GetDesignedScreenSize() / 2
  self.StandK = self.ScreenCenter.Y / self.ScreenCenter.X
end

return BattleGrenades_C
