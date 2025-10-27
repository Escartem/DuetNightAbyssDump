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
    self:HideAllUIWithOutSelf(true, "FeinaChangeScene")
  end
  self:SetText()
  AudioManager(self):PlayUISound(self, self.AudioPath, nil, nil)
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
        self:HideAllUIWithOutSelf(false, "FeinaChangeScene")
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

function M:SetText()
  self.Text_Day:SetText(GText(self.ChapterName))
  self.Text_Title:SetText(GText(self.Title))
  if self.CantoName == "1.0" then
    self.WS_Day:SetActiveWidgetIndex(0)
    self.Num_F:SetVisibility(UE4.ESlateVisibility.Collapsed)
    local IconImage = LoadObject("/Game/UI/Texture/Static/Atlas/Activity/Feina/DASprite/T_Activity_FeinaEvent_Num_1_DAS.T_Activity_FeinaEvent_Num_1_DAS")
    self.Num:SetBrushResourceObject(IconImage)
  elseif self.CantoName == "2.0" then
    self.WS_Day:SetActiveWidgetIndex(0)
    self.Num_F:SetVisibility(UE4.ESlateVisibility.Visibie)
    local IconImageF = LoadObject("/Game/UI/Texture/Static/Atlas/Activity/Feina/DASprite/T_Activity_FeinaEvent_Num_1_DAS.T_Activity_FeinaEvent_Num_1_DAS")
    self.Num_F:SetBrushResourceObject(IconImageF)
    local IconImage = LoadObject("/Game/UI/Texture/Static/Atlas/Activity/Feina/DASprite/T_Activity_FeinaEvent_Num_2_DAS.T_Activity_FeinaEvent_Num_2_DAS")
    self.Num:SetBrushResourceObject(IconImage)
  elseif self.CantoName == "3.0" then
    self.WS_Day:SetActiveWidgetIndex(0)
    self.Num_F:SetVisibility(UE4.ESlateVisibility.Visibie)
    local IconImageF = LoadObject("/Game/UI/Texture/Static/Atlas/Activity/Feina/DASprite/T_Activity_FeinaEvent_Num_2_DAS.T_Activity_FeinaEvent_Num_2_DAS")
    self.Num_F:SetBrushResourceObject(IconImageF)
    local IconImage = LoadObject("/Game/UI/Texture/Static/Atlas/Activity/Feina/DASprite/T_Activity_FeinaEvent_Num_3_DAS.T_Activity_FeinaEvent_Num_3_DAS")
    self.Num:SetBrushResourceObject(IconImage)
  elseif self.CantoName == "6.0" then
    self.WS_Day:SetActiveWidgetIndex(1)
  end
end

return M
