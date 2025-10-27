require("UnLua")
local EMCache = require("EMCache.EMCache")
local TimeUtils = require("Utils.TimeUtils")
local CommonUtils = require("Utils.CommonUtils")
local AnnouncementUtils = require("BluePrints.UI.WBP.Announcement.AnnounceUtils")
local DebugUnlockAllCondition = false
local M = Class({
  "BluePrints.UI.BP_UIState_C",
  "BluePrints.Common.TimerMgr"
})

function M:OnLoaded(...)
  M.Super.OnLoaded(self, ...)
  self:SetFocus()
  self.IsListPanelShow = false
  self.ZhiliuEventId = DataMgr.EventConstant.ZhiLiuEntrustEventID.ConstantValue
  self.ZhiliuTotalDayNum = 7
  self:InitMainTitle()
  self:InitMainButton()
  self:InitDaySwitchButton()
  self:InitTypeSwitchButton()
  self:InitTabs()
  self:InitRewardProgress()
  self:InitInputDeviceInfo()
  self:PlayAnimation(self.In)
  UIManager(self):SwitchFixedCamera(true, 220040, "Zhiliu", self, "ZhiliuEventTask", {bDestroyNpc = true, IsHaveInOutAnim = false})
  AudioManager(self):PlayUISound(self, "event:/ui/armory/open", "OpenZhiliuEvent", nil)
end

function M:Close()
  self:BindToAnimationFinished(self.Out, function()
    UIManager(self):SwitchFixedCamera(false, 220040, "Zhiliu", self, "ZhiliuEventTask", {bDestroyNpc = true, IsHaveInOutAnim = false})
    M.Super.Close(self)
  end)
  AudioManager(self):SetEventSoundParam(self, "OpenZhiliuEvent", {ToEnd = 1})
  self:PlayAnimation(self.Out)
end

function M:InitMainTitle()
  self.Text_DescTitle:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self.Text_Desc:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self.Text_Shop:SetText(GText("MAIN_UI_SHOP"))
  self.Btn_Shop.OnClicked:Add(self, self.OnClicked_Shop)
  self.Btn_Shop.OnHovered:Add(self, self.OnHovered_Shop)
  self.Group_Shop:SetVisibility(UE4.ESlateVisibility.Collapsed)
end

function M:OnClicked_Shop()
  DebugPrint("ZhiliuEventTask:OnClicked_Shop")
end

function M:OnHovered_Shop()
  AudioManager(self):PlayUISound(self, "event:/ui/activity/zhiliu_shop_hover", nil, nil)
end

function M:InitRewardProgress()
  local RewardResource = DataMgr.EventConstant.ZhiLiuEntrustRewardResource.ConstantValue or 10100
  local IconPath = DataMgr.Resource[RewardResource].Icon
  local RewardNum = DataMgr.EventConstant.ZhiLiuEntrustRewardResourceNum.ConstantValue or 1
  self.Group_TaskProgress:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  self.Text_RewardNum:SetText("x" .. tostring(RewardNum))
  self.Text_TaskProgressTitle:SetText(GText("ZhiLiuEntrust_Progress"))
  UE.UResourceLibrary.LoadObjectAsync(self, IconPath, {
    self,
    M.OnRewardProgressIconLoaded
  })
  self.Btn_TaskProgress.OnClicked:Add(self, self.OnClicked_RewardBtn)
  self.Btn_TaskProgress.OnHovered:Add(self, self.OnHovered_RewardBtn)
  self.Btn_TaskProgress.OnUnhovered:Add(self, self.OnUnhovered_RewardBtn)
  self:UpdateRewardProgress()
end

function M:OnRewardProgressIconLoaded(Obj)
  if Obj and IsValid(self) then
    self.Image_RewardIcon01:SetBrushFromTexture(Obj)
    self.Image_RewardIcon02:SetBrushFromTexture(Obj)
  end
end

function M:OnClicked_RewardBtn()
  DebugPrint("ZhiliuEventTask: OnClicked_RewardBtn", self.IsRewardBtnClickable)
  if not self.IsRewardBtnClickable then
    if not self:IsPlayerAlreadyGotReward() then
      UIManager(self):ShowUITip(UIConst.Tip_CommonTop, GText("ZhiLiuEntrustGrandRewardTips"), 2)
    end
    return
  end
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  
  local function cb(ErrCode, RewardBox)
    DebugPrint("ZhiliuEventTask:OnClicked_RewardBtnCallback")
    if ErrorCode:Check(ErrCode) then
      UIUtils.ShowGetItemPageAndOpenBagIfNeeded(nil, nil, nil, RewardBox, false, nil, self)
      self:SetRewardBtnClickable(false)
    end
  end
  
  Avatar:RpcZhiLiuEntrustGrandRewards(cb)
  self:PlayAnimation(self.Shop_Click)
end

function M:OnHovered_RewardBtn()
  if not self.IsRewardBtnClickable then
    return
  end
  self:PlayAnimation(self.Shop_Hover)
end

function M:OnUnhovered_RewardBtn()
  if not self.IsRewardBtnClickable then
    return
  end
  self:PlayAnimation(self.Shop_UnHover)
end

function M:UpdateRewardProgress()
  local CurrentProgress = self:GetCurrentProgress()
  self.Text_TaskProgress_1:SetText(CurrentProgress)
  self.Text_TaskProgress_2:SetText(self.ZhiliuTotalDayNum)
  local IsClickable = false
  if CurrentProgress >= self.ZhiliuTotalDayNum and not self:IsPlayerAlreadyGotReward() then
    IsClickable = true
  end
  self:SetRewardBtnClickable(IsClickable)
end

function M:SetRewardBtnClickable(IsClickable)
  if self.IsRewardBtnClickable ~= nil and self.IsRewardBtnClickable == IsClickable then
    return
  end
  self.IsRewardBtnClickable = IsClickable
  if IsClickable then
    self:PlayAnimation(self.Receive)
    self.Reddot:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  else
    if self:IsPlayerAlreadyGotReward() then
      self:PlayAnimation(self.Received)
    else
      self:PlayAnimation(self.Receive_Normal)
    end
    self.Reddot:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
  self.Btn_TaskProgress:SetForbidden(not IsClickable)
end

function M:IsPlayerAlreadyGotReward()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return false
  end
  return Avatar.ZhiLiuEntrustGrandRewardGot or false
end

function M:GetCurrentProgress()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return 0
  end
  local CurProgress = 0
  for i = 1, self.ZhiliuTotalDayNum do
    if not (self:IsCombatCompleted(i) and self:IsSubmitCompleted(i)) then
      break
    end
    CurProgress = CurProgress + 1
  end
  return CurProgress
end

function M:InitDaySwitchButton()
  local FirstShowIndex = 0
  local IsCurIndexCompleted = false
  for i = 1, self.ZhiliuTotalDayNum do
    if self:IsTimeSatisfied(i) then
      FirstShowIndex = i
    else
      break
    end
    IsCurIndexCompleted = self:IsSubmitCompleted(i) and self:IsCombatCompleted(i)
    if not IsCurIndexCompleted then
      break
    end
  end
  DebugPrint("ZhiliuEventTask:InitDaySwitchButton", FirstShowIndex)
  for i = 1, self.ZhiliuTotalDayNum do
    local DayTaskTab = self["Tab_" .. i]
    if i < FirstShowIndex then
      DayTaskTab:InitTaskTab(self, i, "Completed")
    elseif i > FirstShowIndex then
      DayTaskTab:InitTaskTab(self, i, "Locked")
    elseif IsCurIndexCompleted then
      DayTaskTab:InitTaskTab(self, i, "Completed")
    else
      DayTaskTab:InitTaskTab(self, i, "Normal")
    end
  end
  if FirstShowIndex > 0 then
    self.MuteDaySwitchAudioOnLoaded = true
    self.MuteTypeSwitchAudioOnLoaded = true
    self["Tab_" .. FirstShowIndex]:OnClickedEvent()
  end
end

function M:OnDaySwitchButtonClicked(TabIndex)
  self:ShowDailyPanel(TabIndex)
  for i = 1, self.ZhiliuTotalDayNum do
    if i ~= TabIndex then
      local DayTaskTab = self["Tab_" .. i]
      DayTaskTab:SetNormal(self, i)
    end
  end
  if self.MuteDaySwitchAudioOnLoaded then
    self.MuteDaySwitchAudioOnLoaded = false
  else
    AudioManager(self):PlayUISound(self, "event:/ui/activity/zhiliu_btn_mid_btn", nil, nil)
  end
end

function M:OnDaySwitchButtonLockedClicked(TabIndex)
  if not self:IsTimeSatisfied(TabIndex) then
    local NowTime = TimeUtils.NowTime()
    local ConfigedTime = DataMgr.ZhiliuDateTab[TabIndex].Time
    if ConfigedTime then
      local TotalDiffTime = ConfigedTime - NowTime
      local DiffDay = math.floor(TotalDiffTime / CommonConst.SECOND_IN_DAY)
      TotalDiffTime = TotalDiffTime - DiffDay * CommonConst.SECOND_IN_DAY
      local DiffHour = math.floor(TotalDiffTime / CommonConst.SECOND_IN_HOUR)
      TotalDiffTime = TotalDiffTime - DiffHour * CommonConst.SECOND_IN_HOUR
      local DiffMin = math.floor(TotalDiffTime / CommonConst.SECOND_IN_MINUTE)
      local TimeArgs = TArray(FFormatArgumentData)
      local FinalStr = ""
      if DiffDay > 0 then
        AnnouncementUtils:_AddFormatArg(TimeArgs, "DD", DiffDay)
        AnnouncementUtils:_AddFormatArg(TimeArgs, "H", DiffHour)
        FinalStr = UKismetTextLibrary.Format(GText("ZhiLiuEntrust_Lock_Time1"), TimeArgs)
      else
        AnnouncementUtils:_AddFormatArg(TimeArgs, "H", DiffHour)
        AnnouncementUtils:_AddFormatArg(TimeArgs, "M", DiffMin)
        FinalStr = UKismetTextLibrary.Format(GText("ZhiLiuEntrust_Lock_Time2"), TimeArgs)
      end
      UIManager(self):ShowUITip(UIConst.Tip_CommonTop, FinalStr)
    end
  else
    UIManager(self):ShowUITip(UIConst.Tip_CommonTop, string.format(GText("ZhiLiuEntrust_Lock_PretextTasks"), TabIndex - 1))
  end
end

function M:InitTypeSwitchButton()
  self.Btn_TabBattle.OnPressed:Add(self, self.OnPressed_CombatTab)
  self.Btn_TabBattle.OnHovered:Add(self, self.OnHovered_CombatTab)
  self.Btn_TabBattle.OnUnHovered:Add(self, self.OnUnHovered_CombatTab)
  self.Btn_TabBattle.OnClicked:Add(self, self.OnClicked_CombatTab)
  self.Btn_TabTrade.OnPressed:Add(self, self.OnPressed_SubmitTab)
  self.Btn_TabTrade.OnHovered:Add(self, self.OnHovered_SubmitTab)
  self.Btn_TabTrade.OnUnHovered:Add(self, self.OnUnHovered_SubmitTab)
  self.Btn_TabTrade.OnClicked:Add(self, self.OnClicked_SubmitTab)
  self.Group_List:SetRenderOpacity(0)
end

function M:SetTypeSwitchButtonState(IsCombat, IsShow)
  local NewVisibility
  if IsShow then
    NewVisibility = UE4.ESlateVisibility.Visible
  else
    NewVisibility = UE4.ESlateVisibility.Collapsed
  end
  if IsCombat then
    self.Battle_New:SetVisibility(NewVisibility)
  else
    self.Trade_New:SetVisibility(NewVisibility)
  end
end

function M:OnClicked_CombatTab(IsForceUpdate)
  self:StopAnimation(self.Battle_Press)
  self:PlayAnimation(self.Battle_Click)
  if not IsForceUpdate and self.IsShowCombatPanel == true then
    return
  end
  self:ShowCombatPanel()
  self:PlayAnimation(self.Trade_Normal)
  self:PlayAnimation(self.Change)
  local CacheName = "ZhiliuEvent_Task_ShowedCombat_" .. self.CurDayIndex
  EMCache:Set(CacheName, true, true)
  self:SetTypeSwitchButtonState(true, false)
  if self.MuteTypeSwitchAudioOnLoaded then
    self.MuteTypeSwitchAudioOnLoaded = false
  else
    AudioManager(self):PlayUISound(self, "event:/ui/activity/zhiliu_btn_small_tab", nil, nil)
  end
end

function M:OnPressed_CombatTab()
  if self.IsShowCombatPanel then
    return
  end
  self:PlayAnimation(self.Battle_Press)
end

function M:OnHovered_CombatTab()
  if self.IsShowCombatPanel then
    return
  end
  self:PlayAnimation(self.Battle_Hover)
end

function M:OnUnHovered_CombatTab()
  if self.IsShowCombatPanel then
    return
  end
  self:PlayAnimation(self.Battle_UnHover)
end

function M:OnClicked_SubmitTab(IsForceUpdate)
  self:StopAnimation(self.Trade_Press)
  self:PlayAnimation(self.Trade_Click)
  if not IsForceUpdate and self.IsShowCombatPanel == false then
    return
  end
  self:ShowSubmitPanel()
  self:PlayAnimation(self.Battle_Normal)
  self:PlayAnimation(self.Change)
  local CacheName = "ZhiliuEvent_Task_ShowedSubmit_" .. self.CurDayIndex
  EMCache:Set(CacheName, true, true)
  self:SetTypeSwitchButtonState(false, false)
  if self.MuteTypeSwitchAudioOnLoaded then
    self.MuteTypeSwitchAudioOnLoaded = false
  else
    AudioManager(self):PlayUISound(self, "event:/ui/activity/zhiliu_btn_small_tab", nil, nil)
  end
end

function M:OnPressed_SubmitTab()
  if not self.IsShowCombatPanel then
    return
  end
  self:PlayAnimation(self.Trade_Press)
end

function M:OnHovered_SubmitTab()
  if not self.IsShowCombatPanel then
    return
  end
  self:PlayAnimation(self.Trade_Hover)
end

function M:OnUnHovered_SubmitTab()
  if not self.IsShowCombatPanel then
    return
  end
  self:PlayAnimation(self.Trade_UnHover)
end

function M:ShowDailyPanel(DayIndex)
  if self.CurDayIndex == DayIndex then
    return
  end
  self.CurDayIndex = DayIndex
  self:RequestSubmitInfo()
  self:RequestCombatInfo()
  if not self:IsCombatCompleted(self.CurDayIndex) then
    self:OnClicked_CombatTab(true)
  elseif not self:IsSubmitCompleted(self.CurDayIndex) then
    self:OnClicked_SubmitTab(true)
  else
    self:OnClicked_CombatTab(true)
  end
end

function M:IsSubmitCompleted(DayIndex)
  if DebugUnlockAllCondition then
    return true
  end
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return false
  end
  if Avatar.ZhiLiuEntrustDict[DayIndex] then
    return Avatar.ZhiLiuEntrustDict[DayIndex].SubmitEntrustCompleted or false
  end
  return false
end

function M:IsCombatCompleted(DayIndex)
  if DebugUnlockAllCondition then
    return true
  end
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return false
  end
  if Avatar.ZhiLiuEntrustDict[DayIndex] then
    return Avatar.ZhiLiuEntrustDict[DayIndex].CombatEntrustCompleted or false
  end
  return false
end

function M:IsTimeSatisfied(DayIndex)
  if DebugUnlockAllCondition then
    return true
  end
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return false
  end
  local ConfigedTime = DataMgr.ZhiliuDateTab[DayIndex].Time
  if not ConfigedTime then
    return true
  end
  local CurTime = TimeUtils.NowTime()
  return ConfigedTime <= CurTime
end

function M:RequestSubmitInfo()
  self.CurSubmitId = DataMgr.ZhiliuDateTab[self.CurDayIndex].SubmitEntrustID
  local SubmitConfig = DataMgr.ZhiliuEntrust[self.CurSubmitId]
  self.CurSubmitText = SubmitConfig.EntrustText
  self.CurSubmitRewardId = SubmitConfig.RewardId or 0
  self.CurSubmitType = SubmitConfig.ChildClass or 1
  self.CurSubmitNeeded = SubmitConfig.Resource or {}
  self.CurSubmitListLen = #self.CurSubmitNeeded
  local CacheName = "ZhiliuEvent_Task_ShowedSubmit_" .. self.CurDayIndex
  local CacheData = EMCache:Get(CacheName, true)
  self:SetTypeSwitchButtonState(false, not CacheData)
  local IsSubmitCompleted = self:IsSubmitCompleted(self.CurDayIndex)
  self:ShowSubmitCompleted(IsSubmitCompleted)
end

function M:RequestCombatInfo()
  self.CurCombatId = DataMgr.ZhiliuDateTab[self.CurDayIndex].CombatEntrustID
  local CombatConfig = DataMgr.ZhiliuEntrust[self.CurCombatId]
  self.CurCombatText = CombatConfig.EntrustText
  self.CurCombatRewardId = CombatConfig.RewardId or 0
  self.CurMonsterTargets = CombatConfig.EntrustMonsters or {}
  self.CurCombatQuestChainId = CombatConfig.QuestChainId or 0
  local CacheName = "ZhiliuEvent_Task_ShowedCombat_" .. self.CurDayIndex
  local CacheData = EMCache:Get(CacheName, true)
  self:SetTypeSwitchButtonState(true, not CacheData)
  local IsCombatCompleted = self:IsCombatCompleted(self.CurDayIndex)
  self:ShowCombatCompleted(IsCombatCompleted)
end

function M:ShowCombatCompleted(IsShow)
  if IsShow then
    self:PlayAnimation(self.Battle_Complete)
  else
    self:PlayAnimation(self.Battle_Complete, self.Battle_Complete:GetEndTime(), 1, UE4.EUMGSequencePlayMode.Reverse)
  end
end

function M:ShowSubmitCompleted(IsShow)
  if IsShow then
    self:PlayAnimation(self.Trade_Complete)
  else
    self:PlayAnimation(self.Trade_Complete, self.Trade_Complete:GetEndTime(), 1, UE4.EUMGSequencePlayMode.Reverse)
  end
end

function M:ShowCombatPanel()
  self.IsShowCombatPanel = true
  DebugPrint("ZhiliuEventTask:ShowCombatPanel", self.CurDayIndex)
  self:ShowListPanel(false)
  self.Text_DetailTitle:SetText(GText("ZhiLiuEntrust_Battle"))
  self.Text_MidDescText:SetText(GText(self.CurCombatText))
  self.Text_RewardTitle:SetText(GText("UI_GameEvent_EventPortal_RewardPreview"))
  self.Text_TradeTitle:SetText(GText("ZhiLiuEntrust_Objective"))
  self.WS_TitleIcon:SetActiveWidgetIndex(0)
  self.WS_DetailImg:SetActiveWidgetIndex(0)
  self:InitRewardList()
  self.TradeItem:ClearListItems()
  for _, UnitId in pairs(self.CurMonsterTargets) do
    local MonsterInfo = DataMgr.Monster[UnitId]
    local Content = NewObject(UIUtils.GetCommonItemContentClass())
    Content.Id = UnitId
    Content.ItemType = "Monster"
    Content.Icon = MonsterInfo.Icon
    Content.ParentWidget = self
    Content.NotInteractive = true
    self.TradeItem:AddItem(Content)
  end
  local MainButtonNewState = self:GetMainButtonState_Combat()
  self.Btn_Trade["SetTaskBtn" .. MainButtonNewState](self.Btn_Trade)
  local IsCompleted = self:IsCombatCompleted(self.CurDayIndex)
  self:ShowTargetCompleteBanner(IsCompleted)
  self:AddTimer(0.1, function()
    self:BP_GetDesiredFocusTarget():SetFocus()
  end)
end

function M:GetMainButtonState_Combat()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return "Normal"
  end
  local QuestChain = Avatar.QuestChains[self.CurCombatQuestChainId]
  if not QuestChain then
    ScreenPrint("\233\133\141\231\189\174\228\186\134\228\184\128\228\184\170\228\184\141\229\173\152\229\156\168\231\154\132\228\187\187\229\138\161\233\147\190Id\239\188\129\232\175\183\231\173\150\229\136\146\230\163\128\230\159\165\239\188\129Id:" .. self.CurCombatQuestChainId)
    return "Normal"
  end
  if self:IsCombatCompleted(self.CurDayIndex) then
    return "Complete"
  end
  if QuestChain:IsDoing() then
    return "Forbid"
  end
  return "Normal"
end

function M:ShowSubmitPanel()
  self.IsShowCombatPanel = false
  DebugPrint("ZhiliuEventTask:ShowSubmitPanel", self.CurDayIndex)
  self.Text_DetailTitle:SetText(GText("ZhiLiuEntrust_Resource"))
  self.Text_MidDescText:SetText(GText(self.CurSubmitText))
  self.Text_RewardTitle:SetText(GText("UI_GameEvent_EventPortal_RewardPreview"))
  self.Text_TradeTitle:SetText(GText("ZhiLiuEntrust_Objective"))
  self.WS_TitleIcon:SetActiveWidgetIndex(1)
  self.WS_DetailImg:SetActiveWidgetIndex(1)
  self:InitRewardList()
  local MainButtonNewState = self:GetMainButtonState_Submit()
  self.Btn_Trade["SetTaskBtn" .. MainButtonNewState](self.Btn_Trade)
  if 1 == self.CurSubmitType then
    self:InitSubmitContent_1()
  elseif 2 == self.CurSubmitType then
    self:InitSubmitContent_2()
  end
  local IsCompleted = self:IsSubmitCompleted(self.CurDayIndex)
  self:ShowTargetCompleteBanner(IsCompleted)
  self:AddTimer(0.1, function()
    self:BP_GetDesiredFocusTarget():SetFocus()
  end)
end

function M:InitSubmitContent_1()
  self.CurSubmitInfoTable = {}
  local Avatar = GWorld:GetAvatar()
  for _, sometable in ipairs(self.CurSubmitNeeded) do
    for _ResourceId, _ in pairs(sometable) do
      local InfoTable = {
        ResourceId = _ResourceId,
        CurCount = 0,
        NeedCount = sometable[_ResourceId]
      }
      if Avatar and Avatar.Resources then
        local CountInBag = 0
        if Avatar.Resources[_ResourceId] then
          CountInBag = tonumber(Avatar.Resources[_ResourceId].Props.Count)
        end
        InfoTable.CurCount = CountInBag
      end
      table.insert(self.CurSubmitInfoTable, InfoTable)
    end
  end
  self.PendingSubmitList = {}
  self.SubmitContentList = {}
  self.TradeItem:ClearListItems()
  for _, Info in pairs(self.CurSubmitInfoTable) do
    local ResourceId = Info.ResourceId
    local ResourceInfo = DataMgr.Resource[ResourceId]
    local Content = NewObject(UIUtils.GetCommonItemContentClass())
    Content.Id = ResourceId
    Content.ItemType = "Resource"
    Content.Rarity = ResourceInfo.Rarity
    Content.Icon = ResourceInfo.Icon
    Content.ParentWidget = self
    Content.Count = Info.CurCount
    Content.NeedCount = Info.NeedCount
    Content.IsShowDetails = true
    Content.UIName = self.WidgetName
    self.TradeItem:AddItem(Content)
    table.insert(self.PendingSubmitList, ResourceId)
    table.insert(self.SubmitContentList, Content)
  end
end

function M:InitSubmitContent_2()
  self.TileView_Select_Role:ClearListItems()
  self.CurSubmitInfoTable = {}
  local ConfigedResourceIds = {}
  for _, sometable in ipairs(self.CurSubmitNeeded) do
    for ResourceId, _ in pairs(sometable) do
      self.CurSubmitInfoTable[ResourceId] = sometable[ResourceId]
      ConfigedResourceIds[ResourceId] = true
    end
  end
  local Avatar = GWorld:GetAvatar()
  if Avatar and Avatar.Resources then
    local AllResourceIds = CommonUtils.Keys(Avatar.Resources)
    table.sort(AllResourceIds, function(a, b)
      if ConfigedResourceIds[a] ~= ConfigedResourceIds[b] then
        return ConfigedResourceIds[a] or false
      end
      local ResourceInfoA = DataMgr.Resource[a]
      local ResourceInfoB = DataMgr.Resource[b]
      if ResourceInfoA.MaterialClassify ~= ResourceInfoB.MaterialClassify then
        if 3 == ResourceInfoA.MaterialClassify then
          return true
        end
        if 3 == ResourceInfoB.MaterialClassify then
          return false
        end
      end
      if ResourceInfoA.Rarity ~= ResourceInfoB.Rarity then
        return ResourceInfoA.Rarity > ResourceInfoB.Rarity
      end
      return a < b
    end)
    for _, ResourceId in ipairs(AllResourceIds) do
      local ResourceInfo = DataMgr.Resource[ResourceId]
      local Content = NewObject(UIUtils.GetCommonItemContentClass())
      Content.Id = ResourceId
      Content.ItemType = "Resource"
      Content.Rarity = ResourceInfo.Rarity
      Content.Icon = ResourceInfo.Icon
      Content.ParentWidget = self
      Content.Count = tonumber(Avatar.Resources[ResourceId].Props.Count)
      Content.OnMouseButtonUpEvents = {
        Obj = self,
        Callback = self.OnBagItemClicked,
        Params = table.pack(Content)
      }
      self.TileView_Select_Role:AddItem(Content)
    end
  end
  self.TileView_Select_Role:RequestFillEmptyContent()
  self.PendingSubmitList = {}
  self.SubmitContentList = {}
  self.SubmitContentIndex = 1
  self.TradeItem:ClearListItems()
  for i = 1, self.CurSubmitListLen do
    local Content = NewObject(UIUtils.GetCommonItemContentClass())
    Content.bAdd = true
    Content.ParentWidget = self
    Content.OnMouseButtonUpEvents = {
      Obj = self,
      Callback = self.OnSubmitItemClicked,
      Params = table.pack(Content)
    }
    self.TradeItem:AddItem(Content)
    self.SubmitContentList[i] = Content
  end
end

function M:OnBagItemClicked(ItemContent)
  DebugPrint("ZhiliuEventTask:OnBagItemClicked", ItemContent.Id)
  if #self.PendingSubmitList >= self.CurSubmitListLen then
    return
  end
  if CommonUtils.HasValue(self.PendingSubmitList, ItemContent.Id) then
    return
  end
  local NeedNum = self.CurSubmitInfoTable[ItemContent.Id] or 1
  local TotalNumInBag = ItemContent.Count
  local SelectNum = math.min(NeedNum, TotalNumInBag)
  ItemContent.SelectNeedCount = SelectNum
  ItemContent.SelectTotalCount = TotalNumInBag
  ItemContent.SelfWidget:SetSelectNum(SelectNum, TotalNumInBag)
  if self.SubmitContentIndex > #self.SubmitContentList then
    ScreenPrint("ZhiliuEventTask:\229\176\157\232\175\149\229\138\160\229\133\165\229\190\133\230\143\144\228\186\164\229\136\151\232\161\168\231\154\132\229\134\133\229\174\185\229\164\167\228\186\142\229\143\175\230\143\144\228\186\164\229\134\133\229\174\185\231\154\132\233\149\191\229\186\166\239\188\129")
    return
  end
  local SubmitContent = self.SubmitContentList[self.SubmitContentIndex]
  SubmitContent.bAdd = false
  SubmitContent.Id = ItemContent.Id
  SubmitContent.ItemType = ItemContent.ItemType
  SubmitContent.Rarity = ItemContent.Rarity
  SubmitContent.Icon = ItemContent.Icon
  SubmitContent.Count = SelectNum
  SubmitContent.NeedCount = NeedNum
  SubmitContent.SelfWidget:Init(SubmitContent)
  table.insert(self.PendingSubmitList, ItemContent.Id)
  self.SubmitContentIndex = self.SubmitContentIndex + 1
  if self.SubmitContentIndex > #self.SubmitContentList then
    self.Btn_Trade:SetTaskBtnNormal()
  end
end

function M:OnSubmitItemClicked(ItemContent)
  DebugPrint("ZhiliuEventTask:OnSubmitItemClicked", ItemContent.Id)
  self:ShowListPanel(true)
  self.TileView_Select_Role:SetFocus()
end

function M:GetMainButtonState_Submit()
  if self:IsSubmitCompleted(self.CurDayIndex) then
    return "Complete"
  else
    return "Normal"
  end
end

function M:InitRewardList()
  local IsShowGot = false
  if self.IsShowCombatPanel then
    IsShowGot = self:IsCombatCompleted(self.CurDayIndex)
  else
    IsShowGot = self:IsSubmitCompleted(self.CurDayIndex)
  end
  self.RewardItem:ClearListItems()
  self.RewardContentList = {}
  local CurRewardId
  if self.IsShowCombatPanel then
    CurRewardId = self.CurCombatRewardId
  else
    CurRewardId = self.CurSubmitRewardId
  end
  local RewardInfo = DataMgr.Reward[CurRewardId]
  if RewardInfo then
    local RewardLen = #RewardInfo.Id
    for i = 1, RewardLen do
      local Id = RewardInfo.Id[i]
      local Type = RewardInfo.Type[i]
      local ResourceInfo = DataMgr[Type][Id]
      local Content = NewObject(UIUtils.GetCommonItemContentClass())
      Content.Id = Id
      Content.ItemType = Type
      Content.Rarity = ResourceInfo.Rarity
      Content.Icon = ResourceInfo.Icon
      Content.ParentWidget = self
      Content.Count = RewardInfo.Count[i][1]
      Content.IsShowDetails = true
      Content.UIName = self.WidgetName
      Content.bHasGot = IsShowGot
      self.RewardItem:AddItem(Content)
      table.insert(self.RewardContentList, Content)
    end
  end
end

function M:ShowListPanel(IsShow)
  if self.IsListPanelShow == IsShow then
    return
  end
  self.IsListPanelShow = IsShow
  if IsShow then
    self:PlayAnimation(self.List_In)
  else
    self:PlayAnimation(self.List_Out)
  end
end

function M:ShowTargetCompleteBanner(IsShow)
  if IsShow then
    self.Group_Done:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    if self.IsShowCombatPanel then
      self.Text_Done:SetText(GText("UI_Entrust_Complete"))
    else
      self.Text_Done:SetText(GText("UI_Entrust_Submitted"))
    end
  else
    self.Group_Done:SetVisibility(ESlateVisibility.Collapsed)
  end
end

function M:InitMainButton()
  self.Btn_Trade:InitTaskBtn(self)
end

function M:OnTaskMainBtnClicked()
  if self.IsShowCombatPanel then
    self:OnCombatMainBtnClicked()
  else
    self:OnSubmitMainBtnClicked()
  end
  AudioManager(self):PlayUISound(self, "event:/ui/activity/zhiliu_btn_accept", nil, nil)
end

function M:OnCombatMainBtnClicked()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  local QuestChain = Avatar.QuestChains[self.CurCombatQuestChainId]
  if not QuestChain then
    ScreenPrint("Zhiliu \233\133\141\231\189\174\228\186\134\228\184\128\228\184\170\228\184\141\229\173\152\229\156\168\231\154\132\228\187\187\229\138\161\233\147\190Id\239\188\129\232\175\183\231\173\150\229\136\146\230\163\128\230\159\165\239\188\129Id:" .. self.CurCombatQuestChainId)
    return
  end
  if not DataMgr.QuestChain[self.CurCombatQuestChainId] then
    ScreenPrint("Zhiliu \232\175\165\228\187\187\229\138\161\233\147\190Id\228\184\141\229\173\152\229\156\168\228\186\142QuestChain\232\161\168\228\184\173\239\188\129Id:" .. self.CurCombatQuestChainId)
    return
  end
  if QuestChain:IsDoing() or QuestChain:IsFinish() then
    ScreenPrint("Zhiliu \232\175\165\228\187\187\229\138\161\233\147\190Id\229\183\178\231\187\143\229\156\168\232\191\155\232\161\140\228\184\173\230\136\150\229\183\178\229\174\140\230\136\144\239\188\129Id:" .. self.CurCombatQuestChainId)
    return
  end
  
  local function cb(Ret)
    DebugPrint("ZhiliuEventTask:OnCombatMainBtnClickedCallback")
    self:BlockAllUIInput(false)
    if ErrorCode:Check(Ret) then
      self.Btn_Trade:SetTaskBtnForbid()
      PageJumpUtils:JumpToTargetPageByJumpId(23, self.CurCombatQuestChainId)
    end
  end
  
  self:BlockAllUIInput(true)
  DebugPrint("ZhiliuEventTask:OnCombatMainBtnClicked")
  Avatar:HandleQuestChainDoing(self.CurCombatQuestChainId, cb)
end

function M:OnSubmitMainBtnClicked()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  DebugPrint("ZhiliuEventTask:OnSubmitMainBtnClicked")
  PrintTable(self.PendingSubmitList)
  
  local function cb(ErrCode, RewardBox)
    DebugPrint("ZhiliuEventTask:OnSubmitMainBtnClickedCallback")
    if ErrorCode:Check(ErrCode) then
      self:OnSubmitSucceed(RewardBox, self.CurDayIndex)
    else
      self:CheckSubmitItemAndSetRed()
    end
    self:BlockAllUIInput(false)
  end
  
  self:BlockAllUIInput(true)
  Avatar:RpcZhiLiuEntrustSubmitResource(self.CurDayIndex, self.PendingSubmitList, cb)
end

function M:OnSubmitSucceed(RewardBox, DayIndex)
  UIUtils.ShowGetItemPageAndOpenBagIfNeeded(nil, nil, nil, RewardBox, false, nil, self)
  self.Btn_Trade:StopAnimation(self.Btn_Trade.Click)
  self:AddTimer(0.1, function()
    self.Btn_Trade:PlayAnimation(self.Btn_Trade.Click, self.Btn_Trade.Click:GetEndTime())
    self.Btn_Trade:SetTaskBtnComplete()
  end)
  self:ShowSubmitCompleted(true)
  if self:IsCombatCompleted(DayIndex) then
    self["Tab_" .. DayIndex]:SetCompleted()
    local IsNextDayTabTimeSatisified = false
    if DayIndex + 1 <= self.ZhiliuTotalDayNum then
      IsNextDayTabTimeSatisified = self:IsTimeSatisfied(DayIndex + 1)
    end
    local NextDayTab = self["Tab_" .. DayIndex + 1]
    if IsNextDayTabTimeSatisified and NextDayTab then
      NextDayTab.IsLocked = false
      NextDayTab:SetNormal()
    end
  end
  for _, RewardContent in pairs(self.RewardContentList) do
    if IsValid(RewardContent) then
      RewardContent.SelfWidget:SetIsGot(true)
    end
  end
  self:ShowTargetCompleteBanner(true)
  self:UpdateRewardProgress()
end

function M:CheckSubmitItemAndSetRed()
  local OuterItems = self.TradeItem:GetDisplayedEntryWidgets()
  for i, Item in pairs(OuterItems) do
    local SubmitContent = self.SubmitContentList[i]
    if IsValid(SubmitContent) then
      local ResourceId = SubmitContent.Id
      if not self.CurSubmitInfoTable[i] then
        Item:PlayAnimation(Item.Warning)
      elseif SubmitContent.Count < SubmitContent.NeedCount then
        Item:PlayAnimation(Item.Warning)
      end
    end
  end
end

function M:InitTabs()
  if CommonUtils.GetDeviceTypeByPlatformName(self) == "PC" then
    local ConfigData = {
      PlatformName = "PC",
      DynamicNode = {
        "Back",
        "ResourceBar",
        "Tip"
      },
      TitleName = GText(DataMgr.EventMain[self.ZhiliuEventId].EventName),
      OwnerPanel = self,
      BackCallback = self.Close
    }
    self.Com_Tab_P:Init(ConfigData, false)
    if self.Com_Tab_P.Com_KeyTips then
      self.Com_Tab_P.Com_KeyTips:SetVisibility(UE4.ESlateVisibility.Collapsed)
    end
  elseif CommonUtils.GetDeviceTypeByPlatformName(self) == "Mobile" then
    local ConfigData = {
      PlatformName = "Mobile",
      DynamicNode = {
        "Back",
        "ResourceBar",
        "Tip"
      },
      TitleName = GText(DataMgr.EventMain[self.ZhiliuEventId].EventName),
      OwnerPanel = self,
      BackCallback = self.Close
    }
    self.Com_Tab_M:Init(ConfigData, false)
  end
end

function M:Construct()
  M.Super.Construct(self)
  self.TileView_Select_Role.OnCreateEmptyContent:Bind(self, function(self)
    local Content = NewObject(UIUtils.GetCommonItemContentClass())
    Content.Conf = nil
    Content.IsSelected = false
    Content.Parent = self
    return Content
  end)
end

function M:Destruct()
  self.TileView_Select_Role.OnCreateEmptyContent:Unbind()
  M.Super.Destruct(self)
end

function M:InitInputDeviceInfo()
  if CommonUtils.GetDeviceTypeByPlatformName(self) == "Mobile" then
    return
  end
  if not self.GameInputModeSubsystem then
    local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
    self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
  end
  self.Key_TabLeft:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "LB"}
    }
  })
  self.Key_TabRight:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "RB"}
    }
  })
  self.Key_ControllerBattle:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "Up"}
    }
  })
  self.Key_ControllerTrade:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "Down"}
    }
  })
  self.Key_RewardTitle:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "LS"}
    }
  })
  self.Btn_Trade.Key_Controller:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "Y"}
    }
  })
  self.Key_Shop:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "Left"}
    }
  })
  self.Key_TaskProgress:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "Menu"}
    }
  })
  self:OnUpdateUIStyleByInputTypeChange(self.GameInputModeSubsystem:GetCurrentInputType(), self.GameInputModeSubsystem:GetCurrentGamepadName())
end

function M:OnUpdateUIStyleByInputTypeChange(CurInputDevice, CurGamepadName)
  if CommonUtils.GetDeviceTypeByPlatformName(self) == "Mobile" then
    return
  end
  if CurInputDevice == ECommonInputType.MouseAndKeyboard then
    self:ShowMouseAndKeyboardView()
  elseif CurInputDevice == ECommonInputType.Gamepad then
    self:ShowGamepadView()
  end
end

function M:ShowMouseAndKeyboardView()
  self.Key_TabLeft:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self.Key_TabRight:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self.Key_ControllerBattle:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self.Key_ControllerTrade:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self.Key_RewardTitle:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self.Btn_Trade.Key_Controller:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self.Key_Shop:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self.Key_TaskProgress:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self:UpdateBottomTabTips("MouseAndKeyboard")
end

function M:ShowGamepadView()
  self.Key_TabLeft:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  self.Key_TabRight:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  self.Key_ControllerBattle:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  self.Key_ControllerTrade:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  self.Key_RewardTitle:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  self.Btn_Trade.Key_Controller:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  self.Btn_Trade.Key_Controller:SetForbidKey(self.Btn_Trade.CurState ~= "Normal")
  self.Key_Shop:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  self.Key_TaskProgress:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  self:UpdateBottomTabTips("Gamepad")
end

function M:UpdateBottomTabTips(InputType)
  if "MouseAndKeyboard" == InputType then
    self.Com_KeyTips:UpdateKeyInfo({
      {
        KeyInfoList = {
          {
            Type = "Text",
            Text = "Esc",
            ClickCallback = function()
              self:Close()
            end
          }
        },
        Desc = GText("UI_BACK")
      }
    })
  elseif "Gamepad" == InputType then
    self.Com_KeyTips:UpdateKeyInfo({
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
        Desc = GText("UI_BACK")
      }
    })
  end
end

function M:FocusToCombatSubmitList()
  self.TradeItem:SetFocus()
end

function M:OnKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  DebugPrint("ZhiliuEventTask:OnKeyDown", InKeyName)
  if InKeyName == Const.GamepadLeftThumbstick then
    self:SwitchFocusRewardList()
  elseif InKeyName == Const.GamepadRightShoulder then
    self:DaySwitchBtnMoveRight(1)
  elseif InKeyName == Const.GamepadLeftShoulder then
    self:DaySwitchBtnMoveRight(-1)
  elseif InKeyName == Const.GamepadFaceButtonUp then
    self.Btn_Trade:OnClickedEvent()
  elseif InKeyName == Const.GamepadFaceButtonRight then
    self:Close()
  elseif InKeyName == Const.GamepadSpecialRight then
    self:OnClicked_RewardBtn()
  end
  return M.Super.OnKeyDown(self, MyGeometry, InKeyEvent)
end

function M:OnPreviewKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local IsHandled = false
  DebugPrint("ZhiliuEventTask:OnPreviewKeyDown", InKeyName)
  if InKeyName == Const.GamepadDPadUp then
    IsHandled = true
    self:OnClicked_CombatTab()
  elseif InKeyName == Const.GamepadDPadDown then
    IsHandled = true
    self:OnClicked_SubmitTab()
  elseif InKeyName == Const.GamepadDPadLeft then
    IsHandled = true
    self:OnClicked_Shop()
  end
  if IsHandled then
    return UE4.UWidgetBlueprintLibrary.Handled()
  end
  return UE4.UWidgetBlueprintLibrary.Unhandled()
end

function M:SwitchFocusRewardList()
  if not self.IsFocusRewardList then
    self.RewardItem:SetFocus()
    self.IsFocusRewardList = true
  else
    self:FocusToCombatSubmitList()
    self.IsFocusRewardList = false
  end
end

function M:DaySwitchBtnMoveRight(Value)
  if not self.CurDayIndex then
    return
  end
  local NewDayIndex = self.CurDayIndex + Value
  local NewActiveTab = self["Tab_" .. NewDayIndex]
  if not NewActiveTab then
    return
  end
  NewActiveTab:OnClickedEvent()
end

function M:BP_GetDesiredFocusTarget()
  local GameInstance = GWorld.GameInstance
  local UIManager = GameInstance:GetGameUIManager()
  local ShopMainPage = UIManager:GetUIObj("ActivityShop")
  if ShopMainPage then
    return ShopMainPage.List_Item
  end
  if self.IsFocusRewardList then
    return self.RewardItem
  else
    return self.TradeItem
  end
end

return M
