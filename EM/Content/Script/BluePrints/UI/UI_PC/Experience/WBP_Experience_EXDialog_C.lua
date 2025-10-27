require("UnLua")
local M = Class({
  "BluePrints.UI.UI_PC.Common.Common_Dialog.Common_Dialog_ContentBase"
})

function M:Construct()
  self.PanelHeight = 340
  self.ListView_Value:SetScrollBarVisibility(ESlateVisibility.Hidden)
  self.ListView_Value:SetControlScrollbarInside(true)
  self.Avatar = GWorld:GetAvatar()
  self.Text_ExpNow:SetText(GText("PlayerLevel_ExpNow"))
  self.Text_LV:SetText(self.Avatar.Level)
  local CurrentExp = self.Avatar.Exp
  if CurrentExp then
    self.Exp_Now:SetText(tostring(CurrentExp))
  end
  local LevelInfo = DataMgr.PlayerLevelUp[self.Avatar.Level]
  local MaxExp
  if LevelInfo then
    MaxExp = LevelInfo.PlayerLevelMaxExp
  end
  if MaxExp then
    self.Exp_Total:SetText(tostring(MaxExp))
  end
  if MaxExp and CurrentExp then
    local Percent = CurrentExp / MaxExp
    if Percent > 1 then
      Percent = 1
    end
    self.Progress_Exp:SetPercent(Percent)
  end
  local GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(self)
  if IsValid(GameInputModeSubsystem) then
    self:RefreshOpInfoByInputDevice(GameInputModeSubsystem:GetCurrentInputType())
    GameInputModeSubsystem.OnInputMethodChanged:Add(self, self.RefreshOpInfoByInputDevice)
  end
end

function M:Destruct()
  local GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(self)
  if IsValid(GameInputModeSubsystem) then
    self:RefreshOpInfoByInputDevice(GameInputModeSubsystem:GetCurrentInputType())
    GameInputModeSubsystem.OnInputMethodChanged:Remove(self, self.RefreshOpInfoByInputDevice)
  end
end

function M:InitContent(Params, PopupData, Owner)
  self.Owner = Owner
  self.Parent = Params.Parent
  self:Init()
end

function M:Init()
  self:InitList()
end

function M:InitList()
  self.ListView_Value:ClearListItems()
  local PlayerExpSource = {}
  local PlayerExpSubSource = {}
  for _, SourceInfo in pairs(DataMgr.PlayerExpSource) do
    table.insert(PlayerExpSource, SourceInfo)
  end
  table.sort(PlayerExpSource, function(a, b)
    return a.Sequence > b.Sequence
  end)
  for _, SubSourceInfo in pairs(DataMgr.PlayerExpSubSource) do
    table.insert(PlayerExpSubSource, SubSourceInfo)
  end
  table.sort(PlayerExpSubSource, function(a, b)
    return a.Sequence > b.Sequence
  end)
  local CollectRewardExpRecord = self:CollectRewardExp()
  for Index, SourceInfo in pairs(PlayerExpSource) do
    local Content = NewObject(UIUtils.GetCommonItemContentClass())
    Content.ID = SourceInfo.ID
    Content.SourceName = SourceInfo.SourceName
    Content.CollectRewardExpRecord = CollectRewardExpRecord
    self.ListView_Value:AddItem(Content)
  end
  self:AddTimer(0.1, function()
    self.ListView_Value:ScrollToTop()
    local AllEntryHeight = 0
    local DisplayedEntries = self.ListView_Value:GetDisplayedEntryWidgets()
    for i = 1, DisplayedEntries:Length() do
      local Entry = DisplayedEntries:GetRef(i)
      local EntryHeight = Entry:GetDesiredSize().Y
      AllEntryHeight = AllEntryHeight + EntryHeight
    end
    if AllEntryHeight > self.PanelHeight then
      self.NeedShowTip = true
    else
      self.NeedShowTip = false
    end
    self:ShowGamepadScrollBtn(self.NeedShowTip)
  end)
end

function M:CollectRewardExp()
  local result = {}
  local record = self.Avatar.CollectRewardExpRecord
  if type(record) ~= "table" then
    return result
  end
  for path, _ in pairs(record) do
    local excelName, rest = tostring(path):match("^([^.]+)%.?(.*)$")
    if excelName and "" ~= excelName then
      local excel = DataMgr and DataMgr[excelName]
      if rest and "" ~= rest then
        for key in rest:gmatch("[^.]+") do
          if type(excel) ~= "table" then
            excel = nil
            break
          end
          local v = excel[key]
          if nil == v then
            local n = tonumber(key)
            if n then
              v = excel[n]
            end
            if "WeaponCardLevel" == excelName and nil == v then
              break
            end
          end
          excel = v
        end
      end
      if type(excel) == "table" then
        local exp = tonumber(excel.CollectRewardExp)
        if exp and exp > 0 then
          local bucket = result[excelName]
          if not bucket then
            bucket = {Count = 0, Exp = 0}
            result[excelName] = bucket
          end
          bucket.Count = bucket.Count + 1
          bucket.Exp = bucket.Exp + exp
        end
      end
    end
  end
  local PlayerExpRecord = self.Avatar.PlayerExpRecord
  if PlayerExpRecord[2000] then
    result.Daily = {}
    result.Daily.Exp = PlayerExpRecord[2000]
  end
  if PlayerExpRecord[2001] then
    result.Quest = {}
    result.Quest.Exp = PlayerExpRecord[2001]
  end
  return result
end

function M:ShowGamepadScrollBtn(bShow)
  if bShow then
    if self.GamepadScrollBtnIndex then
      return
    end
    self.GamepadScrollBtnIndex = self:ShowGamepadShortcutBtn({
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "RV"}
      },
      Desc = GText("UI_Controller_Slide")
    })
  elseif self.GamepadScrollBtnIndex then
    self:HideGamepadShortcut(self.GamepadScrollBtnIndex)
    self.GamepadScrollBtnIndex = nil
  end
end

function M:OnContentAnalogValueChanged(MyGeometry, InAnalogInputEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InAnalogInputEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if InKeyName == UIConst.GamePadKey.RightAnalogY then
    local DeltaOffset = UKismetInputLibrary.GetAnalogValue(InAnalogInputEvent)
    local CurrentOffset = self.ListView_Value:GetScrollOffset()
    local NextOffset = math.clamp(CurrentOffset - DeltaOffset, 0, UIUtils.GetMaxScrollOffsetOfListView(self.ListView_Value))
    self.ListView_Value:SetScrollOffset(NextOffset)
    return UIUtils.Handled
  end
  return UIUtils.Unhandled
end

function M:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  local IsUseKeyAndMouse = CurInputDevice == ECommonInputType.MouseAndKeyboard
  if IsUseKeyAndMouse then
    self:InitKeyBoardView()
  else
    self:InitGamepadView()
  end
end

function M:InitGamepadView()
  self:SetFocus()
end

function M:InitKeyBoardView()
  self:SetFocus()
end

return M
