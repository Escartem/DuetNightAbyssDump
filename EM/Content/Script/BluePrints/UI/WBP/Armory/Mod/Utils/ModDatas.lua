local function GetModModel()
  return ModController:GetModel()
end

local ModSlotUIData = Class()

function ModSlotUIData.New()
  local NewObj = {}
  setmetatable(NewObj, ModSlotUIData)
  NewObj.UIPolarity = CommonConst.NonePolarity
  NewObj.EditPolarity = nil
  NewObj.ModEid = nil
  NewObj.UICost = 0
  NewObj.EditCost = nil
  NewObj.bOverCost = false
  NewObj.SlotId = 0
  NewObj.SuitIndex = 0
  NewObj.SlotState = ModCommon.SlotState.Lock
  NewObj.PolarityState = ModCommon.SlotPolarityState.BothNoPolarity
  NewObj.PolarityEditMode = false
  return NewObj
end

function ModSlotUIData:MarkPendingTakeOff(bPendingTakeOff)
  self.bPendingTakeOff = bPendingTakeOff
end

function ModSlotUIData:IsPendingTakeOff()
  return self.bPendingTakeOff
end

function ModSlotUIData:SetPolarityEditMode(bOn)
  self.bOverCost = false
  if bOn then
    self.EditPolarity = self.UIPolarity
    self.EditCost = self.UICost
    self.SlotState = self.SlotState | ModCommon.SlotState.PolarityEdit
  else
    self.EditPolarity = nil
    self.EditCost = nil
    self.SlotState = self.SlotState & ~ModCommon.SlotState.PolarityEdit
    self:SetPolarity(self.UIPolarity)
  end
end

function ModSlotUIData:GetSlotIdStr()
  return string.format("0%s", self.SlotId)
end

function ModSlotUIData:GetPolarityText(InPolarity)
  InPolarity = InPolarity or self:GetPolarity()
  return GetModModel():GetPolarityText(InPolarity)
end

function ModSlotUIData:InState(State)
  return self.SlotState & State == State
end

function ModSlotUIData:Init(SlotId, Target)
  self.SlotId = SlotId
  self.SuitIndex = Target.ModSuitIndex
  local Slot = self:GetSlot()
  self.UIPolarity = Slot.Polarity
  if GetModModel():IsModUuidValid(Slot.ModEid) then
    self.ModEid = Slot.ModEid
  end
  local Mod = self:GetMod()
  if Mod then
    self.UICost = self:_CalcUICost(Mod)
    self.SlotState = ModCommon.SlotState.Used
    self:_CalcPolarityState(Mod)
    self:_CalcCopyState(Mod)
  else
    if Slot:IsLock() then
      self.SlotState = ModCommon.SlotState.Lock
      local Conf = Target:Data()
      if Conf.ModSlot then
        self.UIPolarity = Conf.ModSlot[self.SlotId]
      end
    elseif Slot:IsUnLock() then
      self.SlotState = ModCommon.SlotState.UnLock
    end
    self:_CalcPolarityState()
  end
end

function ModSlotUIData:_CalcCopyState(TargetMod)
  if GetModModel():IsModUICopyMode() then
    local RealAvatar = GWorld:GetAvatar()
    if not RealAvatar then
      return
    end
    local NotOwned = true
    for _, Mod in pairs(RealAvatar.Mods) do
      if Mod.ModId == TargetMod.ModId then
        NotOwned = false
        break
      end
    end
    self.bNotOwned = NotOwned
  end
end

function ModSlotUIData:GetPolarity()
  if self.EditPolarity then
    return self.EditPolarity
  end
  return self.UIPolarity
end

function ModSlotUIData:GetCost()
  if self.EditCost then
    return self.EditCost
  end
  return self.UICost
end

function ModSlotUIData:_CalcPolarityState(Mod)
  local Polarity = self:GetPolarity()
  if Mod then
    if Polarity == CommonConst.NonePolarity then
      if Mod.Polarity == CommonConst.NonePolarity then
        self.PolarityState = ModCommon.SlotPolarityState.BothNoPolarity
      else
        self.PolarityState = ModCommon.SlotPolarityState.SlotNoPolarity
      end
    elseif Mod.Polarity == CommonConst.NonePolarity then
      self.PolarityState = ModCommon.SlotPolarityState.ModNoPolarity
    elseif Mod.Polarity ~= Polarity then
      self.PolarityState = ModCommon.SlotPolarityState.NoMatch
    elseif Mod.Polarity == Polarity then
      self.PolarityState = ModCommon.SlotPolarityState.Match
    end
  elseif Polarity == CommonConst.NonePolarity then
    self.PolarityState = ModCommon.SlotPolarityState.BothNoPolarity
  else
    self.PolarityState = ModCommon.SlotPolarityState.ModNoPolarity
  end
end

function ModSlotUIData:IsPolarityDirty()
  return self.EditPolarity ~= self.UIPolarity
end

function ModSlotUIData:SetPolarity(Polarity)
  if self.EditPolarity then
    self.EditPolarity = Polarity
  else
    self.UIPolarity = Polarity
  end
  local Mod = self:GetMod()
  if Mod then
    self:SetCost(self:_CalcUICost(Mod, Polarity))
    self:_CalcPolarityState(Mod)
  else
    self:SetCost(0)
    self:_CalcPolarityState()
  end
end

function ModSlotUIData:SetCost(Val)
  if self.EditCost then
    self.EditCost = Val
  else
    self.UICost = Val
  end
end

function ModSlotUIData:ApplyEditPolarity()
  if not self.EditPolarity then
    return
  end
  self.UIPolarity = self.EditPolarity
  self.UICost = self.EditCost
  if self.bOverCost then
    self:SetModEid(nil)
  end
  self.bOverCost = false
end

function ModSlotUIData:GetCostDiff()
  if not self.EditCost then
    return 0
  end
  return self.EditCost - self.UICost
end

function ModSlotUIData:SetModEid(ModEid)
  if self:InState(ModCommon.SlotState.Lock) then
    DebugPrint(WarningTag, LXYTag, "\230\167\189\228\189\141\228\184\138\233\148\129\228\184\173\239\188\140\228\184\141\232\131\189\232\174\190\231\189\174Mod")
    return
  end
  if self.ModEid ~= nil then
    GetModModel():RemoveEquipedMod(self.SlotId, self.ModEid)
    self.ModEid = nil
  end
  if GetModModel():IsModUuidValid(ModEid) then
    self.ModEid = ModEid
    GetModModel():SetEquipedMod(self.SlotId, ModEid)
  end
  local Mod = self:GetMod()
  self.bEquiping = false
  if Mod then
    self:SetCost(self:_CalcUICost(Mod))
    self.SlotState = self.SlotState | ModCommon.SlotState.Used
    self.SlotState = self.SlotState & ~ModCommon.SlotState.UnLock
    self:_CalcPolarityState(Mod)
    self.bEquiping = true
  else
    self:SetCost(0)
    self.SlotState = self.SlotState | ModCommon.SlotState.UnLock
    self.SlotState = self.SlotState & ~ModCommon.SlotState.Used
    self:_CalcPolarityState()
  end
end

function ModSlotUIData:_CalcUICost(Mod, ExPolarity)
  local Target = GetModModel():GetTarget()
  return GetModModel():CalcSlotRealCost(self.SlotId, Target, Mod, ExPolarity)
end

function ModSlotUIData:GetMod()
  if self.ModEid then
    return GetModModel():GetMod(self.ModEid)
  end
  return nil
end

function ModSlotUIData:GetSlot()
  local Target = GetModModel():GetTarget()
  local ModSuit = Target:GetModSuit(self.SuitIndex)
  local ModSlot = ModSuit[self.SlotId]
  return ModSlot
end

function ModSlotUIData:IsAura()
  return self.SlotId == ModCommon.MaxSlotCount
end

local SelectedStuff = Class()

function SelectedStuff.New()
  local NewObj = {}
  setmetatable(NewObj, SelectedStuff)
  NewObj.ModUuid = nil
  NewObj.SlotId = nil
  return NewObj
end

function SelectedStuff:IsSlot()
  return self.SlotId ~= nil
end

function SelectedStuff:IsModExist()
  return self.ModUuid ~= nil
end

local PolarityEditModePayload = Class()

local function DirtySlotsFinder(v, SlotUIData)
  return v.SlotId == SlotUIData.SlotId
end

function PolarityEditModePayload.New(SuitCost)
  local NewObj = {}
  setmetatable(NewObj, PolarityEditModePayload)
  NewObj.SelectedStuff = nil
  NewObj.DirtySlots = {}
  NewObj.RecvPolarityEditCounter = 0
  NewObj.SuitCost = SuitCost
  return NewObj
end

function PolarityEditModePayload:SetSelectedStuff(SlotId)
  if not SlotId then
    self.SelectedStuff = nil
    return
  end
  self.SelectedStuff = SelectedStuff.New()
  self.SelectedStuff.SlotId = SlotId
end

function PolarityEditModePayload:EditSlotPolarity(Polarity)
  if not self.SelectedStuff then
    return
  end
  local SlotId = self.SelectedStuff.SlotId
  local SlotUIData = GetModModel():GetSlotUIData(SlotId)
  if not SlotUIData then
    return
  end
  if SlotUIData:GetPolarity() == Polarity then
    return
  end
  try({
    exec = function()
      if SlotUIData.UIPolarity == Polarity then
        self:RevertSlotPolarity(SlotUIData, true)
        return
      end
      local Res = self:RemoveDirtySlot(SlotUIData)
      if Res then
        self.SuitCost = self.SuitCost - Res:GetCostDiff()
      end
      SlotUIData:SetPolarity(Polarity)
      table.insert(self.DirtySlots, SlotUIData)
      self.SuitCost = self.SuitCost + SlotUIData:GetCostDiff()
      table.sort(self.DirtySlots, function(a, b)
        a.bOverCost = false
        b.bOverCost = false
        if a:GetCostDiff() ~= b:GetCostDiff() then
          return a:GetCostDiff() < b:GetCostDiff()
        end
        return a.SlotId > b.SlotId
      end)
    end,
    final = function()
      local MaxCost = GetModModel():GetTargetMaxCost()
      if MaxCost < self.SuitCost then
        local TempSuitCost = self.SuitCost
        for i = #self.DirtySlots, 1, -1 do
          local _SlotUIData = self.DirtySlots[i]
          _SlotUIData.bOverCost = true
          TempSuitCost = TempSuitCost - _SlotUIData:GetCost()
          if MaxCost >= TempSuitCost then
            break
          end
        end
      end
    end
  })
end

function PolarityEditModePayload:RevertAllSlotPolarity()
  for _, SlotUIData in ipairs(self.DirtySlots) do
    self:RevertSlotPolarity(SlotUIData)
  end
  self.DirtySlots = {}
end

function PolarityEditModePayload:RevertSlotPolarity(SlotUIData, bRemoved)
  self.SuitCost = self.SuitCost - SlotUIData:GetCostDiff()
  SlotUIData:SetPolarity(SlotUIData.UIPolarity)
  if bRemoved then
    self:RemoveDirtySlot(SlotUIData)
  end
end

function PolarityEditModePayload:GetDirtyCount()
  return #self.DirtySlots
end

function PolarityEditModePayload:ApplyAllEditPolarity()
  self:ResetRecvEditCounter()
  for _, SlotUIData in ipairs(self.DirtySlots) do
    SlotUIData:ApplyEditPolarity()
  end
  self.DirtySlots = {}
end

function PolarityEditModePayload:IsAnySlotOverCost()
  if not table.isempty(self.DirtySlots) then
    return self.DirtySlots[#self.DirtySlots].bOverCost
  end
  return false
end

function PolarityEditModePayload:AddRecvEditCounter()
  self.RecvPolarityEditCounter = self.RecvPolarityEditCounter + 1
end

function PolarityEditModePayload:ResetRecvEditCounter()
  self.RecvPolarityEditCounter = 0
end

function PolarityEditModePayload:IsRecvEditDone()
  return #self.DirtySlots == self.RecvPolarityEditCounter
end

function PolarityEditModePayload:FindDirtySlot(SlotIdUIData)
  local Res, i = table.findValue(self.DirtySlots, SlotIdUIData, DirtySlotsFinder)
  return Res, i
end

function PolarityEditModePayload:RemoveDirtySlot(SlotUIData)
  local Res, i = self:FindDirtySlot(SlotUIData)
  SlotUIData.bOverCost = false
  if Res then
    table.remove(self.DirtySlots, i)
    return Res
  end
  return nil
end

local AutoEquipPayload = Class()

function AutoEquipPayload.New(CoroutineObj)
  local NewObj = {}
  setmetatable(NewObj, AutoEquipPayload)
  NewObj.bTakeOff = false
  NewObj.CoroutineObj = CoroutineObj
  NewObj.bAllSlotPolarized = true
  NewObj.EquipedMods = {}
  return NewObj
end

function AutoEquipPayload:IsModEquiped(ModUuid)
  return self.EquipedMods[ModUuid]
end

function AutoEquipPayload:SetEquipMod(ModUuid)
  if not self.EquipedMods[ModUuid] then
    self.EquipedMods[ModUuid] = 1
  end
end

function AutoEquipPayload:ResumeAutoEquip()
  coroutine.resume(self.CoroutineObj)
end

local ImportPayload = Class()

function ImportPayload.New()
  local NewObj = {}
  setmetatable(NewObj, ImportPayload)
  NewObj.bTakeOff = false
  NewObj.CoroutineObj = nil
  NewObj.ModSuitIndex = nil
  NewObj.PrevTarget = nil
  NewObj.UsedSlots = {}
  NewObj.CallBack = nil
  NewObj.ImportModList = nil
  return NewObj
end

function ImportPayload:ResumeImport()
  if self.CoroutineObj then
    coroutine.resume(self.CoroutineObj)
  end
end

return {
  ModSlotUIData = ModSlotUIData,
  SelectedStuff = SelectedStuff,
  PolarityEditModePayload = PolarityEditModePayload,
  AutoEquipPayload = AutoEquipPayload,
  ImportPayload = ImportPayload
}
