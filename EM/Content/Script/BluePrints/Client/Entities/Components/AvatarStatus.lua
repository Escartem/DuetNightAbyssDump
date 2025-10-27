local Component = {}

function Component:OnAvatarStatusUpdate(AvatarStatus)
  local OldStatus = self.AvatarStatus or {}
  self.AvatarStatus = AvatarStatus
  print(_G.LogTag, "AvatarStatus Update")
  PrintTable(AvatarStatus, 1, LXYTag .. "\230\150\176\231\154\132AvatarStatus")
  PrintTable(OldStatus, 1, LXYTag .. "\230\151\167\231\154\132AvatarStatus")
  EventManager:FireEvent(EventID.OnAvatarStatusUpdate, OldStatus, AvatarStatus)
  self:PrintAvatarStatus()
end

function Component:PrintAvatarStatus()
  local PrintStr = "CurrentAvatarStatus: "
  for StatusId, Status in pairs(self.AvatarStatus) do
    if Status then
      PrintStr = PrintStr .. DataMgr.AvatarStatus[StatusId].StatusName .. ","
    end
  end
  print(_G.LogTag, PrintStr)
end

function Component:GetCurrentMaxPriority(InputAvatarStatus)
  InputAvatarStatus = InputAvatarStatus or self.AvatarStatus
  local MaxPriority = 0
  for StatusId, Status in pairs(InputAvatarStatus) do
    if Status then
      MaxPriority = math.max(MaxPriority, DataMgr.AvatarStatus[StatusId].Priority)
    end
  end
  return MaxPriority
end

function Component:CheckCanSetStatus(InputAvatarStatus, status)
  InputAvatarStatus = InputAvatarStatus or self.AvatarStatus
  local MaxPriority = self:GetCurrentMaxPriority(InputAvatarStatus)
  for StatusId, Status in pairs(InputAvatarStatus) do
    if Status and DataMgr.AvatarStatus[StatusId].Priority == MaxPriority and not DataMgr.AvatarStatusMachine.TurningMap[StatusId][status] then
      DebugPrint(LXYTag, WarningTag, "\230\151\160\230\179\149\232\189\172\230\141\162\229\136\176\233\162\132\229\174\154\231\138\182\230\128\129\239\188\140\229\155\160\228\184\186 " .. DataMgr.AvatarStatus[StatusId].StatusName .. " \231\154\132turningMap\228\184\173\230\178\161\230\156\137 " .. DataMgr.AvatarStatus[status].StatusName)
      return false
    end
  end
  return true
end

function Component:NotifyServerStatusModify(AvatarStatus)
  print(_G.LogTag, "ClientSetStatus", DataMgr.AvatarStatus[AvatarStatus].StatusName)
  self:CallServerMethod("ClientSetStatus", AvatarStatus)
end

function Component:AvatarStatusEnterSuccess()
  self:CallServerMethod("AvatarStatusEnterSuccess")
end

function Component:InStatus(InputStatus, status)
  InputStatus = InputStatus or self.AvatarStatus
  return InputStatus[status]
end

function Component:IsInDungeon(InPutStatus)
  return self:IsInSingleDungeon(InPutStatus) or self:IsInMultiDungeon(InPutStatus) or self:IsInRougeLike(InPutStatus)
end

function Component:IsInNarrowDungeon(InPutStatus)
  return self:IsInSingleDungeon(InPutStatus) or self:IsInMultiDungeon(InPutStatus)
end

function Component:IsInDungeon2(InPutStatus)
  return self:IsInDungeon(InPutStatus) or self:IsInEnterDungeon(InPutStatus)
end

function Component:IsInSingleDungeon(InPutStatus)
  return self:InStatus(InPutStatus, CommonConst.AvatarStatus.InSingleDungeon)
end

function Component:IsInMultiDungeon(InPutStatus)
  return self:InStatus(InPutStatus, CommonConst.AvatarStatus.InMultiDungeon)
end

function Component:IsInEnterSingleDungeon(InPutStatus)
  return self:InStatus(InPutStatus, CommonConst.AvatarStatus.EnterSingleDungeon)
end

function Component:IsInEnterMultiDungeon(InPutStatus)
  return self:InStatus(InPutStatus, CommonConst.AvatarStatus.EnterMultiDungeon)
end

function Component:InExploreChanllenge(InPutStatus)
  return self:InStatus(InPutStatus, CommonConst.AvatarStatus.InExploreChanllenge)
end

function Component:IsInEnterDungeon(InPutStatus)
  return self:IsInEnterSingleDungeon(InPutStatus) or self:IsInEnterMultiDungeon(InPutStatus) or self:IsInEnterRougeLike(InPutStatus)
end

function Component:IsInEnterBigWorld(InPutStatus)
  return self:InStatus(InPutStatus, CommonConst.AvatarStatus.EnterBigWorld)
end

function Component:IsRealInBigWorld(InPutStatus)
  return self:InStatus(InPutStatus, CommonConst.AvatarStatus.InBigWorld)
end

function Component:IsInBigWorld(InPutStatus)
  return self:IsInEnterBigWorld(InPutStatus) or not self:IsInEnterDungeon(InPutStatus) and self:IsRealInBigWorld(InPutStatus)
end

function Component:IsInHardBoss(InPutStatus)
  return self:InStatus(InPutStatus, CommonConst.AvatarStatus.InHardBoss)
end

function Component:IsInEnterRougeLike(InPutStatus)
  return self:InStatus(InPutStatus, CommonConst.AvatarStatus.EnterRougeLike)
end

function Component:IsInRougeLike(InPutStatus)
  return self:InStatus(InPutStatus, CommonConst.AvatarStatus.InRougeLike)
end

function Component:IsInDynamicEvent(InPutStatus)
  return self:InStatus(InPutStatus, CommonConst.AvatarStatus.DynamicEvent)
end

function Component:IsInTeam(InPutStatus)
  return self:InStatus(InPutStatus, CommonConst.AvatarStatus.InTeam)
end

return Component
