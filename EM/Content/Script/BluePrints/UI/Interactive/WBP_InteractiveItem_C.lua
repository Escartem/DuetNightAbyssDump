require("UnLua")
local WBP_InteractiveItem_C = Class({
  "BluePrints.Common.TimerMgr",
  "BluePrints.UI.BP_EMUserWidget_C"
})
WBP_InteractiveItem_C.State = {
  Normal = 0,
  Press = 1,
  Hover = 2
}
local InteractiveTypeEnum = {
  Default = 0,
  Quest = 1,
  PickUpAll = 3
}
local QuestInteractiveTypeEnum = {CommonQuest = 1, SpecialQuest = 2}

function WBP_InteractiveItem_C:Initialize(Initializer)
  self.InteractiveInfo = nil
  self.CurrentInputDevice = {
    "KeyboardKey",
    "MouseButton"
  }
  self.PlayingAnimations = {}
end

function WBP_InteractiveItem_C:Construct()
  if rawget(self, "bConstruct") then
    return
  end
  rawset(self, "bConstruct", true)
  rawset(self, "bOnRemoved", false)
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
        Text = CommonUtils:GetActionMappingKeyName("Interactive")
      }
    }
  })
  self.Tag_New:SetVisibility(ESlateVisibility.Collapsed)
  self.State = WBP_InteractiveItem_C.State.Normal
end

function WBP_InteractiveItem_C:InitWidgetInfoInGamePad()
  local GamepadKeys = UIUtils.GetIconListByActionName("Interactive")
  local ImgShortPath = GamepadKeys[1]
  self.Key_Interactive_GamePad:CreateCommonKey({
    KeyInfoList = {
      {
        Type = "Img",
        ImgShortPath = ImgShortPath,
        bSpecialLongPress = self.InteractiveInfo:IsLastingInteract()
      }
    }
  })
end

function WBP_InteractiveItem_C:Destruct()
  if rawget(self, "bSkipDestruct") then
    return
  end
  rawset(self, "UseItemIcon", false)
  rawset(self, "bOnRemoved", false)
  rawset(self, "bPickAll", nil)
  rawset(self, "bConstruct", nil)
  rawset(self, "LoadResourceID", nil)
  rawset(self, "IsPickUpAllItem", nil)
  rawset(self, "InteractivePriority", nil)
  if CommonUtils.GetDeviceTypeByPlatformName(self) == "PC" then
    self.Key:SetVisibility(ESlateVisibility.Hidden)
  else
    self.Key:SetVisibility(ESlateVisibility.Collapsed)
  end
end

function WBP_InteractiveItem_C:InitPickAllInfoInGamePad()
  local GamepadKeys = UIUtils.GetIconListByActionName("Interactive")
  local ImgShortPath = GamepadKeys[1]
  self.Key_Interactive_GamePad:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = ImgShortPath}
    }
  })
end

function WBP_InteractiveItem_C:InitInteractiveInfo(InteractiveInfo)
  if self.InteractiveInfo == InteractiveInfo then
    return
  end
  assert(InteractiveInfo)
  self.InteractiveInfo = InteractiveInfo
  self.ShouldHighlight = InteractiveInfo:GetShouldHighlight()
  self:SetInteractiveText(InteractiveInfo:GetInteractiveName(), self:GetTextColor())
  self:UpdateIcon()
  local InteractiveCondition = InteractiveInfo:GetInteractiveCondition()
  if InteractiveCondition then
    self.Text_ExploreKeyNum:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self.Text_ExploreKeyNum:SetText(InteractiveCondition)
  else
    self.Text_ExploreKeyNum:SetVisibility(ESlateVisibility.Collapsed)
  end
  self:UpdateStars()
  self:PlayAnimation(self["in"], 0, 1, UE4.EUMGSequencePlayMode.Forward, 1, true)
  self:PlayAnimation(self:GetAnimation("Normal"))
  self:InitOwnerUuId()
  self.ListPriority = InteractiveInfo.ListPriority or 1
  self:InitWidgetInfoInGamePad()
end

function WBP_InteractiveItem_C:InitPickAllInfo()
  self.InteractiveInfo = nil
  rawset(self, "IsPickUpAllItem", true)
  self:PlayAnimation(self["in"], 0, 1, UE4.EUMGSequencePlayMode.Forward, 1, true)
  self:PlayAnimation(self:GetAnimation("Normal"))
  self:SetInteractiveText(GText("UI_Interaction_Drop_All"), self:GetTextColor())
  local Path = "/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Pick"
  rawset(self, "LoadResourceID", nil)
  local Handle = UE.UResourceLibrary.LoadObjectAsyncWithId(self, Path, {
    self,
    WBP_InteractiveItem_C.OnIconLoadFinish
  })
  if Handle then
    rawset(self, "LoadResourceID", Handle.ResourceID)
  end
  self:InitPickAllInfoInGamePad()
end

function WBP_InteractiveItem_C:InitOwnerUuId()
  if not IsValid(self.InteractiveInfo) then
    return
  end
  self.OwnerUuId = self.InteractiveInfo:GetOwner():GetName()
end

function WBP_InteractiveItem_C:UseGamePadStyle(UseGamePadStyle)
  if CommonUtils.GetDeviceTypeByPlatformName(self) == "PC" then
    local ActiveWidgetIndex = UseGamePadStyle and 1 or 0
    self.WidgetSwitcher_Key:SetActiveWidgetIndex(ActiveWidgetIndex)
  end
end

function WBP_InteractiveItem_C:GetTextColor()
  if not IsValid(self.InteractiveInfo) then
    return self.NormalColor
  end
  if self.InteractiveInfo:GetRarity() > 0 then
    return self.RarityTextColor:GetRef(self.InteractiveInfo:GetRarity())
  else
    return self.InteractiveInfo:IsImportant() and self.ImportantColor or self.NormalColor
  end
end

function WBP_InteractiveItem_C:SelectEntryItem(bSelected, IsGamePad)
  self.bSelected = bSelected
  self:UseGamePadStyle(IsGamePad)
  if bSelected then
    if CommonUtils.GetDeviceTypeByPlatformName(self) == "PC" then
      self.Key:SetVisibility(ESlateVisibility.Visible)
      local InteractiveUI = self:GetInteractiveUI()
      if nil ~= InteractiveUI then
        if InteractiveUI.IsPickingAllInteractiveItem and self:IsPickUpItemWithOneClick() then
          self.Key:SetVisibility(ESlateVisibility.Hidden)
        else
          self.Key:SetVisibility(ESlateVisibility.Visible)
        end
      end
    else
      self.Key:SetVisibility(ESlateVisibility.Collapsed)
    end
    AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_add", nil, nil)
    self:StopAnimation(self:GetAnimation("Normal"))
    self:StopAnimation(self:GetAnimation("UnHover"))
    self:PlayAnimation(self:GetAnimation("Hover"))
    self:UpdateIcon()
    self.State = WBP_InteractiveItem_C.State.Hover
  else
    if CommonUtils.GetDeviceTypeByPlatformName(self) == "PC" then
      self.Key:SetVisibility(ESlateVisibility.Hidden)
    else
      self.Key:SetVisibility(ESlateVisibility.Collapsed)
    end
    self:StopAnimation(self:GetAnimation("Hover"))
    self:PlayAnimation(self:GetAnimation("UnHover"))
    self:UpdateIcon()
    self.State = WBP_InteractiveItem_C.State.Normal
  end
end

function WBP_InteractiveItem_C:IsPickUpItemWithOneClick()
  if not IsValid(self.InteractiveInfo) then
    return false
  end
  return self.InteractiveInfo:CanPickUpWithOneClick()
end

function WBP_InteractiveItem_C:OnInteractiveItemPressed()
  local InteractiveUI = self:GetInteractiveUI()
  if not InteractiveUI then
    return
  end
  if self:IsAnimationPlaying(self.Out) or self:IsAnimationPlaying(self.Press) then
    return
  end
  InteractiveUI:SelectSpecifiedItem(self)
  self.bPressed = true
  InteractiveUI:PressedSelectAction(true)
end

function WBP_InteractiveItem_C:PlayPressAnim()
  local InteractiveUI = self:GetInteractiveUI()
  if not InteractiveUI then
    return
  end
  self.State = WBP_InteractiveItem_C.State.Press
  self:PlayInteractiveItemAnim("Press", false)
  if InteractiveUI.CurInputDeviceType == ECommonInputType.Gamepad and IsValid(self.InteractiveInfo) and self.InteractiveInfo:IsLastingInteract() then
    self.Key_Interactive_GamePad:OnButtonPressed()
  end
end

function WBP_InteractiveItem_C:OnInteractiveItemReleased()
  local InteractiveUI = self:GetInteractiveUI()
  if not InteractiveUI then
    return
  end
  InteractiveUI:ReleasedSelectAction(true)
  self.bPressed = false
end

function WBP_InteractiveItem_C:PlayReleaseAnim()
  if self.bSelected and CommonUtils.GetDeviceTypeByPlatformName(self) == "PC" then
    self:PlayInteractiveItemAnim("Hover", false)
    self.State = WBP_InteractiveItem_C.State.Hover
    local InteractiveUI = self:GetInteractiveUI()
    if not InteractiveUI then
      return
    end
    if InteractiveUI.CurInputDeviceType == ECommonInputType.Gamepad and IsValid(self.InteractiveInfo) and self.InteractiveInfo:IsLastingInteract() then
      self.Key_Interactive_GamePad:OnButtonReleased()
    end
  else
    self:PlayInteractiveItemAnim("Normal", false)
    self.State = WBP_InteractiveItem_C.State.Normal
  end
end

function WBP_InteractiveItem_C:OnInteractiveItemClicked()
  local InteractiveUI = self:GetInteractiveUI()
  if not InteractiveUI then
    return
  end
  if self:IsAnimationPlaying(self.Click) then
    return
  end
  if not self:TryPlayClickAnim() then
    InteractiveUI:ClickSelectAction()
  end
end

function WBP_InteractiveItem_C:OnInteractiveItemHovered()
  if not self:CanDoAction() then
    return
  end
  local InteractiveUI = self:GetInteractiveUI()
  if not InteractiveUI then
    return
  end
  InteractiveUI:HoveredSelectAction(self)
end

function WBP_InteractiveItem_C:OnInteractiveItemUnhovered()
  if not self:CanDoAction() then
    return
  end
  if self.bPressed then
    self:OnInteractiveItemReleased()
  end
end

function WBP_InteractiveItem_C:GetInteractiveUI()
  local UIManager = UIManager(self)
  assert(UIManager, "Can't get UIManager")
  return UIManager:GetUIObj(UIConst.InteractiveUIName)
end

function WBP_InteractiveItem_C:TryPlayClickAnim()
  if IsValid(self.InteractiveInfo) and self.InteractiveInfo:IsLastingInteract() then
    return false
  end
  self:PlayInteractiveItemAnim("Click")
  return true
end

function WBP_InteractiveItem_C:OnAnimationStarted(InAnimation)
  if self.UnLock == InAnimation then
    self.Tag_New:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    return
  end
  if self.In == InAnimation or self.Out == InAnimation then
    return
  end
  self.PlayingAnimations[InAnimation] = true
end

function WBP_InteractiveItem_C:OnAnimationFinished(InAnimation)
  self.PlayingAnimations[InAnimation] = nil
  if rawget(self, "bOnRemoved") then
    return
  end
  if self.bRemoveing then
    return
  end
  if self.Click == InAnimation then
    local InteractiveUI = self:GetInteractiveUI()
    if not InteractiveUI then
      return
    end
    rawset(self, "bOnRemoved", true)
    if self.bReAddClick then
      self.bReAddClick = false
      return
    end
    if rawget(self, "bPickAll") then
      if IsValid(self.InteractiveInfo) then
        self.InteractiveInfo:BtnClicked(UGameplayStatics.GetPlayerCharacter(self, 0), 0)
      end
    else
      InteractiveUI:ClickSelectAction()
    end
    InteractiveUI:OnInteractiveItemRemoveAnimFinish(self)
  elseif self.Forbidden_Click == InAnimation then
    if IsValid(self.InteractiveInfo) then
      self.InteractiveInfo:OnClicked_Forbidden()
    end
  elseif self.Lock_Click == InAnimation then
    if IsValid(self.InteractiveInfo) then
      self.InteractiveInfo:OnClicked_Locked()
    end
  elseif self.Out == InAnimation then
    local InteractiveUI = self:GetInteractiveUI()
    if not InteractiveUI then
      return
    end
    if self.bReAddOut then
      self.bReAddOut = false
      return
    end
    rawset(self, "bOnRemoved", true)
    InteractiveUI:OnInteractiveItemRemoveAnimFinish(self)
  end
  self.bForceStop = false
end

function WBP_InteractiveItem_C:ReAdd()
  if not self:IsAnimationPlaying(self.Out) and not self:IsAnimationPlaying(self.Click) then
    return
  end
  if self:IsAnimationPlaying(self.Out) then
    self.bReAddOut = true
    self:StopAnimation(self.Out)
  end
  if self:IsAnimationPlaying(self.Click) then
    self.bReAddClick = true
    self:StopAnimation(self.Click)
  end
  self:PlayAnimation(self["in"], 0, 1, UE4.EUMGSequencePlayMode.Forward, 1, true)
  rawset(self, "bOnRemoved", false)
end

function WBP_InteractiveItem_C:CanDoAction()
  return not self:IsAnimationPlaying(self.Out) and not self:IsAnimationPlaying(self.Click) and not rawget(self, "bPickAll")
end

function WBP_InteractiveItem_C:GetKeyName(ActionName)
  local InputSetting = UE4.UInputSettings.GetInputSettings()
  local ActionKeys = UE4.TArray(UE4.FInputActionKeyMapping)
  InputSetting:GetActionMappingByName(ActionName, ActionKeys)
  for i, KeyMap in ipairs(ActionKeys) do
    local key = KeyMap.Key
    for i, v in pairs(self.CurrentInputDevice) do
      if UE4.UKismetInputLibrary["Key_Is" .. v](key) then
        local res = UE4.UFormulaFunctionLibrary.Key_GetFName(key)
        local res_TextMap_index = string.gsub(res, " ", "_")
        if DataMgr.TextMap[res_TextMap_index] then
          res = GText(res_TextMap_index)
        end
        return res, v
      end
    end
  end
  return nil, nil
end

function WBP_InteractiveItem_C:PlayInteractiveItemAnim(AnimName, bRestoreState)
  if self:IsAnimationPlaying(self.Out) or self:IsAnimationPlaying(self.Click) then
    return
  end
  if nil == bRestoreState then
    bRestoreState = true
  end
  self.bForceStop = true
  self:StopAllInteractiveAnim(AnimName)
  self:PlayAnimation(self:GetAnimation(AnimName), 0, 1, UE4.EUMGSequencePlayMode.Forward, 1, bRestoreState)
end

function WBP_InteractiveItem_C:StopAllInteractiveAnim(AnimName)
  self.bRemoveing = true
  local IgnoreAnimation
  if AnimName then
    IgnoreAnimation = self:GetAnimation(AnimName)
  end
  for Animation, Value in pairs(self.PlayingAnimations) do
    if IgnoreAnimation ~= Animation then
      self:StopAnimation(Animation)
    end
  end
  self.bRemoveing = false
end

function WBP_InteractiveItem_C:GetAnimation(AnimName)
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(GWorld.GameInstance, 0)
  if not Player then
    return
  end
  if not IsValid(self.InteractiveInfo) then
    return self[AnimName]
  end
  if self.InteractiveInfo:IsLocked() then
    local FinalAnimationName = self["Lock_" .. AnimName] and "Lock_" .. AnimName or AnimName
    return self[FinalAnimationName]
  end
  if self.InteractiveInfo:IsForbidden(Player) then
    local FinalAnimationName = self["Forbidden_" .. AnimName] and "Forbidden_" .. AnimName or AnimName
    return self[FinalAnimationName]
  end
  return self[AnimName]
end

function WBP_InteractiveItem_C:UpdateStars()
  if not IsValid(self.InteractiveInfo) then
    return
  end
  local Stars = self.InteractiveInfo:GetStars()
  local Visibility = Stars and ESlateVisibility.HitTestInvisible or ESlateVisibility.Collapsed
  self.HB_Star:SetVisibility(Visibility)
  self.WS_Temple:SetVisibility(Visibility)
  self.WS_TempleIcon:SetVisibility(Visibility)
  if not Stars then
    return
  end
  self.Group_Temple:SetVisibility(ESlateVisibility.HitTestInvisible)
  if -2 == Stars then
    self.HB_Star:SetVisibility(ESlateVisibility.Collapsed)
    self.WS_Temple:SetVisibility(ESlateVisibility.HitTestInvisible)
    self.WS_Temple:SetActiveWidgetIndex(0)
    self.WS_TempleIcon:SetVisibility(ESlateVisibility.HitTestInvisible)
    self.WS_TempleIcon:SetActiveWidgetIndex(0)
  elseif -1 == Stars then
    self.HB_Star:SetVisibility(ESlateVisibility.Collapsed)
    self.WS_Temple:SetVisibility(ESlateVisibility.HitTestInvisible)
    self.WS_Temple:SetActiveWidgetIndex(1)
    self.WS_TempleIcon:SetVisibility(ESlateVisibility.HitTestInvisible)
    self.WS_TempleIcon:SetActiveWidgetIndex(1)
  else
    self.WS_TempleIcon:SetVisibility(ESlateVisibility.Collapsed)
    self.HB_Star:SetVisibility(ESlateVisibility.HitTestInvisible)
    for i = 1, Stars do
      self["WBP_LevelMap_TempleStarItem_" .. i]:SetSmallStar()
      self["WBP_LevelMap_TempleStarItem_" .. i]:SetTipsNormal()
    end
    for i = Stars + 1, 3 do
      self["WBP_LevelMap_TempleStarItem_" .. i]:SetSmallStar()
      self["WBP_LevelMap_TempleStarItem_" .. i]:SetTipsEmpty()
    end
    if 3 == Stars then
      self.WS_Temple:SetVisibility(ESlateVisibility.HitTestInvisible)
      self.WS_Temple:SetActiveWidgetIndex(1)
    end
  end
end

function WBP_InteractiveItem_C:UpdateInteractiveItemState()
  self:UpdateIcon()
  self:UpdateText()
  self:UpdateCondition()
  self:UpdateStateAnim()
end

function WBP_InteractiveItem_C:UpdateIcon()
  if not IsValid(self.InteractiveInfo) then
    return
  end
  local PlayerCharacter = UGameplayStatics.GetPlayerCharacter(self, 0)
  local InteractiveIconPath, UseItemIcon = self.InteractiveInfo:GetInteractiveIcon(PlayerCharacter)
  local QuestID = self.InteractiveInfo:GetQuestID()
  local SpecialQuestID = self.InteractiveInfo:GetSpecialQuestID()
  if QuestID and (0 ~= QuestID or SpecialQuestID and 0 ~= SpecialQuestID) and not self.InteractiveInfo:IsForbidden() and self.InteractiveInfo:GetQuestInteractiveType() ~= QuestInteractiveTypeEnum.SpecialQuest then
    local QuestIconPath, bInTracking = self:GetQuestInteractiveIconPath(QuestID, SpecialQuestID)
    InteractiveIconPath = QuestIconPath and QuestIconPath or InteractiveIconPath
    UseItemIcon = bInTracking
  end
  rawset(self, "UseItemIcon", UseItemIcon)
  if InteractiveIconPath then
    rawset(self, "LoadResourceID", nil)
    local Handle = UE.UResourceLibrary.LoadObjectAsyncWithId(self, InteractiveIconPath, {
      self,
      WBP_InteractiveItem_C.OnIconLoadFinish
    })
    if Handle then
      rawset(self, "LoadResourceID", Handle.ResourceID)
    end
  else
    self.WidgetSwitcher_0:SetVisibility(ESlateVisibility.Collapsed)
    self.Img_Item:SetVisibility(ESlateVisibility.Collapsed)
  end
end

function WBP_InteractiveItem_C:OnIconLoadFinish(Object, ResourceID)
  if not IsValid(self) or nil ~= ResourceID and rawget(self, "LoadResourceID") ~= ResourceID then
    return
  end
  local PlayerActor = UE4.UGameplayStatics.GetPlayerCharacter(GWorld.GameInstance, 0)
  if not PlayerActor then
    return
  end
  if not Object then
    self.WidgetSwitcher_0:SetVisibility(ESlateVisibility.Collapsed)
    self.Img_Item:SetVisibility(ESlateVisibility.Collapsed)
  end
  if rawget(self, "UseItemIcon") then
    self.Img_Item:SetBrushResourceObject(Object)
    self.Img_Item:SetVisibility(ESlateVisibility.Visible)
    self.WidgetSwitcher_0:SetVisibility(ESlateVisibility.Collapsed)
  else
    if self.ShouldHighlight and not self.InteractiveInfo:IsLocked() and not self.InteractiveInfo:IsForbidden(PlayerActor) then
      local IconDynaMaterial = self.Img_Icon_Special:GetDynamicMaterial()
      IconDynaMaterial:SetTextureParameterValue("Mask", Object)
      self.WidgetSwitcher_0:SetActiveWidgetIndex(1)
    else
      self.Img_Icon:SetBrushResourceObject(Object)
      self.WidgetSwitcher_0:SetActiveWidgetIndex(0)
    end
    self.WidgetSwitcher_0:SetVisibility(ESlateVisibility.Visible)
    self.Img_Item:SetVisibility(ESlateVisibility.Collapsed)
  end
end

function WBP_InteractiveItem_C:UpdateStateAnim()
  self:StopAllInteractiveAnim()
  if self.State == WBP_InteractiveItem_C.State.Normal then
    self:PlayAnimation(self:GetAnimation("Normal"), 0, 1, UE4.EUMGSequencePlayMode.Forward, 10000)
  elseif self.State == WBP_InteractiveItem_C.State.Press then
    self:PlayAnimation(self:GetAnimation("Press"), 0, 1, UE4.EUMGSequencePlayMode.Forward, 10000)
  elseif self.State == WBP_InteractiveItem_C.State.Hover then
    self:PlayAnimation(self:GetAnimation("Hover"), 0, 1, UE4.EUMGSequencePlayMode.Forward, 10000)
  end
end

function WBP_InteractiveItem_C:UpdateText()
  if not IsValid(self.InteractiveInfo) then
    return
  end
  self:SetInteractiveText(self.InteractiveInfo:GetInteractiveName(), self:GetTextColor())
end

function WBP_InteractiveItem_C:SetInteractiveText(Text, Color)
  if self.ShouldHighlight then
    self.Text_Interactive_Special:SetText(Text)
    self.WidgetSwitcher_1:SetActiveWidgetIndex(1)
  else
    self.Text_Interactive:SetText(Text)
    self.Text_Interactive:SetColorAndOpacity(Color)
    self.WidgetSwitcher_1:SetActiveWidgetIndex(0)
  end
end

function WBP_InteractiveItem_C:UpdateCondition()
  if not IsValid(self.InteractiveInfo) then
    return
  end
  local InteractiveCondition = self.InteractiveInfo:GetInteractiveCondition()
  if InteractiveCondition then
    self.Text_ExploreKeyNum:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self.Text_ExploreKeyNum:SetText(InteractiveCondition)
  else
    self.Text_ExploreKeyNum:SetVisibility(ESlateVisibility.Collapsed)
  end
end

function WBP_InteractiveItem_C:GetInteractivePriority()
  if rawget(self, "InteractivePriority") then
    return self.InteractivePriority
  end
  if rawget(self, "IsPickUpAllItem") then
    local Priority = DataMgr.InteractiveType[InteractiveTypeEnum.PickUpAll].Priority
    rawset(self, "InteractivePriority", Priority)
    self.InteractivePriority = Priority
    return Priority
  end
  if IsValid(self.InteractiveInfo) then
    local Priority = self.InteractiveInfo:GetInteractivePriority()
    rawset(self, "InteractivePriority", Priority)
    return Priority
  end
  return nil
end

function WBP_InteractiveItem_C:GetQuestInteractiveIconPath(InQuestChainId, InSpecialQuestId)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  if InSpecialQuestId and 0 ~= InSpecialQuestId and DataMgr.SpecialQuestConfig[InSpecialQuestId] then
    InQuestChainId = DataMgr.SpecialQuestConfig[InSpecialQuestId].QuestChainId
  end
  local bQuestInTracking = Avatar.TrackingQuestChainId == InQuestChainId
  if DataMgr.QuestChain[InQuestChainId] then
    local CurQuestChainType = DataMgr.QuestChain[InQuestChainId].QuestChainType
    if CurQuestChainType then
      if bQuestInTracking then
        return DataMgr.QuestTypeIcon[CurQuestChainType].TrackingIcon, true
      else
        return DataMgr.QuestTypeIcon[CurQuestChainType].NotTrackingIcon, false
      end
    end
  end
  return nil
end

return WBP_InteractiveItem_C
