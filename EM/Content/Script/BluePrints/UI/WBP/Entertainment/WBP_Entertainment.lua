require("UnLua")
local FEntertainmentUtils = require("BluePrints.UI.WBP.Entertainment.EntertainmentUtils")
local EEntertainmentState = FEntertainmentUtils.EEntertainmentState
local EBlendFuncMap = {
  linear = EViewTargetBlendFunction.VTBlend_Linear,
  easeInQuad = EViewTargetBlendFunction.VTBlend_EaseIn,
  easeOutQuad = EViewTargetBlendFunction.VTBlend_EaseOut,
  easeInOutQuad = EViewTargetBlendFunction.VTBlend_EaseInOut
}

local function GetCharacterData(CharacterId)
  if not CharacterId then
    UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "\233\130\128\231\186\166\231\179\187\231\187\159\233\148\153\232\175\175", "\228\188\160\229\133\165\231\169\186\231\154\132\232\167\146\232\137\178 Id\239\188\140\231\148\159\230\136\144\233\130\128\231\186\166\232\167\146\232\137\178\228\191\161\230\129\175\229\164\177\232\180\165\227\128\130")
    return
  end
  local NativeCharData = DataMgr.Char[CharacterId]
  if not NativeCharData then
    UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "\233\130\128\231\186\166\231\179\187\231\187\159\233\148\153\232\175\175", string.format("\230\156\170\229\156\168 Char \232\161\168\230\137\190\229\136\176Id\239\188\154%d \231\154\132\230\149\176\230\141\174", CharacterId))
    return
  end
  local NativePartyNPCData = DataMgr.PartyNpc[CharacterId]
  local OldCharacterId
  if not NativePartyNPCData then
    OldCharacterId = CharacterId
    CharacterId = 5301
    DebugPrint(WarningTag, "CharacterId ", OldCharacterId, " \229\175\185\229\186\148\231\154\132\233\130\128\231\186\166\232\167\146\232\137\178\230\156\170\233\133\141\231\189\174\239\188\140\232\135\170\229\138\168\229\136\135\230\141\162\229\136\176 ", CharacterId, " \232\181\155\231\144\170\228\189\156\228\184\186\233\187\152\232\174\164\233\130\128\231\186\166\232\167\146\232\137\178")
  end
  local NativePartyNPCData = DataMgr.PartyNpc[CharacterId]
  if not NativePartyNPCData then
    UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "\233\130\128\231\186\166\231\179\187\231\187\159\233\148\153\232\175\175", string.format("\230\156\170\229\156\168 PartyNpc \232\161\168\230\137\190\229\136\176Id\239\188\154%d \231\154\132\230\149\176\230\141\174 OldCharacterId %d", CharacterId, OldCharacterId or -1))
    return
  end
  local UnitId = NativePartyNPCData.UnitId
  local NativeNpcData = DataMgr.Npc[UnitId]
  if nil == NativeNpcData then
    UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "\233\130\128\231\186\166\231\179\187\231\187\159\233\148\153\232\175\175", string.format("\230\156\170\229\156\168 Npc \232\161\168\230\137\190\229\136\176Id\239\188\154%d \231\154\132\230\149\176\230\141\174", UnitId))
    return
  end
  local SpecialCharacterId = FEntertainmentUtils.GetPriorityCharacterId()
  return {
    Id = CharacterId,
    IconPath = NativeCharData.Icon,
    Rarity = NativeCharData.CharRarity,
    bPriority = SpecialCharacterId == CharacterId,
    Name = GText(NativeNpcData.UnitName) or "\231\169\186",
    WorldName = EnText(NativeNpcData.UnitName) or "\231\169\186",
    AvatarIconPath = NativePartyNPCData.AvatarIconPath,
    PartyTopicIdArray = NativePartyNPCData.PartyTopicList,
    EscIcon = NativeCharData.EscIcon,
    UnitId = NativePartyNPCData.UnitId,
    TalkActionId = NativePartyNPCData.TalkActionId,
    ReverseActionId = NativePartyNPCData.ReverseActionId,
    VoiceName = NativePartyNPCData.VoiceName,
    SeatPointName = NativePartyNPCData.SeatPointName,
    MainCameraName = NativePartyNPCData.MainCameraName,
    SwitchCameraName = NativePartyNPCData.SwitchCameraName,
    TopicCameraName = NativePartyNPCData.TopicCameraName,
    bIsLookAtCamera = NativePartyNPCData.bIsLookAtCamera,
    TopicSeatPointName = NativePartyNPCData.TopicSeatPointName,
    TopicUnitId = NativePartyNPCData.TopicUnitId,
    NpcSeatKey = NativePartyNPCData.NpcSeatKey,
    CameraBlendCurve = NativePartyNPCData.CameraBlendCurve
  }
end

local function GetAvatarCurrentCharacterData()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "\233\130\128\231\186\166\231\179\187\231\187\159\233\148\153\232\175\175", "\232\142\183\229\143\150\229\189\147\229\137\141\232\167\146\232\137\178\228\191\161\230\129\175\229\164\177\232\180\165\239\188\140avatar \228\184\186\231\169\186\227\128\130")
    return
  end
  local CharacterId = Avatar:GetCurrentCharConfigID()
  return GetCharacterData(CharacterId)
end

local function GetAvatarOwnedCharacterDataMap()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "\233\130\128\231\186\166\231\179\187\231\187\159\233\148\153\232\175\175", "\232\142\183\229\143\150\230\139\165\230\156\137\232\167\146\232\137\178\228\191\161\230\129\175\229\164\177\232\180\165\239\188\140avatar \228\184\186\231\169\186\227\128\130")
    return
  end
  local OwnedCharacterDataMap = {}
  for CharId, _ in pairs(Avatar.PartyNpcs) do
    OwnedCharacterDataMap[CharId] = GetCharacterData(CharId)
  end
  return OwnedCharacterDataMap
end

local M = Class({
  "BluePrints.UI.BP_UIState_C",
  "BluePrints.Common.TimerMgr"
})
M._components = {
  "BluePrints.UI.WBP.Entertainment.Components.Entertainment_RoleListComponent",
  "BluePrints.UI.WBP.Entertainment.Components.Entertainment_ShowModelComponent",
  "BluePrints.UI.WBP.Entertainment.Components.Entertainment_SequenceComponent"
}

function M:Initialize(Initializer)
  M.Super.Initialize(self, Initializer)
  self.TabTitleName = GText("MAIN_UI_ENTERTAINMENT")
  self.TabBottomKeyDesc = GText("UI_BACK")
  self.EntertainmentButtonName = GText("UI_Entertainment_Minigame")
  self.InvitationButtonName = GText("UI_Entertainment_Selection")
  self.InvitationGameButtonClickedTip = GText("UI_Locked_Des_MiniGame")
  self.LockedInviteTopic = GText("UI_Locked_Des_InviteTopic")
  local GlobalConstant = DataMgr.GlobalConstant
  local FadeInTime = GlobalConstant.InvitationSwitchFadeIn
  self.FadeInTime = FadeInTime.ConstantValue or 0.5
  local FadeOutTime = GlobalConstant.InvitationSwitchFadeOut
  self.FadeOutTime = FadeOutTime.ConstantValue or 0.2
  local BlackTime = GlobalConstant.InvitationSwitchBlackTime
  self.SwitchBlackTime = BlackTime.ConstantValue or 0
  self.CameraBlendSeconds = DataMgr.GlobalConstant.EntertainmentCameraBlendSeconds.ConstantValue
  self.State = EEntertainmentState.None
  self.CharacterData = nil
  self.OwnedCharacterDataMap = nil
  self.ShowCharacterData = nil
  self.ShowCharacter = nil
  self.ShowCharacterFacialId = "Closeeyes"
  self.EnterInvitationDelaySeconds = 1
  self.OpenSound = "event:/ui/armory/open"
  self.OpenSoundKey = "EntertainmentOpen"
  self.PlayerInteractiveTriggerTag = "Entertainment"
  self:OnInitialize()
end

function M:UpdateTitleName()
  local TabTitleName = GText("MAIN_UI_ENTERTAINMENT")
  if self.State == EEntertainmentState.Topic then
    TabTitleName = GText("UI_Entertainment_Selection")
  else
    local CharacterData = self.CharacterData
    local CharacterName = CharacterData and CharacterData.Name
    if not CharacterName or "" == CharacterName then
    else
      TabTitleName = TabTitleName .. "/" .. CharacterName
    end
  end
  if TabTitleName ~= self.TabTitleName then
    self.TabTitleName = TabTitleName
    self.Tab:UpdateTopTitle(TabTitleName)
  end
end

function M:Construct()
  M.Super.Construct(self)
  local PlayerCharacter = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  assert(PlayerCharacter)
  PlayerCharacter:SetCanInteractiveTrigger(false, self.PlayerInteractiveTriggerTag)
  self:InitEntertainmentSequence()
  self.EntertainmentButton = self.Btn01
  self.Btn01:SetText(self.EntertainmentButtonName)
  self.Btn01:BindOnClicked(function()
    local UIManager = GWorld.GameInstance:GetGameUIManager()
    UIManager:ShowUITip("CommonToastMain", self.InvitationGameButtonClickedTip)
  end)
  self.InvitationButton = self.Btn02
  self.Btn02:SetText(self.InvitationButtonName)
  self.Btn02:BindOnClicked(function()
    local CharacterData = self.CharacterData
    if not CharacterData then
      return
    end
    if FEntertainmentUtils:IsDisableTopicParty(CharacterData.Id) then
      local UIManager = GWorld.GameInstance:GetGameUIManager()
      UIManager:ShowUITip("CommonToastMain", self.LockedInviteTopic)
      return
    end
    self:SetState(EEntertainmentState.Topic)
  end)
  self.SwitchCharacter:BindOnSettedCharacterDataChanged(function(NewCharacterData)
    self:HandleOnSettedCharacterDataChanged(NewCharacterData)
  end)
  self.SwitchCharacter:BindOnSelectedCharacterDataChanged(function(NewCharacterData)
    self:HandleOnSelectedCharacterDataChanged(NewCharacterData)
  end)
  self.SwitchCharacter:BindOnCloseButtonClicked(function()
    self:SetState(EEntertainmentState.Main)
  end)
  self.Btn_Selective:BindEventOnClicked(self, function()
    self:SetState(EEntertainmentState.SwitchCharacter)
  end)
  self.TopicDetail:BindOnDisplayMemory(function(MemoryName, MemoryDescription, MemoryIconPath)
    self:HandleOnDisplayMemory(MemoryName, MemoryDescription, MemoryIconPath)
  end)
  self.TopicDetail:SetEntertainmentUI(self)
  self.TopicDetail:BindOnGotReward(function()
    self:HandleOnGotReward()
  end)
  self.TopicDetail:BindOnEnterInvitation(function(CharacterId, TopicLevel, bIsReview)
    self:HandleOnEnterInvitation(CharacterId, TopicLevel, bIsReview)
  end)
  self:OnConstruct()
end

function M:Destruct()
  if IsValid(self.ArmoryHelper) then
    self.ArmoryHelper:OnArmoryOpenOrClose(false)
    self.ArmoryHelper:K2_DestroyActor()
  end
  self.NotMoveCamera = nil
  self:OnDestruct()
  M.Super.Destruct(self)
end

function M:InitUIInfo(Name, IsInUIMode, EventList, ...)
  local CharacterId, TabIndex = ...
  M.Super.InitUIInfo(self, Name, IsInUIMode, EventList, CharacterId, TabIndex)
  local CharacterData
  if FEntertainmentUtils:IsSpecialSelectCharacter() then
    CharacterId = FEntertainmentUtils:GetPriorityCharacterId()
  end
  if CharacterId then
    CharacterData = GetCharacterData(CharacterId)
  else
    CharacterData = GetAvatarCurrentCharacterData()
  end
  self:SetCharacterData(CharacterData)
  self:SetShowCharacterData(CharacterData)
  self:UpdateTitleName()
  local OwnedCharacterDataMap = GetAvatarOwnedCharacterDataMap()
  self:SetOwnedCharacterDataMap(OwnedCharacterDataMap)
  self.SwitchCharacter:SetDisplayCharacter(self.CharacterData, self.OwnedCharacterDataMap)
  if TabIndex then
    local TopicCamera = self:GetCineCameraActor(self.ShowCharacterData.TopicCameraName)
    self:SetViewTargetWithBlend(TopicCamera)
    self:SetState(EEntertainmentState.Topic)
    self.TopicDetail:SetTab(TabIndex)
  else
    local MainCamera = self:GetCineCameraActor(self.ShowCharacterData.MainCameraName)
    self:SetViewTargetWithBlend(MainCamera)
    self:SetState(EEntertainmentState.Main)
  end
  self.bInteractionEnabled = false
  self:SetInteractionEnabled(true)
  self.SwitchCharacter:Init(self)
  AudioManager(self):PlayUISound(self, self.OpenSound, self.OpenSoundKey, nil)
  self:OnInitUIInfo()
end

function M:Close()
  AudioManager(self):SetEventSoundParam(self, self.OpenSoundKey, {ToEnd = 1})
  self:SetCharacterData(nil)
  self:SetOwnedCharacterDataMap(nil)
  self:SetShowCharacterData(nil)
  EventManager:FireEvent(EventID.OnGotTopicReward)
  local PlayerCharacter = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  if IsValid(PlayerCharacter) then
    PlayerCharacter:SetCanInteractiveTrigger(true, self.PlayerInteractiveTriggerTag)
  end
  if not self.NotMoveCamera then
    self:SetViewTargetWithBlend(PlayerCharacter)
  end
  M.Super.Close(self)
end

function M:OnKeyDown(MyGeometry, InKeyEvent)
  if self:IsInteractionEnabled() == false then
    return UE4.UWidgetBlueprintLibrary.Handled()
  end
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if "Escape" == InKeyName then
    self:ExitCurrentState()
  end
  return UE4.UWidgetBlueprintLibrary.Handled()
end

function M:ReceiveEnterState(StackAction)
  M.Super.ReceiveEnterState(self, StackAction)
  self.TopicDetail:RefreshPartyTopic()
end

function M:EnterMainState()
  if self.CharacterData == nil then
    return
  end
  self.Panel_Button:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  self.Panel_Topic:SetVisibility(ESlateVisibility.Collapsed)
  self.SwitchCharacter:ClosePanel()
  self.SwitchButton:ClosePanel()
  self.TopicDetail:ClosePanel(nil, self)
  self:OpenComponentPanel()
  self:SetShowCharacterActionWithState(EEntertainmentState.Main)
  self:UpdateTitleName()
  self:UpdateBtnRedDot()
  self.EMListView_Role:SetFocus()
  self.EMListView_Role:NavigateToIndex(0)
end

function M:ExitMainState(ExitCallback)
  ExitCallback()
end

function M:EnterSwitchCharacterState()
  self.Panel_Button:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  self.Panel_Topic:SetVisibility(ESlateVisibility.Collapsed)
  self:CloseComponentPanel()
  self.SwitchCharacter:OpenPanel()
  self.SwitchButton:ClosePanel()
  self.TopicDetail:ClosePanel(nil, self)
  self:SetShowCharacterActionWithState(EEntertainmentState.SwitchCharacter)
end

function M:ExitSwitchCharacterState(ExitCallback)
  self.SwitchCharacter:ClosePanel(ExitCallback)
end

function M:EnterTopicState()
  self.Panel_Button:SetVisibility(ESlateVisibility.Collapsed)
  self.Panel_Topic:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  self:CloseComponentPanel()
  self.SwitchCharacter:ClosePanel()
  self.TopicDetail:OpenPanel(nil, self)
  self.SwitchButton:OpenPanel()
  self:SetShowCharacterActionWithState(EEntertainmentState.Topic)
  self:UpdateTitleName()
  self:PlayCameraSound()
end

function M:ExitTopicState(ExitCallback)
  self.SwitchButton:ClosePanel()
  self.TopicDetail:ClosePanel(ExitCallback, self)
  self:UpdateTitleName()
  self:PlayCameraSound()
end

function M:SetState(NewState)
  if self.State == NewState then
    return
  end
  local OldState = self.State
  self.State = NewState
  
  local function ExitCallback()
    if NewState == EEntertainmentState.Main then
      self:EnterMainState()
    elseif NewState == EEntertainmentState.SwitchCharacter then
      self:EnterSwitchCharacterState()
    elseif NewState == EEntertainmentState.Topic then
      self:EnterTopicState()
    end
  end
  
  if OldState == EEntertainmentState.None then
    ExitCallback()
  elseif OldState == EEntertainmentState.Main then
    self:ExitMainState(ExitCallback)
  elseif OldState == EEntertainmentState.SwitchCharacter then
    self:ExitSwitchCharacterState(ExitCallback)
  elseif OldState == EEntertainmentState.Topic then
    self:ExitTopicState(ExitCallback)
  end
end

function M:ExitCurrentState()
  if self.State == EEntertainmentState.Main then
    self:Close()
  elseif self.State == EEntertainmentState.SwitchCharacter then
    self:SetState(EEntertainmentState.Main)
  elseif self.State == EEntertainmentState.Topic then
    if self.GetBadge:IsPanelOpened() then
      self.GetBadge:ClosePanel()
      return
    end
    self:SetState(EEntertainmentState.Main)
  end
end

function M:HandleOnSettedCharacterDataChanged(NewCharacterData)
  self:SetCharacterData(NewCharacterData)
  self:UpdateTitleName()
end

function M:HandleOnSelectedCharacterDataChanged(NewCharacterData)
  self:SetState(self.State)
  self:SetShowCharacterData(NewCharacterData)
end

function M:HandleOnDisplayMemory(MemoryName, MemoryDescription, MemoryIconPath)
  self.GetBadge:SetMemory(MemoryName, MemoryDescription, MemoryIconPath)
  self.GetBadge:OpenPanel()
end

function M:HandleOnGotReward()
  self.SwitchCharacter:RefreshRedDot()
  self:RefreshRedDot()
end

function M:CloseMenuWorld()
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  local UIManager = GameInstance:GetGameUIManager()
  if UIManager then
    local MenuWorld = UIManager:GetUI("MenuWorld")
    if MenuWorld then
      MenuWorld.CloseByChild = true
      MenuWorld:Close()
      MenuWorld:RealClose()
    end
  end
end

function M:HandleOnEnterInvitation(CharacterId, TopicLevel, bIsReview)
  local CharacterData = self.OwnedCharacterDataMap[CharacterId]
  if CharacterData then
    local bInvitationSuccess = false
    local Point = self:GetPoint(CharacterData.TopicSeatPointName)
    local ShowNpc
    if CharacterData.TopicUnitId then
      self:LoadNpcAsync(CharacterData.TopicUnitId, function(Character)
        ShowNpc = Character
        Character:MoveToSeat(Point:K2_GetActorLocation(), Point:K2_GetActorRotation())
        Character.CapsuleComponent:SetCollisionResponseToChannel(ECollisionChannel.ECC_WorldStatic, ECollisionResponse.ECR_OverLap)
        Character:SetActorHideTag("Entertainment", true)
      end)
    end
    self:EnterInvitation(CharacterId, TopicLevel, bIsReview, function(bSuccess)
      if ShowNpc then
        ShowNpc = ShowNpc:SetActorHideTag("Entertainment", false)
      end
      self:CloseMenuWorld()
      bInvitationSuccess = bSuccess
      if IsValid(self) then
        self:Close()
        self:RealClose()
      end
    end)
  else
    self:Close()
  end
end

function M:SetInteractionEnabled(bEnabled)
  if self.bInteractionEnabled == bEnabled then
    return
  end
  if bEnabled then
    self:SetVisibility(ESlateVisibility.Visible)
  else
    self:SetVisibility(ESlateVisibility.HitTestInvisible)
  end
  self.bInteractionEnabled = bEnabled
end

function M:IsInteractionEnabled()
  return self.bInteractionEnabled and self.IsInit
end

function M:SetCharacterData(NewCharacterData)
  if self.CharacterData and NewCharacterData and self.CharacterData.Id == NewCharacterData.Id then
    return
  end
  if NewCharacterData then
    self.SwitchButton:SetName(NewCharacterData.Name, NewCharacterData.WorldName)
    self.TopicDetail:SetPartyTopic(NewCharacterData)
  end
  self.CharacterData = NewCharacterData
  if self.CharacterData then
    self.Btn02:SetIcon(self.CharacterData.EscIcon)
  end
  self:UpdateBtnRedDot()
end

function M:UpdateBtnRedDot()
  local CharacterData = self.CharacterData
  if not CharacterData then
    return
  end
  self.Btn02:EnableReddot(CharacterData and FEntertainmentUtils:IsCharacterShowRedDot(CharacterData.Id))
end

function M:SetShowCharacterData(NewShowCharacterData)
  if self.ShowCharacterData and NewShowCharacterData and self.ShowCharacterData.UnitId == NewShowCharacterData.UnitId then
    return
  end
  local OldPos
  if self.ShowCharacterData then
    OldPos = self.ShowCharacterData.NpcSeatKey
  end
  local BlackKey
  self.ShowCharacterData = NewShowCharacterData
  if NewShowCharacterData then
    local NewPos = NewShowCharacterData.NpcSeatKey
    local FadeInTime = self.FadeInTime
    if not OldPos then
      FadeInTime = 0
    end
    if OldPos ~= NewPos then
      BlackKey = self:StartFadeIn(FadeInTime, self.FadeOutTime, function()
        local ShowCharacterData = self.ShowCharacterData
        if ShowCharacterData and ShowCharacterData.NpcSeatKey ~= NewPos then
          return
        end
        local Camera = self:GetEntertainmentCamera()
        self:SetViewTargetWithBlend(Camera, 0)
      end)
    end
  end
  self:DestoryNpc(nil, function()
    if self.ShowCharacter then
      self.ShowCharacter.FXComponent:PlayEffectByIDParams(302, {bTickEvenWhenPaused = true, NotAttached = true})
      AudioManager(self):PlayUISound(self, "event:/ui/common/role_disappear", nil, nil)
    end
    self.ShowCharacter = nil
  end)
  if NewShowCharacterData then
    self:LoadNpcAsync(NewShowCharacterData.UnitId, function(Character)
      if self.ShowCharacterData and self.ShowCharacterData == NewShowCharacterData then
        local Point = self:GetPoint(NewShowCharacterData.SeatPointName)
        Character:MoveToSeat(Point:K2_GetActorLocation(), Point:K2_GetActorRotation())
        Character.CapsuleComponent:SetCollisionResponseToChannel(ECollisionChannel.ECC_WorldStatic, ECollisionResponse.ECR_OverLap)
        Character.FXComponent:PlayEffectByIDParams(301, {bTickEvenWhenPaused = true, NotAttached = true})
        AudioManager(self):PlayUISound(self, "event:/ui/common/role_appear", nil, nil)
        self:HandleOnShowCharacterGot(Character, NewShowCharacterData)
      end
    end)
  end
  self:WaitTime(self.SwitchBlackTime, function()
  end)
  if BlackKey then
    self:StartFadeOut(BlackKey, function()
    end)
  end
end

function M:SetOwnedCharacterDataMap(NewOwnedCharacterDataMap)
  self.OwnedCharacterDataMap = NewOwnedCharacterDataMap
end

function M:SetViewTargetWithBlend(NewViewTarget, CameraBlendSecond, CurveName)
  self.ViewTarget = NewViewTarget
  CameraBlendSecond = CameraBlendSecond or 0
  local EViewTargetBlendFunction = EBlendFuncMap[CurveName]
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  if IsValid(PlayerController) then
    PlayerController:SetViewTargetWithBlend(NewViewTarget, CameraBlendSecond, EViewTargetBlendFunction, 2, true)
  end
end

function M:PlayCameraSound(Camera, TargetCamera)
  AudioManager(self.ViewUI):PlayUISound(self, "event:/ui/common/whoosh_cam_move_long_slow", "EntertainmentCameraMoveLong", nil)
end

function M:SetShowCharacterActionWithState(State)
  if IsValid(self.ShowCharacter) == false then
    return
  end
  local AnimInstance = self.ShowCharacter.Mesh:GetAnimInstance()
  if nil == AnimInstance then
    UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "\233\130\128\231\186\166\231\179\187\231\187\159\233\148\153\232\175\175", string.format("\232\174\190\231\189\174 Id\239\188\154%d \232\167\146\232\137\178\229\138\168\228\189\156\229\164\177\232\180\165\239\188\140\229\138\168\231\148\187\229\174\158\228\190\139\228\184\186\231\169\186\227\128\130", self.ShowCharacterData.Id))
    return
  end
  local ViewTarget = self.ViewTarget
  local LookAtCamera
  if State == EEntertainmentState.None then
  elseif State == EEntertainmentState.Main then
    local MainCamera = self:GetCineCameraActor(self.ShowCharacterData.MainCameraName)
    LookAtCamera = MainCamera
    self:SetViewTargetWithBlend(MainCamera, self.CameraBlendSeconds, self.CharacterData.CameraBlendCurve)
    if false == self.bUseDefaultAnim and self.ShowCharacterData.ReverseActionId then
      self.ShowCharacter:PlayTalkAction(self.ShowCharacterData.ReverseActionId, {})
    else
      self.ShowCharacter:InitDefaultAnimation()
    end
    self.bUseDefaultAnim = true
  elseif State == EEntertainmentState.SwitchCharacter then
    local SwitchCamera = self:GetCineCameraActor(self.ShowCharacterData.SwitchCameraName)
    self:SetViewTargetWithBlend(SwitchCamera, self.CameraBlendSeconds, self.CharacterData.CameraBlendCurve)
    LookAtCamera = SwitchCamera
    if false == self.bUseDefaultAnim and self.ShowCharacterData.ReverseActionId then
      self.ShowCharacter:PlayTalkAction(self.ShowCharacterData.ReverseActionId, {})
    else
      self.ShowCharacter:InitDefaultAnimation()
    end
    self.bUseDefaultAnim = true
  elseif State == EEntertainmentState.Topic then
    local TopicCamera = self:GetCineCameraActor(self.ShowCharacterData.TopicCameraName)
    self:SetViewTargetWithBlend(TopicCamera, self.CameraBlendSeconds, self.CharacterData.CameraBlendCurve)
    LookAtCamera = TopicCamera
    self.ShowCharacter:PlayTalkAction(self.ShowCharacterData.TalkActionId, {})
    self.bUseDefaultAnim = false
  elseif State == EEntertainmentState.Invitation then
    self.bUseDefaultAnim = false
    self.ShowCharacter:StopTalkSound()
  end
  if not LookAtCamera and self.ShowCharacterData.bIsLookAtCamera then
    AnimInstance:ResetNormalLookAt()
  elseif LookAtCamera and self.ShowCharacterData.bIsLookAtCamera then
    AnimInstance:SetLookAtActor(LookAtCamera)
  end
end

function M:GetEntertainmentCamera()
  local State = self.State
  if State == EEntertainmentState.None or State == EEntertainmentState.Main then
    local MainCamera = self:GetCineCameraActor(self.ShowCharacterData.MainCameraName)
    return MainCamera
  elseif State == EEntertainmentState.SwitchCharacter then
    local SwitchCamera = self:GetCineCameraActor(self.ShowCharacterData.SwitchCameraName)
    return SwitchCamera
  elseif State == EEntertainmentState.Topic or State == EEntertainmentState.Invitation then
    local TopicCamera = self:GetCineCameraActor(self.ShowCharacterData.TopicCameraName)
    return TopicCamera
  end
end

function M:HandleOnShowCharacterGot(Character, CharacterData)
  self.ShowCharacter = Character
  self:SetShowCharacterActionWithState(self.State)
  if IsValid(self.ShowCharacter) then
    self.ShowCharacter:PlayTalkSound(CharacterData.VoiceName)
  end
end

function M:GetPoint(PointName)
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  assert(GameState)
  return GameState:GetTargetPoint(PointName)
end

AssembleComponents(M)
return M
