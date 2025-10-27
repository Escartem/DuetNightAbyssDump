require("UnLua")
local M = Class("BluePrints.UI.WBP.Armory.WBP_Armory_CharSkill_Base_C")

function M:Init(Params)
  M.Super.Init(self, Params)
  self._OnAddedToFocusPath = Params.OnAddedToFocusPath
  self._OnRemovedFromFocusPath = Params.OnRemovedFromFocusPath
  self._OnTreeNodeWidgetAddedToFocusPath = Params.OnTreeNodeWidgetAddedToFocusPath
  self._OnTreeNodeWidgetRemovedFromFocusPath = Params.OnTreeNodeWidgetRemovedFromFocusPath
  self:InitNavigationRules()
end

function M:InitNavigationRules()
  for BranchIdx, BranchWidget in ipairs(self.BranchWidgets) do
    BranchWidget.bIsFocusable = true
    local PreBranchWidget = self.BranchWidgets[BranchIdx - 1]
    if PreBranchWidget then
      for NodeIdx, NodeWidget in ipairs(BranchWidget.TreeNodeWidget) do
        NodeWidget:SetNavigationRuleExplicit(EUINavigation.Up, PreBranchWidget.TreeNodeWidget[NodeIdx])
      end
    else
      for NodeIdx, NodeWidget in ipairs(BranchWidget.TreeNodeWidget) do
        NodeWidget:SetNavigationRuleBase(EUINavigation.Up, EUINavigationRule.Stop)
      end
    end
    local NextBranchWidget = self.BranchWidgets[BranchIdx + 1]
    if NextBranchWidget then
      for NodeIdx, NodeWidget in ipairs(BranchWidget.TreeNodeWidget) do
        NodeWidget:SetNavigationRuleExplicit(EUINavigation.Down, NextBranchWidget.TreeNodeWidget[NodeIdx])
      end
    else
      for NodeIdx, NodeWidget in ipairs(BranchWidget.TreeNodeWidget) do
        NodeWidget:SetNavigationRuleBase(EUINavigation.Down, EUINavigationRule.Stop)
      end
    end
    for NodeIdx, NodeWidget in ipairs(BranchWidget.TreeNodeWidget) do
      NodeWidget:BindEvents(self, {
        OnAddedToFocusPath = self.OnTreeNodeWidgetAddedToFocusPath,
        OnRemovedFromFocusPath = self.OnTreeNodeWidgetRemovedFromFocusPath
      })
      NodeWidget.bIsFocusable = true
      local PreNodeWidget = BranchWidget.TreeNodeWidget[NodeIdx - 1]
      if PreNodeWidget then
        NodeWidget:SetNavigationRuleExplicit(EUINavigation.Left, PreNodeWidget)
      else
        NodeWidget:SetNavigationRuleBase(EUINavigation.Left, EUINavigationRule.Escape)
      end
      local NextNodeWidget = BranchWidget.TreeNodeWidget[NodeIdx + 1]
      if NextNodeWidget then
        NodeWidget:SetNavigationRuleExplicit(EUINavigation.Right, NextNodeWidget)
      else
        NodeWidget:SetNavigationRuleBase(EUINavigation.Right, EUINavigationRule.Stop)
      end
    end
  end
end

function M:OnAddedToFocusPath()
  if self._OnAddedToFocusPath then
    self._OnAddedToFocusPath(self.Parent, self)
  end
end

function M:OnRemovedFromFocusPath()
  if self._OnRemovedFromFocusPath then
    self._OnRemovedFromFocusPath(self.Parent, self)
  end
end

function M:OnTreeNodeWidgetAddedToFocusPath(TreeNodeInfo)
  self.SelectedNodeInfo = TreeNodeInfo
  if self._OnTreeNodeWidgetAddedToFocusPath then
    self._OnTreeNodeWidgetAddedToFocusPath(self.Parent, TreeNodeInfo)
  end
end

function M:OnTreeNodeWidgetRemovedFromFocusPath(TreeNodeInfo)
  if self._OnTreeNodeWidgetRemovedFromFocusPath then
    self._OnTreeNodeWidgetRemovedFromFocusPath(self.Parent, TreeNodeInfo)
  end
end

function M:OnFocusReceived(MyGeometry, InFocusEvent)
  if self.SelectedNodeInfo then
    return UWidgetBlueprintLibrary.SetUserFocus(UWidgetBlueprintLibrary.Handled(), self.SelectedNodeInfo.UI)
  end
  return UWidgetBlueprintLibrary.SetUserFocus(UWidgetBlueprintLibrary.Handled(), self.BranchWidgets[1])
end

function M:OnSkillDetailsDestruct(_NodeInfo)
  M.Super.OnSkillDetailsDestruct(self, _NodeInfo)
  local TreeInfo = self:GetSkillTreeInfo()
  for i, BranchInfo in ipairs(TreeInfo) do
    for j, NodeInfo in ipairs(BranchInfo) do
      if _NodeInfo.SkillId and _NodeInfo.SkillId == NodeInfo.SkillId or _NodeInfo.AttrId and _NodeInfo.AttrId == NodeInfo.AttrId then
        self.SelectedNodeInfo = NodeInfo
        break
      end
    end
  end
end

return M
