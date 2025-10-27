require("UnLua")
local GachaModel = require("BluePrints.UI.WBP.Gacha.GachaModel")
local M = Class("BluePrints.UI.UI_PC.Common.Common_Dialog.Common_Dialog_ContentBase")

function M:InitContent(Params, PopupData, Owner)
  self.Super.InitContent(self, Params, PopupData, Owner)
  self.GachaId = Params.CurrentGachaId
  self.Parent = Params.Parent
  self:BindDialogEvent(DialogEvent.OnTitleTabSelected, self.OnTabSelected)
  self.ButtonIndexA = self:ShowGamepadShortcutBtn({
    KeyInfoList = {
      {
        Type = "Img",
        ImgShortPath = UIConst.GamePadImgKey.FaceButtonBottom
      }
    },
    Desc = GText("UI_Controller_Check")
  })
  self.ButtonIndexRV = self:ShowGamepadShortcutBtn({
    KeyInfoList = {
      {
        Type = "Img",
        ImgShortPath = UIConst.GamePadImgKey.RightTriggerAnalog
      }
    },
    Desc = GText("UI_Controller_Slide")
  })
  self:HideGamepadShortcut(self.ButtonIndexRV)
  local GameInputModeSubsystem = UIManager(self):GetGameInputModeSubsystem(self)
  GameInputModeSubsystem:SetNavigateWidgetOpacity(1)
  self.NowTabId = 1
  self.WS:SetActiveWidgetIndex(self.NowTabId - 1)
  self:InitListProbability()
  self:InitListText()
  self.List_Probability:SetFocus()
end

function M:InitListProbability()
  self.List_Probability:ClearListItems()
  local GachaData = DataMgr.SkinGacha[self.GachaId]
  local ItemLst = {}
  local UpContent = {}
  local UpItemId, UpItemType, Probability = GachaModel:GetSkinGachaUpInfo(self.GachaId)
  if UpItemId then
    UpContent.Type = GachaData.RewardUpType
    UpContent.Id = UpItemId
    UpContent.Probability = Probability
    UpContent.Count = GachaData.RewardUpCount
    table.insert(ItemLst, UpContent)
  end
  local NormalItemLst = GachaModel:GetSkinGachaItemLst(GachaData.Star5ItemId)
  for _, Data in ipairs(NormalItemLst) do
    table.insert(ItemLst, Data)
  end
  local Content5 = NewObject(UIUtils.GetCommonItemContentClass())
  Content5.ItemLst = ItemLst
  Content5.GachaId = self.GachaId
  Content5.GachaItemRarity = 5
  ItemLst = GachaModel:GetSkinGachaItemLst(GachaData.Star4ItemId)
  local Content4 = NewObject(UIUtils.GetCommonItemContentClass())
  Content4.ItemLst = ItemLst
  Content4.GachaId = self.GachaId
  Content4.GachaItemRarity = 4
  ItemLst = GachaModel:GetSkinGachaItemLst(GachaData.Star3ItemId)
  local Content3 = NewObject(UIUtils.GetCommonItemContentClass())
  Content3.ItemLst = ItemLst
  Content3.GachaId = self.GachaId
  Content3.GachaItemRarity = 3
  self.List_Probability:AddItem(Content5)
  self.List_Probability:AddItem(Content4)
  self.List_Probability:AddItem(Content3)
end

function M:InitListText()
  self.List_Desc:ClearListItems()
  local GachaInfo = DataMgr.SkinGacha[self.GachaId]
  local TextInfo = GText(GachaInfo.GachaWarning)
  local AlreadyGachaTimes = GachaModel:GetSkinGachaAlreadyTimes(GachaInfo.GachaType)
  local Content = NewObject(UIUtils.GetCommonItemContentClass())
  Content.GachaDes = string.format(TextInfo, AlreadyGachaTimes)
  Content.ParentWidget = self
  self.List_Desc:AddItem(Content)
end

function M:OnTabSelected(TabWidget)
  self.NowTabId = TabWidget.Idx
  if self.FocusOnSubItem then
    self.FocusOnSubItem = false
    self.Owner:SetFocus()
  end
  self.WS:SetActiveWidgetIndex(self.NowTabId - 1)
  local GameInputModeSubsystem = UIManager(self):GetGameInputModeSubsystem(self)
  if 0 == self.WS:GetActiveWidgetIndex() then
    self.List_Probability:SetFocus()
    self:ShowGamepadShortcut(self.ButtonIndexA)
    self:HideGamepadShortcut(self.ButtonIndexRV)
    GameInputModeSubsystem:SetNavigateWidgetOpacity(1)
  else
    self:HideGamepadShortcut(self.ButtonIndexA)
    self:ShowGamepadShortcut(self.ButtonIndexRV)
    self.List_Desc:SetFocus()
    GameInputModeSubsystem:SetNavigateWidgetOpacity(0)
  end
end

function M:OnContentAnalogValueChanged(MyGeometry, InAnalogInputEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InAnalogInputEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local AddOffset = UKismetInputLibrary.GetAnalogValue(InAnalogInputEvent) * 5
  if InKeyName == UIConst.GamePadKey.RightAnalogY and 1 == self.WS:GetActiveWidgetIndex() then
    local CurScrollOffset = self.EMScrollBox_0:GetScrollOffset()
    local ScrollOffset = math.clamp(CurScrollOffset - AddOffset, 0, self.EMScrollBox_0:GetScrollOffsetOfEnd())
    self.EMScrollBox_0:SetScrollOffset(ScrollOffset)
    return UIUtils.Handled
  end
  return UE4.UWidgetBlueprintLibrary.UnHandled()
end

return M
