local Component = {}

function Component:EnterWorld()
  EventManager:AddEvent(EventID.ConditionComplete, self, self.OnConditionComplete)
end

function Component:LeaveWorld()
  EventManager:RemoveEvent(EventID.ConditionComplete, self)
end

function Component:OnConditionComplete(ConditionId)
  local EventNames = DataMgr.MSDKUploadConvert.ConditionUnlockInfo[ConditionId]
  if EventNames then
    for i, EventName in ipairs(EventNames) do
      local EMHeroUSDKSubsystem = UE4.USubsystemBlueprintLibrary.GetGameInstanceSubsystem(GWorld.GameInstance, UEMHeroUSDKSubsystem:StaticClass())
      EMHeroUSDKSubsystem:MSDKUploadCommonEventByEventName(EventName)
    end
  end
end

return Component
