local MiscUtils = require("Utils.MiscUtils")
local M = Class("BluePrints.Common.BP_NewLevelLoader_C")
local BP_NewLevelLoader_C = require("BluePrints.Common.BP_NewLevelLoader_C")

function M:ReceiveBeginPlay()
  M.Super.ReceiveBeginPlay(self)
  self.RenderTexture = UKismetRenderingLibrary.CreateRenderTarget2D(self)
  local size = UWidgetLayoutLibrary.GetViewportSize(self)
  URuntimeCommonFunctionLibrary.RenderTarget2DResize(self.RenderTexture, size.X, size.Y)
  local player = UGameplayStatics.GetPlayerCharacter(self, 0)
  self.SceneCaptureComponent = NewObject(USceneCaptureComponent2D, player)
  self.SceneCaptureComponent:K2_AttachToComponent(player.CharCameraComponent)
  self.SceneCaptureComponent:K2_SetRelativeTransform(FTransform(), false, nil, false)
  URuntimeCommonFunctionLibrary.RegisterComponent(self.SceneCaptureComponent)
  self.SceneCaptureComponent.FOVAngle = player.CharCameraComponent.FieldOfView
  self.SceneCaptureComponent.TextureTarget = self.RenderTexture
  self.SceneCaptureComponent.CaptureSource = ESceneCaptureSource.SCS_FinalColorHDR
  self.SceneCaptureComponent:SetComponentTickEnabled(false)
  self.SceneCaptureComponent.bCaptureEveryFrame = false
  self.SceneCaptureComponent.bCaptureOnMovement = false
end

function M:ReceiveEndPlay(Reason)
  M.Super.ReceiveEndPlay(self, Reason)
  if self.SceneCaptureComponent then
    self.SceneCaptureComponent:K2_DestroyComponent(self.SceneCaptureComponent)
    self.SceneCaptureComponent = nil
  end
  UKismetRenderingLibrary.ReleaseRenderTarget2D(self.RenderTexture)
  self.RenderTexture = nil
end

function M:OnPreloadComplete()
  M.Super.OnPreloadComplete(self)
  self.AbyssLevels = {}
  table.insert(self.AbyssLevels, self.enterLevelID)
  if not self.ConnectedLevel or not self.ConnectedLevel[self.enterLevelID] then
    self:GetConnectedLevel(self.enterLevelID)
  end
  if self.ConnectedLevel[self.enterLevelID] then
    for _, id in pairs(self.ConnectedLevel[self.enterLevelID]) do
      table.insert(self.AbyssLevels, id)
    end
  end
end

function M:LoadAbyssLevel(BPArrow, CurrentLevelId)
  local targetLevelId = CurrentLevelId
  local otherLevelId = CurrentLevelId
  if CurrentLevelId == BPArrow.LevelId then
    targetLevelId = BPArrow.OtherLevelId
  else
    targetLevelId = BPArrow.LevelId
  end
  if not self.ConnectedLevel or not self.ConnectedLevel[targetLevelId] then
    self:GetConnectedLevel(targetLevelId)
  end
  DebugPrint("LoadAbyssLevel", targetLevelId, CurrentLevelId)
  if self.ConnectedLevel[targetLevelId] then
    for _, id in pairs(self.ConnectedLevel[targetLevelId]) do
      if id ~= otherLevelId and not self:GetLevelLoaded(id) then
        BP_NewLevelLoader_C.Super.LoadArtLevel(self, id)
        table.insert(self.AbyssLevels, id)
      end
    end
  end
end

function M:LoadLevelByBPArrow(PlayerCharacter, BPArrow)
end

function M:UnloadLevelByBPArrow(PlayerCharacter, BPArrow)
  if MiscUtils.IsSimulatedProxy(PlayerCharacter) then
    return
  end
  local levelId = PlayerCharacter.CurrentLevelId:GetRef(1)
  if BPArrow.LevelId ~= levelId and BPArrow.OtherLevelId ~= levelId then
    print(_G.LogTag, "WARNING: character level id ERROR from BPArrow:" .. BPArrow.DisplayName .. "  LevelId:" .. BPArrow.LevelID .. "  Character level ID:" .. levelId)
    return
  end
  local targetLevelId = levelId
  local otherLevelId = levelId
  if levelId == BPArrow.LevelId then
    targetLevelId = BPArrow.OtherLevelId
  else
    targetLevelId = BPArrow.LevelId
  end
  if self:GetLevelLoaded(targetLevelId) and #self.AbyssLevels > 2 and self.AbyssLevels[1] == targetLevelId then
    BP_NewLevelLoader_C.Super.UnloadArtLevel(self, targetLevelId)
    table.remove(self.AbyssLevels, 1)
  end
end

function M:OnHomeLevelLoadedCallback(LevelName)
end

function M:OnAbyssTeleport(IsBoss)
  if IsStandAlone(self) or IsClient(self) then
    if IsBoss then
      UIManager(self):LoadUINew("RougeTransitionBoss", self.SceneCaptureComponent, self.RenderTexture, true)
    else
      UIManager(self):LoadUINew("RougeTransition", self.SceneCaptureComponent, self.RenderTexture, false)
    end
  end
end

return M
