local Component = {}
local HeroUSDKUtils = require("Utils.HeroUSDKUtils")
local MiscUtils = require("Utils.MiscUtils")
local AnnouncementUtils = require("BluePrints.UI.WBP.Announcement.AnnounceUtils")

function Component:EnterWorld()
  self:InitPortraitReddotNode()
  self:InitPortraitFrameReddotNode()
  self:InitEscPortraitReddotNode()
  self:InitEditBtnReddotNode()
  self.ServerInfo = {}
  if GWorld.IsDev then
    for k, v in MiscUtils.PairsByKeys(require("BluePrints.UI.GameLogin.DevServerList")) do
      self.ServerInfo.HostId = v.hostnum
      self.ServerInfo.Area = v.area
      self.ServerInfo.Name = v.name
      self.ServerInfo.IP = v.ip
      self.ServerInfo.Port = v.port
      break
    end
  end
end

function Component:InitEscPortraitReddotNode()
end

function Component:InitEditBtnReddotNode()
  local Node = ReddotManager.GetTreeNode("EditBtn")
  Node = Node or ReddotManager.AddNode("EditBtn", nil, 1)
end

function Component:InitPortraitReddotNode()
  local Node = ReddotManager.GetTreeNode("Portrait")
  Node = Node or ReddotManager.AddNode("Portrait", nil, 1)
  ReddotManager.ClearLeafNodeCount("Portrait")
  local CacheDetail = ReddotManager.GetLeafNodeCacheDetail("Portrait")
  local Avatar = GWorld:GetAvatar()
  if Avatar and Avatar.HeadIconList then
    for UniqueId, CacheData in pairs(CacheDetail) do
      local Find = false
      for index, value in ipairs(Avatar.HeadIconList) do
        if tostring(value) == UniqueId then
          Find = true
        end
      end
      if not Find then
        CacheDetail[UniqueId] = nil
      end
    end
    for _, Value in pairs(Avatar.HeadIconList or {}) do
      local CacheDetail = ReddotManager.GetLeafNodeCacheDetail("Portrait")
      if CacheDetail[tostring(Value)] then
        ReddotManager.IncreaseLeafNodeCount("Portrait")
      end
    end
  end
end

function Component:InitPortraitFrameReddotNode()
  local Node = ReddotManager.GetTreeNode("PortraitFrame")
  Node = Node or ReddotManager.AddNode("PortraitFrame", nil, 1)
  ReddotManager.ClearLeafNodeCount("PortraitFrame")
  local CacheDetail = ReddotManager.GetLeafNodeCacheDetail("PortraitFrame")
  local Avatar = GWorld:GetAvatar()
  if Avatar and Avatar.HeadFrameList then
    for UniqueId, CacheData in pairs(CacheDetail) do
      local Find = false
      for index, value in ipairs(Avatar.HeadFrameList) do
        if tostring(value) == UniqueId then
          Find = true
        end
      end
      if not Find then
        CacheDetail[UniqueId] = nil
      end
    end
    for _, Value in pairs(Avatar.HeadFrameList or {}) do
      local CacheDetail = ReddotManager.GetLeafNodeCacheDetail("PortraitFrame")
      if CacheDetail[tostring(Value)] then
        ReddotManager.IncreaseLeafNodeCount("PortraitFrame")
      end
    end
  end
end

function Component:EchoAvatar(Index)
  if not Index then
    DebugPrint("Index is nil")
    return
  end
  if not self[Index] then
    DebugPrint("self[Index] is nil", Index)
    return
  end
  if type(self[Index]) == "table" then
    PrintTable(CommonUtils.BinaryDump(self[Index]), 10, "EchoAvatarProp Dump:" .. Index)
  else
    DebugPrint("EchoAvatarProp:" .. Index, self[Index])
  end
end

function Component:NotifyDiscoverNewNotice()
  self.logger.info("NotifyDiscoverNewNotice")
  local AnnouncementUtils = require("BluePrints.UI.WBP.Announcement.AnnounceUtils")
  if not AnnouncementUtils then
    return
  end
  AnnouncementUtils:MarkDirty(true)
end

function Component:NotifyDiscoverNewGameUICtrl()
  self.logger.info("NotifyDiscoverNewGameUICtrl")
  if self.ServerInfo.HostId then
    local CdnTool = require("BluePrints/UI/GameLogin/CdnTool")
    CdnTool:GetCdnHideData(self.ServerInfo.HostId)
  else
    DebugPrint("@ljh,\229\136\183\230\150\176Cdn\233\133\141\231\189\174\229\164\177\232\180\165\239\188\140\230\156\170\230\137\190\229\136\176\229\144\136\230\179\149\231\154\132HostId")
  end
end

function Component:CheckHeadFrameEnough(CheckData)
  for HeadFrameId, Count in pairs(CheckData) do
    if not self.HeadFrameList:HasValue(HeadFrameId) then
      return false
    end
  end
  return true
end

function Component:SetAvatarHeadFrame(NewFrameId, CallBackFunction)
  DebugPrint("[SetAvatarHeadFrame] NewIconId:" .. NewFrameId)
  
  local function Callback(Ret)
    self.logger.debug("SetAvatarHeadFrame callback", Ret, NewFrameId)
    if CallBackFunction then
      local Res = ErrorCode:Check(Ret)
      CallBackFunction(Res)
    end
  end
  
  self:CallServer("SetAvatarHeadFrame", Callback, NewFrameId)
end

function Component:_OnPropChangeSex()
  AudioManager(GWorld):SetVoiceGender()
end

function Component:_OnPropChangeWeitaSex()
  AudioManager(GWorld):SetVoiceGender()
end

function Component:_OnPropChangeHeadIconList()
  for _, Value in ipairs(self.HeadIconList) do
    local CacheKey = tostring(Value)
    local CacheDetail = ReddotManager.GetLeafNodeCacheDetail("Portrait")
    if nil == CacheDetail[CacheKey] and "10001" ~= CacheKey then
      UIUtils.TryAddReddotCacheDetail(CacheKey, "Portrait")
    end
  end
end

function Component:AutoClaimWeaponBreakCollectReward(RewardBox)
  PrintTable(RewardBox, 10, "AutoClaimWeaponBreakCollectReward")
  EventManager:FireEvent(EventID.OnAutoClaimWeaponBreakCollectReward)
end

function Component:_OnPropChangeHeadFrameList()
  for _, Value in ipairs(self.HeadFrameList) do
    local CacheKey = tostring(Value)
    local CacheDetail = ReddotManager.GetLeafNodeCacheDetail("PortraitFrame")
    if nil == CacheDetail[CacheKey] and "-1" ~= CacheKey then
      UIUtils.TryAddReddotCacheDetail(CacheKey, "PortraitFrame")
    end
  end
end

function Component:NotifyNextDay5AM()
  DebugPrint("NotifyNextDay5AM, Start Refresh!!!")
  if self:IsInBigWorld() then
    EventManager:FireEvent(EventID.OnRefreshWithNextDay)
  end
end

function Component:_OnPropChangeCollectRewardExpRecord()
  self.NeedRefreshCollectRewardExpRecord = true
end

function Component:GetCollectRewardRecordCache()
  if not self.CollectRewardRecordCache or self.NeedRefreshCollectRewardExpRecord then
    self.CollectRewardRecordCache = {}
    self.NeedRefreshCollectRewardExpRecord = false
    for path, _ in pairs(self.CollectRewardExpRecord) do
      local Temp = self.CollectRewardRecordCache
      for part in path:gmatch("[^%.]+") do
        Temp[part] = Temp[part] or {}
        Temp = Temp[part]
      end
    end
  end
  return self.CollectRewardRecordCache
end

function Component:CheckHeadSculptureEnough(CheckData)
  for HeadSculptureId, Count in pairs(CheckData) do
    if not self.HeadIconList:HasValue(HeadSculptureId) then
      return false
    end
  end
  return true
end

function Component:SetAvatarHeadIcon(NewIconId, CallBackFunction)
  DebugPrint("[SetAvatarHeadIcon] NewIconId:" .. NewIconId)
  
  local function Callback(Ret)
    self.logger.debug("SetAvatarHeadIcon callback", Ret, NewIconId)
    if CallBackFunction then
      local Res = ErrorCode:Check(Ret)
      CallBackFunction(Res)
    end
  end
  
  self:CallServer("SetAvatarHeadIcon", Callback, NewIconId)
end

function Component:NotifyUnlockBGM(BGMId)
  DebugPrint("NotifyUnlockBGM", BGMId)
end

function Component:SetAvatarSignature(NewSignature, CallBackFunction)
  DebugPrint("[SetAvatarSignature] NewSignature:" .. NewSignature)
  local UIManger = GWorld.GameInstance:GetGameUIManager()
  
  local function SensitiveCallBack(ReplaceSignature, Signature, Words)
    ErrorCode:Check(Const.PlayerSignatureIllegal)
  end
  
  local function NotSensitiveCallBack(Signature)
    local function Callback(Ret)
      self.logger.debug("SetAvatarSignature callback", Ret, NewSignature)
      
      local Res = ErrorCode:Check(Ret)
      if CallBackFunction then
        CallBackFunction(Res)
      end
    end
    
    self:CallServer("SetAvatarSignature", Callback, NewSignature)
  end
  
  HeroUSDKUtils.CheckStringSensitive(UIManger, NewSignature, SensitiveCallBack, NotSensitiveCallBack)
end

function Component:CompletedDialogue(DialogueId)
  DebugPrint("[CompletedDialogue] DialogueId:" .. DialogueId)
  self:CallServerMethod("CompletedDialogue", DialogueId)
end

function Component:ClearAvatarSignature(CallBackFunction)
  DebugPrint("[ClearAvatarSignature]")
  
  local function Callback(Ret)
    self.logger.debug("ClearAvatarSignature callback", Ret)
    local Res = ErrorCode:Check(Ret)
    if CallBackFunction then
      CallBackFunction(Res)
    end
  end
  
  self:CallServer("SetAvatarSignature", Callback, "")
end

function Component:GetAvatarSignature()
  DebugPrint("[GetAvatarSignature]" .. self.Signature)
  return self.Signature
end

function Component:SetAvatarBirthday(Month, Day, CallBackFunction)
  DebugPrint("[SetAvatarBirthday] NewBirthday:" .. Month .. Day)
  
  local function Callback(Ret)
    self.logger.debug("SetAvatarBirthday callback", Ret, Month, Day)
    local Res = ErrorCode:Check(Ret)
    if CallBackFunction then
      CallBackFunction(Res)
    end
  end
  
  self:CallServer("SetAvatarBirthday", Callback, Month, Day)
end

function Component:GetAvatarBirthday()
  return self.Birthday[1], self.Birthday[2], self.Birthday[3]
end

function Component:GMResetAvatarNicknameCD()
  DebugPrint("[GMResetAvatarNicknameCD]")
  self:CallServerMethod("GMResetAvatarNicknameCD")
end

function Component:AvatarCreateRole(NickName, Sex, Callback)
  DebugPrint("AvatarCreateRole", NickName, Sex)
  
  local function Cb(ErrCode)
    DebugPrint("[AvatarCreateRole] ErrCode:", ErrorCode:Name(ErrCode))
    Callback()
  end
  
  self:CallServer("AvatarCreateRole", Cb, NickName, Sex)
end

function Component:SetWeitaInfo(WeitaName, WeitaSex, Callback)
  DebugPrint("SetWeitaInfo", WeitaName, WeitaSex)
  
  local function Cb(ErrCode)
    DebugPrint("[SetWeitaInfo] ErrCode:", ErrorCode:Name(ErrCode))
    Callback()
  end
  
  self:CallServer("SetWeitaInfo", Cb, tostring(WeitaName), tonumber(WeitaSex))
end

function Component:SetAvatarNickname(NickName, Callback)
  DebugPrint("SetAvatarNickname", NickName)
  
  local function Cb(ErrCode)
    DebugPrint("[SetAvatarNickname] ErrCode:", ErrorCode:Name(ErrCode))
    Callback()
  end
  
  self:CallServer("SetAvatarNickname", Cb, NickName)
end

function Component:SetCatName(CatName, Callback)
  DebugPrint("SetCatName", CatName)
  
  local function Cb(ErrCode)
    DebugPrint("[SetCatName] ErrCode:", ErrorCode:Name(ErrCode))
    Callback(ErrCode)
  end
  
  self:CallServer("SetCatName", Cb, CatName)
end

function Component:GMSetAvatarActionPoint(NewActionPoint)
  DebugPrint("[GMSetAvatarActionPoint] NewActionPoint:", NewActionPoint)
  self:CallServerMethod("GMSetAvatarActionPoint", NewActionPoint)
end

function Component:GMCostDungeonActionPoint(DungeonID)
  self:CallServerMethod("GMCostDungeonActionPoint", DungeonID)
end

function Component:PurchaseActionPoint(InCallBack)
  local function Callback(ErrCode)
    DebugPrint("[PurchaseActionPoint] ErrCode:", ErrorCode:Name(ErrCode))
    
    if InCallBack then
      InCallBack(ErrCode)
    end
  end
  
  self:CallServer("PurchaseActionPoint", Callback)
end

function Component:GMSetPlayerExp(newPlayerExp)
  DebugPrint("[GMSetPlayerExp] newPlayerExp:", newPlayerExp)
  self:CallServerMethod("GMSetPlayerExp", newPlayerExp)
end

function Component:GMSetPlayerLevel(newPlayerLevel)
  DebugPrint("[GMSetPlayerLevel] newPlayerLevel:" .. newPlayerLevel)
  self:CallServerMethod("GMSetPlayerLevel", newPlayerLevel)
end

function Component:NotifyAvatarLevelUpdate(LevelInfo)
  local OldLevel = LevelInfo.Level
  local OldExp = LevelInfo.Exp
  local CurLevel = self.Level
  local CurExp = self.Exp
  DebugPrint("[NotifyAvatarLevelUpdate]:", OldLevel, OldExp, CurLevel, CurExp)
  local PlayerLevelupInfo = {
    OldLevel = OldLevel,
    OldExp = OldExp,
    CurLevel = CurLevel,
    CurExp = CurExp,
    ShowProgresBar = true
  }
  if OldLevel == CurLevel and OldExp < CurExp then
  elseif OldLevel < CurLevel then
  end
  local UIManager = GWorld.GameInstance:GetGameUIManager()
  if UIManager then
    UIManager:TryShowPlayerLevelUpInfo(PlayerLevelupInfo)
  end
end

function Component:FilterStringSensitiveWord(Str, callback)
  local function Cb(ErrCode, Str)
    DebugPrint("FilterStringSensitiveWord Cb:", ErrCode, Str)
    
    callback(ErrCode, Str)
  end
  
  self:CallServer("FilterStringSensitiveWord", Cb, Str)
end

function Component:RpcRecorderRestart()
  local RpcRecorder = require("NetworkEngine.Rpc.RpcRecorder")
  RpcRecorder:Restart()
end

function Component:RpcRecorderPrint(PrintDeep)
  local RpcRecorder = require("NetworkEngine.Rpc.RpcRecorder")
  local Deep = PrintDeep or 2
  RpcRecorder:Print(tonumber(Deep))
end

function Component:RpcRecorderSaveStart(Filename)
  local RpcRecorder = require("NetworkEngine.Rpc.RpcRecorder")
  RpcRecorder:StartRecord("F:/DefaultRpcRecorder.bin")
end

function Component:RpcRecorderSaveStop()
  local RpcRecorder = require("NetworkEngine.Rpc.RpcRecorder")
  RpcRecorder:EndRecord()
end

function Component:RpcRecorderLoadTest()
  local RpcRecorder = require("NetworkEngine.Rpc.RpcRecorder")
  local t = RpcRecorder:LoadRecordMsg("F:/DefaultRpcRecorder.bin")
  PrintTable(t, 10, "RpcRecorderLoadTest")
end

function Component:GetAvatarLevelRewards(Callback, Level)
  print(_G.LogTag, "GetAvatarLevelRewards")
  
  local function cb(ret, Rewards)
    if not ErrorCode:Check(ret) then
      return
    end
    if Callback then
      Callback(Rewards)
    end
  end
  
  self:CallServer("GetAvatarLevelRewards", cb, Level)
end

function Component:OnHourlyRefresh(ServerTime)
  self.logger.debug("OnHourlyRefresh", TimeUtils.TimeToStr(ServerTime))
  EventManager:FireEvent(EventID.OnHourlyRefresh)
  self:OnRefreshShop(ServerTime)
end

function Component:OnDailyRefresh(ServerTime)
  self.logger.debug("OnDailyRefresh", TimeUtils.TimeToStr(ServerTime))
  EventManager:FireEvent(EventID.OnDailyRefresh)
  self:OnRefreshShop(ServerTime)
  self:OnDynamicQuestDayLimitTimesChange(false)
  self:OnDailyRefreshGachaCache()
  self:OnDailyRefreshGachaBubble()
end

function Component:OnWeeklyRefresh(ServerTime)
  self.logger.debug("OnWeeklyRefresh", TimeUtils.TimeToStr(ServerTime))
  EventManager:FireEvent(EventID.OnWeeklyRefresh)
  self:OnRefreshShop(ServerTime)
  self:OnRefreshRougeLikeRewardReddot()
end

function Component:OnMonthlyRefresh(ServerTime)
  self.logger.debug("OnMonthlyRefresh", TimeUtils.TimeToStr(ServerTime))
  EventManager:FireEvent(EventID.OnMonthlyRefresh)
  self:OnRefreshShop(ServerTime)
end

return Component
