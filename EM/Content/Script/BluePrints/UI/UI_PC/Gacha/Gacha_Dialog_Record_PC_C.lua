require("UnLua")
local G = Class("BluePrints.UI.UI_PC.Common.Common_Dialog.Common_Dialog_ContentBase")

function G:Construct()
  self.Super.Construct(self)
  self.PerPageRecordCount = 10
  self.Text_Designation:SetText(GText("UI_SkinGacha_Result"))
  self.Text_Quality:SetText(GText("UI_RARITY_NAME"))
  self.Text_Type:SetText(GText("UI_SkinGacha_Type"))
  self.Text_Time:SetText(GText("UI_SkinGacha_Time"))
  self.Text_GachaHistory_Empry:SetText(GText("UI_GACHA_NOHISTORY"))
  
  function self.Btn_Before.SoundFunc()
    AudioManager(self):PlayUISound(self, "event:/ui/common/click_level_03", nil, nil)
  end
  
  function self.Btn_Next.SoundFunc()
    AudioManager(self):PlayUISound(self, "event:/ui/common/click_level_03", nil, nil)
  end
  
  self.Btn_Before:BindEventOnClicked(self, self.OnFlipBefore)
  self.Btn_Next:BindEventOnClicked(self, self.OnFlipNext)
  self.Key_ImgLeft:CreateGamepadKey(UIConst.GamePadImgKey.DPadLeft)
  self.Key_ImgRight:CreateGamepadKey(UIConst.GamePadImgKey.DPadRight)
end

function G:InitContent(Params, PopupData, Owner)
  self.Super.InitContent(self, Params, PopupData, Owner)
  self:BindDialogEvent(DialogEvent.OnTitleTabSelected, self.OnTabSelected)
  self.Params = Params
  self.RecordTable = Params.RecordTable
  self.NowGachaId = Params.CurrentGachaId
  self:InitListHistory()
end

function G:InitGamepadView()
  self.WS_Left:SetActiveWidgetIndex(1)
  self.WS_Right:SetActiveWidgetIndex(1)
end

function G:InitKeyboardView()
  self.WS_Left:SetActiveWidgetIndex(0)
  self.WS_Right:SetActiveWidgetIndex(0)
end

function G:OnContentKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local IsEventHandled = false
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) then
    IsEventHandled = self:OnGamePadDown(InKeyName)
  end
  return IsEventHandled
end

function G:OnGamePadDown(InKeyName)
  local IsEventHandled = false
  if InKeyName == UIConst.GamePadKey.DPadLeft then
    self:OnFlipBefore()
    IsEventHandled = true
  elseif InKeyName == UIConst.GamePadKey.DPadRight then
    self:OnFlipNext()
    IsEventHandled = true
  end
  return IsEventHandled
end

function G:OnTabSelected(TabWidget)
  self.NowTabId = TabWidget.Idx
  self.NowGachaId = self.Params.TabMapGacha[self.NowTabId]
  self:InitListHistory()
end

function G:OnFlipBefore()
  if 1 == self.PageIndex then
    return
  end
  if self.PageIndex == self.PageMax then
    self.Btn_Next:ForbidBtn(false)
  end
  self.PageIndex = self.PageIndex - 1
  if 1 == self.PageIndex then
    self.Btn_Before:ForbidBtn(true)
  end
  self.Text_Page:SetText(self.PageIndex .. "/" .. self.PageMax)
  self:UpdateListRecord()
end

function G:OnFlipNext()
  if self.PageIndex == self.PageMax then
    return
  end
  if 1 == self.PageIndex then
    self.Btn_Before:ForbidBtn(false)
  end
  self.PageIndex = self.PageIndex + 1
  if self.PageIndex == self.PageMax then
    self.Btn_Next:ForbidBtn(true)
  end
  self.Text_Page:SetText(self.PageIndex .. "/" .. self.PageMax)
  self:UpdateListRecord()
end

function G:InitListHistory()
  local RecordData = self.RecordTable[self.NowGachaId]
  if not RecordData then
    self.Group_Normal:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.Group_Empty:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  else
    self.Group_Normal:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    self.Group_Empty:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.PageIndex = 1
    self.PageMax = (#RecordData + self.PerPageRecordCount - 1) // self.PerPageRecordCount
    self.Btn_Before:ForbidBtn(false)
    self.Btn_Next:ForbidBtn(false)
    if self.PageIndex == self.PageMax then
      self.Btn_Before:SetVisibility(UE4.ESlateVisibility.Collapsed)
      self.Btn_Next:SetVisibility(UE4.ESlateVisibility.Collapsed)
      self.Text_Page:SetText(self.PageMax)
    else
      self.Btn_Before:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
      self.Btn_Next:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
      self.Text_Page:SetText(self.PageIndex .. "/" .. self.PageMax)
      self.Btn_Before:ForbidBtn(true)
    end
    self:UpdateListRecord()
  end
end

function G:UpdateListRecord()
  local RecordData = self:GetGachaRecord((self.PageIndex - 1) * self.PerPageRecordCount, self.PerPageRecordCount)
  self.List_History:ClearListItems()
  for key, value in pairs(RecordData) do
    local Content = NewObject(UIUtils.GetCommonItemContentClass())
    Content.Id = key
    Content.GachaId = value.GachaId
    Content.ItemType = value.ItemType
    Content.ItemId = value.ItemId
    Content.GachaType = value.GachaType
    Content.GachaTime = value.Time
    Content.Count = value.Count
    self.List_History:AddItem(Content)
  end
  self.List_History:ScrollIndexIntoView(0)
end

function G:GetGachaRecord(StartIndex, Limit)
  StartIndex = StartIndex or 0
  local RecordData = self.RecordTable[self.NowGachaId]
  local RecordLength = #RecordData
  Limit = Limit or RecordLength
  if RecordLength < StartIndex + Limit then
    Limit = RecordLength - StartIndex
  end
  local Result = {}
  for i = StartIndex + 1, Limit + StartIndex do
    if RecordData[i] then
      table.insert(Result, RecordData[i])
    end
  end
  return Result
end

return G
