require("UnLua")
local BP_EnergySupplyBarComponent = Class("BluePrints.Common.TimerMgr")

function BP_EnergySupplyBarComponent:Init(UnitID)
  self.UnitID = UnitID
  self.MaxSurvivalValue = DataMgr.GlobalConstant.SurvivalValue.ConstantValue
  if self:GetWidget() then
    self:GetWidget():Hide()
    self:GetWidget():SetUnitParams(UnitID)
  end
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self:GetOwner())
  local UIManager = GameInstance:GetGameUIManager()
  if UIManager then
    local SurviveFloat = UIManager:GetUI("DungenonSurviveFloat")
    if SurviveFloat then
      SurviveFloat.CurTimeThres = DataMgr.Mechanism[UnitID].UnitParams.StageTime
    end
  end
  self.BuffId = DataMgr.Mechanism[UnitID].UnitParams.BuffId
  self.IsFaceToPlayer = true
  self.FxObjectCount = 0
end

function BP_EnergySupplyBarComponent:UITip(TipString)
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  local UIManager = GameInstance:GetGameUIManager()
  UIManager:ShowUITip_BattleCommonTop(UIConst.Tip_CommonTop, TipString)
end

function BP_EnergySupplyBarComponent:OnFxObjectCreated(FxObject)
  if not FxObject then
    return
  end
  self.FxObjectCount = self.FxObjectCount + 1
  FxObject.OnSystemFinished:Add(self, BP_EnergySupplyBarComponent.OnFxObjectFinished)
end

function BP_EnergySupplyBarComponent:OnFxObjectFinished()
  self.FxObjectCount = self.FxObjectCount - 1
end

function BP_EnergySupplyBarComponent:Initialize(Initializer)
  self.UnitID = 0
end

function BP_EnergySupplyBarComponent:ReceiveBeginPlay()
end

function BP_EnergySupplyBarComponent:ReceiveTick(DeltaSeconds)
  if self.IsFaceToPlayer == false then
    return
  end
  self:UpdateSupplyBarComponentRotation()
end

function BP_EnergySupplyBarComponent:UpdateSupplyBarComponentRotation()
  local LocPlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  if nil == LocPlayerController then
    return
  end
  local ViewTarget = LocPlayerController:GetViewTarget()
  local ViewLocation, ViewRotation = ViewTarget:GetActorEyesViewPoint()
  ViewRotation.Yaw = ViewRotation.Yaw + 180
  ViewRotation.Pitch = ViewRotation.Pitch * -1
  self:K2_SetWorldRotation(ViewRotation, false, nil, true)
end

function BP_EnergySupplyBarComponent:OnEnergyChanged(NewEnergy, bFromMonster)
  if not self.FxObjectCount then
    self.FxObjectCount = 0
  end
  if self.FxObjectCount > 0 then
    return
  end
  if not self:GetWidget() then
    return
  end
  local OldLevel, NewLevel = self:GetWidget():OnEnergyChanged(NewEnergy, bFromMonster)
  if NewLevel then
    self:OnBuffAdded(nil, self.BuffId, OldLevel, NewLevel)
  end
end

function BP_EnergySupplyBarComponent:OnBuffAdded(PlayerEid, BuffID, OldLayer, NewLayer)
  local DungeonId = GWorld.GameInstance:GetCurrentDungeonId()
  local BuffInfo = DataMgr.SurvivalPro[DungeonId].BuffDescribe[BuffID]
  if not BuffInfo then
    return
  end
  local BuffNumer = string.match(BuffInfo, "%d+") * NewLayer
  local BuffText = tostring(BuffNumer)
  local Percent = string.find(BuffInfo, "%", 0, true)
  if Percent then
    BuffText = BuffText .. "%"
  end
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self:GetOwner())
  local UIManager = GameInstance:GetGameUIManager()
  if UIManager then
    local SurviveFloat = UIManager:GetUI("DungenonSurviveFloat")
    self:AddTimer(1, function()
      SurviveFloat:UpdateBuffLevel(BuffID, BuffText)
      SurviveFloat:OnEnergyChanged(NewLayer > OldLayer)
    end)
  end
end

function BP_EnergySupplyBarComponent:OnPlayerLeft(PlayerEid)
  self:UITip("DUNGEON_SURVIVALPRO_101")
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self:GetOwner())
  local UIManager = GameInstance:GetGameUIManager()
  local SurvivalProPanel = UIManager:GetUIObj("DungenonSurviveFloat")
  if SurvivalProPanel then
    SurvivalProPanel:PlayAnimation(SurvivalProPanel.Task_In)
    SurvivalProPanel:ReshowAllBuffInfo()
    return true
  end
  return false
end

function BP_EnergySupplyBarComponent:OnPlayerIn(PlayerEid, BuffID)
  if not DataMgr.Buff[BuffID] then
    return false
  end
  local BuffTypeImgPath = DataMgr.Buff[BuffID].BuffTypeImgPath
  local BuffIconPath
  if BuffTypeImgPath then
    BuffIconPath = "/Game/UI/Texture/Dynamic/Atlas/Buff/T_Buff_" .. BuffTypeImgPath .. ".T_Buff_" .. BuffTypeImgPath
  else
    BuffIconPath = "/Game/UI/Texture/Dynamic/Atlas/Buff/T_Buff_Damage_Up.T_Buff_Damage_Up"
  end
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self:GetOwner())
  local UIManager = GameInstance:GetGameUIManager()
  local SurvivalProPanel = UIManager:GetUIObj("DungenonSurviveFloat")
  if not SurvivalProPanel then
    return false
  end
  self:UITip("DUNGEON_SURVIVALPRO_100")
  if SurvivalProPanel then
    SurvivalProPanel:CloseBuffPanel(BuffID)
  end
  self:AddTimer(1, function()
    local OldLevel, NewLevel = self:GetWidget():OnEnergyChanged()
    if OldLevel ~= NewLevel then
      self:OnBuffAdded(nil, self.BuffId, 0, NewLevel)
    end
  end)
  return true
end

return BP_EnergySupplyBarComponent
