require("UnLua")
local M = Class()

function M:Tick(Geo, DeltaTime)
  if self.Player:IsHovered() then
    self.Bg_Me:SetVisibility(ESlateVisibility.Visible)
    self.Hover:SetVisibility(ESlateVisibility.Visible)
    self.Info:SetVisibility(ESlateVisibility.Visible)
    local GameInstance = self:GetGameInstance()
    local Player = UE4.UGameplayStatics.GetPlayerCharacter(GameInstance, 0)
    local Level = Player:GetAttr("Level")
    self.Level:SetText(GText("BATTLE_UI_BLOOD_LV") .. tostring(Level))
    local NcikName = Player:GetNickName()
    self.TextBlock:SetText(NcikName)
  else
    self.Bg_Me:SetVisibility(ESlateVisibility.Collapsed)
    self.Hover:SetVisibility(ESlateVisibility.Collapsed)
    self.Info:SetVisibility(ESlateVisibility.Collapsed)
  end
end

return M
