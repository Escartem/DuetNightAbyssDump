require("UnLua")
local TimeUtils = require("Utils.TimeUtils")
local M = Class({
  "BluePrints.Common.TimerMgr",
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:Construct()
  self.Common_RewardsBtn_PC:BindEventOnClicked(self, self.GetReward)
  self.Common_RewardsBtn_PC:SetText(GText("UI_Achievement_GetReward"))
  self.RewardItems = {}
  self.RewardItemWidth = nil
  self.PreAchvUrl = {}
end

function M:OnListItemObjectSet(Content)
  self:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  self.ID = Content.ID
  self.Index = Content.Index
  self.AchievementSystem = Content.AchievementSystem
  self.AchievementSystem.Id2Item[self.ID] = self
  if self.Index < 0 then
    self.Group_Empty:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self.Group_BG:SetRenderOpacity(0.5)
    self.Group_Normal:SetVisibility(ESlateVisibility.Collapsed)
    return
  else
    self.Group_Empty:SetVisibility(ESlateVisibility.Collapsed)
    self.Group_BG:SetRenderOpacity(1)
    self.Group_Normal:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  end
  local data = DataMgr.Achievement[Content.ID]
  if not data then
    return
  end
  self.DetailDes:SetVisibility(ESlateVisibility.Collapsed)
  local avatar = GWorld:GetAvatar()
  local achieve = avatar.Achvs:GetAchv(Content.ID)
  if data.DesUnlockCon == nil or achieve:IsFinished() then
    self.Name:SetText(GText(data.AchievementName))
    self:PlayAnimation(self.NormalAchievement)
    if self.SizeBox_AchievementIcon then
      self.SizeBox_AchievementIcon:SetRenderOpacity(1)
    end
    self.LockedDes = false
  else
    local Avatar = GWorld:GetAvatar()
    if Avatar and ConditionUtils.CheckCondition(Avatar, data.DesUnlockCon) then
      self.Name:SetText(GText(data.AchievementName))
      self.LockedDes = false
      if self.SizeBox_AchievementIcon then
        self.SizeBox_AchievementIcon:SetRenderOpacity(1)
      end
    else
      self.Name:SetText(GText("UI_Achievement_HiddenTitle"))
      self.LockedDes = true
      if data.LockedDes then
        self.Describe:SetText(GText(data.LockedDes))
      else
        self.Describe:SetText(GText("UI_Achievement_HiddenDes"))
      end
      self:PlayAnimation(self.HideAchievement)
      if self.SizeBox_AchievementIcon then
        self.SizeBox_AchievementIcon:SetRenderOpacity(0.5)
      end
    end
  end
  local locked = avatar.Achvs:IsAchvLocked(self.ID)
  if locked then
    self.Describe:SetVisibility(ESlateVisibility.Collapsed)
    self.HB_UnlockCondition:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self.Text_UnlockTitle:SetText(GText("UI_Achievement_LockTip"))
    for i = 1, 3 do
      local preId = achieve.BeforeAchvs[i]
      local widget = self["Achievement_SystemDetail_Item2Condition_PC_" .. i]
      if preId then
        local achievePre = avatar.Achvs:GetAchv(preId)
        if achievePre and not achievePre:IsFinished() then
          local url = preId .. "." .. Content.AchievementSystem.CurrentTypeId .. "." .. self.ID
          self.PreAchvUrl[i] = url
          widget:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
          widget.Key_Condition:CreateCommonKey({
            KeyInfoList = {
              {Type = "Img", ImgShortPath = "X"}
            }
          })
          widget.Text_ConditionDesc:SetText(GText(achievePre.AchievementName))
          widget.Btn_UnlockConditionClick.OnClicked:Clear()
          widget.Btn_UnlockConditionClick.OnClicked:Add(self, function()
            EventManager:FireEvent(EventID.OnAchvHyperlinkClick, url)
          end)
          widget:PlayAnimation(widget.Normal)
        else
          widget:SetVisibility(ESlateVisibility.Collapsed)
        end
      else
        widget:SetVisibility(ESlateVisibility.Collapsed)
      end
    end
  else
    self.HB_UnlockCondition:SetVisibility(ESlateVisibility.Collapsed)
    local Desc = GText(data.AchievementDescribe)
    if Desc then
      self.Describe:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
      local progress = data.TargetProgress
      if achieve:IsIndividual() then
        progress = achieve.CompletionValue
      end
      local str = string.gsub(Desc, "#1", progress)
      if not self.LockedDes then
        self.Describe:SetText(str)
      end
    end
    if data.DetailDes then
      local detailDesc = GText(data.DetailDes)
      self.DetailDes:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
      self.DetailDes:SetText(detailDesc)
    end
  end
  if nil == data.AchievementRarity then
    error("\230\136\144\229\176\177\232\161\168\233\135\140\230\178\161\229\161\171\231\168\128\230\156\137\229\186\166,\233\128\159\229\161\171 ID:" .. self.ID .. GText(data.AchievementName))
  else
    self.WS_AchievementIcon:SetActiveWidgetIndex(data.AchievementRarity - 1)
  end
  for _, item in pairs(self.RewardItems) do
    item:RemoveFromParent()
  end
  local totalWidth = 0
  self.RewardItems = {}
  self.List_ItemRewards:ClearListItems()
  if data.AchievementReward then
    local RewardInfo = DataMgr.Reward[data.AchievementReward]
    local RewardList = {}
    if RewardInfo then
      local RewardIds = RewardInfo.Id or {}
      local RewardCounts = RewardInfo.Count or {}
      local RewardTypes = RewardInfo.Type or {}
      for i = 1, #RewardIds do
        local ItemId = RewardIds[i]
        local Count = RewardUtils:GetCount(RewardCounts[i])
        local Icon = ItemUtils.GetItemIconPath(ItemId, RewardTypes[i])
        local Rarity = ItemUtils.GetItemRarity(ItemId, RewardTypes[i])
        local ItemType = RewardTypes[i]
        local RewardContent = {
          Id = ItemId,
          Type = ItemType,
          ItemCount = Count,
          Icon = Icon,
          Rarity = Rarity
        }
        table.insert(RewardList, RewardContent)
      end
    end
    table.sort(RewardList, function(A, B)
      local rarityX = A.Rarity or 1
      local rarityY = B.Rarity or 1
      if rarityX == rarityY then
        return A.Id < B.Id
      else
        return rarityX > rarityY
      end
    end)
    while #RewardList < 3 do
      do
        local EmptyReward = {
          Id = 0,
          Type = nil,
          ItemCount = nil,
          Icon = nil,
          Rarity = 1,
          IsEmpty = true
        }
        table.insert(RewardList, EmptyReward)
      end
    end
    for _, ItemInfo in pairs(RewardList) do
      local Item = self:NewItemContent(ItemInfo.Type, ItemInfo.Id, ItemInfo.ItemCount)
      self.List_ItemRewards:AddItem(Item)
    end
  end
  self.CompleteMask:SetVisibility(ESlateVisibility.Collapsed)
  if locked then
    self.Change:SetActiveWidgetIndex(0)
  elseif not achieve:IsFinished() then
    self.Change:SetActiveWidgetIndex(1)
    if achieve:IsIndividual() and not data.ShowTargetProgress then
      self.ing_Progress:SetText("(" .. achieve.CurrentValue .. "/" .. achieve.CompletionValue .. ")")
    else
      self.ing_Progress:SetText("(" .. achieve:GetCount() .. "/" .. achieve.TargetNeedCount .. ")")
    end
  elseif achieve:CanRecvReward() then
    self.Change:SetActiveWidgetIndex(2)
    self.Complete_Date:SetTimeText(achieve.Time, UIConst.EnumTimeStyleType.YMD, nil, nil, nil, nil, true)
  else
    self.Change:SetActiveWidgetIndex(3)
    self.Complete_Date_1:SetTimeText(achieve.Time, UIConst.EnumTimeStyleType.YMD, nil, nil, nil, nil, true)
    self.CompleteMask:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    for i = 0, self.List_ItemRewards:GetNumItems() - 1 do
      local Item = self.List_ItemRewards:GetItemAt(i)
      if Item and Item.SelfWidget and Item.SelfWidget.SetIsGot then
        Item.SelfWidget:SetIsGot(true)
      end
    end
  end
  local currentTime = UGameplayStatics.GetTimeSeconds(self)
  if currentTime < Content.StartTime + 0.05 * self.Index + 0.1 and Content.AchievementSystem.PlayInAnimation then
    self:SetRenderOpacity(0)
    if self.Handle then
      self:RemoveTimer(self.Handle)
    end
    local time = 0.05 * self.Index
    if 0 == time then
      time = 0.01
    end
    self.Handle = self:AddTimer(time, function()
      self:SetRenderOpacity(1)
      self:PlayAnimation(self.In)
    end, false, 0, nil, true)
  else
    self:SetRenderOpacity(1)
    self:PlayAnimation(self.In, self.In:GetEndTime())
  end
end

function M:NewItemContent(ItemType, ItemId, Count)
  if 0 == ItemId then
    local Obj = NewObject(UIUtils.GetCommonItemContentClass())
    return Obj
  end
  local ItemData = DataMgr[ItemType][ItemId]
  if not ItemData then
    print(_G.LogTag, "Error: Item Data is nil, ItemType:", ItemType, "ItemId", ItemId)
    return nil
  end
  local NewObj = NewObject(UIUtils.GetCommonItemContentClass())
  NewObj.ItemType = ItemType:gsub("^%l", string.upper)
  NewObj.Id = ItemId
  NewObj.Rarity = ItemData.Rarity or ItemData.WeaponRarity or 1
  NewObj.Icon = ItemData.Icon
  NewObj.Count = Count
  NewObj.IsShowDetails = true
  NewObj.ParentWidget = self
  NewObj.OnMenuOpenChangedEvents = {
    Obj = self,
    Callback = self.OnMenuOpenChanged
  }
  return NewObj
end

function M:OnMenuOpenChanged(bIsOpen, Obj)
  if Obj.SelfWidget and false == bIsOpen and UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
    Obj.SelfWidget.Item:PlayAnimation(Obj.SelfWidget.Item.Hover)
  end
end

function M:GetReward()
  local avatar = GWorld:GetAvatar()
  if not avatar then
    return
  end
  avatar:GetAchvReward(self.ID, self.GetRewardCallBack)
end

function M:Destruct()
  for _, item in pairs(self.RewardItems) do
    item:RemoveFromParent()
  end
  self.RewardItems = {}
end

function M:OnFocusReceived(MyGeometry, InFocusEvent)
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
  if self.GameInputModeSubsystem:GetCurrentInputType() == ECommonInputType.Gamepad then
    self.AchievementSystem.Achievement_Root.BP_Common_OneClickGet.Common_Button_Reward_PC.Img_GamePad:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self.AchievementSystem.OpenRewardDetail = false
    self.Common_RewardsBtn_PC.Img_GamePad:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self.AchievementSystem.Com_Tab_P.Com_KeyTips.Panel_Key:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self["Achievement_SystemDetail_Item2Condition_PC_" .. 1].Key_Condition:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  end
  return self.ID
end

function M:OnFocusLost(InFocusEvent)
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
  self.Common_RewardsBtn_PC.Img_GamePad:SetVisibility(ESlateVisibility.Collapsed)
  self["Achievement_SystemDetail_Item2Condition_PC_" .. 1].Key_Condition:SetVisibility(ESlateVisibility.Collapsed)
  self:StopAnimation(self.Hover)
  self:PlayAnimation(self.Normal)
end

function M:OnPreviewKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local IsEventHandled = false
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
  if "Gamepad_FaceButton_Bottom" ~= InKeyName or self.AchievementSystem.OpenRewardDetail ~= nil and self.AchievementSystem.OpenRewardDetail == true then
  else
    self:AddTimer(0, function()
      self:GetReward()
    end)
    IsEventHandled = true
  end
  if IsEventHandled then
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
  if "Gamepad_LeftThumbstick" == InKeyName then
    self.List_ItemRewards:SetFocus()
    IsEventHandled = true
  elseif "Gamepad_FaceButton_Left" == InKeyName and self.PreAchvUrl[1] then
    local InUrl = Split(self.PreAchvUrl[1], ".")
    local Id = tonumber(InUrl[1])
    local TypeId = tonumber(InUrl[2])
    if not (DataMgr.Achievement[Id] and DataMgr.AchievementType[TypeId]) or self.ID ~= tonumber(InUrl[3]) then
      return
    end
    if self.AchievementSystem.CurrentTypeId == TypeId and self.AchievementSystem.Id2Item[Id] then
      self.AchievementSystem.Achievement_Root.List_Item:NavigateToIndex(self.AchievementSystem.Id2Index[Id])
      self:AddTimer(0.01, function()
        self.AchievementSystem.Id2Item[Id]:PlayAnimation(self.AchievementSystem.Id2Item[Id].scanline)
      end, false, 0, nil, true)
      AudioManager(self):PlayUISound(self, "event:/ui/common/achieve_active", "", nil)
    else
    end
    IsEventHandled = true
  end
  if IsEventHandled then
    return UE4.UWidgetBlueprintLibrary.Handled()
  end
  return UE4.UWidgetBlueprintLibrary.Unhandled()
end

function M:OnTipsOpenChanged(bIsOpen)
  if UIUtils.UtilsGetCurrentInputType() ~= ECommonInputType.Gamepad then
    return
  end
  if not bIsOpen then
    self:AddTimer(0.01, function()
      self:SetFocus()
      self:PlayAnimation(self.Hover)
    end, false, 0, nil, true)
  end
end

function M:GetRewardCallBack()
  EventManager:FireEvent(EventID.GetAchvRewardCallBack)
end

return M
