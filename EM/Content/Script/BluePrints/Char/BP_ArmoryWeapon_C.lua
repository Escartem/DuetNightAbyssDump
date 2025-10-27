local M = Class()

function M:ReceiveBeginPlay()
  self.HideTags = {}
end

function M:SetActorHideTag(Tag, bHidden)
  if bHidden then
    self.HideTags[Tag] = true
  else
    self.HideTags[Tag] = nil
  end
  if next(self.HideTags) then
    self:SetActorHiddenInGame(true)
  else
    self:SetActorHiddenInGame(false)
  end
end

function M:ForceClearActorHideTag()
  self.HideTags = {}
  self:SetActorHiddenInGame(false)
end

return M
