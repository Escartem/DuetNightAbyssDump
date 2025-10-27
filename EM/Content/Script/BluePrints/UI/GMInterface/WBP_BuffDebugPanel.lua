require("UnLua")
local WBP_BuffDebugPanel = Class({
  "BluePrints.UI.BP_UIState_C",
  "BluePrints.Common.TimerMgr"
})

function WBP_BuffDebugPanel:OnLoaded(...)
  self.Entity = (...)
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  local UIManager = GameInstance:GetGameUIManager()
  self.RepeatTimer = self:AddTimer(0.5, self.RefreshBuffDebugPanel, true, 0, "RefreshBuffDebugPanel")
end

function WBP_BuffDebugPanel:SetEntity(Entity)
  if not Entity.BuffManager then
    return
  end
  self.Entity = Entity
end

function WBP_BuffDebugPanel:RefreshBuffDebugPanel()
  self.DebugStr = ""
  self.Prefix = ""
  local Buffs = self.Entity.BuffManager.Buffs
  for i = 1, Buffs:Length() do
    local Buff = Buffs:GetRef(i)
    self:AddBuff(Buff, "")
  end
  self.TextInfo:SetText(self.DebugStr)
end

function WBP_BuffDebugPanel:AddBuff(BuffObj)
  local BuffData = DataMgr.Buff[BuffObj.BuffId]
  self:AppendStr(string.format("BuffId: %d  LeftTime:%.1f Value:%.1f Layer:%d FreeLayer:%dSourceEid:%d RootSourceEid:%d MergeRule: %s, %s", BuffObj.BuffId, BuffObj.LeftTime, BuffObj.Value, BuffObj.Layer, BuffObj.FreeLayer, BuffObj.SourceEid, BuffObj.RootSourceEid, BuffData.MergeRule1, BuffData.MergeRule2))
  local Layers = BuffObj:GetFreeLayers()
  for i = 1, Layers:Length() do
    local Layer = Layers:GetRef(i)
    self:AddLayer(Layer)
  end
end

function WBP_BuffDebugPanel:AddLayer(Layer)
  self:AppendTab()
  local CurrentTime = UE4.UGameplayStatics.GetTimeSeconds(self)
  self:AppendStr(string.format("Layer Uid:%d, LeftTime:%.1f  Value:%.1f  Layer:%d  SourceEid:%d  RootSourceEid:%d  IsDirty:%s", Layer.Uid, Layer.StartTime + Layer.LastTime - CurrentTime, Layer.Value, Layer.Layer, Layer.SourceEid, Layer.RootSourceEid, tostring(Layer.bIsDirty)))
  self:RemoveTab()
end

function WBP_BuffDebugPanel:AppendStr(InStr)
  self.DebugStr = self.DebugStr .. self.Prefix .. InStr .. "\n"
end

function WBP_BuffDebugPanel:AppendTab()
  self.Prefix = self.Prefix .. "    "
end

function WBP_BuffDebugPanel:RemoveTab()
  self.Prefix = self.Prefix:sub(1, -5)
end

return WBP_BuffDebugPanel
