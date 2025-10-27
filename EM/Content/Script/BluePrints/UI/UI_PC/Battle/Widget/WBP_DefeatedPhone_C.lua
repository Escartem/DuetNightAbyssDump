require("UnLua")
local M = Class("BluePrints.UI.BP_EMUserWidget_C")

function M:Construct()
  self.Btn_Execute.OnClicked:Add(self, self.OnClick)
end

function M:Tick(MyGeometry, InDeltaTime)
  self:RefreshPhoneExecuteBan()
end

function M:RefreshPhoneExecuteBan()
  if CommonUtils.GetDeviceTypeByPlatformName(self) ~= "Mobile" then
    return
  end
  if not self.Player or not self.DefeatedUI then
    return
  end
  if not self.Player:DoCheckUseSkill(self.Player:GetSkillByType(UE.ESkillType.Condemn)) or not self.DefeatedUI.bCanExecute then
    if not self.IsPlayBan then
      self:ShowBan(true)
    end
    self.IsPlayBan = true
  elseif self.IsPlayBan then
    self:ShowBan(false)
    self.IsPlayBan = false
  end
end

function M:Show()
  if self.IsShow then
    return
  end
  self.IsShow = true
  self.Player = UGameplayStatics.GetPlayerCharacter(self, 0)
  self.IsPlayBan = false
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  local UIManager = GameInstance:GetGameUIManager()
  self.DefeatedUI = UIManager:GetUIObj("DefeatedInteract")
  self:StopAllAnimations()
  self:SetVisibility(ESlateVisibility.Visible)
  self:PlayAnimation(self.In)
end

function M:Hide()
  if self.IsShow == false then
    return
  end
  self.IsShow = false
  self.IsPlayBan = false
  self:StopAllAnimations()
  self:ShowBan(false)
  self:PlayAnimation(self.Out)
end

function M:ShowBan(IsShow)
  if IsShow then
    self.Image_Ban:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  else
    self.Image_Ban:SetVisibility(ESlateVisibility.Collapsed)
  end
end

function M:OnAnimationFinished(Animation)
  if Animation == self.Out then
    self:SetVisibility(ESlateVisibility.Collapsed)
  elseif Animation == self.In then
  end
end

function M:OnClick()
  local DefeatedUI = UIManager(self):GetUIObj("DefeatedInteract")
  if not DefeatedUI then
    return
  end
  if self.IsPlayBan then
    return
  end
  DefeatedUI:OnClick()
end

return M
