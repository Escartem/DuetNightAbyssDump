require("UnLua")
local FriendCommon = require("BluePrints.UI.WBP.Friend.FriendCommon")
local FriendController = require("BluePrints.UI.WBP.Friend.FriendController")
local M = Class("BluePrints.UI.WBP.Friend.View.Base.WBP_Friend_MainBase")

function M:Construct()
  M.Super.Construct(self)
  self.Button_Copy.OnClicked:Add(self, self.OnBtnCopyClicked)
  self.Main:ClearChildren()
  ReddotManager.AddListener(FriendCommon.ReddotName, self, function(self, Count)
    if not self.WBP_Com_Tab_M.Tabs or not next(self.WBP_Com_Tab_M.Tabs) then
      return
    end
    local ReddotType = DataMgr.ReddotNode[FriendCommon.ReddotName].Type
    local IsNew = 1 == ReddotType and Count > 0
    local Upgradeable = 0 == ReddotType and Count > 0
    self.WBP_Com_Tab_M.Tabs[1].UI:SetReddot(IsNew, Upgradeable)
  end)
end

function M:OnBtnCopyClicked()
  UUIFunctionLibrary.ClipboardCopy(tostring(FriendController:GetModel():GetSelfUid()))
  FriendController:ShowToast(GText("UI_Tosat_Menu_CopyUID"))
end

function M:InitUIInfo(Name, IsInUIMode, EventList, ...)
  M.Super.InitUIInfo(self, Name, IsInUIMode, EventList, ...)
  self.InitTabType = (...)
  if not self.InitTabType then
    self.InitTabType = FriendCommon.FriendTabType.MyFriend
  end
  
  local function CloseCb(self)
    self:Close()
  end
  
  local Tabs = {}
  local Avatar = GWorld:GetAvatar()
  local IsInRegionOnline = Avatar and Avatar.IsInRegionOnline
  local CurrentOnlineType = Avatar and Avatar.CurrentOnlineType
  for Id, TabConf in pairs(DataMgr.FriendTab) do
    local IsShow = TabConf.WidgetName ~= "RegionFriend" or TabConf.WidgetName == "RegionFriend" and IsInRegionOnline and -1 ~= CurrentOnlineType
    if IsShow then
      table.insert(Tabs, {
        Text = GText(TabConf.Text),
        TabId = Id,
        IconPath = TabConf.IconPath,
        WidgetName = TabConf.WidgetName
      })
    end
  end
  table.sort(Tabs, function(a, b)
    return a.TabId < b.TabId
  end)
  local TabInfo = {
    StyleName = "Text",
    OwnerPanel = self,
    TitleName = GText("MAIN_UI_FRIEND"),
    DynamicNode = {"Back"},
    BackCallback = CloseCb,
    Tabs = Tabs,
    InfoCallback = "NotShow"
  }
  self.WBP_Com_Tab_M:Init(TabInfo)
  self.WBP_Com_Tab_M:BindEventOnTabSelected(self, self.OnTabSelected)
  self:SelectTab(self.InitTabType)
end

function M:OnTabSelected(TabWidget, TabItemInfo)
  if IsValid(self.CurrWidget) then
    self.Main:RemoveChild(self.CurrWidget)
    self.CurrWidget = nil
  end
  self.CurrWidget = self:CreateWidgetNew(TabItemInfo.WidgetName)
  self.Main:AddChild(self.CurrWidget)
  self.CurrWidget:InitWidget(self)
end

function M:SelectTab(TabType)
  self.WBP_Com_Tab_M:SelectTab(TabType)
end

function M:Destruct()
  ReddotManager.RemoveListener(FriendCommon.ReddotName, self)
  self.Main:RemoveChild(self.CurrWidget)
  M.Super.Destruct(self)
end

return M
