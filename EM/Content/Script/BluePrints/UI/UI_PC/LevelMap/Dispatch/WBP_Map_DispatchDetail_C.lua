require("UnLua")
local M = Class({
  "BluePrints.UI.BP_UIState_C"
})
local TimeUtils = require("Utils.TimeUtils")
local DispatchStateEnum = {
  Finished = 0,
  Doing = 1,
  Dispatching = 2,
  Unlock = 3,
  CanDispatch = 4
}

function M:Initialize(Initializer)
  M.Super.Initialize(self)
  self.Dispatch = nil
  self.AbilityList = {}
  self.Owner = nil
  self.AgentList = {}
  self.SpecialAbility = {}
  self.AgentAbility = {}
  self.AgentCount = 0
  self.SpecialAbilityBubble = nil
  self.IsPlayIn = true
end

function M:OnLoaded(...)
end

function M:Construct()
  self.Btn_CheckReward.OnClicked:Add(self, self.OnClickCheckReward)
  self.Btn_Select.Button_Area.OnClicked:Add(self, self.OnClickDispatch)
  self.Btn_Confirm.Button_Area.OnClicked:Add(self, self.OnClickConfirm)
  self.Btn_Cancel.Button_Area.OnClicked:Add(self, self.CancelDispatch)
  self.Btn_CheckBuff.OnClicked:Add(self, self.OpenSpecailAbility)
  self.Btn_Go.Button_Area.OnClicked:Add(self, self.GotoCloestTeleportPoint)
  self.Btn_Nearby.Button_Area.OnClicked:Add(self, self.GotoCloestTeleportPoint)
  EventManager:AddEvent(EventID.CancelDispatch, self, self.CancelDispatchEvent)
  EventManager:AddEvent(EventID.StartDispatch, self, self.StartDispatchEvent)
  EventManager:AddEvent(EventID.CompleteDispatch, self, self.CompleteDispatchEvent)
  self.List_ExReward.BP_OnEntryInitialized:Add(self, self.OnListItemInited)
end

function M:Destruct()
  self.Btn_CheckReward.OnClicked:Remove(self, self.OnClickCheckReward)
  self.Btn_Select.Button_Area.OnClicked:Remove(self, self.OnClickDispatch)
  self.Btn_Confirm.Button_Area.OnClicked:Remove(self, self.OnClickConfirm)
  self.Btn_Cancel.Button_Area.OnClicked:Remove(self, self.CancelDispatch)
  self.Btn_CheckBuff.OnClicked:Remove(self, self.OpenSpecailAbility)
  self.Btn_Go.Button_Area.OnClicked:Remove(self, self.GotoCloestTeleportPoint)
  EventManager:RemoveEvent(EventID.CancelDispatch, self, self.CancelDispatchEvent)
  EventManager:RemoveEvent(EventID.StartDispatch, self, self.StartDispatchEvent)
  EventManager:RemoveEvent(EventID.CompleteDispatch, self, self.CompleteDispatchEvent)
  if IsValid(self.GameInputModeSubsystem) then
    self.GameInputModeSubsystem.OnInputMethodChanged:Remove(self, self.RefreshOpInfoByInputDevice)
  end
end

function M:InitDispatchDetail(Dispatch)
  self:PlayAnimation(self.In)
  self:SetDispatchDetail(Dispatch)
  self.Text_Reward:SetText(GText("UI_Dispatch_Toast_BaseReward"))
  self.Text_Ability:SetText(GText("UI_Disptach_Recom"))
  self.Text_Buff:SetText(GText("UI_Disptach_Buff"))
  self.Btn_Go.Text_Button:SetText(GText("UI_Disptach_Goto"))
  self.Text_ExReward:SetText(GText("UI_Disptach_RewardShow"))
  self.Text_ExTip:SetText(GText("UI_Dispatch_Toast_RewardWarm"))
  self.Text_Controller_Check:SetText(GText("UI_GACHA_DETAIL"))
  self:InitKeyInfo()
  self:InitListenEvent()
  self:RefreshBaseInfo()
  self:IsShowExtraText(false)
  self:SetNavigationRuleBase(EUINavigation.Up, EUINavigationRule.Stop)
  self:SetNavigationRuleBase(EUINavigation.Down, EUINavigationRule.Stop)
  self:SetNavigationRuleBase(EUINavigation.Left, EUINavigationRule.Stop)
  self:SetNavigationRuleBase(EUINavigation.Right, EUINavigationRule.Stop)
  self.List_Reward:SetNavigationRuleBase(EUINavigation.Up, EUINavigationRule.Stop)
  self.List_Reward:SetNavigationRuleBase(EUINavigation.Left, EUINavigationRule.Stop)
  self.List_Reward:SetNavigationRuleExplicit(EUINavigation.Down, self.List_ExReward)
  self.List_ExReward:SetNavigationRuleExplicit(EUINavigation.Up, self.List_Reward)
  self.List_ExReward:SetNavigationRuleBase(EUINavigation.Left, EUINavigationRule.Stop)
  self.List_ExReward:SetNavigationRuleBase(EUINavigation.Down, EUINavigationRule.Stop)
end

function M:RrefreshDispatchDetail(Dispatch)
  self:RemoveTimer("RefreshRemainingTime")
  if self.IsPlayIn == true then
    self:PlayAnimation(self.In)
  else
    self.IsPlayIn = true
  end
  self.AgentCount = 0
  self:SetDispatchDetail(Dispatch)
end

function M:SetDispatchDetail(Dispatch)
  self.Tip_ExBuff.Main:SetRenderOpacity(0)
  self.Dispatch = Dispatch
  self.AgentAbility = {}
  self.AgentList = {}
  self.AbilityList = {}
  self.SpecialAbility = {}
  self.LastCount = 0
  self.WBox_ExtraBuff:ClearChildren()
  self.WBox_Ability:ClearChildren()
  self.List_Reward:ClearListItems()
  self.List_ExReward:ClearListItems()
  local DispatchData = DataMgr.Dispatch[Dispatch.DispatchId]
  local DispatchName = DataMgr.DispatchUI[DispatchData.DispatchUIId].DispatchName
  local DispatchDes = DataMgr.DispatchUI[DispatchData.DispatchUIId].DispatchDes
  local DispatchRarity = DispatchData.Rarity
  local DispatchType = DispatchData.DispatchType
  self.Text_Title:SetText(GText(DispatchName))
  self.Text_Location:SetText(GText(DataMgr.Region[Dispatch.RegionId].RegionName))
  self.Text_Describe:SetText(GText(DispatchDes))
  self:SetDispatchRarity(DispatchRarity)
  self:SetDispatchType(DispatchType)
  self:SetBasicReward()
  self:SetDispatchReward()
  self:InitAbilityItem()
  self:InitAgentList()
  self:InitBtnInfo()
end

function M:SetDispatchRarity(DispatchRarity)
  if 1 == DispatchRarity then
    local Icon = LoadObject("/Game/UI/Texture/Dynamic/Atlas/Map/T_Map_DetailQuality_Green.T_Map_DetailQuality_Green")
    self.Quality:SetBrushResourceObject(Icon)
    self.Text_Title:SetColorAndOpacity(self.Quality_Text_Green)
    self.Icon_Type:SetColorAndOpacity(self.Quality_Icon_Green)
  elseif 2 == DispatchRarity then
    local Icon = LoadObject("/Game/UI/Texture/Dynamic/Atlas/Map/T_Map_DetailQuality_Blue.T_Map_DetailQuality_Blue")
    self.Quality:SetBrushResourceObject(Icon)
    self.Text_Title:SetColorAndOpacity(self.Quality_Text_Blue)
    self.Icon_Type:SetColorAndOpacity(self.Quality_Icon_Blue)
  elseif 3 == DispatchRarity then
    local Icon = LoadObject("/Game/UI/Texture/Dynamic/Atlas/Map/T_Map_DetailQuality_Purple.T_Map_DetailQuality_Purple")
    self.Quality:SetBrushResourceObject(Icon)
    self.Text_Title:SetColorAndOpacity(self.Quality_Text_Purple)
    self.Icon_Type:SetColorAndOpacity(self.Quality_Icon_Purple)
  end
end

function M:SetDispatchType(DispatchType)
  if "Battle" == DispatchType then
    local Icon = LoadObject("/Game/UI/Texture/Dynamic/Atlas/Map/T_Map_IconBattle.T_Map_IconBattle")
    self.Icon_Type:SetBrushResourceObject(Icon)
  elseif "Collect" == DispatchType then
    local Icon = LoadObject("/Game/UI/Texture/Dynamic/Atlas/Map/T_Map_IconProduce.T_Map_IconProduce")
    self.Icon_Type:SetBrushResourceObject(Icon)
  elseif "Social" == DispatchType then
    local Icon = LoadObject("/Game/UI/Texture/Dynamic/Atlas/Map/T_Map_IconSocial.T_Map_IconSocial")
    self.Icon_Type:SetBrushResourceObject(Icon)
  end
end

function M:SetBasicReward()
  local Rewards = DataMgr.DynQuest[self.Dispatch.DispatchId].Reward
  if nil == Rewards then
    return
  end
  table.sort(Rewards, function(a, b)
    return a.Rarity > b.Rarity
  end)
  local RewardContents = {}
  for _, RewardId in ipairs(Rewards) do
    local RewardInfo = DataMgr.Reward[RewardId]
    if RewardInfo then
      local Ids = RewardInfo.Id or {}
      local RewardCount = RewardInfo.Count or {}
      local TableName = RewardInfo.Type or {}
      for i = 1, #Ids do
        local ItemId = Ids[i]
        local Count = RewardUtils:GetCount(RewardCount[i])
        local Icon = ItemUtils.GetItemIconPath(ItemId, TableName[i])
        local Rarity = ItemUtils.GetItemRarity(ItemId, TableName[i])
        local ItemType = TableName[i]
        local RewardContent = {}
        RewardContent.Id = ItemId
        RewardContent.Count = Count
        RewardContent.Icon = Icon
        RewardContent.Rarity = Rarity
        RewardContent.ItemType = ItemType
        RewardContent.IsShowDetails = true
        table.insert(RewardContents, RewardContent)
      end
    end
  end
  table.sort(RewardContents, function(a, b)
    return a.Rarity > b.Rarity
  end)
  for _, RewardContent in ipairs(RewardContents) do
    local Reward = NewObject(UIUtils.GetCommonItemContentClass())
    Reward.Id = RewardContent.Id
    Reward.Count = RewardContent.Count
    Reward.Icon = RewardContent.Icon
    Reward.Rarity = RewardContent.Rarity
    Reward.ItemType = RewardContent.ItemType
    Reward.IsShowDetails = true
    
    function Reward.AfterInitCallback(Widget)
      Widget:BindEvents(self, {
        OnMenuOpenChanged = self.OnRewardMenuOpenChanged
      })
    end
    
    self.List_Reward:AddItem(Reward)
  end
end

function M:OnRewardMenuOpenChanged(bIsOpen)
  if bIsOpen then
    if self.Owner.Key_Tip == nil or self.UsingGamepad == false then
      return
    end
    self.Owner.Key_Tip.Panel_Key:ClearChildren()
  elseif self.UsingGamepad then
    self:InitPadKeyInfo()
  end
end

function M:SetDispatchReward()
  local Rewards = DataMgr.Dispatch[self.Dispatch.DispatchId].RewardId
  if nil == Rewards then
    return
  end
  local RewardInfo = DataMgr.Reward[Rewards[1]]
  if RewardInfo then
    local Ids = RewardInfo.Id or {}
    local RewardCount = RewardInfo.Count or {}
    local TableName = RewardInfo.Type or {}
    for i = 1, #Ids do
      local ItemId = Ids[i]
      local Count = RewardUtils:GetCount(RewardCount[i])
      local Icon = ItemUtils.GetItemIconPath(ItemId, TableName[i])
      local Rarity = ItemUtils.GetItemRarity(ItemId, TableName[i])
      local ItemType = TableName[i]
      local RewardContent = NewObject(UIUtils.GetCommonItemContentClass())
      RewardContent.Id = ItemId
      RewardContent.Count = Count
      RewardContent.Icon = Icon
      RewardContent.Rarity = Rarity
      RewardContent.ItemType = ItemType
      RewardContent.IsShowDetails = true
      
      function RewardContent.AfterInitCallback(Widget)
        Widget:BindEvents(self, {
          OnMenuOpenChanged = self.OnRewardMenuOpenChanged
        })
      end
      
      self.List_ExReward:AddItem(RewardContent)
    end
  end
end

function M:SetSuccessDispatchReward()
  self.List_ExReward:ClearListItems()
  local Reward = DataMgr.Dispatch[self.Dispatch.DispatchId].RewardId
  local Type = self.Dispatch.State
  if Type == CommonConst.DispatchState.Perfect then
    self:SetRewardItem(Reward[1], self.List_ExReward)
  elseif Type == CommonConst.DispatchState.Success then
    self:SetRewardItem(Reward[2], self.List_ExReward)
  elseif Type == CommonConst.DispatchState.Qualified then
    self:SetRewardItem(Reward[3], self.List_ExReward)
  elseif Type == CommonConst.DispatchState.Disqualified then
    self:SetRewardItem(Reward[4], self.List_ExReward)
  end
end

function M:SetRewardItem(RewardId, RewardsList)
  if nil == RewardId then
    return
  end
  local RewardInfo = DataMgr.Reward[RewardId]
  if RewardInfo then
    local Ids = RewardInfo.Id or {}
    local RewardCount = RewardInfo.Count or {}
    local TableName = RewardInfo.Type or {}
    for i = 1, #Ids do
      local ItemId = Ids[i]
      local Count = RewardUtils:GetCount(RewardCount[i])
      local Icon = ItemUtils.GetItemIconPath(ItemId, TableName[i])
      local Rarity = ItemUtils.GetItemRarity(ItemId, TableName[i])
      local ItemType = TableName[i]
      local RewardContent = NewObject(UIUtils.GetCommonItemContentClass())
      RewardContent.Id = ItemId
      RewardContent.Count = Count
      RewardContent.Icon = Icon
      RewardContent.Rarity = Rarity
      RewardContent.ItemType = ItemType
      RewardContent.IsShowDetails = true
      
      function RewardContent.AfterInitCallback(Widget)
        Widget:BindEvents(self, {
          OnMenuOpenChanged = self.OnRewardMenuOpenChanged
        })
      end
      
      RewardsList:AddItem(RewardContent)
    end
  end
end

function M:OnListItemInited(Content, EntryUI)
  local DispatchState = self.Dispatch.State
  if DispatchState == CommonConst.DispatchState.Unlock or DispatchState == CommonConst.DispatchState.Doing and 0 == self.Dispatch.DispatchCharsList:Length() or DispatchState == CommonConst.DispatchState.CanDispatch then
    EntryUI:SetShadow(true)
  end
end

function M:InitAbilityItem()
  local DispatchDemand = self.Dispatch.DispatchDemand
  local Path = "/Game/UI/WBP/Map/Widget/Dispatch/WBP_Map_Ability_L.WBP_Map_Ability_L"
  for Type, Count in pairs(DispatchDemand) do
    for i = 1, Count do
      local AbilityItem = UIManager(self):CreateWidget(Path)
      if nil ~= AbilityItem then
        local IconPath = DataMgr.CharDispatchTag[Type].Icon
        local Icon = LoadObject(IconPath)
        AbilityItem.Icon_Ability:SetBrushResourceObject(Icon)
        AbilityItem:PlayAnimation(AbilityItem.No_Active)
        self:SetColor(AbilityItem, Type)
        table.insert(self.AbilityList, {
          Widget = AbilityItem,
          Type = Type,
          IsActive = false
        })
        self.WBox_Ability:AddChildToWrapBox(AbilityItem)
      end
    end
  end
end

function M:ChangeAbilityItem(Id)
end

function M:OnClickCheckReward()
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_small", nil, nil)
  self.Btn_CheckReward_S:PlayAnimation(self.Btn_CheckReward_S.Click)
  local RewardId = DataMgr.Dispatch[self.Dispatch.DispatchId].RewardId
  local Parent
  if self.Owner.DispatchAgentList then
    Parent = self.Owner.DispatchAgentList
  elseif self.Owner.DispatchList then
    Parent = self.Owner.DispatchList
  else
    Parent = self
  end
  local Params = {
    RewardList = RewardId,
    Owner = self.Owner
  }
  UIManager(self):ShowCommonPopupUI(100138, Params, Parent)
end

function M:OpenAgentList()
  self.Owner:OpenAgentList()
  self.Switch_Btn:SetActiveWidgetIndex(1)
  self.Btn_Confirm.Text_Button:SetText(GText("UI_Disptach_State_Begin"))
  self:UpdateSuccessRate()
  self:UpdateExptectedTime()
  if self.UsingGamepad then
    self.Btn_Confirm:SetGamePadImg("X")
  end
  self:RefreshConfirmBtn()
  if self.Owner.DispatchList == nil then
    self.Owner.RealWildMap:ShowAllMiniHead(self.Dispatch.DispatchId)
  end
end

function M:RealClose()
  self:RemoveFromParent()
  self.Owner.DispatchDetail = nil
end

function M:Close()
  self:BindToAnimationFinished(self.Out, function()
    self:RealClose()
  end)
  self:PlayAnimation(self.Out)
end

function M:BindAgentButton()
  for i = 0, 2 do
    local Agent = self.WBox_Agent:GetChildAt(i)
    Agent.Btn_Add.OnClicked:Add(self, function()
      self:OnClickAgent(i + 1)
    end)
    Agent.RemoveAgent.Button_Minus.OnClicked:Add(self, function()
      self:RemoveAgentData(i + 1)
    end)
  end
end

function M:InitAgentList()
  if self.Dispatch.DispatchCharsList:Length() > 0 then
    for Index, Id in pairs(self.Dispatch.DispatchCharsList) do
      self.AgentList[Index] = CommonUtils.ObjId2Str(Id)
      self.AgentCount = self.AgentCount + 1
    end
  else
    for i = 1, self.Dispatch.DispatchPerson do
      self.AgentList[i] = 0
    end
  end
end

function M:IsShowExtraText(IsShow)
  if IsShow then
    self.Panel_ExTip:SetVisibility(ESlateVisibility.Visible)
  else
    self.Panel_ExTip:SetVisibility(ESlateVisibility.Collapsed)
  end
end

function M:IsSetAwardGray(IsShadow)
  for _, Content in pairs(self.List_ExReward:GetListItems()) do
    Content.bShadow = IsShadow
    Content.SelfWidget:Init(Content)
  end
end

function M:InitAbility(IdList)
  for Index, UuId in pairs(IdList) do
    local Id = CommonUtils.ObjId2Str(UuId)
    self:UpdateAbilityUI(true, Id, false)
  end
end

function M:RemoveAgentData(Index, CharId, IsPlay)
  local AgentId
  if nil ~= Index then
    local Id = self.AgentList[Index]
    AgentId = Id
    self.AgentList[Index] = 0
  else
    local Ind = 0
    for Index, Id in pairs(self.AgentList) do
      if Id == CharId then
        Ind = Index
        AgentId = CharId
        break
      end
    end
    self.AgentList[Ind] = 0
  end
  self.AgentCount = self.AgentCount - 1
  self.Owner.DispatchAgentList:UpdateAgentItem(AgentId)
  self:UpdateAbilityUI(false, AgentId, IsPlay)
  self:UpdateSuccessRate()
  self:UpdateExptectedTime()
  self:UpdateRemoveTips()
  self:RefreshConfirmBtn()
  self.Owner.RealWildMap:RemoveDispatchPoint(self.Dispatch.DispatchId, AgentId)
end

function M:AddAgentData(Id, IsPlay, AbilityList)
  local Ind = 0
  for Index, Id in pairs(self.AgentList) do
    if 0 == Id then
      Ind = Index
      break
    end
  end
  if 0 ~= Ind then
    self.AgentList[Ind] = Id
  end
  self.AgentCount = self.AgentCount + 1
  self:UpdateAbilityUI(true, Id, IsPlay)
  self:UpdateSuccessRate()
  self:UpdateExptectedTime()
  self:UpdateAddTips()
  self:RefreshConfirmBtn()
  self.Owner.RealWildMap:RefreshDispatchPoint(self.Dispatch.DispatchId, Id)
end

function M:UpdateRemoveTips()
  if self.MatchTime == false and false == self.MatchSuccess and 0 ~= self.Tip_ExBuff.Main:GetRenderOpacity() then
    self.Tip_ExBuff:PlayAnimation(self.Tip_ExBuff.Out)
  end
end

function M:UpdateAddTips()
  if self.MatchTime or self.MatchSuccess then
    if 0 == self.Tip_ExBuff.Main:GetRenderOpacity() then
      self.Tip_ExBuff:PlayAnimation(self.Tip_ExBuff.In)
    end
    if self.MatchTime and self.MatchSuccess == false then
      self.Tip_ExBuff.Line:SetVisibility(ESlateVisibility.Collapsed)
    elseif self.MatchTime and self.MatchSuccess then
      self.Tip_ExBuff.Line:SetVisibility(ESlateVisibility.Visible)
    end
  end
end

function M:UpdateSuccessRate()
  self.Switch_Type:SetVisibility(UE4.ESlateVisibility.Visible)
  self.Switch_Type:SetActiveWidgetIndex(1)
  self.Text_Success01:SetText(GText("UI_Disptach_SuccessRate"))
  local Res = self:CalSuccessRate()
  if Res > self.LastCount then
    AudioManager(self):PlayUISound(self, "event:/ui/common/dispatch_success_rate_up", "", nil)
  end
  if self.LastCount < 100 and Res >= 100 then
    self:PlayAnimation(self.Agent_Success)
  elseif self.LastCount < 100 and Res < 100 then
    self:PlayAnimation(self.Agent_Normal)
  end
  self.LastCount = Res
  self:AddTimer(0.1, function()
    self:IsSetAwardGray(false)
  end)
  self.Text_Percent01:SetText(Res)
end

function M:UpdateExptectedTime()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  local BaseTime = self.Dispatch:GetDispatchTime()
  local Effect = DataMgr.CharDispatchTag.Workaholic.DispatchEffectParam / 10000
  local Count = 0
  for Id, Items in pairs(self.SpecialAbility) do
    local Char = Avatar.Chars[CommonUtils.Str2ObjId(Id)]
    local Tag = Char:GetCurrentUnlockDispatchTag()
    for Tag, Number in pairs(Tag) do
      if "Workaholic" == Tag then
        Count = Count + Number
      end
    end
  end
  local Res
  if 0 == Count then
    Res = BaseTime * 60
  else
    Res = math.floor((BaseTime - BaseTime * Count * Effect) * 60)
  end
  if Count > 0 then
    self.MatchTime = true
    self.Tip_ExBuff.Panel_Double:SetVisibility(UE4.ESlateVisibility.Visible)
    self.Tip_ExBuff.Text_Buff02:SetText(string.format(GText("UI_Disptach_Buff_UseTime"), GText(BaseTime * Count * Effect / 60 .. GText("UI_GameEvent_TimeRemain_Hour"))))
  else
    self.MatchTime = false
    self.Tip_ExBuff.Panel_Double:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
  local EndTime = TimeUtils.NowTime() + Res
  local RemainTimeDict, TimeCount = UIUtils.GetLeftTimeStrStyle2(EndTime)
  self.ExpectTime02.Image_ClockIcon:SetVisibility(ESlateVisibility.Collapsed)
  self.ExpectTime02.Text_TimeDesc:SetColorAndOpacity(self.Color_Green)
  self.ExpectTime02:SetTimeText(GText("UI_Disptach_DispatchTime"), RemainTimeDict)
end

function M:UpdateRemainingTime()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  local StartTime = self.Dispatch.StartTime
  local BaseTime = self.Dispatch:GetDispatchTime()
  local Effect = DataMgr.CharDispatchTag.Workaholic.DispatchEffectParam / 10000
  local Count = 0
  for _, Uuid in pairs(self.Dispatch.DispatchCharsList) do
    local Char = Avatar.Chars[CommonUtils.Str2ObjId(CommonUtils.ObjId2Str(Uuid))]
    local Tag = Char:GetCurrentUnlockDispatchTag()
    for Tag, Number in pairs(Tag) do
      if "Workaholic" == Tag then
        Count = Count + Number
      end
    end
  end
  local Res
  if 0 == Count then
    Res = BaseTime * 60
  else
    Res = math.floor((BaseTime - BaseTime * Count * Effect) * 60)
  end
  local EndTime = StartTime + Res
  
  local function Refresh()
    local NowTime = TimeUtils.NowTime()
    self.Bar_Progressing:SetPercent((NowTime - StartTime) / (EndTime - StartTime))
    local RemainTimeDict, TimeCount = UIUtils.GetLeftTimeStrStyle2(EndTime)
    self.LastTime:SetTimeText(GText("UI_Disptach_RemainTime"), RemainTimeDict)
  end
  
  Refresh()
  self:AddTimer(1, Refresh, true, 0, "RefreshRemainingTime")
end

function M:OnClickConfirm()
  local DispatchState = self.Dispatch.State
  if DispatchState == CommonConst.DispatchState.Cooling then
    UIManager(self):ShowUITip(UIConst.Tip_CommonTop, GText("UI_Dispatch_Toast_Overdate"))
    self.Owner.DispatchId = -1
    self.Owner.DispatchAgentList:StartDispatch(true)
    EventManager:FireEvent(EventID.OnDispatchOverdate, self.Dispatch.DispatchId)
  elseif DispatchState == CommonConst.DispatchState.CanDispatch then
    if self.Owner.DispatchAgentList ~= nil then
      AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_confirm", "", nil)
      self:StartDispatch()
    end
  elseif DispatchState == CommonConst.DispatchState.Perfect or DispatchState == CommonConst.DispatchState.Success or DispatchState == CommonConst.DispatchState.Qualified or DispatchState == CommonConst.DispatchState.Disqualified then
    self:GetReward()
  end
end

function M:StartDispatch()
  if 0 == self.AgentCount then
    UIManager(self):ShowUITip(UIConst.Tip_CommonTop, GText("UI_Disptach_Toast_NoAgent"))
    return
  end
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  local AgentList = {}
  for _, Id in pairs(self.AgentList) do
    if 0 ~= Id then
      table.insert(AgentList, Id)
    end
  end
  Avatar:StartDispatch(self.Dispatch.DispatchId, false, AgentList)
end

function M:CancelDispatch()
  local DispatchState = self.Dispatch.State
  if DispatchState == CommonConst.DispatchState.Doing and self.Dispatch.DispatchCharsList:Length() > 0 then
    local Parent
    if self.Owner.DispatchAgentList then
      Parent = self.Owner.DispatchAgentList
    elseif self.Owner.DispatchList then
      Parent = self.Owner.DispatchList
    else
      Parent = self
    end
    local Params = {}
    Params.RightCallbackObj = self
    Params.RightCallbackFunction = self.RealCancelDispatch
    UIManager(self):ShowCommonPopupUI(100145, Params, Parent)
  end
end

function M:RealCancelDispatch()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  Avatar:CancelDispatch(self.Dispatch.DispatchId)
end

function M:InitBtnInfo()
  local DispatchState = self.Dispatch.State
  if DispatchState == CommonConst.DispatchState.Unlock then
    self:IsShowExtraText(true)
    self:PlayAnimation(self.Initial)
    self.Buff:SetVisibility(ESlateVisibility.Collapsed)
    self.Switch_Btn:SetActiveWidgetIndex(4)
    self.Btn_Nearby.Text_Button:SetText(GText("UI_Dispatch_GotoNear"))
    self.Btn_Nearby:SetGamePadImg("X")
    self.Switch_Type:SetActiveWidgetIndex(4)
    self.TextBlock_53:SetText(GText("UI_Dispatch_Toast_LockWarm"))
  elseif DispatchState == CommonConst.DispatchState.Doing and 0 == self.Dispatch.DispatchCharsList:Length() then
    self:IsShowExtraText(true)
    self:StopAnimation(self.Progessing)
    self:PlayAnimation(self.Initial)
    self.Switch_Btn:SetActiveWidgetIndex(3)
    self.Text_Deal:SetText(GText("UI_Disptach_Warm_ManualDoing"))
    self.Switch_Type:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.Buff:SetVisibility(ESlateVisibility.Collapsed)
  elseif DispatchState == CommonConst.DispatchState.Doing and self.Dispatch.DispatchCharsList:Length() > 0 then
    self:PlayAnimation(self.Progessing)
    self:IsShowExtraText(false)
    self.Switch_Btn:SetActiveWidgetIndex(2)
    self.Btn_Cancel.Text_Button:SetText(GText("UI_Disptach_State_Cancel"))
    self.Btn_Cancel:SetGamePadImg("X")
    self.Switch_Type:SetVisibility(UE4.ESlateVisibility.Visible)
    self.Switch_Type:SetActiveWidgetIndex(2)
    self.Text_Success02:SetText(GText("UI_Disptach_SuccessRate"))
    self:UpdateRemainingTime()
    self:InitAbility(self.Dispatch.DispatchCharsList)
    self.Text_Percent02:SetText(self:CalSuccessRate())
  elseif DispatchState == CommonConst.DispatchState.CanDispatch then
    if self.Owner.DispatchAgentList then
      self:OpenAgentList()
    else
      self.Switch_Btn:SetActiveWidgetIndex(0)
      self.Btn_Select.Text_Button:SetText(GText("UI_Disptach_ChoseAgent"))
      self.Switch_Type:SetVisibility(UE4.ESlateVisibility.Visible)
      self.Switch_Type:SetActiveWidgetIndex(0)
    end
    local BaseTime = self.Dispatch:GetDispatchTime()
    local EndTime = TimeUtils.NowTime() + BaseTime * 60
    local RemainTimeDict, TimeCount = UIUtils.GetLeftTimeStrStyle2(EndTime)
    self.ExpectTime01.Image_ClockIcon:SetVisibility(ESlateVisibility.Collapsed)
    self.ExpectTime01:SetTimeText(GText("UI_Disptach_DispatchTime"), RemainTimeDict)
    self:IsShowExtraText(true)
    self:StopAnimation(self.Progessing)
    self:PlayAnimation(self.Initial)
    self.Buff:SetVisibility(ESlateVisibility.Collapsed)
  elseif DispatchState == CommonConst.DispatchState.Perfect or DispatchState == CommonConst.DispatchState.Success or DispatchState == CommonConst.DispatchState.Qualified or DispatchState == CommonConst.DispatchState.Disqualified then
    AudioManager(self):PlayUISound(self, "event:/ui/common/dispatch_event_finish", "", nil)
    self:IsShowExtraText(false)
    self.Switch_Btn:SetActiveWidgetIndex(1)
    self.Btn_Confirm.Text_Button:SetText(GText("UI_Disptach_TakeReward"))
    self.Btn_Confirm:SetGamePadImg("A")
    self.Switch_Type:SetActiveWidgetIndex(3)
    self.Btn_Confirm:PlayAnimation(self.Btn_Confirm.Normal)
    self:SetSuccessInfo(self.Dispatch.State)
    self:SetSuccessDispatchReward()
    self:InitAbility(self.Dispatch.DispatchCharsList)
  end
end

function M:SetSuccessInfo(Type)
  if Type == CommonConst.DispatchState.Perfect then
    local Icon = LoadObject("/Game/UI/Texture/Dynamic/Atlas/Map/T_Map_Rank_SS_L.T_Map_Rank_SS_L")
    self.Icon_Rank:SetBrushResourceObject(Icon)
    self.Text_Status:SetText(GText("UI_Disptach_Perfect"))
    self:PlayAnimation(self.Success_Yellow_01)
  elseif Type == CommonConst.DispatchState.Success then
    local Icon = LoadObject("/Game/UI/Texture/Dynamic/Atlas/Map/T_Map_Rank_S_L.T_Map_Rank_S_L")
    self.Icon_Rank:SetBrushResourceObject(Icon)
    self.Text_Status:SetText(GText("UI_Disptach_BigSuccess"))
    self:PlayAnimation(self.Success_Yellow_02)
  elseif Type == CommonConst.DispatchState.Qualified then
    local Icon = LoadObject("/Game/UI/Texture/Dynamic/Atlas/Map/T_Map_Rank_A_L.T_Map_Rank_A_L")
    self.Icon_Rank:SetBrushResourceObject(Icon)
    self.Text_Status:SetText(GText("UI_Disptach_Success"))
    self:PlayAnimation(self.Success_Purple)
  elseif Type == CommonConst.DispatchState.Disqualified then
    local Icon = LoadObject("/Game/UI/Texture/Dynamic/Atlas/Map/T_Map_Rank_B_L.T_Map_Rank_B_L")
    self.Icon_Rank:SetBrushResourceObject(Icon)
    self.Text_Status:SetText(GText("UI_Disptach_Fail"))
    self:PlayAnimation(self.Success_Blue)
  end
end

function M:OnClickDispatch()
  local DispatchState = self.Dispatch.State
  if DispatchState == CommonConst.DispatchState.Cooling then
    UIManager(self):ShowUITip(UIConst.Tip_CommonTop, GText("UI_Dispatch_Toast_Overdate"))
    self.Owner.DispatchId = -1
    if self.Owner.DispatchList then
      self.Owner.DispatchList:UpdateDispatch(true)
      EventManager:FireEvent(EventID.OnDispatchOverdate, self.Dispatch.DispatchId)
    else
      EventManager:FireEvent(EventID.OnDispatchOverdate, self.Dispatch.DispatchId)
    end
  elseif DispatchState == CommonConst.DispatchState.CanDispatch then
    AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_confirm", "", nil)
    self:OpenAgentList()
    self.Owner.RealWildMap:PlaySelectAni(self.Dispatch.DispatchId)
    self.Owner.RealWildMap:ShowAllMiniHead(self.Dispatch.DispatchId)
  end
end

function M:GetReward()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  Avatar:CompleteDispatch(self.Dispatch.DispatchId)
end

function M:UpdateAbilityUI(IsActive, Id, IsPlay)
  if IsActive then
    local Avatar = GWorld:GetAvatar()
    if not Avatar then
      return
    end
    local Char = Avatar.Chars[CommonUtils.Str2ObjId(Id)]
    local Tag = Char:GetCurrentUnlockDispatchTag()
    for Type, Count in pairs(Tag) do
      for i = 1, Count do
        local TypeInfo = DataMgr.CharDispatchTag[Type]
        if 1 == TypeInfo.IsBuff then
          local AbilityItem = UIManager(self):CreateWidget("/Game/UI/WBP/Map/Widget/Dispatch/WBP_Map_Ability_S.WBP_Map_Ability_S")
          AbilityItem.Icon_Ability:SetBrushResourceObject(LoadObject(TypeInfo.Icon))
          self.SpecialAbility[Id] = self.SpecialAbility[Id] or {}
          table.insert(self.SpecialAbility[Id], AbilityItem)
          self.WBox_ExtraBuff:AddChildToWrapBox(AbilityItem)
          self:AbilityPlayAnimation(nil, AbilityItem, IsPlay, false)
        else
          for i, Value in pairs(self.AbilityList) do
            local Tag = Value.Type
            local Active = Value.IsActive
            if Tag == Type and false == Active then
              self:AbilityPlayAnimation(Tag, Value.Widget, IsPlay, true)
              Value.IsActive = true
              self.AgentAbility[Id] = self.AgentAbility[Id] or {}
              self.AgentAbility[Id][Value.Widget] = Type
              goto lbl_101
            end
          end
          ::lbl_101::
        end
      end
    end
  else
    local Info = self.AgentAbility[Id]
    if nil ~= Info then
      for Item, Tag in pairs(Info) do
        Item:PlayAnimation(Item.No_Active)
        for i, abilityData in ipairs(self.AbilityList) do
          if abilityData.Widget == Item then
            abilityData.IsActive = false
            break
          end
        end
      end
      self.AgentAbility[Id] = nil
    end
    local SpecialInfo = self.SpecialAbility[Id]
    if nil ~= SpecialInfo then
      for _, Item in pairs(SpecialInfo) do
        Item:RemoveFromParent()
      end
      self.SpecialAbility[Id] = nil
    end
  end
  if nil ~= next(self.SpecialAbility) then
    self.Buff:SetVisibility(ESlateVisibility.Visible)
    self.WS_BuffType:SetActiveWidgetIndex(0)
  else
    self.Buff:SetVisibility(ESlateVisibility.Collapsed)
  end
end

function M:AbilityPlayAnimation(Type, Ability, IsPlay, IsNormal)
  local AnimName = UIUtils.GetDispathchColorNameByType(Type)
  if AnimName then
    Ability:PlayAnimation(Ability[AnimName])
  end
  if IsPlay then
    if IsNormal then
      Ability:PlayAnimation(Ability.Active_Feedback)
    else
      Ability:PlayAnimation(Ability.Active_Special)
    end
  elseif IsNormal then
    Ability:PlayAnimation(Ability.Active)
  else
    Ability:PlayAnimation(Ability.Special)
  end
end

function M:SetColor(Item, Type)
  if "Battle" == Type then
    Item.BG:SetColorAndOpacity(Item.Color_BG_Red)
  elseif "Collect" == Type or "Mine" == Type or "Fish" == Type or "Pet" == Type then
    Item.BG:SetColorAndOpacity(Item.Color_BG_Blue)
  else
    Item.BG:SetColorAndOpacity(Item.Color_BG_Green)
  end
end

function M:GetIdByUuid(Uuid)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  for _, Char in pairs(Avatar.Chars) do
    if CommonUtils.ObjId2Str(Char.Uuid) == Uuid then
      return Char.CharId
    end
  end
end

function M:CancelDispatchEvent()
  if self.Owner.DispatchAgentList then
    self.Owner.DispatchAgentList:StartDispatch(true)
  elseif self.Owner.DispatchList then
    self.Owner.DispatchList:UpdateDispatch(true)
  end
end

function M:StartDispatchEvent()
  AudioManager(self):PlayUISound(self, "event:/ui/common/dispatch_event_start", "", nil)
  self.Owner.DispatchAgentList:StartDispatch(false)
  self.IsPlayIn = false
  self:UpdateRemainingTime()
  self.Text_Success02:SetText(GText("UI_Disptach_SuccessRate"))
  self.Btn_Cancel.Text_Button:SetText(GText("UI_Disptach_State_Cancel"))
  self:PlayAnimation(self.Progessing_In)
end

function M:CompleteDispatchEvent(TotalReward)
  local function Callback()
    if self.Owner.DispatchAgentList then
      self.Owner.DispatchAgentList:StartDispatch(true)
    elseif self.Owner.DispatchList then
      self.Owner.DispatchList:UpdateDispatch(true)
    end
  end
  
  UIUtils.ShowGetItemPageAndOpenBagIfNeeded(nil, nil, nil, TotalReward, false, Callback, self, false)
end

function M:CalSuccessRate()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  local TotalNum = 0
  for _, Count in pairs(self.Dispatch.DispatchDemand) do
    TotalNum = TotalNum + Count
  end
  local ActiveNum = 0
  for key, value in pairs(self.AbilityList) do
    for Tag, Active in pairs(value) do
      if true == Active then
        ActiveNum = ActiveNum + 1
      end
    end
  end
  local Effect = DataMgr.CharDispatchTag.Rigorous.DispatchEffectParam / 10000
  local Count = 0
  for Id, Items in pairs(self.SpecialAbility) do
    local Char = Avatar.Chars[CommonUtils.Str2ObjId(Id)]
    local Tag = Char:GetCurrentUnlockDispatchTag()
    for Tag, Number in pairs(Tag) do
      if "Rigorous" == Tag then
        Count = Count + Number
      end
    end
  end
  local CountRate = self.AgentCount * DataMgr.GlobalConstant.DispatchBasicSuccess.ConstantValue / 100
  local ResSuccess = Count * Effect
  if Count > 0 then
    self.MatchSuccess = true
    self.Tip_ExBuff.Text_Buff01:SetVisibility(UE4.ESlateVisibility.Visible)
    self.Tip_ExBuff.Text_Buff01:SetText(string.format(GText("UI_Disptach_Buff_Success"), GText(math.floor(ResSuccess * 100) .. "%")))
  else
    self.MatchSuccess = false
    self.Tip_ExBuff.Text_Buff01:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
  local Res = math.floor((ActiveNum / TotalNum + ResSuccess + CountRate) * 100)
  return Res
end

function M:OpenSpecailAbility()
  if not self.UsingGamepad then
    self.Btn_Check.Btn_CheckBuff_S:PlayAnimation(self.Btn_Check.Btn_CheckBuff_S.Click)
  end
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_small", nil, nil)
  self.Btn_Check.MenuAnchor_Dispatch.OnGetMenuContentEvent:Bind(self, self.OnClickSpecialAbility)
  self.Btn_Check.MenuAnchor_Dispatch.OnMenuOpenChanged:Add(self, self.OnMenuOpenChanged)
  self.Btn_Check.MenuAnchor_Dispatch:Open(true)
  self.SpecialAbilityBubble:Init(self)
end

function M:GotoCloestTeleportPoint()
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_confirm", "", nil)
  local GotoSubRegionId = DataMgr.DynQuest[self.Dispatch.DispatchId].SubRegionId
  local GameMode = UE4.UGameplayStatics.GetGameMode(GWorld.GameInstance)
  local Params = {}
  Params.RightCallbackObj = self
  
  function Params.RightCallbackFunction()
    local DispatchId = self.Dispatch.DispatchId
    local TriggerBoxId = DataMgr.DynQuest[DispatchId].TriggerBoxID
    local SubRegionId = DataMgr.DynQuest[self.Dispatch.DispatchId].SubRegionId
    local TeleportPoint = DataMgr.DispatchUI[self.Dispatch.DispatchId].TeleportPointPos
    DebugPrint("GotoCloestTeleportPoint:DispatchId,TriggerBoxId,SubRegionId,", DispatchId, TriggerBoxId, SubRegionId)
    local MapUI = UIManager(self):GetUIObj("LevelMapMain")
    MapUI:RealClose()
    GameMode:HandleLevelDeliver(UE4.EModeType.ModeRegion, SubRegionId, TeleportPoint, nil, nil, true)
    GWorld.GameInstance.TriggerBoxID = TriggerBoxId
    EventManager:AddEvent(EventID.CloseLoading, GWorld.GameInstance, GWorld.GameInstance.TeleportToCloestTeleportPoint)
    EventManager:AddEvent(EventID.OnLevelDeliverBlackCurtainEnd, GWorld.GameInstance, GWorld.GameInstance.TeleportToCloestTeleportPoint)
    EventManager:FireEvent(EventID.GoToDispatch, DispatchId)
  end
  
  UIManager(self):ShowCommonPopupUI(100146, Params)
end

function M:ResetBtn()
  self.Switch_Btn:SetActiveWidgetIndex(0)
  self.Btn_Select.Text_Button:SetText(GText("UI_Disptach_ChoseAgent"))
end

function M:OnClickSpecialAbility()
  local Path = "/Game/UI/WBP/Map/Widget/Dispatch/WBP_Map_AbilityDetail.WBP_Map_AbilityDetail"
  self.SpecialAbilityBubble = UIManager(self):CreateWidget(Path)
  return self.SpecialAbilityBubble
end

function M:RefreshConfirmBtn()
  if 0 == self.AgentCount then
    self.Btn_Confirm:ForbidBtn(true)
    self.Btn_Confirm:PlayAnimation(self.Btn_Confirm.Forbidden)
  else
    self.Btn_Confirm:ForbidBtn(false)
    self.Btn_Confirm:PlayAnimation(self.Btn_Confirm.Normal)
  end
end

function M:OnMenuOpenChanged(bOpen)
  self.TipsOpen = bOpen
  if bOpen then
    if self.UsingGamepad then
      self:ShowPadUI(false)
      self:InitPadKeyInfo()
    end
    return
  end
  self.Btn_Check.MenuAnchor_Dispatch.OnGetMenuContentEvent:Unbind()
  self.Btn_Check.MenuAnchor_Dispatch.OnMenuOpenChanged:Remove(self, self.OnMenuOpenChanged)
  self.SpecialAbilityBubble = nil
  if self.UsingGamepad then
    if self.Owner.DispatchAgentList then
      local Item = self.Owner.DispatchAgentList.List_Agent:GetItemAt(0)
      if Item then
        self.Owner.DispatchAgentList.List_Agent:NavigateToIndex(0)
        self:ShowPadUI(true)
      end
    elseif self.Owner.DispatchList then
      self.Owner.DispatchList:NavigateToItem()
      self:ShowPadUI(true)
      self.Owner.DispatchList.List_Sort:HideGamePadIcon(false, "DispatchDetail")
    else
      self:InitPadKeyInfoByDetail()
      self:ShowPadUI(true)
    end
  end
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
    self:ShowPadUI(false)
    self.Controller_CheckReward:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.Controller_Ability:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.Btn_Check.Switch_Mode:SetActiveWidgetIndex(0)
  else
    self.UsingGamepad = true
    self:ShowPadUI(true)
    self.Controller_CheckReward:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    self.Controller_Ability:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    self.Btn_Check.Switch_Mode:SetActiveWidgetIndex(1)
    if self.Owner.DispatchList == nil and nil == self.Owner.DispatchAgentList then
      self:InitPadKeyInfoByDetail()
      self:SetFocus()
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
  Key_Esc:CreateCommonKey({
    KeyInfoList = {
      {Type = "Text", Text = "Esc"}
    },
    Desc = GText("Impression_UI_Back")
  })
end

function M:InitKeyInfo()
  self.Img_Key_CheckReward:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "Right"}
    }
  })
  self.Btn_Check.Img_Key_CheckBuff:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "Left"}
    }
  })
end

function M:InitPadKeyInfo()
  if self.Owner.Key_Tip == nil then
    return
  end
  self.Owner.Key_Tip.Panel_Key:ClearChildren()
  local Key_Back = UIManager(self):_CreateWidgetNew("ComKeyTextDesc")
  self.Owner.Key_Tip.Panel_Key:AddChild(Key_Back)
  Key_Back:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "B"}
    },
    Desc = GText("UI_BACK")
  })
end

function M:InitPadKeyInfoByDetail()
  if self.Owner.Key_Tip == nil then
    return
  end
  self.Owner.Key_Tip.Panel_Key:ClearChildren()
  local Key_B = UIManager(self):_CreateWidgetNew("ComKeyTextDesc")
  local Key_Reward = UIManager(self):_CreateWidgetNew("ComKeyTextDesc")
  Key_Reward:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "RS"}
    },
    Desc = GText("UI_Controller_CheckReward")
  })
  self.Owner.Key_Tip.Panel_Key:AddChild(Key_Reward)
  Key_B:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "B"}
    },
    Desc = GText("Impression_UI_Back")
  })
  self.Owner.Key_Tip.Panel_Key:AddChild(Key_B)
end

function M:OnKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if InKeyName == Const.GamepadLeftShoulder or InKeyName == Const.GamepadRightShoulder then
    return UE4.UWidgetBlueprintLibrary.Handled()
  end
  if self.TipsOpen == true and "Gamepad_FaceButton_Right" ~= InKeyName then
    return UE4.UWidgetBlueprintLibrary.Handled()
  end
  local IsHandled = false
  if not UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) or "Gamepad_DPad_Up" == InKeyName then
  elseif "Gamepad_DPad_Down" == InKeyName then
  elseif "Gamepad_FaceButton_Right" == InKeyName then
    if self.Owner.DispatchAgentList then
      local Item = self.Owner.DispatchAgentList.List_Agent:GetItemAt(0)
      if Item then
        self.Owner.DispatchAgentList.List_Agent:NavigateToIndex(0)
        self:ShowPadUI(true)
      end
    elseif self.Owner.DispatchList then
      self.Owner.DispatchList:NavigateToItem()
      self:InitPadKeyInfo()
      self:ShowPadUI(true)
      self.Owner.DispatchList.List_Sort:HideGamePadIcon(false, "DispatchDetail")
    elseif self.List_Reward:HasFocusedDescendants() or self.List_ExReward:HasFocusedDescendants() then
      self:SetFocus()
      self:InitPadKeyInfoByDetail()
      self:ShowPadUI(true)
      return UE4.UWidgetBlueprintLibrary.Handled()
    elseif self.Btn_Check:HasFocusedDescendants() then
      self:SetFocus()
      return UE4.UWidgetBlueprintLibrary.Handled()
    else
      return UE4.UWidgetBlueprintLibrary.Unhandled()
    end
    IsHandled = true
  elseif "Gamepad_FaceButton_Down" == InKeyName then
  elseif "Gamepad_FaceButton_Left" == InKeyName then
    if self.Owner.DispatchList ~= nil or self.Owner.DispatchAgentList ~= nil or self:HasAnyUserFocus() == false then
      return UE4.UWidgetBlueprintLibrary.Handled()
    end
    if self.Dispatch.State == CommonConst.DispatchState.Doing and self.Dispatch.DispatchCharsList:Length() > 0 then
      self:CancelDispatch()
    elseif self.Dispatch.State == CommonConst.DispatchState.CanDispatch then
      self:GotoCloestTeleportPoint()
    elseif self.Dispatch.State == CommonConst.DispatchState.Unlock then
      self:GotoCloestTeleportPoint()
    end
  elseif "Gamepad_RightThumbstick" == InKeyName then
    if self.Owner.DispatchList ~= nil or self.Owner.DispatchAgentList ~= nil then
      return UE4.UWidgetBlueprintLibrary.Handled()
    end
    local Item = self.List_Reward:GetItemAt(0)
    if Item then
      self.List_Reward:NavigateToIndex(0)
      self:InitPadKeyInfo()
      self:ShowPadUI(false)
    end
    return UE4.UWidgetBlueprintLibrary.Handled()
  end
  if IsHandled then
    return UE4.UWidgetBlueprintLibrary.Handled()
  end
  return UE4.UWidgetBlueprintLibrary.Unhandled()
end

function M:OnPreviewKeyDown(MyGeometry, InKeyEvent)
  if self:HasAnyUserFocus() == false then
    return
  end
  if CommonUtils:IfExistSystemGuideUI(self) then
    return UE4.UWidgetBlueprintLibrary.Handled()
  end
  if self.Owner.DispatchList ~= nil or nil ~= self.Owner.DispatchAgentList then
    return UE4.UWidgetBlueprintLibrary.Handled()
  end
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local IsHandled = false
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) then
    if "Gamepad_DPad_Right" == InKeyName then
      self:OnClickCheckReward()
      IsHandled = true
    elseif "Gamepad_DPad_Left" == InKeyName then
      if 0 == self.WS_BuffType:GetActiveWidgetIndex() then
        self:OpenSpecailAbility()
      end
      IsHandled = true
    elseif "Gamepad_FaceButton_Bottom" == InKeyName then
      if self.Dispatch.State == CommonConst.DispatchState.CanDispatch then
        self:OnClickDispatch()
      elseif self.Dispatch.State == CommonConst.DispatchState.Perfect or self.Dispatch.State == CommonConst.DispatchState.Success or self.Dispatch.State == CommonConst.DispatchState.Qualified or self.Dispatch.State == CommonConst.DispatchState.Disqualified then
        self:GetReward()
      end
      IsHandled = true
    end
  end
  if IsHandled then
    return UE4.UWidgetBlueprintLibrary.Handled()
  end
  return UE4.UWidgetBlueprintLibrary.Unhandled()
end

function M:ShowPadUI(IsShow)
  if IsShow then
    self.Btn_CheckReward_S:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.Img_Key_CheckReward:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    self.Img_Key_Ability:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    self.Text_Controller_Check:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    self.Btn_Check.Switch_Mode:SetActiveWidgetIndex(1)
    self.Btn_Go:SetPCVisibility(false)
    self.Btn_Select:SetPCVisibility(false)
    self.Btn_Confirm:SetPCVisibility(false)
    self.Btn_Cancel:SetPCVisibility(false)
    self.Owner:InitPadTab()
  else
    self.Btn_CheckReward_S:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    self.Img_Key_CheckReward:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.Img_Key_Ability:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.Text_Controller_Check:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.Btn_Check.Switch_Mode:SetActiveWidgetIndex(0)
    self.Btn_Go:SetPCVisibility(true)
    self.Btn_Select:SetPCVisibility(true)
    self.Btn_Confirm:SetPCVisibility(true)
    self.Btn_Cancel:SetPCVisibility(true)
  end
end

return M
