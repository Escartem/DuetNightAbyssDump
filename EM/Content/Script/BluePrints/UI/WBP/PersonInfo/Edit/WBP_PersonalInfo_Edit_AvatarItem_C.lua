require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:Construct()
  self.Btn_Click.OnClicked:Add(self, self.OnItemClick)
  self.Btn_Click.OnHovered:Add(self, self.OnItemHover)
  self.Btn_Click.OnUnHovered:Add(self, self.OnItemUnHover)
  self.Btn_Click.OnPressed:Add(self, self.OnItemPress)
end

function M:OnItemClick()
  self:StopAllAnimations()
  self:PlayAnimation(self.Click)
end

function M:OnItemHover()
  AudioManager(self):PlayUISound(nil, "event:/ui/common/hover_btn_large_crystal", nil, nil)
  self:PlayAnimation(self.Hover)
end

function M:OnItemUnHover()
  if self:IsAnimationPlaying(self.Click) then
    return
  end
  self:PlayAnimation(self.UNHover)
end

function M:OnItemPress()
  self:PlayAnimation(self.Press)
end

function M:FreshView(image, name, lv, Rarity, Uuid)
  self.bIsEmpty = false
  self.Uuid = Uuid
  local MaterialInstance = self.Image_Avatar:GetDynamicMaterial()
  MaterialInstance:SetTextureParameterValue("IconMap", image)
  self:StopAllAnimations()
  self.Text_Lv:SetText(GText("Lv." .. lv))
  self.Text_AvatarName:SetText(GText(name))
  self.Image_Avatar:SetVisibility(UIConst.VisibilityOp.Visible)
  self.Text_Lv:SetVisibility(UIConst.VisibilityOp.Visible)
  self.Text_AvatarName:SetVisibility(UIConst.VisibilityOp.Visible)
  self.Btn_Removes:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  self.Image_BottomBlack:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  self.Group_Add:SetVisibility(UIConst.VisibilityOp.Collapsed)
  if 2 == Rarity then
    self:PlayAnimation(self.Green)
  elseif 3 == Rarity then
    self:PlayAnimation(self.Blue)
  elseif 4 == Rarity then
    self:PlayAnimation(self.Purple)
  else
    self:PlayAnimation(self.Yellow)
  end
end

function M:SetEmpty()
  self.bIsEmpty = true
  self.Uuid = nil
  self:StopAllAnimations()
  self:Playanimation(self.NormalColor)
  self.Image_BottomBlack:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Group_Add:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  self.Image_Avatar:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Text_Lv:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Text_AvatarName:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Group_WeaponSign:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Btn_Removes:SetVisibility(UIConst.VisibilityOp.Collapsed)
end

function M:SetFocusCallback(func)
  if type(func) == "function" then
    self.FocusCallback = func
  else
    ScreenPrint("\228\188\160\229\133\165\231\154\132\229\143\130\230\149\176\228\184\141\230\152\175\229\135\189\230\149\176")
  end
end

function M:OnFocusReceived()
  if self.FocusCallback and type(self.FocusCallback) == "function" then
    self.FocusCallback()
    return true
  end
  return UIUtils.Handled
end

function M:SetFocusLostCallback(func)
  if type(func) == "function" then
    self.RemoveCallback = func
  else
    ScreenPrint("\228\188\160\229\133\165\231\154\132\229\143\130\230\149\176\228\184\141\230\152\175\229\135\189\230\149\176")
  end
end

function M:OnFocusLost()
  if self.RemoveCallback and type(self.RemoveCallback) == "function" then
    self.RemoveCallback()
    return true
  end
  return UIUtils.Handled
end

return M
