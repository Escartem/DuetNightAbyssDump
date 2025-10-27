require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:Construct()
  self.Btn_Click.OnClicked:Add(self, self.OnClick)
  if not ModController:IsMobile() then
    self.Key_Click:CreateCommonKey({
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "RS"}
      }
    })
  else
    self.Key_Click:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  self.Text_AvatarNeedTitle:SetText(GText("UI_CharTrial_AccessWalnut"))
end

function M:Init(WalnutId)
  self.WalnutId = WalnutId
  local Content = NewObject(UIUtils.GetCommonItemContentClass())
  local WalnutData = DataMgr.Walnut[WalnutId]
  if not WalnutData then
    return
  end
  local WalnutType = WalnutData.WalnutType
  local WalnutTypeData = DataMgr.WalnutType[WalnutType]
  Content.Rarity = WalnutData.Rarity or 1
  Content.Icon = WalnutTypeData.Icon
  Content.Parent = self
  Content.Id = WalnutId
  Content.ItemType = "Walnut"
  self.Com_Item:Init(Content)
end

function M:OnClick()
  UIManager(self):LoadUINew("WalnutRewardDialog", self.WalnutId)
end

return M
