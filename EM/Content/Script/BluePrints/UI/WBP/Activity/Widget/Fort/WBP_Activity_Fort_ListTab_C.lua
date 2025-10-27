require("UnLua")
local M = Class({
  "BluePrints.UI.BP_UIState_C"
})

function M:Construct()
  self.Avatar = GWorld:GetAvatar()
  self.Button_Area.OnClicked:Add(self, self.OnCellClicked)
  self.Button_Area.OnHovered:Add(self, self.OnCellHovered)
  self.Button_Area.OnUnhovered:Add(self, self.OnCellUnhovered)
  self.Button_Area.OnPressed:Add(self, self.OnCellPressed)
  self.Button_Area.OnReleased:Add(self, self.OnCellReleased)
end

function M:BP_OnEntryReleased()
  if self.Content then
    self.Content.Entry = nil
  end
end

function M:OnListItemObjectSet(Content)
  self.Content = Content
  self.Content.Entry = self
  local PaotaiGame = self.Avatar.PaotaiGame
  self:UnBindEventOnClicked()
  if self.Content.ClickEvent then
    self:BindEventOnClicked(self.Content.ClickEvent.Obj, self.Content.ClickEvent.Func, self.Content.ClickEvent.Params)
  end
  self.Text_Num:SetText(self.Content.Id)
  self.Text_MaxScore:SetText(GText("PaotaiGame_MaxScore"))
  local CurrentTime = TimeUtils.NowTime()
  if CurrentTime < self.Content.StartTime then
    self.WidgetSwitcher_State:SetActiveWidgetIndex(1)
    self.Text_Lock:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
    self:SetRefreshTimer()
    self.Content.LockReason = "Time"
  else
    self.Text_Lock:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self:RemoveRefreshTimer()
    if self.Content.PreDungeon then
      local PrePaotaiMiniGameInfo = DataMgr.PaotaiMiniGame[self.Content.PreDungeon]
      local IsLock = false
      if PrePaotaiMiniGameInfo and PaotaiGame then
        local PaotaiGameEventInfo = PaotaiGame[self.Content.EventId]
        local PaotaiGameLevelInfo
        if PaotaiGameEventInfo then
          PaotaiGameLevelInfo = PaotaiGameEventInfo[self.Content.PreDungeon]
        end
        if PaotaiGameLevelInfo then
          local MaxScore = PaotaiGameLevelInfo.MaxScore or 0
          local StarNum = 0
          for _, TargetScore in ipairs(PrePaotaiMiniGameInfo.Level) do
            if TargetScore <= MaxScore then
              StarNum = StarNum + 1
            end
          end
          if StarNum < DataMgr.PaotaiEventConstant.PreDungeonRequiredStar.ConstantValue then
            IsLock = true
          end
        else
          IsLock = true
        end
      end
      if not IsLock then
        self.WidgetSwitcher_State:SetActiveWidgetIndex(0)
        self.Content.LockReason = nil
      else
        self.WidgetSwitcher_State:SetActiveWidgetIndex(1)
        self.Content.LockReason = "PreDungeon"
      end
    else
      self.WidgetSwitcher_State:SetActiveWidgetIndex(0)
      self.Content.LockReason = nil
    end
  end
  self.PaotaiGameLevelInfo = nil
  if PaotaiGame then
    local PaotaiGameEventInfo = PaotaiGame[self.Content.EventId]
    if PaotaiGameEventInfo then
      self.PaotaiGameLevelInfo = PaotaiGameEventInfo[self.Content.DungeonId]
    end
  end
  local MaxScore = 0
  if self.PaotaiGameLevelInfo and self.PaotaiGameLevelInfo.MaxScore then
    MaxScore = self.PaotaiGameLevelInfo.MaxScore
  end
  self.Num_Score:SetText(MaxScore)
  local StarNum = 0
  for _, TargetScore in ipairs(self.Content.Level) do
    if TargetScore <= MaxScore then
      StarNum = StarNum + 1
    end
  end
  for i = 1, 3 do
    local StarMat = self["Image_Star_" .. i]:GetDynamicMaterial()
    if i <= StarNum then
      StarMat:SetScalarParameterValue("Saturation", 0)
    else
      StarMat:SetScalarParameterValue("Saturation", 1)
    end
  end
end

function M:RemoveRefreshTimer()
  self:RemoveTimer("CountDownTimer")
end

function M:SetRefreshTimer()
  self:AddTimer(1, self.SetTime, true, -1, "CountDownTimer", true)
end

function M:SetTime()
  if self.Content.StartTime <= TimeUtils.NowTime() then
    self:OnListItemObjectSet(self.Content)
  end
  local TimeDict, TimeCount = UIUtils.GetLeftTimeStrStyle2(self.Content.StartTime, TimeUtils.NowTime())
  local FinalResult = ""
  if TimeDict then
    for TimeCount, ThisTimeInfo in ipairs(TimeDict) do
      if TimeCount > 2 then
        DebugPrint("WBP_Com_Time SetTimeText TimeCount too much, 2 need but get more")
        break
      end
      FinalResult = string.format("%s%02d%s", FinalResult, ThisTimeInfo.TimeValue, GText("UI_GameEvent_TimeRemain_" .. ThisTimeInfo.TimeType))
    end
  else
    FinalResult = "-"
  end
  self.Text_Lock:SetText(FinalResult)
end

function M:BindEventOnClicked(Obj, Func, Params)
  if not Obj or not Func then
    return
  end
  self.Obj = Obj
  self.Func = Func
  self.Params = Params
end

function M:UnBindEventOnClicked()
  self.Obj = nil
  self.Func = nil
  self.Params = nil
end

function M:OnCellClicked()
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_level_02", nil, nil)
  return self:OnCellClickedWithoutSound()
end

function M:OnCellClickedWithoutSound()
  if self.Content.IsSelect then
    return false
  end
  if self.Content.LockReason then
    if self.Content.LockReason == "Time" then
      UE.UKismetSystemLibrary.PrintString(self, "\230\151\182\233\151\180\230\156\170\229\136\176")
    elseif self.Content.LockReason == "PreDungeon" then
      UE.UKismetSystemLibrary.PrintString(self, "\229\137\141\231\189\174\229\133\179\229\141\161\230\156\170\230\187\161\232\182\179")
    end
    return false
  else
    if self.Obj and self.Func then
      self.Func(self.Obj, table.unpack(self.Params))
    end
    self:StopAllAnimations()
    self:PlayAnimation(self.Click)
    return true
  end
end

function M:OnCellHovered()
  if self.Content.IsSelect then
    return
  end
  self.Hovered = true
  self:StopAnimation(self.Normal)
  self:StopAnimation(self.Lock)
  self:PlayAnimation(self.Hover)
end

function M:OnCellUnhovered()
  if self.Content.IsSelect then
    return
  end
  self.Hovered = false
  self:StopAnimation(self.Hover)
  if self.Content.LockReason then
    self:PlayAnimation(self.Lock)
  else
    self:PlayAnimation(self.Normal)
  end
end

function M:OnCellPressed()
  if self.Content.IsSelect then
    return
  end
  self:PlayAnimation(self.Press)
end

function M:OnCellReleased()
  if self.Content.IsSelect then
    return
  end
  self:StopAnimation(self.Press)
  if self.Hovered then
    self:PlayAnimation(self.Hover)
  elseif self.Content.LockReason then
    self:PlayAnimation(self.Lock)
  else
    self:PlayAnimation(self.Normal)
  end
end

function M:SetSelected(IsSelect)
  self.Content.IsSelect = IsSelect
  self:StopAllAnimations()
  if IsSelect then
  elseif self.Content.LockReason then
    self:PlayAnimation(self.Lock)
  else
    self:PlayAnimation(self.Normal)
  end
end

return M
