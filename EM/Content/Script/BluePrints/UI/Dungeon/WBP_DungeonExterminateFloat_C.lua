require("UnLua")
local WBP_DungeonExterminateFloat_C = Class("BluePrints.UI.Dungeon.WBP_DungeonUIBase_C")

function WBP_DungeonExterminateFloat_C:Initialize(Initializer)
  self.Super.Initialize(self)
end

function WBP_DungeonExterminateFloat_C:InitListenEvent()
  self.Super.InitListenEvent(self)
  self:AddDispatcher(EventID.OnRepExterminateKilledNum, self, self.OnRepExterminateKilledNum)
end

function WBP_DungeonExterminateFloat_C:OnLoaded(...)
  self.Super.OnLoaded(self, ...)
  self:InitListenEvent()
  self.GameState = UE4.UGameplayStatics.GetGameState(self)
  if not self.GameState then
    return
  end
  self.ExterminateTotalNum = self.GameState.ExterminateTotalNum
  self.ExterminateKilledNum = self.GameState.ExterminateKilledNum
  self.Text_AnnihilateTitle:SetText(GText("DUNGEON_EXTERMINATE_100"))
  self.Text_AnnihilateNum:SetText(self.ExterminateKilledNum .. "/" .. self.ExterminateTotalNum)
  if 0 == self.ExterminateTotalNum then
    self.Progress_Annihilate:SetPercent(0)
  else
    self.Progress_Annihilate:SetPercent(self.ExterminateKilledNum / self.ExterminateTotalNum)
  end
  self:PlayAnimation(self.In)
end

function WBP_DungeonExterminateFloat_C:OnRepExterminateKilledNum()
  if not self.GameState then
    return
  end
  self.ExterminateKilledNum = self.GameState.ExterminateKilledNum
  self.Text_AnnihilateNum:SetText(self.ExterminateKilledNum .. "/" .. self.ExterminateTotalNum)
  self.Progress_Annihilate:SetPercent(self.ExterminateKilledNum / self.ExterminateTotalNum)
  if self.ExterminateKilledNum >= self.ExterminateTotalNum then
    self:PlayAnimation(self.Complete)
    self.Group_Full:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    self:RemoveDispatcher(EventID.OnRepExterminateKilledNum)
  end
end

return WBP_DungeonExterminateFloat_C
