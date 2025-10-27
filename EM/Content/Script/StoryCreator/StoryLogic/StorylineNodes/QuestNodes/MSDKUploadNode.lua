local MSDKUploadNode = Class("StoryCreator.StoryLogic.StorylineNodes.BaseQuestNode")

function MSDKUploadNode:Execute()
  if not DataMgr.MSDKUploadInfo[self.EventName] then
    UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "MSDKUploadNode, EventName:[" .. tostring(self.EventName) .. "]\229\161\171\229\134\153\229\135\186\233\148\153\239\188\140\228\184\141\229\156\168MSDKUploadInfo\232\161\168\233\135\140")
    return
  end
  local EMHeroUSDKSubsystem = UE4.USubsystemBlueprintLibrary.GetGameInstanceSubsystem(GWorld.GameInstance, UEMHeroUSDKSubsystem:StaticClass())
  EMHeroUSDKSubsystem:MSDKUploadCommonEventByEventName(self.EventName)
end

return MSDKUploadNode
