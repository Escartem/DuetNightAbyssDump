require("UnLua")
local M = Class()

function M:Initialize(Initializer)
  self.DungeonMapAreaLevelUI = nil
end

function M:SetDungeonInfo(Parent, DungeonId, UIIndex)
  self.DungeonMapAreaLevelUI = Parent
  self.DungeonId = DungeonId
  self.UIIndex = UIIndex
end

function M:OnClicked()
  AudioManager(self):PlayUISound(self, "event:/ui/common/map_click_level", nil, nil)
  self.DungeonMapAreaLevelUI:OnClickedAreaLevelItem(self.UIIndex, self.DungeonId)
end

function M:OnHovered()
  AudioManager(self):PlayUISound(self, "event:/ui/common/map_hover_level", nil, nil)
end

return M
