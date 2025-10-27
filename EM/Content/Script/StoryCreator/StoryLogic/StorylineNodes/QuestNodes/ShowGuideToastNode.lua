local ShowGuideToastNode = Class("StoryCreator.StoryLogic.StorylineNodes.Questline.QuestNode")
ShowGuideToastNode._components = {
  "StoryCreator.StoryLogic.StorylineNodes.QuestNodes.GuideNodeComp"
}

function ShowGuideToastNode:Init()
  self.ShowEnable = false
  self.MessageId = 0
  self.LastTime = -1
  self.Style = "Normal"
end

function ShowGuideToastNode:Start(Context)
  if self.Context.IsFail and UE4.UKismetSystemLibrary.GetFrameCount() == self.Context.FrameCount then
    self:FinishAction()
    return
  end
  self.Context = Context
  self:ShowMessage(self.Context)
end

function ShowGuideToastNode:ShowMessage(Context)
  DebugPrint("------------ ShowGuideToastNode ------------------")
  local GameInstance = GWorld.GameInstance
  local GameMode = UE4.UGameplayStatics.GetGameMode(GameInstance)
  if self.Style == "Normal" then
    if self.ShowEnable then
      UResourceLibrary.LoadClassAsync(GameInstance, UIConst.GuideTextFloat, {
        GameInstance,
        function(_, ClassObject)
          self.UIStateAsyncActionBase = UE4.UUIStateAsyncActionBase.ShowGuideToastWithUIClass(GameInstance, ClassObject, self.MessageId, self.LastTime)
          self.UIStateAsyncActionBase.OnGuideEnd:Add(GameInstance, function()
            self:FinishAction()
          end)
        end
      })
    elseif GameMode.GameState then
      self.GuideTextPanel = UIManager(GameInstance):GetUIObj("GuideTextFloat" .. self.MessageId)
      if not self.GuideTextPanel then
        self:FinishAction()
        return
      end
      self.GuideTextPanel.OnGuideEnd:Add(GameInstance, function()
        self:FinishAction()
      end)
      self.GuideTextPanel:DeleteGuideMessage(self.MessageId)
    end
  elseif self.Style == "Warning" then
    if self.ShowEnable then
      local TextMapId = CommonUtils.ChooseOptionByPlatform(DataMgr.Message[self.MessageId].MessageContentPC, DataMgr.Message[self.MessageId].MessageContentPhone)
      UIManager(GameInstance):ShowUITip(UIConst.Tip_CommonWarning, GText(TextMapId), self.LastTime, false, self.MessageId)
    else
      UIManager(GameInstance):HideWarningUITip(self.MessageId)
    end
    self:FinishAction()
  end
end

function ShowGuideToastNode:FinishAction()
  self:Finish()
end

function ShowGuideToastNode:Clear()
  if self.UIStateAsyncActionBase and self.UIStateAsyncActionBase.OnGuideEnd:IsBound() then
    self.UIStateAsyncActionBase.OnGuideEnd:Clear()
  end
  if self.GuideTextPanel and self.GuideTextPanel.OnGuideEnd:IsBound() then
    self.GuideTextPanel.OnGuideEnd:Clear()
  end
end

AssembleComponents(ShowGuideToastNode)
return ShowGuideToastNode
