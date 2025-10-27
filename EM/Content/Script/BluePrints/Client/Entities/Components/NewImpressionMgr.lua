local Component = {}
local TalkUtils = require("BluePrints.Story.Talk.View.TalkUtils")
local TimerMgr = require("BluePrints.Common.TimerMgr")
local LocalTimeOut = 10

function Component:ImpressionCheckByEnumId_New(DialogueChain, CurrentDialogueId, TalkTriggerId, ImpressionAreaId, ClientDelegate, CheckInfo, UsingGM, bTalkOptions)
  local DialogueChain = DialogueChain or {}
  DialogueChain = CommonUtils.CopyTable(DialogueChain)
  table.insert(DialogueChain, CurrentDialogueId)
  local Params = {
    CurrentDialogueId = CurrentDialogueId,
    TalkTriggerId = TalkTriggerId,
    Type = "Check",
    CheckInfo = CheckInfo
  }
  local ret = self:CanImpressionCheck(ImpressionAreaId)
  local DiceNum = ret.ResourceCount
  
  local function Callback(Ret, IsCheckSuccess, rand1, rand2, Rewards)
    self.logger.info("ZJT_ 11111111111111111111 ImpressionCheckByEnumId_New ", Ret, IsCheckSuccess, rand1, rand2, Rewards, CurrentDialogueId)
    if ClientDelegate and ClientDelegate[1] then
      TimerMgr.RemoveTimer(ClientDelegate[1], "ImpressionCheck", true)
    end
    Params.Rewards = Rewards
    if ClientDelegate and ClientDelegate[1] and ClientDelegate[2] then
      ClientDelegate[2](ClientDelegate[1], Ret, IsCheckSuccess, rand1, rand2, Params, DialogueChain)
    end
    EventManager:FireEvent(EventID.SetNpcFlexibShowOrHideDynamic, "Impression", TalkTriggerId)
    EventManager:FireEvent(EventID.SetCustomNpcFlexibShowOrHideDynamic, "Impression", TalkTriggerId)
    EventManager:FireEvent(EventID.TriggerFlexibleActive)
  end
  
  if UsingGM then
    Callback(0, true, 9, 9)
    return
  end
  self:CallServer("ImpressionCheckByEnumId_New", Callback, DialogueChain, DiceNum)
  if ClientDelegate and ClientDelegate[1] and ClientDelegate[3] then
    TimerMgr.AddTimer(ClientDelegate[1], LocalTimeOut, ClientDelegate[3], false, 0, "ImpressionCheck", true, DialogueChain)
  end
end

function Component:ImpressionAddByEnumId_New(DialogueChain, CurrentDialogueId, ClientDelegate, UsingGM)
  local DialogueChain = DialogueChain and CommonUtils.CopyTable(DialogueChain) or {}
  table.insert(DialogueChain, CurrentDialogueId)
  
  local function Callback(Ret)
    self.logger.info("ZJT_ 11111111111111111111 ImpressionAddByEnumId_New ", Ret, CurrentDialogueId)
    if ClientDelegate and ClientDelegate[1] then
      TimerMgr.RemoveTimer(ClientDelegate[1], "ImpressionPlus", true)
    end
    if ClientDelegate and ClientDelegate[1] and ClientDelegate[2] then
      ClientDelegate[2](ClientDelegate[1], Ret, DialogueChain)
    end
  end
  
  if UsingGM then
    Callback(0)
    return
  end
  self:CallServer("ImpressionAddByEnumId_New", Callback, DialogueChain)
  if ClientDelegate and ClientDelegate[1] and ClientDelegate[3] then
    TimerMgr.AddTimer(ClientDelegate[1], LocalTimeOut, ClientDelegate[3], false, 0, "ImpressionPlus", true, DialogueChain)
  end
end

function Component:SetTalkTriggerComplete_New(TalkTriggerId, ClientDelegate)
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(GWorld.GameInstance, 0)
  Player:SetCanInteractiveTrigger(false)
  Player:DisablePlayerInputInDeliver(true)
  
  local function Callback(Ret, Rewards)
    self.logger.info("ZJT_ 11111111111111111111 SetTalkTriggerComplete_New ", Ret, TalkTriggerId)
    EventManager:FireEvent(EventID.SetNpcFlexibShowOrHideDynamic, "Impression", TalkTriggerId)
    EventManager:FireEvent(EventID.SetCustomNpcFlexibShowOrHideDynamic, "Impression", TalkTriggerId)
    EventManager:FireEvent(EventID.TriggerFlexibleActive)
    if ErrorCode:Check(Ret) then
      EventManager:FireEvent(EventID.OnImprTalkTriggerComplete, TalkTriggerId)
      local TalkTriggerInfo = DataMgr.TalkTrigger[TalkTriggerId]
      local RewardId = TalkTriggerInfo.RewardId
      local rewardData = DataMgr.Reward[RewardId]
      local Player = UE4.UGameplayStatics.GetPlayerCharacter(GWorld.GameInstance, 0)
      if rewardData then
        local function func()
          Player:SetCanInteractiveTrigger(true)
          
          Player:DisablePlayerInputInDeliver(false)
          local GameInstance = GWorld.GameInstance
          local UIManager = GameInstance:GetGameUIManager()
          local UI = UIManager:GetUI("GetItemPage")
          if UI then
            UI:BindActionOnClosed()
          end
        end
        
        UIUtils.ShowGetItemPageAndOpenBagIfNeeded(rewardData.Type[1], rewardData.Id[1], rewardData.Count[1][1], Rewards, false, func, self, false)
      else
        Player:SetCanInteractiveTrigger(true)
        Player:DisablePlayerInputInDeliver(false)
      end
    else
      Player:SetCanInteractiveTrigger(true)
      Player:DisablePlayerInputInDeliver(false)
    end
    Player:RemoveTimer("ImpressionMgrResumeInteractive", true)
    if ClientDelegate and ClientDelegate[1] and ClientDelegate[2] then
      ClientDelegate[2](ClientDelegate[1])
    end
  end
  
  self:CallServer("SetTalkTriggerComplete_New", Callback, TalkTriggerId)
end

function Component:GMAddImpressionPreNode(PreDialogueId)
  local function Callback(Ret)
    self.logger.info("ZJT_ 11111111111111111111 AddImpressionPreNode ", Ret, PreDialogueId)
  end
  
  self:CallServer("GMAddImpressionPreNode", Callback, PreDialogueId)
end

function Component:IsStorylineComplete(TalkTriggerId)
  return self:IsStorylineSuccess(TalkTriggerId) or self:IsStorylineFailure(TalkTriggerId)
end

function Component:IsStorylineUnComplete(TalkTriggerId)
  return not self:IsStorylineComplete(TalkTriggerId)
end

function Component:IsStorylineSuccess(TalkTriggerId)
  return self.ImpressionTalkTriggers[TalkTriggerId] == CommonConst.ImpressionCheckType.Success
end

function Component:IsStorylineFailure(TalkTriggerId)
  return self.ImpressionTalkTriggers[TalkTriggerId] == CommonConst.ImpressionCheckType.Failed
end

function Component:IsImpressionCheckSuccess(DialogueId)
  return self.ImpressionDialogues[DialogueId] == CommonConst.ImpressionCheckType.Success
end

function Component:IsImpressionCheckFailure(DialogueId)
  return self.ImpressionDialogues[DialogueId] == CommonConst.ImpressionCheckType.Failed
end

function Component:CanImpressionCheck(ImpressionAreaId)
  local Ret = {
    ResourceCount = 0,
    Cost = 0,
    bCanCheck = false
  }
  local ImpressionResourceInfo = DataMgr.ImpressionResource[ImpressionAreaId]
  Ret.ResourceCount = self:GetResourceNum(ImpressionResourceInfo.ResourceId)
  Ret.Cost = ImpressionResourceInfo.Count
  Ret.bCanCheck = Ret.ResourceCount >= Ret.Cost
  return Ret
end

function Component:GetSuccRate(PlayerValue, CheckValue)
  local SuccRate = 100 - CheckValue + PlayerValue
  if SuccRate > 100 then
    SuccRate = 100
  elseif SuccRate < 0 then
    SuccRate = 0
  end
  return SuccRate
end

function Component:GetDifficultyInfo(SuccRate)
  SuccRate = SuccRate / 100
  local ImpressionDifficulty = DataMgr.ImpressionDifficulty
  local Easy = ImpressionDifficulty.Easy
  local Middle = ImpressionDifficulty.Middle
  local Hard = ImpressionDifficulty.Hard
  local Impossible = ImpressionDifficulty.Impossible
  local DifficultyInfo = Easy
  if SuccRate < Hard.DifficultyMinValue then
    DifficultyInfo = Impossible
  elseif SuccRate < Middle.DifficultyMinValue then
    DifficultyInfo = Hard
  elseif SuccRate < Easy.DifficultyMinValue then
    DifficultyInfo = Middle
  end
  return DifficultyInfo
end

function Component:GetImpressionCheckInfo(CheckId)
  local CheckInfo = {}
  local ImpressionCheck = DataMgr.ImpressionCheck[CheckId]
  CheckInfo.CheckRegionId = ImpressionCheck.RegionId
  for _, Type in pairs(CommonConst.ImpressionType) do
    if ImpressionCheck[Type + "Check"] > 0 then
      CheckInfo.CheckType = Type
    end
  end
  return CheckInfo
end

function Component:ShowCommonImpressionReward(Code, Res, CheckData, Rewards, Callback)
  if not (ErrorCode:Check(Code) and Res and Rewards and CheckData) or not CheckData.RewardId then
    Callback()
    return
  end
  local RewardData = DataMgr.Reward[CheckData.RewardId]
  local ItemPageUI = UIManager(GWorld.GameInstance):LoadUINew("GetItemPage", RewardData.Type[1], RewardData.Id[1], RewardData.Count[1][1], Rewards)
  if ItemPageUI and ItemPageUI.BindActionOnClosed then
    ItemPageUI:BindActionOnClosed(function()
      Callback()
    end, self)
  else
    Callback()
  end
end

function Component:ShowImpressionPlusUI(ImprPlusId, Callback)
  DebugPrint("ShowImpressionPlusUI")
  Callback = Callback or function()
  end
  local PlusInfo = TalkUtils:GetImpressionPlusInfo(ImprPlusId)
  if PlusInfo then
    local ImpressionAreaId = PlusInfo.ImpressionAreaId
    local PlusType = PlusInfo.PlusType
    local PlusValue = PlusInfo.PlusValue
    DebugPrint("ImpressionAreaId,PlusType,PlusValue:,", ImpressionAreaId, PlusType, PlusValue)
    local ImpressionDimensionResultUI = UIManager(GWorld.GameInstance):LoadUINew("ImpressionDimensionResult")
    ImpressionDimensionResultUI:Init(true, ImpressionAreaId, PlusType, PlusValue)
    ImpressionDimensionResultUI:SetOnCloseDelegate({
      self,
      function()
        UIManager(GWorld.GameInstance):UnLoadUINew("ImpressionDimensionResult")
        Callback()
      end
    })
    ImpressionDimensionResultUI:FadeIn()
  else
    Utils.ScreenPrint("\230\152\190\231\164\186\229\141\176\232\177\161\229\138\160\229\128\188UI\230\151\182\239\188\140ID " .. ImprPlusId .. "\229\156\168ImpressionPlus\232\161\168\228\184\173\228\184\141\229\173\152\229\156\168\239\188\140\232\175\183\230\163\128\230\159\165")
    Callback()
  end
end

function Component:GetImpressionAreaIdFromRegionId(TargetRegionId)
  TargetRegionId = TargetRegionId or self:GetSubRegionId2RegionId()
  local ImpressionRegions = DataMgr.ImpressionRegion
  for ImpressionRegionId, RegionInfo in pairs(ImpressionRegions) do
    local Regions = RegionInfo.RegionId
    for _, RegionId in pairs(Regions) do
      if TargetRegionId == RegionId then
        return ImpressionRegionId
      end
    end
  end
  Utils.ScreenPrint("\230\156\170\230\137\190\229\136\176\229\141\176\232\177\161\229\140\186\229\159\159ID\239\188\140\232\175\183\230\163\128\230\159\165RegionId\230\152\175\229\144\166\229\156\168ImpressionRegion\232\161\168\228\184\173,SubRegionId:" .. TargetRegionId)
  return TargetRegionId
end

function Component:GetRegionImpression(ImpressionAreaId)
  return self.Impressions:GetImpression(ImpressionAreaId)
end

return Component
