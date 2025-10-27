require("UnLua")
local RewardBox = require("BluePrints.Client.CustomTypes.SimpleRewardBox")
local BP_ChestBase_C = Class("BluePrints.Item.Chest.BP_MechanismBase_C")

function BP_ChestBase_C:ReceiveBeginPlay()
  BP_ChestBase_C.Super.ReceiveBeginPlay(self)
  self:SetMaterial()
end

function BP_ChestBase_C:AuthorityInitInfo(Info)
  BP_ChestBase_C.Super.AuthorityInitInfo(self, Info)
  self:SetRewardID()
end

function BP_ChestBase_C:ClientInitInfo(Info)
  BP_ChestBase_C.Super.ClientInitInfo(self, Info)
  if self.InitAnim then
    self:InitAnim()
    self.Mesh:SetComponentTickEnabled(false)
  end
end

function BP_ChestBase_C:OnActorReady(Info)
  BP_ChestBase_C.Super.OnActorReady(self, Info)
  if self.OpenState and self.NeedDestroy then
    self:EMActorDestroy(EDestroyReason.MechanismDead)
  end
end

function BP_ChestBase_C:OpenMechanism(PlayerId)
  self.Mesh:SetComponentTickEnabled(true)
  self:TriggerSource(0)
  if 0 == self.RewardTime or self.RewardWave <= 1 then
    self:ClientPlayAnim(PlayerId, 0, self.Eid)
  end
  self:AddTimer(1, function()
    self.Mesh:SetComponentTickEnabled(false)
  end, false, 0, "CloseChestTick")
  if self.OpenState == false then
    self:DropReward(PlayerId)
  end
  self:UpdateRegionData("OpenState", true)
  self:DeactiveGuide()
  if self.ChestInteractiveComponent then
    local Player = Battle(self):GetEntity(PlayerId)
    if Player then
      Player:AddChestOpenedCount()
      self.ChestInteractiveComponent:EndInteractive(Player)
    end
  end
  if self.NeedDestroy then
    self:AddTimer(3, self.PlayDestroyEffect, false, 0)
  end
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  local SceneMgrComponent = GameInstance:GetSceneManager()
  if IsValid(SceneMgrComponent) and self.Eid == SceneMgrComponent.NearestBreakableItemGuideEid then
    SceneMgrComponent:CloseOneGuideIconByTargetEid(self.Eid)
    SceneMgrComponent.NearestBreakableItemGuideEid = 0
  end
end

function BP_ChestBase_C:PlayDestroyEffect()
  self:OnChestDestroy()
end

function BP_ChestBase_C:OnChestDestroy()
  self:RemoveTimer("CloseChestTick")
  self.BodyCollision:SetCollisionEnabled(0)
  self.Overridden.OnChestDestroy(self)
end

function BP_ChestBase_C:BuildRewardInfo(PlayerId)
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  if not GameMode then
    return
  end
  local RewardIds = GameMode:GetDropRule(self.UnitId)
  local ExtraInfo = {
    UniqueSign = self.Eid,
    SourceEid = PlayerId,
    ParentEid = self.Eid,
    MultiWave = true
  }
  if 0 == self.RewardTime or self.RewardWave <= 1 then
    ExtraInfo.MultiWave = false
  end
  if GameMode:IsInRegion() then
    ExtraInfo.WorldRegionEid = self.WorldRegionEid
    ExtraInfo.RegionDataType = self.RegionDataType
    local RewardPosition = self:GetTransform()
    if self.RewardPosition then
      RewardPosition = self.RewardPosition:K2_GetComponentToWorld()
    end
  end
  return RewardIds, ExtraInfo
end

function BP_ChestBase_C:MultiWaveCreateDrop(Drops, CreateDropFunc)
  self.CurrentWave = 1
  local DropsTable = {}
  for DropId, DropCountTable in pairs(Drops) do
    DropId = tonumber(DropId)
    DropsTable[DropId] = {}
    local ExtraCount = RewardBox:FindCountByTag(DropCountTable, "Extra")
    local OtherCount = RewardBox:FindCountByTag(DropCountTable, "Normal")
    DropsTable[DropId].Count = OtherCount + ExtraCount
  end
  local RealWave = self:GetWaveCount(DropsTable)
  local Time = self.RewardTime / RealWave
  self:AddTimer(Time, self.RealCreateDrop, true, -Time, "ChestCreateDrop", nil, RealWave, DropsTable, CreateDropFunc)
  self:ClientPlayAnim(self.CombatStateChangeComponent.PlayerEid, 0, self.Eid)
end

function BP_ChestBase_C:RealCreateDrop(RealWave, DropsTable, CreateDropFunc)
  for DropId, Table in pairs(DropsTable) do
    if RealWave > self.CurrentWave then
      if Table.Count > 0 and Table.WaveCount > 0 and 0 == self.CurrentWave % Table.WaitWave then
        print(_G.LogTag, "LXZ RealCreateDrop", DropId)
        CreateDropFunc(DropId, Table.WaveCount, false, 0)
      end
    elseif self.CurrentWave == RealWave and Table.Count > 0 and Table.RemainCount > 0 then
      CreateDropFunc(DropId, Table.RemainCount, false, 0)
    end
  end
  self.CurrentWave = self.CurrentWave + 1
  if RealWave < self.CurrentWave then
    self:RemoveTimer("ChestCreateDrop")
  end
end

function BP_ChestBase_C:GetWaveCount(DropsTable)
  local RealWave = self.RewardWave
  local Res = true
  local MaxCount = 0
  for DropId, Table in pairs(DropsTable) do
    if MaxCount < Table.Count then
      MaxCount = Table.Count
    end
    local Rate = RealWave / Table.Count
    if Rate < 1 then
      Res = false
    end
  end
  if Res then
    RealWave = MaxCount
  end
  for DropId, Table in pairs(DropsTable) do
    local Rate = RealWave / Table.Count
    if Rate <= 1 then
      Table.WaveCount = math.floor(Table.Count / RealWave)
      Table.WaitWave = 1
      Table.RemainCount = Table.Count - (RealWave - 1) * Table.WaveCount
    else
      Table.WaveCount = 1
      Table.WaitWave = math.ceil(RealWave / Table.Count)
      if 0 == RealWave % Table.WaitWave then
        local tmp = RealWave // Table.WaitWave
        Table.RemainCount = Table.Count - (tmp - 1) * Table.WaveCount
      else
        local tmp = RealWave // Table.WaitWave
        Table.RemainCount = Table.Count - tmp * Table.WaveCount
      end
    end
  end
  return RealWave
end

return BP_ChestBase_C
