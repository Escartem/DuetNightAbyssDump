require("UnLua")
local M = Class("BluePrints.UI.BP_UIState_C")

function M:Construct()
  self.Text_Title:SetText(GText("Minigame_Textmap_100310"))
  self.Btn_FullClose.OnClicked:Add(self, self.Close)
  self.Key_Tips:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "B"}
    }
  })
  self:InitDeviceInfo()
end

function M:InitUIInfo(Name, IsInUIMode, EventList, ...)
  self.Super.InitUIInfo(self, Name, IsInUIMode, EventList, ...)
  self:InitReasoningDetail(...)
end

function M:OnLoaded(...)
  self.Super:OnLoaded(...)
  self:SetFocus()
end

function M:InitReasoningDetail(...)
  local AnswerId = (...)
  DebugPrint("InitReasoningDetail AnswerId: ", AnswerId)
  local DetectiveAnswerData = DataMgr.DetectiveAnswer[AnswerId]
  if DetectiveAnswerData then
    self.Image_Item:SetBrushResourceObject(LoadObject(DetectiveAnswerData.Icon))
    self.Text_ItemName:SetText(DetectiveAnswerData.Name)
  end
end

function M:InitDeviceInfo()
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
  if IsValid(self.GameInputModeSubsystem) then
    self:RefreshOpInfoByInputDevice(self.GameInputModeSubsystem:GetCurrentInputType(), self.GameInputModeSubsystem:GetCurrentGamepadName())
  end
end

function M:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  DebugPrint("WBP_Reasoning_Detail_C RefreshOpInfoByInputDevice", CurInputDevice, CurGamepadName)
  self.CurInputDevice = CurInputDevice
  if CurInputDevice == ECommonInputType.Gamepad then
    self:SetFocus()
    self.Text_Tip:SetText(GText("Minigame_Textmap_100314"))
    self.Key_Tips:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  else
    self:SetFocus()
    self.Text_Tip:SetText(GText("Minigame_Textmap_100311"))
    self.Key_Tips:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
  self.Super.RefreshOpInfoByInputDevice(self, CurInputDevice, CurGamepadName)
end

function M:OnKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) and "Gamepad_FaceButton_Right" == InKeyName then
    self:Close()
  end
  return UE4.UWidgetBlueprintLibrary.Handled()
end

return M
