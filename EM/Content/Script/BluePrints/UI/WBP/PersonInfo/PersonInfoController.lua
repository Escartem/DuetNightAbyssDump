local PersonInfoModel = require("BluePrints.UI.WBP.PersonInfo.PersonInfoModel")
local PersonInfoCommon = require("BluePrints.UI.WBP.PersonInfo.PersonInfoCommon")
local PersonInfoEditModel = require("BluePrints.UI.WBP.PersonInfo.Edit.PersonInfoEditModel")
local PersonInfoDataModel = require("BluePrints.UI.WBP.PersonInfo.Data.PersonInfoDataModel")
local M = Class("BluePrints.Common.MVC.Controller")
M.PageEnum = {
  MainPage = 1,
  EditPage = 2,
  DataPage = 3
}

function M:GetPageEnum()
  return M.PageEnum
end

function M:Init()
  M.Super.Init(self)
  PersonInfoEditModel:Init()
  self.CurPage = nil
end

function M:Destory()
  M.Super.Destory(self)
end

function M:GetModel()
  return PersonInfoModel
end

function M:GetEdirModel()
  return PersonInfoEditModel
end

function M:GetEventName()
  return EventID.PersonInfoControllerEvent
end

function M:OpenView(PlayerInfo, ForceServerData)
  if PlayerInfo and PlayerInfo.Uuid == PersonInfoModel._Avatar.Uid and true ~= ForceServerData then
    PlayerInfo = nil
  end
  if PlayerInfo then
    PersonInfoModel:SetPersonID(PlayerInfo.Uid)
  end
  self.CurPage = M.PageEnum.MainPage
  PersonInfoModel:InitData(PlayerInfo)
  self.bReturnMain = false
  self.MainPage = M.Super.OpenView(self, nil, PersonInfoCommon.UIName)
  self.MainPage:SetFocus()
  self.CurPage = M.PageEnum.MainPage
  return self.MainPage
end

function M:OpenEditView(TabName, BoxIndex)
  if self.CurPage == M.PageEnum.EditPage then
    return
  end
  self.CurPage = M.PageEnum.EditPage
  self:ExitMainPage()
  if self.MainPage.PersonInfoMainPage.ActorController and self.MainPage.PersonInfoMainPage.ActorController.ArmoryPlayer then
    self.MainPage.PersonInfoMainPage.ActorController:HidePlayerActor("PersonInfoEdit", true)
  end
  local Platform = CommonUtils.GetDeviceTypeByPlatformName(self)
  local PCBluePrint
  if "PC" == Platform then
    PCBluePrint = " WidgetBlueprint'/Game/UI/WBP/PersonalInfo/PC/WBP_PersonalInfo_Edit_P.WBP_PersonalInfo_Edit_P'"
  else
    PCBluePrint = "WidgetBlueprint'/Game/UI/WBP/PersonalInfo/Mobile/WBP_PersonalInfo_Edit_M.WBP_PersonalInfo_Edit_M'"
  end
  self.EditPage = UIManager(self):CreateWidget(PCBluePrint)
  if self.EditPage == nil then
    return
  end
  self.EditPage.Root = self.MainPage
  self.MainPage.Content:AddChildToOverlay(self.EditPage)
  local ContentOverlaySlot = UE4.UWidgetLayoutLibrary.SlotAsOverlaySlot(self.EditPage)
  ContentOverlaySlot:SetHorizontalAlignment(EHorizontalAlignment.HAlign_Fill)
  ContentOverlaySlot:SetVerticalAlignment(EVerticalAlignment.VAlign_Fill)
  self.EditPage:InitBaseView(TabName, BoxIndex)
  self.EditPage:SetFocus()
  self.EditPage:PlayAnimation(self.EditPage.In)
end

function M:OpenDataView()
  self.CurPage = M.PageEnum.DataPage
  self:ExitMainPageWithoutTab()
  PersonInfoDataModel:Init(PersonInfoModel.OtherPersonInfo)
  self:CreatDataPage()
  self.DataPage.Root = self.MainPage
  self.DataPage:InitBaseView()
  self.MainPage.PersonInfoMainPage.ActorController:SetMontageAndCamera("Char", nil, "Personal", "Data")
  if self.MainPage.Com_BtnVisible then
    self.MainPage.Com_BtnVisible:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  ScreenPrint("\230\137\147\229\188\128\230\149\176\230\141\174\231\187\159\232\174\161\231\149\140\233\157\162")
end

function M:CreatDataPage()
  local Platform = CommonUtils.GetDeviceTypeByPlatformName(self)
  local PCBluePrint
  if "PC" == Platform then
    PCBluePrint = "WidgetBlueprint'/Game/UI/WBP/PersonalInfo/PC/WBP_PersonalInfo_Data_P.WBP_PersonalInfo_Data_P'"
  else
    PCBluePrint = "WidgetBlueprint'/Game/UI/WBP/PersonalInfo/Mobile/WBP_PersonalInfo_Data_M.WBP_PersonalInfo_Data_M'"
  end
  self.DataPage = UIManager(self):CreateWidget(PCBluePrint)
  if self.DataPage == nil then
    ScreenPrint("--------------\230\149\176\230\141\174\231\187\159\232\174\161\231\149\140\233\157\162\229\138\160\232\189\189\229\164\177\232\180\165-----------------")
    return
  end
  self.MainPage.Content:AddChildToOverlay(self.DataPage)
  local ContentOverlaySlot = UE4.UWidgetLayoutLibrary.SlotAsOverlaySlot(self.DataPage)
  ContentOverlaySlot:SetHorizontalAlignment(EHorizontalAlignment.HAlign_Fill)
  ContentOverlaySlot:SetVerticalAlignment(EVerticalAlignment.VAlign_Fill)
  self.DataPage:SetFocus()
  self.DataPage.IsClosing = false
end

function M:OnCloseDateView()
  self.CurPage = M.PageEnum.MainPage
  self.MainPage.PersonInfoMainPage:FreshCamera()
  self.MainPage.PersonInfoMainPage:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  self.MainPage:InitTabInfo()
  self.MainPage.PersonInfoMainPage:PlayAnimation(self.MainPage.PersonInfoMainPage.In)
  self.DataPage:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  self.DataPage.IsClosing = true
  self.MainPage.PersonInfoMainPage:SetOriginFocus()
  if self.MainPage.Com_BtnVisible then
    self.MainPage.PersonInfoMainPage:FreshHideButton()
  end
end

function M:ReallyCloseDateView(Page)
  if not self.DataPage or not self.DataPage.IsClosing then
    DebugPrint("\230\178\161\230\156\137\230\149\176\230\141\174\231\187\159\232\174\161\231\149\140\233\157\162\239\188\140\229\186\148\232\175\165\230\152\175\230\137\147\229\188\128\230\151\182\229\164\177\232\180\165")
    return
  end
  if Page then
    Page:RemovefromParent()
  else
    DebugPrint("\230\178\161\230\156\137\231\188\150\232\190\145\231\149\140\233\157\162\239\188\140\229\186\148\232\175\165\230\152\175\230\137\147\229\188\128\230\151\182\229\164\177\232\180\165")
  end
end

function M:CloseEditView()
  PersonInfoEditModel.Handler = nil
  if self.EditPage then
    self.EditPage:RemovefromParent()
    self.EditPage:PlayAnimation(self.EditPage.Out)
  else
    DebugPrint("\230\178\161\230\156\137\231\188\150\232\190\145\231\149\140\233\157\162\239\188\140\229\186\148\232\175\165\230\152\175\230\137\147\229\188\128\230\151\182\229\164\177\232\180\165")
  end
  self.bReturnMain = true
  self:ReturnMainPage()
  self.CurPage = M.PageEnum.MainPage
end

function M:ExitMainPage()
  self.MainPage.MainPageItem:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.MainPage.PersonInfoMainPage:SetVisibility(UIConst.VisibilityOp.Collapsed)
end

function M:ExitMainPageWithoutTab()
  self.MainPage.PersonInfoMainPage:SetVisibility(UIConst.VisibilityOp.Collapsed)
end

function M:ReturnMainPage()
  self.CurPage = M.PageEnum.MainPage
  self.MainPage.MainPageItem:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  if self.MainPage.PersonInfoMainPage.ActorController and self.MainPage.PersonInfoMainPage.ActorController.ArmoryPlayer then
    self.MainPage.PersonInfoMainPage.ActorController:HidePlayerActor("PersonInfoEdit", false)
  end
  self.MainPage.PersonInfoMainPage:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  self.MainPage.PersonInfoMainPage:InitDisplayBoxView(true)
  self.MainPage.PersonInfoMainPage:SetOriginFocus()
end

function M:GetView(WorldContex)
  return M.Super.GetView(self, WorldContex, PersonInfoCommon.UIName)
end

function M:GetPersonInfo(PlayerInfo)
  UIManager(self):ShowUITip("CommonToastMain", GText("TOAST_DUNGEON_CANCEL_LEAVETEAM"), 1.5)
  self:OpenView(PlayerInfo.Uid)
end

function M:OnClose()
  local FocusWidget = UIManager(self):GetLastestAndFocusableUIWidgetObj()
  if FocusWidget and FocusWidget.SetFocus_Lua and type(FocusWidget.SetFocus_Lua) == "function" then
    FocusWidget:SetFocus_Lua()
  end
  self.CurPage = nil
  self.MainPage = nil
  self.EditPage = nil
  self.DataPage = nil
  PersonInfoModel:ClearModel()
  PersonInfoDataModel:ClearModel()
end

_G.PersonInfoController = M
return M
