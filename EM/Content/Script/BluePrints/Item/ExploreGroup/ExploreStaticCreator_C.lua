require("UnLua")
local M = Class("BluePrints.Common.TimerMgr")
local ClientEventUtils = require("BluePrints.Common.ClientEvent.ClientEventUtils")
local TaskUtils = require("BluePrints.UI.TaskPanel.TaskUtils")

function M:ReceiveEndPlay(Respon)
  self.Overridden.ReceiveEndPlay(self, Respon)
  self:CleanTimer()
end

function M:IsInBigWorld()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return false
  end
  return Avatar:IsRealInBigWorld()
end

function M:TryDeactive()
  for i, v in pairs(self.StaticCreatorMap) do
    v:RegionDestroyAllExploreGroupData(false, EDeathReason.NoReason, EDestroyReason.RegionExploreGroup, true)
  end
end

function M:TryActive()
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  local SubRegionId = GameMode:GetRegionIdByLocation(self:K2_GetActorLocation())
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    Avatar:ExploreIdActive(self.ExploreGroupId, SubRegionId)
  end
end

function M:TryCompleteLimit()
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    Avatar:ExploreIdCompleteLimit(self.ExploreGroupId)
  end
end

function M:TryComplete()
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    Avatar:ExploreIdComplete(self.ExploreGroupId, true)
  end
end

function M:TrySpecialActive()
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    Avatar:SetExploreSpecialActiveState(self.ExploreGroupId)
  end
end

function M:AddRemainLimitTime(AddTime, MobileAddTime)
  local RealAddTime = AddTime
  if CommonUtils.GetDeviceTypeByPlatformName(self) == "Mobile" then
    RealAddTime = MobileAddTime
  end
  if 0 == RealAddTime then
    return
  end
  self.RemainLimitTime = self.RemainLimitTime + RealAddTime
  local TimeItem = UIManager(self):GetUIObj("DungeonCaptureFloat")
  if TimeItem then
    TimeItem:AddRemainingTime(RealAddTime)
  end
end

function M:ReceiveOnExploreGroupReset()
  local Components = self:K2_GetComponentsByClass(UExploreSplineComponent:StaticClass())
  if Components then
    for _, SplineComponent in pairs(Components) do
      SplineComponent:ResetSpline()
    end
  end
  self.Overridden.ReceiveOnExploreGroupReset(self)
end

function M:ReceiveOnExploreGroupResetUI()
  EventManager:RemoveEvent(EventID.CharDie, self)
  local TimeItem = UIManager(self):GetUIObj("DungeonCaptureFloat")
  if TimeItem and TimeItem.SelfActor and TimeItem.AnotherActor then
    TimeItem:RemainingDistance(TimeItem.SelfActor, TimeItem.AnotherActor)
  else
    UIManager(self):UnLoadUI("DungeonCaptureFloat")
  end
  if CommonUtils.GetDeviceTypeByPlatformName(self) == "PC" then
    local BattleMain = UIManager(self):GetUIObj("BattleMain")
    if BattleMain then
      local DynamicEventUI = BattleMain:GetOrAddDynamicEventWidget()
      DynamicEventUI:StopListeningForInputAction("QuitChallenge", EInputEvent.IE_Pressed)
    end
  end
  local DynamicEventIndicator = UIManager(self):GetUIObj("DynamicEventIndicator")
  if nil ~= DynamicEventIndicator then
    DynamicEventIndicator.Main:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  end
  if self.IsHideWorldTask then
    local BattleMain = UIManager(self):GetUIObj("BattleMain")
    if BattleMain then
      BattleMain.VB_View:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
      local DynamicEventUI = BattleMain:GetOrAddDynamicEventWidget()
      local Avatar = GWorld:GetAvatar()
      if not Avatar then
        return
      end
      DynamicEventUI:PlayAnimation(DynamicEventUI.Challenge_Out)
      DynamicEventUI:AddTimer(1.0, function()
        DynamicEventUI:RemoveTimer("DelayTitleUnfold")
        if ClientEventUtils:GetCurrentDoingDynamicEvent() then
          DynamicEventUI:PlayAnimation(DynamicEventUI.In)
        end
        if DynamicEventUI:IsListeningForInputAction("QuitChallenge") then
          DynamicEventUI:StopListeningForInputAction("QuitChallenge", EInputEvent.IE_Pressed)
        end
        if DynamicEventUI.ExplorationChallenge:IsListeningForInputAction("ExploraChallengeQuitL") then
          DynamicEventUI.ExplorationChallenge:StopListeningForInputAction("ExploraChallengeQuitL", EInputEvent.IE_Pressed)
          DynamicEventUI.ExplorationChallenge:StopListeningForInputAction("ExploraChallengeQuitL", EInputEvent.IE_Released)
        end
        if DynamicEventUI.ExplorationChallenge:IsListeningForInputAction("ExploraChallengeQuitR") then
          DynamicEventUI.ExplorationChallenge:StopListeningForInputAction("ExploraChallengeQuitR", EInputEvent.IE_Pressed)
          DynamicEventUI.ExplorationChallenge:StopListeningForInputAction("ExploraChallengeQuitR", EInputEvent.IE_Released)
        end
        if nil ~= BattleMain and nil ~= BattleMain.Pos_TaskBar and 0 ~= BattleMain.Pos_TaskBar:GetChildrenCount() then
          local TrackingQuestChain = Avatar.TrackingQuestChainId
          local TaskBarWidget = BattleMain.Pos_TaskBar:GetChildAt(0)
          if nil ~= TaskBarWidget then
            if 0 ~= TrackingQuestChain then
              if CommonUtils.GetDeviceTypeByPlatformName(self) == "PC" then
                TaskBarWidget.Tips:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
              else
                TaskBarWidget.Tips:SetVisibility(ESlateVisibility.Collapsed)
              end
              if TaskBarWidget.VBox_SubTasks:GetChildrenCount() > 0 then
                TaskBarWidget.VBox_SubTasks:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
              end
            end
            TaskBarWidget.IsInExplore = false
            if CommonUtils.GetDeviceTypeByPlatformName(self) == "PC" then
              TaskBarWidget:PlayAnimation(TaskBarWidget.Tooltip_In)
            end
          end
        end
      end, false, 0, "DelayTitleUnfold", false)
      self.IsHideWorldTask = false
    end
  end
end

function M:GMReceiveOnExploreGroupResetUI()
  if self.LimitTime ~= nil and self.LimitTime > 0 then
    local GameState = UE4.UGameplayStatics.GetGameState(self)
    GameState.ActiveLimitTimeExploreGroup = 0
  end
  local LoadingUI = GWorld.GameInstance:GetLoadingUI()
  if not LoadingUI then
    UIManager(self):LoadUINew("ExploreToastFail", "UI_LIMITEXPLORE_FAIL")
  end
  self:ReceiveOnExploreGroupResetUI()
end

function M:ReceiveOnExploreGroupSuccess(bShowToast)
  self:UpdateExploreData("bGroupInLimit", false)
  self:CleanDelayActions()
  local UIObjs = MissionIndicatorManager:GetIndicatorUIObjBySTLType("Dynamic")
  if not IsEmptyTable(UIObjs) then
    for _, UI in pairs(UIObjs) do
      if UI then
        UI:Show("ExploreLimit")
      end
    end
  end
  if self.LimitTime ~= nil and self.LimitTime > 0 then
    local GameState = UE4.UGameplayStatics.GetGameState(self)
    GameState.ActiveLimitTimeExploreGroup = 0
  end
  self.Overridden.ReceiveOnExploreGroupSuccess(self, bShowToast)
  local LoadingUI = GWorld.GameInstance:GetLoadingUI()
  if not LoadingUI and bShowToast then
    UIManager(self):LoadUINew("ExploreToastSuccess", "UI_LIMITEXPLORE_SUCCESS")
  end
  self:ReceiveOnExploreGroupResetUI()
end

function M:ReceiveOnExploreGroupFailed()
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    Avatar:ResetingExplore(self.ExploreGroupId, self.RegionId)
  end
  self:CleanTimer()
  self:CleanDelayActions()
  local UIObjs = MissionIndicatorManager:GetIndicatorUIObjBySTLType("Dynamic")
  if not IsEmptyTable(UIObjs) then
    for _, UI in pairs(UIObjs) do
      if UI then
        UI:Show("ExploreLimit")
      end
    end
  end
  if self.LimitTime > 0 then
    local GameState = UE4.UGameplayStatics.GetGameState(self)
    GameState.ActiveLimitTimeExploreGroup = 0
  end
  self.Overridden.ReceiveOnExploreGroupFailed(self)
  local LoadingUI = GWorld.GameInstance:GetLoadingUI()
  if not LoadingUI then
    UIManager(self):LoadUINew("ExploreToastFail", "UI_LIMITEXPLORE_FAIL")
  end
  self:ReceiveOnExploreGroupResetUI()
end

function M:ReceiveOnExploreLimitStarted(Title, Des, TotalTargetNum)
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  if 0 ~= GameState.ActiveLimitTimeExploreGroup then
    print(_G.LogTag, "LXZ TryActive LimitTimeExploreGroup", self.ExploreGroupId, "Failed,", GameState.ActiveLimitTimeExploreGroup, "Has Actived")
    return
  end
  GameState.ActiveLimitTimeExploreGroup = self.ExploreGroupId
  self:UpdateExploreData("bGroupInLimit", true)
  UIManager(self):LoadUINew("ExploreToastTips", "UI_LIMITEXPLORE_START")
  local TimeItem = UIManager(self):GetUIObj("DungeonCaptureFloat")
  if TimeItem then
    TimeItem:OnLoaded(self.RemainLimitTime, DataMgr.GlobalConstant.ExploreCountdownPoint.ConstantValue, false, "Explore")
  else
    TimeItem = UIManager(self):LoadUINew("DungeonCaptureFloat", self.RemainLimitTime, DataMgr.GlobalConstant.ExploreCountdownPoint.ConstantValue, false, "Explore")
  end
  if TimeItem and TimeItem.SelfActor and TimeItem.AnotherActor then
    TimeItem:PauseRemainingDistance()
  end
  if TimeItem then
    TimeItem.TaskTitle:SetText(GText("UI_LIMITEXPLORE_TIME"))
    TimeItem:UIStateChange_OnTarget()
    if CommonUtils.GetDeviceTypeByPlatformName(self) == "Mobile" then
      TimeItem.Group_BtnCancel:SetVisibility(ESlateVisibility.Visible)
      TimeItem.Btn_Cancel:BindEventOnClicked(self, self.OnPressQuitChallenge)
    end
  end
  self.IsHideWorldTask = false
  if "" ~= Title or "" ~= Des then
    self.IsHideWorldTask = true
    local BattleMain = UIManager(self):GetUIObj("BattleMain")
    if BattleMain then
      BattleMain.VB_View:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    end
    local UIObjs = MissionIndicatorManager:GetIndicatorUIObjBySTLType("Dynamic")
    if not IsEmptyTable(UIObjs) then
      for _, UI in pairs(UIObjs) do
        if UI then
          UI:Hide("ExploreLimit")
        end
      end
    end
    
    local function ShowExploreTaskPanel()
      local BattleMain = UIManager(self):GetUIObj("BattleMain")
      local DynamicEventIndicator = UIManager(self):GetUIObj("DynamicEventIndicator")
      if nil ~= DynamicEventIndicator then
        DynamicEventIndicator.Main:SetVisibility(ESlateVisibility.Collapsed)
      end
      if BattleMain then
        local DynamicEventUI = BattleMain:GetOrAddDynamicEventWidget()
        local Avatar = GWorld:GetAvatar()
        if not Avatar then
          return false
        end
        if nil ~= BattleMain and nil ~= BattleMain.Pos_TaskBar and 0 ~= BattleMain.Pos_TaskBar:GetChildrenCount() then
          local TrackingQuestChain = Avatar.TrackingQuestChainId
          local TaskBarWidget = BattleMain.Pos_TaskBar:GetChildAt(0)
          if nil ~= TaskBarWidget then
            if 0 ~= TrackingQuestChain then
              if CommonUtils.GetDeviceTypeByPlatformName(self) == "PC" then
              else
                TaskBarWidget.Tips:SetVisibility(ESlateVisibility.Collapsed)
              end
              if TaskBarWidget.VBox_SubTasks:GetChildrenCount() > 0 then
                TaskBarWidget.VBox_SubTasks:SetVisibility(ESlateVisibility.Collapsed)
              end
            end
            TaskBarWidget.IsInExplore = true
            if CommonUtils.GetDeviceTypeByPlatformName(self) == "PC" then
              TaskBarWidget:PlayAnimation(TaskBarWidget.Tooltip_Out)
            end
          end
        end
        DynamicEventUI:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
        DynamicEventUI.DynamicEvent:SetVisibility(ESlateVisibility.Collapsed)
        DynamicEventUI:PlayAnimation(DynamicEventUI.Challenge_In)
        if ClientEventUtils:GetCurrentDoingDynamicEvent() then
          DynamicEventUI:PlayAnimation(DynamicEventUI.Out)
        end
        DynamicEventUI.ExplorationChallenge.Text_Name:SetText(GText(Des))
        DynamicEventUI.ExplorationChallenge.Text_TaskName:SetText(GText(Title))
        DynamicEventUI.ExplorationChallenge:SetQuitButtonByInputDevice(UIUtils.UtilsGetCurrentInputType())
        DynamicEventUI.ExplorationChallenge.Text_Tips01:SetVisibility(ESlateVisibility.Collapsed)
        DynamicEventUI.ExplorationChallenge.Text_Tips02:SetText(GText("UI_Esc_Challenge"))
        DynamicEventUI.ExplorationChallenge.Text_Total:SetText(TotalTargetNum)
        if CommonUtils.GetDeviceTypeByPlatformName(self) == "PC" then
          DynamicEventUI:ListenForInputAction("QuitChallenge", EInputEvent.IE_Pressed, true, {
            self,
            self.OnPressQuitChallenge
          })
          DynamicEventUI.ExplorationChallenge:ListenForInputAction("ExploraChallengeQuitL", EInputEvent.IE_Pressed, true, {
            self,
            self.OnPadActiveGuidePress
          })
          DynamicEventUI.ExplorationChallenge:ListenForInputAction("ExploraChallengeQuitR", EInputEvent.IE_Pressed, true, {
            self,
            self.OnPadExploraChallengeQuitPress
          })
          DynamicEventUI.ExplorationChallenge:ListenForInputAction("ExploraChallengeQuitL", EInputEvent.IE_Released, true, {
            self,
            self.OnPadActiveGuideRelease
          })
          DynamicEventUI.ExplorationChallenge:ListenForInputAction("ExploraChallengeQuitR", EInputEvent.IE_Released, true, {
            self,
            self.OnPadExploraChallengeQuitRelease
          })
        end
        if CommonUtils.GetDeviceTypeByPlatformName(self) == "Mobile" then
          DynamicEventUI.ExplorationChallenge.Panel_Tips:SetVisibility(ESlateVisibility.Collapsed)
        end
        self:RemoveTimer("ShowExploreTaskPanelBindToTimer")
        return true
      end
      return false
    end
    
    if not ShowExploreTaskPanel() then
      self:AddTimer(0.1, ShowExploreTaskPanel, true, 0, "ShowExploreTaskPanelBindToTimer", false)
    end
  end
  EventManager:AddEvent(EventID.CharDie, self, self.OnCharDie)
  self.Overridden.ReceiveOnExploreLimitStarted(self, Title, Des, TotalTargetNum)
end

function M:UpdateLimitUI(CurrentTargetNum)
  local BattleMain = UIManager(self):GetUIObj("BattleMain")
  local DynamicEventIndicator = UIManager(self):GetUIObj("DynamicEventIndicator")
  if nil ~= DynamicEventIndicator then
    DynamicEventIndicator.Main:SetVisibility(ESlateVisibility.Collapsed)
  end
  if BattleMain then
    local DynamicEventUI = BattleMain:GetOrAddDynamicEventWidget()
    local Avatar = GWorld:GetAvatar()
    if not Avatar then
      return false
    end
    DynamicEventUI.ExplorationChallenge.Text_Now:SetText(CurrentTargetNum)
  end
end

function M:OnPressQuitChallenge()
  local Params = {}
  
  function Params.RightCallbackFunction(Data)
    if CommonUtils.GetDeviceTypeByPlatformName(self) == "PC" then
      local BattleMain = UIManager(self):GetUIObj("BattleMain")
      if BattleMain then
        local DynamicEventUI = BattleMain:GetOrAddDynamicEventWidget()
        DynamicEventUI:StopListeningForInputAction("QuitChallenge", EInputEvent.IE_Pressed)
      end
    end
    self:FailLimitExplore()
  end
  
  UIManager(self):ShowCommonPopupUI(100096, Params)
end

function M:OnPadActiveGuidePress()
  DebugPrint("LHQ@@@LS Press")
  self.IsLSPress = true
  if self.IsLSPress and self.IsRSPress then
    local Params = {}
    
    function Params.RightCallbackFunction(Data)
      if CommonUtils.GetDeviceTypeByPlatformName(self) == "PC" then
        local BattleMain = UIManager(self):GetUIObj("BattleMain")
        if BattleMain then
          local DynamicEventUI = BattleMain:GetOrAddDynamicEventWidget()
          DynamicEventUI:StopListeningForInputAction("QuitChallenge", EInputEvent.IE_Pressed)
        end
      end
      self:FailLimitExplore()
    end
    
    UIManager(self):ShowCommonPopupUI(100096, Params)
  end
end

function M:OnPadExploraChallengeQuitPress()
  self.IsRSPress = true
  if self.IsLSPress and self.IsRSPress then
    local Params = {}
    
    function Params.RightCallbackFunction(Data)
      if CommonUtils.GetDeviceTypeByPlatformName(self) == "PC" then
        local BattleMain = UIManager(self):GetUIObj("BattleMain")
        if BattleMain then
          local DynamicEventUI = BattleMain:GetOrAddDynamicEventWidget()
          DynamicEventUI:StopListeningForInputAction("QuitChallenge", EInputEvent.IE_Pressed)
        end
      end
      self:FailLimitExplore()
    end
    
    UIManager(self):ShowCommonPopupUI(100096, Params)
  end
end

function M:OnPadActiveGuideRelease()
  self.IsLSPress = false
end

function M:OnPadExploraChallengeQuitRelease()
  self.IsRSPress = false
end

function M:ActiveGuideIcon_Lua(Eid)
  local Entity = Battle(self):GetEntity(Eid)
  if Entity and Entity.ActiveGuide then
    Entity:ActiveGuide("Add")
  end
end

function M:DeactiveGuideIcon_Lua(Eid)
  local Entity = Battle(self):GetEntity(Eid)
  if Entity and Entity.ActiveGuide then
    Entity:DeactiveGuide()
  end
end

function M:UpdateExploreData(DataKey, DataValue)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  Avatar:UpdateExploreData(self.ExploreGroupId, DataKey, DataValue)
end

function M:SetChallengeState(ExitChallenge)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  if not ExitChallenge then
    Avatar:SetState2InExploreChanllenge(self.ExploreGroupId)
  else
    Avatar:ExitState2InExploreChanllenge(self.ExploreGroupId)
  end
end

function M:SetPlayerToTransform(Transform)
  if 0 == Transform.Translation.x and 0 == Transform.Translation.y and 0 == Transform.Translation.z then
    return
  end
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  Player:K2_SetActorTransform(Transform, false, nil, false)
  Player:EnableCheckOverlapPush({})
  Player:StartCameraFade()
  Player:GetController():SetControlRotation(Player:K2_GetActorRotation())
  Player:Landed()
end

function M:ResetCompletedExploreGroup()
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  if GameState.ActiveLimitTimeExploreGroup == self.ExploreGroupId then
    self:GMReceiveOnExploreGroupResetUI()
  end
  self:TryDeactive()
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    Avatar:ResetingExplore(self.ExploreGroupId, self.RegionId)
  end
end

function M:ShowRewardUI(TotalReward)
  if not TotalReward or not next(TotalReward) then
    return
  end
  local List = {}
  for Types, Table in pairs(TotalReward) do
    local Type = Types
    Type = string.match(Type, "^(.*)s$") or Type
    for Id, v in pairs(Table) do
      local Count = 0
      for SourceType, Num in pairs(v) do
        Count = Count + Num
      end
      table.insert(List, {
        ItemId = Id,
        ItemType = Type,
        Count = Count,
        Rarity = ItemUtils.GetItemRarity(Id, Type)
      })
    end
  end
  UIUtils.ShowHudReward(GText("UI_COMMON_REWARD"), List)
end

function M:BPSetStoneCanTouch(CreatorId, bCanTouch)
  local Creator = self.StaticCreatorMap:Find(CreatorId)
  if not Creator or 0 == Creator.ChildEids:Length() then
    return
  end
  local Mechanism = Battle(self):GetEntity(Creator.ChildEids[1])
  if not Mechanism or Mechanism:GetUnitRealType() ~= "OrderedStone" then
    return
  end
  Mechanism.bCanTouch = bCanTouch
end

function M:BPSetStoneShowEndCallback(CreatorId)
  local Creator = self.StaticCreatorMap:Find(CreatorId)
  if not Creator or 0 == Creator.ChildEids:Length() then
    return
  end
  local Mechanism = Battle(self):GetEntity(Creator.ChildEids[1])
  if not Mechanism or Mechanism:GetUnitRealType() ~= "OrderedStone" then
    return
  end
  
  local function Callback()
    self:OnStoneShowEnd(CreatorId)
  end
  
  Mechanism.ShowEndCallback = Callback
end

function M:TriggerTransferPlayer(TargetTransform, BlackScreenTime)
  local Player = UGameplayStatics.GetPlayerCharacter(self, 0)
  Player:K2_SetActorLocation(TargetTransform.Translation, false, nil, false)
  Player:K2_SetActorRotation(TargetTransform.Rotation:ToRotator(), false)
  Player:GetMovementComponent():ForceClientUpdate()
  Player:EnableCheckOverlapPush({})
  Player:ShowBlackScreenFade_StandAlone("Black", BlackScreenTime)
  Player:GetController():SetControlRotation(Player:K2_GetActorRotation())
  Player:Landed()
end

return M
