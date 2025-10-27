require("UnLua")
local HeroUSDKUtils = require("Utils.HeroUSDKUtils")
local M = Class("BluePrints.UI.BP_UIState_C")

function M:Initialize(Initializer)
  self.LastBytesSoFar = 0
  self.TotalBytes = 0
  self.BytesSoFar = 0
  self.PaksInfo = {}
  self.DownloadSpeed = 0
end

function M:Construct()
  self.HorizontalBox_DownloadPercent:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self.HorizontalBox_DownloadSpeed:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self:SetHotUpdateStateText(GText("UI_PATCH_DIFFVERSION"))
  local GameMode = UGameplayStatics.GetGameMode(self)
  GameMode.AssetDownloadProgressDelegate:Bind(self, self.OnAssetDownloadProgress)
  GameMode.HotUpdateEventChangedDelegate:Bind(self, self.OnHotUpdateEventChanged)
  GameMode.VertifyAssetsDelegate:Bind(self, self.OnVertifyAssets)
  GameMode.PatchFailedDelegate:Add(self, self.OnPatchFailed)
  self.Tips:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self.btn_confirm:SetText(GText("UI_PATCH_ENSURE"))
  self.btn_cancel:SetText(GText("UI_PATCH_CANCEL"))
  self.ProgressMaterial = self.Bar:GetDynamicMaterial()
  if self.ProgressMaterial then
    self.ProgressMaterial:SetScalarParameterValue("percent", 0)
  end
end

function M:Tick(MyGeometry, InDeltaTime)
  if not self.bStartDownload then
    return
  end
  self.BytesDiff = self.BytesSoFar - self.LastBytesSoFar
  self.DownloadSpeed = self.BytesDiff / InDeltaTime
  self.LastBytesSoFar = self.BytesSoFar
  local Percent = self.BytesSoFar / self.TotalBytes
  self.Text_DownloadSpeed:SetText(string.format(GText("UI_PATCH_DOWNLOADSPEED"), self.DownloadSpeed / 1024, (self.TotalBytes - self.BytesSoFar) / self.DownloadSpeed))
  self.Text_DownloadPercent:SetText(string.format("%.0f%%", Percent * 100))
  self.Text_Finished:SetText(string.format("%.2f/%.2fM", self.BytesSoFar / 1024 / 1024, self.TotalBytes / 1024 / 1024))
  if self.ProgressMaterial then
    self.ProgressMaterial:SetScalarParameterValue("percent", Percent)
  end
end

function M:SetHotUpdateStateText(InText)
  self.Panel_Downloading:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self.Text_Finished:SetText("")
  self.Text_Download:SetText(InText)
end

function M:OnAssetDownloadProgress(PakIndex, InBytesSoFar, InTotalBytes)
  if not self.PaksInfo[PakIndex] then
    self.PaksInfo[PakIndex] = {}
  end
  if not self.PaksInfo[PakIndex].TotalBytes then
    self.TotalBytes = self.TotalBytes + InTotalBytes
  end
  local BytesDiff = InBytesSoFar - (self.PaksInfo[PakIndex].BytesSoFar or 0)
  self.PaksInfo[PakIndex].BytesSoFar = InBytesSoFar
  self.PaksInfo[PakIndex].TotalBytes = InTotalBytes
  self.BytesSoFar = self.BytesSoFar + BytesDiff
end

function M:OnAssetDownloadComplete(PakIndex, bSuccess, ErrorCode)
end

function M:OnHotUpdateEventChanged(UpdateEvent)
  if UpdateEvent == EUpdateEvent.DownloadCompleted then
    self:SetHotUpdateStateText(GText("UI_PATCH_MOUNTASSTES"))
  elseif UpdateEvent == EUpdateEvent.StartDownload then
    self.bStartDownload = true
    self.HorizontalBox_DownloadPercent:SetVisibility(UE4.ESlateVisibility.Visible)
    self.HorizontalBox_DownloadSpeed:SetVisibility(UE4.ESlateVisibility.Visible)
    self.Panel_Downloading:SetVisibility(UE4.ESlateVisibility.Visible)
    self.Text_Download:SetText(GText("UI_PATCH_DOWNLOADING"))
    self.Text_DownloadSpeed:SetText(string.format(GText("UI_PATCH_DOWNLOADSPEED"), 0, 0))
    self.Text_DownloadPercent:SetText(string.format("%.0f%%", 0))
    self.Text_Finished:SetText(string.format("%.2f/%.2f", 0, 0))
  elseif UpdateEvent == EUpdateEvent.PatchFinish then
    local GameMode = UGameplayStatics.GetGameMode(self)
    if UE.AHotUpdateGameMode.IsGlobalPak() then
      self:Close()
      local UIManager = GWorld.GameInstance:GetGameUIManager()
      local LoginMainPage = UIManager:GetUIObj("LoginMainPage")
      if LoginMainPage then
        LoginMainPage.PatchFinish = true
        LoginMainPage.Text_Login:SetText(GText("UI_LOGIN_ENTERGAME"))
        LoginMainPage.drop_down_box:SetVisibility(UE4.ESlateVisibility.Collapsed)
        if HeroUSDKUtils.IsEnable() and HeroUSDKUtils.HasLogin() then
          LoginMainPage.Btn_Back:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
        end
      end
    end
  end
end

function M:OnVertifyAssets()
  self:SetHotUpdateStateText(GText("UI_PATCH_VERTIFYASSETS"))
end

function M:ShowOptionPatchPopUI(OptionalAssetsSize)
  self:ShowPatchPopUI(string.format(GText("UI_PATCH_OPTIONALPATCH"), string.format("%.2f", OptionalAssetsSize / 1024 / 1024) .. "MB"), true, true, function()
    local GameMode = UGameplayStatics.GetGameMode(self)
    GameMode:EnsureDonwloadOptionAssets(true)
    self.Tips:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end, function()
    local GameMode = UGameplayStatics.GetGameMode(self)
    GameMode:EnsureDonwloadOptionAssets(false)
    self.Tips:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end)
end

function M:ShowDownloadBasepakUI()
  self:ShowPatchPopUI(GText("UI_PATCH_NEWPAK"), true, false, function()
    UKismetSystemLibrary.QuitGame(self, UGameplayStatics.GetPlayerCharacter(self, 0), EQuitPreference.Quit, false)
  end)
end

function M:OnPatchFailed(UpdateEvent)
  if UpdateEvent == EUpdateEvent.GetRemoteVersionFailed then
    self:ShowPatchPopUI(GText("UI_PATCH_GETREMOTEVERSIONFAILED"), true, true, function()
      local GameMode = UGameplayStatics.GetGameMode(self)
      GameMode:ReGetRemoveVersion()
      self.Tips:SetVisibility(UE4.ESlateVisibility.Collapsed)
    end, function()
      UKismetSystemLibrary.QuitGame(self, UGameplayStatics.GetPlayerController(self, 0), EQuitPreference.Quit, false)
    end)
  elseif UpdateEvent == EUpdateEvent.GetRemotePakListFailed then
    self:ShowPatchPopUI(GText("UI_PATCH_GETREMOTEPAKLISTFAILED"), true, true, function()
      local GameMode = UGameplayStatics.GetGameMode(self)
      GameMode:ReDiffAssetList()
      self.Tips:SetVisibility(UE4.ESlateVisibility.Collapsed)
    end, function()
      UKismetSystemLibrary.QuitGame(self, UGameplayStatics.GetPlayerController(self, 0), EQuitPreference.Quit, false)
    end)
  elseif UpdateEvent == EUpdateEvent.DownloadFailed then
    self:ShowPatchPopUI(GText("UI_PATCH_DOWNLOADFAILED"), true, true, function()
      local GameMode = UGameplayStatics.GetGameMode(self)
      GameMode:ReDownloadAssets()
      self.Tips:SetVisibility(UE4.ESlateVisibility.Collapsed)
    end, function()
      UKismetSystemLibrary.QuitGame(self, UGameplayStatics.GetPlayerController(self, 0), EQuitPreference.Quit, false)
    end)
  end
end

function M:ShowPatchPopUI(Text, bShowEnsure, bShowCancel, EnsureFunc, CancelFunc)
  self.Tips:SetVisibility(UE4.ESlateVisibility.Visible)
  self.Text_DataSize:SetText(Text)
  self.btn_confirm:SetVisibility(bShowEnsure and UE4.ESlateVisibility.Visible or UE4.ESlateVisibility.Collapsed)
  self.btn_cancel:SetVisibility(bShowCancel and UE4.ESlateVisibility.Visible or UE4.ESlateVisibility.Collapsed)
  self.btn_confirm:UnBindEventOnClicked(self)
  if EnsureFunc then
    self.btn_confirm:BindEventOnClicked(self, EnsureFunc)
  end
  self.btn_cancel:UnBindEventOnClicked(self)
  if CancelFunc then
    self.btn_cancel:BindEventOnClicked(self, CancelFunc)
  end
end

return M
