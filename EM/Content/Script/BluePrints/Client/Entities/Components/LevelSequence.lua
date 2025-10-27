local Component = {}

function Component:example(RegionId, RecorderId)
  local Avatar = GWorld:GetAvatar()
  local info = Avatar.LevelSequenceStateRecorder:Query(RegionId, RecorderId)
  PrintTable(CommonUtils.BinaryDump(info), 5)
end

function Component:ReportLevelSequenceState(RegionId, RecorderId, SequenceStateId, PlayState, Cb)
  DebugPrint("ReportLevelSequenceState Start <RegionId,RecorderId,SequenceStateId,PlayState>:", RegionId, RecorderId, SequenceStateId, PlayState)
  self:CallServer("ReportLevelSequenceState", function(ErrCode)
    DebugPrint("ReportLevelSequenceState Callback", ErrorCode:Name(ErrCode))
    if Cb then
      Cb(ErrCode)
    end
  end, RegionId, RecorderId, SequenceStateId, PlayState)
end

return Component
