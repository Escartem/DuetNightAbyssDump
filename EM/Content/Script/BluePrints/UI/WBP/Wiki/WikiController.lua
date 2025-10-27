local WikiModel = require("BluePrints.UI.WBP.Wiki.WikiModel")
local WikiCommon = require("BluePrints.UI.WBP.Wiki.WikiCommon")
local M = Class("BluePrints.Common.MVC.Controller")

function M:Init()
  M.Super.Init(self)
  self.isProcessingCallback = false
end

function M:Destory()
  M.Super.Destory(self)
end

function M:GetEventName()
  return EventID.WikiControllerEvent
end

function M:GetModel()
  return WikiModel
end

function M:HandleButtonClick(buttonType, entranceWidget)
  if buttonType == WikiCommon.CategoryType.Faction then
    self:OpenWikiMain("Faction", entranceWidget)
  elseif buttonType == WikiCommon.CategoryType.Character then
    self:OpenWikiMain("Character", entranceWidget)
  elseif buttonType == WikiCommon.CategoryType.Customs then
    self:OpenWikiMain("Customs", entranceWidget)
  elseif buttonType == WikiCommon.CategoryType.Civilization then
    self:OpenWikiMain("Civilization", entranceWidget)
  end
end

function M:GetTabIdByCategory(category)
  return WikiCommon.CategoryType[category] or WikiCommon.CategoryType.All
end

function M:OpenWikiMain(category, entranceWidget)
  local View = self:GetView(nil, WikiCommon.MainUIName)
  local params = {
    Category = category,
    TabId = self:GetTabIdByCategory(category),
    EntranceWidget = entranceWidget
  }
  self:GetUIMgr(View):LoadUINew(WikiCommon.MainUIName, params)
  if entranceWidget then
    entranceWidget:HideSelf()
  end
end

function M:GetView(WorldContex, UIName)
  return M.Super.GetView(self, WorldContex, UIName)
end

function M:OpenDialogueWiki(entryIds, entranceWidget, CloseCb)
  if not entryIds or next(entryIds) == nil then
    return false
  end
  if not self:CheckEntriesUnlocked(entryIds) then
    return false
  end
  DebugPrint(TXTTag, "OpenDialogueWiki entryIds:", entryIds)
  local ids = type(entryIds) == "table" and entryIds or {entryIds}
  local params = {
    bShowDialogueWiki = true,
    DialogueEntryIds = ids,
    CloseCallback = CloseCb
  }
  local UIObj = self:GetUIMgr():LoadUINew(WikiCommon.MainUIName, params)
  if not UIObj then
    return false
  end
  if entranceWidget then
    entranceWidget:CloseSelf()
  end
  return true
end

function M:GetDialogueEntries(entryIds)
  return self:GetModel():GetReadableDialogueEntries(entryIds)
end

function M:HandleDialogueEntries(entryIds, callback)
  local readableEntries = self:GetDialogueEntries(entryIds)
  if callback then
    callback(readableEntries)
  end
end

function M:CheckEntriesUnlocked(entryIds)
  local unlockedEntries = self:GetDialogueEntries(entryIds)
  if not unlockedEntries then
    return false
  end
  local ids = type(entryIds) == "table" and entryIds or {entryIds}
  local allLocked = true
  for _, entryId in ipairs(ids) do
    if unlockedEntries[entryId] then
      allLocked = false
      break
    end
  end
  return not allLocked
end

function M:OpenAwardPopup(Owner)
  local NowNum, AllNum = WikiController:GetModel():GetTextNum(1)
  local params = {
    ConfigData = {
      Items = {},
      ShowIcon = false,
      IconPath = "",
      Text_Total = "Wiki_RewardProgress",
      ReceiveAllCallBack = self.GetAllWikiRewards,
      ReceiveAllParam = {},
      SortType = 2,
      NowNum = NowNum,
      NumMax = AllNum,
      ReceiveButtonText = "UI_Achievement_GetAllReward"
    }
  }
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    local rewardItems = self:GetModel():GetWikiRewardList()
    for Id, rewardData in pairs(rewardItems) do
      local IsCanReceive = Avatar:CheckWikiRewardCanGet(rewardData.RewardProgress)
      local IsGot = Avatar:CheckWikiRewardIsGot(rewardData.RewardProgress)
      local Item = {
        Text = GText("UI_Wiki_Reward_Text"),
        ItemId = Id,
        CanReceive = Avatar:CheckWikiRewardCanGet(rewardData.RewardProgress),
        RewardsGot = Avatar:CheckWikiRewardIsGot(rewardData.RewardProgress),
        InProgress = true,
        Rewards = self:BuildRewardContent(rewardData.RewardId),
        Nums = 1,
        NotreachText = "UI_GameEvent_ToBeFinished",
        Hint = "Wiki_RewardList_Content",
        ShowIcon = false,
        ReceiveCallBack = self.GetWikiReward,
        LeftAligned = false,
        SourceNum = rewardData.RewardProgress,
        ReceiveButtonText = "UI_Achievement_GetReward",
        ReceiveParm = {
          RewardId = rewardData.RewardId
        }
      }
      if AllNum >= rewardData.RewardProgress then
        table.insert(params.ConfigData.Items, Item)
      end
      DebugPrint(TXTTag, "CanReceive", Avatar:CheckWikiRewardCanGet(rewardData.RewardProgress))
      DebugPrint(TXTTag, "RewardsGot", Avatar:CheckWikiRewardIsGot(rewardData.RewardProgress))
    end
    params.ConfigData.NumMax = tostring(params.ConfigData.NumMax)
  end
  params.Title = GText("UI_Wiki_Reward_Title")
  UIManager(self):ShowCommonPopupUI(WikiCommon.AwardUIName, params, Owner)
end

function M:BuildRewardContent(RewardId)
  local Rewards = {}
  local RewardInfo = DataMgr.Reward[RewardId]
  if RewardInfo then
    local Ids = RewardInfo.Id or {}
    local RewardCount = RewardInfo.Count or {}
    local TableName = RewardInfo.Type or {}
    for i = 1, #Ids do
      local ItemId = Ids[i]
      local Count = RewardUtils:GetCount(RewardCount[i])
      local Rarity = ItemUtils.GetItemRarity(ItemId, TableName[i])
      local ItemType = TableName[i]
      local RewardContent = {
        ItemType = ItemType,
        ItemId = ItemId,
        Count = Count,
        Rarity = Rarity
      }
      table.insert(Rewards, RewardContent)
    end
  end
  return Rewards
end

function M:GetAllWikiRewards(ReceiveAllParm)
  if self.isProcessingCallback then
    return
  end
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    local function CallBack(ErrCode, RewardReturn, rewardId, AllCount)
      self.isProcessingCallback = false
      
      self:BlockAllUIInput(false)
      local HaveRewardToGet = false
      for i = 0, ReceiveAllParm.SelfWidget.List_Item:GetNumItems() - 1 do
        local Item = ReceiveAllParm.SelfWidget.List_Item:GetItemAt(i)
        local CanReceive = Avatar:CheckWikiRewardCanGet(Item.ConfigData.SourceNum)
        local IsGot = Avatar:CheckWikiRewardIsGot(Item.ConfigData.SourceNum)
        if CanReceive then
          HaveRewardToGet = true
        end
        Item.ConfigData.CanReceive = CanReceive
        Item.ConfigData.RewardsGot = IsGot
        if Item.SelfWidget then
          Item.SelfWidget:RefreshBtn(IsGot)
        end
      end
      ReceiveAllParm.SelfWidget:RefreshButton(HaveRewardToGet)
      local rewardData = DataMgr.Reward[rewardId]
      if rewardData then
        UIManager(GWorld.GameInstance):LoadUI(UIConst.LoadInConfig, "GetItemPage", nil, rewardData.Type[1], rewardData.Id[1], AllCount)
      end
    end
    
    self.isProcessingCallback = true
    self:BlockAllUIInput(true)
    Avatar:WikiEntryGetAllRewards(CallBack)
  end
end

function M:GetWikiReward(ReceiveParm)
  if self.isProcessingCallback then
    return
  end
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    local function CallBack(Num, rewardId)
      self.isProcessingCallback = false
      
      self:BlockAllUIInput(false)
      Avatar:GetWikiReward(ReceiveParm.ConfigData.SourceNum)
      local CanReceive = Avatar:CheckWikiRewardCanGet(ReceiveParm.ConfigData.SourceNum)
      local IsGot = Avatar:CheckWikiRewardIsGot(ReceiveParm.ConfigData.SourceNum)
      ReceiveParm.ConfigData.CanReceive = CanReceive
      ReceiveParm.ConfigData.RewardsGot = IsGot
      ReceiveParm.SelfWidget:RefreshBtn(IsGot)
      local HaveRewardToGet = Avatar:CheckHaveWikiRewardToGet()
      DebugPrint(TXTTag, "CheckHaveWikiRewardToGet", HaveRewardToGet)
      ReceiveParm.Owner:RefreshButton(HaveRewardToGet)
      if DataMgr.Reward[rewardId] then
        local rewardData = DataMgr.Reward[rewardId]
        UIManager(GWorld.GameInstance):LoadUI(UIConst.LoadInConfig, "GetItemPage", nil, rewardData.Type[1], rewardData.Id[1], rewardData.Count[1][1])
      end
    end
    
    self.isProcessingCallback = true
    self:BlockAllUIInput(true)
    Avatar:WikiEntryGetReward(ReceiveParm.ConfigData.SourceNum, CallBack)
  end
end

_G.WikiController = M
return M
