require("UnLua")
local M = Class({
  "BluePrints.UI.BP_UIState_C"
})

function M:Construct()
  self:BindToAnimationFinished(self.Out, {
    self,
    self.Close
  })
end

function M:OnLoaded(BossSkillToastId)
  local BossSkillToastConfig = DataMgr.BossSkillToast[BossSkillToastId]
  self.Text_Toast_Tips:SetText(GText(BossSkillToastConfig.TextMapKey))
  self:PlayAnimation(self.In)
  self:AddTimer(BossSkillToastConfig.Duration, function()
    self:PlayAnimation(self.Out)
  end)
  local UIConfigName = self:GetUIConfigName()
  if "BossSkillToast" == UIConfigName then
    AudioManager(self):PlayUISound(self, "event:/ui/common/skill_name_toast_simple", nil, nil)
  else
    AudioManager(self):PlayUISound(self, "event:/ui/common/skill_name_toast_sp", nil, nil)
  end
end

return M
