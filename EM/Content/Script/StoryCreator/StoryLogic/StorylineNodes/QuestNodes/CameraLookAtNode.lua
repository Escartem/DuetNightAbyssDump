local CameraLookAtNode = Class("StoryCreator.StoryLogic.StorylineNodes.BaseAsynQuestNode")

function CameraLookAtNode:Init()
  self.TargetType = nil
  self.PointName = ""
  self.ActorId = 0
  self.Duration = 0
  self.EasingFunc = 0
  self.bDisableUserInput = true
end

function CameraLookAtNode:Execute(Callback)
  DebugPrint("------------ CameraLookAtNode ------------------")
  local Action
  local GameInstance = GWorld.GameInstance
  if self.TargetType == "Point" then
    Action = UE4.UAsyncCameraLookToTargetAction.CameraLookToNewTargetPoint(GameInstance, self.PointName, self.Duration, self.EasingFunc, self.bDisableUserInput)
  elseif self.TargetType == "Actor" then
    local GameState = UE4.UGameplayStatics.GetGameState(GameInstance)
    local StaticCreator = GameState.StaticCreatorMap:Find(self.ActorId)
    if not IsValid(StaticCreator) then
      print("----------------------------------- StaticCreator Not Found -----------------------------------")
      Callback()
      return
    end
    Action = UE4.UAsyncCameraLookToTargetAction.CameraLookToActor(GameInstance, StaticCreator, self.Duration, self.EasingFunc, self.bDisableUserInput)
  end
  if IsValid(Action) then
    self.ActionRefProxy = Ref(Action)
    self.Action = Action
  end
  if nil == Action then
    Callback()
  else
    Action.OnEnd:Add(GameInstance, function()
      Action.OnEnd:Clear()
      Callback()
    end)
  end
end

function CameraLookAtNode:Clear()
  if self.ActionRefProxy and IsValid(self.Action) then
    self.Action.OnEnd:Clear()
  end
  self.ActionRefProxy = nil
end

return CameraLookAtNode
