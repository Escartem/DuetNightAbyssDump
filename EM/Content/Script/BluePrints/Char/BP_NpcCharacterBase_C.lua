require("UnLua")
local ItemUtils = require("Utils.ItemUtils")
local CommonConst = require("CommonConst")
local UIUtils = require("Utils.UIUtils")
local GMVariable = require("BluePrints.UI.GMInterface.GMVariable")
local BP_NpcCharacterBase_C = Class({
  "BluePrints.Char.BP_AICharacterBase_C",
  "BluePrints.Combat.Components.MonsterInitLogic"
})
BP_NpcCharacterBase_C._components = {}

function BP_NpcCharacterBase_C:Initialize(Initializer)
  self.bIsBossInPart = false
end

function BP_NpcCharacterBase_C:ReceiveBeginPlay()
  BP_NpcCharacterBase_C.Super.ReceiveBeginPlay(self)
  self.MonBattleComponentTickTime = 0.1
  self.MonBattleComponentRemainTime = self.MonBattleComponentTickTime
end

function BP_NpcCharacterBase_C:TryResumeRootMotionFromPush()
  if not self.bBePushed and self:GetRootMotionTagState(ESourceTags.ApplyPush) then
    self:EnableRootMotion(ESourceTags.ApplyPush)
  end
end

function BP_NpcCharacterBase_C:GetBlueprintPath()
  return self.Data.UnitBPPath
end

function BP_NpcCharacterBase_C:OnEMActorDestroy_Lua(DestroyReason)
  local GameMode = UGameplayStatics.GetGameMode(self)
  if GameMode then
    GameMode:GetRegionDataMgrSubSystem():DeadRegionActorData(self, DestroyReason, GameMode:GetActorLevelName(self))
  end
  self:CommonOnEMActorDestroy(DestroyReason)
  if IsAuthority(self) then
    self:ServerOnEMActorDestroy(DestroyReason)
  end
  if (IsClient(self) or IsStandAlone(self)) and self.TeammateUI then
    local BattleMain = UIManager(self):GetUIObj("BattleMain")
    if BattleMain then
      BattleMain:RemoveTeammateUI(self.TeammateUI)
    end
    self.TeammateUI = nil
  end
end

function BP_NpcCharacterBase_C:Recovery(...)
  BP_NpcCharacterBase_C.Super.Recovery(self, ...)
  self:SetCharacterTagIdle()
end

function BP_NpcCharacterBase_C:SetIsFallTrigger()
  self.IsFallTrigger = true
end

function BP_NpcCharacterBase_C:LeaveHitFlyTag()
end

function BP_NpcCharacterBase_C:OnTalkEnableMonsterSpawn()
  self:SetWaitInitTag(false, Const.CharWaitInitTag.HideInTalk)
  EventManager:RemoveEvent(EventID.TalkEnableMonsterSpawn, self)
end

function BP_NpcCharacterBase_C:ReceiveEndPlay(EndPlayReason)
  EventManager:RemoveEvent(EventID.TalkEnableMonsterSpawn, self)
  GWorld.GameInstance.GlobalLockOnTargets:Remove(self.Eid)
end

function BP_NpcCharacterBase_C:CallSuperFunction(FuncName, ...)
  BP_NpcCharacterBase_C.Super[FuncName](self, ...)
end

function BP_NpcCharacterBase_C:GetManualItemId()
  return -1
end

function BP_NpcCharacterBase_C:CommonOnEMActorDestroy(DestroyReason)
  EventManager:RemoveEvent(EventID.TalkEnableMonsterSpawn, self)
  if DestroyReason == EDestroyReason.EngineDestroy then
    return
  end
  self:ClearFXComponent()
  self.GameplayTagsTable = nil
end

AssembleComponents(BP_NpcCharacterBase_C)
return BP_NpcCharacterBase_C
