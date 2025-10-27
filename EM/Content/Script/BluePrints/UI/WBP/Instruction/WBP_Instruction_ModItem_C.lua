require("UnLua")
local ActivityUtils = require("Blueprints.UI.WBP.Activity.ActivityUtils")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:Initialize(Initializer)
end

function M:Init(QuestId, Parent)
  self.Parent = Parent
  self.QuestId = QuestId
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  self.QuestConfig = DataMgr.ModGuideQuest[QuestId]
  if not self.QuestConfig then
    return
  end
  self.QuestData = Avatar.ModGuideQuests[QuestId]
  local Sub = self:GetNum(self.QuestData:GetCurrentCount())
  self.Text_Describe:SetText(GText(self.QuestConfig.StarterQuestDes) .. Sub)
  if self.QuestData:IsComplete() then
    if not self.QuestData.RewardsGot then
      self:PlayCompleteAnim()
    else
      self:PlayAnimation(self.InitializeComplete)
    end
  else
    self:PlayInAnim()
  end
end

function M:GetNum(Current)
  return " (" .. tostring(Current) .. "/" .. tostring(self.QuestConfig.Target) .. ")"
end

function M:PlayInAnim()
  self:PlayAnimation(self.In)
end

function M:PlayCompleteAnim()
  self:UnbindAllFromAnimationFinished(self.MissonComplete)
  self:BindToAnimationFinished(self.MissonComplete, {
    self,
    function()
      local Avatar = GWorld:GetAvatar()
      if Avatar and not Avatar.ModGuideQuests[self.QuestId].RewardsGot then
        Avatar:ModGuideQuestGetReward(self.QuestId, function()
          self.Parent:ShowReward(self.QuestId)
          self.Parent:TryRefreshAllItem()
        end)
      end
    end
  })
  self:PlayAnimation(self.MissonComplete)
end

function M:PlayOutAnim()
  self:PlayAnimation(self.Out)
end

function M:UpdateDesc()
  local Sub = self:GetNum(self.QuestData:GetCurrentCount())
  self.Text_Describe:SetText(GText(self.QuestConfig.StarterQuestDes) .. Sub)
end

AssembleComponents(M)
return M
