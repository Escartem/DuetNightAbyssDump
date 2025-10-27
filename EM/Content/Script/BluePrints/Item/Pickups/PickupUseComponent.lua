require("UnLua")
require("Utils")
require("DataMgr")
require("Const")
local GMVariable = require("BluePrints.UI.GMInterface.GMVariable")
local PickupUseComponent = {}

function PickupUseComponent:BatteryExceedMaxDropNum(Owner)
  if not IsDedicatedServer(Owner) and not IsStandAlone(Owner) then
    return
  end
  local GameState = UE4.UGameplayStatics.GetGameState(Owner)
  if nil ~= GameState and GameState.BatteryToTalNum > 0 then
    GameState.BatteryToTalNum = GameState.BatteryToTalNum - 1
  end
end

function PickupUseComponent:PostInitBattery(Owner)
  if not IsDedicatedServer(Owner) and not IsStandAlone(Owner) then
    return
  end
  local GameState = UE4.UGameplayStatics.GetGameState(Owner)
  if nil ~= GameState then
    GameState.BatteryToTalNum = GameState.BatteryToTalNum + 1
  end
end

function PickupUseComponent:CanBePickedUpHp(Character, Owner, ...)
  return Owner:HandleCombatConditionResult(Character, ...)
end

function PickupUseComponent:CalcPickUpHpUseParam(Character, Owner, ...)
  if 1 == DataMgr.Drop[Owner.UnitId].IsPercentage then
    Owner.UseParam = Owner.UseParam / 100 * Character:GetAttr("MaxHp")
  end
  return Owner.UseParam
end

function PickupUseComponent:CanBePickedUpGetResource(Character, Owner, ...)
  return Owner:HandleCombatConditionResult(Character, ...)
end

function PickupUseComponent:CanBePickedUpBattery(Character, Owner, ...)
  local Num = Character.BatteryNum
  local Result = true
  if not Num or Num >= Const.MaxBatteryOneChar then
    Result = false
  end
  return Owner:HandleCombatConditionResult(Character, ...) and Result
end

function PickupUseComponent:CanBePickedUpCrackKey(Character, Owner, ...)
  local Num = Character.CrackKeyNum
  local Result = true
  if not Num or Num >= Const.MaxCrackKeyOneChar then
    Result = false
  end
  return Owner:HandleCombatConditionResult(Character, ...) and Result
end

function PickupUseComponent:CanBePickedUpSp(Character, Owner, ...)
  return Owner:HandleCombatConditionResult(Character, ...)
end

function PickupUseComponent:CanBePickedUpAmmo(Character, Owner, ...)
  return Owner:HandleCombatConditionResult(Character)
end

function PickupUseComponent:CanBePickedUpGetMod(Character, Owner, ...)
  return Owner:HandleCombatConditionResult(Character, ...)
end

function PickupUseComponent:CanBePickedUpGetWeapon(Character, Owner, ...)
  return Owner:HandleCombatConditionResult(Character, ...)
end

function PickupUseComponent:CanBePickedUpReward(Character, Owner, ...)
  return Owner:HandleCombatConditionResult(Character, ...)
end

function PickupUseComponent:CanBePickedUpSurvival(Character, Owner, ...)
  return Owner:HandleCombatConditionResult(Character, ...)
end

function PickupUseComponent:RecoverHp(Character, Owner)
  if Character:IsDead() then
    return
  end
  if type(Owner.UseParam) == "number" then
    self:HandleRealPickupUseEffect(Character, Owner)
    if GMVariable.EnableShowBillboard then
      Character.JumpWordComponent:TryToShowJumpWord(UE4.FVector(0, 0, 0), nil, "Cure", Owner.UseParam, 0, Character.Eid, "", TArray(FName), TMap(FName, FRateStructFowShow))
    end
  end
end

function PickupUseComponent:RecoverSp(Character, Owner)
  if Character:IsDead() then
    return
  end
  if type(Owner.UseParam) == "number" then
    self:HandleRealPickupUseEffect(Character, Owner)
  end
end

function PickupUseComponent:HandleRealPickupUseEffect(Character, Owner)
  local PlayerCharacter = UE4.UGameplayStatics.GetPlayerCharacter(Character, 0)
  if PlayerCharacter:IsRobot() then
    return
  end
  PlayerCharacter:RealPickupUseEffect(Character.Eid, Owner.UnitId, 1, Owner:GetTransform(), Owner.Eid, Owner.bExtra)
end

function PickupUseComponent:RecoverAmmo(Character, Owner)
  if Character:IsDead() then
    return
  end
  if type(Owner.UseParam) == "number" then
    self:HandleRealPickupUseEffect(Character, Owner)
  end
end

function PickupUseComponent:GetResource(Character, Owner)
  if Character:IsDead() then
    return
  end
  if not DataMgr.Resource[Owner.UseParam] then
    return
  end
  self:HandleRealPickupUseEffect(Character, Owner)
end

function PickupUseComponent:GetReward(Character, Owner)
  if Character:IsDead() then
    return
  end
  self:HandleRealPickupUseEffect(Character, Owner)
end

function PickupUseComponent:GetMod(Character, Owner)
  if Character:IsDead() then
    return
  end
  self:HandleRealPickupUseEffect(Character, Owner)
end

function PickupUseComponent:GetWeapon(Character, Owner)
  if Character:IsDead() then
    return
  end
  self:HandleRealPickupUseEffect(Character, Owner)
end

function PickupUseComponent:RecoverSurvival(Character, Owner)
  self:HandleRealPickupUseEffect(Character, Owner)
end

function PickupUseComponent:PickUpBattery(Character, Owner)
  self:HandleRealPickupUseEffect(Character, Owner)
end

function PickupUseComponent:PickUpCrackKey(Character, Owner)
  self:HandleRealPickupUseEffect(Character, Owner)
end

function PickupUseComponent:CanBePickedUpExcavationItem(Character, Owner, ...)
  return Owner:HandleCombatConditionResult(Character, ...)
end

function PickupUseComponent:PickUpExcavationItem(Character, Owner)
  self:HandleRealPickupUseEffect(Character, Owner)
end

function PickupUseComponent.GetExcavationItemCount(ItemId)
  local DropData = DataMgr.Drop[ItemId]
  if not DropData then
    return nil
  end
  return DropData.UseParam
end

function PickupUseComponent:CanBePickedUpUseSkillEffect(Character, Owner, ...)
  return Owner:HandleCombatConditionResult(Character, ...)
end

function PickupUseComponent:TempleAddScore(Character, Owner)
  local GameMode = UE4.UGameplayStatics.GetGameMode(Owner)
  local DropData = DataMgr.Drop[Owner.UnitId]
  if GameMode and DropData and DropData.UseParam then
    GameMode:TriggerDungeonComponentFun("AddToScore", DropData.UseParam)
  end
  return true
end

function PickupUseComponent:CanBePickedUpTempleAddScore(Character, Owner)
  local GameState = UGameplayStatics.GetGameState(Character)
  return GameState and GameState.GameModeType == "Temple"
end

function PickupUseComponent:UseSkillEffect(Character, Owner)
  if Character:IsDead() then
    return
  end
  self:HandleRealPickupUseEffect(Character, Owner)
end

PickupUseComponent.CanBePickedUpFuncMap = {
  RecoverHp = PickupUseComponent.CanBePickedUpHp,
  RecoverSp = PickupUseComponent.CanBePickedUpSp,
  RecoverAmmo = PickupUseComponent.CanBePickedUpAmmo,
  GetReward = PickupUseComponent.CanBePickedUpReward,
  RecoverSurvival = PickupUseComponent.CanBePickedUpSurvival,
  PickUpBattery = PickupUseComponent.CanBePickedUpBattery,
  PickUpCrackKey = PickupUseComponent.CanBePickedUpCrackKey,
  GetMod = PickupUseComponent.CanBePickedUpGetMod,
  GetWeapon = PickupUseComponent.CanBePickedUpGetWeapon,
  PickUpExcavationItem = PickupUseComponent.CanBePickedUpExcavationItem,
  GetResource = PickupUseComponent.CanBePickedUpGetResource,
  UseSkillEffect = PickupUseComponent.CanBePickedUpUseSkillEffect,
  TempleAddScore = PickupUseComponent.CanBePickedUpTempleAddScore
}
PickupUseComponent.UseEffectTypeFuncMap = {
  RecoverHp = PickupUseComponent.RecoverHp,
  RecoverSp = PickupUseComponent.RecoverSp,
  RecoverAmmo = PickupUseComponent.RecoverAmmo,
  GetReward = PickupUseComponent.GetReward,
  RecoverSurvival = PickupUseComponent.RecoverSurvival,
  PickUpBattery = PickupUseComponent.PickUpBattery,
  PickUpCrackKey = PickupUseComponent.PickUpCrackKey,
  PickUpExcavationItem = PickupUseComponent.PickUpExcavationItem,
  GetMod = PickupUseComponent.GetMod,
  GetWeapon = PickupUseComponent.GetWeapon,
  GetResource = PickupUseComponent.GetResource,
  UseSkillEffect = PickupUseComponent.UseSkillEffect,
  TempleAddScore = PickupUseComponent.TempleAddScore
}
PickupUseComponent.CalcUseEffectTypeFuncMap = {
  RecoverHp = PickupUseComponent.CalcPickUpHpUseParam
}
PickupUseComponent.PostInitFuncMap = {
  PickUpBattery = PickupUseComponent.PostInitBattery
}
PickupUseComponent.ExceedMaxDropNumFuncMap = {
  PickUpBattery = PickupUseComponent.BatteryExceedMaxDropNum
}
PickupUseComponent.ClientGetItemCountFuncMap = {
  PickUpExcavationItem = PickupUseComponent.GetExcavationItemCount
}
PickupUseComponent.ClientGetWeaponId = {
  GetWeaponId = PickupUseComponent.GetExcavationItemCount
}
return PickupUseComponent
