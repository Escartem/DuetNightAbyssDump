require("UnLua")
local FEntertainmentUtils = require("BluePrints.UI.WBP.Entertainment.EntertainmentUtils")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:OpenPanel()
  if self.bIsOpened then
    return
  end
  self.bIsOpened = true
  self:StopAllAnimations()
  self:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  self:PlayAnimation(self.In)
end

function M:ClosePanel()
  if self.bIsOpened == false then
    return
  end
  self.bIsOpened = false
  self:StopAllAnimations()
  self:PlayAnimation(self.Out)
end

function M:OnOutAnimationFinished()
  self:SetVisibility(ESlateVisibility.Collapsed)
end

function M:SetAvatar(AvatarIconPath)
  self.Icon_Avatar:SetBrushFromTexture(LoadObject(AvatarIconPath))
end

function M:SetName(Name, WorldName)
  self.Text_Name:SetText(Name)
  self.WorldText_Name:SetText(WorldName)
end

function M:RefreshRedDot()
  if FEntertainmentUtils:IsSystemShowRedDot() then
    self.Reddot:SetVisibility(ESlateVisibility.Visible)
  else
    self.Reddot:SetVisibility(ESlateVisibility.Collapsed)
  end
end

function M:BindOnClicked(OnClicked)
  self.OnClicked = OnClicked
end

function M:ExecuteOnClicked()
  if self.OnClicked then
    self.OnClicked()
  end
end

function M:Initialize(Initializer)
  self.ClickSound = "event:/ui/common/click_mid"
end

function M:Construct()
  self.bIsOpened = false
  self:BindToAnimationFinished(self.Click, {
    self,
    self.HandleOnButtonClickAnimationFinished
  })
  self:BindToAnimationFinished(self.Out, {
    self,
    self.OnOutAnimationFinished
  })
end

function M:Destruct()
  self.bIsOpened = false
  self:UnbindFromAnimationFinished(self.Click, {
    self,
    self.HandleOnButtonClickAnimationFinished
  })
  self:UnbindFromAnimationFinished(self.Out, {
    self,
    self.OnOutAnimationFinished
  })
end

return M
