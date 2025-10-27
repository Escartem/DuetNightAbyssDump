require("UnLua")
local WikiController = require("BluePrints.UI.WBP.Wiki.WikiController")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:Construct()
  self.Guide_Desc_Text02:SetText(GText("UI_Wiki_ToBeUnlcoked"))
end

function M:OnListItemObjectSet(InObject)
  if not InObject then
    return
  end
  if self.Guide_Desc_Text01 then
    self.Guide_Desc_Text01:SetText(GText(InObject.TextDetail))
  end
  self.TextId = InObject.TextId
  self.EntryId = InObject.EntryId
  self.IsLastText = self:IsLastUnlockedText(self.EntryId, self.TextId)
  self.Sp:SetVisibility(UIConst.VisibilityOp.Visible)
  if self.IsLastText then
    self.Sp:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.Img_Line:SetVisibility(UIConst.VisibilityOp.Collapsed)
  else
    self.Sp:SetVisibility(UIConst.VisibilityOp.Visible)
    self.Img_Line:SetVisibility(UIConst.VisibilityOp.Visible)
  end
  local firstUnlockedTextId = self:FindFirstUnlockedText(self.EntryId)
  if self:IsTextUnlocked(InObject.TextId) then
    self:SetVisibility(UIConst.VisibilityOp.Visible)
    self.Switcher_Text:SetActiveWidgetIndex(0)
    self:CheckAndPlayNewTextTips()
  elseif self.TextId == firstUnlockedTextId then
    self:SetVisibility(UIConst.VisibilityOp.Visible)
    self.Switcher_Text:SetActiveWidgetIndex(1)
  else
    self:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

function M:FindFirstUnlockedText(entryId)
  local AllTexts = WikiController:GetModel():GetWikiTextByEntryId(entryId)
  for currentTextId, _ in pairs(AllTexts) do
    if not self:IsTextUnlocked(currentTextId) then
      return currentTextId
    end
  end
end

function M:IsTextUnlocked(TextId)
  local UnlockTexts = WikiController:GetModel():GetUnlockTexts()
  return nil ~= UnlockTexts[TextId]
end

function M:CheckAndPlayNewTextTips()
  if not self.TextId then
    return
  end
  local model = WikiController:GetModel()
  if model:IsTextNew(self.TextId) then
    self:PlayAnimation(self.VX_Reminder)
    AudioManager(self):PlayUISound(self, "event:/ui/common/entry_active", nil, nil)
    model:MarkTextAsRead(self.TextId)
    if self:AreAllTextsRead(self.EntryId) then
      model:ClearEntryNewState(self.EntryId)
    end
  end
end

function M:AreAllTextsRead(entryId)
  local allTexts = WikiController:GetModel():GetWikiTextByEntryId(entryId)
  for textId, _ in pairs(allTexts) do
    if WikiController:GetModel():IsTextNew(textId) then
      return false
    end
  end
  return true
end

function M:IsLastUnlockedText(entryId, textId)
  local UnlockedWikiNotes = WikiController:GetModel():GetUnlockedWikiEntryIds()
  if not UnlockedWikiNotes[entryId] then
    return false
  end
  local UnlockTexts = UnlockedWikiNotes[entryId].Props.UnlockTexts
  local AllTexts = WikiController:GetModel():GetWikiTextByEntryId(entryId)
  if 1 == CommonUtils.Size(AllTexts) then
    return true
  end
  local maxTextId = textId
  for currentTextId, _ in pairs(AllTexts) do
    if tonumber(currentTextId) > tonumber(maxTextId) then
      maxTextId = currentTextId
    end
  end
  return textId == maxTextId
end

function M:Destruct()
end

return M
