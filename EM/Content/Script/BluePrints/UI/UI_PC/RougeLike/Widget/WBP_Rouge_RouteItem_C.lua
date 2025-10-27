require("UnLua")
local M = Class("BluePrints.UI.BP_EMUserWidget_C")

function M:InitRouteItem(RoomIndex, RoomId)
  if nil == RoomIndex or nil == RoomId then
    return
  end
  local RoomInfo = DataMgr.RougeLikeRoom[RoomId]
  local RoomTypeInfo = DataMgr.RougeLikeRoomType[RoomInfo.RoomType]
  self:SetLine(RoomIndex)
  self:SetInfo(RoomTypeInfo.Name, RoomIndex)
  self:SetIcon(RoomTypeInfo.ESCIcon)
end

function M:SetLine(RoomIndex)
  local CurRoomIndex = GWorld.RougeLikeManager.RoomIndex
  if CurRoomIndex == RoomIndex then
    self.Line_R:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
  if 1 == RoomIndex then
    self.Line_L:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
end

function M:SetInfo(RoomType, RoomIndex)
  self.Text_Type:SetText(GText(RoomType))
  self.Text_Layer:SetText("0" .. tostring(RoomIndex))
end

function M:HideArrow()
  self.Arrow:SetVisibility(UE4.ESlateVisibility.Collapsed)
end

function M:SetIcon(Path)
  if nil == Path then
    Path = "/Game/UI/Texture/Dynamic/Atlas/Entrance/T_Entrance_Armory.T_Entrance_Armory"
  end
  local ImageResource = LoadObject(Path)
  if nil ~= ImageResource then
    local Material = self.Img_Icon:GetDynamicMaterial()
    Material:SetTextureParameterValue("Mask", ImageResource)
  end
end

function M:PlayPassAnim()
  self:PlayAnimation(self.Pass)
end

function M:PlayPresentAnim()
  self:PlayAnimation(self.Present)
end

return M
