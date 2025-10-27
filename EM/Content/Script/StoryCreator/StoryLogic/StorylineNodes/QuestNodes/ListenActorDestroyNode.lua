local EActorEventType = require("StoryCreator.StoryLogic.StorylineUtils").EActorEventType
local ListenActorDestroyNode = Class("StoryCreator.StoryLogic.StorylineNodes.BaseAsynQuestNode")

function ListenActorDestroyNode:Init()
  self.StaticCreatorId = 0
  self.DestroyReason = "Default"
end

function ListenActorDestroyNode:Execute(Callback)
  self.Callback = Callback
  DebugPrint("ListenActorDestroyNode: \228\188\160\229\133\165\231\154\132\233\157\153\230\128\129\231\130\185Id: ", self.StaticCreatorId, " \233\148\128\230\175\129\229\142\159\229\155\160: ", self.DestroyReason)
  GWorld.StoryMgr:BindStaticCreatorActorEvent(self.StaticCreatorId, EActorEventType.OnActorDestroyed, self, self.OnSTLActorDestroyed)
end

function ListenActorDestroyNode:OnSTLActorDestroyed(Info)
  local Actor = Info.Actor
  local DestroyReason = Info.DestroyReason
  DebugPrint("ListenActorDestroyNode: \232\167\166\229\143\145\229\155\158\232\176\131\239\188\140\233\157\153\230\128\129\231\130\185Id:", self.StaticCreatorId, "==", Actor.CreatorId, ", \228\188\160\229\133\165\231\154\132\233\148\128\230\175\129\229\142\159\229\155\160\239\188\154", EDestroyReason:GetNameByValue(DestroyReason))
  if self.DestroyReason == "Default" or self.DestroyReason == "" then
    self.Callback()
  end
  if EDestroyReason:GetNameByValue(DestroyReason) == self.DestroyReason then
    self.Callback()
  end
end

function ListenActorDestroyNode:Clear()
  self.Callback = nil
  GWorld.StoryMgr:UnbindStaticCreatorActorEventByType(self.StaticCreatorId, EActorEventType.OnActorDestroyed)
end

return ListenActorDestroyNode
