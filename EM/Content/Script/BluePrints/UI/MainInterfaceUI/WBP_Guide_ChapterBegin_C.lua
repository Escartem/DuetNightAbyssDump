local WBP_Guide_ChapterBegin_C = Class("BluePrints.UI.BP_UIState_C")

function WBP_Guide_ChapterBegin_C:OnLoaded(...)
  local QuestChainId, QuestId, IsBegin = ...
  local TS = TalkSubsystem()
  local IsInTalk = false
  if TS and TS:IsInImmersiveStory() then
    IsInTalk = true
  end
  local UIManager = UE4.UGameplayStatics.GetGameInstance(self):GetGameUIManager()
  local BattleMainUI = UIManager:GetUIObj("BattleMain")
  if not BattleMainUI then
    return
  end
  if nil ~= UIManager and not IsInTalk and BattleMainUI:GetVisibility() ~= ESlateVisibility.Collapsed then
    self:HideAllUIWithOutSelf(true, "QuestChapterBeginEnd")
  end
  self.QuestChainId = QuestChainId
  self.QuestId = QuestId
  self.Duration = 2.0
  if not self:OnTipBegin() then
    self:HideAllUIWithOutSelf(false, "QuestChapterBeginEnd")
    return
  end
  local QuestChainInfo = DataMgr.QuestChain[QuestChainId]
  if nil ~= QuestChainInfo then
    self.Text_QuestName:SetText(self:GetTaskInfoString(QuestChainInfo.QuestChainName))
    local ChapterName = QuestChainInfo.ChapterName or ""
    local ChapterNumber = QuestChainInfo.ChapterNumber or ""
    local EpisodeName = QuestChainInfo.Episode or ""
    if nil ~= QuestChainInfo.ChapterBeginEndIconPath then
      local IconImageObj = LoadObject(QuestChainInfo.ChapterBeginEndIconPath)
      if IconImageObj then
        self.Icon:GetDynamicMaterial():SetTextureParameterValue("IconTex", IconImageObj)
      end
    end
    self.Text_MissionType:SetText(GText(ChapterName))
    self.Text_MissionType01:SetText(GText(ChapterNumber))
    self.Text_MissionType02:SetText(GText(EpisodeName))
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

function WBP_Guide_ChapterBegin_C:GetTaskInfoString(TaskText)
  return GText(TaskText)
end

function WBP_Guide_ChapterBegin_C:OnClose()
  self:OnTipRealEnd()
end

function WBP_Guide_ChapterBegin_C:OnTipBegin()
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

function WBP_Guide_ChapterBegin_C:PlayInAudio()
  AudioManager(self):PlayUISound(self, "event:/ui/common/mission_start_in", nil, nil)
end

function WBP_Guide_ChapterBegin_C:OnTipEnd()
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
end

function WBP_Guide_ChapterBegin_C:PlayOutAudio()
  AudioManager(self):PlayUISound(self, "event:/ui/common/mission_start_out", nil, nil)
end

function WBP_Guide_ChapterBegin_C:OnTipRealEnd()
  local UIManager = UE4.UGameplayStatics.GetGameInstance(self):GetGameUIManager()
  if nil ~= UIManager then
    self:HideAllUIWithOutSelf(false, "QuestChapterBeginEnd")
    local BattleMainUI = UIManager:GetUIObj("BattleMain")
    if BattleMainUI then
      BattleMainUI.Pos_TaskBar:GetChildAt(0):OnTipEndPlayTaskBarAnim(self.QuestChainId, self.QuestId, self.IsBegin)
    end
  end
  self:Close()
end

function WBP_Guide_ChapterBegin_C:Destruct()
  self.Super.Destruct(self)
  self:HideAllUIWithOutSelf(false, "QuestChapterBeginEnd")
end

return WBP_Guide_ChapterBegin_C
