local ShowQuestHintNode = Class("StoryCreator.StoryLogic.StorylineNodes.Questline.QuestNode")
local TaskUtils = require("BluePrints.UI.TaskPanel.TaskUtils")

function ShowQuestHintNode:Init()
  self.IsShow = false
  self.HintId = 0
  self.ShowTime = -1
  self.ListenCount = 0
  self.Context = nil
  self.NodeKey = "ShowQuestHintNode"
  self.ListenHandleName = "ListenQuestHintHide"
end

function ShowQuestHintNode:Start(Context)
  self.Context = Context
  TaskUtils:SetQuestExtraInfo(self.QuestChainId, self.QuestData.QuestId, {
    NodeKey = self.Key,
    Node = self
  })
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  if Avatar.QuestChains[Avatar.TrackingQuestChainId] and self.QuestData.QuestId == Avatar.QuestChains[Avatar.TrackingQuestChainId].DoingQuestId then
    self:ExecuteTaskHintShowOrHide()
    self:StartListen()
  end
end

function ShowQuestHintNode:OnCancelTrack()
  local TaskUIObj = TaskUtils:GetTaskBarWidget()
  if TaskUIObj.Tips.Visibility == UE4.ESlateVisibility.SelfHitTestInvisible then
    TaskUIObj.Tips:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
  self:RemoveListen()
end

function ShowQuestHintNode:OnChooseTrack()
  local TaskUIObj = TaskUtils:GetTaskBarWidget()
  TaskUIObj.Tips:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  self:ExecuteTaskHintShowOrHide()
  self:StartListen()
end

function ShowQuestHintNode:StartListen()
  self.ListenTimer = GWorld.GameInstance:AddTimer(1, function()
    self:LoopFunction()
  end, true)
end

function ShowQuestHintNode:RemoveListen()
  if self.ListenTimer then
    GWorld.GameInstance:RemoveTimer(self.ListenTimer)
    self.ListenTimer = nil
  end
end

function ShowQuestHintNode:LoopFunction()
  if -1 == self.ShowTime or self.ListenCount == self.ShowTime then
    self:FinishAction()
  end
  self.ListenCount = self.ListenCount + 1
end

function ShowQuestHintNode:EndListen()
  self:FinishAction()
end

function ShowQuestHintNode:ExecuteTaskHintShowOrHide()
  local TaskUIObj = TaskUtils:GetTaskBarWidget()
  local MessageId = CommonUtils.ChooseOptionByPlatform(DataMgr.Message[self.HintId].MessageContentPC, DataMgr.Message[self.HintId].MessageContentPhone)
  local MessageContent = GText(MessageId)
  
  local function GenAndParseActionMapContent(Panel, SourceContent)
    local FirstIndex = string.find(SourceContent, "&")
    if not FirstIndex then
      Panel.Text_Tips01:SetText(SourceContent)
      Panel.Key:SetVisibility(UE4.ESlateVisibility.Collapsed)
      Panel.Text_Tips02:SetVisibility(UE4.ESlateVisibility.Collapsed)
      return SourceContent
    end
    Panel.Key:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    Panel.Text_Tips01:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    Panel.Text_Tips02:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    local SecondIndex = string.find(SourceContent, "&", FirstIndex + 1)
    local ActionContent = string.sub(SourceContent, FirstIndex, SecondIndex)
    local ActionMapText = GText(CommonUtils:StringReplaceActionName(ActionContent))
    Panel.Key:CreateCommonKey({
      KeyInfoList = {
        {Type = "Text", Text = ActionMapText}
      }
    })
    local sub1 = string.sub(SourceContent, 1, FirstIndex - 1)
    local sub2 = string.sub(SourceContent, SecondIndex + 1)
    Panel.Text_Tips01:SetText(sub1)
    Panel.Text_Tips02:SetText(sub2)
  end
  
  GenAndParseActionMapContent(TaskUIObj, MessageContent)
  if not self.IsShow then
    if TaskUIObj.Visibility == UE4.ESlateVisibility.SelfHitTestInvisible then
      TaskUIObj:PlayAnimation(TaskUIObj.Tooltip_Out)
    end
    self:FinishAction()
  else
    TaskUIObj:PlayAnimation(TaskUIObj.Tooltip_In)
    TaskUIObj.Panel_Tips:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    TaskUIObj.Tips:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  end
end

function ShowQuestHintNode:FinishAction()
  if self.ListenTimer then
    GWorld.GameInstance:RemoveTimer(self.ListenTimer)
    self.ListenTimer = nil
  end
  if self.IsShow and -1 ~= self.ShowTime then
    local GameInstance = GWorld.GameInstance
    local GameMode = UE4.UGameplayStatics.GetGameMode(GameInstance)
    if nil == GameMode then
      DebugPrint("ShowQuestHintNode:FinishAction GameMode == nil\239\188\140 QuestId", self.QuestData.QuestId)
      return
    end
    local TaskUIObj = TaskUtils:GetTaskBarWidget()
    TaskUIObj:PlayAnimation(TaskUIObj.Tooltip_Out)
  end
  self:Finish()
end

function ShowQuestHintNode:Clear()
  if self.ListenTimer then
    GWorld.GameInstance:RemoveTimer(self.ListenTimer)
    self.ListenTimer = nil
  end
end

function ShowQuestHintNode:ClearWhenQuestSuccess()
  TaskUtils:ClearQuestExtraInfo(self.Context.QuestChainId, self.QuestId, self.Key)
end

return ShowQuestHintNode
