require("UnLua")
local TimeUtils = require("Utils.TimeUtils")
local M = Class("BluePrints.UI.BP_EMUserWidget_C")

function M:SetTimeText(Timestamp, StyleType, Joiner1, Joiner2, bUserServerTimezone, bShowTimeIcon, bHideTimeZone)
  if StyleType == UIConst.EnumTimeStyleType.YMDAndHMS then
    local TimeYMDStr = TimeUtils.TimeToYMDStr(Timestamp, bUserServerTimezone, Joiner1)
    self.Text_Time:SetText(TimeYMDStr)
    self.Text_Time:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    local TimeHMSStr = TimeUtils.TimeToHMSStr(Timestamp, bUserServerTimezone, Joiner2)
    self.Text_ActualTime:SetText(TimeHMSStr)
    self.Text_ActualTime:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  elseif StyleType == UIConst.EnumTimeStyleType.YMD then
    local TimeYMDStr = TimeUtils.TimeToYMDStr(Timestamp, bUserServerTimezone, Joiner1)
    self.Text_Time:SetText(TimeYMDStr)
    self.Text_Time:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    self.Text_ActualTime:SetVisibility(UIConst.VisibilityOp.Collapsed)
  elseif StyleType == UIConst.EnumTimeStyleType.HMS then
    local TimeHMSStr = TimeUtils.TimeToHMSStr(Timestamp, bUserServerTimezone, Joiner2)
    self.Text_ActualTime:SetText(TimeHMSStr)
    self.Text_ActualTime:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    self.Text_Time:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  if bShowTimeIcon then
    self.Image_ClockIcon:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  end
  if bHideTimeZone then
    self.Text_TimeZone:SetVisibility(UIConst.VisibilityOp.Collapsed)
  else
    local IsChina = UE.AHotUpdateGameMode.IsGlobalPak() == false
    if not IsChina then
      local TimeZoneOffset = bUserServerTimezone and TimeUtils:GetServerTimeZone() or math.tointeger(TimeUtils:GetCurrentTimeZone())
      self.Text_TimeZone:SetText(string.format("(UTC+%d)", TimeZoneOffset))
      self.Text_TimeZone:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    else
      self.Text_TimeZone:SetVisibility(UIConst.VisibilityOp.Collapsed)
    end
  end
end

return M
