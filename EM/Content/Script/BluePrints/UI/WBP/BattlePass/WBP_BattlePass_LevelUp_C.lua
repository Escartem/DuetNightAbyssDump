require("UnLua")
local M = Class({
  "BluePrints.UI.BP_UIState_C"
})

function M:Construct()
  self.Super.Construct(self)
  self.Text_LevelUp:SetText(GText("UI_BattlePass_LevelUp"))
end

function M:OnLoaded(...)
  self.Super.OnLoaded(self, ...)
  self:SetFocus()
  self:PlayInAnim()
  self.Level = (...)
  self.BattlePass_Level.Text_Level:SetText(self.Level)
end

function M:PlayInAnim()
  AudioManager(self):PlayUISound(self, "event:/ui/common/battle_pass_level_upgrade", nil, nil)
  self:PlayAnimation(self.In)
  self:BindToAnimationFinished(self.In, {
    self,
    function()
      self:UnbindAllFromAnimationFinished(self.In)
      self:PlayAnimation(self.Out)
    end
  })
  self:BindToAnimationFinished(self.Out, {
    self,
    function()
      self:UnbindAllFromAnimationFinished(self.Out)
      self:Close()
    end
  })
end

function M:Refresh(Level)
  if Level > self.Level then
    self.Level = Level
    self.BattlePass_Level.Text_Level:SetText(self.Level)
  end
end

function M:Close()
  self:UnbindAllFromAnimationFinished(self.In)
  self:UnbindAllFromAnimationFinished(self.Out)
  self:StopAllAnimations()
  self.Super.Close(self)
  local UIState = UIManager(self):GetCurrentState()
  if UIState then
    UIState:SetFocus()
  end
end

return M
