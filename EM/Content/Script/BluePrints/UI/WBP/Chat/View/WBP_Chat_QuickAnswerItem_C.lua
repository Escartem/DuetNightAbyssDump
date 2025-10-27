require("UnLua")
local ChatModel = ChatController:GetModel()
local M = Class({
  "BluePrints.Common.TimerMgr",
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:Construct()
  self.Button_Area.OnClicked:Add(self, self.OnBtnClicked)
end

function M:Destruct()
  self.Button_Area.OnClicked:Remove(self, self.OnBtnClicked)
  if self:IsExistTimer(self.NextFrameKey) then
    self:RemoveTimer(self.NextFrameKey, true)
  end
end

function M:OnBtnClicked()
  AudioManager(self):PlayUISound(self, "event:/ui/common/team_click_emoj", nil, nil)
  self.Owner:OnItemClick(self.Text)
end

function M:Init(Owner, Index)
  self.Owner = Owner
  self.Text = ChatModel:GetQuickMsgDatas()[Index]
  if not self.Text or self.Text == "" then
    self:PlayAnimation(self.Forbidden)
    self.Button_Area:SetVisibility(UIConst.VisibilityOp.Collapsed)
    return
  end
  self.Text_Cell:SetText(self.Text)
  self.Text_Num:SetText(string.format("0%d", Index))
  self.NextFrameKey = "WBP_Chat_QuickAnswerItem" .. Index
end

function M:OnListItemObjectSet(Content)
  Content.UI = self
  self:Init(Content.Owner, Content.Index)
end

return M
