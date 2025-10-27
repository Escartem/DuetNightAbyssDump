require("UnLua")
local M = Class("BluePrints.UI.BP_UIState_C")

function M:Construct()
  self.Overridden.Construct(self)
  AudioManager(self):PlayUISound(self, "event:/ui/armory/open", "AchievementSystem", nil)
  self:AddDispatcher(EventID.OnGetAchvReward, self, self.OnGetAchvReward)
  self:AddDispatcher(EventID.OnAchvHyperlinkClick, self, self.OnAchvHyperlinkClick)
  self:AddDispatcher(EventID.OnAchvFinished, self, self.OnAchvFinished)
  self:AddDispatcher(EventID.GetAchvRewardCallBack, self, self.GetAchvRewardCallBack)
  if CommonUtils.GetDeviceTypeByPlatformName(self) == "PC" then
    self.Com_Tab_P:Init({
      DynamicNode = {
        "Back",
        "ResourceBar",
        "BottomKey"
      },
      StyleName = "Text",
      OwnerPanel = self,
      BackCallback = self.OnReturnKeyDown,
      TitleName = GText("MAIN_UI_ACHIEVEMENT"),
      BottomKeyInfo = {
        {
          KeyInfoList = {
            {
              Type = "Text",
              Text = "Esc",
              ClickCallback = self.OnReturnKeyDown,
              Owner = self
            }
          },
          GamePadInfoList = {
            {
              Type = "Img",
              ImgShortPath = "B",
              Owner = self
            }
          },
          Desc = GText("UI_BACK")
        },
        {
          GamePadInfoList = {
            {
              Type = "Img",
              ImgShortPath = "LT",
              Owner = self
            }
          },
          Desc = GText("UI_BACK")
        }
      }
    })
    if self.Achievement_Root.BP_Common_OneClickGet:GetVisibility() == ESlateVisibility.SelfHitTestInvisible then
      self:UpdateComTab(true)
    end
  else
    self.Com_Tab_M:Init({
      DynamicNode = {
        "Back",
        "ResourceBar",
        "BottomKey"
      },
      StyleName = "Text",
      OwnerPanel = self,
      BackCallback = self.OnReturnKeyDown,
      TitleName = GText("MAIN_UI_ACHIEVEMENT"),
      BottomKeyInfo = {
        {
          KeyInfoList = {
            {
              Type = "Text",
              Text = "Esc",
              ClickCallback = self.OnReturnKeyDown,
              Owner = self
            }
          },
          Desc = GText("UI_BACK")
        }
      }
    })
  end
  self.AchievementType2ID = {}
  local avatar = GWorld:GetAvatar()
  local type1 = 0
  local type2 = 0
  local type3 = 0
  for id, data in pairs(DataMgr.Achievement) do
    local achv = avatar.Achvs:GetAchv(id)
    if achv:IsFinished() and not avatar.Achvs:IsAchvLocked(id) then
      if 1 == data.AchievementRarity then
        type1 = type1 + 1
      elseif 2 == data.AchievementRarity then
        type2 = type2 + 1
      elseif 3 == data.AchievementRarity then
        type3 = type3 + 1
      end
    end
    if not self.AchievementType2ID[data.AchievementType] then
      self.AchievementType2ID[data.AchievementType] = {}
    end
    table.insert(self.AchievementType2ID[data.AchievementType], id)
  end
  local objectClass = LoadClass("/Game/UI/WBP/Achievement/Widget/Achievement_System_Item_Content.Achievement_System_Item_Content_C")
  self.Achievement_Root.List_Achievement:ClearListItems()
  local index = 0
  local tempId
  for id, _ in pairs(DataMgr.AchievementType) do
    tempId = tempId or id
    if self.AchievementType2ID[id] and #self.AchievementType2ID[id] > 0 then
      local object = NewObject(objectClass)
      object.ID = id
      object.AchievementSystem = self
      object.Index = index
      self.Achievement_Root.List_Achievement:AddItem(object)
      index = index + 1
    end
  end
  self:AddTimer(0.001, function()
    local itemY = self.Achievement_Root.List_Achievement:GetDisplayedEntryWidgets():GetRef(1):GetDesiredSize().Y
    local ItemNeed = math.floor(USlateBlueprintLibrary.GetLocalSize(self.Achievement_Root.List_Achievement:GetCachedGeometry()).Y / itemY)
    ItemNeed = ItemNeed - index + 1
    for i = 1, ItemNeed do
      local object = NewObject(objectClass)
      object.AchievementSystem = self
      object.Index = -1
      self.Achievement_Root.List_Achievement:AddItem(object)
    end
    if ItemNeed > 0 then
      self.Achievement_Root.List_Achievement:SetScrollbarVisibility(UE4.ESlateVisibility.Collapsed)
    else
      self.Achievement_Root.List_Achievement:SetScrollbarVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    end
  end)
  self.Achievement_Root.Count_Total:SetText(type1 + type2 + type3)
  self.Achievement_Root.Count_Gold:SetText(type1)
  self.Achievement_Root.Count_Silver:SetText(type2)
  self.Achievement_Root.Count_Bronze:SetText(type3)
  self.Achievement_Root.BP_Common_OneClickGet.Common_Button_Reward_PC:BindEventOnClicked(self, self.GetAllReward)
  self.Achievement_Root.BP_Common_OneClickGet.Common_Button_Reward_PC:SetText(GText("UI_Achievement_GetAllReward"))
  self.Achievement_Root.Title:SetText(GText("UI_Achievement_Title"))
  self.Achievement_Root.SubTitle:SetText(GText("UI_Achievement_SubTitle"))
  self.FirstIndex = nil
  self:OpenDetail(tempId, 0)
  self:PlayIn()
  if CommonUtils.GetDeviceTypeByPlatformName(self) == "PC" then
    self.Achievement_Root.List_Item:SetScrollbarVisibility(ESlateVisibility.Collapsed)
    self.Achievement_Root.List_Achievement:SetScrollbarVisibility(ESlateVisibility.Collapsed)
    self.Achievement_Root.List_Item:SetControlScrollbarInside(true)
    self.Achievement_Root.List_Achievement:SetControlScrollbarInside(true)
  end
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
  if self.GameInputModeSubsystem:GetCurrentInputType() == ECommonInputType.Gamepad then
    self.Achievement_Root.List_Achievement:NavigateToIndex(0)
  end
  self.CurGamepadName = UIUtils.UtilsGetCurrentGamepadName()
  local ImgPath = UIUtils.UtilsGetKeyIconPathInGamepad("Y", self.CurGamepadName)
  local Img = LoadObject(ImgPath)
  self.Achievement_Root.BP_Common_OneClickGet.Common_Button_Reward_PC.Img_GamePad:SetBrushResourceObject(Img)
  self.Achievement_Root.List_Achievement.OnListViewScrolled:Add(self, self.OnListAchievementScrolled)
  self:AddTimer(0.1, function()
    self:OnListAchievementScrolled()
  end)
  UIUtils.BindListViewReddotAndNewClickEvent(self.Achievement_Root.List_Achievement, self.Achievement_Root.List_RedDotTop, self.Achievement_Root.List_RedDotBottom, nil, nil, function(...)
    local Content = (...)
    if not Content then
      return false, false
    end
    local Node = ReddotManager.GetTreeNode("AchvType" .. Content.ID)
    local bHasReddot = Node and Node:GetNodeCount() > 0
    local bHasNew = false
    return bHasReddot, bHasNew
  end)
end

function M:OpenDetail(TypeId, Index)
  local avatar = GWorld:GetAvatar()
  self.CurrentTypeId = TypeId
  self.CurrentIndex = Index
  if not self.FirstIndex then
    self.FirstIndex = Index
  end
  self.PlayInAnimation = true
  self.Achievement_Root.List_Achievement:SetSelectedIndex(Index)
  self.Achievement_Root.List_Item:ClearListItems()
  local objectClass = LoadClass("/Game/UI/WBP/Achievement/Widget/Achievement_System_Item_Content.Achievement_System_Item_Content_C")
  local typeData = DataMgr.AchievementType[TypeId]
  local achievementId = self.AchievementType2ID[TypeId]
  table.sort(achievementId, function(x, y)
    local achv1 = avatar.Achvs:GetAchv(x)
    local achv2 = avatar.Achvs:GetAchv(y)
    local locked1 = avatar.Achvs:IsAchvLocked(x)
    local locked2 = avatar.Achvs:IsAchvLocked(y)
    local finshNoRec1 = achv1:IsFinished() and achv1:CanRecvReward() and not locked1
    local finshNoRec2 = achv2:IsFinished() and achv2:CanRecvReward() and not locked2
    local finished1 = achv1:IsFinished() and not locked1
    local finished2 = achv2:IsFinished() and not locked2
    if finshNoRec1 == finshNoRec2 and finshNoRec1 then
      return x < y
    elseif finshNoRec1 ~= finshNoRec2 then
      return finshNoRec1
    elseif finished1 == finished2 and finished1 then
      return x < y
    elseif finished1 ~= finished2 then
      return finished2
    elseif locked1 == locked2 then
      return x < y
    else
      return locked2
    end
  end)
  local count = 0
  local index = 0
  self.Id2Index = {}
  self.Id2Item = {}
  for _, id in pairs(achievementId) do
    local data = DataMgr.Achievement[id]
    local needShow = true
    if data.IsShowInList then
      needShow = not avatar.Achvs:IsAchvLocked(id)
    end
    if data and needShow then
      local object = NewObject(objectClass)
      object.ID = id
      object.AchievementSystem = self
      object.Index = index
      object.StartTime = UGameplayStatics.GetTimeSeconds(self)
      self.Id2Index[id] = index
      self.Achievement_Root.List_Item:AddItem(object)
      index = index + 1
      local achv = avatar.Achvs:GetAchv(id)
      if achv:IsFinished() and not avatar.Achvs:IsAchvLocked(id) then
        count = count + 1
      end
    end
  end
  self.Achievement_Root.List_Item:SetCurrentScrollOffset(0)
  self:AddTimer(0.001, function()
    local itemY = self.Achievement_Root.List_Item:GetDisplayedEntryWidgets():GetRef(1):GetDesiredSize().Y
    local ItemNeed = math.floor((USlateBlueprintLibrary.GetLocalSize(self.Achievement_Root.List_Item:GetCachedGeometry()).Y - itemY) / (itemY + self.Achievement_Root.List_Item.EntrySpacing)) + 1
    self.PlayInAnimation = false
    ItemNeed = ItemNeed - index + 1
    for i = 1, ItemNeed do
      local object = NewObject(objectClass)
      object.AchievementSystem = self
      object.Index = -1
      self.Achievement_Root.List_Item:AddItem(object)
    end
    if ItemNeed > 0 then
      self.Achievement_Root.List_Item:SetScrollbarVisibility(UE4.ESlateVisibility.Collapsed)
    else
      self.Achievement_Root.List_Item:SetScrollbarVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    end
    self.Achievement_Root.List_Item:SetEmptyGridItemCount(math.max(0, ItemNeed))
  end)
  self.Achievement_Root.Name_Main:SetText(GText(typeData.AchievementTypeName))
  self.Achievement_Root.Name_Main02:SetText(EnText(typeData.AchievementTypeName))
  if typeData.AchievementTypeIcon2 then
    local icon = LoadObject(typeData.AchievementTypeIcon2)
    if icon then
      self.Achievement_Root.Icon_Main:SetBrushFromTexture(icon, false)
    end
  end
  self.Achievement_Root.Count_Main:SetText(count)
  self.Achievement_Root.Max_Main:SetText(#achievementId)
  self.Achievement_Root.Progress_Main:SetPercent(count / #achievementId)
  local widgets = self.Achievement_Root.List_Achievement:GetDisplayedEntryWidgets():ToTable()
  if 0 == #widgets then
    self.InitTypeID = TypeId
  end
  for _, widget in pairs(widgets) do
    if widget.ID == TypeId then
      if #widget.CanReceiveId > 0 then
        self.CurrentReceiveId = widget.CanReceiveId
        self.Achievement_Root.BP_Common_OneClickGet:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
        if CommonUtils.GetDeviceTypeByPlatformName(self) == "PC" then
          self:UpdateComTab(true)
        end
        break
      end
      self.Achievement_Root.BP_Common_OneClickGet:SetVisibility(ESlateVisibility.Collapsed)
      if CommonUtils.GetDeviceTypeByPlatformName(self) == "PC" then
        self:UpdateComTab(false)
      end
      break
    end
  end
end

function M:OnListAchievementScrolled()
  if not self then
    return
  end
  if self.List_AchievementCooldown then
    self.List_AchievementPending = true
    return
  end
  self.List_AchievementCooldown = true
  self.List_AchievementPending = false
  self:AddTimer(0.1, function()
    if not self then
      return
    end
    self.List_AchievementCooldown = false
    if self.List_AchievementPending then
      self.List_AchievementPending = false
      self:OnListAchievementScrolled()
    end
  end)
  
  local function ReddotAndNewCalFunc(Content)
    if not Content then
      return false, false
    end
    local Node = ReddotManager.GetTreeNode("AchvType" .. Content.ID)
    local bHasReddot = Node and Node:GetNodeCount() > 0
    local bHasNew = false
    return bHasReddot, bHasNew
  end
  
  self:AddTimer(0.033, function()
    if not self then
      return
    end
    self.Achievement_Root.Top:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self.Achievement_Root.Bottom:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self.Achievement_Root.List_RedDotTop:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    UIUtils.UpdateListReddot(self.Achievement_Root.List_Achievement, self.Achievement_Root.List_RedDotTop, self.Achievement_Root.List_RedDotBottom, self.Achievement_Root.List_ArrowTop, self.Achievement_Root.List_ArrowBottom, ReddotAndNewCalFunc)
  end)
end

function M:OnReturnKeyDown()
  if self.Closing or self:IsAnimationPlaying(self.In) then
    return
  end
  self.Closing = true
  self:PlayAnimation(self.Out)
  AudioManager(self):SetEventSoundParam(self, "AchievementSystem", {ToEnd = 1})
end

function M:OnPreviewKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local IsHandled = false
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) then
    if "Gamepad_FaceButton_Bottom" == InKeyName and (self.Achievement_Root.List_Achievement:HasFocusedDescendants() or self.Achievement_Root.List_Achievement:HasAnyUserFocus()) then
      self.Achievement_Root.List_Item:NavigateToIndex(0)
      IsHandled = true
    end
  elseif "SpaceBar" == InKeyName then
    self:GetAllReward()
    IsHandled = true
  end
  if IsHandled then
    return UE4.UWidgetBlueprintLibrary.Handled()
  end
  return UE4.UWidgetBlueprintLibrary.Unhandled()
end

function M:OnKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local IsEventHandled = false
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) then
    if "Gamepad_FaceButton_Right" == InKeyName then
      if self.Achievement_Root.List_Achievement:HasFocusedDescendants() or self.Achievement_Root.List_Achievement:HasAnyUserFocus() then
        self:OnReturnKeyDown()
      else
        self.Achievement_Root.List_Achievement:SetFocus()
      end
      IsEventHandled = true
    elseif "Gamepad_FaceButton_Top" ~= InKeyName or self.OpenRewardDetail ~= nil and self.OpenRewardDetail == true then
    else
      self:GetAllReward()
      IsEventHandled = true
    end
  elseif "Escape" == InKeyName then
    self:OnReturnKeyDown()
    IsEventHandled = true
  end
  if IsEventHandled then
    return UE4.UWidgetBlueprintLibrary.Handled()
  end
  return UE4.UWidgetBlueprintLibrary.Unhandled()
end

function M:OnAnimationFinished(Animation)
  if Animation == self.Out then
    self.Achievement_Root.List_Item:SetControlScrollbarInside(false)
    self.Achievement_Root.List_Achievement:SetControlScrollbarInside(false)
    self:Close()
  end
end

function M:PlayIn()
  self:PlayAnimation(self.In)
  if CommonUtils.GetDeviceTypeByPlatformName(self) == "PC" then
    self.Com_Tab_P:Play_WBP_Com_Tab_P_In()
  else
    self.Com_Tab_M:Play_Com_Tab_M_In()
  end
end

function M:ScrollToId(id)
  if not self.Id2Index[id] then
    return
  end
  self.Achievement_Root.List_Item:ScrollIndexIntoView(self.Id2Index[id])
end

function M:OnGetAchvReward(AchvId, Ret)
  if Ret ~= ErrorCode.RET_SUCCESS then
    local UIManager = GWorld.GameInstance:GetGameUIManager()
    UIManager:ShowError(Ret, 1.5)
    return
  end
  local widgets = self.Achievement_Root.List_Achievement:GetDisplayedEntryWidgets():ToTable()
  for _, widget in pairs(widgets) do
    widget:UpdateRedDot(AchvId)
  end
  if not AchvId or self.Id2Index[AchvId] then
    self:OpenDetail(self.CurrentTypeId, self.CurrentIndex)
    local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
    self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
    if self.GameInputModeSubsystem:GetCurrentInputType() == ECommonInputType.Gamepad then
      self.OpenReward = true
    end
  end
end

function M:OnAchvFinished(AchvId)
  local widgets = self.Achievement_Root.List_Achievement:GetDisplayedEntryWidgets():ToTable()
  for _, widget in pairs(widgets) do
    widget:OnAchvFinished(AchvId)
  end
end

function M:OnItemScrolledIntoView(Item, Widget)
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
  if self.GameInputModeSubsystem:GetCurrentInputType() == ECommonInputType.Gamepad then
    Widget:PlayAnimation(Widget.Hover)
  elseif self.ClickHyperlink then
    Widget:PlayAnimation(Widget.scanline)
    AudioManager(self):PlayUISound(self, "event:/ui/common/achieve_active", "", nil)
    self.ClickHyperlink = false
  end
end

function M:GetAllReward()
  GWorld:GetAvatar():GetAllAchvRewardByType(self.CurrentTypeId, self.CurrentReceiveId, self.GetAchvReward)
end

function M:OnAchvHyperlinkClick(url)
  local inUrl = Split(url, ".")
  local id = tonumber(inUrl[1])
  local typeId = tonumber(inUrl[2])
  if not DataMgr.Achievement[id] or not DataMgr.AchievementType[typeId] then
    return
  end
  if self.CurrentTypeId == typeId then
    self:ScrollToId(id)
  else
    self:OpenDetail(typeId, self.Type2Index[typeId])
  end
  self.ClickHyperlink = true
end

function M:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  DebugPrint("RefreshOpInfoByInputDevice", CurInputDevice, CurGamepadName)
  if self.CurInputDeviceType == CurInputDevice then
    return
  end
  local IsUseKeyAndMouse = CurInputDevice == ECommonInputType.MouseAndKeyboard
  if IsUseKeyAndMouse then
    self:GamepadToPC()
  else
    self:PCToGamepad()
  end
  self.CurInputDeviceType = CurInputDevice
  self.Super.RefreshOpInfoByInputDevice(self, CurInputDevice, CurGamepadName)
end

function M:GamepadToPC()
  self.Achievement_Root.BP_Common_OneClickGet.Common_Button_Reward_PC.Img_GamePad:SetVisibility(ESlateVisibility.Collapsed)
  local Items = self.Achievement_Root.List_Item:GetDisplayedEntryWidgets()
  for _, Item in pairs(Items) do
    Item:OnFocusLost()
  end
end

function M:PCToGamepad()
  self.Achievement_Root.List_Achievement:NavigateToIndex(0)
  self.OpenRewardDetail = false
  self.Achievement_Root.BP_Common_OneClickGet.Common_Button_Reward_PC.Img_GamePad:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
end

function M:UpdateComTab(GetAllReward)
  if self.GetAllRewardTab == GetAllReward then
    return
  end
  if true == GetAllReward then
    local BottomKeyInfo = {
      {
        KeyInfoList = {
          {
            Type = "Text",
            Text = "Space",
            ClickCallback = self.GetAllReward,
            Owner = self
          }
        },
        Desc = GText("UI_Achievement_GetAllReward")
      },
      {
        KeyInfoList = {
          {
            Type = "Text",
            Text = "Esc",
            ClickCallback = self.OnReturnKeyDown,
            Owner = self
          }
        },
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "B",
            Owner = self
          }
        },
        Desc = GText("UI_BACK")
      },
      {
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "LT",
            Owner = self
          }
        },
        Desc = GText("UI_BACK")
      }
    }
    self.Com_Tab_P:UpdateBottomKeyInfo(BottomKeyInfo)
    self.GetAllRewardTab = true
  else
    local BottomKeyInfo = {
      {
        KeyInfoList = {
          {
            Type = "Text",
            Text = "Esc",
            ClickCallback = self.OnReturnKeyDown,
            Owner = self
          }
        },
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "B",
            Owner = self
          }
        },
        Desc = GText("UI_BACK")
      },
      {
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "LT",
            Owner = self
          }
        },
        Desc = GText("UI_BACK")
      }
    }
    self.Com_Tab_P:UpdateBottomKeyInfo(BottomKeyInfo)
    self.GetAllRewardTab = false
  end
end

function M:GetAchvRewardCallBack()
  self.Achievement_Root.List_Item:SetFocus()
end

function M:GetAchvReward()
  EventManager:FireEvent(EventID.GetAchvRewardCallBack)
end

return M
