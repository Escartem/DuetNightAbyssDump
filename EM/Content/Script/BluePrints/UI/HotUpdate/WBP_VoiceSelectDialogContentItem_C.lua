require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:OnListItemObjectSet(Content)
  self.Group_DownloadSign:SetVisibility(ESlateVisibility.Visible)
  self.Content = Content
  self.Content.CurrentEntry = self
  self.Text_Lang:SetText(GText(Content.OptionText))
  if self.Content.bUsed then
    self.Group_IsUse:SetVisibility(ESlateVisibility.Visible)
    self.Text_IsUse:SetText(GText("UI_OPTION_Language_Using"))
  else
    self.Group_IsUse:SetVisibility(ESlateVisibility.Collapsed)
  end
  self:UpdateVoiceDownloadState()
  if not self.Btn_Click.OnCheckStateChanged:IsBound() then
    self.Btn_Click.OnCheckStateChanged:Add(self, self.OnSelected)
    self.Btn_Click.OnHovered:Add(self, self.OnHovered)
  end
  if Content.bSelected then
    self.Btn_Click:SetChecked(true)
  end
end

function M:OnHovered()
  if UIUtils.UtilsGetCurrentInputType() ~= UE4.ECommonInputType.Gamepad then
    return
  end
  self:SetSelected(true)
end

function M:OnSelected(bIsChecked)
  if not self.Content then
    DebugPrint("Content is nil, cannot clear list item object.")
    return
  end
  self.Content.bSelected = bIsChecked
  if bIsChecked then
    self.Content.Parent:OnSelected(self.Content)
    AudioManager(self):PlayUISound(self, "event:/ui/common/click_checkbox_check", nil, nil)
  end
  self:SetVisibility(bIsChecked and ESlateVisibility.HitTestInvisible or ESlateVisibility.Visible)
  self:SetFocus(bIsChecked)
end

function M:SetSelected(bIsChecked)
  self.Btn_Click:SetChecked(bIsChecked)
end

function M:Tick(DeltaTime)
  if self.Content and self.Content.DownloadProcess then
    local BytesSoFar = self.Content.DownloadProcess.BytesSoFar or 0
    local TotalBytes = self.Content.DownloadProcess.TotalBytes or 0
    if TotalBytes > 0 then
      local SizeText = string.format("%.0fMB/%.0fMB", BytesSoFar / 1048576, TotalBytes / 1048576)
      self.Text_DownloadSize:SetText(SizeText)
    else
      self.Text_DownloadSize:SetText("0MB/0MB")
    end
  end
end

function M:UpdateVoiceDownloadState()
  if not self.Content then
    return
  end
  if self.Content.DownloadedVoiceState == EOptionalPatchAssetState.Downloaded then
    self.Text_DownloadSignText:SetText(GText("UI_OPTION_Language_Downloaded"))
    self.Text_DownloadSize:SetText(string.format("%.0fMB", (self.Content.DownloadProcess and self.Content.DownloadProcess.TotalBytes or 0) / 1048576))
    self:PlayAnimation(self.IsDownloadDone)
  elseif self.Content.DownloadedVoiceState == EOptionalPatchAssetState.Downloading then
    local bPaused = false
    local HotupdateSubsystem = USubsystemBlueprintLibrary.GetGameInstanceSubsystem(GWorld.GameInstance, UHotUpdateSubsystem)
    if HotupdateSubsystem then
      bPaused = HotupdateSubsystem:IsPatchOptionSignPaused(self.Content.PatchSign)
    end
    if bPaused then
      self.Text_DownloadSignText:SetText(GText("UI_OPTION_Language_Download_Pausing"))
    else
      self.Text_DownloadSignText:SetText(GText("UI_OPTION_Language_Downloading"))
    end
    self.Text_DownloadSize:SetText(string.format("%.0fMB/%.0fMB", (self.Content.DownloadProcess and self.Content.DownloadProcess.BytesSoFar or 0) / 1048576, (self.Content.DownloadProcess and self.Content.DownloadProcess.TotalBytes or 0) / 1048576))
    self:PlayAnimation(self.IsDownloading)
  else
    self.Text_DownloadSignText:SetText(GText("UI_OPTION_Language_NoDownload"))
    self.Text_DownloadSize:SetText(string.format("%.0fMB", (self.Content.DownloadProcess and self.Content.DownloadProcess.TotalBytes or 0) / 1048576))
    self:PlayAnimation(self.IsNotDownload)
  end
end

return M
