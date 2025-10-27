require("UnLua")
local M = Class("BluePrints.UI.UI_PC.Battle.ExclusiveSkill.Base.Battle_Skill_UI_Base")
local ACTIVE_FUNNEL_CLASS = 1

function M:Construct()
  DebugPrint("gmy@Battle_XierSkill M:Construct", 123123)
  self.DeltaTime = 0
end

function M:OnLoaded(OwnerPlayer, Params)
  DebugPrint("gmy@Battle_XierSkill M:OnLoaded", 123123)
  self.OwnerPlayer = OwnerPlayer
  self.SummonId = Params.SummonId
  self.bIsSummonActive = false
  self.MaxLifeTime = 666
  self.Root:SetVisibility(ESlateVisibility.Collapsed)
  self:AddTimer(0.3, self.UpdateBattleCharUI, true, 0)
end

function M:UpdateBattleCharUI()
  if IsValid(self.OwnerPlayer) then
    local SummonList = self.OwnerPlayer:GetSummonsList(self.SummonId, false, true)
    local bHasActiveFunnel = false
    local bFirstActive = false
    local MaxRemainingLifeTime = -1
    for _, SummonEid in pairs(SummonList) do
      local Summon = Battle(self):GetEntity(SummonEid)
      if IsValid(Summon) then
        local FunnelClass = Summon.FunnelClass
        if FunnelClass == ACTIVE_FUNNEL_CLASS then
          bHasActiveFunnel = true
          if not self.bIsSummonActive then
            self.bIsSummonActive = true
            bFirstActive = true
          end
        end
        local LifeTime = UE4.UBattleFunctionLibrary.GetSummonRemainingLifeTime(Summon)
        MaxRemainingLifeTime = math.max(MaxRemainingLifeTime, LifeTime)
      end
    end
    if bHasActiveFunnel then
      if bFirstActive then
        self.MaxLifeTime = MaxRemainingLifeTime
        self:PlayAnimation(self.In)
      end
      self:UpdateProgress(MaxRemainingLifeTime, self.MaxLifeTime)
      local bNowPausing = self.OwnerPlayer:GetBool("Xier_InSkill1")
      DebugPrint("gmy@Battle_XierSkill M:UpdateBattleCharUI", bNowPausing, MaxRemainingLifeTime)
      self.bOldPausing = self.bOldPausing or false
      if bNowPausing and not self.bOldPausing then
        self:PlayAnimationForward(self.Pause)
      else
        if not bNowPausing and self.bOldPausing then
          self:PlayAnimationReverse(self.Pause)
        else
        end
      end
      self.bOldPausing = bNowPausing
      self.Root:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    else
      if self.bIsSummonActive then
        self:BindToAnimationFinished(self.Out, function()
          self:UnbindAllFromAnimationFinished(self.Out)
          self.Root:SetVisibility(ESlateVisibility.Collapsed)
        end)
        self:PlayAnimation(self.Out)
      end
      self.bIsSummonActive = false
    end
  end
end

function M:UpdateProgress(Remaining, Max)
  if Remaining > 0 then
    local Percent = math.max(Remaining / Max, 0)
    self.Progress_Xier:SetPercent(Percent)
    self.Num_Xier:SetText(string.format("%.0f", Remaining))
  end
end

return M
