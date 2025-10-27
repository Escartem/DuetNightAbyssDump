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
  UIUtils.StopListViewFramingInAnimation(self.ListView_Attr)
end

function M:InitContent(Params, PopupData, Owner)
  self.Super.InitContent(self, Params, PopupData, Owner)
  if Params.Attrs then
    self:UpdataAttrListView(Params.Attrs)
  end
end

function M:UpdataAttrListView(Attrs, ComparedAttrs)
  self.Attrs = Attrs
  self.ListView_Attr:SetRenderOpacity(0)
  self.ListView_Attr:ClearListItems()
  local Obj
  local Class = UIUtils.GetCommonItemContentClass()
  for i, Attr in ipairs(self.Attrs) do
    Obj = NewObject(Class)
    Obj.AttrName = Attr.AttrName
    Obj.AttrValue = Attr.AttrValue or 0
    Obj.Idx = i
    self.ListView_Attr:AddItem(Obj)
  end
  self.ListView_Attr:RequestRefresh()
  self:PlayInAnim()
end

function M:PlayInAnim()
  UIUtils.StopListViewFramingInAnimation(self.ListView_Attr, {
    TimerKeys = self._ListInTimers,
    UIState = self
  })
  self._ListInTimers = UIUtils.PlayListViewFramingInAnimation(self, self.ListView_Attr)
end

return M
