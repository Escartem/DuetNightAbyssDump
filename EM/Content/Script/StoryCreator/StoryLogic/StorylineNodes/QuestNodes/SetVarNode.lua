local SetVarNode = Class("StoryCreator.StoryLogic.StorylineNodes.BaseQuestNode")

function SetVarNode:Init()
  self.VarName = nil
  self.VarValue = 0
end

function SetVarNode:Execute()
  if not self.VarName or self.VarName == "" then
    UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "SetVarNode\232\138\130\231\130\185\229\135\186\233\148\153", "\230\178\161\230\156\137\229\161\171\229\134\153VarName, FileName:" .. tostring(self.Context.FileName) .. ",\232\175\183\231\173\150\229\136\146\230\142\146\230\159\165.")
    return
  end
  local VarInfo = DataMgr.StoryVariable[self.VarName]
  if not VarInfo then
    local _Str = "\229\143\152\233\135\143:[" .. tostring(self.VarName) .. "]\233\156\128\232\166\129\231\142\176\229\156\168StoryVariable.xlsx\228\184\173\229\133\136\229\163\176\230\152\142"
    if self.QuestChainId and 0 ~= self.QuestChainId then
      _Str = _Str .. ",QuestChainId:[" .. tostring(self.QuestChainId) .. "]"
    end
    _Str = _Str .. ",FileName:" .. tostring(self.Context.FileName) .. ",\232\175\183\231\173\150\229\136\146\230\142\146\230\159\165."
    UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "SetVarNode\232\138\130\231\130\185\229\135\186\233\148\153", _Str)
    return
  end
  if VarInfo.QuestChainId and VarInfo.QuestChainId ~= self.QuestChainId then
    local _Str = "\229\143\152\233\135\143:[" .. tostring(self.VarName) .. "]\228\184\141\232\131\189\229\156\168QuestChain:[" .. tostring(self.QuestChainId) .. "]\228\184\173\228\189\191\231\148\168\239\188\129\232\161\168\233\135\140\229\161\171\233\135\140\229\174\131\229\143\170\230\148\175\230\140\129\229\156\168QuestChain:[" .. tostring(VarInfo.QuestChainId) .. "]\228\184\173\228\189\191\231\148\168\239\188\129"
    _Str = _Str .. ",\232\175\183\231\173\150\229\136\146\230\142\146\230\159\165."
    UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "StorySubsystem\233\148\153\232\175\175", _Str)
    return
  end
  local StorySubsystem = UE4.USubsystemBlueprintLibrary.GetGameInstanceSubsystem(GWorld.GameInstance, UStorySubsystem:StaticClass())
  StorySubsystem:SetInt(self.VarName, self.VarValue)
  return nil
end

function SetVarNode:Clear()
end

function SetVarNode:OnQuestlineFinish()
end

function SetVarNode:OnQuestlineSuccess()
end

function SetVarNode:OnQuestlineFail()
end

return SetVarNode
