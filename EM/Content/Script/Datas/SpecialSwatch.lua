local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("SpecialSwatch", {
  [10001] = {
    LinkedMaterial = "WPSkinCom01",
    MaterialPath = "MaterialInstanceConstant'/Game/UI/WBP/Common/VX/Armory/MI_Armory_StarrySky.MI_Armory_StarrySky'",
    ResourceID = 30110,
    SepcialColorID = 10001
  },
  [10002] = {
    LinkedMaterial = "WPSkinCom02",
    MaterialPath = "MaterialInstanceConstant'/Game/UI/WBP/Common/VX/Armory/MI_Armory_Sand.MI_Armory_Sand'",
    ResourceID = 30111,
    SepcialColorID = 10002
  }
})
