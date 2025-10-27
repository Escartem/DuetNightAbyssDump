local M = Class()

function M:Init()
  self._Avatar = nil
  self.IsDestroied = nil
  self:GetAvatar()
end

function M:Destory()
  self._Avatar = nil
  self.IsDestroied = true
end

function M:GetAvatar()
  if self._Avatar == nil then
    self._Avatar = GWorld:GetAvatar()
  end
  if not self._Avatar then
    DebugPrint(ErrorTag, LXYTag, "Model:GetAvatar() Avatar is nil")
  end
  return self._Avatar
end

return M
