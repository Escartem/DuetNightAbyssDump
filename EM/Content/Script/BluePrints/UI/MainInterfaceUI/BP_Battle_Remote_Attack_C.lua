require("UnLua")
require("DataMgr")
local BP_Battle_Remote_Attack_C = Class()

function BP_Battle_Remote_Attack_C:Construct()
  self.Overridden.Construct(self)
  self.mat = self.Bar_Cooldown:GetDynamicMaterial()
  self.mat:SetScalarParameterValue("Percent", 0)
  self.Bg:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self.CoolDownStartTime = 0
  self.LastHotValue = 0
  self.IsCooldown = false
  self.CooldownStartValue = 0
end

function BP_Battle_Remote_Attack_C:Tick(MyGeometry, InDeltaTime)
  if not UE4.UKismetSystemLibrary.IsValid(self.WBP_PlayerSkill) or not UE4.UKismetSystemLibrary.IsValid(self.WBP_PlayerSkill.Owner) then
    return
  end
  local Weapon = self.WBP_PlayerSkill.Owner.RangedWeapon
  if not Weapon or not UE4.UKismetSystemLibrary.IsValid(Weapon) then
    return
  end
  local hotvalue = Weapon:GetAttr("HotValue")
  local MaxHotValue = Weapon:GetAttr("MaxHotValue")
  if MaxHotValue <= 0 then
    MaxHotValue = 1
  end
  local currentTime = UE4.UGameplayStatics.GetTimeSeconds(self)
  local realValue = hotvalue
  if hotvalue < self.LastHotValue then
    self.IsCooldown = true
    self.CoolDownStartTime = currentTime
    self.CooldownStartValue = self.LastHotValue
  elseif hotvalue > self.LastHotValue then
    self.IsCooldown = false
  end
  self.LastHotValue = hotvalue
  if self.IsCooldown then
    local lerp = UE4.UKismetMathLibrary.FClamp((currentTime - self.CoolDownStartTime) / 0.7, 0, 1)
    realValue = UE4.UKismetMathLibrary.Lerp(self.CooldownStartValue, hotvalue, lerp)
  end
  if realValue ~= MaxHotValue or 0 == MaxHotValue then
    self.Bg:SetVisibility(UE4.ESlateVisibility.Collapsed)
  else
    self.Bg:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  end
  if 0 == realValue then
    self.Bar_Cooldown:SetVisibility(UE4.ESlateVisibility.Collapsed)
  else
    self.Bar_Cooldown:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  end
  self.mat:SetScalarParameterValue("Percent", hotvalue / MaxHotValue)
end

function BP_Battle_Remote_Attack_C:GetNowHotValue()
  return self.mat:K2_GetScalarParameterValue("Percent")
end

function BP_Battle_Remote_Attack_C:AfterClickFire(IsPress)
  if self.WBP_PlayerSkill == nil or nil == self.WBP_PlayerSkill.Owner then
    return
  end
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  local UIManger = GameInstance:GetGameUIManager()
  if nil == UIManger then
    return
  end
  local ShootingTakeAim = UIManger:GetUIObj("TakeAimIndicator")
  if ShootingTakeAim then
    ShootingTakeAim:SetInPressShootingBtn(IsPress)
  end
end

function BP_Battle_Remote_Attack_C:Destruct()
  UE4.UKismetSystemLibrary.K2_ClearTimerHandle(self, self.timerHandle)
end

return BP_Battle_Remote_Attack_C
