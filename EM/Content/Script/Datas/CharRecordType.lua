local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("CharRecordType", {
  [1] = {
    Text = "UI_Char_Data_Step_1",
    Type = 1
  },
  [2] = {
    Text = "UI_Char_Data_Step_2",
    Type = 2
  },
  [3] = {
    Text = "UI_Char_Data_Step_3",
    Type = 3
  },
  [4] = {
    Text = "UI_Char_Data_Step_4",
    Type = 4
  },
  [5] = {
    Text = "UI_Char_Data_Step_5",
    Type = 5
  }
})
