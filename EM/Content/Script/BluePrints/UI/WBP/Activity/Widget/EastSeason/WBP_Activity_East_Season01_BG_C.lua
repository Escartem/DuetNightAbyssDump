require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})
local ActivityReddotHelper = require("BluePrints.UI.WBP.Activity.ActivityReddotHelper")
local ActivityUtils = require("Blueprints.UI.WBP.Activity.ActivityUtils")
local EastSeasonQuestUtils = require("BluePrints.UI.WBP.Activity.Widget.EastSeason.EastSeasonQuestUtils")

function M:InitUI(ActivityConfigData, PageConfigData)
  self.FocusWidgetName = "SelectView"
  self.IsLock = false
  local PlayerAvatar = GWorld:GetAvatar()
  if PageConfigData.JumpUnlockCondition and not ConditionUtils.CheckCondition(PlayerAvatar, PageConfigData.JumpUnlockCondition) then
    self.IsLock = true
  end
  self.EventId = ActivityConfigData.EventId
  for i = 1, 4 do
    local Entrance = self["Entrance0" .. i]
    if Entrance then
      Entrance.EventId = ActivityConfigData.EventId
      Entrance.TabId = i
      Entrance.ParentWidget = self
      Entrance:InitUI()
      if self.IsLock then
        Entrance:PlayAnimation(Entrance.Info_Forbidden)
        Entrance:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
      else
        Entrance:PlayAnimation(Entrance.Info_Normal)
        Entrance:SetVisibility(UIConst.VisibilityOp.Visible)
      end
    end
  end
end

function M:PlaySplineAnimation()
  for i = 1, 4 do
    local Entrance = self["Entrance0" .. i]
    if Entrance then
      Entrance:AddSpline(self.IsLock)
    end
  end
end

function M:RefreshUI()
  self:PlayAnimation(self.In)
  for i = 1, 4 do
    local Entrance = self["Entrance0" .. i]
    if Entrance then
      Entrance:InitUI()
      Entrance:AddSpline()
    end
  end
  local bShowRedDot = false
  for _, phaseConfig in pairs(DataMgr.CommonQuestPhase) do
    if phaseConfig.EventId == self.EventId and EastSeasonQuestUtils:IsQuestPhaseCanGetReward(self.EventId, phaseConfig.QuestPhaseId) then
      ActivityReddotHelper.TryAddReddotCount(ActivityUtils, self.EventId, "Red")
      bShowRedDot = true
      break
    end
  end
  if not bShowRedDot then
    ActivityReddotHelper.TrySubReddotCount(ActivityUtils, self.EventId, "Red")
  end
end

function M:OnPreviewKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if InKeyName == UIConst.GamePadKey.FaceButtonRight then
    local ActivityMain = UIManager(self):GetUIObj("ActivityMain")
    if ActivityMain then
      self:SetActivityMainFocus()
      return UE4.UWidgetBlueprintLibrary.Handled()
    end
  end
  return UE4.UWidgetBlueprintLibrary.Unhandled()
end

function M:FocusUI()
  self.Entrance01:SetFocus()
end

function M:SetActivityMainFocus()
  local ActivityMain = UIManager(self):GetUIObj("ActivityMain")
  if ActivityMain then
    ActivityMain:SetFocus()
  end
end

return M
