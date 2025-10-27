require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:BP_OnEntryReleased()
  if self.Content then
    self.Content.Entry = nil
  end
end

function M:OnListItemObjectSet(Content)
  self.Content = Content
  self.Content.Entry = self
  self.Buff:Init(nil, true, self.Content.Type, false, nil)
  self.Buff:InitBuffInfo(self.Content.BuffId)
  self.Text_BuffName:SetText(GText(self.Content.Name))
  self.Text_BuffDesc:SetText(GText(self.Content.Des))
  self.Text_BuffDesc_Lock:SetText(GText(self.Content.LockDes))
  self:SetCanCancelSelection(self.Content.CanCancelSelection)
  self:SetSelected(self.Content.IsSelect)
  self:SetIsUnlock()
  self:BindEventOnClicked(self.Content.ClickEvent.Obj, self.Content.ClickEvent.Func, table.unpack(Content.ClickEvent.Params))
end

function M:BindEventOnClicked(Obj, Func, ...)
  self.Com_List:BindEventOnClicked(Obj, Func, ...)
end

function M:SetSelected(IsSelect)
  self.Content.IsSelect = IsSelect
  if IsSelect then
    self.WidgetSwitcher_Option:SetActiveWidgetIndex(1)
    self.Com_List:SelectCell()
  else
    self.WidgetSwitcher_Option:SetActiveWidgetIndex(0)
    self.Com_List:OnCellUnSelect()
  end
end

function M:SetSelectedByClick(IsSelect)
  self.Content.IsSelect = IsSelect
  if IsSelect then
    self.WidgetSwitcher_Option:SetActiveWidgetIndex(1)
  else
    self.WidgetSwitcher_Option:SetActiveWidgetIndex(0)
  end
end

function M:SetCanCancelSelection(CanCancelSelection)
  self.Com_List:SetCanCancelSelection(CanCancelSelection)
end

function M:CheckIsUnlock()
  local BuffInfo
  local CurEventId = DataMgr.PaotaiEventConstant.PaotaiGameEventId.ConstantValue
  if self.Content.Type == "Normal" then
    BuffInfo = DataMgr.PaotaiGameProp
  elseif self.Content.Type == "Weapon" then
    BuffInfo = DataMgr.PaotaiGameWeapon
  end
  if BuffInfo then
    local Avatar = GWorld:GetAvatar()
    if Avatar then
      local Info = BuffInfo[self.Content.Id]
      if not Info then
        return false
      end
      if not Info.DungeonId then
        return true
      end
      local IsUnlock = false
      local PaotaiGame = Avatar.PaotaiGame
      local PaotaiMiniGameInfo = DataMgr.PaotaiMiniGame[Info.DungeonId]
      if PaotaiGame and PaotaiMiniGameInfo then
        local PaotaiGameEventInfo = PaotaiGame[CurEventId]
        local PaotaiGameLevelInfo
        if PaotaiGameEventInfo then
          PaotaiGameLevelInfo = PaotaiGameEventInfo[Info.DungeonId]
        end
        if PaotaiGameLevelInfo then
          local MaxScore = PaotaiGameLevelInfo.MaxScore or 0
          local StarNum = 0
          for _, TargetScore in ipairs(PaotaiMiniGameInfo.Level) do
            if TargetScore <= MaxScore then
              StarNum = StarNum + 1
            end
          end
          if StarNum >= DataMgr.PaotaiEventConstant.PreDungeonRequiredStar.ConstantValue then
            IsUnlock = true
          end
        end
      end
      return IsUnlock
    else
      return false
    end
  else
    return false
  end
end

function M:SetIsUnlock()
  self.Content.IsUnlock = self:CheckIsUnlock()
  if self.Content.IsUnlock then
    self.Com_List:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    self.WidgetSwitcher_Text:SetActiveWidgetIndex(0)
  else
    self.Com_List:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
    self.WidgetSwitcher_Text:SetActiveWidgetIndex(1)
    self.WidgetSwitcher_Option:SetActiveWidgetIndex(2)
  end
end

return M
