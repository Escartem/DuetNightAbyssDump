local M = {}
local FEFNode_MoveTo = require("BluePrints.Story.ExecutionFlow.Nodes.EFNode_MoveTo")
local FEFNode_PlayAnim = require("BluePrints.Story.ExecutionFlow.Nodes.EFNode_PlayAnim")
local FEFNode_SitOrStand = require("BluePrints.Story.ExecutionFlow.Nodes.EFNode_SitOrStand")
local FEFNode_SetTag = require("BluePrints.Story.ExecutionFlow.Nodes.EFNode_SetTag")
local FEFNode_UnsetTag = require("BluePrints.Story.ExecutionFlow.Nodes.EFNode_UnsetTag")
local FEFNode_StopTalkGroup = require("BluePrints.Story.ExecutionFlow.Nodes.EFNode_StopTalkGroup")
local FEFNode_PlayOrStopBGM = require("BluePrints.Story.ExecutionFlow.Nodes.EFNode_PlayOrStopBGM")
local FEFNode_PlayOrStopSound = require("BluePrints.Story.ExecutionFlow.Nodes.EFNode_PlayOrStopSound")
local FEFNode_LookAt = require("BluePrints.Story.ExecutionFlow.Nodes.EFNode_LookAt")
local FEFNode_TurnTo = require("BluePrints.Story.ExecutionFlow.Nodes.EFNode_TurnTo")
local FEFNode_SetPlayerLoc = require("BluePrints.Story.ExecutionFlow.Nodes.EFNode_SetPlayerLoc")
local FEFNode_SetLocation = require("BluePrints.Story.ExecutionFlow.Nodes.EFNode_SetLocation")
local FEFNode_SetRotation = require("BluePrints.Story.ExecutionFlow.Nodes.EFNode_SetRotation")
local FEFNode_CameraMoveTo = require("BluePrints.Story.ExecutionFlow.Nodes.EFNode_CameraMoveTo")
local FEFNode_ShowPicture = require("BluePrints.Story.ExecutionFlow.Nodes.EFNode_ShowPicture")
local FEFNode_PostProcess = require("BluePrints.Story.ExecutionFlow.Nodes.EFNode_PostProcess")
local FEFNode_CameraShake = require("BluePrints.Story.ExecutionFlow.Nodes.EFNode_CameraShake")
local FEFNode_DefaultLookAt = require("BluePrints.Story.ExecutionFlow.Nodes.EFNode_DefaultLookAt")
local FEFNode_PlayFacial = require("BluePrints.Story.ExecutionFlow.Nodes.EFNode_PlayFacial")
local FEFNode_SetOutport = require("BluePrints.Story.ExecutionFlow.Nodes.EFNode_SetOutport")
local FEFNode_ChangeStaticCreator = require("BluePrints.Story.ExecutionFlow.Nodes.EFNode_ChangeStaticCreator")
local FEFNode_SetVar = require("BluePrints.Story.ExecutionFlow.Nodes.EFNode_SetVar")

function M:CreateFlow(DialogueId, TalkTask, OnFinished)
  local DialogueScriptTable = DataMgr.DialogueConvert[DialogueId]
  if not DialogueScriptTable or not DialogueScriptTable.Operations then
    if OnFinished then
      OnFinished()
    end
    return nil
  end
  local TalkSubsystem = USubsystemBlueprintLibrary.GetWorldSubsystem(GWorld.GameInstance, UTalkSubsystem)
  if nil == TalkSubsystem then
    DebugPrint("LogExecutionFlow:Error: Create flow failed: talk subsystem is nil")
    return nil
  end
  local Flow = TalkSubsystem:CreateDialogueFlow(DialogueId)
  Flow.DialogueId = DialogueId
  Flow.bAllowClick = DialogueScriptTable.bAllowClick
  Flow.OnFinish:Add(TalkSubsystem, function()
    TalkSubsystem:DestroyDialogueFlow(DialogueId)
    if OnFinished then
      OnFinished()
    end
  end)
  Flow.OnStop:Add(TalkSubsystem, function()
    TalkSubsystem:DestroyDialogueFlow(DialogueId)
    if OnFinished then
      OnFinished()
    end
  end)
  local StartNode = Flow.StartNode
  local FinishNode = Flow.FinishNode
  local NodeStartPin, NodeFinishPin = self:PARA(Flow, TalkTask, DialogueScriptTable.Operations)
  if NodeStartPin and NodeFinishPin then
    StartNode.FinishPin:LinkTo(NodeStartPin)
    NodeFinishPin:LinkTo(FinishNode.StartPin)
  else
    StartNode.FinishPin:LinkTo(FinishNode.StartPin)
  end
  return Flow
end

function M:SEQ(Flow, TalkTask, Operations)
  local StartPin, FinishPin
  for _, Operation in ipairs(Operations) do
    for FunctionName, Params in pairs(Operation) do
      local NodeStartPin, NodeFinishPin = self[FunctionName](self, Flow, TalkTask, Params)
      if NodeStartPin and NodeFinishPin then
        StartPin = StartPin or NodeStartPin
        if FinishPin then
          FinishPin:LinkTo(NodeStartPin)
        end
        FinishPin = NodeFinishPin
      end
    end
  end
  return StartPin, FinishPin
end

function M:PARA(Flow, TalkTask, Operations)
  local StartPin, FinishPin
  local ParallelNode = Flow:CreateNode(UEFNode_Parallel)
  local WaitAllNode = Flow:CreateNode(UEFNode_WaitAll)
  for _, Operation in ipairs(Operations) do
    for FunctionName, Params in pairs(Operation) do
      local NodeStartPin, NodeFinishPin = self[FunctionName](self, Flow, TalkTask, Params)
      if NodeStartPin and NodeFinishPin then
        if not StartPin then
          StartPin = ParallelNode.StartPin
          FinishPin = WaitAllNode.FinishPin
        end
        ParallelNode.FinishPin:LinkTo(NodeStartPin)
        NodeFinishPin:LinkTo(WaitAllNode.StartPin)
      end
    end
  end
  return StartPin, FinishPin
end

function M:Delay(Flow, TalkTask, Params)
  local DelaySeconds = Params.DelaySeconds
  local DelayNode = Flow:CreateNode(UEFNode_Delay)
  if nil == DelayNode then
    return
  end
  DelayNode.DelaySeconds = DelaySeconds
  return DelayNode.StartPin, DelayNode.FinishPin
end

function M:MoveTo(Flow, TalkTask, Params)
  local MoveToNode = FEFNode_MoveTo:CreateNode(Flow, TalkTask, Params)
  if nil == MoveToNode then
    return
  end
  return MoveToNode.StartPin, MoveToNode.FinishPin
end

function M:PlayAnimation(Flow, TalkTask, Params)
  local PlayAnimationNode = FEFNode_PlayAnim:CreateNode(Flow, TalkTask, Params)
  if nil == PlayAnimationNode then
    return
  end
  return PlayAnimationNode.StartPin, PlayAnimationNode.FinishPin
end

function M:SitOrStand(Flow, TalkTask, Params)
  local SitOrStandNode = FEFNode_SitOrStand:CreateNode(Flow, TalkTask, Params)
  if nil == SitOrStandNode then
    return
  end
  return SitOrStandNode.StartPin, SitOrStandNode.FinishPin
end

function M:SetTag(Flow, TalkTask, Params)
  local SetTagNode = FEFNode_SetTag:CreateNode(Flow, TalkTask, Params)
  if nil == SetTagNode then
    return
  end
  return SetTagNode.StartPin, SetTagNode.FinishPin
end

function M:UnsetTag(Flow, TalkTask, Params)
  local UnSetTagNode = FEFNode_UnsetTag:CreateNode(Flow, TalkTask, Params)
  if nil == UnSetTagNode then
    return
  end
  return UnSetTagNode.StartPin, UnSetTagNode.FinishPin
end

function M:StopTalkGroup(Flow, TalkTask, Params)
  local StopTalkGroupNode = FEFNode_StopTalkGroup:CreateNode(Flow, TalkTask, Params)
  if nil == StopTalkGroupNode then
    return
  end
  return StopTalkGroupNode.StartPin, StopTalkGroupNode.FinishPin
end

function M:PlayOrStopBGM(Flow, TalkTask, Params)
  local PlayOrStopBGMNode = FEFNode_PlayOrStopBGM:CreateNode(Flow, TalkTask, Params)
  if nil == PlayOrStopBGMNode then
    return
  end
  return PlayOrStopBGMNode.StartPin, PlayOrStopBGMNode.FinishPin
end

function M:PlayNormalSound(Flow, TalkTask, Params)
  local PlayNormalSoundNode = FEFNode_PlayOrStopSound:CreatePlayNormalSoundNode(Flow, TalkTask, Params)
  if nil == PlayNormalSoundNode then
    return
  end
  return PlayNormalSoundNode.StartPin, PlayNormalSoundNode.FinishPin
end

function M:StopNormalSound(Flow, TalkTask, Params)
  local StopNormalSoundNode = FEFNode_PlayOrStopSound:CreateStopNormalSoundNode(Flow, TalkTask, Params)
  if nil == StopNormalSoundNode then
    return
  end
  return StopNormalSoundNode.StartPin, StopNormalSoundNode.FinishPin
end

function M:LookAt(Flow, TalkTask, Params)
  local LookAtNode = FEFNode_LookAt:CreateNode(Flow, TalkTask, Params)
  if nil == LookAtNode then
    return
  end
  return LookAtNode.StartPin, LookAtNode.FinishPin
end

function M:TurnTo(Flow, TalkTask, Params)
  local TurnToNode = FEFNode_TurnTo:CreateNode(Flow, TalkTask, Params)
  if nil == TurnToNode then
    return
  end
  return TurnToNode.StartPin, TurnToNode.FinishPin
end

function M:SetPlayerLoc(Flow, TalkTask, Params)
  local SetPlayerLocNode = FEFNode_SetPlayerLoc:CreateNode(Flow, TalkTask, Params)
  if nil == SetPlayerLocNode then
    return
  end
  return SetPlayerLocNode.StartPin, SetPlayerLocNode.FinishPin
end

function M:SetLocation(Flow, TalkTask, Params)
  local SetLocationNode = FEFNode_SetLocation:CreateNode(Flow, TalkTask, Params)
  if nil == SetLocationNode then
    return
  end
  return SetLocationNode.StartPin, SetLocationNode.FinishPin
end

function M:SetRotation(Flow, TalkTask, Params)
  local SetRotationNode = FEFNode_SetRotation:CreateNode(Flow, TalkTask, Params)
  if nil == SetRotationNode then
    return
  end
  return SetRotationNode.StartPin, SetRotationNode.FinishPin
end

function M:CameraMoveTo(Flow, TalkTask, Params)
  local CameraMoveToNode = FEFNode_CameraMoveTo:CreateNode(Flow, TalkTask, Params)
  if nil == CameraMoveToNode then
    return
  end
  return CameraMoveToNode.StartPin, CameraMoveToNode.FinishPin
end

function M:ShowPicture(Flow, TalkTask, Params)
  local ShowPictureNode = FEFNode_ShowPicture:CreateNode(Flow, TalkTask, Params)
  if nil == ShowPictureNode then
    return
  end
  return ShowPictureNode.StartPin, ShowPictureNode.FinishPin
end

function M:PostProcess(Flow, TalkTask, Params)
  local PostProcessNode = FEFNode_PostProcess:CreateNode(Flow, TalkTask, Params)
  if nil == PostProcessNode then
    return
  end
  return PostProcessNode.StartPin, PostProcessNode.FinishPin
end

function M:CameraShake(Flow, TalkTask, Params)
  local CameraShakeNode = FEFNode_CameraShake:CreateNode(Flow, TalkTask, Params)
  if nil == CameraShakeNode then
    return
  end
  return CameraShakeNode.StartPin, CameraShakeNode.FinishPin
end

function M:DefaultLookAt(Flow, TalkTask, Params)
  local DefaultLookAtNode = FEFNode_DefaultLookAt:CreateNode(Flow, TalkTask, Params)
  if nil == DefaultLookAtNode then
    return
  end
  return DefaultLookAtNode.StartPin, DefaultLookAtNode.FinishPin
end

function M:PlayFacial(Flow, TalkTask, Params)
  local PlayFacialNode = FEFNode_PlayFacial:CreateNode(Flow, TalkTask, Params)
  if nil == PlayFacialNode then
    return
  end
  return PlayFacialNode.StartPin, PlayFacialNode.FinishPin
end

function M:SetOutport(Flow, TalkTask, Params)
  local SetOutportNode = FEFNode_SetOutport:CreateNode(Flow, TalkTask, Params)
  if nil == SetOutportNode then
    return
  end
  return SetOutportNode.StartPin, SetOutportNode.FinishPin
end

function M:ChangeStaticCreator(Flow, TalkTask, Params)
  local ChangeStaticCreatorNode = FEFNode_ChangeStaticCreator:CreateNode(Flow, TalkTask, Params)
  if nil == ChangeStaticCreatorNode then
    return
  end
  return ChangeStaticCreatorNode.StartPin, ChangeStaticCreatorNode.FinishPin
end

function M:SetVar(Flow, TalkTask, Params)
  local SetVarNode = FEFNode_SetVar:CreateNode(Flow, TalkTask, Params)
  if nil == SetVarNode then
    return
  end
  return SetVarNode.StartPin, SetVarNode.FinishPin
end

return M
