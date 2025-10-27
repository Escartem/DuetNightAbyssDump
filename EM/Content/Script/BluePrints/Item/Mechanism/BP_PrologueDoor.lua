require("UnLua")
local BP_PrologueDoor = Class({
  "BluePrints.Item.BP_CombatItemBase_C",
  "BluePrints.Common.TimerMgr"
})

function BP_PrologueDoor:RegisterComponent(CompArray)
  for i, v in pairs(CompArray) do
    self.ComponentLoc:Add(v, v.RelativeLocation)
  end
end

function BP_PrologueDoor:FindMiniGame()
  if not self.CreateGame then
    self:RemoveTimer(self.MiniGameHandle)
    return
  end
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  local StaticCreator = GameState.StaticCreatorMap:Find(self.GameId)
  if StaticCreator and StaticCreator.ChildEids:Length() > 0 and self.ServerInitSuccess then
    self.MiniGameEid = GameState.StaticCreatorMap:Find(self.GameId).ChildEids:GetRef(1)
    self.MiniGame = Battle(self):GetEntity(self.MiniGameEid)
    if self.MiniGame then
      self:InitMiniGameState(self.StateId)
      self:RemoveTimer(self.MiniGameHandle)
      self:GetMiniGamePos(self.MiniGameEid, self.CreateGame, self.GameId, self.GuidePos.RelativeLocation)
    end
  end
end

function BP_PrologueDoor:AuthorityInitInfo(Info)
  BP_PrologueDoor.Super.AuthorityInitInfo(self, Info)
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  if not GameMode then
    return
  end
  if self.CreateGame then
    local GameState = UE4.UGameplayStatics.GetGameState(self)
    if not GameState.StaticCreatorMap:Find(self.GameId) then
      DebugPrint(1)
      return
    end
    GameState.StaticCreatorMap:Find(self.GameId).SourceEid = self.Eid
    local MiniGameList = TArray(0)
    MiniGameList:Add(self.GameId)
    GameMode:TriggerActiveStaticCreator(MiniGameList)
  end
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  GameState.DoorMap:Add(self.DoorId, self)
end

function BP_PrologueDoor:CommonInitInfo(Info)
  self.OnDoorOpen = false
  self.OnDoorClose = false
  BP_PrologueDoor.Super.CommonInitInfo(self, Info)
  self.Box:SetCollisionEnabled(1)
  for i, v in pairs(self.ComponentLoc) do
    i:K2_SetRelativeLocation(UE4.FVector(0, 0, 0), false, nil, false)
  end
end

function BP_PrologueDoor:InitComponent(Info)
  BP_PrologueDoor.Super.InitComponent(self, Info)
  if 0 == self:GetCurrentDoorType() then
    self.EMNavModifierComponent:K2_DestroyComponent(self)
    self.EMNavModifierComponent = nil
  end
end

function BP_PrologueDoor:OnActorReady(Info)
  BP_PrologueDoor.Super.OnActorReady(self, Info)
  if IsAuthority(self) then
    self.MiniGameHandle = self:AddTimer(0.1, self.FindMiniGame, true, 0)
    self:GetMiniGamePos(self.MiniGameEid, self.CreateGame, self.GameId, self.GuidePos.RelativeLocation)
  end
  self.bCanPlaySound = false
  local StateTable = Info:GetLuaTable("State")
  local DungeonStateTable = Info:GetLuaTable("DungeonState")
  if 0 ~= self.CurrentDoorTypeStateId and not StateTable and not DungeonStateTable and IsAuthority(self) then
    self:ChangeState("Manual", 0, self.CurrentDoorTypeStateId)
  end
  if 0 == self:GetCurrentDoorType() or 3 == self:GetCurrentDoorType() then
    self:ManualTriggerOverlap()
  end
  self.bCanPlaySound = true
  EventManager:FireEvent(EventID.UpdateDoorIcon, self)
end

function BP_PrologueDoor:ManualTriggerOverlap()
  local ObjectTypes = TArray(EObjectTypeQuery)
  ObjectTypes:Add(UE4.EObjectTypeQuery.Pawn)
  local OutActors = TArray(AActor)
  OutActors = UE4.UKismetSystemLibrary.ComponentOverlapActors(self.Box, self.Box:K2_GetComponentToWorld(), ObjectTypes)
  if OutActors:Length() >= 1 then
    self:StartWait()
  end
end

function BP_PrologueDoor:StartWait(Actor)
  if self.bIsUnidirectional and not self:CheckDirection(Actor) then
    return
  end
  if self.CloseHandle then
    self:RemoveTimer(self.CloseHandle)
    self.CloseHandle = nil
  end
  if self.DoorOpenState or not self.InitSuccess then
    print(_G.LogTag, "LXZ the Door ", self:GetName(), " Has Open or Not Init")
    return
  end
  local CurrentDoorType = self:GetCurrentDoorType()
  if 0 == CurrentDoorType or 3 == CurrentDoorType then
    self:UpdateRegionData("DoorOpenState", true)
    self:ChangeState("TriggerBox", 0)
  end
end

function BP_PrologueDoor:OpenMechanism()
  print(_G.LogTag, "LXZ OpenMechanism", self:GetName())
  self.DoorOpenState = true
  if self.bCanPlaySound then
    self:PlayDoorSound(true)
  end
  self:OpenDoor()
  EventManager:FireEvent(EventID.UpdateDoorIcon, self)
end

function BP_PrologueDoor:CloseMechanism()
  print(_G.LogTag, "LXZ CloseMechanism", self:GetName())
  self.DoorOpenState = false
  if self.bCanPlaySound then
    self:PlayDoorSound(false)
  end
  self:CloseDoor()
end

function BP_PrologueDoor:EndWait(Actor)
  if self.bIsbIsUnidirectional and not self:CheckDirection(Actor) then
    return
  end
  self.CurrentTriggerPlayerNum = math.max(self.CurrentTriggerPlayerNum, 0)
  if not self.DoorOpenState then
    return
  end
  if 0 == self:GetCurrentDoorType() then
    self.CloseHandle = self:AddTimer(2, self.DelayCloseDoor, false, 0, nil, nil)
  end
end

function BP_PrologueDoor:DelayCloseDoor()
  self:UpdateRegionData("DoorOpenState", false)
  self:ChangeState("TriggerBox", 0)
end

function BP_PrologueDoor:TriggerByChild(SourceEid)
  local MiniGame = Battle(self):GetEntity(self.MiniGameEid)
  local UnlockedDoorAndOpenDoorId = 0
  for i, v in pairs(self.DoorTypeStateId) do
    if v == EDoorType.UnlockedDoorAndOpenDoor then
      UnlockedDoorAndOpenDoorId = i
    end
  end
  if not MiniGame then
    local GameState = UE4.UGameplayStatics.GetGameState(self)
    local StaticCreator = GameState.StaticCreatorMap:Find(self.GameId)
    print(_G.LogTag, "LXZ MTest TriggerByChild", self.MiniGameEid, StaticCreator.ChildEids:Length())
  end
  self:ChangeState("Manual", MiniGame.PlayerEid, UnlockedDoorAndOpenDoorId)
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  local Callback = GameMode.MiniGameSuccessCallback
  print(_G.LogTag, "LXZ PrologueDoor TriggerByChild", Callback)
  if Callback and Callback[self.GameId] then
    Callback[self.GameId]()
  end
end

function BP_PrologueDoor:GetGuidePos()
  if 1 == self.DoorTypeStateId:Find(self.StateId) then
    local GameState = UE4.UGameplayStatics.GetGameState(self)
    return self.MiniGamePos
  else
    return self:K2_GetActorLocation() + self.GuidePos.RelativeLocation
  end
end

function BP_PrologueDoor:CreateRegionData()
  self.RegionData = {
    DoorOpenState = self.DoorOpenState,
    StateId = self.StateId
  }
end

function BP_PrologueDoor:GetCurrentDoorType()
  local Type = self.DoorTypeStateId:Find(self.StateId)
  if Type == EDoorType.UnlockedDoorAndOpenDoor then
    Type = EDoorType.UnlockedDoor
  end
  return Type
end

function BP_PrologueDoor:RecoverSavedData(DataTable)
  if not DataTable then
    return
  end
  for i, v in pairs(DataTable) do
    if nil ~= self[i] then
      self[i] = v
    end
  end
end

function BP_PrologueDoor:InitMiniGameState(NowStateId)
  if not IsAuthority(self) then
    return
  end
  local Type = self.DoorTypeStateId:Find(NowStateId)
  local MiniGame = Battle(self):GetEntity(self.MiniGameEid)
  if not IsValid(MiniGame) then
    return
  end
  if Type ~= EDoorType.LockedDoor and MiniGame.StateId ~= MiniGame.FiniStateId then
    MiniGame:ChangeState("Manual", 0, MiniGame.FiniStateId)
  elseif Type == EDoorType.LockedDoor and MiniGame.StateId ~= MiniGame.DeActiveStateId then
    MiniGame:ChangeState("Manual", 0, MiniGame.DeActiveStateId)
  end
end

function BP_PrologueDoor:OnDoorTypeChange(DoorType)
  print(_G.LogTag, "LXZ OnDoorTypeChange", DoorType)
  if DoorType == EDoorType.UnlockedDoorAndOpenDoor or DoorType == EDoorType.UnlockedDoor then
    self.Box:SetCollisionEnabled(ECollisionEnabled.QueryOnly)
  else
    self.Box:SetCollisionEnabled(ECollisionEnabled.NoCollision)
  end
end

return BP_PrologueDoor
