local TimeUtils = require("Utils.TimeUtils")
local EMCache = require("EMCache.EMCache")
local WBP_Rouge_Contract_ViewBase = Class("BluePrints.UI.BP_UIState_C", "BluePrints.UI.BP_EMUserWidget_C")

function WBP_Rouge_Contract_ViewBase:Construct()
  self:InitView()
end

function WBP_Rouge_Contract_ViewBase:InitView()
  self.ContractModel = require("BluePrints.UI.UI_PC.RougeLike.PC.Contract.WBP_Rouge_Contract_Model")
  self.ContractModel:InitModel(GWorld:GetAvatar())
  self.Text_Title:SetText(GText("UI_Rougelike_Contract_Name"))
  self.Btn_Close:Init("Close", self, self.OnBtnCloseClicked)
  self:UpdateContractHeat()
  self:RefreshOpInfoByInputDevice()
end

function WBP_Rouge_Contract_ViewBase:UpdateView()
  local ItemObjs = self.List_Heat:GetListItems()
  for _, ItemObj in pairs(ItemObjs) do
    ItemObj.SelectedLevel = self.ContractModel:GetContractLevel(ItemObj.ContractId)
  end
  local ItemViews = self.List_Heat:GetDisplayedEntryWidgets()
  for _, ItemView in pairs(ItemViews) do
    ItemView:UpdateView()
  end
  self:UpdateContractHeat()
end

function WBP_Rouge_Contract_ViewBase:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  self.CurInputDeviceType = UIUtils.UtilsGetCurrentInputType()
  self.CurGamepadName = UIUtils.UtilsGetCurrentGamepadName()
  if self.CurInputDeviceType == UE4.ECommonInputType.Gamepad then
    self:InitGamepadView()
  elseif UIUtils.IsMobileInput() then
    self:InitMobileView()
  else
    self:InitKeyboardView()
  end
end

function WBP_Rouge_Contract_ViewBase:InitGamepadView()
  if CommonUtils.GetDeviceTypeByPlatformName(self) ~= "Mobile" then
    self.Controller_illustrate:SetVisibility(UE4.ESlateVisibility.Visible)
    self.Controller_Reset:SetVisibility(UE4.ESlateVisibility.Visible)
    self.Controller_Confirm:SetVisibility(UE4.ESlateVisibility.Visible)
  end
  self.Btn_Confirm:SetVisibility(UE4.ESlateVisibility.HitTestInvisible)
  self.Btn_Reset:SetVisibility(UE4.ESlateVisibility.HitTestInvisible)
  self.Btn_Qa:SetVisibility(UE4.ESlateVisibility.HitTestInvisible)
  self.Icon_Key_illustrate:CreateCommonKey({
    KeyInfoList = {
      {
        Type = "Img",
        ImgLongPath = UIUtils.UtilsGetKeyIconPathInGamepad("Menu", self.CurGamepadName)
      }
    }
  })
  self.Icon_Key_Reset:CreateCommonKey({
    KeyInfoList = {
      {
        Type = "Img",
        ImgLongPath = UIUtils.UtilsGetKeyIconPathInGamepad("Y", self.CurGamepadName)
      }
    }
  })
  self.Icon_Key_Confirm:CreateCommonKey({
    KeyInfoList = {
      {
        Type = "Img",
        ImgLongPath = UIUtils.UtilsGetKeyIconPathInGamepad("A", self.CurGamepadName)
      }
    }
  })
  self.Key_Tip:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  self.Key_Tip:UpdateKeyInfoNew({
    {
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "B"}
      },
      Desc = "\232\191\148\229\155\158"
    }
  })
  local ItemViews = self.List_Heat:GetDisplayedEntryWidgets()
  for _, ItemView in pairs(ItemViews) do
    ItemView:InitGamepadView()
  end
  self:AddTimer(0.1, function()
    self:NavigateToContractIndex(0)
  end)
end

function WBP_Rouge_Contract_ViewBase:NavigateToContractIndex(Index)
  self.List_Heat:NavigateToIndex(Index)
end

function WBP_Rouge_Contract_ViewBase:InitKeyboardView()
  self.Key_Tip:SetVisibility(UE4.ESlateVisibility.Collapsed)
  local ItemViews = self.List_Heat:GetDisplayedEntryWidgets()
  for _, ItemView in pairs(ItemViews) do
    ItemView:InitKeyboardView()
  end
end

function WBP_Rouge_Contract_ViewBase:InitMobileView()
end

function WBP_Rouge_Contract_ViewBase:OnContractItemNavigateUp(ItemObj, Widget)
  local CurIndex = self.List_Heat:GetIndexForItem(ItemObj)
  if -1 == CurIndex then
    DebugPrint("WBP_Rouge_Contract_ViewBase ItemNavigateUp: CurIndex == -1")
    return
  end
  self:NavigateToContractIndex(CurIndex - 1)
end

function WBP_Rouge_Contract_ViewBase:OnContractItemNavigateDown(ItemObj, Widget)
  local CurIndex = self.List_Heat:GetIndexForItem(ItemObj)
  if -1 == CurIndex then
    DebugPrint("WBP_Rouge_Contract_ViewBase ItemNavigateUp: CurIndex == -1")
    return
  end
  self:NavigateToContractIndex(CurIndex + 1)
end

function WBP_Rouge_Contract_ViewBase:OnContractItemNavigated(ItemObj, Widget)
  self.List_Heat:BP_ScrollItemIntoView(ItemObj)
  if DataMgr.RougeLikeContract[ItemObj.ContractId].ExplanationId then
    self.Key_Tip:UpdateKeyInfoNew({
      {
        KeyInfoList = {
          {Type = "Img", ImgShortPath = "X"}
        },
        Desc = GText("UI_CTL_Explain")
      },
      {
        KeyInfoList = {
          {Type = "Img", ImgShortPath = "B"}
        },
        Desc = "\232\191\148\229\155\158"
      }
    })
  else
    self.Key_Tip:UpdateKeyInfoNew({
      {
        KeyInfoList = {
          {Type = "Img", ImgShortPath = "B"}
        },
        Desc = GText("UI_BACK")
      }
    })
  end
end

function WBP_Rouge_Contract_ViewBase:UpdateContractHeat()
  local TotalHeatValue = self.ContractModel:GetCurrentHeatValue()
  local ContractPointRate = self.ContractModel:GetCurrentContractPointRate()
  ContractPointRate = math.floor(ContractPointRate * 100)
  self.Text_Bonus:SetText(ContractPointRate)
end

function WBP_Rouge_Contract_ViewBase:OnContractLevelChanged(ContractId, PrevLevel, NewLevel)
  self.ContractModel:SetContractLevel(ContractId, NewLevel)
  self:UpdateContractHeat()
end

function WBP_Rouge_Contract_ViewBase:OnKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if "Escape" == InKeyName then
    self:OnBtnCloseClicked()
  end
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) then
    if InKeyName == Const.GamepadFaceButtonRight then
      self:OnClose()
    elseif InKeyName == Const.GamepadSpecialRight then
      UIManager(self):ShowCommonPopupUI(100142, {}, self)
    end
  end
  return UE4.UWidgetBlueprintLibrary.Handled()
end

function WBP_Rouge_Contract_ViewBase:OnLoaded(RougeMainUI)
  self.RougeMainUI = RougeMainUI
end

function WBP_Rouge_Contract_ViewBase:OnBtnCloseClicked()
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_return", nil, nil)
  self:OnClose()
end

function WBP_Rouge_Contract_ViewBase:OnClose()
  self:Close()
end

return WBP_Rouge_Contract_ViewBase
