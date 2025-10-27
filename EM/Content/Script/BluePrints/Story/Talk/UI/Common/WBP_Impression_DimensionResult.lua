local ImpressionTypes = require("BluePrints.UI.UI_PC.Impression.ImpressionConst").ImpressionTypes
local BP_Impression_DimensionResult_C = Class("BluePrints.UI.BP_UIState_C")

function BP_Impression_DimensionResult_C:Init(bCheckSucceed, ImpressionAreaId, PlusType, PlusValue)
  self.OnCloseDelegate = nil
  self.bCheckSucceed = bCheckSucceed
  self:InitDimensionGraph(ImpressionAreaId)
  for Index, ImpressionType in pairs(ImpressionTypes) do
    if ImpressionType == PlusType then
      self.DimensionGraph:SetGrowStyle(Index)
      break
    end
  end
  local ImpressionText = GText("Impression_Name_" .. PlusType)
  self.Text_Success:SetText(ImpressionText .. " +" .. PlusValue)
  local ImpressionConfigInfo = DataMgr.ImpressionConfig[PlusType]
  local IconTexture = LoadObject(ImpressionConfigInfo.StatusEffectIcon)
  self.Image_Icon:GetDynamicMaterial():SetTextureParameterValue("Mask", IconTexture)
  self:BindToAnimationFinished(self.In, {
    self,
    self.TimeFadeOut
  })
  self:BindToAnimationFinished(self.Out, {
    self,
    self.Close
  })
end

function BP_Impression_DimensionResult_C:InitDimensionGraph(ImpressionAreaId)
  self.DimensionGraph = self.BP_DimensionDrawArea
  local RegionInfo = DataMgr.ImpressionRegion[ImpressionAreaId]
  if RegionInfo and RegionInfo.UIName then
    local Widget = self:CreateWidgetNew(RegionInfo.UIName)
    if Widget then
      self.Group_Anchor:ClearChildren()
      self.Group_Anchor:AddChild(Widget)
      self.DimensionGraph = Widget
    end
  end
  self.DimensionGraph:Init(ImpressionAreaId)
end

function BP_Impression_DimensionResult_C:SetOnCloseDelegate(Delegate)
  if Delegate and Delegate[1] and Delegate[2] then
    self.OnCloseDelegate = Delegate
  end
end

function BP_Impression_DimensionResult_C:FadeIn()
  self:PlayAnimation(self.In)
  self.DimensionGraph:SwitchActive(true)
end

function BP_Impression_DimensionResult_C:FadeOut()
  self:PlayAnimation(self.Out)
  self.DimensionGraph:SwitchActive(false)
end

function BP_Impression_DimensionResult_C:TimeFadeOut()
  self:AddTimer(1, self.FadeOut, false, 0, nil, true)
end

function BP_Impression_DimensionResult_C:Close()
  if self.OnCloseDelegate then
    self.OnCloseDelegate[2](self.OnCloseDelegate[1], self.bCheckSucceed)
  end
  self:RemoveFromParent()
end

return BP_Impression_DimensionResult_C
