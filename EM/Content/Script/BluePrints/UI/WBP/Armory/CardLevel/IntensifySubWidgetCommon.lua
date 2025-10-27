local Component = {}

function Component:UpdataAttrListView(Attrs, ComparedAttrs, bAnim)
  self.List_Atrr:ClearListItems()
  local Idx = 1
  for i, Attr in ipairs(Attrs) do
    if ComparedAttrs and not table.isempty(ComparedAttrs) then
      if Attr.AttrValue ~= ComparedAttrs[i].AttrValue then
        local Obj = NewObject(UIUtils.GetCommonItemContentClass())
        Obj.Name = GText(Attr.AttrName)
        Obj.Value = Attr.AttrValue or 0
        Obj.CmpValue = ComparedAttrs[i].AttrValue or Attr.AttrValue
        Obj.Idx = Idx
        Obj.Delta = ComparedAttrs[i].Delta
        Obj.Style = Attr.Style or "ShowValue"
        Obj.CalcColorType = ComparedAttrs[i].CalcColorType
        self.List_Atrr:AddItem(Obj)
        Idx = Idx + 1
      end
    else
      local Obj = NewObject(UIUtils.GetCommonItemContentClass())
      Obj.Name = GText(Attr.AttrName)
      Obj.Value = Attr.AttrValue or 0
      Obj.Idx = Idx
      Obj.Style = Attr.Style or "ShowValue"
      self.List_Atrr:AddItem(Obj)
      Idx = Idx + 1
    end
  end
  if bAnim then
    self.List_Atrr:RequestPlayEntriesAnim()
  end
end

function Component:UpdateDesc(Desc)
  if not string.isempty(Desc) then
    self.Text_Detail:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    self.Text_Detail:SetText(Desc)
  else
    self.Text_Detail:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

return Component
