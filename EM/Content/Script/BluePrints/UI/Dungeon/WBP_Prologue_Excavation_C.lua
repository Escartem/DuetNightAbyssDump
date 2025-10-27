require("UnLua")
require("DataMgr")
local WBP_Prologue_Excavation_C = Class({
  "BluePrints.UI.Dungeon.WBP_DungeonUIBase_C",
  "BluePrints.Common.TimerMgr"
})

function WBP_Prologue_Excavation_C:Construct()
  self.Eids = {}
end

function WBP_Prologue_Excavation_C:OnLoaded(...)
  self.Super.OnLoaded(self, ...)
  self.Eids = {}
  self:InitListenEvent()
  self:AddDispatcher(EventID.OnExcavationItemChange, self, self.OnExcavationItemChange)
  self:AddDispatcher(EventID.OnExcavationFinish, self, self.OnExcavationFinish)
  self:AddDispatcher(EventID.OnAttractBattery, self, self.OnAttractBattery)
  self:AddDispatcher(EventID.OnExcavationGetReward, self, self.OnExcavationGetReward)
  self:AddDispatcher(EventID.OnRepDungeonProgress, self, self.UpdateDungeonProgressDisplay)
  self.GetReward = 0
  self.LastReward = 0
  self.Text_Number:SetText(0)
  self.List_EnergyProgress:ClearListItems()
  self:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self.Text_Title:SetText(GText("DUNGEON_EXCAVATION_100"))
  self.Text_Progress:SetText(GText("DUNGEON_EXCAVATION_103"))
  self.GameState = UE4.UGameplayStatics.GetGameState(self, 0)
  self.Panel_Wave_Now:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  self.Text_Wave_Now:SetText(GText("TARGET_DUNGEON_ROUND"))
  self:UpdateDungeonProgressDisplay(self.GameState.DungeonProgress)
end

function WBP_Prologue_Excavation_C:UpdateDungeonProgressDisplay(DungeonProgress)
  self.Num_Wave_Now:SetText(DungeonProgress)
end

function WBP_Prologue_Excavation_C:Tick(MyGeometry, InDeltaTime)
  if self.GameState.ExcavationItemNum ~= self.GetReward then
    self.GetReward = self.GameState.ExcavationItemNum
    self:OnExcavationGetReward(self.GetReward)
  end
end

function WBP_Prologue_Excavation_C:OnExcavationItemChange(Type, Eid)
  if "Add" == Type then
    if #self.Eids >= 6 then
      print(_G.LogTag, "Error: HYY Mech num > 6")
      return
    end
    table.insert(self.Eids, Eid)
    local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
    if nil == GameInstance then
      DebugPrint("OnExcavationItemChange: GameInstance \228\184\141\229\173\152\229\156\168")
      return
    end
    local SceneManager = GameInstance:GetSceneManager()
    if nil == SceneManager then
      DebugPrint("OnExcavationItemChange: SceneManager \228\184\141\229\173\152\229\156\168")
      return
    end
    local NewEnergyBarData = NewObject(UE4.LoadClass(UIConst.DUNGEONEXCAVATIONENERGYBARDATA))
    NewEnergyBarData.TargetMachineEid = Eid
    NewEnergyBarData.Owner = self
    self.List_EnergyProgress:AddItem(NewEnergyBarData)
    self:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  end
  if "Remove" == Type then
    for i = #self.Eids, 1, -1 do
      if self.Eids[i] == Eid then
        local RemoveItem = self.List_EnergyProgress:GetItemAt(i - 1)
        RemoveItem.PlayOutAnim:Broadcast()
      end
    end
  end
end

function WBP_Prologue_Excavation_C:OnExcavationFinish(Eid)
  DebugPrint("DiggingLogs OnExcavationFinish")
  for i = #self.Eids, 1, -1 do
    if self.Eids[i] == Eid then
      local RemoveItem = self.List_EnergyProgress:GetItemAt(i - 1)
      RemoveItem.OnDiggingFinish:Broadcast()
      RemoveItem.PlayFinishAnim:Broadcast()
    end
  end
end

function WBP_Prologue_Excavation_C:RemoveItemFromListViewCallback(RemoveItem)
  local Eid = RemoveItem.TargetMachineEid
  DebugPrint("DiggingLogs RemoveItemFromListViewCallback", Eid)
  for i = #self.Eids, 1, -1 do
    if self.Eids[i] == Eid then
      table.remove(self.Eids, i)
    end
  end
  self.List_EnergyProgress:RemoveItem(RemoveItem)
  if 0 == self.List_EnergyProgress:GetNumItems() then
    self:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
end

function WBP_Prologue_Excavation_C:OnAttractBattery(Eid, BatteryEnergy)
  for i = #self.Eids, 1, -1 do
    if self.Eids[i] == Eid then
      self.List_EnergyProgress:GetItemAt(i - 1).OnAttractBattery:Broadcast(BatteryEnergy)
    end
  end
end

function WBP_Prologue_Excavation_C:StopWarning()
  for i = 1, #self.Eids do
    local ListItem = self.List_EnergyProgress:GetItemAt(i - 1)
    ListItem.OnBarsHide:Broadcast()
  end
end

function WBP_Prologue_Excavation_C:Hide()
  self.Super.Hide(self)
  for i = 1, #self.Eids do
    local ListItem = self.List_EnergyProgress:GetItemAt(i - 1)
    ListItem.OnBarsHide:Broadcast()
  end
end

function WBP_Prologue_Excavation_C:Show()
  self.Super.Show(self)
  for i = 1, #self.Eids do
    local ListItem = self.List_EnergyProgress:GetItemAt(i - 1)
    ListItem.OnBarsShow:Broadcast()
  end
end

function WBP_Prologue_Excavation_C:OnExcavationGetReward(Num)
  self:RemoveTimer("TryToAddReward")
  local AddReward = Num - self.LastReward
  self.Text_Add:SetText("+" .. AddReward)
  self:AddTimer(0.5, self.TryToAddReward, false, 0, "TryToAddReward", false, Num)
end

function WBP_Prologue_Excavation_C:TryToAddReward(Num)
  self:PlayAnimation(self.complete_Add)
  UE4.ULTweenBPLibrary.DelayFrameCall(self, 24, function()
    self:SetRewardNum(Num)
  end)
end

function WBP_Prologue_Excavation_C:SetRewardNum(Num)
  self.Text_Number:SetText(Num)
  self.LastReward = Num
end

function WBP_Prologue_Excavation_C:Close()
  self.Super.Close(self)
end

return WBP_Prologue_Excavation_C
