require("UnLua")
local M = Class()

function M:ReceiveBeginPlay()
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  local UIManger = GameInstance:GetGameUIManager()
  UIManger:LoadUI(UIConst.LOGINMAINPAGE, "LoginMainPage", UIConst.ZORDER_FOR_ZERO)
  HeroUSDKSubsystem(self):HeroSDKLogin()
  local PlayerController = UGameplayStatics.GetPlayerController(self, 0)
  if IsValid(PlayerController) then
    PlayerController.bShowMouseCursor = true
  end
end

return M
