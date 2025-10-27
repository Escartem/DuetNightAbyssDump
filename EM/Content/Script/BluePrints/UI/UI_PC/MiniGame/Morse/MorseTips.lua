require("UnLua")
local WBP_MiniGame_Mima_Tips_C = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function WBP_MiniGame_Mima_Tips_C:InitIcon(PasswordNum)
  self.PasswordMap = {
    [1] = {
      0,
      1,
      1,
      1,
      1
    },
    [2] = {
      0,
      0,
      1,
      1,
      1
    },
    [3] = {
      0,
      0,
      0,
      1,
      1
    },
    [4] = {
      0,
      0,
      0,
      0,
      1
    },
    [5] = {
      0,
      0,
      0,
      0,
      0
    },
    [6] = {
      1,
      0,
      0,
      0,
      0
    },
    [7] = {
      1,
      1,
      0,
      0,
      0
    },
    [8] = {
      1,
      1,
      1,
      0,
      0
    },
    [9] = {
      1,
      1,
      1,
      1,
      0
    },
    [0] = {
      1,
      1,
      1,
      1,
      1
    }
  }
  DebugPrint("thy     WBP_MiniGame_Mima_Tips_C:InitIcon", PasswordNum)
  local Password = self.PasswordMap[PasswordNum]
  for i = 1, #Password do
    self["Item0" .. i].Switcher:SetActiveWidgetIndex(Password[i])
  end
end

return WBP_MiniGame_Mima_Tips_C
