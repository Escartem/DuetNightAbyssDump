local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("ShowNpcTab", {
  [1] = {
    IconPathPhone = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_Invitation01.T_Tab_Invitation01'",
    TabId = 1,
    TabName = "UI_SHOWNPC_NAME_SCENE1"
  },
  [2] = {
    IconPathPhone = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_Invitation02.T_Tab_Invitation02'",
    TabId = 2,
    TabName = "UI_SHOWNPC_NAME_SCENE2"
  },
  [3] = {
    IconPathPhone = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_Invitation03.T_Tab_Invitation03'",
    TabId = 3,
    TabName = "UI_SHOWNPC_NAME_SCENE3"
  }
})
