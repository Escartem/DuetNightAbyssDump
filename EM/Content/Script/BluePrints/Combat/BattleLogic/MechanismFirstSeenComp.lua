local Component = {}

function Component:Initialize()
  self.MechanismNeedCheck = {}
  self.MechanismFirstSeenEnabled = true
end

function Component:TryRegisterFirstSeeMehcanism(UnitId, Eid)
  if not DataMgr.Mechanism[UnitId] then
    return
  end
  local FirstSeenTag = DataMgr.Mechanism[UnitId].FirstSeenTag
  if nil == FirstSeenTag then
    return
  end
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  local IsFirstMechanism = Avatar:CheckFirstMechanism(UnitId, false)
  if not IsFirstMechanism and not self.MechanismNeedCheck[FirstSeenTag] then
    return
  end
  local Mechanism = Battle(self):GetEntity(Eid)
  if not Mechanism.FirstSeen then
    print(_G.LogTag, "Error: \230\156\186\229\133\179\230\178\161\230\156\137\231\148\168\228\186\142\229\136\157\230\172\161\233\129\135\229\136\176\229\138\159\232\131\189\231\154\132\231\162\176\230\146\158\228\189\147", Mechanism:GetName(), Mechanism.UnitId)
    return
  end
  if self.MechanismNeedCheck[FirstSeenTag] then
    self.MechanismNeedCheck[FirstSeenTag][Mechanism] = 1
  else
    self.MechanismNeedCheck[FirstSeenTag] = {}
    self.MechanismNeedCheck[FirstSeenTag][Mechanism] = 1
  end
  if not self:IsExistTimer("CheckMechanismFirstSeen") then
    self:AddTimer(0.2, self.CheckFirstSeeMehcanism, true, 0, "CheckMechanismFirstSeen")
  end
end

function Component:CheckFirstSeeMehcanism()
  if not self.MechanismFirstSeenEnabled then
    return
  end
  for Tag, MechanismRef in pairs(self.MechanismNeedCheck) do
    for Mechanism, RefNum in pairs(MechanismRef) do
      local NeedBreak = self:RealCheckFirstSeeMehcanism(Tag, MechanismRef, Mechanism, RefNum)
      if NeedBreak then
        break
      end
    end
  end
end

function Component:RealCheckFirstSeeMehcanism(FirstSeenTag, MechanismRef, Mechanism, RefNum)
  if not IsValid(Mechanism) then
    MechanismRef[Mechanism] = nil
    return false
  end
  local bShouldShow = URuntimeCommonFunctionLibrary.WasComponentRecentlyRenderedOnScreen(Mechanism.FirstSeen, 0.2)
  if not bShouldShow then
    MechanismRef[Mechanism] = 1
    return false
  end
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  local Distance = Mechanism:GetActorDistance(Player, Mechanism)
  local NeedDis = DataMgr.GlobalConstant.MechanismFirstSeenDistance.ConstantValue
  if Distance > NeedDis then
    MechanismRef[Mechanism] = 1
    return false
  end
  MechanismRef[Mechanism] = MechanismRef[Mechanism] + 1
  if MechanismRef[Mechanism] > 2 then
    self.MechanismNeedCheck[FirstSeenTag] = nil
    self:OnMechanismFirstSeen(FirstSeenTag)
    self:TryRemoveTimer()
  end
  return true
end

function Component:OnMechanismFirstSeen(FirstSeenTag)
  local Avatar = GWorld:GetAvatar()
  local IsFirstSeen = Avatar:CheckFirstMechanism(FirstSeenTag, true)
  if IsFirstSeen then
    EventManager:FireEvent(EventID.FirstSeenTag, FirstSeenTag)
  end
end

function Component:TryRemoveTimer()
  for _, _ in pairs(self.MechanismNeedCheck) do
    return
  end
  self:RemoveTimer("CheckMechanismFirstSeen")
end

return Component
