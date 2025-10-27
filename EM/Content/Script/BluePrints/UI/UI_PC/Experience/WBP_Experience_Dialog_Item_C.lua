require("UnLua")
local EMCache = require("EMCache.EMCache")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C",
  "BluePrints.Common.TimerMgr"
})

function M:Destruct()
  AudioManager(self):StopSound(self, "BuffItemUnlockInSound")
  AudioManager(self):StopSound(self, "BuffItemInSound")
  self:RemoveTimer("BuffItemInAnimationTimer")
end

function M:OnListItemObjectSet(Content)
  self.Content = Content
  self.Content.Entry = self
  if Content.Unlock then
    self:PlayAnimation(self.Unlock)
    self.Text_Buff:SetText(GText(Content.AttrName))
    local ValueStr = Content.ValueStr
    if string.sub(Content.ValueStr, -1) == "%" then
      ValueStr = string.sub(Content.ValueStr, 1, -2)
      self.Text_Buff_Num02:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
    else
      self.Text_Buff_Num02:SetVisibility(UIConst.VisibilityOp.Collapsed)
    end
    self.Text_Buff_Num:SetText(ValueStr)
    if Content.Icon then
      local IconTexture = LoadObject(Content.Icon)
      local ImageIconMat = self.Img_Buff:GetDynamicMaterial()
      ImageIconMat:SetTextureParameterValue("IconTex", IconTexture)
    end
  else
    self:PlayAnimation(self.Lock)
    self.Text_Lock:SetText(GText(Content.PlayerBuffLockedTips))
  end
  self:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self:AddTimer(Content.Index * 0.05, function()
    self:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    if Content.Unlock then
      local ExperienceBuffUnlock = EMCache:Get("ExperienceBuffUnlock", true) or {}
      if not ExperienceBuffUnlock[Content.Attr] then
        ExperienceBuffUnlock[Content.Attr] = 1
        EMCache:Set("ExperienceBuffUnlock", ExperienceBuffUnlock, true)
        AudioManager(self):PlayUISound(self, "event:/ui/common/trail_rank_buff_activate", "BuffItemUnlockInSound", nil)
        self:PlayAnimation(self.Unlock_In)
      else
        AudioManager(self):PlayUISound(self, "event:/ui/common/trail_rank_buff_refresh", "BuffItemInSound", nil)
        self:PlayAnimation(self.In)
      end
    else
      self:PlayAnimation(self.In)
    end
  end, false, 0, "BuffItemInAnimationTimer", true)
end

return M
