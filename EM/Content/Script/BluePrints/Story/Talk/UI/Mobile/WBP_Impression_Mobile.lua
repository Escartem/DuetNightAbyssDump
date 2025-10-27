require("UnLua")
local WBP_Impression_Mobile = Class("BluePrints.Story.Talk.UI.Common.WBP_Impression_Common")

function WBP_Impression_Mobile:InitPlayKey()
  self.bAutoPlay = GWorld.GameInstance.bGlobalAutoPlay
  self.Story_PlayBtn:InitPlayKey()
end

function WBP_Impression_Mobile:ChangeAutoPlay()
  self.Story_PlayBtn.bAutoPlay = not self.Story_PlayBtn.bAutoPlay
  self:SwitchAutoPlay()
end

function WBP_Impression_Mobile:ChangeAutoPlayUI()
  self.Story_PlayBtn:ChangeAutoPlayUI()
end

function WBP_Impression_Mobile:AdaptPlatform()
  if self.KeyNode then
    self.KeyNode:SetVisibility(ESlateVisibility.Collapsed)
  end
  if self.Img_Mouse then
    self.Img_Mouse:SetVisibility(ESlateVisibility.Collapsed)
  end
  if self.Btn_DimensionDrawArea and self.Btn_DimensionDrawArea.Key_Dimension then
    self.Btn_DimensionDrawArea.Key_Dimension:SetVisibility(ESlateVisibility.Collapsed)
  end
end

function WBP_Impression_Mobile:OnExitButtonSelectedPlatform(bIsSelect)
end

function WBP_Impression_Mobile:OnExitButtonReleasedByPlatform()
  self:PlayAnimation(self.BtnQuit_Normal)
end

function WBP_Impression_Mobile:PlayExitButtonHoveredPerformanceByPlatform()
end

function WBP_Impression_Mobile:PlayExitButtonUnhoveredPerformanceByPlatform()
end

function WBP_Impression_Mobile:InitAutoPlay()
  self:ChangeAutoPlayUI()
end

function WBP_Impression_Mobile:ChangeImgMouseVisibility(OptionData)
  if self.Img_Mouse then
    self.Img_Mouse:SetVisibility(ESlateVisibility.Collapsed)
  end
end

return WBP_Impression_Mobile
