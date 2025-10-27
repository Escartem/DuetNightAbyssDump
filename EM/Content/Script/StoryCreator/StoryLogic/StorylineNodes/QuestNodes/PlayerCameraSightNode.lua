local PlayerCameraSightNode = Class("StoryCreator.StoryLogic.StorylineNodes.BaseAsynQuestNode")

function PlayerCameraSightNode:Init()
  self.TargetPointName = ""
  self.KeepSightTime = 0
  self.ECameraAxisLockType = "None"
  self.Speed = 1
end

function PlayerCameraSightNode:Execute(Callback)
  DebugPrint("------------ PlayerCameraSightNode ------------------")
  local GameInstance = GWorld.GameInstance
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(GameInstance, 0)
  local EMGameState = UE4.UGameplayStatics.GetGameState(GameInstance)
  local NewTargetPoint = EMGameState:GetTargetPoint(self.TargetPointName)
  if NewTargetPoint and Player and Player.StartCameraKeepSightOnActor then
    local function Func()
      Callback()
    end
    
    Player:StartCameraKeepSightOnActor(NewTargetPoint, self.KeepSightTime, self.ECameraAxisLockType, self.Speed, Func)
  else
    print(_G.LogTag, "ERROR: \228\184\141\229\173\152\229\156\168NewTargetPoint\239\188\154" .. (self.TargetPointName or "") .. "\230\136\150PlayerCharacter\228\184\141\229\143\175\231\148\168")
    Callback()
  end
end

return PlayerCameraSightNode
