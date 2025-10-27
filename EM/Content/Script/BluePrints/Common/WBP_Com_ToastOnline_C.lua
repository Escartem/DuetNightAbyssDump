require("UnLua")
local M = Class({
  "BluePrints.UI.BP_UIState_C"
})

function M:OnLoaded(...)
  local Type, Time = ...
  if "In" == Type then
    self:RemoveTimer("OnlineLoop")
    self.Switch_Online:SetActiveWidgetIndex(0)
    self.Text_Toast_In:SetText(GText("UI_OnlineRegion_Enter"))
    if self.In then
      self:UnbindAllFromAnimationFinished(self.In)
      self:BindToAnimationFinished(self.In, {
        self,
        function()
          self:Close()
        end
      })
      AudioManager(self):PlayUISound(self, "event:/ui/common/toast_online", nil, nil)
      self:PlayAnimation(self.In)
    end
  else
    self.Switch_Online:SetActiveWidgetIndex(1)
    self:UnbindAllFromAnimationFinished(self.In)
    self:StopAnimation(self.In)
    AudioManager(self):PlayUISound(self, "event:/ui/common/toast_offline", nil, nil)
    self.Text_Toast_Out:SetText(GText("UI_REGION_EXITONLINE_TIP"))
    self:PlayAnimation(self.In_2)
    self:UpdateTime(Time)
  end
end

function M:UpdateTime(Time)
  self.CurTime = Time
  self.Text_Toast_Out_Time:SetText(self.CurTime)
  self:RemoveTimer("OnlineLoop")
  self:PlayAnimation(self.Loop, 0)
  self:AddTimer(1, function()
    self.CurTime = self.CurTime - 1
    self.Text_Toast_Out_Time:SetText(self.CurTime)
    if self.CurTime <= 0 then
      self:RemoveTimer("OnlineLoop")
      self:PlayAnimation(self.Out_2)
      self:Close()
      return
    end
  end, true, 0, "OnlineLoop")
end

return M
