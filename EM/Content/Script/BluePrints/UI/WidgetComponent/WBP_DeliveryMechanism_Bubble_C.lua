require("UnLua")
local WBP_DeliveryMechanism_Bubble_C = Class("BluePrints.UI.BP_UIState_C")

function WBP_DeliveryMechanism_Bubble_C:Initialize(Initializer)
end

function WBP_DeliveryMechanism_Bubble_C:Construct()
  self.Super.Construct(self)
  EventManager:AddEvent(EventID.OnChangeTaskIndicator, self, self.SetCurrentTrackingTaskIndicatorNames)
  self.IsDestroied = false
end

function WBP_DeliveryMechanism_Bubble_C:Destruct()
  self.Super.Destruct(self)
  EventManager:RemoveEvent(EventID.OnChangeTaskIndicator, self)
  self.IsDestroied = true
end

function WBP_DeliveryMechanism_Bubble_C:SetCurrentTrackingTaskIndicatorNames()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  local CurrentMissionIndicators = MissionIndicatorManager:GetIndicatorUIObjByQuestChainIdWithType(Avatar.TrackingQuestChainId, "Task")
  self.IndicatorUINames:Clear()
  if not IsEmptyTable(CurrentMissionIndicators) then
    for _, UI in pairs(CurrentMissionIndicators) do
      self.IndicatorUINames:Add(UI:GetName())
    end
  end
  local CurrentSpecialSideTrackIndicators = MissionIndicatorManager:GetSpecialSideIndicatorUIObj()
  if not IsEmptyTable(CurrentSpecialSideTrackIndicators) then
    for _, UI in pairs(CurrentSpecialSideTrackIndicators) do
      self.IndicatorUINames:Add(UI:GetName())
    end
  end
end

return WBP_DeliveryMechanism_Bubble_C
