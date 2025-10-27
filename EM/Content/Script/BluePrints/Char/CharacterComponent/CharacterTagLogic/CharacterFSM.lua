local BaseTagRule = require("BluePrints.Char.CharacterComponent.CharacterTagLogic.BaseCharacterTagRule")
local FSM = {}
FSM.__index = FSM

function FSM:CreateFSM(Owner, TagRule)
  local CharFSM = {}
  setmetatable(CharFSM, FSM)
  CharFSM.Owner = Owner
  CharFSM.TagRule = TagRule
  CharFSM.CurrentTag = nil
  CharFSM.CustomCheckers = {}
  CharFSM:SetDefaultTag()
  CharFSM.Enable = false
  return CharFSM
end

function FSM:SetTag(NewTag)
  if not self.TagRule or self.IsLeavingTag == true then
    return false
  end
  local CanSetTag = self.TagRule:CheckCanEnterTag(self.Owner, self.CurrentTag, NewTag, self.CustomCheckers)
  if not CanSetTag then
    return false
  end
  local CurTagInfo = self.TagRule:GetTagInfo(self.CurrentTag)
  if self.Enable and CurTagInfo and CurTagInfo.LeaveTag ~= nil then
    self.IsLeavingTag = true
    CurTagInfo.OnLeaveTag(self.Owner)
    self.IsLeavingTag = false
  end
  self.CurrentTag = NewTag
  self.Owner.AutoSyncProp.FSMCharacterTag = NewTag
  local NewTagInfo = self.TagRule:GetTagInfo(NewTag)
  if self.Enable and NewTagInfo and nil ~= NewTagInfo.EnterTag then
    NewTagInfo.OnEnterTag(self.Owner)
  end
  return true
end

function FSM:AddCustomChecker(CheckerName, Checker)
  if not CheckerName or not Checker then
    return
  end
  if self.CustomCheckers[CheckerName] then
    DebugPrint("Tianyi@ \232\175\165CustomChecker\229\183\178\230\179\168\229\134\140")
    return
  end
  Checker.Name = CheckerName
  self.CustomCheckers[CheckerName] = Checker
end

function FSM:SetDefaultTag()
  if not self.TagRule then
    return
  end
  local DefaultTag = self.TagRule:GetDefaultTag(self.Owner)
  if DefaultTag then
    self:SetTag(DefaultTag)
  end
end

return FSM
