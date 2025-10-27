require("UnLua")
local M = Class("BluePrints.Item.Chest.BP_MechanismBase_C")

function M:OpenMechanism(PlayerId)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  DebugPrint("RougeLikeDelivery:OpenMechanism StoryId", GWorld.RougeLikeManager.StoryId)
  if 0 ~= GWorld.RougeLikeManager.StoryId then
    self:ShowEnterRoomStory()
  else
    Avatar:EnterRoom(self.RoomId)
  end
end

function M:ShowEnterRoomStory()
  local Avatar = GWorld:GetAvatar()
  EventManager:AddEvent(EventID.OnRougeLikeStoryEventEnd, self, function()
    DebugPrint("RougeLikeDelivery:ReceivedEvent EventID.OnRougeLikeStoryEventEnd", self.RoomId)
    EventManager:RemoveEvent(EventID.OnRougeLikeStoryEventEnd, self)
    Avatar:EnterRoom(self.RoomId)
  end)
  GWorld.RougeLikeManager:ShowRougeStoryEvent()
end

function M:AuthorityInitInfo(Info)
  M.Super.AuthorityInitInfo(self, Info)
  self.RoomId = Info.IntParams:Find("RoomId")
  self.CurrentRoomId = Info.IntParams:Find("CurrentRoomId")
  GWorld.RougeLikeManager:AddDeliveryInfo(self, self.CurrentRoomId)
end

function M:GetGuidePos()
  return self:K2_GetActorLocation() + self.GuidePos.RelativeLocation
end

return M
