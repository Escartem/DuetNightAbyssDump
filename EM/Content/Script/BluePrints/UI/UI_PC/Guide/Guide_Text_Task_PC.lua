local Guide_Text_Task_PC = Class("BluePrints.UI.UI_PC.Guide.Guide_TipsAsyncActionUIBase")

function Guide_Text_Task_PC:InitializeData(QuestChainId, IsBegin, Duration)
  local TS = TalkSubsystem()
  local IsInTalk = false
  if TS and TS:IsInImmersiveStory() then
    IsInTalk = true
  end
  local UIManager = UE4.UGameplayStatics.GetGameInstance(self):GetGameUIManager()
  if nil ~= UIManager and not IsInTalk then
    UIManager:HideAllUI(true)
  end
  self.QuestChainId = QuestChainId
  self.Duration = Duration or 0
  if not self:OnTipBegin(Duration) then
    return
  end
  local QuestChainInfo = DataMgr.QuestChain[QuestChainId]
  if nil ~= QuestChainInfo then
    self.Text_QuestName:SetText(self:GetTaskInfoString(QuestChainInfo.Episode))
    local TypeName
    for _, v in pairs(DataMgr.QuestTab) do
      if v.QuestType == QuestChainInfo.QuestChainType then
        TypeName = v.TabName
        break
      end
    end
    if nil ~= TypeName then
      self.Text_MissionType:SetText(GText(TypeName))
    end
  else
    self.Text_QuestName:SetText("UI_QUEST_UNKNOW")
  end
  self.IsBegin = IsBegin
  if IsBegin then
    self.Text_Start:SetText(GText("UI_QUEST_START"))
    self.Task_State:SetActiveWidgetIndex(0)
  else
    self.Text_Success:SetText(GText("UI_QUEST_SUCCESS"))
    self.Task_State:SetActiveWidgetIndex(1)
  end
end

function Guide_Text_Task_PC:GetTaskInfoString(TaskText)
  return GText(TaskText)
end

function Guide_Text_Task_PC:OnClose()
  self:OnTipRealEnd()
end

function Guide_Text_Task_PC:OnTipBegin()
  if self.IsShowing then
    return false
  end
  self.IsShowing = true
  self:Show("QuestBeginEndTip")
  self:Show()
  if self.In then
    self:UnbindAllFromAnimationFinished(self.In)
    self:BindToAnimationFinished(self.In, {
      self,
      self.OnTipEnd
    })
    self:PlayAnimation(self.In)
  end
  return true
end

function Guide_Text_Task_PC:PlayInAudio()
  AudioManager(self):PlayUISound(self, "event:/ui/common/mission_start_in", nil, nil)
end

function Guide_Text_Task_PC:OnTipEnd()
  self:AddTimer(self.Duration, function()
    if self.Out then
      self:UnbindAllFromAnimationFinished(self.Out)
      self:BindToAnimationFinished(self.Out, {
        self,
        self.OnTipRealEnd
      })
      self:PlayAnimation(self.Out)
    else
      self:OnTipRealEnd()
    end
  end)
end

function Guide_Text_Task_PC:PlayOutAudio()
  AudioManager(self):PlayUISound(self, "event:/ui/common/mission_start_out", nil, nil)
end

function Guide_Text_Task_PC:OnTipRealEnd()
  self:Hide("QuestBeginEndTip")
  self.IsShowing = false
  local UIManager = UE4.UGameplayStatics.GetGameInstance(self):GetGameUIManager()
  if nil ~= UIManager then
    UIManager:HideAllUI(false)
    local BattleMainUI = UIManager:GetUIObj("BattleMain")
    if BattleMainUI then
      BattleMainUI.Pos_TaskBar:GetChildAt(0):OnTipEndPlayTaskBarAnim(self.QuestChainId, self.IsBegin)
    end
  end
  if self.OnGuideEnd:IsBound() then
    self.OnGuideEnd:Broadcast()
  end
end

return Guide_Text_Task_PC
