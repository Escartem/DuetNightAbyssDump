local Guide_Text_Warning_PC = Class("BluePrints.UI.UI_PC.Guide.Guide_TipsAsyncActionUIBase")

function Guide_Text_Warning_PC:InitializeData(Duration, ForbidTips)
  if not self:OnTipBegin(Duration, nil, self.In, self.Out) then
    self:OnClose()
    return
  end
  self.ForbidTips = ForbidTips or false
  AudioManager(self):PlayUISound(self, "event:/ui/common/battle_warning_loop", "BattleWarning", nil)
end

function Guide_Text_Warning_PC:OnClose()
  self:OnTipRealEnd()
end

function Guide_Text_Warning_PC:Destruct()
  self:OnTipRealEnd()
  self.Super.Destruct(self)
end

function Guide_Text_Warning_PC:OnTipRealEnd()
  AudioManager(self):StopSound(self, "BattleWarning")
  self:StopAnimation(self.Loop)
  self.Super.OnTipRealEnd(self)
end

function Guide_Text_Warning_PC:OnAnimationFinished(InAnimation)
  if InAnimation == self.In then
    self:PlayAnimation(self.Loop, 1, 0)
    self.Img_Glow:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  elseif InAnimation == self.OutAnim then
    local UIManager = GWorld.GameInstance:GetGameUIManager()
    if UIManager and not self.ForbidTips then
      UIManager:ShowUITip(UIConst.Tip_CommonWarning, GText("UI_Alert_100"), 3)
    end
  end
end

return Guide_Text_Warning_PC
