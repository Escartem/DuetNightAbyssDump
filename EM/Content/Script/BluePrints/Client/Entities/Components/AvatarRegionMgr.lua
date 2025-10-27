require("UnLua")
require("Utils")
local Const = require("Const")
local EMCache = require("EMCache.EMCache")
local HeroUSDKUtils = require("Utils.HeroUSDKUtils")
local Component = {}

function Component:EnterWorld()
  self.SkipSubRegionCallback = {}
  self.SkipRegionCallback = {}
end

function Component:DisconnectRecoverCheck()
  local GameMode = UE4.UGameplayStatics.GetGameMode(GWorld.GameInstance)
  if not IsValid(GameMode) then
    return true
  end
  local UI = GWorld.GameInstance:GetLoadingUI()
  if UI then
    return true
  end
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return true
  end
  if not GameMode.GetLevelLoader then
    return true
  end
  local WorldLoader = GameMode:GetLevelLoader()
  local PlayerCharacter = UE4.UGameplayStatics.GetPlayerCharacter(GameMode, 0)
  if not IsValid(WorldLoader) or not IsValid(PlayerCharacter) then
    return true
  end
  if not WorldLoader.IsWorldLoader then
    return true
  end
  local SubRegionId = WorldLoader:GetRegionIdByLocation(PlayerCharacter:K2_GetActorLocation())
  if -1 ~= SubRegionId and SubRegionId == self:GetCurrentRegionId() then
    Avatar:AvatarStatusEnterSuccess()
    return false
  end
  return true
end

function Component:ClientRecoverEnterRegion()
end

function Component:ServerRecoverEnterRegion(EnterMode, EnterRegionType)
  DebugPrint("ZJT_ ServerRecoverEnterRegion  ", EnterMode, EnterRegionType)
  GWorld:OpenWorldRegionState()
end

function Component:UpdateRegionData(SubRegionId, RegionType)
end

function Component:HandleTryInitRegionInfo()
  if not self.IsEnterLevelReady then
    return
  end
  local GameMode = GWorld.GameInstance:GetCurrentGameMode()
  if not IsValid(GameMode) then
    DebugPrint("Error HandleTryInitRegionInfo \232\142\183\229\143\150\228\184\141\229\136\176GameMode ")
    return
  end
  GameMode:GetRegionDataMgrSubSystem():InitRegionInfo()
end

function Component:SetInRegionState()
  local GameMode = UE4.UGameplayStatics.GetGameMode(GWorld.GameInstance)
  if GameMode.IsBigWorldActived then
    return
  end
  GameMode.IsBigWorldActived = true
  local WorldLoader = GameMode:GetLevelLoader()
  local RegionId = self:GetSubRegionId2RegionId()
  for _, SubRegionId in pairs(DataMgr.Region[RegionId].IsRandom) do
    local LevelName = WorldLoader:GetLevelIdByRegionId(SubRegionId)
    if not LevelName then
      GWorld.logger.error("\229\140\186\229\159\159Id:" .. RegionId .. "\239\188\140\229\173\144\229\140\186\229\159\159Id" .. SubRegionId .. "\229\156\168WorldLoader\229\134\133\228\184\141\229\133\183\230\156\137LevelName")
    else
      local SubGameMode = GameMode.SubGameModeInfo:FindRef(LevelName)
      SubGameMode:OnBigWorldActive()
    end
  end
  GameMode:MainGameModeOnBigWorldActive()
end

function Component:SetEnterLevelStateReady()
  self.IsEnterLevelReady = true
end

function Component:InitRecoverCheck()
  local CheckRegionId = self:GetLastRegionId()
  return self:IsInEnterBigWorld() and self:CheckSubRegionType(CheckRegionId, CommonConst.SubRegionType.Field) and CheckRegionId == self.CurrentRegionId
end

function Component:CheckRegionId(TargetRegionId)
  local CheckRegionId = TargetRegionId or self.CurrentRegionId
  return CheckRegionId and DataMgr.SubRegion[CheckRegionId]
end

function Component:CheckCurrentRegionType(TargetRegionId)
  local CheckRegionId = TargetRegionId or self.CurrentRegionId
  return self:CheckRegionId(CheckRegionId) and DataMgr.SubRegion[CheckRegionId].SubRegionType == CommonConst.SubRegionType.Field
end

function Component:CheckCurrentSubRegion(TargetSubRegionId)
  local CheckSubRegionId = TargetSubRegionId or self.CurrentRegionId
  return self:IsInBigWorld() and self:CheckRegionId(CheckSubRegionId) ~= nil
end

function Component:IsInTargetRegion(TargetRegionId)
  return self.CurrentRegionId == TargetRegionId
end

function Component:GetWorldRegionEid(Context)
  if not Context.WorldRegionEid or Context.WorldRegionEid == "" then
    Context.WorldRegionEid = URuntimeCommonFunctionLibrary.GenerateGUID()
    DebugPrint("New WorldRegionEid Granted", Context.WorldRegionEid, Context.UnitType or "NoType", Context.UnitId or "No UnitId", os.time())
  end
  return Context.WorldRegionEid
end

function Component:GetCretorWorldRegionEid(Creator, Eid)
  Eid = Eid or tostring(math.random())
  local WorldRegionEid = Creator:GetName() .. "_" .. Eid .. "_" .. os.time()
  return WorldRegionEid
end

function Component:AddRegionSkipCallback(Id, Obj, Func)
  if nil == Id then
    return
  end
  if nil == Obj or nil == Func then
    return
  end
  DebugPrint("ZJT_ AddRegionSkipCallback ", Id, Obj, Func, DataMgr.Region[Id], DataMgr.SubRegion[Id])
  if DataMgr.Region[Id] then
    self.SkipRegionCallback = self.SkipRegionCallback or {}
    self.SkipRegionCallback[Id] = self.SkipRegionCallback[Id] or {}
    self.SkipRegionCallback[Id][Obj] = self.SkipRegionCallback[Id][Obj] or {}
    self.SkipRegionCallback[Id][Obj][Func] = true
  elseif DataMgr.SubRegion[Id] then
    self.SkipSubRegionCallback = self.SkipSubRegionCallback or {}
    self.SkipSubRegionCallback[Id] = self.SkipSubRegionCallback[Id] or {}
    self.SkipSubRegionCallback[Id][Obj] = self.SkipSubRegionCallback[Id][Obj] or {}
    self.SkipSubRegionCallback[Id][Obj][Func] = true
  end
end

function Component:RemoveRegionSkipCallback(RegionId, Obj, Func)
  DebugPrint("ZJT_ RemoveRegionSkipCallback ", RegionId, Obj, Func)
  PrintTable({
    SkipRegionCallback = self.SkipRegionCallback
  }, 10)
  if nil == RegionId then
    return
  end
  if self.SkipRegionCallback == nil then
    return
  end
  if self.SkipRegionCallback[RegionId] == nil then
    return
  end
  if Obj and Func then
    self.SkipRegionCallback[RegionId][Obj][Func] = false
  else
    DebugPrint("Obj,Func\228\184\186\231\169\186")
    for Obj, Funcs in pairs(self.SkipRegionCallback[RegionId]) do
      for Func, _ in pairs(Funcs) do
        Funcs[Func] = false
      end
    end
  end
end

function Component:RemoveSubRegionSkipCallback(SubRegionId, Obj, Func)
  if nil == SubRegionId then
    return
  end
  if nil == self.SkipSubRegionCallback then
    return
  end
  if nil == self.SkipSubRegionCallback[SubRegionId] then
    return
  end
  if Obj and Func then
    self.SkipSubRegionCallback[SubRegionId][Obj][Func] = false
  else
    DebugPrint("Obj,Func\228\184\186\231\169\186")
    for Obj, Funcs in pairs(self.SkipSubRegionCallback[SubRegionId]) do
      for Func, _ in pairs(Funcs) do
        Funcs[Func] = false
      end
    end
  end
end

function Component:GetSubRegionSkipCallback(SubRegionId, Obj)
  if not self.SkipSubRegionCallback then
    return
  end
  if not self.SkipSubRegionCallback[SubRegionId] then
    return
  end
  if not Obj then
    return self.SkipSubRegionCallback[SubRegionId]
  end
  return self.SkipSubRegionCallback[SubRegionId][Obj]
end

function Component:GetRegionSkipCallback(RegionId, Obj)
  if not self.SkipRegionCallback then
    return
  end
  if not self.SkipRegionCallback[RegionId] then
    return
  end
  if not Obj then
    return self.SkipRegionCallback[RegionId]
  end
  return self.SkipRegionCallback[RegionId][Obj]
end

function Component:HandleExeRegionSkipCallbck(RegionId)
  if self.SkipRegionCallback == nil then
    return
  end
  local SkipCallbcks = self.SkipRegionCallback[RegionId]
  if nil == SkipCallbcks then
    return
  end
  local PreDeleteSkipCallbcks = {}
  for Obj, Funcs in pairs(SkipCallbcks) do
    if Obj then
      for Func, Flag in pairs(Funcs) do
        if Flag then
          Func(Obj)
        else
          PreDeleteSkipCallbcks[Obj] = PreDeleteSkipCallbcks[Obj] or {}
          table.insert(PreDeleteSkipCallbcks[Obj], Func)
        end
      end
    else
      PreDeleteSkipCallbcks[Obj] = PreDeleteSkipCallbcks[Obj] or {}
      for Func, _ in pairs(Funcs) do
        table.insert(PreDeleteSkipCallbcks[Obj], Func)
      end
    end
  end
  for Obj, Funcs in pairs(PreDeleteSkipCallbcks) do
    for _, Func in pairs(Funcs) do
      SkipCallbcks[Obj][Func] = nil
    end
  end
end

function Component:HandleExeSubRegionSkipCallbck(SubRegionId)
  if self.SkipSubRegionCallback == nil then
    return
  end
  local SkipCallbcks = self.SkipSubRegionCallback[SubRegionId]
  if nil == SkipCallbcks then
    return
  end
  local PreDeleteSkipCallbcks = {}
  for Obj, Funcs in pairs(SkipCallbcks) do
    if Obj then
      for Func, Flag in pairs(Funcs) do
        if Flag then
          Func(Obj)
        else
          PreDeleteSkipCallbcks[Obj] = PreDeleteSkipCallbcks[Obj] or {}
          table.insert(PreDeleteSkipCallbcks[Obj], Func)
        end
      end
    else
      PreDeleteSkipCallbcks[Obj] = PreDeleteSkipCallbcks[Obj] or {}
      for Func, _ in pairs(Funcs) do
        table.insert(PreDeleteSkipCallbcks[Obj], Func)
      end
    end
  end
  for Obj, Funcs in pairs(PreDeleteSkipCallbcks) do
    for _, Func in pairs(Funcs) do
      SkipCallbcks[Obj][Func] = nil
    end
  end
end

function Component:ExeRegionSkipCallbck(SubRegionId)
  if nil == SubRegionId then
    return
  end
  if DataMgr.SubRegion[SubRegionId] then
    self:HandleExeSubRegionSkipCallbck(SubRegionId)
    self:HandleExeRegionSkipCallbck(DataMgr.SubRegion[SubRegionId].RegionId)
  else
    GWorld.logger.error("ZJT_ ExeRegionSkipCallbck \228\184\141\229\173\152\229\156\168\232\175\165 SubRegionId : ", SubRegionId)
  end
end

function Component:StartJumpRegion(TargetSubregionId, OnJumpToSubregionSucceed)
  if self:GetSubRegionId2RegionId(self.CurrentRegionId) == self:GetSubRegionId2RegionId(TargetSubregionId) then
    DebugPrint("Invitation: \229\144\140\229\140\186\229\159\159\232\183\179\232\189\172 %d \229\173\144\229\140\186\229\159\159\227\128\130", TargetSubregionId)
    self:AddRegionSkipCallback(TargetSubregionId, self, OnJumpToSubregionSucceed)
  else
    DebugPrint("Invitation: \232\183\168\229\140\186\229\159\159\232\183\179\232\189\172 %d \229\173\144\229\140\186\229\159\159\227\128\130", TargetSubregionId)
    EventManager:AddEvent(EventID.OnRegionLoaded, self, function()
      EventManager:RemoveEvent(EventID.OnRegionLoaded, self)
      if OnJumpToSubregionSucceed then
        OnJumpToSubregionSucceed()
      end
    end)
  end
end

function Component:StopJumpRegion(TargetSubregionId)
  if self:GetSubRegionId2RegionId() == self:GetSubRegionId2RegionId(TargetSubregionId) then
    DebugPrint("Invitation: \228\184\173\230\150\173\229\144\140\229\140\186\229\159\159\232\183\179\232\189\172 %d \229\173\144\229\140\186\229\159\159\227\128\130", TargetSubregionId)
    self:RemoveSubRegionSkipCallback(TargetSubregionId)
  else
    DebugPrint("Invitation: \228\184\173\230\150\173\232\183\168\229\140\186\229\159\159\232\183\179\232\189\172 %d \229\173\144\229\140\186\229\159\159\227\128\130", TargetSubregionId)
    EventManager:RemoveEvent(EventID.OnRegionLoaded, self)
  end
end

function Component:GetSubRegionId2RegionId(SubRegionId)
  SubRegionId = SubRegionId or self.CurrentRegionId
  if not DataMgr.SubRegion[SubRegionId] then
    DebugPrint("Error! GetSubRegionId2RegionId Has Error SubRegionId:", SubRegionId)
  end
  return DataMgr.SubRegion[tonumber(SubRegionId)].RegionId
end

function Component:GetLastRegionId()
  return self.LastRegionData.RegionId
end

function Component:CheckSubRegionId(SubRegionId)
  local CheckSubRegionId = SubRegionId or self.CurrentRegionId
  return CheckSubRegionId and DataMgr.SubRegion[CheckSubRegionId]
end

function Component:CheckSubRegionType(SubRegionId, RegionType)
  local CheckSubRegionId = SubRegionId or self.CurrentRegionId
  local CheckRegionType = RegionType or CommonConst.SubRegionType.Field
  return self:CheckSubRegionId(CheckSubRegionId) and DataMgr.SubRegion[CheckSubRegionId].SubRegionType == CheckRegionType
end

function Component:CheckSubRegionType_NotEqual(SubRegionId, RegionType)
  local CheckSubRegionId = SubRegionId or self.CurrentRegionId
  local CheckRegionType = RegionType or CommonConst.SubRegionType.Field
  return self:CheckSubRegionId(CheckSubRegionId) and DataMgr.SubRegion[CheckSubRegionId].SubRegionType ~= CheckRegionType
end

function Component:GetCurrentRegionId()
  return self.CurrentRegionId
end

function Component:GetIsInHome()
  return self:IsInBigWorld() and self:CheckSubRegionType(nil, CommonConst.SubRegionType.Home)
end

return Component
