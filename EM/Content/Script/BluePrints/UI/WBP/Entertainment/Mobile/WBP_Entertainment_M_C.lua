require("UnLua")
local M = Class({
  "BluePrints.UI.WBP.Entertainment.WBP_Entertainment"
})

function M:Initialize(Initializer)
  M.Super.Initialize(self, Initializer)
end

function M:Construct()
  M.Super.Construct(self)
end

function M:Destruct()
  M.Super.Destruct(self)
end

function M:InitUIInfo(Name, IsInUIMode, EventList, ...)
  M.Super.InitUIInfo(self, Name, IsInUIMode, EventList, ...)
  self.Tab:Init({
    PlatformName = "Mobile",
    Tabs = {},
    DynamicNode = {
      "Back",
      "ResourceBar",
      "BottomKey"
    },
    BottomKeyInfo = {
      {
        KeyInfoList = {
          {
            Type = "Text",
            Text = "Esc",
            ClickCallback = self.ExitCurrentState,
            Owner = self
          }
        },
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "B",
            ClickCallback = self.ExitCurrentState,
            Owner = self
          }
        },
        Desc = self.TabBottomKeyDesc
      }
    },
    StyleName = "Text",
    TitleName = self.TabTitleName,
    InfoCallback = "NotShow",
    BackCallback = self.ExitCurrentState,
    OwnerPanel = self
  })
  self.Tab.Panel_Tab:SetVisibility(UE4.ESlateVisibility.Collapsed)
end

return M
