require("UnLua")
local BP_TrialComponent_C = Class({
  "BluePrints.Common.TimerMgr"
})

function BP_TrialComponent_C:InitTrialEventInfo()
  self.CharTrialId = self.GameMode.PreInitInfo.CharTrialId
end

function BP_TrialComponent_C:InitTrialDungeonInfo()
  self.TrialDungeonInfo = DataMgr.Trial[self.CharTrialId]
  if not self.TrialDungeonInfo then
    DebugPrint("\230\151\160\230\179\149\230\137\190\229\136\176\229\189\147\229\137\141\232\167\146\232\137\178\232\175\149\231\142\169\228\191\161\230\129\175\227\128\130\232\175\187\229\133\165\232\167\146\232\137\178Id\239\188\154", self.CharTrialId)
    return
  end
  self.TaskList = self.TrialDungeonInfo.Tasks
end

function BP_TrialComponent_C:UpdateTaskInfo(TaskIndex)
  self.CurrentTaskInfo = DataMgr.TrialTask[self.TaskList[TaskIndex]]
  if not self.CurrentTaskInfo then
    DebugPrint("thy   \232\175\149\231\142\169\228\187\187\229\138\161\228\191\161\230\129\175\228\184\141\229\173\152\229\156\168\239\188\140\232\175\183\230\163\128\230\159\165\228\187\165\228\184\139\229\156\176\230\150\185\230\152\175\229\144\166\230\156\137\233\151\174\233\162\152\239\188\129 1.\228\188\160\229\133\165\229\143\130\230\149\176TaskIndex(\228\187\187\229\138\161\231\188\150\229\143\183) 2.Trial\232\161\168\228\184\173\229\175\185\229\186\148\232\167\146\232\137\178\231\154\132\232\175\149\231\142\169\228\187\187\229\138\161\229\136\151\232\161\168 3.TrialTask\232\161\168\228\184\173\230\152\175\229\144\166\229\140\133\229\144\1712\228\184\173\231\154\132TaskId")
  end
  self.TaskIndex = TaskIndex
  self.WidgetPath = self.CurrentTaskInfo.WidgetPath
  self.TexturePath = self.CurrentTaskInfo.TexturePath
  self.TextTitle = self.CurrentTaskInfo.TextTitle
  self.TextMap = self.CurrentTaskInfo.TextMap
  self.IsKillMonsterTask = self.CurrentTaskInfo.IsKillMonsterTask
  if self.IsKillMonsterTask then
    self.MonsterSpawnId = self.CurrentTaskInfo.MonsterSpawnId
    self.TargetNum = self.CurrentTaskInfo.TargetNum
    DebugPrint("thy     self.TargetNum", self.TargetNum)
    self.GameMode.EMGameState:SetTrialKilledNum(0)
    self.GameMode.EMGameState:SetTrialTotalNum(self.TargetNum)
    self.GameMode.EMGameState:OnRep_TrialKilledNum()
    self:HideOrShowProgress(true)
  end
end

function BP_TrialComponent_C:InitTrialComponent()
  self.GameMode = self:GetOwner()
  self.Player = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  self.NowGuideEid = nil
  self.HasGuideUpdateRequest = false
  self.IsCompleteTrial = false
  self:InitTrialEventInfo()
  self:InitTrialDungeonInfo()
end

function BP_TrialComponent_C:ShowArmory()
  local QuestRoleId = DataMgr.CharTrial[self.CharTrialId].QuestRoleId
  local Avatar = GWorld:GetAvatar()
  local SquadInfo, TempAvatar = AvatarUtils:GetSquadInfoByQuestRoleId(QuestRoleId, Avatar)
  local Params = {
    IsPreviewMode = true,
    EPreviewSceneType = CommonConst.EPreviewSceneType.PreviewCommon,
    IsCharacterTrialMode = true,
    Avatar = TempAvatar
  }
  UIUtils.GenerateArmoryPreviewParamsBySquadInfo(Params, SquadInfo)
  UIManager(self):LoadUINew("ArmoryDetail", Params)
end

function BP_TrialComponent_C:ShowTrialTask(TaskIndex)
  DebugPrint("THy    TaskIndex", TaskIndex)
  self:UpdateTaskInfo(TaskIndex)
  self.GameMode:NotifyClientShowDungeonTask(self.WidgetPath, self.TexturePath, self.TextTitle, self.TextMap)
  if self.IsKillMonsterTask then
    local MonsterSpawnArr = TArray(0)
    for index, value in pairs(self.MonsterSpawnId) do
      MonsterSpawnArr:Add(self.MonsterSpawnId[index])
    end
    DebugPrint("THy    TriggerCreateMonsterSpawn")
    self.GameMode:TriggerCreateMonsterSpawn(MonsterSpawnArr)
    self:InitGuideUpdateTimerLogic()
    local BattleProgress = UIManager(self):GetUIObj("Trial_BattleProgress")
    if BattleProgress then
      DebugPrint("BattleProgress is show")
      BattleProgress:SetTrialBattleVisibility(true)
    end
  end
end

function BP_TrialComponent_C:InitTrialBaseInfo()
  DebugPrint("thy   InitTrialBaseInfo------InitGuideUpdateTimerLogic")
end

function BP_TrialComponent_C:InitGuideUpdateTimerLogic()
  self.GuideTimerHandle_DetectFault = "Handle_DetectFault"
  self.GuideTimerInterval_AutoUpdate = DataMgr.GlobalConstant.TrialGuideInterval.ConstantValue or 5
  self:AddGuideTimer_DetectFault()
  self.HasGuideUpdateRequest = false
  self:AddGuideTimer_AutoUpdate()
end

function BP_TrialComponent_C:AddGuideTimer_AutoUpdate()
  if self.Player then
    self:AddTimer(self.GuideTimerInterval_AutoUpdate, self.OnTimerEnd_AutoUpdate, true, 0, "Handle_AutoUpdate", nil, self.Player.Eid)
  end
end

function BP_TrialComponent_C:OnTimerEnd_AutoUpdate()
  if self.Player then
    DebugPrint("TrialComponent: \232\135\170\229\138\168\230\155\180\230\150\176RemoveGuideEid \232\162\171Remove\231\154\132\230\140\135\229\188\149\231\130\185Eid: " .. tostring(self.NowGuideEid) .. "  Player Eid: " .. tostring(self.Player.Eid))
    self.GameMode.EMGameState:RemoveGuideEid(self.NowGuideEid, self.Player.Eid)
    self:TryUpdateGuidePoint()
  end
end

function BP_TrialComponent_C:AddGuideTimer_LimitCalls()
  if self.Player then
    self:AddTimer(1, self.OnTimerEnd_LimitCalls, false, 0, "Handle_LimitCalls", nil, self.Player.Eid)
  end
end

function BP_TrialComponent_C:OnTimerEnd_LimitCalls()
  if self.HasGuideUpdateRequest then
    self:UpdateNearestMonsterGuide()
    self.HasGuideUpdateRequest = false
  end
end

function BP_TrialComponent_C:AddGuideTimer_DetectFault()
  self:AddTimer(2, self.OnTimerEnd_DetectFault, true, 0, self.GuideTimerHandle_DetectFault)
end

function BP_TrialComponent_C:OnTimerEnd_DetectFault()
  if self:CheckGuideLogicHasFault() then
    self:TryUpdateGuidePoint()
  end
end

function BP_TrialComponent_C:CheckGuideLogicHasFault()
  if not self.Player then
    return true
  end
  if not self.NowGuideEid then
    return true
  end
  if not self.GameMode.EMGameState:ContainsGuideEid(self.NowGuideEid, self.Player.Eid) then
    return true
  end
  return false
end

function BP_TrialComponent_C:TryUpdateGuidePoint()
  if self:IsExistTimer("Handle_LimitCalls") then
    self.HasGuideUpdateRequest = true
  else
    self:UpdateNearestMonsterGuide()
    self:AddGuideTimer_LimitCalls()
  end
end

function BP_TrialComponent_C:OnUnitDeadEvent(MonsterC)
  if not IsValid(MonsterC) then
    return
  end
  if not MonsterC:IsRealMonster() then
    return
  end
  if not self.Player then
    return
  end
  self:AddTrialKilledNum(1)
  self:CheckTargetNum()
  self.GameMode.EMGameState:RemoveGuideEid(self.NowGuideEid, self.Player.Eid)
  self:TryUpdateGuidePoint()
  self:AddGuideTimer_AutoUpdate()
  DebugPrint("TrialComponent: OnUnitDeadEvent", MonsterC:GetName(), MonsterC.Eid, self.Player.Eid)
end

function BP_TrialComponent_C:AddTrialKilledNum(Num)
  self.GameMode.EMGameState:SetTrialKilledNum(self.GameMode.EMGameState.TrialKilledNum + Num)
  if IsStandAlone(self) then
    self.GameMode.EMGameState:OnRep_TrialKilledNum()
  end
end

function BP_TrialComponent_C:UpdateNearestMonsterGuide()
  if not self.Player then
    DebugPrint("thy ERROR:  self.Player is nil")
    return
  end
  local MonsterEid = self.GameMode:GetNearestMonsterEid(self.Player)
  if nil ~= MonsterEid and MonsterEid > 0 then
    self.NowGuideEid = MonsterEid
    self.GameMode.EMGameState:AddGuideEid(MonsterEid, self.Player.Eid)
    DebugPrint("TrialComponent: \229\183\178\230\136\144\229\138\159\230\183\187\229\138\160\230\140\135\229\188\149\231\130\185 \230\140\135\229\188\149\231\130\185Eid: " .. MonsterEid .. "  Player Eid: " .. self.Player.Eid)
  else
    DebugPrint("TrialComponent: Error  \229\189\147\229\137\141\229\156\186\228\184\138\230\137\190\228\184\141\229\136\176\230\128\170\231\137\169!")
  end
end

function BP_TrialComponent_C:ClearGuideUpdateTimerLogic()
  if self.Player then
    self.GameMode.EMGameState:RemoveGuideEid(self.NowGuideEid, self.Player.Eid)
    self.NowGuideEid = nil
    self:RemoveTimer(self.GuideTimerHandle_DetectFault)
    self.GameMode.EMGameState:ClearGuideEid(self.Player.Eid)
    self:RemoveTimer("Handle_AutoUpdate")
    self:RemoveTimer("Handle_LimitCalls")
  end
end

function BP_TrialComponent_C:CheckTargetNum()
  self.TargetNum = self.TargetNum - 1
  if self.TargetNum <= 0 and not self.IsCompleteTrial then
    local TryOutTips = UIManager(self):LoadUINew("TryOut_Victory", GText("UI_CharTrial_FinishTitle"), GText("UI_CharTrial_FinishText"), GText("UI_TRAIN_CLOSE"))
    TryOutTips.Btn_FullScreen.OnClicked:Add(self, function()
      AudioManager(self):SetEventSoundParam(nil, "TryOut_Victory", {ToEnd = 1})
    end)
    AudioManager(self):PlayUISound(nil, "event:/ui/common/complete_trial_level_panel_show", "TryOut_Victory", nil)
    self.IsCompleteTrial = true
    self.GameMode:TriggerGameModeEvent("OnAchieveTarget")
  end
end

function BP_TrialComponent_C:DestroyAllMonsterAndRuleByUnitId()
  local MonsterSpawnArr = TArray(0)
  for index, value in pairs(self.MonsterSpawnId) do
    DebugPrint("thy     OnPlayerDead and DestroyMonsterByUnitSpawnId", self.MonsterSpawnId[index])
    MonsterSpawnArr:Add(self.MonsterSpawnId[index])
  end
  DebugPrint("thy     OnPlayerDead and DestroyMonsterByUnitSpawnId")
  self.GameMode:TriggerMonsterSpawn(ETriggerMonsterSpawnType.DestroyAll, MonsterSpawnArr)
end

function BP_TrialComponent_C:ResetMechanism()
  local MechanismTable = self.GameMode.EMGameState.MechanismMap:FindRef("MiniGame").Array:ToTable()
  local Mechanism = MechanismTable[1]
  if not Mechanism then
    return
  end
  DebugPrint("thy MechanismName: ", Mechanism:GetName())
  local StaticCreatorArray = TArray(0)
  StaticCreatorArray:Add(490121)
  self.GameMode:TriggerInactiveStaticCreator(StaticCreatorArray)
  self.GameMode.EMGameState.MechanismMap:FindRef("MiniGame"):RemoveAt(0)
  self.GameMode:TriggerActiveStaticCreator(StaticCreatorArray)
  self:HideOrShowProgress(false)
end

function BP_TrialComponent_C:HideOrShowProgress(bShow)
  local ProgressUI = UIManager(self):GetUIObj("Trial_BattleProgress")
  if ProgressUI then
    if bShow then
      ProgressUI:SetVisibility(ESlateVisibility.Visibie)
    else
      ProgressUI:SetVisibility(ESlateVisibility.Collapsed)
    end
  end
end

function BP_TrialComponent_C:RemoveAllGuideEids()
  if self.Player then
    self.GameMode.EMGameState:RemoveGuideEid(self.NowGuideEid, self.Player.Eid)
  end
end

function BP_TrialComponent_C:OnPlayerDead()
  if 3 == self.TaskIndex then
    return
  end
  self:ResetMechanism()
  self:RemoveAllGuideEids()
  self:DestroyAllMonsterAndRuleByUnitId()
  self:ShowTrialTask(1)
end

return BP_TrialComponent_C
