require("UnLua")
local M = Class("BluePrints.UI.BP_UIState_C")
local FloatingTime = 3.5

function M:OnWorking(SystemInfo, OnFinishedCallback)
  if not self.OnFinishedDelegate then
    self.OnFinishedDelegate = {}
  end
  self.IsInit = true
  self:InitSystemInfo(SystemInfo)
  self:PlayAnimation(self.In)
  self.Key = "SubsystemUnlock_" .. SystemInfo.UIUnlockRuleId
  self.OnFinishedDelegate[self.Key] = OnFinishedCallback
  self:AddTimer(self:GetShowTime(), function()
    DebugPrint("@@@UIUnlockMgr UIUnlockMgr Try Start Show Next UI,Current UIUnlockRuleId:" .. SystemInfo.UIUnlockRuleId)
    if self.OnFinishedDelegate[self.Key] then
      local CurKey = self.Key
      DebugPrint("@@@UIUnlockMgr UIUnlockMgr Start Show Next UI,Current UIUnlockRuleId:" .. SystemInfo.UIUnlockRuleId)
      self.OnFinishedDelegate[CurKey]()
      self.OnFinishedDelegate[CurKey] = nil
    end
  end, false, 0, self.Key, true)
  if self:IsHide() then
    self:PauseTimer(self.Key)
  end
end

function M:InitSystemInfo(SystemInfo)
  if not SystemInfo then
    return
  end
  local UIUnlockName = SystemInfo.UIUnlockName or "\230\156\170\233\133\141\231\189\174"
  if UIUnlockName then
    local SystemName = GText(UIUnlockName) or UIUnlockName
    self.Text_Name:SetText(SystemName)
  end
  local AfterUIUnlockDesc = SystemInfo.AfterUIUnlockDesc or "\230\156\170\233\133\141\231\189\174"
  if AfterUIUnlockDesc then
    local SystemUnlockDescribe = GText(AfterUIUnlockDesc) or AfterUIUnlockDesc
    if SystemUnlockDescribe then
      self.Text_Describe:SetText(SystemUnlockDescribe)
    end
  end
end

function M:OnAnimationFinished(InAnimation)
  if InAnimation == self.In then
    self:AddTimer(FloatingTime, function()
      self:PlayAnimation(self.Out)
    end, false, 0, "SubsystemPlayOutAnimation", true)
  end
end

function M:Hide(HideTag)
  M.Super.Hide(self, HideTag)
  self:PauseTimer(self.Key)
  self:PauseTimer("SubsystemPlayOutAnimation")
end

function M:Show(ShowTag)
  M.Super.Show(self, ShowTag)
  local IsHide = not IsEmptyTable(self.HideTags)
  if not IsHide then
    self:UnPauseTimer(self.Key)
    self:UnPauseTimer("SubsystemPlayOutAnimation")
  end
end

function M:GetShowTime()
  local Time = self.In:GetEndTime() + self.Out:GetEndTime() + FloatingTime
  return Time
end

return M
