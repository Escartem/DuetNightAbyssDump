require("UnLua")
local M = Class()

function M:InitComponent()
  self.Owner = self:GetOwner()
  self.ClientEffect = {}
end

function M:ExecuteEffect(EventName, ...)
  if not IsValid(self.Owner) then
    self.Owner = self:GetOwner()
    self.ClientEffect = {}
  end
  if self.ClientEffect[EventName] == nil then
    self.ClientEffect[EventName] = self.Owner[EventName] ~= nil
  end
  if not self.ClientEffect[EventName] then
    self.Overridden[EventName](self, ...)
  else
    self.Owner[EventName](self.Owner, ...)
  end
end

function M:OnHitedEffect()
  self:ExecuteEffect("OnHitedEffect")
end

function M:OnDeadEffect()
  self:ExecuteEffect("OnDeadEffect")
end

function M:OnActiveEffect()
  self:ExecuteEffect("OnActiveEffect")
end

function M:OnDeActiveEffect()
  self:ExecuteEffect("OnDeactiveEffect")
end

function M:OnInteractiveEffect()
  self:ExecuteEffect("OnInteractiveEffect")
end

function M:AfterInteractiveEffect()
  self:ExecuteEffect("AfterInteractiveEffect")
end

function M:ChangeColor(Type)
  self:ExecuteEffect("ChangeColor", Type)
end

return M
