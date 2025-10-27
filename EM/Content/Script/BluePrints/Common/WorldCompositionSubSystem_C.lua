require("Unlua")
local M = Class("BluePrints.Common.TimerMgr")

function M:OnAsyncTravelBegin_Lua(Player)
  if not self.TravelRequests then
    self.TravelRequests = {}
  end
  local Controller = Player
  local MovementComponent = Player:GetMovementComponent()
  local OriginalMovementMode = MovementComponent.MovementMode
  local ParamsTable = {OriginalMovementMode}
  self.TravelRequests[Controller] = ParamsTable
  MovementComponent:SetMovementMode(UE4.EMovementMode.Move_None)
  Player:AddDisableInputTag("WCAsyncTravel")
  Player:ResetIdle()
  UGameplayStatics.GetPlayerController(self, 0):SetViewTargetWithBlend(Player)
  local LevelLoader = UE4.UGameplayStatics.GetActorOfClass(self, UE4.ALevelLoader:StaticClass())
  if LevelLoader then
    LevelLoader:SetForceGCAfterLevelStreamedOut(true)
  end
end

function M:AddOnAsyncTravelEnded(Obj, Func)
  if not self.Callbacks then
    self.Callbacks = {}
  end
  self.Callbacks[Obj] = Func
end

function M:OnPlayerLanded_Lua()
  if self.Callbacks then
    for Obj, Func in pairs(self.Callbacks) do
      Func(Obj)
    end
    self.Callbacks = {}
  end
end

function M:OnAsyncTravelEnded_Lua(Player)
  local Controller = Player
  local MovementComponent = Player:GetMovementComponent()
  if not self.TravelRequests or not self.TravelRequests[Controller] then
    return
  end
  local OriginalMovementMode = self.TravelRequests[Controller][1]
  local Movement = Player:GetMovementComponent()
  if 5 == OriginalMovementMode then
    OriginalMovementMode = Movement.DefaultLandMovementMode
  end
  self.TravelRequests[Controller] = nil
  MovementComponent:SetMovementMode(Movement.DefaultLandMovementMode)
  self:AddTimer(2, function()
    Player:RemoveDisableInputTag("WCAsyncTravel")
  end)
  Player:AddMovementInput(Player:GetActorForwardVector() * 0.001)
  local LevelLoader = UE4.UGameplayStatics.GetActorOfClass(self, UE4.ALevelLoader:StaticClass())
  if LevelLoader then
    LevelLoader:SetForceGCAfterLevelStreamedOut(false)
  end
end

function M:ShowRegionError_Lua(Text)
  local bDistribution = UE4.URuntimeCommonFunctionLibrary.IsDistribution()
  local bEnableShippingLog = UE4.URuntimeCommonFunctionLibrary.EnableLogInShipping()
  if bDistribution and not bEnableShippingLog then
    return
  end
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  local Space = "=========================================================\n"
  local ct = {
    Space,
    "\230\138\165\233\148\153\230\150\135\230\156\172:\n\r",
    tostring(Text),
    "\n"
  }
  local FinalMsg = table.concat(ct)
  if UE4.URuntimeCommonFunctionLibrary.IsPlayInEditor(self) then
    ScreenPrint("\229\140\186\229\159\159\230\138\165\233\148\153:\n" .. FinalMsg)
  end
  Avatar:SendToFeiShuForRegionMgr(FinalMsg, "\229\140\186\229\159\159\230\138\165\233\148\153 | " .. Avatar.CurrentRegionId)
end

function M:OnWaitForDataIdle_Lua()
  GWorld.StoryMgr:TryRestartStoryline()
end

return M
