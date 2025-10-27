require("UnLua")
local BP_CrackChest_C = Class({
  "BluePrints.Item.BP_CombatItemBase_C"
})

function BP_CrackChest_C:AuthorityInitInfo(Info)
  BP_CrackChest_C.Super.AuthorityInitInfo(self, Info)
  self.MainId = self.UnitParams.Chest or 6
  self.MechId = self.UnitParams.MechID or 39002
  self.MechCount = self.UnitParams.MechCount or 3
  self.GamePlayType = self.UnitParams.GamePlayType or 0
  self:CreateMain(self.MainBody, {
    UnitType = "Mechanism",
    UnitId = self.MainId
  })
  self:CreateCrack({
    UnitType = "Mechanism",
    UnitId = self.MechId
  })
  self.CanOpen = false
  self.BreakableItemNum = 3
end

function BP_CrackChest_C:ClientInitInfo()
  self.MechMusicPath = self.UnitParams.MechMusicPath
  self.AchievedMusicPath = self.UnitParams.AchievedMusicPath
  self.OpenBoxExtraMusicPath = self.UnitParams.OpenBoxExtraMusicPath
end

function BP_CrackChest_C:CreateMain(Point, Info)
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  
  local function LoadFinishCallback(Unit)
    self.Main = Unit
    self.Main.CanOpen = false
  end
  
  GameMode.EMGameState.EventMgr:CreateUnit({
    UnitType = Info.UnitType,
    UnitId = Info.UnitId,
    Loc = Point:K2_GetComponentLocation(),
    Rotation = Point:K2_GetComponentRotation(),
    SaveGame = false,
    SourceEid = self.Eid,
    LoadFinishCallback = LoadFinishCallback
  })
end

function BP_CrackChest_C:CreateCrack(Info)
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  self.CrackMap = TMap(0, AActor)
  self.CrackPointArray = self.MainBody:GetChildrenComponents(false)
  for i = 1, self.CrackPointArray:Length() do
    self:RealCreateCrack(Info, self.CrackPointArray[i])
  end
end

function BP_CrackChest_C:RealCreateCrack(Info, StaticMeshComponent)
  if UE4.UGameplayStatics.GetObjectClass(StaticMeshComponent) ~= UStaticMeshComponent:StaticClass() then
    return
  end
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  
  local function LoadFinishCallback(Unit)
    self.CrackMap:Add(Unit.Eid, Unit)
  end
  
  GameMode.EMGameState.EventMgr:CreateUnit({
    UnitType = Info.UnitType,
    UnitId = Info.UnitId,
    Loc = StaticMeshComponent:K2_GetComponentLocation(),
    Rotation = StaticMeshComponent:K2_GetComponentRotation(),
    SaveGame = false,
    SourceEid = self.Eid,
    LoadFinishCallback = LoadFinishCallback
  })
end

function BP_CrackChest_C:TriggerByChild(ChildEid)
  if ChildEid == self.Main.Eid then
    if IsStandAlone(self) or not IsAuthority(self) then
      local Pos = self.OffsetPos
      AudioManager(self):PlayFMODSound(self, nil, "event:/sfx/enemy/Gr/Baotu/vo_warn", "BossGem", nil, nil, nil, nil, nil, nil, nil, Pos)
    end
  else
    self.CrackMap:Remove(ChildEid)
    if 0 == self.CrackMap:Length() then
      self.Main:UpdateRegionData("CanOpen", true)
    end
  end
end

return BP_CrackChest_C
