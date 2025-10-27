require("UnLua")
require("Const")
local TicketComponent = {}

function TicketComponent:IsTicketDungeon()
  local DungeonInfo = DataMgr.Dungeon[self.DungeonId]
  print(_G.LogTag, "LXZ IsTicketDungeon")
  if DungeonInfo then
    print(_G.LogTag, "LXZ IsTicketDungeon111")
    return DungeonInfo.TicketId ~= nil
  end
  return nil
end

function TicketComponent:TriggerShowTicket()
  if IsStandAlone(self) then
    self:AddDungeonEvent("SelectTicket")
  else
    local TicketSelectTime = DataMgr.GlobalConstant.TicketSelectTime.ConstantValue or 30
    self:BpAddTimer("SelectTicket", TicketSelectTime, true, Const.GameModeEventServerClient)
    self:InitNextTicketPlayerMap()
  end
end

function TicketComponent:InitNextTicketPlayerMap()
  self.EMGameState.NextTicketPlayer:Clear()
  for _, Player in pairs(self:GetAllPlayer()) do
    local Eid = Player.Eid
    self.EMGameState.NextTicketPlayer:Add(Eid, false)
    print(_G.LogTag, "LXZ InitTicketPlayerMap, AvatarEidStr", Eid)
  end
  UE.UMapSyncHelper.SyncMap(self.EMGameState, "NextTicketPlayer")
end

return TicketComponent
