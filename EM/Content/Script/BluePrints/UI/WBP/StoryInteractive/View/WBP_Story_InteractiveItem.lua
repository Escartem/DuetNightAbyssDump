local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C",
  "BluePrints.Common.DelayFrameComponent",
  "BluePrints.UI.BP_EMUserWidgetUtils_C"
})
local StoryInteractiveController = require("BluePrints.UI.WBP.StoryInteractive.StoryInteractiveController")
M.State = {
  Normal = 0,
  Press = 1,
  Hover = 2
}

function M:Initialize(Initializer)
end

function M:BindOnItemClicked(ExecuteCallback)
  self.OnItemClicked = ExecuteCallback
end

function M:BindOnItemSelected(ExecuteCallback)
  self.OnItemSelected = ExecuteCallback
end

function M:Construct()
  if CommonUtils.GetDeviceTypeByPlatformName(self) == "PC" then
    self.Key:SetVisibility(ESlateVisibility.Hidden)
  else
    self.Key:SetVisibility(ESlateVisibility.Collapsed)
  end
  self.Button_Area.OnPressed:Add(self, self.OnInteractiveItemPressed)
  self.Button_Area.OnReleased:Add(self, self.OnInteractiveItemReleased)
  self.Button_Area.OnClicked:Add(self, self.OnInteractiveItemClicked)
  self.Button_Area.OnHovered:Add(self, self.OnInteractiveItemHovered)
  self.Button_Area.OnUnhovered:Add(self, self.OnInteractiveItemUnhovered)
  self.Key_Interactive:CreateCommonKey({
    KeyInfoList = {
      {
        Type = "Text",
        Text = CommonUtils:GetKeyText(CommonUtils:GetActionMappingKeyName("StoryInteractive"))
      }
    }
  })
  self:InitWidgetInfoInGamePad()
end

function M:InitWidgetInfoInGamePad()
  local GamepadKeys = UIUtils.GetIconListByActionName("StoryInteractive")
  local ImgShortPath = GamepadKeys[1]
  self.Key_Interactive_GamePad:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = ImgShortPath}
    }
  })
end

function M:Destruct()
end

function M:InitInteractiveInfo(ShowName, SpecIcon, QuestChainId, SpecialQuestId, DynQuestId, bForbidden, ForbiddenMsg)
  self.ShowName = ShowName
  self.QuestChainId = QuestChainId
  self.SpecialQuestId = SpecialQuestId
  self.DynQuestId = DynQuestId
  self.SpecIcon = SpecIcon
  self.bForbidden = bForbidden
  self.ForbiddenMsg = ForbiddenMsg
  self:UpdateInteractiveItemState()
  self:StopAllAnimations()
  self:PlayAnimation(self.Normal)
end

function M:UseGamePadStyle(UseGamePadStyle)
  if CommonUtils.GetDeviceTypeByPlatformName(self) == "PC" then
    local ActiveWidgetIndex = UseGamePadStyle and 1 or 0
    self.WidgetSwitcher_Key:SetActiveWidgetIndex(ActiveWidgetIndex)
  end
end

function M:GetTextColor()
  return self.NormalColor
end

function M:SelectEntryItem(bSelected, IsGamePad)
  self:UseGamePadStyle(IsGamePad)
  if self.bSelected == bSelected then
    return
  end
  if bSelected then
    if CommonUtils.GetDeviceTypeByPlatformName(self) == "PC" then
      self.Key:SetVisibility(ESlateVisibility.Visible)
    else
      self.Key:SetVisibility(ESlateVisibility.Collapsed)
    end
    AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_add", nil, nil)
    self:UpdateIcon()
    if not self.bSelected then
      self:StopAllAnimations()
      self:PlayAnimation(self.Hover)
    end
    self.bSelected = true
  else
    if CommonUtils.GetDeviceTypeByPlatformName(self) == "PC" then
      self.Key:SetVisibility(ESlateVisibility.Hidden)
    else
      self.Key:SetVisibility(ESlateVisibility.Collapsed)
    end
    self:UpdateIcon()
    if self.bSelected then
      self:StopAllAnimations()
      self:PlayAnimation(self.UnHover)
    end
    self.bSelected = false
  end
end

function M:OnInteractiveItemClicked()
  self:StopAllAnimations()
  self:PlayAnimation(self.Click)
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_confirm", nil, nil)
end

function M:OnInteractiveItemPressed()
  self:StopAllAnimations()
  self:PlayAnimation(self.Press)
end

function M:OnInteractiveItemReleased()
  self:StopAllAnimations()
  self:PlayAnimation(self.Normal)
end

function M:OnInteractiveItemHovered()
  if self.OnItemSelected then
    self.OnItemSelected(self)
  end
end

function M:OnInteractiveItemUnhovered()
  if self.bSelected then
    return
  end
  self:StopAllAnimations()
  self:PlayAnimation(self.UnHover)
end

function M:OnAnimationStarted(InAnimation)
end

function M:OnAnimationFinished(InAnimation)
  if self.Click == InAnimation then
    if not self.bForbidden and self.OnItemClicked then
      self.OnItemClicked(self)
    end
  elseif self.Forbidden_Click == InAnimation then
    StoryInteractiveController:ShowToast(self.ForbiddenMsg)
  elseif self.Out == InAnimation then
  end
end

function M:UpdateInteractiveItemState()
  self:UpdateIcon()
  self:UpdateText()
  self:UpdateCondition()
  self:UpdateStateAnim()
end

function M:UpdateIcon()
  local QuestID = self.QuestChainId
  local SpecialQuestID = self.SpecialQuestId
  local InteractiveIconPath
  local DynQuestId = self.DynQuestId
  local bUseMask = true
  if self.bForbidden then
    InteractiveIconPath = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Forbidden.T_Interactive_Forbidden'"
  end
  local QuestIconPath, QuestUseMask = self:GetQuestInteractiveIconPath(QuestID, SpecialQuestID, DynQuestId)
  if not InteractiveIconPath then
    InteractiveIconPath = QuestIconPath
    bUseMask = QuestUseMask
  end
  self.bUseMask = bUseMask
  if InteractiveIconPath then
    rawset(self, "LoadResourceID", nil)
    local Handle = UE.UResourceLibrary.LoadObjectAsyncWithId(self, InteractiveIconPath, {
      self,
      M.OnIconLoadFinish
    })
    if Handle then
      rawset(self, "LoadResourceID", Handle.ResourceID)
    end
  else
    self.WidgetSwitcher_0:SetVisibility(ESlateVisibility.Collapsed)
    self.Img_Item:SetVisibility(ESlateVisibility.Collapsed)
  end
end

function M:OnIconLoadFinish(Object, ResourceID)
  if not IsValid(self) or nil ~= ResourceID and rawget(self, "LoadResourceID") ~= ResourceID then
    return
  end
  if not Object then
    self.WidgetSwitcher_0:SetVisibility(ESlateVisibility.Collapsed)
    self.Img_Item:SetVisibility(ESlateVisibility.Collapsed)
  end
  if not self.bUseMask then
    self.Img_Item:SetBrushResourceObject(Object)
    self.Img_Item:SetVisibility(ESlateVisibility.Visible)
    self.WidgetSwitcher_0:SetVisibility(ESlateVisibility.Collapsed)
  else
    self.Img_Icon:SetBrushResourceObject(Object)
    self.WidgetSwitcher_0:SetActiveWidgetIndex(0)
    self.WidgetSwitcher_0:SetVisibility(ESlateVisibility.Visible)
    self.Img_Item:SetVisibility(ESlateVisibility.Collapsed)
  end
end

function M:UpdateStateAnim()
end

function M:UpdateText()
  self:SetInteractiveText(GText(self.ShowName), self:GetTextColor())
end

function M:SetInteractiveText(Text, Color)
  self.Text_Interactive:SetText(Text)
  self.Text_Interactive:SetColorAndOpacity(Color)
  self.WidgetSwitcher_1:SetActiveWidgetIndex(0)
end

function M:UpdateCondition()
  self.Text_ExploreKeyNum:SetVisibility(ESlateVisibility.Collapsed)
end

function M:GetQuestInteractiveIconPath(InQuestChainId, InSpecialQuestId, DynQuestId)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return self.SpecIcon, true
  end
  if InSpecialQuestId and 0 ~= InSpecialQuestId and DataMgr.SpecialQuestConfig[InSpecialQuestId] then
    InQuestChainId = DataMgr.SpecialQuestConfig[InSpecialQuestId].QuestChainId
  end
  local bQuestInTracking = Avatar.TrackingQuestChainId == InQuestChainId
  if DataMgr.QuestChain[InQuestChainId] then
    local CurQuestChainType = DataMgr.QuestChain[InQuestChainId].QuestChainType
    if CurQuestChainType then
      if bQuestInTracking then
        return DataMgr.QuestTypeIcon[CurQuestChainType].TrackingIcon, not bQuestInTracking
      else
        return DataMgr.QuestTypeIcon[CurQuestChainType].NotTrackingIcon, not bQuestInTracking
      end
    end
  end
  if DynQuestId and 0 ~= DynQuestId then
    return "/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_Explore.T_Gp_Explore", false
  end
  return self.SpecIcon, true
end

function M:PlayAnimation(InAnimation, ...)
  if self.bForbidden then
    if InAnimation == self.Normal then
      InAnimation = self.Forbidden_Normal
    elseif InAnimation == self.Press then
      InAnimation = self.Forbidden_Press
    elseif InAnimation == self.Hover then
      InAnimation = self.Forbidden_Hover
    elseif InAnimation == self.UnHover then
      InAnimation = self.Forbidden_UnHover
    elseif InAnimation == self.Click then
      InAnimation = self.Forbidden_Click
    end
  end
  self.Overridden.PlayAnimation(self, InAnimation, ...)
end

return M
