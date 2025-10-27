require("UnLua")
local RomanNum = Const.RomanNum
local M = Class("BluePrints.UI.BP_UIState_C")

function M:Construct()
  self.Text_LvName:SetText(GText("UI_LEVEL_NAME"))
  self.New_Tag:SetVisibility(ESlateVisibility.Collapsed)
  self.GuidePoint:SetVisibility(ESlateVisibility.Collapsed)
  self.Bg_List:BindEventOnClicked(self, self.OnSubCellClicked)
  self.Bg_List:TryOverrideSoundFunc(function()
    AudioManager(self):PlayUISound(self, "event:/ui/common/click_mid", nil, nil)
  end)
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

function M:OnFocusReceived(MyGeometry, InFocusEvent)
  if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad and self.Bg_List then
    self.Bg_List:OnCellClicked()
  end
  return UE4.UWidgetBlueprintLibrary.Unhandled()
end

function M:InitDungeonInfo(DungeonId, Index, IsShowDungeonName, Parent)
  self.DungeonId = DungeonId
  self.Parent = Parent
  local Data = DataMgr.Dungeon[DungeonId]
  if not Data then
    DebugPrint("ZDX_\230\137\190\228\184\141\229\136\176\229\133\179\229\141\161\230\149\176\230\141\174:", DungeonId)
    return
  end
  if PageJumpUtils:CheckDungeonCondition(Data.Condition) then
    self:SetVisibility(ESlateVisibility.Visible)
    self.Image_Lock:SetVisibility(ESlateVisibility.Collapsed)
    self.WidgetSwitcher_State:SetActiveWidgetIndex(0)
  else
    self.Bg_List.IsCantInteractable = true
    self.WidgetSwitcher_State:SetActiveWidgetIndex(1)
    self:PlayAnimation(self.Forbidden)
  end
  if IsShowDungeonName then
    self.Title_Level:SetText(GText(Data.DungeonName))
  else
    self.Title_Level:SetText(GText(RomanNum[Index]))
  end
  if Data.DungeonLevel then
    self.Text_Lv:SetVisibility(ESlateVisibility.Visible)
    self.Text_Lv:SetText(Data.DungeonLevel)
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
      self.Bg_List.IsCantInteractable = true
    else
      self.Bg_List.IsCantInteractable = false
    end
    if not self.Bg_List.IsSelect then
      self:StopAllAnimations()
      self:PlayAnimation(bIsMatching and self.Forbidden or self.Normal)
      local InnerBg = self.Bg_List
      if InnerBg then
        InnerBg:PlayAnimation(bIsMatching and InnerBg.Forbidden or InnerBg.Normal)
      end
    end
    self:SetVisibility(ESlateVisibility.Visible)
    self.WidgetSwitcher_State:SetActiveWidgetIndex(0)
    self.Image_Lock:SetVisibility(ESlateVisibility.Collapsed)
  else
    self.Bg_List.IsCantInteractable = true
    self.WidgetSwitcher_State:SetActiveWidgetIndex(1)
    self.Image_Lock:SetVisibility(ESlateVisibility.Visible)
    self:PlayAnimation(self.Forbidden)
  end
end

return M
