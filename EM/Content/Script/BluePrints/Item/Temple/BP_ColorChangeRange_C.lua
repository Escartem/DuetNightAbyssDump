require("UnLua")
local BP_ColorChangeRange_C = Class("BluePrints.Item.BP_CombatItemBase_C")

function BP_ColorChangeRange_C:CommonInitInfo(Info)
  BP_ColorChangeRange_C.Super.CommonInitInfo(self, Info)
  self.IsActive = false
  self.Platforms = {}
end

function BP_ColorChangeRange_C:ResetInfo()
  self.IsActive = false
  self.Mesh:SetVisibility(false, false)
end

function BP_ColorChangeRange_C:ReceiveBeginPlay()
  BP_ColorChangeRange_C.Super.ReceiveBeginPlay(self)
  self.Mesh:SetVisibility(false, false)
end

function BP_ColorChangeRange_C:OnActorReady(Info)
  BP_ColorChangeRange_C.Super.OnActorReady(self, Info)
  self.BoxOverlap:SetCollisionEnabled(ECollisionEnabled.QueryOnly)
end

function BP_ColorChangeRange_C:AddPlatform(Platform)
  if not self.Platforms[Platform] then
    self.Platforms[Platform] = Platform.NowColorType
  end
end

function BP_ColorChangeRange_C:OnPlayerIn()
  if not self.IsActive then
    return
  end
  self.Mesh:SetVisibility(true, false)
end

function BP_ColorChangeRange_C:OnPlayerOut()
  if not self.IsActive then
    return
  end
  self.Mesh:SetVisibility(false, false)
  for Platform, ColorType in pairs(self.Platforms) do
    Platform.NowColorType = ColorType
    Platform:SetColor()
  end
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  if GameMode then
    GameMode:GetDungeonComponent():OnPlayerLeaveColorRange()
  end
end

function BP_ColorChangeRange_C:ActiveCombat(bFromGameMode)
  self.IsActive = true
end

function BP_ColorChangeRange_C:InactiveCombat(bFromGameMode)
  self.IsActive = false
end

return BP_ColorChangeRange_C
