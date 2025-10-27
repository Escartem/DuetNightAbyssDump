local BattleUtils = require("Utils.BattleUtils")
local Component = {}

function Component:UseNewCreatePhantom(RoleId, BTIndex, IsHostage, Info, ExtraInfo, Level)
  local Context = AEventMgr.CreateUnitContext()
  Context.UnitType = "Phantom"
  Context.UnitId = RoleId
  Context.IntParams:Add("RoleId", RoleId)
  Context.IntParams:Add("BTIndex", BTIndex - 1)
  Context.IntParams:Add("PhantomOwnerEid", self.Eid)
  Context.IntParams:Add("Camp", ECampName.Player)
  Context.IntParams:Add("FixLocationZ", 0)
  Context.IntParams:Add("RegionDataType", 0)
  Context.BoolParams:Add("IsHostage", IsHostage)
  if Level then
    Context.IntParams:Add("Level", Level or 1)
  end
  if ExtraInfo.SkipInitWaitCheck then
    Context.BoolParams:Add("SkipInitWaitCheck", true)
  end
  if ExtraInfo.ForceSync then
    Context.BoolParams:Add("ForceSync", true)
  end
  Context.BoolParams:Add("FixLocation", true)
  Context:AddLuaTable("AvatarInfo", Info)
  self:CreatePhantomNew(Context, RoleId, ExtraInfo.IsSpawnByGM ~= nil, nil ~= ExtraInfo.IsSpawnByResource, nil ~= ExtraInfo.IsSpawnBySquad, ExtraInfo.TeamIndex or 1)
end

function Component:ShowPhantomSummonMax()
  self:ClientShowToast(UIConst.Tip_CommonToast, GText("UI_Tosat_PhantomSummon_Num"))
end

function Component:CreatePhantom(RoleId, BTIndex, Info, ExtraInfo, Level)
  local IsHostage = false
  local ExtraCreateInfo = BattleUtils.GetExtraCreateInfo("Phantom", RoleId, RoleId)
  if ExtraCreateInfo then
    IsHostage = ExtraCreateInfo.IsHostage
    BTIndex = BTIndex or ExtraCreateInfo.BTIndex
  end
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    Avatar:SaveCreatePhantomInfo(RoleId, BTIndex, Info, ExtraInfo, Level)
  end
  self:UseNewCreatePhantom(RoleId, BTIndex, IsHostage, Info, ExtraInfo, Level)
end

function Component:ReCreatePhantom(RoleId, BTIndex, Info, ExtraInfo, Level)
  local IsHostage = false
  local ExtraCreateInfo = BattleUtils.GetExtraCreateInfo("Phantom", RoleId, RoleId)
  if ExtraCreateInfo then
    IsHostage = ExtraCreateInfo.IsHostage
    BTIndex = BTIndex or ExtraCreateInfo.BTIndex
  end
  self:UseNewCreatePhantom(RoleId, BTIndex, IsHostage, Info, ExtraInfo, Level)
end

function Component:CreatePhantomOnLevelTransition()
  local Avatar = GWorld:GetAvatar()
  if not Avatar or not Avatar.PhantomCreateInfo then
    return
  end
  local PhantomCreateInfo = Avatar.PhantomCreateInfo
  for PhantomRoleId, CreateInfo in pairs(PhantomCreateInfo) do
    self:ReCreatePhantom(PhantomRoleId, CreateInfo.BTIndex, CreateInfo.Info, CreateInfo.ExtraInfo, CreateInfo.Level)
  end
end

return Component
