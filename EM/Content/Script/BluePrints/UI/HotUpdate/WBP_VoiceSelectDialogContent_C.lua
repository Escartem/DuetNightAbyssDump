require("UnLua")
local M = Class("BluePrints.UI.UI_PC.Common.Common_Dialog.Common_Dialog_ContentBase")

function M:InitContent(Params, PopupData, Owner)
  local HotUpdateSubsystem = USubsystemBlueprintLibrary.GetGameInstanceSubsystem(self, UHotUpdateSubsystem)
  HotUpdateSubsystem.PatchPostSuccessDelegate:Add(self, self.RefreshDownloadedVoiceState)
  HotUpdateSubsystem.AssetDownloadProgressDelegate:Bind(self, self.OnAssetDownloadProgressChanged)
  HotUpdateSubsystem.AssetStartDownloadDelegate:Bind(self, self.OnAssetStartDownload)
  HotUpdateSubsystem.PatchFailedDelegate:Add(self, self.RefreshDownloadedVoiceState)
  HotUpdateSubsystem.UpdatePatchOptionalSignsDelegate:Add(self, self.RefreshDownloadedVoiceState)
  self:SetFocus(true)
  self.Owner = Owner
  local OptionText = Params.OptionText
  local Options = Params.Options
  rawset(self, "PatchSigns", {})
  rawset(self, "Options", Options)
  for k, v in pairs(Options) do
    table.insert(self.PatchSigns, "Voice" .. v)
  end
  rawset(self, "CurrentLanguageIndex", Params.CurrentLanguageIndex)
  rawset(self, "CurrentUseLanguageIndex", Params.CurrentUseLanguageIndex)
  rawset(self, "DownloadedVoiceState", HotUpdateSubsystem:GetOptionalPatchAssetStates(self.PatchSigns))
  rawset(self, "Contents", {})
  if not rawget(self, "DownloadProcess") then
    rawset(self, "DownloadProcess", {})
  end
  local OptionalPatchAssetSizeInfo = HotUpdateSubsystem:GetOptionalPatchAssetSizeInfo(self.PatchSigns)
  for k, v in pairs(Options) do
    local PatchSign = self.PatchSigns[k]
    local AssetSizeInfo = OptionalPatchAssetSizeInfo:Find(PatchSign)
    if AssetSizeInfo then
      local Content = NewObject(UIUtils.GetCommonItemContentClass())
      if Content then
        self.DownloadProcess[PatchSign] = {
          BytesSoFar = AssetSizeInfo.DownloadedSize,
          TotalBytes = AssetSizeInfo.TotalSize
        }
        Content.Parent = self
        Content.OptionVoice = v
        Content.OptionText = OptionText[k]
        Content.DownloadedVoiceState = self.DownloadedVoiceState:Find(PatchSign) or EOptionalPatchAssetState.None
        Content.PatchSign = PatchSign
        Content.PatchTag = PatchSign
        Content.DownloadProcess = self.DownloadProcess[PatchSign]
        if k == self.CurrentLanguageIndex then
          Content.bSelected = true
        end
        if k == self.CurrentUseLanguageIndex then
          Content.bUsed = true
        end
        self.Contents[PatchSign] = Content
        self.List_Item:AddItem(Content)
        if Content.bSelected then
          self.List_Item:BP_SetSelectedItem(Content)
        end
      else
        DebugPrint("Failed to create content for option: " .. tostring(v))
      end
    else
      DebugPrint("No AssetSizeInfo found for PatchSign: " .. tostring(PatchSign))
    end
  end
end

function M:OnSelected(Content)
  if self.CurrentSelectedContent and self.CurrentSelectedContent ~= Content then
    if self.CurrentSelectedContent.CurrentEntry then
      self.CurrentSelectedContent.CurrentEntry:SetSelected(false)
    end
    self.CurrentSelectedContent.bSelected = false
  end
  local CurrentSelectedIndex = self.List_Item:GetIndexForItem(Content) + 1
  if CurrentSelectedIndex == self.CurrentUseLanguageIndex then
    self.Owner:ForbidRightBtn(true)
  else
    self.Owner:ForbidRightBtn(false)
  end
  self.CurrentSelectedContent = Content
  self:UpdateDialogBtnState()
end

function M:PackageData()
  if self.CurrentSelectedContent then
    return {
      OptionalPatchAssetSign = self.CurrentSelectedContent.PatchSign,
      OptionalPatchAssetState = self.CurrentSelectedContent.DownloadedVoiceState,
      BytesSoFar = self.CurrentSelectedContent.DownloadProcess and self.CurrentSelectedContent.DownloadProcess.BytesSoFar or 0,
      TotalBytes = self.CurrentSelectedContent.DownloadProcess and self.CurrentSelectedContent.DownloadProcess.TotalBytes or 0,
      CurrentIndex = self.List_Item:GetIndexForItem(self.CurrentSelectedContent) + 1
    }
  end
  return nil
end

function M:OnAssetStartDownload(TotalBytes, DownloadedBytes)
  self:RefreshDownloadedVoiceState(false)
end

function M:RefreshDownloadedVoiceState(bFirst)
  local HotUpdateSubsystem = USubsystemBlueprintLibrary.GetGameInstanceSubsystem(self, UHotUpdateSubsystem)
  self.DownloadedVoiceState = HotUpdateSubsystem:GetOptionalPatchAssetStates(self.PatchSigns)
  for PatchSign, Content in pairs(self.Contents) do
    if Content then
      Content.DownloadedVoiceState = self.DownloadedVoiceState:Find(PatchSign) or EOptionalPatchAssetState.None
      if Content.CurrentEntry then
        Content.CurrentEntry:UpdateVoiceDownloadState()
      end
    end
  end
  self:UpdateDialogBtnState()
end

function M:UpdateDialogBtnState()
  local HotUpdateSubsystem = USubsystemBlueprintLibrary.GetGameInstanceSubsystem(self, UHotUpdateSubsystem)
  if self.CurrentSelectedContent.DownloadedVoiceState == EOptionalPatchAssetState.None then
    self.Owner:GetButtonBar().Btn_Yes:SetText(GText("UI_OPTION_Language_Download"))
  elseif self.CurrentSelectedContent.DownloadedVoiceState == EOptionalPatchAssetState.Downloading then
    local bPaused = false
    if HotUpdateSubsystem then
      bPaused = HotUpdateSubsystem:IsPatchOptionSignPaused(self.CurrentSelectedContent.PatchSign)
    end
    if not bPaused then
      self.Owner:GetButtonBar().Btn_Yes:SetText(GText("UI_OPTION_Language_Download_Pause"))
    else
      self.Owner:GetButtonBar().Btn_Yes:SetText(GText("UI_OPTION_Language_Download_Continue"))
    end
  else
    self.Owner:GetButtonBar().Btn_Yes:SetText(GText("UI_OPTION_Language_Unload"))
  end
end

function M:OnAssetDownloadProgressChanged(Url, BytesSoFar, TotalBytes, PatchSign)
  if not rawget(self, "DownloadProcess") then
    rawset(self, "DownloadProcess", {})
  end
  self.DownloadProcess[PatchSign] = {BytesSoFar = BytesSoFar, TotalBytes = TotalBytes}
  for k, Content in pairs(self.Contents) do
    if Content and Content.PatchSign == PatchSign then
      Content.DownloadProcess = self.DownloadProcess[PatchSign]
      if Content.CurrentEntry then
        Content.CurrentEntry:Tick()
      end
      break
    end
  end
end

function M:Destruct()
  local HotUpdateSubsystem = USubsystemBlueprintLibrary.GetGameInstanceSubsystem(self, UHotUpdateSubsystem)
  HotUpdateSubsystem.PatchPostSuccessDelegate:Remove(self, self.RefreshDownloadedVoiceState)
  HotUpdateSubsystem.AssetDownloadProgressDelegate:Unbind()
  HotUpdateSubsystem.AssetStartDownloadDelegate:Unbind()
  HotUpdateSubsystem.PatchFailedDelegate:Remove(self, self.RefreshDownloadedVoiceState)
  HotUpdateSubsystem.UpdatePatchOptionalSignsDelegate:Remove(self, self.RefreshDownloadedVoiceState)
  self.Super.Destruct(self)
end

return M
