local Decorator = require("BluePrints.Client.Wrapper.Decorator")
local Component = {}

function Component:InitMoveSyncMgr()
  self.OtherRoleInfo = {}
end

function Component:AddRoleToCreate(ObjId, RoleInfo)
  if not ObjId then
    self.logger.debug("EnterWorldRole is Illegal ObjectId is nil")
    return
  end
  local TempRoleInfo = self.OtherRoleInfo[ObjId]
  if TempRoleInfo then
    self.logger.debug("There alreay has same avatar in this region ", ObjId)
    return
  end
  self.OtherRoleInfo[ObjId] = {}
  local CharInfo = RoleInfo.CharInfo
  TempRoleInfo = self.OtherRoleInfo[ObjId]
  TempRoleInfo.ObjectId = ObjId
  TempRoleInfo.CharId = CharInfo.CharId
  TempRoleInfo.BornState = Const.UnBorn
  TempRoleInfo.Uid = RoleInfo.AvatarInfo.Uid
  TempRoleInfo.AppearanceSuit = {}
  local SuitTalble = TempRoleInfo.AppearanceSuit
  SuitTalble.IsCornerVisible = CharInfo.IsCornerVisible
  SuitTalble.IsShowPartMesh = CharInfo.IsShowPartMesh
  SuitTalble.AccessorySuit = CharInfo.AccessorySuit
  SuitTalble.Colors = CharInfo.Colors
  SuitTalble.SkinId = CharInfo.SkinId
  TempRoleInfo.RegionWeaponInfo = RoleInfo.WeaponInfo
  TempRoleInfo.ShowWeapon = RoleInfo.ShowWeapon
  print(_G.LogTag, " TempRoleInfo.AppearanceSuit", TempRoleInfo.AppearanceSuit)
  PrintTable({AddRoleToCreate_RoleInfo = RoleInfo, AvatarId = ObjId}, 100)
end

function Component:RemoveRoleInfoAndDestroy(ObjId, RoleInfo)
  if not ObjId then
    self.logger.debug("LeaveWorldRole is Illegal ObjectId is nil")
    return
  end
  local TempRoleInfo = self.OtherRoleInfo[ObjId]
  if not TempRoleInfo then
    self.logger.debug("There is no avatar in this region ", ObjId)
    return
  end
  if TempRoleInfo.CharEid then
    local MainPlayer = UE4.UGameplayStatics.GetPlayerCharacter(GWorld.GameInstance, 0)
    if MainPlayer then
      MainPlayer:RemovePlayerToInteract(TempRoleInfo.CharEid)
    end
  end
  if TempRoleInfo.BornState == Const.UnBorn then
    self.OtherRoleInfo[ObjId] = nil
    return
  end
  TempRoleInfo.BornState = Const.ShouldDetory
  if TempRoleInfo.BornState == Const.Borning then
    return
  end
  if not TempRoleInfo.CharEid then
    return
  end
  local Player = Battle(self):GetEntity(TempRoleInfo.CharEid)
  EventManager:FireEvent(EventID.OnlineRemoveOtherPlayer, TempRoleInfo.Uid)
  if Player then
    Player:K2_DestroyActor()
  end
  if GWorld.GameInstance and GWorld.GameInstance.bRegionClientOnlyShowUI then
    GWorld.GameInstance:RemovePlayerHeadUI(TempRoleInfo.CharEid)
  end
  self.OtherRoleInfo[ObjId] = nil
  EventManager:FireEvent(EventID.RemoveRegionIndicatorInfo, TempRoleInfo.Uid)
end

function Component:DestoryAllOthers()
  for k, v in pairs(self.OtherRoleInfo) do
    self:RemoveRoleInfoAndDestroy(v.ObjectId, v)
  end
end

function Component:NotifyCharacterStartSync()
  local GameInstance = GWorld.GameInstance
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(GameInstance, 0)
  Player:EnableRegionSync(true)
  local OldState = self.IsInRegionOnline
  EventManager:FireEvent(EventID.OnlineRegionChange, OldState, true)
end

function Component:NotifyCharacterEndSync(...)
  local GameInstance = GWorld.GameInstance
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(GameInstance, 0)
  Player:EnableRegionSync(false)
  local OldState = self.IsInRegionOnline
  EventManager:FireEvent(EventID.OnlineRegionChange, OldState, false)
end

function Component:SendSyncInfo(SyncInfo)
  self:UploadPlayerMessage(self.CurrentOnlineType, SyncInfo)
end

function Component:HandChangeRoleInfo(ObjId, RoleInfo)
  if not ObjId then
    self.logger.debug("HandChangeRoleInfo is Illegal ObjectId is nil")
    return
  end
  local TempRoleInfo = self.OtherRoleInfo[ObjId]
  if not TempRoleInfo then
    self.logger.debug("There is no avatar in this region ", ObjId)
    return
  end
  if not TempRoleInfo.BornState then
    self.logger.error("Role Havent create yet ", ObjId)
    return
  end
  if TempRoleInfo.BornState < Const.Borning then
    return
  end
  if TempRoleInfo.BornState < Const.Bonred then
    return
  end
  if not TempRoleInfo.CharEid then
    self.logger.error("Role Havent create yet ", ObjId)
    return
  end
  local Player = Battle(self):GetEntity(TempRoleInfo.CharEid)
  if not Player then
    self.logger.error("Role Doesn't exist In This World ", ObjId)
    return
  end
  if not Player.InitCharacterInfo then
    self.logger.error("It's not a character ", ObjId)
    return
  end
  local CharInfo = RoleInfo.CharInfo
  TempRoleInfo.CharId = CharInfo.CharId
  TempRoleInfo.AppearanceSuit = {}
  local SuitTalble = TempRoleInfo.AppearanceSuit
  SuitTalble.IsCornerVisible = CharInfo.IsCornerVisible
  SuitTalble.IsShowPartMesh = CharInfo.IsShowPartMesh
  SuitTalble.AccessorySuit = CharInfo.AccessorySuit
  SuitTalble.Colors = CharInfo.Colors
  SuitTalble.SkinId = CharInfo.SkinId
  local Info = {}
  Info.RoleId = TempRoleInfo.CharId
  Info.SkinId = TempRoleInfo.SkinId
  Info.FromOtherWorld = true
  Info.AppearanceSuit = TempRoleInfo.AppearanceSuit
  print(_G.LogTag, " HandChangeRoleInfo", TempRoleInfo.AppearanceSuit)
  Player:InitCharacterInfoForRegionPlayer(Info)
  Player:ChangeUsingWeaponByType("Melee")
end

function Component:HandleSwitchWeapon(ObjId, Message, Type)
  if not ObjId then
    self.logger.debug("HandleChangeUsingWeaponType is Illegal ObjectId is nil")
    return
  end
  local TempRoleInfo = self.OtherRoleInfo[ObjId]
  if not TempRoleInfo then
    self.logger.debug("There is no avatar in this region ", ObjId)
    return
  end
  if not TempRoleInfo.BornState then
    self.logger.error("Role Havent create yet ", ObjId)
    return
  end
  if TempRoleInfo.BornState < Const.Borning then
    return
  end
  if TempRoleInfo.BornState < Const.Bonred then
    return
  end
  if not TempRoleInfo.CharEid then
    self.logger.error("Role Havent create yet ", ObjId)
    return
  end
  local Player = Battle(self):GetEntity(TempRoleInfo.CharEid)
  if not Player then
    self.logger.error("Role Doesn't exist In This World ", ObjId)
    return
  end
  if not Player.ServerSetUpWeapons then
    self.logger.error("It's not a character ", ObjId)
    return
  end
  if Player[Type .. "Weapon"] then
    Player:RemoveWeaponWithId(Player[Type .. "Weapon"].WeaponId)
  end
  local TempWeaponInfo = {}
  Player:FormatWeaponInfo(TempWeaponInfo, Message.WeaponInfo)
  print(_G.LogTag, " HandleChangeUsingWeaponType", "ServerSetUp" .. Type .. "Weapon", Player["ServerSetUp" .. Type .. "Weapon"])
  Player["ServerSetUp" .. Type .. "Weapon"](Player, TempWeaponInfo)
  Player:ChangeUsingWeaponByType("Melee")
end

function Component:HandleChangeUsingWeaponType(ObjId, RoleInfo)
  if not ObjId then
    self.logger.debug("HandleChangeUsingWeaponType is Illegal ObjectId is nil")
    return
  end
  local TempRoleInfo = self.OtherRoleInfo[ObjId]
  if not TempRoleInfo then
    self.logger.debug("There is no avatar in this region ", ObjId)
    return
  end
  if not TempRoleInfo.BornState then
    self.logger.error("Role Havent create yet ", ObjId)
    return
  end
  if TempRoleInfo.BornState < Const.Borning then
    return
  end
  if TempRoleInfo.BornState < Const.Bonred then
    return
  end
  if not TempRoleInfo.CharEid then
    self.logger.error("Role Havent create yet ", ObjId)
    return
  end
  local Player = Battle(self):GetEntity(TempRoleInfo.CharEid)
  if not Player then
    self.logger.error("Role Doesn't exist In This World ", ObjId)
    return
  end
  if not Player.ChangeUsingWeaponByType then
    self.logger.error("It's not a character ", ObjId)
    return
  end
  if RoleInfo.ShowWeapon and Player[RoleInfo.ShowWeapon .. "Weapon"] then
    Player:ChangeUsingWeaponByType(RoleInfo.ShowWeapon)
  end
end

function Component:HandleMovePack(ObjId, MoveInfo)
  if not ObjId then
    self.logger.debug("MovePack is Illegal ObjectId is nil")
    return
  end
  local TempRoleInfo = self.OtherRoleInfo[ObjId]
  if not TempRoleInfo then
    self.logger.debug("There is no avatar in this region ", ObjId)
    return
  end
  if not TempRoleInfo.BornState then
    self.logger.error("Role Havent create yet ", ObjId)
    return
  end
  if TempRoleInfo.BornState == Const.ShouldDetory then
    return
  end
  if TempRoleInfo.BornState < Const.Borning then
    self:SpawnOtherRole(ObjId, MoveInfo)
    return
  end
  if TempRoleInfo.BornState < Const.Bonred then
    return
  end
  local sender_info = self.RegionAvatars[ObjId]
  local Player = Battle(self):GetEntity(TempRoleInfo.CharEid)
  local GameInstance = GWorld.GameInstance
  local MainPlayer = UE4.UGameplayStatics.GetPlayerCharacter(GameInstance, 0)
  if Player then
    Player:PackSyncInfo(MoveInfo, MainPlayer)
    if Player.CurResourceId == MoveInfo.ExpressionId then
      return
    end
    if MoveInfo.ExpressionId then
      Player.CurResourceId = MoveInfo.ExpressionId
    end
    if MoveInfo.ExpressionId then
      MoveInfo.WeaponInfo = sender_info.WeaponInfo
      self:HandleUseExpression(MoveInfo)
      MoveInfo.WeaponInfo = nil
    end
  elseif GameInstance and GameInstance.bRegionClientOnlyShowUI then
    GameInstance:SyncPlayerHeadUI(TempRoleInfo.CharEid, FVector(MoveInfo.Location.X, MoveInfo.Location.Y, MoveInfo.Location.Z))
  end
end

function Component:HandleActionPack(ObjId, MoveInfo)
  if not ObjId then
    self.logger.debug("MovePack is Illegal ObjectId is nil")
    return
  end
  local TempRoleInfo = self.OtherRoleInfo[ObjId]
  if not TempRoleInfo then
    self.logger.debug("There is no avatar in this region ", ObjId)
    return
  end
  if not TempRoleInfo.BornState then
    self.logger.error("Role Havent create yet ", ObjId)
    return
  end
  if TempRoleInfo.BornState == Const.ShouldDetory then
    return
  end
  if TempRoleInfo.BornState < Const.Borning then
    return
  end
  if TempRoleInfo.BornState < Const.Bonred then
    return
  end
  local Player = Battle(self):GetEntity(TempRoleInfo.CharEid)
  if Player then
    Player:ReceivePrepareInfo_Lua(MoveInfo)
  end
end

function Component:HandleHidePack(ObjId, MoveInfo)
  if not ObjId then
    self.logger.debug("MovePack is Illegal ObjectId is nil")
    return
  end
  local TempRoleInfo = self.OtherRoleInfo[ObjId]
  if not TempRoleInfo then
    self.logger.debug("There is no avatar in this region ", ObjId)
    return
  end
  if not TempRoleInfo.BornState then
    self.logger.error("Role Havent create yet ", ObjId)
    return
  end
  if TempRoleInfo.BornState == Const.ShouldDetory then
    return
  end
  if TempRoleInfo.BornState < Const.Borning then
    return
  end
  if TempRoleInfo.BornState < Const.Bonred then
    return
  end
  local Player = Battle(self):GetEntity(TempRoleInfo.CharEid)
  if Player then
    Player:ReceiveHideInfo_Lua(MoveInfo)
  end
end

function Component:ReceiveStopActionPack(ObjId, SyncInfo)
  if not ObjId then
    self.logger.debug("MovePack is Illegal ObjectId is nil")
    return
  end
  local TempRoleInfo = self.OtherRoleInfo[ObjId]
  if not TempRoleInfo then
    self.logger.debug("There is no avatar in this region ", ObjId)
    return
  end
  if not TempRoleInfo.BornState then
    self.logger.error("Role Havent create yet ", ObjId)
    return
  end
  if TempRoleInfo.BornState == Const.ShouldDetory then
    return
  end
  if TempRoleInfo.BornState < Const.Borning then
    return
  end
  if TempRoleInfo.BornState < Const.Bonred then
    return
  end
  local Player = Battle(self):GetEntity(TempRoleInfo.CharEid)
  if Player then
    Player:ReceiveStopActionInfo_Lua(SyncInfo)
  end
end

function Component:SpawnOtherRole(ObjId, MoveInfo)
  local TempRoleInfo = self.OtherRoleInfo[ObjId]
  local GameInstance = GWorld.GameInstance
  print(_G.LogTag, " SpawnOtherRole", GameInstance.OtherRoleCanCreatePerTick)
  if GameInstance.OtherRoleCanCreatePerTick and GameInstance.OtherRoleCanCreatePerTick <= 0 then
    return
  end
  TempRoleInfo.BornState = Const.Borning
  GameInstance:SpawnOtherRole(ObjId, TempRoleInfo, MoveInfo)
  if GameInstance.OtherRoleCanCreatePerTick then
    GameInstance.OtherRoleCanCreatePerTick = GameInstance.OtherRoleCanCreatePerTick - 1
  end
end

return Component
