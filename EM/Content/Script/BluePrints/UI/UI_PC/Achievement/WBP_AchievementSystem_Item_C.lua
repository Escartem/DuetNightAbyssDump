require("UnLua")
local M = Class("BluePrints.UI.BP_EMUserWidget_C")

function M:Tick(MyGeometry, InDeltaTime)
  if not self.AchievementSystem then
    return
  end
  local position = USlateBlueprintLibrary.LocalToAbsolute(MyGeometry, FVector2D(0, 0))
  local size = USlateBlueprintLibrary.GetAbsoluteSize(MyGeometry)
  position = position + size / 2
  local parentPosition = USlateBlueprintLibrary.LocalToAbsolute(self.AchievementSystem:GetCachedGeometry(), FVector2D(0, 0))
  local parentSize = USlateBlueprintLibrary.GetAbsoluteSize(self.AchievementSystem:GetCachedGeometry())
  parentPosition = parentPosition + parentSize / 2
  local scale = (1 - math.abs(position.X - parentPosition.X) / (parentSize.X / 2)) * 0.6 + 0.4
  self.Canvas:SetRenderScale(FVector2D(scale, scale))
end

function M:OnListItemObjectSet(Content)
  self.AchievementSystem = Content.AchievementSystem
  self.ID = Content.ID
  self.Index = Content.Index
  local data = DataMgr.AchievementType[Content.ID]
  if not data then
    self.Canvas:SetVisibility(ESlateVisibility.Hidden)
    return
  end
  self.Canvas:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  self.Name:SetText(GText(data.AchievementTypeName))
  self.Name1:SetText(GText(data.AchievementTypeName))
  if data.AchievementTypeIcon1 then
    local icon1 = LoadObject(data.AchievementTypeIcon1)
    if icon1 then
      self.Icon_1:SetBrushFromTexture(icon1, false)
    end
  end
  if data.AchievementTypeIcon2 then
    local icon2 = LoadObject(data.AchievementTypeIcon2)
    if icon2 then
      self.Icon_2:SetBrushFromTexture(icon2, false)
    end
  end
  local achievementId = data.AchievementId
  local avatar = GWorld:GetAvatar()
  local count = 0
  for _, id in pairs(achievementId) do
    local achv = avatar.Achvs:GetAchv(id)
    if achv:IsFinished() then
      count = count + 1
    end
  end
  self.Achievement_System_Progess:SetPercent(count / #achievementId)
  self.Percent:SetText(string.format("%.0f", count / #achievementId * 100) .. "%")
end

function M:OpenDetail()
  self.AchievementSystem:OpenDetail(self.ID, self.Index)
end

return M
