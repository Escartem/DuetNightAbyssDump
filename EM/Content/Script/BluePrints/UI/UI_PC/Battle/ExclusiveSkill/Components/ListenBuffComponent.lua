local FListenBuffInfo = {}

function FListenBuffInfo.New(BuffId, ListenObject, ListenFunctionName)
  local Obj = setmetatable({}, {__index = FListenBuffInfo})
  Obj.HasBuff = false
  Obj.Buff = nil
  Obj.BuffId = BuffId
  Obj.ListenObject = ListenObject
  Obj.StartHasCallback = ListenObject["StartHas_" .. ListenFunctionName]
  Obj.TickHasCallback = ListenObject["TickHas_" .. ListenFunctionName]
  Obj.EndHasCallback = ListenObject["EndHas_" .. ListenFunctionName]
  return Obj
end

function FListenBuffInfo:SetBuff(Buff)
  self.HasBuff = true
  self.Buff = Buff
end

function FListenBuffInfo:ClearBuff()
  self.HasBuff = false
  self.Buff = nil
end

function FListenBuffInfo:CallStart()
  self.StartHasCallback(self.ListenObject, self)
end

function FListenBuffInfo:CallTick(InDeltaTime)
  self.TickHasCallback(self.ListenObject, self, InDeltaTime)
end

function FListenBuffInfo:CallEnd()
  self.EndHasCallback(self.ListenObject, self)
end

local FListenBuffComponent = Class()

function FListenBuffComponent.New()
  local ListenBuffComponent = setmetatable({}, {__index = FListenBuffComponent})
  ListenBuffComponent.ListenBuffs = {}
  return ListenBuffComponent
end

function FListenBuffComponent:Tick(InDeltaTime)
  for _, ListenBuffInfo in pairs(self.ListenBuffs) do
    local IsValidBuff = IsValid(ListenBuffInfo.Buff)
    if IsValidBuff then
      ListenBuffInfo:CallTick(InDeltaTime)
    end
  end
end

function FListenBuffComponent:AddListenBuff(BuffId, ListenObject, ListenFunctionName)
  table.insert(self.ListenBuffs, FListenBuffInfo.New(BuffId, ListenObject, ListenFunctionName))
end

function FListenBuffComponent:OnBuffsChanged(Buffs)
  for _, ListenBuffInfo in pairs(self.ListenBuffs) do
    local IsValidBuff = IsValid(ListenBuffInfo.Buff)
    if IsValidBuff then
      local BuffOwner = ListenBuffInfo.Buff.Owner
      if IsValid(BuffOwner) and UE4.UBattleFunctionLibrary.GetBuffNumById(BuffOwner, ListenBuffInfo.BuffId) <= 0 then
        IsValidBuff = false
      end
    end
    if false == IsValidBuff then
      if ListenBuffInfo.HasBuff then
        ListenBuffInfo:ClearBuff()
        ListenBuffInfo:CallEnd()
      end
      local ListenBuff = self:FindBuffById(Buffs, ListenBuffInfo.BuffId, 0, false)
      if IsValid(ListenBuff) then
        ListenBuffInfo:SetBuff(ListenBuff)
        ListenBuffInfo:CallStart()
      end
    end
  end
end

function FListenBuffComponent:FindBuffById(Buffs, BuffId)
  for i = 1, Buffs:Num() do
    local Buff = Buffs:GetRef(i)
    if Buff.BuffId == BuffId then
      return Buff
    end
  end
  return nil
end

return {FListenBuffInfo = FListenBuffInfo, FListenBuffComponent = FListenBuffComponent}
