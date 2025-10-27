require("UnLua")
local PersonInfoController = require("BluePrints.UI.WBP.PersonInfo.PersonInfoController")
local M = Class({
  "BluePrints.Common.TimerMgr",
  "BluePrints.UI.BP_EMUserWidget_C"
})
M._components = {
  "BluePrints.UI.WBP.PersonInfo.Base.PersonInfoMainPageView"
}

function M:Construct()
  self:InitBaseView()
end

function M:InitPage(Data)
  self:RefreshPageView(Data)
end

function M:ModelViewIni()
  self:FreshHideButton()
end

function M:FreshHideButton()
  if -1 == self.SelectCharIndex then
    PersonInfoController.MainPage.Com_BtnVisible:SetVisibility(UIConst.VisibilityOp.Collapsed)
  else
    PersonInfoController.MainPage.Com_BtnVisible:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  end
end

AssembleComponents(M)
return M
