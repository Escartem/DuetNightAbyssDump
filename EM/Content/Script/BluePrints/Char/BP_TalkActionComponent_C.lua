require("UnLua")
local BP_TalkActionComponent_C = Class()

function BP_TalkActionComponent_C:GetMesh()
  if not self.Mesh then
    self.Mesh = self:GetOwner().Mesh
    assert(self.Mesh, "Can't find owner mesh!")
  end
  return self.Mesh
end

function BP_TalkActionComponent_C:TryToGetAnimInstance()
  self.AnimInstance = self:GetOwner():GetAnimInstance()
  assert(self.AnimInstance, "Anim instance nil")
end

function BP_TalkActionComponent_C:IsSpecialAction(ActionId)
  local ActionInfo = DataMgr.TalkAction[ActionId]
  assert(ActionInfo, "Talk action info nil, action id: " .. ActionId)
  return ActionInfo.IsSpecialAnim
end

function BP_TalkActionComponent_C:SetLookAtAngles()
  if nil == self.AnimInstance then
    self:TryToGetAnimInstance()
  end
  self.AnimInstance.LookAtMaxX = 60
  self.AnimInstance.LookAtMinX = -60
  self.AnimInstance.LookAtMaxY = 30
  self.AnimInstance.LookAtMinY = -30
  self.AnimInstance.LookAtMaxZ = 60
  self.AnimInstance.LookAtMinZ = -60
end

function BP_TalkActionComponent_C:ResetLookAt()
  if nil == self.AnimInstance then
    self:TryToGetAnimInstance()
  end
  self.AnimInstance.bIsLookAt = false
end

function BP_TalkActionComponent_C:StartLookAt(TargetActor)
  if nil == self.AnimInstance then
    self:TryToGetAnimInstance()
  end
  self.AnimInstance:SetLookAtActor(TargetActor, "head")
end

function BP_TalkActionComponent_C:EndLookAt(TargetActor)
  self.EnableLookAt = false
end

function BP_TalkActionComponent_C:Tick()
end

function BP_TalkActionComponent_C:RotateTo(TargetActor, BlendTime, Callback)
end

function BP_TalkActionComponent_C:PlayMontage(MeshComp, MontageAsset, PlayParam)
  if not MontageAsset then
    local Result = PlayParam.OnCompleted and PlayParam.OnCompleted:Call()
    return
  end
  local MontCallbackProxy = UE4.UPlayMontageCallbackProxy.CreateProxyObjectForPlayMontage(MeshComp, MontageAsset, PlayParam.PlayRate, PlayParam.StartPos, PlayParam.StartSec)
  if PlayParam.OnCompleted then
    PlayParam.OnCompleted:WrapUEDelegate(MontCallbackProxy.OnCompleted)
  end
  if PlayParam.OnBlendOut then
    PlayParam.OnBlendOut:WrapUEDelegate(MontCallbackProxy.OnBlendOut)
  end
  if PlayParam.OnInterrupted then
    PlayParam.OnInterrupted:WrapUEDelegate(MontCallbackProxy.OnInterrupted)
  end
end

function BP_TalkActionComponent_C:StopAllAction(BlendOutTime)
  if nil == self.AnimInstance then
    self:TryToGetAnimInstance()
  end
  self.AnimInstance:Montage_Stop(BlendOutTime)
end

function BP_TalkActionComponent_C:SetTalkActionLoopAnim(Anim)
  if nil == Anim then
    return
  end
  if nil == self.AnimInstance then
    self:TryToGetAnimInstance()
  end
  self.AnimInstance:SetTalkActionAnim(Anim)
end

return BP_TalkActionComponent_C
