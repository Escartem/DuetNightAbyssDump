require("UnLua")
local WBP_LoginCGAnim_C = Class("BluePrints.UI.BP_UIState_C")

function WBP_LoginCGAnim_C:Initialize(Initializer)
  self.Super.Initialize(self)
  self.IsLoadCG = false
end

function WBP_LoginCGAnim_C:TryToLoadLoginMainPage()
  if self.MediaPlayer ~= nil then
    self.MediaPlayer:Close()
  end
  self:RemoveTimer("LoadLoginMainPage")
  UGameplayStatics.OpenLevel(self, "Login")
  self:Close()
end

function WBP_LoginCGAnim_C:DelayToLoadMainPage()
  self.IsLoadCG = true
  self:AddTimer(1, self.CloseUI, true, 5, "LoadLoginMainPage")
end

function WBP_LoginCGAnim_C:CloseUI()
  if self.MediaPlayer:IsPlaying() then
    return
  end
  self:TryToLoadLoginMainPage()
end

return WBP_LoginCGAnim_C
