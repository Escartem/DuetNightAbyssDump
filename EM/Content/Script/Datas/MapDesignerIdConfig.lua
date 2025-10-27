local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("MapDesignerIdConfig", {
  TestDesigner = {
    DesignerID = 10,
    DesignerName = "TestDesigner"
  }
})
