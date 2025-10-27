local MonsterUtils = require("Utils.MonsterUtils")
local ArchiveNumberModel = {}

function ArchiveNumberModel:GetCharacterSumNumber()
  local Sum = 0
  local Flag = false
  for _, Info in pairs(DataMgr.Char) do
    if not Info.IsNotOpen then
      if Info.GenderTag then
        if not Flag then
          Flag = true
          Sum = Sum + 1
        end
      else
        Sum = Sum + 1
      end
    end
  end
  return Sum
end

function ArchiveNumberModel:GetMeleeSumNumber()
  local Sum = 0
  for _, Info in pairs(DataMgr.Weapon) do
    local WeaponTags = DataMgr.BattleWeapon[Info.WeaponId].WeaponTag
    if not Info.IsNotOpen and WeaponTags then
      for _, Tag in pairs(WeaponTags) do
        if "Melee" == Tag then
          Sum = Sum + 1
          break
        end
      end
    end
  end
  return Sum
end

function ArchiveNumberModel:GetRangedSumNumber()
  local Sum = 0
  for _, Info in pairs(DataMgr.Weapon) do
    local WeaponTags = DataMgr.BattleWeapon[Info.WeaponId].WeaponTag
    if not Info.IsNotOpen and WeaponTags then
      for _, Tag in pairs(WeaponTags) do
        if "Ranged" == Tag then
          Sum = Sum + 1
          break
        end
      end
    end
  end
  return Sum
end

function ArchiveNumberModel:GetResourceSumNumber()
  local Sum = 0
  for _, Info in pairs(DataMgr.Resource) do
    if 1 == Info.ItemArchiveType or 2 == Info.ItemArchiveType then
      Sum = Sum + 1
    end
  end
  return Sum
end

function ArchiveNumberModel:GetReadSumNumber()
  local BookSeries = {}
  local Sum = 0
  for _, Info in pairs(DataMgr.Resource) do
    if Info.BookSeriesId and DataMgr.BookSeriesArchive[Info.BookSeriesId] and not BookSeries[Info.BookSeriesId] then
      BookSeries[Info.BookSeriesId] = 1
      Sum = Sum + 1
    end
  end
  return Sum
end

function ArchiveNumberModel:GetEnemySumNumber()
  local Sum = 0
  for _, Info in pairs(DataMgr.GalleryRule) do
    if not Info.DisableArchive and MonsterUtils.CheckGallerRuleByMonsterRelease(Info) then
      Sum = Sum + 1
    end
  end
  return Sum
end

function ArchiveNumberModel:GetCurrentNumber(ArchiveType)
  local Avatar = GWorld:GetAvatar()
  local CurrentNum = 0
  if 1005 == ArchiveType then
    CurrentNum = self:GetCurrentBookNumber()
  elseif Avatar then
    if 1001 == ArchiveType then
      local Char = DataMgr.Char
      local Flag = false
      for Id, _ in pairs(Avatar.Archives[ArchiveType].ArchiveList) do
        if Char[Id].GenderTag then
          if not Flag then
            Flag = true
            CurrentNum = CurrentNum + 1
          end
        else
          CurrentNum = CurrentNum + 1
        end
      end
    else
      CurrentNum = Avatar.Archives[ArchiveType]:GetArchiveCount()
    end
  end
  return CurrentNum
end

function ArchiveNumberModel:GetCurrentBookNumber()
  local Avatar = GWorld:GetAvatar()
  local RemainBookSeries = {}
  local ReadSumNumber = 0
  for _, Info in pairs(DataMgr.Resource) do
    if Info.BookSeriesId and DataMgr.BookSeriesArchive[Info.BookSeriesId] then
      if not RemainBookSeries[Info.BookSeriesId] then
        ReadSumNumber = ReadSumNumber + 1
        RemainBookSeries[Info.BookSeriesId] = {}
      end
      RemainBookSeries[Info.BookSeriesId][Info.ResourceId] = 1
    end
  end
  if Avatar then
    local ArchiveList = Avatar.Archives[1005].ArchiveList
    for Id, _ in pairs(ArchiveList) do
      if RemainBookSeries[DataMgr.Resource[Id].BookSeriesId] then
        RemainBookSeries[DataMgr.Resource[Id].BookSeriesId][Id] = nil
        if IsEmptyTable(RemainBookSeries[DataMgr.Resource[Id].BookSeriesId]) then
          RemainBookSeries[DataMgr.Resource[Id].BookSeriesId] = nil
        end
      end
    end
  end
  local RemainBookSeriesNum = 0
  for _, _ in pairs(RemainBookSeries) do
    RemainBookSeriesNum = RemainBookSeriesNum + 1
  end
  local CurrentNum = ReadSumNumber - RemainBookSeriesNum
  return CurrentNum
end

return ArchiveNumberModel
