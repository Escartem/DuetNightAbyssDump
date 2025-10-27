local M = Class("StoryCreator.StoryLogic.StorylineNodes.BaseQuestNode")

function M:Execute()
  local InputType = CommonUtils.GetCurrentInputType()
  if InputType == ECommonInputType.MouseAndKeyboard then
    return "MouseAndKeyboard"
  elseif InputType == ECommonInputType.Gamepad then
    return "Gamepad"
  elseif InputType == ECommonInputType.Touch then
    return "Touch"
  else
    assert(false, string.format("Node execution at key %s failed, InputType is invalid.", self.Key))
  end
end

return M
