require("UnLua")
local WBP_DungeonSurviveFloat_C = Class("BluePrints.UI.Dungeon.WBP_DungeonUIBase_C")

function WBP_DungeonSurviveFloat_C:Initialize(Initializer)
  self.Super.Initialize(self)
  self.LastAddValue = 0
  self.TimeMode = nil
  self.AllMode = {ShowSurvivalTime = false, ShowTask = false}
  self.IsNeedAutoClose = false
  self.ConfigName = nil
  self.ConfigUnitId = nil
  self.CurTaskPath = nil
  self.DeviceIconPath = ""
  self.CurTimeThres = nil
  self.CurTimeStage = 0
  self.bNeedUpdateTimeLimit = false
  self.CriticalColor = FSlateColor()
  self.CriticalColor.SpecifiedColor.R = 1
  self.CriticalColor.SpecifiedColor.G = 0
  self.CriticalColor.SpecifiedColor.B = 0
  self.WhiteCommonColor = FSlateColor()
  self.WhiteCommonColor.SpecifiedColor.R = 1
  self.WhiteCommonColor.SpecifiedColor.G = 1
  self.WhiteCommonColor.SpecifiedColor.B = 1
  self.bIsPro = false
  self.CurrentAnimationName = ""
  self.bShouldContinueAnim = true
  self.bShouldContinueGuideAnim = false
  self.SurpossedLeave = false
  self.BuffList = {}
  self.LowPercent = DataMgr.GlobalConstant.MinExtraFixVitamin.ConstantValue / 100
  self.LoadingSurvivalItemData = {}
  self.LoadingBuffIcon = {}
end

function WBP_DungeonSurviveFloat_C:Close()
  AudioManager(self):StopSound(self, "SerumLow")
  self.Super.Close(self)
end

function WBP_DungeonSurviveFloat_C:StopAnimationLoop()
  if self.CurrentAnimationName ~= "prompt01" then
    return
  end
  self.Panel_Tip:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self.bShouldContinueAnim = false
end

function WBP_DungeonSurviveFloat_C:PlayAnimationUntilStop(AnimationName)
  AnimationName = AnimationName or self.CurrentAnimationName
  if self:IsAnimationPlaying(self[AnimationName]) then
    return
  end
  if not self.bShouldContinueAnim then
    AudioManager(self):StopSound(self, "SerumLow")
    return
  end
  self.CurrentAnimationName = AnimationName
  local Anim = self[AnimationName]
  self:StopAnimation(Anim)
  if Anim then
    local GameState = UE4.UGameplayStatics.GetGameState(self)
    local _, Proxy = UWidgetAnimationPlayCallbackProxy.CreatePlayAnimationProxyObject(nil, self, Anim, 0, 1, 0)
    Proxy.Finished:Add(self, self.PlayAnimationUntilStop)
  end
end

function WBP_DungeonSurviveFloat_C:Destruct()
  WBP_DungeonSurviveFloat_C.Super.Destruct(self)
  AudioManager(self):StopSound(self, "SerumLow")
end

function WBP_DungeonSurviveFloat_C:ResumeCountDown()
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  if not IsValid(GameState) then
    return
  end
end

function WBP_DungeonSurviveFloat_C:OnEnd()
  AudioManager(self):StopSound(self, "SerumLow")
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  if not IsValid(GameState) then
    return
  end
  if self.TimeMode == "CountDown" then
    self.TextBlock_LeftTime:SetText(self:GetTimeStr(0))
  else
    local TimeStr = self:GetTimeStr(math.floor(GameState:GetSurvialTime()))
    self.TextBlock_LeftTime:SetText(TimeStr)
  end
  self.SurvivalPercent:SetText("0%")
end

function WBP_DungeonSurviveFloat_C:OnLoaded(...)
  self:CheckDungeonMode()
  self.Super.OnLoaded(self, ...)
  self.Text_Effect:SetVisibility(ESlateVisibility.Collapsed)
  self.List_Buff_Describe:ClearListItems()
  DebugPrint("Fyx SurviveUIConstruct")
  self.List_Buff_Describe:ClearListItems()
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  if GameState.GameModeType == "SurvivalPro" then
    self.CurTimeThres = DataMgr.GlobalConstant.SurviveProStageTime.ConstantValue
  else
    self.CurTimeThres = DataMgr.GlobalConstant.SurviveStageTime.ConstantValue
  end
  self.TextBlock_9:SetText(GText("DUNGEON_SURVIVAL_100"))
  self.Panel_Tip:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self.Common_Tip01_PC.Text_Course:SetText(GText("DUNGEON_SURVIVALPRO_113"))
  self:InitListenEvent()
  EMUIAnimationSubsystem:EMPlayAnimation(self, self.In)
  self:OnRepSurvivalTime(GameState:GetSurvialTime())
  self:OnRepEnergySupplyCount()
  local AddAnim = self:GetAnimationByName("Add")
  self:BindToAnimationFinished(AddAnim, {
    self,
    self.PlayAnimationFinished
  })
  if not self.IsNewSurvival then
    self.SurvivalLowSerum = UIManager(self):LoadUINew("DungeonSurvivalLowSerum")
    if self.SurvivalLowSerum then
      self.SurvivalLowSerum.Root:SetVisibility(ESlateVisibility.Collapsed)
    end
  end
  if self.IsNewSurvival then
    self.Panel_Time:SetVisibility(ESlateVisibility.Collapsed)
    self.LowPercent = DataMgr.GlobalConstant.MinExtraFixVitaminMini.ConstantValue / 100
  end
  if self.IsSurvivalMini then
    self.Panel_Wave:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self.Text_Wave:SetText(GText("TARGET_DUNGEON_ROUND"))
    self:UpdateDungeonProgressDisplay(GameState.DungeonProgress)
  end
end

function WBP_DungeonSurviveFloat_C:CheckDungeonMode()
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  if GameState.GameModeType == "SurvivalMini" then
    self.IsSurvivalMini = true
    self.IsNewSurvival = true
  end
  if GameState.GameModeType == "SurvivalMiniPro" then
    self.IsSurvivalMiniPro = true
    self.IsNewSurvival = true
  end
end

function WBP_DungeonSurviveFloat_C:InitListenEvent()
  self.Super.InitListenEvent(self)
  self:AddDispatcher(EventID.OnRepSurvivalTime, self, self.OnRepSurvivalTime)
  self:AddDispatcher(EventID.OnRepSurvivalValue, self, self.OnRepSurvivalValue)
  self:AddDispatcher(EventID.OnRepSurvivalMiniValue, self, self.OnRepSurvivalMiniValue)
  self:AddDispatcher(EventID.OnPoisonMonsterBorn, self, self.OnSpecialMonsterCreated)
  self:AddDispatcher(EventID.OnPoisonMonsterDead, self, self.OnSpecialMonsterDead)
  EventManager:AddEvent(EventID.OnRepEnergySupplyCount, self, self.OnRepEnergySupplyCount)
  self:AddDispatcher(EventID.OnRepDungeonProgress, self, self.UpdateDungeonProgressDisplay)
end

function WBP_DungeonSurviveFloat_C:TryToAddSurvivalValue(AddValue)
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  if not IsValid(GameState) then
    return
  end
  local CurSurvivalValue = GameState:GetSurvivalValue()
  local MaxSurvivalValue = DataMgr.GlobalConstant.SurvivalValue.ConstantValue
  local AddPercent = math.floor((AddValue + self.LastAddValue) / MaxSurvivalValue * 100)
  self.LastAddValue = self.LastAddValue + AddValue
  local NowPercent = CurSurvivalValue / MaxSurvivalValue
  self.Text_Add:SetText("+" .. tostring(AddPercent) .. "%")
  if self.bIsPro then
    local AddAnim = self:GetAnimationByName("Add_Slow")
    
    local function PlayAnimFinished()
      self:StopAllAnimations()
      EMUIAnimationSubsystem:EMPlayAnimation(self, self.Add_Slow_Out)
    end
    
    if not self:IsAnimationPlaying(AddAnim) then
      self:PlayAnim("Add_Slow")
      self:AddTimer(1, PlayAnimFinished, false, 0, "Add_Slow_Out")
    else
      self:RemoveTimer("Add_Slow_Out")
      self:AddTimer(1, PlayAnimFinished, false, 0, "Add_Slow_Out")
    end
  else
    local AddAnim = self:GetAnimationByName("Add")
    self:StopAllAnimations()
    if not self:IsAnimationPlaying(AddAnim) then
      self.Text_Add:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
      self:PlayAnim("Add")
    end
  end
end

function WBP_DungeonSurviveFloat_C:PlayAnimationFinished()
  self.LastAddValue = 0
  self.Text_Add:SetVisibility(UE4.ESlateVisibility.Collapsed)
end

function WBP_DungeonSurviveFloat_C:PlayBuffAnim()
  local _, Proxy = UWidgetAnimationPlayCallbackProxy.CreatePlayAnimationProxyObject(nil, self, self.SwitchOut, 0, 1, 0)
  Proxy.Finished:Add(self, function()
    self:PlayAnimation(self.SwitchIn)
  end)
end

function WBP_DungeonSurviveFloat_C:UpdateBuffLevel(BuffId, BuffRate)
  local Entries = self.List_Buff_Describe:GetDisplayedEntryWidgets()
  if Entries:Length() <= 0 then
    return
  end
  local Entry = Entries:Get(1)
  if not Entry then
    return
  end
  local Text = GText(self.BuffList[BuffId][2])
  local Percent = tonumber(string.match(BuffRate, "%d+"))
  if Percent < 0.001 then
    Entry.Text_Describe:SetText(Text)
    return
  end
  Entry.Text_Describe:SetText(Text .. "+" .. BuffRate)
end

function WBP_DungeonSurviveFloat_C:ShowBuffInfo(PathIconList, TextMapList, Duration)
  self.Text_Effect:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  self.List_Buff_Describe:ClearListItems()
  for k in pairs(self.LoadingSurvivalItemData) do
    self.LoadingSurvivalItemData[k] = nil
  end
  local IconListSize = PathIconList:Length()
  local TextMapListSize = TextMapList:Length()
  if IconListSize ~= TextMapListSize then
    return
  end
  DebugPrint("Fyx SurviveUIShowbuff:", self.List_Buff_Describe:GetVisibility())
  self.List_Buff_Describe:SetVisibility(ESlateVisibility.Hidden)
  if self.List_Buff_Describe:GetNumItems() > 0 then
    self.List_Buff_Describe:ClearListItems()
  end
  self.Text_Effect:SetText(GText("DUNGEON_SURVIVALPRO_124"))
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  if IsValid(GameState) then
    self:OnRepSurvivalValue(GameState.SurvivalValue)
  end
  self.Group_VX:SetVisibility(ESlateVisibility.Collapsed)
  self.BuffList = {}
  for i = 1, IconListSize do
    local BuffIconPath = PathIconList:Get(i)
    local BuffTextIndex = TextMapList:Get(i)
    local BuffIdString = string.gsub(BuffTextIndex, "BUFF_ENERGYSUPPLY_", "")
    local BuffId = tonumber(BuffIdString)
    self.BuffList[BuffId] = {BuffIconPath, BuffTextIndex}
    self:AddBuffInfo(BuffIconPath, BuffTextIndex)
  end
end

function WBP_DungeonSurviveFloat_C:OnEnergyChanged(bEnergyIncreased)
  DebugPrint("Fyx EnergyChange")
  local Entries = self.List_Buff_Describe:GetDisplayedEntryWidgets()
  if 0 == Entries:Length() then
    return
  end
  local Entry = Entries:Get(1)
  if not Entry then
    return
  end
  if EMUIAnimationSubsystem:EMAnimationIsPlaying(Entry, Entry.SerumUp) or EMUIAnimationSubsystem:EMAnimationIsPlaying(Entry, Entry.SerumDown) then
    return
  end
  if bEnergyIncreased then
    EMUIAnimationSubsystem:EMPlayAnimation(Entry, Entry.SerumUp)
  else
    EMUIAnimationSubsystem:EMPlayAnimation(Entry, Entry.SerumDown)
  end
end

function WBP_DungeonSurviveFloat_C:ReshowAllBuffInfo()
  DebugPrint("Fyx SurviveUIReshow")
  self.List_Buff_Describe:ClearListItems()
  for _, BuffInfo in pairs(self.BuffList) do
    self:AddBuffInfo(BuffInfo[1], BuffInfo[2])
  end
  self.Group_VX:SetVisibility(ESlateVisibility.Collapsed)
  local Entries = self.List_Buff_Describe:GetDisplayedEntryWidgets():ToTable()
  for _, Entry in ipairs(Entries) do
    Entry.Group_Arrow:SetVisibility(ESlateVisibility.Collapsed)
  end
  self:PlayAnimation(self.SwitchIn)
end

function WBP_DungeonSurviveFloat_C:OnSurvivalItemClassLoadFinish(ItemClass, ResourceID)
  if not ItemClass then
    return
  end
  if not IsValid(self) or not self.List_Buff_Describe then
    return
  end
  local Data = self.LoadingSurvivalItemData[ResourceID]
  self.LoadingSurvivalItemData[ResourceID] = nil
  if not Data then
    return
  end
  local Item = NewObject(ItemClass)
  if not Item then
    return
  end
  local BuffIconPath, BuffTextIndex = Data[1], Data[2]
  if BuffTextIndex then
    local BuffText = GText(BuffTextIndex)
    if BuffText then
      Item.BuffText = BuffText
    end
  end
  local AssetName = string.sub(BuffIconPath, string.find(BuffIconPath, "%.") + 1)
  AssetName = string.sub(AssetName, 1, -2)
  self.LoadingBuffIcon[AssetName] = Item
  UE.UResourceLibrary.LoadObjectAsync(self, BuffIconPath, {
    self,
    WBP_DungeonSurviveFloat_C.OnBuffIconLoadFinish
  })
  self.List_Buff_Describe:AddItem(Item)
  Data.IsDestroied = true
end

function WBP_DungeonSurviveFloat_C:OnBuffIconLoadFinish(Object)
  local AssetName = Object:GetName()
  local Item = self.LoadingBuffIcon[AssetName]
  Item.BuffIcon = Object
  self.LoadingBuffIcon[AssetName] = nil
  if not IsValid(Item) then
    return
  end
  local Widget = URuntimeCommonFunctionLibrary.GetEntryWidgetFromItem(self.List_Buff_Describe, self.List_Buff_Describe:GetIndexForItem(Item))
  if IsValid(Widget) and Widget.Img_Buff then
    Widget.Img_Buff:SetBrushResourceObject(Object)
  end
  EMUIAnimationSubsystem:EMPlayAnimation(self, self.Task_In)
  self:PlayAnimation(self.SwitchIn)
  self.List_Buff_Describe:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
end

function WBP_DungeonSurviveFloat_C:AddBuffInfo(BuffIconPath, BuffTextIndex)
  local Path = "/Game/UI/Blueprint/BP_SurvivalBuffItems.BP_SurvivalBuffItems_C"
  local Handle = UE.UResourceLibrary.LoadObjectAsyncWithId(self, Path, {
    self,
    WBP_DungeonSurviveFloat_C.OnSurvivalItemClassLoadFinish
  })
  if Handle then
    self.LoadingSurvivalItemData[Handle.ResourceID] = {BuffIconPath, BuffTextIndex}
  end
end

function WBP_DungeonSurviveFloat_C:CloseBuffPanel(BuffId)
  local bNeedPlaySwitchIn = self.List_Buff_Describe:GetNumItems() > 1
  self.List_Buff_Describe:ClearListItems()
  self.LoadingSurvivalItemData = {}
  if self.BuffList and self.BuffList[BuffId] then
    self:AddBuffInfo(self.BuffList[BuffId][1], self.BuffList[BuffId][2])
  end
  self.Group_VX:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  if bNeedPlaySwitchIn then
    self:PlayAnimation(self.SwitchIn)
  end
end

function WBP_DungeonSurviveFloat_C:OnRepSurvivalTime(SurvivalTime)
  local TimeStr = self:GetTimeStr_Cpp(math.floor(SurvivalTime))
  self.TextBlock_LeftTime:SetText(TimeStr)
  if SurvivalTime >= self.CurTimeThres * self.CurTimeStage then
    local GameState = UE4.URuntimeCommonFunctionLibrary.GetCurrentGameState(GWorld.GameInstance)
    if not GameState then
      return
    end
    self.CurTimeStage = GameState.DungeonProgress
    local Str = "/" .. self:GetTimeStr_Cpp(math.floor(self.CurTimeThres * self.CurTimeStage))
    self.TimeThreshold:SetText(Str)
  end
end

function WBP_DungeonSurviveFloat_C:OnRepSurvivalMiniValue(CurSurvivalMiniValue)
  self:OnRepSurvivalValue(CurSurvivalMiniValue)
end

function WBP_DungeonSurviveFloat_C:OnRepSurvivalValue(CurSurvivalValue)
  if not self.CurSurvivalValueCache then
    self.CurSurvivalValueCache = CurSurvivalValue
  end
  if CurSurvivalValue > self.CurSurvivalValueCache then
    self:TryToAddSurvivalValue(CurSurvivalValue - self.CurSurvivalValueCache)
  end
  if CurSurvivalValue > 4 and self.CurSurvivalValueCache <= 4 then
    self:PlayVitaminCostPrompt()
  end
  self.CurSurvivalValueCache = CurSurvivalValue
  local MaxSurvivalValue = DataMgr.GlobalConstant.SurvivalValue.ConstantValue
  local NowPercent = CurSurvivalValue / MaxSurvivalValue
  self.SurvivalPercent:SetText(tostring(math.floor(NowPercent * 100)) .. "%")
  if NowPercent < self.LowPercent then
    self.bLowEnergy = true
    self.bShouldContinueGuideAnim = false
    if not self.IsNewSurvival then
      self.bShouldContinueAnim = true
      if not AudioManager(self):IsSoundPlaying(self, "SerumLow") then
        AudioManager(self):PlayUISound(self, "event:/ui/common/battle_serum_countdown", "SerumLow", nil)
      end
      if self.SurvivalLowSerum then
        self.SurvivalLowSerum:ShowOrHideByAnim(true)
        self.SurvivalLowSerum.Root:SetRenderOpacity(1 - NowPercent / self.LowPercent)
      end
    end
  else
    if self.bLowEnergy then
      self.bLowEnergy = false
    end
    if not self.IsNewSurvival then
      if self:GetVisibility(self.VX_prompt03) == ESlateVisibility.SelfHitTestInvisible then
        self.bShouldContinueAnim = false
      end
      self.SurvivalPercent:SetColorAndOpacity(self.WhiteCommonColor)
      if self.SurvivalLowSerum then
        self.SurvivalLowSerum:ShowOrHideByAnim(false)
      end
    end
  end
  self:ConditionalPlayAnimation()
  if CurSurvivalValue <= 0 and not self.SurvivalValueZeroSent then
    self.SurvivalValueZeroSent = true
    local PlayerCharacter = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
    if PlayerCharacter and PlayerCharacter.SurviveValueZero then
      PlayerCharacter:SurviveValueZero()
    end
  end
  local Entries = self.List_Buff_Describe:GetDisplayedEntryWidgets()
  if 0 == Entries:Length() then
    return
  end
  local Entry = Entries:Get(1)
  if not Entry then
    return
  end
  if not Entry:IsAnimationPlaying(Entry.SerumUp) and not Entry:IsAnimationPlaying(Entry.SerumDown) then
    Entry.Group_Arrow:SetVisibility(ESlateVisibility.Collapsed)
    return
  end
end

function WBP_DungeonSurviveFloat_C:OnRepEnergySupplyCount()
  local GameState = UE4.URuntimeCommonFunctionLibrary.GetCurrentGameState(GWorld.GameInstance)
  if not GameState then
    return
  end
  if self.IsPro then
    return
  end
  local AvailiableCount = GameState.EnergySupplyCount
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  local UIManager = GameInstance:GetGameUIManager()
  if nil == UIManager or not UE4.UKismetSystemLibrary.IsValid(UIManager) then
    return
  end
  local ItemDifference = AvailiableCount - self.O2List:GetNumItems()
  if ItemDifference > 0 then
    for i = 1, ItemDifference do
      local Item = self:CreateWidgetNew("BattleObjectiveList")
      self.O2List:AddItem(Item)
    end
  end
  if ItemDifference < 0 then
    local NeedRemoveNum = math.abs(ItemDifference)
    for i = 1, NeedRemoveNum do
      self.O2List:RemoveItem(self.O2List:GetItemAt(0))
    end
  end
end

function WBP_DungeonSurviveFloat_C:UIStateChange_None()
  self:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self.SurvivalPanel:SetVisibility(UE4.ESlateVisibility.Collapsed)
end

function WBP_DungeonSurviveFloat_C:UIStateChange_OnTarget()
  self:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  self.bNeedUpdateTimeLimit = true
  if self.IsSurvivalMiniPro or GameState.GameModeType == "SurvivalPro" then
    self.Common_Tip01_PC.Text_Course:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self.bIsPro = true
    self.bShouldContinueAnim = true
    self.O2List:SetVisibility(ESlateVisibility.Collapsed)
  end
  self.SurvivalPanel:SetVisibility(UE4.ESlateVisibility.HitTestInvisible)
  if self.IsNewSurvival then
    self:OnRepSurvivalValue(GameState.SurvivalMiniValue)
  else
    self:OnRepSurvivalValue(GameState.SurvivalValue)
  end
end

function WBP_DungeonSurviveFloat_C:PlayVitaminCostPrompt()
  if not self.IsSurvivalMiniPro then
    return
  end
  if self.IsVitaminCostPromptPlayed then
    return
  end
  self.IsVitaminCostPromptPlayed = true
  self:PlayAnimationUntilStop("prompt01")
  self.Common_Tip01_PC:SetVisibility(UE4.ESlateVisibility.HitTestInvisible)
  if not self:IsExistTimer("AnimLoop") then
    self:AddTimer(10, self.StopAnimationLoop, false, 0, "AnimLoop")
  end
end

function WBP_DungeonSurviveFloat_C:OnSpecialMonsterCreated(Eid)
  self.SpecialMonsterAlive = true
  self.SpecialMonsterEid = Eid
  DebugPrint("lxh_SpecialMonsterAlive: ", self.SpecialMonsterAlive)
  self:ConditionalPlayAnimation()
  self:StartSpecialMonsterGuideLoop()
end

function WBP_DungeonSurviveFloat_C:OnSpecialMonsterDead()
  self.SpecialMonsterAlive = false
  self.bShouldContinueAnim = false
  self.SpecialMonsterEid = nil
  self:StopSpecialMonsterGuideLoop()
end

function WBP_DungeonSurviveFloat_C:ConditionalPlayAnimation()
  local GameState = UE4.URuntimeCommonFunctionLibrary.GetCurrentGameState(GWorld.GameInstance)
  if not GameState then
    return
  end
  local MaxSurvivalValue = DataMgr.GlobalConstant.SurvivalValue.ConstantValue
  local CurSurvivalValue = GameState:GetSurvivalValue()
  local NowPercent = CurSurvivalValue / MaxSurvivalValue
  if not self.IsNewSurvival then
    if NowPercent < self.LowPercent then
      self.VX_prompt03:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    else
      self.VX_prompt03:SetVisibility(ESlateVisibility.Collapsed)
      AudioManager(self):StopSound(self, "SerumLow")
    end
  end
  if self.IsNewSurvival then
    if self.SpecialMonsterAlive and NowPercent >= self.LowPercent and CurSurvivalValue < 100 then
      self.VX_prompt02:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
      self.VX_prompt03:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
      self.SurvivalPercent:SetColorAndOpacity(self.CriticalColor)
    else
      self.VX_prompt02:SetVisibility(ESlateVisibility.Collapsed)
      self.VX_prompt03:SetVisibility(ESlateVisibility.Collapsed)
      self.SurvivalPercent:SetColorAndOpacity(self.WhiteCommonColor)
    end
  end
end

function WBP_DungeonSurviveFloat_C:UpdateDungeonProgressDisplay(DungeonProgress)
  self.Num_Wave:SetText(DungeonProgress)
end

function WBP_DungeonSurviveFloat_C:StartSpecialMonsterGuideLoop()
  if self:IsExistTimer("SpecialMonsterGuideLoop") then
    return
  end
  self:AddTimer(5, self.ShowSpecialMonsterGuideLoop, true, 0, "SpecialMonsterGuideLoop", false)
  GameState(self):ShowDungeonToast_Lua("", 2, EToastType.SabotageAlarm)
end

function WBP_DungeonSurviveFloat_C:ShowSpecialMonsterGuideLoop()
  if not self.SpecialMonsterEid then
    return
  end
  local SceneManager = GWorld.GameInstance:GetSceneManager()
  if not SceneManager then
    return
  end
  local GuideUIName = SceneManager.GuideIcons:FindRef(self.SpecialMonsterEid)
  local GuideIcon = UIManager(self):GetUIObj(GuideUIName)
  if not GuideIcon then
    return
  end
  GuideIcon:PlayLoopAnim()
end

function WBP_DungeonSurviveFloat_C:StopSpecialMonsterGuideLoop()
  self:RemoveTimer("SpecialMonsterGuideLoop")
end

return WBP_DungeonSurviveFloat_C
