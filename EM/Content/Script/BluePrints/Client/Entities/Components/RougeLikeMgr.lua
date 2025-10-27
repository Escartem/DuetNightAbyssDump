local TimeUtils = require("Utils.TimeUtils")
local RougeConst = require("BluePrints.UI.UI_PC.RougeLike.RougeAchive.RougeConst")
local Component = {}

function Component:EnterWorld()
  self:RefreshRougeLikeRewardReddot()
end

function Component:EnterRougeLike(callback, Difficulty, SquadId)
  print(_G.LogTag, "EnterRougeLike")
  
  local function cb(ret)
    if not ErrorCode:Check(ret) then
      self:ShowErrorByErrorCode("EnterRougeLike", ret)
      return
    end
    if callback then
      callback(ret)
    end
  end
  
  SquadId = SquadId or 1
  self:CallServer("EnterRougeLike", cb, Difficulty, SquadId)
end

function Component:EnterRoom(RoomId)
  print(_G.LogTag, "EnterRoom", RoomId)
  if GWorld.RougeLikeManager then
    GWorld.RougeLikeManager:TriggerRecordProgressData()
  end
  
  local function callback(ret, UpdateInfo)
    if not ErrorCode:Check(ret) then
      self:ShowErrorByErrorCode("EnterRoom", ret)
      return
    end
    if not GWorld.RougeLikeManager then
      return
    end
    GWorld.RougeLikeManager:RefreshRougeInfo(UpdateInfo)
    GWorld.RougeLikeManager:OnEnterRoom()
  end
  
  self:CallServer("EnterRoom", callback, RoomId)
end

function Component:PassRoom(Time)
  local RoomType = DataMgr.RougeLikeRoom[GWorld.RougeLikeManager.RoomId].RoomType
  local IsBossRoom = 5 == RoomType
  if IsBossRoom then
    DebugPrint("RougeLikeComponent: RougeLikeFinish  RoomIndex:" .. GWorld.RougeLikeManager.RoomIndex .. ", RoomId:" .. GWorld.RougeLikeManager.RoomId)
    local GameMode = UE4.UGameplayStatics.GetGameMode(GWorld.GameInstance)
    GameMode:FinishRougeLike(true)
  else
    DebugPrint("RougeLikeComponent: PassRoom  RoomIndex:" .. GWorld.RougeLikeManager.RoomIndex .. ", RoomId:" .. GWorld.RougeLikeManager.RoomId)
    GWorld.RougeLikeManager:TriggerRecordProgressData()
  end
  print(_G.LogTag, "PassRoom")
  
  local function cb(ret, UpdateInfo)
    if not ErrorCode:Check(ret) then
      self:ShowErrorByErrorCode("PassRoom", ret)
      return
    end
    if not GWorld.RougeLikeManager then
      return
    end
    GWorld.RougeLikeManager:RefreshRougeInfo(UpdateInfo, {IsPassRoomAward = true})
    GWorld.RougeLikeManager:OnPassRoom()
  end
  
  Time = Time or 0
  self:CallServer("PassRoom", cb, Time)
end

function Component:GetTreasure(TreasuresId, callback)
  if not TreasuresId then
    print(_G.LogTag, "GetTreasure with nil TreasuresId")
    return
  end
  
  local function cb(ret, UpdateInfo)
    self.logger.debug("GetTreasure callback", TreasuresId, ret)
    if not ErrorCode:Check(ret) then
      self:ShowErrorByErrorCode("GetTreasure", ret)
      return
    end
    if not GWorld.RougeLikeManager then
      return
    end
    GWorld.RougeLikeManager:RefreshRougeInfo(UpdateInfo)
    if callback then
      callback(ret)
    end
  end
  
  self:CallServer("GetTreasure", cb, TreasuresId)
end

function Component:GetBlessing(BlessingId, callback)
  if not BlessingId then
    print(_G.LogTag, "GetBlessing with nil BlessingId")
    return
  end
  
  local function cb(ret, UpdateInfo)
    self.logger.debug("GetBlessing callback", BlessingId, ret)
    if not ErrorCode:Check(ret) then
      self:ShowErrorByErrorCode("GetBlessing", ret)
      return
    end
    if not GWorld.RougeLikeManager then
      return
    end
    GWorld.RougeLikeManager:RefreshRougeInfo(UpdateInfo)
    if callback then
      callback(ret)
    end
  end
  
  self:CallServer("GetBlessing", cb, BlessingId)
end

function Component:RougeLikeRefundMRT(AwardType, callback)
  if "Blessing" ~= AwardType and "Treasure" ~= AwardType then
    print(_G.LogTag, "RougeLikeRefundMRT with invalid AwardType", AwardType)
    return
  end
  
  local function cb(ret, UpdateInfo)
    if not ErrorCode:Check(ret) then
      self:ShowErrorByErrorCode("RougeLikeRefundMRT", ret)
      return
    end
    if not GWorld.RougeLikeManager then
      return
    end
    GWorld.RougeLikeManager:RefreshRougeInfo(UpdateInfo)
    if callback then
      callback(ret)
    end
  end
  
  self:CallServer("RougeLikeRefundMRT", cb, AwardType)
end

function Component:GetCurrentRougeLikeToken()
  local TokenId = self:GetCurrentRougeLikeTokenId()
  return self.Resources:QueryResourceCount(TokenId)
end

function Component:GetCurrentRougeLikeTokenId()
  local CurrentSeason = self.RougeLike.ProgressingSeasonId
  local SeasonInfo = DataMgr.RougeLikeSeason[CurrentSeason]
  if not SeasonInfo then
    return 0
  end
  return SeasonInfo.TokenId
end

function Component:GetCurrentRougeLikeTalent()
  local TalentId = self:GetCurrentRougeLikeTalentId()
  return self.Resources:QueryResourceCount(TalentId)
end

function Component:GetCurrentRougeLikeTalentId()
  local CurrentSeason = self.RougeLike.ProgressingSeasonId
  local SeasonInfo = DataMgr.RougeLikeSeason[CurrentSeason]
  if not SeasonInfo then
    return 0
  end
  return SeasonInfo.TalentId
end

function Component:GetCurrentRougeLikeOuterShopToken()
  local OuterShopTokenId = self:GetCurrentRougeLikeOuterShopTokenId()
  return self.Resources:QueryResourceCount(OuterShopTokenId)
end

function Component:GetCurrentRougeLikeOuterShopTokenId()
  local CurrentSeason = self.RougeLike.ProgressingSeasonId
  local SeasonInfo = DataMgr.RougeLikeSeason[CurrentSeason]
  if not SeasonInfo then
    return 0
  end
  return SeasonInfo.OuterShopTokenId
end

function Component:RefreshAward(AwardType, callback)
  if "Blessing" ~= AwardType and "Treasure" ~= AwardType then
    if callback then
      callback(ErrorCode.RET_PARAM_ERROR)
    end
    return
  end
  
  local function cb(ret, UpdateInfo)
    if not ErrorCode:Check(ret) then
      self:ShowErrorByErrorCode("RefreshAward", ret)
      return
    end
    if not GWorld.RougeLikeManager then
      return
    end
    GWorld.RougeLikeManager:RefreshRougeInfo(UpdateInfo, {NoNeedTriggerGetAward = true})
    if callback then
      callback(ret)
    end
  end
  
  self:CallServer("RefreshAward", cb, AwardType)
end

function Component:InterruptRougeLike()
  print(_G.LogTag, "InterruptRougeLike")
  self:CallServerMethod("ClearRougeLike")
end

function Component:OnRougeLikeEnd(IsWin, FinishDump, Score, TalentPoint, OuterShopToken, Reward)
  print(_G.LogTag, "OnRougeLikeEnd", IsWin, Score)
  PrintTable(Reward, 3)
  self:TryToAddRougeLikeRewardReddot(Score)
  local GameMode = UE4.UGameplayStatics.GetGameMode(GWorld.GameInstance)
  if GameMode:IsInRegion() then
    local UIManager = GWorld.GameInstance:GetGameUIManager()
    local LogicServerInfo = table.pack(IsWin, FinishDump, Score, TalentPoint, OuterShopToken, self.RougeLike.ProgressingSeasonId)
    UIManager:LoadUINew("RougeSettlement", LogicServerInfo)
  else
    self.FirstTimeRougeLikeReward = Reward
    GWorld.GameInstance:PushLogicServerCallbackInfo(IsWin, FinishDump, Score, TalentPoint, OuterShopToken, self.RougeLike.ProgressingSeasonId)
  end
end

function Component:IsRougeLikeInProgress()
  local InProgress = self.RougeLike:IsInProgress()
  print(_G.LogTag, "IsRougeLikeInProgress", InProgress)
  return InProgress
end

function Component:UpgradeAward(AwardType, AwardId, ShopRandomId, callback)
  if "Blessing" ~= AwardType then
    if callback then
      callback(ErrorCode.RET_PARAM_ERROR)
    end
    return
  end
  print(_G.LogTag, "UpgradeAward", AwardType, AwardId, ShopRandomId)
  
  local function cb(ret, _AwardId, NewAwardInfo, LeftTimes)
    if not GWorld.RougeLikeManager then
      return
    end
    if ErrorCode:Check(ret) then
      local UpdateInfo = {}
      local Key = AwardType .. "_Update"
      UpdateInfo[Key] = {}
      UpdateInfo[Key][AwardId] = NewAwardInfo
      GWorld.RougeLikeManager:RefreshRougeInfo(UpdateInfo)
      if ShopRandomId then
        local f = GWorld.RougeLikeManager["RefreshShop" .. AwardType]
        if f then
          f(GWorld.RougeLikeManager, ShopRandomId, _AwardId, LeftTimes)
        else
          print(_G.LogTag, "Cannot refresh shop", AwardType)
        end
      end
    else
      self:ShowErrorByErrorCode("UpgradeAward", ret)
    end
    if callback then
      callback(ret, NewAwardInfo)
    end
  end
  
  self:CallServer("UpgradeAward", cb, AwardType, AwardId, ShopRandomId)
end

function Component:RougeShopPurchase(ShopRandomId, ItemType, ItemId, callback)
  if "Blessing" ~= ItemType and "Treasure" ~= ItemType and "Item" ~= ItemType then
    if callback then
      callback(ErrorCode.RET_PARAM_ERROR)
    end
    return
  end
  print(_G.LogTag, "RougeShopPurchase", ItemType, ItemId)
  
  local function cb(ret, LeftTimes, UpdateInfo)
    if not GWorld.RougeLikeManager then
      return
    end
    if ErrorCode:Check(ret) then
      GWorld.RougeLikeManager:RefreshRougeInfo(UpdateInfo)
      local func = GWorld.RougeLikeManager["RefreshShop" .. ItemType]
      if func then
        func(GWorld.RougeLikeManager, ShopRandomId, ItemId, LeftTimes)
      else
        print(_G.LogTag, "Cannot refresh shop", ItemType)
      end
    else
      self:ShowErrorByErrorCode("RougeShopPurchase", ret)
    end
    if callback then
      callback(ret)
    end
  end
  
  self:CallServer("RougeShopPurchase", cb, ShopRandomId, ItemType, ItemId)
end

function Component:SaveTalent(Talent, callback)
  print(_G.LogTag, "SaveTalent")
  
  local function cb(ret)
    if not ErrorCode:Check(ret) then
      self:ShowErrorByErrorCode("SaveTalent", ret)
      return
    end
    if callback then
      callback(ret)
    end
  end
  
  self:CallServer("SaveTalent", cb, Talent)
end

function Component:SaveOneTalent(TalentId, callback)
  print(_G.LogTag, "SaveOneTalent", TalentId)
  
  local function cb(ret)
    if callback then
      callback(ret)
    end
  end
  
  self:CallServer("SaveTalentForOne", cb, TalentId)
end

function Component:OnUpdateRougeLikeInfo(UpdateInfo)
  print(_G.LogTag, "OnUpdateRougeLikeInfo")
  if not GWorld.RougeLikeManager then
    return
  end
  GWorld.RougeLikeManager:RefreshRougeInfo(UpdateInfo)
end

function Component:SelectEvent(SelectId, Callback)
  print(_G.LogTag, "SelectEvent", SelectId)
  if GWorld.RougeLikeManager then
    GWorld.RougeLikeManager:ListenDealRewardEvent()
    GWorld.RougeLikeManager:TriggerRecordProgressData()
  end
  
  local function cb(ret, UpdateInfo)
    if not ErrorCode:Check(ret, UpdateInfo) then
      return
    end
    if not GWorld.RougeLikeManager then
      return
    end
    GWorld.RougeLikeManager:RefreshRougeInfo(UpdateInfo)
    if Callback then
      Callback(ret)
    end
  end
  
  self:CallServer("SelectEvent", cb, SelectId)
end

function Component:PassEvent(bSuccess, CustomData)
  bSuccess = bSuccess or true
  CustomData = CustomData or {}
  print(_G.LogTag, "PassEvent", bSuccess)
  self:CallServerMethod("PassEvent", bSuccess, CustomData)
  if GWorld.RougeLikeManager.EventId == 2001 then
    local UIManager = GWorld.GameInstance:GetGameUIManager()
    UIManager:LoadUINew("RougeGameSettlement", GWorld.RougeLikeManager.EventId, CustomData)
  end
end

function Component:OnPassEvent(ret, UpdateInfo)
  if not ErrorCode:Check(ret, UpdateInfo) then
    return
  end
  if not GWorld.RougeLikeManager then
    return
  end
  print(_G.LogTag, "OnPassEvent", GWorld.RougeLikeManager.RoomId)
  GWorld.RougeLikeManager:RegisterEventTime()
  if GWorld.RougeLikeManager.EventId == 2001 then
    GWorld.RougeLikeManager:RefreshRougeInfo(UpdateInfo, {IsCanonMiniGameReward = true})
  else
    GWorld.RougeLikeManager:RefreshRougeInfo(UpdateInfo)
  end
  GWorld.RougeLikeManager:TryEventPassRoom()
  GWorld.RougeLikeManager:UnRegisterEventTime()
end

function Component:SavePlayerSlice(SliceInfo)
  local SerializedString = SerializeUtils:Serialize(SliceInfo)
  self:CallServerMethod("SavePlayerSlice", SerializedString)
end

function Component:GetRougeLikeWeeklyReward(Callback, Index)
  print(_G.LogTag, "GetRougeLikeWeeklyReward")
  
  local function cb(ret, Rewards)
    if not ErrorCode:Check(ret) then
      self:ShowErrorByErrorCode("GetRougeLikeWeeklyReward", ret)
      return
    end
    if Callback then
      Callback(Rewards)
    end
  end
  
  Index = Index or -1
  self:CallServer("GetWeeklyRougeLikeReward", cb, Index)
end

function Component:IsRougeLikeWeeklyRewardGot(Index)
  return 1 == self.RougeLike.WeeklyRewardGot[Index]
end

function Component:OnGetAward(UpdateInfo)
  if not GWorld.RougeLikeManager then
    return
  end
  print(_G.LogTag, "OnGetAward")
  GWorld.RougeLikeManager:RefreshRougeInfo(UpdateInfo)
  GWorld.RougeLikeManager:TriggerRecordProgressData()
end

function Component:_OnPropChangeResources(keys, old_value)
  local ResourceId = keys[1]
  local CurrentSeason = self.RougeLike.ProgressingSeasonId
  local SeasonInfo = DataMgr.RougeLikeSeason[CurrentSeason]
  if not SeasonInfo then
    return
  end
  if ResourceId == SeasonInfo.TokenId then
    old_value = old_value or 0
    if type(old_value) == "table" then
      old_value = old_value.Count
    end
    local CurrentValue = self.Resources:QueryResourceCount(ResourceId)
    local CountOffset = CurrentValue - old_value
    if GWorld.RougeLikeManager then
      GWorld.RougeLikeManager.RougeToken = CurrentValue
    end
    if CountOffset > 0 then
      print(_G.LogTag, "Add Token", CountOffset)
      if GWorld.RougeLikeManager then
        GWorld.RougeLikeManager:ShowTokenTips(CountOffset)
      end
    end
  end
end

function Component:TriggerTMGetReward()
  print(_G.LogTag, "TriggerTMGetReward")
  
  local function cb(ret, UpdateInfo)
    if not ErrorCode:Check(ret) then
      self:ShowErrorByErrorCode("TriggerTMGetReward", ret)
      return
    end
    self:OnGetAward(UpdateInfo)
  end
  
  self:CallServer("TriggerTMGetReward", cb)
end

function Component:PreFinishRougeLike(Callback, IsWin)
  print(_G.LogTag, "PreFinishRougeLike", IsWin)
  
  local function cb(UpdateInfo, bStoryEvent)
    self:OnUpdateRougeLikeInfo(UpdateInfo)
    if Callback then
      Callback(bStoryEvent)
    end
  end
  
  self:CallServer("PreFinishRougeLike", cb, IsWin)
end

function Component:PassStory()
  print(_G.LogTag, "PassStory")
  
  local function cb(ret, UpdateInfo)
    if not ErrorCode:Check(ret) then
      self:ShowErrorByErrorCode("PassStory", ret)
      return
    end
    self:OnUpdateRougeLikeInfo(UpdateInfo)
  end
  
  self:CallServer("PassStory", cb)
end

function Component:SaveContract(Callback, ContractInfo)
  print(_G.LogTag, "SaveContract")
  
  local function cb(ret)
    ErrorCode:Check(ret)
    if Callback then
      Callback(ret)
    end
  end
  
  self:CallServer("SaveContract", cb, ContractInfo)
end

function Component:HasPassedRougeLikeDifficulty(Difficulty)
  return self.RougeLike.PassCount[Difficulty] > 0
end

function Component:GetProgressingRougeLikeAbstract(Callback)
  if not Callback then
    return
  end
  self:CallServer("GetProgressingRougeLikeAbstract", Callback)
end

function Component:_OnPropChangeRougeLike()
  EventManager:FireEvent(EventID.OnRougeLikeInfoUpdate)
end

function Component:GetRougeLikeManualReward(Callback, ManualType, Index)
  local function cb(ret, Rewards)
    if not ErrorCode:Check(ret) then
      self:ShowErrorByErrorCode("GetRougeLikeManualReward", ret)
      
      return
    end
    if Callback then
      Callback(ret, Rewards)
    end
  end
  
  self:CallServer("GetRougeLikeManualReward", cb, ManualType, Index)
end

function Component:TryToAddRougeLikeRewardReddot(Score)
  local RewardInfo = DataMgr.RougeLikeReward[self.RougeLike.WeeklyRewardId]
  if RewardInfo and RewardInfo.Reward and RewardInfo.EachGradePoints then
    local CurWeeklyMaxScore = self.RougeLike.WeeklyTotalScore
    local LastWeeklyMaxScore = CurWeeklyMaxScore - Score
    local MaxScore = #RewardInfo.Reward * RewardInfo.EachGradePoints
    if LastWeeklyMaxScore >= MaxScore then
      return
    end
    if CurWeeklyMaxScore > MaxScore then
      CurWeeklyMaxScore = MaxScore
    end
    local AddNum = math.floor(CurWeeklyMaxScore / RewardInfo.EachGradePoints) - math.floor(LastWeeklyMaxScore / RewardInfo.EachGradePoints)
    if AddNum > 0 then
      if not ReddotManager.GetTreeNode("RougeLikeReward") then
        ReddotManager.AddNode("RougeLikeReward")
      end
      ReddotManager.IncreaseLeafNodeCount("RougeLikeReward", AddNum)
    end
  end
end

function Component:OnRefreshRougeLikeRewardReddot()
  if not ReddotManager.GetTreeNode("RougeLikeReward") then
    ReddotManager.AddNode("RougeLikeReward")
  end
  ReddotManager.ClearLeafNodeCount("RougeLikeReward")
end

function Component:RefreshRougeLikeRewardReddot()
  self:OnRefreshRougeLikeRewardReddot()
  if self.RougeLike.WeeklyRewardId then
    local RewardInfo = DataMgr.RougeLikeReward[self.RougeLike.WeeklyRewardId]
    local WeeklyTotalScore = self.RougeLike.WeeklyTotalScore
    if RewardInfo and RewardInfo.Reward and RewardInfo.EachGradePoints then
      local IncreaceNum = 0
      for Index, _ in ipairs(RewardInfo.Reward) do
        local GradePoints = RewardInfo.EachGradePoints * Index
        if WeeklyTotalScore >= GradePoints and not self:IsRougeLikeWeeklyRewardGot(Index) then
          IncreaceNum = IncreaceNum + 1
        end
      end
      ReddotManager.IncreaseLeafNodeCount("RougeLikeReward", IncreaceNum)
    end
  end
end

function Component:RougeLikeTryRecover(Callback)
  print(_G.LogTag, "RougeLikeTryRecover")
  
  local function cb(ret, bCanRecover, RecoverInfo)
    if not ErrorCode:Check(ret) then
      self:ShowErrorByErrorCode("RougeLikeTryRecover", ret)
      return
    end
    if not GWorld.RougeLikeManager then
      return
    end
    if Callback then
      Callback(bCanRecover, RecoverInfo)
    end
  end
  
  self:CallServer("RougeLikeTryRecover", cb)
end

function Component:SelectStoryEvent(StoryEventId, Callback)
  local function cb(ret)
    if not ErrorCode:Check(ret) then
      self:ShowErrorByErrorCode("SelectStoryEvent", ret)
      
      return
    end
    if not GWorld.RougeLikeManager then
      return
    end
    if Callback then
      Callback(ret)
    end
  end
  
  self:CallServer("SelectStoryEvent", cb, StoryEventId)
end

function Component:OnRougeLikeManualUpdate(Type, Key)
  local DataModel = require("BluePrints.UI.UI_PC.RougeLike.RougeAchive.Rouge_Archive_DataModel")
  if DataModel:CheckArchiveItemIsNew(Type, Key) then
    DataModel:IncreaseArchiveTypeReddot(Type)
  end
  DataModel:UpdateArchiveRewardReddot()
end

function Component:NotifyTriggerRougeLikeStoryEvent(StoryEventId)
  print(_G.LogTag, "NotifyTriggerRougeLikeStoryEvent", StoryEventId)
  self:CallServerMethod("ClientTriggerRougeLikeStoryEvent", StoryEventId)
end

function Component:ShowErrorByErrorCode(FunctionName, ErrorCode)
  if not GWorld.RougeLikeManager then
    return
  end
  local MsgTable = {
    FunctionName,
    ErrorCode,
    "\n"
  }
  GWorld.RougeLikeManager:FillErrorLog(MsgTable)
  local GameMode = UE4.UGameplayStatics.GetGameMode(GWorld.GameInstance)
  if GameMode then
    GameMode:FillRougeLikeErrorLog(MsgTable)
  end
  local FinalMsg = table.concat(MsgTable, " ")
  GWorld.RougeLikeManager:ShowRougeLikeError(FinalMsg)
end

return Component
