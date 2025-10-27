require("UnLua")
local StringUtils = require("Utils.StringUtils")
local M = Class("BluePrints.UI.BP_EMUserWidget_C")

function M:Construct()
  self.Limit = 10
  self.Count = 0
  self.Text_Input.OnTextComposing:Add(self, self.ExecOnTextComposing)
  self.Text_Input.OnTextChanged:Add(self, self.ExecOnTextChanged)
  self.Text_Input.OnTextCommitted:Add(self, self.ExecOnTextCommintted)
  self.Text_Show_Input:SetVisibility(UIConst.VisibilityOp.Collapsed)
end

function M:Destruct()
  self.Text_Input.OnTextComposing:Remove(self, self.ExecOnTextComposing)
  self.Text_Input.OnTextChanged:Remove(self, self.ExecOnTextChanged)
  self.Text_Input.OnTextCommitted:Remove(self, self.ExecOnTextCommintted)
end

function M:ExecOnTextComposing(InText)
  if self.OnTextComposing then
    self:SetRichText(InText)
    self.OnTextComposing(InText)
    self:SetTextCount(utf8.len(InText))
  end
end

function M:ExecOnTextChanged(InText)
  if self.OnTextChanged then
    if not self.Text_Input.AutoWrapText then
      local Count = 0
      InText, Count = string.gsub(self.Text_Input:GetText(), "\r\n", "")
      if Count > 0 then
        self:SetRichText(InText)
        self.Text_Input:SetText(InText)
        self:SetTextCount(utf8.len(InText))
        return
      end
    end
    self:SetRichText(InText)
    local ChangedText = self.OnTextChanged(InText)
    InText = ChangedText and ChangedText or InText
    self:SetTextCount(utf8.len(InText))
  end
end

function M:ExecOnTextCommintted(InText, CommitType)
  if self.OnTextCommitted then
    self.OnTextCommitted(InText, CommitType, self.Count, self.Limit)
    self:SetTextCount(utf8.len(InText))
  end
end

function M:SetOnTextComposing(func)
  self.OnTextComposing = func
end

function M:SetOnTextChanged(func)
  self.OnTextChanged = func
end

function M:SetOnTextCommitted(func)
  self.OnTextCommitted = func
end

function M:SetTextCount(Count)
  self.Count = Count
  self.NowCount:SetText(self.Count)
end

function M:SetTextLimit(Limit)
  self.Limit = Limit
  self.LimitCount:SetText(self.Limit)
end

function M:SetHintText(InText)
  self.Text_Input:SetHintText(InText)
end

function M:SetEditText(InText)
  local TextCount = utf8.len(InText)
  if TextCount > self.Limit then
    local Utf8Table = StringUtils.Utf8ToTable(InText)
    InText = table.concat({
      table.unpack(Utf8Table, 1, self.Limit)
    })
  end
  self.Text_Input:SetText(InText)
  TextCount = utf8.len(self.Text_Input:GetText())
  self:SetTextCount(TextCount)
end

function M:SetRichText(InText)
  self.Text_Show_Input:SetText(InText)
end

function M:SetAutoWrap(bOn)
  self.Text_Show_Input:SetAutoWrapText(bOn)
  self.Text_Input:SetAutoWrapText(bOn)
end

return M
