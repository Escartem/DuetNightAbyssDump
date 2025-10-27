local Class = _G.TypeClass
local AvatarEntity = require("BluePrints.Client.Wrapper.Entity").AvatarEntity
local Assemble = require("NetworkEngine.Common.Assemble")
local HeroUSDKUtils = require("Utils.HeroUSDKUtils")
local TimeUtils = require("Utils.TimeUtils")
local MiscUtils = require("Utils.MiscUtils")
local EMCache = require("EMCache.EMCache")
local pb = require("pb")
local Avatar = Class("Avatar", AvatarEntity)
Avatar.__Props__ = "BluePrints.Client.Implements.Avatar"
Avatar.__Component__ = {
  "BluePrints.Client.Entities.Components.EntityBase",
  "BluePrints.Client.Entities.Components.AvatarInfo",
  "BluePrints.Client.Entities.Components.Others",
  "BluePrints.Client.Entities.Components.Login",
  "BluePrints.Client.Entities.Components.AvatarStatus",
  "BluePrints.Client.Entities.Components.BattleCheck",
  "BluePrints.Client.Entities.Components.CharMgr",
  "BluePrints.Client.Entities.Components.WeaponMgr",
  "BluePrints.Client.Entities.Components.ResourceMgr",
  "BluePrints.Client.Entities.Components.ModMgr",
  "BluePrints.Client.Entities.Components.DungeonMgr",
  "BluePrints.Client.Entities.Components.BattleLogic",
  "BluePrints.Client.Entities.Components.BonusMgr",
  "BluePrints.Client.Entities.Components.QuestMgr",
  "BluePrints.Client.Entities.Components.TargetMgr",
  "BluePrints.Client.Entities.Components.PlayerInfoMgr",
  "BluePrints.Client.Entities.Components.AchvMgr",
  "BluePrints.Client.Entities.Components.DSMgr",
  "BluePrints.Client.Entities.Components.BlueMgr",
  "BluePrints.Client.Entities.Components.GachaMgr",
  "BluePrints.Client.Entities.Components.RankCom",
  "BluePrints.Client.Entities.Components.ShopMgr",
  "BluePrints.Client.Entities.Components.LSMgr",
  "BluePrints.Client.Entities.Components.Team",
  "BluePrints.Client.Entities.Components.ExploreMgr",
  "BluePrints.Client.Entities.Components.SuitMgr",
  "BluePrints.Client.Entities.Components.HardBoss",
  "BluePrints.Client.Entities.Components.MSDKUpload",
  "BluePrints.Client.Entities.Components.Mail",
  "BluePrints.Client.Entities.Components.PartyMgr",
  "BluePrints.Client.Entities.Components.SystemGuideMgr",
  "BluePrints.Client.Entities.CommonComponents.ResourceUseComponent",
  "BluePrints.Client.Entities.Components.ConditionMgr",
  "BluePrints.Client.Entities.Components.PayMgr",
  "BluePrints.Client.Entities.Components.GuideBook",
  "BluePrints.Client.Entities.Components.MarkPointMgr",
  "BluePrints.Client.Entities.Components.UIUnlockMgr",
  "BluePrints.Client.Entities.Components.CharAccessoryMgr",
  "BluePrints.Client.Entities.Components.RegionLogMgr",
  "BluePrints.Client.Entities.Components.RougeLikeMgr",
  "BluePrints.Client.Entities.Components.ExtendMgr",
  "BluePrints.Client.Entities.Components.TraceMgr",
  "BluePrints.Client.Entities.Components.Friend",
  "BluePrints.Client.Entities.Components.Pet",
  "BluePrints.Client.Entities.Components.BuffMgr",
  "BluePrints.Client.Entities.CommonComponents.AutoBattleTestComponent",
  "BluePrints.Client.Entities.Components.AvatarRegionRpcMgr",
  "BluePrints.Client.Entities.Components.AvatarRegionMgr",
  "BluePrints.Client.Entities.Components.ChatComp",
  "BluePrints.Client.Entities.Components.DynamicQuestMgr",
  "BluePrints.Client.Entities.Components.StarterQuest",
  "BluePrints.Client.Entities.Components.DailyLogin",
  "BluePrints.Client.Entities.Components.ImpressionShopMgr",
  "BluePrints.Client.Entities.Components.WikiEntry",
  "BluePrints.Client.Entities.Components.AppearanceMgr",
  "BluePrints.Client.Entities.Components.AbyssMgr",
  "BluePrints.Client.Entities.Components.DispathMgr",
  "Blueprints.Client.Entities.Components.Walnut",
  "Blueprints.Client.Entities.CommonComponents.GameModeWalnutComponent",
  "Blueprints.Client.Entities.Components.OnlineComp",
  "Blueprints.Client.Entities.Components.RegionMoveSyncMgr",
  "Blueprints.Client.Entities.Components.LevelSequence",
  "BluePrints.Client.Entities.Components.NewImpressionMgr",
  "BluePrints.Client.Entities.Components.ArchiveMgr",
  "BluePrints.Client.Entities.Components.FishMgr",
  "BluePrints.Client.Entities.Components.DetectiveQuestion",
  "BluePrints.Client.Entities.Components.SquadMgr",
  "BluePrints.Client.Entities.Components.PersonalInfoMgr",
  "BluePrints.Client.Entities.Components.MonthlyCardComp",
  "BluePrints.Client.Entities.Components.BattlePass",
  "BluePrints.Client.Entities.Components.DailyTaskMgr",
  "BluePrints.Client.Entities.Components.ModBookQuestComp",
  "BluePrints.Client.Entities.Components.ZhiLiuEntrust",
  "BluePrints.Client.Entities.Components.HoldModMgr",
  "BluePrints.Client.Entities.Components.MidTermMgr",
  "BluePrints.Client.Entities.Components.PaotaiGame",
  "BluePrints.Client.Entities.Components.LimitedResourceMgr",
  "BluePrints.Client.Entities.Components.CommonQuestActivity",
  "BluePrints.Client.Entities.Components.CommunityMgr",
  "BluePrints.Client.Entities.Components.TempleEventMgr",
  "BluePrints.Client.Entities.Components.MiscEnterWorldMgr",
  "BluePrints.Client.Entities.Components.FeiNaMgr",
  "BluePrints.Client.Entities.Components.TitleComp",
  "BluePrints.Client.Entities.Components.DoubleModDrop",
  "BluePrints.Client.Entities.Components.SettlementOnlineMgr",
  "BluePrints.Client.Entities.Components.TheaterActivity"
}

function Avatar:Init(eid)
  Avatar.Super.Init(self, eid)
  self.bClientEntity = true
  local content_path = UE4.UKismetSystemLibrary.GetProjectContentDirectory()
  assert(pb.loadufsfile(content_path .. "Script/NetworkEngine/Proto/pb/Attr.pb"))
  self.AttrTypes = {}
  for name, basename, type in pb.types() do
    self.AttrTypes[basename] = true
  end
end

function Avatar:OnBecomePlayer()
  Avatar.Super.OnBecomePlayer(self)
  local BP_Avatar = GWorld.GameInstance:GetAvatar()
  if BP_Avatar then
    BP_Avatar:SetClientAvatar(self)
  else
    assert(false, "\231\153\187\229\189\149\229\135\186\233\148\153\239\188\140Avatar\228\184\186\231\169\186\239\188\1408\230\136\144\228\189\160\230\152\175\231\148\168\230\137\147\229\140\133\231\142\175\229\162\131\229\142\187\232\191\144\232\161\140\229\183\165\231\168\139\228\186\134\239\188\140\229\155\158\233\128\128\228\189\160\231\154\132\228\187\147\229\186\147")
  end
  MissionIndicatorManager.TrackingSpecialSideQuestChainId = nil
  SystemGuideManager:AddListenerSystemGuide()
  self:EnterWorld()
  self:QueryHotfix()
  AudioManager(self):SetVoiceGender()
end

function Avatar:QueryHotfix()
  local index = GWorld.HotfixDataIndex or 0
  self:CallServerMethod("QueryHotfix", index)
end

function Avatar:OnQueryHotfixSuccess(HotfixScript, HotfixIndex)
  self.logger.debug("OnQueryHotfixSuccess", HotfixScript, HotfixIndex)
  local index = GWorld.HotfixDataIndex or 0
  if HotfixIndex and HotfixIndex > index then
    require("HotFix").ExecHotFix(HotfixIndex, HotfixScript)
    GWorld.HotfixDataIndex = HotfixIndex
  end
end

function Avatar:OnRefreshLogin(TimeOffset, TimeZone, IsNewAvatar)
  TimeUtils.SetTimeOffset(TimeOffset)
  TimeUtils.SetServerTimeZone(TimeZone)
  self:LoginSuccess()
  local HeroUSDKSubsystem = HeroUSDKSubsystem()
  if IsNewAvatar then
    HeroUSDKSubsystem:HeroSDKRoleCreate(HeroUSDKUtils.GenHeroHDCGameRoleInfo())
  end
end

function Avatar:OnRelayLogin(TimeOffset, TimeZone, IsNewAvatar)
  TimeUtils.SetTimeOffset(TimeOffset)
  TimeUtils.SetServerTimeZone(TimeZone)
  self:LoginSuccess()
end

function Avatar:LoginSuccess()
  self:RefreshWeapon()
  self:InitGameSetting()
  SystemGuideManager:InitCondition()
  
  local function callback()
    EventManager:FireEvent(EventID.OnLoginSuccess)
    GWorld.GameInstance:OnLoginSuccess()
  end
  
  local locaUselName = UE.UKismetSystemLibrary:GetPlatformUserName()
  self.logger.debug("LoginSuccess", GWorld.EnterMode, locaUselName)
  self:CallServer("OnLoginSuccess", callback, GWorld.EnterMode, locaUselName)
  if self.Hostnum == 399 then
    self:CallServerMethod("SetIp", UEMGameInstance.GetOuterIp())
  end
end

function Avatar:SA_LOG(log_type, event_name, infos)
  self:CallServerMethod("Client_SA_LOG", log_type, event_name, infos)
end

function Avatar:LeaveWorld()
  local BP_Avatar = GWorld.GameInstance:GetAvatar()
  if BP_Avatar then
    BP_Avatar:SetClientAvatar(nil)
  end
end

function Avatar:UseCDK(CDK, InCallback)
  local function Cb(ErrCode, Items)
    self.logger.debug("UseCDK", ErrorCode:Name(ErrCode), CommonUtils.TableToString(Items))
    
    if InCallback then
      InCallback(ErrCode, Items)
    end
  end
  
  self:CallServer("UseCDK", Cb, CDK)
end

function Avatar:RequestSetNowTime(NowTime)
  local function cb(ret, timestamp)
    if ret == ErrorCode.RET_SUCCESS then
      TimeUtils.OnRequestSetNowTime(timestamp)
    end
  end
  
  self:CallServer("RequestSetNowTime", cb, NowTime)
end

function Avatar:CheckTimeAcceleration()
  DebugPrint("CheckTimeAcceleration", TimeUtils.NowTime())
  self:CallServerMethod("CheckTimeAcceleration")
end

function Avatar:AceReceiveData(Data, Len)
  DebugPrint("AceReceiveData", Data, Len)
  local ACESubsystem = USubsystemBlueprintLibrary.GetGameInstanceSubsystem(GWorld.GameInstance, UACESubsystem)
  if not ACESubsystem then
    return
  end
  local ByteTable = MiscUtils.StringToByteTable(Data)
  ACESubsystem:ReceivePacketFromServer(ByteTable)
end

function Avatar:_OnPropChangeCurrentChar()
  self.NeedRefreshPlayer = true
end

function Avatar:OnEntityInitSuccess()
  DebugPrint("Avatar:OnEntityInitSuccess")
end

function Avatar:_OnPropChangeCurrentPet()
  self.NeedRefreshPlayer = true
  DebugPrint("Avatar:_OnPropChangeCurrentPet self.NeedRefreshPlayer:", self.NeedRefreshPlayer)
end

function Avatar:_OnPropChangePets(keys)
  self.NeedRefreshPlayer = true
  DebugPrint("Avatar:_OnPropChangePets", CommonUtils.TableToString(keys))
end

function Avatar:_OnPropChangeMeleeWeapon()
  self.NeedRefreshPlayer = true
end

function Avatar:_OnPropChangeRangedWeapon()
  self.NeedRefreshPlayer = true
end

function Avatar:_OnPropChangeLevel()
  local GameMode = UE.UGameplayStatics.GetGameMode(GWorld.GameInstance)
  if GameMode and GameMode:Cast(UE4.AEMGameMode) and GameMode:IsInRegion() then
    GameMode:UpdateRegionGameModeLevel()
  end
  for _, Info in pairs(DataMgr.PlayerLevelUp) do
    if Info.PlayerLevel <= self.Level and not self.LevelRewardsGot[Info.PlayerLevel] then
      local Node = ReddotManager.GetTreeNode("ExperienceItem")
      if not Node then
        ReddotManager.AddNode("ExperienceItem")
      end
      local CacheDetail = ReddotManager.GetLeafNodeCacheDetail("ExperienceItem")
      if not CacheDetail[Info.PlayerLevel] then
        CacheDetail[Info.PlayerLevel] = 1
        ReddotManager.IncreaseLeafNodeCount("ExperienceItem")
      end
    end
  end
  EventManager:FireEvent(EventID.OnPlayerLevelUp)
end

function Avatar:_OnPropChangeMailUniqueID()
  EventManager:FireEvent(EventID.OnChangePropMailUniqueID)
end

function Avatar:_OnPropChangeActionPoint()
  EventManager:FireEvent(EventID.OnChangeActionPoint, CommonConst.ActionPoint)
end

function Avatar:_OnPropChangeChars(keys)
  self.NeedRefreshPlayer = true
  if 1 == CommonUtils.Size(keys) then
    local char = self.Chars[keys[1]]
    if char then
      char:_Init()
    end
  end
end

function Avatar:PrintServerLog(...)
  DebugPrint("Avatar:PrintServerLog", ...)
end

function Avatar:_OnPropChangeCommonChars(keys)
  self.NeedRefreshPlayer = true
end

function Avatar:_OnPropChangeWeapons(keys)
  self.NeedRefreshPlayer = true
end

function Avatar:_OnPropChangeUWeapons(keys)
  self.NeedRefreshPlayer = true
end

function Avatar:_OnPropChangeMods(keys)
  self.NeedRefreshPlayer = true
end

function Avatar:ResetNeedRefreshPlayer()
  self.NeedRefreshPlayer = false
end

function Avatar:GetNeedRefreshPlayer()
  return self.NeedRefreshPlayer
end

function Avatar:_OnPropChangeResources(keys)
  if 1 == CommonUtils.Size(keys) then
    local ResourceId = keys[1]
    EventManager:FireEvent(EventID.OnPropSetResources, ResourceId)
  end
end

function Avatar:_OnPropChangeWheels(keys)
  EventManager:FireEvent(EventID.OnPropChangeWheels)
end

function Avatar:ResetOnReconnect()
end

function Avatar:ClientTest(...)
  self.logger.debug("ClientTest")
  local t = TimeUtils.NowTime()
  self.logger.debug(t)
  self.logger.debug(TimeUtils.TimestampToData(t))
  self.logger.debug(TimeUtils.TimeToStr(t))
  
  local function callback(result)
    PrintTable({result = result}, 3)
  end
  
  self:CallServer("ClientTest", callback)
end

function Avatar:CallbackTest()
  self.logger.debug("111111111111111111111 CallbackTest")
end

function Avatar:OnTestAutoBattle(ret, data, DSLog)
  print(_G.LogTag, "OnTestAutoBattle", ret, data, DSLog)
end

function Avatar:tt(GachaId)
  self:DrawSkinGacha(tonumber(GachaId), 10)
end

function Avatar:SetHomeBaseBGM(BGMId)
  local function cb(ret)
    print(_G.LogTag, "SetHomeBaseBGM", ret)
  end
  
  self:CallServer("SetHomeBaseBGM", cb, BGMId)
end

function Avatar:SendToFeishuForBattle(msg, msg_title)
  self:CallServerMethod("SendToFeishuForBattle", msg, msg_title)
end

function Avatar:SendToFeishuForJQ(msg, msg_title)
  self:CallServerMethod("SendToFeishuForJQ", msg, msg_title)
end

function Avatar:SendToFeiShuForMonster(msg, msg_title)
  local LocalUser = UE.UKismetSystemLibrary:GetPlatformUserName()
  local res_msg = "\232\174\190\229\164\135\229\144\141\239\188\154" .. LocalUser .. "\n" .. msg
  self:CallServerMethod("SendToFeiShuForMonster", msg, msg_title)
end

function Avatar:SendToFeiShuForRegionMgr(msg, msg_title)
  self:CallServerMethod("SendToFeiShuForRegionMgr", msg, msg_title)
end

function Avatar:SendToFeishuForRougeLike(msg, msg_title)
  self:CallServerMethod("SendToFeishuForRougeLike", msg, msg_title)
end

function Avatar:SendToFeishuForCombatMonitor(msg)
  self:CallServerMethod("SendToFeishuForCombatMonitor", msg)
end

function Avatar:SendTraceToQaWeb(trace_type, describe_info)
  self:CallServerMethod("SendTraceToQaWeb", trace_type, describe_info)
end

function Avatar:NotifyOpenCrashSight()
  print(_G.LogTag, "NotifyOpenCrashSight")
  local IsOpenCrashSight = EMCache:Get("IsOpenCrashSight")
  if not IsOpenCrashSight then
    EMCache:Set("IsOpenCrashSight", true)
    EMCache:SaveAll()
    if GWorld.GameInstance then
      GWorld.GameInstance:InitCrashSight()
    end
  end
end

function Avatar:SaveCreatePhantomInfo(RoleId, BTIndex, Info, ExtraInfo, Level)
  if not self.PhantomCreateInfo then
    self.PhantomCreateInfo = {}
  end
  if not self.PhantomCreateInfo[RoleId] then
    self.PhantomCreateInfo[RoleId] = {}
  end
  self.PhantomCreateInfo[RoleId].BTIndex = BTIndex
  self.PhantomCreateInfo[RoleId].Info = Info
  self.PhantomCreateInfo[RoleId].ExtraInfo = ExtraInfo
  self.PhantomCreateInfo[RoleId].Level = Level
end

function Avatar:ClearCreatePhantomInfo(PhantomRoleId)
  if not self.PhantomCreateInfo then
    return
  end
  if not self.PhantomCreateInfo[PhantomRoleId] then
    return
  end
  self.PhantomCreateInfo[PhantomRoleId] = nil
end

Assemble.AssembleComponents(Avatar)
Assemble.FormatProperties(Avatar)
return Avatar
