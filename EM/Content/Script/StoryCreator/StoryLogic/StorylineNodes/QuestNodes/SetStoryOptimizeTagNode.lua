local M = Class("StoryCreator.StoryLogic.StorylineNodes.BaseQuestNode")

function M:Init()
  self.TagName = nil
  self.TagValue = 0
end

function M:Execute()
  if not self.TagName or self.TagName == "" then
    local Message = string.format("SetStoryOptimizeTagNode\232\138\130\231\130\185\229\135\186\233\148\153, \230\178\161\230\156\137\229\161\171\229\134\153TagName, TagValue, FileName: %s, NodeKey: %s, \232\175\183\231\173\150\229\136\146\230\142\146\230\159\165.", self.Context.FileName, self.Key)
    UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "SetStoryOptimizeTagNode\232\138\130\231\130\185\229\135\186\233\148\153", Message)
    return
  end
  local VarData = DataMgr.StoryVariable[self.TagName]
  if not VarData then
    local Message = string.format("\230\160\135\232\174\176\229\144\141:[%s]\233\156\128\232\166\129\229\156\168 StoryVariable.xlsx \228\184\173\229\163\176\230\152\142, FileName: %s, NodeKey: %s, \232\175\183\231\173\150\229\136\146\230\142\146\230\159\165.", self.TagName, self.Context.FileName, self.Key)
    UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "SetStoryOptimizeTagNode\232\138\130\231\130\185\229\135\186\233\148\153", Message)
    return
  end
  if not VarData.IsGlobal then
    local Message = string.format("\229\143\152\233\135\143:[%s]\229\191\133\233\161\187\230\152\175\229\133\168\229\177\128\229\143\152\233\135\143, FileName: %s, NodeKey: %s, \232\175\183\231\173\150\229\136\146\230\142\146\230\159\165.", self.TagName, self.Context.FileName, self.Key)
    UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "SetStoryOptimizeTagNode\232\138\130\231\130\185\229\135\186\233\148\153", Message)
    return
  end
  local StorySubsystem = UE4.USubsystemBlueprintLibrary.GetGameInstanceSubsystem(GWorld.GameInstance, UStorySubsystem:StaticClass())
  StorySubsystem:SetOptimizeTag(self.TagName, self.TagValue)
end

return M
