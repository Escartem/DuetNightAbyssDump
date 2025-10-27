local FEntertainmentUtils = require("BluePrints.UI.WBP.Entertainment.EntertainmentUtils")
local EEntertainmentState = FEntertainmentUtils.EEntertainmentState
local EntertainmentModel = require("BluePrints.UI.WBP.Entertainment.EntertainmentModel")
local Component = Class()

function Component:OnInitialize()
  self.CharacterStaticCreatorId = 777
  self.CharacterStaticCreator = nil
end

function Component:OnConstruct()
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  assert(GameState)
  self.CharacterStaticCreator = GameState.StaticCreatorMap:Find(self.CharacterStaticCreatorId)
  self.WaitProcess = EntertainmentModel:TryGetWaitQueue()
  self.BlackScreenList = {}
end

function Component:OnDestruct()
  local BlackScreenList = self.BlackScreenList
  self.BlackScreenList = nil
  local UIManager = UIManager(self)
  if not IsValid(UIManager) then
    return
  end
  for Key, BlackScreen in pairs(BlackScreenList) do
    UIManager:HideCommonBlackScreen(BlackScreen)
  end
end

function Component:ActiveStaticCreator(StaticCreator)
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  if IsValid(GameMode) == false then
    return
  end
  local StaticIds = TArray(0)
  StaticIds:Add(StaticCreator.StaticCreatorId)
  GameMode:TriggerActiveStaticCreator(StaticIds)
end

function Component:DactiveStaticCreator(StaticCreator)
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  if IsValid(GameMode) == false then
    return
  end
  local StaticIds = TArray(0)
  StaticIds:Add(StaticCreator.StaticCreatorId)
  GameMode:TriggerInactiveStaticCreator(StaticIds)
end

function Component:LoadNpcAsync(NpcId, Callback)
  self.WaitProcess:AddProcess(function(OnFinished)
    self:SetInteractionEnabled(false)
    
    local function OnFinal(Character)
      self:SetInteractionEnabled(true)
      if IsValid(self) then
        Callback(Character)
      end
      OnFinished()
    end
    
    local GameState = UE4.UGameplayStatics.GetGameState(GWorld.GameInstance)
    if not GameState then
      UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "\233\130\128\231\186\166\231\179\187\231\187\159\233\148\153\232\175\175", "\232\142\183\229\143\150 NPC \229\164\177\232\180\165\239\188\140game state \228\184\186\231\169\186\227\128\130")
      OnFinal(nil)
      return
    end
    if not GameState.GetNpcInfoAsync then
      UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "\233\130\128\231\186\166\231\179\187\231\187\159\233\148\153\232\175\175", string.format("\232\142\183\229\143\150 NPC \229\164\177\232\180\165\239\188\140game state\239\188\154%s\230\156\170\229\174\158\231\142\176 GetNpcInfoAsync \230\150\185\230\179\149\227\128\130", GameState:GetClass().Name))
      OnFinal(nil)
      return
    end
    GameState:GetNpcInfoAsync(NpcId, function(Res)
      if Res then
        OnFinal(Res)
        return
      end
      self.CharacterStaticCreator.UnitId = NpcId
      self:ActiveStaticCreator(self.CharacterStaticCreator)
      GameState:GetNpcInfoAsync(NpcId, OnFinal)
    end)
  end)
  self.WaitProcess:ApplyTask()
end

function Component:DestoryNpc(NpcId, Callback)
  self.WaitProcess:AddProcess(function(OnFinished)
    self:DactiveStaticCreator(self.CharacterStaticCreator)
    if IsValid(self) then
      Callback()
    end
    OnFinished()
  end)
  self.WaitProcess:ApplyTask()
end

function Component:StartFadeIn(FadeInTime, FadeOutTime, Callback)
  local UIManager = UIManager(self)
  if not IsValid(UIManager) then
    Callback()
    return
  end
  local Key = self.BlackScreenList.LastKey or 0
  Key = Key + 1
  self.BlackScreenList.LastKey = Key
  self.WaitProcess:AddProcess(function(OnFinished)
    local BlackScreen
    self:SetInteractionEnabled(false)
    BlackScreen = UIManager:ShowCommonBlackScreen({
      InAnimationObj = self,
      InAnimationCallback = function(obj)
        self:SetInteractionEnabled(false)
        if IsValid(obj) then
          Callback()
        end
        OnFinished()
      end,
      InAnimationPlayTime = FadeInTime,
      OutAnimationPlayTime = FadeOutTime
    })
    self.BlackScreenList[Key] = BlackScreen
  end)
  self.WaitProcess:ApplyTask()
  return Key
end

function Component:WaitTime(Duration, Callback)
  self.WaitProcess:AddProcess(function(OnFinished)
    self:AddTimer(Duration + 0.001, function()
      if IsValid(self) then
        Callback()
      end
      OnFinished()
    end)
  end)
  self.WaitProcess:ApplyTask()
end

function Component:StartFadeOut(Key, Callback)
  local UIManager = UIManager(self)
  if not IsValid(UIManager) then
    Callback()
    return
  end
  local BlackScreenList = self.BlackScreenList
  self.WaitProcess:AddProcess(function(OnFinished)
    local BlackScreen = BlackScreenList[Key]
    BlackScreenList[Key] = nil
    if BlackScreen then
      UIManager:HideCommonBlackScreen(BlackScreen)
    end
    if IsValid(self) then
      Callback()
    end
    OnFinished()
  end)
  self.WaitProcess:ApplyTask()
end

function Component:EnterInvitation(CharacterId, TopicLevel, bIsReview, CallBack)
  self.WaitProcess:AddProcess(function(OnFinished)
    self:SetInteractionEnabled(false)
    self:SetShowCharacterActionWithState(EEntertainmentState.Invitation)
    self:AddTimer(self.EnterInvitationDelaySeconds, function()
      if IsValid(self.GameInputModeSubsystem) then
        self.GameInputModeSubsystem:SetNavigateWidgetVisibility(false)
      end
      local SojournsGameInstanceSubsystem = UE4.USojournsGameInstanceSubsystem.GetSubsystem(self)
      if not SojournsGameInstanceSubsystem then
        if IsValid(self) then
          CallBack(false)
        end
        OnFinished()
        return
      end
      SojournsGameInstanceSubsystem:BeginInvitation(CharacterId, TopicLevel, bIsReview, function()
        if IsValid(self) then
          CallBack(false)
        end
        OnFinished()
      end, function()
        if IsValid(self) then
          CallBack(true)
        end
        OnFinished()
      end)
    end)
  end)
  self.WaitProcess:ApplyTask()
end

function Component:RealEnterInvitation()
  self.WaitProcess:AddProcess(function(OnFinished)
    local SojournsGameInstanceSubsystem = UE4.USojournsGameInstanceSubsystem.GetSubsystem(self)
    if not SojournsGameInstanceSubsystem then
      OnFinished()
      return
    end
    SojournsGameInstanceSubsystem:RealBeginInvitation()
  end)
  self.WaitProcess:ApplyTask()
end

return Component
