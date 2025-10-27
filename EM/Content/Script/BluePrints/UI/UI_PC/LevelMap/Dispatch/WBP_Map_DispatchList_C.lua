require("UnLua")
local M = Class({
  "BluePrints.UI.BP_UIState_C"
})
local TimeUtils = require("Utils.TimeUtils")

function M:Initialize(Initializer)
  self.Super.Initialize(self)
  self.DispatchList = {}
  self.Owner = nil
  self.RegionDispatchList = {}
  self.RegionList = {}
  self.SuccessDispatchList = {}
  self.DispatchItem = nil
  self.SortList = {}
  self.RegionId = 1
end

function M:Construct()
  M.Super.Construct(self)
  self.Btn_Close.Btn_Close.AudioEventPath = "event:/ui/common/click_btn_return"
  self.Btn_Reward.Button_Area.OnClicked:Add(self, self.OnRewardClick)
  self.Btn_Close.Btn_Close.OnClicked:Add(self, self.Close)
  self.List_Dispatch.BP_OnItemSelectionChanged:Add(self, self.OnListItemSelectionChanged)
  EventManager:AddEvent(EventID.GetAllDispatchReward, self, self.GetAllDispatchReward)
  EventManager:AddEvent(EventID.ChangeDispatchItem, self, self.ChangeDispatchItem)
  EventManager:AddEvent(EventID.OnDispatchExistingComplete, self, self.OnDispatchExistingComplete)
  EventManager:AddEvent(EventID.OnDispatchComplete, self, self.OnDispatchComplete)
  EventManager:AddEvent(EventID.OnDispatchListCoolingComplete, self, self.OnDispatchListCoolingComplete)
end

function M:Destruct()
  M.Super.Destruct(self)
  self.List_Dispatch.BP_OnItemSelectionChanged:Clear()
  self.Btn_Reward.Button_Area.OnClicked:Remove(self, self.OnRewardClick)
  self.Btn_Close.Btn_Close.OnClicked:Remove(self, self.Close)
  EventManager:RemoveEvent(EventID.GetAllDispatchReward, self)
  EventManager:RemoveEvent(EventID.ChangeDispatchItem, self)
  EventManager:RemoveEvent(EventID.OnDispatchExistingComplete, self)
  EventManager:RemoveEvent(EventID.OnDispatchComplete, self)
  EventManager:RemoveEvent(EventID.OnDispatchListCoolingComplete, self)
  self.GameInputModeSubsystem.OnInputMethodChanged:Remove(self, self.OnUpdateUIStyleByInputTypeChange)
  self.DispatchList = {}
  self:RemoveTimer("CoolingTimeTimer")
end

function M:InitDispatch(Owner)
  self.Owner = Owner
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
  self.GameInputModeSubsystem.OnInputMethodChanged:Add(self, self.OnUpdateUIStyleByInputTypeChange)
  self:PlayAnimation(self.In)
  AudioManager(self):PlayUISound(self, "event:/ui/common/sub_panel_expand", "DispatchOpen", nil)
  self.Text_Title:SetText(GText("UI_Disptach_List"))
  self.List_Sort.Text_Filterlist:SetText(GText("UI_Disptach_AllRegion"))
  local Res = -1 == self.Owner.DispatchId
  self:UpdateDispatch(Res)
  self:InitSortList()
  self.Btn_Reward:SetText(GText("UI_Mail_Recieveall"))
  self:SetFocus()
  self:SetNavigationRuleBase(EUINavigation.Right, EUINavigationRule.Stop)
  self:SetNavigationRuleBase(EUINavigation.Left, EUINavigationRule.Stop)
  self.List_Sort:BindOnRemovedFromFocusPathEvent(self, function()
    if not self.Owner.DispatchDetail then
      return
    end
    self.Owner.DispatchDetail:ShowPadUI(self.UsingGamepad)
  end)
  self:OnUpdateUIStyleByInputTypeChange(self.GameInputModeSubsystem:GetCurrentInputType(), self.GameInputModeSubsystem:GetCurrentGamepadName())
end

function M:InitSortList()
  self.SortList = {}
  table.insert(self.SortList, "UI_Disptach_AllRegion")
  for _, RegionId in ipairs(self.RegionList) do
    if 1 ~= RegionId then
      local RegionName = DataMgr.Region[RegionId].RegionName
      table.insert(self.SortList, RegionName)
    end
  end
  self.List_Sort:Init(self.SortList, "LS", self)
  self.List_Sort:BindEventOnSelectionsChanged(self, self.OnSelectionsChanged)
end

function M:RefreshDispatchList(DispatchList, IsFirst)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  self.SuccessDispatchList = {}
  for _, Id in pairs(DispatchList) do
    local Dispatch = Avatar.Dispatches[Id]
    if Dispatch.State == CommonConst.DispatchState.Success or Dispatch.State == CommonConst.DispatchState.Perfect or Dispatch.State == CommonConst.DispatchState.Qualified or Dispatch.State == CommonConst.DispatchState.Disqualified then
      table.insert(self.SuccessDispatchList, Id)
    end
  end
  if next(self.SuccessDispatchList) then
    self.Btn_Reward:ForbidBtn(false)
  else
    self.Btn_Reward:ForbidBtn(true)
  end
  self:InitPCKeyInfo()
  local Res = self:SortDispatchList(DispatchList)
  self:FillDispatchList(Res)
  if #DispatchList <= 0 and self.Owner.DispatchDetail then
    self.Owner.DispatchDetail:RealClose()
  end
  self:AddTimer(0.01, function()
    if IsFirst then
      local Item = self.List_Dispatch:GetItemAt(0)
      if nil ~= Item and Item.UI then
        if self.UsingGamepad then
          self.List_Dispatch:NavigateToIndex(0)
        else
          self.List_Dispatch:NavigateToIndex(0)
          Item.UI:OnDispatchItemClick()
        end
      end
    elseif -1 ~= self.Owner.DispatchId then
      for _, Content in pairs(self.List_Dispatch:GetListItems()) do
        if Content.DispatchId == self.Owner.DispatchId then
          self.List_Dispatch:BP_NavigateToItem(Content)
          self.List_Dispatch:BP_SetSelectedItem(Content)
          return
        end
      end
    end
  end)
end

function M:GetAllDispatchData()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  self.RegionList = {}
  self.DispatchList = {}
  self.RegionDispatchList = {}
  self.SuccessDispatchList = {}
  table.insert(self.RegionList, 1)
  for Id, Dispatch in pairs(Avatar.Dispatches) do
    if Dispatch.State == CommonConst.DispatchState.Success or Dispatch.State == CommonConst.DispatchState.Perfect or Dispatch.State == CommonConst.DispatchState.Qualified or Dispatch.State == CommonConst.DispatchState.Disqualified then
      table.insert(self.DispatchList, Id)
      table.insert(self.SuccessDispatchList, Id)
      self.RegionDispatchList[Dispatch.RegionId] = self.RegionDispatchList[Dispatch.RegionId] or {}
      table.insert(self.RegionDispatchList[Dispatch.RegionId], Id)
      if CommonUtils.HasValue(self.RegionList, Dispatch.RegionId) == false then
        table.insert(self.RegionList, Dispatch.RegionId)
      end
    end
  end
  for _, DispatchListProp in ipairs(Avatar.CurrentDispatchList) do
    local Id = DispatchListProp:GetDispatchId()
    if -1 ~= Id and CommonUtils.HasValue(self.SuccessDispatchList, Id) == false then
      table.insert(self.DispatchList, Id)
      local Dispatch = Avatar.Dispatches[Id]
      self.RegionDispatchList[Dispatch.RegionId] = self.RegionDispatchList[Dispatch.RegionId] or {}
      table.insert(self.RegionDispatchList[Dispatch.RegionId], Id)
      if CommonUtils.HasValue(self.RegionList, Dispatch.RegionId) == false then
        table.insert(self.RegionList, Dispatch.RegionId)
      end
    end
  end
end

function M:OnRewardClick()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  Avatar:GetAllDispatchReward(self.SuccessDispatchList)
end

function M:RealClose()
  self:RemoveFromParent()
end

function M:Close()
  AudioManager(self):SetEventSoundParam(self, "DispatchOpen", {ToEnd = 1})
  self:BindToAnimationFinished(self.Out, function()
    self:RealClose()
    if self.Owner.DispatchDetail ~= nil then
      self.Owner.DispatchDetail:Close()
    end
    self.Owner:OnCloseDispatch()
  end)
  self:PlayAnimation(self.Out)
end

function M:PlayOut()
  self:BindToAnimationFinished(self.Out, function()
    self:Close()
    if self.Owner.DispatchDetail ~= nil then
      self.Owner.DispatchDetail:Close()
    end
    self.Owner:OnCloseDispatch()
  end)
  self:PlayAnimation(self.Out)
end

function M:OnSelectionsChanged(Index)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  self.RegionId = self.RegionList[Index]
  local DispatchList
  if 1 == self.RegionId then
    DispatchList = self.DispatchList
  else
    DispatchList = self.RegionDispatchList[self.RegionId]
  end
  if nil == DispatchList then
    return
  end
  self:RefreshDispatchList(DispatchList, true)
end

function M:FillDispatchList(DispatchList)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  self.List_Dispatch:ClearListItems()
  for _, Id in ipairs(DispatchList) do
    DebugPrint("Dispatch", Avatar.Dispatches[Id].State, Id)
    local Content = NewObject(UIUtils.GetCommonItemContentClass())
    Content.DispatchId = Id
    if Content.DispatchId == self.Owner.DispatchId then
      Content.IsClick = true
    else
      Content.IsClick = false
    end
    Content.Owner = self
    self.List_Dispatch:AddItem(Content)
  end
  self:AddTimer(0.01, function()
    local ListItemUIs = self.List_Dispatch:GetDisplayedEntryWidgets()
    local RestCount = UIUtils.GetListViewContentMaxCount(self.List_Dispatch, ListItemUIs) - ListItemUIs:Length()
    if RestCount <= 0 then
      return
    end
    for i = 1, RestCount do
      local Content = NewObject(UIUtils.GetCommonItemContentClass())
      Content.DispatchId = -1
      self.List_Dispatch:AddItem(Content)
    end
  end)
  if next(DispatchList) then
    self.WS_Type:SetActiveWidgetIndex(0)
    self.GameInputModeSubsystem:SetNavigateWidgetOpacity(1)
  else
    self.GameInputModeSubsystem:SetNavigateWidgetOpacity(0)
    self:InitPCKeyInfo()
    self.WS_Type:SetActiveWidgetIndex(1)
    self.Text_Empty:SetText(GText("UI_Dispatch_Toast_Nothing"))
    local Time = self:GetNextRefreshTime()
    if 9.223372036854776E18 == Time then
      self.HorizontalBox_0:SetVisibility(UE4.ESlateVisibility.Collapsed)
      return
    else
      self.HorizontalBox_0:SetVisibility(UE4.ESlateVisibility.Visible)
    end
    self:SetCoolingTime(Time)
  end
end

function M:SetCoolingTime(Time)
  self.CoolingTime = Time
  DebugPrint("lkkCoolingTime" .. self.CoolingTime)
  self.Text_Refresh:SetText(GText("UI_Dispatch_Toast_CountDown_2"))
  
  local function CoolingTime()
    local RemainTimeDict, TimeCount = UIUtils.GetLeftTimeStrStyle2(self.CoolingTime)
    self.Com_Time:SetTimeText(GText("UI_Dispatch_Toast_CountDown_1"), RemainTimeDict)
    self.Com_Time.Image_ClockIcon:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
  
  CoolingTime()
  self:AddTimer(1, CoolingTime, true, 0, "CoolingTimeTimer")
end

function M:GetNextRefreshTime()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  local Time = 9.223372036854776E18
  for _, DispatchListProp in ipairs(Avatar.CurrentDispatchList) do
    if DispatchListProp:IsCooling() then
      local CoolingTime = DispatchListProp:GetCoolingTime() + DataMgr.GlobalConstant.DispatchGCD.ConstantValue * 60
      Time = math.min(Time, CoolingTime)
      DebugPrint("lkkkkNextRefresh" .. CoolingTime)
    end
  end
  local DispatchTime = 9.223372036854776E18
  for Id, Dispatch in pairs(Avatar.Dispatches) do
    if Dispatch:IsCooling() then
      local CoolingTime = Dispatch:GetCoolingTime() + Dispatch.DispatchCD * 60
      DispatchTime = math.min(DispatchTime, CoolingTime)
      DebugPrint("lkkkkNextDispatchRefresh" .. CoolingTime)
    elseif Dispatch:GetDispatchState() == CommonConst.DispatchState.CanDispatch then
      DispatchTime = 9.223372036854776E18
      break
    end
  end
  local Res
  if 9.223372036854776E18 == Time then
    Res = DispatchTime
  elseif 9.223372036854776E18 == DispatchTime then
    Res = Time
  else
    Res = math.max(Time, DispatchTime)
  end
  return Res
end

function M:SortDispatchList(DispatchList)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  local Result = {}
  local SuccessList = {}
  local CanDispatch = {}
  local Dispatching = {}
  local Doing = {}
  local Unlock = {}
  for _, Id in ipairs(DispatchList) do
    local Dispatch = Avatar.Dispatches[Id]
    if CommonUtils.HasValue(self.SuccessDispatchList, Id) then
      table.insert(SuccessList, Id)
    elseif Dispatch.State == CommonConst.DispatchState.Unlock then
      table.insert(Unlock, Id)
    elseif Dispatch.State == CommonConst.DispatchState.Doing then
      if Dispatch.DispatchCharsList:Length() > 0 then
        table.insert(Dispatching, Id)
      else
        table.insert(Doing, Id)
      end
    elseif Dispatch.State == CommonConst.DispatchState.CanDispatch then
      table.insert(CanDispatch, Id)
    end
  end
  if #SuccessList > 0 then
    table.sort(SuccessList, function(a, b)
      return DataMgr.Dispatch[a].Rarity > DataMgr.Dispatch[b].Rarity
    end)
    for _, Id in ipairs(SuccessList) do
      table.insert(Result, Id)
    end
  end
  if #CanDispatch > 0 then
    table.sort(CanDispatch, function(a, b)
      return DataMgr.Dispatch[a].Rarity > DataMgr.Dispatch[b].Rarity
    end)
    for _, Id in ipairs(CanDispatch) do
      table.insert(Result, Id)
    end
  end
  if #Dispatching > 0 then
    table.sort(Dispatching, function(a, b)
      return DataMgr.Dispatch[a].Rarity > DataMgr.Dispatch[b].Rarity
    end)
    for _, Id in ipairs(Dispatching) do
      table.insert(Result, Id)
    end
  end
  if #Doing > 0 then
    table.sort(Doing, function(a, b)
      return DataMgr.Dispatch[a].Rarity > DataMgr.Dispatch[b].Rarity
    end)
    for _, Id in ipairs(Doing) do
      table.insert(Result, Id)
    end
  end
  if #Unlock > 0 then
    table.sort(Unlock, function(a, b)
      return DataMgr.Dispatch[a].Rarity > DataMgr.Dispatch[b].Rarity
    end)
    for _, Id in ipairs(Unlock) do
      table.insert(Result, Id)
    end
  end
  return Result
end

function M:UpdateDispatch(IsFirst)
  self:RemoveTimer("CoolingTimeTimer")
  self:GetAllDispatchData()
  local DispatchList
  if 1 == self.RegionId then
    self:InitSortList()
    DispatchList = self.DispatchList
  else
    DispatchList = self.RegionDispatchList[self.RegionId]
  end
  if nil == DispatchList then
    self:InitSortList()
    self:OnSelectionsChanged(1)
    return
  end
  self:RefreshDispatchList(DispatchList, IsFirst)
end

function M:GetAllDispatchReward(TotalReward)
  local function Callback()
    self:UpdateDispatch(true)
  end
  
  UIUtils.ShowGetItemPageAndOpenBagIfNeeded(nil, nil, nil, TotalReward, false, Callback, self, false)
end

function M:ChangeDispatchItem(Id)
  for _, Content in pairs(self.List_Dispatch:GetListItems()) do
    if Content.DispatchId == Id then
      self.List_Dispatch:BP_NavigateToItem(Content)
      self.List_Dispatch:BP_SetSelectedItem(Content)
      if Content.UI then
        Content.UI:OnDispatchItemClick()
      end
      return
    end
  end
end

function M:OnDispatchExistingComplete(Id)
  if self.Owner.DispatchAgentList then
    return
  end
  DebugPrint("lkkkOnDispatchExistingComplete" .. Id)
  for _, Content in pairs(self.List_Dispatch:GetListItems()) do
    if Content.DispatchId == Id then
      self.List_Dispatch:RemoveItem(Content)
      if self.Owner.DispatchDetail and self.Owner.DispatchDetail.Dispatch.DispatchId == Id then
        self:AddTimer(0.1, function()
          self:UpdateDispatch(true)
        end)
      else
        self:AddTimer(0.1, function()
          self:UpdateDispatch(false)
        end)
      end
      return
    end
  end
end

function M:CheckListEmpty()
  local IsEmpty = true
  for _, Content in pairs(self.List_Dispatch:GetListItems()) do
    if -1 ~= Content.UI.DispatchId then
      IsEmpty = false
    end
  end
  return IsEmpty
end

function M:OnDispatchComplete(Id)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  local Dispatch = Avatar.Dispatches[Id]
  DebugPrint("lkkkOnDispatchComplete" .. Id .. Dispatch.State)
  for _, Content in pairs(self.List_Dispatch:GetListItems()) do
    if Content.UI.DispatchId == Id then
      table.insert(self.SuccessDispatchList, Id)
      Content.UI:RefreshDispatchItem(Dispatch)
      if self.Owner.DispatchDetail and self.Owner.DispatchDetail.Dispatch.DispatchId == Id and self.Owner.DispatchDetail then
        self.Owner.DispatchDetail:RrefreshDispatchDetail(Dispatch)
      end
      return
    end
  end
end

function M:OnDispatchListCoolingComplete(Id)
  if 0 == self.WS_Type:GetActiveWidgetIndex() then
    return
  end
  self:AddTimer(0.2, function()
    self:UpdateDispatch(true)
  end)
end

function M:OnUpdateUIStyleByInputTypeChange(CurInputType, CurGamepadName)
  if CurInputType == ECommonInputType.Touch then
    return
  end
  local IsUseKeyAndMouse = CurInputType == ECommonInputType.MouseAndKeyboard
  if IsUseKeyAndMouse then
    self.UsingGamepad = false
    self:InitPCKeyInfo()
  else
    self.UsingGamepad = true
    self:InitPadKeyInfo()
    if self:HasFocusedDescendants() or self:HasAnyUserFocus() then
      self:NavigateToItem()
    end
  end
end

function M:InitPCKeyInfo()
  if self.Owner.Key_Tip == nil then
    return
  end
  self.Owner.Key_Tip.Panel_Key:ClearChildren()
  local Key_Esc = UIManager(self):_CreateWidgetNew("ComKeyTextDesc")
  self.Owner.Key_Tip.Panel_Key:AddChild(Key_Esc)
  if #self.SuccessDispatchList > 0 then
    local Key_GetReward = UIManager(self):_CreateWidgetNew("ComKeyTextDesc")
    self.Owner.Key_Tip.Panel_Key:AddChild(Key_GetReward)
    Key_GetReward:CreateCommonKey({
      KeyInfoList = {
        {Type = "Text", Text = "Space"}
      },
      Desc = GText("UI_Mail_Recieveall")
    })
  end
  Key_Esc:CreateCommonKey({
    KeyInfoList = {
      {Type = "Text", Text = "Esc"}
    },
    Desc = GText("Impression_UI_Back")
  })
end

function M:InitPadKeyInfo()
  if self.Owner.Key_Tip == nil then
    return
  end
  self.Owner.Key_Tip.Panel_Key:ClearChildren()
  local Key_B = UIManager(self):_CreateWidgetNew("ComKeyTextDesc")
  if self.Owner.DispatchDetail then
    local Key_Reward = UIManager(self):_CreateWidgetNew("ComKeyTextDesc")
    Key_Reward:CreateCommonKey({
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "RS"}
      },
      Desc = GText("UI_Controller_CheckReward")
    })
    self.Owner.Key_Tip.Panel_Key:AddChild(Key_Reward)
  end
  Key_B:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "B"}
    },
    Desc = GText("Impression_UI_Back")
  })
  self.Owner.Key_Tip.Panel_Key:AddChild(Key_B)
  self.Btn_Reward:SetDefaultGamePadImg("Y")
  self.Btn_Reward:SetGamePadIconVisible(true)
end

function M:OnKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if InKeyName == Const.GamepadLeftShoulder or InKeyName == Const.GamepadRightShoulder then
    return UE4.UWidgetBlueprintLibrary.Handled()
  end
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) then
    if "Gamepad_RightThumbstick" == InKeyName then
      local Item = self.Owner.DispatchDetail.List_Reward:GetItemAt(0)
      if Item then
        self.Owner.DispatchDetail.List_Reward:NavigateToIndex(0)
        self.Owner.DispatchDetail:InitPadKeyInfo()
        self.Owner.DispatchDetail:ShowPadUI(false)
        self.List_Sort:HideGamePadIcon(true, "DispatchDetail")
      end
      return UE4.UWidgetBlueprintLibrary.Handled()
    elseif "Gamepad_LeftThumbstick" == InKeyName then
      self.List_Sort:FocusToSelf()
      self.Owner.DispatchDetail:ShowPadUI(false)
      return UE4.UWidgetBlueprintLibrary.Handled()
    elseif "Gamepad_FaceButton_Right" == InKeyName and not self.List_Sort.bAddedToFocusPath then
      self:Close()
      return UE4.UWidgetBlueprintLibrary.Handled()
    elseif "Gamepad_FaceButton_Left" == InKeyName then
      if self.Owner.DispatchDetail and self.Owner.DispatchDetail.Dispatch.State == CommonConst.DispatchState.CanDispatch then
        self.Owner.DispatchDetail:GotoCloestTeleportPoint()
      elseif self.Owner.DispatchDetail and self.Owner.DispatchDetail.Dispatch.State == CommonConst.DispatchState.Doing and self.Owner.DispatchDetail.Dispatch.DispatchCharsList:Length() > 0 then
        self.Owner.DispatchDetail:CancelDispatch()
      elseif self.Owner.DispatchDetail and self.Owner.DispatchDetail.Dispatch.State == CommonConst.DispatchState.Unlock then
        self.Owner.DispatchDetail:GotoCloestTeleportPoint()
      end
      return UE4.UWidgetBlueprintLibrary.Handled()
    elseif "Gamepad_FaceButton_Top" == InKeyName then
      if #self.SuccessDispatchList > 0 then
        self:OnRewardClick()
      end
      return UE4.UWidgetBlueprintLibrary.Handled()
    elseif "SpaceBar" == InKeyName then
      if #self.SuccessDispatchList > 0 then
        self:OnRewardClick()
      end
      return UE4.UWidgetBlueprintLibrary.Handled()
    end
  end
  if "SpaceBar" == InKeyName then
    if #self.SuccessDispatchList > 0 then
      self:OnRewardClick()
    end
    return UE4.UWidgetBlueprintLibrary.Handled()
  end
  return UE4.UWidgetBlueprintLibrary.Unhandled()
end

function M:OnClickSpace()
  if #self.SuccessDispatchList > 0 then
    self:OnRewardClick()
  end
end

function M:OnPreviewKeyDown(MyGeometry, InKeyEvent)
  if CommonUtils:IfExistSystemGuideUI(self) then
    return UE4.UWidgetBlueprintLibrary.Handled()
  end
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if self.Owner.DispatchDetail and self.Owner.DispatchDetail.TipsOpen and "Gamepad_FaceButton_Right" ~= InKeyName then
    return UE4.UWidgetBlueprintLibrary.Handled()
  end
  local IsHandled = false
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) then
    if "Gamepad_DPad_Right" == InKeyName then
      self.Owner.DispatchDetail:OnClickCheckReward()
      IsHandled = true
    elseif "Gamepad_DPad_Left" == InKeyName then
      if self.Owner.DispatchDetail and self.Owner.DispatchDetail.Buff:GetVisibility() == ESlateVisibility.Visible then
        self.Owner.DispatchDetail:OpenSpecailAbility()
      end
      IsHandled = true
    elseif "Gamepad_FaceButton_Bottom" == InKeyName then
      local Detail = self.Owner.DispatchDetail
      if Detail and Detail.Dispatch.State == CommonConst.DispatchState.CanDispatch then
        self.Owner.DispatchDetail:OnClickDispatch()
      elseif Detail and Detail.Dispatch.State == CommonConst.DispatchState.Perfect or Detail.Dispatch.State == CommonConst.DispatchState.Success or Detail.Dispatch.State == CommonConst.DispatchState.Qualified or Detail.Dispatch.State == CommonConst.DispatchState.Disqualified then
        self.Owner.DispatchDetail:GetReward()
      end
      IsHandled = true
    end
  end
  if IsHandled then
    return UE4.UWidgetBlueprintLibrary.Handled()
  end
  return UE4.UWidgetBlueprintLibrary.Unhandled()
end

function M:NavigateToItem()
  if self.UsingGamepad then
    local Flag = false
    if -1 ~= self.Owner.DispatchId then
      for _, Content in pairs(self.List_Dispatch:GetListItems()) do
        if Content.UI and Content.UI.DispatchId == self.Owner.DispatchId then
          local Index = self.List_Dispatch:GetIndexForItem(Content)
          if Index then
            Flag = true
            self.List_Dispatch:NavigateToIndex(Index)
          end
        end
      end
    end
    if false == Flag then
      local Item = self.List_Dispatch:GetItemAt(0)
      if Item then
        self.List_Dispatch:NavigateToIndex(0)
      end
    end
  end
end

function M:OnListItemSelectionChanged(Content, IsSelected)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  if Content and Content.DispatchId == self.Owner.DispatchId then
    if self.UsingGamepad then
      Content.IsClick = false
    else
      Content.IsClick = true
      local Dispatch = Avatar.Dispatches[Content.DispatchId]
      self.Owner:CreateOrRefreshDispatchDetail(Dispatch)
      self.Owner.RealWildMap:RefreshDispatchMap(Dispatch.RegionId, Content.DispatchId)
    end
  end
end

function M:BP_GetDesiredFocusTarget()
  return self.List_Dispatch
end

function M:OnAddedToFocusPath(InFocusEvent)
  if self.UsingGamepad then
    self:InitPadKeyInfo()
  end
end

function M:OnFocusReceived(MyGeometry, InFocusEvent)
  DebugPrint("levelmap==============================================")
  Traceback()
  return UWidgetBlueprintLibrary.Unhandle
end

return M
