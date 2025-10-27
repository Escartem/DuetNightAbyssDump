require("UnLua")
local M = Class("BluePrints.UI.BP_UIState_C")

function M:OnLoaded(...)
  self.Super.OnLoaded(self, ...)
  local ShowMessage, LastTime = ...
  self:ShowToast(ShowMessage, LastTime)
  if LastTime > 0 then
    self:AddTimer(LastTime, self.PlayOutAnim)
  end
  AudioManager(self):PlayUISound(self, "event:/ui/common/toast_normal", nil, nil)
end

function M:PlayOutAnim()
  if self:IsAnimationPlaying(self.Out) then
    return
  end
  self:UnbindAllFromAnimationFinished(self.Out)
  self:BindToAnimationFinished(self.Out, {
    self,
    self.Close
  })
  self:PlayAnimation(self.Out)
end

function M:PlayFadeInAnimByIndex(StrengthNum)
  local NeedPlayAnim = 1 == StrengthNum and self.Toast1_2 or self.Toast2_3
  if self:IsAnimationPlaying(NeedPlayAnim) then
    return
  end
  self:PlayAnimation(NeedPlayAnim)
end

function M:ChangeFlashColor(ColorEnum)
  DebugPrint("yklua666 ChangeFlashColor:", ColorEnum)
  if not ColorEnum or 0 == ColorEnum then
    return
  end
  local Enum2AniName = {
    [1] = "Yellow_In",
    [2] = "Red_In"
  }
  self:StopAnimation(self.In)
  self:PlayAnimation(self[Enum2AniName[ColorEnum]])
end

function M:Close()
  local UITipList = UIManager(self):GetUI("CommonTopToastList")
  if nil ~= UITipList then
    UITipList:RemoveUITips(self)
  end
  self.IsClose = true
end

return M
