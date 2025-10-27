require("UnLua")
local FStoryLog = require("BluePrints/Story/Log/StoryLog")
local M = Class()

function M:OnInitialize()
end

function M:OnDeinitialize()
end

function M:OnPrintToFeiShu(Title, Message)
  local StoryLog = FStoryLog:New()
  StoryLog:AddTextLine(Message)
  self:AddTracebackLog(StoryLog)
  self:AddPlatformLog(StoryLog)
  self:AddSubregionLog(StoryLog)
  self:AddWorkingTalkTaskLog(StoryLog)
  ScreenPrint(string.format([[
%s
%s]], Title, StoryLog:ToString()))
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    Avatar:SendToFeishuForJQ(StoryLog:ToRichString(), Title)
  end
end

function M:AddTracebackLog(StoryLog, Level, LineLimit)
  Level = Level or 4
  LineLimit = LineLimit or 10
  local Traceback
  local NativeTraceback = debug.traceback(nil, Level)
  local Lines = string.split(NativeTraceback, "\n")
  local LineCount = #Lines
  if LineLimit < LineCount then
    local HeadLineCount = math.ceil(LineLimit / 2)
    local HeadLine = table.concat(Lines, "\n", 1, HeadLineCount)
    HeadLineCount = HeadLineCount + 1
    HeadLine = string.format([[
%s
(...skip calls...)]], HeadLine)
    local TailLineCount = LineLimit - HeadLineCount
    local TailLine = table.concat(Lines, "\n", LineCount - TailLineCount + 1, LineCount)
    Traceback = string.format([[
%s
%s]], HeadLine, TailLine)
  else
    Traceback = NativeTraceback
  end
  StoryLog:AddSeparator()
  StoryLog:AddTitleLine("\232\176\131\231\148\168\230\160\136")
  StoryLog:AddTextLine(Traceback)
end

function M:AddPlatformLog(StoryLog)
  local PlatformName = UE4.UGameplayStatics.GetPlatformName()
  if UE4.URuntimeCommonFunctionLibrary.IsPlayInEditor(GWorld.GameInstance) then
    PlatformName = "\231\188\150\232\190\145\229\153\168"
  end
  StoryLog:AddSeparator()
  StoryLog:AddTitleLine("\229\185\179\229\143\176\228\191\161\230\129\175")
  StoryLog:AddKeyLine("\229\185\179\229\143\176", PlatformName)
end

function M:AddSubregionLog(StoryLog)
  local Avatar = GWorld:GetAvatar()
  if nil == Avatar then
    return
  end
  local SubregionId = Avatar:GetCurrentRegionId()
  local SubregionName = "\230\151\160\230\149\136\231\154\132\229\173\144\229\140\186\229\159\159\229\145\189\229\144\141"
  local SubregionData = DataMgr.SubRegion[SubregionId]
  if SubregionData then
    local TextData = DataMgr.TextMap[SubregionData.SubRegionName]
    if TextData then
      SubregionName = GText(SubregionData.SubRegionName)
    end
  end
  StoryLog:AddSeparator()
  StoryLog:AddTitleLine("\229\140\186\229\159\159\228\191\161\230\129\175")
  StoryLog:AddKeyLine("\229\173\144\229\140\186\229\159\159 ID", SubregionId)
  StoryLog:AddKeyLine("\229\173\144\229\140\186\229\159\159\229\144\141\231\167\176", SubregionName)
end

function M:AddWorkingTalkTaskLog(StoryLog)
  local TS = TalkSubsystem()
  if not TS then
    return
  end
  local Logs = TS:GetAllWorkingTaskDebugLogs()
  if not Logs or 0 == #Logs then
    return
  end
  StoryLog:AddSeparator()
  StoryLog:AddTitleLine("\229\189\147\229\137\141\232\191\144\232\161\140\228\184\173\231\154\132\229\175\185\232\175\157\228\187\187\229\138\161\228\191\161\230\129\175")
  for _, Log in pairs(Logs) do
    StoryLog:AddMapLine(Log)
  end
end

return M
