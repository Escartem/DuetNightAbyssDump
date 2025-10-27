require("UnLua")
local M = Class()

function M:ReceiveBeginPlay()
  local PlatformName = UE4.UUIFunctionLibrary.GetDevicePlatformName(self)
  if "Android" == PlatformName or "IOS" == PlatformName then
    self.bMeshLodBudgetEnable = true
  else
    self.bMeshLodBudgetEnable = false
  end
  self.bHiddenBudgetEnable = true
  self.IsNPC = true
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  if GameInstance then
    local TalkContext = GameInstance:GetTalkContext()
    if IsValid(TalkContext) then
      TalkContext:RecordCustomNPCInfo(self, true)
    end
  end
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  GameState.CustomNpcSet:Add(self)
  GameState:RecordNpcEntity(self, true)
  EventManager:AddEvent(EventID.SetCustomNpcFlexibShowOrHideDynamic, self, self.SetCustomNpcFlexibShowOrHide)
  self:SetCustomNpcFlexibShowOrHide()
  EventManager:AddEvent(EventID.CloseLoading, self, self.ResetLocation)
  self.IsDestroied = false
  if self.LightBubbleTalkSetting then
    local HeadUISubsystem = UNpcHeadUISubsystem.GetHeadUISubsystem(self)
    if HeadUISubsystem and HeadUISubsystem.LightBubbleTalkMgr then
      HeadUISubsystem.LightBubbleTalkMgr:RegisterTalkCharacter(self, self.LightBubbleTalkSetting)
    end
  end
  self.Overridden.ReceiveBeginPlay(self)
end

function M:ResetLocation()
  local SpawnPos = self:K2_GetActorLocation()
  local HalfHeight = self.CapsuleComponent:GetScaledCapsuleHalfHeight()
  local MeshOffsetZ = -self.Mesh.RelativeLocation.Z
  if HalfHeight < MeshOffsetZ and MeshOffsetZ < HalfHeight + 5 then
    HalfHeight = MeshOffsetZ
  end
  local Start = SpawnPos + FVector(0, 0, HalfHeight)
  local End = SpawnPos + FVector(0, 0, -500)
  local HitResult = FHitResult()
  local Ret = UE4.UKismetSystemLibrary.LineTraceSingle(self, Start, End, ETraceTypeQuery.TraceScene, true, nil, 0, HitResult, true)
  if Ret then
    DebugPrint("CustomNPC\229\141\138\233\171\152\239\188\154", HalfHeight, "\230\137\147\228\184\173\228\189\141\231\189\174\239\188\154", HitResult.ImpactPoint, "\230\137\147\228\184\173\231\155\174\230\160\135\239\188\154", HitResult.Actor:GetName(), "Pawn\229\144\141\229\173\151\239\188\154", self:GetName(), "============sssss================")
    local SurfacePos = FVector(HitResult.ImpactPoint.X, HitResult.ImpactPoint.Y, HitResult.ImpactPoint.Z + HalfHeight)
    self:K2_SetActorLocation(SurfacePos, false, nil, false)
    if math.abs(HitResult.ImpactPoint.Z - SpawnPos.Z) > HalfHeight * 2 then
      Utils.ScreenPrint("CustomNPC\233\157\153\230\128\129\229\136\183\230\150\176\231\130\185\228\189\141\231\189\174\229\188\130\229\184\184,Pawn\229\144\141\229\173\151\239\188\154" .. self:GetName() .. " SpawnPos.Z\239\188\154" .. SpawnPos.Z .. " ImpactPoint.Z:" .. HitResult.ImpactPoint.Z)
    end
  end
end

function M:ReceiveEndPlay()
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  if GameInstance then
    local TalkContext = GameInstance:GetTalkContext()
    if IsValid(TalkContext) then
      TalkContext:RemoveCustomNPCInfo(self)
    end
  end
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  GameState.CustomNpcSet:Remove(self)
  GameState:RecordNpcEntity(self, false)
  EventManager:RemoveEvent(EventID.SetCustomNpcFlexibShowOrHideDynamic, self)
  EventManager:RemoveEvent(EventID.CloseLoading, self)
  self.IsDestroied = true
  if self.LightBubbleTalkSetting and self.LightBubbleTalkSetting.EnableBubbleTalk then
    local HeadUISubsystem = UNpcHeadUISubsystem.GetHeadUISubsystem(self)
    if HeadUISubsystem and HeadUISubsystem.LightBubbleTalkMgr then
      HeadUISubsystem.LightBubbleTalkMgr:UnregisterTalkCharacter(self)
    end
  end
end

function M:SetCustomNpcFlexibShowOrHide()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  local TempFlexibleMap = {}
  local FNpcArrayNum = self.FlexibleShowHide:Num()
  for FNpcArray, IsHide in pairs(self.FlexibleShowHide) do
    local NewFlexibleMapElement = {
      NpcArray = {Quest = nil, ImpressionTalk = nil},
      IsHide = false
    }
    NewFlexibleMapElement.NpcArray = FNpcArray
    NewFlexibleMapElement.IsHide = IsHide
    TempFlexibleMap[FNpcArrayNum] = NewFlexibleMapElement
    FNpcArrayNum = FNpcArrayNum - 1
  end
  
  local function SetNpcShowOrHide(IsShow)
    if IsShow then
      self:SetCustomNpcHideTag("Flexible", false)
    else
      self:SetCustomNpcHideTag("Flexible", true)
    end
  end
  
  for i = 1, self.FlexibleShowHide:Num() do
    local TargetQuestId = TempFlexibleMap[i].NpcArray.Quest.QuestId
    local TargetQuestState = TempFlexibleMap[i].NpcArray.Quest.MyQuestState
    local TargetTalkTriggerId = TempFlexibleMap[i].NpcArray.ImpressionTalk.TalkTriggerId
    local TalkState = TempFlexibleMap[i].NpcArray.ImpressionTalk.TalkQuestState
    local FlexibleQuestChainId = TempFlexibleMap[i].NpcArray.QuestChain.QuestChainId
    local FlexibleQuestChainState = TempFlexibleMap[i].NpcArray.QuestChain.QuestChainState
    if 0 == TempFlexibleMap[i].NpcArray.EditableStructType then
      local QuestChainId = tonumber(string.sub(TargetQuestId, 1, 6))
      local QuestStateType = {Doing = 1, Success = 2}
      if not Avatar.QuestChains[QuestChainId] then
        DebugPrint("QuestChain is unexist:", QuestChainId)
      else
        local QuestChains = Avatar.QuestChains[QuestChainId]
        if TargetQuestState == QuestStateType.Doing and QuestChains.DoingQuestId == TargetQuestId then
          SetNpcShowOrHide(TempFlexibleMap[i].IsHide)
          return
        elseif TargetQuestState == QuestStateType.Success then
          if QuestChains:CheckQuestIdComplete(TargetQuestId) then
            SetNpcShowOrHide(TempFlexibleMap[i].IsHide)
            return
          end
        else
          DebugPrint("QuestChain state is error:", QuestChainId)
        end
      end
    elseif 1 == TempFlexibleMap[i].NpcArray.EditableStructType then
      local TalkStateType = {
        Compelete = 0,
        UnCompelete = 1,
        CheckSuccess = 2,
        CheckFail = 3
      }
      if TalkState == TalkStateType.Compelete then
        if Avatar:IsStorylineComplete(TargetTalkTriggerId) then
          SetNpcShowOrHide(TempFlexibleMap[i].IsHide)
          return
        end
      elseif TalkState == TalkStateType.UnCompelete then
        if Avatar:IsStorylineUnComplete(TargetTalkTriggerId) then
          SetNpcShowOrHide(TempFlexibleMap[i].IsHide)
          return
        end
      elseif TalkState == TalkStateType.CheckSuccess then
        if Avatar:IsStorylineSuccess(TargetTalkTriggerId) then
          SetNpcShowOrHide(TempFlexibleMap[i].IsHide)
          return
        end
      else
        if TalkState == TalkStateType.CheckFail and Avatar:IsStorylineFailure(TargetTalkTriggerId) then
          SetNpcShowOrHide(TempFlexibleMap[i].IsHide)
          return
        else
        end
      end
    elseif 2 == TempFlexibleMap[i].NpcArray.EditableStructType then
      local QuestChainStateType = {Doing = 1, Success = 2}
      if not Avatar.QuestChains[FlexibleQuestChainId] then
        DebugPrint("QuestChain is unexist:", FlexibleQuestChainId)
      else
        local TargetQuestChain = Avatar.QuestChains[FlexibleQuestChainId]
        if FlexibleQuestChainState == QuestChainStateType.Doing and TargetQuestChain:IsDoing() then
          SetNpcShowOrHide(TempFlexibleMap[i].IsHide)
          return
        elseif FlexibleQuestChainState == QuestChainStateType.Success and TargetQuestChain:IsFinish() then
          SetNpcShowOrHide(TempFlexibleMap[i].IsHide)
          return
        else
          DebugPrint("QuestChain state is error:", FlexibleQuestChainId)
        end
      end
    end
  end
end

function M:ActiveSetCustomNpcHideByAvatarSuitData()
  if 0 == self.AtmosphereTagArray:Num() then
    return
  end
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    local SuitData = Avatar.Suits:GetSuitBase(CommonConst.SuitType.PlayerCharacterSuit)
    if SuitData and SuitData:GetSubSuitBase(CommonConst.PlayerCharacterSuit.NpcHideShowTag) then
      local SubSuitData = SuitData:GetSubSuitBase(CommonConst.PlayerCharacterSuit.NpcHideShowTag)
      for Tag, Value in pairs(SubSuitData) do
        if self.AtmosphereTagArray:Contains(Tag) then
          self:SetCustomNpcHideTag(Tag, Value)
        end
      end
    end
  end
end

function M:InitHeadWidgetComponent()
  if self.HeadWidgetComponent then
    return
  end
  local HeadUISubsystem = UNpcHeadUISubsystem.GetHeadUISubsystem(self)
  if not HeadUISubsystem then
    return
  end
  self.HeadWidgetComponent = HeadUISubsystem:InitHeadWidgetComponent(self)
end

function M:EnableHeadWidget(WidgetName, bEnable, ...)
  if bEnable then
    self:InitHeadWidgetComponent()
  end
  if self.HeadWidgetComponent then
    if bEnable then
      if self.HeadWidgetComponent:NeedForceInit() then
        self.HeadWidgetComponent:AdjustSelfTransform()
      end
      self.HeadWidgetComponent:EnableWidget(WidgetName, ...)
    else
      self.HeadWidgetComponent:DisableWidget(WidgetName, ...)
    end
  end
end

function M:EnableBubbleWidget(bEnable, Content)
  self:EnableHeadWidget("Long_Bubble", bEnable, Content)
end

return M
