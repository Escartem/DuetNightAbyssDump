require("UnLua")
local M = Class("BluePrints.UI.BP_UIState_C")

function M:OnLoaded(...)
  self.Super.OnLoaded(self, ...)
  local Info = (...)
  self.FishingSpotId = Info.FishingSpotId
  self.FishingSpot = Info.FishingSpot
  self.DeviceInPc = CommonUtils.GetDeviceTypeByPlatformName(self) ~= "Mobile"
  self.Angling_Main:Init(self, self.FishingSpotId, true)
  self.Angling_Fishing:Init(self, self.FishingSpotId)
  self.KeyEventState = ""
  self:SwitchOnMainPage()
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(self)
  self.GameInputModeSubsystem.OnInputMethodChanged:Add(self, self.RefreshInfoByInputTypeChange)
  self.CurMode = self.GameInputModeSubsystem:GetCurrentInputType()
  self:RefreshInfoByInputTypeChange(self.CurMode)
  EventManager:AddEvent(EventID.LoadUI, self, self.ShowPet)
  EventManager:AddEvent(EventID.OnPropSetResources, self.Angling_Main, self.Angling_Main.OnGetLure)
  AudioManager(self):PlaySystemUIBGM("event:/bgm/cbt03/0082_system_fishing", nil, "Angling_Panel")
end

function M:ShowPet(UIName)
  if "AnglingMain" ~= UIName then
    return
  end
  local Player = UGameplayStatics.GetPlayerCharacter(self, 0)
  local BattlePet = Player:GetBattlePet()
  if BattlePet then
    BattlePet:HideBattlePet("AnglingMain", false)
  end
end

function M:SwitchOnGamePage()
  self.Switcher:SetActiveWidgetIndex(1)
  self.Angling_Main:PlayAnimation(self.Angling_Main.Out)
  self.Angling_Fishing:PlayAnimation(self.Angling_Fishing.In)
  self.Angling_Fishing:SetFocus()
  self.Angling_Fishing:SwitchWaitStart()
  self.PageState = "Game"
  self.FishingSpot:SetCamera("Game")
  AudioManager(self):SetEventSoundParam(self.Angling_Main, "AnglingMainOpen", {ToEnd = 1})
  AudioManager(self):PlayUISound(self.Angling_Fishing, "event:/ui/minigame/fish_game_filter", "AnglingFishingOpen", nil)
end

function M:SwitchOnMainPage()
  self.Switcher:SetActiveWidgetIndex(0)
  self.Angling_Fishing:PlayAnimation(self.Angling_Fishing.Out)
  self.Angling_Main:PlayAnimation(self.Angling_Main.In)
  self.Angling_Main:SetFocus()
  self.PageState = "Main"
  self.FishingSpot:SetCamera("Main")
  AudioManager(self):SetEventSoundParam(self.Angling_Main, "AnglingFishingOpen", {ToEnd = 1})
  AudioManager(self):PlayUISound(self.Angling_Main, "event:/ui/armory/open", "AnglingMainOpen", nil)
end

function M:Close()
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(GWorld.GameInstance, 0)
  local Player = PlayerController:GetMyPawn()
  local Eid = Player.MechanismEid
  local Mechanism = Battle(self):GetEntity(Eid)
  if Mechanism then
    Mechanism:EndInteractive(Player, true)
  end
  EventManager:RemoveEvent(EventID.OnFishHook, self.Angling_Main)
  EventManager:RemoveEvent(EventID.LoadUI, self)
  EventManager:RemoveEvent(EventID.OnPropSetResources, self.Angling_Main)
  if self.PageState == "Main" then
    AudioManager(self):SetEventSoundParam(self.Angling_Main, "AnglingMainOpen", {ToEnd = 1})
  else
    AudioManager(self):SetEventSoundParam(self.Angling_Main, "AnglingFishingOpen", {ToEnd = 1})
  end
  AudioManager(self):StopSystemUIBGM("Angling_Panel")
  M.Super.Close(self)
end

function M:PlayPlayerMontage(MontageName, Callback)
  local MontCallback = Callback
  if nil == MontCallback then
    MontCallback = {}
  end
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  Player:PlayActionMontage("Interactive/Fishing", MontageName, MontCallback, false)
end

function M:UpdateFishingRodModelId()
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  local IdList = DataMgr.FishingRod[self.FishingRodId].EffectCreatureId
  local Creatures = Player:GetEffectCreatureByTag("Fish")
  for i, Id in pairs(IdList) do
    for j, Creature in pairs(Creatures) do
      print(_G.LogTag, "LXZ OnWearBtnClick", Id, Creature.EffectCreatureId)
      if Id == Creature.EffectCreatureId then
        local FishingRodData = DataMgr.FishingRod[self.FishingRodId]
        local ModelId = FishingRodData.MeshResourceId
        local MaterialPath = FishingRodData.MaterialPath
        local MaterialParam = FishingRodData.MaterialParam
        Player:UpdateEffectCreatureModel(Id, ModelId)
        self:UpdateFishingRodMaterial(Player, Id, MaterialPath, MaterialParam)
      end
    end
  end
end

function M:UpdateFishingRodMaterial(Player, EffectCreatureId, MaterialPath, MaterialParam)
  if not Player.EffectCreatures or not Player.EffectCreatures[EffectCreatureId] then
    return
  end
  local EffectCreatures = Player.EffectCreatures[EffectCreatureId]
  for Index = #EffectCreatures, 1, -1 do
    local EffectCreature = EffectCreatures[Index]
    if IsValid(EffectCreature) then
      if MaterialPath then
        local Material = LoadObject(MaterialPath)
        EffectCreature.SkeletalMesh:SetMaterial(0, Material)
      end
      EffectCreature.FishMaterial = EffectCreature.SkeletalMesh:CreateAndSetMaterialInstanceDynamic(0)
      EffectCreature.SkeletalMesh:SetMaterial(0, EffectCreature.FishMaterial)
      if MaterialParam then
        EffectCreature.FishMaterial:SetScalarParameterValue("PartSelect", MaterialParam)
      end
    else
      table.remove(EffectCreatures, Index)
    end
  end
end

function M:OnPreviewKeyDown(MyGeometry, InKeyEvent)
  if not self.DeviceInPc then
    return UE4.UWidgetBlueprintLibrary.UnHandled()
  end
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  print(_G.LogTag, "LXZ OnPreviewKeyDown", InKeyName, self.PageState)
  self.KeyEventState = self.PageState
  local IsEventHandled = false
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) then
    if self.PageState == "Main" and self.KeyEventState == "Main" then
      IsEventHandled = self.Angling_Main:Handle_PreviewKeyEventOnGamePad(InKeyName)
    elseif self.PageState == "Game" and self.KeyEventState == "Game" then
      IsEventHandled = self.Angling_Fishing:Handle_PreviewKeyEventOnGamePad(InKeyName)
    end
  end
  if IsEventHandled then
    return UE4.UWidgetBlueprintLibrary.UnHandled()
  else
    return UE4.UWidgetBlueprintLibrary.UnHandled()
  end
end

function M:OnKeyDown(MyGeometry, InKeyEvent)
  if not self.DeviceInPc then
    return UE4.UWidgetBlueprintLibrary.UnHandled()
  end
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local IsEventHandled = false
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) then
    if self.PageState == "Main" and "Main" == self.KeyEventState then
      IsEventHandled = self.Angling_Main:Handle_KeyEventOnGamePad(InKeyName)
    elseif self.PageState == "Game" and self.KeyEventState == "Game" then
      IsEventHandled = self.Angling_Fishing:Handle_KeyEventOnGamePad(InKeyName)
    end
  elseif self.PageState == "Main" and "Main" == self.KeyEventState then
    IsEventHandled = self.Angling_Main:Handle_KeyEventOnPC(InKeyName)
  elseif self.PageState == "Game" and self.KeyEventState == "Game" then
    IsEventHandled = self.Angling_Fishing:Handle_KeyEventOnPC(InKeyName)
  end
  if IsEventHandled then
    return UE4.UWidgetBlueprintLibrary.Handled()
  else
    return UE4.UWidgetBlueprintLibrary.UnHandled()
  end
end

function M:OnKeyUp(MyGeometry, InKeyEvent)
  if not self.DeviceInPc then
    return UE4.UWidgetBlueprintLibrary.UnHandled()
  end
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local IsEventHandled = false
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) then
    if self.PageState == "Game" and "Game" == self.KeyEventState then
      IsEventHandled = self.Angling_Fishing:Handle_KeyUpEventOnGamePad(InKeyName)
    elseif self.PageState == "Main" and self.KeyEventState == "Main" then
      IsEventHandled = self.Angling_Main:Handle_KeyUpEventOnGamePad(InKeyName)
    end
  elseif self.PageState == "Game" and "SpaceBar" == InKeyName then
    IsEventHandled = self.Angling_Fishing:Handle_KeyUpEventOnPC(InKeyName)
  end
  self.KeyEventState = ""
  if IsEventHandled then
    return UE4.UWidgetBlueprintLibrary.Handled()
  else
    return UE4.UWidgetBlueprintLibrary.UnHandled()
  end
end

function M:RefreshInfoByInputTypeChange(CurInputDevice, CurGamepadName)
  self.CurMode = CurInputDevice
  self.Angling_Main:RefreshInfoByInputTypeChange(CurInputDevice, CurGamepadName)
  self.Angling_Fishing:RefreshInfoByInputTypeChange(CurInputDevice, CurGamepadName)
end

function M:ReceiveEnterState(StackAction)
  M.Super.ReceiveEnterState(self, StackAction)
  if not self.FishingSpotId then
    return
  end
  self.Angling_Main:Init(self, self.FishingSpotId, false)
end

function M:ReceiveExitState(StackAction)
  M.Super.ReceiveExitState(self, StackAction)
end

function M:CheckSkipFishingPet()
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  local BattlePet = Player:GetBattlePet()
  if not BattlePet then
    return false
  end
  local BattlePetData = DataMgr.BattlePet[BattlePet.BattlePetID]
  if BattlePetData and BattlePetData.CanAutoFishing then
    return true
  end
  for i, v in pairs(BattlePet.PetAffixList) do
    local AffixData = DataMgr.PetEntry[v]
    if AffixData and AffixData.BattlePetID then
      local BattlePetData = DataMgr.BattlePet[AffixData.BattlePetID]
      if BattlePetData and BattlePetData.CanAutoFishing then
        return true
      end
    end
  end
  return false
end

return M
