local M = {}

function M:New(TalkContext, TalkTaskData)
  local Obj = setmetatable({}, {__index = M})
  Obj.TalkContext = TalkContext
  Obj.TalkTaskData = TalkTaskData
  return Obj
end

function M:Execute()
  local GameMode = UE4.UGameplayStatics.GetGameMode(GWorld.GameInstance)
  if GameMode then
    GameMode:SetGamePaused(Const.Tag_GamePausedByTalk, true)
    self.TalkContext:OnPausedBegin(self.TalkTaskData)
  end
end

function M:Resume()
  local GameMode = UE4.UGameplayStatics.GetGameMode(GWorld.GameInstance)
  if GameMode then
    GameMode:SetGamePaused(Const.Tag_GamePausedByTalk, false)
    self.TalkContext:OnPausedEnd(self.TalkTaskData)
  end
end

return M
