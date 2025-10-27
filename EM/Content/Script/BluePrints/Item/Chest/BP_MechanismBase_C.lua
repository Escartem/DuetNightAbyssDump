require("UnLua")
local CommonConst = require("CommonConst")
local BP_MechanismBase_C = Class({
  "BluePrints.Item.BP_CombatItemBase_C"
})

function BP_MechanismBase_C:AuthorityInitInfo(Info)
  BP_MechanismBase_C.Super.AuthorityInitInfo(self, Info)
  self:SetRewardID()
end

function BP_MechanismBase_C:CustomAddGuideCondition()
  return not self.OpenState
end

function BP_MechanismBase_C:BuildRewardInfo(PlayerId)
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  if not GameMode then
    return
  end
  local RewardIds = GameMode:GetDropRule(self.UnitId)
  local ExtraInfo = {
    UniqueSign = self.Eid,
    SourceEid = PlayerId,
    ParentEid = self.Eid,
    bRare = false
  }
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

function BP_MechanismBase_C:SetRewardID()
end

function BP_MechanismBase_C:CreateReward(PlayerId)
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  if GameMode then
    local RewardPosition = self:GetTransform()
    if self.RewardPosition then
      RewardPosition = self.RewardPosition:K2_GetComponentToWorld()
    end
    local RewardIds, ExtraInfo = self:BuildRewardInfo(PlayerId)
    GameMode:TriggerRewardEvent(self.UnitId, CommonConst.RewardReason.Chest, RewardPosition, ExtraInfo)
  end
end

function BP_MechanismBase_C:OpenMechanism(PlayerId)
  print(_G.LogTag, "Error: LXZ OpenMechanism not Define in ", self:GetName())
end

function BP_MechanismBase_C:CreateRegionData()
  self.RegionData = {
    CanOpen = self.CanOpen,
    OpenState = self.OpenState,
    StateId = self.StateId,
    IsActive = self.IsActive
  }
  print(_G.LogTag, "LXZ CreateRegionData", self:GetName(), self.CanOpen, self.StateId)
  local Data = {
    CanOpen = self.CanOpen,
    OpenState = self.OpenState,
    StateId = self.StateId,
    IsActive = self.IsActive
  }
  self:UpdateRegionDataByTable(Data)
end

function BP_MechanismBase_C:ForceCloseMechanism(PlayerId, IsSuccess)
  self:CloseMechanism(PlayerId, IsSuccess)
end

function BP_MechanismBase_C:CloseMechanism(PlayerId, IsSuccess)
  self:BroadcastCloseMechanism(PlayerId)
end

function BP_MechanismBase_C:BroadcastCloseMechanism_Lua(PlayerId)
end

function BP_MechanismBase_C:BPRecoverSnapShot()
end

function BP_MechanismBase_C:GetCanOpen(PlayerEid)
end

function BP_MechanismBase_C:OpenUI(PlayerEid)
end

function BP_MechanismBase_C:EndInteractive(Player)
  self.ChestInteractiveComponent:EndInteractive(Player)
end

return BP_MechanismBase_C
