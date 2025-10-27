require("UnLua")
local WBP_Simple_Mobile = Class("BluePrints.Story.Talk.UI.Common.WBP_Simple_Common")

function WBP_Simple_Mobile:InitPlayKey()
  self.Story_PlayBtn.bAutoPlay = GWorld.GameInstance.bGlobalAutoPlay
  self.Story_PlayBtn:InitPlayKey()
end

function WBP_Simple_Mobile:ChangeAutoPlay()
  self.Story_PlayBtn.bAutoPlay = not self.Story_PlayBtn.bAutoPlay
  self:SwitchAutoPlay()
end

function WBP_Simple_Mobile:ChangeAutoPlayUI()
  DebugPrint("WBP_Simple_Mobile:ChangeAutoPlayUI", self.bAutoPlay)
  self.Story_PlayBtn:ChangeAutoPlayUI()
end

function WBP_Simple_Mobile:InitAutoPlay()
  self:ChangeAutoPlayUI()
end

return WBP_Simple_Mobile
