require("UnLua")
local UIUtils = require("Utils.UIUtils")
local M = Class("BluePrints.UI.UI_PC.Common.Common_Dialog.Common_Dialog_ContentBase")

function M:Construct()
end

function M:PreInitContent(Params, PopupData, Owner)
  self.Super.PreInitContent(self, Params, PopupData, Owner)
  self.EntryAnimIdx = 0
  self:BindDialogEvent("UpdateAttrList", self.UpdataAttrListView)
  self:BindDialogEvent("PlayAttrListInAnim", self.PlayInAnim)
  UIUtils.StopListViewFramingInAnimation(self.ListView_Num)
end

function M:UpdataAttrListView(Attrs, ComparedAttrs)
  self.Attrs = Attrs
  self.ComparedAttrs = ComparedAttrs
  self.ListView_Num:SetRenderOpacity(0)
  self.ListView_Num:ClearListItems()
  local Obj
  local Class = UIUtils.GetCommonItemContentClass()
  for i, Attr in ipairs(self.Attrs) do
    Obj = NewObject(Class)
    Obj.AttrName = Attr.AttrName
    Obj.AttrValue = Attr.AttrValue or 0
    Obj.CmpValue = self.ComparedAttrs[i].AttrValue or 0
    Obj.AttrDesc = Attr.AttrDesc
    Obj.Idx = i
    Obj.Delta = self.ComparedAttrs[i].Delta or 0
    Obj.Nagative = self.ComparedAttrs[i].Nagative
    self.ListView_Num:AddItem(Obj)
  end
  self.ListView_Num:RequestRefresh()
  self:PlayInAnim()
end

function M:PlayInAnim()
  UIUtils.StopListViewFramingInAnimation(self.ListView_Num, {
    TimerKeys = self._ListInTimers,
    UIState = self
  })
  self._ListInTimers = UIUtils.PlayListViewFramingInAnimation(self, self.ListView_Num)
end

function M:SetSliderBarVisiblity(bVisible)
  self.Size_Box.bOverride_MinDesiredWidth = bVisible
  self.Size_Box.bOverride_MaxDesiredHeight = bVisible
end

return M
