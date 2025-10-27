require("UnLua")
local M = Class("BluePrints.UI.BP_UIState_C")

function M:Initialize(Initializer)
  self.Super.Initialize(self)
  self.ItemID = nil
  self.ItemType = nil
  self.ConfigData = nil
  self.OpenKey = "Tab"
  self.IsCanCloseByHotKey = nil
  self.ParentWidget = nil
end

function M:OnLoaded(...)
  self.Super.OnLoaded(self, ...)
  self.ConfigData, self.ItemType, self.ParentWidget, self.IsCanCloseByHotKey, self.AutoOpenDetectiveGameUI = ...
  self:FillWithData()
  if CommonUtils.GetDeviceTypeByPlatformName(self) == CommonConst.CLIENT_DEVICE_TYPE.PC then
    self.Key_Close:CreateCommonKey({
      KeyInfoList = {
        {
          Type = "Text",
          Text = "Esc",
          ClickCallback = self.Close,
          Owner = self
        }
      },
      bLongPress = false,
      Desc = GText("UI_BACK")
    })
    self.Key_Close:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  else
    self.Key_Close:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
  self.Text_Close:SetText(GText("UI_TRAIN_CLOSE"))
  self.Btn_Close.OnClicked:Add(self, self.PlayOutAnim)
  self.ScrollBox_Content:ScrollToStart()
  self:PlayInAnim()
  self:AddTimer(0.1, function()
    self:_SetUpScrollBoxRStickInput(self.ScrollBox_Content)
    self:UpdateStoryKeyTips()
  end)
end

function M:OnUpdateUIStyleByInputTypeChange(CurInputType, CurGamepadName)
  if CurInputType == ECommonInputType.Gamepad then
    self.WS:SetActiveWidgetIndex(1)
  else
    self.WS:SetActiveWidgetIndex(0)
  end
end

function M:FillWithData()
  if self.ItemType == "Read" then
    self.ItemID = self.ConfigData
    local StuffConfigData = DataMgr.Resource[self.ItemID]
    if nil ~= StuffConfigData then
      self.Text_Title:SetText(GText(StuffConfigData.ResourceName))
      self.Text_Content:SetText(GText(StuffConfigData.IpDes))
    end
  elseif self.ItemType == "DetectiveAnswer" then
    local DetectiveMinigameTipsUI = UIManager(self):GetUIObj("DetectiveMinigameTips")
    if DetectiveMinigameTipsUI then
      DetectiveMinigameTipsUI:Close()
    end
    self.AnswerId = self.ConfigData
    local DetectiveAnswerConfigData = DataMgr.DetectiveAnswer[self.AnswerId]
    if nil ~= DetectiveAnswerConfigData then
      self.Text_Title:SetText(GText(DetectiveAnswerConfigData.Name))
      self.Text_Content:SetText(GText(DetectiveAnswerConfigData.Detail))
    end
  else
    self.Text_Title:SetText(GText(self.ConfigData.Name))
    self.Text_Content:SetText(GText(self.ConfigData.Desc))
  end
end

function M:PlayInAnim()
  if self:IsAnimationPlaying(self.In) then
    return
  end
  AudioManager(self):PlayUISound(self, "event:/ui/common/reading_hud", "ItemInformation", nil)
  self:PlayAnimationForward(self.In)
end

function M:PlayOutAnim()
  AudioManager(self):SetEventSoundParam(self, "ItemInformation", {ToEnd = 1})
  if self:IsAnimationPlaying(self.Out) then
    return
  end
  self:BindToAnimationFinished(self.Out, {
    self,
    self.Close
  })
  self:PlayAnimationForward(self.Out)
end

function M:UpdateStoryKeyTips()
  local BottomKeyInfo = {}
  if UIUtils.CheckScrollBoxCanScroll(self.ScrollBox_Content) then
    BottomKeyInfo = {
      {
        KeyInfoList = {
          {Type = "Img", ImgShortPath = "RV"}
        },
        Desc = GText("UI_Controller_Slide")
      },
      {
        KeyInfoList = {
          {Type = "Img", ImgShortPath = "B"}
        },
        Desc = GText("UI_Controller_Close")
      }
    }
  else
    BottomKeyInfo = {
      {
        KeyInfoList = {
          {Type = "Img", ImgShortPath = "B"}
        },
        Desc = GText("UI_Controller_Close")
      }
    }
  end
  self.Key_Tips:UpdateKeyInfo(BottomKeyInfo)
end

function M:Close()
  self.Super.Close(self)
  if IsValid(self.ParentWidget) then
    if type(self.ParentWidget.SetFocus_Lua) == "function" then
      self.ParentWidget:SetFocus_Lua()
    else
      self.ParentWidget:SetFocus()
    end
  end
  if self.ItemType == "DetectiveAnswer" then
    if self.AutoOpenDetectiveGameUI then
      UIManager(self):LoadUINew("DetectiveMinigame", self.AnswerId)
    else
      local DetectiveMinigameUI = UIManager(self):GetUIObj("DetectiveMinigame")
      if not DetectiveMinigameUI then
        UIManager(self):LoadUINew("DetectiveMinigameTips", self.AnswerId)
      end
    end
  end
end

function M:OnKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) then
    if InKeyName == UIConst.GamePadKey.FaceButtonRight then
      self:PlayOutAnim()
    end
  elseif InKeyName == self.OpenKey and self.IsCanCloseByHotKey or "Escape" == InKeyName then
    self:PlayOutAnim()
  end
  return UE4.UWidgetBlueprintLibrary.Handled()
end

function M:OnKeyUp(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local IsEventHandled = false
  if InKeyName == self.OpenKey then
    self.IsCanCloseByHotKey = true
  end
  if IsEventHandled then
    return UE4.UWidgetBlueprintLibrary.Handled()
  else
    return UE4.UWidgetBlueprintLibrary.UnHandled()
  end
end

function M:OnAnalogValueChanged(MyGeometry, InAnalogInputEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InAnalogInputEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if InKeyName == UIConst.GamePadKey.RightAnalogY and self.TargetScrollBoxWithRStickInput ~= nil then
    local DeltaOffset = self.bReserveSBoxScrollDir * UKismetInputLibrary.GetAnalogValue(InAnalogInputEvent)
    local CurrentOffset = self.TargetScrollBoxWithRStickInput:GetScrollOffset()
    local NextOffset = math.max(0, math.min(self.ScrollOffsetOfEndOfSBox, CurrentOffset + DeltaOffset * self.ScrollSpeedRStickOfSBox))
    self.TargetScrollBoxWithRStickInput:SetScrollOffset(NextOffset)
    return UIUtils.Handled
  end
  return UIUtils.Unhandled
end

return M
