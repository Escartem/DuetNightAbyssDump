require("UnLua")
local M = Class("BluePrints.UI.UI_PC.Common.Common_Button.Common_Button_PC")

function M:Construct()
  M.Super.Construct(self, self.Btn)
end

function M:SetKeyInfo(Key, KeyText)
  self.Key:CreateCommonKey({
    KeyInfoList = {
      {Type = "Text", Text = Key}
    },
    Desc = KeyText
  })
  self.Key_Controller:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "Y"}
    }
  })
end

function M:SwitchNormalAnimation()
  self:FlushAnimations()
  self:PlayAnimation(self.Btn_Normal)
end

function M:OnBtnHovered()
  M.Super.OnBtnHovered(self)
  self:StopLoopRemind()
end

function M:PlayLoopRemind()
  if self.IsHovering then
    return
  end
  if not self:IsAnimationPlaying(self.Remind) then
    self:BindToAnimationFinished(self.Remind, {
      self,
      self.OnRemindAnimationFinished
    })
    self:PlayAnimation(self.Remind)
    AudioManager(self):PlayUISound(self, "event:/ui/minigame/fish_bite", "Camera_Find_Target_Remind", nil)
  end
end

function M:StopLoopRemind()
  if self:IsAnimationPlaying(self.Remind) then
    self:StopAnimation(self.Remind)
  end
  AudioManager(self):StopSound(self, "Camera_Find_Target_Remind")
  self:UnbindFromAnimationFinished(self.Remind, {
    self,
    self.OnRemindAnimationFinished
  })
end

function M:OnUpdateUIStyleByInputTypeChange(CurInputType, CurGamepadName)
  self.WS_Type:SetActiveWidgetIndex(CurInputType == ECommonInputType.Gamepad and 1 or 0)
end

function M:OnRemindAnimationFinished()
  self:PlayAnimation(self.Remind)
  AudioManager(self):PlayUISound(self, "event:/ui/minigame/fish_bite", "Camera_Find_Target_Remind", nil)
end

function M:OnBtnClicked()
  M.Super.OnBtnClicked(self)
end

return M
