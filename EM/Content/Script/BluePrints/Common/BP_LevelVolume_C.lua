require("UnLua")
local MiscUtils = require("Utils.MiscUtils")
local BP_LevelVolume_C = Class()

function BP_LevelVolume_C:Initialize(Initializer)
  self.UnLoadBoxRate = 1.3
end

function BP_LevelVolume_C:ReceiveBeginPlay()
end

function BP_LevelVolume_C:LoadLevel(PlayerCharacter)
  if IsAuthority(PlayerCharacter) or MiscUtils.IsAutonomousProxy(PlayerCharacter) then
    self:CheckLevelLoader()
    if self.loadName == "" and URuntimeCommonFunctionLibrary.IsWorldCompositionEnabled(self) then
      local level = UE4.URuntimeCommonFunctionLibrary.GetLevel(self)
      local LevelObject = UKismetSystemLibrary.GetOuterObject(level)
      self.loadName = UKismetSystemLibrary.GetObjectName(LevelObject)
      self.loadName = string.gsub(self.loadName, "_Gameplay", "")
      self.loadName = string.gsub(self.loadName, "_Design", "")
    end
    if self.levelLoader then
      DebugPrint("BP_LevelVolume_C:ActiveGameMode:", self.loadName)
      self.levelLoader:LoadArtLevel(self.loadName)
    end
  end
end

function BP_LevelVolume_C:UnloadLevel(PlayerCharacter)
  if MiscUtils.IsAutonomousProxy(PlayerCharacter) then
    if not self:CheckIsCharacterIn(PlayerCharacter) then
      self:Unload()
    end
  elseif IsAuthority(PlayerCharacter) then
    if IsStandAlone(PlayerCharacter) then
      if not self:CheckIsCharacterIn(PlayerCharacter) then
        DebugPrint("BP_LevelVolume_C:DeActiveGameMode:", self.loadName)
        self:Unload()
      end
      return
    end
    local index = 0
    while true do
      local character = UE4.UGameplayStatics.GetPlayerCharacter(self, index)
      if character then
        if self:CheckIsCharacterIn(character) then
          return
        end
      else
        return
      end
      index = index + 1
    end
    local positon = PlayerCharacter:K2_GetActorLocation()
    DebugPrint("BP_LevelVolume_C:DeActiveGameMode:", self.loadName)
    self:Unload()
  end
end

function BP_LevelVolume_C:Unload()
  self:CheckLevelLoader()
  if self.levelLoader then
    self.levelLoader:UnloadArtLevel(self.loadName)
  end
end

function BP_LevelVolume_C:CheckLevelLoader()
  if not IsValid(self.levelLoader) then
    self.levelLoader = UE4.UGameplayStatics.GetActorOfClass(self, UE4.AEMLevelLoader)
  end
end

function BP_LevelVolume_C:CheckIsCharacterIn(PlayerCharacter)
  return UE4.UKismetMathLibrary.IsPointInBoxWithTransform(PlayerCharacter:K2_GetActorLocation(), self.UnloadBox:K2_GetComponentToWorld(), self.UnloadBox:GetUnscaledBoxExtent())
end

return BP_LevelVolume_C
