local M = Class("BluePrints.Story.Interactive.InteractiveComponent.BP_HomeInteractiveComponent_C")

function M:IsShowInteractiveComp()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return true
  end
  local UIUnlockRuleData = DataMgr.UIUnlockRule[self.SystemName]
  if UIUnlockRuleData and not Avatar:CheckUIUnlocked(UIUnlockRuleData.UIUnlockRuleId) then
    return false
  end
  if UIUnlockRuleData and not Avatar:CheckSystemUICanOpen(UIUnlockRuleData.UIUnlockRuleId) then
    return false
  end
  local SystemUIData = DataMgr.SystemUI[self.SystemName]
  if SystemUIData and not UIUtils.CheckSystemCanOpen(SystemUIData) then
    return false
  end
  return true
end

function M:LoadUI()
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  local UIManager = GameInstance:GetGameUIManager()
  UIManager:LoadUINew(self.UIName, nil, nil, nil, self.SystemName)
end

return M
