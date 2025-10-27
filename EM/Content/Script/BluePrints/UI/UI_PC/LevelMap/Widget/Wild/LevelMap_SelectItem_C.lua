require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})
local TaskUtils = require("BluePrints.UI.TaskPanel.TaskUtils")

function M:Construct()
  self.Button_Area.OnPressed:Add(self, self.OnInteractiveItemPressed)
  self.Button_Area.OnHovered:Add(self, self.OnInteractiveItemHovered)
  self.Button_Area.OnUnhovered:Add(self, self.OnInteractiveItemUnhovered)
end

function M:Init(SelectPoint, MainMap)
  self.Button_Area.OnClicked:Clear()
  self.Button_Area.OnClicked:Add(self, function()
    MainMap:OnAreaClicked()
    MainMap.RealWildMap.CheckBreak = true
    SelectPoint:OnClicked()
    self:PlayAnimation(self.Click)
  end)
  local ClassName = SelectPoint:GetClass():GetName()
  local Text = ""
  if "WBP_Map_Point_C" == ClassName then
    self.Img_Icon:SetBrushFromTexture(SelectPoint.Img_Point.Brush.ResourceObject)
    if SelectPoint.TargetQuestChainId then
      local QuestChainData = DataMgr.QuestChain[SelectPoint.TargetQuestChainId]
      if QuestChainData and QuestChainData.QuestChainName then
        Text = GText(QuestChainData.QuestChainName)
      end
    end
    if SelectPoint.Data then
      if SelectPoint.Data.Name then
        Text = GText(SelectPoint.Data.Name)
      elseif SelectPoint.Data.TeleportPointName then
        Text = GText(SelectPoint.Data.TeleportPointName)
      elseif SelectPoint.HardBossId then
        Text = GText(DataMgr.HardBossMain[SelectPoint.HardBossId].HardBossName)
      end
    end
  elseif "Common_GuidePoint_PC_C" == ClassName then
    self.Img_Icon:SetBrushFromTexture(SelectPoint.Img_GuidePoint_Icon.Brush.ResourceObject)
    local Avatar = GWorld:GetAvatar()
    local CurTrackingQuestChaindId = Avatar.TrackingQuestChainId
    local TrackingQuestId = Avatar.QuestChains[CurTrackingQuestChaindId].DoingQuestId
    local Info = TaskUtils:GetQuestDetail(CurTrackingQuestChaindId, TrackingQuestId)
    if Info then
      Text = GText(Info.QuestDescription)
    end
  elseif "WBP_Map_DispatchPointInfo_C" == ClassName then
    self.Img_Icon:SetBrushFromTexture(SelectPoint.GuidePoint.Img_GuidePoint_Icon.Brush.ResourceObject)
    local UIId = DataMgr.Dispatch[SelectPoint.Dispatch.DispatchId].DispatchUIId
    local Name = DataMgr.DispatchUI[UIId].DispatchName
    Text = GText(Name)
  end
  self.Text_Interactive:SetText(Text)
  self:PlayAnimation(self.In)
end

function M:OnInteractiveItemPressed()
  if self:IsAnimationPlaying(self.Out) or self:IsAnimationPlaying(self.Press) then
    return
  end
  self.bPressed = true
  self:PlayAnimation(self.Press)
end

function M:OnInteractiveItemHovered()
  self:PlayAnimation(self.Hover)
end

function M:OnInteractiveItemUnhovered()
  self:PlayAnimation(self.UnHover)
end

return M
