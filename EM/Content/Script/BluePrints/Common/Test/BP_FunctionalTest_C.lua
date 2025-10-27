require("UnLua")
local BP_FunctionalTest_C = Class()

function BP_FunctionalTest_C:ReceivePrepareTest()
  self.bHasError = false
end

function BP_FunctionalTest_C:ReceiveStartTest()
  local ClassPath = self:GetCallClassPath()
  local FunctionName = self:GetCallFunctionName()
  local TestClass = require(ClassPath)
  self:_FinishIfClassInvalid(TestClass)
  local TestObj = TestClass.New()
  local TestFunc = TestObj[FunctionName]
  self:_FinishIfTestFuncInvalid(TestFunc)
  TestFunc(TestObj, self)
end

function BP_FunctionalTest_C:_GetTestPath(LabelArray)
  local TestPath = ""
  for i = 1, #LabelArray - 1 do
    TestPath = TestPath .. "." .. LabelArray[i]
  end
  return "Test" .. TestPath
end

function BP_FunctionalTest_C:_FinishIfLabelArrayInvalid(LabelArray)
  if nil == LabelArray or type(LabelArray) ~= "table" or #LabelArray < 2 then
    self:FinishTest(EFunctionalTestResult.Failed, "RunTest Failed! Error TestActor Label: " .. self:GetActorLabel())
  end
end

function BP_FunctionalTest_C:_FinishIfClassInvalid(TestClass)
  if nil == TestClass then
    self:FinishTest(EFunctionalTestResult.Failed, "RunTest Failed! Can't find target file: " .. self:GetActorLabel())
    return
  end
  if nil == TestClass.New or type(TestClass.New) ~= "function" then
    self:FinishTest(EFunctionalTestResult.Failed, "RunTest Failed! Can't create test object, New function not found: " .. self:GetActorLabel())
    return
  end
end

function BP_FunctionalTest_C:_FinishIfTestFuncInvalid(TestFunc)
  if nil == TestFunc or type(TestFunc) ~= "function" then
    self:FinishTest(EFunctionalTestResult.Failed, "Test function not found: ")
  end
end

function BP_FunctionalTest_C:ReceiveTick(DeltaSeconds)
end

function BP_FunctionalTest_C:Finish()
  if not self.bHasError then
    self:FinishTest(EFunctionalTestResult.Succeeded, "Test passed!")
  else
    self:FinishTest(EFunctionalTestResult.Failed, "Test failed!")
  end
end

function BP_FunctionalTest_C:Assert(Actual, Expect, Message)
  if Actual ~= Expect then
    self.bHasError = true
    self:AddError("Assertion failed! [" .. tostring(Actual) .. "] ~= [" .. tostring(Expect) .. "] Message: " .. Message)
    self:AddError(debug.traceback())
  end
end

function BP_FunctionalTest_C:SetTimeout(Timeout)
  self:SetTimeLimit(Timeout, EFunctionalTestResult.Failed)
end

return BP_FunctionalTest_C
