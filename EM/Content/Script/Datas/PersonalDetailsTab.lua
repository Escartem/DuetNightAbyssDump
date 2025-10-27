local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("PersonalDetailsTab", {
  [101] = {
    Name = "MAIN_UI_PLAY",
    TabID = 101
  }
})
