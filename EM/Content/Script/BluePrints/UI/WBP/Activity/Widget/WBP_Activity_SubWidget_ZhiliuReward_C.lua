require("UnLua")
local ActivityUtils = require("Blueprints.UI.WBP.Activity.ActivityUtils")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C",
  "BluePrints.Common.TimerMgr"
})

function M:InitPage(EventId)
  self.CurProgress = 0
  self.TotalProgress = 7
  self.ZhiliuEventId = DataMgr.EventConstant.ZhiLiuEntrustEventID.ConstantValue
  self.Text_TaskProgressDesc:SetText(GText("ZhiLiuEntrust_Progress"))
  self.Btn_Reward:SetText(GText("ZhiLiuEntrust_GetGrandReward"))
  self:AddTimer(0.1, function()
    self.Btn_Reward:BindEventOnClicked(self, self.OnRewardBtnClicked)
  end, false, 0, "InitDelay", true)
  self.Btn_IconClick.OnClicked:Add(self, self.OnRewardIconClicked)
  self.Key_Reward:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "Y"}
    }
  })
  self.Key_RewardBox:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "View"}
    }
  })
  self:UpdatePage()
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(self)
  if IsValid(self.GameInputModeSubsystem) then
    self:OnUpdateSubUIViewStyle(self.GameInputModeSubsystem:GetCurrentInputType() == ECommonInputType.Gamepad)
  end
end

function M:UpdatePage()
  self.IsShow = self:IsPrerequisiteSatisfied()
  DebugPrint("ZhiliuReward:UpdatePage IsShow", self.IsShow)
  if self.IsShow then
    self:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  else
    self:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
  self.CurProgress = self:GetCurProgress()
  DebugPrint("ZhiliuReward:UpdatePage CurProgress", self.CurProgress)
  self.Text_TaskProgressNum01:SetText(self.CurProgress)
  self.Text_TaskProgressNum02:SetText(self.TotalProgress)
  local IsPlayerAlreadyGotReward = self:IsPlayerAlreadyGotReward()
  self.IsShowReddot = not IsPlayerAlreadyGotReward
  self:AddTimer(0.1, function()
    self:SetBtnAndReddotForbid(IsPlayerAlreadyGotReward)
  end, false, 0, "UpdateDelay", true)
  if self.CurProgress == self.TotalProgress then
    self:SwitchDisplay("Reward")
  else
    self:SwitchDisplay("Progress")
  end
end

function M:SetBtnAndReddotForbid(IsForbid)
  self.Btn_Reward:ForbidBtn(IsForbid)
  if IsForbid then
    self.Reddot:SetVisibility(UE4.ESlateVisibility.Collapsed)
  else
    self.Reddot:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  end
  self.IsShowReddot = not IsForbid
end

function M:OnRewardBtnClicked()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  if self.CurProgress ~= self.TotalProgress then
    return
  end
  
  local function cb(ErrCode, RewardBox)
    DebugPrint("ZhiliuReward:OnCombatMainBtnClickedCallback")
    if ErrorCode:Check(ErrCode) then
      UIUtils.ShowGetItemPageAndOpenBagIfNeeded(nil, nil, nil, RewardBox, false, nil, self, false)
      self:SetBtnAndReddotForbid(true)
      self.Key_Reward:SetVisibility(UE4.ESlateVisibility.Collapsed)
    end
  end
  
  DebugPrint("ZhiliuReward:OnCombatMainBtnClicked")
  Avatar:RpcZhiLiuEntrustGrandRewards(cb)
end

function M:OnRewardIconClicked()
  local Params = {}
  Params.ActivityId = self.ZhiliuEventId
  UIManager(self):ShowCommonPopupUI(100202, Params, self)
end

function M:IsPlayerAlreadyGotReward()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return false
  end
  return Avatar.ZhiLiuEntrustGrandRewardGot or false
end

function M:SwitchDisplay(DisplayType)
  if "Progress" == DisplayType then
    self.HB_ProgressNum:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    self.Group_RewardBtn:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self:PlayAnimation(self.Reward, self.Reward:GetEndTime(), 1, UE4.EUMGSequencePlayMode.Reverse)
  elseif "Reward" == DisplayType then
    self.HB_ProgressNum:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.Group_RewardBtn:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    self:PlayAnimation(self.Reward)
  else
    assert(false, "\228\188\160\229\133\165\228\186\134\233\148\153\232\175\175\231\154\132DisplayType! " .. DisplayType)
  end
end

function M:IsPrerequisiteSatisfied()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return false
  end
  local ZhiliuEventInfo = DataMgr.EventMain[self.ZhiliuEventId]
  if not ZhiliuEventInfo then
    ScreenPrint("EventMain\232\161\168\228\184\173\230\137\190\228\184\141\229\136\176\230\173\162\230\181\129\230\180\187\229\138\168\231\155\184\229\133\179\228\191\161\230\129\175\239\188\129\232\175\187\229\143\150\231\154\132EventId:" .. self.ZhiliuEventId)
    return false
  end
  local PrerequisiteQuestId = {}
  if ZhiliuEventInfo.PretextTasks1 then
    table.insert(PrerequisiteQuestId, ZhiliuEventInfo.PretextTasks1)
  end
  for _, QuestId in pairs(ZhiliuEventInfo.PretextTasks2 or {}) do
    table.insert(PrerequisiteQuestId, QuestId)
  end
  for _, QuestId in pairs(PrerequisiteQuestId) do
    local QuestChain = Avatar.QuestChains[QuestId]
    if not QuestChain then
      ScreenPrint("Zhiliu \233\133\141\231\189\174\228\186\134\228\184\128\228\184\170\228\184\141\229\173\152\229\156\168\231\154\132\228\187\187\229\138\161\233\147\190Id\239\188\129\232\175\183\231\173\150\229\136\146\230\163\128\230\159\165\239\188\129Id:" .. QuestId)
      return false
    end
    if not QuestChain:IsFinish() then
      return false
    end
  end
  return true
end

function M:GetCurProgress()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return 0
  end
  local CurProgress = 0
  for i = 1, 7 do
    local Info = Avatar.ZhiLiuEntrustDict[i]
    if Info and Info.SubmitEntrustCompleted and Info.CombatEntrustCompleted then
      CurProgress = i
    else
      return CurProgress
    end
  end
  return CurProgress
end

function M:IsSubmitCompleted(DayIndex)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return false
  end
  local Id = DataMgr.ZhiliuDateTab[DayIndex].SubmitEntrustID
  local Info = Avatar.ZhiLiuEntrustDict[Id] or {}
  return Info.SubmitEntrustCompleted or false
end

function M:IsCombatCompleted(DayIndex)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return false
  end
  local Id = DataMgr.ZhiliuDateTab[DayIndex].CombatEntrustID
  local Info = Avatar.ZhiLiuEntrustDict[Id] or {}
  return Info.CombatEntrustCompleted or false
end

function M:OnSubWidgetReceivedFocus()
end

function M:OnSubWidgetLostFocus()
end

function M:OnUpdateSubUIViewStyle(IsUseGamePad)
  DebugPrint("ZhiliuReward:OnUpdateSubUIViewStyle IsShow", self.IsShow, "IsUseGamePad", IsUseGamePad, "IsShowReddot", self.IsShowReddot)
  if not self.IsShow then
    return
  end
  if IsUseGamePad then
    if self.IsShowReddot then
      self.Key_Reward:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    end
    self.Key_RewardBox:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  else
    self.Key_Reward:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.Key_RewardBox:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
end

function M:HandleKeyDownOnGamePad(InKeyName)
  DebugPrint("ZhiliuReward:HandleKeyDownOnGamePad", InKeyName)
  if not self.IsShow then
    return false
  end
  if not self.IsShowReddot then
    return false
  end
  if InKeyName == UIConst.GamePadKey.FaceButtonTop then
    self.Btn_Reward:OnBtnClicked()
  elseif InKeyName == UIConst.GamePadKey.SpecialLeft then
    self:OnRewardIconClicked()
  end
end

return M
