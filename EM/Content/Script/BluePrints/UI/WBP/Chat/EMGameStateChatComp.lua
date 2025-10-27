local Component = {}

function Component:MulticastChatMessage_Lua(Messages)
  local MyPlayer = GWorld:GetMainPlayer()
  for _, DsMessage in pairs(Messages) do
    if DsMessage.Eid == MyPlayer.Eid then
      ChatController:RecvChatToTeam(DsMessage.Content)
    else
      local OtherDs = self:GetPlayerState(DsMessage.Eid)
      local Message = {
        Uid = DsMessage.Eid,
        Content = DsMessage.Content,
        Time = DsMessage.TimeStamp,
        Sender = {
          Nickname = OtherDs.PlayerName,
          Level = OtherDs.PlayerLevel,
          HeadIconId = OtherDs.HeadIconId,
          HeadFrameId = OtherDs.HeadFrameId,
          IsOnline = true,
          IsInDungeon = true
        },
        Type = CommonConst.MESSAGE_TYPE_TEAM,
        ChannelType = ChatCommon.ChannelDef.InTeam
      }
      ChatController:HandleChatMessage(Message)
    end
  end
end

return Component
