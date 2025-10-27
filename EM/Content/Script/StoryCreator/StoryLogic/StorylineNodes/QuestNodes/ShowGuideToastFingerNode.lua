local ShowGuideToastFingerNode = Class("StoryCreator.StoryLogic.StorylineNodes.Questline.QuestNode")
ShowGuideToastFingerNode._components = {
  "StoryCreator.StoryLogic.StorylineNodes.QuestNodes.GuideNodeComp"
}

function ShowGuideToastFingerNode:Init()
  self.ShowEnable = false
  self.MessageId = 0
  self.MessageSustainTime = 0
  self.Gesture = ""
  self.MessageLoc = ""
  self.MessageLocOffset = {}
end

function ShowGuideToastFingerNode:Start(Context)
  self.Context = Context
  self:ShowMessage(self.Context)
end

function ShowGuideToastFingerNode:ShowMessage(Context)
  DebugPrint("------------ ShowGuideToastFingerNode ------------------")
  local GameInstance = GWorld.GameInstance
  local GameMode = UE4.UGameplayStatics.GetGameMode(GameInstance)
  if self.ShowEnable then
    if CommonUtils.GetDeviceTypeByPlatformName(GameInstance) == "Mobile" then
      local MessageLocOffset = FVector2D(self.MessageLocOffset.X, self.MessageLocOffset.Y)
      self.UIStateAsyncActionBase = UE4.UUIStateAsyncActionBase.ShowGuideToastFingerNode(GameInstance, self.MessageId, self.MessageSustainTime, self.Gesture, self.MessageLoc, MessageLocOffset)
      self.UIStateAsyncActionBase.OnGuideEnd:Add(GameInstance, function()
        self:FinishAction()
      end)
    else
      UResourceLibrary.LoadClassAsync(GameInstance, UIConst.GuideTextFloat, {
        GameInstance,
        function(_, ClassObject)
          self.UIStateAsyncActionBase = UE4.UUIStateAsyncActionBase.ShowGuideToastWithUIClass(GameInstance, ClassObject, self.MessageId, self.MessageSustainTime)
          self.UIStateAsyncActionBase.OnGuideEnd:Add(GameInstance, function()
            self:FinishAction()
          end)
        end
      })
    end
  elseif GameMode.GameState then
    if CommonUtils.GetDeviceTypeByPlatformName(GameInstance) == "Mobile" then
      self.GuideGesture = UIManager(GameInstance):GetUIObj("GuideGesture")
      if not self.GuideGesture then
        self:FinishAction()
        return
      end
      self.GuideGesture.OnGuideEnd:Add(GameInstance, function()
        self:FinishAction()
      end)
      self.GuideGesture:Close()
    elseif CommonUtils.GetDeviceTypeByPlatformName(GameInstance) == "PC" then
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
  end
end

function ShowGuideToastFingerNode:Clear()
  if self.UIStateAsyncActionBase and self.UIStateAsyncActionBase.OnGuideEnd:IsBound() then
    self.UIStateAsyncActionBase.OnGuideEnd:Clear()
  end
  if self.GuideGesture and self.GuideGesture.OnGuideEnd:IsBound() then
    self.GuideGesture.OnGuideEnd:Clear()
  end
  if self.GuideTextPanel and self.GuideTextPanel.OnGuideEnd:IsBound() then
    self.GuideTextPanel.OnGuideEnd:Clear()
  end
end

function ShowGuideToastFingerNode:FinishAction()
  self:Finish()
end

AssembleComponents(ShowGuideToastFingerNode)
return ShowGuideToastFingerNode
