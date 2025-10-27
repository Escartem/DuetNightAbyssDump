local ListenBuffComponent = require("BluePrints.UI.UI_PC.Battle.ExclusiveSkill.Components.ListenBuffComponent")
local FListenBuffComponent = ListenBuffComponent.FListenBuffComponent
local M = Class("BluePrints.UI.UI_PC.Battle.ExclusiveSkill.Base.Battle_Skill_UI_Base")
local MAX_BULLET_NUM = 6

function M:OnLoaded(PlayerCharacter, Params)
  self.Super.OnLoaded(self)
  self.Owner = PlayerCharacter
  self:K2_SetBuffsOwner(PlayerCharacter)
  self:RegisterOnBuffsChangedDelegate()
  self.OldBuffLayer = 0
  EMUIAnimationSubsystem:EMStopAnimation(self, self.In)
  self.Bg1_2:SetRenderOpacity(0)
  self.Bg1_3:SetRenderOpacity(0)
  self:SetImageBrushColor(self.Bg1, self.Magazine_Bg1_Filling)
  self:SetImageBrushColor(self.Bg2, self.Magazine_Bg2_Filling)
  self.StateRemainTime:SetVisibility(ESlateVisibility.Hidden)
  local EnhancedReloadBuffId = Params.EnhancedReloadBuffId
  local FirepowerSuppressionBuffId = Params.FirepowerSuppressionBuffId
  self.ListenBuffComponent = FListenBuffComponent.New()
  self.ListenBuffComponent:AddListenBuff(EnhancedReloadBuffId, self, "EnhancedReloadBuff")
  self.ListenBuffComponent:AddListenBuff(FirepowerSuppressionBuffId, self, "FirepowerSuppressionBuff")
  self.bIsInListenSkill02 = false
  self.LinenSkill02Range = 0
  self.Skill02BuffId = Params.Skill02BuffId or 0
  self:InitBulletMagazine()
end

function M:Tick(MyGeometry, InDeltaTime)
  M.Super.Tick(self, MyGeometry, InDeltaTime)
  self.ListenBuffComponent:Tick(InDeltaTime)
  do return end
  local Skill02Buff = Battle(self):FindBuffById(self.Owner, self.Skill02BuffId, 0, false)
  if Skill02Buff then
    self.LinenSkill02Range = Skill02Buff.Skill02Range
    if self.LinenSkill02Range > 0 then
      if self.bIsInListenSkill02 == false then
        self.bIsInListenSkill02 = true
        self:StartListenSkill02(self.LinenSkill02Range)
      end
      self:TickListenSkill02(self.LinenSkill02Range)
      return
    end
  end
  if self.bIsInListenSkill02 then
    self.bIsInListenSkill02 = false
    self:EndListenSkill02(self.LinenSkill02Range)
  end
end

function M:ReceiveOnBuffsChanged()
  local Buffs = self.Owner.BuffManager.Buffs
  self.ListenBuffComponent:OnBuffsChanged(Buffs)
end

function M:StartHas_EnhancedReloadBuff(ListenBuffInfo)
  local LerpDirection = 1
  local Buff = ListenBuffInfo.Buff
  self.BuffMaxLayer = Buff.MaxLayer
  ListenBuffInfo.LayerAngle = 360 / self.BuffMaxLayer * LerpDirection
  ListenBuffInfo.RotateAngleSecond = 180 * LerpDirection
  ListenBuffInfo.BulletNum = 1
  ListenBuffInfo.BulletShowDirection = LerpDirection
  ListenBuffInfo.BulletMaxNum = self.BuffMaxLayer
  local BulletWidget = self:GetBulletWidgetById(1)
  BulletWidget:SetVisibility(ESlateVisibility.HitTestInvisible)
  if Buff.Layer == self.BuffMaxLayer then
    self.OldBuffLayer = ListenBuffInfo.BuffLayer
    self.bIsBulletSilence = true
  else
    EMUIAnimationSubsystem:EMPlayAnimation(BulletWidget, BulletWidget.In)
  end
  self:SetImageBrushColor(self.Bg1, self.Magazine_Bg1_Filling)
  self:SetImageBrushColor(self.Bg2, self.Magazine_Bg2_Filling)
end

function M:TickHas_EnhancedReloadBuff(ListenBuffInfo, InDeltaTime)
  local Buff = ListenBuffInfo.Buff
  local BuffLayer = Buff.Layer
  local LayerAngle = ListenBuffInfo.LayerAngle
  local RotateAngleSecond = ListenBuffInfo.RotateAngleSecond
  local BulletNum = ListenBuffInfo.BulletNum
  local BulletShowDirection = ListenBuffInfo.BulletShowDirection
  local BulletMaxNum = ListenBuffInfo.BulletMaxNum
  local NeedLerp = true
  if Buff.Layer == BulletMaxNum and BulletNum == BulletMaxNum then
    return
  end
  if Buff.Layer - BulletNum > 1.1 then
    NeedLerp = false
  end
  if self.OldBuffLayer ~= BuffLayer and not self.bIsBulletSilence and BuffLayer == self.BuffMaxLayer then
    AudioManager(self):PlayUISound(self, "event:/ui/common/linen_hud_bullet_rotate", nil, nil)
  end
  local CurrentAngle = self.Magazine:GetRenderTransformAngle()
  local TargetAngle = (BuffLayer - 1) * LayerAngle
  local LerpAngle = CurrentAngle + RotateAngleSecond * InDeltaTime
  if RotateAngleSecond > 0 then
    LerpAngle = math.min(LerpAngle, TargetAngle)
  else
    LerpAngle = math.max(LerpAngle, TargetAngle)
  end
  if not NeedLerp then
    LerpAngle = TargetAngle
  end
  self.Magazine:SetRenderTransformAngle(LerpAngle)
  local MagazineAngle = self.Magazine:GetRenderTransformAngle()
  local NewBulletNum = math.floor(MagazineAngle / LayerAngle) + 1
  if BulletNum < NewBulletNum then
    for i = BulletNum + 1, NewBulletNum do
      local BulletWidget = self:GetBulletWidgetById(i * BulletShowDirection, BulletMaxNum)
      BulletWidget:SetVisibility(ESlateVisibility.HitTestInvisible)
      if NeedLerp then
        EMUIAnimationSubsystem:EMPlayAnimation(BulletWidget, BulletWidget.In)
        if BuffLayer == self.BuffMaxLayer then
          AudioManager(self):PlayUISound(self, "event:/ui/common/linen_hud_bullet_add", "", nil)
        end
      end
    end
    ListenBuffInfo.BulletNum = NewBulletNum
    if not NeedLerp and not self.bIsBulletSilence and BuffLayer == self.BuffMaxLayer then
      AudioManager(self):PlayUISound(self, "event:/ui/common/linen_hud_bullet_add", "", nil)
    end
  end
  if BulletMaxNum <= NewBulletNum and EMUIAnimationSubsystem:EMAnimationIsPlaying(self, self.FillBattle_Loop) == false then
    EMUIAnimationSubsystem:EMPlayAnimation(self, self.FillBattle_Loop, 0, true)
    self:SetImageBrushColor(self.Bg1, self.Magazine_Bg1_Filled)
    self:SetImageBrushColor(self.Bg2, self.Magazine_Bg2_Filled)
  end
  self.OldBuffLayer = BuffLayer
  self.bIsBulletSilence = false
end

function M:EndHas_EnhancedReloadBuff(ListenBuffInfo)
  local BulletNum = ListenBuffInfo.BulletNum
  local BulletShowDirection = ListenBuffInfo.BulletShowDirection
  local BulletMaxNum = ListenBuffInfo.BulletMaxNum
  for i = BulletNum, 1, -1 do
    local BulletWidget = self:GetBulletWidgetById(i * BulletShowDirection, BulletMaxNum)
    BulletWidget:SetVisibility(ESlateVisibility.Hidden)
  end
  ListenBuffInfo.BulletNum = 0
  self.Magazine:SetRenderTransformAngle(0)
  EMUIAnimationSubsystem:EMStopAnimation(self, self.FillBattle_Loop)
  EMUIAnimationSubsystem:EMPlayAnimation(self, self.EmptyBattle)
end

function M:GetBulletWidgetById(Id, BulletMaxNum)
  if Id < 0 then
    Id = (Id + 2 + BulletMaxNum) % BulletMaxNum
    if 0 == Id then
      Id = BulletMaxNum
    end
  end
  local BulletWidgetName = "Battle_LinenSkil_bulletl_PC_" .. Id
  local BulletWidget = self[BulletWidgetName]
  return BulletWidget
end

function M:StartHas_FirepowerSuppressionBuff(ListenBuffInfo)
  self.StateRemainTime:SetVisibility(ESlateVisibility.HitTestInvisible)
  EMUIAnimationSubsystem:EMPlayAnimation(self, self.OpenFire_Loop, 0, true)
  EMUIAnimationSubsystem:EMStopAnimation(self, self.EmptyBattle)
end

function M:TickHas_FirepowerSuppressionBuff(ListenBuffInfo, InDeltaTime)
  local Buff = ListenBuffInfo.Buff
  local BuffRemainTime = Buff.LeftTime
  local RoundRemainTime = UKismetMathLibrary.Round(BuffRemainTime)
  local Minute = math.floor(RoundRemainTime / 60)
  local Second = RoundRemainTime - Minute * 60
  local MinuteText = self:TimeFormatToString(Minute)
  local SecondText = self:TimeFormatToString(Second)
  self.StateRemainTime:SetText(MinuteText .. ": " .. SecondText)
end

function M:EndHas_FirepowerSuppressionBuff(ListenBuffInfo)
  self.StateRemainTime:SetVisibility(ESlateVisibility.Hidden)
  EMUIAnimationSubsystem:EMStopAnimation(self, self.OpenFire_Loop)
  EMUIAnimationSubsystem:EMPlayAnimation(self, self.OpenFireToNormal)
end

function M:TimeFormatToString(Time)
  if Time < 10 then
    return "0" .. Time
  else
    return tostring(Time)
  end
end

function M:StartListenSkill02(LinenSkill02Range)
  do return end
  local Camera = self.Owner:GetCameraComponent()
  local VerticalFOV = Camera.FieldOfView
  self.VerticalFOVHalfTan = math.tan(math.rad(VerticalFOV / 2))
  local WidgetGeometry = self:GetTickSpaceGeometry()
  local SightingCircleSize = USlateBlueprintLibrary.GetLocalSize(WidgetGeometry).X
  local SightingCircleSlot = UWidgetLayoutLibrary.SlotAsCanvasSlot(self.SightingCircle)
  SightingCircleSlot:SetSize(FVector2D(SightingCircleSize, SightingCircleSize))
  self.SightingCircle:SetVisibility(ESlateVisibility.HitTestInvisible)
  self:PlayAnimation(self.SightingCircle_in)
  self:PlayAnimation(self.SightingCircle_Loop, 0, 0)
end

function M:TickListenSkill02(LinenSkill02Range)
  local VerticalFOVHalfTan = self.VerticalFOVHalfTan
  local SightingCircleScale = math.tan(math.rad(LinenSkill02Range)) / VerticalFOVHalfTan
  self.SightingCircle:SetRenderScale(FVector2D(SightingCircleScale, SightingCircleScale))
end

function M:EndListenSkill02(LinenSkill02Range)
  self.SightingCircle:SetVisibility(ESlateVisibility.Hidden)
  self:StopAnimation(self.SightingCircle_in)
  self:StopAnimation(self.SightingCircle_Loop)
end

function M:SetImageBrushColor(Image, TineColor)
  Image.Brush.TintColor = TineColor
end

function M:Destruct()
  self:StopAllAnimations()
  self:FlushAnimations()
  self.Super.Destruct(self)
end

function M:InitBulletMagazine()
  for Id = MAX_BULLET_NUM, 1, -1 do
    local BulletWidget = self["Battle_LinenSkil_bulletl_PC_" .. Id]
    BulletWidget:SetVisibility(ESlateVisibility.Hidden)
  end
end

return M
