require("UnLua")
local M = Class("BluePrints.UI.BP_EMUserWidget_C")

function M:SetTimeText(TextDesc, TimeDict, TimeIconPath)
  self.Text_TimeTitle:SetText(TextDesc)
  local FinalResult = ""
  if TimeDict then
    for TimeCount, ThisTimeInfo in ipairs(TimeDict) do
      if TimeCount > 2 then
        DebugPrint("WBP_Com_Time SetTimeText TimeCount too much, 2 need but get more")
        break
      end
      FinalResult = string.format("%s%02d%s", FinalResult, ThisTimeInfo.TimeValue, GText("UI_GameEvent_TimeRemain_" .. ThisTimeInfo.TimeType))
    end
  else
    FinalResult = "-"
  end
  self.Text_TimeDesc:SetText(FinalResult)
  if nil ~= TimeIconPath then
    UE.UResourceLibrary.LoadObjectAsync(self, TimeIconPath, {
      self,
      M.OnIconLoadFinished
    })
  end
end

function M:SetEmptyTimeText(TextDesc, TimeStrList, TimeIconPath)
  self.Text_TimeTitle:SetText(TextDesc)
  local FinalResult = ""
  for Index, TimeStr in ipairs(TimeStrList) do
    if Index > 2 then
      DebugPrint("WBP_Com_Time SetTimeText TimeCount too much, 2 need but get more")
      break
    end
    FinalResult = string.format("%s%s%s", FinalResult, "-", GText("UI_GameEvent_TimeRemain_" .. TimeStr))
  end
  self.Text_TimeDesc:SetText(FinalResult)
  if nil ~= TimeIconPath then
    UE.UResourceLibrary.LoadObjectAsync(self, TimeIconPath, {
      self,
      M.OnIconLoadFinished
    })
  end
end

function M:SetForeverTimeText(TextDesc, TimeIconPath)
  self.Text_TimeTitle:SetText(TextDesc)
  self.Text_TimeDesc:SetText(GText("UI_EventTime_Permanent"))
  if nil ~= TimeIconPath then
    UE.UResourceLibrary.LoadObjectAsync(self, TimeIconPath, {
      self,
      M.OnIconLoadFinished
    })
  end
end

function M:OnIconLoadFinished(Object)
  if IsValid(self) then
    self.Image_ClockIcon:SetBrushResourceObject(Object)
  end
end

return M
