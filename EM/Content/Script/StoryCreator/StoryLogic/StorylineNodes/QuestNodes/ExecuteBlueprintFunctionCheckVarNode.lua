local ExecuteBlueprintFunctionCheckVarNode = Class("StoryCreator.StoryLogic.StorylineNodes.BaseQuestNode")

function ExecuteBlueprintFunctionCheckVarNode:Init()
  self.ListenIntervalSeconds = 0.2
  self.FunctionName = nil
  self.VarName = nil
  self.VarInfos = {}
  self.Duration = 0
  self.TimerTime = 0
end

function ExecuteBlueprintFunctionCheckVarNode:Start()
  if 0 == self.Duration then
    local ReturnValue = self:Execute()
    self:Finish(nil ~= ReturnValue and tostring(ReturnValue) or nil)
  else
    self:Execute(function(ReturnValue)
      self:Finish(nil ~= ReturnValue and tostring(ReturnValue) or nil)
    end)
  end
end

function ExecuteBlueprintFunctionCheckVarNode:Execute(Callback)
  self.Callback = Callback
  if not self.VarName or self.VarName == "" then
    UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "ExecuteBlueprintFunctionCheckVarNode\232\138\130\231\130\185\229\135\186\233\148\153", "\230\178\161\230\156\137\229\161\171\229\134\153VarName, FileName:" .. tostring(self.Context.FileName) .. ",\232\175\183\231\173\150\229\136\146\230\142\146\230\159\165.")
    return
  end
  if self.Duration < 0 then
    UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "ExecuteBlueprintFunctionCheckVarNode\232\138\130\231\130\185\229\135\186\233\148\153", "\230\140\129\231\187\173\230\151\182\233\151\180\229\143\170\232\131\189\229\161\1710\229\146\140\230\173\163\230\149\180\230\149\176, \230\140\129\231\187\173\230\151\182\233\151\180: " .. self.Duration .. ", FileName:" .. tostring(self.Context.FileName) .. ",\232\175\183\231\173\150\229\136\146\230\142\146\230\159\165.")
    return
  end
  local VarInfo = DataMgr.StoryVariable[self.VarName]
  if not VarInfo then
    local _Str = "\229\143\152\233\135\143:[" .. tostring(self.VarName) .. "]\233\156\128\232\166\129\231\142\176\229\156\168StoryVariable.xlsx\228\184\173\229\133\136\229\163\176\230\152\142"
    if self.QuestChainId and 0 ~= self.QuestChainId then
      _Str = _Str .. ",QuestChainId:[" .. tostring(self.QuestChainId) .. "]"
    end
    _Str = _Str .. ",FileName:" .. tostring(self.Context.FileName) .. ",\232\175\183\231\173\150\229\136\146\230\142\146\230\159\165."
    UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "ExecuteBlueprintFunctionCheckVarNode\232\138\130\231\130\185\229\135\186\233\148\153", _Str)
    return
  end
  self.NewVarInfos = {}
  for k, v in pairs(self.VarInfos) do
    local _VarName = v.VarName
    local _VarValue = v.VarValue
    if tonumber(_VarValue) then
      self.NewVarInfos[_VarName] = tonumber(_VarValue)
    else
      self.NewVarInfos[_VarName] = _VarValue
    end
  end
  local StorySubsystem = UE4.USubsystemBlueprintLibrary.GetGameInstanceSubsystem(GWorld.GameInstance, UStorySubsystem:StaticClass())
  local Ret = StorySubsystem:ExecuteBlueprintVarFunction(self.FunctionName, self.VarName, self.NewVarInfos, self.QuestChainId, true)
  if type(Ret) ~= "number" or 0 ~= Ret % 1 then
    UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "ExecuteBlueprintFunctionCheckVarNode\232\138\130\231\130\185\229\135\186\233\148\153", "\229\135\189\230\149\176[" .. tostring(self.FunctionName) .. "]\231\154\132\232\191\148\229\155\158\229\128\188\228\184\141\230\152\175bool\231\177\187\229\158\139")
    return nil
  end
  if 0 == self.Duration then
    return 1 == Ret
  else
    if 1 == Ret then
      self.Callback(true)
      return
    end
    self.TimerTime = 0
    self.ListenTimer = GWorld.GameInstance:AddTimer(self.ListenIntervalSeconds, function()
      self:ListenForBlueprintFunction()
    end, true, self.ListenIntervalSeconds)
  end
end

function ExecuteBlueprintFunctionCheckVarNode:ListenForBlueprintFunction()
  self.TimerTime = self.TimerTime + self.ListenIntervalSeconds
  if self.TimerTime >= self.Duration then
    self.Callback(false)
    self:Clear()
  end
  local StorySubsystem = UE4.USubsystemBlueprintLibrary.GetGameInstanceSubsystem(GWorld.GameInstance, UStorySubsystem:StaticClass())
  local Ret = StorySubsystem:ExecuteBlueprintVarFunction(self.FunctionName, self.VarName, self.NewVarInfos, self.QuestChainId, true)
  if 1 == not Ret then
    return
  end
  self.Callback(true)
  self:Clear()
end

function ExecuteBlueprintFunctionCheckVarNode:Clear()
  assert(GWorld.GameInstance, "\230\137\167\232\161\140\229\143\152\233\135\143\230\163\128\230\181\139\229\135\189\230\149\176\232\138\130\231\130\185\239\188\154\230\184\133\231\144\134\229\164\177\232\180\165\239\188\140\230\184\184\230\136\143\229\174\158\228\190\139\228\184\186\231\169\186\227\128\130")
  GWorld.GameInstance:RemoveTimer(self.ListenTimer)
  self.ListenTimer = nil
  self.Callback = nil
  self.TimerTime = 0
end

function ExecuteBlueprintFunctionCheckVarNode:OnQuestlineFinish()
end

function ExecuteBlueprintFunctionCheckVarNode:OnQuestlineSuccess()
end

function ExecuteBlueprintFunctionCheckVarNode:OnQuestlineFail()
end

return ExecuteBlueprintFunctionCheckVarNode
