local FDisablePlayerInputComponent = {}

function FDisablePlayerInputComponent:New(Player, TalkTaskData)
  local Obj = setmetatable({}, {__index = FDisablePlayerInputComponent})
  Obj.Player = Player
  Obj.TalkTaskData = TalkTaskData
  return Obj
end

function FDisablePlayerInputComponent:Execute()
  self:SetGameInputDisable(true)
end

function FDisablePlayerInputComponent:Resume()
  self:SetGameInputDisable(false)
end

function FDisablePlayerInputComponent:SetGameInputDisable(bDisable)
  local Player = self.Player
  if not IsValid(Player) then
    return
  end
  local PreMode = UE4.URuntimeCommonFunctionLibrary.GetInputMode(Player:GetWorld())
  local Controller = Player:GetController()
  if bDisable then
    DebugPrint("Disable Input By TalkComp")
    if Controller and Controller:IsA(APlayerController) then
      Player:AddDisableInputTag("Talk")
    end
    Player.MoveInputCache:Set(0, 0, 0)
    Player.MoveInput:Set(0, 0, 0)
    if Player:GetMovementComponent() then
      Player:GetMovementComponent():ConsumeInputVector()
    end
  else
    DebugPrint("Enable Input By TalkComp")
    if Controller and Controller:IsA(APlayerController) then
      Player:RemoveDisableInputTag("Talk")
    end
  end
  local CurMode = UE4.URuntimeCommonFunctionLibrary.GetInputMode(Player:GetWorld())
  DebugPrint("MouseCaptureMode => PreMode:" .. PreMode .. "," .. "CurMode:" .. CurMode)
  EventManager:FireEvent(EventID.SetInputMode, bDisable)
  EventManager:FireEvent(EventID.TalkComp, bDisable)
end

return FDisablePlayerInputComponent
