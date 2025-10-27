require("UnLua")
local EnumPlayerTaskState = require("Blueprints.UI.WBP.Activity.ActivityUtils").EnumPlayerTaskState
local M = {}

function M:InitItemView()
  self.RewardItemWidth = nil
  self.CurTaskItemState = nil
  self.Text_Progressing:SetText(GText("UI_GameEvent_ToBeFinished"))
  self.Btn_Reward:BindEventOnClicked(self, self.ReceiveReward)
  self.Btn_Reward:SetText(GText("UI_GameEvent_ClaimReward"))
  self.Btn_Goto:BindEventOnClicked(self, self.GoToSystem)
  self.Btn_Goto:SetText(GText("UI_GameEvent_Goto"))
end

function M:RefreshContentView(IsEmpty, ItemContent, TaskConfigData, TaskServerData)
  self.WS:SetActiveWidgetIndex(IsEmpty and 1 or 0)
  if IsEmpty then
    self.Group_Empty:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    return
  end
  self.WS_Text:SetActiveWidgetIndex(TaskConfigData.JumpUIId and 0 or 1)
  local QuestDesc = GText(TaskConfigData.StarterQuestDes)
  if QuestDesc then
    local TargetProgress = TaskConfigData.Target
    local FinalStr = string.gsub(QuestDesc, "#1", TargetProgress)
    self.Text_Desc:SetText(FinalStr)
  else
    self.Text_Desc:SetText("")
  end
  self:RefreshRewardItemView(TaskConfigData)
  self:RefreshProcessView(TaskConfigData, TaskServerData)
  local IsFinish = self:IsPlayerTaskFinish()
  if IsFinish then
    self:PlayAnimation(self.Recived)
  else
    self:StopAllAnimations()
    self:PlayAnimation(self.Normal)
    self:StopAllAnimations()
    self:PlayAnimation(self.In)
  end
end

function M:RefreshRewardItemView(TaskConfigData)
  local QuestRewards = TaskConfigData.QuestReward
  local Index = 0
  if QuestRewards then
    local RewardList = {}
    
    local function FillWithRewardData(QuestReward)
      local RewardInfo = DataMgr.Reward[QuestReward]
      if RewardInfo then
        local RewardIds = RewardInfo.Id or {}
        local RewardCounts = RewardInfo.Count or {}
        local RewardTypes = RewardInfo.Type or {}
        for i = 1, #RewardIds do
          local ItemId = RewardIds[i]
          local Count = RewardUtils:GetCount(RewardCounts[i])
          local Icon = ItemUtils.GetItemIconPath(ItemId, RewardTypes[i])
          local Rarity = ItemUtils.GetItemRarity(ItemId, RewardTypes[i])
          local ItemType = RewardTypes[i]
          local RewardContent = {
            Id = ItemId,
            Type = ItemType,
            ItemCount = Count,
            Icon = Icon,
            Rarity = Rarity
          }
          table.insert(RewardList, RewardContent)
        end
      end
    end
    
    if type(QuestRewards) == "table" then
      for i, v in ipairs(QuestRewards) do
        FillWithRewardData(v)
      end
    else
      FillWithRewardData(QuestRewards)
    end
    table.sort(RewardList, function(A, B)
      local RarityX = A.Rarity or 1
      local RarityY = B.Rarity or 1
      if RarityX == RarityY then
        return A.Id < B.Id
      else
        return RarityX > RarityY
      end
    end)
    for _, ItemInfo in pairs(RewardList) do
      local ItemId = ItemInfo.Id
      local RewardObject = {}
      RewardObject.ParentWidget = self
      RewardObject.ItemType = ItemInfo.Type
      RewardObject.Id = ItemInfo.Id
      RewardObject.Count = ItemInfo.ItemCount
      RewardObject.Icon = ItemInfo.Icon
      RewardObject.Rarity = ItemInfo.Rarity or 1
      RewardObject.IsShowDetails = true
      RewardObject.UIText_Desc = "ActivityNewPlayerTask"
      RewardObject.HandleMouseDown = true
      RewardObject.NotInteractive = ItemInfo.TableText_Desc == "Char"
      if ItemInfo.Type == "Char" then
        RewardObject.OnMouseButtonUpEvents = {
          Obj = self,
          Callback = function()
            local WorldContext = GWorld.GameInstance
            UIManager(WorldContext):LoadUINew("ArmoryDetail", {
              PreviewCharIds = {ItemId},
              EPreviewSceneType = CommonConst.EPreviewSceneType.PreviewCommon,
              bHideBoxBtn = true,
              bNoEndCamera = true,
              OnCloseDelegate = nil
            })
          end
        }
      end
      Index = Index + 1
      self.Item_Reward_2:SetNavigationRuleBase(EUINavigation.Up, EUINavigationRule.Stop)
      self.Item_Reward_2:SetNavigationRuleBase(EUINavigation.Down, EUINavigationRule.Stop)
      if 1 == Index then
        self.Item_Reward_2:Init(RewardObject)
        self.Item_Reward_2:BindEvents(self, {
          OnMenuOpenChanged = self.OnStuffMenuOpenChanged
        })
      elseif 2 == Index then
        self.Item_Reward_2:SetNavigationRuleExplicit(EUINavigation.Left, self.Item_Reward_1)
        self.Item_Reward_1:SetNavigationRuleExplicit(EUINavigation.Right, self.Item_Reward_2)
        self.Item_Reward_1:SetNavigationRuleBase(EUINavigation.Up, EUINavigationRule.Stop)
        self.Item_Reward_1:SetNavigationRuleBase(EUINavigation.Down, EUINavigationRule.Stop)
        self.Item_Reward_1:Init(RewardObject)
        self.Item_Reward_1:BindEvents(self, {
          OnMenuOpenChanged = self.OnStuffMenuOpenChanged
        })
      end
    end
  end
  self.IsTwoReward = Index > 1
  self.Item_Reward_1:SetVisibility(Index > 1 and UIConst.VisibilityOp.Visible or UIConst.VisibilityOp.Collapsed)
  self.Item_Reward_2:SetVisibility(Index > 0 and UIConst.VisibilityOp.Visible or UIConst.VisibilityOp.Collapsed)
  self.Item_Reward_2:SetNavigationRuleBase(EUINavigation.Right, EUINavigationRule.Stop)
end

function M:OnStuffMenuOpenChanged(bIsOpen)
  if UIUtils.UtilsGetCurrentInputType() ~= ECommonInputType.Gamepad then
    return
  end
  if bIsOpen then
    self:UpdatKeyDisplay("RewardWidgetDetail")
  else
    self:UpdatKeyDisplay("RewardWidget")
  end
end

function M:IsTaskRewardNotReceive()
  return self.CurTaskItemState == EnumPlayerTaskState.NotGetReward
end

function M:IsPlayerTaskFinish()
  return self.CurTaskItemState == EnumPlayerTaskState.Completed
end

function M:IsGoToSystem()
  return 0 == self.WS_Text:GetActiveWidgetIndex() and 0 == self.Switch_Btn:GetActiveWidgetIndex()
end

function M:GetCurTaskItemState()
  return self.CurTaskItemState
end

function M:RefreshProcessView(TaskConfigData, TaskServerData)
  if nil == TaskServerData then
    self.CurTaskItemState = EnumPlayerTaskState.NotStart
    self.Switch_Btn:SetActiveWidgetIndex(0)
    self.Text_Progress:SetText("0/" .. TaskConfigData.Target .. "")
  elseif not TaskServerData:IsComplete() then
    self.CurTaskItemState = EnumPlayerTaskState.NotComplete
    self.Switch_Btn:SetActiveWidgetIndex(0)
    self.Text_Progress:SetText("" .. TaskServerData:GetCurrentCount(TaskConfigData.TargetId) .. "/" .. TaskConfigData.Target .. "")
  elseif TaskServerData:CanRecvReward() then
    self.CurTaskItemState = EnumPlayerTaskState.NotGetReward
    self.Switch_Btn:SetActiveWidgetIndex(1)
    self.Text_Complete:SetText("" .. TaskServerData:GetCurrentCount(TaskConfigData.TargetId) .. "/" .. TaskConfigData.Target .. "")
  else
    self.CurTaskItemState = EnumPlayerTaskState.Completed
    self.Switch_Btn:SetActiveWidgetIndex(2)
  end
end

return M
