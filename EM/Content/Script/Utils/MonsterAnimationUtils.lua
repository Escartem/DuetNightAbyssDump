require("UnLua")
local MonAnimUtils = {}
MonAnimUtils.PlayerChar = nil
MonAnimUtils.MAUPawn = nil
MonAnimUtils.AIControllerClass = nil

function MonAnimUtils:LookAtMonster(Eid)
  local GameInstance = GWorld.GameInstance
  local MonsterMap = UE4.UGameplayStatics.GetGameState(GameInstance).MonsterMap
  local TargetMonster = MonsterMap:FindRef(Eid)
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(GameInstance, 0)
  self.PlayerChar = UE4.UGameplayStatics.GetPlayerCharacter(GWorld.GameInstance, 0)
  if TargetMonster then
    TargetMonster:StopBT("MAULookAt")
    TargetMonster.BBTarget = self.PlayerChar
    self.MAUPawn = GameInstance:GetWorld():SpawnActor(LoadClass("Blueprint'/Game/BluePrints/Char/BP_Monsters/BP_MonsterAnimPawn.BP_MonsterAnimPawn'"), nil, UE4.ESpawnActorCollisionHandlingMethod.AlwaysSpawn, nil, nil, nil)
    self.MAUPawn.OwnerController = PlayerController
    self.MAUPawn.Target = TargetMonster
  end
end

function MonAnimUtils:QuitMAUtil()
  self.MAUPawn:CancelPossessPawn(self.PlayerChar)
  self.MAUPawn.Target:StartBT()
end

function MonAnimUtils:UseSkill(Eid, SkillId)
  local GameInstance = GWorld.GameInstance
  local MonsterMap = UE4.UGameplayStatics.GetGameState(GameInstance).MonsterMap
  local TargetMonster = MonsterMap:FindRef(Eid)
  if TargetMonster then
    local RealId = TargetMonster:GetSeqSkill(SkillId)
    TargetMonster:UpdateCdAndUseSkill(tonumber(RealId))
  end
end

function MonAnimUtils:SetFocus()
  if self.IsFocus then
    self:Focus(false)
    self.IsFocus = false
  else
    self:Focus(true)
    self.IsFocus = true
  end
end

function MonAnimUtils:Focus(IsFocusNumber)
  if self.MAUPawn.Target and 1 == IsFocusNumber then
    self.MAUPawn.Target:GetMovementComponent().bOrientRotationToMovement = false
    self.MAUPawn.IsFocus = true
    self.MAUPawn.Target.BBTarget = self.PlayerChar
    self:SetSpeed(100)
  else
    self.MAUPawn.Target:GetMovementComponent().bOrientRotationToMovement = true
    self.MAUPawn.IsFocus = false
    self.MAUPawn.Target.BBTarget = nil
    self:SetSpeed(400)
  end
end

function MonAnimUtils:SetSpeed(Value)
  if self.MAUPawn.Target then
    self.MAUPawn.GmMoveSpeed = Value
  end
end

function MonAnimUtils:TestFunc(Value)
  if Value then
  end
end

return MonAnimUtils
