local M = Class()

function M:ReceiveBeginPlay()
  local UIManager = GWorld.GameInstance:GetGameUIManager()
  if not UIManager then
    GWorld.GameInstance:GetSceneManager():AddFoorBox(self)
    return
  end
  local battleMain = UIManager:GetUI("BattleMain")
  if not battleMain then
    GWorld.GameInstance:GetSceneManager():AddFoorBox(self)
    return
  end
  local battleMap = battleMain.Battle_Map or battleMain.Battle_Map_PC
  if battleMap then
    battleMap:AddFloorBox(self)
  else
    GWorld.GameInstance:GetSceneManager():AddFoorBox(self)
    return
  end
  if URuntimeCommonFunctionLibrary.IsWorldCompositionEnabled(self) then
    GWorld.GameInstance:GetSceneManager():AddFoorBox(self)
  end
end

function M:CheckPlayerIn()
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  if Player and UKismetMathLibrary.IsPointInBoxWithTransform(Player:k2_GetActorLocation(), self:GetTransform(), self.RootComponent.BoxExtent) then
    EventManager:FireEvent(EventID.EnterOrExitFloor, true, self)
  end
end

function M:EnterOrExitFloor(IsEnter)
  EventManager:FireEvent(EventID.EnterOrExitFloor, IsEnter, self)
end

return M
