local ImpressionTypes = require("BluePrints.UI.UI_PC.Impression.ImpressionConst").ImpressionTypes
local BP_DimensionDrawArea_C = Class("BluePrints.UI.BP_EMUserWidget_C")

function BP_DimensionDrawArea_C:Init(ImpressionAreaId, UsingGM)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    local Message = "Avatar\228\184\141\229\173\152\229\156\168\239\188\140\229\141\176\232\177\161\228\186\148\231\187\180\229\155\190\232\175\187\229\143\150\230\149\176\230\141\174\229\164\177\232\180\165"
    local Title = "Avatar\228\184\141\229\173\152\229\156\168"
    if not UsingGM then
      UStoryLogUtils.PrintToFeiShu(self, Title, Message)
    end
    return
  end
  local Impression = Avatar:GetRegionImpression(ImpressionAreaId)
  local ImpressionMaxValue = DataMgr.GlobalConstant.ImressionMax.ConstantValue
  for Index, ImpressionType in pairs(ImpressionTypes) do
    local PlayerValue = Impression:GetImpressionValueByType(ImpressionType)
    local CorrectionValue = (PlayerValue + 10) * 0.91
    local NormalizedValue = math.min(1, CorrectionValue / ImpressionMaxValue)
    self.RegularPolygonImage:SetPointRatio(Index - 1, NormalizedValue)
    local DimensionIcon = self:GetDimensionIcon(Index)
    local ImpressionConfigInfo = DataMgr.ImpressionConfig[ImpressionType]
    local IconTexture = LoadObject(ImpressionConfigInfo.StatusCommonIcon)
    DimensionIcon:SetIcon(IconTexture)
    local PlayerValue = Impression:GetImpressionValueByType(ImpressionType)
    self["BP_Group_DimensionIcon_" .. Index]:Init(ImpressionType, PlayerValue)
  end
end

function BP_DimensionDrawArea_C:GetDimensionIcon(Index)
  return self["BP_Group_DimensionIcon_" .. Index]
end

function BP_DimensionDrawArea_C:ForceDefault()
  self:PlayAnimation(self.In)
  self:StopAllAnimations()
end

function BP_DimensionDrawArea_C:SetGrowStyle(Index)
  local DimensionIcon = self:GetDimensionIcon(Index)
  DimensionIcon:PlayAddAnim()
end

function BP_DimensionDrawArea_C:SwitchActive(bActive)
  if bActive then
    self:SetVisibility(ESlateVisibility.Visble)
    self:StopAnimation(self.Out)
    self:PlayAnimation(self.In)
    self:StartLoop()
  else
    self:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self:StopAnimation(self.In)
    self:PlayAnimation(self.Out)
    self:StopLoop()
  end
end

function BP_DimensionDrawArea_C:StartLoop()
  self:PlayAnimation(self.Loop, 0, 5)
  AudioManager(self):PlayUISound(self, "event:/ui/common/map_five_dimension_panel_show", "DimensionPanel", nil)
end

function BP_DimensionDrawArea_C:StopLoop()
  self:StopAnimation(self.Loop)
  AudioManager(self):SetEventSoundParam(self, "DimensionPanel", {ToEnd = 1})
end

function BP_DimensionDrawArea_C:Destruct()
  AudioManager(self):SetEventSoundParam(self, "DimensionPanel", {ToEnd = 1})
end

return BP_DimensionDrawArea_C
