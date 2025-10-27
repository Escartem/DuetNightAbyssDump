require("UnLua")
local BP_MonsterRushComponent_C = Class({
  "BluePrints.Common.TimerMgr"
})

function BP_MonsterRushComponent_C:InitMonsterRushComponent()
  self.GameMode = self:GetOwner()
  self.Player = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  self:InitData(self.GameMode.DungeonId)
  self:InitSceneCaptureComponent()
end

function BP_MonsterRushComponent_C:InitSceneCaptureComponent()
  self.RenderTexture = UKismetRenderingLibrary.CreateRenderTarget2D(self)
  local size = UWidgetLayoutLibrary.GetViewportSize(self)
  URuntimeCommonFunctionLibrary.RenderTarget2DResize(self.RenderTexture, size.X, size.Y)
  local player = UGameplayStatics.GetPlayerCharacter(self, 0)
  self.SceneCaptureComponent = NewObject(USceneCaptureComponent2D, player)
  self.SceneCaptureComponent:K2_AttachToComponent(player.CharCameraComponent)
  self.SceneCaptureComponent:K2_SetRelativeTransform(FTransform(), false, nil, false)
  URuntimeCommonFunctionLibrary.RegisterComponent(self.SceneCaptureComponent)
  self.SceneCaptureComponent.FOVAngle = player.CharCameraComponent.FieldOfView
  self.SceneCaptureComponent.TextureTarget = self.RenderTexture
  self.SceneCaptureComponent.CaptureSource = ESceneCaptureSource.SCS_FinalColorHDR
  self.SceneCaptureComponent:SetComponentTickEnabled(false)
  self.SceneCaptureComponent.bCaptureEveryFrame = false
  self.SceneCaptureComponent.bCaptureOnMovement = false
end

function BP_MonsterRushComponent_C:ClearSceneCaptureComponent()
  if self.SceneCaptureComponent then
    self.SceneCaptureComponent:K2_DestroyComponent(self.SceneCaptureComponent)
    self.SceneCaptureComponent = nil
  end
  UKismetRenderingLibrary.ReleaseRenderTarget2D(self.RenderTexture)
  self.RenderTexture = nil
end

function BP_MonsterRushComponent_C:InitData(LevelId)
  self.LevelInfo = DataMgr.MonsterRushDungeon[LevelId]
  if not self.LevelInfo then
    LogError(_G.LogTag, " thy  InitMonsterRushComponent->InitData is fail! self.LevelInfo is nil")
    return
  end
  self.Description = self.LevelInfo.Description
  self.GlobalPassiveList = self.LevelInfo.GlobalPassiveList
  self.BattlePetList = self.LevelInfo.BattlePetList
  self.MonsterList = self.LevelInfo.MonsterList
  self.StaticCreatorList = self.LevelInfo.StaticCreatorList
  self.TargetNum = self.LevelInfo.TargetNum
  self.MonsterRushKilledNum = 0
  self:InitStaticCreatorIdArr()
  self:InitMonsterArr()
end

function BP_MonsterRushComponent_C:ClearMonsterRushComponent()
  self:ClearSceneCaptureComponent()
end

function BP_MonsterRushComponent_C:InitMonsterRushBaseInfo()
  self:InitGlobalPassive()
end

function BP_MonsterRushComponent_C:InitGlobalPassive()
  if not self.GlobalPassiveList then
    LogError(_G.LogTag, " thy  GlobalPassiveList is nil")
    return
  end
  for key, value in pairs(self.GlobalPassiveList) do
    Battle(self):AddGlobalPassive(value, nil, 0)
  end
end

function BP_MonsterRushComponent_C:OnMonsterRushTeleport()
  if IsStandAlone(self) or IsClient(self) then
    UIManager(self):LoadUINew("RougeTransition", self.SceneCaptureComponent, self.RenderTexture, false)
  end
end

function BP_MonsterRushComponent_C:MonsterRushTeleport(Location, Rotation)
  if self.GameMode.EMGameState.GameModeType ~= "MonsterRush" then
    return
  end
  self:OnMonsterRushTeleport()
  local PlayerCharacter = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  PlayerCharacter:K2_TeleportTo(Location, Rotation, false, nil, false)
end

function BP_MonsterRushComponent_C:InitBattlePetArr()
  if self.BattlePetList then
    for index, value in ipairs(self.BattlePetList) do
      self.BattlePetId:Add(value)
    end
  end
end

function BP_MonsterRushComponent_C:InitStaticCreatorIdArr()
  if self.StaticCreatorList then
    for index, value in ipairs(self.StaticCreatorList) do
      self.StaticCreatorId:Add(value)
    end
  end
end

function BP_MonsterRushComponent_C:InitMonsterArr()
  if self.MonsterList then
    for index, value in ipairs(self.MonsterList) do
      self.MonsterSpawnId:Add(value)
    end
  end
end

function BP_MonsterRushComponent_C:AddMonsterRushKilledNum(Num)
  self.MonsterRushKilledNum = math.min(self.MonsterRushKilledNum + Num, self.TargetNum)
  self:UpdateUI()
  self:CheckTargetNum()
end

function BP_MonsterRushComponent_C:UpdateUI()
end

function BP_MonsterRushComponent_C:CheckTargetNum()
  if self.MonsterRushKilledNum >= self.TargetNum then
    DebugPrint("thy    OnTargetNumSuccess")
    self.GameMode:TriggerGameModeEvent("OnTargetNumSuccess", self)
  end
end

return BP_MonsterRushComponent_C
