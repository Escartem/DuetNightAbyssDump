local FSM = require("BluePrints.UI.ControllerFSM")
local MiscUtils = require("Utils.MiscUtils")
local StorylineUtils = require("StoryCreator.StoryLogic.StorylineUtils")

local function IsBattleMainInVisible()
  local BattleMain = UIManager():GetUIObj("BattleMain")
  return not IsValid(BattleMain) or BattleMain.IsPlayOutAnim or not BattleMain:IsVisible()
end

local State = {
  __index = {
    GetNextState = function(self)
      return DataMgr.AfterLoadingFSM[self.StateName].NextState
    end,
    OnAfterEnter = function(AfterLoadingMgr, NowState)
      AfterLoadingMgr:Fallback(NowState)
    end
  },
  New = function(Class, StateName, FuncTable)
    local NewObj = {}
    setmetatable(NewObj, Class)
    
    function NewObj.OnEnter(AfterLoadingMgr)
      try({
        exec = FuncTable.OnEnter,
        catch = function(err)
          DebugPrint(Traceback(ErrorTag, "AfterLoading\230\181\129\231\168\139\229\135\186\233\148\153\228\186\134,\231\156\139\230\151\165\229\191\151\230\156\137trace,\229\135\186\233\148\153\231\138\182\230\128\129\239\188\154%s", AfterLoadingMgr.FSM:Current()))
          LogError(Traceback(ErrorTag, err, true))
          UIManager():DestroyAfterLoadingMgr()
        end
      }, AfterLoadingMgr)
    end
    
    NewObj.StateName = StateName
    if FuncTable.OnAfterEnter then
      NewObj.OnAfterEnter = FuncTable.OnAfterEnter
    end
    if FuncTable.OnLeave then
      NewObj.OnLeave = FuncTable.OnLeave
    end
    if FuncTable.GetNextState then
      NewObj.GetNextState = FuncTable.GetNextState
    end
    return NewObj
  end
}
local StateImpl = Class("BluePrints.Common.TimerMgr")
StateImpl.BeginState = State:New("BeginState", {
  OnEnter = function(AfterLoadingMgr)
    GWorld.NetworkMgr:UpdateNetDisconnectUIConfirm()
    local GameInputSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(GWorld.GameInstance)
    if IsValid(GameInputSubsystem) then
      GameInputSubsystem:DisableInputMode("CommonChangeScene")
    end
    GWorld.StoryMgr:EnableStory()
    local PlayerCharacter = GWorld:GetMainPlayer()
    if PlayerCharacter then
      PlayerCharacter:SetCanInteractiveTrigger(true, "Loading")
    end
    EventManager:FireEvent(EventID.OnCloseLoadingEnableStory)
  end,
  GetNextState = function(self)
    return DataMgr.AfterLoadingFSM[self.StateName].NextState
  end
})
StateImpl.JumpToRogueMain = State:New("JumpToRogueMain", {
  OnEnter = function(AfterLoadingMgr)
    local PlayerCharacter = GWorld:GetMainPlayer()
    local CurDungeonType = WorldTravelSubsystem():GetCurrentDungeonType()
    if CurDungeonType == CommonConst.DungeonType.Abyss and PlayerCharacter then
      PlayerCharacter:DisableBattleWheel()
    end
    local GameState = GameState()
    if GameState and GameState.IsInRegion and GameState:IsInRegion() then
      local ExitDungeonInfo = GWorld.GameInstance:GetExitDungeonData()
      if ExitDungeonInfo then
        GWorld.GameInstance:ClearExitDungeonData()
        if "Abyss" == ExitDungeonInfo.Type then
          local AbyssId = ExitDungeonInfo.AbyssId
          local AbyssLevelId = ExitDungeonInfo.AbyssLevelId
          local AbyssDungeonIndex = ExitDungeonInfo.AbyssDungeonIndex
          PageJumpUtils:JumpToAbyssLevelInfoPage(AbyssId, AbyssLevelId, AbyssDungeonIndex)
        elseif ExitDungeonInfo.Type == "Rouge" then
          PageJumpUtils:JumpToRougeMain("ExitFromRouge")
        elseif ExitDungeonInfo.Type == "TryOut" then
          local CurTabIndex = ExitDungeonInfo.CurTabIndex
          local CurSelectIndex = ExitDungeonInfo.CurSelectIndex
          local ActivityId = ExitDungeonInfo.ActivityId
          PageJumpUtils:JumpToTryOut(CurTabIndex, ActivityId, CurSelectIndex)
        elseif ExitDungeonInfo.Type == "Paotai" then
          local CurTabIndex = ExitDungeonInfo.CurTabIndex
          PageJumpUtils:JumpToPaotai(CurTabIndex)
        elseif ExitDungeonInfo.Type == "FeinaEvent" then
          local CurTabIndex = ExitDungeonInfo.CurTabIndex
          PageJumpUtils:JumpToFeinaEvent(CurTabIndex)
        elseif ExitDungeonInfo.Type == "Depute" then
          local DeputeType = ExitDungeonInfo.DeputeType
          PageJumpUtils:JumpToStyleOfPlaySubUI("NewDeputeRoot", DeputeType)
        end
      end
    end
  end
})
StateImpl.GameplayReward = State:New("GameplayReward", {
  OnEnter = function(AfterLoadingMgr)
  end
})
StateImpl.DungeonUI = State:New("DungeonUI", {
  OnEnter = function(AfterLoadingMgr)
  end
})
StateImpl.SystemUnlock = State:New("SystemUnlock", {
  OnEnter = function(AfterLoadingMgr)
    local Avatar = GWorld:GetAvatar()
    if Avatar then
      Avatar:HandleCloseLoadingEvent_WhileSystemUnlock()
    end
  end
})
StateImpl.TriggerGuide = State:New("TriggerGuide", {
  OnEnter = function(AfterLoadingMgr)
    local DungeonId = GWorld.GameInstance:GetCurrentDungeonId()
    local GameMode = MiscUtils.GameMode()
    if not GWorld.GameInstance:IsNullDungeonId(DungeonId) then
      DebugPrint("SystemGuide Enter Dungeon")
      EventManager:FireEvent(EventID.ExitRegion)
      EventManager:FireEvent(EventID.SystemGuideEnterDungeon, DungeonId)
    elseif nil ~= GameMode and GameMode.IsInRegion and GameMode:IsInRegion() then
      local CurMode = UE4.URuntimeCommonFunctionLibrary.GetInputMode(GWorld.GameInstance:GetWorld())
      DebugPrint("SystemGuide Enter Region", CurMode)
      EventManager:FireEvent(EventID.SystemGuideEnterRegion)
    else
      DebugPrint("ERROR:SystemGuide Not Enter Region And Not Enter Dungeon")
    end
  end,
  GetNextState = function(self, AfterLoadingMgr)
    if AfterLoadingMgr.bGuideEndPending then
      AfterLoadingMgr.bGuideEndPending = nil
      if IsBattleMainInVisible() then
        return self.StateName
      else
        return DataMgr.AfterLoadingFSM[self.StateName].NextState
      end
    end
    if StorylineUtils:IsGuideNodeRunning() or IsBattleMainInVisible() then
      return self.StateName
    else
      return DataMgr.AfterLoadingFSM[self.StateName].NextState
    end
  end
})
StateImpl.OpenForcePopup = State:New("OpenForcePopup", {
  OnEnter = function(AfterLoadingMgr)
    local GameMode = MiscUtils.GameMode()
    local GameState = GameState()
    if nil ~= GameMode and nil ~= GameState and GameState.GameModeType == "Trial" then
      AfterLoadingMgr:Pause()
      UIManager():AddTimer(0.1, function()
        UIManager():LoadUINew("TryOutMain")
      end, false, 0, nil, true)
      return
    end
    local Avatar = GWorld:GetAvatar()
    if Avatar then
      MonthCardController:TryDisplayMonthCardPop()
      UIManager(PlayerCharacter):TryShowPlayerLevelUpInfo({
        CurLevel = Avatar.Level,
        ShowProgresBar = false
      })
    end
  end
})
StateImpl.MainLineQuest = State:New("MainLineQuest", {
  OnEnter = function(AfterLoadingMgr)
    local GameMode = MiscUtils.GameMode()
    local Avatar = GWorld:GetAvatar()
    if Avatar and Avatar.NotifyAvatarRegionAllReady and GameMode and GameMode:IsInRegion() then
      local BattleMainUI = UIManager():GetUIObj("BattleMain")
      if Avatar and 0 ~= Avatar.TrackingQuestChainId and Avatar.TrackingQuestChainId ~= nil and BattleMainUI.Pos_TaskBar then
        BattleMainUI.Pos_TaskBar:SetVisibility(UIConst.VisibilityOp.Visible)
      else
        BattleMainUI.Pos_TaskBar:SetVisibility(UIConst.VisibilityOp.Collapsed)
      end
      Avatar:NotifyAvatarRegionAllReady()
    end
  end,
  OnAfterEnter = function(AfterLoadingMgr, NowState)
    if not GWorld.StoryMgr then
      return
    end
    local WaitOfTimeNodeTable = {}
    GWorld.StoryMgr:GetRunningNodeTableByType("WaitOfTimeNode", WaitOfTimeNodeTable)
    if not table.isempty(WaitOfTimeNodeTable) then
      return
    end
    local TalkNodeTable = {}
    GWorld.StoryMgr:GetRunningNodeTableByType("TalkNode", WaitOfTimeNodeTable)
    if not table.isempty(TalkNodeTable) then
      return
    end
    AfterLoadingMgr:Fallback(NowState)
  end,
  GetNextState = function(self, AfterLoadingMgr)
    if AfterLoadingMgr.bGuideEndPending then
      AfterLoadingMgr.bGuideEndPending = nil
      if IsBattleMainInVisible() then
        return self.StateName
      else
        return DataMgr.AfterLoadingFSM[self.StateName].NextState
      end
    end
    if StorylineUtils:IsGuideNodeRunning() or IsBattleMainInVisible() then
      return self.StateName
    else
      return DataMgr.AfterLoadingFSM[self.StateName].NextState
    end
  end
})
StateImpl.DynamicQuest = State:New("DynamicQuest", {
  OnEnter = function(AfterLoadingMgr)
    local GameMode = MiscUtils.GameMode()
    if GameMode and GameMode.ActivateDynamicQuestEvent then
      GameMode:ActivateDynamicQuestEvent()
    end
  end,
  OnAfterEnter = function(AfterLoadingMgr, NowState)
    if not GWorld.StoryMgr then
      return
    end
    local WaitOfTimeNodeTable = {}
    GWorld.StoryMgr:GetRunningNodeTableByType("WaitOfTimeNode", WaitOfTimeNodeTable)
    if not table.isempty(WaitOfTimeNodeTable) then
      return
    end
    local TalkNodeTable = {}
    GWorld.StoryMgr:GetRunningNodeTableByType("TalkNode", WaitOfTimeNodeTable)
    if not table.isempty(TalkNodeTable) then
      return
    end
    AfterLoadingMgr:Fallback(NowState)
  end,
  GetNextState = function(self, AfterLoadingMgr)
    if AfterLoadingMgr.bGuideEndPending then
      AfterLoadingMgr.bGuideEndPending = nil
      if IsBattleMainInVisible() then
        return self.StateName
      else
        return DataMgr.AfterLoadingFSM[self.StateName].NextState
      end
    end
    if StorylineUtils:IsGuideNodeRunning() or IsBattleMainInVisible() then
      return self.StateName
    else
      return DataMgr.AfterLoadingFSM[self.StateName].NextState
    end
  end
})
StateImpl.EndState = State:New("EndState", {
  OnEnter = function(AfterLoadingMgr)
    UIManager():DestroyAfterLoadingMgr()
  end,
  GetNextState = function(self)
  end
})
local AfterLoadingMgr = Class()

function AfterLoadingMgr.New()
  local NewObj = {}
  setmetatable(NewObj, AfterLoadingMgr)
  NewObj.FSM = FSM.New(NewObj, StateImpl)
  return NewObj
end

function AfterLoadingMgr:Pause()
  self.bPause = true
  DebugPrint(WarningTag, string.format("AfterLoadingMgr \231\138\182\230\128\129\230\156\186\230\154\130\229\129\156\239\188\140\229\189\147\229\137\141\231\138\182\230\128\129\239\188\154%s", self.FSM:Current()))
end

function AfterLoadingMgr:Fallback(State)
  State = State or self.FSM:Current()
  if not self.bPause and self:IsCurrentState(State) then
    DebugPrint(WarningTag, string.format("AfterLoadingMgr \231\138\182\230\128\129\230\156\186\230\178\161\230\156\137\232\162\171\230\154\130\229\129\156\239\188\140\231\187\167\231\187\173\230\137\167\232\161\140 State: %s", State))
    self:Continue()
  end
end

function AfterLoadingMgr:IsCurrentState(State)
  return self.FSM:Current() == State
end

function AfterLoadingMgr:IsEnd()
  local CurrState = self.FSM:Current()
  return "EndState" == CurrState
end

function AfterLoadingMgr:Continue()
  if self.bPause then
    DebugPrint(WarningTag, string.format("AfterLoadingMgr \231\138\182\230\128\129\230\156\186\228\187\142\230\154\130\229\129\156\228\184\173\230\129\162\229\164\141, CurrState: %s", self.FSM:Current()))
  end
  self.bPause = false
  if self:IsEnd() then
    DebugPrint(WarningTag, "AfterLoadingMgr \231\138\182\230\128\129\230\156\186\230\137\167\232\161\140\229\174\140\230\175\149\239\188\129\239\188\129\239\188\129")
    return
  end
  local CurrState = self.FSM:Current()
  if not CurrState then
    DebugPrint(WarningTag, "AfterLoadingMgr \231\138\182\230\128\129\230\156\186\229\188\128\229\167\139\230\137\167\232\161\140\239\188\129\239\188\129\239\188\129")
    self.FSM:Enter("BeginState")
    return
  end
  local NextState = StateImpl[CurrState]:GetNextState(self)
  if NextState then
    if NextState == CurrState then
      DebugPrint(WarningTag, string.format("AfterLoadingMgr GetNextState\228\191\157\230\140\129\229\142\159\231\138\182\239\188\140\230\154\130\229\129\156\229\136\135\230\141\162 CurrState:%s", CurrState))
      return
    end
    DebugPrint(WarningTag, string.format("AfterLoadingMgr \229\136\135\230\141\162\231\138\182\230\128\129\239\188\140\229\137\141\228\184\170\231\138\182\230\128\129\239\188\154%s\239\188\140\228\184\139\228\184\170\231\138\182\230\128\129\239\188\154%s", CurrState, NextState))
    self.FSM:Enter(NextState)
  end
end

return AfterLoadingMgr
