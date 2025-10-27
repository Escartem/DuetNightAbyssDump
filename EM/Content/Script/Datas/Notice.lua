local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("Notice", {
  [10001] = {
    NoticeContent = "UI_Notice_Content_10001",
    NoticeDate = "UI_Notice_Date_10001",
    NoticeID = 10001,
    NoticeIfRepeat = false,
    NoticeTitle = "UI_Notice_Title_10001"
  }
})
