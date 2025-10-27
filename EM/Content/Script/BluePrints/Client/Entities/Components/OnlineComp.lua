local pb = require("pb")
local Decorator = require("BluePrints.Client.Wrapper.Decorator")
local MessageTypeToFunc = {
  EnterRegionOnline = "HandleEnterRegionOnline",
  LeaveRegionOnline = "HandleLeaveRegionOnline",
  Move = "HandleMove",
  Action = "HandleAction",
  StopAction = "HandleStopAction",
  Hide = "HandleHide",
  NicknameChange = "HandleNicknameChange",
  LevelChange = "HandleLevelChange",
  CurrentPetChange = "HandleCurrentPetChange",
  CharInfoChange = "HandleCharInfoChange",
  UseExpression = "HandleUseExpression",
  TitleChange = "HandleTitleChange",
  SwitchMeleeWeapon = "HandleSwitchMeleeWeapon",
  SwitchRangedWeapon = "HandleSwitchRangedWeapon",
  SwitchShowWeapon = "HandleSwitchShowWeapon"
}
local Component = {}

function Component:EnterWorld()
  self.IsInRegionOnline = false
  self.CurrentOnlineType = -1
  self.RegionAvatars = {}
  self:InitMoveSyncMgr()
end

function Component:RequestEnterOnline(online_type, ShowWeapon)
  self.logger.debug("RequestEnterOnline: " .. online_type)
  ShowWeapon = ShowWeapon or CommonConst.OnlineShowWeapon.Ranged
  if self.IsInRegionOnline then
    return
  end
  self:CallServerMethod("RequestEnterOnline", online_type, ShowWeapon)
end

function Component:OnRequestEnterOnline(online_type, ret, others)
  self.logger.debug("zjt_ OnRequestEnterOnline: " .. online_type .. " ret: " .. ret)
  if ret ~= ErrorCode.RET_SUCCESS then
    return
  end
  self:NotifyCharacterStartSync()
  self.IsInRegionOnline = true
  self.RegionAvatars = others
  self.CurrentOnlineType = online_type
  if not others then
    return
  end
  PrintTable({OnRequestEnterOnline_others = others}, 3)
  for i, v in pairs(others) do
    self:AddRoleToCreate(i, v)
  end
  self.InWorldChatChannel[CommonConst.ChatChannel.RegionOnline] = true
  if ChatController then
    ChatController:SendRequestEnterChatChannel(ChatCommon.ChannelDef.Region)
  end
end

function Component:RequestLeaveOnline(online_type)
  self.logger.debug("RequestLeaveOnline: " .. online_type)
  if not self.IsInRegionOnline then
    return
  end
  self:CallServerMethod("RequestLeaveOnline", online_type)
end

function Component:OnRequestLeaveOnline(online_type, ret)
  self.logger.debug("zjt_ OnRequestLeaveOnline: " .. online_type .. " ret: " .. ret)
  if ret ~= ErrorCode.RET_SUCCESS then
    return
  end
  self:NotifyCharacterEndSync()
  self.IsInRegionOnline = false
  self.RegionAvatars = {}
  self.CurrentOnlineType = -1
  self:DestoryAllOthers()
  self.InWorldChatChannel[CommonConst.ChatChannel.RegionOnline] = false
  if ChatController then
    ChatController:SendRequestLeaveChatChannel(ChatCommon.ChannelDef.Region)
  end
end

function Component:UseExpression(online_type, expression_id, need_weapon)
  DebugPrint("gmy@OnlineComp Component:UseExpression", online_type, expression_id, need_weapon)
  
  local function callback(ret)
    DebugPrint("gmy@OnlineComp Component:UseExpression callback", online_type, expression_id, need_weapon)
  end
  
  self:CallServer("UseExpression", callback, online_type, expression_id, need_weapon)
end

function Component:UploadPlayerMessage(online_type, message)
  if not CommonConst.OnlineClientMessageType[message.Type] then
    return
  end
  local real_message = {}
  real_message.Type = message.Type
  if message.Type == "Action" and not message.UsingActionNew then
    for k, v in pairs(message.IntMap) do
      message[k] = v
    end
    for k, v in pairs(message.FloatMap) do
      message[k] = v
    end
    for k, v in pairs(message.EnumMap) do
      message[k] = v
    end
    for k, v in pairs(message.VectorMap) do
      message[k] = v
    end
    for k, v in pairs(message.RotatorMap) do
      message[k] = v
    end
    message.IntMap = nil
    message.FloatMap = nil
    message.EnumMap = nil
    message.VectorMap = nil
    message.RotatorMap = nil
    real_message.Action = message
  else
    real_message[message.Type] = message
  end
  local message_str = pb.encode(".OnlineClientMessage", real_message)
  
  local function callback(ret)
  end
  
  self:CallServer("UploadPlayerOnlineClientMessage", callback, online_type, message_str)
end

function Component:RegionOnlineRequests(normal_messages, pb_messages)
  self.logger.debug("RegionOnlineRequests")
  for i, message in ipairs(normal_messages) do
    self:HandleSingleRegionOnlineRequest(message)
  end
  for i, message_str in ipairs(pb_messages) do
    local message = pb.decode(".OnlineClientMessage", message_str)
    local real_message = message[message.Type]
    if real_message then
      real_message.Sender = message.Sender
      self:HandleSingleRegionOnlineRequest(real_message)
    end
  end
end

function Component:HandleSingleRegionOnlineRequest(message)
  local MType = message.Type
  local func = MessageTypeToFunc[MType]
  if func and self[func] then
    self[func](self, message)
  end
end

function Component:HandleEnterRegionOnline(message)
  self:AddRoleToCreate(message.Sender, message)
  self.RegionAvatars[message.Sender] = {
    CharInfo = message.CharInfo,
    CurrentPet = message.CurrentPet,
    AvatarInfo = message.AvatarInfo
  }
end

function Component:HandleSwitchMeleeWeapon(message)
  PrintTable({HandleSwitchMeleeWeapon = message}, 10)
  self:HandleSwitchWeapon(message.Sender, message, "Melee")
end

function Component:HandleSwitchRangedWeapon(message)
  PrintTable({HandleSwitchRangedWeapon = message}, 10)
  self:HandleSwitchWeapon(message.Sender, message, "Ranged")
end

function Component:HandleSwitchShowWeapon(message)
  PrintTable({HandleSwitchShowWeapon = message}, 10)
  self:HandleChangeUsingWeaponType(message.Sender, message)
end

function Component:HandleLeaveRegionOnline(message)
  self:RemoveRoleInfoAndDestroy(message.Sender, message)
  self.RegionAvatars[message.Sender] = nil
end

function Component:HandleMove(message)
  local sender_info = self.RegionAvatars[message.Sender]
  if sender_info and 0 ~= sender_info.CurResourceId and 0 == message.CurResourceId then
    sender_info.CurResourceId = 0
    sender_info.WeaponInfo = nil
  end
  self:HandleMovePack(message.Sender, message)
end

function Component:HandleAction(message)
  self:HandleActionPack(message.Sender, message)
end

function Component:HandleHide(message)
  self:HandleHidePack(message.Sender, message)
end

function Component:HandleStopAction(message)
  self:ReceiveStopActionPack(message.Sender, message)
end

function Component:HandleNicknameChange(message)
  local SenderInfo = self.RegionAvatars[message.Sender]
  if SenderInfo then
    SenderInfo.AvatarInfo.Nickname = message.Nickname
    EventManager:FireEvent(EventID.OnlineRegionNickNameChange, message.Sender, SenderInfo.AvatarInfo.Uid)
  end
end

function Component:HandleLevelChange(message)
  local SenderInfo = self.RegionAvatars[message.Sender]
  if SenderInfo then
    SenderInfo.AvatarInfo.Level = message.Level
  end
end

function Component:HandleCurrentPetChange(message)
  local SenderInfo = self.RegionAvatars[message.Sender]
  if SenderInfo then
    SenderInfo.CurrentPet = message.CurrentPet
  end
end

function Component:HandleCharInfoChange(message)
  local SenderInfo = self.RegionAvatars[message.Sender]
  if SenderInfo then
    SenderInfo.CharInfo = message.CharInfo
  end
  PrintTable({HandleCharInfoChange = message}, 100)
  self:HandChangeRoleInfo(message.Sender, message)
end

function Component:HandleTitleChange(message)
  local SenderInfo = self.RegionAvatars[message.Sender]
  if SenderInfo then
    if message.TitleBefore then
      SenderInfo.AvatarInfo.TitleBefore = message.TitleBefore
    end
    if message.TitleAfter then
      SenderInfo.AvatarInfo.TitleAfter = message.TitleAfter
    end
    if message.TitleFrame then
      SenderInfo.AvatarInfo.TitleFrame = message.TitleFrame
    end
  end
  if SenderInfo then
    EventManager:FireEvent(EventID.OnlineRegionTitleChange, message.Sender, SenderInfo.AvatarInfo.Uid, SenderInfo.AvatarInfo.TitleBefore, SenderInfo.AvatarInfo.TitleAfter, SenderInfo.AvatarInfo.TitleFrame)
  end
end

function Component:HandleUseExpression(message)
  local ResourceId = message.ExpressionId
  local TempRoleInfo = self.OtherRoleInfo[message.Sender]
  DebugPrint("gmy@OnlineComp Component:HandleUseExpression", ResourceId, TempRoleInfo, message.Sender, message.WeaponInfo)
  if TempRoleInfo and ResourceId then
    local Player = Battle(self):GetEntity(TempRoleInfo.CharEid)
    if Player then
      local ResourceInfo = DataMgr.Resource[ResourceId]
      if ResourceInfo then
        local ArmoryActionId = ResourceInfo.PlayArmoryAnim
        if ArmoryActionId then
          local ActionName = Const.ArmoryActionIdToArmoryTag[ArmoryActionId]
          if ActionName == Const.Melee then
            local WeaponInfo = message.WeaponInfo and message.WeaponInfo.MeleeWeapon
            if WeaponInfo then
              local WeaponId = WeaponInfo.WeaponId
              if Player.MeleeWeapon and Player.MeleeWeapon.WeaponId ~= WeaponId then
                Player.Weapons:Remove(WeaponId)
                Player.MeleeWeapon:Destroy()
                Player.MeleeWeapon = nil
              end
              if Player.MeleeWeapon == nil then
                Player.MeleeWeapon = Player:SpawnShowWeapon(WeaponId, nil, nil, nil, WeaponInfo)
                Player:RawAddWeapon(Player.MeleeWeapon)
              end
            end
          elseif ActionName == Const.Ranged then
            local WeaponInfo = message.WeaponInfo and message.WeaponInfo.RangedWeapon
            if WeaponInfo then
              local WeaponId = WeaponInfo.WeaponId
              if Player.RangedWeapon and Player.RangedWeapon.WeaponId ~= WeaponId then
                Player.Weapons:Remove(WeaponId)
                Player.RangedWeapon:Destroy()
                Player.RangedWeapon = nil
              end
              if nil == Player.RangedWeapon then
                Player.RangedWeapon = Player:SpawnShowWeapon(WeaponId, nil, nil, nil, WeaponInfo)
                Player:RawAddWeapon(Player.RangedWeapon)
              end
            end
          end
        end
        Player:InvokeResourceBPFunction(ResourceId)
        Player.CurResourceId = ResourceId
      end
    end
  else
    DebugPrint("gmy@OnlineComp Component:HandleUseExpression", TempRoleInfo, ResourceId)
  end
end

return Component
