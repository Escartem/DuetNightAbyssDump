require("UnLua")
local WBP_Char_LevelUp_C = Class("BluePrints.UI.BP_UIState_C")

function WBP_Char_LevelUp_C:Initialize(Initializer)
  self.Super.Initialize(self)
  self.UIManager = GWorld.GameInstance:GetGameUIManager()
end

function WBP_Char_LevelUp_C:OnLoaded(IsPlayerLevelUp)
  self.IsPlaying = false
  if IsPlayerLevelUp then
    self:ShowPlayerToast()
  else
    self:TryFindNextToast()
  end
end

function WBP_Char_LevelUp_C:Hide(HideTag)
  WBP_Char_LevelUp_C.Super.Hide(self, HideTag)
  self:PauseTimer("FindNextToast")
end

function WBP_Char_LevelUp_C:Show(ShowTag)
  WBP_Char_LevelUp_C.Super.Show(self, ShowTag)
  self:UnPauseTimer("FindNextToast")
end

function WBP_Char_LevelUp_C:PlayNextToast(Type)
  local GameInstance = GWorld.GameInstance
  if "Player" == Type then
    local LevelupInfo = GameInstance.LevelUpToastQueue[Type]
    self:RealShowPlayerToast(LevelupInfo)
  else
    local NewLevel = GameInstance.LevelUpToastQueue[Type][1]
    local CurrentId = GameInstance.LevelUpToastQueue[Type][3]
    self.Text_LevelUpTitle:SetText(GText("UI_FUNC_LEVELUP"))
    self.Text_LevelUpTitle:SetVisibility(UIConst.VisibilityOp.Visible)
    self.Group_LevelUp:SetVisibility(UE4.ESlateVisibility.HitTestInvisible)
    self.Group_HeMingLvUp:SetVisibility(UE4.ESlateVisibility.Hidden)
    local TextMapId
    if "Char" == Type then
      TextMapId = "UI_CHAR_NAME_" .. tostring(CurrentId)
    elseif "MeleeWeapon" == Type or "RangedWeapon" == Type then
      TextMapId = "UI_WEAPON_NAME_" .. tostring(CurrentId)
    end
    local DescContent = GText(TextMapId) .. " " .. GText("UI_LEVEL_NAME")
    self.Text_LevelUpDesc:SetText(DescContent)
    self.Text_Num:SetText(NewLevel)
    self.Text_LevelUpDesc:SetVisibility(UIConst.VisibilityOp.Visible)
    self.Text_Num:SetVisibility(UIConst.VisibilityOp.Visible)
    local fLevelData = DataMgr.LevelUp[NewLevel - 1]
    local tLevelData = DataMgr.LevelUp[NewLevel]
    local ModVolume = tLevelData.ModVolume - fLevelData.ModVolume
    local ModName = GText("UI_Tosat_Levelup_Mod")
    self.Text_LevelUpDesc_1:SetText(ModName .. "+")
    self.Text_Num_1:SetText(ModVolume)
    self.Text_LevelUpDesc_1:SetVisibility(UIConst.VisibilityOp.Visible)
    self.Text_Num_1:SetVisibility(UIConst.VisibilityOp.Visible)
    GameInstance.LevelUpToastQueue[Type] = nil
    AudioManager(self):PlayUISound(self, "event:/ui/common/role_update", nil, nil)
    if ModVolume > 0 then
      self:PlayToastAnimation(self.In_ModUp, self.Auto_Out)
    else
      self:PlayToastAnimation(self.In_NoMod, self.Auto_Out)
    end
  end
end

function WBP_Char_LevelUp_C:TryFindNextToast()
  if self.IsPlaying then
    return
  end
  self.IsPlaying = true
  self:FindNextToast()
end

function WBP_Char_LevelUp_C:FindNextToast()
  local GameInstance = GWorld.GameInstance
  if GameInstance.LevelUpToastQueue.Player ~= nil then
    self:PlayNextToast("Player")
    return
  elseif nil ~= GameInstance.LevelUpToastQueue.Char then
    self:PlayNextToast("Char")
    return
  elseif nil ~= GameInstance.LevelUpToastQueue.MeleeWeapon then
    self:PlayNextToast("MeleeWeapon")
    return
  elseif nil ~= GameInstance.LevelUpToastQueue.RangedWeapon then
    self:PlayNextToast("RangedWeapon")
    return
  else
    self.IsPlaying = false
    self:RealClose()
    return
  end
end

function WBP_Char_LevelUp_C:RealShowPlayerToast(LevelupInfo)
  local GameInstance = GWorld.GameInstance
  self.Group_HeMingLvUp:SetVisibility(UE4.ESlateVisibility.HitTestInvisible)
  self.Group_LevelUp:SetVisibility(UE4.ESlateVisibility.Hidden)
  self.Text_Exp:SetText(GText("RESOURCE_NAME_2001"))
  GameInstance.LevelUpToastQueue.Player = nil
  local AnimToPlay, AnimLength
  if not LevelupInfo.ShowProgresBar then
    AnimToPlay = self.HeMing_InOut
    AnimLength = self.HeMing_InOut:GetEndTime()
    self.FromExp = nil
    self.Text_HeMingLevelUpNum:SetText(LevelupInfo.CurLevel)
    self.Text_HeMingLevelUpDesc:SetText(GText("UI_Player_Level"))
  else
    if LevelupInfo.OldLevel == LevelupInfo.CurLevel then
      AnimToPlay = self.HeMing_ExpAdd
      AnimLength = self.HeMing_ExpAdd:GetEndTime()
      self.FromExp = LevelupInfo.OldExp
      self.ToExp = LevelupInfo.CurExp
      self.Text_HeMingLevelUpNum:SetText(LevelupInfo.CurLevel)
      self.Text_HeMingLevelUpDesc:SetText(GText("UI_Player_Level"))
    else
      AnimToPlay = self.HeMing_LvUp
      AnimLength = self.HeMing_LvUp:GetEndTime()
      self.FromExp = 0
      self.ToExp = LevelupInfo.CurExp
      self.Text_HeMingLevelUpNum:SetText(LevelupInfo.OldLevel)
      self.Text_HeMingLevelUpDesc:SetText(GText("UI_Player_LevelUp"))
    end
    self.FromLevel = LevelupInfo.OldLevel
    self.ToLevel = LevelupInfo.CurLevel
    self.CurTotalExp = DataMgr.PlayerLevelUp[LevelupInfo.CurLevel].PlayerLevelMaxExp
    self:SetExpProgress(math.min(self.FromExp, self.CurTotalExp) / self.CurTotalExp)
    local TotalGetExp = self:CalcTotalGetExp(LevelupInfo.OldLevel, LevelupInfo.OldExp, LevelupInfo.CurLevel, LevelupInfo.CurExp)
    self.Text_Exp_Num:SetText(TotalGetExp)
  end
  if AnimToPlay and AnimLength then
    self:PlayAnimation(AnimToPlay)
    self:AddTimer(AnimLength, self.FindNextToast, false, nil, "FindNextToast", true)
  end
end

function WBP_Char_LevelUp_C:ShowPlayerToast()
  local GameInstance = GWorld.GameInstance
  if GameInstance.LevelUpToastQueue and GameInstance.LevelUpToastQueue.Player ~= nil then
    self:PlayNextToast("Player")
    return
  else
    self:RealClose()
  end
end

function WBP_Char_LevelUp_C:PlayToastAnimation(InAnim, OutAnim)
  local InAnimTime = InAnim:GetEndTime()
  local OutAnimTime = OutAnim:GetEndTime()
  DebugPrint("Tianyi@ InTime: " .. InAnimTime)
  
  local function PlayOutAnim()
    DebugPrint("Tianyi@ PlayOut")
    if EMUIAnimationSubsystem then
      EMUIAnimationSubsystem:EMPlayAnimation(self, OutAnim)
    end
    self:AddTimer(OutAnimTime, self.FindNextToast, false, nil, nil, false)
  end
  
  if EMUIAnimationSubsystem then
    EMUIAnimationSubsystem:EMPlayAnimation(self, InAnim)
  end
  self:AddTimer(InAnimTime + self.DelayTime, PlayOutAnim, false, nil, nil, false)
end

function WBP_Char_LevelUp_C:RefreshLevelNum_Lua()
  self.Text_HeMingLevelUpNum:SetText(self.ToLevel)
end

function WBP_Char_LevelUp_C:RefreshExpNum_Lua()
  self.Text_Exp_Num:SetText(self.ToExp)
  self.Text_Exp_Total:SetText(self.CurTotalExp)
end

function WBP_Char_LevelUp_C:PlayExpBarAnim_Lua()
  if self.FromExp and self.ToExp and self.CurTotalExp then
    if self.TimerHandle then
      self:RemoveTimer(self.TimerHandle)
      self.BeginTimestamp = nil
    end
    AudioManager(self):PlayUISound(self, "event:/ui/common/role_update_exp_add", "ExpLevelUp", nil)
    self.BeginTimestamp = UE4.UGameplayStatics.GetRealTimeSeconds(self)
    self.TimerHandle = self:AddTimer(0.03, function()
      local CurTime = UE4.UGameplayStatics.GetRealTimeSeconds(self)
      if CurTime - self.BeginTimestamp >= self.ExpProgressDuration then
        self:RemoveTimer(self.TimerHandle)
        self.FromExp = nil
        self.ToExp = nil
        self.CurTotalExp = nil
        self.BeginTimestamp = nil
        AudioManager(self):StopSound(self, "ExpLevelUp")
        return
      end
      local CurExp = self.FromExp + (self.ToExp - self.FromExp) * (CurTime - self.BeginTimestamp) / self.ExpProgressDuration
      self:SetExpProgress(math.min(CurExp, self.CurTotalExp) / self.CurTotalExp)
    end, true, nil, nil, true)
  end
end

function WBP_Char_LevelUp_C:SetExpProgress(Progress)
  self.Panel_ExpBar:ForceLayoutPrepass()
  local TotalLength = self.Panel_ExpBar:GetDesiredSize().X
  local ExpBarSlot = UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(self.Exp_Bar)
  local CurSize = ExpBarSlot:GetSize()
  ExpBarSlot:SetSize(UE4.FVector2D(TotalLength * Progress, CurSize.Y))
end

function WBP_Char_LevelUp_C:CalcTotalGetExp(OldLevel, OldExp, NewLevel, NewExp)
  if OldLevel == NewLevel then
    return NewExp - OldExp
  end
  local PlayerLevelUpData = DataMgr.PlayerLevelUp
  local OldLevelData = PlayerLevelUpData[OldLevel]
  local TotalGetExp = OldLevelData.PlayerLevelMaxExp - OldExp + NewExp
  for i = OldLevel + 1, NewLevel - 1 do
    local LevelData = PlayerLevelUpData[i]
    TotalGetExp = TotalGetExp + LevelData.PlayerLevelMaxExp
  end
  return TotalGetExp
end

return WBP_Char_LevelUp_C
