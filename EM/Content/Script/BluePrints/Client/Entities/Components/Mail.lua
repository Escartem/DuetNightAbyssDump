local Component = {}
local NormalMailName = DataMgr.ReddotNode.NormalMail.Name

local function PrintDictProp(Prop)
  for key, value in pairs(Prop._inner) do
    DebugPrint("key :", key)
    PrintTable(value.Props, 2)
  end
end

function Component:EnterWorld()
  self:InitMailReddotNode()
end

function Component:_OnPropChangeMailInbox(keys)
  if CommonUtils.Size(keys) > 0 then
    local Node = ReddotManager.GetTreeNode(NormalMailName)
    if not Node then
      return
    end
    local UniqueId = keys[1]
    local MailData = self.MailInbox[UniqueId]
    if 1 == CommonUtils.Size(keys) and MailData and not self._DeletedStarMail then
      self:_AddNormalMailReddotCount(MailData)
    end
    self._DeletedStarMail = nil
  end
end

function Component:InitMailReddotNode()
  local Node = ReddotManager.GetTreeNode(NormalMailName)
  Node = Node or ReddotManager.AddNode(NormalMailName)
  ReddotManager.ClearLeafNodeCount(NormalMailName)
  for Unique, MailData in pairs(self.MailInbox or {}) do
    DebugPrint(string.format("\229\136\157\229\167\139\229\140\150\233\130\174\228\187\182\231\186\162\231\130\185\239\188\140UniqueId %s, \229\183\178\233\162\134\229\165\150\239\188\154%s, \229\183\178\232\175\187%s", Unique, MailData.RewardGot, MailData.MailReaded))
    self:_AddNormalMailReddotCount(MailData)
  end
  for Unique, MailData in pairs(self.StarMails or {}) do
    DebugPrint(string.format("\229\136\157\229\167\139\229\140\150\233\130\174\228\187\182\231\186\162\231\130\185\239\188\140UniqueId %s, \229\183\178\233\162\134\229\165\150\239\188\154%s, \229\183\178\232\175\187%s", Unique, MailData.RewardGot, MailData.MailReaded))
    self:_AddNormalMailReddotCount(MailData)
  end
end

function Component:_AddNormalMailReddotCount(MailData)
  if 0 == MailData.MailReaded or 0 == MailData.RewardGot then
    ReddotManager.IncreaseLeafNodeCount(NormalMailName)
  end
end

function Component:_SubNormalMailReddotCount(MailData)
  if 1 == MailData.MailReaded and 1 == MailData.RewardGot then
    ReddotManager.DecreaseLeafNodeCount(NormalMailName)
  end
end

function Component:_SubAllNormalMailReddotCount()
  ReddotManager.ClearLeafNodeCount(NormalMailName)
end

function Component:EchoMail()
  DebugPrint("===========================")
  self.logger.info("MailInbox : ")
  PrintDictProp(self.MailInbox)
  self.logger.info("StarMail : ")
  PrintDictProp(self.StarMails)
  DebugPrint("===========================")
end

function Component:GetMailRewards(UniqueID)
  local function cb(errCode, rewards)
    EventManager:FireEvent(EventID.OnGetMailRewards, errCode, UniqueID, rewards)
    
    self.logger.info("GetMailRewards Callback", UniqueID, ErrorCode:Name(errCode))
    PrintTable(rewards, 10, "GetMailRewards Callback")
    if errCode == ErrorCode.RET_SUCCESS then
      self:_SubNormalMailReddotCount(self.MailInbox[UniqueID] or self.StarMails[UniqueID])
    end
  end
  
  self.logger.info("GetMailRewards Start UniqueID:", UniqueID)
  self:CallServer("GetMailRewards", cb, UniqueID)
end

function Component:MarkMailReaded(UniqueID)
  local function cb(errCode)
    EventManager:FireEvent(EventID.OnMarkMailReaded, errCode, UniqueID)
    
    self.logger.info("MarkMailReaded Callback", ErrorCode:Name(errCode))
    if errCode == ErrorCode.RET_SUCCESS then
      self:_SubNormalMailReddotCount(self.MailInbox[UniqueID])
    end
  end
  
  self.logger.info("MarkMailReaded Start UniqueID:", UniqueID)
  self:CallServer("MarkMailReaded", cb, UniqueID)
end

function Component:MarkMailStar(UniqueID)
  local function cb(errCode, reward)
    EventManager:FireEvent(EventID.OnMarkMailStar, errCode, UniqueID, reward)
    
    self.logger.info("MarkMailStar Callback", ErrorCode:Name(errCode), reward)
    if errCode == ErrorCode.RET_SUCCESS then
      self:_SubNormalMailReddotCount(self.StarMails[UniqueID] or self.MailInbox[UniqueID])
    end
  end
  
  self.logger.info("MarkMailStar Start UniqueID:", UniqueID)
  self:CallServer("MarkMailStar", cb, UniqueID)
end

function Component:DeleteReadedMails()
  local function cb(errCode)
    self.logger.info("DeleteReadedMails Callback", ErrorCode:Name(errCode))
    
    EventManager:FireEvent(EventID.OnDeleteMail)
    self:EchoMail()
  end
  
  self.logger.info("DeleteReadedMails Start")
  self:CallServer("DeleteReadedMails", cb)
end

function Component:CancelMailStar(UniqueID)
  self._DeletedStarMail = self.StarMails[UniqueID]
  
  local function cb(errCode)
    EventManager:FireEvent(EventID.OnCancelMailStar, errCode, UniqueID)
    self.logger.info("CancelMailStar Callback", ErrorCode:Name(errCode))
  end
  
  self.logger.info("CancelMailStar Start UniqueID:", UniqueID)
  self:CallServer("CancelMailStar", cb, UniqueID)
end

function Component:DeleteMail(UniqueID)
  local MailData = self.MailInbox[UniqueID] or self.StarMails[UniqueID]
  
  local function cb(errCode)
    self.logger.info("DeleteMail Callback", ErrorCode:Name(errCode))
    EventManager:FireEvent(EventID.OnDeleteMail)
    if errCode == ErrorCode.RET_SUCCESS then
      self:_SubNormalMailReddotCount(MailData)
    end
  end
  
  self.logger.info("DeleteMail Start UniqueID:", UniqueID)
  self:CallServer("DeleteMail", cb, UniqueID)
end

function Component:GetAllMailReward()
  local function cb(errCode, RewardList)
    EventManager:FireEvent(EventID.OnGetAllMailReward, errCode, RewardList)
    
    self.logger.info("GetAllMailReward Callback", ErrorCode:Name(errCode))
    if errCode == ErrorCode.RET_SUCCESS then
      self:_SubAllNormalMailReddotCount()
    end
  end
  
  self.logger.info("GetAllMailReward Start ")
  self:CallServer("GetAllMailReward", cb)
end

return Component
