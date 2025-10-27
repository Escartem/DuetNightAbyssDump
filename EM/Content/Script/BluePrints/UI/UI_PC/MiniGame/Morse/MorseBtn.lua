require("UnLua")
local WBP_MiniGame_Mima_Btn_C = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function WBP_MiniGame_Mima_Btn_C:InitBtnInfo(Parenet, Index)
  self.Owner = Parenet
  self.Index = Index
  self.Text_Num:SetText(self.Index)
  self:ClearButtonEvent()
  self:InitButtonEvent()
  self:PlayAnimation(self.Normal)
end

function WBP_MiniGame_Mima_Btn_C:InitButtonEvent()
  self.Btn.OnClicked:Add(self, function()
    self:OnPagePointClicked()
  end)
  self.Btn.OnPressed:Add(self, function()
    self:OnPagePointPressed()
  end)
  self.Btn.OnHovered:Add(self, function()
    self:OnPagePointHovered()
  end)
  self.Btn.OnUnhovered:Add(self, function()
    self:OnPagePointUnhovered()
  end)
end

function WBP_MiniGame_Mima_Btn_C:ClearButtonEvent()
  self.Btn.OnClicked:Clear()
  self.Btn.OnPressed:Clear()
  self.Btn.OnHovered:Clear()
  self.Btn.OnUnhovered:Clear()
end

function WBP_MiniGame_Mima_Btn_C:OnPagePointClicked()
  DebugPrint("thy   Click ", self.Index)
  self.Owner:InputPassword(self.Index)
  self:BindToAnimationFinished(self.Click, {
    self,
    self.AfterClick
  })
  self:PlayAnimation(self.Click)
end

function WBP_MiniGame_Mima_Btn_C:AfterClick()
  self:PlayAnimation(self.Hover)
end

function WBP_MiniGame_Mima_Btn_C:OnPagePointPressed()
  if self:IsPlayingAnimation(self.Press) then
    return
  end
  self:StopAllAnimations()
  self:PlayAnimation(self.Press)
end

function WBP_MiniGame_Mima_Btn_C:OnPagePointHovered()
  AudioManager(self):PlayUISound(self, "event:/ui/minigame/morse_btn_hover", "BtnHover", nil)
  if self:IsPlayingAnimation(self.Hover) then
    return
  end
  self.Owner:PasswordBtnNormal(self.Index)
  self:StopAllAnimations()
  self:PlayAnimation(self.Hover)
end

function WBP_MiniGame_Mima_Btn_C:OnPagePointUnhovered()
  if self:IsPlayingAnimation(self.UnHover) then
    return
  end
  self:StopAllAnimations()
  self:PlayAnimation(self.UnHover)
end

function WBP_MiniGame_Mima_Btn_C:GetIndex()
  return self.Index
end

return WBP_MiniGame_Mima_Btn_C
