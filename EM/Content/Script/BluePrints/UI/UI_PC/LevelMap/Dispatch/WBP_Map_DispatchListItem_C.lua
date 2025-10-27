require("UnLua")
local TimeUtils = require("Utils.TimeUtils")
local M = Class({
  "BluePrints.UI.BP_UIState_C"
})
local DispatchStateEnum = {
  Finished = 0,
  Doing = 1,
  Dispatching = 2,
  Unlock = 3,
  CanDispatch = 4
}

function M:Initialize(Initializer)
  M.Super.Initialize(self)
  self.DispatchId = 0
  self.Dispatch = nil
  self.DispatchState = nil
  self.Owner = nil
end

function M:Construct()
  self.Super.Construct(self)
  self.Btn_Click.OnHovered:Add(self, self.OnHovered)
  self.Btn_Click.OnPressed:Add(self, self.OnPressed)
  self.Btn_Click.OnUnhovered:Add(self, self.OnUnhovered)
  self.Btn_Click.OnClicked:Add(self, self.OnDispatchItemClick)
  self.Btn_Click.OnReleased:Add(self, self.OnReleased)
end

function M:Destruct()
  self.Btn_Click.OnHovered:Remove(self, self.OnHovered)
  self.Btn_Click.OnPressed:Remove(self, self.OnPressed)
  self.Btn_Click.OnUnhovered:Remove(self, self.OnUnhovered)
  self.Btn_Click.OnClicked:Remove(self, self.OnDispatchItemClick)
  self.Btn_Click.OnReleased:Remove(self, self.OnReleased)
  if self.Owner and self.Owner.Owner.DispatchItem == self then
    self.Owner.Owner.DispatchItem = nil
  end
  self.Super.Destruct(self)
end

function M:BP_OnEntryReleased()
  DebugPrint("lkkkkBP_OnEntryReleased")
  self:RemoveTimer("RemaingTimeTimer")
  self:RemoveTimer("LockTimeTimer")
  self:RemoveTimer("SuccessTimeTimer")
end

function M:OnListItemObjectSet(Content)
  self.Content = Content
  self.DispatchId = Content.DispatchId
  self.Owner = Content.Owner
  Content.UI = self
  self.Reddot:SetVisibility(ESlateVisibility.Collapsed)
  if -1 == self.DispatchId then
    self.Switch_Type:SetActiveWidgetIndex(1)
    return
  end
  self.Switch_Type:SetActiveWidgetIndex(0)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  self.Dispatch = Avatar.Dispatches[self.DispatchId]
  if self.Dispatch == nil then
    return
  end
  self:StopAllAnimations()
  if self.Content.IsClick == true then
    self.Owner.Owner.DispatchItem = self
    self:PlayAnimation(self.Click)
  else
    self:PlayAnimation(self.Normal)
  end
  self:SetDispatchState(self.Dispatch)
  self:SetDispatchDetail()
  self:SetReddot(self.Dispatch)
  self:SetNavigationRuleBase(EUINavigation.Right, EUINavigationRule.Stop)
  self:SetNavigationRuleBase(EUINavigation.Left, EUINavigationRule.Stop)
end

function M:RefreshDispatchItem(Dispatch)
  self:RemoveTimer("RemaingTimeTimer")
  self:RemoveTimer("LockTimeTimer")
  self:RemoveTimer("SuccessTimeTimer")
  self.Dispatch = Dispatch
  self:SetDispatchState(self.Dispatch)
  self:SetReddot(self.Dispatch)
end

function M:SetReddot(Dispatch)
  if Dispatch.State == CommonConst.DispatchState.Success or Dispatch.State == CommonConst.DispatchState.Perfect or Dispatch.State == CommonConst.DispatchState.Qualified or Dispatch.State == CommonConst.DispatchState.Disqualified then
    self.Reddot:SetVisibility(ESlateVisibility.Visible)
  else
    self.Reddot:SetVisibility(ESlateVisibility.Collapsed)
  end
end

function M:SetDispatchState(Dispatch)
  if Dispatch.State == CommonConst.DispatchState.Success or Dispatch.State == CommonConst.DispatchState.Perfect or Dispatch.State == CommonConst.DispatchState.Qualified or Dispatch.State == CommonConst.DispatchState.Disqualified then
    self.DispatchState = DispatchStateEnum.Finished
    self:StopAnimation(self.Dispatching)
    self:PlayAnimation(self.Finish)
    self.Text_Finish:SetText(GText("UI_Disptach_State_Done"))
    self:RemoveTimer("SuccessTimeTimer")
  elseif Dispatch.State == CommonConst.DispatchState.Unlock then
    self.DispatchState = DispatchStateEnum.Unlock
    self:PlayAnimation(self.Lock)
    self.Text_Lock:SetText(GText("UI_Disptach_State_Lock"))
    self:SetLockTimeRemaining(Dispatch)
  elseif Dispatch.State == CommonConst.DispatchState.Doing then
    if Dispatch.DispatchCharsList:Length() > 0 then
      self.DispatchState = DispatchStateEnum.Dispatching
      self:PlayAnimation(self.Dispatching, 0, 0)
      self.Text_Status:SetText(GText("UI_Disptach_State_Doing"))
      self:SetSuccessTime(Dispatch)
    else
      self.DispatchState = DispatchStateEnum.Doing
      self:PlayAnimation(self.Progressing)
      self.Text_Progressing:SetText(GText("UI_Disptach_State_ManualDoing"))
    end
  elseif Dispatch.State == CommonConst.DispatchState.CanDispatch then
    self.DispatchState = DispatchStateEnum.CanDispatch
    self:PlayAnimation(self.Nodispatch)
    self:SetTimeRemaining(Dispatch)
  end
end

function M:SetTimeRemaining(Dispatch)
  self.ExpireTime.Text_TimeTitle:SetVisibility(ESlateVisibility.Collapsed)
  self.ExpireTime.Image_ClockIcon:SetVisibility(ESlateVisibility.Collapsed)
  self.Text_Expire:SetText(GText("UI_Disptach_State_Vanish"))
  
  local function RemainTime()
    local StartTime = Dispatch.RegisterTime
    local EndTime = StartTime + Dispatch.Ttk * 60
    local RemainTimeDict, TimeCount = UIUtils.GetLeftTimeStrStyle2(EndTime)
    self.ExpireTime:SetTimeText(GText("UI_Disptach_State_Vanish"), RemainTimeDict)
  end
  
  RemainTime()
  self:AddTimer(1, RemainTime, true, 0, "RemaingTimeTimer")
end

function M:SetLockTimeRemaining(Dispatch)
  self.Time_Lock.Text_TimeTitle:SetVisibility(ESlateVisibility.Collapsed)
  self.Time_Lock.Image_ClockIcon:SetVisibility(ESlateVisibility.Collapsed)
  self.Text_LockTime:SetText(GText("UI_Disptach_State_Vanish"))
  
  local function LockTime()
    local StartTime = Dispatch.RegisterTime
    local EndTime = StartTime + Dispatch.Ttk * 60
    local RemainTimeDict, TimeCount = UIUtils.GetLeftTimeStrStyle2(EndTime)
    self.Time_Lock:SetTimeText(GText("UI_Disptach_State_Vanish"), RemainTimeDict)
  end
  
  LockTime()
  self:AddTimer(1, LockTime, true, 0, "LockTimeTimer")
end

function M:SetSuccessTime(Dispatch)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  self.Text_FinishTime:SetText(GText("UI_Dispatch_TimeToDone"))
  local BaseTime = Dispatch:GetDispatchTime()
  self.FinishTime.Text_TimeTitle:SetVisibility(ESlateVisibility.Collapsed)
  local Effect = DataMgr.CharDispatchTag.Workaholic.DispatchEffectParam / 10000
  local Count = 0
  for _, Uuid in pairs(Dispatch.DispatchCharsList) do
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
  
  local function SuccessTime()
    local StartTime = Dispatch.StartTime
    local BaseTime = Dispatch:GetDispatchTime()
    local EndTime = StartTime + Res
    local NowTime = TimeUtils.NowTime()
    local RemainTimeDict, TimeCount = UIUtils.GetLeftTimeStrStyle2(EndTime)
    self.FinishTime:SetTimeText(GText("UI_Disptach_RemainTime"), RemainTimeDict)
  end
  
  SuccessTime()
  self:AddTimer(1, SuccessTime, true, 0, "SuccessTimeTimer")
end

function M:SetDispatchDetail()
  local DispatchData = DataMgr.Dispatch[self.DispatchId]
  local DispatchName = DataMgr.DispatchUI[DispatchData.DispatchUIId].DispatchName
  local DispatchRarity = DispatchData.Rarity
  local DispatchType = DispatchData.DispatchType
  self.Text_Name:SetText(GText(DispatchName))
  self:SetDispatchRarity(DispatchRarity)
  self:SetDispatchType(DispatchType)
end

function M:SetDispatchRarity(DispatchRarity)
  if 1 == DispatchRarity then
    local Icon = LoadObject("/Game/UI/Texture/Dynamic/Atlas/Map/T_Map_ListQuality_Green.T_Map_ListQuality_Green")
    self.Quality_Line:SetBrushResourceObject(Icon)
  elseif 2 == DispatchRarity then
    local Icon = LoadObject("/Game/UI/Texture/Dynamic/Atlas/Map/T_Map_ListQuality_Blue.T_Map_ListQuality_Blue")
    self.Quality_Line:SetBrushResourceObject(Icon)
  elseif 3 == DispatchRarity then
    local Icon = LoadObject("/Game/UI/Texture/Dynamic/Atlas/Map/T_Map_ListQuality_Purple.T_Map_ListQuality_Purple")
    self.Quality_Line:SetBrushResourceObject(Icon)
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

function M:OnDispatchItemClick()
  if -1 == self.DispatchId then
    return
  end
  if self.Owner == nil then
    DebugPrint("ItemOwner\228\184\141\229\173\152\229\156\168")
    return
  end
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_mid", nil, nil)
  self.Owner.DispatchId = self.DispatchId
  if nil ~= self.Owner.Owner.DispatchItem then
    self.Owner.Owner.DispatchItem:PlayNormal()
    self.Owner.Owner.DispatchItem.Content.IsClick = false
  end
  self.Content.IsClick = true
  self.Owner.Owner.DispatchId = self.DispatchId
  self.Owner.Owner.DispatchItem = self
  self:AddTimer(0.01, function()
    self:PlayAnimation(self.Click)
  end)
  self.Owner.Owner:CreateOrRefreshDispatchDetail(self.Dispatch)
  self.Owner.Owner.RealWildMap:RefreshDispatchMap(self.Dispatch.RegionId, self.DispatchId)
end

function M:OnPressed()
  if self.Content.IsClick == false then
    self:PlayAnimation(self.Press)
  end
end

function M:OnHovered()
  if self.Owner and self.Owner.UsingGamepad then
    self:OnDispatchItemClick()
    return
  end
  if self.Content.IsClick == false then
    self:PlayAnimation(self.Hover)
    if self.Owner and self.Owner.UsingGamepad then
      self:OnDispatchItemClick()
    end
  end
end

function M:OnUnhovered()
  if self.Content.IsClick == false then
    self:PlayAnimation(self.Unhover)
  end
end

function M:OnReleased()
  if self.Content.IsClick == false then
    self:PlayAnimation(self.Normal)
  end
end

function M:PlayNormal()
  self:PlayAnimation(self.Normal)
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

function M:OnKeyDown(MyGeometry, InKeyEvent)
  return UE4.UWidgetBlueprintLibrary.UnHandled()
end

function M:OnFocusReceived(MyGeometry, InFocusEvent)
end

return M
