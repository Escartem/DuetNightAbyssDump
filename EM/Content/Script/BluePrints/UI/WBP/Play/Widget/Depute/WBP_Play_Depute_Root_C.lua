require("UnLua")
local M = Class({
  "BluePrints.Common.TimerMgr",
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:Construct()
  self.List_Play:ClearListItems()
  self:InitContent()
end

function M:Destruct()
  self:CleanTimer()
  self:StopAllAnimations()
  self:PlayAnimation(self.Out)
end

function M:InitContent()
  local DungeonData = CommonUtils.DeepCopy(DataMgr.SelectDungeon)
  table.sort(DungeonData, function(A, B)
    return A.Sequence < B.Sequence
  end)
  self.List_Play:SetScrollbarVisibility(UIConst.VisibilityOp.Visible)
  for i = 1, #DungeonData, 2 do
    self:AddTimer(self.IntervalTime * (i - 1), function()
      local Content = NewObject(self.LevelCellContentClass)
      Content.ChapterId_L = DungeonData[i].ChapterId
      Content.ChapterId_R = DungeonData[i + 1] and DungeonData[i + 1].ChapterId or nil
      Content.Parent = self
      self.List_Play:AddItem(Content)
      if 1 == self.List_Play:GetDisplayedEntryWidgets():Length() then
        local Count = UIUtils.GetListViewContentMaxCount(self.List_Play, self.List_Play:GetDisplayedEntryWidgets(), true)
        if CommonUtils.GetDeviceTypeByPlatformName() == "PC" then
          local CachedMouseLocation2D = UWidgetLayoutLibrary.GetMousePositionOnViewport(self)
          if USlateBlueprintLibrary.IsUnderLocation(self.List_Play:GetCachedGeometry(), CachedMouseLocation2D) then
            self.List_Play:SetScrollbarVisibility(UIConst.VisibilityOp.Visible)
          else
            self.List_Play:SetScrollbarVisibility(UIConst.VisibilityOp.Hidden)
          end
        end
        if Count <= (#DungeonData + 1) / 2 then
          if CommonUtils.GetDeviceTypeByPlatformName() == "Mobile" then
            self.List_Play:SetScrollbarVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
            self.List_Play:SetControlScrollbarInside(false)
          else
            self.List_Play:SetControlScrollbarInside(true)
          end
        else
          self.List_Play:SetScrollbarVisibility(UIConst.VisibilityOp.Hidden)
        end
      end
    end, false, 0, nil, true)
  end
end

function M:OnAnimationFinished(InAnimation)
end

return M
