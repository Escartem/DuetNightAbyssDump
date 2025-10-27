require("UnLua")
local GMFunctionLibrary = require("BluePrints.UI.GMInterface.GMFunctionLibrary")
local WBP_GM_BattleHistoryItem_C = Class("BluePrints.UI.BP_UIState_C")

function WBP_GM_BattleHistoryItem_C:OnListItemObjectSet(Content)
  self.Content = Content
  self.UI = Content.UI
  self.TagName = Content.Name
  self.Callback = Content.Callback
  self.TxtName:SetText(Content.Name)
  self.Check:SetIsChecked(Content.IsChecked)
  self.Btn.OnClicked:Add(self, self.OnBtnClicked)
end

function WBP_GM_BattleHistoryItem_C:SetChecked(IsChecked)
  self.Check:SetIsChecked(IsChecked)
  self.Content.IsChecked = IsChecked
end

function WBP_GM_BattleHistoryItem_C:OnBtnClicked()
  self:SetChecked(not self.Check:IsChecked())
  if self.Callback then
    self.Callback(self.TagName, self.Check:IsChecked())
  end
end

return WBP_GM_BattleHistoryItem_C
