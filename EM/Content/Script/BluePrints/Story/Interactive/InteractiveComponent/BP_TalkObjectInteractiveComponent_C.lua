require("UnLua")
local BP_TalkObjectInteractiveComponent_C = Class("BluePrints.Story.Interactive.InteractiveComponent.BP_InteractiveBaseComponent_C")
local StoryInteractiveController = require("BluePrints.UI.WBP.StoryInteractive.StoryInteractiveController")
local StoryInterActiveModel = require("BluePrints.UI.WBP.StoryInteractive.StoryInteractiveModel")

function BP_TalkObjectInteractiveComponent_C:SetInteractiveInfo(Info)
  self.Info = Info
  self.InteractiveDistance = Info.InteractiveDistance
  self.Owner = self:GetOwner()
  self:SetInteractiveName(Info.InteractiveId)
  self:ProcessRawInfo()
end

function BP_TalkObjectInteractiveComponent_C:ProcessRawInfo()
  self.bEnableDistanceCheck = self.InteractiveDistance and self.InteractiveDistance > 0
end

function BP_TalkObjectInteractiveComponent_C:BtnClicked(PlayerActor, InPressTimeSeconds)
  DebugPrint("BP_TalkObjectInteractiveComponent_C:StartInteractive")
  PlayerActor:SetCharacterTag("Idle")
  PlayerActor:SetCharacterTag(self.InteractiveTag)
  PlayerActor:SetCanInteractiveTrigger(false, "TalkInteractive")
  self.bIsInInteractive = true
  self.PlayerActor = PlayerActor
  local Exist = StoryInterActiveModel:HasAnyInteractive(self.Owner.NpcId)
  if Exist then
    StoryInteractiveController:TryStartInteractive(self.Owner.NpcId, self.Owner, PlayerActor, {
      Obj = self,
      Func = self.EndInteractive
    })
  end
end

function BP_TalkObjectInteractiveComponent_C:EndInteractive()
  DebugPrint("BP_TalkObjectInteractiveComponent_C:EndInteractive", self:IsInInteractive())
  if not self:IsInInteractive() then
    return
  end
  DebugPrint("BP_TalkObjectInteractiveComponent_C:EndInteractive")
  self.PlayerActor:SetCanInteractiveTrigger(true, "TalkInteractive")
  self.bIsInInteractive = false
  self.PlayerActor:SetCharacterTag("Idle")
  self.PlayerActor = nil
end

function BP_TalkObjectInteractiveComponent_C:IsInInteractive()
  return self.bIsInInteractive
end

function BP_TalkObjectInteractiveComponent_C:TriggerEnter(PlayerActor)
  local InteractiveName = StoryInterActiveModel:GetInteractiveName(self.Owner.NpcId)
  if InteractiveName ~= self.InteractiveName then
    self:SetInteractiveName(InteractiveName)
  end
  self.Overridden.TriggerEnter(self, PlayerActor)
end

function BP_TalkObjectInteractiveComponent_C:IsCanInteractive(PlayerActor)
  local bRes = true
  local Exist = StoryInterActiveModel:HasAnyInteractive(self.Owner.NpcId)
  bRes = self.bEnableDistanceCheck and bRes and self.DistanceCheck(self.Owner, PlayerActor, self.InteractiveDistance) and Exist
  return bRes
end

function BP_TalkObjectInteractiveComponent_C:GetSpecialQuestID()
  return StoryInterActiveModel:GetNowInteractiveSpecialQuestId(self.Owner.NpcId)
end

function BP_TalkObjectInteractiveComponent_C:GetQuestID()
  return StoryInterActiveModel:GetNowInteractiveQuestChainId(self.Owner.NpcId)
end

return BP_TalkObjectInteractiveComponent_C
