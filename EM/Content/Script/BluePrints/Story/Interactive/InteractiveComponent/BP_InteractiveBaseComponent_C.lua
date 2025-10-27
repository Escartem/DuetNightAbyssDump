require("UnLua")
require("DataMgr")
local EMCache = require("EMCache.EMCache")
local BP_InteractiveBaseComponent_C = Class()
local InteractiveTypeEnum = {
  Default = 0,
  Quest = 1,
  PickUpAll = 3
}

function BP_InteractiveBaseComponent_C:ReceiveBeginPlay()
  self.Priority = "Normal"
  self.Owner = self:GetOwner()
  if self.CommonUIConfirmID then
    self:InitCommonUIConfirmID(self.CommonUIConfirmID)
  end
end

function BP_InteractiveBaseComponent_C:SetInteractiveName(Name)
  self.InteractiveName = Name
  self.DisplayInteractiveName = GText(Name)
  if self.DisplayInteractiveName == "" then
    self.DisplayInteractiveName = Name
  end
end

function BP_InteractiveBaseComponent_C:DisplayInteractiveBtn(PlayerActor)
  local UIManager = UGameplayStatics.GetGameInstance(self):GetGameUIManager()
  local InteractiveUI = UIManager:LoadUINew(UIConst.InteractiveUIName)
  if not InteractiveUI then
    return
  end
  DebugPrint("1111111111111111", self:GetName(), self.InteractiveDistance)
  InteractiveUI:AddInteractiveItem(self)
  self:SetBtnDisplayed(PlayerActor, true)
  self:RefreshInteractiveBtn(PlayerActor)
end

function BP_InteractiveBaseComponent_C:RefreshInteractiveBtn(PlayerActor)
  local bChanged, bLocked = self:UpdateLockState()
  if not bLocked and not bChanged then
    bChanged = self:UpdateForbiddenState(PlayerActor)
  end
  if bChanged then
    self:UpdateInteractiveUIState()
  end
end

function BP_InteractiveBaseComponent_C:NotDisplayInteractiveBtn(PlayerActor)
  self:SetBtnDisplayed(PlayerActor, false)
  local UIManager = UGameplayStatics.GetGameInstance(self):GetGameUIManager()
  local InteractiveUI = UIManager:GetUIObj(UIConst.InteractiveUIName)
  if not InteractiveUI then
    return
  end
  InteractiveUI:RemoveInteractiveItem(self)
end

function BP_InteractiveBaseComponent_C:OnStartInteractive(PlayerActor, MontageName, MechanismEid)
  local Owner = self:GetOwner()
  if not self:CheckCanEnterOrEixt() then
    return
  end
  if PlayerActor.SetEnterInteractive and 0 ~= MechanismEid then
    PlayerActor.WaitCallBack = true
    PlayerActor:SetEnterInteractive(true, MontageName, Owner.InteractiveTag)
  end
end

function BP_InteractiveBaseComponent_C:OnEndInteractive(PlayerActor, MontageName, MechanismEid)
  local Owner = self:GetOwner()
  if not self:CheckCanEnterOrEixt() then
    return
  end
  if PlayerActor.SetEnterInteractive then
    PlayerActor:SetEnterInteractive(false, MontageName)
  end
end

function BP_InteractiveBaseComponent_C:CheckCanEnterOrEixt()
  if not self:GetOwner().UnitId then
    return false
  end
  local UnitId = self:GetOwner().UnitId
  if not DataMgr.Mechanism[UnitId] and not self:GetOwner():IsMonster() then
    return false
  end
  if not self:GetOwner().MontageName and not self.MontageName then
    return false
  end
  return true
end

function BP_InteractiveBaseComponent_C:GetInteractiveIcon(PlayerActor)
  if self:IsLocked() then
    return "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Lock.T_Interactive_Lock'"
  end
  if self:IsForbidden(PlayerActor) then
    return "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Forbidden.T_Interactive_Forbidden'"
  end
  local Data = DataMgr.CommonUIConfirm[self.CommonUIConfirmID]
  if not Data or not Data.Icon then
    return nil
  end
  local Avatar = GWorld:GetAvatar()
  if Avatar and 1 == Avatar.Sex then
    return Data.IconFemale or Data.Icon
  end
  return Data.Icon
end

function BP_InteractiveBaseComponent_C:GetInteractiveName()
  if self.InteractiveName ~= "" then
    return GText(self.InteractiveName)
  end
  local Data = DataMgr.CommonUIConfirm[self.CommonUIConfirmID]
  if not Data then
    return GText(self.InteractiveName)
  end
  return GText(Data.ConfirmText)
end

function BP_InteractiveBaseComponent_C:GetInteractiveCondition()
  local NeedKey, TotalKey = self:GetInteractiveConditionParam()
  if TotalKey <= 0 then
    return nil
  end
  local RealText = NeedKey .. "/" .. TotalKey
  if NeedKey < TotalKey then
    return "<Warning>" .. RealText .. "</>"
  else
    return "<Highlight>" .. RealText .. "</>"
  end
end

function BP_InteractiveBaseComponent_C:GetInteractiveConditionParam()
  local Data = DataMgr.CommonUIConfirm[self.CommonUIConfirmID]
  if not Data or not Data.InteractiveCondition then
    return nil, -1
  end
  local InteractiveCondition = Data.InteractiveCondition
  local Condition = DataMgr.Condition[InteractiveCondition]
  if not Condition then
    print(_G.LogTag, "Error: Cant find Condition ", InteractiveCondition, " On Unit", self:GetOwner():GetName())
    return nil, -1
  end
  if not Condition.ConditionMap.HaveResource then
    return nil, -1
  end
  local NeedKey = Condition.ConditionMap.HaveResource[1][2]
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    NeedKey = Avatar.Resources:QueryResourceCount(Condition.ConditionMap.HaveResource[1][1])
  end
  return NeedKey, Condition.ConditionMap.HaveResource[1][2]
end

function BP_InteractiveBaseComponent_C:GetRarity()
  return 0
end

function BP_InteractiveBaseComponent_C:IsImportant()
  local Data = DataMgr.CommonUIConfirm[self.CommonUIConfirmID]
  if not Data then
    return false
  end
  return Data.Important
end

function BP_InteractiveBaseComponent_C:InitCommonUIConfirmID(CommonUIConfirmID)
  self.CommonUIConfirmID = CommonUIConfirmID
  local Data = DataMgr.CommonUIConfirm[CommonUIConfirmID]
  if not Data then
    return
  end
  self.InteractiveDistance = Data.InteractiveRadius or self.InteractiveDistance
  self.InteractiveAngle = Data.InteractiveAngle or self.InteractiveAngle
  self.InteractiveFaceAngle = Data.PlayerFaceAngle or self.InteractiveFaceAngle
  self.ListPriority = Data.InteractivePriority or 0
end

function BP_InteractiveBaseComponent_C:CheckInteractiveSucc(PlayerEid)
  return self:CheckInteractiveCondition(PlayerEid)
end

function BP_InteractiveBaseComponent_C:CheckInteractiveCondition(PlayerEid)
  local Data = DataMgr.CommonUIConfirm[self.CommonUIConfirmID]
  if not Data then
    return true
  end
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return true
  end
  local InteractiveCondition = Data.InteractiveCondition
  if not InteractiveCondition then
    return true
  end
  return ConditionUtils.CheckCondition(Avatar, InteractiveCondition)
end

function BP_InteractiveBaseComponent_C:InteractiveFailed()
  local TalkContext = GWorld.GameInstance:GetTalkContext()
  local TalkTriggerId = DataMgr.CommonUIConfirm[self.CommonUIConfirmID].TalkTriggerId
  if TalkTriggerId then
    TalkContext:StartTalk(TalkTriggerId)
  end
  local FailMsg = self:GetOverridenFailMsg()
  FailMsg = FailMsg or DataMgr.CommonUIConfirm[self.CommonUIConfirmID].InteractiveFailMsg
  if FailMsg then
    local UIManager = GWorld.GameInstance:GetGameUIManager()
    UIManager:ShowUITip(UIConst.Tip_CommonTop, GText(FailMsg))
  end
end

function BP_InteractiveBaseComponent_C:CheckPlayerTag(PlayerActor)
  if IsValid(PlayerActor) == false then
    return false
  end
  if not self.InteractiveTag or self.InteractiveTag == "None" then
    return true
  end
  local Owner = self:GetOwner()
  local Res = PlayerActor:CanEnterInteractive() or Owner.AutoSyncProp ~= nil and Owner.AutoSyncProp.CharacterTag == "Defeated"
  return Res
end

function BP_InteractiveBaseComponent_C:IsForbidden()
  return false
end

function BP_InteractiveBaseComponent_C:OnClicked_Forbidden()
end

function BP_InteractiveBaseComponent_C:IsLocked()
  return false
end

function BP_InteractiveBaseComponent_C:OnClicked_Locked()
end

function BP_InteractiveBaseComponent_C:GetUUID()
  return nil
end

function BP_InteractiveBaseComponent_C:GetOverridenFailMsg()
  return self.OverridenFailMsg
end

function BP_InteractiveBaseComponent_C:SetOverridenFailMsg(FailMsg)
  self.OverridenFailMsg = FailMsg
end

function BP_InteractiveBaseComponent_C:UpdateLockState()
  local UUID = self:GetUUID()
  if not UUID then
    return false, false
  end
  local LockStateCache = EMCache:Get("InteractiveLockState", true)
  if not LockStateCache then
    LockStateCache = {
      {
        [UUID] = true
      }
    }
    EMCache:Set("InteractiveLockState", LockStateCache, true)
  end
  local CurrentLockState = self:IsLocked()
  if CurrentLockState ~= LockStateCache[UUID] then
    if false == CurrentLockState then
      local InteractiveUI = UIManager(self):GetUIObj(UIConst.InteractiveUIName)
      if not InteractiveUI then
        return
      end
      InteractiveUI:PlayItemAnimation(self, "UnLock", true)
    end
    LockStateCache[UUID] = CurrentLockState
    EMCache:Set("InteractiveLockState", LockStateCache, true)
    return true, CurrentLockState
  end
  return false, CurrentLockState
end

function BP_InteractiveBaseComponent_C:UpdateForbiddenState(PlayerActor)
  if self.bForbidden == nil then
    self.bForbidden = self:IsForbidden(PlayerActor)
  else
    local bOldForbidden = self.bForbidden
    self.bForbidden = self:IsForbidden(PlayerActor)
    if self.bForbidden ~= bOldForbidden then
      return true
    end
  end
  return false
end

function BP_InteractiveBaseComponent_C:UpdateInteractiveUIState()
  local InteractiveUI = UIManager(self):GetUIObj(UIConst.InteractiveUIName)
  if not InteractiveUI then
    return
  end
  InteractiveUI:UpdateInteractiveItemState(self)
end

function BP_InteractiveBaseComponent_C:GetStars()
  return nil
end

function BP_InteractiveBaseComponent_C:IsLastingInteract()
  return false
end

function BP_InteractiveBaseComponent_C:CanPickUpWithOneClick()
  return false
end

function BP_InteractiveBaseComponent_C:GetShouldHighlight()
  local Data = DataMgr.CommonUIConfirm[self.CommonUIConfirmID]
  if not Data or not Data.HighLight then
    return false
  end
  return true
end

function BP_InteractiveBaseComponent_C:GetQuestID()
  return nil
end

function BP_InteractiveBaseComponent_C:GetSpecialQuestID()
  return nil
end

function BP_InteractiveBaseComponent_C:GetInteractivePriority()
  local ConfirmData = DataMgr.CommonUIConfirm[self:GetCommonUIConfirmID()]
  local Type = InteractiveTypeEnum.Default
  local SubPriority = 0
  if ConfirmData and ConfirmData.InteractivePriority then
    SubPriority = ConfirmData.InteractivePriority * 0.1
  end
  if self:GetQuestID() then
    Type = InteractiveTypeEnum.Quest
    local QusetData = DataMgr.QuestChain[self:GetQuestID()]
    if QusetData and QusetData.QuestChainType then
      local QusetPriorityData = DataMgr.QuestTypePriority[QusetData.QuestChainType]
      if QusetPriorityData and QusetPriorityData.TypePriority then
        SubPriority = QusetPriorityData.TypePriority * 0.1
      end
    end
  elseif ConfirmData and ConfirmData.InteractiveType then
    Type = ConfirmData.InteractiveType
  end
  local FinalPriority = SubPriority
  local TypeData = DataMgr.InteractiveType[Type]
  if TypeData and TypeData.Priority then
    FinalPriority = FinalPriority + TypeData.Priority
  end
  return FinalPriority
end

function BP_InteractiveBaseComponent_C:GetCommonUIConfirmID()
  return self.CommonUIConfirmID
end

function BP_InteractiveBaseComponent_C:GetQuestInteractiveType()
  local Data = DataMgr.CommonUIConfirm[self.CommonUIConfirmID]
  if not Data or not Data.Icon then
    return nil
  end
  if Data.QuestInteractiveType then
    return Data.QuestInteractiveType
  end
  return nil
end

return BP_InteractiveBaseComponent_C
