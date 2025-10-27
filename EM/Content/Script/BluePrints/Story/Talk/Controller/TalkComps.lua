local ETalkCompType = require("BluePrints.Story.Talk.Controller.TalkCompType")
local TalkCompBase_C = {}

function TalkCompBase_C:GetType()
  error("Talk property must implement GetType func!")
end

function TalkCompBase_C:Execute()
  error("Talk property must implement execute func!")
end

function TalkCompBase_C:Resume()
  error("Talk property must implement resume func!")
end

local function CreateTalkComp()
  local Class = setmetatable({}, {__index = TalkCompBase_C})
  return Class
end

local TalkComp_HideGameUI_C = CreateTalkComp()

function TalkComp_HideGameUI_C.New(TalkContext)
  local Obj = setmetatable({}, {__index = TalkComp_HideGameUI_C})
  Obj.TalkContext = TalkContext
  return Obj
end

function TalkComp_HideGameUI_C:GetType()
  return ETalkCompType.HideGameUI
end

function TalkComp_HideGameUI_C:Execute()
  self:SetGameUIHiddenExceptStory(true)
  self.TalkContext.TalkStateManager:SetTalkStateByTag(Const.TalkState_HiddenGameUI, true, self)
end

function TalkComp_HideGameUI_C:Resume()
  self:SetGameUIHiddenExceptStory(false)
  self.TalkContext.TalkStateManager:SetTalkStateByTag(Const.TalkState_HiddenGameUI, false, self)
end

function TalkComp_HideGameUI_C:SetGameUIHiddenExceptStory(bHidden)
  local UIManager = UIManager(GWorld.GameInstance)
  local ExceptUINames = TSet(FName)
  local UINames = UIManager:GetShowInStoryUINames()
  for _, Name in pairs(UINames) do
    ExceptUINames:Add(Name)
  end
  UIManager:HideAllUI_EX(ExceptUINames, bHidden, Const.TalkHideTag)
end

local TalkComp_DisableInput_C = CreateTalkComp()

function TalkComp_DisableInput_C.New(Player, PlayerController, TalkTaskData)
  local Obj = setmetatable({}, {__index = TalkComp_DisableInput_C})
  Obj.Player = Player
  Obj.PlayerController = PlayerController
  Obj.TalkTaskData = TalkTaskData
  return Obj
end

function TalkComp_DisableInput_C:GetType()
  return ETalkCompType.DisableInput
end

function TalkComp_DisableInput_C:Execute()
  self:SetGameInputDisable(self.Player, self.PlayerController, true)
end

function TalkComp_DisableInput_C:Resume()
  self:SetGameInputDisable(self.Player, self.PlayerController, false)
end

function TalkComp_DisableInput_C:SetGameInputDisable(Player, PlayerController, bDisable)
  local PreMode = UE4.URuntimeCommonFunctionLibrary.GetInputMode(Player:GetWorld())
  if bDisable then
    DebugPrint("Disable Input By TalkComp")
    if IsValid(Player) and Player:GetController() and Player:GetController():IsA(APlayerController) then
      Player:AddDisableInputTag("Talk")
    end
  else
    DebugPrint("Enable Input By TalkComp")
    if IsValid(Player) and Player:GetController() and Player:GetController():IsA(APlayerController) then
      Player:RemoveDisableInputTag("Talk")
    end
  end
  local CurMode = UE4.URuntimeCommonFunctionLibrary.GetInputMode(Player:GetWorld())
  DebugPrint("MouseCaptureMode => PreMode:" .. PreMode .. "," .. "CurMode:" .. CurMode)
  EventManager:FireEvent(EventID.SetInputMode, bDisable)
  EventManager:FireEvent(EventID.TalkComp, bDisable)
end

local TalkComp_PopMouse_C = CreateTalkComp()

function TalkComp_PopMouse_C.New(PlayerController, TalkTaskData)
  local Obj = setmetatable({}, {__index = TalkComp_PopMouse_C})
  Obj.PlayerController = PlayerController
  Obj.TalkTaskData = TalkTaskData
  return Obj
end

function TalkComp_PopMouse_C:GetType()
  return ETalkCompType.PopMouse
end

function TalkComp_PopMouse_C:Execute()
  self:PopMouse(self.PlayerController, true)
end

function TalkComp_PopMouse_C:Resume()
  self:PopMouse(self.PlayerController, false)
end

function TalkComp_PopMouse_C:PopMouse(PlayerController, bPop)
  if bPop then
    DebugPrint("PopMouse")
    if CommonUtils.GetDeviceTypeByPlatformName(GWorld.GameInstance) ~= "Mobile" then
      PlayerController.bShowMouseCursor = true
    end
  else
    DebugPrint("FocusMouse")
    PlayerController.bShowMouseCursor = false
  end
end

local TalkComp_StopPlayerAction_C = CreateTalkComp()

function TalkComp_StopPlayerAction_C.New(Player, TalkContext)
  local Obj = setmetatable({}, {__index = TalkComp_StopPlayerAction_C})
  Obj.InteractiveTag = "Interactive"
  Obj.Player = Player
  Obj.TalkContext = TalkContext
  return Obj
end

function TalkComp_StopPlayerAction_C:GetType()
  return ETalkCompType.StopPlayerAction
end

function TalkComp_StopPlayerAction_C:Execute()
  local GameMode = UE4.UGameplayStatics.GetGameMode(self.TalkContext)
  DebugPrint("StopPlayerAction Execute", GameMode)
  if GameMode and GameMode.SetPlayerCharacterForceIdle and not self.Player:IsDead() then
    GameMode:SetPlayerCharacterForceIdle(self.Player)
    self.Player:SetCharacterTag(self.InteractiveTag)
  end
end

function TalkComp_StopPlayerAction_C:Resume()
  local GameMode = UE4.UGameplayStatics.GetGameMode(self.TalkContext)
  DebugPrint("StopPlayerAction Resume", GameMode)
  if GameMode and GameMode.SetPlayerCharacterForceIdle and not self.Player:IsDead() then
    GameMode:SetPlayerCharacterForceIdle(self.Player)
  end
end

local TalkComp_PauseGame_C = CreateTalkComp()

function TalkComp_PauseGame_C.New(TalkContext, bDisableMonsterAI, bDisableNPCAI)
  local Obj = setmetatable({}, {__index = TalkComp_PauseGame_C})
  Obj.TalkContext = TalkContext
  Obj.bDisableMonsterAI = bDisableMonsterAI
  Obj.bDisableNPCAI = bDisableNPCAI
  return Obj
end

function TalkComp_PauseGame_C:GetType()
  return ETalkCompType.PauseGame
end

function TalkComp_PauseGame_C:Execute()
  self.ImmunePauseObjects = {}
  EventManager:FireEvent(EventID.TalkPauseGame)
  local GameMode = UE4.UGameplayStatics.GetGameMode(self.TalkContext)
  if nil == GameMode then
    DebugPrint("Get GameMode failed...")
    return
  end
  local PC = UE4.UGameplayStatics.GetPlayerController(GWorld.GameInstance, 0)
  if IsValid(PC) then
    PC.bShouldPerformFullTickWhenPaused = true
    self.OriFullTick = PC.bShouldPerformFullTickWhenPaused
  end
  self.TalkContext.TalkStateManager:SetTalkStateByTag(Const.TalkState_DisableMonsterSpawn, true, self)
end

function TalkComp_PauseGame_C:Resume()
  EventManager:FireEvent(EventID.TalkResumeGame)
  self.TalkContext.TalkStateManager:SetTalkStateByTag(Const.TalkState_DisableMonsterSpawn, false, self)
  local GameMode = UE4.UGameplayStatics.GetGameMode(self.TalkContext)
  if nil == GameMode then
    DebugPrint("Get GameMode failed...")
    return
  end
  local PC = UE4.UGameplayStatics.GetPlayerController(GWorld.GameInstance, 0)
  if IsValid(PC) then
    PC.bShouldPerformFullTickWhenPaused = self.OriFullTick or false
  end
end

local TalkComp_DisableAndHideMonster_C = CreateTalkComp()

function TalkComp_DisableAndHideMonster_C.New(TalkContext)
  local Obj = setmetatable({}, {__index = TalkComp_DisableAndHideMonster_C})
  Obj.TalkContext = TalkContext
  Obj.MonsterHiddenMap = {}
  return Obj
end

function TalkComp_DisableAndHideMonster_C:GetType()
  return ETalkCompType.DisableAndHideMonster
end

function TalkComp_DisableAndHideMonster_C:Execute()
  EventManager:FireEvent(EventID.TalkPauseGame)
  self:SetMonsterBTDisableAndHidden(true)
  self.TalkContext.TalkStateManager:SetTalkStateByTag(Const.TalkState_DisableMonsterSpawn, true, self)
end

function TalkComp_DisableAndHideMonster_C:Resume()
  self:SetMonsterBTDisableAndHidden(false)
  self.TalkContext.TalkStateManager:SetTalkStateByTag(Const.TalkState_DisableMonsterSpawn, false, self)
  EventManager:FireEvent(EventID.TalkResumeGame)
end

function TalkComp_DisableAndHideMonster_C:SetMonsterBTDisableAndHidden(bDisable)
  local GameState = UE4.UGameplayStatics.GetGameState(self.TalkContext)
  local entities = GameState.MonsterMap:ToTable()
  for _, entity in pairs(entities) do
    if nil ~= entity and entity:GetController() and entity.IsMonster and entity:IsMonster() then
      if bDisable then
        self:SetMonsterHidden(entity, true)
        entity:SetActorEnableCollision(false)
        entity:SetTimeDilationByBattle(0, true)
      else
        self:SetMonsterHidden(entity, false)
        entity:SetActorEnableCollision(true)
        entity:SetTimeDilationByBattle(1, false)
      end
    end
  end
end

function TalkComp_DisableAndHideMonster_C:SetMonsterHidden(Monster, bHidden)
  DebugPrint("SetMonsterHidden", Monster, bHidden)
  self.TalkContext:SetActorHidden(Monster, bHidden)
  local SkeletalMeshComp = Monster:GetComponentByClass(USkeletalMeshComponent:StaticClass())
  if IsValid(SkeletalMeshComp) then
    SkeletalMeshComp:SetComponentTickEnabled(not bHidden)
  end
  Monster:SetActorTickEnabled(not bHidden)
  if false == bHidden and Monster.HideTags and Monster.HideTags:Contains("TickLod") == true then
    return
  end
  local MovementComp = Monster:GetComponentByClass(UE.UCharacterMovementComponent:StaticClass())
  if IsValid(MovementComp) then
    MovementComp:SetComponentTickEnabled(not bHidden)
  end
end

local TalkComp_HideAllBattleEntity_C = CreateTalkComp()

function TalkComp_HideAllBattleEntity_C.New(TalkContext)
  local Obj = setmetatable({}, {__index = TalkComp_HideAllBattleEntity_C})
  Obj.TalkContext = TalkContext
  return Obj
end

function TalkComp_HideAllBattleEntity_C:GetType()
  return ETalkCompType.HideAllBattleEntity
end

function TalkComp_HideAllBattleEntity_C:Execute()
  self.TalkContext:SetAllBattleEntityHidden(true)
end

function TalkComp_HideAllBattleEntity_C:Resume()
  self.TalkContext:SetAllBattleEntityHidden(false)
end

local TalkComp_DisableInteractiveTrigger_C = CreateTalkComp()

function TalkComp_DisableInteractiveTrigger_C.New(Player)
  local Obj = setmetatable({}, {__index = TalkComp_DisableInteractiveTrigger_C})
  Obj.Player = Player
  return Obj
end

function TalkComp_DisableInteractiveTrigger_C:GetType()
  return ETalkCompType.DisableInteractiveTrigger
end

function TalkComp_DisableInteractiveTrigger_C:Execute()
  self.Player:SetCanInteractiveTrigger(false, "Talk")
end

function TalkComp_DisableInteractiveTrigger_C:Resume()
  self.Player:SetCanInteractiveTrigger(true, "Talk")
end

local TalkComp_HideElseCharacter_C = CreateTalkComp()

function TalkComp_HideElseCharacter_C.New(TalkContext, TalkActors)
  local Obj = setmetatable({}, {__index = TalkComp_HideElseCharacter_C})
  Obj.TalkContext = TalkContext
  Obj.TalkActorIds = {}
  for _, ActorInfo in pairs(TalkActors or {}) do
    local Id = ActorInfo.TalkActorId
    local Type = ActorInfo.TalkActorType
    if "Npc" == Type then
      Obj.TalkActorIds[Id] = Id
    end
  end
  Obj.bManualCall = true
  return Obj
end

function TalkComp_HideElseCharacter_C:GetType()
  return ETalkCompType.HideElseCharacter
end

function TalkComp_HideElseCharacter_C:Execute()
end

function TalkComp_HideElseCharacter_C:Resume()
end

local TalkComp_SoundEffect_C = CreateTalkComp()

function TalkComp_SoundEffect_C.New(TalkContext)
  local Obj = setmetatable({}, {__index = TalkComp_SoundEffect_C})
  Obj.TalkContext = TalkContext
  return Obj
end

function TalkComp_SoundEffect_C:GetType()
  return ETalkCompType.SoundEffect
end

function TalkComp_SoundEffect_C:Execute()
  AudioManager(self.TalkContext):PlayUISound(nil, "event:/snapshot/ui/filter_talk_stage", "Talk_Stage_Snapshot", nil)
end

function TalkComp_SoundEffect_C:Resume()
  AudioManager(self.TalkContext):SetEventSoundParam(nil, "Talk_Stage_Snapshot", {ToEnd = 1})
end

local TalkComp_HideNpcHeadUI_C = CreateTalkComp()

function TalkComp_HideNpcHeadUI_C.New(TalkContext)
  local Obj = setmetatable({}, {__index = TalkComp_HideNpcHeadUI_C})
  return Obj
end

function TalkComp_HideNpcHeadUI_C:GetType()
  return ETalkCompType.HideNpcHeadUI
end

function TalkComp_HideNpcHeadUI_C:Execute()
  local HeadUISubsystem = UNpcHeadUISubsystem.GetHeadUISubsystem(GWorld.GameInstance)
  if HeadUISubsystem then
    HeadUISubsystem:HideAllNpcHeadUI(true, "TalkComp")
  end
end

function TalkComp_HideNpcHeadUI_C:Resume()
  local HeadUISubsystem = UNpcHeadUISubsystem.GetHeadUISubsystem(GWorld.GameInstance)
  if HeadUISubsystem then
    HeadUISubsystem:HideAllNpcHeadUI(false, "TalkComp")
  end
end

return {
  ETalkCompType = ETalkCompType,
  TalkComp_HideGameUI_C = TalkComp_HideGameUI_C,
  TalkComp_DisableInput_C = TalkComp_DisableInput_C,
  TalkComp_PopMouse_C = TalkComp_PopMouse_C,
  TalkComp_StopPlayerAction_C = TalkComp_StopPlayerAction_C,
  TalkComp_PauseGame_C = TalkComp_PauseGame_C,
  TalkComp_DisableAndHideMonster_C = TalkComp_DisableAndHideMonster_C,
  TalkComp_HideAllBattleEntity_C = TalkComp_HideAllBattleEntity_C,
  TalkComp_DisableInteractiveTrigger_C = TalkComp_DisableInteractiveTrigger_C,
  TalkComp_HideElseCharacter_C = TalkComp_HideElseCharacter_C,
  TalkComp_SoundEffect_C = TalkComp_SoundEffect_C,
  TalkComp_HideNpcHeadUI_C = TalkComp_HideNpcHeadUI_C
}
