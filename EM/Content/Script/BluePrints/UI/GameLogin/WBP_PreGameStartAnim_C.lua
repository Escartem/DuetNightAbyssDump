require("UnLua")
local HeroUSDKUtils = require("Utils.HeroUSDKUtils")
local EMCache = require("EMCache.EMCache")
local WBP_PreGameStartAnim_C = Class("BluePrints.UI.BP_UIState_C")

function WBP_PreGameStartAnim_C:Construct()
  self.Super.Construct(self)
  local PlatformName = UE4.UUIFunctionLibrary.GetDevicePlatformName(self)
  self:SetVisibility(ESlateVisibility.Collapsed)
  if HeroUSDKUtils.IsEnable() and "Android" ~= PlatformName or UE4.UUCloudGameInstanceSubsystem.IsCloudGame() then
    if not HeroUSDKSubsystem(self).bAgreeProtocol then
      HeroUSDKSubsystem().HeroSDKProtocolAgreeDelegate:Bind(self, self.PlayAnimAndClose)
    else
      self:PlayAnimAndClose()
    end
  else
    self:PlayAnimAndClose()
  end
  if UE4.UUIFunctionLibrary.GetDevicePlatformName() ~= "Android" then
    HeroUSDKSubsystem():InitHeroUSDK()
  end
  self.Text_WaringTitle:SetText(GText("UI_Loading_Warn_Title"))
  self.Text_WaringDesc:SetText(GText("UI_Loading_Warn_Content"))
  self.Text_KRAgeWarning:SetText(GText("UI_Loading_Warn_Content_KR"))
  if UE.AHotUpdateGameMode.IsGlobalPak() then
    self.PC:SetVisibility(ESlateVisibility.Collapsed)
    self.Phone:SetVisibility(ESlateVisibility.Collapsed)
    self.Text_PlayHealthDesc_PC_1:SetVisibility(ESlateVisibility.Collapsed)
  else
    if "PC" == CommonUtils.GetDeviceTypeByPlatformName(self) then
      self.PC:SetVisibility(ESlateVisibility.Visible)
      self.Phone:SetVisibility(ESlateVisibility.Collapsed)
    else
      self.PC:SetVisibility(ESlateVisibility.Collapsed)
      self.Phone:SetVisibility(ESlateVisibility.Visible)
    end
    self.Text_PlayHealthTitle_PC:SetText(GText("UI_HealthyGame_Title"))
    self.Text_PlayHealthTitle_Phone:SetText(GText("UI_HealthyGame_Title"))
    self.Text_PlayHealthDesc_PC:SetText(GText("UI_HealthyGame_Content"))
    self.Text_PlayHealthDesc_Phone:SetText(GText("UI_HealthyGame_Content"))
  end
  self.Text_PlayHealthTitle_PC_1:SetText(GText("UI_Loading_Testing"))
  self.Text_PlayHealthDesc_PC_1:SetText(GText("UI_Loading_Antiaddiction"))
  if UE4.UUCloudGameInstanceSubsystem.IsCloudGame() then
    local GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(self)
    if GameInputModeSubsystem then
      GameInputModeSubsystem:SetMouseCursorVisable(false)
      GameInputModeSubsystem:SetMouseCursorOpacity(0.0)
    end
  end
end

function WBP_PreGameStartAnim_C:PlayAnimAndClose()
  if self.bClose then
    return
  end
  self.bClose = true
  self:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  local SystemLanguage = EMCache:Get("SystemLanguage") or "CN"
  if "CN" == SystemLanguage and UE.AHotUpdateGameMode.IsGlobalPak() then
    SystemLanguage = "CN_OverSea"
  end
  local AnimPlayTime = self[SystemLanguage]:GetEndTime() or 0.5
  self:PlayAnim(SystemLanguage, 1.0)
  self:AddTimer(AnimPlayTime + 0.2, self.CloseUI, false, 0, "CloseAndLoadCG")
end

function WBP_PreGameStartAnim_C:CloseUI()
  if not self.bClose then
    return
  end
  self:RemoveTimer("CloseAndLoadCG")
  self:Close()
end

function WBP_PreGameStartAnim_C:Close()
  HeroUSDKSubsystem().HeroSDKProtocolAgreeDelegate:Unbind()
  self.Super.Close(self)
  AudioManager(self):StopSound(self, "LogoEvent")
  self:TryToLoadLoginMainPage()
end

function WBP_PreGameStartAnim_C:TryToLoadLoginMainPage()
  UGameplayStatics.OpenLevel(self, "/Game/Maps/Login")
end

return WBP_PreGameStartAnim_C
