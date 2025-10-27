require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C",
  "BluePrints.Common.TimerMgr"
})

function M:Construct()
  self.Btn_SmallFace.OnClicked:Add(self, self.OnFaceClicked)
  self.Btn_BigFace.OnClicked:Add(self, self.OnFaceClicked)
  self.Btn_BigFace.OnHovered:Add(self, self.OnFaceHovered)
  self.Btn_SmallFace.OnHovered:Add(self, self.OnFaceHovered)
  self.Btn_BigFace.OnUnhovered:Add(self, self.OnFaceUnhovered)
  self.Btn_SmallFace.OnUnhovered:Add(self, self.OnFaceUnhovered)
  self.MenuAnchor_BigFace.OnGetUserMenuContentEvent:Bind(self, self.OnGetUserMenuContent)
  self.MenuAnchor_SmallFace.OnGetUserMenuContentEvent:Bind(self, self.OnGetUserMenuContent)
end

function M:Destruct()
  self.Btn_SmallFace.OnClicked:Remove(self, self.OnFaceClicked)
  self.Btn_BigFace.OnClicked:Remove(self, self.OnFaceClicked)
  self.Btn_BigFace.OnHovered:Remove(self, self.OnFaceHovered)
  self.Btn_SmallFace.OnHovered:Remove(self, self.OnFaceHovered)
  self.Btn_BigFace.OnUnhovered:Remove(self, self.OnFaceUnhovered)
  self.Btn_SmallFace.OnUnhovered:Remove(self, self.OnFaceUnhovered)
  self.MenuAnchor_BigFace.OnGetUserMenuContentEvent:Unbind()
  self.MenuAnchor_SmallFace.OnGetUserMenuContentEvent:Unbind()
end

function M:OnGetUserMenuContent()
  local Data = self.Content.Data
  if not IsValid(self.FaceItemTipsWidget) then
    self.FaceItemTipsWidget = UIManager(self):CreateWidget(UIConst.FaceItemTips)
  end
  if self.Content.Data.GroupId == ChatCommon.EmojiGroupId then
    self.FaceItemTipsWidget:SetText(Data.Id)
  else
    self.FaceItemTipsWidget:SetText(GText(Data.Name))
  end
  return self.FaceItemTipsWidget
end

function M:OnFaceClicked()
  self.Owner:OnListItemClicked(self.Content)
  AudioManager(self):PlayUISound(self, "event:/ui/common/team_click_emoj", nil, nil)
end

function M:OnFaceHovered()
  if self.Content.Data.GroupId == ChatCommon.EmojiGroupId then
    self.MenuAnchor_SmallFace:Open(false)
  else
    self.MenuAnchor_BigFace:Open(false)
  end
end

function M:OnFaceUnhovered()
  if self.Content.Data.GroupId == ChatCommon.EmojiGroupId then
    self.MenuAnchor_SmallFace:Close()
  else
    self.MenuAnchor_BigFace:Close()
  end
end

function M:OnListItemObjectSet(Content)
  Content.UI = self
  self.Content = Content
  self.Owner = Content.Owner
  local Data = Content.Data
  local Icon, Group
  if Data.GroupId == ChatCommon.EmojiGroupId then
    self.Switcher:SetActiveWidgetIndex(1)
    Icon = self.Image_SmallFace
    Group = self.Group_SmallFace
  else
    self.Switcher:SetActiveWidgetIndex(0)
    Icon = self.Image_BigFace
    Group = self.Group_BigFace
  end
  local Img = Data.Icon and LoadObject(Data.Icon) or nil
  if IsValid(Img) then
    Icon:SetBrushResourceObject(Img)
    local ImgX, ImgY = Img:Blueprint_GetSizeX(), Img:Blueprint_GetSizeY()
    local Brush = Icon.Brush
    local Scale = 0.62
    if ImgX > ImgY then
      Brush.ImageSize.X = Group.WidthOverride * Scale
      Brush.ImageSize.Y = ImgY * Group.HeightOverride / ImgX * Scale
    elseif ImgX <= ImgY then
      Brush.ImageSize.X = ImgX * Group.WidthOverride / ImgY * Scale
      Brush.ImageSize.Y = Group.HeightOverride * Scale
    end
    Icon:SetBrush(Brush)
  end
  self:OnGetUserMenuContent()
end

return M
