require("UnLua")
local BP_DSAssetsManager_C = Class()

function BP_DSAssetsManager_C:Initialize(Initializer)
end

function BP_DSAssetsManager_C:PreLoadAssets_Lua()
  self:PreLoadData()
  self:PreLoadMapAssets()
  self:PreLoadCharacterAssets()
  self:PreLoadMonsterAssets()
  self:PreLoadPhantomAssets()
  self:PreLoadPassiveEffectsAssets()
  self:PreLoadSkillCreature()
  self:PreLoadBuff()
  self:PreLoadBP()
  self:PreLoadBehaviorMontage()
end

function BP_DSAssetsManager_C:PreLoadData()
  print("BP_DSAssetsManager_C", "PreLoadData")
  DataMgr.PreLoad()
end

function BP_DSAssetsManager_C:PreLoadMapAssets()
  print("BP_DSAssetsManager_C", "PreLoadMapAssets")
  for DungeonId, Info in pairs(DataMgr.Dungeon) do
    if Info.IsMultiDungeon then
      self:AddDungeonMapAssets(DungeonId)
    end
  end
end

function BP_DSAssetsManager_C:AddDungeonMapAssets(DungeonId)
  local Info = DataMgr.Dungeon[DungeonId]
  if not Info.DungeonJsonFile then
    return
  end
  local DungeonJsonFile = Info.DungeonJsonFile
  local Files = UE4.URuntimeCommonFunctionLibrary.GetAllFileNamesInDic(DungeonJsonFile)
  for i = 1, Files:Length() do
    local File = Files:GetRef(i)
    local PathPart, FilenamePart = UE4.UBlueprintPathsLibrary.Split(File)
    local LeftS, RightS = UE4.UKismetStringLibrary.Split(PathPart, "Houdini_data/")
    local FileName = RightS .. "/" .. FilenamePart
    local levelTable = DataMgr.GetLevelLoaderJsonData(FileName)
    local LevelCounts = #levelTable.points
    for j = 1, LevelCounts do
      local Level = levelTable.points[j]
      local homePath = string.gsub(Level.struct, "Datas/Data_Design", "Levels")
      local designPath = Level.struct .. "_Design"
      local artPath = Level.art_path
      if not artPath or "" == artPath then
        artPath = string.gsub(Level.struct, "Data_Design", "Data_Art") .. "_Art"
      end
      local navPath = string.gsub(Level.struct, "Data_Design", "Data_NavMesh") .. "_NavMesh"
      self:AddUniqueAssets(homePath)
      self:AddUniqueAssets(designPath)
      self:AddUniqueAssets(artPath)
      self:AddUniqueAssets(navPath)
    end
  end
end

function BP_DSAssetsManager_C:PreLoadCharacterAssets()
  for _, Info in pairs(DataMgr.BattleChar) do
    local UnitBPPath = Info.UnitBPPath
    if UnitBPPath then
      self:AddUniqueAssets(UnitBPPath, true)
    end
  end
  for _, Info in pairs(DataMgr.Model) do
    self:PreLoadModelAssets(Info)
  end
  self:AddUniqueAssets(Const.CharResourcePaths.DistructableBodyBp, true)
  for _, Info in pairs(DataMgr.BattleWeapon) do
    self:PreLoadWeaponAssets(Info)
  end
  self:AddUniqueAssets(Const.CharResourcePaths.AccessoryBP, true)
  for _, Info in pairs(DataMgr.BodyAccessory) do
    self:PreLoadBodyAccessoryAssets(Info)
  end
end

function BP_DSAssetsManager_C:PreLoadModelAssets(Info)
  if Info.CloakMeshPath then
    local CloakPath = "/Game/" .. Info.CloakMeshPath
    self:AddUniqueAssets(CloakPath)
  end
  if Info.SkeletonMeshPath then
    local SkeletonPath = "/Game/" .. Info.SkeletonMeshPath
    self:AddUniqueAssets(SkeletonPath)
  end
  if Info.AnimInstancePath then
    self:AddUniqueAssets(Info.AnimInstancePath, true)
  end
  if Info.MontageFolder then
    self:PreLoadMontageAssets(Info.MontageFolder)
  end
end

function BP_DSAssetsManager_C:PreLoadDistructableBodyAssets(Info)
  for _, PartMesh in pairs(Info.PartMesh) do
    self:AddUniqueAssets(PartMesh)
  end
end

function BP_DSAssetsManager_C:PreLoadWeaponAssets(Info)
  if Info.WeaponBlueprint then
    self:AddUniqueAssets(Info.WeaponBlueprint, true)
  end
end

function BP_DSAssetsManager_C:PreLoadBodyAccessoryAssets(Info)
  if Info.ModelPath then
    self:AddUniqueAssets(Info.ModelPath)
  end
end

function BP_DSAssetsManager_C:PreLoadMontageAssets(MontageFolder)
  self:AddAllMontagesFromDic(self:GetAllMontageDic(MontageFolder))
end

function BP_DSAssetsManager_C:AddAllMontagesFromDic(Dic)
  for _, d in ipairs(Dic) do
    local Files = UE4.URuntimeCommonFunctionLibrary.GetAllFileNamesInDic(d)
    if Files then
      for i = 1, Files:Length() do
        local File = Files:GetRef(i)
        local PathPart, FilenamePart = UE4.UBlueprintPathsLibrary.Split(File)
        local LeftS, RightS = UE4.UKismetStringLibrary.Split(PathPart, "Content/")
        local FileName = "/Game/" .. RightS .. "/" .. FilenamePart
        self:AddUniqueAssets(FileName)
      end
    end
  end
end

function BP_DSAssetsManager_C:GetAllMontageDic(MontageFolder)
  local Result = {}
  for Weapon, _ in pairs(CommonConst.WeaponTypes) do
    table.insert(Result, MontageFolder .. "Combat/Weapon/" .. Weapon .. "/")
  end
  table.insert(Result, MontageFolder .. "Locomotion/")
  table.insert(Result, MontageFolder .. "Combat/Hit/")
  table.insert(Result, MontageFolder .. "Combat/Skill/")
  table.insert(Result, MontageFolder .. "Armory/")
  table.insert(Result, MontageFolder .. "Interactive/")
  return Result
end

function BP_DSAssetsManager_C:PreLoadMonsterAssets()
  for _, Info in pairs(DataMgr.Monster) do
    local UnitBPPath = Info.UnitBPPath
    if UnitBPPath then
      self:AddUniqueAssets(UnitBPPath, true)
    end
    local BT = Info.BT
    if BT then
      self:AddUniqueAssets(BT)
    end
  end
end

function BP_DSAssetsManager_C:PreLoadPhantomAssets()
  for _, Info in pairs(DataMgr.Phantom) do
    local UnitBPPath = Info.UnitBPPath
    if UnitBPPath then
      self:AddUniqueAssets(UnitBPPath, true)
    end
    local BT = Info.BT
    if BT then
      for _, bt in ipairs(BT) do
        self:AddUniqueAssets(bt)
      end
    end
  end
end

function BP_DSAssetsManager_C:PreLoadPassiveEffectsAssets()
  for _, Info in pairs(DataMgr.PassiveEffect) do
    local BPPath = Info.BPPath
    if BPPath then
      self:AddUniqueAssets(BPPath, true)
    end
  end
end

function BP_DSAssetsManager_C:PreLoadSkillCreature()
  for _, Info in pairs(DataMgr.SkillCreature) do
    local BPPath = Info.BPPath
    if BPPath then
      self:AddUniqueAssets(BPPath, true)
    end
  end
end

function BP_DSAssetsManager_C:PreLoadBuff()
  for _, Info in pairs(DataMgr.Buff) do
    local BPPath = Info.BPPath
    if BPPath then
      self:AddUniqueAssets(BPPath, true)
    end
  end
end

function BP_DSAssetsManager_C:PreLoadBP()
  self:PreLoadBPByFolder("AI")
  self:PreLoadBPByFolder("AnimNotifiers")
  self:PreLoadBPByFolder("Camera")
  self:PreLoadBPByFolder("Char")
  self:PreLoadBPByFolder("Combat")
  self:PreLoadBPByFolder("Common")
  self:PreLoadBPByFolder("Item")
  self:PreLoadBPByFolder("Map")
end

function BP_DSAssetsManager_C:PreLoadBPByFolder(Folder)
  local Files = UE4.URuntimeCommonFunctionLibrary.GetAllFilePathsInDic(string.format("/Game/BluePrints/%s/", Folder), "BP_*")
  if Files then
    for i = 1, Files:Length() do
      local File = Files:GetRef(i)
      local PathPart, FilenamePart = UE4.UBlueprintPathsLibrary.Split(File)
      local LeftS, RightS = UE4.UKismetStringLibrary.Split(PathPart, "Content/")
      local FileName = "/Game/" .. RightS .. "/" .. FilenamePart
      self:AddUniqueAssets(FileName, true)
    end
  end
end

function BP_DSAssetsManager_C:PreLoadBehaviorMontage()
  for _, Info in pairs(DataMgr.BehaviorMontage) do
    self:AddUniqueAssets(Info.MontagePath)
  end
end

return BP_DSAssetsManager_C
