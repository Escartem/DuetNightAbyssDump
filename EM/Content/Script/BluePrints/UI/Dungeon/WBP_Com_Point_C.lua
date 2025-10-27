require("UnLua")
local WBP_Battle_ProcessPoint_C = Class("BluePrints.UI.BP_EMDungeonWidget_C")

function WBP_Battle_ProcessPoint_C:Construct()
  self.State = {
    "Lock",
    "Unlock",
    "Interaction",
    "CountDown",
    "Complete",
    "Fail"
  }
  self.Panel = {
    self.Panel_Lock,
    self.Panel_Interaction,
    self.Panel_Complete,
    self.Panel_Fail
  }
end

function WBP_Battle_ProcessPoint_C:InitWidget(Owner, PointIdnex)
  self.Owner = Owner
  self.CurState = ""
  self:SetPointState("Lock")
  self.MyIndex = PointIdnex
  self.MyCountDown = 60
end

function WBP_Battle_ProcessPoint_C:HideAllPanel()
  for key, value in pairs(self.Panel) do
    value:SetVisibility(ESlateVisibility.Collapsed)
  end
end

function WBP_Battle_ProcessPoint_C:StateIndex2StateStr(StateIndex)
  for key, value in ipairs(self.State) do
    if key == StateIndex then
      return value
    end
  end
end

function WBP_Battle_ProcessPoint_C:SetPointState(StateStr, TimerHandleName, CountDownTextmap)
  if not StateStr then
    DebugPrint("thy    StateStr \230\152\175 nil\239\188\140\230\163\128\230\159\165\232\147\157\229\155\190\228\188\160\229\133\165\231\154\132\231\138\182\230\128\129\231\180\162\229\188\149")
    return false
  end
  if self.CurState == StateStr then
    return false
  end
  if "" == TimerHandleName then
    TimerHandleName = nil
  end
  self.CurTimerHandle = TimerHandleName
  self:PlayAnimation(self[self.CurState .. "_Out"])
  self.CurState = StateStr
  self:PlayAnimation(self[self.CurState .. "_In"])
  self:HideAllPanel()
  if "Lock" == StateStr then
    self.Panel_Lock:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self.BG_Bar_UnLock:SetVisibility(ESlateVisibility.Collapsed)
  elseif "Unlock" == StateStr then
    self.Panel_Lock:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self.BG_Bar_UnLock:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    if self.CurTimerHandle then
      self.MyCountDown = CommonUtils.GetClientTimerStructTotalTime(self.CurTimerHandle)
      if 0 == self.MyCountDown then
        GWorld.logger.error("CountDown\228\184\1860, \232\175\183\230\163\128\230\159\165TimeHandleName\233\133\141\231\189\174!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
      end
      self:AddTimer(0.1, self.UpdateCountDownUI, true, 0, "CountDown", true, CountDownTextmap)
    end
  elseif "CountDown" == StateStr then
    self.Panel_Interaction:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self.Panel_Interaction_CD:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self.Panel_Interaction_WT:SetVisibility(ESlateVisibility.Collapsed)
    self.MyCountDown = CommonUtils.GetClientTimerStructTotalTime(self.CurTimerHandle)
    if 0 == self.MyCountDown then
      GWorld.logger.error("CountDown\228\184\1860, \232\175\183\230\163\128\230\159\165TimeHandleName\233\133\141\231\189\174!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
    end
    self:AddTimer(0.1, self.UpdateCountDownUI, true, 0, "CountDown", true, CountDownTextmap)
  elseif "Interaction" == StateStr then
    self.Panel_Interaction:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self.Panel_Interaction_CD:SetVisibility(ESlateVisibility.Collapsed)
    self.Panel_Interaction_WT:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  elseif "Complete" == StateStr then
    self.Panel_Complete:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  elseif "Fail" == StateStr then
    self.Panel_Fail:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  else
    ScreenPrint("thy    SetPointState: \230\156\170\231\159\165\231\138\182\230\128\129 " .. StateStr)
    DebugPrint("thy    SetPointState: \230\156\170\231\159\165\231\138\182\230\128\129 ", StateStr)
  end
  return true
end

function WBP_Battle_ProcessPoint_C:UpdateCountDownUI(CountDownTextmap)
  local DisplayRemainTime = CommonUtils.GetClientTimerStructRemainTime(self.CurTimerHandle)
  if DisplayRemainTime < 0 then
    DisplayRemainTime = 0
  end
  self:UpdateColoBarProgress(DisplayRemainTime)
  if self.CurState == "CountDown" then
    self.Text_CountDown:SetText(string.format(GText(CountDownTextmap), self.Owner:GetTimeStr_Cpp(DisplayRemainTime)))
  end
end

function WBP_Battle_ProcessPoint_C:UpdateColoBarProgress(DisplayRemainTime)
  if self.CurState == "Unlock" then
    self.ColorBarProgress = self.BG_Bar_UnLock:GetDynamicMaterial()
    local Percent = DisplayRemainTime / self.MyCountDown
    self.ColorBarProgress:SetScalarParameterValue("Percent", 1 - Percent)
  elseif self.CurState == "CountDown" then
    self.ColorBarProgress = self.BG_Bar_CD:GetDynamicMaterial()
    local Percent = DisplayRemainTime / self.MyCountDown
    self.ColorBarProgress:SetScalarParameterValue("Percent", 1 - Percent)
  end
end

function WBP_Battle_ProcessPoint_C:UpdateColorBarProgressPercent(Percent)
  if self.CurState == "Unlock" then
    self.ColorBarProgress = self.BG_Bar_UnLock:GetDynamicMaterial()
    self.ColorBarProgress:SetScalarParameterValue("Percent", Percent)
  elseif self.CurState == "CountDown" then
    self.ColorBarProgress = self.BG_Bar_CD:GetDynamicMaterial()
    self.ColorBarProgress:SetScalarParameterValue("Percent", Percent)
  end
end

return WBP_Battle_ProcessPoint_C
