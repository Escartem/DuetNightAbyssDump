local ShowGuideNode = Class("StoryCreator.StoryLogic.StorylineNodes.Questline.QuestNode")
ShowGuideNode._components = {
  "StoryCreator.StoryLogic.StorylineNodes.QuestNodes.GuideNodeComp"
}

function ShowGuideNode:Init()
  self.MessageId = 0
  self.SkillNameList = {}
  self.LastTime = 0
  self.bIsForceTouch = false
  self.bIsTimeDilation = false
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
  self.ForbidSuccessAnim = false
end

function ShowGuideNode:Start(Context)
  if self.Context.IsFail and UE4.UKismetSystemLibrary.GetFrameCount() == self.Context.FrameCount then
    self:FinishAction()
    return
  end
  self.Context = Context
  self:InitEnumSkillNameList()
  self:Touch(self.Context)
end

function ShowGuideNode:InitEnumSkillNameList()
  self.EnumSkillNameList = {}
  local EnumSkill = UE4.ESkillName
  for index, skill in ipairs(self.SkillNameList) do
    local Value = EnumSkill[skill]
    if -1 ~= Value then
      table.insert(self.EnumSkillNameList, Value)
    end
  end
end

function ShowGuideNode:Touch(Context)
  DebugPrint("------------ ShowGuideNode Start------------------")
  local GameInstance = GWorld.GameInstance
  local UIManger = GameInstance:GetGameUIManager()
  local GuideTouch = UIManger:GetUIObj(UIManger.CurGuideTouchName)
  if GuideTouch then
    GuideTouch:Close()
  end
  local UICompSizeOffsetVector = FVector2D(self.UICompSizeOffset.X, self.UICompSizeOffset.Y)
  local UICompLocOffsetVector = FVector2D(self.UICompLocOffset.X, self.UICompLocOffset.Y)
  local MessageLocOffsetVector = FVector2D(self.MessageLocOffset.X, self.MessageLocOffset.Y)
  self.UIStateAsyncActionBase = UE4.UUIStateAsyncActionBase.ShowGuide(GameInstance, self.MessageId, self.EnumSkillNameList, self.LastTime, self.bIsForceTouch, self.bIsTimeDilation, self.HighLightUIPath, self.UICompName, self.UIShape, true, UICompSizeOffsetVector, UICompLocOffsetVector, self.MessageParentLoc, self.MessageLoc, MessageLocOffsetVector, self.IsForbidInAnim, self.IsForbidOutAnim, self.ForbidSuccessAnim, self.IsNotForceRelease)
  self.UIStateAsyncActionBase.OnGuideEnd:Add(GameInstance, function()
    self:FinishAction()
  end)
end

function ShowGuideNode:FinishAction()
  DebugPrint("------------ ShowGuideNode End------------------")
  local StorylineUtils = require("StoryCreator.StoryLogic.StorylineUtils")
  if StorylineUtils.GetOnceGuideStoryError() then
    self.Context.IsFail = true
    self.Context.FrameCount = UE4.UKismetSystemLibrary.GetFrameCount()
  end
  self:Finish()
end

function ShowGuideNode:Clear()
  if self.UIStateAsyncActionBase and self.UIStateAsyncActionBase.OnGuideEnd:IsBound() then
    self.UIStateAsyncActionBase.OnGuideEnd:Clear()
  end
end

AssembleComponents(ShowGuideNode)
return ShowGuideNode
