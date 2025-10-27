require("UnLua")
local BP_PetNPC_C = Class("BluePrints.Char.BP_NPC_C")

function BP_PetNPC_C:ReceiveBeginPlay()
  BP_PetNPC_C.Super.ReceiveBeginPlay(self)
  self.IsDestroied = false
end

function BP_PetNPC_C:ReceiveEndPlay()
  BP_PetNPC_C.Super.ReceiveEndPlay(self)
  self.IsDestroied = true
end

function BP_PetNPC_C:InitInteractiveState(WorldRegionEid)
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  if GameMode and GameMode:IsInDungeon() then
    local GameState = UE4.UGameplayStatics.GetGameState(self)
    for i, Player in pairs(GameMode:GetAllPlayer()) do
      if self.InteractiveState == ENpcPetState.Active and GameState:IsInHidePetPlayers(Player.Eid) == false then
        GameState:PetAddGuide(Player.Eid)
      else
        Player:HidePetGuideNotify(self.Eid)
      end
    end
    return
  end
  self.InteractiveState = ENpcPetState.Active
  local Avatar = GWorld:GetAvatar()
  if not (Avatar and WorldRegionEid) or -1 == WorldRegionEid then
    return
  end
  local PetStateInfo = Avatar.PetRegionAttrs[WorldRegionEid]
  if not PetStateInfo then
    return
  end
  self.InteractiveState = PetStateInfo.PetState
end

function BP_PetNPC_C:ClientInteractiveStateRecover()
  local ProgressWidget = self.PetHeadWidgetComponent:GetWidget()
  if ProgressWidget then
    ProgressWidget.Root:SetVisibility(ESlateVisibility.Collapsed)
  end
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  if GameState:IsInDungeon() then
    local Player = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
    if GameState:IsInHidePetPlayers(Player.Eid) then
      self.CanInteractiveInClient = false
      self:SetActorHideTag("PetInteractiveSuccess", true)
      DebugPrint("================Client Init======HidePet_PlayerEid:", Player.Eid)
    end
  end
end

function BP_PetNPC_C:SetInteractiveState(NewState)
  if NewState and NewState >= ENpcPetState.None and NewState <= ENpcPetState.InteractiveFail then
    self.InteractiveState = NewState
  end
end

function BP_PetNPC_C:ClientSetInteractiveState(NewState)
  if NewState and NewState >= ENpcPetState.None and NewState <= ENpcPetState.InteractiveFail then
    self.ClientInteractiveState = NewState
  end
end

function BP_PetNPC_C:PlaySuccessMontage()
  local AnimInstance = self.Mesh:GetAnimInstance()
  if AnimInstance then
    AnimInstance.PetStates = 3
  end
end

function BP_PetNPC_C:PlayFailureMontage()
  local AnimInstance = self.Mesh:GetAnimInstance()
  if AnimInstance then
    AnimInstance.PetStates = 4
  end
end

function BP_PetNPC_C:PlayFailureMontageThenDestroy()
  local AnimInstance = self.Mesh:GetAnimInstance()
  if AnimInstance then
    AnimInstance.PetStates = 4
  end
  self:OnPetStatesSwitch(4)
  self:AddTimer(4, function()
    self.InteractiveState = ENpcPetState.InteractiveFail
    self:EMActorDestroy(EDestroyReason.PetAfterInteractive)
  end)
end

function BP_PetNPC_C:HidePetNotifyEarly(ErrCode)
  if ErrCode == ErrorCode.RET_PET_CAPTURE_FAILED or ErrCode == ErrorCode.RET_SUCCESS then
    local DungeonId = GWorld.GameInstance:GetCurrentDungeonId()
    if not GWorld.GameInstance:IsNullDungeonId(DungeonId) and IsClient(self) then
      local Player = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
      Player:HidePetNotify(self.Eid)
      DebugPrint("================Client HidePetNotifyEarly======HidePet_PlayerEid:", Player.Eid)
    end
  else
    ErrorCode:Check(ErrCode)
  end
end

function BP_PetNPC_C:RegionCapturePetCallback(bSuccess)
  self.InteractiveState = bSuccess and ENpcPetState.InteractiveSuccess or ENpcPetState.InteractiveFail
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  if IsValid(GameMode) and GameMode:GetRegionDataMgrSubSystem() then
    GameMode:GetRegionDataMgrSubSystem():UpdatePetRegionActorData(self, self.InteractiveState)
  end
end

function BP_PetNPC_C:OnInteractiveFinish(bSuccess)
  local Avatar = GWorld:GetAvatar()
  if Avatar and bSuccess and 0 == Avatar.CurrentPet then
    Avatar:EquipCurPet()
  end
  self.InteractiveState = bSuccess and ENpcPetState.InteractiveSuccess or ENpcPetState.InteractiveFail
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  local DungeonId = GWorld.GameInstance:GetCurrentDungeonId()
  if not GWorld.GameInstance:IsNullDungeonId(DungeonId) then
    if IsClient(self) then
      self:SetActorHideTag("PetInteractiveSuccess", true)
      self.CanInteractiveInClient = false
      local Player = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
      Player:HidePetGuideNotify(self.Eid)
      DebugPrint("================Client InteractiveFinish===HidePetGuideNotify===HidePet_PlayerEid:", Player.Eid)
    elseif IsStandAlone(self) then
      GameState:PetRemoveGuide(self.Eid)
      self:EMActorDestroy(EDestroyReason.PetAfterInteractive)
    end
  else
    GameState:PetRemoveGuide(self.Eid)
    self:EMActorDestroy(EDestroyReason.PetAfterInteractive)
  end
end

function BP_PetNPC_C:RegisterUpdateProgressFunc(UpdateFunc)
  self.UpdateFunc = UpdateFunc
end

function BP_PetNPC_C:ProgressUpdate(TickDelta)
  if self.UpdateFunc then
    self.UpdateFunc(TickDelta)
  end
end

function BP_PetNPC_C:OnEMActorDestroy_Lua(DestroyReason)
  self:CommonOnEMActorDestroy(DestroyReason)
  if DestroyReason == EDestroyReason.LevelUnloadedSaveGame then
    local GameMode = UGameplayStatics.GetGameMode(self)
    if GameMode then
      GameMode:GetRegionDataMgrSubSystem():DeadRegionActorData(self, DestroyReason, GameMode:GetActorLevelName(self))
    end
  end
  if IsAuthority(self) then
    self:ServerOnEMActorDestroy(DestroyReason)
  end
end

return BP_PetNPC_C
