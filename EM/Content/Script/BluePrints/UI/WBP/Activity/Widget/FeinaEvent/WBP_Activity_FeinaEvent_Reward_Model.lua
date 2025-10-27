local FeinaEventRewardModel = {}

function FeinaEventRewardModel:OpenReward()
  local UIManager = GWorld.GameInstance:GetGameUIManager()
  UIManager:LoadUINew("FeinaEventReward")
end

return FeinaEventRewardModel
