require("UnLua")
local EMCache = require("EMCache.EMCache")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C",
  "BluePrints.Common.TimerMgr"
})

function M:Destruct()
  AudioManager(self):StopSound(self, "BuffItemUnlockInSound")
  self:RemoveTimer("BuffItemInAnimationTimer")
end

function M:Init(Info, AttrName2Info, AttrName2Color, Index, IsFirstTime, PlayerAttrName2Info)
  self.Icon = Info.SIcon
  self.AttrName = Info.AttrName
  self.UnlockLevel = Info.UnlockLevel
  self.Attr = Info.Attr
  if AttrName2Info[self.Attr] then
    self.Unlock = true
    self.ValueStr = AttrName2Info[self.Attr]
  else
    self.Unlock = false
  end
  if PlayerAttrName2Info[self.Attr] then
    self.RealUnlock = true
  else
    self.RealUnlock = false
  end
  if AttrName2Color[self.Attr] == "Normal" then
    self.Text_BuffNum:SetColorAndOpacity(self.NormalColor)
  elseif AttrName2Color[self.Attr] == "HighLight" then
    self.Text_BuffNum:SetColorAndOpacity(self.HighLightColor)
  end
  self.Text_Buff:SetText(GText(self.AttrName))
  self.Text_BuffNum:SetText(self.ValueStr)
  if self.Icon then
    local IconTexture = LoadObject(self.Icon)
    local ImageIconMat = self.Image_Icon:GetDynamicMaterial()
    ImageIconMat:SetTextureParameterValue("IconTex", IconTexture)
  end
  self.Text_Lock:SetText(GText(Info.PlayerBuffLockedTips))
  if IsFirstTime then
    self:SetVisibility(UIConst.VisibilityOp.Hidden)
    self:AddTimer(Index * 0.05, function()
      self:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
      self:PlayAnimation(self.In)
      self:TryPlayUnlockIn()
    end, false, 0, "BuffItemInAnimationTimer", true)
  else
    self:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    self:TryPlayUnlockIn()
  end
end

function M:TryPlayUnlockIn()
  local ExperienceMainBuffUnlock = EMCache:Get("ExperienceMainBuffUnlock", true) or {}
  if self.Unlock and self.RealUnlock and not ExperienceMainBuffUnlock[self.Attr] then
    ExperienceMainBuffUnlock[self.Attr] = 1
    EMCache:Set("ExperienceMainBuffUnlock", ExperienceMainBuffUnlock, true)
    self:PlayAnimation(self.Lock)
    AudioManager(self):PlayUISound(self, "event:/ui/common/trail_rank_buff_unlock", "BuffItemUnlockInSound", nil)
    self:PlayAnimation(self.Unhock_In)
    return
  end
  if self.Unlock then
    self:PlayAnimation(self.Unhock)
  else
    self:PlayAnimation(self.Lock)
  end
end

return M
