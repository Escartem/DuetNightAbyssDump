require("UnLua")
local Menu_Avatar_Cell_C = Class({
  "Blueprints.UI.BP_UIState_C"
})

function Menu_Avatar_Cell_C:Initialize(Initializer)
  self.Super.Initialize(self)
end

function Menu_Avatar_Cell_C:OnLoaded(...)
end

function Menu_Avatar_Cell_C:SetImage(Path)
  if nil == Path then
    Path = "/Game/UI/Texture/Dynamic/Atlas/Entrance/T_Entrance_Armory.T_Entrance_Armory"
  end
  local ImageResource = LoadObject(Path)
  if nil ~= ImageResource then
    self.Icon_Info:SetBrushResourceObject(ImageResource)
  end
end

function Menu_Avatar_Cell_C:OnListItemObjectSet(Content)
  self.Text_Info:SetText(Content.Text_Info)
  self.Text_LevelInfo_Name:SetText(Content.Text_LevelInfo_Name)
  self.Text_LevelInfo:SetText(Content.Text_LevelInfo)
  self:SetImage(Content.IconPath)
  if Content.IsWorld then
    self.WidgetSwitcher_Bg:SetActiveWidgetIndex(1)
  else
    self.WidgetSwitcher_Bg:SetActiveWidgetIndex(0)
  end
  if Content.IsEmptyContent then
    self.WidgetSwitcher_State:SetActiveWidgetIndex(1)
  else
    self.WidgetSwitcher_State:SetActiveWidgetIndex(0)
  end
end

return Menu_Avatar_Cell_C
