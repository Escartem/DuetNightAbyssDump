local CamPostProcessMgrComponent = {}
require("Const")
require("Utils")
local MiscUtils = require("Utils.MiscUtils")
local FadeMat = MiscUtils.LazyLoadObject(Const.ScreenFadeMat)

function CamPostProcessMgrComponent:InitPostProcessSettings()
  if not self.GetCameraComponent then
    return
  end
  self.MaterialPramentsCollectionsMap = {}
  self.MaterialInstanceMap = {}
  self.MutexMaterialEffectIds = {}
end

function CamPostProcessMgrComponent:AddMPC(Name, CollectionObject)
  self.MaterialPramentsCollectionsMap[Name] = CollectionObject
end

function CamPostProcessMgrComponent:AddBlendableMaterial(Material, Weight)
  local CameraComponent = self:GetCameraComponent()
  local DynamicInstance = UE4.UKismetMaterialLibrary.CreateDynamicMaterialInstance(self, Material)
  if CameraComponent.MaterialInstDynamicMaps:Find(Material) then
    DynamicInstance = CameraComponent.MaterialInstDynamicMaps:Find(Material)
  else
    CameraComponent.MaterialInstDynamicMaps:Add(Material, DynamicInstance)
  end
  CameraComponent:AddOrUpdateBlendable(DynamicInstance, Weight)
end

function CamPostProcessMgrComponent:AddBlendableMaterialInst(MaterialInst, Weight)
  local CameraComponent = self:GetCameraComponent()
  local MaterialType = MaterialInst:GetBaseMaterial()
  local DynamicInstance = UE4.UKismetMaterialLibrary.CreateDynamicMaterialInstance(self, MaterialInst)
  if CameraComponent.MaterialInstDynamicMaps:Find(MaterialType) then
    DynamicInstance = CameraComponent.MaterialInstDynamicMaps:Find(MaterialType)
  else
    CameraComponent.MaterialInstDynamicMaps:Add(MaterialType, DynamicInstance)
  end
  CameraComponent:AddOrUpdateBlendable(DynamicInstance, Weight)
end

function CamPostProcessMgrComponent:GetBlendableMaterailInst(Material)
  local CameraComponent = self:GetCameraComponent()
  local DynamicInstance = CameraComponent.MaterialInstDynamicMaps:Find(Material)
  return DynamicInstance
end

function CamPostProcessMgrComponent:RemoveBlendableMaterial(Material)
  local CameraComponent = self:GetCameraComponent()
  local DynamicInstance = CameraComponent.MaterialInstDynamicMaps:Find(Material)
  CameraComponent:RemoveBlendableMaterial(DynamicInstance)
  CameraComponent.MaterialInstDynamicMaps:Remove(Material)
end

function CamPostProcessMgrComponent:ClearBlendableMaterials()
  local CameraComponent = self:GetCameraComponent()
  CameraComponent:ClearBlendables()
  self.MaterialPramentsCollectionsMap = {}
  CameraComponent.MaterialInstDynamicMaps:Clear()
end

function CamPostProcessMgrComponent:ChangeMaterialParamentFloat(Material, ParamName, ParamVal)
  local CameraComponent = self:GetCameraComponent()
  local DynamicInstance = CameraComponent.MaterialInstDynamicMaps:Find(Material)
  if not DynamicInstance then
    return
  end
  DynamicInstance:SetScalarParameterValue(ParamName, ParamVal)
end

function CamPostProcessMgrComponent:ChangeMaterialParamentVector(Material, ParamName, ParamVal)
  local CameraComponent = self:GetCameraComponent()
  local DynamicInstance = CameraComponent.MaterialInstDynamicMaps:Find(Material)
  if not DynamicInstance then
    return
  end
  DynamicInstance:SetVectorParameterValue(ParamName, ParamVal)
end

function CamPostProcessMgrComponent:GetMaterialParamentFloat(Material, ParamName)
  local CameraComponent = self:GetCameraComponent()
  local DynamicInstance = CameraComponent.MaterialInstDynamicMaps:Find(Material)
  if not DynamicInstance then
    return
  end
  return DynamicInstance:K2_GetScalarParameterValue(ParamName)
end

function CamPostProcessMgrComponent:GetMaterialParamentVector(Material, ParamName)
  local CameraComponent = self:GetCameraComponent()
  local DynamicInstance = CameraComponent.MaterialInstDynamicMaps:Find(Material)
  if not DynamicInstance then
    return
  end
  return DynamicInstance:K2_GetVectorParameterValue(ParamName)
end

function CamPostProcessMgrComponent:ChangeMPCFloat(MPCName, ParamName, ParamVal)
  local MPCObject = self.MaterialPramentsCollectionsMap[MPCName]
  if not MPCObject then
    return
  end
  MPCObject:SetScalarParameterValue(ParamName, ParamVal)
end

function CamPostProcessMgrComponent:ChangeMPCVector(MPCName, ParamName, ParamVal)
  local MPCObject = self.MaterialPramentsCollectionsMap[MPCName]
  if not MPCObject then
    return
  end
  MPCObject:SetVectorParameterValue(ParamName, ParamVal)
end

function CamPostProcessMgrComponent:CameraFade(Duration, FadeOut)
  local Due = UE4.UKismetMathLibrary.FClamp(Duration, 0, 1)
  if not FadeOut then
    Due = 1 - Due
  end
  self:ChangeMaterialParamentFloat(FadeMat:get(), "TimePass", Due)
  if 0 == self:GetMaterialParamentFloat(FadeMat:get(), "TimePass") then
    self:RemoveTimer("CameraFade")
    self:RemoveBlendableMaterial(FadeMat:get())
  end
end

function CamPostProcessMgrComponent:StartCameraFade(WaitTime)
  self:AddBlendableMaterial(FadeMat:get(), 1)
  self:ChangeMaterialParamentFloat(FadeMat:get(), "TimePass", 1)
  self.StartCameraFadeTime = UE4.UGameplayStatics.GetTimeSeconds(self)
  self.FadeOut = false
  WaitTime = WaitTime or 0.03
  self:AddTimer(WaitTime, self.CameraFadeTick, true, 0, "CameraFade")
end

function CamPostProcessMgrComponent:CameraFadeTick()
  local Now = UE4.UGameplayStatics.GetTimeSeconds(self)
  local Delta = Now - self.StartCameraFadeTime
  if Delta > 1 and self.FadeOut then
    self.StartCameraFadeTime = Now
    self.FadeOut = false
    Delta = 0
  end
  self:CameraFade(Delta, self.FadeOut)
end

function CamPostProcessMgrComponent:NewBlackScreenFade(OutAnimationPlayTime)
  if IsClient(self) or IsStandAlone(self) then
    local Params = {}
    Params.BlackScreenHandle = "BlackScreenFade"
    Params.OutAnimationPlayTime = OutAnimationPlayTime or 0.5
    Params.IsPlayOutWhenLoaded = true
    UIManager(self):ShowCommonBlackScreen(Params)
  end
end

return CamPostProcessMgrComponent
