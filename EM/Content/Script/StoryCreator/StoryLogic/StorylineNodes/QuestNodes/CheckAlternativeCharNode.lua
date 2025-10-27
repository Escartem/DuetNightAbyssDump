local CheckAlternativeCharNode = Class("StoryCreator.StoryLogic.StorylineNodes.Questline.QuestNode")

function CheckAlternativeCharNode:Init()
end

function CheckAlternativeCharNode:Start(Context)
  self.Context = Context
  DebugPrint("===============CheckAlternativeCharNode Start===============", self)
  self:CheckAlternativeChar()
end

function CheckAlternativeCharNode:CheckAlternativeChar()
  local Avatar = GWorld:GetAvatar()
  local Config = DataMgr.InitConfig[1]
  if nil == Config or nil == Config.AlternativeCharId then
    self:FinishAction()
    return
  end
  local AlternativeCharId = Config.AlternativeCharId
  if Avatar then
    for _, Char in pairs(Avatar.Chars) do
      if AlternativeCharId == Char.CharId then
        self:FinishAction()
        return
      end
    end
    
    local function FinishNode(ret)
      self:FinishAction()
    end
    
    Avatar:CheckAlternativeChar(FinishNode)
  end
end

function CheckAlternativeCharNode:FinishAction()
  DebugPrint("===============CheckAlternativeCharNode End===============")
  self:Finish()
end

return CheckAlternativeCharNode
