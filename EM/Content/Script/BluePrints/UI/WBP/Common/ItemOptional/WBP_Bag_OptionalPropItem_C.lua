require("UnLua")
local M = Class("BluePrints.UI.BP_UIState_C")

function M:Construct()
end

function M:Destruct()
end

function M:OnListItemObjectSet(Content)
  self:Init(Content)
  self:InitListenEvent()
end

function M:Init(Content)
  if not Content.ItemType then
    return
  end
  if not self._components then
    if Content.ItemType == "ResourcePack" then
    end
    AssembleComponents(self)
  end
  self.ChooseCallback = Content.ChooseCallback
  self.ParentWidget = Content.ParentWidget
  self.ItemType = Content.ItemType
  self.ChooseDataInfo = {
    ResourceId = Content.ResourceId,
    OptionalId = Content.OptionalId,
    ChooseId = Content.Id,
    ChooseIndex = Content.ChooseIndex,
    ChooseName = Content.Name,
    ConsumeCount = Content.ParentWidget.Id2ConsumeCount[Content.Id],
    ChooseWidget = self
  }
  self.Content = Content
  self.Count = Content.Count
  self.ChooseId = Content.Id
  self.OptCount = Content.OptCount
  self.StuffCount = Content.StuffCount
  self.MaxLimit = Content.OptCount - Content.ParentWidget.CurrentCount + self.ChooseDataInfo.ConsumeCount
  self:InitCommonView(Content)
end

function M:InitListenEvent()
  self:AddDispatcher(EventID.OnUpdateNumInputLimit, self, self.UpdateNumInputLimit)
end

function M:InitCommonView(Content)
  self.Text_Name:SetText(Content.Name)
  self.Text_Hold:SetText(GText("UI_Bag_Sellconfirm_Hold"))
  self.Text_Num:SetText(self.StuffCount)
  local PropContent = NewObject(UIUtils.GetCommonItemContentClass())
  PropContent.ParentWidget = self
  PropContent.Id = Content.Id
  PropContent.Rarity = Content.Rarity
  PropContent.ItemType = CommonConst.DataType.Resource
  PropContent.Name = Content.Name
  PropContent.Count = Content.Count
  PropContent.IsShowDetails = true
  PropContent.Icon = Content.Icon
  PropContent.HandleMouseDown = true
  PropContent.OnMenuOpenChangedEvents = {
    Obj = self,
    Callback = self.OnMenuOpenChangedEvents
  }
  self.Item_Gift:Init(PropContent)
  self:AddTimer(0.01, function()
    self:InitComInput()
  end)
end

function M:InitComInput()
  if self.bIsInited then
    return
  end
  self.Com_NumInput:Init({
    MaxValue = self.MaxLimit,
    MinValue = 0,
    InitValue = self.ChooseDataInfo.ConsumeCount,
    MinusBtnCallback = self.OnClickMinus,
    AddBtnCallback = self.OnClickAdd,
    MinBtnCallback = self.OnClickMin,
    MaxBtnCallback = self.OnClickMax,
    EnableMiniBtn = true,
    EnableMaxBtn = true,
    IsNotAllowTextFieldInput = true,
    SoundResPath = {
      Minus = "event:/ui/common/click_btn_minus",
      Max = "event:/ui/common/click_btn_addMulti",
      Add = "event:/ui/common/click_btn_add",
      Mini = "event:/ui/common/click_btn_addMulti"
    },
    OwnerPanel = self
  })
  self.Com_NumInput:SetIsForbidStyleUpdate(true)
  self.Com_NumInput:UpdateUIStyleInPlatform(true)
  self.bIsInited = true
end

function M:OnClickMinus()
  self.ChooseDataInfo.ConsumeCount = self.Com_NumInput.CurInputNumber
  if type(self.ChooseCallback) == "function" then
    self.ChooseCallback(self.ParentWidget, true, self.ChooseDataInfo)
  end
  self.ParentWidget.CurrentCount = self.ParentWidget.CurrentCount - 1
  self.ParentWidget:RefreshDialogTip()
  self.ParentWidget.Id2ConsumeCount[self.ChooseId] = self.ChooseDataInfo.ConsumeCount
  EventManager:FireEvent(EventID.OnUpdateNumInputLimit, self.ChooseId, self.OptCount - self.ParentWidget.CurrentCount, 0, true)
end

function M:OnClickAdd()
  if self.ParentWidget.CurrentCount >= self.OptCount then
    return
  end
  self.ChooseDataInfo.ConsumeCount = self.Com_NumInput.CurInputNumber
  if type(self.ChooseCallback) == "function" then
    self.ChooseCallback(self.ParentWidget, true, self.ChooseDataInfo)
  end
  self.ParentWidget.CurrentCount = self.ParentWidget.CurrentCount + 1
  self.ParentWidget:RefreshDialogTip()
  self.ParentWidget.Id2ConsumeCount[self.ChooseId] = self.ChooseDataInfo.ConsumeCount
  EventManager:FireEvent(EventID.OnUpdateNumInputLimit, self.ChooseId, self.OptCount - self.ParentWidget.CurrentCount, 0, true)
end

function M:OnClickMin()
  local Value = self.ChooseDataInfo.ConsumeCount
  self.Com_NumInput.CurInputNumber = 0
  self.ChooseDataInfo.ConsumeCount = 0
  if type(self.ChooseCallback) == "function" then
    self.ChooseCallback(self.ParentWidget, true, self.ChooseDataInfo)
  end
  self.ParentWidget.CurrentCount = self.ParentWidget.CurrentCount - Value
  self.ParentWidget:RefreshDialogTip()
  self.ParentWidget.Id2ConsumeCount[self.ChooseId] = self.ChooseDataInfo.ConsumeCount
  EventManager:FireEvent(EventID.OnUpdateNumInputLimit, self.ChooseId, self.OptCount - self.ParentWidget.CurrentCount, 0, true)
end

function M:OnClickMax()
  if self.ParentWidget.CurrentCount >= self.OptCount then
    return
  end
  local Value = self.OptCount - self.ParentWidget.CurrentCount + self.ChooseDataInfo.ConsumeCount
  self.Com_NumInput.CurInputNumber = Value
  self.ChooseDataInfo.ConsumeCount = Value
  if type(self.ChooseCallback) == "function" then
    self.ChooseCallback(self.ParentWidget, true, self.ChooseDataInfo)
  end
  self.ParentWidget.CurrentCount = self.OptCount
  self.ParentWidget:RefreshDialogTip()
  self.ParentWidget.Id2ConsumeCount[self.ChooseId] = self.ChooseDataInfo.ConsumeCount
  EventManager:FireEvent(EventID.OnUpdateNumInputLimit, self.ChooseId, self.OptCount - self.ParentWidget.CurrentCount, 0, true)
end

function M:OnMenuOpenChangedEvents(bIsOpen)
  self.ParentWidget:OnMenuOpenChangedEvents(bIsOpen)
  if not bIsOpen then
    local CurInputDevice = self.GameInputModeSubsystem:GetCurrentInputType()
    if CurInputDevice == ECommonInputType.Gamepad then
      self.Com_List:PlayAnimation(self.Com_List.Hover)
    end
  end
end

function M:OnKeyDownEvent(InKey)
  local IsEventHandled = self.Com_NumInput:Handle_KeyEventOnGamePad(InKey)
  return IsEventHandled
end

function M:OnFocusReceived(MyGeometry, InFocusEvent)
  local CurInputDevice = self.GameInputModeSubsystem:GetCurrentInputType()
  if CurInputDevice == ECommonInputType.Gamepad then
    self.Com_List:PlayAnimation(self.Com_List.Hover)
    local CurGamepadName = self.GameInputModeSubsystem:GetCurrentGamepadName()
    self.Com_NumInput:UpdateUIStyleInPlatform(false, CurGamepadName)
    self.ParentWidget.LastFocusWidget = self
  end
  return true
end

function M:OnFocusLost(InFocusEvent)
  self.Com_List:PlayAnimation(self.Com_List.UnHover)
  self.Com_NumInput:UpdateUIStyleInPlatform(true)
end

function M:UpdateNumInputLimit(Id, MaxValue, MinValue, bRefresh)
  if Id == self.ChooseId then
    return
  end
  self.Com_NumInput:OverrideValueLimit(self.ChooseDataInfo.ConsumeCount, MaxValue + self.ChooseDataInfo.ConsumeCount, MinValue, bRefresh)
end

return M
