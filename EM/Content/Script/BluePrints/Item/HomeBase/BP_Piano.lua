require("UnLua")
local M = Class("BluePrints/Item/MiniGame/BP_OpenUIMechanism_C")

function M:CheckCanInteractive(Player)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return false
  end
  if not DataMgr.Music[Avatar.HomeBaseBGM] then
    UIManager(self):ShowUITip(UIConst.Tip_CommonToast, GText("Piano_NoMusic"), 3)
    return false
  end
  return true
end

function M:OpenUI(PlayerId, NextStateId)
  local Player = Battle(self):GetEntity(PlayerId)
  self.UsingPlayerController = Player:GetController()
  Player:SetActorHideTag("Piano", true)
  self:RealOpenUI(PlayerId, NextStateId)
  local PlayerCameraComp = UE4.UGameplayStatics.GetPlayerCharacter(self, 0).CharCameraComponent
  self.Camera:SetConstraintAspectRatio(PlayerCameraComp.bConstrainAspectRatio)
  self.Camera:SetAspectRatio(PlayerCameraComp.AspectRatio)
  self.Camera:SetFieldOfView(PlayerCameraComp.FieldOfView)
  self.UsingPlayerController:SetViewTargetWithBlend(self, 0.6, 1, 3)
end

function M:RealOpenUI(PlayerId, NextStateId)
  self.UINextStateId = NextStateId
  self:BroadcastOpenMechanism(PlayerId)
end

function M:CloseMechanism(PlayerId, IsSuccess)
  M.Super.CloseMechanism(self, PlayerId)
  local Player = Battle(self):GetEntity(PlayerId)
  Player:SetActorHideTag("Piano", false)
  self.UsingPlayerController:SetViewTargetWithBlend(Player, 0.6, 1, 3)
end

return M
