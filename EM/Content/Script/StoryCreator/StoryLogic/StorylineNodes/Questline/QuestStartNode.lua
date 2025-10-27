local QuestStartNode = Class("StoryCreator.StoryLogic.StorylineNodes.BaseAsynQuestNode")
local TaskUtils = require("BluePrints.UI.TaskPanel.TaskUtils")
QuestStartNode.IsStartNode = true

function QuestStartNode:GoToRegionCallBack()
  local Avatar = GWorld:GetAvatar()
  if Avatar.CurrentRegionId ~= self.SubRegionId then
    return
  end
  DebugPrint("XXN_ Exce RegionSkipCallBack GoToRegionNode:GoToRegion Callback, RegionId, ", self.SubRegionId, " CurrentRegionId", Avatar.CurrentRegionId)
  self:SuccessExecuteStartNode()
  Avatar:RemoveSubRegionSkipCallback(self.SubRegionId, self, self.GoToRegionCallBack)
  self.IsSetGotoRegionCallback = false
end

function QuestStartNode:Execute(Callback)
  self.QuestStartCallback = Callback
  self:UpdateStartNodeTaskBarInfo()
  if self.StoryGuidePointName ~= "" then
    self:TriggerShowOrCloseMissionIndicator(true)
  end
  if self.SubRegionId and 0 ~= self.SubRegionId and self.QuestChainId > 0 then
    local GameMode = UE4.UGameplayStatics.GetGameMode(GWorld.GameInstance)
    local Avatar = GWorld:GetAvatar()
    if not GameMode or not Avatar then
      GWorld.logger.error("XXN_ QuestStartNode Error GameMode: " .. GameMode .. "Avatar: ", Avatar)
      return
    end
    if Avatar.CurrentRegionId == self.SubRegionId then
      self:SuccessExecuteStartNode()
      return
    end
    DebugPrint("XXN_ Add RegionSkipCallBack QuestStartNode ", self.SubRegionId, Avatar.CurrentRegionId)
    Avatar:AddRegionSkipCallback(self.SubRegionId, self, self.GoToRegionCallBack)
    self.IsSetGotoRegionCallback = true
  else
    self:SuccessExecuteStartNode()
  end
end

function QuestStartNode:Clear()
  if not self.IsSetGotoRegionCallback then
    return
  end
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    Avatar:RemoveSubRegionSkipCallback(self.SubRegionId, self, self.GoToRegionCallBack)
  end
  self.IsSetGotoRegionCallback = false
end

function QuestStartNode:TriggerShowOrCloseMissionIndicator(IsShow)
  if self.SubRegionId and self.SubRegionId > 0 then
    if IsShow then
      MissionIndicatorManager:ActiveMissionIndicatorByNode(self)
    else
      MissionIndicatorManager:ReactiveMissionIndicatorByNode(self)
    end
  end
end

function QuestStartNode:SuccessExecuteStartNode()
  self.QuestStartCallback("QuestStart")
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    Avatar:StartQuest(self.QuestChainId, self.QuestId)
  end
  EventManager:FireEvent(EventID.QuestStart)
  if self.StoryGuidePointName ~= "" then
    self:TriggerShowOrCloseMissionIndicator(false)
  end
end

function QuestStartNode:UpdateStartNodeTaskBarInfo()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  if self.QuestChainId > 0 and self.QuestId > 0 and Avatar and not TaskUtils:CheckSpecialTaskDoing() then
    local TaskInfo = {
      TaskChainId = self.QuestChainId,
      TaskId = self.QuestId,
      TaskName = GText(DataMgr.QuestChain[self.QuestChainId].QuestChainName),
      TaskDescription = GText(self.QuestDescription),
      IsChainFirstTask = self.bIsStartQuest,
      IsChapterStart = self.bIsStartChapter,
      QuestUIId = self.QuestUIId
    }
    Avatar:DoRefreshTaskItemUIInfo("Add", TaskInfo)
  end
  if self.bIsDynamicEvent then
    local TaskInfo = {
      TaskDescription = self.QuestDescription,
      IsChainFirstTask = self.bIsStartQuest,
      IsChapterStart = self.bIsStartChapter,
      IsDynamicEvent = self.bIsDynamicEvent
    }
    Avatar:DoRefreshTaskItemUIInfo("Add", TaskInfo)
  end
  if TaskUtils:CheckSpecialTaskDoing() and self.QuestDescription ~= "" and "" ~= self.QuestDeatil then
    local SpecialQuestChainId = TaskUtils:GetSpcialPreQuestChainIdByConfig(self.Context.FilePath)
    if 0 ~= SpecialQuestChainId and DataMgr.QuestChain[SpecialQuestChainId] and DataMgr.QuestChain[SpecialQuestChainId].QuestChainName then
      local SpecialQuestChainName = DataMgr.QuestChain[SpecialQuestChainId].QuestChainName
      TaskUtils:UpdateSpecialTaskInfo("AddSpecialTaskInfo", {
        TaskName = GText(SpecialQuestChainName),
        TaskDescribe = GText(self.QuestDescription)
      })
    end
  end
end

return QuestStartNode
