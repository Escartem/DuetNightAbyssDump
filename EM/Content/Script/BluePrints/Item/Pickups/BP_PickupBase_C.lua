require("UnLua")
local UIUtils = require("Utils.UIUtils")
local CommonConst = require("CommonConst")
local PickupUseComponent = require("BluePrints.Item.Pickups.PickupUseComponent")
local BP_PickupBase_C = Class({
  "BluePrints.Item.SceneItemBase"
})

function BP_PickupBase_C:AuthorityInitInfo(Info)
end

function BP_PickupBase_C:ClientCreateInitInfo(Info)
end

function BP_PickupBase_C:CreateRegionData()
  local Location = self:K2_GetActorLocation()
  local Rotation = self:K2_GetActorRotation()
  self.RegionData = {
    Location = {
      [1] = Location.X,
      [2] = Location.Y,
      [3] = Location.Z
    },
    Rotation = {
      [1] = Rotation.Pitch,
      [2] = Rotation.Yaw,
      [3] = Rotation.Roll
    }
  }
end

function BP_PickupBase_C:GetRarity()
  return self.Rarity
end

function BP_PickupBase_C:CheckUnitNeedStorage()
  return self.RegionDataType ~= ERegionDataType.RDT_None
end

function BP_PickupBase_C:CheckRarity(TargetRarity)
  TargetRarity = TargetRarity or 3
  return TargetRarity <= self.Data.Rarity
end

function BP_PickupBase_C:ClientInitInfo(Info)
end

function BP_PickupBase_C:CheckIsNeedShowGuideCallback(IsShowInMinimap, IsAllConditionAchieve)
  DebugPrint("BP_PickupBase_C:CheckIsNeedShowGuideCallback IsShowInMinimap", IsShowInMinimap, "IsAllConditionAchieve", IsAllConditionAchieve)
  local ItemInfo = self.Data
  if nil == ItemInfo then
    if IsValid(self.GuideIconComponent) then
      if self.GuideIconComponent:GetWidget() then
        self.GuideIconComponent:SetWidgetHiddenByTag(true, "Pickup")
      end
      self.GuideIconComponent:SetHiddenInGame(true)
    end
    DebugPrint("BP_PickupBase_C:iteminfo nil")
    return
  end
  if IsAllConditionAchieve then
    if IsShowInMinimap then
      EventManager:FireEvent(EventID.ShowDropInMinimap, self, true)
      if IsValid(self.GuideIconComponent) then
        if self.GuideIconComponent:GetWidget() then
          self.GuideIconComponent:SetWidgetHiddenByTag(true, "Pickup")
        end
        self.GuideIconComponent:SetHiddenInGame(true)
      end
    else
      if not IsValid(self.GuideIconComponent) then
        self:CreateAndAddGuideIconComponent()
      end
      local PlayerCharacter = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
      self.GuideIconComponent:InitGuide(self, ItemInfo.PickType, self.ToCharacter or PlayerCharacter, ItemInfo.GuideIconBPPath, self.GuideIconRenderSize, self.GuideIconOffsetZ, "PickUp", "Guide", nil)
      if self.GuideIconComponent:GetWidget() then
        self.GuideIconComponent:SetWidgetHiddenByTag(false, "Pickup")
      end
      self.GuideIconComponent:SetHiddenInGame(false)
    end
  elseif IsShowInMinimap then
    EventManager:FireEvent(EventID.ShowDropInMinimap, self, false)
    if IsValid(self.GuideIconComponent) then
      if self.GuideIconComponent:GetWidget() then
        self.GuideIconComponent:SetWidgetHiddenByTag(true, "Pickup")
      end
      self.GuideIconComponent:SetHiddenInGame(true)
    end
  elseif IsValid(self.GuideIconComponent) then
    if self.GuideIconComponent:GetWidget() then
      self.GuideIconComponent:SetWidgetHiddenByTag(true, "Pickup")
    end
    self.GuideIconComponent:SetHiddenInGame(true)
  end
  return IsAllConditionAchieve
end

function BP_PickupBase_C:OnActorReady(Info)
  BP_PickupBase_C.Super.OnActorReady(self, Info)
  if PickupUseComponent.PostInitFuncMap[self.UseEffectType] ~= nil then
    PickupUseComponent.PostInitFuncMap[self.UseEffectType](PickupUseComponent, self)
  end
  local AttachActor = Info:FindObjectParams("AttachActor")
  if AttachActor then
    self:K2_AttachToActor(AttachActor, "", UE4.EAttachmentRule.SnapToTarget, UE4.EAttachmentRule.SnapToTarget, UE4.EAttachmentRule.SnapToTarget)
  end
end

function BP_PickupBase_C:OnPickedUp(Character)
  self:InvokeSource()
  self:OnClientPickUp(Character)
end

function BP_PickupBase_C:OnClientPickUp(Character)
  if IsDedicatedServer(self) then
    return
  end
  local DropData = self.Data
  if Character:IsMainPlayer() then
    local NumFunc = PickupUseComponent.ClientGetItemCountFuncMap[DropData.UseEffectType]
    local Avatar = GWorld:GetAvatar()
    if Avatar then
      local Rewards = {
        [self.UnitId] = NumFunc and NumFunc(self.UnitId) or 1
      }
      Avatar:ShowRewardUI(Rewards, "Drop")
    else
      UIUtils.ShowGotItemTipsUI("Drop", self.ItemId, NumFunc and NumFunc(self.UnitId) or nil)
    end
    local PickUpSeId = DataMgr.Drop[self.UnitId] and DataMgr.Drop[self.UnitId].PickUpAudioPath
    if PickUpSeId then
      AudioManager(self):PlaySeById(self, PickUpSeId)
    else
      AudioManager(self):PlayDropPickupSe(self, self.AudioRarity)
    end
  end
end

function BP_PickupBase_C:OnRep_ServerInitSuccess()
  if not self.ServerInitSuccess then
    self.InitSuccess = false
  end
end

function BP_PickupBase_C:OnRep_ServerInitCount()
  self.InitSuccess = false
  self:K2_SetActorLocation(self.ServerInitLocation, false, nil, false)
  self.InfoForInitNew.UnitId = self.UnitId
  self.InfoForInitNew.UnitType = self.UnitType
  self:TryInitActorInfo("InitInfo")
end

function BP_PickupBase_C:DestroyByExceedMaxDropNum()
  if PickupUseComponent.ExceedMaxDropNumFuncMap[self.UseEffectType] ~= nil then
    PickupUseComponent.ExceedMaxDropNumFuncMap[self.UseEffectType](PickupUseComponent, self)
  end
end

function BP_PickupBase_C:SetLifeTime(LifeTime, Reason)
  DebugPrint("THY_ \229\189\147\229\137\141\230\173\187\228\186\161\231\154\132\230\156\186\229\133\179\229\144\141\231\167\176\228\184\186\239\188\154 ", self:GetName(), self.UnitType, LifeTime, Reason, self.IsCache)
  if self.IsCache then
    return
  end
  
  local function TryDestroy()
    self:EMActorDestroy(EDestroyReason.MechanismLifeTime)
  end
  
  self:AddTimer(LifeTime, TryDestroy, false)
end

function BP_PickupBase_C:TriggerFallingCallable()
  DebugPrint("OtherActor is Falling Dead. ActorName: ", self:GetName(), ", UnitId: ", self.UnitId, ", Eid: ", self.Eid, ", CreatorId: ", self.CreatorId, " CreatorType: ", self.CreatorType, ", BornPos: ", self.BornPos)
  self:SetLifeTime(1.0, EDeathReason.TriggerFalling)
end

function BP_PickupBase_C:TriggerWaterFallingCallable()
  self:TriggerFallingCallable()
end

function BP_PickupBase_C:GetItemId()
  return self.UnitId
end

function BP_PickupBase_C:InvokeSource_lua()
  if not self.SourceEid then
    return
  end
  EventManager:FireEvent(EventID.OnItemPickedUp, self.SourceEid)
end

function BP_PickupBase_C:RedirectRarity()
  local HandleEffectTypeFunctionName = "Handle" .. self.UseEffectType
  if self[HandleEffectTypeFunctionName] then
    self[HandleEffectTypeFunctionName](self)
  end
end

function BP_PickupBase_C:HandleGetResource()
  self.Rarity = DataMgr.Resource[self.UseParam].Rarity
end

function BP_PickupBase_C:HandleGetMod()
  self.Rarity = DataMgr.Mod[self.UseParam].Rarity
end

function BP_PickupBase_C:AddPickupBaseToCache_Lua()
end

function BP_PickupBase_C:OnEMActorDestroy(DestroyReason)
  BP_PickupBase_C.Super.OnEMActorDestroy(self, DestroyReason)
  if DestroyReason ~= EDestroyReason.Pickup then
    return
  end
  if self.UseEffectType == "GetResource" or self.UseEffectType == "GetMod" or self.UseEffectType == "GetWeapon" then
    return
  end
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  if not GameMode then
    return
  end
  local CallbackMap = GameMode.PickUpSuccessCallback
  if CallbackMap and CallbackMap[self.UnitId] then
    for _, Callback in pairs(CallbackMap[self.UnitId]) do
      Callback()
    end
  end
end

return BP_PickupBase_C
