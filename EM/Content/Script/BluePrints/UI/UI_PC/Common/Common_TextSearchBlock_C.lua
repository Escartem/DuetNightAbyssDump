require("UnLua")
local M = Class("BluePrints.UI.BP_EMUserWidget_C")

function M:Construct()
  self.EditableText_Search.OnTextChanged:Add(self, self.OnEditTextChanged)
  self.Btn_Cancel.OnClicked:Add(self, self.OnClearBtnClicked)
  self.Group_BtnCancel:SetVisibility(ESlateVisibility.Collapsed)
  self.EditableText_Search.OnPressed:Add(self, self.OnEditableTextPressed)
end

function M:Destruct()
  self.EditableText_Search.OnTextChanged:Remove(self, self.OnEditTextChanged)
  self.Btn_Cancel.OnClicked:Remove(self, self.OnClearBtnClicked)
  self.EditableText_Search.OnPressed:Remove(self, self.OnEditableTextPressed)
  self.Obj = nil
  self.Func = nil
end

function M:OnEditableTextPressed()
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_input_bar", nil, nil)
end

function M:GetText()
  return self.EditableText_Search:GetText()
end

function M:SetText(Text)
  self.EditableText_Search:SetText(Text)
end

function M:OnEditTextChanged(Text)
  if "" ~= Text then
    if self.Group_BtnCancel:GetVisibility() ~= UIConst.VisibilityOp.Visible then
      self.Group_BtnCancel:SetVisibility(UIConst.VisibilityOp.Visible)
    end
  elseif self.Group_BtnCancel:GetVisibility() ~= UIConst.VisibilityOp.Collapsed then
    self.Group_BtnCancel:SetVisibility(UIConst.VisibilityOp.Collapsed)
    DebugPrint("\230\144\156\231\180\162\230\161\134\229\134\133\229\174\185\230\184\133\231\169\186")
  end
  if self.Obj and self.Func then
    self.Func(self.Obj, Text)
  end
end

function M:SetHintText(Text)
  self.EditableText_Search:SetHintText(Text)
end

function M:BindEventOnContentChanged(Obj, Func, ...)
  if not Obj or not Func then
    return
  end
  self.Obj = Obj
  self.Func = Func
  self.Params = {
    ...
  }
end

function M:OnClearBtnClicked()
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_small", nil, nil)
  self.EditableText_Search:SetKeyboardFocus()
  self:PlayAnimation(self.Click)
  self.EditableText_Search:SetText("")
end

return M
