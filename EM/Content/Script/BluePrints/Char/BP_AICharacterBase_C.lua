require("UnLua")
local BP_AICharacterBase_C = Class({
  "BluePrints.Char.BP_CharacterBase_C"
})
BP_AICharacterBase_C._components = {}

function BP_AICharacterBase_C:ActiveGuide(OpType)
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  local SceneMgrComponent = GameInstance:GetSceneManager()
  if IsValid(SceneMgrComponent) and self.Data and self.Data.GuideIconAni then
    SceneMgrComponent:UpdateSceneGuideIcon(self.Eid, self, nil, OpType, true, self.Data)
  end
end

function BP_AICharacterBase_C:DeactiveGuide()
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  local SceneMgrComponent = GameInstance:GetSceneManager()
  if IsValid(SceneMgrComponent) and self.Data and self.Data.GuideIconAni then
    SceneMgrComponent:UpdateSceneGuideIcon(self.Eid, self, nil, "Delete", true, self.Data)
  end
end

function BP_AICharacterBase_C:OnClaimRegionData_Lua(LuaTableIndex)
  local SubSystem = UE4.USubsystemBlueprintLibrary.GetGameInstanceSubsystem(GWorld.GameInstance, URegionDataMgrSubsystem:StaticClass())
  if SubSystem then
    self.RegionDataType = SubSystem.DataPool.RegionData[LuaTableIndex].RegionDataType
    self.QuestChainId = SubSystem.DataPool.RegionData[LuaTableIndex].QuestChainId
    self.RarelyId = SubSystem.DataPool.RegionData[LuaTableIndex].RarelyId
  end
end

function BP_AICharacterBase_C:CommonFreeAICharacterBaseMemory()
  self.IsDestroied = true
  if self.BornInfo then
    self.BornInfo = nil
  end
  if self.InfoForInit then
    self.InfoForInit.IsDestroied = true
    self.InfoForInit = nil
  end
  if self.BattleCharInfo then
    self.BattleCharInfo = nil
  end
  if self.ServerBornInfo then
    self.ServerBornInfo = nil
  end
end

AssembleComponents(BP_AICharacterBase_C)
return BP_AICharacterBase_C
