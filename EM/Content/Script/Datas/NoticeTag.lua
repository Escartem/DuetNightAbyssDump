local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("NoticeTag", {
  [1] = {
    TagName = "UI_Notice_Tag_1",
    TagType = 1
  },
  [2] = {
    TagName = "UI_Notice_Tag_2",
    TagType = 2
  }
})
