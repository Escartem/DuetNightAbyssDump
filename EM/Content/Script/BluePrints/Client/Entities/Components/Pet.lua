local PetModel = require("BluePrints.Common.MVC.Model.PetModel")
local Component = {}

function Component:EnterWorld()
  PetModel:Init(self.Pets)
end

function Component:LeaveWorld()
  PetModel:Destory()
end

function Component:_OnPropChangePets(Keys)
  local PetUniqueID = Keys and Keys[1]
  if PetUniqueID then
    local bHasPet, IsResourcePet = PetModel:IsPetExist(PetUniqueID)
    if bHasPet then
      if not self.Pets[PetUniqueID] then
        EventManager:FireEvent(EventID.OnPetDeleted, PetUniqueID, IsResourcePet)
      end
    elseif self.Pets[PetUniqueID] then
      EventManager:FireEvent(EventID.OnNewPetObtained, PetUniqueID, IsResourcePet)
    end
  end
  EventManager:FireEvent(EventID.OnPropChangePets, Keys)
end

function Component:EquipCurPet()
  for UniqueId, v in pairs(self.Pets) do
    self:EquipPet(UniqueId)
    break
  end
end

function Component:GetPetByUniqueId(UniqueId)
  for Id, Pet in pairs(self.Pets) do
    if Id == UniqueId then
      return Pet
    end
  end
end

function Component:CheckPetEnough(Pets)
  local PetCount = {}
  for _, Pet in pairs(self.Pets) do
    PetCount[Pet.PetId] = (PetCount[Pet.PetId] or 0) + 1
  end
  for Id, Count in pairs(Pets) do
    if not PetCount[Id] or Count > PetCount[Id] then
      return false
    end
  end
  return true
end

function Component:GetCurEquipPet()
  if not self.CurrentPet or 0 == self.CurrentPet then
    return
  end
  local PetInfo = self.Pets[self.CurrentPet]
  return PetInfo
end

function Component:_OnPropChangeCurrentPet()
  local CurPlayer = UE4.UGameplayStatics.GetPlayerCharacter(GWorld.GameInstance, 0)
  if not CurPlayer then
    return
  end
  local CurPet = CurPlayer:GetBattlePet()
  if CurPet and self.Pets[self.CurrentPet] then
    local PetInfo = self.Pets[self.CurrentPet]
    if PetInfo.PetId == CurPet.PetId then
      return
    end
  end
  if not self.CurrentPet or 0 == self.CurrentPet then
    CurPlayer:ServerRemoveBattlePet()
  else
    CurPlayer:ServerRemoveBattlePet()
    local PetInfo = self.Pets[self.CurrentPet]
    local AffixList = TArray(0)
    for i, EntryId in ipairs(PetInfo.Entry) do
      local Data = DataMgr.PetEntry[EntryId]
      if Data then
        AffixList:Add(EntryId)
      end
    end
    CurPlayer:ServerSetBattlePetAndAffixList(PetInfo.PetId, PetInfo:GetSkillLevel(), AffixList, false)
  end
end

function Component:EquipPet(UniqueID)
  self.logger.info("ClientReqEquipPet", UniqueID)
  
  local function Cb(ErrCode)
    self.logger.info("ClientReqEquipPet", ErrorCode:Name(ErrCode))
    EventManager:FireEvent(EventID.OnSwitchPet)
  end
  
  self:CallServer("ClientReqEquipPet", Cb, UniqueID)
end

function Component:GMPetAutoAddExp(AddExpPetUniqueID, CostPetId)
  self.logger.info("GMPetAutoAddExp")
  local CostPetUniqueIDs = {}
  for uniqueId, pet in pairs(self.Pets) do
    if uniqueId ~= AddExpPetUniqueID and pet.PetId == CostPetId and 1 == pet.Level then
      CostPetUniqueIDs[#CostPetUniqueIDs + 1] = uniqueId
    end
  end
  self:PetAddExpMulti(AddExpPetUniqueID, CostPetUniqueIDs)
end

function Component:PetAddExpMulti(Callback, UniqueID, CostPetUniqueIDs, CostResourceTable)
  self.logger.info("PetAddExpMulti", UniqueID, CostPetUniqueIDs)
  local OldLevel = self.Pets[UniqueID].Level
  
  local function Cb(ErrCode, RefundResources)
    self.logger.info("PetAddExpMulti", ErrorCode:Name(ErrCode), CommonUtils.TableToString(RefundResources))
    local bLevelUp = self.Pets[UniqueID].Level > OldLevel
    EventManager:FireEvent(EventID.PetAddExpMulti, ErrCode, UniqueID, CostPetUniqueIDs, bLevelUp, EventID.PetAddExpMulti)
    if Callback then
      Callback(RefundResources)
    end
  end
  
  CostResourceTable = CostResourceTable or {}
  self:CallServer("PetAddExpMulti", Cb, UniqueID, CostPetUniqueIDs, CostResourceTable)
end

function Component:UpdatePlayerEquipPetLevel(PetLevel, UniqueID)
  local CurPlayer = UE4.UGameplayStatics.GetPlayerCharacter(GWorld.GameInstance, 0)
  if not CurPlayer then
    return
  end
  local CurPet = CurPlayer:GetBattlePet()
  if not CurPet then
    return
  end
  if self.CurrentPet ~= UniqueID then
    return
  end
  CurPet:UpdatePetLevel(PetLevel)
end

function Component:PetBreak(UniqueID, CostPetUniqueID)
  self.logger.info("PetBreak", UniqueID, CostPetUniqueID)
  local OldBreakNum = self.Pets[UniqueID].BreakNum
  
  local function Cb(ErrCode)
    self.logger.info("PetBreak", ErrorCode:Name(ErrCode))
    local bBreakUp = self.Pets[UniqueID].BreakNum > OldBreakNum
    if bBreakUp then
      self:UpdatePlayerEquipPetLevel(self.Pets[UniqueID].BreakNum + 1, UniqueID)
    end
    EventManager:FireEvent(EventID.OnPetBreakLevelUp, ErrCode, UniqueID, CostPetUniqueID, true, EventID.OnPetBreakLevelUp)
  end
  
  self:CallServer("PetBreak", Cb, UniqueID, CostPetUniqueID)
end

function Component:TryCapturePetDungeon(ResourceId, xValue, PetId, CaptureCallBack)
  self.logger.info("TryCapturePetDungeon", ResourceId, PetId, xValue)
  
  local function Cb(ErrCode, UniqueId)
    self.logger.info("TryCapturePetDungeon", ErrorCode:Name(ErrCode))
    if CaptureCallBack then
      CaptureCallBack(ErrCode, UniqueId)
    end
  end
  
  self:CallServer("TryCapturePetDungeon", Cb, ResourceId, xValue, PetId)
end

function Component:LockPet(UniqueID)
  self.logger.info("LockPet", UniqueID)
  
  local function Cb(ErrCode)
    self.logger.info("LockPet", ErrorCode:Name(ErrCode))
    EventManager:FireEvent(EventID.OnPetLocked, ErrCode, UniqueID, true)
  end
  
  self:CallServer("LockPet", Cb, UniqueID)
end

function Component:UnLockPet(UniqueID)
  self.logger.info("UnLockPet", UniqueID)
  
  local function Cb(ErrCode)
    self.logger.info("UnLockPet", ErrorCode:Name(ErrCode))
    EventManager:FireEvent(EventID.OnPetLocked, ErrCode, UniqueID, false)
  end
  
  self:CallServer("UnLockPet", Cb, UniqueID)
end

function Component:PetSetName(UniqueID, Name)
  self.logger.info("PetSetName", UniqueID, Name)
  
  local function Cb(ErrCode)
    self.logger.info("PetSetName", ErrorCode:Name(ErrCode))
    EventManager:FireEvent(EventID.OnPetNameChanged, ErrCode, UniqueID, Name)
  end
  
  self:CallServer("PetSetName", Cb, UniqueID, Name)
end

function Component:PetEntryReplace(InCallBack, EntryReplacePetUniqueId, EntryReplacePetEntryIndex, ConsumePetUniqueId, ConsumePetEntryIndex)
  self.logger.info("PetEntryReplace", EntryReplacePetUniqueId, EntryReplacePetEntryIndex, ConsumePetUniqueId, ConsumePetEntryIndex)
  
  local function Cb(ErrCode)
    self.logger.info("PetEntryReplace", ErrorCode:Name(ErrCode))
    if InCallBack then
      InCallBack(ErrCode)
    end
    EventManager:FireEvent(EventID.OnPetEntryReplace, ErrCode, EntryReplacePetUniqueId, EntryReplacePetEntryIndex, ConsumePetUniqueId, ConsumePetEntryIndex)
  end
  
  self:CallServer("PetEntryReplace", Cb, EntryReplacePetUniqueId, EntryReplacePetEntryIndex, ConsumePetUniqueId, ConsumePetEntryIndex)
end

function Component:TestPetEntryUp(EntryUpPetUniqueId, EntryIndex)
  local ConsumePetUniqueIds = {}
  local EntryId = self.Pets[EntryUpPetUniqueId].Entry[EntryIndex]
  local Count = DataMgr.PetEntry[EntryId].PetEntryUPCount
  for uniqueId, pet in pairs(self.Pets) do
    for _, v in pairs(pet.Entry) do
      if v == EntryId and Count > #ConsumePetUniqueIds then
        ConsumePetUniqueIds[#ConsumePetUniqueIds + 1] = uniqueId
      end
    end
  end
  self:PetEntryUp(EntryUpPetUniqueId, EntryIndex, ConsumePetUniqueIds)
end

function Component:PetEntryUp(EntryUpPetUniqueId, EntryIndex, ConsumePetUniqueIds, Callback)
  self.logger.info("PetEntryUp", EntryUpPetUniqueId, EntryIndex, CommonUtils.TableToString(ConsumePetUniqueIds))
  
  local function Cb(ErrCode)
    self.logger.info("PetEntryUp", ErrorCode:Name(ErrCode))
    EventManager:FireEvent(EventID.OnPetEntryUp, ErrCode, EntryUpPetUniqueId, EntryIndex, ConsumePetUniqueIds)
    if Callback then
      Callback(ErrCode)
    end
  end
  
  self:CallServer("PetEntryUp", Cb, EntryUpPetUniqueId, EntryIndex, ConsumePetUniqueIds)
end

function Component:PetEntryLock(EntryId, IsLock, LockBagPet, InCallBack)
  self.logger.info("PetEntryLock", EntryId, IsLock)
  
  local function Cb(ErrCode)
    self.logger.info("PetEntryLock", ErrorCode:Name(ErrCode))
    if InCallBack then
      InCallBack(ErrCode)
    end
  end
  
  if LockBagPet then
    self:CallServerMethod("LockPetByEntry", EntryId)
  end
  self:CallServer("SetPetEntryLock", Cb, EntryId, IsLock)
end

function Component:DynamicQuestCreatePetNotify(PetUnitId, PetStaticPointId, UniqueId)
  DebugPrint("LHQ@@@DynamicQuestCreatePetNotify:", PetUnitId, PetStaticPointId, UniqueId)
  local GameState = UE4.UGameplayStatics.GetGameState(GWorld.GameInstance)
  if GameState then
    GameState.PetDynamicEventUniqueIds:Add(PetUnitId, UniqueId)
  end
  local GameMode = UE4.UGameplayStatics.GetGameMode(GWorld.GameInstance)
  if GameMode then
    local CpatureArray = TArray(0)
    CpatureArray:Add(PetStaticPointId)
    GameMode:TriggerActiveStaticCreator(CpatureArray, "DynamicEventPet")
  end
end

function Component:TryCapturePetDynamicQuest(ResourceId, xValue, UniqueId, Cb)
  self:CallServer("TryCapturePetDynamicQuest", Cb, ResourceId, xValue, UniqueId)
end

return Component
