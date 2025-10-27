require("UnLua")
local WalnutBagController = require("BluePrints.UI.WBP.Walnut.WalnutBag.WalnutBagController")
local WalnutBagModel = WalnutBagController:GetModel()
local M = Class({
  "BluePrints.Common.TimerMgr",
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:Construct()
  self.Button_Area.OnClicked:Add(self, self.OnGoToButtonClicked)
  self.Button_Area.OnHovered:Add(self, self.OnGoToButtonHovered)
  self.Key_GamePad:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "Y"}
    }
  })
  self.Text_TimeDesc:SetText(GText("UI_Walnut_Dungeon_Refresh"))
  self:PlayAnimation(self.Normal)
end

function M:Init(Name, ParentWidget, LeftTimeDict, ClickCallBack)
  self.Text_Name:SetText(Name)
  self.ParentWidget = ParentWidget
  self.ClickCallBack = ClickCallBack
  self.LeftTimeDict = LeftTimeDict
  if self:IsExistTimer("UpdateTimeContent") then
    self:RemoveTimer("UpdateTimeContent")
  end
  self:UpdateTimeCountDown()
  self:AddTimer(1.0, self.UpdateTimeCountDown, true, 0, "UpdateTimeContent", true)
end

function M:Clean()
  self:RemoveTimer("UpdateTimeContent")
end

function M:UpdateTimeCountDown()
  local RemainTimeDict, TimeCount = UIUtils.GetLeftTimeStrStyle2(self.LeftTimeDict)
  if 0 == TimeCount then
    self.LeftTimeDict = WalnutBagModel:GetDungeonNextRefreshTime()
  end
  self.Time_Refresh:SetTimeText("", RemainTimeDict)
end

function M:OnGoToButtonClicked()
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_confirm", nil, nil)
  if type(self.ClickCallBack) == "function" then
    self.ClickCallBack(self.ParentWidget)
  end
end

function M:OnGoToButtonHovered()
  AudioManager(self):PlayUISound(self, "event:/ui/common/hover_btn_large", nil, nil)
end

function M:UpdateUIStyleInPlatform(IsUseGamePad)
  local ActiveWidgetIndex = IsUseGamePad and 1 or 0
  self.WidgetSwitcher_Mp:SetActiveWidgetIndex(ActiveWidgetIndex)
end

return M
