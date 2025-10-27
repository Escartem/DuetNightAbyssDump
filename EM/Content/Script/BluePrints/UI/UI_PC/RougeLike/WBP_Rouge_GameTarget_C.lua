require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:Construct()
  self.StarLight = false
  self.Star:PlayOffAnim()
  self:PlayAnimationForward(self.Complete)
end

function M:Destruct()
  EventManager:RemoveEvent(self.EventID, self)
end

function M:Init(EventID, Index, Score)
  self.TargetScore = Score
  self.EventID = EventID
  EventManager:AddEvent(EventID, self, self.RefreshStar)
  self.Text_Target:SetText(GText("RougeMiniGamePointsLv" .. Index) .. self.TargetScore)
  self:RefreshStar()
end

function M:RefreshStar(Score)
  Score = Score or 0
  if not self.StarLight and Score >= self.TargetScore then
    self.StarLight = true
    if self.Star:IsPlayingAnimation(self.Star.Off) then
      self.Star:StopAnimation(self.Star.Off)
    end
    self.Star:PlayStarInAnim()
    self:PlayAnimationReverse(self.Complete)
  end
end

return M
