require("UnLua")
local G = Class({
  "BluePrints.UI.UI_PC.Common.Common_Item.WBP_ShowItem_Base_C"
})

function G:InitData(Content)
  self.Super.InitData(self, Content)
end

function G:InitCompView()
  self.Super.InitCompView(self)
end

function G:SetSelected(IsSelected)
  self.Super.SetSelected(self, IsSelected)
  if IsSelected then
    self:StopAnimation(self.Unselect)
    self:PlayAnimation(self.Select)
  else
    self:StopAnimation(self.Select)
    self:PlayAnimation(self.Unselect)
  end
end

return G
