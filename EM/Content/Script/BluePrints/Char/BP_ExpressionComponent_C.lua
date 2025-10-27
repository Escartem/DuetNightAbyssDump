require("UnLua")
require("DataMgr")
local BP_ExpressionComponent_C = Class()

function BP_ExpressionComponent_C:GetMesh()
  if not self.Mesh then
    self.Mesh = self:GetOwner().Mesh
    assert(self.Mesh, "Can't find owner mesh!")
  end
  return self.Mesh
end

function BP_ExpressionComponent_C:TryToGetAnimInstance()
  self.AnimInstance = self:GetMesh():GetAnimInstance()
  assert(self.AnimInstance)
end

function BP_ExpressionComponent_C:DelayPlayAnimation(Animation, DelayTime, Type)
  UE4.UKismetSystemLibrary.Delay(self, DelayTime)
  if "Eye" == Type then
    self.AnimInstance:PlayEyeAnimation(Animation)
  elseif "Mouth" == Type then
    self.AnimInstance:PlayMouthAnimation(Animation)
  else
    error("Invalid facial animation type!")
  end
end

function BP_ExpressionComponent_C:PlayFacialAnimation(FacialId)
  local FacialInfo = DataMgr.Facial[FacialId]
  assert(FacialInfo, "Facial info nil, facial id: " .. FacialId)
  local Path = "/Game/Asset/Char/Player/Char001_Heitao_J/Animation/Sequence/Facial/"
  local NpcEyePath1 = FacialInfo.NpcEye and Path .. FacialInfo.NpcEye or nil
  local NpcEyePath2 = FacialInfo.NpcEye2 and Path .. FacialInfo.NpcEye2 or nil
  local NpcMouthLoopPath = FacialInfo.NpcMouth and Path .. FacialInfo.NpcMouth or nil
  local NpcMouthEndPath = FacialInfo.NpcMouthStatic and Path .. FacialInfo.NpcMouthStatic or nil
  local EyeBlendTime = FacialInfo.BlendStart
  local MouthLoopDuration = FacialInfo.LoopTime
  self:PlayFacialAnimationInternal(NpcEyePath1, NpcEyePath2, EyeBlendTime, NpcMouthLoopPath, NpcMouthEndPath, MouthLoopDuration)
end

function BP_ExpressionComponent_C:PlayFacialAnimationInternal(NpcEyePath1, NpcEyePath2, EyeBlendTime, NpcMouthLoopPath, NpcMouthEndPath, MouthLoopDuration)
  if nil == self.AnimInstance then
    self:TryToGetAnimInstance()
  end
  if NpcEyePath1 then
    local NpcEyeAnimation1 = LoadObject(NpcEyePath1)
    if NpcEyeAnimation1 then
      self.AnimInstance:PlayEyeAnimation(NpcEyeAnimation1)
    end
  end
  if NpcEyePath2 then
    local NpcEyeAnimation2 = LoadObject(NpcEyePath2)
    if NpcEyeAnimation2 then
      coroutine.resume(coroutine.create(self.DelayPlayAnimation), self, NpcEyeAnimation2, EyeBlendTime, "Eye")
    end
  end
  if NpcMouthLoopPath then
    local NpcMouthLoopAnimation = LoadObject(NpcMouthLoopPath)
    if NpcMouthLoopAnimation then
      self.AnimInstance:PlayMouthAnimation(NpcMouthLoopAnimation)
    end
  end
  if NpcMouthEndPath then
    local NpcMouthEndAnimation = LoadObject(NpcMouthEndPath)
    if NpcMouthEndAnimation then
      coroutine.resume(coroutine.create(self.DelayPlayAnimation), self, NpcMouthEndAnimation, MouthLoopDuration, "Mouth")
    end
  end
end

return BP_ExpressionComponent_C
