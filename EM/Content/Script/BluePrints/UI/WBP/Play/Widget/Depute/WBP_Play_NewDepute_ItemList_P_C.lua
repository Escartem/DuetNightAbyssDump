require("UnLua")
local M = Class({
  "BluePrints.UI.BP_UIState_C"
})

function M:Construct()
  self.Super.Construct(self)
  self.List_Depute:ClearListItems()
  self:AddInputMethodChangedListen()
end

function M:InitContent(Parent)
  local DungeonData = CommonUtils.DeepCopy(DataMgr.SelectDungeon)
  table.sort(DungeonData, function(A, B)
    return A.Sequence < B.Sequence
  end)
  local loadedItemCount = 0
  self.List_Depute:SetScrollbarVisibility(UIConst.VisibilityOp.Visible)
  for i = 1, #DungeonData do
    self:AddTimer(self.IntervalTime * i, function()
      local Content = NewObject(self.LevelCellContentClass)
      Content.ChapterId = DungeonData[i].ChapterId
      Content.Parent = Parent
      self.List_Depute:AddItem(Content)
      if CommonUtils.GetDeviceTypeByPlatformName() == "Mobile" then
        self.List_Depute:SetScrollbarVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
        self.List_Depute:SetControlScrollbarInside(false)
      else
        self.List_Depute:SetControlScrollbarInside(true)
      end
      loadedItemCount = loadedItemCount + 1
      if loadedItemCount > 0 then
        self.List_Depute:NavigateToIndex(0)
      end
    end, false, 0, nil, true)
  end
end

function M:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  if CurInputDevice == ECommonInputType.Touch then
    return
  end
  local IsUseKeyAndMouse = CurInputDevice == ECommonInputType.MouseAndKeyboard
  local ActiveWidgetIndex = IsUseKeyAndMouse and 0 or 1
  if IsUseKeyAndMouse then
    return
  elseif self:HasFocusedDescendants() or self:HasAnyUserFocus() then
    self.List_Depute:NavigateToIndex(0)
  end
end

return M
