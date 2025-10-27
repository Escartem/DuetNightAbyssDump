require("UnLua")
local BP_ResourcePoint_C = Class("BluePrints/Item/CombatProp/BP_CombatPropBase_C")

function BP_ResourcePoint_C:AuthorityInitInfo(Info)
  BP_ResourcePoint_C.Super.AuthorityInitInfo(self, Info)
  self.FirstRefresh = self.UnitParams.FirstRefresh
  self.RefreshCD = self.UnitParams.RefreshCD
  self.NeedAttach = self.UnitParams.NeedAttach
end

function BP_ResourcePoint_C:CommonInitInfo(Info)
  BP_ResourcePoint_C.Super.CommonInitInfo(self, Info)
  self.CountDownTime = 0
  self.ResourceNum = 0
end

function BP_ResourcePoint_C:ClientInitInfo(Info)
  BP_ResourcePoint_C.Super.ClientInitInfo(self, Info)
  self.BillboardComponent:InitItemsBillBoard(self, "BreakableItem")
  self.BillboardComponent:SetWidgetClassByBpPath("WidgetBlueprint'/Game/UI/UI_PC/Common/Common_Circular_Progress_Bar.Common_Circular_Progress_Bar_C'")
  self.BillboardComponent:ShowOrHideBloodBar(false)
  local Height = self.Position.RelativeLocation.Z
  self.BillboardComponent:K2_SetRelativeLocation(UE4.FVector(0, 0, Height), false, nil, false)
  EventManager:AddEvent(EventID.OnItemPickedUp, self, self.ShowCountDown)
end

function BP_ResourcePoint_C:OnActorReady(Info)
  BP_ResourcePoint_C.Super.OnActorReady(self, Info)
  self:ShowCountDown(self.Eid, self.FirstRefresh)
end

function BP_ResourcePoint_C:CreateReward()
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  local RewardTransform = self.Position:K2_GetComponentToWorld()
  if GameMode and self.RewardID then
    local DropIds = DataMgr.Reward[self.RewardId].Id
    for i, DropId in pairs(DropIds) do
      local Context = AEventMgr.CreateUnitContext()
      Context.UnitType = "Drop"
      Context.UnitId = DropId
      Context.Loc = RewardTransform.Translation
      Context.IntParams:Add("ParentEid", self.Eid)
      Context.StrParams:Add("ReasonType", CommonConst.RewardReason.Chest)
      if self.NeedAttach then
        Context:AddObjectParams("AttachActor", self)
      end
      GameMode.EMGameState.EventMgr:CreateUnitNew(Context, false)
    end
  end
end

function BP_ResourcePoint_C:ShowCountDown(SourceEid, Time)
  if SourceEid ~= self.Eid then
    return
  end
  self.BillboardComponent:ShowOrHideBloodBar(true)
  self.CountDownTime = 0
  if not self.CountDownHandle then
    self.CountDownHandle = self:AddTimer(0.1, self.CountDown, true, 0, nil, nil, Time)
  end
end

function BP_ResourcePoint_C:CountDown(Time)
  self.CountDownTime = self.CountDownTime + 0.1
  local RealTime = Time or self.RefreshCD
  if nil == Time and 0 == RealTime then
    self.BillboardComponent:ShowOrHideBloodBar(false)
    self:RemoveTimer(self.CountDownHandle)
    self.CountDownHandle = nil
    self:MarkIsNeedShowCountdownUI(false)
    return
  end
  if RealTime <= self.CountDownTime then
    self.BillboardComponent:ShowOrHideBloodBar(false)
    self:MarkIsNeedShowCountdownUI(false)
    self:CreateReward()
    self:RemoveTimer(self.CountDownHandle)
    self.CountDownHandle = nil
  end
  local Widget = self.BillboardComponent:GetWidget()
  if Widget and Widget.SetPercent then
    Widget:SetPercent(self.CountDownTime / RealTime)
  end
  if self.CountDownTime < RealTime + 0.001 then
    self:MarkIsNeedShowCountdownUI(true)
  end
end

function BP_ResourcePoint_C:ReceiveEndPlay(Reason)
  self.Overridden.ReceiveEndPlay(self, Reason)
  self:RemoveTimer(self.CountDownHandle)
  EventManager:RemoveEvent(EventID.OnItemPickedUp, self)
end

function BP_ResourcePoint_C:MarkIsNeedShowCountdownUI(bIsNeed)
  if self.BillboardComponent then
    local UI = self.BillboardComponent:GetUserWidgetObject()
    UI.bCanShow = bIsNeed
  end
end

return BP_ResourcePoint_C
