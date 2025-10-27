require("UnLua")
local M = Class({
  "BluePrints.UI.WBP.Armory.Widget.Pet.WBP_Armory_Pet_SkillItem_C"
})

function M:OnListItemObjectSet(Content)
  if not Content then
    return
  end
  self:RealCloseMenu()
  self.Content = Content
  Content.UI = self
  self.Owner = Content.Owner
  self._OnAddedToFocusPath = Content.OnAddedToFocusPath
  self._OnRemovedFromFocusPath = Content.OnRemovedFromFocusPath
  self._OnMenuOpenChanged = Content.OnMenuOpenChanged
  self.Name_Ability:SetText(Content.Name)
  self.Icon_Ability:SetIcon(Content.Icon)
  self.Icon_Ability:SetDispathchColor(Content.DispatchTag, not Content.Unlocked)
  if Content.Unlocked then
    self.Icon_Lock:SetVisibility(UIConst.VisibilityOp.Collapsed)
  else
    self.Icon_Lock:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    self.Name_Ability:SetRenderOpacity(self.Locked_NameOpacity)
  end
  Content.OnMenuClosed = self.OnMenuClosed
  Content.OnMenuRealClosed = self.OnMenuRealClosed
  self.MenuInitParams = Content
end

function M:_OnMenuOpenChanged(bIsOpen)
  if bIsOpen then
    self:SetTipsMode(true)
  else
    self:SetTipsMode(false)
  end
end

return M
