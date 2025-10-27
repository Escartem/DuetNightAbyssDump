local Component = {}

function Component:InitAddGuideComponent()
  if not IsAuthority(self) then
    return
  end
  if not self:CheckInitGuideType() then
    return
  end
  if self:CheckGuideEidExist() then
    return
  end
  self:CreateGuideHandle(true)
end

function Component:CheckGuideEidExist()
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  return GameState:ContainsGuideEid(self.Eid)
end

function Component:StopAddGuideTimer()
  self:RemoveTimer(self.FixTryToAddGuideHandle)
  self.FixTryToAddGuideHandle = nil
end

function Component:TryToAddGuide()
  if self:StopTryToAddGuideTimer() then
    return
  end
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  local SelfLocation = self:K2_GetActorLocation()
  for i, Player in pairs(GameMode:GetAllPlayer()) do
    local PlayerLocation = Player:K2_GetActorLocation()
    local Distance = UE4.UKismetMathLibrary.Vector_Distance(PlayerLocation, SelfLocation)
    if not self.ShowGuideDistance or Distance < self.ShowGuideDistance then
      local GameState = UE4.UGameplayStatics.GetGameState(self)
      self:StopAddGuideTimer()
      GameMode:TriggerDungeonComponentFun("OnMonsterGuideAdded", self.Eid)
      GameState:AddGuideEid(self.Eid)
      return
    end
  end
end

function Component:TryToAddRangeGuide(Type)
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  local SceneManager = GameInstance:GetSceneManager()
  for i, Player in pairs(GameMode:GetAllPlayer()) do
    local Distance = self:GetActorDistance(Player, self)
    if Distance > self.ShowGuideMinDistance and Distance < self.ShowGuideMaxDistance then
      if "in" == Type and self.GuideType ~= "inAdd" then
        self:AddGuideEid(self.Eid, SceneManager, GameState, Type)
      elseif "out" == Type and self.GuideType ~= "outRemove" then
        self:RemoveGuideEid(self.Eid, SceneManager, GameState, Type)
      end
    elseif "in" == Type and self.GuideType ~= "inRemove" then
      self:RemoveGuideEid(self.Eid, SceneManager, GameState, Type)
    elseif "out" == Type and self.GuideType ~= "outAdd" then
      self:AddGuideEid(self.Eid, SceneManager, GameState, Type)
    end
    return
  end
end

function Component:AddGuideEid(Eid, SceneManager, GameState, Type, PlayerEid)
  local RealPlayerEid = -1
  if nil ~= PlayerEid then
    RealPlayerEid = PlayerEid
  end
  GameState:AddGuideEid(Eid, RealPlayerEid)
  if nil == RealPlayerEid or RealPlayerEid < 0 then
    SceneManager:UpdateOneSceneGuideIcon(Eid, true, false)
  else
    SceneManager:UpdateOneSceneGuideIcon(Eid, true, true)
  end
  self.GuideType = Type .. "Add"
end

function Component:RemoveGuideEid(Eid, SceneManager, GameState, Type, PlayerEid)
  local RealPlayerEid = -1
  if nil ~= PlayerEid then
    RealPlayerEid = PlayerEid
  end
  GameState:RemoveGuideEid(Eid, RealPlayerEid)
  if nil == PlayerEid or PlayerEid < 0 then
    SceneManager:UpdateOneSceneGuideIcon(Eid, false, false)
  else
    SceneManager:UpdateOneSceneGuideIcon(Eid, false, true)
  end
  self.GuideType = Type .. "Remove"
end

return Component
