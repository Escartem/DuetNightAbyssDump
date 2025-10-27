local Const = require("Const")
local Component = {}

function Component:Play_UsePenalizeSkill(Content)
  local Target = self:GetEntity(Content.TargetEid)
  local Source = self:GetEntity(Content.SourceEid)
  if Target then
    Source.CondemnMonsterEid = Content.TargetEid
    if Target.GetCanOpen then
      Target:GetCanOpen()
    end
  end
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  local UIManager = GameInstance:GetGameUIManager()
  local DefeatedUI = UIManager:GetUIObj("DefeatedInteract")
  if DefeatedUI then
    DefeatedUI:StopAllAnimations()
    DefeatedUI:PlayAnimation(DefeatedUI.Press)
  end
end

function Component:Play_StartTargetCondemn(Content)
  local Target = self:GetEntity(Content.Eid)
  if Target then
    Target:PlayCondemnMontage()
  end
end

function Component:BossCauseHit(Target, TNValue)
  local ReturnHitLevel
  local TargetCharInfo = Target.BattleCharInfo
  local TargetRoleId = TargetCharInfo.BattleRoleId
  local DeductToughnessHitIndex = DataMgr.DeductToughnessHitIndex[TargetRoleId]
  if DeductToughnessHitIndex then
    local DeductToughnessHit = TargetCharInfo.DeductToughnessHit
    local TNMax = Target:GetAttr("MaxTN")
    local TNPercent = TNValue / TNMax * 100
    local RemainTNPercent = Target:GetAttr("TN") / TNMax * 100
    for _, Percent in ipairs(DeductToughnessHitIndex) do
      local HitLevel = DeductToughnessHit[Percent]
      if Percent >= RemainTNPercent and Percent < TNPercent then
        ReturnHitLevel = Const.HitToLevel[HitLevel]
        break
      end
    end
  end
  return ReturnHitLevel
end

return Component
