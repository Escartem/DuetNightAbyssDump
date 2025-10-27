local WBP_BattleToast_C = Class("BluePrints.UI.BP_UIState_C")

function WBP_BattleToast_C:Initialize(Initializer)
  self.Super.Initialize(self)
  self.ToastShowTime = 1
end

function WBP_BattleToast_C:OnLoaded(...)
  self.Super.OnLoaded(self, ...)
  self:InitListenEvent()
end

function WBP_BattleToast_C:InitListenEvent()
  self:AddDispatcher(EventID.OnDefenseWaveStart, self, self.OnDefenseWaveStart)
  self:AddDispatcher(EventID.OnWaveStart, self, self.OnWaveStart)
  self:AddDispatcher(EventID.OnWaveEnd, self, self.OnWaveEnd)
  self:AddDispatcher(EventID.OnDefenceWaveEnd, self, self.OnDefenceWaveEnd)
end

function WBP_BattleToast_C:GetWaveStartBP()
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  local UIManager = GameInstance:GetGameUIManager()
  if nil == UIManager then
    return
  end
  local UIManager = GameInstance:GetGameUIManager()
  local WaveStartBP = UIManager:GetUIObj("WaveStartBP")
  WaveStartBP = WaveStartBP or UIManager:LoadUINew("WaveStartBP")
  WaveStartBP:SetVisibility(UE4.ESlateVisibility.HitTestInvisible)
  return WaveStartBP
end

function WBP_BattleToast_C:OnDefenseWaveStart()
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  if not GameState then
    return
  end
  self.HintTime = GameState.DefenceWaveInterval
  local WaveStartBP = self:GetWaveStartBP()
  if WaveStartBP then
    WaveStartBP:SetVisibility(ESlateVisibility.Collapsed)
    WaveStartBP.Text_WaveStart:SetText(GText("DUNGEON_DEFENCE_101"))
    self:AddTimer(self.HintTime, function()
      WaveStartBP:SetVisibility(ESlateVisibility.HitTestInvisible)
      WaveStartBP:PlayInAnimation()
      AudioManager(self):PlayUISound(nil, "event:/ui/common/battle_warning", nil, nil)
    end)
    self:AddTimer(self.HintTime + self.ToastShowTime, function()
      WaveStartBP:PlayOutAnimation()
    end)
  end
  self:ShowCountDown()
end

function WBP_BattleToast_C:OnWaveStart()
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  if not GameState then
    return
  end
  self.HintTime = GameState.DefenceWaveInterval
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  local UIManager = GameInstance:GetGameUIManager()
  if nil == UIManager then
    return
  end
  local UIManager = GameInstance:GetGameUIManager()
  local GuideTextFloat = UIManager:GetUIObj("GuideTextFloat")
  GuideTextFloat = GuideTextFloat or UIManager:LoadUI(UIConst.GUIDETEXTFLOAT, "GuideTextFloat", UIConst.ZORDER_FOR_SECONDARY_POPUP)
  if GuideTextFloat then
    GuideTextFloat:ShowDungeonGuide("DUNGEON_TRAINING_101", self.ToastShowTime)
  end
  self:AddTimer(self.ToastShowTime, self.ShowCountDown)
end

function WBP_BattleToast_C:OnDefenceWaveEnd()
  local WaveStartBP = self:GetWaveStartBP()
  if WaveStartBP then
    WaveStartBP.Text_WaveStart:SetText(GText("DUNGEON_DEFENCE_102"))
    WaveStartBP:PlayAnimation(WaveStartBP.In)
    self:AddTimer(self.ToastShowTime, function()
      WaveStartBP:PlayAnimation(WaveStartBP.Out)
    end)
  end
end

function WBP_BattleToast_C:OnWaveEnd()
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  local UIManager = GameInstance:GetGameUIManager()
  if nil == UIManager then
    return
  end
  local UIManager = GameInstance:GetGameUIManager()
  local GuideTextFloat = UIManager:GetUIObj("GuideTextFloat")
  GuideTextFloat = GuideTextFloat or UIManager:LoadUI(UIConst.GUIDETEXTFLOAT, "GuideTextFloat", UIConst.ZORDER_FOR_SECONDARY_POPUP)
  if GuideTextFloat then
    GuideTextFloat:ShowDungeonGuide("DUNGEON_TRAINING_102", self.ToastShowTime)
  end
  self:AddTimer(self.ToastShowTime, self.ShowCountDown)
end

function WBP_BattleToast_C:ShowCountDown()
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  local UIManager = GameInstance:GetGameUIManager()
  if nil == UIManager then
    return
  end
  local UIManager = GameInstance:GetGameUIManager()
  local GuideCountDownFloat = UIManager:GetUIObj("GuideCountDown")
  GuideCountDownFloat = GuideCountDownFloat or UIManager:LoadUINew("GuideCountDown")
  GuideCountDownFloat:InitializeData(self.HintTime)
end

return WBP_BattleToast_C
