require("UnLua")
local WBP_Rouge_GameSettlement_C = Class("BluePrints.UI.BP_UIState_C")

function WBP_Rouge_GameSettlement_C:OnLoaded(...)
  WBP_Rouge_GameSettlement_C.Super.OnLoaded(self, ...)
  local LogicServerInfo = (...)
  local EventId, CustomData = ...
  self.EventId = EventId
  self.CurScore = CustomData.Score
  self:InitTextInfo()
  self:InitExitButton()
  self:InitScoreInfo(self.EventId, self.CurScore)
  self:InitStarInfo()
  self:InitTipsInfo()
  self:InitInputDeviceInfo()
  self:SetVisibility(UIConst.VisibilityOp.Collapsed)
end

function WBP_Rouge_GameSettlement_C:InitTextInfo()
  self.Text_Tips:SetText(GText("UI_RougeLike_End__ClickEmpty"))
  self.Text_Total:SetText(GText("RougeMiniGameTotalPoints"))
end

function WBP_Rouge_GameSettlement_C:InitStarInfo()
  for i = 1, 3 do
    self["Star0" .. i]:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self["Star0" .. i]:PlayAnimation(self["Star0" .. i]["Type0" .. i])
  end
end

function WBP_Rouge_GameSettlement_C:InitScoreInfo(EventId, CurScore)
  self.Text_Score:SetText(CurScore)
  self.CurIndex = nil
  local AllChildren = self.VB_Reward:GetAllChildren()
  local MiniGameScoreId = DataMgr.RougeLikeEventSelect[EventId].MiniGameScoreId
  local Info = DataMgr.RougeLikeMiniGameScore[MiniGameScoreId]
  for i = 1, AllChildren:Length() do
    local Widget = AllChildren:GetRef(i)
    if Info.MiniGameScore[i] then
      Widget:InitScoreInfo(Info.MiniGameScore[i])
      if CurScore >= Info.MiniGameScore[i] then
        self.CurIndex = i
      end
    else
      Widget:SetVisibility(ESlateVisibility.Collapsed)
    end
  end
end

function WBP_Rouge_GameSettlement_C:InitRewardAndShow(Rewards)
  local AllChildren = self.VB_Reward:GetAllChildren()
  for i = 1, AllChildren:Length() do
    local Widget = AllChildren:GetRef(i)
    Widget:InitReward(self.EventId, self.CurIndex, i, Rewards)
    if self.CurIndex then
      if i <= self.CurIndex then
        Widget:SetIsEmpty(false)
      else
        Widget:SetIsEmpty(true)
      end
    else
      Widget:SetIsEmpty(false)
    end
  end
  self:PlayInAnimation()
end

function WBP_Rouge_GameSettlement_C:InitExitButton()
  self.Btn_Click.OnClicked:Add(self, self.OnExitButtonClicked)
  self.Text_Tips:SetText(GText("UI_RougeLike_End__ClickEmpty"))
end

function WBP_Rouge_GameSettlement_C:OnExitButtonClicked()
  if self.IsShowTips then
    self.IsShowTips = false
    return
  end
  self:BlockAllUIInput(true)
  self:BindToAnimationFinished(self.Out, {
    self,
    self.OnOutAnimFinished
  })
  self:PlayAnimation(self.Out)
end

function WBP_Rouge_GameSettlement_C:OnOutAnimFinished()
  table.remove(GWorld.RougeLikeManager.AwardList, 1)
  GWorld.RougeLikeManager:ShowNextAward(GWorld.RougeLikeManager.AwardList)
  self:OnCloseSettlementUI()
end

function WBP_Rouge_GameSettlement_C:OnCloseSettlementUI()
  self:BlockAllUIInput(false)
  self:Close()
end

function WBP_Rouge_GameSettlement_C:InitTipsInfo()
  if CommonUtils.GetDeviceTypeByPlatformName(self) == "Mobile" then
    return
  end
  local BottomKeyInfo = {
    {
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "A"}
      },
      Desc = GText("UI_Tips_Ensure")
    },
    {
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "B"}
      },
      Desc = GText("UI_Tips_Close")
    }
  }
  self.Key_Tips:UpdateKeyInfo(BottomKeyInfo)
end

function WBP_Rouge_GameSettlement_C:InitInputDeviceInfo()
  if CommonUtils.GetDeviceTypeByPlatformName(self) == "Mobile" then
    return
  end
  self:AddDispatcher(EventID.OnRougeSettlementBoxItemFocused, self, self.OnRougeSettlementBoxItemFocused)
  self:AddDispatcher(EventID.OnRougeSettlementBoxItemMenuChanged, self, self.OnRougeSettlementBoxItemMenuChanged)
  if not self.GameInputModeSubsystem then
    local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
    self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
  end
end

function WBP_Rouge_GameSettlement_C:OnRougeSettlementBoxItemMenuChanged(bIsOpen)
  self:SetTipsVisibilityByTag(not bIsOpen, "ItemMenuChange")
end

function WBP_Rouge_GameSettlement_C:OnRougeSettlementBoxItemFocused(Widget, Suffix)
  local ScrollBox = Widget:GetParent():GetParent()
  if ScrollBox then
    ScrollBox:SetScrollBarVisibility(UE4.ESlateVisibility.Collapsed)
    ScrollBox:ScrollWidgetIntoView(Widget)
  end
end

function WBP_Rouge_GameSettlement_C:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  if CommonUtils.GetDeviceTypeByPlatformName(self) == "Mobile" then
    return
  end
  if CurInputDevice == ECommonInputType.MouseAndKeyboard then
    self:ShowMouseAndKeyboardView()
  elseif CurInputDevice == ECommonInputType.Gamepad then
    self:ShowGamepadView()
  end
  self.Super.RefreshOpInfoByInputDevice(self, CurInputDevice, CurGamepadName)
end

function WBP_Rouge_GameSettlement_C:ShowMouseAndKeyboardView()
  self:SetTipsVisibilityByTag(false, "InputDevice")
  self.Text_Tips:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
end

function WBP_Rouge_GameSettlement_C:ShowGamepadView()
  local Item = self:TryGetFirstValidItem()
  if IsValid(Item) then
    Item:SetFocus()
  else
    self:SetFocus()
  end
  self:SetTipsVisibilityByTag(true, "InputDevice")
  self.Text_Tips:SetVisibility(UE4.ESlateVisibility.Collapsed)
end

function WBP_Rouge_GameSettlement_C:TryGetFirstValidItem()
  local Item = self.Reward02.WrapBox_Reward:GetChildAt(0)
  if IsValid(Item) then
    return Item
  end
  Item = self.Reward03.WrapBox_Reward:GetChildAt(0)
  if IsValid(Item) then
    return Item
  end
  return
end

function WBP_Rouge_GameSettlement_C:OnKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if InKeyName == Const.GamepadFaceButtonRight then
    self.IsShowTips = false
    self:OnExitButtonClicked()
  end
  return UE4.UWidgetBlueprintLibrary.Handled()
end

function WBP_Rouge_GameSettlement_C:PlayInAnimation()
  self:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  self:RefreshOpInfoByInputDevice(self.GameInputModeSubsystem:GetCurrentInputType(), self.GameInputModeSubsystem:GetCurrentGamepadName())
  self:PlayAnimation(self.In)
end

function WBP_Rouge_GameSettlement_C:Star_In()
  local Index = 1
  local CurIndex = self.CurIndex
  CurIndex = CurIndex or 0
  self:AddTimer(self.StarInStep, function()
    if self["Star0" .. Index] then
      self["Star0" .. Index]:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
      if CurIndex >= Index then
        self["Star0" .. Index]:PlayAnimation(self["Star0" .. Index].Star_In)
      else
        self["Star0" .. Index]:PlayAnimation(self["Star0" .. Index].Off)
      end
    else
      self:RemoveTimer("StarInTimer")
    end
    Index = Index + 1
  end, true, 0, "StarInTimer", true)
end

function WBP_Rouge_GameSettlement_C:Reward_In()
  local Index = 1
  self:AddTimer(self.RewardInStep, function()
    if self["Reward0" .. Index] then
      self["Reward0" .. Index]:PlayInAnim()
    else
      self:RemoveTimer("RewardInTimer")
    end
    Index = Index + 1
    local Item = self:TryGetFirstValidItem()
    if IsValid(Item) then
      Item:SetFocus()
    else
      self:SetFocus()
    end
  end, true, 0, "RewardInTimer", true)
end

function WBP_Rouge_GameSettlement_C:Close()
  self.Super.Close(self)
  self:RemoveTimer("StarInTimer")
  self:RemoveTimer("RewardInTimer")
end

function WBP_Rouge_GameSettlement_C:SetTipsVisibilityByTag(IsShow, HideTag)
  if CommonUtils.GetDeviceTypeByPlatformName(self) == "Mobile" then
    return
  end
  if not self.TipsVisibilityTags then
    self.TipsVisibilityTags = {}
  end
  if IsShow then
    self.TipsVisibilityTags[HideTag] = nil
    if nil == _G.next(self.TipsVisibilityTags) then
      self.Key_Tips:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    end
  else
    self.TipsVisibilityTags[HideTag] = true
    self.Key_Tips:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
end

return WBP_Rouge_GameSettlement_C
