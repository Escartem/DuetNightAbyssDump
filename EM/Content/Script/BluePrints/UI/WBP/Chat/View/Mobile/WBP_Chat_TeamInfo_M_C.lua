require("UnLua")
local M = Class("BluePrints.UI.BP_EMUserWidget_C")

function M:InitTeamInfo(ParentWidget)
  self.List_TeamInfo_M:ClearListItems()
  local TeamData = ChatController:GetModel():GetTeamForChat()
  if not TeamData then
    return
  end
  for i = 1, TeamCommon.MaxTeamMembers do
    local Member = TeamData.Members[i]
    local Content = NewObject(UIUtils.GetCommonItemContentClass())
    Content.Data = Member
    Content.bNotNeedClickBtn = true
    Content.Owner = ParentWidget
    Content.Index = Member and Member.Index or nil
    self.List_TeamInfo_M:AddItem(Content)
  end
end

return M
