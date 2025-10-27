require("UnLua")
local M = Class({
  "BluePrints.UI.UI_PC.Common.Common_Dialog.Common_Dialog_ContentBase"
})

function M:InitContent(Params, PopupData, Owner)
  M.Super.InitContent(self, Params, PopupData, Owner)
  local CharId = Params and Params.CharId
  local WidgetCount = 0
  local Panel = self.WB_PosInfo
  local Data = DataMgr.BattleChar[CharId]
  local CharPositioningIds = {}
  if Data and Data.Positioning then
    for _, value in pairs(Data.Positioning) do
      CharPositioningIds[value] = true
    end
  end
  local Widget = Panel:GetChildAt(0)
  if not Widget then
    return
  end
  local UIManager = UIManager(self)
  local WidgetClass = UGameplayStatics.GetObjectClass(Widget)
  local Contents = {}
  for PositioningId, PData in pairs(DataMgr.Positioning) do
    local Content = {
      Index = PData.Index or 0
    }
    Content.Name = GText(PData.Name)
    Content.Icon = PData.Icon
    Content.Des = GText(PData.Des)
    if CharPositioningIds[PositioningId] then
      Content.CharIcon = UIUtils.GetCharMiniIconPath(CharId)
    end
    table.insert(Contents, Content)
  end
  table.sort(Contents, function(a, b)
    if a.CharIcon and not b.CharIcon then
      return true
    elseif not a.CharIcon and b.CharIcon then
      return false
    end
    return a.Index < b.Index
  end)
  for _, Content in ipairs(Contents) do
    Widget = Panel:GetChildAt(WidgetCount)
    if not Widget then
      Widget = UIManager:CreateWidget(WidgetClass)
      Panel:AddChild(Widget)
    end
    Widget:OnListItemObjectSet(Content)
    WidgetCount = WidgetCount + 1
  end
  if WidgetCount > 0 then
    Panel:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    local Start, End = WidgetCount, Panel:GetChildrenCount() - 1
    for i = Start, End do
      Panel:RemoveChildAt(i)
    end
  else
    Panel:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

function M:OnContentAnalogValueChanged(MyGeometry, InAnalogInputEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InAnalogInputEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if InKeyName == UIConst.GamePadKey.RightAnalogY then
    local DeltaOffset = -1 * UKismetInputLibrary.GetAnalogValue(InAnalogInputEvent) * 5
    local CurrentOffset = self.EMScrollBox_48:GetScrollOffset()
    local NextOffset = math.clamp(CurrentOffset + DeltaOffset, 0, self.EMScrollBox_48:GetScrollOffsetOfEnd())
    self.EMScrollBox_48:SetScrollOffset(NextOffset)
    return UIUtils.Handled
  end
  return UIUtils.Unhandled
end

return M
