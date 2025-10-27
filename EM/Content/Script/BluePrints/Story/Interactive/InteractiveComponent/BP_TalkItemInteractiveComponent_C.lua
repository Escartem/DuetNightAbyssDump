require("UnLua")
local BP_TalkItemInteractiveComponent_C = Class("BluePrints.Story.Interactive.InteractiveComponent.BP_InteractiveBaseComponent_C")

function BP_TalkItemInteractiveComponent_C:SetInteractiveInfo(Info)
  self.Info = Info
  self.InteractiveDistance = Info.InteractiveDistance
  self.PlayerFaceAngle = Info.PlayerFaceAngle
  self.TalkItemFaceAngle = Info.TalkItemFaceAngle
  self:InitCommonUIConfirmID(Info.InteractiveId)
  self:ProcessRawInfo()
end

function BP_TalkItemInteractiveComponent_C:ProcessRawInfo()
  self.bEnableItemFaceCheck = self.TalkItemFaceAngle and self.TalkItemFaceAngle > 0 and self.TalkItemFaceAngle < 180
  self.bEnablePlayerFaceCheck = self.PlayerFaceAngle and self.PlayerFaceAngle > 0 and self.PlayerFaceAngle < 180
  self.bEnableDistanceCheck = self.InteractiveDistance and self.InteractiveDistance > 0
end

function BP_TalkItemInteractiveComponent_C:BtnClicked(PlayerActor, InPressTimeSeconds)
  if self.Info and self.Info.StartInteractiveCallback then
    self.Info.StartInteractiveCallback(PlayerActor)
  end
end

function BP_TalkItemInteractiveComponent_C:IsCanInteractive(PlayerActor)
  local bRes = true
  if self.bEnableDistanceCheck and bRes then
    bRes = self.DistanceCheck(self.Owner, PlayerActor, self.InteractiveDistance)
  end
  if self.bEnableItemFaceCheck and bRes then
    bRes = self.BFaceToACheck(PlayerActor, self.Owner, self.TalkItemFaceAngle, false)
  end
  if self.bEnablePlayerFaceCheck and bRes then
    bRes = self.BFaceToACheck(self.Owner, PlayerActor, self.PlayerFaceAngle, false)
  end
  return bRes
end

return BP_TalkItemInteractiveComponent_C
