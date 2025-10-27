require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:Construct()
  self.Text_AtrrTitle:SetText(GText("UI_Next_Level_Attr"))
end

function M:Init(Params)
  if Params.Title then
    self.Text_AtrrTitle:SetText(Params.Title)
  end
  self:UpdateAttrList(Params.Contents, Params.ContentInGroup, Params.ContentGroups)
end

function M:UpdateAttrList(ContentArray, ContentInGroup, ContentGroups)
  local UIManager = UIManager(self)
  self.ScrollBox_Attr:ClearChildren()
  for index, Obj in ipairs(ContentArray) do
    if not ContentInGroup[index] then
      local Widget = UIManager:_CreateWidgetNew("CharSkillAttrItem")
      Widget:OnListItemObjectSet(Obj)
      self.ScrollBox_Attr:AddChild(Widget)
    end
  end
  for _, Group in ipairs(ContentGroups) do
    local TitleWidget = UIManager:_CreateWidgetNew("CharSkillAtrrTitle")
    TitleWidget:SetText(Group.Name)
    self.ScrollBox_Attr:AddChild(TitleWidget)
    for _, DescIdx in ipairs(Group.DescIdxs) do
      if ContentArray[DescIdx] then
        local Widget = UIManager:_CreateWidgetNew("CharSkillAttrItem")
        Widget:OnListItemObjectSet(ContentArray[DescIdx])
        self.ScrollBox_Attr:AddChild(Widget)
      end
    end
  end
end

function M:PlayInAnim()
  self:StopAllAnimations()
  self:PlayAnimation(self.In)
  self:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
end

function M:PlayOutAnim()
  self:StopAllAnimations()
  self:PlayAnimation(self.Out)
  self:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
end

return M
