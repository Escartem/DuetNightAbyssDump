require("UnLua")
local M = Class("BluePrints.UI.BP_UIState_C")

function M:Init(Param)
  self.UIIndex = Param.UIIndex
  self.Used = Param.Used
  self.WorldMapData = Param.WorldMapData
  self.RootPage = Param.RootPage
  self.Btn_Click.OnClicked:Add(self, self.OnMouseClick)
  self.Btn_Click.OnHovered:Add(self, self.OnMouseHover)
  self.Btn_Click.OnUnhovered:Add(self, self.OnMouseUnhover)
end

function M:OnMouseClick()
  self.RootPage.SelectBtnIdx = self.UIIndex
  self.RootPage:OnMouseButtonUp()
end

function M:OnMouseHover()
  self.RootPage.HoverBtnIdx = self.UIIndex
  self.RootPage:OnItemHover()
  AudioManager(self):PlayUISound(self, "event:/ui/common/map_hover_level", "", nil)
end

function M:OnMouseUnhover()
  self.RootPage.HoverBtnIdx = nil
  self.RootPage:OnItemUnhover()
end

return M
