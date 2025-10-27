require("UnLua")
local WBP_MiniGame_Mima_Clue_C = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function WBP_MiniGame_Mima_Clue_C:OnListItemObjectSet(Content)
  self:InitIcon(Content.Password)
  self.Text_Num:SetText(Content.Index)
end

function WBP_MiniGame_Mima_Clue_C:InitIcon(PasswordList)
  for key, value in pairs(PasswordList) do
    self["Item0" .. key].Switcher:SetActiveWidgetIndex(value)
  end
end

return WBP_MiniGame_Mima_Clue_C
