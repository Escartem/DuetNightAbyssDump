require("UnLua")
local EMCache = require("EMCache.EMCache")
local M = Class("BluePrints.UI.UI_PC.Common.Common_Dialog.Common_Dialog_ContentBase")

function M:GetLocalizationContent(Content)
end

function M:InitContent(Params, PopupData, Owner)
  local Info = Params.NoticeInfo
  if not Info then
    return
  end
  local Content = Info.Content[1]
  local SystemLanguage = EMCache:Get("SystemLanguage")
  for _, InfoContent in ipairs(Info.Content) do
    if InfoContent.language == SystemLanguage then
      Content = InfoContent
      break
    end
  end
  local Title = Content.title
  local Body = Content.body
  local dateTimeTable = os.date("*t", math.floor(Info.StartTimestamp))
  local Year = dateTimeTable.year
  local Month = dateTimeTable.month
  local Day = dateTimeTable.day
  local DateStr = GDate("Date_YMD", {
    Year = Year,
    Month = Month,
    Day = Day
  })
  self.Text_Date:SetText(DateStr)
  self.Text_Title:SetText(Title)
  self.Text_Details:SetText(Body)
end

return M
