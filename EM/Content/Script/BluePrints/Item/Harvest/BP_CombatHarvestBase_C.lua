require("UnLua")
local M = Class("BluePrints/Item/CombatProp/BP_CombatPropBase_C")

function M:AuthorityInitInfo(Info)
  M.Super.AuthorityInitInfo(self, Info)
  self.RareProb = self.UnitParams.RareProb or -1
  self.RareRewardId = self.UnitParams.RareRewardId or 0
  self.bRare = false
end

function M:OnToughnessToZero()
  local NextStateId = self.Normal_State_Id
  if math.random() <= self.RareProb then
    NextStateId = self.Rare_State_Id
    if IsAuthority(self) then
      self.bRare = true
    end
  end
  self:ChangeState("Manual", 0, NextStateId)
end

function M:GetCanOpen(PlayerId)
  self.CanOpen = true
end

function M:OpenMechanism(PlayerId)
  print(_G.LogTag, "LXZ OpenMechanism", self.OpenState)
  if not self.OpenState then
    self:CreateReward(PlayerId)
  end
  self:UpdateRegionData("OpenState", true)
end

function M:CreateReward(PlayerId)
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  if GameMode then
    local RewardPosition = self:GetTransform()
    local ExtraInfo = {
      SourceEid = PlayerId,
      UniqueSign = self.Eid,
      ParentEid = self.Eid,
      bRare = self.bRare
    }
    print(_G.LogTag, "LXZ CreateReward", self.bRare)
    GameMode:TriggerRewardEvent(self.UnitId, CommonConst.RewardReason.Chest, RewardPosition, ExtraInfo)
  end
end

function M:CreateRegionData()
  self.TN = self:GetAttr("TN")
  self.RegionData = {
    StateId = self.StateId,
    IsActive = self.IsActive
  }
end

function M:RecoverSavedData(DataTable)
  if not DataTable then
    return
  end
  for i, v in pairs(DataTable) do
    if nil ~= self[i] then
      self[i] = v
    end
  end
end

return M
