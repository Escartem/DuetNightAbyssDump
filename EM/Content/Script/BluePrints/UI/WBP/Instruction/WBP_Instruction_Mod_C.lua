require("UnLua")
local ActivityUtils = require("Blueprints.UI.WBP.Activity.ActivityUtils")
local M = Class("BluePrints.UI.BP_EMUserWidget_C")
M._components = {
  "BluePrints.UI.WBP.Activity.Widget.View.ActivityPlayerTaskItemView"
}

function M:Construct()
  self.GroupNum = 0
  self.IsModGuide = true
  self.CurPhaseNum = 0
  self.RefreshCount = 0
end

function M:InitView()
  self:InitQuest()
  self:UpdateDesc()
end

function M:InitQuest()
  self.VBox:ClearChildren()
  self.AllQuestPhaseIdValue = {}
  self.CurGuideQuest = {}
  for Id, Quest in pairs(DataMgr.ModGuideQuest) do
    local PhaseId = Quest.QuestPhaseId
    self.AllQuestPhaseIdValue[PhaseId] = self.AllQuestPhaseIdValue[PhaseId] or {}
    table.insert(self.AllQuestPhaseIdValue[PhaseId], Id)
  end
  self.PhaseNum = #self.AllQuestPhaseIdValue
  self:UpdateCurrentPhase()
  for _, Value in ipairs(self.CurGuideQuest) do
    local ModItem = UIManager(self):CreateWidget("/Game/UI/WBP/Instruction/Widget/WBP_Instruction_ModItem.WBP_Instruction_ModItem", false)
    ModItem:Init(Value, self)
    self.VBox:AddChildToVerticalBox(ModItem)
  end
end

function M:UpdateCurrentPhase()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  for PhaseId, Phase in ipairs(self.AllQuestPhaseIdValue) do
    local AllComplete = true
    self.CurGuideQuest = {}
    for _, GuideQuestId in pairs(Phase) do
      table.insert(self.CurGuideQuest, GuideQuestId)
      if Avatar.ModGuideQuests[GuideQuestId] and (Avatar.ModGuideQuests[GuideQuestId]:IsComplete() == false or not Avatar.ModGuideQuests[GuideQuestId].RewardsGot) then
        AllComplete = false
      end
    end
    if not AllComplete then
      self.CurPhaseNum = PhaseId
      return
    end
  end
  self.CurGuideQuest = {}
end

function M:UpdateDesc()
  local Desc = string.format(GText("ModGuideQuest_Title"), GText("ModGuideQuest_SubTitle" .. tostring(self.CurPhaseNum)))
  self.Text_Title:SetText(Desc)
end

function M:GetSub()
  return "(" .. tostring(self.CurPhaseNum) .. "/" .. tostring(self.PhaseNum) .. ")"
end

function M:RefreshAllItem()
  self.RefreshCount = self.RefreshCount + 1
  self:UpdateCurrentPhase()
  self:UpdateDesc()
  if 0 == #self.CurGuideQuest or self.RefreshCount > self.PhaseNum + 2 then
    self:PlayAnimation(self.Out)
    return
  end
  self.VBox:ClearChildren()
  for _, Value in ipairs(self.CurGuideQuest) do
    local ModItem = UIManager(self):CreateWidget("/Game/UI/WBP/Instruction/Widget/WBP_Instruction_ModItem.WBP_Instruction_ModItem", false)
    ModItem:Init(Value, self)
    self.VBox:AddChildToVerticalBox(ModItem)
  end
end

function M:UpdateItem(QuestId)
  local AllChildren = self.VBox:GetAllChildren()
  for i = 1, AllChildren:Length() do
    local SubItem = AllChildren:GetRef(i)
    if SubItem.QuestId == QuestId then
      SubItem:UpdateDesc()
    end
  end
end

function M:OnItemComplete(QuestId)
  local Avatar = GWorld:GetAvatar()
  if Avatar and not ConditionUtils.CheckCondition(Avatar, {2, 5}) then
    return
  end
  local AllChildren = self.VBox:GetAllChildren()
  for i = 1, AllChildren:Length() do
    local SubItem = AllChildren:GetRef(i)
    if SubItem.QuestId == QuestId then
      local BattleMain = UIManager(self):GetUIObj("BattleMain")
      if BattleMain and (BattleMain:GetVisibility() == ESlateVisibility.Collapsed or self:GetVisibility() == ESlateVisibility.Collapsed) then
        return
      end
      SubItem:PlayCompleteAnim()
      return
    end
  end
end

function M:TryGetReward()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  local AllChildren = self.VBox:GetAllChildren()
  for i = 1, AllChildren:Length() do
    local SubItem = AllChildren:GetRef(i)
    if Avatar.ModGuideQuests[SubItem.QuestId]:IsComplete() and not Avatar.ModGuideQuests[SubItem.QuestId].RewardsGot then
      SubItem:PlayCompleteAnim()
    end
  end
end

function M:TryRefreshAllItem()
  local Avatar = GWorld:GetAvatar()
  local AllChildren = self.VBox:GetAllChildren()
  local AllComplete = true
  for i = 1, AllChildren:Length() do
    local SubItem = AllChildren:GetRef(i)
    if Avatar.ModGuideQuests[SubItem.QuestId] and (not Avatar.ModGuideQuests[SubItem.QuestId]:IsComplete() or not Avatar.ModGuideQuests[SubItem.QuestId].RewardsGot) then
      AllComplete = false
    end
  end
  if AllComplete then
    self:RefreshAllItem()
  end
end

function M:ShowReward(QuestId)
  QuestId = tonumber(QuestId)
  local RewardId = DataMgr.ModGuideQuest[QuestId].QuestReward
  local RewardList = {}
  for _, Id in ipairs(RewardId) do
    local RewardInfo = DataMgr.Reward[Id]
    if RewardInfo then
      local RewardIds = RewardInfo.Id or {}
      local RewardCounts = RewardInfo.Count or {}
      local RewardTypes = RewardInfo.Type or {}
      for i = 1, #RewardIds do
        local ItemId = RewardIds[i]
        local Count = RewardUtils:GetCount(RewardCounts[i])
        local Rarity = ItemUtils.GetItemRarity(ItemId, RewardTypes[i])
        local ItemType = RewardTypes[i]
        local RewardContent = {
          ItemId = ItemId,
          ItemType = ItemType,
          Count = Count,
          Rarity = Rarity
        }
        table.insert(RewardList, RewardContent)
      end
    end
  end
  UIUtils.ShowHudReward("ModGuideQuest_RewardReminder", RewardList)
end

AssembleComponents(M)
return M
