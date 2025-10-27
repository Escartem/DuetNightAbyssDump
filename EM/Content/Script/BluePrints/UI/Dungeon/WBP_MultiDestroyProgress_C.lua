require("UnLua")
local WBP_MultiDestroyProgress_C = Class({
  "BluePrints.UI.BP_UIState_C"
})

function WBP_MultiDestroyProgress_C:OnLoaded(...)
  WBP_MultiDestroyProgress_C.Super.OnLoaded(self, ...)
  local BattleMain = UIManager(self):GetUIObj("BattleMain")
  assert(BattleMain, "WBP_Abyss_CountDown_C \229\138\160\232\189\189\230\151\182\230\139\191\228\184\141\229\136\176BattleMain\239\188\129")
  BattleMain.Pos_ProcessCabin:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  BattleMain.Pos_ProcessCabin:AddChild(self)
  self.IsInit = true
  self:AddDispatcher(EventID.OnRepHitSwitchTimer, self, self.SetPointCountDownPercent)
  self.StateToName = {
    [1] = "Lock",
    [2] = "CountDown",
    [3] = "CanStart",
    [4] = "Complete"
  }
  self.CommonStateToName = {
    [1] = "Lock",
    [2] = "Unlock",
    [3] = "Interaction",
    [4] = "Complete"
  }
  self.PointWidgetInstances = {}
  self.CurCountDownIndex = 0
  self:InitUIParams()
  self:InitPoints()
  self:BindToAnimationFinished(self.In, {
    self,
    self.SetPointPos
  })
  self:PlayAnimation(self.In)
end

function WBP_MultiDestroyProgress_C:InitUIParams()
  self.TotalPointNum = 4
  self.MultiDestroyTextMap = {
    [1] = "DUNGEON_ENGINE_102",
    [2] = "DUNGEON_ENGINE_104",
    [3] = "DUNGEON_ENGINE_101",
    [4] = "DUNGEON_ENGINE_103"
  }
  local IsSucc, UIParams = CommonUtils.GetDungeonUIParams("RegionMultiDestroyProgress")
  if not IsSucc then
    return
  end
  self.TotalPointNum = UIParams.TotalPointNums
  self.MultiDestroyTextMap = {}
  for i = 1, self.TotalPointNum do
    self.MultiDestroyTextMap[i] = UIParams["MultiDestroy_" .. i]
  end
end

function WBP_MultiDestroyProgress_C:InitPoints()
  for i = 1, self.TotalPointNum do
    local NewPointWidget = self:CreateWidgetNew("BattleProcessPoint")
    self.PointWidgetInstances[i] = NewPointWidget
    self.Point:AddChild(NewPointWidget)
    NewPointWidget:InitWidget(self, i)
    NewPointWidget:SetPointState(self.CommonStateToName[1])
  end
end

function WBP_MultiDestroyProgress_C:SetPointPos()
  local CanvasPanelWidthth = USlateBlueprintLibrary.GetLocalSize(self.Point:GetCachedGeometry()).X
  local PointInterval = CanvasPanelWidthth / (self.TotalPointNum - 1)
  for i, PointWidget in pairs(self.PointWidgetInstances) do
    local Slot = UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(PointWidget)
    Slot:SetSize(FVector2D(0, 0))
    Slot:SetPosition(FVector2D(PointInterval * (i - 1), 0))
  end
end

function WBP_MultiDestroyProgress_C:SetPointCountDownPercent(Percent)
  if self.PointWidgetInstances[self.CurCountDownIndex] then
    self.PointWidgetInstances[self.CurCountDownIndex]:UpdateColorBarProgressPercent(Percent)
  end
end

function WBP_MultiDestroyProgress_C:SetPointState(PointIndex, NewState)
  assert(PointIndex and PointIndex >= 1 and PointIndex <= self.TotalPointNum, "WBP_MultiDestroyProgress_C:SetPointState InValid PointIndex!")
  assert(NewState and NewState >= 1 and NewState <= 4, "WBP_MultiDestroyProgress_C:SetPointState Invalid NewState!")
  local PointWidget = self.PointWidgetInstances[PointIndex]
  local IsNewStateSet = PointWidget:SetPointState(self.CommonStateToName[NewState])
  if IsNewStateSet then
    local NewStateName = self.StateToName[NewState]
    if self["OnPointEnterState_" .. NewStateName] then
      self["OnPointEnterState_" .. NewStateName](self, PointIndex)
    end
  end
end

function WBP_MultiDestroyProgress_C:OnPointEnterState_CountDown(PointIndex)
  self.CurCountDownIndex = PointIndex
  self:UpdateMainText(string.format(GText(self.MultiDestroyTextMap[3]), PointIndex))
end

function WBP_MultiDestroyProgress_C:OnPointEnterState_CanStart(PointIndex)
  self:UpdateMainText(string.format(GText(self.MultiDestroyTextMap[1]), PointIndex))
end

function WBP_MultiDestroyProgress_C:OnPointEnterState_Complete(PointIndex)
  self:UpdateMainText(string.format(GText(self.MultiDestroyTextMap[2]), PointIndex))
  if self:IsAllPointsComplete() then
    self:UpdateMainText(GText(self.MultiDestroyTextMap[4]))
    self:PlayAnimation(self.Complete)
  end
end

function WBP_MultiDestroyProgress_C:IsAllPointsComplete()
  for _, PointWidget in pairs(self.PointWidgetInstances) do
    if PointWidget.CurState ~= self.CommonStateToName[4] then
      return false
    end
  end
  return true
end

function WBP_MultiDestroyProgress_C:UpdateMainText(NewText)
  self.Text_Title:SetText(NewText)
  self:PlayAnimation(self.Text_Refresh)
end

function WBP_MultiDestroyProgress_C:CloseDungeonUI()
  self:Close()
end

return WBP_MultiDestroyProgress_C
