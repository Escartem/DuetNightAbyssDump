require("UnLua")
require("DataMgr")
local BP_DeliveryTempleInteractiveComponent_C = Class("BluePrints.Story.Interactive.InteractiveComponent.BP_InteractiveBaseComponent_C")

function BP_DeliveryTempleInteractiveComponent_C:ReceiveBeginPlay()
  self.Super.ReceiveBeginPlay(self)
  self.Owner = self:GetOwner()
  self.TempleId = 0
  self.LockByCondition = false
  self.ConditionId = 0
end

function BP_DeliveryTempleInteractiveComponent_C:TriggerTick(PlayerActor)
  self.Overridden.TriggerTick(self, PlayerActor)
end

function BP_DeliveryTempleInteractiveComponent_C:IsCanInteractive(PlayerActor)
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    local UIUnlockRule = DataMgr.UIUnlockRule
    local UIUnlockRuleId = UIUnlockRule.Temple.UIUnlockRuleId
    local bUnlocked = Avatar:CheckUIUnlocked(UIUnlockRuleId)
    if not bUnlocked then
      return false
    end
  end
  local Controller = PlayerActor:GetController()
  if Controller:GetStoryModeState() then
    return false
  end
  if self:GetInteractiveName() ~= "" and self.DistanceCheckComponent(self, PlayerActor, self.InteractiveDistance, false) and self.CFaceToACheckComponent(self, PlayerActor, self.InteractiveFaceAngle, false) and self.AFaceToCCheckComponent(PlayerActor, self, self.InteractiveAngle, false) then
    return true
  end
  return false
end

function BP_DeliveryTempleInteractiveComponent_C:UpdateDisplayInteractiveBtn(PlayerActor)
  local bCanInteractive = self:IsCanInteractive(PlayerActor)
  if not PlayerActor:IsMainPlayer() then
    return
  end
  if bCanInteractive and not self:IsBtnDisplayed(PlayerActor) then
    self.Owner:DisplayInteractiveBtn(PlayerActor)
  elseif bCanInteractive and self:IsBtnDisplayed(PlayerActor) then
    self:RefreshInteractiveBtn(PlayerActor)
  elseif false == bCanInteractive and self:IsBtnDisplayed(PlayerActor) then
    self:NotDisplayInteractiveBtn(PlayerActor)
  end
end

function BP_DeliveryTempleInteractiveComponent_C:DisplayInteractiveBtn(PlayerActor)
  local UIManager = UGameplayStatics.GetGameInstance(self):GetGameUIManager()
  local InteractiveUI = UIManager:GetUIObj(UIConst.InteractiveUIName)
  InteractiveUI = InteractiveUI or UIManager:LoadUINew(UIConst.InteractiveUIName)
  if not InteractiveUI then
    return
  end
  InteractiveUI:AddInteractiveItem(self)
  for i = 0, InteractiveUI.ScrollBox_Interactive:GetChildrenCount() - 1 do
    local InteractiveItem = InteractiveUI.ScrollBox_Interactive:GetChildAt(i)
    if InteractiveItem.InteractiveInfo == self then
      local Avatar = GWorld:GetAvatar()
      if not Avatar then
        error("Avatar is nil")
      end
      if not self:IsLocked() and not Avatar.Dungeons[self.TempleId] then
        InteractiveItem.Tag_New:SetVisibility(ESlateVisibility.Visible)
      end
      break
    end
  end
  self:SetBtnDisplayed(PlayerActor, true)
  self:RefreshInteractiveBtn(PlayerActor)
end

function BP_DeliveryTempleInteractiveComponent_C:NotDisplayInteractiveBtn(PlayerActor)
  self:SetBtnDisplayed(PlayerActor, false)
  local UIManager = UGameplayStatics.GetGameInstance(self):GetGameUIManager()
  local InteractiveUI = UIManager:GetUIObj(UIConst.InteractiveUIName)
  if not InteractiveUI then
    return
  end
  InteractiveUI:RemoveInteractiveItem(self)
end

function BP_DeliveryTempleInteractiveComponent_C:GetInteractiveName()
  if 0 ~= self.TempleId then
    local DungeonInfo = DataMgr.Dungeon[self.TempleId]
    if not DungeonInfo then
      error("Region\232\161\168\228\184\173\233\133\141\231\189\174\228\186\134\228\184\141\229\173\152\229\156\168\231\154\132\231\165\158\229\186\153ID\239\188\140\n\233\148\153\232\175\175\231\154\132\231\165\158\229\186\153ID\239\188\154" .. self.TempleId)
    end
    return GText(DungeonInfo.DungeonName)
  end
  return ""
end

function BP_DeliveryTempleInteractiveComponent_C:StartInteractive(PlayerActor)
  if self:IsForbidden() then
    return
  end
  if self:IsCanInteractive(PlayerActor) then
    local DungeonInfo = DataMgr.Dungeon[self.TempleId]
    local UIManager = UGameplayStatics.GetGameInstance(self):GetGameUIManager()
    local PopupId = 100117
    local Params = {}
    Params.RightCallbackObj = self
    Params.RightCallbackFunction = self.EnterTemple
    Params.ShortText = string.format(GText("UI_COMMONPOP_TEXT_100117"), GText(DungeonInfo.DungeonName))
    UIManager:ShowCommonPopupUI(PopupId, Params, self)
    self.Owner:NotDisplayInteractiveBtn(PlayerActor)
  end
end

function BP_DeliveryTempleInteractiveComponent_C:EnterTemple()
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    local function Callback(Ret)
      if 0 ~= Ret then
        UIManager(self):ShowUITip(UIConst.Tip_CommonTop, GText("UI_Disabled_Des_Temple"))
      end
    end
    
    local bIsInTeam = Avatar:IsInTeam()
    if bIsInTeam then
      Avatar:EnterDungeon(self.TempleId, CommonConst.DungeonNetMode.Standalone, function(RetCode, ...)
        local bCanEnter = self.HandleEnterDungeonRetCode(RetCode, ...)
        if bCanEnter then
          UIManager(self):LoadUINew("DungeonMatchTimingBar", self.TempleId, Const.DUNGEON_MATCH_BAR_STATE.SPONSOR_WAITING_CONFIRM, false)
        end
      end)
    else
      Avatar:EnterDungeon(self.TempleId, nil, Callback)
    end
  end
end

function BP_DeliveryTempleInteractiveComponent_C.HandleEnterDungeonRetCode(RetCode, ...)
  ErrorCode:Check(RetCode)
  if RetCode == ErrorCode.RET_SUCCESS then
    return true
  else
    TeamController:DoWhenEnterDungeonCheckFailed(RetCode, ...)
    EventManager:FireEvent(EventID.TeamMatchTimingEnd)
    return false
  end
end

function BP_DeliveryTempleInteractiveComponent_C:BtnPressed(PlayerActor)
  if self:IsLocked() then
    self:LockInteractive()
    return
  end
  self:StartInteractive(PlayerActor)
end

function BP_DeliveryTempleInteractiveComponent_C:OnClicked_Forbidden()
  UIManager(self):ShowUITip(UIConst.Tip_CommonTop, GText("UI_Disabled_Des_Temple"))
end

function BP_DeliveryTempleInteractiveComponent_C:GetUUID()
  return self:GetClass():GetName() .. tostring(self.TempleId)
end

function BP_DeliveryTempleInteractiveComponent_C:IsLocked()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    error("Avatar is nil")
  end
  local PreTempleId = self.Owner.TempleOrder[self.TempleId]
  if nil ~= PreTempleId and Avatar.Dungeons and not Avatar.Dungeons[PreTempleId] then
    return true
  end
  if nil ~= PreTempleId and Avatar.Dungeons and Avatar.Dungeons[PreTempleId] and not Avatar.Dungeons[PreTempleId].IsPass then
    return true
  end
  local DungeonInfo = DataMgr.Dungeon[self.TempleId]
  local Conditions = DungeonInfo.Condition
  if Conditions and #Conditions > 0 and not ConditionUtils.CheckCondition(Avatar, Conditions[1]) then
    self.LockByCondition = true
    self.ConditionId = Conditions[1]
    return true
  end
  return false
end

function BP_DeliveryTempleInteractiveComponent_C:IsForbidden()
  local Avatar = GWorld:GetAvatar()
  if DataMgr.Temple[self.TempleId] then
    return Avatar:IsInTeam() or Avatar.InSpecialQuest
  end
  return Avatar.InSpecialQuest
end

function BP_DeliveryTempleInteractiveComponent_C:LockInteractive()
  local Avatar = GWorld:GetAvatar()
  if self.LockByCondition and self.ConditionId > 0 then
    UIManager(self):ShowUITip(UIConst.Tip_CommonTop, string.format(GText("UI_Temple_Lockedcondition"), GText("Name_" .. self.ConditionId)))
  else
    UIManager(self):ShowUITip(UIConst.Tip_CommonTop, GText("UI_Tosat_Temple_Locked"))
  end
end

function BP_DeliveryTempleInteractiveComponent_C:GetInteractiveIcon(PlayerActor)
  if self:IsLocked() then
    return "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Lock.T_Interactive_Lock'"
  end
  if self:IsForbidden() then
    return "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Forbidden.T_Interactive_Forbidden'"
  end
  return nil
end

function BP_DeliveryTempleInteractiveComponent_C:GetStars()
  if self:IsLocked() or self:IsForbidden() then
    return nil
  end
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    error("Avatar is nil")
  end
  if self.TempleId <= 0 then
    return nil
  end
  local TempleInfo = DataMgr.Temple[self.TempleId] or DataMgr.Party[self.TempleId]
  if Avatar.Dungeons[self.TempleId] then
    if not TempleInfo.RewardId then
      return nil
    elseif 1 == #TempleInfo.RewardId and Avatar.Dungeons[self.TempleId].IsPass then
      return -1
    elseif 1 == #TempleInfo.RewardId and not Avatar.Dungeons[self.TempleId].IsPass then
      return -2
    else
      return Avatar.Dungeons[self.TempleId].MaxStar
    end
  elseif #TempleInfo.RewardId <= 0 then
    return nil
  elseif 1 == #TempleInfo.RewardId then
    return -2
  else
    return 0
  end
end

function BP_DeliveryTempleInteractiveComponent_C:SetTempleId(Id)
  self.TempleId = Id
end

return BP_DeliveryTempleInteractiveComponent_C
