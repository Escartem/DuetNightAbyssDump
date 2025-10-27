require("UnLua")
local M = Class({
  "BluePrints.UI.BP_UIState_C"
})

function M:OnLoaded(...)
  self.Super.OnLoaded(self, ...)
  self.Owner, self.QuestId = ...
  if not self.Owner then
    self:Close()
    return
  end
  DebugPrint("zwkkk WBP_ModArchive_HudTips_C:OnLoaded", self.Owner:GetName(), self.QuestId, self.ShowTime)
  self.Owner.Pos_ModAchive:AddChild(self)
  local TaskInfo = DataMgr.ModGuideBookTask[self.QuestId]
  if TaskInfo then
    self.Text_Title:SetText(GText("UI_ModGuideBook_Task_Complete"))
    local CompleteNum = TaskInfo.Target
    self.Text_Desc:SetText(GText(TaskInfo.TaskName) .. " " .. "(" .. CompleteNum .. "/" .. CompleteNum .. ")")
  end
  self:BindToAnimationFinished(self.In, {
    self,
    self.OnInFinished
  })
  self:PlayAnimation(self.In)
  DebugPrint("zwkkk WBP_ModArchive_HudTips_C:OnLoaded", self.Owner:GetName(), self.QuestId, self.ShowTime)
  self:AddTimer(self.ShowTime, self.OnClose, false, 0)
end

function M:OnInFinished()
end

function M:OnClose()
  if not self.Owner then
    self:Close()
    return
  end
  DebugPrint("zwkkk OnClose", self.Owner:GetName(), self.QuestId, self.ShowTime)
  self:BindToAnimationFinished(self.Out, {
    self,
    self.OnOutAnimationFinished
  })
  self:StopAllAnimations()
  self:PlayAnimation(self.Out)
end

function M:OnOutAnimationFinished()
  if not self.Owner then
    self:Close()
    return
  end
  self.Owner.Pos_ModAchive:ClearChildren()
  self.Owner:OnPreModArchiveFinished(self.QuestId)
  self:Close()
end

return M
