require("UnLua")
local M = Class("BluePrints/Item/Chest/BP_MechanismBase_C")

function M:OpenMechanism()
  if self.OpenState then
    return
  end
  self:UpdateRegionData("OpenState", true)
  self:CreateReward()
  self:DeactiveGuide()
  EventManager:FireEvent(EventID.OnDeliveryMeshanismOpen, self.CreatorId)
end

function M:OnActorReady(Info)
  M.Super.OnActorReady(self, Info)
  self:GMUnlock()
end

function M:GMUnlock()
  if not Const.UnlockRegionTeleport then
    return
  end
  if self.StateId == 901000 then
    self:ChangeState("GM", 0, 901001)
  elseif self.StateId == 901010 then
    self:ChangeState("GM", 0, 901011)
  end
end

function M:ShowToast(ToastText)
  if not DataMgr.TeleportStaticId2TeleportPointName[self.CreatorId] then
    GWorld.logger.error("\228\188\160\233\128\129\231\130\185" .. self:GetName() .. ", \233\157\153\230\128\129\229\136\183\230\150\176\231\130\185ID" .. self.CreatorId .. "\232\161\168\229\134\133\233\133\141\231\189\174\231\188\186\229\164\177")
    return true
  end
  local AnchorName = DataMgr.TeleportStaticId2TeleportPointName[self.CreatorId].TeleportPointName
  if not AnchorName then
    GWorld.logger.error("\228\188\160\233\128\129\231\130\185" .. self:GetName() .. ", \233\157\153\230\128\129\229\136\183\230\150\176\231\130\185ID" .. self.CreatorId .. "\232\161\168\229\134\133\233\133\141\231\189\174\231\188\186\229\176\145\229\144\141\229\173\151")
    return true
  end
  local UIManager = GWorld.GameInstance:GetGameUIManager()
  UIManager:ShowUITip(UIConst.Tip_CommonTop, GText(AnchorName) .. GText(ToastText))
  return true
end

function M:InitTempleInteractiveComponent()
  if not DataMgr.TeleportStaticId2TeleportPointName[self.CreatorId] then
    return
  end
  self.TempleIds = DataMgr.TeleportStaticId2TeleportPointName[self.CreatorId].Temples
  if not self.TempleIds then
    return
  end
  self.TempleOrder = {}
  self.TempleInteractiveComponents = {}
  for i = 1, #self.TempleIds do
    local ComponentClass = LoadClass("/Game/BluePrints/Item/Delivery/BP_DeliveryTempleInteractiveComponent.BP_DeliveryTempleInteractiveComponent_C")
    local Component = self:AddComponentByClass(ComponentClass, false, FTransform(), false)
    Component:SetTempleId(self.TempleIds[i])
    Component.InteractiveDistance = self.DefaultInteractiveComponent.InteractiveDistance
    Component.InteractiveAngle = self.DefaultInteractiveComponent.InteractiveAngle
    Component.InteractiveFaceAngle = self.DefaultInteractiveComponent.InteractiveFaceAngle
    Component:InitCommonUIConfirmID(self.Data.InteractiveId)
    self.TempleInteractiveComponents[i] = Component
    if i >= 2 then
      self.TempleOrder[self.TempleIds[i]] = self.TempleIds[i - 1]
    end
  end
end

function M:DisplayInteractiveBtn(PlayerActor)
  if self.TempleInteractiveComponents then
    for i = 1, #self.TempleInteractiveComponents do
      self.TempleInteractiveComponents[i]:DisplayInteractiveBtn(PlayerActor)
    end
  end
end

function M:NotDisplayInteractiveBtn(PlayerActor)
  if self.TempleInteractiveComponents then
    for i = 1, #self.TempleInteractiveComponents do
      self.TempleInteractiveComponents[i]:NotDisplayInteractiveBtn(PlayerActor)
    end
  end
end

function M:OnEnterState(NowStateId)
  if not self.UnitParams.TempleStateId then
    return
  end
  if NowStateId == self.UnitParams.TempleStateId then
    self:InitTempleInteractiveComponent()
  end
end

return M
