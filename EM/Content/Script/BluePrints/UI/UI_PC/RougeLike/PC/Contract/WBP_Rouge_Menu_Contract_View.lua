local TimeUtils = require("Utils.TimeUtils")
local EMCache = require("EMCache.EMCache")
local ContractModel = require("BluePrints.UI.UI_PC.RougeLike.PC.Contract.WBP_Rouge_Contract_Model")
local WBP_Rouge_Menu_Contract_View = Class("BluePrints.UI.UI_PC.RougeLike.PC.Contract.WBP_Rouge_Contract_ViewBase")

function WBP_Rouge_Menu_Contract_View:InitView()
  self.Super.InitView(self)
  self:PlayAnimation(self.In)
  local ContractItemObjs = self.ContractModel:GetContractItemList(true)
  self.List_Heat:ClearListItems()
  for _, ItemObj in ipairs(ContractItemObjs) do
    ItemObj.Owner = self
    ItemObj.OnDecreaseLevel = self.OnContractLevelChanged
    ItemObj.OnIncreaseLevel = self.OnContractLevelChanged
    ItemObj.OnNavigateUp = self.OnContractItemNavigateUp
    ItemObj.OnNavigateDown = self.OnContractItemNavigateDown
    ItemObj.OnNavigated = self.OnContractItemNavigated
    self.List_Heat:AddItem(ItemObj)
  end
  self.List_Heat:RequestPlayEntriesAnim()
  if UIUtils.IsGamepadInput() then
    self:AddTimer(0.1, self.ShowGamepadKeyInfo)
  end
end

function WBP_Rouge_Menu_Contract_View:InitGamepadView()
  self.Key_Tips:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  self.List_Heat:SetFocus()
end

function WBP_Rouge_Menu_Contract_View:InitKeyboardView()
  self.Key_Tips:SetVisibility(UE4.ESlateVisibility.Collapsed)
end

function WBP_Rouge_Menu_Contract_View:UpdateContractHeat()
  local TotalHeatValue = self.ContractModel:GetCurrentHeatValue()
  local ContractPointRate = self.ContractModel:GetCurrentContractPointRate()
  ContractPointRate = math.floor(ContractPointRate * 100)
  self.Text_Bonus:SetText(string.format(GText("UI_Rougelike_Contract_ScoreAdd"), ContractPointRate) .. "%")
end

function WBP_Rouge_Menu_Contract_View:ShowGamepadKeyInfo()
  local BottomKeyInfo_Back = {
    KeyInfoList = {
      {
        Type = "Img",
        ImgLongPath = UIUtils.UtilsGetKeyIconPathInGamepad("B", self.CurGamepadName)
      }
    },
    Desc = GText("UI_Controller_Close")
  }
  local BottomKeyInfo_Scroll = {
    KeyInfoList = {
      {
        Type = "Img",
        ImgLongPath = UIUtils.UtilsGetKeyIconPathInGamepad("RV", self.CurGamepadName)
      }
    },
    Desc = GText("UI_Controller_Slide")
  }
  local ItemTotalNum = self.List_Heat:GetNumItems()
  local CanScroll = ItemTotalNum > UIUtils.GetListViewContentMaxCount(self.List_Heat)
  local GamepadKeyInfo = {}
  if CanScroll then
    self.List_Heat:SetScrollbarVisibility(UE4.ESlateVisibility.Visible)
    table.insert(GamepadKeyInfo, BottomKeyInfo_Scroll)
  else
    self.List_Heat:SetScrollbarVisibility(UE4.ESlateVisibility.Collapsed)
  end
  table.insert(GamepadKeyInfo, BottomKeyInfo_Back)
  self.Key_Tips:UpdateKeyInfo(GamepadKeyInfo)
end

function WBP_Rouge_Menu_Contract_View:OnAnalogValueChanged(MyGeometry, InAnalogInputEvent)
  if not self.MaxListScrollOffset then
    self.MaxListScrollOffset = UIUtils.GetMaxScrollOffsetOfListView(self.List_Heat)
  end
  local InKey = UE4.UKismetInputLibrary.GetKey(InAnalogInputEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local AddOffset = UKismetInputLibrary.GetAnalogValue(InAnalogInputEvent) * 0.5
  if math.abs(AddOffset) < 0.01 then
    return UE4.UWidgetBlueprintLibrary.UnHandled()
  end
  if "Gamepad_RightY" == InKeyName then
    local CurScrollOffset = self.List_Heat:GetScrollOffset()
    local ScrollOffset = math.clamp(CurScrollOffset - AddOffset, 0, self.MaxListScrollOffset)
    self.List_Heat:SetScrollOffset(ScrollOffset)
  end
  return UE4.UWidgetBlueprintLibrary.UnHandled()
end

function WBP_Rouge_Menu_Contract_View:OnClose()
  self:PlayAnimation(self.Out)
end

function WBP_Rouge_Menu_Contract_View:OnAnimationFinished(InAnimation)
  if InAnimation == self.Out then
    self:Close()
  end
end

return WBP_Rouge_Menu_Contract_View
