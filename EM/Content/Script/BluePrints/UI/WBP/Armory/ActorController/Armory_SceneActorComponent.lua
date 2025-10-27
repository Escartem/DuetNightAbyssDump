local M = {}

function M:Init()
  self.SceneCoroutineMap = {}
  self.SceneCoroutineArray = {}
end

local PreviewSceneLoaded = {}

local function IncreacePreviewSceneRefCount(PreviewLevelName)
  PreviewSceneLoaded[PreviewLevelName] = PreviewSceneLoaded[PreviewLevelName] or 0
  PreviewSceneLoaded[PreviewLevelName] = PreviewSceneLoaded[PreviewLevelName] + 1
end

local function DecreacePreviewSceneRefCount(PreviewLevelName)
  if PreviewSceneLoaded[PreviewLevelName] then
    PreviewSceneLoaded[PreviewLevelName] = PreviewSceneLoaded[PreviewLevelName] - 1
    if PreviewSceneLoaded[PreviewLevelName] <= 0 then
      PreviewSceneLoaded[PreviewLevelName] = nil
    end
  end
end

local function IsPreviewSceneHasRef(PreviewLevelName)
  return PreviewSceneLoaded[PreviewLevelName] and PreviewSceneLoaded[PreviewLevelName] > 0
end

local function _RemoveSceneCoroutine(self, CoroutineName)
  local Idx = self.SceneCoroutineMap[CoroutineName]
  if Idx then
    table.remove(self.SceneCoroutineArray, Idx)
  end
end

local function _AddSceneCoroutine(self, CoroutineName, Co)
  _RemoveSceneCoroutine(self, CoroutineName)
  table.insert(self.SceneCoroutineArray, Co)
  self.SceneCoroutineMap[CoroutineName] = #self.SceneCoroutineArray
end

local function _FindSceneCoroutine(self, CoroutineName)
  local Idx = self.SceneCoroutineMap[CoroutineName]
  if Idx then
    return self.SceneCoroutineArray[Idx]
  end
end

local function _HadAnyPreviewScene()
  return next(PreviewSceneLoaded) ~= nil
end

function M:GetPreviewSceneTrans()
  return self.PreviewSceneTrans
end

function M:TryLoadPreviewScene()
  if self.SmoothLoad then
    coroutine.yield()
  end
  if _HadAnyPreviewScene() then
    self.EPreviewSceneType = self.EPreviewSceneType or CommonConst.EPreviewSceneType.PreviewCommon
  end
  local Path = self.EPreviewSceneType and CommonConst.PreviewScenePaths[self.EPreviewSceneType]
  if not Path then
    return
  end
  self.PreviewSceneLocation = self.PreviewSceneLocation or FVector(100000, 100000, 100000)
  local PreviewLevelLocation = self.PreviewSceneLocation
  local GameMode = UE4.UGameplayStatics.GetGameMode(self.ViewUI)
  local WorldLoader = GameMode:GetLevelLoader()
  local TargetTrans, bSuccess
  if WorldLoader then
    TargetTrans = FTransform()
    TargetTrans.Translation = PreviewLevelLocation
    TargetTrans.Rotation = FRotator(0, 0, 0):ToQuat()
    local PreviewLevelName = "PreviewLevel" .. self.EPreviewSceneType
    if not IsPreviewSceneHasRef(PreviewLevelName) then
      self.IsPreviewSceneLoading = true
      bSuccess = WorldLoader:LoadPreviewLevel(PreviewLevelName, Path, function()
        self.IsPreviewSceneLoading = false
        self:SetPreviewLevelSkyBoxColor(WorldLoader, PreviewLevelName)
        self:OnPreviewSceneLoaded()
      end, PreviewLevelLocation, FRotator(0, 0, 0))
      if bSuccess then
        self.PreviewLevelName = PreviewLevelName
        IncreacePreviewSceneRefCount(PreviewLevelName)
        self.bPreviewSceneLoaded = true
      end
    else
      bSuccess = true
      self.PreviewLevelName = PreviewLevelName
      IncreacePreviewSceneRefCount(PreviewLevelName)
      self.bPreviewSceneLoaded = true
      self.ViewUI:AddTimer(0.01, function()
        self:SetPreviewLevelSkyBoxColor(WorldLoader, PreviewLevelName)
        self:OnPreviewSceneLoaded()
      end)
    end
  end
  if self.SmoothLoad then
    coroutine.yield()
  end
  if bSuccess then
    self.PreviewSceneTrans = TargetTrans
  end
end

function M:SetPreviewLevelSkyBoxColor(WorldLoader, PreviewLevelName)
  if self.SkyBoxColor and self.EPreviewSceneType == CommonConst.EPreviewSceneType.BattlePass then
    local PreviewLevelStreaming = WorldLoader[PreviewLevelName]
    if not PreviewLevelStreaming then
      return
    end
    local PreviewLevel = PreviewLevelStreaming:GetLoadedLevel()
    if not PreviewLevel then
      return
    end
    local PreviewLevelScriptActor = PreviewLevel.LevelScriptActor
    if not PreviewLevelScriptActor then
      return
    end
    local UIShowBG = PreviewLevelScriptActor:GetUIShowBG()
    local UIShowBGStaticMeshComponent = UIShowBG.StaticMeshComponent
    local Index = 0
    local Materials = UIShowBGStaticMeshComponent:GetMaterials()
    local MaterialInstance = Materials:Get(Index + 1)
    if not MaterialInstance:Cast(UMaterialInstanceDynamic:StaticClass()) then
      MaterialInstance = UIShowBGStaticMeshComponent:CreateAndSetMaterialInstanceDynamic(Index)
    end
    MaterialInstance:SetVectorParameterValue("BaseColor2", self.SkyBoxColor.BaseColor2)
    MaterialInstance:SetVectorParameterValue("StarColor", self.SkyBoxColor.StarColor)
    MaterialInstance:SetScalarParameterValue("ColorCurve", self.SkyBoxColor.ColorCurve)
  end
end

function M:UnloadPreviewScene()
  if self.bPreviewSceneLoaded then
    local PreviewLevelName = "PreviewLevel" .. self.EPreviewSceneType
    self.bPreviewSceneLoaded = false
    DecreacePreviewSceneRefCount(PreviewLevelName)
    if not IsPreviewSceneHasRef(PreviewLevelName) then
      local GameMode = UE4.UGameplayStatics.GetGameMode(self.ViewUI)
      local WorldLoader = GameMode:GetLevelLoader()
      if WorldLoader then
        WorldLoader:UnloadPreviewLevel("PreviewLevel" .. self.EPreviewSceneType)
        if IsValid(self.ArmoryHelper) then
          self.ArmoryHelper:OnPreviewSceneUnloaded()
        end
      end
    end
  end
end

function M:WaitForPreviewSceneLoadFinished()
  if self.IsPreviewSceneLoading then
    if coroutine.isyieldable() then
      coroutine.yield()
    else
      return
    end
  end
  return true
end

function M:StartPreviewBGAnimation(PreviewBGPos, Time)
  local function _StartPreviewBGAnimation(...)
    local bSuccess = self:WaitForPreviewSceneLoadFinished()
    
    if not bSuccess then
      return
    end
    local TargetBGLoc
    if PreviewBGPos then
      TargetBGLoc = self.PreviewSceneLocation + FVector(PreviewBGPos[1], PreviewBGPos[2], PreviewBGPos[3])
    else
      TargetBGLoc = self.PreviewSceneLocation
    end
    self.ArmoryHelper:StartPreviewBGAnimation(TargetBGLoc, Time)
  end
  
  self:DoSomethingWithScene("StartPreviewBGAnimation", _StartPreviewBGAnimation)
end

function M:DoSomethingWithScene(BehaviorName, Func, ...)
  local Co = _FindSceneCoroutine(self, BehaviorName)
  if Co then
    local Status = coroutine.status(Co)
    if "running" == Status or "suspended" == Status then
      coroutine.close(Co)
      _RemoveSceneCoroutine(self, BehaviorName)
    end
  end
  Co = coroutine.create(Func)
  _AddSceneCoroutine(self, BehaviorName, Co)
  coroutine.resume(Co, ...)
end

function M:DoDeferedSceneBehavior()
  local SceneCoroutineArray = {}
  for _, value in ipairs(self.SceneCoroutineArray) do
    table.insert(SceneCoroutineArray, value)
  end
  self.SceneCoroutineArray = {}
  self.SceneCoroutineMap = {}
  for _, Co in ipairs(SceneCoroutineArray) do
    coroutine.resume(Co)
  end
end

function M:IsSceneActorLoading()
  return self.IsPreviewSceneLoading
end

function M:OnPreviewSceneLoaded()
  self.IsPreviewSceneLoading = false
  self:DoDeferedSceneBehavior()
  self:UpdateLighting()
end

function M:UpdateLighting()
  self.bNotifyHelperUpdateLighting = false
  
  local function _NotifyPreviewSceneUpdateLight(...)
    local bSuccess = self:WaitForPreviewSceneLoadFinished()
    if not bSuccess then
      return
    end
    UKismetSystemLibrary.ExecuteConsoleCommand(self.ViewUI, "r.Shadow.ForceCacheUpdate 1", nil)
    
    local function _CallBP_WaitForWeaponLoading()
      if self.IsArmoryWeaponLoading then
        self:GetWeaponActor()
      end
      self:TryNotifyHelperUpdateLighting()
    end
    
    self:DoSomethingWithWeapon("CallBP_WaitForWeaponLoading", _CallBP_WaitForWeaponLoading)
    
    local function _CallBP_WaitForPlayerLoading()
      if self.IsArmoryPlayerLoading then
        self:GetPlayerActor()
      end
      self:TryNotifyHelperUpdateLighting()
    end
    
    self:DoSomethingWithPlayer("CallBP_WaitForPlayerLoading", _CallBP_WaitForPlayerLoading)
  end
  
  self:DoSomethingWithScene("NotifyPreviewSceneUpdateLight", _NotifyPreviewSceneUpdateLight)
end

function M:TryNotifyHelperUpdateLighting()
  if self.IsArmoryWeaponLoading or self.IsArmoryPlayerLoading then
    return
  end
  if self.bNotifyHelperUpdateLighting then
    return
  end
  if IsValid(self.ArmoryHelper) and self.ArmoryHelper:GetViewActor() then
    self.bNotifyHelperUpdateLighting = true
    self.ArmoryHelper:OnArmoryOpenOrClose(true)
    if self.bPreviewSceneLoaded then
      self.ArmoryHelper:OnPreviewSceneLoaded()
    end
  end
end

function M:SwitchArmoryCamera(IsArmoryCamera)
  if IsArmoryCamera then
    self.ArmoryHelper:OnArmoryOpenOrClose(true)
  end
end

function M:Component_OnClosed()
  self.ArmoryHelper:OnArmoryOpenOrClose(false)
end

function M:Component_OnDestruct()
  self:UnloadPreviewScene()
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(self.ViewUI, 0)
  if Player then
    Player.CharCameraComponent:SetComponentTickEnabled(true)
    if self.EPreviewSceneType then
      UKismetSystemLibrary.ExecuteConsoleCommand(Player, "r.Shadow.ForceCacheUpdate 1", nil)
      URuntimeCommonFunctionLibrary.UpdateWorldLighting(Player)
    end
  end
end

return M
