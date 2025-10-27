require("UnLua")
local MiscUtils = require("Utils.MiscUtils")
local BP_AttributesSet_C = Class("BluePrints.Combat.BaseAttributesSet")
BP_AttributesSet_C._components = {
  "BluePrints.Common.DelayFrameComponent"
}
BP_AttributesSet_C.CppAttrs = {}

function BP_AttributesSet_C:IsAttrbutesSetOnRep(Owner)
  return Owner:IsMonster() or Owner:IsCombatItemBase() or Owner:IsMechanismSummon()
end

function BP_AttributesSet_C:OnRep_Exp()
  self:AddDelayFrameFunc(function()
    local Owner = self.OwnerActor
    if not IsValid(Owner) then
      return
    end
    if not IsStandAlone(Owner) and IsAuthority(Owner) then
      return
    end
    if IsStandAlone(Owner) or MiscUtils.IsAutonomousProxy(Owner) then
      EventManager:FireEvent(EventID.OnUpdateCharExp)
    end
  end, 2)
end

function BP_AttributesSet_C:LevelUp(NewLevel)
  if NewLevel <= 0 then
    return
  end
  local Owner = self.OwnerActor
  if Owner:IsMainPlayer() then
    local UIManager = GWorld.GameInstance:GetGameUIManager()
    UIManager:ShowLevelUpToast(NewLevel, "Char", Owner.CurrentRoleId)
    EventManager:FireEvent(EventID.OnCharLevelUpInBattle)
  elseif self:IsAttrbutesSetOnRep(Owner) and (IsClient(Owner) or IsStandAlone(Owner)) and IsValid(Owner.BillboardComponent) then
    Owner.BillboardComponent:RefreshLevelInfo(NewLevel)
  end
end

function BP_AttributesSet_C:AddSpAnim(TargetEid)
  EventManager:FireEvent(EventID.TriggerAddSpAnim, TargetEid)
end

function BP_AttributesSet_C:OnAttrChanged_Lua(AttrName, OldValue, NewValue)
  local FunctionName = "OnAttrChanged_Lua_" .. AttrName
  if type(self[FunctionName]) == "function" then
    self[FunctionName](self, OldValue, NewValue)
  end
  local LowerAttrName = string.lower(AttrName)
  if self.AttrListener and self.AttrListener[LowerAttrName] then
    self.AttrListener[LowerAttrName](self, OldValue, NewValue)
  end
end

function BP_AttributesSet_C:InitLuaOnAttrChangedArray()
  for Name, Value in pairs(getmetatable(self)) do
    local AttrName = string.match(Name, "OnAttrChanged_Lua_(.+)")
    if AttrName then
      self.LuaOnAttrChangedArray:Add(AttrName)
    end
  end
end

function BP_AttributesSet_C:AddAttrChangeListener(AttrName, Function)
  self.LuaOnAttrChangedArray:Add(AttrName)
  local LowerAttrName = string.lower(AttrName)
  self.AttrListener = self.AttrListener or {}
  self.AttrListener[LowerAttrName] = Function
end

function BP_AttributesSet_C:RemoveAttrChangeListener(AttrName)
  self.AttrListener = self.AttrListener or {}
  if self.AttrListener[AttrName] then
    self.AttrListener[AttrName] = nil
  end
end

function BP_AttributesSet_C:SetAttr(AttrName, Value)
  local OldValue
  if type(Value) == "number" then
    OldValue = self:GetAttr(AttrName)
  end
  self.Super.SetAttr(self, AttrName, Value)
  if type(Value) == "number" then
    self:CallOnChangedFunctionIfExists(AttrName, OldValue, Value)
  else
    self:CallOnChangedFunctionIfExists(AttrName)
  end
end

AssembleComponents(BP_AttributesSet_C)
return BP_AttributesSet_C
