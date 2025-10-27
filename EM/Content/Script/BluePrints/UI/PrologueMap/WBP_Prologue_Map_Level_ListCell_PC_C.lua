require("UnLua")
local M = Class("BluePrints.UI.BP_EMUserWidget_C")

function M:Construct()
  self.New_Tag:SetVisibility(ESlateVisibility.Collapsed)
  self.Common_GuidePoint_PC:SetVisibility(ESlateVisibility.Collapsed)
  self.Common_List_Subcell_PC:BindEventOnClicked(self, self.OnSubCellClicked)
  EventManager:AddEvent(EventID.TeamMatchTimingStart, self, self.RefreshBtnState)
  EventManager:AddEvent(EventID.TeamMatchTimingEnd, self, self.RefreshBtnState)
end

function M:Destruct()
  EventManager:RemoveEvent(EventID.TeamMatchTimingStart, self)
  EventManager:RemoveEvent(EventID.TeamMatchTimingEnd, self)
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

function M:InitDungeonInfo(DungeonId)
  self.DungeonId = DungeonId
  local Data = DataMgr.Dungeon[DungeonId]
  if not DungeonId then
    DebugPrint("ZDX_DungeonId is nil")
    return
  end
  if PageJumpUtils:CheckDungeonCondition(Data.Condition) then
    self:SetVisibility(ESlateVisibility.Visible)
    self.WidgetSwitcher:SetActiveWidget(self.Content)
    self.Image_Lock:SetVisibility(ESlateVisibility.Collapsed)
  else
    self.Common_List_Subcell_PC.IsCantInteractable = true
    self.Image_Lock:SetVisibility(ESlateVisibility.Visible)
    self:PlayAnimation(self.Forbidden)
  end
  self.DungeonId = DungeonId
  self.Text_Limit:SetText(GText("UI_DUNGEON_LevelLimit"))
  self.Title_Level:SetText(GText(Data.DungeonName))
  if Data.DungeonLevel then
    self.Text_Lv:SetVisibility(ESlateVisibility.Visible)
    self.Text_Lv:SetText(GText(Data.DungeonLevel))
  else
    self.Text_Lv:SetVisibility(ESlateVisibility.Collapsed)
  end
end

function M:OnSubCellClicked()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return false
  end
  if self:IsMatching() then
    return false
  end
  if PageJumpUtils:CheckDungeonCondition(DataMgr.Dungeon[self.DungeonId].Condition, true) then
    self:PlayAnimation(self.Select)
    if self.Obj and self.Func then
      self.Func(self.Obj, table.unpack(self.Params))
    end
  end
end

function M:IsMatching()
  local MatchTimingBar = UIManager(self):GetUIObj("DungeonMatchTimingBar")
  return MatchTimingBar and true
end

function M:RefreshBtnState(bIsMatching)
  if nil == bIsMatching then
    bIsMatching = self:IsMatching()
  end
  local Data = DataMgr.Dungeon[self.DungeonId]
  if PageJumpUtils:CheckDungeonCondition(Data.Condition) then
    if bIsMatching then
      self.Common_List_Subcell_PC.IsCantInteractable = true
    else
      self.Common_List_Subcell_PC.IsCantInteractable = false
    end
    if not self.Common_List_Subcell_PC.IsSelect then
      self:StopAllAnimations()
      self:PlayAnimation(bIsMatching and self.Forbidden or self.Normal)
    end
    self:SetVisibility(ESlateVisibility.Visible)
    self.WidgetSwitcher:SetActiveWidget(self.Content)
    self.Image_Lock:SetVisibility(ESlateVisibility.Collapsed)
  else
    self.Common_List_Subcell_PC.IsCantInteractable = true
    self.Image_Lock:SetVisibility(ESlateVisibility.Visible)
    self:PlayAnimation(self.Forbidden)
  end
end

return M
