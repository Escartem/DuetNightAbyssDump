local ShowGuideToastButtonNode = Class("StoryCreator.StoryLogic.StorylineNodes.Questline.QuestNode")
ShowGuideToastButtonNode._components = {
  "StoryCreator.StoryLogic.StorylineNodes.QuestNodes.GuideNodeComp"
}

function ShowGuideToastButtonNode:Init()
  self.ShowEnable = false
  self.MessageId = 0
  self.LastTime = -1
  self.DelayTime = 0
  self.HighLightUIPath = ""
  self.UICompName = ""
  self.UIShape = ""
  self.IsAdapted = false
  self.UICompSizeOffset = {}
  self.UICompLocOffset = {}
  self.MessageParentLoc = ""
  self.MessageLoc = ""
  self.MessageLocOffset = {}
  self.IsForbidInAnim = false
  self.IsForbidOutAnim = false
end

function ShowGuideToastButtonNode:Start(Context)
  if self.Context.IsFail and UE4.UKismetSystemLibrary.GetFrameCount() == self.Context.FrameCount then
    self:FinishAction()
    return
  end
  self.Context = Context
  self:ShowMessage(self.Context)
end

function ShowGuideToastButtonNode:ShowMessage(Context)
  DebugPrint("------------ ShowGuideToastButtonNode ------------------")
  local GameInstance = GWorld.GameInstance
  local GameMode = UE4.UGameplayStatics.GetGameMode(GameInstance)
  if self.ShowEnable then
    local UICompSizeOffsetVector = FVector2D(self.UICompSizeOffset.X, self.UICompSizeOffset.Y)
    local UICompLocOffsetVector = FVector2D(self.UICompLocOffset.X, self.UICompLocOffset.Y)
    local MessageLocOffsetVector = FVector2D(self.MessageLocOffset.X, self.MessageLocOffset.Y)
    self.UIStateAsyncActionBase = UE4.UUIStateAsyncActionBase.ShowGuideToastButton(GameInstance, self.MessageId, self.LastTime, self.DelayTime, self.HighLightUIPath, self.UICompName, self.UIShape, true, UICompSizeOffsetVector, UICompLocOffsetVector, self.MessageParentLoc, self.MessageLoc, MessageLocOffsetVector, self.IsForbidInAnim, self.IsForbidOutAnim)
    self.UIStateAsyncActionBase.OnGuideEnd:Add(GameInstance, function()
      self:FinishAction()
    end)
  elseif GameMode.GameState then
    if CommonUtils.GetDeviceTypeByPlatformName(GameInstance) == "Mobile" then
      self.Guide_Touch = UIManager(GameInstance):GetUIObj(UIManager().CurGuideTouchName)
      if not self.Guide_Touch then
        self:FinishAction()
        return
      end
      self.Guide_Touch.OnGuideEnd:Add(GameInstance, function()
        self:FinishAction()
      end)
      self.Guide_Touch:Close()
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

function ShowGuideToastButtonNode:FinishAction()
  local StorylineUtils = require("StoryCreator.StoryLogic.StorylineUtils")
  if StorylineUtils.GetOnceGuideStoryError() then
    self.Context.IsFail = true
    self.Context.FrameCount = UE4.UKismetSystemLibrary.GetFrameCount()
  end
  self:Finish()
end

function ShowGuideToastButtonNode:Clear()
  if self.UIStateAsyncActionBase and self.UIStateAsyncActionBase.OnGuideEnd:IsBound() then
    self.UIStateAsyncActionBase.OnGuideEnd:Clear()
  end
  if self.Guide_Touch and self.Guide_Touch.OnGuideEnd:IsBound() then
    self.Guide_Touch.OnGuideEnd:Clear()
  end
  if self.GuideTextPanel and self.GuideTextPanel.OnGuideEnd:IsBound() then
    self.GuideTextPanel.OnGuideEnd:Clear()
  end
end

AssembleComponents(ShowGuideToastButtonNode)
return ShowGuideToastButtonNode
