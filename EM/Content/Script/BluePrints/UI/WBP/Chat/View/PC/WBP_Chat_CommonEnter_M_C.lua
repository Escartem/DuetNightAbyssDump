require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:Construct()
  self.Com_ChatBtn.Button_Area.OnClicked:Add(self, self.OnClick)
  ReddotManager.AddListener(ChatCommon.ReddotName, self, function(self, Count)
    if 0 == Count then
      self.Reddot_Num:SetVisibility(UIConst.VisibilityOp.Collapsed)
    else
      self.Reddot_Num:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
      local NumText = tostring(Count)
      if Count > ChatCommon.ReddotMaxCount then
        NumText = ChatCommon.ReddotMaxCount .. "+"
      end
      self.Reddot_Num:SetNum(NumText)
    end
  end)
end

function M:Destruct()
end

function M:OnClick()
  self:PlayAnimation(self.Click)
  local Params = {
    bBattle = false,
    bInDungeonSettlement = self.bInDungeonSettlement and GWorld:GetAvatar().SettlementUidArray
  }
  local ChatMainUI = ChatController:OpenView(self, Params)
  if ChatMainUI and ChatMainUI:GetVisibility() == UIConst.VisibilityOp.Collapsed then
    ChatMainUI:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  end
end

return M
