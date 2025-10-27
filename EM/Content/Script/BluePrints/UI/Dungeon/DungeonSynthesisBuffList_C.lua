require("UnLua")
local M = Class("BluePrints.UI.BP_EMDungeonWidget_C")

function M:Construct()
  self.BuffIds = {
    5000301,
    5000302,
    5000303,
    5000304
  }
  self.BuffIconPath = {
    [5000301] = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Weekly/T_Buff_SpeedUp_Weekly.T_Buff_SpeedUp_Weekly'",
    [5000302] = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Weekly/T_Buff_BlueUp_Weekly.T_Buff_BlueUp_Weekly'",
    [5000303] = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Weekly/T_Buff_FlyAtk_Weekly.T_Buff_FlyAtk_Weekly'",
    [5000304] = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Weekly/T_Buff_AtkUp_Weekly.T_Buff_AtkUp_Weekly'"
  }
  self.BuffItemContents = {}
end

function M:Init()
  local BattleMainUI = UIManager(self):GetUIObj("BattleMain")
  if BattleMainUI then
    self:AddToBattleMain()
  else
    self:AddTimer(0.1, self.AddToBattleMain, true, 0, "AddSelfToBattleMain")
  end
  self:InitBuffList()
  self:InitListenEvent()
end

function M:AddToBattleMain(BattleMainUI)
  local BattleMainUI = UIManager(self):GetUIObj("BattleMain")
  if not BattleMainUI then
    return
  end
  BattleMainUI.Pos_Weekly_Buff:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  BattleMainUI.Pos_Weekly_Buff:AddChildToOverlay(self)
  self:RemoveTimer("AddSelfToBattleMain")
end

function M:InitBuffList()
  self.ListView_Buff:ClearListItems()
end

function M:InitListenEvent()
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  for _, BuffId in pairs(self.BuffIds) do
    Player.BuffManager:BP_BindOnBuffAdded(BuffId, {
      self,
      self.OnBuffAdded
    })
    Player.BuffManager:BP_BindOnBuffRemoved(BuffId, {
      self,
      self.OnBuffRemoved
    })
    Player.BuffManager:BP_BindOnBuffRefreshed(BuffId, {
      self,
      self.OnBuffRefreshed
    })
  end
end

function M:RemoveListenEvent()
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  for _, BuffId in pairs(self.BuffIds) do
    Player.BuffManager:BP_UnbindOnBuffAdded(BuffId, {
      self,
      self.OnBuffAdded
    })
    Player.BuffManager:BP_UnbindOnBuffRemoved(BuffId, {
      self,
      self.OnBuffRemoved
    })
    Player.BuffManager:BP_UnbindOnBuffRefreshed(BuffId, {
      self,
      self.OnBuffRefreshed
    })
  end
end

function M:OnBuffAdded(Buff)
  if not Buff then
    return
  end
  local BuffId = Buff.BuffId
  DebugPrint("SynthesisComponent: OnBuffAdded", BuffId)
  if self.BuffItemContents[BuffId] then
    return
  end
  self:RealAddBuffItem(BuffId)
end

function M:RealAddBuffItem(BuffId)
  local BuffItemContent = NewObject(UIUtils.GetCommonItemContentClass())
  BuffItemContent.BuffId = BuffId
  BuffItemContent.BuffIconPath = self.BuffIconPath[BuffId]
  self.ListView_Buff:AddItem(BuffItemContent)
  self.BuffItemContents[BuffId] = BuffItemContent
  self:AddTimer(0.1, self.UpdateBuffInfo, true, 0, "UpdateBuffInfo_" .. BuffId, true, BuffId)
end

function M:CheckBuffValid(BuffId)
  local Buff = self:GetBuffById(BuffId)
  if not Buff then
    return false
  end
  return true
end

function M:GetBuffById(BuffId)
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  if not Player then
    return nil
  end
  return Battle(self):FindBuffById(Player, BuffId, 0, false)
end

function M:UpdateBuffInfo(BuffId)
  local Buff = self:GetBuffById(BuffId)
  if not Buff then
    return
  end
  local RemainTimePercent = Buff:GetLeftTime() / Buff.LastTime
  local BuffContent = self.BuffItemContents[BuffId]
  if not BuffContent then
    return
  end
  if not BuffContent.SelfWidget then
    return
  end
  BuffContent.SelfWidget:UpdateDiplayPercent(RemainTimePercent)
end

function M:OnBuffRemoved(Buff, RemoveReason)
  if not Buff then
    return
  end
  local BuffId = Buff.BuffId
  DebugPrint("SynthesisComponent: OnBuffRemoved", BuffId)
  self:RemoveTimer("UpdateBuffInfo_" .. BuffId)
  
  local function cb()
    self.ListView_Buff:RemoveItem(self.BuffItemContents[BuffId])
    self.BuffItemContents[BuffId] = nil
  end
  
  self.BuffItemContents[BuffId].SelfWidget:HideBuffItem(self, cb)
end

function M:OnBuffRefreshed(Buff)
  if not Buff then
    return
  end
  local BuffId = Buff.BuffId
  DebugPrint("SynthesisComponent: OnBuffRefreshed", BuffId)
  if not self.BuffItemContents[BuffId] then
    return
  end
  
  local function cb()
    self.ListView_Buff:RemoveItem(self.BuffItemContents[BuffId])
    if self:CheckBuffValid(BuffId) then
      self:RealAddBuffItem(BuffId)
    end
  end
  
  self:RemoveTimer("UpdateBuffInfo_" .. BuffId)
  self.BuffItemContents[BuffId].SelfWidget:HideBuffItem(self, cb)
end

function M:Destruct()
  self:RemoveListenEvent()
end

return M
