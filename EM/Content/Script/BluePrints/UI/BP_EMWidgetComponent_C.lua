local BP_EMWidgetComponent_C = Class()

function BP_EMWidgetComponent_C:Initialize(Initializer)
  self.ViewRotationController = nil
  self.UseLongBubbleDistanceSquared = 90000
end

function BP_EMWidgetComponent_C:ReceiveBeginPlay()
  self.Owner = self:GetOwner()
  self.IsFaceToPlayer = false
end

function BP_EMWidgetComponent_C:ReceiveEndPlay(EndPlayReason)
end

function BP_EMWidgetComponent_C:ReceiveTick(DeltaSeconds)
  if self.IsFaceToPlayer and self.ViewRotationController then
    local ViewRotation = self.ViewRotationController:GetControlRotation()
    ViewRotation.Yaw = ViewRotation.Yaw + 180
    ViewRotation.Pitch = ViewRotation.Pitch * -1
    self:K2_SetWorldRotation(ViewRotation, false, nil, true)
  end
  if self.PetRoot then
    local Owner = self:GetOwner()
    local Player = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
    local PlayerLocation = Player:K2_GetActorLocation()
    local SelfLocation = Owner:K2_GetActorLocation()
    PlayerLocation.Z = 0
    SelfLocation.Z = 0
    local Dir = PlayerLocation - SelfLocation
    local Forward = Owner:GetActorForwardVector()
    Forward.Z = 0
    Dir:Normalize()
    Forward:Normalize()
    local Angle = Dir:Dot(Forward)
    local Cross = Dir:Cross(Forward)
    local OnRight = Cross.Z < 0
    local Degree = UE.UKismetMathLibrary.DegAcos(Angle)
    if false == OnRight then
      Degree = 360 - Degree
    end
    self.PetRoot:K2_SetRelativeRotation(FRotator(0, Degree, 0), false, nil, true)
    Owner:UpdatePetFXRotation(Degree)
  end
end

function BP_EMWidgetComponent_C:SetEnableFaceToPlayer(IsEnable)
  self.IsFaceToPlayer = IsEnable
end

function BP_EMWidgetComponent_C:TryGetWidget()
  if not self.Widget and self.WidgetClass then
    local Widget = UIManager(self):CreateWidget(self.WidgetClass, false)
    Widget:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self:SetWidget(Widget)
  end
  return self.Widget
end

function BP_EMWidgetComponent_C:TryGetBubbleWidget()
  self.WidgetClass = LoadClass("/Game/UI/WBP/World/NPC/Widget/WBP_NPC_Bubble_Long.WBP_NPC_Bubble_Long_C")
  local Owner = self:GetOwner()
  local OwnerLocation = Owner:K2_GetActorLocation()
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  local NPCs = GameState.NpcCharacterMap:ToTable()
  for _, NPC in pairs(NPCs) do
    if NPC ~= Owner then
      local NPCLocation = NPC:K2_GetActorLocation()
      local DistSquared = UE4.UKismetMathLibrary.Vector_DistanceSquared(OwnerLocation, NPCLocation)
      if DistSquared < self.UseLongBubbleDistanceSquared then
        self.WidgetClass = LoadClass("/Game/UI/WBP/World/NPC/Widget/WBP_NPC_Bubble_Short.WBP_NPC_Bubble_Short_C")
        break
      end
    end
  end
  self.Widget = nil
  return self:TryGetWidget()
end

return BP_EMWidgetComponent_C
