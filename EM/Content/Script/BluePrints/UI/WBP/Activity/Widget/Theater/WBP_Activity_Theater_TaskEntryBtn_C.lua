require("UnLua")
local M = Class({
  "BluePrints.UI.BP_UIState_C"
})

function M:Construct()
  self.Text_Title01:SetText(GText("TheaterOnline_Game_Name"))
  self.Text_Title02:SetText(GText("TheaterOnline_Game_Interactor"))
  self:AddTimer(1, self.CountDown, true, -1, "TheaterTaskEntryBtnCountDown")
end

function M:Destruct()
  self:RemoveTimer("TheaterTaskEntryBtnCountDown")
end

function M:CountDown()
  local RemainingSeconds, CompletedActivities = self:GetNextActivityInfo()
  local Minutes = math.floor(RemainingSeconds / 60)
  local Seconds = RemainingSeconds % 60
  self.Text_Time:SetText(string.format("%02d:%02d", Minutes, Seconds))
  self.Text_Num:SetText(CompletedActivities .. "/" .. 48)
  DebugPrint("JLYRemainingSeconds: " .. RemainingSeconds .. " CompletedActivities: " .. CompletedActivities)
end

function M:GetNextActivityInfo()
  local CurrentTime = os.time()
  local CurrentDate = os.date("*t", CurrentTime)
  local MinutesSinceMidnight = CurrentDate.hour * 60 + CurrentDate.min
  local CompletedActivities = math.floor(MinutesSinceMidnight / 30)
  local NextActivityMinutes = (CompletedActivities + 1) * 30
  local RemainingMinutes = NextActivityMinutes - MinutesSinceMidnight
  if 0 == RemainingMinutes then
    RemainingMinutes = 30
  end
  local RemainingSeconds = RemainingMinutes * 60 - CurrentDate.sec
  if RemainingSeconds < 0 then
    RemainingSeconds = 0
  end
  return RemainingSeconds, CompletedActivities
end

function M:Init(ActivityConfigData, PageConfigData, PlayerAvatar)
  self.EventId = ActivityConfigData.EventId
  self:UpdatePage()
end

function M:UpdatePage()
end

return M
