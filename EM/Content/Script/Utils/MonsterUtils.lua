require("UnLua")
local MonsterUtils = {}
local DEFAULT_MONSTER_PRIORITY = 999
MonsterUtils.DANGER_GAP_LEVEL = 10

function MonsterUtils._IsPrefix(str1, str2)
  return string.sub(str1, 1, string.len(str2)) == str2
end

function MonsterUtils.HasMonsterTag(GamePlayTags, Tag)
  for _, GamePlayTag in ipairs(GamePlayTags) do
    if MonsterUtils._IsPrefix(GamePlayTag, Tag) then
      return true
    end
  end
  return false
end

function MonsterUtils.IsBoss(MonsterId)
  local MonsterInfo = DataMgr.Monster[MonsterId]
  assert(MonsterInfo, string.format("wrong monster id: %d", MonsterId))
  local GamePlayTags = MonsterInfo.GamePlayTags
  if nil == GamePlayTags then
    return false
  end
  return MonsterUtils.HasMonsterTag(GamePlayTags, Const.BossMonster[1])
end

function MonsterUtils.IsElite(MonsterId)
  local MonsterInfo = DataMgr.Monster[MonsterId]
  assert(MonsterInfo, string.format("wrong monster id: %d", MonsterId))
  local GamePlayTags = MonsterInfo.GamePlayTags
  if nil == GamePlayTags then
    return false
  end
  local res = MonsterUtils.HasMonsterTag(GamePlayTags, Const.EliteMonster[1])
  return res
end

function MonsterUtils.GetPriority(MonsterId)
  local GalleryRule = MonsterUtils.GetGalleryRuleInfo(MonsterId)
  if not GalleryRule then
    return DEFAULT_MONSTER_PRIORITY
  end
  return GalleryRule.Priority or DEFAULT_MONSTER_PRIORITY
end

function MonsterUtils.CompareMonsters(LeftId, RightId)
  local Ta, Tb = MonsterUtils.Tier(LeftId), MonsterUtils.Tier(RightId)
  if Ta ~= Tb then
    return Ta < Tb
  end
  local LeftPriority = MonsterUtils.GetPriority(LeftId)
  local RightPriority = MonsterUtils.GetPriority(RightId)
  if LeftPriority == RightPriority then
    return LeftId < RightId
  else
    return LeftPriority < RightPriority
  end
end

function MonsterUtils.Tier(Id)
  if MonsterUtils.IsBoss(Id) then
    return 0
  end
  if MonsterUtils.IsElite(Id) then
    return 1
  end
  return 2
end

function MonsterUtils.GetRealMonsterBuffs(DungeonId, MonsterId, DungeonInfo)
  local Ret = {}
  local DungeonInfo = DungeonInfo or DataMgr.Dungeon[DungeonId]
  local MonsterBuffs = DungeonInfo.MonsterBuff or {}
  local GlobalBuffs = MonsterBuffs.BuffList or {}
  local LocalBuff = MonsterBuffs[MonsterId]
  for _, BuffId in ipairs(GlobalBuffs) do
    table.insert(Ret, BuffId)
  end
  if LocalBuff then
    table.insert(Ret, LocalBuff)
  end
  table.sort(Ret)
  return Ret
end

function MonsterUtils.GetDescriptionDetail(MonsterId)
  local GalleryRule = MonsterUtils.GetGalleryRuleInfo(MonsterId)
  if not GalleryRule then
    return
  end
  return GalleryRule.DescriptionDetail
end

function MonsterUtils.GetGalleryRuleInfo(MonsterId)
  local MonsterInfo = DataMgr.Monster[MonsterId]
  if not MonsterInfo or not MonsterInfo.GalleryRuleId then
    return
  end
  return DataMgr.GalleryRule[MonsterInfo.GalleryRuleId]
end

function MonsterUtils.CheckGallerRuleByMonsterRelease(RuleInfo)
  if not RuleInfo or not RuleInfo.PreferredMonsterId then
    return false
  end
  local MonsterData = DataMgr.Monster[RuleInfo.PreferredMonsterId]
  if not MonsterData or MonsterData.IsNotRelease then
    return false
  end
  return true
end

function MonsterUtils.SortWeaknessTypeIcon(a, b)
  local aCounterType = DataMgr.Attribute[a.WeaknessType] and DataMgr.Attribute[a.WeaknessType].CounterType or 0
  local bCounterType = DataMgr.Attribute[b.WeaknessType] and DataMgr.Attribute[b.WeaknessType].CounterType or 0
  local aPriority = DataMgr.Attribute[aCounterType] and DataMgr.Attribute[aCounterType].DisplayPriority or 0
  local bPriority = DataMgr.Attribute[bCounterType] and DataMgr.Attribute[bCounterType].DisplayPriority or 0
  return aPriority < bPriority
end

return MonsterUtils
