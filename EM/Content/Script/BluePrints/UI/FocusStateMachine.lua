local FSM = {}
FSM.__index = FSM
FSM._InvalidState = {Name = ""}
local DataStructure = require("BluePrints.Common.DataStructure")
local OnStateChanged, CheckIsStateValid, OnPeakInvalidState, PeakUntilValidRecursion, PopUntilValidRecursion
FSM.Operation = {Push = 0, Pop = 1}

function FSM:New(Owner, Params)
  local Obj = setmetatable({}, self)
  Obj:Init(Owner, Params or {})
  return Obj
end

function FSM:Init(Owner, Params)
  self._Owner = Owner
  self._StateDeque = DataStructure.Deque.New()
  self._MaxSize = Params.MaxSize or 100
  self._StateNames = Params.StateNames or {}
  self._OnStateChanged = Params.OnStateChanged
  self._CheckFunction = Params.CheckFunction
  self._OnPeakInvalidState = Params.OnPeakInvalidState
  self._SupportNilState = false
  self._bReplaceSameState = true
end

function FSM:GetInvalidState()
  return self._InvalidState
end

function FSM:Clear()
  self._StateDeque:Init()
end

function FSM:Push(State)
  local OldState = self._StateDeque:Back() or self:GetInvalidState()
  local OldStateName = OldState.Name
  local NewStateName = State and State.Name
  if not self._SupportNilState and (nil == State or State.Name == nil) then
    DebugPrint("Error: FSM Push State Fail! Reason: State or State Name is nil!")
    return
  end
  if self._bReplaceSameState and NewStateName == OldStateName then
    self._StateDeque:PopBack()
  end
  self._StateDeque:PushBack(State)
  if OldStateName ~= NewStateName then
    OnStateChanged(self, State, OldState, self.Operation.Push)
  end
  if self._StateDeque:Size() > self._MaxSize then
    return self._StateDeque:PopFront()
  end
end

function FSM:NativePeak()
  return self._StateDeque:Back() or self:GetInvalidState()
end

function FSM:NativePop()
  local OladState = self._StateDeque:PopBack() or self:GetInvalidState()
  local OldStateName = OladState.Name
  if not self._SupportNilState and (nil == OladState or nil == OldStateName) then
    DebugPrint("Warning: FSM Pop Nil State!")
  end
  local NewState = self._StateDeque:Back() or self:GetInvalidState()
  local NewStateName = NewState.Name
  if OldStateName ~= NewStateName then
    OnStateChanged(self, NewState, OladState, self.Operation.Pop)
  end
  return OladState
end

function FSM:Peak()
  if self._StateDeque:Size() <= 0 then
    return self:GetInvalidState()
  end
  local State = self._StateDeque:Back()
  local IsValidState = CheckIsStateValid(self, State)
  if not IsValidState then
    PeakUntilValidRecursion(self)
  end
  return self._StateDeque:Back() or self:GetInvalidState()
end

function FSM:Pop()
  if self._StateDeque:Size() <= 0 then
    return self:GetInvalidState()
  end
  local OladState = self._StateDeque:PopBack() or self:GetInvalidState()
  local OldStateName = OladState.Name
  local IsValidState = CheckIsStateValid(self, OladState)
  if not IsValidState then
    PopUntilValidRecursion(self)
  end
  local NewState = self._StateDeque:Back() or self:GetInvalidState()
  local NewStateName = NewState.Name
  if OldStateName ~= NewStateName then
    OnStateChanged(self, NewState, OladState, self.Operation.Pop)
  end
  return OladState or self:GetInvalidState()
end

function OnStateChanged(self, NewState, OldState, Operation)
  if self._OnStateChanged then
    self._OnStateChanged(self._Owner, NewState, OldState, Operation)
  end
end

function CheckIsStateValid(self, State)
  if self._CheckFunction then
    return self._CheckFunction(self._Owner, State)
  end
  return true
end

function OnPeakInvalidState(self, State)
  if self._OnPeakInvalidState then
    self._OnPeakInvalidState(self._Owner, State)
  else
    self._StateDeque:PopBack()
  end
end

function PeakUntilValidRecursion(self)
  local State = self._StateDeque:Back()
  OnPeakInvalidState(self, State)
  if self._StateDeque:Size() <= 0 then
    return self:GetInvalidState()
  end
  local IsValidState = CheckIsStateValid(self, self._StateDeque:Back())
  if not IsValidState then
    PeakUntilValidRecursion(self)
  end
end

function PopUntilValidRecursion(self)
  self._StateDeque:PopBack()
  if self._StateDeque:Size() <= 0 then
    return self:GetInvalidState()
  end
  local IsValidState = CheckIsStateValid(self, self._StateDeque:Back())
  if not IsValidState then
    return PopUntilValidRecursion(self)
  end
end

return FSM
