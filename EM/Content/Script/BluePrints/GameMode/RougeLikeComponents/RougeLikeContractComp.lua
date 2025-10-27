local UIUtils = require("Utils.UIUtils")
local Component = {}

function Component:UpdateContractEffect()
  DebugPrint("Tianyi@ UpdateContractEffect!")
  for k, v in pairs(self.Contract) do
    local ContractId = k
    local ContractLevel = v
    local ContractData = DataMgr.RougelikeContract[ContractId]
    if ContractData and ContractData.GlobalPassiveId then
      DebugPrint("Tianyi@ Add GlobalPassive, Id = " .. ContractData.GlobalPassiveId .. " Level = " .. ContractLevel)
      Battle(self):AddGlobalPassive(ContractData.GlobalPassiveId, nil, ContractLevel - 1)
    end
  end
end

function Component:TriggerAllContractDungeonEffect()
  DebugPrint("HTY UpdateContractDungeonEffect")
  for k, v in pairs(self.Contract) do
    self:TriggerContractDungeonEffect(k, v)
  end
end

function Component:TriggerContractDungeonEffect(ContractId, ContractLevel)
  DebugPrint("HTY TriggerContractDungeonEffect ContractId: ", ContractId, "ContractLevel: ", ContractLevel)
  local RoomType = DataMgr.RougeLikeRoom[self.RoomId].RoomType
  local ContractData = DataMgr.RougelikeContract[ContractId]
  local EffectRoomTypes = ContractData.RoomType
  if nil == EffectRoomTypes then
    DebugPrint("HTY \229\189\147\229\137\141ContractId \230\178\161\230\156\137\232\166\129\231\148\159\230\149\136\231\154\132\229\133\179\229\141\161\229\165\145\231\186\166\230\149\136\230\158\156")
    return
  end
  for i = 1, #EffectRoomTypes do
    if RoomType == EffectRoomTypes[i] then
      local GameMode = UE4.UGameplayStatics.GetGameMode(self)
      if nil == GameMode then
        DebugPrint("TriggerContractDungeonEffect GameMode == nil ContractId: ", ContractId)
        return
      end
      local UnitType = ContractData.UnitType
      local UnitIdArray = ContractData.UnitId
      local UnitNum = ContractData.UnitNum[ContractLevel]
      local GameState = UE.UGameplayStatics.GetGameState(self)
      local CheckStatic = {}
      local Player = UE4.UGameplayStatics.GetPlayerCharacter(GWorld.GameInstance, 0)
      local LevelId = GameMode:GetActorLevelName(Player)
      local Creators = TMap(0, UObject)
      GameState:GetSubStaticCreatorInfo(LevelId, Creators)
      for Id, StaticCreator in pairs(Creators) do
        if StaticCreator.NoteName == "ContractStaticCreator" and StaticCreator.UnitType == UnitType then
          table.insert(CheckStatic, Id)
        end
      end
      if 0 == #CheckStatic then
        DebugPrint("Error: HTY \230\178\161\230\156\137\231\148\159\230\136\144\229\165\145\231\186\166Unit\231\154\132\233\157\153\230\128\129\231\130\185 ContractId: ", ContractId, "ContractLevel: ", ContractLevel, "UnitType: ", UnitType)
        return
      end
      for Count = 1, UnitNum do
        local RandomIndex = math.random(1, #UnitIdArray)
        local RandomUnitId = UnitIdArray[RandomIndex]
        local CreatorId = CheckStatic[math.random(1, #CheckStatic)]
        local StaticCreator = Creators:FindRef(CreatorId)
        StaticCreator.UnitId = RandomUnitId
        DebugPrint("HTY Create Contract Unit, UnitType: ", UnitType, "RandomUnitId: ", RandomUnitId, "CreatorId: ", CreatorId, "StaticCreator: ", StaticCreator.DisplayName)
        local SubGameMode = GameMode.SubGameModeInfo:Find(LevelId)
        if nil ~= SubGameMode then
          SubGameMode:TriggerActiveStaticCreator({CreatorId}, "ContractSpawn", true)
        end
      end
      return
    end
  end
end

return Component
