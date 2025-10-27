local RewardBox = require("BluePrints.Client.CustomTypes.SimpleRewardBox")
require("UnLua")
local BP_RPCComponent_C = Class()

function BP_RPCComponent_C:OnRequestGuideInfo_Lua(GuideInfo)
  DebugPrint("\232\142\183\229\143\150\229\186\143\229\136\151\229\140\150\230\149\176\230\141\174:", GuideInfo, GuideInfo.SnapShotId, GuideInfo.Loc, GuideInfo.UnitId, GuideInfo.UnitType, GuideInfo.Level, GuideInfo.CurrentLevelId)
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  local SceneMgr = GameInstance:GetSceneManager()
  if nil ~= SceneMgr then
    SceneMgr:SetGuideActorInfo(GuideInfo)
  end
end

function BP_RPCComponent_C:SetEndPointTransform_Lua()
  local Owner = self:GetOwner()
  if not Owner:IsPlayer() then
    return
  end
  local EndPointSeqEnable, EndPointLocation, EndPointRotation = Owner:GetEndPointInfo()
  if not EndPointSeqEnable then
    return
  end
  Owner:ResetIdle()
  local NewTranslation = EndPointLocation + FVector(0, 0, Owner.CapsuleComponent:GetUnscaledCapsuleHalfHeight())
  Owner:K2_SetActorLocationAndRotation(NewTranslation, EndPointRotation, false, nil, true)
end

function BP_RPCComponent_C:SetVariableBool_Lua(VariableName, Variable, TargetEid)
  local Target = Battle(self):GetEntity(TargetEid)
  if not IsValid(Target) then
    return
  end
  Target[VariableName] = Variable
end

function BP_RPCComponent_C:RequestSabotageGuideInfo_Client(Owner, Callback)
  DebugPrint("BP_RPCComponent_C: ClientRequest Owner:", Owner:GetName())
  if GameState(self) and GameState(self).GameModeType ~= "Sabotage" then
    DebugPrint("BP_RPCComponent_C: ClientRequest Not In Sabotage")
    return
  end
  self.SabotageGuideEvent:Add(Owner, Callback)
  self:RequestSabotageGuideInfo()
end

function BP_RPCComponent_C:RequestSabotageGuideInfo_Lua()
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  if not GameMode or not GameMode:GetDungeonComponent() then
    return
  end
  local SabotageGuideInfo = GameMode:GetDungeonComponent().SabotageMonsterGuide
  local DeathSabotageGuideInfo = GameMode:GetDungeonComponent().DeathSabotageMonsterGuide
  local GuideOrder = GameMode:GetDungeonComponent().GuideOrder
  local ResEid = TArray(0)
  local ResUnitId = TArray(0)
  for index, Eid in pairs(GuideOrder) do
    if not DeathSabotageGuideInfo[Eid] then
      ResEid:Add(Eid)
      ResUnitId:Add(SabotageGuideInfo[Eid])
    else
      ResEid:Add(0)
      ResUnitId:Add(0)
    end
  end
  DebugPrint("BP_RPCComponent_C:Server: RequestSabotageGuideInfo_Lua")
  PrintTable(ResEid:ToTable(), 3)
  PrintTable(ResUnitId:ToTable(), 3)
  self:OnRequestSabotageGuideInfo(ResEid, ResUnitId)
end

function BP_RPCComponent_C:OnRequestSabotageGuideInfo_Lua(Eids, UnitIds)
  DebugPrint("BP_RPCComponent_C: ClientRep: OnRequestSabotageGuideInfo_Lua")
  PrintTable(Eids:ToTable(), 3)
  PrintTable(UnitIds:ToTable(), 3)
  self.SabotageGuideEvent:Broadcast(Eids, UnitIds)
  self.SabotageGuideEvent:Clear()
end

function BP_RPCComponent_C:OnDungeonSettlement_Server_Lua(bIsWin)
  self:SetEndPointTransform()
  self:OnDungeonSettlement_Client(bIsWin)
end

function BP_RPCComponent_C:OnDungeonSettlement_Client_Lua(bIsWin)
  local Owner = self:GetOwner()
  self:SetEndPointTransform_Lua()
  Owner:OnDungeonSettlement(bIsWin)
end

function BP_RPCComponent_C:OnPlayerFallTriggerClient_Lua()
  local Player = self:GetOwner()
  if not Player or not Player:IsPlayer() then
    return
  end
  Player:ResetIdle()
end

function BP_RPCComponent_C:GMServerGetDrop_Lua(DropId, Count)
  local GameInstance = UGameplayStatics.GetGameInstance(self)
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  local DropInfo = DataMgr.Drop[DropId]
  local PlayerCharacter = self:GetOwner()
  local Rotation = PlayerCharacter:K2_GetActorRotation()
  local SpawnLocation = PlayerCharacter:K2_GetActorLocation() + FVector(400, 0, 0)
  if not DropInfo or Count <= 0 then
    return
  end
  local Transform = UE4.UKismetMathLibrary.MakeTransform(SpawnLocation, Rotation, UE4.FVector(1, 1, 1))
  local Drops = {}
  local DropCountTable = {}
  local NormalTag = RewardBox:GetTag("Normal")
  DropCountTable[tostring(NormalTag)] = Count
  Drops[DropId] = DropCountTable
  GameMode:HandleRewardDrop(Drops, CommonConst.RewardReason.REASON_GM_SPAWN, Transform, {}, nil)
end

return BP_RPCComponent_C
