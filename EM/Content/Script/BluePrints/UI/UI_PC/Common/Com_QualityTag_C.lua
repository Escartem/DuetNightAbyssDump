require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:Init(Rarity)
  self:SetRarity(Rarity)
end

function M:SetRarity(Rarity)
  if not Rarity or Rarity < 1 or Rarity > 6 then
    DebugPrint("No Rarity")
    return
  end
  local FontColor, Font, Text, InAnimation
  if 6 == Rarity then
    FontColor = self.FontColor_Red
    Font = self.Font_Red
    Text = GText("UI_SkinGacha_Skin_Red")
    InAnimation = self.Red_In
  elseif 5 == Rarity then
    FontColor = self.FontColor_Gold
    Font = self.Font_Gold
    Text = GText("UI_SkinGacha_Skin_Gold")
    InAnimation = self.Gold_In
  elseif 4 == Rarity then
    FontColor = self.FontColor_Purple
    Font = self.Font_Purple
    Text = GText("UI_SkinGacha_Skin_Purple")
    InAnimation = self.Purple_In
  elseif 3 == Rarity then
    FontColor = self.FontColor_Blue
    Font = self.Font_Blue
    Text = GText("UI_SkinGacha_Skin_Blue")
    InAnimation = self.Blue_In
  end
  self.Text_Tag:SetFont(Font)
  self.Text_Tag:SetColorAndOpacity(FontColor)
  self.Text_Tag:SetText(Text)
  self:PlayAnimation(InAnimation)
end

function M:SetCustomizedTextTag(Text)
  self.Text_Tag:SetText(Text)
end

return M
