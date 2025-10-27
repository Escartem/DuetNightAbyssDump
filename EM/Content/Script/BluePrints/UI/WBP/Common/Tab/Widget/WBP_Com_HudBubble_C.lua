require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:Construct()
  self.Icon:SetVisibility(UIConst.VisibilityOp.Collapsed)
end

function M:Destruct()
end

function M:Init(ConfigData)
  self.ConfigData = ConfigData
  self:SetIcon(ConfigData.IconPath)
  self.Text_Bubble:SetText(GText(ConfigData.Text))
  self:SetTextColor(ConfigData.TextColor)
end

function M:SetIcon(IconPath)
  if not IconPath then
    return
  end
  local Img = LoadObject(IconPath)
  if not IsValid(Img) then
    DebugPrint("\231\188\186\229\176\145\229\155\190\231\137\135\232\181\132\230\186\144: IconPath = " .. IconPath)
    return
  end
  self.Icon:SetBrushResourceObject(Img)
  self.Icon:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
end

function M:SetTextColor(TextColor)
  if not TextColor then
    return
  end
  if 0 == TextColor then
    self.Text_Bubble:SetColorAndOpacity(self.Color_Orange)
  elseif 1 == TextColor then
    self.Text_Bubble:SetColorAndOpacity(self.Color_Red)
  end
end

function M:PlayInAnimation()
  self:StopAnimation(self.Out)
  self:PlayAnimation(self.In)
end

function M:PlayOutAnimation()
  self:StopAnimation(self.In)
  self:PlayAnimation(self.Out)
end

return M
