local Class = _G.TypeClass
local BaseTypes = require("BluePrints.Client.CustomTypes.BaseTypes")
local CustomTypes = require("BluePrints.Client.CustomTypes.CustomTypes")
local prop = require("NetworkEngine.Common.Prop")
local FormatProperties = require("NetworkEngine.Common.Assemble").FormatProperties
local AbyssTeam = Class("AbyssTeam", CustomTypes.CustomAttr)
AbyssTeam.__Props__ = {
  Char = prop.prop("ObjId", "client save"),
  MeleeWeapon = prop.prop("ObjId", "client save"),
  RangedWeapon = prop.prop("ObjId", "client save"),
  Phantom1 = prop.prop("ObjId", "client save"),
  PhantomWeapon1 = prop.prop("ObjId", "client save"),
  Phantom2 = prop.prop("ObjId", "client save"),
  PhantomWeapon2 = prop.prop("ObjId", "client save"),
  Pet = prop.prop("Int", "client save"),
  UnitIdList = prop.prop("Str2IntDict", "client save")
}

function AbyssTeam:Init()
  self:ClearTeam()
end

function AbyssTeam:UpdateTeam(Char, MeleeWeapon, RangedWeapon, Phantom1, PhantomWeapon1, Phantom2, PhantomWeapon2, Pet)
  self.Char = Char
  self.MeleeWeapon = MeleeWeapon
  self.RangedWeapon = RangedWeapon
  self.Phantom1 = Phantom1
  self.PhantomWeapon1 = PhantomWeapon1
  self.Phantom2 = Phantom2
  self.PhantomWeapon2 = PhantomWeapon2
  self.Pet = Pet
end

function AbyssTeam:UpdateUnitIdList(CharId, MeleeWeaponId, RangedWeaponId, PhantomId1, PhantomWeaponId1, PhantomId2, PhantomWeaponId2, PetId)
  self.UnitIdList.CharId = CharId
  self.UnitIdList.MeleeWeaponId = MeleeWeaponId
  self.UnitIdList.RangedWeaponId = RangedWeaponId
  self.UnitIdList.PhantomId1 = PhantomId1
  self.UnitIdList.PhantomWeaponId1 = PhantomWeaponId1
  self.UnitIdList.PhantomId2 = PhantomId2
  self.UnitIdList.PhantomWeaponId2 = PhantomWeaponId2
  self.UnitIdList.PetId = PetId
end

function AbyssTeam:ClearTeam()
  self.Char = CommonConst.AbyssTeamNoChar
  self.MeleeWeapon = CommonConst.AbyssTeamNoChar
  self.RangedWeapon = CommonConst.AbyssTeamNoChar
  self.Phantom1 = CommonConst.AbyssTeamNoChar
  self.PhantomWeapon1 = CommonConst.AbyssTeamNoChar
  self.Phantom2 = CommonConst.AbyssTeamNoChar
  self.PhantomWeapon2 = CommonConst.AbyssTeamNoChar
  self.Pet = CommonConst.AbyssTeamNoPet
  self.UnitIdList.CharId = CommonConst.AbyssTeamNoPet
  self.UnitIdList.MeleeWeaponId = CommonConst.AbyssTeamNoPet
  self.UnitIdList.RangedWeaponId = CommonConst.AbyssTeamNoPet
  self.UnitIdList.PhantomId1 = CommonConst.AbyssTeamNoPet
  self.UnitIdList.PhantomWeaponId1 = CommonConst.AbyssTeamNoPet
  self.UnitIdList.PhantomId2 = CommonConst.AbyssTeamNoPet
  self.UnitIdList.PhantomWeaponId2 = CommonConst.AbyssTeamNoPet
  self.UnitIdList.PetId = CommonConst.AbyssTeamNoPet
end

FormatProperties(AbyssTeam)
local AbyssTeamList = Class("AbyssTeamList", CustomTypes.CustomList)
AbyssTeamList.ValueType = AbyssTeam

function AbyssTeamList:NewAbyssTeam()
  local _AbyssTeam = AbyssTeam()
  return _AbyssTeam
end

local AbyssLevel = Class("AbyssLevel", CustomTypes.CustomAttr)
AbyssLevel.__Props__ = {
  AbyssLevelId = prop.prop("Int", "client save"),
  AbyssLockedTeamList = prop.prop("AbyssTeamList", "client save"),
  AbyssCacheTeamList = prop.prop("AbyssTeamList", "client save"),
  IsTeamLocked = prop.prop("Bool", "client save", false),
  MaxAbyssLevelProgress = prop.prop("Int", "client save", 0),
  MaxLockedTeamProgress = prop.prop("IntList", "client save", {0, 0}),
  AbyssLevelProgress = prop.prop("IntList", "client save", {0, 0}),
  PassTime = prop.prop("IntList", "save", {-1, -1}),
  FastestPassTime = prop.prop("Int", "save", -1),
  AbyssDungeonEnterCount = prop.prop("IntList", "save", {0, 0}),
  PlayerInfo1 = prop.prop("Str", "save"),
  PlayerInfo2 = prop.prop("Str", "save"),
  AbyssType = prop.getter("Data", "AbyssType"),
  NextLevelId = prop.getter("Data", "NextLevelId"),
  InitLevel = prop.getter("Data", "InitLevel"),
  AbyssDungeon1 = prop.getter("Data", "AbyssDungeon1"),
  AbyssDungeon2 = prop.getter("Data", "AbyssDungeon2"),
  DungeonReward1 = prop.getter("Data", "DungeonReward1"),
  DungeonReward2 = prop.getter("Data", "DungeonReward2")
}

function AbyssLevel:Data()
  return DataMgr.AbyssLevel[self.AbyssLevelId]
end

function AbyssLevel:Init(LevelId)
  if not LevelId then
    return
  end
  self.AbyssLevelId = LevelId
  self.IsTeamLocked = false
  self:InitAbyssTeamList()
  self:ClearAbyssLevelProgress()
end

function AbyssLevel:InitAbyssTeamList()
  if self.AbyssDungeon1 then
    local NewAbyssTeamA1 = self.AbyssLockedTeamList:NewAbyssTeam()
    self.AbyssLockedTeamList:Append(NewAbyssTeamA1)
    local NewAbyssTeamA2 = self.AbyssLockedTeamList:NewAbyssTeam()
    self.AbyssCacheTeamList:Append(NewAbyssTeamA2)
  end
  if self.AbyssDungeon2 then
    local NewAbyssTeamB1 = self.AbyssLockedTeamList:NewAbyssTeam()
    self.AbyssLockedTeamList:Append(NewAbyssTeamB1)
    local NewAbyssTeamB2 = self.AbyssLockedTeamList:NewAbyssTeam()
    self.AbyssCacheTeamList:Append(NewAbyssTeamB2)
  end
end

function AbyssLevel:IsAbyssLevelPass()
  return self.MaxAbyssLevelProgress == self:GetAbyssLevelRoomCount()
end

function AbyssLevel:ClearAbyssLevelProgress()
  self.AbyssLevelProgress = {0, 0}
  self.MaxLockedTeamProgress = {0, 0}
  self.PassTime = {-1, -1}
end

function AbyssLevel:UpdateAbyssLevelProgress(AbyssRoomA, AbyssRoomB)
  if AbyssRoomA then
    self.AbyssLevelProgress[1] = math.min(AbyssRoomA, self:GetAbyssDungeon1RoomCount())
    self.MaxLockedTeamProgress[1] = math.min(math.max(AbyssRoomA, self.MaxLockedTeamProgress[1]), self:GetAbyssDungeon1RoomCount())
  end
  if AbyssRoomB then
    self.AbyssLevelProgress[2] = math.min(AbyssRoomB, self:GetAbyssDungeon2RoomCount())
    self.MaxLockedTeamProgress[2] = math.min(math.max(AbyssRoomB, self.MaxLockedTeamProgress[2]), self:GetAbyssDungeon2RoomCount())
  end
  self:UpdateMaxAbyssLevelProgress()
end

function AbyssLevel:UpdateMaxAbyssLevelProgress()
  self.MaxAbyssLevelProgress = math.min(self:GetAbyssLevelRoomCount(), math.max(self.MaxAbyssLevelProgress, self.MaxLockedTeamProgress[1] + self.MaxLockedTeamProgress[2]))
end

function AbyssLevel:UpdatePassTime(PassTime, DungeonIndex)
  if not PassTime or PassTime <= 0 then
    return
  end
  if -1 == self.PassTime[DungeonIndex] then
    self.PassTime[DungeonIndex] = PassTime
  else
    self.PassTime[DungeonIndex] = math.min(self.PassTime[DungeonIndex], PassTime)
  end
end

function AbyssLevel:UpdateFastestPassTime(IsLoop)
  local AllPassTime = self.PassTime[1]
  if not IsLoop then
    AllPassTime = AllPassTime + self.PassTime[2]
  end
  if -1 == self.FastestPassTime then
    self.FastestPassTime = AllPassTime
  else
    self.FastestPassTime = math.min(self.FastestPassTime, AllPassTime)
  end
end

function AbyssLevel:AddAbyssDungeonEnterCount(DungeonIndex)
  if self.AbyssDungeonEnterCount[DungeonIndex] ~= nil then
    self.AbyssDungeonEnterCount[DungeonIndex] = self.AbyssDungeonEnterCount[DungeonIndex] + 1
  end
end

function AbyssLevel:GetAbyssLevelRoomCount()
  return self:GetAbyssDungeon1RoomCount() + self:GetAbyssDungeon2RoomCount()
end

function AbyssLevel:GetAbyssDungeon1RoomCount()
  if self.AbyssDungeon1 and DataMgr.AbyssDungeon[self.AbyssDungeon1] then
    local AbyssDungeonInfo = DataMgr.AbyssDungeon[self.AbyssDungeon1]
    return #AbyssDungeonInfo.RoomId
  end
  return 0
end

function AbyssLevel:GetAbyssDungeon2RoomCount()
  if self.AbyssDungeon2 and DataMgr.AbyssDungeon[self.AbyssDungeon2] then
    local AbyssDungeonInfo = DataMgr.AbyssDungeon[self.AbyssDungeon2]
    return #AbyssDungeonInfo.RoomId
  end
  return 0
end

function AbyssLevel:SavePlayerInfo1(Info)
  self.PlayerInfo1 = SerializeUtils:Serialize(Info)
end

function AbyssLevel:GetPlayerInfo1()
  return SerializeUtils:UnSerialize(self.PlayerInfo1)
end

function AbyssLevel:SavePlayerInfo2(Info)
  self.PlayerInfo2 = SerializeUtils:Serialize(Info)
end

function AbyssLevel:GetPlayerInfo2()
  return SerializeUtils:UnSerialize(self.PlayerInfo2)
end

FormatProperties(AbyssLevel)
local AbyssLevelList = Class("AbyssLevelList", CustomTypes.CustomList)
AbyssLevelList.ValueType = AbyssLevel

function AbyssLevelList:NewAbyssLevel(LevelId)
  local _AbyssLevel = AbyssLevel(LevelId)
  return _AbyssLevel
end

local Abyss = Class("Abyss", CustomTypes.CustomAttr)
Abyss.__Props__ = {
  AbyssId = prop.prop("Int", "client save"),
  AbyssLevelList = prop.prop("AbyssLevelList", "client save"),
  LockState = prop.prop("Bool", "client save", false),
  MaxAbyssProgress = prop.prop("IntList", "client save", {1, 0}),
  RewardGotList = prop.prop("Int2IntListDict", "client save"),
  AbyssProgress = prop.prop("IntList", "client save", {
    1,
    0,
    0
  }),
  AlreadyJumpLevelTimes = prop.prop("Int", "client save", 0),
  FastestTeamList = prop.prop("AbyssTeamList", "client save"),
  AbyssSeasonId = prop.getter("Data", "AbyssSeasonId"),
  DifficultyLock = prop.getter("Data", "DifficultyLock"),
  AbyssType = prop.getter("Data", "AbyssType"),
  AbyssLevelId = prop.getter("Data", "AbyssLevelId"),
  AbyssRewardList = prop.getter("Data", "AbyssRewardList")
}

function Abyss:Data()
  return DataMgr.AbyssSeason[self.AbyssId]
end

function Abyss:Init(AbyssId)
  if not AbyssId then
    return
  end
  if not DataMgr.AbyssSeason[AbyssId] then
    return
  end
  self.AbyssId = AbyssId
  self:InitAbyssLevelList()
  self:SetLockState()
  self:InitRewardGotList()
end

function Abyss:SetLockState()
  if self.DifficultyLock then
    self.LockState = true
  else
    self.LockState = false
  end
end

function Abyss:InitRewardGotList()
  local RoomCount = 0
  for key, value in ipairs(self.AbyssLevelList) do
    RoomCount = RoomCount + value:GetAbyssLevelRoomCount()
  end
  if not self.AbyssRewardList then
    return
  end
  for _, Id in ipairs(self.AbyssRewardList) do
    local Info = DataMgr.AbyssRewardList[Id]
    if Info and not Info.RewardAddOn and Info.Level and RoomCount >= Info.Level then
      self.RewardGotList[Info.Level] = {
        Info.Reward,
        0
      }
    end
  end
end

function Abyss:CheckRewardIsGot(RoomCount)
  if self.RewardGotList[RoomCount] then
    return 1 == self.RewardGotList[RoomCount][2]
  end
  return false
end

function Abyss:CheckRewardCanGet(RoomCount)
  if not self.RewardGotList[RoomCount] then
    return false
  end
  local AllRoomCount = self:GetAllPassRoomCount()
  if RoomCount > AllRoomCount then
    return false
  end
  if 0 == self.RewardGotList[RoomCount][2] then
    return true
  end
  return false
end

function Abyss:GetReward(RoomCount)
  if self.RewardGotList[RoomCount] then
    self.RewardGotList[RoomCount][2] = 1
  end
end

function Abyss:GetAbyssRewardIdByStar(RoomCount)
  if self.RewardGotList[RoomCount] then
    return self.RewardGotList[RoomCount][1]
  end
  return 0
end

function Abyss:CheckHaveRewardToGet()
  local AllRoomCount = self:GetAllPassRoomCount()
  for key, value in pairs(self.RewardGotList) do
    if key <= AllRoomCount and 0 == value[2] then
      return true
    end
  end
  return false
end

function Abyss:UnLock()
  self.LockState = false
end

function Abyss:IsLocked()
  return self.LockState
end

function Abyss:InitAbyssLevelList()
  for index, AbyssLevelId in ipairs(self.AbyssLevelId) do
    local AbyssLevel = self.AbyssLevelList:NewAbyssLevel(AbyssLevelId)
    self.AbyssLevelList:Append(AbyssLevel)
  end
end

function Abyss:AddAbyssLevel(LevelId)
  local AbyssLevel = self.AbyssLevelList:NewAbyssLevel(LevelId)
  self.AbyssLevelList:Append(AbyssLevel)
end

function Abyss:GetAbyssLevelCount()
  return self.AbyssLevelList:Length()
end

function Abyss:IsLoopAbyss()
  if self.AbyssType and 3 == self.AbyssType then
    return true
  end
  return false
end

function Abyss:IsAbyssPass()
  if self.AbyssType and 3 == self.AbyssType then
    return false
  end
  local AbyssLevelCount = self:GetAbyssLevelCount()
  if AbyssLevelCount > self.MaxAbyssProgress[1] then
    return false
  else
    return self.MaxAbyssProgress[2] == self.AbyssLevelList[AbyssLevelCount]:GetAbyssLevelRoomCount()
  end
end

function Abyss:ClearAbyssProgress()
  self.AbyssProgress = {
    1,
    0,
    0
  }
end

function Abyss:UpdateAbyssProgress(AbyssLevel, AbyssRoomA, AbyssRoomB)
  if AbyssLevel then
    self.AbyssProgress[1] = AbyssLevel
  end
  if AbyssRoomA then
    self.AbyssProgress[2] = AbyssRoomA
  end
  if AbyssRoomB then
    self.AbyssProgress[3] = AbyssRoomB
  end
  self:UpdateMaxAbyssProgress()
end

function Abyss:UpdateMaxAbyssProgress()
  if self.MaxAbyssProgress[1] < self.AbyssProgress[1] then
    self.MaxAbyssProgress[1] = self.AbyssProgress[1]
    self.MaxAbyssProgress[2] = self.AbyssProgress[2] + self.AbyssProgress[3]
  elseif self.MaxAbyssProgress[1] == self.AbyssProgress[1] then
    self.MaxAbyssProgress[2] = math.max(self.MaxAbyssProgress[2], self.AbyssProgress[2] + self.AbyssProgress[3])
  end
end

function Abyss:UpdateFastestTeamList(TeamList)
  self.FastestTeamList = TeamList
end

function Abyss:GetAllPassRoomCount()
  local AllPassRoomCount = 0
  for LevelIndex = 1, self.MaxAbyssProgress[1] - 1 do
    local AbyssLevel = self.AbyssLevelList[LevelIndex]
    if AbyssLevel then
      AllPassRoomCount = AllPassRoomCount + AbyssLevel.MaxAbyssLevelProgress
    end
  end
  return AllPassRoomCount + self.MaxAbyssProgress[2]
end

FormatProperties(Abyss)
local AbyssDict = Class("AbyssDict", CustomTypes.CustomDict)
AbyssDict.KeyType = BaseTypes.Int
AbyssDict.ValueType = Abyss

function AbyssDict:NewAbyss(AbyssId)
  return Abyss(AbyssId)
end

function AbyssDict:GetAbyss(AbyssId)
  if not self[AbyssId] then
    return self:NewAbyss(AbyssId)
  end
  return self[AbyssId]
end

return {
  Abyss = Abyss,
  AbyssDict = AbyssDict,
  AbyssLevel = AbyssLevel,
  AbyssLevelList = AbyssLevelList,
  AbyssTeam = AbyssTeam,
  AbyssTeamList = AbyssTeamList
}
