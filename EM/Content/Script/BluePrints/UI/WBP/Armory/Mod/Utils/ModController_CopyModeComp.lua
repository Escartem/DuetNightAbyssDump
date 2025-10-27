local ModModel = ModController:GetModel()
local Component = {}

function Component:TryAbortImport()
  if ModModel:IsInImport() then
    ModModel:StopImport()
    self:StopImportTimer()
    ForceStopAsyncTask(self, "ImportModTask")
    self:NotifyEvent(ModCommon.EventId.OnImportAbort)
  end
end

function Component:ImportTryTakeoffAllMods(Target, ModSuitIndex)
  local ModSuit = Target:GetModSuit(ModSuitIndex)
  for ModSlotId = 1, ModSuit:Length() do
    ModSuit[ModSlotId].ModEid = ""
  end
  if Target.SetExtralModVolume then
    Target:SetExtralModVolume(0, ModSuitIndex)
  end
end

function Component:ImportResumeMods(Target, ModSuitIndex)
  local ModSuit = Target:GetModSuit(ModSuitIndex)
  local RealModSuit = AvatarUtils:GetTargetModSuit(Target, ModSuitIndex)
  for ModSlotId = 1, RealModSuit:Length() do
    ModSuit[ModSlotId].ModEid = RealModSuit[ModSlotId]
  end
end

function Component:ImportTryEquipMod(Target, Mod, bIgnorePolarity, RecordImportMods)
  local SortedSlotList = ModModel:CalcImportSlotsList(Target, Mod, bIgnorePolarity)
  if not next(SortedSlotList) then
    return false
  end
  local Case = ModCommon.CalcVolumeDiffCase.Change
  local ModSuitIndex = Target.ModSuitIndex
  local ModSuit = Target:GetModSuit(ModSuitIndex)
  for _, Slot in ipairs(SortedSlotList) do
    local CurrentModVolume = ModModel:CalcModSuitTotalCost(Target, ModSuitIndex)
    local Res, Diff = ModModel:CalcModVolumeDiff(Case, Target, Slot.SlotId, Mod.Uuid)
    if Res then
      ModSuit[Slot.SlotId].ModEid = Mod.Uuid
      table.insert(RecordImportMods, {
        SlotId = Slot.SlotId,
        Uuid = Mod.Uuid
      })
      ModModel.ImportData.UsedSlots[Slot.SlotId] = true
      return true
    end
  end
  return false
end

function Component:CopyModToRealAvatar(TargetType, TargetUuid, ModSuitIndex, CallBack)
  local RealAvatar = GWorld:GetAvatar()
  if not RealAvatar then
    DebugPrint("ModController@CopyModToRealAvatar: Avatar\230\151\160\230\149\136")
    return
  end
  local Target = RealAvatar[TargetType .. "s"][TargetUuid]
  local ImportModList = ModModel:CalcImportModList()
  if not next(ImportModList) then
    CallBack(-1)
    return
  end
  local NotOwnedMods, LackCostMods, ModId2Mod = {}, {}, {}
  for _, ImportMod in ipairs(ImportModList) do
    if ImportMod.bNotOwned then
      table.insert(NotOwnedMods, ImportMod.ModId)
    else
      ModId2Mod[ImportMod.ModId] = ImportMod
    end
  end
  for Uuid, Mod in pairs(RealAvatar.Mods) do
    local ImportMod = ModId2Mod[Mod.ModId]
    if not ImportMod then
    elseif Mod.Level <= ImportMod.Level then
      if ImportMod.Uuid then
        local CurrentMod = RealAvatar.Mods[ImportMod.Uuid]
        if Mod.Level > CurrentMod.Level then
          ImportMod.Uuid = Uuid
        end
      else
        ImportMod.Uuid = Uuid
      end
    end
  end
  ModModel:StartImport(Target)
  local OldModSuitIndex = Target.ModSuitIndex
  Target.ModSuitIndex = ModSuitIndex
  self:ImportTryTakeoffAllMods(Target, ModSuitIndex)
  local RealImportMods = {}
  for _, ImportMod in ipairs(ImportModList) do
    if not ImportMod.Uuid then
    else
      local Mod = self:GetAvatar().Mods[ImportMod.Uuid]
      local Res = self:ImportTryEquipMod(Target, Mod, false, RealImportMods)
      if not Res then
        table.insert(LackCostMods, Mod.ModId)
      end
    end
  end
  for index, ModId in pairs(LackCostMods) do
    local ImportMod = ModId2Mod[ModId]
    if not ImportMod or not ImportMod.Uuid then
    else
      local Mod = self:GetAvatar().Mods[ImportMod.Uuid]
      local Res = self:ImportTryEquipMod(Target, Mod, true, RealImportMods)
      if Res then
        LackCostMods[index] = nil
      end
    end
  end
  self:ImportResumeMods(Target, ModSuitIndex)
  Target.ModSuitIndex = OldModSuitIndex
  
  local function RealStartImport()
    if 0 == #RealImportMods then
      CallBack(0)
      ModModel:StopImport()
      self:NotifyEvent(ModCommon.EventId.OnImportFinished)
      return
    end
    self:StopImportTimer()
    self.ImportTimeOutKey = self:AddTimer(5, function()
      ModModel:StopImport()
      self.ImportTimeOutKey = nil
      ForceStopAsyncTask(self, "ImportModTask")
      self:CheckError(ErrorCode.RET_MOD_AUTOPUTON_FAILD)
      self:NotifyEvent(ModCommon.EventId.OnImportTimeOut)
    end)
    ModModel.ImportData.CallBack = CallBack
    ModModel.ImportData.ModSuitIndex = ModSuitIndex
    ModModel.ImportData.ImportModList = RealImportMods
    RunAsyncTask(self, "ImportModTask", self.ImportModTaskFunc)
  end
  
  if #NotOwnedMods > 0 or #LackCostMods > 0 then
    CallBack(1, NotOwnedMods, LackCostMods, RealStartImport)
  else
    RealStartImport()
  end
end

function Component.ImportModTaskFunc(CoroutineObj, self)
  ModModel.ImportData.CoroutineObj = CoroutineObj
  local CallBack = ModModel.ImportData.CallBack
  local ImportModList = ModModel.ImportData.ImportModList
  self:SendChangeSuit(ModModel:GetTarget(), ModModel.ImportData.ModSuitIndex)
  if ModModel.ImportData.bTakeOff then
    coroutine.yield()
  end
  self:TakeOffSuitMod(ModModel:GetTarget())
  if ModModel.ImportData.bTakeOff then
    coroutine.yield()
  end
  for _, ImportMod in ipairs(ImportModList) do
    self:SendChangeMod(ModModel:GetTarget(), ImportMod.SlotId, ImportMod.Uuid)
    coroutine.yield()
  end
  CallBack(0)
  ModModel.ImportData.CallBack = nil
  ModModel:StopImport()
  self:StopImportTimer()
  self:NotifyEvent(ModCommon.EventId.OnImportFinished)
end

function Component:StopImportTimer()
  if self:IsExistTimer(self.ImportTimeOutKey) then
    self:StopTimer(self.ImportTimeOutKey)
    self.ImportTimeOutKey = nil
  end
end

return Component
