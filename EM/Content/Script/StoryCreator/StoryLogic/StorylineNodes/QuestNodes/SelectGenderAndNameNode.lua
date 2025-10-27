local SelectGenderAndNameNode = Class("StoryCreator.StoryLogic.StorylineNodes.Questline.QuestNode")

function SelectGenderAndNameNode:Init()
  self.IsGM = false
end

function SelectGenderAndNameNode:Start(Context)
  self.Context = Context
  print("-----------------------------------SelectGenderAndNameNode node start-----------------------------------")
  local GameMode = UE4.UGameplayStatics.GetGameMode(GWorld.GameInstance)
  local RealGameMode = GameMode.SubGameModeInfo:Find("Prologue_Void")
  if RealGameMode and RealGameMode.PlayCastingSequence then
  elseif GameMode.PlayCastingSequence then
  else
    self:FinishAction()
  end
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(GWorld.GameInstance, 0)
  Player:SetESCMenuForbiddenState(true)
  local UIManager = GWorld.GameInstance:GetGameUIManager()
  UIManager:CloseResidentUI()
  EventManager:AddEvent(EventID.OnSelectRole, self, self.SwitchSequence)
  EventManager:AddEvent(EventID.OnSelectRoleUIOpen, self, self.OnSelectRoleUIOpen)
  EventManager:AddEvent(EventID.OnSelectFinish, self, self.FinishAction)
  AudioManager(self.Context):PlayUISound(nil, "event:/sfx/common/story/01/role_wipe_screen", "", nil)
  if self.IsGM then
    self:SwitchSequence(5)
  else
    self:SwitchSequence(5)
  end
  self:SetGameInputDisable(true)
end

function SelectGenderAndNameNode:FinishAction()
  local GameMode = UE4.UGameplayStatics.GetGameMode(GWorld.GameInstance)
  local RealGameMode = GameMode.SubGameModeInfo:Find("Prologue_Void")
  if RealGameMode and IsValid(RealGameMode.SequenceActor) then
    RealGameMode.SequenceActor:K2_DestroyActor()
  end
  EventManager:RemoveEvent(EventID.OnSelectRole, self)
  EventManager:RemoveEvent(EventID.OnSelectRoleUIOpen, self)
  EventManager:RemoveEvent(EventID.OnSelectFinish, self)
  self:SetGameInputDisable(false)
  local UIManager = GWorld.GameInstance:GetGameUIManager()
  UIManager:UnLoadUI("SelectRole")
  UIManager:OpenResidentUI()
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(GWorld.GameInstance, 0)
  Player:SetESCMenuForbiddenState(false)
  self:Finish()
end

function SelectGenderAndNameNode:Clear()
  EventManager:RemoveEvent(EventID.OnSelectRole, self)
  EventManager:RemoveEvent(EventID.OnSelectRoleUIOpen, self)
  EventManager:RemoveEvent(EventID.OnSelectFinish, self)
end

function SelectGenderAndNameNode:SwitchSequence(Target, UI)
  local GameMode = UE4.UGameplayStatics.GetGameMode(GWorld.GameInstance)
  local RealGameMode = GameMode.SubGameModeInfo:Find("Prologue_Void")
  if RealGameMode and RealGameMode.PlayCastingSequence then
    self:NodePlayCastingSequence(RealGameMode, Target, UI)
  elseif GameMode.PlayCastingSequence then
    self:NodePlayCastingSequence(GameMode, Target, UI)
  else
    print(_G.LogTag, "Error: GameMode dont have PlayCastingSequence")
  end
end

function SelectGenderAndNameNode:NodePlayCastingSequence(GameMode, Target, UI)
  if not GameMode or not GameMode.PlayCastingSequence then
    return
  end
  print(_G.LogTag, "LXZ NodePlayCastingSequence", self.NodeType, Target)
  GameMode:PlayCastingSequence(Target, self.NodeType == "Current")
end

function SelectGenderAndNameNode:OnSelectRoleUIOpen(Widget)
  Widget.SelectNodeType = self.NodeType
  Widget.IsGM = self.IsGM
end

function SelectGenderAndNameNode:SetGameInputDisable(bDisable)
  local TmpPlayer = UE4.UGameplayStatics.GetPlayerCharacter(GWorld.GameInstance, 0)
  if bDisable then
    DebugPrint("DisableInput")
    TmpPlayer:AddDisableInputTag("Talk")
    TmpPlayer.MoveInput = FVector(0, 0, 0)
    TmpPlayer.MoveInputCache = FVector(0, 0, 0)
    TmpPlayer:SetActorHideTag("Talk", true)
  else
    DebugPrint("EnableInput")
    TmpPlayer:RemoveDisableInputTag("Talk")
    TmpPlayer:SetActorHideTag("Talk", false)
  end
end

return SelectGenderAndNameNode
