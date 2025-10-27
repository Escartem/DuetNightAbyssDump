require("UnLua")
local M = Class({
  "BluePrints.UI.BP_UIState_C"
})
M._components = {
  "BluePrints.UI.WBP.PersonInfo.Data.PersonInfoDataPageBaseView"
}

function M:InitBaseView()
  self:InitTab()
end

function M:InitTab()
  local TabWithoutChar = {
    Tabs = self.AllTabInfo,
    DynamicNode = {
      "Back",
      "Tip",
      "BottomKey"
    },
    BottomKeyInfo = {
      {
        KeyInfoList = {
          {
            Type = "Text",
            Text = "Esc",
            ClickCallback = self.OnReturnKeyDown,
            Owner = self
          }
        },
        Desc = GText("UI_BACK")
      }
    },
    StyleName = "Text",
    OwnerPanel = self,
    TitleName = GText("UI_PersonInfo_Name"),
    BackCallback = self.OnReturnKeyDown
  }
  self.Root.Com_Tab_M:Init(TabWithoutChar)
end

AssembleComponents(M)
return M
