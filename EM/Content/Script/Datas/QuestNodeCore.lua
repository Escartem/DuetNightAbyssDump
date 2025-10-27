local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("QuestNodeCore", {
  CameraNode = {NodeType = "CameraNode"},
  ForbidWeaponByWeaponTagNode = {
    NodeType = "ForbidWeaponByWeaponTagNode",
    TestArgs = {
      WeaponTags = {"Melee"}
    }
  },
  TestGreaterNode = {
    NodeType = "TestGreaterNode",
    TestArgs = {
      A = 1,
      B = 2,
      Delay = 1
    }
  },
  TestPrintNode = {
    NodeType = "TestPrintNode",
    TestArgs = {Text = "HelloWorld"}
  }
})
