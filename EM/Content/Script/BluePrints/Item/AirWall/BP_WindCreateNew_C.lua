local BP_WindCreateNew_C = Class("BluePrints.Item.BP_CombatItemBase_C")

function BP_WindCreateNew_C:CommonInitInfo(Info)
  BP_WindCreateNew_C.Super.CommonInitInfo(self, Info)
  self.WindSpeedCpp = self.WindSpeed
  self.WindRateCpp = self.WindRate
  self.ArrowComp = self.Arrow
  self.ActorsToIgnore = TArray(AActor)
  self.HitResult = FHitResult()
  self.ActorsToIgnore:Add(self)
  self.Color1 = UE4.FLinearColor(1, 0, 0, 1)
  self.Color2 = UE4.FLinearColor(0, 1, 0, 1)
end

function BP_WindCreateNew_C:OnCharacterEnter(Character)
  self.InWindCharacters:Add(Character)
end

function BP_WindCreateNew_C:OnCharacterLeave(Character)
  self.InWindCharacters:RemoveItem(Character)
end

function BP_WindCreateNew_C:OnEnterState(NowStateId)
  self.Overridden.OnEnterState(self, NowStateId)
  local Speed = self.StateSpeedMap:FindRef(NowStateId)
  if Speed then
    self.WindSpeed = Speed
  end
end

return BP_WindCreateNew_C
