require("UnLua")
local M = Class("BluePrints.Story.Talk.UI.Common.WBP_QTE_Common")

function M:SwitchBindButtonClickEvents(bBind)
  if bBind then
    self.Btn_Click.OnClicked:Add(self, self.OnInputPress)
  else
    self.Btn_Click.OnClicked:Clear()
  end
end

function M:InitButtonPerformance()
end

function M:AdaptPlatform()
  local ButtonIconPath = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Story/T_Story_QTE01.T_Story_QTE01'"
  local Tex = LoadObject(ButtonIconPath)
  if Tex then
    self.Icon:SetBrushFromTexture(Tex)
  else
    Utils.ScreenPrint("QTE\230\137\139\230\156\186\231\171\175\230\140\137\233\146\174\229\155\190\230\160\135\232\183\175\229\190\132\233\148\153\232\175\175\239\188\140\232\175\183\230\163\128\230\159\165\239\188\154", ButtonIconPath)
  end
end

function M:SwitchShowMouseCursorInPIE(bShow)
  if URuntimeCommonFunctionLibrary.IsPlayInEditor(self) then
    local PlayerController = UGameplayStatics.GetPlayerController(self, 0)
    PlayerController.bShowMouseCursor = bShow
  end
end

return M
