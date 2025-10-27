require("UnLua")
local WBP_HUD_ToughnessBar_C = Class("BluePrints.UI.BP_UIState_C")

function WBP_HUD_ToughnessBar_C:InitConfig_Lua(ActorOwner)
  self.Owner = rawset(self, "Owner", ActorOwner)
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  self.SceneMgrComponent = GameInstance:GetSceneManager()
end

return WBP_HUD_ToughnessBar_C
