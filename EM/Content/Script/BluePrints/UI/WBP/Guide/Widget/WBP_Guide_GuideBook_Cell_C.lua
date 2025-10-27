require("UnLua")
local M = Class({
  "BluePrints.UI.BP_UIState_C"
})
M._components = {
  "BluePrints.UI.WidgetComponent.ChangeTextToKeyInfoComponent"
}

function M:Construct()
  self.GuideType = "None"
  self.CurrentInputDevice = {
    "KeyboardKey",
    "MouseButton"
  }
  self.CurInputDeviceType = UIUtils.UtilsGetCurrentInputType()
end

function M:Destruct()
  if self.MediaPlayer and self.MediaPlayer:IsPlaying() then
    self.MediaPlayer:SetLooping(false)
    self.MediaPlayer:Close()
  end
end

function M:SetNumStep(i)
  self.num_index = i
  self.Text_Index:SetText(i)
  self.MediaPlayer = LoadObject("MediaPlayer'/Game/UI/UI_PC/Guide/Guide_Image/MediaPlayer/MediaPlayer_Video" .. i .. ".MediaPlayer_Video" .. i .. "'")
end

function M:SetGuideType(GuideType)
  self.GuideType = GuideType
  if self.GuideType == "ImageText" then
    self.Group_Index:SetVisibility(UE4.ESlateVisibility.Collapsed)
  elseif self.GuideType == "ProcessNode" then
    self.Group_Index:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  elseif self.GuideType == "Text" then
  end
end

function M:UpdateContent(ChildGuideId, i, isPC)
  self.ChildInfo = DataMgr.UIChildGuide[ChildGuideId]["GuideInfo" .. i]
  self:UpdateCellImgs(ChildGuideId, i, isPC)
  self:PlayAnimation(self.SwitchCell)
end

function M:UpdateCellImgs(ChildGuideId, i, isPC)
  self:GetChildeGuideUIInfoById(ChildGuideId, i, isPC)
end

function M:GetChildeGuideUIInfoById(ChildGuideId, i, isPC)
  local PictureList = self.ChildInfo.GuidePicture
  if not PictureList then
    return
  end
  if isPC then
    self.GuidePicture = PictureList.PC
    if PictureList.GamePad and self.CurInputDeviceType == ECommonInputType.Gamepad then
      self.GuidePicture = PictureList.GamePad
    end
  else
    self.GuidePicture = PictureList.Phone
  end
  if string.match(self.GuidePicture, "FileMediaSource") then
    self:ShowVideo(self.GuidePicture)
    self.MediaPlayer:Play()
  else
    self:ShowImg(self.GuidePicture)
  end
end

function M:ShowImg(ImgPath)
  local img = LoadObject(ImgPath)
  if self.ShowType ~= "Img" then
    self.ShowType = "Img"
    local CanvasSlot = UWidgetLayoutLibrary.SlotAsCanvasSlot(self.Image_Guide)
    CanvasSlot:SetAutoSize(true)
    self.MediaPlayer:SetLooping(false)
    self.MediaPlayer:Close()
  end
  self.Image_Guide:SetBrushFromTexture(img, true)
end

function M:ShowVideo(VideoPath)
  self:ScaleImageSize()
  local video = LoadObject(VideoPath)
  self.MediaPlayer:OpenSource(video)
  if self.ShowType ~= "Video" then
    self.ShowType = "Video"
    local CanvasSlot = UWidgetLayoutLibrary.SlotAsCanvasSlot(self.Image_Guide)
    CanvasSlot:SetAutoSize(false)
    local media_material = LoadObject("/Game/UI/UI_PC/Guide/Guide_Image/MediaPlayer/Video_Material" .. self.num_index .. ".Video_Material" .. self.num_index)
    self.Image_Guide:SetBrushFromMaterial(media_material)
    self.MediaPlayer:SetLooping(true)
  end
  self.VideoPath = VideoPath
end

function M:ScaleImageSize(img)
  local Size = UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(self.Image_Guide):GetSize()
  local CellX = Size.X
  local CellY = Size.Y
  if img then
    local imgX = img:Blueprint_GetSizeX()
    local imgY = img:Blueprint_GetSizeY()
    self.SlotSize = UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(self.Image_Guide):SetSize(UE4.FVector2D(imgX, imgY))
  end
  self.SlotSize = UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(self.Image_Guide):GetSize()
  local SelfX = self.SlotSize.X
  local SelfY = self.SlotSize.Y
  local scalex = 1.0
  local scaley = 1.0
  if SelfX / SelfY > CellX / CellY then
    scaley = CellY / SelfY
    scalex = scaley
  else
    scalex = CellX / SelfX
    scaley = scalex
  end
  self.Image_Guide:SetRenderScale(UE4.FVector2D(scalex, scaley))
end

function M:UpdateTextOnInputDeviceChanged(NewInputDevice)
  self.CurInputDeviceType = NewInputDevice
  if not self.ChildInfo then
    return
  end
  self:UpdateCellImgs(nil, nil, true)
end

AssembleComponents(M)
return M
