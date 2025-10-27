local WBP_Abyss_Reward_C = Class("BluePrints.UI.BP_EMUserWidget_C")

function WBP_Abyss_Reward_C:Construct()
  self:BindButtonPerformances()
end

function WBP_Abyss_Reward_C:Destruct()
  self:UnBindButtonPerformances()
  ReddotManager.RemoveListener("AbyssReward", self)
end

function WBP_Abyss_Reward_C:Init(Parent, Func, AbyssId, NowValue, MaxValue)
  self.Parent = Parent
  self.Func = Func
  self.NowValue = NowValue
  self.MaxValue = MaxValue
  self.AbyssId = AbyssId
  self.Text_Now:SetText(NowValue)
  self.Text_All:SetText(MaxValue)
  if not ReddotManager.GetTreeNode("AbyssReward") then
    ReddotManager.AddNode("AbyssReward")
  end
  ReddotManager.RemoveListener("AbyssReward", self)
  ReddotManager.AddListener("AbyssReward", self, self.RefreshReddot)
end

function WBP_Abyss_Reward_C:RefreshReddot()
  local CacheDetail = ReddotManager.GetLeafNodeCacheDetail("AbyssReward")
  if not CacheDetail[self.AbyssId] then
    self.Reddot:SetVisibility(ESlateVisibility.Collapsed)
  else
    self.Reddot:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  end
end

function WBP_Abyss_Reward_C:OnClicked()
  if self.Func then
    self.Func(self.Parent, self.NowValue, self.MaxValue)
  else
    DebugPrint("WBP_Abyss_Reward_C:OnClicked()\239\188\140self.Func\230\151\160\230\149\136")
  end
end

function WBP_Abyss_Reward_C:BindButtonPerformances()
  self.Btn_Click.OnClicked:Add(self, self.OnBtnClicked)
  self.Btn_Click.OnPressed:Add(self, self.OnBtnPressed)
  self.Btn_Click.OnReleased:Add(self, self.OnBtnReleased)
  if CommonUtils.GetDeviceTypeByPlatformName(self) == "PC" then
    self.Btn_Click.OnHovered:Add(self, self.OnBtnHovered)
    self.Btn_Click.OnUnhovered:Add(self, self.OnBtnUnhovered)
  end
end

function WBP_Abyss_Reward_C:UnBindButtonPerformances()
  if not self.Btn_Click then
    return
  end
  self.Btn_Click.OnClicked:Clear()
  self.Btn_Click.OnPressed:Clear()
  self.Btn_Click.OnReleased:Clear()
  if CommonUtils.GetDeviceTypeByPlatformName(self) == "PC" then
    self.Btn_Click.OnHovered:Clear()
    self.Btn_Click.OnUnhovered:Clear()
  end
end

function WBP_Abyss_Reward_C:SwitchNormalAnimation()
  self:StopAllAnimations()
  self:PlayAnimation(self.Normal)
end

function WBP_Abyss_Reward_C:PlayButtonClickSound()
  AudioManager(self):PlayUISound(self, "event:/ui/activity/drama_gift_btn_click", nil, nil)
end

function WBP_Abyss_Reward_C:PlayButtonClickAnimation()
  self:StopAllAnimations()
  self:PlayAnimation(self.Normal)
  self:PlayAnimation(self.Click)
end

function WBP_Abyss_Reward_C:OnBtnClicked()
  self:PlayButtonClickSound()
  self:PlayButtonClickAnimation()
  self:OnClicked()
end

function WBP_Abyss_Reward_C:PlayButtonPressAnim()
  self:StopAllAnimations()
  self:PlayAnimation(self.Normal)
  self:PlayAnimation(self.Press)
end

function WBP_Abyss_Reward_C:OnBtnPressed()
  self.IsPressing = true
  self:PlayButtonPressAnim()
end

function WBP_Abyss_Reward_C:PlayButtonHoverSound()
  AudioManager(self):PlayUISound(self, "event:/ui/activity/drama_gift_btn_hover", nil, nil)
end

function WBP_Abyss_Reward_C:PlayButtonHoverAnim()
  self:PlayButtonHoverSound()
  self:StopAllAnimations()
  self:PlayAnimation(self.Normal)
  self:PlayAnimation(self.Hover)
end

function WBP_Abyss_Reward_C:OnBtnHovered()
  self.IsHovering = true
  self:PlayButtonHoverAnim()
end

function WBP_Abyss_Reward_C:SetBtnHovered(IsHovered)
  if IsHovered then
    self:OnBtnHovered()
  else
    self:OnBtnUnhovered()
  end
end

function WBP_Abyss_Reward_C:PlayButtonReleaseButHoverAnim()
  self:StopAllAnimations()
  self:PlayButtonHoverAnim()
end

function WBP_Abyss_Reward_C:PlayButtonReleaseAndUnHoverAnim()
  self:StopAllAnimations()
  self:SwitchNormalAnimation()
end

function WBP_Abyss_Reward_C:OnBtnReleased()
  self.IsPressing = false
  if not self.IsHovering then
    self:PlayButtonReleaseAndUnHoverAnim()
  else
    self:PlayButtonReleaseButHoverAnim()
  end
end

function WBP_Abyss_Reward_C:PlayButtonUnHoverAnim()
  self:StopAllAnimations()
  self:SwitchNormalAnimation()
end

function WBP_Abyss_Reward_C:OnBtnUnhovered()
  self.IsHovering = false
  if not self.IsPressing then
    self:PlayButtonUnHoverAnim()
  end
end

return WBP_Abyss_Reward_C
