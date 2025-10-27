require("UnLua")
local UIUtils = require("Utils.UIUtils")
local BP_HomeInteractiveComponent_C = Class("BluePrints.Story.Interactive.InteractiveComponent.BP_InteractiveBaseComponent_C")

function BP_HomeInteractiveComponent_C:IsCanInteractive(PlayerActor)
  if not self:IsShowInteractiveComp() then
    return false
  end
  local Owner = self:GetOwner()
  return self.DistanceCheck(Owner, PlayerActor, self.InteractiveDistance) and self.BFaceToACheck(Owner, PlayerActor, self.InteractiveFaceAngle) and not Owner.bHidden
end

function BP_HomeInteractiveComponent_C:BtnClicked(PlayerActor, InPressTimeSeconds)
  self:StartInteractive(PlayerActor)
end

function BP_HomeInteractiveComponent_C:IsShowInteractiveComp()
  local SystemId
  local MainUIs = DataMgr.MainUI
  for _, Info in pairs(MainUIs) do
    if self.SystemName == Info.UIUnlockRuleName then
      SystemId = Info.EnterId
      break
    end
  end
  if not SystemId then
    return true
  end
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(GWorld.GameInstance, 0)
  local SystemData = DataMgr.MainUI[SystemId]
  local SystemUIName
  if SystemData and SystemData.SystemUIName then
    SystemUIName = SystemData.SystemUIName
  else
    return true
  end
  local SystemUI = DataMgr.SystemUI[SystemUIName]
  if not UIUtils.CheckSystemCanOpen(SystemUI) then
    return false
  end
  local UIUnlockRuleName = SystemData.UIUnlockRuleName
  local ret = true
  local UIUnlockRule = DataMgr.UIUnlockRule
  local UIUnlockRuleId = UIUnlockRule[UIUnlockRuleName].UIUnlockRuleId
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return true
  end
  if SystemId == CommonConst.ArmoryEnterId then
    if Player:CanEnterInteractive() and Player:CharacterInTag("Idle") then
      ret = Avatar:CheckSystemUICanOpen(UIUnlockRuleId)
    end
  else
    ret = Avatar:CheckSystemUICanOpen(UIUnlockRuleId)
  end
  local Info = UIUnlockRule[self.SystemName]
  if Avatar and Info then
    ret = Avatar:CheckUIUnlocked(Info.UIUnlockRuleId)
  end
  return ret
end

function BP_HomeInteractiveComponent_C:LoadUI()
  local MainUIs = DataMgr.MainUI
  for _, Info in pairs(MainUIs) do
    if self.SystemName == Info.UIUnlockRuleName then
      UIUtils.OpenSystem(Info.EnterId)
      return
    end
  end
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  local UIManager = GameInstance:GetGameUIManager()
  local Avatar = GWorld:GetAvatar()
  local UnlockInfos = DataMgr.UIUnlockRule
  local Info = UnlockInfos[self.SystemName]
  if Avatar and Info then
    local bUnlocked = Avatar:CheckUIUnlocked(Info.UIUnlockRuleId)
    if bUnlocked then
      self.Overridden.LoadUI(self)
    else
      local Tip = GText(Info.UIUnlockDesc)
      UIManager:ShowUITip(UIConst.Tip_CommonTop, Tip)
    end
  else
    self.Overridden.LoadUI(self)
  end
end

return BP_HomeInteractiveComponent_C
