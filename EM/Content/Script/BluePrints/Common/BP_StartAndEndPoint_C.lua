require("UnLua")
local BP_StartAndEndPoint_C = Class()

function BP_StartAndEndPoint_C:DebugPrint(...)
  if self.IsStartPoint == true then
    DebugPrint("StartAndEndPoint StartPoint", ...)
  else
    DebugPrint("StartAndEndPoint EndPoint", ...)
  end
end

function BP_StartAndEndPoint_C:ReceiveBeginPlay()
  self:DebugPrint("ReceiveBeginPlay")
  self.PointArray = self:K2_GetComponentsByClass(LoadClass("/Game/BluePrints/Item/Mechanism/Seat/BP_SeatEnterComponent.BP_SeatEnterComponent"):StaticClass())
  self.PointList = {}
  for i = 1, self.PointArray:Length() do
    self.PointList[self.PointArray[i].Index] = self.PointArray[i]
  end
  if self.IsStartPoint == false then
    UE4.UGameplayStatics.GetGameState(self):SetEndPointActor(self)
  end
  self.Index = 0
  if self.IsRandomPoint == true then
    self:ShufflePointList()
  end
end

function BP_StartAndEndPoint_C:ShufflePointList()
  local Count = #self.PointList
  while Count > 1 do
    local n = math.random(1, Count)
    if self.PointList[n] ~= nil then
      self.PointList[Count], self.PointList[n] = self.PointList[n], self.PointList[Count]
      Count = Count - 1
    end
  end
  for k, v in pairs(self.PointList) do
    DebugPrint("BP_StartAndEndPoint_C:ShufflePointList ", k, v:GetName())
  end
end

function BP_StartAndEndPoint_C:SetPlayerTrans()
  self:DebugPrint("WorldComposition, SetPlayerTrans")
  local Character = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  if URuntimeCommonFunctionLibrary.IsWorldCompositionEnabled(self) then
    local WorldCompositionSubSystem = UWorldCompositionSubSystem and USubsystemBlueprintLibrary.GetWorldSubsystem(self, UWorldCompositionSubSystem:StaticClass())
    if not WorldCompositionSubSystem then
      return
    end
    local Transform = self:GetTransform(0)
    WorldCompositionSubSystem:RequestAsyncTravel(Character, Transform, {
      self,
      self.OpenPlayerPositionSync
    }, true, true)
    return
  end
  local Location = self:K2_GetActorLocation()
  Location.Z = Location.Z + Character.CapsuleComponent:GetUnscaledCapsuleHalfHeight()
  Character:K2_SetActorLocation(Location, false, nil, true)
  local Rotation = self:K2_GetActorRotation()
  Character:K2_SetActorRotation(Rotation, false)
  local Controller = UE4.UGameplayStatics.GetPlayerController(self, 0)
  Controller:SetControlRotation(Rotation)
  self:OpenPlayerPositionSync()
end

function BP_StartAndEndPoint_C:InitSetPlayerTrans()
  self:DebugPrint("InitSetPlayerTrans")
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  if not IsValid(GameMode) then
    return
  end
  for i = 0, GameMode:GetTargetPlayerNum() - 1 do
    local Controller = UE4.UGameplayStatics.GetPlayerController(self, i)
    if not Controller then
    else
      local Player = Controller:GetMyPawn()
      if not Player then
      else
        if Controller.TargetBornLocation == FVector(0, 0, 0) then
          self:SetInitTrans(Controller, i)
        end
        if not GameMode.ClientReadyMap:FindRef(Controller.AvatarEidStr) then
          print(_G.LogTag, "InitSetPlayerTrans without client ready, continue", Controller.AvatarEidStr)
        else
          Player:K2_SetActorLocation(Controller.TargetBornLocation, false, nil, true)
          print(_G.LogTag, "InitSetPlayerTrans SetLocation Succcesss", Player:K2_GetActorLocation())
          Player:GetMovementComponent():ForceClientUpdate()
          Player:MulticastSetPlayerRotation(Controller.TargetBornRotator)
          Player:RemoveGravityModifier(UE4.EGravityModifierTag.LoadLevel)
        end
      end
    end
  end
end

function BP_StartAndEndPoint_C:OpenPlayerPositionSync()
  self:DebugPrint("OpenPlayerPositionSync")
  local Avatar = GWorld:GetAvatar()
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  if not Avatar or not IsValid(GameMode) then
    return
  end
  local WorldLoader = GameMode:GetLevelLoader()
  if not IsValid(WorldLoader) or not WorldLoader.IsWorldLoader then
    return
  end
  WorldLoader:OpenPlayerPositionSync()
end

function BP_StartAndEndPoint_C:SetInitTrans(PlayerController, Index)
  self:DebugPrint("SetInitTrans")
  local Player = PlayerController:GetMyPawn()
  if not Index then
    Index = self.Index
    self.Index = self.Index + 1
  end
  local Transform = self:GetTransform(Index)
  local NewTranslation = Transform.Translation
  NewTranslation.Z = NewTranslation.Z + Player.CapsuleComponent:GetUnscaledCapsuleHalfHeight()
  PlayerController.TargetBornLocation = NewTranslation
  PlayerController.TargetBornRotator = Transform.Rotation:ToRotator()
end

function BP_StartAndEndPoint_C:SetEnteredPlayerTrans(PlayerController)
  self:DebugPrint("SetEnteredPlayerTrans")
  if not GWorld.GameInstance:GetCurrentGameMode():SetEnteredPlayerTransform(PlayerController) then
    PlayerController.TargetBornLocation = self:K2_GetActorLocation()
    PlayerController.TargetBornRotator = self:K2_GetActorRotation()
  end
end

function BP_StartAndEndPoint_C:RealSetNewEnteredPlayerTrans(AvatarEidStr)
  self:DebugPrint("RealSetNewEnteredPlayerTrans")
  local PlayerController = UE4.URuntimeCommonFunctionLibrary.GetPlayerControllerByAvatarEid(self, AvatarEidStr)
  local Character = PlayerController:GetMyPawn()
  local NewLocation = PlayerController.TargetBornLocation
  NewLocation.Z = NewLocation.Z + Character.CapsuleComponent:GetUnscaledCapsuleHalfHeight()
  Character:K2_SetActorLocation(PlayerController.TargetBornLocation, false, nil, true)
  Character:K2_SetBase()
  Character:GetMovementComponent():ForceClientUpdate()
  Character:UpdateCurrentLevelId()
  Character:MulticastSetPlayerRotation(PlayerController.TargetBornRotator)
  Character:RemoveGravityModifier(UE4.EGravityModifierTag.LoadLevel)
end

function BP_StartAndEndPoint_C:GetTransform(i)
  i = i or 0
  self:DebugPrint("GetTransform i =", i)
  assert(i + 1 <= self.PointArray:Length(), "PlayerNumber " .. i .. " Can not find a point")
  return self.PointList[i + 1]:K2_GetComponentToWorld()
end

return BP_StartAndEndPoint_C
