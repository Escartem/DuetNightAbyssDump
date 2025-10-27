require("UnLua")
local S = Class("BluePrints.UI.BP_EMUserWidget_C")

function S:OnListItemObjectSet(Content)
  self.CurContent = Content
  self.Text_SubOption:SetText(GText(Content.Text))
  self:UpdateEntrySelection()
  local Platform = CommonUtils.GetDeviceTypeByPlatformName(self)
  if "PC" == Platform then
    self.VX_Bg:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  else
    self.VX_Bg:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
  if Content.IsDownloadText then
    self.Text_SubOption_IsDownload:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    self.Text_SubOption_IsDownload:SetText(Content.IsDownloadText)
  else
    self.Text_SubOption_IsDownload:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.Text_SubOption_IsDownload:SetText("")
  end
end

function S:UpdateEntrySelection()
  if self.CurContent.Id == self.CurContent.SelectedOptionId then
    self.IsUsed = true
    self:StopAllAnimations()
    self:PlayAnimation(self.Selected)
  else
    self.IsUsed = false
    self:StopAllAnimations()
    self:PlayAnimation(self.Normal)
  end
end

function S:OnClickSubOption()
  UIUtils.PlayCommonBtnSe(self)
  self.CurContent.ParentWidget[self.CurContent.ClickCallBack](self.CurContent.ParentWidget, self.CurContent.Id)
end

function S:OnSubOptionHovered()
  if self.IsUsed then
    return
  end
  self:StopAllAnimations()
  self:PlayAnimation(self.Hover)
end

function S:OnSubOptionUnhovered()
  if self.IsUsed then
    return
  end
  self:StopAllAnimations()
  self:PlayAnimation(self.Normal)
end

function S:Handle_KeyDownOnGamePad(InKeyName)
end

function S:Handle_KeyUpOnGamePad(InKeyName)
end

function S:Gamepad_SetHovered(bIsHovered)
end

function S:GetBottomKeyInfos()
end

function S:UpdateSystemVoiceText()
  local IsVisibility = self.CurContent.ParentWidget:GetVoiceResByIndex(self.CurContent.Id)
  self.Text_SubOption_IsDownload:SetVisibility(not IsVisibility and UE4.ESlateVisibility.SelfHitTestInvisible or UE4.ESlateVisibility.Collapsed)
  self.Text_SubOption_IsDownload:SetText(GText("UI_Option_Language_Unload"))
end

return S
