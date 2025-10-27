local Component = {}

function Component:RegisterMemberBattleInfo(Avatars)
  self.logger.info("RegisterMemberBattleInfo")
  local GameMode = GWorld.GameInstance:GetCurrentGameMode()
  for AvatarEid, BattleInfo in pairs(Avatars) do
    GameMode.AvatarInfos[AvatarEid] = BattleInfo
  end
  self:CallServerMethod("OnRegisterMemberBattleInfo")
end

function Component:UpdateNetDriverInfo(ip, port)
  self.logger.info("UpdateNetDriverInfo", ip, port)
  self:CallServerMethod("UpdateNetDriverInfo", ip, port)
end

function Component:UnregisterLS()
  self.logger.info("UnregisterLS")
  self:CallServerMethod("UnregisterLS")
end

function Component:LSBattleFinish(IsWin, bInterrupt)
  self.logger.info("LSBattleFinish", IsWin, bInterrupt)
  local GameMode = GWorld.GameInstance:GetCurrentGameMode()
  local DamageMap = {}
  for i = 0, GameMode:GetPlayerNum() - 1 do
    local PlayerController = UE4.UGameplayStatics.GetPlayerController(GameMode, i)
    local Player = PlayerController:GetMyPawn()
    local TotalDamage = Player:GetFinalDamage()
    DamageMap[CommonUtils.Str2ObjId(PlayerController.AvatarEidStr)] = TotalDamage
  end
  self:CallServerMethod("LSBattleFinish", IsWin, DamageMap)
end

function Component:ConnectLS(Ip, Port)
  self.logger.info("Connect Listen Server")
  GWorld.GameInstance:ConnectListenServer_Lua(Ip, Port, self.Account, CommonUtils.ObjId2Str(self.Eid))
end

function Component:TestConnectLS()
  self:CallServerMethod("RequireEnterLS", 1)
end

return Component
