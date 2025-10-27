require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:Construct()
  self.EMCustomButton_105.OnHovered:Add(self, self.OnBtnHovered)
  self.EMCustomButton_105.OnUnhovered:Add(self, self.OnBtnUnhovered)
  self.EMCustomButton_105.OnPressed:Add(self, self.OnBtnPressed)
  self.EMCustomButton_105.OnReleased:Add(self, self.OnBtnReleased)
  self.EMCustomButton_105.OnClicked:Add(self, self.OnBtnClicked)
end

function M:Init(Parent, CliclFunction, ...)
  self.Parent = Parent
  self.Tab_Special:SetText(GText("UI_BattlePass_GoldRank"))
  self.VX_Lock:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.VX_Lock_1:SetVisibility(UIConst.VisibilityOp.Collapsed)
  if self.Parent.Avatar and self.Parent.Avatar.BattlePassUnlockRank2 then
    self.Icon_Lock:SetVisibility(UIConst.VisibilityOp.Collapsed)
  else
    self.Icon_Lock:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  end
  self:BindEventOnClicked(Parent, CliclFunction, ...)
end

function M:Unlock()
end

function M:SetReddotVisibility(Visibility)
  self.Reddot:SetVisibility(Visibility)
end

function M:PlayUnlockAnimation()
  AudioManager(self):PlayUISound(self, "event:/ui/common/battle_pass_high_level_poem_unlock", nil, nil)
  self.VX_Lock:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  self.VX_Lock_1:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  self:PlayAnimation(self.UnLock)
  self:BindToAnimationFinished(self.UnLock, {
    self,
    function()
      self:UnbindAllFromAnimationFinished(self.UnLock)
      self.VX_Lock:SetVisibility(UIConst.VisibilityOp.Collapsed)
      self.VX_Lock_1:SetVisibility(UIConst.VisibilityOp.Collapsed)
    end
  })
end

function M:OnBtnHovered()
  self.IsHovering = true
  if self.IsPressing then
    return
  end
  self:StopAllAnimations()
  self:PlayAnimation(self.Hover)
end

function M:OnBtnUnhovered()
  self.IsHovering = false
  if not self.IsPressing then
    self:StopAllAnimations()
    self:PlayAnimation(self.Unhover)
  end
end

function M:OnBtnPressed()
  self.IsPressing = true
  self:StopAllAnimations()
  self:PlayAnimation(self.Press)
end

function M:OnBtnReleased()
  self.IsPressing = false
  if not self.IsHovering then
    self:StopAllAnimations()
    self:PlayAnimationReverse(self.Normal)
  else
    self:StopAllAnimations()
    self:PlayAnimationReverse(self.Hover)
  end
end

function M:OnBtnClicked()
  self:StopAllAnimations()
  self:PlayAnimation(self.Click)
  if self.Obj and self.Func then
    self.Func(self.Obj, table.unpack(self.Params))
  end
end

function M:BindEventOnClicked(Obj, Func, ...)
  if not Obj or not Func then
    return
  end
  self.Obj = Obj
  self.Func = Func
  self.Params = {
    ...
  }
end

return M
