require("UnLua")
local WBP_DungeonDefenseLowHeal_C = Class("BluePrints.UI.BP_UIState_C")

function WBP_DungeonDefenseLowHeal_C:InitUIInfo(Name, IsInUIMode, EventList, ...)
  self:CheckDungeonMode()
  self:SetHealthText()
  if self.IsSynthesisMode then
    self.Text_Target:SetText(GText("DUNGEON_SYNTHESIS_107"))
  else
    self.Text_Target:SetText(GText("UI_Defense_TargetHealth"))
  end
  self.bIsDefenceCoreDead = false
  self.PlayBreakAnimInterval = self.PlayBreakAnimInterval or 2.0
  self.Super.InitUIInfo(self, Name, IsInUIMode, EventList, ...)
end

function WBP_DungeonDefenseLowHeal_C:OnLoaded(...)
  self.Root:SetVisibility(ESlateVisibility.Collapsed)
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  local UIManager = GameInstance:GetGameUIManager()
  local BattleMain = UIManager and UIManager:GetUIObj("BattleMain") or nil
  if BattleMain then
    BattleMain.Pos_LowHealth:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    BattleMain.Pos_LowHealth:AddChild(self)
    self.Root:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self:PlayAnimation(self.In)
    if BattleMain.Pos_ProcessCabin:GetChildrenCount() <= 0 and BattleMain.Pos_ProcessSew:GetChildrenCount() <= 0 and BattleMain.Pos_ProcessEscort:GetChildrenCount() <= 0 then
      BattleMain.Process_Progress:SetVisibility(ESlateVisibility.Collapsed)
    end
  end
end

function WBP_DungeonDefenseLowHeal_C:SetHealthText()
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  local Keys = GameState.DefBaseMap:Keys()
  if Keys:Length() <= 0 then
    return
  end
  local MechanismEid = Keys:GetRef(1)
  local CurTargetActor = Battle(self):GetEntity(MechanismEid)
  if CurTargetActor then
    local NewHp = CurTargetActor:GetAttr("Hp")
    local MaxHp = CurTargetActor:GetAttr("MaxHp")
    local NewHpPercent = NewHp / MaxHp
    self.Text_Health:SetText(tostring(math.ceil(NewHpPercent * 100)))
  end
end

function WBP_DungeonDefenseLowHeal_C:OnDefenceCoreDead(Callback)
  if self.bIsDefenceCoreDead then
    return
  end
  self.bIsDefenceCoreDead = true
  self.Text_Target:SetText(GText("UI_Defense_Fail"))
  self.Text_Health:SetText("0")
  self:AddTimer(self.PlayBreakAnimInterval, function()
    self:PlayAnimation(self.Auto_Out)
    AudioManager(self):PlayUISound(self, "event:/ui/common/level_fail_break", nil, nil)
  end)
  self:AddTimer(self.PlayBreakAnimInterval + self.Auto_Out:GetEndTime(), function()
    if Callback then
      Callback()
    end
  end)
end

function WBP_DungeonDefenseLowHeal_C:OnAnimationFinished(Animation)
  if Animation == self.Auto_Out then
  end
end

function WBP_DungeonDefenseLowHeal_C:CheckDungeonMode()
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  if not GameState then
    return
  end
  if GameState.GameModeType == "Synthesis" then
    self.IsSynthesisMode = true
  end
end

return WBP_DungeonDefenseLowHeal_C
