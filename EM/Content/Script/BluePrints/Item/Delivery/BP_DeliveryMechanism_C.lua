require("UnLua")
local BP_DeliveryMechanism_C = Class({
  "BluePrints.Item.BP_CombatItemBase_C",
  "BluePrints.Common.TimerMgr"
})

function BP_DeliveryMechanism_C:ReceiveBeginPlay()
  BP_DeliveryMechanism_C.Super.ReceiveBeginPlay(self)
  self.DeliveryInteractiveBaseComponent.DisPlayInteractiveName = GText(self.DeliveryInteractiveBaseComponent.InteractiveName)
  self.DefaultInteractiveComponent = self.DeliveryInteractiveBaseComponent
end

function BP_DeliveryMechanism_C:ReceiveEndPlay(Reason)
  UIManager(self):RemoveWidgetComponentToList(self.Eid, "DeliverMechanism")
  BP_DeliveryMechanism_C.Super.ReceiveEndPlay(self, Reason)
end

function BP_DeliveryMechanism_C:AuthorityInitInfo(Info)
  BP_DeliveryMechanism_C.Super.AuthorityInitInfo(self, Info)
  if self.ManualItemId > 0 then
    local GameState = UE4.UGameplayStatics.GetGameState(self)
    GameState.DeliveryMechanismMap:Add(self.ManualItemId, self)
    self.CanOpen = true
  end
end

function BP_DeliveryMechanism_C:OnActorReady(Info)
  BP_DeliveryMechanism_C.Super.OnActorReady(self, Info)
end

function BP_DeliveryMechanism_C:OpenMechanism(PlayerActorEid)
  if not self:HandleLevelDeliver() then
    return
  end
end

function BP_DeliveryMechanism_C:HandleLevelDeliver()
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  if not GameMode then
    return false
  end
  return GameMode:HandleLevelDeliver(self.ModeType, self.Id, self.StartIndex)
end

function BP_DeliveryMechanism_C:SetDeliveryInfo(StartIndex, Id, ModeType)
  self.StartIndex = StartIndex
  self.Id = Id
  self.ModeType = ModeType
  local Data = {
    StartIndex = self.StartIndex,
    Id = self.Id,
    ModeType = self.ModeType
  }
  self:UpdateRegionDataByTable(Data)
end

function BP_DeliveryMechanism_C:CreateRegionData()
  self.RegionData = {
    CanOpen = self.CanOpen,
    StateId = self.StateId
  }
end

function BP_DeliveryMechanism_C:ClientInitInfo(Info)
  BP_DeliveryMechanism_C.Super.ClientInitInfo(self, Info)
  if self.BubbleIconTexture then
    if self.BubbleWidgetComponent then
      return
    end
    local ComponentClass = LoadClass("/Game/BluePrints/Item/BP_DeliveryMechanism_WidgetComponent.BP_DeliveryMechanism_WidgetComponent")
    self.BubbleWidgetComponent = self:AddComponentByClass(ComponentClass, false, FTransform(), false)
    if self.BubbleWidgetComponent then
      local UIManager = GWorld.GameInstance:GetGameUIManager()
      UIManager:AddWidgetComponentToList(self.Eid, "DeliverMechanism", self.BubbleWidgetComponent)
    end
    if self.BubbleWidgetComponent:GetWidget() then
      self.BubbleWidgetComponent:GetWidget().IconDisplayDistance = self.IconDisplayDistance
      self.BubbleWidgetComponent:GetWidget().MechanismLoc = self:K2_GetActorLocation()
      self.BubbleWidgetComponent:GetWidget().Img_Entrance:SetBrushResourceObject(self.BubbleIconTexture)
    end
  end
end

function BP_DeliveryMechanism_C:SetBubbleWidgetShowOrHide(InIsShow)
  if IsAuthority(self) and not IsStandAlone(self) then
    return
  end
  local IsShow = InIsShow
  if (self.BubbleWidgetComponent == nil or nil == self.BubbleWidgetComponent:GetWidget()) and self.BubbleIconTexture then
    if self.BubbleWidgetComponent then
      return
    end
    local ComponentClass = LoadClass("/Game/BluePrints/Item/BP_DeliveryMechanism_WidgetComponent.BP_DeliveryMechanism_WidgetComponent")
    self.BubbleWidgetComponent = self:AddComponentByClass(ComponentClass, false, FTransform(), false)
    if self.BubbleWidgetComponent then
      local UIManager = GWorld.GameInstance:GetGameUIManager()
      UIManager:AddWidgetComponentToList(self.Eid, "DeliverMechanism", self.BubbleWidgetComponent)
    end
    if self.BubbleWidgetComponent:GetWidget() then
      self.BubbleWidgetComponent:GetWidget().IconDisplayDistance = self.IconDisplayDistance
      self.BubbleWidgetComponent:GetWidget().MechanismLoc = self:K2_GetActorLocation()
      self.BubbleWidgetComponent:GetWidget().Img_Entrance:SetBrushResourceObject(self.BubbleIconTexture)
    end
  end
  if self.BubbleWidgetComponent ~= nil then
    if IsShow then
      self.BubbleWidgetComponent:GetWidget().Main:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    else
      self.BubbleWidgetComponent:GetWidget().Main:SetVisibility(UE4.ESlateVisibility.Collapsed)
    end
  end
end

function BP_DeliveryMechanism_C:GMUnlock()
  if 25 == self.StateId then
    self:ChangeState("GM", 0, 26)
  end
end

return BP_DeliveryMechanism_C
