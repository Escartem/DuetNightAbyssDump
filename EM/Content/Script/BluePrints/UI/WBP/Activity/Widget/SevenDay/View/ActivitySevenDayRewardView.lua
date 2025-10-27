require("UnLua")
local EnumPlayerSignRewardState = require("Blueprints.UI.WBP.Activity.ActivityUtils").EnumPlayerSignRewardState
local M = Class({
  "BluePrints.Common.TimerMgr",
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:InitNormalReward(Index, ConfigData, ParentWidget)
  self.Index = Index
  self.ActivityId = ConfigData.ActivityId
  self.RewardType = "NormalReward"
  self.ParentWidget = ParentWidget
  self.Text_ItemIndex:SetText(string.format("%02d", Index))
  local RewardInfo = DataMgr.Reward[ConfigData.RewardId]
  if RewardInfo then
    local RewardIds = RewardInfo.Id or {}
    local RewardCounts = RewardInfo.Count or {}
    local RewardTypes = RewardInfo.Type or {}
    if #RewardIds > 0 then
      local ItemId = RewardIds[1]
      local Count = RewardUtils:GetCount(RewardCounts[1])
      local Icon = ItemUtils.GetItemIcon(ItemId, RewardTypes[1])
      local Rarity = ItemUtils.GetItemRarity(ItemId, RewardTypes[1])
      local ItemType = RewardTypes[1]
      local RewardObject = {}
      RewardObject.ParentWidget = self
      RewardObject.StuffClickCallback = self.OnViewStuffDetailClick
      RewardObject.CommonType = ""
      RewardObject.ItemType = ItemType
      RewardObject.Index = 1
      RewardObject.Id = ItemId
      RewardObject.Count = Count
      RewardObject.Icon = Icon
      RewardObject.Rarity = Rarity or 1
      RewardObject.IsShowDetails = true
      RewardObject.UIName = "ActivitySevenDayRewardItem"
      self.IconItem:FillWithData(RewardObject)
    end
  end
  self.Btn_ClickRecv.OnClicked:Clear()
  self.Btn_ClickRecv.OnClicked:Add(self, self.OnReceiveRewardClicked)
end

function M:InitSpecialReward(Index, ConfigData, ParentWidget)
  self.Index = Index
  self.ActivityId = ConfigData.ActivityId
  self.RewardType = "SpecialReward"
  self.ParentWidget = ParentWidget
  self.Text_ItemIndex:SetText(string.format("%02d", Index))
  if ConfigData.CharId then
    self.IsShowAvatarIcon = true
    local CharConfigInfo = DataMgr.Char[ConfigData.CharId]
    local ImgAvatarMat = self.Image_Avatar:GetDynamicMaterial()
    ImgAvatarMat:SetTextureParameterValue("IconMap", LoadObject(string.format("Texture2D'%s'", CharConfigInfo.BigIcon)))
    self.Image_Avatar:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    self.Image_Got:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    self.SevenDayIconItem_1:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.SevenDayIconItem_2:SetVisibility(UIConst.VisibilityOp.Collapsed)
  else
    local RewardInfo = DataMgr.Reward[ConfigData.RewardId]
    if RewardInfo then
      local RewardIds = RewardInfo.Id or {}
      local RewardCounts = RewardInfo.Count or {}
      local RewardTypes = RewardInfo.Type or {}
      local AllRewardObject = {}
      for i = 1, #RewardIds do
        local ItemId = RewardIds[i]
        local Count = RewardUtils:GetCount(RewardCounts[i])
        local Icon = ItemUtils.GetItemIcon(ItemId, RewardTypes[i])
        local Rarity = ItemUtils.GetItemRarity(ItemId, RewardTypes[i])
        local ItemType = RewardTypes[i]
        local RewardObject = {}
        RewardObject.ParentWidget = self
        RewardObject.StuffClickCallback = self.OnViewStuffDetailClick
        RewardObject.CommonType = ""
        RewardObject.ItemType = ItemType
        RewardObject.Index = i
        RewardObject.Id = ItemId
        RewardObject.Count = Count
        RewardObject.Icon = Icon
        RewardObject.Rarity = Rarity or 1
        RewardObject.IsShowDetails = true
        RewardObject.UIName = "ActivitySevenDayRewardItem"
        table.insert(AllRewardObject, RewardObject)
      end
      self.Image_Avatar:SetVisibility(UIConst.VisibilityOp.Collapsed)
      self.Image_Got:SetVisibility(UIConst.VisibilityOp.Collapsed)
      if AllRewardObject[1] then
        self.SevenDayIconItem_1:FillWithData(AllRewardObject[1])
        self.SevenDayIconItem_1:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
      else
        self.SevenDayIconItem_1:SetVisibility(UIConst.VisibilityOp.Collapsed)
      end
      if AllRewardObject[2] then
        self.SevenDayIconItem_2:FillWithData(AllRewardObject[2])
        self.SevenDayIconItem_2:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
      else
        self.SevenDayIconItem_2:SetVisibility(UIConst.VisibilityOp.Collapsed)
      end
      if #AllRewardObject <= 1 then
        self:PlayAnimation(self.Item_Only)
      else
        self:PlayAnimation(self.Item_Many)
      end
    end
  end
  self.Btn_Click.OnClicked:Clear()
  self.Btn_Click.OnClicked:Add(self, self.OnReceiveRewardClicked)
end

function M:HideAllStuffBtn(bHide)
  if self.IconItem then
    self.IconItem:HideBtn(bHide)
  end
  if self.SevenDayIconItem_1 then
    self.SevenDayIconItem_1:HideBtn(bHide)
  end
  if self.SevenDayIconItem_2 then
    self.SevenDayIconItem_2:HideBtn(bHide)
  end
end

function M:OnViewStuffDetailClick(IsOpenDetail, RewardStuffIdx)
  self:UpdateKeyTipsWithStuffDetailShow(IsOpenDetail)
  if not IsOpenDetail then
    self:AddTimer(0.1, function()
      if self.RewardType == "SpecialReward" and self.SevenDayIconItem_2:IsVisible() then
        self["SevenDayIconItem_" .. RewardStuffIdx]:SetFocus()
      else
        self:SetFocus()
      end
    end, false, 0, "OnViewStuffDetailClose", true)
  end
end

function M:OnReceiveRewardClicked()
  if self.CurRewardState == EnumPlayerSignRewardState.Completed then
    return
  end
  local PlayerAvatar = GWorld:GetAvatar()
  if not PlayerAvatar then
    return
  end
  PlayerAvatar:DailyLoginGetReward(self.ActivityId, self.Index)
end

function M:RefreshRewardByState(RewardState)
  self.CurRewardState = RewardState
  self:PlayAnimByRewardState(RewardState)
  local IsReceiveBtnVisible = RewardState == EnumPlayerSignRewardState.SignedNotRecv
  self.IsReceiveBtnVisible = IsReceiveBtnVisible
  if self.RewardType == "NormalReward" then
    self.IconItem:RefreshState(RewardState)
    if IsReceiveBtnVisible then
      self.Btn_ClickRecv:SetVisibility(UIConst.VisibilityOp.Visible)
    else
      self.Btn_ClickRecv:SetVisibility(UIConst.VisibilityOp.Collapsed)
    end
  elseif self.RewardType == "SpecialReward" then
    if not self.IsShowAvatarIcon then
      self.SevenDayIconItem_1:RefreshState(RewardState)
      self.SevenDayIconItem_2:RefreshState(RewardState)
    end
    if IsReceiveBtnVisible then
      self.Btn_Click:SetVisibility(UIConst.VisibilityOp.Visible)
    else
      self.Btn_Click:SetVisibility(UIConst.VisibilityOp.Collapsed)
    end
  end
  if RewardState == EnumPlayerSignRewardState.SignedNotRecv then
    self.Text_ItemIndex:SetFont(self.Num_ControllerSelect)
    self.Text_ItemIndex:SetColorAndOpacity(self.Color_ControllerSelect)
  else
    self.Text_ItemIndex:SetFont(self.Num_Normal_Got)
    self.Text_ItemIndex:SetColorAndOpacity(self.Color_Normal_Got)
  end
end

function M:PlayAnimByRewardState(RewardState)
  if nil == RewardState or RewardState == EnumPlayerSignRewardState.NotSign then
    self:PlayAnimation(self.Normal)
  elseif RewardState == EnumPlayerSignRewardState.SignedNotRecv then
    self:PlayAnimation(self.Able, 0, 0)
  elseif RewardState == EnumPlayerSignRewardState.Completed then
    self:StopAllAnimations()
    self:PlayAnimation(self.Received)
  end
end

function M:ShowSelectFrameInGamePad(bShowSelect)
  if bShowSelect then
    self.Image_LightFrame:SetRenderOpacity(1.0)
  else
    self.Image_LightFrame:SetRenderOpacity(0.0)
  end
end

function M:GetRewardState()
  return self.CurRewardState
end

function M:OnAddedToFocusPath(InFocusEvent)
  self:UpdateKeyTipsWithStuffDetailShow(false)
  if UIUtils.IsGamepadInput() then
    self:ShowSelectFrameInGamePad(true)
  end
end

function M:OnRemovedFromFocusPath(InFocusEvent)
  self:ShowSelectFrameInGamePad(false)
end

function M:UpdateKeyTipsWithStuffDetailShow(IsOpenDetail)
  if IsOpenDetail then
    self.ParentWidget:UpdateParentActivityKeyTips("EmptyView", self, false)
  else
    self:ResetParentBottomKeyTips()
  end
end

function M:ResetParentBottomKeyTips()
  if self.ParentWidget then
    local FocusWidgetName
    if self.CurRewardState == EnumPlayerSignRewardState.SignedNotRecv then
      FocusWidgetName = "ReceiveRewardView"
    elseif self.RewardType == "SpecialReward" and self.SevenDayIconItem_2:IsVisible() then
      local PlayerController = self:GetOwningPlayer()
      if self.SevenDayIconItem_1:HasUserFocusedDescendants(PlayerController) or self.SevenDayIconItem_2:HasUserFocusedDescendants(PlayerController) then
        FocusWidgetName = "CheckRewardDetailView"
      else
        FocusWidgetName = "CheckMultiRewardDetailView"
      end
    else
      FocusWidgetName = "CheckRewardDetailView"
    end
    self.ParentWidget:UpdateParentActivityKeyTips(FocusWidgetName, self, false)
  end
end

function M:EnterSpecialRewardItemViewMode()
  self.SevenDayIconItem_1:SetFocus()
  if self.ParentWidget then
    local FocusWidgetName = self.CurRewardState == EnumPlayerSignRewardState.SignedNotRecv and "ReceiveRewardView" or "CheckRewardDetailView"
    self.ParentWidget:UpdateParentActivityKeyTips(FocusWidgetName, self.SevenDayIconItem_1, false)
  end
  return true
end

function M:LeaveSpecialRewardItemViewMode()
  local IsEventHandled = false
  local PlayerController = self:GetOwningPlayer()
  if self.SevenDayIconItem_1:HasUserFocusedDescendants(PlayerController) or self.SevenDayIconItem_2:HasUserFocusedDescendants(PlayerController) then
    IsEventHandled = true
    self:SetFocus()
    self:ResetParentBottomKeyTips()
  elseif self.ParentWidget then
    IsEventHandled = true
    self.ParentWidget:UpdateParentActivityKeyTips(nil, nil, true)
  end
  return IsEventHandled
end

function M:OnKeyDown(MyGeometry, InKeyEvent)
  local IsEventHandled = false
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) and self.RewardType == "SpecialReward" then
    if InKeyName == UIConst.GamePadKey.FaceButtonBottom then
      if self.SevenDayIconItem_2:IsVisible() then
        IsEventHandled = self:EnterSpecialRewardItemViewMode()
      else
        IsEventHandled = true
        self.SevenDayIconItem_1:OnBtnClicked()
      end
    elseif InKeyName == UIConst.GamePadKey.FaceButtonRight then
      IsEventHandled = self:LeaveSpecialRewardItemViewMode()
    end
  end
  if IsEventHandled then
    return UE4.UWidgetBlueprintLibrary.Handled()
  else
    return UE4.UWidgetBlueprintLibrary.UnHandled()
  end
end

function M:BP_GetDesiredFocusTarget()
  if self.RewardType == "SpecialReward" then
    if self.IsReceiveBtnVisible then
      return self.Btn_Click
    else
      return self
    end
  end
  return self
end

return M
