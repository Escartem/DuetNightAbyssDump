local EMCache = require("EMCache.EMCache")
local RewardBox = require("BluePrints.Client.CustomTypes.SimpleRewardBox")
local TimeUtils = require("Utils.TimeUtils")
local MiscUtils = require("Utils.MiscUtils")
local M = Class("BluePrints.UI.BP_UIState_C")
M._components = {
  "BluePrints.UI.Settlement.DungeonSettlementComponent"
}

function M:InitUIInfo(Name, IsInUIMode, EventList, ...)
  self.Super.InitUIInfo(self, Name, IsInUIMode, EventList, ...)
  self:AddDispatcher(EventID.OnChangeActionPoint, self, self.InitActionPointInfo)
  self:AddDispatcher(EventID.TeamMatchTimingStart, self, self.OnTeamMatchTimingStart)
  self:AddDispatcher(EventID.TeamMatchTimingEnd, self, self.OnTeamMatchTimingEnd)
  local UIBattleMain = UIManager(self):GetUI("BattleMain")
  UIBattleMain:HidePlayerDeadUI()
  local LogicServerInfo, _DungeonId, _CombatData = ...
  self.IsWin, self.BattleInfo, self.Rewards, self.SpRewards, self.PlayerTime, self.GameTime = table.unpack(LogicServerInfo, 1, LogicServerInfo.n)
  self.DungeonId = _DungeonId
  self.CombatData = _CombatData
  self.IsWeeklyDungeon = self.DungeonId and DataMgr.Dungeon[self.DungeonId] and DataMgr.Dungeon[self.DungeonId].IsWeeklyDungeon
  self.IntervalTime = 0.06666666666666667
  self.FirstDelayTime = 0.3333333333333333 - self.IntervalTime
  self:CheckIsTempleMode()
  self:CheckIsPartyMode()
  self:CheckIsWalnutMode()
  self:CheckIsNoExpMode()
  self.HideUITag = "DungeonSettlement"
  self.IsAllowPropInAnimation = true
  DebugPrint("DungeonSettlement: OnLoaded, IsWin", self.IsWin, "PlayerTime", self.PlayerTime, "GameTime", self.GameTime, "DungeonId", self.DungeonId)
  self.RoleItemInfos = {
    Char = {
      Widget = self.Settlement_Role
    },
    MeleeWeapon = {
      Widget = self.Settlement_Role_1
    },
    RangedWeapon = {
      Widget = self.Settlement_Role_2
    },
    Player = {
      Widget = self.Settlement_Account
    }
  }
  self.PlayerCharacter = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  self.PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  self.PlayerState = self.PlayerController.PlayerState
  self.IsFirstFocus = true
  self:BlockAllUIInput(false)
  self:InitContent()
  self:SetAllUIVisibility(true)
  if self.IsTemple then
    self:CalcTempleInfo()
  elseif self.IsParty then
    self:CalcPartyInfo()
  else
    self:CalcRoleAndRewardsInfo()
  end
  self:ShowSettlementInfo()
  AudioManager(self):PauseAllBGM()
  self:SetCharDirLight(true)
  if self.WBP_Chat_CommonEnter then
    self.WBP_Chat_CommonEnter.bInDungeonSettlement = GWorld:GetAvatar().SettlementUidArray
  end
end

function M:OnLoaded(...)
  M.Super.OnLoaded(self, ...)
  self:InitDeviceInfo()
  self:InitListenEvent()
end

function M:Destruct()
  AudioManager(self):ResumeAllBGM()
  M.Super.Destruct(self)
end

function M:InitContent()
  self:InitHeadline()
  self:InitStageInfo()
  self:InitMainButtons()
  self:InitActionPointInfo()
  self:InitHardBossOrWeekyDungeonInfo()
  self:InitSwitchPanelContent()
  self:InitRewardPanel()
  self:InitPlayersHighLightData()
  self:InitDoubleModInfo()
end

function M:InitRewardPanel()
  if self.IsTemple then
    return
  end
  DebugPrint("DungeonSettlement: Reward\229\136\151\232\161\168\229\133\165\229\156\186")
  PrintTable(self.SpRewards, 3)
  PrintTable(self.Rewards, 3)
  self.SpRewardsArray = {}
  self.RewardsArray = {}
  self:RewardsAddToArray(self.SpRewardsArray, self.SpRewards, true)
  self:RewardsAddToArray(self.RewardsArray, self.Rewards, false)
  self:SortRewardsArray(self.SpRewardsArray)
  self:SortRewardsArray(self.RewardsArray)
  local Avatar = GWorld:GetAvatar()
  if Avatar and Avatar:IsInHardBoss() then
    if #self.RewardsArray > 0 then
      self.Panel_Reward:SetVisibility(ESlateVisibility.Collapsed)
      self.Text_PropTitle:SetVisibility(ESlateVisibility.Collapsed)
    else
      self.Switcher:SetActiveWidgetIndex(1)
    end
  elseif #self.SpRewardsArray > 0 or #self.RewardsArray > 0 then
    self.Panel_Reward:SetVisibility(ESlateVisibility.Visible)
    self.Text_RewardTitle:SetText(GText("UI_DUNGEON_ObtainType"))
    self.Panel_PropTitle:SetVisibility(ESlateVisibility.Visible)
    self.Text_PropTitle:SetText(GText("UI_DUNGEON_Drops"))
  else
    self.Switcher:SetActiveWidgetIndex(1)
  end
end

function M:InitPlayersHighLightData()
  if self.IsParty then
    for i = 1, 4 do
      self["Data0" .. i]:SetVisibility(ESlateVisibility.Collapsed)
    end
    local ScenePlayers = GWorld.GameInstance.ScenePlayers
    if ScenePlayers and #ScenePlayers <= 1 then
      return
    end
    for CurPlayerIndex, Player in ipairs(ScenePlayers) do
      if self["TempleData0" .. CurPlayerIndex] then
        self["TempleData0" .. CurPlayerIndex]:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
        self["TempleData0" .. CurPlayerIndex].Text_Index:SetText(CurPlayerIndex)
        if Player.IsMainPlayer then
          self["TempleData0" .. CurPlayerIndex]:PlayAnimation(self["TempleData0" .. CurPlayerIndex].Player)
        else
          self["TempleData0" .. CurPlayerIndex]:PlayAnimation(self["TempleData0" .. CurPlayerIndex].Other)
        end
        if self.CombatData.PartyPlayerCompleteTime[CurPlayerIndex] then
          self["TempleData0" .. CurPlayerIndex]:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
          self["TempleData0" .. CurPlayerIndex].Text_Time:SetText(self:GetTimeStr(self.CombatData.PartyPlayerCompleteTime[CurPlayerIndex]))
        else
          self["TempleData0" .. CurPlayerIndex].SizeBox_77:SetVisibility(ESlateVisibility.Collapsed)
          self["TempleData0" .. CurPlayerIndex].Text_Time:SetText(GText("UI_PARTY_PARKOUR_UNFINISH"))
        end
        if 1 == CurPlayerIndex then
          local Slot = UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(self["TempleData0" .. CurPlayerIndex].Text_Index)
          local Pos = Slot:GetPosition()
          Slot:SetPosition(FVector2D(Pos.X, self["TempleData0" .. CurPlayerIndex].TextPosY_No1))
          local Font = self["TempleData0" .. CurPlayerIndex].Text_Index.Font
          Font.Size = self["TempleData0" .. CurPlayerIndex].TextSize_No1
          self["TempleData0" .. CurPlayerIndex].Text_Index:SetFont(Font)
        else
          local Slot = UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(self["TempleData0" .. CurPlayerIndex].Text_Index)
          local Pos = Slot:GetPosition()
          Slot:SetPosition(FVector2D(Pos.X, self["TempleData0" .. CurPlayerIndex].TextPosY_Other))
          local Font = self["TempleData0" .. CurPlayerIndex].Text_Index.Font
          Font.Size = self["TempleData0" .. CurPlayerIndex].TextSize_Other
          self["TempleData0" .. CurPlayerIndex].Text_Index:SetFont(Font)
        end
      end
    end
    return
  end
  if not self.IsWin or self.IsTemple then
    for i = 1, 4 do
      self["Data0" .. i]:SetVisibility(ESlateVisibility.Collapsed)
    end
    return
  end
  for i = 1, 4 do
    self["Data0" .. i]:SetRenderOpacity(0)
  end
  if not self.LevelDataPriority then
    local LevelEnterData = DataMgr.LevelEnterData
    self.LevelDataPriority = {}
    for key, value in pairs(LevelEnterData) do
      local LevelData = {}
      LevelData.Name = key
      LevelData.Priority = value.Priority
      table.insert(self.LevelDataPriority, LevelData)
    end
  end
  table.sort(self.LevelDataPriority, function(a, b)
    return a.Priority < b.Priority
  end)
  local Players = {
    [1] = {},
    [2] = {},
    [3] = {},
    [4] = {}
  }
  local AllPlayerBattleData = {}
  for index, value in ipairs(self.LevelDataPriority) do
    table.insert(AllPlayerBattleData, {
      [value.Name] = {}
    })
  end
  local BattleNameByIndex = {}
  for index, value in ipairs(self.LevelDataPriority) do
    BattleNameByIndex[index] = value.Name
  end
  local TeamTotalDamage = 0
  local TeamTotalTakedDamage = 0
  local PlayerOrder = {
    1,
    2,
    3,
    4
  }
  local ScenePlayers = GWorld.GameInstance.ScenePlayers
  local PhantomsData = self:FilterNpcInPhantoms(self.CombatData.PhantomAttrInfos)
  local TeammateData = self.CombatData.TeammateDamageInfos or {}
  local TeammateNum = self.CombatData.TeammateNum or 0
  DebugPrint("thy   ScenePlayers")
  PrintTable(ScenePlayers, 3)
  DebugPrint("thy   PhantomsData")
  PrintTable(PhantomsData, 5)
  DebugPrint("thy   TeammateData")
  PrintTable(TeammateData, 5)
  local CurTeammateNum = 0
  local DamageOffset = 0
  TeamTotalDamage = self.CombatData.TotalDamage
  TeamTotalTakedDamage = self.CombatData.TakedDamage
  if PhantomsData then
    for _, PhantomData in pairs(PhantomsData) do
      if PhantomData then
        TeamTotalDamage = TeamTotalDamage + PhantomData.FinalDamage
        TeamTotalTakedDamage = TeamTotalTakedDamage + PhantomData.TakedDamage
      end
    end
  end
  if TeammateData then
    for _, Teammate in pairs(TeammateData) do
      if Teammate then
        TeamTotalDamage = TeamTotalDamage + Teammate.FinalDamage
        TeamTotalTakedDamage = TeamTotalTakedDamage + Teammate.TakedDamage
        if Teammate.PhantomAttrInfo then
          if Teammate.PhantomAttrInfo.FinalDamage > 0 then
            TeamTotalDamage = TeamTotalDamage + Teammate.PhantomAttrInfo.FinalDamage
          end
          if Teammate.PhantomAttrInfo.TakedDamage > 0 then
            TeamTotalTakedDamage = TeamTotalTakedDamage + Teammate.PhantomAttrInfo.TakedDamage
          end
        end
      end
    end
  end
  local RealPlayerNun = 0
  for CurPlayerIndex, Player in ipairs(ScenePlayers) do
    if Player.IsMainPlayer or not Player.IsPhantom then
      RealPlayerNun = RealPlayerNun + 1
    end
  end
  if RealPlayerNun > 1 then
    self.CombatData.IsInOnlineDungeon = true
  else
    self.CombatData.IsInOnlineDungeon = false
  end
  if not self.CombatData.IsInOnlineDungeon then
    for CurPlayerIndex, Player in ipairs(ScenePlayers) do
      local PlayerIndex = PlayerOrder[CurPlayerIndex]
      if Player.IsMainPlayer then
        AllPlayerBattleData[1].Damage[CurPlayerIndex] = {
          PlayerIndex = PlayerIndex,
          Value = 0 ~= TeamTotalDamage and math.floor(self.CombatData.TotalDamage / TeamTotalDamage * 100 + 0.5) or 0
        }
        AllPlayerBattleData[2].Kill[CurPlayerIndex] = {
          PlayerIndex = PlayerIndex,
          Value = self.CombatData.TotalKill
        }
        AllPlayerBattleData[3].Damaged[CurPlayerIndex] = {
          PlayerIndex = PlayerIndex,
          Value = 0 ~= TeamTotalTakedDamage and math.floor(self.CombatData.TakedDamage / TeamTotalTakedDamage * 100 + 0.5) or 0
        }
        AllPlayerBattleData[4].Heal[CurPlayerIndex] = {
          PlayerIndex = PlayerIndex,
          Value = self.CombatData.GiveHealing
        }
        AllPlayerBattleData[5].DamageSingle[CurPlayerIndex] = {
          PlayerIndex = PlayerIndex,
          Value = self.CombatData.MaxDamage
        }
        AllPlayerBattleData[6].Destroy[CurPlayerIndex] = {
          PlayerIndex = PlayerIndex,
          Value = self.CombatData.BreakableItemCount
        }
        AllPlayerBattleData[7].HitCount[CurPlayerIndex] = {
          PlayerIndex = PlayerIndex,
          Value = self.CombatData.MaxComboCount
        }
      elseif PhantomsData and #PhantomsData > 0 then
        local PhantomData = self:GetPhantomInfo(Player.RoleId, PhantomsData)
        if PhantomData then
          AllPlayerBattleData[1].Damage[CurPlayerIndex] = {
            PlayerIndex = PlayerIndex,
            Value = 0 ~= TeamTotalDamage and math.floor(PhantomData.FinalDamage / TeamTotalDamage * 100 + 0.5) or 0
          }
          AllPlayerBattleData[2].Kill[CurPlayerIndex] = {
            PlayerIndex = PlayerIndex,
            Value = PhantomData.TotalKillCount
          }
          AllPlayerBattleData[3].Damaged[CurPlayerIndex] = {
            PlayerIndex = PlayerIndex,
            Value = 0 ~= TeamTotalTakedDamage and math.floor(PhantomData.TakedDamage / TeamTotalTakedDamage * 100 + 0.5) or 0
          }
          AllPlayerBattleData[4].Heal[CurPlayerIndex] = {
            PlayerIndex = PlayerIndex,
            Value = PhantomData.GiveHealing
          }
          AllPlayerBattleData[5].DamageSingle[CurPlayerIndex] = {
            PlayerIndex = PlayerIndex,
            Value = PhantomData.MaxDamage
          }
        else
          DebugPrint("thy   PhantomData is nil", Player.RoleId)
          self:CloseHighLightDataShow()
          return
        end
      end
    end
  else
    for CurPlayerIndex, Player in ipairs(ScenePlayers) do
      local PlayerIndex = PlayerOrder[CurPlayerIndex]
      if Player.IsMainPlayer then
        AllPlayerBattleData[1].Damage[CurPlayerIndex] = {
          PlayerIndex = PlayerIndex,
          Value = 0 ~= TeamTotalDamage and math.floor(self.CombatData.TotalDamage / TeamTotalDamage * 100 + 0.5) or 0
        }
        AllPlayerBattleData[2].Kill[CurPlayerIndex] = {
          PlayerIndex = PlayerIndex,
          Value = self.CombatData.TotalKill
        }
        AllPlayerBattleData[3].Damaged[CurPlayerIndex] = {
          PlayerIndex = PlayerIndex,
          Value = 0 ~= TeamTotalTakedDamage and math.floor(self.CombatData.TakedDamage / TeamTotalTakedDamage * 100 + 0.5) or 0
        }
        AllPlayerBattleData[4].Heal[CurPlayerIndex] = {
          PlayerIndex = PlayerIndex,
          Value = self.CombatData.GiveHealing
        }
        AllPlayerBattleData[5].DamageSingle[CurPlayerIndex] = {
          PlayerIndex = PlayerIndex,
          Value = self.CombatData.MaxDamage
        }
        AllPlayerBattleData[6].Destroy[CurPlayerIndex] = {
          PlayerIndex = PlayerIndex,
          Value = self.CombatData.BreakableItemCount
        }
        AllPlayerBattleData[7].HitCount[CurPlayerIndex] = {
          PlayerIndex = PlayerIndex,
          Value = self.CombatData.MaxComboCount
        }
      elseif not Player.IsPhantom then
        CurTeammateNum = CurTeammateNum + 1
        local Teammate = TeammateData[CurTeammateNum]
        if Teammate then
          AllPlayerBattleData[1].Damage[CurPlayerIndex] = {
            PlayerIndex = PlayerIndex,
            Value = 0 ~= TeamTotalDamage and math.floor(Teammate.FinalDamage / TeamTotalDamage * 100 + 0.5) or 0
          }
          AllPlayerBattleData[2].Kill[CurPlayerIndex] = {
            PlayerIndex = PlayerIndex,
            Value = Teammate.TotalKillCount
          }
          AllPlayerBattleData[3].Damaged[CurPlayerIndex] = {
            PlayerIndex = PlayerIndex,
            Value = 0 ~= TeamTotalTakedDamage and math.floor(Teammate.TakedDamage / TeamTotalTakedDamage * 100 + 0.5) or 0
          }
          AllPlayerBattleData[4].Heal[CurPlayerIndex] = {
            PlayerIndex = PlayerIndex,
            Value = Teammate.GiveHealing
          }
          AllPlayerBattleData[5].DamageSingle[CurPlayerIndex] = {
            PlayerIndex = PlayerIndex,
            Value = Teammate.MaxDamage
          }
          AllPlayerBattleData[6].Destroy[CurPlayerIndex] = {
            PlayerIndex = PlayerIndex,
            Value = Teammate.BreakableItemCount
          }
          AllPlayerBattleData[7].HitCount[CurPlayerIndex] = {
            PlayerIndex = PlayerIndex,
            Value = Teammate.MaxComboCount
          }
        end
      else
        local Phantom = self:GetPhantomInfo(Player.RoleId, PhantomsData)
        if Phantom then
          AllPlayerBattleData[1].Damage[CurPlayerIndex] = {
            PlayerIndex = PlayerIndex,
            Value = 0 ~= TeamTotalDamage and math.floor(Phantom.FinalDamage / TeamTotalDamage * 100 + 0.5) or 0
          }
          AllPlayerBattleData[2].Kill[CurPlayerIndex] = {
            PlayerIndex = PlayerIndex,
            Value = Phantom.TotalKillCount
          }
          AllPlayerBattleData[3].Damaged[CurPlayerIndex] = {
            PlayerIndex = PlayerIndex,
            Value = 0 ~= TeamTotalTakedDamage and math.floor(Phantom.TakedDamage / TeamTotalTakedDamage * 100 + 0.5) or 0
          }
          AllPlayerBattleData[4].Heal[CurPlayerIndex] = {
            PlayerIndex = PlayerIndex,
            Value = Phantom.GiveHealing
          }
          AllPlayerBattleData[5].DamageSingle[CurPlayerIndex] = {
            PlayerIndex = PlayerIndex,
            Value = Phantom.MaxDamage
          }
        else
          local TeammatePhantomData = TeammateData[1] and TeammateData[1].PhantomAttrInfo
          if TeammatePhantomData then
            AllPlayerBattleData[1].Damage[CurPlayerIndex] = {
              PlayerIndex = PlayerIndex,
              Value = 0 ~= TeamTotalDamage and math.floor(TeammatePhantomData.FinalDamage / TeamTotalDamage * 100 + 0.5) or 0
            }
            AllPlayerBattleData[2].Kill[CurPlayerIndex] = {
              PlayerIndex = PlayerIndex,
              Value = TeammatePhantomData.TotalKillCount
            }
            AllPlayerBattleData[3].Damaged[CurPlayerIndex] = {
              PlayerIndex = PlayerIndex,
              Value = 0 ~= TeamTotalTakedDamage and math.floor(TeammatePhantomData.TakedDamage / TeamTotalTakedDamage * 100 + 0.5) or 0
            }
            AllPlayerBattleData[4].Heal[CurPlayerIndex] = {
              PlayerIndex = PlayerIndex,
              Value = TeammatePhantomData.GiveHealing
            }
            AllPlayerBattleData[5].DamageSingle[CurPlayerIndex] = {
              PlayerIndex = PlayerIndex,
              Value = TeammatePhantomData.MaxDamage
            }
          else
            DebugPrint("thy   TeammatePhantomData is nil", Player.RoleId)
            self:CloseHighLightDataShow()
            return
          end
        end
      end
    end
  end
  for Index, Data in ipairs(AllPlayerBattleData) do
    local key = BattleNameByIndex[Index]
    local targetArray = Data[key]
    if targetArray and #targetArray > 1 then
      table.sort(targetArray, function(a, b)
        if not a then
          return false
        end
        if not b then
          return true
        end
        return a.Value > b.Value
      end)
    end
  end
  for index, value in ipairs(AllPlayerBattleData[1].Damage) do
    DamageOffset = DamageOffset + value.Value
  end
  if DamageOffset > 0 then
    DamageOffset = 100 - DamageOffset
    AllPlayerBattleData[1].Damage[1].Value = AllPlayerBattleData[1].Damage[1].Value + DamageOffset
  end
  local AlreadyRankedType = {
    Damage = false,
    Kill = false,
    Damaged = false,
    Heal = false,
    DamageSingle = false,
    Destroy = false,
    HitCount = false
  }
  for i = 1, #ScenePlayers do
    for Index, BattleData in ipairs(AllPlayerBattleData) do
      local DataType = BattleNameByIndex[Index]
      local PlayerData = BattleData[DataType][i]
      if not AlreadyRankedType[DataType] and PlayerData and 0 ~= PlayerData.Value then
        Players[PlayerData.PlayerIndex][#Players[PlayerData.PlayerIndex] + 1] = {
          DataName = BattleNameByIndex[Index],
          Value = PlayerData.Value
        }
        AlreadyRankedType[DataType] = true
        DebugPrint("thy   PlayersCompensateTip", PlayerData.PlayerIndex, BattleNameByIndex[Index], PlayerData.Value)
      end
    end
  end
  for i = 1, #ScenePlayers do
    if Players[PlayerOrder[i]] and 0 == #Players[PlayerOrder[i]] then
      table.insert(Players[PlayerOrder[i]], {
        DataName = "Damage",
        Value = self:GetDamageData(PlayerOrder[i], AllPlayerBattleData[1].Damage)
      })
    end
  end
  for Index, value in pairs(Players) do
    if 0 ~= CommonUtils.Size(value) then
      self["Data0" .. Index]:Init(value[1])
    else
      self["Data0" .. Index]:SetVisibility(ESlateVisibility.Collapsed)
    end
  end
  for key, value in ipairs(ScenePlayers) do
    DebugPrint("thy   ScenePlayers", key, value.RoleId)
  end
  for key, value in ipairs(Players) do
    if 0 ~= CommonUtils.Size(value) then
      DebugPrint("thy PlayersShowTip", key, value[1].DataName, value[1].Value)
    end
  end
end

function M:CloseHighLightDataShow()
  for i = 1, 4 do
    self["Data0" .. i]:SetVisibility(ESlateVisibility.Collapsed)
  end
end

function M:FilterNpcInPhantoms(PhantomsDataTable)
  local Phantoms = {}
  for _, PhantomData in pairs(PhantomsDataTable) do
    if PhantomData and PhantomData.PhantomRoleId > 999 then
      table.insert(Phantoms, PhantomData)
    end
  end
  return Phantoms
end

function M:GetPhantomInfo(PlayerRoleId, PhantomsData)
  for _, value in pairs(PhantomsData) do
    if PlayerRoleId == value.PhantomRoleId then
      return value
    end
  end
  return nil
end

function M:GetDamageData(PlayerIndex, PlayerDamageData)
  for Index, value in ipairs(PlayerDamageData) do
    if PlayerIndex == value.PlayerIndex then
      return value.Value
    end
  end
  return 0
end

function M:InitHeadline()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    error("Avatar is nil")
  end
  if self.IsWin then
    local HeadLineText_Win = GText("UI_MISSION_COMPLETE")
    if self.IsTemple or self.IsParty then
      HeadLineText_Win = GText("UI_TEMPLE_COMPLETE")
    end
    if Avatar:IsInHardBoss() then
      HeadLineText_Win = GText("UI_HARDBOSS_COMPLETE")
    end
    self.Text_HeadLine_Victory:SetText(HeadLineText_Win)
    self.VX_Text_HeadLine:SetText(HeadLineText_Win)
  else
    local HeadLineText_Fail = GText("UI_MISSION_FAIL")
    self.Text_HeadLine_Defeat:SetText(HeadLineText_Fail)
  end
end

function M:InitDungeonClearanceTime()
  local Minute = math.floor(self.PlayerTime / 60)
  local Second = math.floor(self.PlayerTime % 60)
  self.TimeDict = {}
  table.insert(self.TimeDict, 1, {TimeType = "Min", TimeValue = Minute})
  table.insert(self.TimeDict, 2, {TimeType = "Sec", TimeValue = Second})
end

function M:InitDungeonLevelIndex()
  local DungeonInfo = self:GetDungeonInfo(self.BattleInfo)
  if DungeonInfo.DungeonType and DungeonInfo.DungeonType == "Temple" then
    return
  end
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  if not GameState then
    return
  end
  local ChapterId
  if self.IsWeeklyDungeon then
    ChapterId = DataMgr.WeeklyDungeonId2ChapterId[GameState.DungeonId]
  else
    ChapterId = DataMgr.Dungeon2Select[GameState.DungeonId]
  end
  if not ChapterId then
    return
  end
  local DungeonList
  if self.IsWeeklyDungeon then
    DungeonList = DataMgr.WeeklySelectDungeon[ChapterId].DungeonList
  else
    DungeonList = DataMgr.SelectDungeon[ChapterId].DungeonList
  end
  if not DungeonList then
    return
  end
  local Index = 1
  for key, value in pairs(DungeonList) do
    if value == GameState.DungeonId then
      Index = key
      goto lbl_64
    end
  end
  ::lbl_64::
  local RomanNum = Const.RomanNum
  self.DungeonLevelIndex = GText(RomanNum[Index])
end

function M:InitDungeonName()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    error("Avatar is nil")
  end
  self.Describe = ""
  if Avatar:IsInDungeon() then
    self.DungeonInfo = self:GetDungeonInfo(self.BattleInfo)
    self.Describe = self:GetDungeonName(self.DungeonInfo)
    self:InitDungeonLevelIndex()
  elseif Avatar:IsInHardBoss() then
    self.Describe = GText(DataMgr.HardBossMain[self.BattleInfo.HardBossId].HardBossName)
    self.Describe = self.Describe .. " " .. GText("UI_LEVEL_NAME")
    local DifficultyId = Avatar.HardBossInfo.DifficultyId
    local DifficultyLevel = ""
    if DifficultyId and DataMgr.HardBossDifficulty[DifficultyId] then
      DifficultyLevel = DataMgr.HardBossDifficulty[DifficultyId].DifficultyLevel
    end
    self.Describe = self.Describe .. DifficultyLevel
  end
  if self.DungeonLevelIndex then
    self.Describe = self.Describe .. self.DungeonLevelIndex
    self.DungeonLevelIndex = nil
  end
end

function M:InitStageWidgets()
  self.Time:SetVisibility(ESlateVisibility.Visible)
end

function M:CheckTimesRemain()
  if Avatar:IsInHardBoss() then
  end
end

function M:InitStageInfo()
  self:InitStageWidgets()
  self:InitDungeonClearanceTime()
  self:InitDungeonName()
  self.Time:SetTimeText(self.Describe, self.TimeDict)
  if self.IsTemple or self.IsParty then
    self.Time.Image_ClockIcon:SetVisibility(ESlateVisibility.Collapsed)
    self.Time.Text_TimeDesc:SetVisibility(ESlateVisibility.Collapsed)
  end
end

function M:InitMainButtons()
  self.Btn_Continue:SetText(GText("UI_MISSION_AGAIN"))
  self.Btn_Continue:BindEventOnClicked(self, self.Continue)
  self.Btn_Continue:BindForbidStateExecuteEvent(self, self.ForbidContinue)
  self.Btn_Continue:SetDefaultGamePadImg("Y")
  if not self:CheckAgainAvailable() then
    self.Btn_Continue:ForbidBtn(true)
  end
  self.Btn_Close:SetVisibility(ESlateVisibility.Visible)
  self.Btn_Close:ForbidBtn(false)
  if not self.IsTemple then
    self.Btn_Close:SetText(GText("UI_Esc_ExitDungeon"))
  else
    self.Btn_Close:SetText(GText("UI_Esc_ExitTemple"))
  end
  self.Btn_Close:BindEventOnClicked(self, self.Exit)
  self.Btn_Close:SetDefaultGamePadImg("B")
  if self.IsWin then
    self:BindToAnimationFinished(self.Victory_In, {
      self,
      self.OnInAnimationFinished
    })
  else
    self:BindToAnimationFinished(self.Defeat_In, {
      self,
      self.OnInAnimationFinished
    })
  end
  if self.Bar_Click then
    self.Bar_Click:SetVisibility(ESlateVisibility.Collapsed)
  end
end

function M:InitActionPointInfo()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    error("Avatar is nil")
  end
  if self.IsTemple then
    return
  end
  self.CurActionPoint = Avatar.ActionPoint
  local DungeonData = DataMgr.Dungeon[self.DungeonId]
  local RawDungeonCost = 0
  self.DungeonCost = 0
  if DungeonData and DungeonData.DungeonCost then
    RawDungeonCost = DungeonData.DungeonCost[1] or 0
  end
  if Avatar.bDungeonDoubleCost then
    self.DungeonCost = RawDungeonCost * 2
  else
    self.DungeonCost = RawDungeonCost
  end
  if Avatar:IsInHardBoss() or self.IsWeeklyDungeon then
    self.Cost:SetVisibility(ESlateVisibility.Collapsed)
    return
  end
  local Params = {
    ResourceId = 103,
    bShowDenominator = true,
    CostText = nil,
    Denominator = self.DungeonCost,
    Numerator = self.CurActionPoint,
    KeyIconName = nil,
    Owner = self
  }
  self.Cost:InitContent(Params)
  self.Cost.Common_Item_Icon.ItemDetails_MenuAnchor.ItemDetailsMenuAnchor.OnMenuOpenChanged:Remove(self, self.ItemMenuAnchorChanged)
  self.Cost.Common_Item_Icon.ItemDetails_MenuAnchor.ItemDetailsMenuAnchor.OnMenuOpenChanged:Add(self, self.ItemMenuAnchorChanged)
  self.Cost:SetVisibility(ESlateVisibility.Visible)
end

function M:InitHardBossOrWeekyDungeonInfo()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    error("Avatar is nil")
    return
  end
  local RemainTimes, TotalTimes
  if Avatar:IsInHardBoss() then
    RemainTimes = Avatar.HardBoss.HardBossRewardTimesLeft
    TotalTimes = DataMgr.GlobalConstant.BossRewardRefresh.ConstantValue
    self.Text_Times01:SetText(GText("UI_HardBoss_ChancesRemain"))
  elseif self.IsWeeklyDungeon then
    RemainTimes = Avatar.WeeklyDungeonRewardLeft
    TotalTimes = DataMgr.GlobalConstant.DungeonRewardRefresh.ConstantValue
    self.Text_Times01:SetText(GText("UI_WeeklyDungeon_ChancesRemain"))
  end
  if RemainTimes and TotalTimes then
    self.Text_Times02:SetText(RemainTimes)
    self.Text_Times04:SetText(math.floor(TotalTimes))
    if RemainTimes <= 0 then
      self.Text_Times02:SetColorAndOpacity(UE4.UUIFunctionLibrary.StringToSlateColor("DD1C45"))
    end
    self:ShowHardBossTimes(true)
    return
  end
  self:ShowHardBossTimes(false)
end

function M:ShowHardBossTimes(bIsShow)
  local NewVisibility = ESlateVisibility.Collapsed
  if bIsShow then
    NewVisibility = ESlateVisibility.Visible
  end
  self.TimesRemain:SetVisibility(NewVisibility)
end

function M:InitDoubleModInfo()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return false
  end
  if Avatar.ActivityTimeOpen and Avatar.ActivityTimeOpen[CommonConst.DoubleModDropEventID] and Avatar.DoubleModDrop[CommonConst.DoubleModDropEventID] then
    local TotalTimes, RemainTimes
    local IsDoubleMod, IsEliteRush = self:IsDoubleModDungeon(CommonConst.DoubleModDropEventID)
    if not IsDoubleMod and not IsEliteRush then
      return false
    end
    if IsDoubleMod then
      TotalTimes = DataMgr.ModDropConstant.DailyModDungeonAmount.ConstantValue
      RemainTimes = TotalTimes - Avatar.DoubleModDrop[CommonConst.DoubleModDropEventID].DropTimes
      self.Text_Times01:SetText(GText("UI_Event_ModDrop_DropRemain"))
    elseif IsEliteRush then
      TotalTimes = DataMgr.ModDropConstant.DailyFreeTicketAmount.ConstantValue
      RemainTimes = TotalTimes - Avatar.DoubleModDrop[CommonConst.DoubleModDropEventID].EliteRushTimes
      self.Text_Times01:SetText(GText("UI_Event_ModDrop_ChallengeRemain"))
    end
    self.TimesRemain:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    if 0 == RemainTimes then
      self.Text_Times02:SetColorAndOpacity(UE4.UUIFunctionLibrary.StringToSlateColor("DD1C45"))
      self.Btn_Continue:ForbidBtn(true)
      self.Btn_Continue:BindForbidStateExecuteEvent(self, function()
        UIManager(self):ShowUITip("CommonToastMain", GText("UI_Event_ModDrop_Exhausted"))
      end)
    end
    self.Text_Times02:SetText(RemainTimes)
    self.Text_Times04:SetText(TotalTimes)
  end
end

function M:IsDoubleModDungeon(EventId)
  local DoubleMod, EliteRush = false, false
  if not DataMgr.DoubleModDrop[EventId] then
    return DoubleMod, EliteRush
  end
  for key, value in pairs(DataMgr.DoubleModDrop[EventId].ModDungeonId) do
    if value == self.DungeonId then
      DoubleMod = true
      return DoubleMod, EliteRush
    end
  end
  for key, value in pairs(DataMgr.DoubleModDrop[EventId].EliteRushDungeonId) do
    if value == self.DungeonId then
      EliteRush = true
      return DoubleMod, EliteRush
    end
  end
  return DoubleMod, EliteRush
end

function M:InitSwitchPanelContent()
  if not self.IsTemple then
    self.Btn_Data:SetVisibility(ESlateVisibility.Visible)
    self.Btn_Data:BindEventOnClicked(self, self.OnBtnChangePanelClicked)
    self.Btn_Data:SetCurrentTextBlock("UI_BATTLE_DATA")
    self.Text_None:SetText(GText("UI_NONE"))
    self:ActivateDropPanelScrolling(false, self.TileView_Reward)
    self:ActivateDropPanelScrolling(false, self.TileView_Prop)
    self.EMScrollBox_255:SetScrollBarVisibility(ESlateVisibility.Collapsed)
    self.EMScrollBox_255:SetControlScrollbarInside(true)
  end
end

function M:OnBtnChangePanelClicked()
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  local UIManger = GameInstance:GetGameUIManager()
  if UIManger then
    local Params = {
      OnCloseCallbackObj = self,
      OnCloseCallbackFunction = self.OnCombatDataClosed
    }
    self.Popup_CombatData = UIManger:ShowCommonPopupUI(Const.Popup_CombatData, Params, self)
    self.Popup_CombatData:SetVisibility(ESlateVisibility.Collapsed)
    self.Popup_CombatData:ShowGamepadScrollBtn(true)
    self:CreateCombatData()
  end
end

function M:OnCombatDataClosed()
end

function M:CreateCombatData()
  for i = 0, self.Popup_CombatData.VB_Node:GetChildrenCount() - 1 do
    local Child = self.Popup_CombatData.VB_Node:GetChildAt(i)
    if Child.EMScrollBox_31 ~= nil then
      self.Panel_CombatData = Child
      break
    end
  end
  self:SetDetailsContent()
  self.Popup_CombatData:SetVisibility(ESlateVisibility.Visible)
  self.Panel_CombatData.EMScrollBox_31:SetScrollBarVisibility(ESlateVisibility.Collapsed)
  self.Panel_CombatData.EMScrollBox_31:SetControlScrollbarInside(true)
  self.Panel_CombatData:SetFocus()
end

function M:SetAllUIVisibility(IsHide)
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  local UIManger = GameInstance:GetGameUIManager()
  if UIManger then
    UIManger:HideAllUI_EX({
      self:GetName()
    }, IsHide, self.HideUITag, true)
  end
  local BattleWarningUI = UIManger:GetUIObj(UIConst.DestroyAlarmName)
  if BattleWarningUI then
    AudioManager(self):StopSound(BattleWarningUI, "BattleWarning")
  end
end

function M:OnProgressBarAnimFinished()
  self.Btn_Continue:SetVisibility(ESlateVisibility.Visible)
  self.Btn_Close:SetVisibility(ESlateVisibility.Visible)
end

function M:OnInAnimationFinished()
  if self.IsTemple or self.IsParty then
    self.IsFirstFocus = false
    return
  else
    for _, Widget in pairs(self.RoleItemInfos) do
      Widget.Widget:PlayExpAnim()
    end
    if self.CurInputDeviceType == ECommonInputType.Gamepad then
      self:SetFocusInGamePad()
    end
    self.IsFirstFocus = false
  end
end

function M:OnProgressBarAnimationFinished()
  self.Btn_Close:SetVisibility(ESlateVisibility.Visible)
  self.Btn_Close:ForbidBtn(false)
end

function M:ForbidContinue()
  DebugPrint("DungeonSettlement: ClickContinueButton Forbid")
  if not self.IsWalnut then
    return
  end
  GameState(self):ShowDungeonToast_Lua("UI_WALNUTDUNGEON_REFRESH_TOAST", 2, EToastType.Common)
end

function M:Continue()
  DebugPrint("DungeonSettlement: ClickContinueButton")
  if self.IsTemple then
    self:DefaultContinue()
    return
  end
  if not self:CheckAgainAvailable() then
    self.Btn_Continue:ForbidBtn(true)
    self:ForbidContinue()
    return
  end
  if self.CurActionPoint < self.DungeonCost then
    UIUtils.ShowActionRecover(self)
    return
  end
  local Avatar = GWorld:GetAvatar()
  if Avatar and Avatar:IsInHardBoss() then
    local RemainTimes = Avatar.HardBoss.HardBossRewardTimesLeft or 0
    local IsNoMorePrompts = self:CheckNeedShowWindow("IsBossBattlePopup")
    local DifficultyId = Avatar.HardBossInfo.DifficultyId
    if RemainTimes > 0 or IsNoMorePrompts or Avatar and DifficultyId and 0 == Avatar.HardBoss:GetPassCount(DifficultyId) then
      self:DefaultContinue()
    else
      self:ShowConfirmWindow()
    end
  elseif Avatar and self.IsWeeklyDungeon then
    local RemainTimes = Avatar.WeeklyDungeonRewardLeft or 0
    local IsNoMorePrompts = self:CheckNeedShowWindow("IsWeeklyDungeonPopup")
    if RemainTimes > 0 or IsNoMorePrompts then
      self:DefaultContinue()
    else
      self:ShowConfirmWindow()
    end
  else
    self:DefaultContinue()
  end
end

function M:CheckNeedShowWindow(EMCacheKey)
  local IsNoMorePrompts = EMCache:Get(EMCacheKey .. "NoMorePrompts", true) or false
  if TimeUtils and IsNoMorePrompts then
    local CachedTimestamp = EMCache:Get(EMCacheKey .. "Timestamp", true)
    IsNoMorePrompts = TimeUtils.IsTimestampInCurrentWeek(CachedTimestamp)
  end
  return IsNoMorePrompts
end

function M:DefaultContinue()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  if not Avatar:IsInNarrowDungeon() then
    self:RequestServerContinue()
    return
  end
  if self.IsWalnut and self:IsStandAloneSolo() then
    DebugPrint("ljl@WBP_DungeonSettlement_C M:DefaultContinue StandAloneSolo")
    self:AddDispatcher(EventID.SelectedWalnut, self, self.OnStandAloneSoloSelectedWalnut)
    UIManager(self):LoadUINew("WalnutChoice", CommonConst.WalnutUser.Settlement, self.DungeonId, GWorld.GameInstance.CombatData.TempTeamInfo)
  else
    DebugPrint("ljl@WBP_DungeonSettlement_C M:DefaultContinue Other")
    self:TryEnterDungeonAgain()
  end
end

function M:OnStandAloneSoloSelectedWalnut()
  self:RemoveDispatcher(EventID.SelectedWalnut)
  DebugPrint("ljl@WBP_DungeonSettlement_C M:OnStandAloneSoloSelectedWalnut")
  self:TryEnterDungeonAgain()
end

function M:RequestServerContinue(TicketId)
  self:BlockAllUIInput(true)
  local Avatar = GWorld:GetAvatar()
  local DungeonInfo = Avatar.Dungeons[self.DungeonId]
  Avatar:ContinueDungeonSettlement(self.BattleInfo, CommonUtils.Bind(self, self.DefaultContinueCallBack), TicketId, DungeonInfo and DungeonInfo.Squad or nil)
end

function M:DefaultContinueCallBack(Ret)
  DebugPrint("DungeonSettlement: ContinueCallBack")
  self:BlockAllUIInput(false)
  if Ret == ErrorCode.RET_SUCCESS then
    self:OnCloseSettlementUI()
    return
  end
  local Error = DataMgr.ErrorCode[Ret]
  if nil ~= Error then
    UIManager(self):ShowError(Error, 1.5)
  else
    UIManager(self):ShowError(DataMgr.ErrorCode[-1], 1.5)
  end
end

function M:Exit()
  DebugPrint("DungeonSettlement: ClickExitButton")
  self:BlockAllUIInput(true)
  local Avatar = GWorld:GetAvatar()
  Avatar:ExitDungeonSettlement()
  EventManager:AddEvent(EventID.OnExitDungeon, self, self.DefaultExit)
end

function M:DefaultExit()
  DebugPrint("DungeonSettlement: ExitCallBack")
  EventManager:RemoveEvent(EventID.OnExitDungeon, self)
  self:BlockAllUIInput(false)
  self:OnCloseSettlementUI()
  local _DeputeType = self:GetDeputeType()
  if _DeputeType then
    local ExitDungeonInfo = {Type = "Depute", DeputeType = _DeputeType}
    GWorld.GameInstance:SetExitDungeonData(ExitDungeonInfo)
  end
end

function M:OnCloseSettlementUI()
  self:SetAllUIVisibility(false)
  USkillFeatureFunctionLibrary.SKillFeatureForceStop()
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  if Player then
    Player:SetCanInteractiveTrigger(true)
    Player.PlayerAnimInstance:Montage_Stop(0)
  end
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  GameInstance:ProcessSettlementCharacter()
  if self.IsWin == false then
    AudioManager(self):StopSound(Player, "FailedPlayerCharAudio")
  else
    AudioManager(self):StopSound(self, "WinSettlement")
  end
  self:SetCharDirLight(false)
  self:Close()
end

function M:GetDeputeType()
  for _, Info in pairs(DataMgr.SelectDungeon or {}) do
    for _, DungeonId in pairs(Info.DungeonList or {}) do
      if DungeonId == self.DungeonId then
        return "Regular"
      end
    end
  end
  for _, Info in pairs(DataMgr.ModDungeonMonReward or {}) do
    for _, DungeonId in pairs(Info.DungeonList or {}) do
      if DungeonId == self.DungeonId then
        return "NightBook"
      end
    end
  end
  for _, Info in pairs(DataMgr.WalnutSelectDungeon or {}) do
    for _, DungeonId in pairs(Info.DungeonId or {}) do
      if DungeonId == self.DungeonId then
        return "Walnut"
      end
    end
  end
  return nil
end

function M:CalcRoleAndRewardsInfo()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  self:CalcRoleInfo(Avatar)
  self:PreInitPropInfo()
end

function M:CalcRoleInfo(Avatar)
  local IncrsExps = self:SetIncrsExps(self.Rewards.Exps)
  for RoleName, RoleItem in pairs(self.RoleItemInfos) do
    local OldBattleInfo = self.CombatData.OldBattleInfo[RoleName .. "_OldBattleInfo"]
    local CurBattleInfo = self.CombatData.CurBattleInfo[RoleName .. "_CurBattleInfo"]
    if 0 == IncrsExps[RoleName] then
      CurBattleInfo = {
        Exp = OldBattleInfo.Exp,
        Level = OldBattleInfo.Level
      }
    end
    RoleItem.Widget:SetItem(OldBattleInfo, RoleName, IncrsExps[RoleName], false, CurBattleInfo, self.IsNoExpDungeon)
    RoleItem.Widget:SetVisibility(ESlateVisibility.Visible)
    RoleItem.Widget:PlayInAnimation()
  end
end

function M:PreInitPropInfo()
  self.Switcher:SetActiveWidgetIndex(0)
  self.TileView_Reward:ClearListItems()
  self.TileView_Prop:ClearListItems()
end

function M:InitRewardsInfo(RewardArr, RewardViewWidget)
  local DropItemNumEachRow, DropRowNum = UIUtils.GetTileViewContentMaxCount(RewardViewWidget, "XY", true)
  local RewardTotalNum = #RewardArr
  if RewardTotalNum < 1 and 0 == #self.SpRewardsArray and 0 == #self.RewardsArray then
    self.Switcher:SetActiveWidgetIndex(1)
  else
    local Avatar = GWorld:GetAvatar()
    if Avatar and Avatar:IsInHardBoss() then
      DropRowNum = math.max(self.EmptyLine or 0, DropRowNum)
    end
    local MaxItemNum = DropRowNum * DropItemNumEachRow
    if RewardTotalNum > MaxItemNum then
      local RealRowNum = RewardTotalNum // DropItemNumEachRow
      if 0 ~= RewardTotalNum % DropItemNumEachRow then
        RealRowNum = RealRowNum + 1
      end
      MaxItemNum = RealRowNum * DropItemNumEachRow
    end
    local AddPropKey = RewardViewWidget:GetName()
    self.IsAllowPropInAnimation = true
    
    local function AddProp()
      local ShowNum = RewardViewWidget:GetNumItems()
      if ShowNum < MaxItemNum then
        RewardViewWidget:AddItem(self:NewPropContent(RewardArr[ShowNum + 1], RewardViewWidget))
      else
        self:RemoveTimer(AddPropKey, true)
        RewardViewWidget:SetVisibility(UIConst.VisibilityOp.Visible)
        self.IsAllowPropInAnimation = false
      end
      RewardViewWidget:SetEmptyGridItemCount(math.max(0, ShowNum - RewardTotalNum))
    end
    
    RewardViewWidget:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
    self:AddTimer(self.IntervalTime, AddProp, true, self.FirstDelayTime, AddPropKey, true)
  end
end

function M:InitRefundInfo(UnCostItemsInfo)
  if not UnCostItemsInfo then
    DebugPrint("thy  UnCostItemsInfo is nil")
    return
  end
  self.RefundItemsInfo = {}
  for _, value in pairs(UnCostItemsInfo) do
    for key, val in pairs(value) do
      self.RefundItemsInfo[_] = val
    end
  end
  self.Refund:SetVisibility(ESlateVisibility.Visible)
  self.Refund:InitRefund(self.RefundItemsInfo)
  GWorld.GameInstance.UnCostItemsInfo = nil
end

function M:CalcPropInfo()
  self:ShowCountDown()
  if self.IsTemple then
    return
  end
  self.TileView_Reward:DisableScroll(true)
  self.TileView_Prop:DisableScroll(true)
  self:AddTimer(0.01, function()
    self:InitRewardsInfo(self.SpRewardsArray, self.TileView_Reward)
    self:InitRewardsInfo(self.RewardsArray, self.TileView_Prop)
    if not self.IsWin then
      local Avatar = GWorld:GetAvatar()
      if Avatar and Avatar:IsInHardBoss() then
        self.FailTips:InitialTips(self.BattleInfo.HardBossId, true)
      else
        self.FailTips:InitialTips(self.DungeonId, false)
      end
      if CommonUtils.Size(DataMgr.FailureGuidance) > 7 then
        self.FailTipsNum = CommonUtils.Size(DataMgr.FailureGuidance)
        self.CurFailTipIndex = 0
      end
      self:InitRefundInfo(GWorld.GameInstance.UnCostItemsInfo)
    end
  end)
  self:UpdateMainUI()
end

function M:SetDetailsContent()
  self.Widget_DetailsTime = self:InitDataContent(GText("UI_STAT_Time"), self:GetTimeStr(self.PlayerTime))
  self:SetOnlineDetails()
  self:SetDamageDetails()
  self:SetKillDetails()
  self:SetTakedDamageDetails()
  self:SetPhantomAttrsDetails()
  self:SetOtherDetails()
  local DeadCount = self.CombatData.DeadCount or 0
  self.Widget_DeadCount = self:InitDataContent(GText("UI_STAT_DEAD"), tostring(DeadCount))
end

function M:SetOtherDetails()
  local SpConsume = self.CombatData.SpConsume
  local BulletConsume = self.CombatData.BulletConsume
  local ChestOpenedCount = self.CombatData.ChestOpenedCount
  local BreakableItemCount = self.CombatData.BreakableItemCount
  local MaxComboCount = self.CombatData.MaxComboCount
  local MaxDamage = self.CombatData.MaxDamage
  self.Widget_Other = self:InitDataContent(GText("UI_STAT_Other"))
  local OtherDetails = {
    {
      Name = GText("UI_STAT_ActionPoint_Cost"),
      Value = SpConsume
    },
    {
      Name = GText("UI_STAT_Bullets_Cost"),
      Value = BulletConsume
    },
    {
      Name = GText("UI_STAT_Chest"),
      Value = ChestOpenedCount
    },
    {
      Name = GText("UI_STAT_Destructible"),
      Value = BreakableItemCount
    },
    {
      Name = GText("UI_STAT_Combo_Max"),
      Value = MaxComboCount
    },
    {
      Name = GText("UI_STAT_Damage_Max"),
      Value = MaxDamage
    }
  }
  self:WrapedInitChildDetailContentFunc(self.Widget_Other, OtherDetails, 6)
end

function M:SetOnlineDetails()
  if not self.CombatData.IsInOnlineDungeon then
    return
  end
  local TitleStr = ""
  local TeammateDamageInfos = self.CombatData.TeammateDamageInfos
  local TeammateNum = self.CombatData.TeammateNum
  local TeamModel = TeamController:GetModel()
  if not TeamModel then
    return
  end
  local SortTeammateDamageInfos = {}
  for _, TeammateDamageInfo in pairs(TeammateDamageInfos) do
    if TeammateDamageInfo and TeammateDamageInfo.Index then
      SortTeammateDamageInfos[TeammateDamageInfo.Index] = TeammateDamageInfo
    end
  end
  table.sort(SortTeammateDamageInfos)
  for TeamIndex, TeammateDamageInfo in pairs(SortTeammateDamageInfos) do
    if "" == TitleStr then
      TitleStr = GText("UI_STAT_Online_P" .. TeamIndex)
    else
      TitleStr = TitleStr .. "\227\128\129" .. GText("UI_STAT_Online_P" .. TeamIndex)
    end
  end
  self.Widget_OnlineDetails = self:InitDataContent(GText("UI_STAT_Online"), TitleStr)
  for TeamIndex, TeammateDamageInfo in pairs(SortTeammateDamageInfos) do
    local OnlinePlayersDetails = {
      {
        Name = GText("UI_STAT_Online_Damage_" .. TeamIndex .. "P"),
        Value = TeammateDamageInfo.FinalDamage
      },
      {
        Name = GText("UI_STAT_Online_Kill_" .. TeamIndex .. "P"),
        Value = TeammateDamageInfo.TotalKillCount
      }
    }
    self:WrapedInitChildDetailContentFunc(self.Widget_OnlineDetails, OnlinePlayersDetails, 2)
  end
end

function M:SetPhantomAttrsDetails()
  local PhantomAttrInfos = self.CombatData.PhantomAttrInfos
  local PhantomNum = self.CombatData.PhantomNum
  local Battle = GWorld.Battle
  if not Battle then
    DebugPrint("[THY]  Battle\228\184\186nil")
    return
  end
  if 0 == PhantomNum then
    DebugPrint("[THY]  \230\178\161\230\156\137\233\173\133\229\189\177")
    return
  end
  local PhantomDetails = {}
  for PhantomNumber, PhantomAttrInfo in pairs(PhantomAttrInfos) do
    if PhantomAttrInfo and PhantomAttrInfo.PhantomRoleId and PhantomAttrInfo.PhantomRoleId > 999 then
      local PhantomName = DataMgr.Char[PhantomAttrInfo.PhantomRoleId].CharName
      self["Widget_PhantomDetails" .. PhantomNumber] = self:InitDataContent(GText("UI_STAT_Sigil"), GText(PhantomName))
      PhantomDetails = {
        {
          Name = GText("UI_STAT_Sigil_DAMAGE"),
          Value = PhantomAttrInfo.FinalDamage
        },
        {
          Name = GText("UI_STAT_Sigil_SUFFER"),
          Value = PhantomAttrInfo.TakedDamage
        },
        {
          Name = GText("UI_STAT_Sigil_KILL"),
          Value = PhantomAttrInfo.TotalKillCount
        },
        {
          Name = GText("UI_STAT_Sigil_DEAD"),
          Value = PhantomAttrInfo.DeathCount
        }
      }
      self:WrapedInitChildDetailContentFunc(self["Widget_PhantomDetails" .. PhantomNumber], PhantomDetails, 4)
    end
  end
end

function M:SetTakedDamageDetails()
  local TakeDamagePercent = self.CombatData.TakeDamagePercentage
  local TakedDamage = MiscUtils.Round(self.CombatData.TakedDamage)
  local TakedShieldDamage = self.CombatData.TakedShieldDamage
  local TakedHeal = self.CombatData.TakedHeal
  local TakeDamageText = tostring(MiscUtils.Round(TakedDamage))
  if not IsStandAlone(self) then
    TakeDamageText = TakeDamageText .. "(" .. MiscUtils.Round(TakeDamagePercent * 100) .. "%)"
  end
  self.Widget_TotalDamage = self:InitDataContent(GText("UI_STAT_SUFFER"), TakeDamageText)
  local TakedDamageDetails = {
    {
      Name = GText("UI_STAT_Shield"),
      Value = TakedShieldDamage
    },
    {
      Name = GText("UI_STAT_Healing"),
      Value = TakedHeal
    }
  }
  self:WrapedInitChildDetailContentFunc(self.Widget_TotalDamage, TakedDamageDetails, 2)
end

function M:SetDamageDetails()
  local TotalDamagePercent = self.CombatData.DamagePercentage or 0
  local TotalDamage = self.CombatData.TotalDamage or 0
  local MeleeDamage = self.CombatData.MeleeDamage or 0
  local RangedDamage = self.CombatData.RangedDamage or 0
  local SkillDamage = self.CombatData.SkillDamage or 0
  local SupportDamage = self.CombatData.SupportDamage or 0
  local TotalDamageText = tostring(MiscUtils.Round(TotalDamage))
  if not IsStandAlone(self) then
    TotalDamageText = TotalDamageText .. "(" .. MiscUtils.Round(TotalDamagePercent * 100) .. "%)"
  end
  self.Widget_DamageDetail = self:InitDataContent(GText("UI_STAT_DAMAGE_TITLE"), TotalDamageText)
  local DamageDetails = {
    {
      Name = GText("UI_STAT_DAMAGE_MELEE"),
      Value = MeleeDamage
    },
    {
      Name = GText("UI_STAT_DAMAGE_RANGE"),
      Value = RangedDamage
    },
    {
      Name = GText("UI_STAT_DAMAGE_CHAR"),
      Value = SkillDamage
    },
    {
      Name = GText("UI_STAT_DAMAGE_Pet"),
      Value = SupportDamage
    }
  }
  table.sort(DamageDetails, function(a, b)
    return a.Value > b.Value
  end)
  self:WrapedInitChildDetailContentFunc(self.Widget_DamageDetail, DamageDetails, 4)
end

function M:SetKillDetails()
  local TotalKill = self.CombatData.TotalKill or 0
  local MeleeKill = self.CombatData.MeleeKill or 0
  local RangedKill = self.CombatData.RangedKill or 0
  local SkillKill = self.CombatData.SkillKill or 0
  local SupportKill = self.CombatData.SupportKill or 0
  self.Widget_KillDetail = self:InitDataContent(GText("UI_STAT_KILL_TITLE"), tostring(MiscUtils.Round(TotalKill)))
  local KillDetails = {
    {
      Name = GText("UI_STAT_KILL_MELEE"),
      Value = MeleeKill
    },
    {
      Name = GText("UI_STAT_KILL_RANGE"),
      Value = RangedKill
    },
    {
      Name = GText("UI_STAT_KILL_CHAR"),
      Value = SkillKill
    },
    {
      Name = GText("UI_STAT_KILL_Pet"),
      Value = SupportKill
    }
  }
  table.sort(KillDetails, function(a, b)
    return a.Value > b.Value
  end)
  self:WrapedInitChildDetailContentFunc(self.Widget_KillDetail, KillDetails, 4)
end

function M:WrapedInitChildDetailContentFunc(FatherWidget, ChildInfos, ChildInfoLength)
  local IsIntervalBg = true
  local ChildTargets = self:InitTargetContents(FatherWidget, ChildInfoLength)
  for i = 1, #ChildTargets do
    local ChildInfo = ChildInfos[i]
    self:SetTargetContent(ChildTargets[i], ChildInfo.Name, ChildInfo.Value, IsIntervalBg)
    IsIntervalBg = not IsIntervalBg
  end
end

function M:InitDataContent(TextTarget, TextNumber)
  local Data_Widget = self:CreateWidgetNew("DungeonSettlementData")
  self:SetTitleContent(Data_Widget.Title, TextTarget, TextNumber)
  self.Panel_CombatData.EMScrollBox_31:AddChild(Data_Widget)
  return Data_Widget
end

function M:InitTargetContents(Data_Widget, LenNum)
  local Targets = {}
  for i = 1, LenNum do
    local Target_Widget = self:CreateWidgetNew("DungeonSettlementTarget")
    Data_Widget.SubTitle:AddChildToVerticalBox(Target_Widget)
    Targets[i] = Target_Widget
  end
  return Targets
end

function M:SetTitleContent(Title, TextTarget, TextNumber)
  Title.Text_Main:SetText(TextTarget)
  Title.Text_Number:SetText(TextNumber)
end

function M:SetTargetContent(Target, TextMain, TextNumber, IsHideBg)
  Target.Text_Main:SetText(TextMain)
  if TextNumber then
    Target.Text_Number:SetText(MiscUtils.Round(TextNumber))
  end
  if IsHideBg then
    Target.Bg:SetVisibility(ESlateVisibility.Collapsed)
  else
    Target.Bg:SetVisibility(ESlateVisibility.HitTestInvisible)
  end
end

function M:SetIncrsExps(Exps)
  local IncrsExps = {}
  for k, _ in pairs(self.RoleItemInfos) do
    IncrsExps[k] = 0
  end
  if not Exps then
    return IncrsExps
  end
  for id, num in pairs(Exps) do
    local SumExp = RewardBox:GetCount(num)
    if id == CommonConst.CharExpItemId then
      IncrsExps.Char = SumExp
    elseif id == CommonConst.MeleeWeaponExpItemId then
      IncrsExps.MeleeWeapon = SumExp
    elseif id == CommonConst.RangedWeaponExpItemId then
      IncrsExps.RangedWeapon = SumExp
    elseif id == CommonConst.PlayerExpId then
      IncrsExps.Player = SumExp
    end
  end
  return IncrsExps
end

function M:RewardsAddToArray(TotalRewards, Rewards, IsSpecial)
  if not Rewards then
    return
  end
  local RewardTypes = DataMgr.RewardType
  for RewardType, RewardTypeValue in pairs(RewardTypes) do
    if not RewardTypeValue.DungeonRewardType then
    else
      local Reward = Rewards[RewardType .. "s"]
      if not Reward then
      else
        for Id, NumTable in pairs(Reward) do
          local NormalNum = RewardBox:FindCountByTag(NumTable, "Normal")
          local ExtraNum = RewardBox:FindCountByTag(NumTable, "Extra")
          local WalnutNum = RewardBox:FindCountByTag(NumTable, "Walnut")
          local FirstNum = RewardBox:FindCountByTag(NumTable, "First")
          local ResourceData = self:CreateOneReward(RewardType, RewardTypeValue, Id, NormalNum, IsSpecial, false, false, false)
          local ExtraResourceData = self:CreateOneReward(RewardType, RewardTypeValue, Id, ExtraNum, IsSpecial, true, false, false)
          local WalnutResourceData = self:CreateOneReward(RewardType, RewardTypeValue, Id, WalnutNum, IsSpecial, false, true, false)
          local FirstRewardData = self:CreateOneReward(RewardType, RewardTypeValue, Id, FirstNum, IsSpecial, false, false, true)
          if ResourceData then
            table.insert(TotalRewards, ResourceData)
          end
          if ExtraResourceData then
            table.insert(TotalRewards, ExtraResourceData)
          end
          if WalnutResourceData then
            table.insert(TotalRewards, WalnutResourceData)
          end
          if FirstRewardData then
            table.insert(TotalRewards, FirstRewardData)
          end
        end
      end
    end
  end
end

function M:CreateOneReward(RewardType, RewardTypeValue, Id, Num, IsSpecial, IsExtra, IsWalnut, IsFirst)
  if 0 == Num then
    return
  end
  local RewardInfo = DataMgr[RewardType][tonumber(Id)]
  if RewardInfo then
    local ResourceData = {}
    ResourceData.Priority = RewardTypeValue.DungeonRewardSeq or 0
    ResourceData.Id = Id
    ResourceData.Count = Num
    ResourceData.Icon = RewardInfo.Icon
    ResourceData.Rarity = RewardInfo.Rarity or RewardInfo[RewardType .. "Rarity"] or 0
    ResourceData.ItemType = RewardType
    ResourceData.IsSpecial = IsSpecial
    ResourceData.IsBonus = IsExtra
    ResourceData.IsWalnutBonus = IsWalnut
    ResourceData.IsFirst = IsFirst
    return ResourceData
  else
    return
  end
end

function M:SortRewardsArray(RewardsArray)
  table.sort(RewardsArray, function(a, b)
    if a.IsFirst ~= b.IsFirst then
      return a.IsFirst
    end
    if a.IsSpecial ~= b.IsSpecial then
      return a.IsSpecial
    end
    if a.Rarity ~= b.Rarity then
      return a.Rarity > b.Rarity
    end
    if a.Priority ~= b.Priority then
      return a.Priority > b.Priority
    end
    if a.Id ~= b.Id then
      return a.Id > b.Id
    end
    if a.IsBonus ~= b.IsBonus then
      return not a.IsBonus
    end
    if a.IsWalnut ~= b.IsWalnut then
      return not a.IsWalnut
    end
    if a.Count ~= b.Count then
      return a.Count > b.Count
    end
    return false
  end)
end

function M:NewPropContent(Content, RewardViewWidget)
  local ItemContent = NewObject(UIUtils.GetCommonItemContentClass())
  if nil ~= Content then
    ItemContent.ParentWidget = self
    ItemContent.Id = Content.Id
    ItemContent.Count = Content.Count
    
    function ItemContent.AfterInitCallback(Widget)
      if self.IsAllowPropInAnimation and not Widget.Content.IsPlayedInAnimation then
        Widget:PlayInAnimation()
        Widget.Content.IsPlayedInAnimation = true
      else
        Widget:PlayAnimation(Widget.Normal_In, Widget.Normal_In:GetEndTime())
      end
      self:OpenTipsBindEvents(Widget)
    end
    
    ItemContent.OnAddedToFocusPathEvent = {
      Obj = ItemContent.ParentWidget,
      Callback = function(Obj)
        if Obj.CurInputDeviceType == ECommonInputType.Gamepad then
          Obj.EMScrollBox_255:ScrollWidgetIntoView(ItemContent.SelfWidget)
        end
      end,
      Params = {}
    }
    if Content.ItemType == "Mod" and self:CheckIsNew(Content.Id) then
      ItemContent.RedDotType = UIConst.RedDotType.NewRedDot
    end
    if Content.Icon then
      ItemContent.Icon = Content.Icon
    end
    DebugPrint("thy     Content.Icon", Content.Icon)
    ItemContent.Rarity = Content.Rarity
    ItemContent.IsShowDetails = true
    ItemContent.ItemType = Content.ItemType
    ItemContent.IsSpecial = Content.IsSpecial
    if Content.IsWalnutBonus then
      ItemContent.BonusType = 3
    end
    if Content.IsBonus then
      ItemContent.BonusType = 1
    end
    if Content.IsFirst then
      ItemContent.BonusType = 2
    end
    ItemContent.UIName = "DungeonSettlement"
  end
  return ItemContent
end

function M:CheckIsNew(Id)
  if not Id then
    return false
  end
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return false
  end
  local NowTimeStamp = GWorld.GameInstance.GameEndTime
  local StartDungeonTime = NowTimeStamp - self.PlayerTime
  for ModId, GetTime in pairs(Avatar.HoldMods) do
    if ModId == Id then
      return GetTime > StartDungeonTime
    end
  end
  return false
end

function M:OpenTipsBindEvents(Widget)
  local Events = {}
  Events.OnMenuOpenChanged = self.ItemMenuAnchorChanged
  Widget:BindEvents(self, Events)
end

function M:ItemMenuAnchorChanged()
  if UIManager(self):IsHaveMenuAnchorOpen() then
    self:UpdateMainUIInGamePadClick()
  elseif self.CurInputDeviceType == ECommonInputType.Gamepad then
    self:SwitchMainUIPCToGamePad()
    self:SetFocusInGamePad()
    if 1 ~= self.Switcher:GetActiveWidgetIndex() then
      self:UpdateBottomTabsInfo(GText("UI_Controller_CheckDetails"))
    end
  else
    self:UpdateMainUIWithPCOrMoble()
  end
end

function M:OpenTempleTipsBindEvents(Widget)
  local Events = {}
  Events.OnMenuOpenChanged = self.TempleMenuAnchorChanged
  Widget:BindEvents(self, Events)
end

function M:TempleMenuAnchorChanged()
  if UIManager(self):IsHaveMenuAnchorOpen() then
    self:UpdateMainUIInGamePadClick()
    if self.WidgetRewards.Key_Controller_Qa then
      self.WidgetRewards.Key_Controller_Qa:SetVisibility(ESlateVisibility.Collapsed)
    end
  elseif self.CurInputDeviceType == ECommonInputType.Gamepad then
    if self.WidgetRewards.Key_Controller_Qa then
      self.WidgetRewards.Key_Controller_Qa:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    end
    self:SwitchMainUIPCToGamePad()
    self:UpdateBottomTabsInfo(GText("UI_Controller_CheckDetails"))
  else
    self:UpdateMainUIWithPCOrMoble()
  end
end

function M:ShowSettlementInfo()
  if self.IsWin then
    self:PlayAnimation(self.Victory_In)
    AudioManager(self):PlayUISound(self, "event:/ui/common/level_sucess_hud_show", nil, nil)
    if self.IsStarLevel then
      local Star = self.CombatData.StarLevel
      if 1 == Star then
        AudioManager(self):PlayUISound(self, "event:/ui/common/level_success_hud_show_one_star", nil, nil)
      elseif 2 == Star then
        AudioManager(self):PlayUISound(self, "event:/ui/common/level_success_hud_show_two_stars", nil, nil)
      elseif 3 == Star then
        AudioManager(self):PlayUISound(self, "event:/ui/common/level_success_hud_show_three_stars", nil, nil)
      end
    end
    local PlayStruct = FPlayFMODSoundStruct()
    PlayStruct.FMODEventPath, PlayStruct.SelectKey = AudioManager(self):ContactPlayerStringPath(self.PlayerCharacter, "vo_victory")
    PlayStruct.EventKey = "vo_victory"
    PlayStruct.bStopWhenAttachedToDestoryed = true
    PlayStruct.bPlayAs2D = true
    PlayStruct = UE4.UAudioManager.SetObjectToFPlayFMODSoundStruct(PlayStruct, self)
    local SoundEventInstance = AudioManager(self):PlayFMODSound_Sync(PlayStruct)
  else
    self:PlayAnimation(self.Defeat_In)
    AudioManager(self):PlayUISound(self, "event:/ui/common/level_fail_hud_show", nil, nil)
    AudioManager(self):PlayFMODSoundByID(self.PlayerCharacter, 211, self.PlayerCharacter, "None", {
      bFollowSocket = true,
      EventKey = "FailedPlayerCharAudio"
    })
  end
  self:AddTimer(5.0, function()
    self:UpdateMainUI()
  end)
end

function M:ActivateDropPanelScrolling(bIsActive, RewardViewWidget)
  if bIsActive then
    RewardViewWidget:SetScrollBarVisibility(ESlateVisibility.Visible)
  else
    RewardViewWidget:SetScrollBarVisibility(ESlateVisibility.Collapsed)
  end
end

function M:ShowConfirmWindow()
  local CommonDialogParams = {}
  
  function CommonDialogParams.RightCallbackFunction(_, Data)
    self:DefaultContinue()
    self:UpdateSelectedInfo(Data)
  end
  
  function CommonDialogParams.LeftCallbackFunction(_, Data)
    self:UpdateSelectedInfo(Data)
  end
  
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  local UIManager = GameInstance:GetGameUIManager()
  local Avatar = GWorld:GetAvatar()
  if Avatar and Avatar:IsInHardBoss() then
    UIManager:ShowCommonPopupUI(Const.Popup_SecondConfirm, CommonDialogParams, self)
  elseif self.IsWeeklyDungeon then
    UIManager:ShowCommonPopupUI(100211, CommonDialogParams, self)
  end
end

function M:UpdateSelectedInfo(Data)
  local IsSelected = Data.SelectHint.IsSelected
  local CurTimestamp = TimeUtils.NowTime()
  local Avatar = GWorld:GetAvatar()
  if Avatar and Avatar:IsInHardBoss() then
    EMCache:Set("IsBossBattlePopupNoMorePrompts", IsSelected, true)
    EMCache:Set("IsBossBattlePopupTimestamp", CurTimestamp, true)
  elseif self.IsWeeklyDungeon then
    EMCache:Set("IsWeeklyDungeonPopupNoMorePrompts", IsSelected, true)
    EMCache:Set("IsWeeklyDungeonPopupTimestamp", CurTimestamp, true)
  end
end

function M:ShowCountDown()
  self.RemainTime = 300
  self.MaxAutoExitTime = 300
  if not self.IsWin then
    self.RemainTime = 30
    self.MaxAutoExitTime = 30
  end
  self.CurrentTime = 0
  self.ProgressInterval = 0.06666666666666667
  self.Bar_Click:SetPercent(0)
  self.Bar_Click:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  self:AddTimer(1, self.CountDown, true, -1, "CountDown")
  self:AddTimer(self.ProgressInterval, self.SetProgressBar, true, -1, "SetProgressBar", nil, self.ProgressInterval)
end

function M:CountDown()
  local Text = string.format(GText("UI_Text_ExitTime"), self.RemainTime)
  self.Text_ExitTime:SetText(Text)
  if self.RemainTime <= 0 then
    self:Exit()
    self:RemoveTimer("CountDown")
    self:RemoveTimer("SetProgressBar")
  end
  self.RemainTime = self.RemainTime - 1
end

function M:SetProgressBar(Interval)
  self.CurrentTime = self.CurrentTime + Interval
  self.Bar_Click:SetPercent(self.CurrentTime / self.MaxAutoExitTime)
end

function M:CheckIsNoExpMode()
  self.IsNoExpDungeon = false
  local DungeonInfo = DataMgr.Dungeon[self.DungeonId]
  if DungeonInfo then
    local GameModeType = DungeonInfo.DungeonType
    if "Temple" == GameModeType then
      self.IsNoExpDungeon = true
    elseif "Party" == GameModeType then
      self.IsNoExpDungeon = true
    elseif "Abyss" == GameModeType then
      self.IsNoExpDungeon = true
    end
  end
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    if Avatar:IsInHardBoss() then
      self.IsNoExpDungeon = true
    elseif Avatar:IsInRougeLike() then
      self.IsNoExpDungeon = true
    end
  end
end

function M:CheckIsWalnutMode()
  self.IsWalnut = false
  local DungeonInfo = DataMgr.Dungeon[self.DungeonId]
  if DungeonInfo then
    self.IsWalnut = DungeonInfo.IsWalnutDungeon == true
  end
end

function M:CheckAgainAvailable()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return true
  end
  if not self.IsWalnut then
    return true
  end
  if Avatar.Walnuts and Avatar.Walnuts.ValidWalnutDungeons then
    for _, DungeonIds in pairs(Avatar.Walnuts.ValidWalnutDungeons) do
      for _, DungeonId in pairs(DungeonIds) do
        if DungeonId == self.DungeonId then
          return true
        end
      end
    end
  end
  return false
end

function M:CheckIsTempleMode()
  self.IsTemple = false
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    error("Avatar is nil")
  end
  self.GameMode = UE4.UGameplayStatics.GetGameMode(self)
  if not self.GameMode then
    return
  end
  if Avatar:IsInDungeon() then
    local DungeonInfo = self:GetDungeonInfo(self.BattleInfo)
    if DungeonInfo.DungeonType and DungeonInfo.DungeonType == "Temple" then
      self.IsTemple = true
      self.Panel_Main:SetVisibility(ESlateVisibility.Collapsed)
      self.Panel_Consume:SetVisibility(ESlateVisibility.Collapsed)
      self.FailTips:SetVisibility(ESlateVisibility.Collapsed)
      self.Btn_Data:SetVisibility(ESlateVisibility.Collapsed)
      self.Group_Temple:SetVisibility(ESlateVisibility.Visible)
    end
  end
end

function M:CheckIsPartyMode()
  self.IsParty = false
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    error("Avatar is nil")
  end
  self.GameMode = UE4.UGameplayStatics.GetGameMode(self)
  if not self.GameMode then
    return
  end
  if Avatar:IsInDungeon() then
    local DungeonInfo = self:GetDungeonInfo(self.BattleInfo)
    if DungeonInfo.DungeonType and DungeonInfo.DungeonType == "Party" then
      self.IsParty = true
      self.Panel_Main:SetVisibility(ESlateVisibility.Collapsed)
      self.Panel_Consume:SetVisibility(ESlateVisibility.Collapsed)
      self.FailTips:SetVisibility(ESlateVisibility.Collapsed)
      self.Btn_Data:SetVisibility(ESlateVisibility.Collapsed)
      self.Group_Temple:SetVisibility(ESlateVisibility.Visible)
    end
  end
end

function M:CalcTempleInfo()
  self.TempleInfo = DataMgr.Temple[self.DungeonId]
  if not self.TempleInfo then
    return
  end
  local StarLevel = 0
  local Score = 0
  local Collection = 0
  local Ids = self.TempleInfo.RewardId
  if 3 == #Ids then
    self.IsStarLevel = true
    if self.CombatData.StarLevel then
      StarLevel = self.CombatData.StarLevel
    end
    if StarLevel < 0 or StarLevel > 3 then
      error("\230\156\172\229\133\179\232\174\190\231\189\174\230\152\159\231\186\167\232\182\133\229\135\186\229\143\175\232\142\183\229\190\151\231\154\132\232\140\131\229\155\180")
    end
  elseif 1 == #Ids then
    self.IsStarLevel = false
  else
    error("\230\156\172\229\133\179\229\165\150\229\138\177\233\133\141\231\189\174\230\156\137\232\175\175\239\188\140\232\175\183\230\173\163\231\161\174\233\133\141\231\189\174\230\152\159\231\186\167\229\165\150\229\138\177\230\136\150\230\151\160\230\152\159\231\186\167\229\165\150\229\138\177")
  end
  local FailReason = ""
  if not self.IsWin then
    FailReason = self.CombatData.FailReason
    StarLevel = 0
  end
  self.WidgetStar = self:CreateWidgetNew("TempleItem")
  self.WidgetStar.ParentUI = self
  self.WidgetStar.Btn_Qa:SetVisibility(ESlateVisibility.Collapsed)
  if self.IsStarLevel then
    self.WidgetStar:SetStarLevel(StarLevel, FailReason)
  else
    self.WidgetStar:SetNoStarLevel(FailReason)
  end
  local Rule = self.TempleInfo.SucRule
  if "Time" == Rule or "CountDown" == Rule and 1 == self.TempleInfo.UIShowType then
    local Time = 0
    if self.CombatData.TempleTime then
      Time = self.CombatData.TempleTime
    end
    local TimeText = self:CalcTimeInfo(Time)
    self.WidgetStar:SetPoints(TimeText)
    self.WidgetStar.Text_Title:SetText(GText("UI_TEMPLE_TOTAL_TIME"))
  elseif "CountDown" == Rule then
    local Time = 0
    if self.CombatData.RemainTempleTime then
      Time = self.CombatData.RemainTempleTime
    end
    local TimeText = self:CalcTimeInfo(Time)
    self.WidgetStar:SetPoints(TimeText)
    self.WidgetStar.Text_Title:SetText(GText("UI_TEMPLE_TOTAL_COUNTDOWN"))
  elseif "Score" == Rule then
    if self.CombatData.Score then
      Score = self.CombatData.Score
    end
    self.WidgetStar:SetPoints(Score)
    self.WidgetStar.Text_Title:SetText(GText("UI_TEMPLE_TOTAL_SCORE"))
  elseif "Collect" == Rule then
    if self.CombatData.Collection then
      Collection = self.CombatData.Collection
    end
    self.WidgetStar:SetPoints(Collection)
    self.WidgetStar.Text_Title:SetText(GText("UI_TEMPLE_TOTAL_COLLECT"))
  end
  self.WidgetStar:SetVisibility(ESlateVisibility.Hidden)
  self.SizeBox_Stars:AddChild(self.WidgetStar)
  self.WidgetRewards = self:CreateWidgetNew("TempleItem")
  self.WidgetRewards.ParentUI = self
  local RewardsInfo = {}
  if self.IsStarLevel then
    local MaxTempleStar = 0
    if self.CombatData.MaxTempleStar then
      MaxTempleStar = self.CombatData.MaxTempleStar
    end
    for i = 1, #Ids do
      local ItemData = self:GetFirstRewardInfoById(Ids[i])
      local Info = self:NewTempleContent(ItemData, i)
      table.insert(RewardsInfo, Info)
    end
    self.WidgetRewards:SetStarRewards(RewardsInfo, StarLevel, MaxTempleStar)
  else
    if nil ~= Ids[1] then
      local ItemDatas = RewardUtils:GetAllRewardByRewardId(Ids[1])
      local Rewards = {}
      self:RewardsAddToArray(Rewards, ItemDatas, false)
      self:SortRewardsArray(Rewards)
      RewardsInfo = Rewards
    end
    local Avatar = GWorld:GetAvatar()
    if not Avatar then
      error("Avatar is nil")
    end
    if Avatar.Dungeons[self.DungeonId] then
      local IsPass = Avatar.Dungeons[self.DungeonId].IsPass
      self.WidgetRewards:SetNoStarRewards(RewardsInfo, IsPass, self.IntervalTime, self.FirstDelayTime)
    end
  end
  self.WidgetRewards:SetVisibility(ESlateVisibility.Hidden)
  self.SizeBox_Rewards:AddChild(self.WidgetRewards)
  self.rewardItems = {
    self.WidgetRewards.Item01,
    self.WidgetRewards.Item02,
    self.WidgetRewards.Item03,
    self.WidgetRewards.Item_Repeat
  }
  local ConfigData = {
    OwnerWidget = self.WidgetRewards,
    TextContent = GText("UI_Temple_RewardDetail")
  }
  self.WidgetRewards.Btn_Qa:Init(ConfigData)
  self.WidgetRewards.Btn_Qa:SetVisibility(ESlateVisibility.Visible)
end

function M:CalcPartyInfo()
  self.PartyInfo = DataMgr.Party[self.DungeonId]
  if not self.PartyInfo then
    return
  end
  local StarLevel = 0
  local Score = 0
  local Collection = 0
  local Ids = self.PartyInfo.RewardId
  if 3 == #Ids then
    self.IsStarLevel = true
    if self.CombatData.StarLevel then
      StarLevel = self.CombatData.StarLevel
    else
      StarLevel = 0
    end
    if StarLevel < 0 or StarLevel > 3 then
      error("\230\156\172\229\133\179\232\174\190\231\189\174\230\152\159\231\186\167\232\182\133\229\135\186\229\143\175\232\142\183\229\190\151\231\154\132\232\140\131\229\155\180")
    end
  elseif 1 == #Ids then
    self.IsStarLevel = false
  else
    error("\230\156\172\229\133\179\229\165\150\229\138\177\233\133\141\231\189\174\230\156\137\232\175\175\239\188\140\232\175\183\230\173\163\231\161\174\233\133\141\231\189\174\230\152\159\231\186\167\229\165\150\229\138\177\230\136\150\230\151\160\230\152\159\231\186\167\229\165\150\229\138\177")
  end
  local FailReason = ""
  if not self.IsWin then
    StarLevel = 0
  end
  self.WidgetStar = self:CreateWidgetNew("TempleItem")
  self.WidgetStar.ParentUI = self
  self.WidgetStar.Btn_Qa:SetVisibility(ESlateVisibility.Collapsed)
  self.WidgetStar.ParentUI = self
  if self.IsStarLevel then
    self.WidgetStar:SetStarLevel(StarLevel, FailReason)
  else
    self.WidgetStar:SetNoStarLevel(FailReason)
  end
  self.WidgetStar.Text_Title:SetText(GText("UI_TEMPLE_TOTAL_TIME"))
  local ScenePlayers = GWorld.GameInstance.ScenePlayers
  for CurPlayerIndex, Player in ipairs(ScenePlayers) do
    if Player.IsMainPlayer then
      if self.CombatData.PartyPlayerCompleteTime[CurPlayerIndex] then
        self.WidgetStar.Text_PointsNum:SetText(self:GetTimeStr(self.CombatData.PartyPlayerCompleteTime[CurPlayerIndex]))
        break
      end
      self.WidgetStar.Text_PointsNum:SetText(GText("UI_PARTY_PARKOUR_UNFINISH"))
      break
    end
  end
  self.WidgetStar:SetVisibility(ESlateVisibility.Hidden)
  self.SizeBox_Stars:AddChild(self.WidgetStar)
  self.WidgetRewards = self:CreateWidgetNew("TempleItem")
  self.WidgetRewards.ParentUI = self
  local RewardsInfo = {}
  local Avatar = GWorld:GetAvatar()
  if self.IsStarLevel then
    local MaxTempleStar = 0
    if Avatar.Dungeons[self.DungeonId].MaxStar then
      MaxTempleStar = Avatar.Dungeons[self.DungeonId].MaxStar
    else
      MaxTempleStar = 0
    end
    for i = 1, #Ids do
      local ItemData = self:GetFirstRewardInfoById(Ids[i])
      local Info = self:NewTempleContent(ItemData, i)
      table.insert(RewardsInfo, Info)
    end
    self.WidgetRewards:SetStarRewards(RewardsInfo, StarLevel, MaxTempleStar)
  else
    if nil ~= Ids[1] then
      local ItemDatas = RewardUtils:GetAllRewardByRewardId(Ids[1])
      local Rewards = {}
      self:RewardsAddToArray(Rewards, ItemDatas, false)
      self:SortRewardsArray(Rewards)
      RewardsInfo = Rewards
    end
    local Avatar = GWorld:GetAvatar()
    if not Avatar then
      error("Avatar is nil")
    end
    if Avatar.Dungeons[self.DungeonId] then
      local IsPass = Avatar.Dungeons[self.DungeonId].IsPass
      self.WidgetRewards:SetNoStarRewards(RewardsInfo, IsPass, self.IntervalTime, self.FirstDelayTime)
    end
  end
  self.WidgetRewards:SetVisibility(ESlateVisibility.Hidden)
  self.SizeBox_Rewards:AddChild(self.WidgetRewards)
  self.rewardItems = {
    self.WidgetRewards.Item01,
    self.WidgetRewards.Item02,
    self.WidgetRewards.Item03,
    self.WidgetRewards.Item_Repeat
  }
  self.WidgetRewards.Panel_RepeatReward:SetVisibility(ESlateVisibility.Collapsed)
  local Avatar = GWorld:GetAvatar()
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  if not Avatar or not GameState then
    return
  end
  if self.IsParty then
    local RewardInfo = DataMgr.Reward[7005]
    local Obj = NewObject(UIUtils.GetCommonItemContentClass())
    local RepeatRewardMultiplier = {
      [0] = 0,
      [1] = 1.0,
      [2] = 1.5,
      [3] = 2.0,
      [4] = 2.5
    }
    if nil ~= RewardInfo then
      Obj.ParentWidget = self
      Obj.Id = 101
      Obj.ItemType = "Resource"
      if DataMgr.Party[self.DungeonId] then
        if not self.CombatData.NumOfPlayers then
          Obj.Count = 0
        else
          Obj.Count = DataMgr.Party[self.DungeonId].RewardCoin[self.CombatData.StarLevel + 1] * RepeatRewardMultiplier[self.CombatData.NumOfPlayers]
        end
      else
        Obj.Count = 0
      end
      Obj.Icon = ItemUtils.GetItemIconPath(101, "Resource")
      Obj.Rarity = 1
      Obj.IsShowDetails = true
      Obj.bHasGot = false
      Obj.UIName = "DungeonSettlement"
      
      function Obj.AfterInitCallback(Widget)
        if self.IsAllowPropInAnimation and not Widget.Content.IsPlayedInAnimation then
          Widget:PlayInAnimation()
          Widget.Content.IsPlayedInAnimation = true
        else
          Widget:PlayAnimation(Widget.Normal_In, Widget.Normal_In:GetEndTime())
        end
      end
      
      Obj.OnMouseButtonUpEvents = {
        Obj = self,
        Callback = function()
          self.TempleNeedFocusItemIndex = 4
        end
      }
      self.WidgetRewards.Panel_RepeatReward:SetVisibility(ESlateVisibility.Visible)
      self.WidgetRewards.Item_Repeat:SetVisibility(ESlateVisibility.Visible)
      local Resource = DataMgr.GlobalConstant.PartyRewardDailyLimit.ConstantValue
      local Obtained = Avatar.TodayPartyReward or 0
      if Resource <= Obj.Count + Obtained then
        Obtained = Resource
        Obj.bHasGot = true
        UIManager(self):ShowUITip("CommonToastMain", "UI_Party_RewardCoin_OnLimit_Toast")
        self.WidgetRewards.Text_RepeatReward:SetText(string.format(GText("UI_Party_RewardCoin_OnLimit"), Obtained, Resource))
      else
        self.WidgetRewards.Text_RepeatReward:SetText(string.format(GText("UI_Party_RewardCoin"), Obtained, Resource))
      end
      self.WidgetRewards.Item_Repeat:Init(Obj)
      local ConfigData = {
        OwnerWidget = self.WidgetRewards,
        TextContent = GText("UI_Party_RewardDetail")
      }
      self.WidgetRewards.Btn_Qa:Init(ConfigData)
      self.WidgetRewards.Btn_Qa:SetVisibility(ESlateVisibility.Visible)
    end
  else
    local ConfigData = {
      OwnerWidget = self.WidgetRewards,
      TextContent = GText("UI_Temple_RewardDetail")
    }
    self.WidgetRewards.Btn_Qa:Init(ConfigData)
  end
end

function M:ShowTempleStars()
  if self.WidgetStar then
    self.WidgetStar:SetVisibility(ESlateVisibility.Visible)
    self.WidgetStar:PlayStarInAnim()
  end
end

function M:ShowTemplePoints()
  if self.WidgetPoints then
    self.WidgetPoints:SetVisibility(ESlateVisibility.Visible)
    self.WidgetPoints:PlayPointsInAnim()
  end
end

function M:ShowTempleRewards()
  if self.WidgetRewards then
    self.WidgetRewards:SetVisibility(ESlateVisibility.Visible)
    self.WidgetRewards:PlayRewardsInAnim()
  end
end

function M:GetFirstRewardInfoById(RewardId)
  local RewardInfo = {}
  local RewardData = DataMgr.Reward[RewardId]
  if not RewardData then
    return RewardInfo
  end
  local RewardTypes = RewardData.Type
  local RewardIds = RewardData.Id
  local RewardCounts = RewardData.Count
  if not (RewardTypes and RewardIds) or not RewardCounts then
    return RewardInfo
  end
  RewardInfo.Type = RewardTypes[1]
  RewardInfo.Id = RewardIds[1]
  RewardInfo.Count = RewardCounts[1][1]
  local ItemInfo = DataMgr[RewardInfo.Type][RewardInfo.Id]
  if ItemInfo then
    RewardInfo.Name = ItemInfo.Name or ItemInfo[RewardInfo.Type .. "Name"]
    RewardInfo.Rarity = ItemInfo.Rarity or ItemInfo[RewardInfo.Type .. "Rarity"]
  end
  return RewardInfo
end

function M:NewTempleContent(Content, index)
  local Obj = NewObject(UIUtils.GetCommonItemContentClass())
  if nil ~= Content then
    Obj.ParentWidget = self
    Obj.Id = Content.Id
    Obj.ItemType = Content.Type
    Obj.Count = Content.Count
    Obj.Icon = ItemUtils.GetItemIconPath(Content.Id, Content.Type)
    Obj.Rarity = Content.Rarity or 1
    Obj.IsShowDetails = true
    Obj.bHasGot = Content.IsGot or false
    Obj.UIName = "DungeonSettlement"
    Obj.bAsyncLoadIcon = true
    
    function Obj.AfterInitCallback(Widget)
      if self.IsAllowPropInAnimation and not Widget.Content.IsPlayedInAnimation then
        Widget:PlayInAnimation()
        Widget.Content.IsPlayedInAnimation = true
      else
        Widget:PlayAnimation(Widget.Normal_In, Widget.Normal_In:GetEndTime())
      end
      self:OpenTempleTipsBindEvents(Widget)
    end
    
    Obj.OnMouseButtonUpEvents = {
      Obj = self,
      Callback = function()
        self.TempleNeedFocusItemIndex = index
      end
    }
  end
  return Obj
end

function M:CalcTimeInfo(Time)
  local Hour = math.floor(Time / 3600)
  Time = Time % 3600
  local Minute = math.floor(Time / 60)
  local Second = math.floor(Time % 60)
  local FinalResult
  if Hour > 0 then
    FinalResult = string.format("%02d%s%02d%s", Hour, GText("UI_GameEvent_TimeRemain_Hour"), Minute, GText("UI_GameEvent_TimeRemain_Min"))
  else
    FinalResult = string.format("%02d%s%02d%s", Minute, GText("UI_GameEvent_TimeRemain_Min"), Second, GText("UI_GameEvent_TimeRemain_Sec"))
  end
  return FinalResult
end

function M:InitDeviceInfo()
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
  self.NavigateWidget = self.GameInputModeSubsystem:GetNavigateWidget()
  self.NavigateWidget:SetVisibility(ESlateVisibility.Collapsed)
  if IsValid(self.GameInputModeSubsystem) then
    self:RefreshOpInfoByInputDevice(self.GameInputModeSubsystem:GetCurrentInputType(), self.GameInputModeSubsystem:GetCurrentGamepadName())
  end
end

function M:InitListenEvent()
  if IsValid(self.GameInputModeSubsystem) then
    self.GameInputModeSubsystem.OnInputMethodChanged:Add(self, self.RefreshOpInfoByInputDevice)
  end
end

function M:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  if not self:HasFocusedDescendants() and not self:HasAnyUserFocus() then
    return
  end
  if self.CurInputDeviceType == CurInputDevice then
    DebugPrint("thy    \229\183\178\231\187\143\230\152\190\231\164\186\231\154\132\230\152\175\232\175\165\232\190\147\229\133\165\230\168\161\229\188\143\239\188\140\228\184\141\233\156\128\232\166\129\232\191\155\232\161\140\229\136\183\230\150\176")
    return
  end
  self.CurInputDeviceType = CurInputDevice
  self.CurGamepadName = CurGamepadName
  self.IsSwitchDevice = true
  self:UpdateMainUI()
end

function M:UpdateMainUI()
  if not self.IsNotFirstUpdateMainUI then
    self.IsNotFirstUpdateMainUI = true
    return
  end
  if not self.CurInputDeviceType then
    self.CurInputDeviceType = UIUtils.UtilsGetCurrentInputType()
  end
  if self.CurInputDeviceType == ECommonInputType.Touch then
    DebugPrint("thy    IsMoblie")
    return
  end
  if not self:HasFocusedDescendants() and not self:HasAnyUserFocus() then
    DebugPrint("ljl@ \229\183\178\232\129\154\231\132\166\232\135\179\228\184\138\231\186\167\231\149\140\233\157\162 \228\184\141\232\129\154\231\132\166\229\136\176\232\175\165\231\149\140\233\157\162")
    return
  end
  self:SetFocus()
  if self.CurInputDeviceType == ECommonInputType.MouseAndKeyboard then
    DebugPrint("thy   IsPC")
    self:UpdateMainUIWithPCOrMoble()
  else
    DebugPrint("thy   IsGamePad")
    self:UpdateMainUIWithGamePad()
  end
end

function M:SetFocusInGamePad()
  DebugPrint("jly Set Focus In GamePad")
  if self:IsAnimationPlaying(self.Defeat_In) or self:IsAnimationPlaying(self.Victory_In) then
    DebugPrint("jly Set Focus In GamePad, but animation is playing")
    return
  end
  if self.IsTemple then
    if self.IsStarLevel then
      if self.TempleNeedFocusItemIndex then
        local Item = self.rewardItems[self.TempleNeedFocusItemIndex]
        Item:SetFocus()
      else
        self.rewardItems[1]:SetFocus()
      end
    else
      self.WidgetRewards.List_Reward:SetFocus()
    end
    return
  end
  if 0 == #self.SpRewardsArray then
    if 0 ~= #self.RewardsArray then
      if self.TileView_Prop:GetItemAt(0) and self.TileView_Prop:GetItemAt(0).SelfWidget then
        self:SetFoucsOnTileView(self.TileView_Prop)
      else
        self:SetFocusOnTileViewDelay(self.TileView_Prop)
      end
    else
      self:SetFocus()
      self.GameInputModeSubsystem:UpdateCurrentFocusWidgetPos()
      self.NavigateWidget:SetVisibility(ESlateVisibility.Collapsed)
    end
  else
    if self.TileView_Reward:GetItemAt(0) and self.TileView_Reward:GetItemAt(0).SelfWidget then
      self:SetFoucsOnTileView(self.TileView_Reward)
    else
      self:SetFocusOnTileViewDelay(self.TileView_Reward)
    end
    if 0 == #self.RewardsArray then
      self.TileView_Prop.bIsFocusable = true
    end
  end
  self:UpdateBottomTabsInfo(GText("UI_Controller_CheckDetails"))
end

function M:SetFocusOnTileViewDelay(TileView)
  self:AddTimer(0.1, function()
    DebugPrint("jly Focus On TileView Delay")
    if self:IsAnimationPlaying(self.Defeat_In) or self:IsAnimationPlaying(self.Victory_In) then
      DebugPrint("jly Focus On TileView Delay, but animation is playing")
      return
    end
    local ItemContent = TileView:GetItemAt(0)
    if ItemContent and ItemContent.SelfWidget then
      self.NavigateWidget:SetVisibility(ESlateVisibility.Visible)
      TileView.bIsFocusable = true
      TileView:SetFocus()
      TileView:SetSelectedIndex(0)
      local item = ItemContent.SelfWidget
      item:StopAllAnimations()
      item:PlayAnimation(item.Hover)
      self:RemoveTimer("SetFocusInGamePad")
    end
  end, true, 0.5, "SetFocusInGamePad")
end

function M:SetFoucsOnTileView(TileView)
  self.NavigateWidget:SetVisibility(ESlateVisibility.Visible)
  TileView.bIsFocusable = true
  TileView:SetFocus()
  TileView:SetSelectedIndex(0)
  local item = TileView:GetItemAt(0).SelfWidget
  item:StopAllAnimations()
  item:PlayAnimation(item.Hover)
end

function M:UpdateBottomTabsInfo(ATipName, BTipName)
  if self.CurInputDeviceType ~= ECommonInputType.Gamepad then
    return
  end
  if ATipName then
    local KeyInfo1 = {
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "A"}
      },
      Desc = ATipName
    }
    self.Key_Confirm:SetVisibility(ESlateVisibility.Visible)
    self.Key_Confirm:CreateCommonKey(KeyInfo1)
  else
    self.Key_Confirm:SetVisibility(ESlateVisibility.Collapsed)
  end
  if BTipName then
    local KeyInfo2 = {
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "B"}
      },
      Desc = BTipName
    }
    self.Key_Cancel:SetVisibility(ESlateVisibility.Visible)
    self.Key_Cancel:CreateCommonKey(KeyInfo2)
  else
    self.Key_Cancel:SetVisibility(ESlateVisibility.Collapsed)
  end
  if ATipName or BTipName then
    self.Panel_Controller:SetVisibility(ESlateVisibility.Visible)
  else
  end
end

function M:UpdateMainUIWithGamePad()
  if self.CurInputDeviceType ~= ECommonInputType.Gamepad then
    return
  end
  if not self.IsFirstFocus then
    self:SetFocusInGamePad()
  end
  if self.Switch_Mode then
    self.Switch_Mode:SetActiveWidgetIndex(1)
  end
  local KeyInfo = {
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "Menu"}
    }
  }
  self.Icon_Key_Data:CreateCommonKey(KeyInfo)
  local Params = {
    ResourceId = 103,
    bShowDenominator = true,
    CostText = nil,
    Denominator = self.DungeonCost,
    Numerator = self.CurActionPoint,
    KeyIconName = "LS",
    Owner = self
  }
  self.Cost:InitContent(Params)
  self.Btn_Continue:SetDefaultGamePadImg("Y")
  self.Btn_Close:SetDefaultGamePadImg("B")
  self.Refund:Show()
  self.Refund:UpdateGamePadIcon("RS")
  local KeyInfo2 = {
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "RH"}
    },
    Desc = GText("UI_DynInteract_1")
  }
  self.Icon_Key_FailTips:CreateCommonKey(KeyInfo2)
  if not self.IsWin and CommonUtils.Size(DataMgr.FailureGuidance) > 7 then
    if self.Controller_FailTips then
      self.Controller_FailTips:SetVisibility(ESlateVisibility.Visible)
    end
  elseif self.Controller_FailTips then
    self.Controller_FailTips:SetVisibility(ESlateVisibility.Collapsed)
  end
  self.Panel_Controller:SetVisibility(ESlateVisibility.Visible)
  if not self.IsTemple then
    if #self.SpRewardsArray > 0 or #self.RewardsArray > 0 then
      self:UpdateBottomTabsInfo(GText("UI_Controller_CheckDetails"))
    else
      self:UpdateBottomTabsInfo()
    end
    for i = 0, self.TileView_Reward:GetNumItems() - 1 do
      local Item = self.TileView_Reward:GetItemAt(i)
      if Item and Item.SelfWidget then
        Item.SelfWidget:SetNavigationRuleExplicit(EUINavigation.Down, self.TileView_Prop)
      end
    end
  else
    self:UpdateBottomTabsInfo(GText("UI_Controller_CheckDetails"))
    self.WidgetRewards.Key_Controller_Qa:SetVisibility(ESlateVisibility.Visible)
    self.WidgetRewards.Key_Controller_Qa:CreateCommonKey({
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "RS"}
      }
    })
    local lastItem
    for i, currentItem in ipairs(self.rewardItems) do
      if currentItem then
        if lastItem then
          lastItem:SetNavigationRuleExplicit(EUINavigation.Right, currentItem)
          currentItem:SetNavigationRuleExplicit(EUINavigation.Left, lastItem)
        else
          currentItem:SetNavigationRuleBase(EUINavigation.Left, EUINavigationRule.Stop)
        end
        local nextItem = self.rewardItems[i + 1]
        if not nextItem then
          currentItem:SetNavigationRuleBase(EUINavigation.Right, EUINavigationRule.Stop)
        end
        lastItem = currentItem
      end
    end
  end
  if self.WBP_Chat_CommonEnter and self.WBP_Chat_CommonEnter.IsShowGamePad then
    self.WBP_Chat_CommonEnter:IsShowGamePad(true)
  end
end

function M:UpdateMainUIWithPCOrMoble()
  if self.Switch_Mode then
    self.Switch_Mode:SetActiveWidgetIndex(0)
  end
  local Params = {
    ResourceId = 103,
    bShowDenominator = true,
    CostText = nil,
    Denominator = self.DungeonCost,
    Numerator = self.CurActionPoint,
    KeyIconName = nil,
    Owner = self
  }
  self.Cost:InitContent(Params)
  self.Refund:UpdateGamePadIcon("None")
  if self.Controller_FailTips then
    self.Controller_FailTips:SetVisibility(ESlateVisibility.Collapsed)
  end
  self.Refund:Hide()
  if self.IsSwitchDevice and self.Panel_Controller then
    self.Panel_Controller:SetVisibility(ESlateVisibility.Collapsed)
  else
    self:UpdateBottomTabsInfo()
  end
  if self.IsTemple and self.WidgetRewards.Key_Controller_Qa then
    self.WidgetRewards.Key_Controller_Qa:SetVisibility(ESlateVisibility.Collapsed)
  end
  if self.WBP_Chat_CommonEnter and self.WBP_Chat_CommonEnter.IsShowGamePad then
    self.WBP_Chat_CommonEnter:IsShowGamePad(false)
  end
  DebugPrint("thy     Update PC")
end

function M:UpdateMainUIInGamePadClick()
  if self.Switch_Mode then
    self.Switch_Mode:SetActiveWidgetIndex(0)
  end
  self.Cost.Key:SetVisibility(ESlateVisibility.Collapsed)
  self.Btn_Continue:SetGamePadVisibility(UIConst.VisibilityOp.Collapsed)
  self.Btn_Continue:SetIconPanelVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  self.Btn_Close:SetGamePadVisibility(UIConst.VisibilityOp.Collapsed)
  self.Btn_Close:SetIconPanelVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  if self.Controller_FailTips then
    self.Controller_FailTips:SetVisibility(ESlateVisibility.Collapsed)
  end
  self.Refund:Hide()
  if self.Key_Confirm then
    self.Key_Confirm:SetVisibility(ESlateVisibility.Collapsed)
  end
  if self.Key_Cancel then
    self.Key_Cancel:SetVisibility(ESlateVisibility.Collapsed)
  end
end

function M:SwitchMainUIPCToGamePad()
  if self.Switch_Mode then
    self.Switch_Mode:SetActiveWidgetIndex(1)
  end
  local KeyInfo = {
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "Menu"}
    }
  }
  if self.Icon_Key_Data then
    self.Icon_Key_Data:CreateCommonKey(KeyInfo)
  end
  self.Cost.Key:SetVisibility(ESlateVisibility.Visible)
  self.Btn_Continue:SetGamePadVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  self.Btn_Continue:SetIconPanelVisibility(UIConst.VisibilityOp.Collapsed)
  self.Btn_Close:SetGamePadVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  self.Btn_Close:SetIconPanelVisibility(UIConst.VisibilityOp.Collapsed)
  self.Refund:Show()
  if not self.IsWin and CommonUtils.Size(DataMgr.FailureGuidance) > 7 then
    if self.Controller_FailTips then
      self.Controller_FailTips:SetVisibility(ESlateVisibility.Visible)
    end
  elseif self.Controller_FailTips then
    self.Controller_FailTips:SetVisibility(ESlateVisibility.Collapsed)
  end
  if not self.IsTemple then
    if #self.SpRewardsArray > 0 or #self.RewardsArray > 0 then
      self:UpdateBottomTabsInfo(GText("UI_Controller_CheckDetails"))
    else
      self:UpdateBottomTabsInfo()
    end
  end
end

function M:Handle_OnPCDown(InKeyName)
  DebugPrint("thy   Handle_OnPCDown", InKeyName)
  if InKeyName == DataMgr.KeyboardText.Enter.Key then
    self.WBP_Chat_CommonEnter:OnClick()
    return true
  elseif "Escape" == InKeyName then
    return true
  end
  return false
end

function M:Handle_OnGamePadDown(InKeyName)
  if self.IsTemple then
    if "Gamepad_FaceButton_Top" == InKeyName then
      self.Btn_Continue:OnBtnClicked()
      return true
    elseif "Gamepad_FaceButton_Right" == InKeyName then
      if self.IsFocusInTips and self.WidgetRewards.Key_Controller_Qa then
        self.WidgetRewards.Key_Controller_Qa:SetVisibility(ESlateVisibility.Visible)
        self:SetFocusInGamePad()
        self.IsFocusInTips = false
        self.WidgetRewards.Btn_Qa:CloseMenuAnchor()
        self:UpdateBottomTabsInfo(GText("UI_Controller_CheckDetails"))
      else
        self.Btn_Close:OnBtnClicked()
        return true
      end
      return true
    elseif "Gamepad_RightThumbstick" == InKeyName then
      self.IsFocusInTips = true
      if self.WidgetRewards.Key_Controller_Qa then
        self.WidgetRewards.Key_Controller_Qa:SetVisibility(ESlateVisibility.Collapsed)
      end
      local PlayerController = self:GetOwningPlayer()
      for i, item in ipairs(self.rewardItems) do
        if item and item:HasUserFocus(PlayerController) then
          self.TempleNeedFocusItemIndex = i
          break
        end
      end
      self.WidgetRewards.Btn_Qa:SetFocus()
      self.WidgetRewards.Btn_Qa:OpenMenuAnchor()
      self:UpdateBottomTabsInfo(nil, GText("UI_Tips_Close"))
      return true
    end
    return false
  end
  DebugPrint("thy    Handle_OnGamePadDown", InKeyName)
  if "Gamepad_FaceButton_Top" == InKeyName then
    self.Btn_Continue:OnBtnClicked()
    return true
  elseif "Gamepad_Special_Right" == InKeyName then
    if UIManager(self):GetUIObj("CommonDialog") then
      return
    end
    self:OnBtnChangePanelClicked()
    return true
  elseif "Gamepad_RightThumbstick" == InKeyName then
    if not self.IsWin then
      if self.Refund:GetFocusState() then
        self.IsInRefund = false
        self.Refund:CancelItemListFocus()
        self:SetFocusInGamePad()
        self:SwitchMainUIPCToGamePad()
        return true
      end
      self.IsInRefund = true
      self.NavigateWidget:SetVisibility(ESlateVisibility.Visible)
      self.Refund:SetItemListFocus()
      self:UpdateMainUIInGamePadClick()
      self:UpdateBottomTabsInfo(GText("UI_Controller_CheckDetails"), GText("UI_Tips_Close"))
    end
    return true
  elseif "Gamepad_FaceButton_Right" == InKeyName then
    if not self.IsInRefund then
      self.Btn_Close:OnBtnClicked()
      return true
    end
    if not self.IsWin and self.Refund:GetFocusState() then
      self.IsInRefund = false
      self.Refund:CancelItemListFocus()
      self:SetFocusInGamePad()
    end
    self:UpdateBottomTabsInfo(GText("UI_Tips_Ensure"), GText("UI_Tips_Close"))
    self:SwitchMainUIPCToGamePad()
    return true
  elseif "Gamepad_LeftThumbstick" == InKeyName then
    self.Cost:OpenTip()
    self:UpdateMainUIInGamePadClick()
    return true
  elseif "Gamepad_RightStick_Right" == InKeyName then
    if self.FailTipsNum then
      self.CurFailTipIndex = math.min(self.CurFailTipIndex + 1, self.FailTipsNum)
      self.FailTips.List_Tips:NavigateToIndex(self.CurFailTipIndex)
    end
    return true
  elseif "Gamepad_RightStick_Left" == InKeyName then
    if self.FailTipsNum then
      self.CurFailTipIndex = math.max(self.CurFailTipIndex - 1, 0)
      self.FailTips.List_Tips:NavigateToIndex(self.CurFailTipIndex)
    end
    return true
  end
  if InKeyName == Const.GamepadSpecialLeft then
    if self.WBP_Chat_CommonEnter then
      if self.WBP_Chat_CommonEnter.ControllerKeyImg then
        self.WBP_Chat_CommonEnter.ControllerKeyImg:OnButtonPressed()
      else
        self.WBP_Chat_CommonEnter:OnClick()
      end
    end
    return true
  end
  return false
end

function M:OnKeyDown(MyGeometry, InKeyEvent)
  local IsEventHandled = false
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) then
    DebugPrint("thy    Key_IsGamepadKey", InKeyName)
    IsEventHandled = self:Handle_OnGamePadDown(InKeyName)
  else
    DebugPrint("thy    Key_IsPC", InKeyName)
    IsEventHandled = self:Handle_OnPCDown(InKeyName)
  end
  if IsEventHandled then
    return UE4.UWidgetBlueprintLibrary.Handled()
  else
    return UE4.UWidgetBlueprintLibrary.UnHandled()
  end
end

function M:OnKeyUp(MyGeometry, InKeyEvent)
  local IsEventHandled = false
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if InKeyName == Const.GamepadSpecialLeft then
    if self.WBP_Chat_CommonEnter and self.WBP_Chat_CommonEnter.ControllerKeyImg then
      self.WBP_Chat_CommonEnter.ControllerKeyImg:OnButtonReleased()
    end
    IsEventHandled = true
  end
  if IsEventHandled then
    return UE4.UWidgetBlueprintLibrary.Handled()
  else
    return UE4.UWidgetBlueprintLibrary.UnHandled()
  end
end

function M:OnTeamMatchTimingStart()
  self.Btn_Continue:ForbidBtn(true)
end

function M:OnTeamMatchTimingEnd()
  self.Btn_Continue:ForbidBtn(false)
end

function M:TryEnterDungeonAgain()
  DebugPrint("gmy@WBP_DungeonSettlement_C M:TryEnterDungeonAgain")
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  if nil == self.DungeonId then
    return
  end
  local bIsSolo = self:IsSolo()
  local bIsStandAloneSolo = self:IsStandAloneSolo()
  local DungeonData = DataMgr.Dungeon[self.DungeonId]
  local bNeedTicket = DungeonData.TicketId and 0 ~= #DungeonData.TicketId or DungeonData.NoTicketEnter
  DebugPrint("gmy@WBP_DungeonSettlement_C M:TryEnterDungeonAgain", bIsSolo, bIsStandAloneSolo, bNeedTicket)
  if bIsStandAloneSolo and bNeedTicket then
    self:OpenTicketDialog()
  elseif bIsSolo then
    if bNeedTicket then
      Avatar:EnterDungeonAgain(function(Ret)
        DebugPrint("gmy@WBP_DungeonSettlement_C M:EnterDungeonAgain Callback1", Ret)
      end)
    else
      Avatar:EnterDungeonAgain(function(Ret)
        DebugPrint("gmy@WBP_DungeonSettlement_C M:EnterDungeonAgain Callback2", Ret)
        if Ret == ErrorCode.RET_SUCCESS then
          UIManager(self):LoadUINew("DungeonMatchTimingBar", self.DungeonId, Const.DUNGEON_MATCH_BAR_STATE.WAITING_MATCHING_WITH_CANCEL, true)
        end
      end)
    end
  else
    Avatar:EnterDungeonAgain(function(Ret)
      DebugPrint("gmy@WBP_DungeonSettlement_C M:EnterDungeonAgain Callback", Ret)
      if Ret == ErrorCode.RET_SUCCESS then
        UIManager(self):LoadUINew("DungeonMatchTimingBar", self.DungeonId, Const.DUNGEON_MATCH_BAR_STATE.SPONSOR_WAITING_CONFIRM, false)
      end
    end)
  end
end

function M:IsSolo()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return true
  end
  return not Avatar:IsInMultiSettlement()
end

function M:IsStandAloneSolo()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return true
  end
  return Avatar.SettlementUidArray == nil
end

function M:OpenTicketDialog(DungeonId)
  local CommonDialog = UIManager(self):ShowCommonPopupUI(100123, {
    DungeonId = self.DungeonId,
    RightCallbackObj = self,
    RightCallbackFunction = function(Obj, PackageData)
      local Avatar = GWorld:GetAvatar()
      Avatar:EnterDungeonAgain(function(Ret)
        DebugPrint("gmy@WBP_DungeonSettlement_C M:OpenTicketDialog Callback", Ret)
      end, PackageData.Content_1.TicketId)
    end,
    ForbiddenRightCallbackObj = self,
    AutoFocus = true
  }, self)
end

function M:BP_GetDesiredFocusTarget()
  DebugPrint("ljl@ BP_GetDesiredFocusTarget")
  if self.CurInputDeviceType == ECommonInputType.Gamepad then
    self:SetFocusInGamePad()
  end
  return
end

AssembleComponents(M)
return M
