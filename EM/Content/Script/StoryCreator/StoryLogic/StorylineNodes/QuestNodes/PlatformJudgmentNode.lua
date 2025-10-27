local PlatformJudgmentNode = Class("StoryCreator.StoryLogic.StorylineNodes.BaseQuestNode")

function PlatformJudgmentNode:Init()
  self.MobileName = "Mobile"
  self.PCName = "PC"
end

function PlatformJudgmentNode:Execute()
  local OutName
  local PlatformName = CommonUtils.GetDeviceTypeByPlatformName(self)
  if PlatformName == self.MobileName then
    OutName = self.MobileName
  elseif "PC" == PlatformName then
    OutName = self.PCName
  else
    assert(false, "PlatformName is not Mobile or PC")
  end
  return OutName
end

return PlatformJudgmentNode
