local CommonConst = require("CommonConst")
local TimeUtils = {}
TimeUtils.StandardTimestamp = 0
TimeUtils.RemoveStandardOffset = 0
TimeUtils.TimeOffset = 0
TimeUtils.ServerTimeZone = 0
TimeUtils.RefreshHMS = {
  5,
  0,
  0
}
local now = os.time()
TimeUtils.CurrentTimeZone = os.difftime(now, os.time(os.date("!*t", now))) / 3600

function TimeUtils.NowTime()
  if GWorld:GetAvatar() and TimeUtils.StandardTimestamp > 0 then
    return TimeUtils.StandardTimestamp + TimeUtils.GetStandardOffset()
  else
    return os.time() + TimeUtils.TimeOffset
  end
end

function TimeUtils.RealTime()
  return os.time()
end

function TimeUtils.SetStandardTimestamp(Timestamp)
  TimeUtils.StandardTimestamp = Timestamp or 0
end

function TimeUtils.GetStandardOffset()
  return math.floor(math.max(UE4.UGameplayStatics.GetRealTimeSeconds(GWorld.GameInstance) - TimeUtils.RemoveStandardOffset, 0))
end

function TimeUtils.SetStandardOffset()
  TimeUtils.RemoveStandardOffset = UE4.UGameplayStatics.GetRealTimeSeconds(GWorld.GameInstance)
end

function TimeUtils.OnRequestSetNowTime(Timestamp)
  TimeUtils.SetStandardOffset()
  TimeUtils.SetStandardTimestamp(Timestamp)
end

function TimeUtils.RequestSetNowTime()
  local Avatar = GWorld:GetAvatar()
  local CheckTime = -1
  if Avatar then
    if TimeUtils.StandardTimestamp > 0 then
      CheckTime = TimeUtils.NowTime()
    end
    Avatar:RequestSetNowTime(CheckTime)
  end
end

function TimeUtils.GetTimeOffset()
  return TimeUtils.TimeOffset
end

function TimeUtils.SetTimeOffset(offset)
  TimeUtils.TimeOffset = offset
end

function TimeUtils.SetServerTimeZone(TimeZone)
  TimeUtils.ServerTimeZone = TimeZone
end

function TimeUtils.GetServerTimeZone()
  return TimeUtils.ServerTimeZone
end

function TimeUtils.GetCurrentTimeZone()
  return TimeUtils.CurrentTimeZone
end

function TimeUtils.TimestampNextClock(next_clock)
  local now = TimeUtils.NowTime()
  local dateTable = os.date("*t", now)
  dateTable.hour = next_clock
  dateTable.min = 0
  dateTable.sec = 0
  local next_clock_timestamp = os.time(dateTable)
  if now > next_clock_timestamp then
    next_clock_timestamp = next_clock_timestamp + 86400
  end
  return next_clock_timestamp
end

function TimeUtils.TimestampLastClock(last_clock)
  return TimeUtils.TimestampNextClock(last_clock) - 86400
end

function TimeUtils.TimeToStr(Timestamp, UserServerTimezone)
  Timestamp = Timestamp or TimeUtils.NowTime()
  if nil == UserServerTimezone then
    UserServerTimezone = true
  end
  if UserServerTimezone then
    Timestamp = os.time(os.date("!*t", Timestamp)) + TimeUtils.ServerTimeZone * 3600
  end
  return os.date("%y-%m-%d, %H:%M:%S", Timestamp)
end

function TimeUtils.DataToTimestamp(year, month, day, hour, minute, second, use_timezone)
  if false ~= use_timezone then
    use_timezone = true
  end
  local timezone = TimeUtils.GetServerTimeZone()
  local current_timezone = TimeUtils.GetCurrentTimeZone()
  local current_time = os.time({
    year = year,
    month = month,
    day = day,
    hour = hour,
    min = minute,
    sec = second
  })
  local result = current_time
  if use_timezone then
    result = current_time + (current_timezone - timezone) * 3600
  end
  return result
end

function TimeUtils.DataToTimestampForArea(year, month, day, hour, minute, second, area)
  area = area or "China"
  local timezone = CommonConst.SERVER_AREA_TO_TIMEZONE[area]
  local current_timezone = TimeUtils.GetCurrentTimeZone()
  local current_time = os.time({
    year = year,
    month = month,
    day = day,
    hour = hour,
    min = minute,
    sec = second
  })
  return current_time + (current_timezone - timezone) * 3600
end

function TimeUtils.TimestampToData(time, use_timezone)
  local d = TimeUtils.TimestampToDataObj(time, use_timezone)
  return d.year, d.month, d.day, d.hour, d.min, d.sec
end

function TimeUtils.TimestampToDataObj(time, use_timezone)
  if false ~= use_timezone then
    use_timezone = true
  end
  local timezone = TimeUtils.GetServerTimeZone()
  local current_timezone = TimeUtils.GetCurrentTimeZone()
  local d
  if use_timezone then
    d = os.date("*t", time + (timezone - current_timezone) * 3600)
  else
    d = os.date("*t", time)
  end
  return d
end

function TimeUtils.TimeToYMDHMSStr(Timestamp, UserServerTimezone, Joiner1, Joiner2)
  Timestamp = Timestamp or TimeUtils.NowTime()
  Joiner1 = Joiner1 or "-"
  Joiner2 = Joiner2 or ":"
  if nil == UserServerTimezone then
    UserServerTimezone = true
  end
  if UserServerTimezone then
    Timestamp = os.time(os.date("!*t", Timestamp)) + TimeUtils.ServerTimeZone * 3600
  end
  return os.date("%Y" .. Joiner1 .. "%m" .. Joiner1 .. "%d" .. " " .. "%H" .. Joiner2 .. "%M" .. Joiner2 .. "%S", Timestamp)
end

function TimeUtils.TimeToYMDHMStr(Timestamp, UserServerTimezone, Joiner1, Joiner2)
  Timestamp = Timestamp or TimeUtils.NowTime()
  Joiner1 = Joiner1 or "-"
  Joiner2 = Joiner2 or ":"
  if nil == UserServerTimezone then
    UserServerTimezone = true
  end
  if UserServerTimezone then
    Timestamp = os.time(os.date("!*t", Timestamp)) + TimeUtils.ServerTimeZone * 3600
  end
  return os.date("%Y" .. Joiner1 .. "%m" .. Joiner1 .. "%d" .. " " .. "%H" .. Joiner2 .. "%M", Timestamp)
end

function TimeUtils.TimeToYMDStr(Timestamp, UserServerTimezone, Joiner)
  Timestamp = Timestamp or TimeUtils.NowTime()
  Joiner = Joiner or "-"
  if nil == UserServerTimezone then
    UserServerTimezone = true
  end
  if UserServerTimezone then
    Timestamp = os.time(os.date("!*t", Timestamp)) + TimeUtils.ServerTimeZone * 3600
  end
  return os.date("%Y" .. Joiner .. "%m" .. Joiner .. "%d", Timestamp)
end

function TimeUtils.TimeToHMSStr(Timestamp, UserServerTimezone, Joiner)
  Timestamp = Timestamp or TimeUtils.NowTime()
  Joiner = Joiner or ":"
  if nil == UserServerTimezone then
    UserServerTimezone = true
  end
  if UserServerTimezone then
    Timestamp = os.time(os.date("!*t", Timestamp)) + TimeUtils.ServerTimeZone * 3600
  end
  return os.date("%H" .. Joiner .. "%M" .. Joiner .. "%S", Timestamp)
end

function TimeUtils.NextDailyRefreshTime(now, refresh_hms, interval)
  now = now or TimeUtils.NowTime()
  refresh_hms = refresh_hms or TimeUtils.RefreshHMS
  interval = interval or 1
  local year, month, day, hour, min, sec = TimeUtils.TimestampToData(now)
  local t = TimeUtils.DataToTimestamp(year, month, day, table.unpack(refresh_hms))
  if TimeUtils.GetSec(hour, min, sec) < TimeUtils.GetSec(table.unpack(refresh_hms)) then
    return t
  else
    return t + 86400 * interval
  end
end

function TimeUtils.NextWeeklyRefreshTime(now, refresh_hms)
  now = now or TimeUtils.NowTime()
  refresh_hms = refresh_hms or TimeUtils.RefreshHMS
  local data = TimeUtils.TimestampToDataObj(now)
  local hms = {
    data.hour,
    data.min,
    data.sec
  }
  local weekday = 2
  if data.wday == weekday and TimeUtils.GetSec(table.unpack(hms)) < TimeUtils.GetSec(table.unpack(refresh_hms)) then
    return TimeUtils.DataToTimestamp(data.year, data.month, data.day, table.unpack(refresh_hms))
  else
    data.day = data.day + (7 - (data.wday - weekday + 7) % 7)
    local d1 = os.date("*t", os.time(data))
    return TimeUtils.DataToTimestamp(d1.year, d1.month, d1.day, table.unpack(refresh_hms))
  end
end

function TimeUtils.GetSec(hour, min, sec)
  return hour * 3600 + min * 60 + sec
end

function TimeUtils.GetDaySec(Day)
  Day = Day or 1
  return 86400 * Day
end

function TimeUtils.ExcelTimestampToLuaData(time)
  local d = os.date("*t", (time - 25569) * 3600 * 24)
  return d.year, d.month, d.day, d.hour, d.min, d.sec
end

function TimeUtils.GetWeekMonday(timestamp)
  local date = os.date("*t", timestamp)
  local wday = date.wday
  local daysToSubtract = (wday - 2 + 7) % 7
  local monday = os.time({
    year = date.year,
    month = date.month,
    day = date.day - daysToSubtract
  })
  return monday
end

function TimeUtils.IsTimestampInCurrentWeek(timestamp)
  local currentTimestamp = os.time()
  local preMonday = TimeUtils.GetWeekMonday(timestamp)
  local currentMonday = TimeUtils.GetWeekMonday(currentTimestamp)
  return preMonday >= currentMonday
end

function TimeUtils.GetIntervalDay(t1, t2, day_gap_hms)
  day_gap_hms = day_gap_hms or TimeUtils.RefreshHMS
  local gap = TimeUtils.GetSec(table.unpack(day_gap_hms))
  t1 = t1 - gap
  t2 = t2 - gap
  local d1 = TimeUtils.TimestampToDataObj(t1)
  local d2 = TimeUtils.TimestampToDataObj(t2)
  local sd1 = TimeUtils.DataToTimestamp(d1.year, d1.month, d1.day, 12, 0, 0)
  local sd2 = TimeUtils.DataToTimestamp(d2.year, d2.month, d2.day, 12, 0, 0)
  return math.floor((sd2 - sd1) / 86400)
end

return TimeUtils
