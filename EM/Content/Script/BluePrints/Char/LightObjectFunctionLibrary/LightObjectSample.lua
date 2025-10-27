local M = Class()

function M:LightObjectSample_LuaTest(ObjectSample)
  DebugPrint("chenxiaokang test", ObjectSample.Counter, ObjectSample.TestIntVar)
  ObjectSample.TestIntVar = 3.31
end

return M
