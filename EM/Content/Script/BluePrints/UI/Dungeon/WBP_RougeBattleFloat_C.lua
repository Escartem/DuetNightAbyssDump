require("UnLua")
local WBP_RougeBattleFloat_C = Class("BluePrints.UI.Dungeon.WBP_DungeonUIBase_C")

function WBP_RougeBattleFloat_C:Initialize(Initializer)
  self.Super.Initialize(self)
end

function WBP_RougeBattleFloat_C:InitListenEvent()
  self.Super.InitListenEvent(self)
end

function WBP_RougeBattleFloat_C:OnLoaded(...)
  self.Super.OnLoaded(self, ...)
  self:InitListenEvent()
  self.GameState = UE4.UGameplayStatics.GetGameState(self)
  if not self.GameState then
    return
  end
  local MaxNum = self.GameState.RougeBattleMaxNum or 1
  local Count = self.GameState.RougeBattleCount or 0
  self.Text_AnnihilateNum:SetText(Count .. "/" .. MaxNum)
  self.Progress_Annihilate:SetPercent(0)
  self:PlayAnimation(self.In)
  self:RefreshVisibility()
end

function WBP_RougeBattleFloat_C:InitRougeBattleDisplayText(DisplayText)
  if "" == DisplayText then
    self.Text_AnnihilateTitle:SetText(GText("DUNGEON_EXTERMINATE_100"))
  else
    self.Text_AnnihilateTitle:SetText(GText(DisplayText))
  end
end

function WBP_RougeBattleFloat_C:OnRepRougeBattleCount()
  if not self.GameState then
    return
  end
  local MaxNum = self.GameState.RougeBattleMaxNum or 1
  local Count = self.GameState.RougeBattleCount or 0
  self.Text_AnnihilateNum:SetText(Count .. "/" .. MaxNum)
  self.Progress_Annihilate:SetPercent(Count / MaxNum)
  if MaxNum <= Count then
    self:PlayAnimation(self.Complete)
    self.Group_Full:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    self:RemoveDispatcher(EventID.OnRepRougeBattleCount)
  end
end

function WBP_RougeBattleFloat_C:RefreshVisibility()
  local IsRougeBattleUIStateShow = self.GameState.DungeonUIState == Const.EDungeonUIState.OnTarget
  local RoomType = DataMgr.RougeLikeRoom[GWorld.RougeLikeManager.RoomId].RoomType or 1
  local IsShowBattlePanel = DataMgr.RougeLikeRoomType[RoomType].IsShowBattlePanel
  DebugPrint("WBP_RougeBattleFloat_C:RefreshVisibility IsRougeBattleUIStateShow:", IsRougeBattleUIStateShow, "IsShowBattlePanel:", IsShowBattlePanel)
  self:SetRougeBattleVisibility(IsRougeBattleUIStateShow and IsShowBattlePanel)
  self.Group_Full:SetVisibility(UE4.ESlateVisibility.Hidden)
  self:AddDispatcher(EventID.OnRepRougeBattleCount, self, self.OnRepRougeBattleCount)
end

function WBP_RougeBattleFloat_C:SetRougeBattleVisibility(IsShow)
  if IsShow then
    self:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  else
    self:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
end

return WBP_RougeBattleFloat_C
