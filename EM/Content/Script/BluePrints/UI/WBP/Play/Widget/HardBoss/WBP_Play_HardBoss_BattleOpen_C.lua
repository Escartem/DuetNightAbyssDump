local M = Class({
  "BluePrints.UI.BP_UIState_C"
})

function M:Construct()
  M.Super.Construct(self)
end

function M:Destruct()
  M.Super.Destruct(self)
end

function M:OnLoaded(...)
  self.Super.OnLoaded(self)
  local EnableFadeIn, EnableSkip, SkipObj, SkipFunc = ...
  self:ListenForInputAction("TalkSkip", EInputEvent.IE_Pressed, false, {
    self,
    self.OnSkipKeyPressed
  })
  self:ListenForInputAction("TalkSkip", EInputEvent.IE_Released, false, {
    self,
    self.OnSkipKeyReleased
  })
  self.TitleWidget = nil
  self:InitBossInfo()
  self:InitSkipInfo()
  self:PlayInAnimation(EnableFadeIn)
  self:AddSkipSucceedLogic(SkipObj, SkipFunc)
  if not EnableSkip then
    self:HideSkipBlock()
  end
end

function M:Close()
  self:StopListeningForInputAction("TalkSkip", EInputEvent.IE_Pressed)
  self:StopListeningForInputAction("TalkSkip", EInputEvent.IE_Released)
  self.Super.Close(self)
end

function M:InitBossInfo()
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  if not GameState then
    DebugPrint(string.format("Error: %s init boss info failed, GameState is nil", self:GetName()))
    return
  end
  local HardBossInfo = GameState.HardBossInfo
  if not HardBossInfo then
    DebugPrint(string.format("Error: %s init boss info failed, HardBossInfo is nil", self:GetName()))
    return
  end
  local HardBossMainId = HardBossInfo.BossBattleId
  if not HardBossMainId then
    DebugPrint(string.format("Error: %s init boss info failed, HardBossMainId is nil", self:GetName()))
    return
  end
  local HardBossDifficultyId = HardBossInfo.DifficultyId
  if not HardBossDifficultyId then
    DebugPrint(string.format("Error: %s init boss info failed, HardBossDifficultyId is nil", self:GetName()))
    return
  end
  local HardBossMainData = DataMgr.HardBossMain[HardBossMainId]
  if not HardBossMainData then
    DebugPrint(string.format("Error: %s init boss info failed, HardBossMainData is nil", self:GetName()))
    return
  end
  local MonsterData = DataMgr.Monster[HardBossMainData.MonsterId]
  if not MonsterData then
    DebugPrint(string.format("Error: %s init boss info failed, MonsterData is nil", self:GetName()))
    return
  end
  local HardBossDifficultyData = DataMgr.HardBossDifficulty[HardBossDifficultyId]
  if not HardBossDifficultyData then
    DebugPrint(string.format("Error: %s init boss info failed, HardBossDifficultyData is nil", self:GetName()))
    return
  end
  if not self.TitleAnchor then
    DebugPrint(string.format("Error: %s init boss info failed, TitleAnchor is nil", self:GetName()))
    return
  end
  local TitleWidget = UIManager(self):_CreateWidgetNew(HardBossMainData.OpenTitleWidgetName)
  if not TitleWidget then
    DebugPrint(string.format("Error: %s init boss info failed, TitleWidget is nil", self:GetName()))
    return
  end
  local BossName = GText(MonsterData.UnitName)
  local ProcessUnitNameSet = {Mon_Name_8505001 = true, Mon_Name_8512001 = true}
  
  local function utf8_chars(str)
    if type(str) ~= "string" then
      return {}
    end
    local t = {}
    for uchar in str:gmatch("[\000-\127\194-\244][\128-\191]*") do
      table.insert(t, uchar)
    end
    return t
  end
  
  if type(BossName) == "string" and ProcessUnitNameSet[MonsterData.UnitName] then
    local chars = utf8_chars(BossName)
    local charCount = #chars
    if charCount >= 2 and "\226\128\156" == chars[1] and "\226\128\157" == chars[charCount] then
      local newChars = {}
      for i = 2, charCount - 1 do
        table.insert(newChars, chars[i])
      end
      BossName = table.concat(newChars)
    end
  end
  local LevelType = GText(HardBossDifficultyData.DifficultyDesOpen)
  local LevelNum = string.format("%s%s", GText("BATTLE_UI_BLOOD_LV"), HardBossDifficultyData.DifficultyLevel)
  TitleWidget:SetBossENNameVisibilityByLanguage(CommonConst.SystemLanguage)
  TitleWidget:SetBossName(BossName)
  TitleWidget:SetLevelType(LevelType)
  TitleWidget:SetLevelNum(LevelNum)
  TitleWidget:Hide()
  self.TitleWidget = TitleWidget
  self.TitleAnchor:AddChild(TitleWidget)
end

function M:InitSkipInfo()
  self.Key_Back:CreateCommonKey({
    KeyInfoList = {
      {
        Type = "Text",
        Text = GText("SpaceBar")
      }
    },
    bLongPress = true,
    Desc = GText("UI_TALK_SKIP")
  })
  self.Key_Back:AddExecuteLogic(self, self.OnSkipSucceed)
end

function M:OnSkipKeyPressed()
  self.Key_Back:OnShortCutPressed()
end

function M:OnSkipKeyReleased()
  self.Key_Back:OnShortCutReleased()
end

function M:OnSkipSucceed()
  if self.SkipSucceedObject and self.SkipSucceedObjectFunc then
    self.SkipSucceedObjectFunc(self.SkipSucceedObject)
  end
end

function M:AddSkipSucceedLogic(Object, ObjectFunc)
  self.SkipSucceedObject = Object
  self.SkipSucceedObjectFunc = ObjectFunc
end

function M:HideSkipBlock()
  self.Key_Back:DisableKey()
  self.Key_Back:SetVisibility(UE4.ESlateVisibility.Collapsed)
end

function M:ShowHardBossTitle(bIsShow)
  if not self.TitleWidget then
    return
  end
  if bIsShow then
    self.TitleWidget:Show()
    AudioManager(self):PlayUISound(self, "event:/ui/common/boss_show", nil, nil)
  else
    self.TitleWidget:Hide()
  end
end

function M:PlayInAnimation(EnableFadeIn)
  if EnableFadeIn then
    self:PlayAnimation(self.In)
  end
end

return M
