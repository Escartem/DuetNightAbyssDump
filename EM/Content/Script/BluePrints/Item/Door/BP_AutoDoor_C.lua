require("UnLua")
local BP_AutoDoor_C = Class("BluePrints.Item.Mechanism.BP_PrologueDoor")

function BP_AutoDoor_C:RegisterComponent(CompArray)
  BP_AutoDoor_C.Super.RegisterComponent(self, CompArray)
  self:AddTimer(1, self.Init)
end

function BP_AutoDoor_C:ReceiveBeginPlay()
  self.Overridden.ReceiveBeginPlay(self)
  self.IsDoorOpen = false
  self.UpdateOffsetTime = UKismetMathLibrary.RandomFloatInRange(0, 2.0)
end

function BP_AutoDoor_C:StartWait(Character)
  if self.CloseHandle then
    self:RemoveTimer(self.CloseHandle)
    self.CloseHandle = nil
  end
  if self.bNeedGuide then
    self:DeactiveGuide()
  end
  if self.DoorOpenState then
    print(_G.LogTag, "the Door ", self:GetName(), " Has Open")
    return
  end
  if self.door_state then
    self:OpenMechanism(Character.Eid)
    self:PlayDoorSound(true)
  end
end

function BP_AutoDoor_C:EndWait(Character)
  self.CurrentTriggerPlayerNum = math.max(self.CurrentTriggerPlayerNum, 0)
  if not self.DoorOpenState then
    return
  end
  if self.bNeedGuide then
    self:ActiveGuide("Add")
  end
  if self.door_state then
    self.CloseHandle = self:AddTimer(2, self.DelayCloseDoor, false, 0, nil, nil, Character)
  end
end

function BP_AutoDoor_C:OpenMechanism(CharacterEid)
  print(_G.LogTag, "LXZ OpenMechanism")
  self:UpdateRegionData("DoorOpenState", true)
  self:OpenDoor(CharacterEid, self.Eid)
end

function BP_AutoDoor_C:CloseMechanism(CharacterEid)
  print(_G.LogTag, "LXZ CloseMechanism")
  self:UpdateRegionData("DoorOpenState", false)
  self:CloseDoor(CharacterEid, self.Eid)
end

function BP_AutoDoor_C:DelayCloseDoor(Character)
  self:CloseMechanism()
  self:PlayDoorSound(false)
end

function BP_AutoDoor_C:Init()
  if self.if_door then
    self.RunnerMaterial_Mid = UE4.UKismetMaterialLibrary.CreateDynamicMaterialInstance(self, self.RunnerMaterial)
    if not self.door_state then
      self.Box:K2_DestroyComponent(self)
    end
  else
    self:K2_DestroyActor()
  end
  for i, v in pairs(self.ComponentLoc) do
    i:K2_SetRelativeLocation(UE4.FVector(0, 0, 0), false, nil, false)
  end
  self.Box:SetCollisionEnabled(1)
  self.InitSuccess = true
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  if GameMode and GameMode.EMGameState.GameModeType == "Abyss" then
    self.bNeedGuide = true
    local Eid = GameMode:GetBattleEid()
    self.Eid = Eid
    Battle(self):AddEntity(Eid, self)
    self:LockDoor()
  end
end

function BP_AutoDoor_C:OnRep_DoorOpenState()
  if self.InitSuccess then
    if self.DoorOpenState then
      self:OpenDoor()
    else
      self:CloseDoor()
    end
  else
    local function Callback()
      if self.InitSuccess then
        if self.DoorOpenState then
          self:OpenDoor()
        else
          self:CloseDoor()
        end
        self:RemoveTimer("OnRep_DoorOpenState")
      end
    end
    
    self:AddTimer(0.5, Callback, true, 0, "OnRep_DoorOpenState", false)
  end
end

function BP_AutoDoor_C:UnLockDoor()
  if self.bNeedGuide then
    self:ActiveGuide("Add")
  end
  self.Box:SetCollisionEnabled(1)
  self.door_state = true
  self:IndicatorColor()
  self:OnUnLockDoor()
  if self.EMNavModifierComponent then
    self.EMNavModifierComponent:K2_DestroyComponent(self)
  end
end

function BP_AutoDoor_C:LockDoor()
  self.DoorOpenState = false
  if self.CloseHandle then
    self:RemoveTimer(self.CloseHandle)
    self.CloseHandle = nil
  end
  if self.bNeedGuide then
    self:DeactiveGuide()
  end
  self.Box:SetCollisionEnabled(0)
  self:DelayCloseDoor()
  self.door_state = false
  self:IndicatorColor()
  self:OnLockDoor()
  self:AddNavModifier()
end

function BP_AutoDoor_C:OnCharacterChangeLevel(Character)
  if not IsAuthority(self) or not Character:IsPlayer() then
    return
  end
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  if GameMode.EMGameState.GameModeType ~= "Abyss" then
    return
  end
  if not self.door_state then
    return
  end
  self:OnLockDoor()
  print(_G.LogTag, "LXZ OnCharacterChangeLevel", self.BPArrow:GetName(), self.BPArrow.LevelId, self.BPArrow.OtherLevelId)
end

function BP_AutoDoor_C:ReceiveTick(DeltaSeconds)
  self.Overridden.ReceiveTick(self, DeltaSeconds)
  self.UpdateOffsetTime = self.UpdateOffsetTime + DeltaSeconds
  if self.UpdateOffsetTime > 2.0 then
    local LocPlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
    local Meshes = {
      "Mesh_Door_Top",
      "Mesh_Door_Right",
      "Mesh_Door_Left",
      "Mesh_Door_01",
      "Mesh_Door_02",
      "Mesh_Men01",
      "Mesh_Men02",
      "Door_Left",
      "Door_Right"
    }
    if LocPlayerController then
      local ViewTarget = LocPlayerController:GetViewTarget()
      local ViewLocation, ViewRotation = ViewTarget:GetActorEyesViewPoint()
      local Direction = ViewLocation - self:K2_GetActorLocation()
      Direction.Z = 0
      Direction:Normalize()
      local VLMOffset = Direction * 200
      for Index, MeshName in ipairs(Meshes) do
        local Mesh = self[MeshName]
        if Mesh then
          Mesh:SetVLMOffset(VLMOffset)
        end
      end
    end
    self.UpdateOffsetTime = 0
  end
end

return BP_AutoDoor_C
