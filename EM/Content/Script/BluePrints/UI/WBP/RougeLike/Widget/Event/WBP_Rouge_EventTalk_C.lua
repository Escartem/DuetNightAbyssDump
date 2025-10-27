require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:Construct()
  if self.Btn_Click then
    self.Btn_Click.OnClicked:Add(self, self.OnBtnClick)
  end
end

function M:InitUI(ChatInfo)
  self:PlayAnimation(self.In)
  if ChatInfo.IsAnswer then
    self.Text_Content:SetText(ChatInfo.Content)
  else
    if 1 == ChatInfo.CurrentTalkType then
      self.Switch_Role:SetActiveWidgetIndex(0)
      self.Text_Npc:SetText(ChatInfo.TalkActorName)
    elseif 2 == ChatInfo.CurrentTalkType then
      self.Switch_Role:SetActiveWidgetIndex(1)
      self.Text_Player:SetText(ChatInfo.TalkActorName)
    else
      self.SizeBox_Name:SetVisibility(ESlateVisibility.Collapsed)
    end
    self.Text_Chat:SetText(ChatInfo.Content)
  end
  self.Parent = ChatInfo.Parent
end

function M:OnBtnClick()
  self.Parent:OnIteratorDialogue()
end

return M
