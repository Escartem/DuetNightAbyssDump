require("UnLua")
local M = Class({
  "BluePrints.Common.TimerMgr",
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:Construct()
end

function M:BindEvents(Events)
  self.EventObj = Events.EventObj
  self.OnSliderChangedEvent = Events.OnSliderChangedEvent
end

function M:InitSliderValue(CurrentValue, MinValue, MaxValue, StepSize)
  self.Com_Slider:Init({
    InitValue = CurrentValue,
    MinValue = MinValue,
    MaxValue = MaxValue,
    ClickInterval = StepSize,
    MinusBtnCallback = self.OnSliderValueChanged,
    AddBtnCallback = self.OnSliderValueChanged,
    SliderChangeCallback = self.OnSliderValueChanged,
    OwnerPanel = self,
    PlatfomName = CommonUtils.GetDeviceTypeByPlatformName(self),
    ForbidGamePadRSKey = true,
    bForbidPressAccelerate = true,
    bUseDefaultKeyInit = false
  })
  self.MaxValue = MaxValue
  self.MinValue = MinValue
  self:_SetTextValue(CurrentValue)
  self.Com_Slider.Key_Min:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "Down"}
    }
  })
  self.Com_Slider.Key_Add:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "Up"}
    }
  })
end

function M:OnSliderValueChanged(Value)
  self:_SetTextValue(Value)
  if self.OnSliderChangedEvent then
    self.OnSliderChangedEvent(self.EventObj, Value)
  end
end

function M:SetSliderValue(Value, bCallEvent)
  if bCallEvent then
    self.Com_Slider:ChangeSliderValueByInputNumber(Value)
  else
    self.Com_Slider:ChangeSliderValueByInputNumber(Value, true)
    self:_SetTextValue(Value)
  end
end

function M:_SetTextValue(Value)
  local FloorValue = math.clamp(Value, self.MinValue, self.MaxValue)
  FloorValue = math.floor(FloorValue + 0.5)
  self.Num:SetText(FloorValue)
  local Diff = self.MaxValue - self.MinValue
  if 0 == Diff then
    return
  end
  local CanvasSlot = UWidgetLayoutLibrary.SlotAsCanvasSlot(self.Canvas_NumPos)
  local SlotSizeY = CanvasSlot:GetSize().Y
  local NumSlot = UWidgetLayoutLibrary.SlotAsCanvasSlot(self.HorizontalBox_Num)
  local Pos = NumSlot:GetPosition()
  Pos.Y = SlotSizeY * (1 - FloorValue / Diff) - SlotSizeY / 2
  NumSlot:SetPosition(Pos)
end

function M:AddValue()
  self.Com_Slider:OnClickToAdd()
end

function M:SubValue()
  self.Com_Slider:OnClickToMinus()
end

function M:_SetExtraText(Text)
  self.Text:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  self.Text:SetText(Text)
end

function M:SliderClickInterval(NewInterval)
  self.Com_Slider.ClickInterval = NewInterval
end

return M
