require("UnLua")
local G = Class("BluePrints.UI.UI_PC.Common.Common_Dialog.Common_Dialog_ContentBase")

function G:InitContent(Params, PopupData, Owner)
  self.Super.InitContent(self, Params, PopupData, Owner)
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
  self.Params = Params
  self:Init(Params.Parent, Params.Parent.NowGachaId)
end

function G:Init(Parent, NowTabId)
  self.Parent = Parent
  self.GachaIndex = NowTabId
  self.GachaUpList = self.Parent.GachaUpList[self.GachaIndex]
  self.GachaCharList = self.Parent.GachaCharList[self.GachaIndex]
  self.GachaWeaponList = self.Parent.GachaWeaponList[self.GachaIndex]
  self:PlayInAnim()
  local GameInputModeSubsystem = UIManager(self):GetGameInputModeSubsystem(self)
  GameInputModeSubsystem:SetNavigateWidgetOpacity(1)
  self.NowTabId = 1
  self.WS:SetActiveWidgetIndex(self.NowTabId - 1)
  self:InitListProbability()
  self:InitListText()
  self.List_Probability:SetFocus()
end

function G:OnTabSelected(TabWidget)
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

function G:OnContentAnalogValueChanged(MyGeometry, InAnalogInputEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InAnalogInputEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local AddOffset = UKismetInputLibrary.GetAnalogValue(InAnalogInputEvent) * 0.1
  if InKeyName == UIConst.GamePadKey.RightAnalogY and 1 == self.WS:GetActiveWidgetIndex() then
    local CurScrollOffset = self.List_Desc:GetScrollOffset()
    local ScrollOffset = math.clamp(CurScrollOffset - AddOffset, 0, self.List_Desc:GetScrollOffsetOfEnd())
    self.List_Desc:SetScrollOffset(ScrollOffset)
  end
  return UE4.UWidgetBlueprintLibrary.UnHandled()
end

function G:InitListProbability()
  local CurListNums = self.List_Probability:GetNumItems()
  local Count = 0
  for Index = DataMgr.GlobalConstant.CharCardLevelMax.ConstantValue, 1, -1 do
    if #self.GachaUpList[Index] > 0 then
      Count = Count + 1
      local Content
      if CurListNums >= Count then
        Content = self.List_Probability:GetItemAt(Count - 1)
      else
        Content = NewObject(UIUtils.GetCommonItemContentClass())
      end
      Content.TargetRarity = Index
      Content.IsUp = true
      Content.GachaId = self.GachaIndex
      Content.NotShow = false
      Content.ParentWidget = self
      if CurListNums < Count then
        self.List_Probability:AddItem(Content)
      end
    end
  end
  for Index = DataMgr.GlobalConstant.CharCardLevelMax.ConstantValue, 1, -1 do
    if #self.GachaCharList[Index] > 0 or #self.GachaWeaponList[Index] > 0 then
      Count = Count + 1
      local Content
      if CurListNums >= Count then
        Content = self.List_Probability:GetItemAt(Count - 1)
      else
        Content = NewObject(UIUtils.GetCommonItemContentClass())
      end
      Content.TargetRarity = Index
      Content.IsUp = false
      Content.GachaId = self.GachaIndex
      Content.ParentWidget = self
      Content.NotShow = false
      if CurListNums < Count then
        self.List_Probability:AddItem(Content)
      end
    end
  end
  if CurListNums > Count then
    for index = Count + 1, CurListNums do
      local Item = self.List_Probability:GetItemAt(index - 1)
      Item.NotShow = true
    end
  end
  self.List_Probability:RequestRefresh()
end

function G:InitListText()
  self.List_Desc:ClearListItems()
  local GachaInfo = DataMgr.Gacha[self.GachaIndex]
  local TextInfo = GText(GachaInfo.GachaWarning)
  local ProbabilityId = GachaInfo.ProbabilityId
  local ProbabilityInfo = DataMgr.GachaProbability[ProbabilityId]
  local GachaType = GachaInfo.GachaType
  if ProbabilityInfo and ProbabilityInfo.ShowGetStar5Times then
    local Content = NewObject(UIUtils.GetCommonItemContentClass())
    local AlreadyGachaTimes = 0
    if self.Parent.GuaranteedDict and self.Parent.GuaranteedDict[GachaType] then
      AlreadyGachaTimes = self.Parent.GuaranteedDict[GachaType]
    end
    Content.GachaDes = string.format(GText("GACHA_TITLE_SHOWTIMES"), AlreadyGachaTimes, ProbabilityInfo.ShowGetStar5Times)
    Content.ParentWidget = self
    self.List_Desc:AddItem(Content)
  end
  local Content = NewObject(UIUtils.GetCommonItemContentClass())
  local GachaStarMap = DataMgr.GachaStarMap[self.GachaIndex]
  local CharId, WeaponId
  for key, value in pairs(GachaStarMap.Char5Up) do
    CharId = key
    break
  end
  for key, value in pairs(GachaStarMap.Weapon5Up) do
    WeaponId = key
    break
  end
  if CharId and string.find(TextInfo, "&Char&") then
    local CharName = DataMgr.Char[CharId].CharName
    TextInfo = string.gsub(TextInfo, "&Char&", GText(CharName))
  end
  if WeaponId and string.find(TextInfo, "&Weapon&") then
    local WeaponName = DataMgr.Weapon[WeaponId].WeaponName
    TextInfo = string.gsub(TextInfo, "&Weapon&", GText(WeaponName))
  end
  Content.GachaDes = TextInfo
  Content.ParentWidget = self
  self.List_Desc:AddItem(Content)
end

function G:PlayInAnim()
  self:StopAnimation(self.Out)
  self:PlayAnimation(self.In)
end

function G:PlayOutAnim()
  if self:IsAnimationPlaying(self.In) or self:IsAnimationPlaying(self.Out) then
    return
  end
  self:StopAnimation(self.In)
  self:PlayAnimation(self.Out)
  self.Owner:OnClose()
end

return G
