local ActivePlayerSkillsNode = Class("StoryCreator.StoryLogic.StorylineNodes.BaseQuestNode")

function ActivePlayerSkillsNode:Init()
  self.PlayerId = 0
  self.bActiveEnable = false
  self.ActiveType = "Lock"
  self.SkillNameList = {}
end

function ActivePlayerSkillsNode:Execute()
  DebugPrint("------------ ActivePlayerSkillsNode ------------------")
  local GameInstance = GWorld.GameInstance
  local Controller = UE4.UGameplayStatics.GetPlayerController(GameInstance, self.PlayerID)
  local PlayerController = Controller:Cast(UE4.ASinglePlayerController)
  self.EnumSkillNameList = {}
  self.EnumSkillNameArray = TArray(0)
  local EnumSkill = UE4.ESkillName
  for index, skill in ipairs(self.SkillNameList) do
    local Value = EnumSkill[skill]
    if -1 ~= Value then
      table.insert(self.EnumSkillNameList, Value)
    end
  end
  for index, skill in pairs(self.EnumSkillNameList) do
    if PlayerController:CheckSkillInActive(skill) then
      if self.bActiveEnable then
        self.EnumSkillNameArray:Add(skill)
      end
    elseif not self.bActiveEnable then
      self.EnumSkillNameArray:Add(skill)
    end
  end
  if self.ActiveType == "Lock" then
    if self.bActiveEnable then
      PlayerController:ActiveSkills(self.EnumSkillNameArray, "UnLock")
    else
      PlayerController:InActiveSkills(self.EnumSkillNameArray, "Lock")
    end
  elseif self.ActiveType == "Empty" then
    if self.bActiveEnable then
      PlayerController:UnEmptySkills(self.EnumSkillNameList)
    else
      PlayerController:EmptySkills(self.EnumSkillNameList)
    end
  end
end

function ActivePlayerSkillsNode:OnQuestlineFail()
  local GameInstance = GWorld.GameInstance
  local Controller = UE4.UGameplayStatics.GetPlayerController(GameInstance, self.PlayerID)
  local PlayerController = Controller:Cast(UE4.ASinglePlayerController)
  if self.ActiveType == "Lock" then
    if self.bActiveEnable then
      PlayerController:InActiveSkills(self.EnumSkillNameArray, "Lock")
    else
      PlayerController:ActiveSkills(self.EnumSkillNameArray, "UnLock")
    end
  elseif self.ActiveType == "Empty" then
    if self.bActiveEnable then
      PlayerController:EmptySkills(self.EnumSkillNameList)
    else
      PlayerController:UnEmptySkills(self.EnumSkillNameList)
    end
  end
end

return ActivePlayerSkillsNode
