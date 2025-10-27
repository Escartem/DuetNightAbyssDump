require("UnLua")
local M = Class({
  "BluePrints.Common.TimerMgr",
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:Construct()
  self.SoundFunc = self.PlayClickSound
  self.SoundFuncReceiver = self
end

function M:Destruct()
  self:ClearListenEvent()
end

function M:Init(ConfigData)
  self.ConfigData = ConfigData
  self.ClickCallback = ConfigData.ClickCallback
  self.SoundFunc = ConfigData.SoundFunc or self.PlayClickSound
  self.SoundFuncReceiver = ConfigData.SoundFuncReceiver or self
  self.TextContent = ConfigData.TextContent
  self.OnMenuOpenChangedCallBack = ConfigData.OnMenuOpenChangedCallBack
  if ConfigData.MenuPlacement then
    self.Tips_MenuAnchor:SetPlacement(ConfigData.MenuPlacement)
  else
    self:AddTimer(0.033, self.RefreshPlacementInViewport, false, 0, "RefreshPlacementInViewport", true)
  end
  self.OwnerWidget = ConfigData.OwnerWidget
  self:InitListenEvent()
end

function M:RefreshPlacementInViewport()
  local ViewportPos = FVector2D(0, 0)
  UE4.USlateBlueprintLibrary.LocalToViewport(self, self.Btn_Click:GetCachedGeometry(), FVector2D(0, 0), nil, ViewportPos)
  local ViewPortSize = UWidgetLayoutLibrary.GetViewportSize(self)
  local ViewPortScale = UWidgetLayoutLibrary.GetViewportScale(self)
  local CenterPosition = ViewPortSize / ViewPortScale * 0.5
  if ViewportPos.X < CenterPosition.X then
    self.Tips_MenuAnchor:SetPlacement(EMenuPlacement.MenuPlacement_MenuRight)
  else
    self.Tips_MenuAnchor:SetPlacement(EMenuPlacement.MenuPlacement_MenuLeft)
  end
end

function M:InitListenEvent()
  self.Btn_Click.OnCheckStateChanged:Add(self, self.OnViewInfoClick)
  self.Btn_Click.OnHovered:Add(self, self.OnViewInfoHover)
  self.Btn_Click.OnUnHovered:Add(self, self.OnViewInfoUnHover)
  self.Btn_Click.OnClicked:Add(self, self.OnViewInfoClicked)
  self:InitMenuOpenChangedListen()
end

function M:ClearListenEvent()
  self.Btn_Click.OnCheckStateChanged:Clear()
  self.Btn_Click.OnHovered:Clear()
  self.Btn_Click.OnUnHovered:Clear()
  self.Btn_Click.OnClicked:Clear()
  self:ClearMenuOpenChangedListen()
end

function M:OnViewInfoHover()
  self:OpenMenuAnchor()
end

function M:OnViewInfoUnHover()
  self:CloseMenuAnchor()
end

function M:OnViewInfoClicked()
  if type(self.SoundFunc) == "function" then
    self.SoundFunc(self.SoundFuncReceiver)
  end
end

function M:ResetStyle()
  self.Btn_Click:SetChecked(false)
end

function M:OnViewInfoClick(IsChecked)
  if IsChecked and type(self.ClickCallback) == "function" then
    self.ClickCallback(self.OwnerWidget, IsChecked)
  end
  if IsChecked then
    self:OpenMenuAnchor()
  else
    self:CloseMenuAnchor()
  end
end

function M:PlayClickSound()
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_level_01", nil, nil)
end

function M:OnMenuClose()
  self:ResetStyle()
end

function M:OpenMenuAnchor()
  if self.Tips_MenuAnchor:IsOpen() then
    return
  end
  self.Tips_MenuAnchor:Open(true)
  if self.TipsDetail then
    self.TipsDetail:InitMessage(self.TextContent)
  end
end

function M:IsMenuAnchorOpen()
  return self.Tips_MenuAnchor:IsOpen()
end

function M:CloseMenuAnchor()
  if not self.Tips_MenuAnchor:IsOpen() then
    return
  end
  self.Tips_MenuAnchor:Close()
end

function M:InitMenuOpenChangedListen()
  self.Tips_MenuAnchor.OnMenuOpenChanged:Clear()
  self.Tips_MenuAnchor.OnMenuOpenChanged:Add(self, self.OnMenuOpenChanged)
end

function M:ClearMenuOpenChangedListen()
  self.Tips_MenuAnchor.OnMenuOpenChanged:Remove(self, self.OnMenuOpenChanged)
end

function M:OnMenuOpenChanged(bIsOpen)
  UIManager(self):SetIsMenuAnchorOpen(bIsOpen)
  if not bIsOpen then
    self:OnMenuClose()
  end
  if not self.OnMenuOpenChangedCallBack then
    return
  end
  self.OnMenuOpenChangedCallBack(self.OwnerWidget, bIsOpen)
end

return M
