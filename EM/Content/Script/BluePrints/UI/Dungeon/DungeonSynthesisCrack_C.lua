require("UnLua")
local M = Class("BluePrints.UI.BP_UIState_C")

function M:Construct()
  self.KeyItemTotalNum = 0
  self.KeyItemContents = {}
  self.LastKeySubmitNum = 0
end

function M:OnLoaded(...)
  self.Super.OnLoaded(self, ...)
  local BattleMainUI = UIManager(self):GetUIObj("BattleMain")
  if BattleMainUI then
    self:AddTaskToOverlay(BattleMainUI)
  end
  self:InitListenEvent()
  self:InitItemList()
  self:PlayAnimation(self.In)
  self.IsInit = true
end

function M:AddTaskToOverlay(BattleMainUI)
  BattleMainUI.Pos_Weekly:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  BattleMainUI.Pos_Weekly:AddChildToOverlay(self)
end

function M:InitListenEvent()
  self:AddDispatcher(EventID.OnRepKeySubmitNum, self, self.UpdateSubmitNum)
end

function M:InitItemList()
  self.List_KeyItem:ClearListItems()
  self.KeyItemContents = {}
  local DungeonData = DataMgr.Synthesis[GameState(self).DungeonId]
  if not DungeonData then
    GameState(self):ShowDungeonError("SynthesisComponent:Client \229\189\147\229\137\141\229\137\175\230\156\172ID\230\178\161\230\156\137\229\161\171\229\134\153\229\156\168\229\175\185\229\186\148\231\154\132\229\137\175\230\156\172\232\161\168\228\184\173, \232\175\187\232\161\168\229\164\177\232\180\165! \232\175\187\229\133\165Id\239\188\154" .. GameState(self).DungeonId)
    return
  end
  local CurKeySubmitNum = GameState(self).KeySubmitNum or 0
  self.KeyItemTotalNum = DungeonData.KeyNeedNum or 0
  for i = 1, self.KeyItemTotalNum do
    local KeyItemContent = NewObject(UIUtils.GetCommonItemContentClass())
    KeyItemContent.ParentWidget = self
    KeyItemContent.Index = i
    KeyItemContent.State = "Normal"
    self.List_KeyItem:AddItem(KeyItemContent)
    self.KeyItemContents[i] = KeyItemContent
  end
  self:UpdateSubmitNum(CurKeySubmitNum)
end

function M:UpdateSubmitNum(KeySubmitNum)
  local DisplayText = string.format(GText("DUNGEON_SYNTHESIS_104"), KeySubmitNum, self.KeyItemTotalNum)
  self.Text_Title:SetText(DisplayText)
  for i = self.LastKeySubmitNum + 1, KeySubmitNum do
    local Content = self.KeyItemContents[i]
    if Content then
      Content.State = "Activated"
      if Content.SelfWidget then
        Content.SelfWidget:UpdateState(Content.State)
      end
    end
  end
  self.LastKeySubmitNum = KeySubmitNum
end

function M:PlayOutAnimation()
  self:PlayAnimation(self.Out)
end

return M
