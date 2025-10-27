require("UnLua")
local TimeUtils = require("Utils.TimeUtils")
local M = Class({
  "BluePrints.UI.BP_UIState_C",
  "BluePrints.Common.TimerMgr"
})
local ActivityUtils = require("Blueprints.UI.WBP.Activity.ActivityUtils")

function M:InitUI()
  self.FocusWidgetName = "GetAllReward"
  self.FocusWidgetWidget = nil
  self.TrainingLevel_RewardBtn.Btn_TrainingLevelGetAll.OnClicked:Add(self, self.OnGetAllReward)
  self.TrainingLevel_RewardBtn.Text_TrainingLevelGetAll:SetText(GText("UI_Mail_Recieveall"))
  self:InitData()
  self:InitRewardList()
  self.GameInputModeSubsystem = UIManager(self):GetGameInputModeSubsystem()
  if IsValid(self.GameInputModeSubsystem) then
    self:UpdateUIByInputDevice(self.GameInputModeSubsystem:GetCurrentInputType())
  end
  self.IsGettingRewards = false
end

function M:InitData()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  self.CurrentLevel = Avatar.Level
  self.eventData = DataMgr.PlayerLvEvent[self.CurActivityId]
  self.levels = {}
  for level, _ in pairs(self.eventData) do
    table.insert(self.levels, level)
  end
  table.sort(self.levels)
end

function M:InitRewardList()
  self.IsBtnForbidden = true
  if not ModController:IsMobile() then
    self.TrainingLevel_RewardBtn.Key_GetAll:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.FocusWidgetName = nil
    local ActivityMain = UIManager(self):GetUIObj("ActivityMain")
    if ActivityMain then
      ActivityMain:UpdateActivityKeyTips()
    end
  end
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  local formattedLevel = "LV." .. tostring(self.CurrentLevel)
  self.TrainingLevel_LevelItem.Text_LevelNum:SetText(formattedLevel)
  self.TrainingLevel_LevelItem.Text_LevelTitle:SetText(GText("PlayerLv_Now"))
  local maxItems = math.min(#self.levels, 5)
  for i = 1, maxItems do
    local levelValue = self.levels[i]
    local textComponent = self["TrainingLevel_NumItem_" .. i].Text_LvNum
    textComponent:SetText(tostring(levelValue))
    local TrainingLevelIconItem = self["TrainingLevel_IconItems_" .. i]
    local TrainingLevel_Point = self["TrainingLevel_Point_" .. i]
    local TrainingLevel_NumItem = self["TrainingLevel_NumItem_" .. i]
    local RewardInfo = DataMgr.Reward[self.eventData[levelValue].PlayerLvReward]
    local isGot = Avatar.ActivityPlayerLvRewardsGot:HasElement(self.CurActivityId, levelValue)
    local isSatisLevel = levelValue <= self.CurrentLevel
    local IsCanGet = isSatisLevel and not isGot
    if isSatisLevel then
      if isGot then
        TrainingLevel_Point:PlayAnimation(TrainingLevel_Point.Received)
        TrainingLevel_NumItem:PlayAnimation(TrainingLevel_NumItem.Received)
      else
        TrainingLevel_Point:PlayAnimation(TrainingLevel_Point.Complete)
        TrainingLevel_NumItem:PlayAnimation(TrainingLevel_NumItem.Complete)
        self.IsBtnForbidden = false
        self.FocusWidgetName = "GetAllReward"
        local ActivityMain = UIManager(self):GetUIObj("ActivityMain")
        if ActivityMain then
          ActivityMain:UpdateActivityKeyTips("GetAllReward")
        end
        if not ModController:IsMobile() and self.CurInputDeviceType == ECommonInputType.Gamepad then
          self.TrainingLevel_RewardBtn.Key_GetAll:SetVisibility(UE4.ESlateVisibility.Visible)
        end
      end
    else
      TrainingLevel_Point:PlayAnimation(TrainingLevel_Point.Normal)
      TrainingLevel_NumItem:PlayAnimation(TrainingLevel_NumItem.Normal)
    end
    for j = 1, 2 do
      local RewardItem = TrainingLevelIconItem["TrainingLevel_IconItem_" .. j]
      local Content = {
        Count = RewardInfo.Count[j][1],
        Id = RewardInfo.Id[j],
        Icon = DataMgr[RewardInfo.Type[j]][RewardInfo.Id[j]].Icon,
        ItemType = RewardInfo.Type[j],
        Rarity = ItemUtils.GetItemRarity(RewardInfo.Id[j], RewardInfo.Type[j]),
        bHasGot = isGot,
        IsShowDetails = true,
        OnMenuOpenChangedEvents = {
          Obj = self,
          Callback = self.MenuOpenChangedEvent
        }
      }
      if ModController:IsMobile() then
        RewardItem.WS_Item:SetActiveWidgetIndex(1)
        RewardItem.Com_Item_Universal_S.WidgetMap = nil
        RewardItem.Com_Item_Universal_S:Init(Content)
        if IsCanGet then
          RewardItem.Com_Item_Universal_S:SetIsCanGet(true)
        end
      else
        RewardItem.WS_Item:SetActiveWidgetIndex(0)
        RewardItem.Com_Item_Universal_M.WidgetMap = nil
        RewardItem.Com_Item_Universal_M:Init(Content)
        if IsCanGet then
          RewardItem.Com_Item_Universal_M:SetIsCanGet(true)
        end
      end
    end
  end
  if self.IsBtnForbidden then
    self.TrainingLevel_RewardBtn.Btn_TrainingLevelGetAll:SetForbidden(true)
  end
end

function M:OnGetAllReward()
  if self.IsBtnForbidden then
    return
  end
  if self.IsGettingRewards then
    return
  end
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  local maxItems = math.min(#self.levels, 5)
  local allRewards = {
    Resources = {}
  }
  local pendingRequests = 0
  local hasRewardsToGet = false
  for i = 1, maxItems do
    local levelValue = self.levels[i]
    local isGot = Avatar.ActivityPlayerLvRewardsGot:HasElement(self.CurActivityId, levelValue)
    local isSatisLevel = levelValue <= self.CurrentLevel
    if isSatisLevel and not isGot then
      hasRewardsToGet = true
      pendingRequests = pendingRequests + 1
    end
  end
  if not hasRewardsToGet then
    return
  end
  self.IsGettingRewards = true
  for i = 1, maxItems do
    local levelValue = self.levels[i]
    local isGot = Avatar.ActivityPlayerLvRewardsGot:HasElement(self.CurActivityId, levelValue)
    local isSatisLevel = levelValue <= self.CurrentLevel
    if isSatisLevel and not isGot then
      local function Callback(Ret, Rewards)
        self:InitRewardList()
        
        if Rewards then
          for categoryName, categoryItems in pairs(Rewards) do
            if not allRewards[categoryName] then
              allRewards[categoryName] = {}
            end
            for itemId, itemInfo in pairs(categoryItems) do
              if not allRewards[categoryName][itemId] then
                allRewards[categoryName][itemId] = {}
              end
              if type(itemInfo) == "table" then
                for key, amount in pairs(itemInfo) do
                  if allRewards[categoryName][itemId][key] then
                    allRewards[categoryName][itemId][key] = allRewards[categoryName][itemId][key] + amount
                  else
                    allRewards[categoryName][itemId][key] = amount
                  end
                end
              elseif allRewards[categoryName][itemId] then
                if type(allRewards[categoryName][itemId]) == "table" then
                  DebugPrint("\232\173\166\229\145\138\239\188\154\229\176\157\232\175\149\229\176\134\230\149\176\229\128\188\228\184\142\232\161\168\229\144\136\229\185\182\239\188\154" .. categoryName .. "[" .. itemId .. "]")
                else
                  allRewards[categoryName][itemId] = allRewards[categoryName][itemId] + itemInfo
                end
              else
                allRewards[categoryName][itemId] = itemInfo
              end
            end
          end
        end
        pendingRequests = pendingRequests - 1
        if 0 == pendingRequests then
          self.IsGettingRewards = false
          UIUtils.ShowGetItemPageAndOpenBagIfNeeded(nil, nil, nil, allRewards, false, nil, self)
          ActivityUtils.TrySubActivityReddotCommon("Red", self.CurActivityId)
          EventManager:FireEvent(EventID.OnUpdateActivityEvent, "TrainingLevelReward", self.CurActivityId)
        end
      end
      
      Avatar:CallServer("RpcActivityPlayerLvGetReward", Callback, self.CurActivityId, levelValue)
    end
  end
end

function M:HandlePreviewKeyDownInPage(MyGeometry, InKeyEvent)
  local IsEventHandled = false
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if "Gamepad_FaceButton_Right" == InKeyName and self.IsSelectItem and self.IsOpenTip == false then
    self:SetFocus()
    self.IsSelectItem = false
    IsEventHandled = true
    local ActivityMain = UIManager(self):GetUIObj("ActivityMain")
    if ActivityMain then
      ActivityMain:UpdateActivityKeyTips("CheckRewardView")
    end
    self.TrainingLevel_RewardBtn.Key_GetAll:SetVisibility(UE4.ESlateVisibility.Visible)
    IsEventHandled = true
  elseif "SpaceBar" == InKeyName then
    self:OnGetAllReward()
    IsEventHandled = true
  end
  return IsEventHandled
end

function M:CleanSelf(bIsRemoveSelf)
  if bIsRemoveSelf then
    self:RemoveFromParent()
  end
end

function M:HidePage(IsNeedPlayOutAnim)
  if IsNeedPlayOutAnim then
    self:PlayFadeOut()
  end
  self:SetVisibility(UIConst.VisibilityOp.Collapsed)
end

function M:PlayFadeOut(IsRemoveFromParent)
  self:PlayAnimation(self.Out)
  if IsRemoveFromParent then
    self:BindToAnimationFinished(self.Out, {
      self,
      self.RemoveFromParent
    })
  end
end

function M:InitPage(ActivityId, ParentTabId, AllActivityId, ParentWidget)
  self.IsSelectItem = false
  self.IsOpenTip = false
  self.CurSelectIndex = 1
  self.CurActivityId = ActivityId
  self.ParentTabId = ParentTabId
  self.AllActivityIds = AllActivityId
  self.ParentWidget = ParentWidget
  local ActivityConfigData = DataMgr.EventMain[self.CurActivityId]
  if ModController:IsMobile() then
    self.ScrollBox_Desc:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
  self.Text_ActivityDesc:SetText(GText(ActivityConfigData.EventDes))
  self.Text_ActivityDesc_White:SetText(GText(ActivityConfigData.EventDes))
  self.WBP_Activity_TrainingLevel_Title.Text_Title:SetText(GText(ActivityConfigData.EventName))
  self.WBP_Activity_TrainingLevel_Title.Text_SubTitle:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self:InitUI()
  for i = 1, 5 do
    local item = self["TrainingLevel_IconItems_" .. i]
    if item then
      for j = 1, 2 do
        local iconItem = item["TrainingLevel_IconItem_" .. j]
        for _, direction in ipairs({
          EUINavigation.Up,
          EUINavigation.Down
        }) do
          iconItem:SetNavigationRuleCustom(direction, {
            self,
            function()
              return self:OnUINavigationItem(i, j, direction)
            end
          })
        end
        if 1 == j then
          iconItem:SetNavigationRuleCustom(EUINavigation.Left, {
            self,
            function()
              if self.IsSelectItem and self.IsOpenTip == false then
                self:SetFocus()
                self.IsSelectItem = false
                local ActivityMain = UIManager(self):GetUIObj("ActivityMain")
                if ActivityMain then
                  ActivityMain:UpdateActivityKeyTips("CheckRewardView")
                end
                self.TrainingLevel_RewardBtn.Key_GetAll:SetVisibility(UE4.ESlateVisibility.Visible)
              end
            end
          })
        end
      end
    end
  end
  local Avatar = GWorld:GetAvatar()
  local IsComplete = false
  if Avatar and self.FinishCondition then
    IsComplete = ConditionUtils.CheckCondition(Avatar, self.FinishCondition)
  end
  if IsComplete then
    local NextDayFiveStamp = TimeUtils.TimestampNextClock(5)
    local RemainActivityTimeDict = UIUtils.GetLeftTimeStrStyle2(NextDayFiveStamp)
    self.Activity_Time:SetTimeText(GText("UI_Event_RemoveRemainTime"), RemainActivityTimeDict)
  else
    self.Activity_Time:SetForeverTimeText(GText("UI_GameEvent_EventTimeRemain"))
  end
end

function M:OnUINavigationItem(index, iconIndex, direction)
  local newIndex = index + (direction == EUINavigation.Up and 1 or -1)
  if newIndex >= 1 and newIndex <= 5 then
    return self["TrainingLevel_IconItems_" .. newIndex]["TrainingLevel_IconItem_" .. iconIndex]
  end
  return nil
end

function M:GetPageConfigData()
  return DataMgr.PlayerLvEvent[self.CurActivityId]
end

function M:PlayFadeIn()
  self:PlayAnimation(self.In)
end

function M:UpdatePage(OperateSrc)
end

function M:ShowPage(IsNeedPlayInAnim)
  if IsNeedPlayInAnim then
    self:PlayFadeIn()
  end
  self:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  self:InitUI()
end

function M:HandleKeyDownInPage(MyGeometry, InKeyEvent)
  local IsEventHandled = false
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) then
    IsEventHandled = self:OnGamePadButtonDown(InKeyName)
  else
  end
  return IsEventHandled
end

function M:OnGamePadButtonDown(InKeyName)
  local IsEventHandled = self:Handle_KeyDownOnGamePad(InKeyName)
  return IsEventHandled
end

function M:Handle_KeyDownOnGamePad(InKeyName)
  local IsEventHandled = false
  if InKeyName == UIConst.GamePadKey.LeftThumb then
    self:SetFocusToFirstAvailableReward()
    IsEventHandled = true
  elseif InKeyName == UIConst.GamePadKey.FaceButtonBottom and self.IsSelectItem == false then
    self:OnGetAllReward()
    IsEventHandled = true
  end
  return IsEventHandled
end

function M:MenuOpenChangedEvent(IsOpened, Content)
  if ModController:IsMobile() then
    return
  end
  local ActivityMain = UIManager(self):GetUIObj("ActivityMain")
  self.LastFocusWidget = Content.SelfWidget
  if IsOpened then
    self.IsOpenTip = true
    if ActivityMain then
      ActivityMain:UpdateActivityKeyTips("EmptyView")
    end
  else
    self.IsOpenTip = false
    if ActivityMain then
      ActivityMain:UpdateActivityKeyTips("SelectView")
    end
    self.LastFocusWidget:SetFocus()
  end
end

function M:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  if not self:HasFocusedDescendants() and not self:HasAnyUserFocus() then
    return
  end
  if self.CurInputDeviceType == CurInputDevice then
    DebugPrint("thy    \229\183\178\231\187\143\230\152\190\231\164\186\231\154\132\230\152\175\232\175\165\232\190\147\229\133\165\230\168\161\229\188\143\239\188\140\228\184\141\233\156\128\232\166\129\232\191\155\232\161\140\229\136\183\230\150\176")
    return
  end
  self.CurInputDeviceType = CurInputDevice
  self.CurGamepadName = CurGamepadName
  self.IsSwitchDevice = true
  self:UpdateUIByInputDevice(self.CurInputDeviceType)
end

function M:UpdateUIByInputDevice(CurInputDeviceType)
  if CurInputDeviceType == ECommonInputType.Gamepad then
    self.TrainingLevel_RewardBtn.Key_GetAll:SetVisibility(UE4.ESlateVisibility.Visible)
  elseif not ModController:IsMobile() then
    local ActivityMain = UIManager(self):GetUIObj("ActivityMain")
    if ActivityMain then
      ActivityMain:UpdateActivityKeyTips(self.FocusWidgetName)
    end
    self.TrainingLevel_RewardBtn.Key_GetAll:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
end

function M:GetCurFocusWidgetInfo()
  self:UpdateUIByInputDevice(self.GameInputModeSubsystem:GetCurrentInputType())
  return self.FocusWidgetName, self.FocusWidgetWidget
end

function M:GetDefaultBottomTips()
  local ResultKeyInfo = {
    {
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "LS"}
      },
      Desc = GText("UI_Controller_CheckReward")
    },
    {
      KeyInfoList = {
        {
          Type = "Img",
          ImgShortPath = "B",
          ClickCallback = self.OnReturnKeyDown,
          Owner = self
        }
      },
      Desc = GText("UI_Tips_Close")
    }
  }
  return ResultKeyInfo
end

function M:OnSubTabNavigationRight()
  self:SetFocusToFirstAvailableReward()
end

function M:SetFocusToFirstAvailableReward()
  local ActivityMain = UIManager(self):GetUIObj("ActivityMain")
  if ActivityMain then
    ActivityMain:UpdateActivityKeyTips("SelectView")
  end
  self.TrainingLevel_RewardBtn.Key_GetAll:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self.IsSelectItem = true
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    self.TrainingLevel_IconItems_1.TrainingLevel_IconItem_1:SetFocus()
    return true
  end
  local maxItems = math.min(#self.levels, 5)
  local focusIndex
  for i = 1, maxItems do
    local levelValue = self.levels[i]
    local isGot = Avatar.ActivityPlayerLvRewardsGot:HasElement(self.CurActivityId, levelValue)
    local isSatisLevel = levelValue <= self.CurrentLevel
    if isSatisLevel and not isGot then
      focusIndex = i
      break
    end
  end
  if focusIndex then
    self["TrainingLevel_IconItems_" .. focusIndex].TrainingLevel_IconItem_1:SetFocus()
  else
    self.TrainingLevel_IconItems_5.TrainingLevel_IconItem_1:SetFocus()
  end
end

function M:OnSpaceBarKeyDown()
  self:OnGetAllReward()
end

return M
