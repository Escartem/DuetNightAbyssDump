local ForgeConst = require("Blueprints.UI.Forge.ForgeConst")
local FSM = {}
FSM.__index = FSM

function FSM.New(Owner, States)
  local self = setmetatable({}, FSM)
  self.Owner = Owner
  self.CurrentState = nil
  self.CurrentStateName = nil
  self.States = States
  return self
end

local FSMMethods = {}

function FSMMethods:Current()
  return self.CurrentStateName
end

function FSMMethods:Enter(NewState)
  if not self.States[NewState] then
    DebugPrint("Tianyi@  \232\191\155\229\133\165\228\186\134\228\184\141\229\173\152\229\156\168\231\154\132\231\138\182\230\128\129")
    return
  end
  if self.CurrentState and self.CurrentState.OnLeave then
    self.CurrentState.OnLeave(self.Owner, NewState)
  end
  self.CurrentStateName = NewState
  DebugPrint("Tianyi@ ControllerFSM \232\191\155\229\133\165\231\138\182\230\128\129: ", self.CurrentStateName)
  self.CurrentState = self.States[NewState]
  if self.CurrentState.OnEnter then
    self.CurrentState.OnEnter(self.Owner)
  end
end

FSM.__index = FSMMethods
return FSM
