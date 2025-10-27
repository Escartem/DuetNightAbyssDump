require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:ShowTempleInfo(TempleInfo)
  self.TempleInfo = TempleInfo
  self.Image_Complete:SetVisibility(ESlateVisibility.Collapsed)
  self.Image_NoComplete:SetVisibility(ESlateVisibility.Collapsed)
  self.New:SetVisibility(ESlateVisibility.Collapsed)
  self.Text_TempleConveyDesc:SetText(TempleInfo.Name)
  self.WS_Item:SetActiveWidgetIndex(0)
  self.Group_Forbidden:SetVisibility(ESlateVisibility.Collapsed)
  self.Text_TempleConveyDesc:SetColorAndOpacity(self.TempleConveyDesc_Normal)
  print(_G.LogTag, "LXZ ShowTempleInfo", TempleInfo.PassInfo)
  if TempleInfo.PassInfo == "NoConfigReward" then
    DebugPrint("\231\165\158\229\186\153\230\156\170\233\133\141\231\189\174\229\165\150\229\138\177")
  elseif TempleInfo.PassInfo == "Lock" or TempleInfo.PassInfo == "NoCompleteCondition" then
    self.WS_Item:SetActiveWidgetIndex(1)
    self.WS_Sign:SetActiveWidgetIndex(0)
    self:SetGreyImage(TempleInfo)
    self.Text_TempleConveyDesc:SetColorAndOpacity(self.TempleConveyDesc_LockForbidden)
  elseif TempleInfo.PassInfo == "NoEnterInfo" then
    self.New:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self:SetGreyImage(TempleInfo)
  elseif TempleInfo.PassInfo == "NoPass" then
    self:SetGreyImage(TempleInfo)
  elseif TempleInfo.PassInfo == "PassNoStar" then
    self.Image_Complete:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self.WS_Star:SetActiveWidgetIndex(1)
  elseif TempleInfo.PassInfo == "PassStar" then
    self.WS_Star:SetActiveWidgetIndex(2)
    for i = 1, TempleInfo.Star do
      self["WBP_LevelMap_TempleStarItem_" .. i]:SetSmallStar()
      self["WBP_LevelMap_TempleStarItem_" .. i]:SetTipsNormal()
    end
    for i = 3, TempleInfo.Star + 1, -1 do
      self["WBP_LevelMap_TempleStarItem_" .. i]:SetSmallStar()
      self["WBP_LevelMap_TempleStarItem_" .. i]:SetTipsEmpty()
    end
    if 3 == self.TempleInfo.Star then
      self.Image_Complete:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    else
      self.Image_NoComplete:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    end
  elseif TempleInfo.PassInfo == "InSpecialQuest" then
    self.WS_Item:SetActiveWidgetIndex(1)
    self.WS_Sign:SetActiveWidgetIndex(1)
    self.Group_Forbidden:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self.Text_TempleConveyDesc:SetColorAndOpacity(self.TempleConveyDesc_LockForbidden)
    if TempleInfo.IsStarLevel and TempleInfo.Star then
      self.WS_Star:SetActiveWidgetIndex(2)
      for i = 1, 3 do
        self["WBP_LevelMap_TempleStarItem_" .. i]:SetSmallStar()
        if i <= TempleInfo.Star then
          self["WBP_LevelMap_TempleStarItem_" .. i]:SetTipsNormal()
        else
          self["WBP_LevelMap_TempleStarItem_" .. i]:SetTipsEmpty()
        end
      end
    else
      self.WS_Star:SetActiveWidgetIndex(0)
    end
  end
end

function M:SetGreyImage(TempleInfo)
  if TempleInfo.IsStarLevel then
    self.WS_Star:SetActiveWidgetIndex(2)
    for i = 1, 3 do
      self["WBP_LevelMap_TempleStarItem_" .. i]:SetSmallStar()
      self["WBP_LevelMap_TempleStarItem_" .. i]:SetTipsEmpty()
    end
  else
    self.WS_Star:SetActiveWidgetIndex(0)
  end
  self.Image_NoComplete:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
end

function M:OnClickTempleItem()
  if not self.TempleInfo then
    return
  end
  local GameInstance = GWorld.GameInstance
  local UIManager = GameInstance:GetGameUIManager()
  local GameMode = UE4.UGameplayStatics.GetGameMode(GameInstance)
  local Avatar = GWorld:GetAvatar()
  if not (UIManager and GameMode) or not Avatar then
    return
  end
  if self.TempleInfo.PassInfo == "Lock" then
    UIManager:ShowUITip(UIConst.Tip_CommonTop, GText("UI_Tosat_Temple_Locked"))
  elseif self.TempleInfo.PassInfo == "NoCompleteCondition" and self.TempleInfo.ConditionId > 0 then
    UIManager:ShowUITip(UIConst.Tip_CommonTop, string.format(GText("UI_Temple_Lockedcondition"), GText("Name_" .. self.TempleInfo.ConditionId)))
  elseif Avatar:IsInTeam() and DataMgr.Temple[self.TempleInfo.TempleId] ~= nil then
    UIManager:ShowUITip(UIConst.Tip_CommonTop, GText("UI_Temple_FAIL_INTEAM"))
  elseif self.TempleInfo.PassInfo == "InSpecialQuest" then
    UIManager:ShowUITip(UIConst.Tip_CommonTop, GText("UI_Disabled_Des_Temple"))
  else
    local PopupId = 100117
    local Params = {}
    Params.RightCallbackObj = self
    Params.RightCallbackFunction = self.EnterTemple
    Params.ShortText = string.format(GText("UI_COMMONPOP_TEXT_100117"), self.TempleInfo.Name)
    UIManager:ShowCommonPopupUI(PopupId, Params, self)
  end
end

function M:EnterTemple()
  if self.TempleInfo.CloseFunc then
    self.TempleInfo.CloseFunc()
  end
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  local bIsInTeam = Avatar:IsInTeam()
  if bIsInTeam then
    Avatar:EnterDungeon(self.TempleInfo.TempleId, CommonConst.DungeonNetMode.Standalone, function(RetCode, ...)
      local bCanEnter = self.HandleEnterDungeonRetCode(RetCode, ...)
      if bCanEnter then
        UIManager(self):LoadUINew("DungeonMatchTimingBar", self.TempleInfo.TempleId, Const.DUNGEON_MATCH_BAR_STATE.SPONSOR_WAITING_CONFIRM, false)
      end
    end)
  else
    Avatar:EnterDungeon(self.TempleInfo.TempleId)
  end
end

function M.HandleEnterDungeonRetCode(RetCode, ...)
  ErrorCode:Check(RetCode)
  if RetCode == ErrorCode.RET_SUCCESS then
    return true
  else
    TeamController:DoWhenEnterDungeonCheckFailed(RetCode, ...)
    EventManager:FireEvent(EventID.TeamMatchTimingEnd)
    return false
  end
end

return M
