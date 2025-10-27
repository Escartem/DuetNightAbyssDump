local WikiController = require("BluePrints.UI.WBP.Wiki.WikiController")
local WikiCommon = require("BluePrints.UI.WBP.Wiki.WikiCommon")
local EMCache = require("EMCache.EMCache")
local Component = {}
local WikiEntryReddotName = DataMgr.ReddotNode.WikiEntrance.Name
local WikiItemReddotName = DataMgr.ReddotNode.WikiItems.Name
local WikiRewardReddotName = DataMgr.ReddotNode.WikiReward.Name

function Component:WikiEntryGetAllRewards(InCallBack)
  local function Cb(ErrCode, ret)
    self.logger.debug("WikiEntryGetAllRewards", ErrorCode:Name(ErrCode), ret)
    
    DebugPrint("WikiEntryGetAllRewardsErr:Code,ret", ErrCode, ret)
    local rewardId = self:GetWikiRewardIdByProgress(10)
    local AllCount = self:GetCurrentRewardCount()
    if 0 == ErrCode then
      for Progress, RewardInfo in pairs(self.RewardGotList) do
        if self:CheckWikiRewardCanGet(Progress) then
          self:GetWikiReward(Progress)
        end
      end
      self:SaveWikiRewardList()
      self:UpdateWikiRewardReddot()
    end
    if InCallBack then
      InCallBack(ErrCode, ret, rewardId, AllCount)
    end
  end
  
  self:CallServer("WikiEntryGetAllRewards", Cb)
end

function Component:WikiEntryGetReward(Num, InCallBack)
  local function Cb(ErrCode)
    DebugPrint("WikiEntryGetReward", ErrorCode:Name(ErrCode))
    
    DebugPrint("WikiEntryGetRewardErr:Code", ErrCode, Num)
    local rewardId = self:GetWikiRewardIdByProgress(Num)
    if InCallBack then
      InCallBack(Num, rewardId)
    end
  end
  
  self:CallServer("WikiEntryGetReward", Cb, Num)
end

function Component:WikiEntryTextReaded(WikiEntryId, TextId)
  local function Cb(ErrCode)
    self.logger.debug("WikiEntryTextReaded", ErrorCode:Name(ErrCode))
    
    self:SubWikiEntryReddotCount(WikiEntryId)
  end
  
  self:CallServer("WikiEntryTextReaded", Cb, WikiEntryId, TextId)
end

function Component:NotifyWikiEntryUnlock(WikiEntryId, TextId)
  DebugPrint("NotifyWikiEntryUnlock", WikiEntryId, TextId)
  self:InitWikiEntryReddotNode()
  self:InitWikiRewardList()
  WikiController:GetModel():MarkTextAsNew(TextId, WikiEntryId)
  local WikiNoteId = WikiCommon.WikiTipsGuideNoteId
  self:ShowWikiTips(WikiNoteId)
  EventManager:FireEvent(EventID.OnEntryTextUnlocked, WikiEntryId, TextId)
end

function Component:ShowWikiTips(WikiNoteId)
  local UIManager = GWorld.GameInstance:GetGameUIManager()
  if not UIManager then
    return
  end
  if UIManager:GetUI("BattleMain") then
    UIManager:LoadUINew("GuideBook_Tips", WikiNoteId)
  end
end

function Component:Init()
  self.RewardStateChangeCallbacks = {}
end

function Component:EnterWorld()
  WikiController:Init()
  self:InitWikiEntryReddotNode()
  self:LoadWikiRewardList()
  self:InitWikiRewardReddotNode()
end

function Component:LeaveWorld()
  self:SaveWikiRewardList()
  WikiController:Destory()
end

function Component:InitWikiEntryReddotNode()
  ReddotManager.AddNode(WikiItemReddotName)
  ReddotManager.GetTreeNode(WikiItemReddotName).Count = 0
  for Id, Content in pairs(self.WikiEntries) do
    self:AddWikiEntryReddotCount(Id, Content)
  end
end

function Component:AddWikiEntryReddotCount(WikiEntryId, WikiEntryData)
  if ReddotManager.GetTreeNode(WikiItemReddotName) then
    ReddotManager.IncreaseLeafNodeCount(WikiItemReddotName)
  end
end

function Component:SubWikiEntryReddotCount(WikiEntryId)
  if ReddotManager.GetTreeNode(WikiItemReddotName) and ReddotManager.GetTreeNode(WikiItemReddotName).Count > 0 then
    ReddotManager.DecreaseLeafNodeCount(WikiItemReddotName)
  end
end

function Component:ClearWikiEntryReddotCount()
  local NewWikiEntryNode = ReddotManager.GetTreeNode(WikiItemReddotName)
  if not NewWikiEntryNode then
    return
  end
  NewWikiEntryNode.Count = 1
  ReddotManager.DecreaseLeafNodeCount(WikiItemReddotName)
end

function Component:InitWikiRewardList()
  local UnlockedCount = 0
  for _, Content in pairs(self.WikiEntries) do
    UnlockedCount = UnlockedCount + 1
  end
  if not self.RewardGotList then
    self.RewardGotList = {}
  end
  local rewardItems = WikiController:GetModel():GetWikiRewardList()
  for _, RewardData in pairs(rewardItems) do
    if UnlockedCount >= RewardData.RewardProgress and not self.RewardGotList[RewardData.RewardProgress] then
      self.RewardGotList[RewardData.RewardProgress] = {
        RewardData.RewardId,
        0
      }
    end
  end
  self:SaveWikiRewardList()
  self:UpdateWikiRewardReddot()
end

function Component:LoadWikiRewardList()
  if not self.WikiGotRewards then
    return
  end
  self:InitWikiRewardList()
  if self.RewardGotList then
    for progress, gotStatus in pairs(self.WikiGotRewards) do
      if self.RewardGotList[progress] then
        self.RewardGotList[progress][2] = gotStatus
      end
    end
    self:SaveWikiRewardList()
  end
end

function Component:SaveWikiRewardList()
  if self.RewardGotList and next(self.RewardGotList) then
    EMCache:Set("WikiRewardGotList", self.RewardGotList, true)
  end
end

function Component:CheckWikiRewardIsGot(Progress)
  if not self.RewardGotList then
    return false
  end
  if self.RewardGotList[Progress] then
    return 1 == self.RewardGotList[Progress][2]
  end
  return false
end

function Component:CheckWikiRewardCanGet(Progress)
  if not self.RewardGotList or not self.RewardGotList[Progress] then
    return false
  end
  if 1 == self.RewardGotList[Progress][2] then
    return false
  end
  return 0 == self.RewardGotList[Progress][2]
end

function Component:GetWikiReward(Progress)
  if self.RewardGotList[Progress] then
    self.RewardGotList[Progress][2] = 1
    self:SaveWikiRewardList()
  end
  self:UpdateWikiRewardReddot()
end

function Component:CheckHaveWikiRewardToGet()
  if not self.RewardGotList then
    return false
  end
  for Progress, _ in pairs(self.RewardGotList) do
    if self:CheckWikiRewardCanGet(Progress) then
      return true
    end
  end
  return false
end

function Component:GetWikiRewardIdByProgress(Progress)
  if not self.RewardGotList then
    return
  end
  if self.RewardGotList[Progress] then
    return self.RewardGotList[Progress][1]
  end
  return nil
end

function Component:GetCurrentRewardCount()
  local count = 0
  for Progress, Content in pairs(self.RewardGotList) do
    if 0 == Content[2] then
      local RewardInfo = DataMgr.Reward[Content[1]]
      local Count = RewardUtils:GetCount(RewardInfo.Count[1])
      count = count + Count
    end
  end
  return count
end

function Component:EchoWikiEntries()
  PrintTable(self.WikiEntries:all_dump(self.WikiEntries), 10, "WikiEntries")
end

function Component:InitWikiRewardReddotNode()
  ReddotManager.AddNode(WikiRewardReddotName)
  ReddotManager.GetTreeNode(WikiRewardReddotName).Count = self:GetCurrentRewardCount()
  self:UpdateWikiRewardReddot()
end

function Component:UpdateWikiRewardReddot()
  self:ClearWikiRewardReddotCount()
  if self:CheckHaveWikiRewardToGet() then
    self:AddWikiRewardReddotCount()
  end
end

function Component:AddWikiRewardReddotCount()
  if ReddotManager.GetTreeNode(WikiRewardReddotName) then
    ReddotManager.IncreaseLeafNodeCount(WikiRewardReddotName)
  end
end

function Component:SubWikiRewardReddotCount()
  if ReddotManager.GetTreeNode(WikiRewardReddotName) and ReddotManager.GetTreeNode(WikiRewardReddotName).Count > 0 then
    ReddotManager.DecreaseLeafNodeCount(WikiRewardReddotName)
  end
end

function Component:ClearWikiRewardReddotCount()
  local WikiRewardNode = ReddotManager.GetTreeNode(WikiRewardReddotName)
  if not WikiRewardNode then
    return
  end
  WikiRewardNode.Count = 1
  ReddotManager.DecreaseLeafNodeCount(WikiRewardReddotName)
end

return Component
