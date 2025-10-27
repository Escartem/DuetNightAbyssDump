require("UnLua")
local TimeUtils = require("Utils.TimeUtils")
local M = Class("BluePrints.UI.BP_UIState_C")

function M:Destruct()
  self:ClearAllTimer()
  local EffectUIWidget = UIManager(self):GetUIObj(UIConst.BattleNearDeathPCName)
  if nil ~= EffectUIWidget then
    EffectUIWidget:BindToAnimationFinished(EffectUIWidget.Out, function()
      EffectUIWidget:UnbindAllFromAnimationFinished(EffectUIWidget.Out)
      UIManager(self):UnLoadUI(UIConst.BattleNearDeathPCName)
    end)
    EMUIAnimationSubsystem:EMPlayAnimation(EffectUIWidget, EffectUIWidget.Out)
  end
  EffectUIWidget = UIManager(self):GetUIObj(UIConst.BattleBrokenShieldPCName)
  if nil ~= EffectUIWidget then
    EffectUIWidget:StopAllAnimations()
    EffectUIWidget:Hide()
  end
  self.bIsDestruct = true
  self.IsDestroied = true
  if self.Owner and self.Owner.BillboardComponent then
    self.Owner.BillboardComponent:SetIsForbidShowBloodUI(false)
  end
  M.Super.Destruct(self)
end

function M:UpdateBloodScreenEffect()
  local CurrentBlood = self.CurHp
  local MaxBlood = self.MaxHp
  local BloodStrength = CurrentBlood / MaxBlood
  local NowEnergyShield = self.CurShield
  local SystemUIConfig = DataMgr.SystemUI[UIConst.BattleNearDeathPCName]
  if SystemUIConfig then
    local FirstLevelFactor = SystemUIConfig.Params.FirstLevelFactor
    local SecondLevelFactor = SystemUIConfig.Params.SecondLevelFactor
    local ShowUIBloodStrength = SystemUIConfig.Params.ShowUIBloodStrength
    local SecondLevelBloodStrength = SystemUIConfig.Params.SecondLevelBloodStrength
    if nil == FirstLevelFactor or nil == SecondLevelFactor or nil == ShowUIBloodStrength or nil == SecondLevelBloodStrength then
      return
    end
    local PreNearDeath = self.IsNearDeath
    self.IsNearDeath = BloodStrength < ShowUIBloodStrength and NowEnergyShield <= 0
    local EffectUIWidget = UIManager(self):GetUIObj(UIConst.BattleNearDeathPCName)
    local InAnimName
    if not PreNearDeath and self.IsNearDeath then
      InAnimName = "In"
    end
    if PreNearDeath and self.IsNearDeath then
      InAnimName = "Loop"
    end
    if PreNearDeath and not self.IsNearDeath then
      InAnimName = "Out"
    end
    if self.IsNearDeath then
      if nil == EffectUIWidget then
        EffectUIWidget = UIManager(self):LoadUINew(UIConst.BattleNearDeathPCName)
      end
      if nil ~= EffectUIWidget then
        local BgMat
        local FlashFactor = BloodStrength > SecondLevelBloodStrength and FirstLevelFactor or SecondLevelFactor
        if CommonUtils.GetDeviceTypeByPlatformName() == "PC" then
          BgMat = EffectUIWidget.Bg_1:GetDynamicMaterial()
        else
          BgMat = EffectUIWidget.glassglow:GetDynamicMaterial()
        end
        if nil ~= BgMat then
          BgMat:SetScalarParameterValue("Flash", FlashFactor)
        end
      end
    elseif nil ~= EffectUIWidget and PreNearDeath then
      EffectUIWidget:BindToAnimationFinished(EffectUIWidget.Out, function()
        EffectUIWidget:UnbindAllFromAnimationFinished(EffectUIWidget.Out)
        UIManager(self):UnLoadUI(UIConst.BattleNearDeathPCName)
      end)
      EMUIAnimationSubsystem:EMPlayAnimation(EffectUIWidget, EffectUIWidget.Out)
    end
  end
end

function M:UpdateShieldScreenEffect()
  local SystemUIConfig = DataMgr.SystemUI[UIConst.BattleBrokenShieldPCName]
  if SystemUIConfig then
    local InAnimName = SystemUIConfig.Params.AnimName
    if nil ~= InAnimName then
      local ScreenEffectUI = UIManager(self):PlayScreenEffectAnim(UIConst.LoadInConfig, UIConst.BattleBrokenShieldPCName, {
        {
          AnimName = InAnimName,
          StartTime = 0.0,
          LoopNums = 1
        }
      })
      AudioManager(self):PlayUISound(ScreenEffectUI, "event:/ui/common/char_sheild_break", nil, nil)
    end
  end
end

return M
