require("UnLua")
local HeroUSDKUtils = require("Utils.HeroUSDKUtils")
local M = Class({
  "BluePrints.Common.TimerMgr",
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:Construct()
  self.Btn_Erase:BindEventOnClicked(self, self.OnMarkDelete)
  self.Btn_Confirm:BindEventOnClicked(self, self.OnMarkConfirm)
  self.Btn_Track:BindEventOnClicked(self, self.OnMarkTrack)
  self.Btn_Erase:SetIconPanelVisibility(ESlateVisibility.SelfHitTestInvisible)
  self.Btn_Confirm:SetIconPanelVisibility(ESlateVisibility.SelfHitTestInvisible)
  self.Btn_Track:SetIconPanelVisibility(ESlateVisibility.SelfHitTestInvisible)
  self.Text_Title:SetText(GText("UI_RegionMap_Mark"))
  self.Btn_Confirm:SetText(GText("UI_RegionMap_Mark"))
  self.Text_Max:SetText("/" .. math.floor(DataMgr.GlobalConstant.MaxMapMarkIcon.ConstantValue))
  self.Btn_Erase:SetText(GText("UI_RegionMap_Delete"))
  self.Btn_Erase:SetDefaultGamePadImg("Y")
  self.Btn_Confirm:TryOverrideSoundFunc(self.OnMarkDeleteSound)
  self.MaxNum = 12
  self.CurrentSensitive = 0
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(UGameplayStatics.GetPlayerController(self, 0))
  self.GameInputModeSubsystem.OnInputMethodChanged:Add(self, self.OnUpdateUIStyleByInputTypeChange)
  self.TypeTable = {}
  self.TypeId2Image = {}
  self.DefaultTypeId = nil
  local count = 0
  for id, data in pairs(DataMgr.MapMarkIcon) do
    if data.MarkIconPath then
      local image = LoadObject(data.MarkIconPath.Panel)
      if image then
        if not self.DefaultTypeId then
          self.DefaultTypeId = id
        end
        local markType = self:NewMarkType()
        self.TypeTable[id] = markType
        self.TypeId2Image[id] = data.MarkIconPath.Point
        markType.Img_Mark:SetBrushFromTexture(image)
        markType.Switch:SetActiveWidgetIndex(0)
        markType.Btn.OnClicked:Add(self, function()
          AudioManager(self):PlayUISound(self, "event:/ui/common/click", "", nil)
          self:OnTypeClicked(id)
        end)
        markType:SetNavigationRuleBase(EUINavigation.Up, count < 5 and EUINavigationRule.Stop or EUINavigationRule.Escape)
        markType.Parent = self
        count = count + 1
      end
    end
  end
  for i = count + 1, 10 do
    local markType = self:NewMarkType()
    markType.Switch:SetActiveWidgetIndex(1)
    self.TypeTable[i * -100] = markType
  end
end

function M:Destruct()
  self.GameInputModeSubsystem.OnInputMethodChanged:Remove(self, self.OnUpdateUIStyleByInputTypeChange)
  for _, markType in pairs(self.TypeTable) do
    markType.Btn.OnClicked:Clear()
    markType:RemoveFromParent()
  end
  self.TypeId2Image = {}
end

function M:Open(Id, Data, MarkHitName, TypeId, Tracking, RegionIcon)
  self.SaveSensitive = 0
  self.CurrentId = Id
  self.CurrentData = Data
  local MarkName = Data.Name and Data.Name or ""
  self.IsVisible = true
  self:StopAllAnimations()
  self:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  self:PlayAnimation(self.Auto_In)
  self.Btn_Erase:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  local avatar = GWorld:GetAvatar()
  self.Text_MarkNum:SetText(GText("UI_RegionMap_MarkedNum") .. avatar:GetCurrentMarkCount())
  self.Com_Input_Light:Init({
    Owner = self,
    TextLimit = self.MaxNum,
    HintText = MarkHitName,
    OnTextChanged = self.OnTextChanged
  })
  self.Com_Input_Light:SetText(MarkName)
  self.LastText = MarkName
  if "" == MarkName then
    self.Switch_Button:SetActiveWidgetIndex(0)
  else
    self.Switch_Button:SetActiveWidgetIndex(1)
  end
  if TypeId then
    self:OnTypeClicked(TypeId)
    self.TypeTable[TypeId]:StopAllAnimations()
    self.TypeTable[TypeId]:PlayAnimation(self.TypeTable[TypeId].Click)
    self.TypeTable[TypeId]:SetFocus()
  else
    self:OnTypeClicked(self.DefaultTypeId)
    self.TypeTable[self.DefaultTypeId]:StopAllAnimations()
    self.TypeTable[self.DefaultTypeId]:PlayAnimation(self.TypeTable[self.DefaultTypeId].Click)
    self.TypeTable[self.DefaultTypeId]:SetFocus()
  end
  if Tracking then
    self.Btn_Track:SetText(GText("UI_RegionMap_Untrack"))
  else
    self.Btn_Track:SetText(GText("UI_RegionMap_Track"))
  end
  if RegionIcon then
    local Icon = LoadObject(RegionIcon)
    if Icon then
      self.Icon_Camp:SetBrushResourceObject(Icon)
    end
  end
end

function M:Close(NeedCheck)
  if not self.IsVisible then
    return
  end
  self.IsVisible = false
  self:StopAllAnimations()
  self:PlayAnimation(self.Auto_Out)
  self.IsNewMark = false
  self:OnMarkNameConfirm(NeedCheck)
end

function M:OnAnimationFinished(Animation)
  if Animation == self.Auto_Out then
    self:SetVisibility(ESlateVisibility.Collapsed)
  end
end

function M:OnMarkDeleteSound()
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_cancel", "", nil)
end

function M:OnMarkDelete()
  self.Parent:DeleteMark()
end

function M:OnMarkConfirm()
  self.IsNewMark = true
  self:OnMarkNameConfirm(true)
end

function M:OnMarkTrack()
  self.Parent:OnMarkTrack()
end

function M:OnMarkNameConfirm(NeedCheck)
  self.ConfirmName = self.Com_Input_Light:GetText()
  if not self.ConfirmName or self.ConfirmName == "" then
    self.ConfirmName = self.Com_Input_Light.Text_Input.HintText
  end
  if NeedCheck then
    self:CheckSensitive()
  else
    self.Parent:OnMarkNameConfirm(nil, nil)
  end
end

function M:OnTypeClicked(TypeId)
  self.TypeTable[TypeId].IsSelected = true
  if self.LastMarkType and self.LastMarkType ~= self.TypeTable[TypeId] then
    self.LastMarkType.IsSelected = false
    self.LastMarkType:PlayAnimation(self.LastMarkType.Normal)
  end
  self.LastMarkType = self.TypeTable[TypeId]
  self.Parent:ChangeMarkType(TypeId, self.TypeId2Image[TypeId])
end

function M:SetDefaultType()
  if self.DefaultTypeId then
    self:OnTypeClicked(self.DefaultTypeId)
  end
end

function M:CheckCharInAnyRange(NewName, i, AllRange)
  local CharByte1 = string.byte(NewName, i)
  local CharByte2 = string.byte(NewName, i + 1)
  local CharByte3 = string.byte(NewName, i + 2)
  for i, Range in pairs(AllRange) do
    if self:ContainsCJK(CharByte1, CharByte2, CharByte3, Range) then
      return true
    end
  end
  return false
end

function M:ContainsCJK(CharByte1, CharByte2, CharByte3, Range)
  local ByteNum = CharByte1 * 65536.0 + CharByte2 * 256.0 + CharByte3
  if ByteNum >= Range[1] and ByteNum <= Range[2] then
    return true
  end
  return false
end

function M:OnTextChanged(NewName)
  local SpaceNum = 0
  NewName, SpaceNum = string.gsub(NewName, "%s", "")
  if SpaceNum > 0 then
    self.Com_Input_Light:SetText(NewName)
    return
  end
  if "" == NewName then
    return
  end
  local NameLength, RealName, IllegalRange, ErrorType = self:CheckNameLegal(NewName)
  RealName = string.gsub(RealName, "%s", "")
  local subName = ""
  if -2 == ErrorType then
    local lastIndex = 1
    for _, temp in pairs(IllegalRange) do
      subName = subName .. string.sub(RealName, lastIndex, temp[1] - 1)
      lastIndex = temp[2] + 1
    end
    subName = subName .. string.sub(RealName, lastIndex)
    self.Com_Input_Light:SetText(subName)
  else
    subName = RealName
  end
  if NameLength >= self.MaxNum then
    self.Com_Input_Light:SetText(subName)
  end
end

function M:CheckSensitive()
  self.CurrentSensitive = self.CurrentSensitive + 1
  self.SaveSensitive = self.CurrentSensitive
  HeroUSDKUtils.CheckStringSensitive(self, self.ConfirmName, self.OnNameSensitive, self.OnNameNotSensitive)
end

function M:OnNameSensitive()
  UIManager(self):ShowUITip("CommonToastMain", GText("UI_REGISTER_BANNEDINPUT"))
end

function M:OnNameNotSensitive()
  if self.SaveSensitive ~= self.CurrentSensitive then
    return
  end
  if self.IsNewMark then
    self.Parent:OnMarkConfirm(self.ConfirmName)
  else
    self.CurrentData.Name = self.ConfirmName
    self.Parent:OnMarkNameConfirm(self.CurrentId, self.CurrentData)
  end
end

local CjkUTFRanges = {
  {14844070, 14844070},
  {14844051, 14844061},
  {14909569, 14909589},
  {14989440, 15711391},
  {15380608, 15572655},
  {14909568, 14913471}
}
local DoubleByteRanges = {
  {49847, 49847}
}

function M:CheckNameLegal(NewName)
  local IllegalRange = {}
  local SpaceRange = {}
  local RealName = NewName
  local NameLength = 0
  local ErrorType = 0
  local i = 1
  while true do
    local CurByte = string.byte(NewName, i)
    local ByteNum = 1
    if CurByte >= 240 then
      ByteNum = 4
      table.insert(IllegalRange, {
        i,
        i + 3
      })
    elseif CurByte >= 224 then
      if not self:CheckCharInAnyRange(NewName, i, CjkUTFRanges) then
        table.insert(IllegalRange, {
          i,
          i + 2
        })
      end
      ByteNum = 3
    elseif CurByte >= 192 then
      ByteNum = 2
      if not self:CheckDoubleCharInAnyRange(NewName, i, DoubleByteRanges) then
        table.insert(IllegalRange, {
          i,
          i + 1
        })
      end
    else
      if CurByte < 32 or CurByte > 126 then
        table.insert(IllegalRange, {i, i})
      end
      ByteNum = 1
    end
    NameLength = NameLength + 1
    if NameLength > self.MaxNum then
      RealName = string.sub(NewName, 1, i - 1)
      break
    end
    i = i + ByteNum
    if i > #NewName then
      break
    end
  end
  if #IllegalRange > 0 then
    ErrorType = -2
  end
  return NameLength, RealName, IllegalRange, ErrorType
end

function M:CheckDoubleCharInAnyRange(NewName, i, AllRange)
  local CharByte1 = string.byte(NewName, i)
  local CharByte2 = string.byte(NewName, i + 1)
  for i, Range in pairs(AllRange) do
    if self:ContainsDoubleChar(CharByte1, CharByte2, Range) then
      return true
    end
  end
  return false
end

function M:ContainsDoubleChar(CharByte1, CharByte2, Range)
  local ByteNum = CharByte1 * 256.0 + CharByte2
  if ByteNum >= Range[1] and ByteNum <= Range[2] then
    return true
  end
  return false
end

function M:OnKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local SwitchIndex = self.Switch_Button:GetActiveWidgetIndex()
  if InKeyName == UIConst.GamePadKey.FaceButtonBottom then
    if 0 == SwitchIndex then
      self:OnMarkConfirm()
    elseif 1 == SwitchIndex then
      self:OnMarkTrack()
    end
    return UWidgetBlueprintLibrary.Handled()
  elseif InKeyName == UIConst.GamePadKey.FaceButtonTop then
    if 1 == SwitchIndex then
      self:OnMarkDelete()
      UWidgetBlueprintLibrary.Handled()
    end
  elseif "Escape" == InKeyName or InKeyName == UIConst.GamePadKey.FaceButtonRight then
    self.Parent:ClosePanel()
  elseif InKeyName == UIConst.GamePadKey.FaceButtonLeft then
    self.Com_Input_Light:SetFocus()
  elseif InKeyName == UIConst.GamePadKey.LeftThumb then
    self.Com_Input_Light:SetText("")
    self.Com_Input_Light:SetFocus()
  end
  return UWidgetBlueprintLibrary.Handled()
end

function M:OnUpdateUIStyleByInputTypeChange(CurInputDevice, CurGamepadName)
  if CurInputDevice == ECommonInputType.Gamepad then
    self.LastMarkType:SetFocus()
  else
  end
end

function M:OnFocusReceived(MyGeometry, InFocusEvent)
  if self.LastMarkType then
    self.LastMarkType:SetFocus()
  end
  return UWidgetBlueprintLibrary.Handled()
end

return M
