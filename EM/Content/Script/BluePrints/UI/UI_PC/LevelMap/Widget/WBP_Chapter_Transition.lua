require("UnLua")
local M = Class({
  "BluePrints.UI.BP_UIState_C"
})

function M:OnLoaded(...)
  self.Super.OnLoaded(self, ...)
  self.ChapterName, self.CantoName, self.Title, self.AudioPath, self.Func = ...
  local TS = TalkSubsystem()
  local IsInTalk = false
  if TS and TS:IsInImmersiveStory() then
    IsInTalk = true
  end
  local UIManager = UE4.UGameplayStatics.GetGameInstance(self):GetGameUIManager()
  if nil ~= UIManager and not IsInTalk then
    self:HideAllUIWithOutSelf(true, "Chapter_Transition")
  end
  AudioManager(self):PlayUISound(self, self.AudioPath, nil, nil)
  self:SetSwitchIndex()
  if self.In then
    self:UnbindAllFromAnimationFinished(self.In)
    self:BindToAnimationFinished(self.In, {
      self,
      self.OnEnd
    })
    self:PlayAnimation(self.In)
  end
end

function M:OnEnd()
  if self.Out then
    self:UnbindAllFromAnimationFinished(self.Out)
    self:BindToAnimationFinished(self.Out, {
      self,
      function()
        self:HideAllUIWithOutSelf(false, "Chapter_Transition")
        if self.Func then
          self.Func()
          self.Func = nil
        end
        self:Close()
      end
    })
    self:PlayAnimation(self.Out)
  end
end

function M:SetSwitchIndex()
  local Language = CommonConst.SystemLanguage
  if Language == CommonConst.SystemLanguages.CN then
    self.WS_TopTextSign:SetActiveWidgetIndex(0)
    self.WS_BottomSubTitle:SetActiveWidgetIndex(0)
    self:SetText(self.Text_TopTextSign_ZH_CHS, self.Text_BottomSubTitle_ZH_CHS)
  elseif Language == CommonConst.SystemLanguages.TC then
    self.WS_TopTextSign:SetActiveWidgetIndex(1)
    self.WS_BottomSubTitle:SetActiveWidgetIndex(1)
    self:SetText(self.Text_TopTextSign_ZH_CHT, self.Text_BottomSubTitle_ZH_CHT)
  elseif Language == CommonConst.SystemLanguages.EN then
    self.WS_TopTextSign:SetActiveWidgetIndex(2)
    self.WS_BottomSubTitle:SetActiveWidgetIndex(2)
    self:SetText(self.Text_TopTextSign_EN, self.Text_BottomSubTitle_EN)
  elseif Language == CommonConst.SystemLanguages.JP then
    self.WS_TopTextSign:SetActiveWidgetIndex(3)
    self.WS_BottomSubTitle:SetActiveWidgetIndex(3)
    self:SetText(self.Text_TopTextSign_JA, self.Text_BottomSubTitle_JA)
  elseif Language == CommonConst.SystemLanguages.KR then
    self.WS_TopTextSign:SetActiveWidgetIndex(4)
    self.WS_BottomSubTitle:SetActiveWidgetIndex(4)
    self:SetText(self.Text_TopTextSign_KR, self.Text_BottomSubTitle_KR)
  end
end

function M:SetText(TopText, BottomText)
  TopText:SetText(GText(self.Title))
  BottomText:SetText(GText(self.CantoName))
end

return M
