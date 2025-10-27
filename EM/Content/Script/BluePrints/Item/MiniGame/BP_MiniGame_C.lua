require("UnLua")
local BP_MiniGame_C = Class("BluePrints/Item/Chest/BP_MechanismBase_C")

function BP_MiniGame_C:AuthorityInitInfo(Info)
  BP_MiniGame_C.Super.AuthorityInitInfo(self, Info)
  if self.UnitParams then
    self.Difficulty = self.UnitParams.Difficulty or 0
    self.GameTime = self.UnitParams.GameTime or 0
    self.RecordMapIndex = self.UnitParams.Locked or nil
    self.bMapIndexIsLocked = self.RecordMapIndex and true or false
    self.DeActiveStateId = self.UnitParams.ActiveStateId
    self.FiniStateId = self.UnitParams.FiniStateId
  end
end

function BP_MiniGame_C:CommonInitInfo(Info)
  BP_MiniGame_C.Super.CommonInitInfo(self, Info)
  self.InteractiveType = Const.EndByTargetInteractive
  if self.UnitParams then
    self.Difficulty = self.UnitParams.Difficulty or 0
    self.GameTime = self.UnitParams.GameTime or 0
    self.RecordMapIndex = self.UnitParams.Locked or nil
    self.bMapIndexIsLocked = self.RecordMapIndex and true or false
    self.DeActiveStateId = self.UnitParams.ActiveStateId
    self.FiniStateId = self.UnitParams.FiniStateId
  end
  self.UIPath = self.UnitParams.UIPath or "/Game/LGUI/UI_IPHONE/MiniGame/MiniGame"
  self.MiniGameType = self.UnitParams.MiniGameType or "ConnectLine"
end

function BP_MiniGame_C:OnActorReady(Info)
  BP_MiniGame_C.Super.OnActorReady(self, Info)
  local StateData = DataMgr.MechanismState[self.StateId]
  if StateData then
    for i, v in pairs(StateData.StateEvent) do
      if v.TypeNextState and v.TypeNextState.Type == "InteractBreak" then
        self:ChangeState("InteractBreak", 0)
      end
    end
  end
  EventManager:FireEvent(EventID.OnMiniGameCreated, self)
end

function BP_MiniGame_C:SetPlayerRotation()
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(self, 0):Cast(UE4.LoadClass("Blueprint'/Game/BluePrints/Char/BP_PlayerCharacter.BP_PlayerCharacter_C'"))
  self.CharSpringArmComponent = Player.CharSpringArmComponent
  self.CharSpringArmComponent.bLeaveCollisionImmediately = true
  self.OriginalRotation = self.CharSpringArmComponent:K2_GetComponentRotation()
  self.CharCameraComponent = Player.CharCameraComponent
  self.CharSpringArmComponent.bUsePawnControlRotation = false
  self.CharSpringArmComponent:K2_SetRelativeRotation(FRotator(20, 60, 0), false, nil, false)
  local CameraControlStruct = FCameraControlStruct()
  CameraControlStruct.SocketOffset = FVector(180, 35, 15)
  CameraControlStruct.ArmLength = 330
  CameraControlStruct.ArmPos = FVector(0, 0, 25)
  CameraControlStruct.ProbeSize = 3
  Player.CameraControlComponent:PushCameraState("MiniGame", CameraControlStruct, 0, 9999999)
end

function BP_MiniGame_C:LoadMiniGameUMG()
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  local UIManager = GameInstance:GetGameUIManager()
  if self.MiniGameType == "ConnectLine" then
    self.MiniGameLogic = UIManager:LoadUINew("ConnectLine")
  elseif self.MiniGameType == "ZhuanQuanQuan" then
    self.MiniGameLogic = UIManager:LoadUINew("ZhuanQuanQuan")
  elseif self.MiniGameType == "ShuiFa" then
    self.MiniGameLogic = UIManager:LoadUINew("ShuiFa")
  elseif self.MiniGameType == "TiaoPin" then
    self.MiniGameLogic = UIManager:LoadUINew("TiaoPin")
  elseif self.MiniGameType == "Morse" then
    self.MiniGameLogic = UIManager:LoadUINew("Morse")
  end
  self.MiniGameLogic.UseActor = self
  self.MiniGameLogic.Time = self.GameTime - 1
  self.MiniGameLogic.MapIndex = self.MapIndex
  self.MiniGameLogic.Difficulty = self.Difficulty
  self.MiniGameLogic.FailedTime = self.FailedTime
  self.MiniGameLogic.bMapIndexIsLocked = self.bMapIndexIsLocked
  self.MiniGameLogic.bCanCrack = self:CheckCanCrack()
  self.MiniGameLogic:InitAfterBeginPlay()
end

function BP_MiniGame_C:CheckCanCrack()
  if self.OpenState then
    return false
  end
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  local BattlePet = Player:GetBattlePet()
  if not BattlePet then
    return false
  end
  local BattlePetData = DataMgr.BattlePet[BattlePet.BattlePetID]
  if BattlePetData and BattlePetData.CanDecode then
    return true
  end
  for i, v in pairs(BattlePet.PetAffixList) do
    local AffixData = DataMgr.PetEntry[v]
    if AffixData and AffixData.BattlePetID then
      local BattlePetData = DataMgr.BattlePet[AffixData.BattlePetID]
      if BattlePetData and BattlePetData.CanDecode then
        return true
      end
    end
  end
  return false
end

function BP_MiniGame_C:GetRandomMapIndex()
  math.randomseed(tostring(os.time()):reverse():sub(1, 7))
  self.MapIndex = self.RecordMapIndex or math.random(1, 1000)
  self.RecordMapIndex = self.MapIndex
  UEPrint("Random MapIndex " .. self.MapIndex)
end

function BP_MiniGame_C:LoadGameUI(Id)
  if IsAuthority(self) and not IsStandAlone(self) then
    return
  end
  if UE4.UGameplayStatics.GetPlayerCharacter(self, 0).Eid ~= Id then
    return
  end
  self.LoadGame = true
  self:SetPlayerRotation()
  self:GetRandomMapIndex()
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  local UIManager = GameInstance:GetGameUIManager()
  UIManager:HideAllUI(true, Const.MiniGameHideTag)
  local PlayerCharacter = Battle(self):GetEntity(Id)
  local PlayerController = PlayerCharacter:GetController()
  PlayerCharacter:SetCharacterTag("Idle")
  PlayerCharacter:SetCharacterTag("Interactive")
  self:LoadMiniGameUMG()
end

function BP_MiniGame_C:UnLoadGameUI(PlayerId)
  if not IsClient(self) and not IsStandAlone(self) then
    return
  end
  if UE4.UGameplayStatics.GetPlayerPawn(self, 0).Eid ~= PlayerId then
    return
  end
  if self.LoadGame then
    local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
    local UIManager = GameInstance:GetGameUIManager()
    UIManager:HideAllUI(false, Const.MiniGameHideTag)
    local PlayerCharacter = Battle(self):GetEntity(PlayerId)
    local PlayerController = PlayerCharacter:GetController()
    PlayerCharacter:SetCharacterTagIdle()
    PlayerCharacter:EnableInput(PlayerController)
    self:ResetPlayerRotation()
  end
end

function BP_MiniGame_C:ResetPlayerRotation()
  self.CharSpringArmComponent.bUsePawnControlRotation = true
  self.CharSpringArmComponent:K2_SetWorldRotation(self.OriginalRotation, false, nil, false)
  self.CharSpringArmComponent.bLeaveCollisionImmediately = false
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(self, 0):Cast(UE4.LoadClass("Blueprint'/Game/BluePrints/Char/BP_PlayerCharacter.BP_PlayerCharacter_C'"))
  Player.CameraControlComponent:PopCameraState("MiniGame")
end

function BP_MiniGame_C:OnMiniGameStartServer(Id)
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  self.FailedTime = GameMode.MiniGameFailedTime[self.MiniGameType] or 0
  self.PlayerEid = Id
  self:OnMiniGameStartClient(Id)
end

function BP_MiniGame_C:OpenMechanism(Id)
  if self.OpenState then
    return
  end
  if 0 == self.Difficulty then
    self:SetVariableBool("IsGameSuccess", true, Id)
    self.PlayerEid = Id
    self:CloseMechanism(Id, true)
  elseif IsAuthority(self) then
    self:OnMiniGameStartServer(Id)
  end
end

function BP_MiniGame_C:CrackMiniGame(Id)
  self:SetVariableBool("IsGameSuccess", true, Id)
  self.PlayerEid = Id
  self:CloseMechanism(Id, true)
end

function BP_MiniGame_C:CloseMechanism(PlayerId, IsSuccess)
  self:OnMiniGameEndSever(PlayerId)
end

function BP_MiniGame_C:ForceCloseMechanism(PlayerId, IsSuccess)
  self:BroadcastCloseMechanism(PlayerId)
  self:OnMiniGameEndSever(PlayerId)
end

function BP_MiniGame_C:BroadcastCloseMechanism_Lua(PlayerId)
  if self.MiniGameLogic then
    self.MiniGameLogic:GameFailed()
  end
end

function BP_MiniGame_C:TriggerFunctionOnSelf()
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  if self.IsGameSuccess or self.AlwaysSuccess then
    self:UpdateRegionData("OpenState", true)
    GameMode:TriggerOnMiniGameSuccess(self.MiniGameType, self.CreatorId)
    local Callback = GameMode.MiniGameSuccessCallback
    if Callback and Callback[self.CreatorId] then
      Callback[self.CreatorId]()
    end
  else
    self:UpdateRegionData("OpenState", false)
    GameMode:TriggerOnMiniGameFail(self.MiniGameType, self.CreatorId)
  end
end

function BP_MiniGame_C:TriggerFunctionOnParent()
  if self.IsGameSuccess or self.AlwaysSuccess then
    self:UpdateRegionData("OpenState", true)
    self:TriggerSource()
  else
    self:UpdateRegionData("OpenState", false)
    local GameMode = UE4.UGameplayStatics.GetGameMode(self)
    if not GameMode.MiniGameFailedTime[self.MiniGameType] then
      GameMode.MiniGameFailedTime[self.MiniGameType] = 1
    else
      GameMode.MiniGameFailedTime[self.MiniGameType] = GameMode.MiniGameFailedTime[self.MiniGameType] + 1
    end
  end
end

return BP_MiniGame_C
