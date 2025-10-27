require("UnLua")
local StringUtils = require("Utils.StringUtils")
local M = Class({
  "BluePrints.Common.TimerMgr",
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:Construct()
  self.Text_Input.OnTextChanged:Add(self, self.OnInputTextChanged)
  self.Text_Input.OnReleased:Add(self, self.OnInputTextReleased)
  self.Text_Input.OnTextCommitted:Add(self, self.OnInputTextCommitted)
  self.LimitCount:SetText(DataMgr.GlobalConstant.ChatMsgMaxLen.ConstantValue)
  self.Group_InputTips:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.NowCount:SetText(0)
  self.TipOutTimer = "TipOutTimer"
  self.NextFrameKey = "WBP_Chat_InputBlock_C_NextFrame"
end

function M:Destruct()
  self.Text_Input.OnTextChanged:Remove(self, self.OnInputTextChanged)
  self.Text_Input.OnReleased:Remove(self, self.OnInputTextReleased)
  self.Text_Input.OnTextCommitted:Remove(self, self.OnInputTextCommitted)
  if self:IsExistTimer(self.TipOutTimer) then
    self:RemoveTimer(self.TipOutTimer, true)
  end
  if self:IsExistTimer(self.NextFrameKey) then
    self:RemoveTimer(self.NextFrameKey, true)
  end
end

function M:SetOnTextChangedCallback(Callback)
  self.OnTextChangedCallback = Callback
end

function M:SetOnTextCommittedCallback(Callback)
  self.OnTextCommittedCallback = Callback
end

function M:FocusInputField()
  Utils.Traceback(LXYTag, "ChatInputBlock::FocusInputField")
  self._bFocusing = true
  self.Text_Input:SetFocus()
  self:PlayAnimationForward(self.Click)
  self._bFocusing = false
end

function M:OnInputTextCommitted(Text, CommitType)
  if self._bFocusing then
    return
  end
  if "" == Text then
    self.Text_Input:SetHintText(GText("UI_Chat_InputHint"))
  end
  if CommitType == ETextCommit.OnEnter then
    if self.OnTextCommittedCallback then
      self.OnTextCommittedCallback(Text, CommitType)
    end
    if self:IsExistTimer(self.NextFrameKey) then
      self:RemoveTimer(self.NextFrameKey, true)
    end
    self:AddTimer(0.01, function()
      self:FocusInputField()
    end, false, 0, self.NextFrameKey, true)
  end
end

function M:OnInputTextReleased()
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_input_bar", nil, nil)
end

function M:OnInputTextChanged(Text)
  if "" == Text then
    self.Text_Input:SetHintText(GText("UI_Chat_InputHint"))
  else
    self.Text_Input:SetHintText("")
  end
  local TextTable = StringUtils.Utf8ToTable(Text)
  local MaxLen = DataMgr.GlobalConstant.ChatMsgMaxLen.ConstantValue
  local bOverLength = MaxLen < #TextTable
  if bOverLength then
    self:ShowTip(true, GText("UI_REGISTER_OVERLENGTH"))
    TextTable = table.slice(TextTable, 1, MaxLen)
    self.Text_Input:SetText(table.concat(TextTable))
  end
  self.NowCount:SetText(#TextTable)
  if self.OnTextChangedCallback then
    self.OnTextChangedCallback(self:GetText(), bOverLength)
  end
end

function M:GetText()
  return self.Text_Input:GetText()
end

function M:SetText(Text)
  self.Text_Input:SetText(Text)
  self:OnInputTextChanged(Text)
  if "" == Text then
    self.Text_Input:SetHintText(GText("UI_Chat_InputHint"))
  end
end

function M:ShowTip(bWaring, Text)
  if self:IsExistTimer(self.TipOutTimer) then
    self:RemoveTimer(self.TipOutTimer, true)
  end
  self.Group_Forbbiden:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Group_Limit:SetVisibility(UIConst.VisibilityOp.Collapsed)
  if bWaring then
    self.Group_Limit:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  else
    self.Group_Forbbiden:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  end
  AudioManager(self):PlayUISound(self, "event:/ui/common/input_err", nil, nil)
  self.Text_InputTips:SetText(Text)
  self:PlayAnimation(self.Remind_In)
  local Duration = 1.5 - (self.Remind_In:GetEndTime() - self.Remind_In:GetStartTime())
  self:AddTimer(Duration, function()
    self:PlayAnimation(self.Remind_Out)
  end, false, 0, self.TipOutTimer, true)
end

return M
