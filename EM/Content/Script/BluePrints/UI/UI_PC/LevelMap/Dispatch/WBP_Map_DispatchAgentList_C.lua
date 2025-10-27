require("UnLua")
local M = Class({
  "BluePrints.UI.BP_UIState_C"
})
local AgentEnum = {Dispatching = 2, NotDispatched = 3}

function M:Initialize(Initializer)
  self.Super.Initialize(self)
  self.AgentList = {}
  self.Owner = nil
  self.DispatchingAgentList = {}
  self.ChooseAgentList = {}
  self.CurClick = nil
end

function M:Construct()
  self.Btn_Close.Btn_Close.OnClicked:Add(self, self.OnClickClose)
  self.Btn_Desc.Btn_Click.OnClicked:Add(self, self.OnClickDialogAbility)
  self.Btn_Auto.Button_Area.OnClicked:Add(self, self.AutoChoose)
  self.Btn_Close.Btn_Close.AudioEventPath = "event:/ui/common/click_btn_return"
end

function M:Destruct()
  self.Btn_Close.Btn_Close.OnClicked:Remove(self, self.OnClickClose)
  self.Btn_Auto.Button_Area.OnClicked:Remove(self, self.AutoChoose)
  self.Btn_Desc.Btn_Click.OnClicked:Remove(self, self.OnClickDialogAbility)
  if IsValid(self.GameInputModeSubsystem) then
    self.GameInputModeSubsystem.OnInputMethodChanged:Remove(self, self.RefreshOpInfoByInputDevice)
  end
end

function M:InitAgentList(Owner)
  self:PlayAnimation(self.In)
  AudioManager(self):PlayUISound(self, "event:/ui/common/sub_panel_expand", "AgentOpen", nil)
  self:SetFocus()
  self:Init(Owner)
  self:InitListenEvent()
  self:RefreshBaseInfo()
end

function M:InitKeyInfo()
end

function M:Refresh()
  for _, value in pairs(self.AgentList) do
    if value.UI then
      self:CancelChoose(value.UI)
    end
  end
end

function M:InitPCKeyInfo()
  if self.Owner.Key_Tip == nil then
    return
  end
  self.Btn_Desc:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  self.Key_Controller_Desc:SetVisibility(ESlateVisibility.Collapsed)
  self.Owner.Key_Tip.Panel_Key:ClearChildren()
  local Key_Esc = UIManager(self):_CreateWidgetNew("ComKeyTextDesc")
  self.Owner.Key_Tip.Panel_Key:AddChild(Key_GetReward)
  Key_Esc:CreateCommonKey({
    KeyInfoList = {
      {Type = "Text", Text = "Esc"}
    },
    Desc = GText("UI_BACK")
  })
end

function M:InitPadKeyInfo()
  if self.Owner.Key_Tip == nil then
    return
  end
  self.Btn_Desc:SetVisibility(ESlateVisibility.Collapsed)
  self.Owner.Key_Tip.Panel_Key:ClearChildren()
  local Key_Reward = UIManager(self):_CreateWidgetNew("ComKeyTextDesc")
  local Key_Choose = UIManager(self):_CreateWidgetNew("ComKeyTextDesc")
  local Key_B = UIManager(self):_CreateWidgetNew("ComKeyTextDesc")
  Key_Reward:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "RS"}
    },
    Desc = GText("UI_Controller_CheckReward")
  })
  Key_B:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "B"}
    },
    Desc = GText("UI_BACK")
  })
  Key_Choose:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "A"}
    },
    Desc = GText("UI_CTL_Select/Cancel")
  })
  self.Owner.Key_Tip.Panel_Key:AddChild(Key_Reward)
  self.Owner.Key_Tip.Panel_Key:AddChild(Key_Choose)
  self.Owner.Key_Tip.Panel_Key:AddChild(Key_B)
  self.Btn_Auto:SetGamePadImg("Y")
  self.Key_Controller_Desc:SetVisibility(ESlateVisibility.Visibie)
  self.Key_Controller_Desc:CreateGamepadKey("LS")
end

function M:Init(Owner)
  self.Owner = Owner
  self.Text_Title:SetText(GText("UI_Disptach_AgentList"))
  self.Text_Desc:SetText(GText("UI_Disptach_Ability"))
  self.Btn_Auto.Text_Button:SetText(GText("UI_Dispatch_AutoSelect"))
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  self:InitDispatchingAgentList()
  self.Chars = {}
  self.UuidList = {}
  for _, Char in pairs(Avatar.Chars) do
    if Char.CharId ~= self.MaleId and Char.CharId ~= self.FemaleId then
      self.Chars[CommonUtils.ObjId2Str(Char.Uuid)] = Char.CharId
      table.insert(self.UuidList, CommonUtils.ObjId2Str(Char.Uuid))
    end
  end
  self:SortAgentList()
  for _, Uuid in pairs(self.UuidList) do
    local State = self:GetAgentState(Uuid)
    local Content = NewObject(UIUtils.GetCommonItemContentClass())
    local Id = self.Chars[Uuid]
    Content.Type = "DispatchAgent"
    Content.AudioType = "Char"
    Content.Id = Id
    Content.UnitId = Id
    Content.Uuid = Uuid
    Content.State = State
    Content.Owner = Owner
    Content.Icon = DataMgr.Char[Id].Icon
    Content.Parent = self
    Content.MinusBtn = self.OnListItemClicked
    Content.IsChoose = false
    self.AgentList[Uuid] = Content
    self.List_Agent:AddItem(Content)
  end
  self:AddTimer(0.01, function()
    local ListItemUIs = self.List_Agent:GetDisplayedEntryWidgets()
    local RestCount = UIUtils.GetListViewContentMaxCount(self.List_Agent, ListItemUIs) - ListItemUIs:Length()
    if RestCount <= 0 then
      return
    end
    for i = 1, RestCount do
      local Content = NewObject(UIUtils.GetCommonItemContentClass())
      Content.Id = -1
      self.List_Agent:AddItem(Content)
    end
  end)
end

function M:GetAgentState(Uuid)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  if CommonUtils.HasValue(self.DispatchingAgentList, Uuid) then
    return AgentEnum.Dispatching
  else
    return AgentEnum.NotDispatched
  end
end

function M:OnClose()
  self.Owner.DispatchAgentList = nil
  AudioManager(self):SetEventSoundParam(self, "AgentOpen", {ToEnd = 1})
  self:RemoveFromParent()
end

function M:OnClickClose()
  self:BindToAnimationFinished(self.Out, function()
    self:OnClose()
    if self.Owner.DispatchList ~= nil then
      self.Owner.DispatchList:PlayAnimation(self.Owner.DispatchList.In)
      self.Owner.DispatchList:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
      for _, Content in pairs(self.Owner.DispatchList.List_Dispatch:GetListItems()) do
        if Content.UI and Content.UI.DispatchId == self.Owner.DispatchId then
          Content.UI:OnDispatchItemClick()
          return
        end
      end
      self.Owner.DispatchAgentList = nil
    else
      self.Owner:OnClickDispatch()
    end
  end)
  self:PlayAnimation(self.Out)
end

function M:StartDispatch(IsFirst)
  self:BindToAnimationFinished(self.Out, {
    self,
    function()
      self:OnClose()
      if self.Owner.DispatchList ~= nil then
        self.Owner.DispatchList:PlayAnimation(self.Owner.DispatchList.In)
        self.Owner.DispatchList:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
        self.Owner.DispatchList:UpdateDispatch(IsFirst)
      else
        self.Owner:OnClickDispatch()
      end
    end
  })
  self:PlayAnimation(self.Out)
end

function M:SortAgentList()
  table.sort(self.UuidList, function(A, B)
    local StateA = self:GetAgentState(A)
    local StateB = self:GetAgentState(B)
    if StateA ~= StateB then
      return StateA > StateB
    end
    local RateA = self:GetSuccessRateById(A)
    local RateB = self:GetSuccessRateById(B)
    if RateA ~= RateB then
      return RateA > RateB
    end
    local CountA = self:GetAbilityCount(A)
    local CountB = self:GetAbilityCount(B)
    if CountA ~= CountB then
      return CountA > CountB
    end
    local IdA = self.Chars[A]
    local IdB = self.Chars[B]
    return IdA > IdB
  end)
end

function M:OnListItemClicked(Content)
  if nil == Content then
    return
  end
  Content.IsChoose = not Content.IsChoose
  if Content.IsChoose then
    if self.Owner.DispatchDetail.Dispatch.State ~= CommonConst.DispatchState.CanDispatch then
      Content.IsChoose = not Content.IsChoose
      return
    end
    if self.Owner.DispatchDetail.AgentCount == self.Owner.DispatchDetail.Dispatch.DispatchPerson then
      UIManager(self):ShowUITip(UIConst.Tip_CommonTop, GText("UI_Dispatch_Toast_AgentFull"))
      Content.IsChoose = not Content.IsChoose
      return
    end
    if self:GetAgentState(Content.Uuid) == AgentEnum.Dispatching then
      UIManager(self):ShowUITip(UIConst.Tip_CommonTop, GText("UI_Disptach_Toast_AgentDoing"))
      Content.IsChoose = not Content.IsChoose
      return
    end
    if Content.UI then
      Content.UI.Btn_Minus:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
      Content.UI:StopAllAnimations()
      Content.UI:PlayAnimation(Content.UI.Select)
    end
    self.ChooseAgentList[Content.Uuid] = true
    self.Owner.DispatchDetail:AddAgentData(Content.Uuid, true)
  else
    if Content.UI then
      Content.UI.Btn_Minus:SetVisibility(ESlateVisibility.Collapsed)
      Content.UI:StopAllAnimations()
      Content.UI:PlayAnimation(Content.UI.Normal)
    end
    self.ChooseAgentList[Content.Uuid] = nil
    self.Owner.DispatchDetail:RemoveAgentData(nil, Content.Uuid, true)
  end
end

function M:UpdateAgentItem(Id)
  local Agent = self.AgentList[Id]
  if nil == Agent then
    return
  end
  self:CancelChoose(Agent.UI)
end

function M:InitDispatchingAgentList()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  for Id, Dispatch in pairs(Avatar.Dispatches) do
    if Dispatch.State == CommonConst.DispatchState.Success or Dispatch.State == CommonConst.DispatchState.Perfect or Dispatch.State == CommonConst.DispatchState.Qualified or Dispatch.State == CommonConst.DispatchState.Disqualified or Dispatch.DispatchCharsList:Length() > 0 then
      for _, UuId in pairs(Dispatch.DispatchCharsList) do
        table.insert(self.DispatchingAgentList, CommonUtils.ObjId2Str(UuId))
      end
    end
  end
end

function M:OnClickMinus()
  self:CancelChoose()
end

function M:CancelChoose(Agent)
  if Agent.State == AgentEnum.Dispatching then
    return
  end
  Agent.IsChoose = false
  Agent:PlayAnimation(Agent.Normal)
end

function M:GetSuccessRateById(UuId)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  local Char = Avatar.Chars[CommonUtils.Str2ObjId(UuId)]
  local Tag = Char:GetCurrentUnlockDispatchTag()
  local DispatchTag = DataMgr.Dispatch[self.Owner.DispatchId].DispatchDemand
  local Effect = DataMgr.CharDispatchTag.Rigorous.DispatchEffectParam / 10000
  local MatchCount = 0
  local SpecialCount = 0
  for Type, Count in pairs(Tag) do
    if nil ~= DispatchTag[Type] then
      MatchCount = MatchCount + math.min(Count, DispatchTag[Type])
    end
    if "Rigorous" == Type then
      SpecialCount = SpecialCount + Count
    end
  end
  local AblilityCount = 0
  for Type, Count in pairs(DispatchTag) do
    AblilityCount = AblilityCount + Count
  end
  return MatchCount / AblilityCount + Effect * SpecialCount
end

function M:GetAbilityCount(UuId)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  local Char = Avatar.Chars[CommonUtils.Str2ObjId(UuId)]
  local Tag = Char:GetCurrentUnlockDispatchTag()
  local TotalCount = 0
  for Type, Count in pairs(Tag) do
    TotalCount = TotalCount + Count
  end
  return TotalCount
end

function M:OnClickDialogAbility()
  self.Btn_Desc:PlayAnimation(self.Btn_Desc.Click)
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_small", nil, nil)
  local Params = {}
  UIManager(self):ShowCommonPopupUI(100139, Params, self.List_Agent)
end

function M:AutoChoose()
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_confirm", "", nil)
  local CanAuto = self:CheckAutoChoose(true)
  if CanAuto then
    local Item = self.List_Agent:GetListItems()
    for _, Content in pairs(self.List_Agent:GetListItems()) do
      if Content and Content.IsChoose == false then
        self:OnListItemClicked(Content)
      end
      local CanContinue = self:CheckAutoChoose(false)
      if false == CanContinue then
        return
      end
    end
  end
end

function M:CheckAutoChoose(IsShowTip)
  local CurSuccessRate = self.Owner.DispatchDetail:CalSuccessRate()
  local CurPerson = self.Owner.DispatchDetail.AgentCount
  local MaxPerson = self.Owner.DispatchDetail.Dispatch.DispatchPerson
  local Flag = self:CheckAgentListIsEmpty()
  if CurSuccessRate >= 100 then
    if IsShowTip then
      UIManager(self):ShowUITip(UIConst.Tip_CommonTop, GText("UI_Dispatch_Toast_MustWin"))
    end
    DebugPrint("\229\189\147\229\137\141\230\136\144\229\138\159\231\142\135\229\164\167\228\186\142\231\173\137\228\186\142100")
    return false
  end
  if CurPerson == MaxPerson then
    if IsShowTip then
      UIManager(self):ShowUITip(UIConst.Tip_CommonTop, GText("UI_Dispatch_Toast_FullMan"))
    end
    DebugPrint("\230\180\190\233\129\163\228\186\186\230\149\176\228\184\138\233\153\144")
    return false
  end
  if true == Flag then
    if IsShowTip then
      UIManager(self):ShowUITip(UIConst.Tip_CommonTop, GText("UI_Dispatch_Toast_NoReleaseMan"))
    end
    return false
  end
  return true
end

function M:CheckAgentListIsEmpty()
  local Flag = true
  for _, Content in pairs(self.List_Agent:GetListItems()) do
    if Content.UI and Content.UI.IsChoose == false then
      Flag = false
      return Flag
    end
  end
  return Flag
end

function M:InitListenEvent()
  if IsValid(self.GameInputModeSubsystem) then
    self.GameInputModeSubsystem.OnInputMethodChanged:Add(self, self.RefreshOpInfoByInputDevice)
  end
end

function M:RefreshBaseInfo()
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
  if IsValid(self.GameInputModeSubsystem) then
    self:RefreshOpInfoByInputDevice(self.GameInputModeSubsystem:GetCurrentInputType(), self.GameInputModeSubsystem:GetCurrentGamepadName())
  end
end

function M:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  if CurInputDevice == ECommonInputType.Touch then
    return
  end
  local IsUseKeyAndMouse = CurInputDevice == ECommonInputType.MouseAndKeyboard
  if IsUseKeyAndMouse then
    self.UsingGamepad = false
    self.Btn_Desc:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self.Key_Controller_Desc:SetVisibility(ESlateVisibility.Collapsed)
  else
    self.UsingGamepad = true
    self:InitPadKeyInfo()
    self.Btn_Desc:SetVisibility(ESlateVisibility.Collapsed)
    self.Key_Controller_Desc:SetVisibility(ESlateVisibility.Visibie)
    if self:HasFocusedDescendants() or self:HasAnyUserFocus() then
      self.GameInputModeSubsystem:SetNavigateWidgetOpacity(1)
      local Item = self.List_Agent:GetItemAt(0)
      if Item then
        self.List_Agent:NavigateToIndex(0)
      end
    end
  end
end

function M:OnPreviewKeyDown(MyGeometry, InKeyEvent)
  if CommonUtils:IfExistSystemGuideUI(self) then
    return UE4.UWidgetBlueprintLibrary.Handled()
  end
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local IsHandled = false
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) then
    if "Gamepad_DPad_Right" == InKeyName then
      self.Owner.DispatchDetail:OnClickCheckReward()
      IsHandled = true
    elseif "Gamepad_DPad_Left" == InKeyName then
      if self.Owner.DispatchDetail.Buff:GetVisibility() == ESlateVisibility.Visible then
        self.Owner.DispatchDetail:OpenSpecailAbility()
      end
      IsHandled = true
    end
  end
  if IsHandled then
    return UE4.UWidgetBlueprintLibrary.Handled()
  end
  return UE4.UWidgetBlueprintLibrary.Unhandled()
end

function M:OnKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if InKeyName == Const.GamepadLeftShoulder or InKeyName == Const.GamepadRightShoulder then
    return UE4.UWidgetBlueprintLibrary.Handled()
  end
  if not UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) or "Gamepad_Special_Right" == InKeyName then
  elseif "Gamepad_Special_Left" == InKeyName then
  elseif "Gamepad_LeftThumbstick" == InKeyName then
    self:OnClickDialogAbility()
  elseif "Gamepad_RightThumbstick" == InKeyName then
    local Item = self.Owner.DispatchDetail.List_Reward:GetItemAt(0)
    if Item then
      self.Owner.DispatchDetail.List_Reward:NavigateToIndex(0)
      self.Owner.DispatchDetail:InitPadKeyInfo()
      self.Owner.DispatchDetail:ShowPadUI(false)
    end
  elseif "Gamepad_FaceButton_Top" == InKeyName then
    self:AutoChoose()
  elseif "Gamepad_FaceButton_Left" == InKeyName then
    self.Owner.DispatchDetail:OnClickConfirm()
  elseif "Gamepad_FaceButton_Right" == InKeyName then
    self:StartDispatch(false)
  end
  if "Escape" == InKeyName then
    return UE4.UWidgetBlueprintLibrary.Unhandled()
  end
  return UE4.UWidgetBlueprintLibrary.Handled()
end

function M:OnAddedToFocusPath(InFocusEvent)
  if self.UsingGamepad then
    self.GameInputModeSubsystem:SetNavigateWidgetOpacity(1)
    self:InitPadKeyInfo()
  end
end

return M
