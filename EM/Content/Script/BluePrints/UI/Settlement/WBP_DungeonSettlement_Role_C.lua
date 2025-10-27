require("UnLua")
local WBP_DungeonSettlement_Role_C = Class("BluePrints.UI.BP_EMDungeonWidget_C")

function WBP_DungeonSettlement_Role_C:Construct()
  self.Text_Level:SetText("")
  self.Text_Exp_Up:SetText("")
  self.Text_LevelMax:SetText("")
  self.Bar_SizeX = UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(self.Bg_Exp):GetSize().X
  self:SetPercent_BarExp(0)
  self.UpdateExpKey_Bar = "UpdateExp_Bar_" .. self:GetName()
  self.UpdateExpKey_Audio = "UpdateExp_Audio_" .. self:GetName()
  self:SetVisibility(ESlateVisibility.Hidden)
end

function WBP_DungeonSettlement_Role_C:SetItem(OldBattleInfo, RoleName, IncrsExp, IsDisplayCurInfo, CurInfo, IsShowTextWhenZero)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  if "MeleeWeapon" == RoleName or "RangedWeapon" == RoleName then
    local Player = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
    if not Player[RoleName] then
      DebugPrint("DungeonSettlement_Role:SetItem RoleName", RoleName, "\230\178\161\230\156\137\229\175\185\229\186\148\230\173\166\229\153\168, \232\191\148\229\155\158false\239\188\129")
      return false
    end
  end
  self.Id = OldBattleInfo.Id
  self.RoleName = RoleName
  self.CachedLevel = OldBattleInfo.Level or 1
  self.CachedExp = OldBattleInfo.Exp or 0
  self.IncreasedExp = IncrsExp or 0
  self.EnhanceLevel = OldBattleInfo.EnhanceLevel or 0
  self.AvatarLevel = Avatar.Level
  self.CurInfo = CurInfo
  DebugPrint("DungeonSettlement_Role Id", self.Id, "RoleName", self.RoleName, "CachedLevel", self.CachedLevel, "CachedExp", self.CachedExp, "IncreasedExp", self.IncreasedExp, "EnhanceLevel", self.EnhanceLevel, "IsDisplayCurInfo", IsDisplayCurInfo)
  self.Name, self.IconPath, self.MaxLevel, self.CurrentLevel, self.CurrentExp, self.bIsMaxEnhanceLevel, self.bCanEnhance = self:GetRoleInfo(Avatar)
  DebugPrint("DungeonSettlement_Role2", self.Name, self.IconPath, "MaxLevel", self.MaxLevel, "CurrentLevel", self.CurrentLevel, "CurrentExp", self.CurrentExp, "IsMaxEnhanceLevel", self.bIsMaxEnhanceLevel, "CanEnhance", self.bCanEnhance)
  if self.RoleName == "Player" then
    self.IncreasedExp = self:CalcIncreasedExp()
  end
  if self.IconPath then
    local Icon = LoadObject(self.IconPath)
    self.Img_Role:GetDynamicMaterial():SetTextureParameterValue("IconMap", Icon)
  end
  self.LevelText = GText("UI_LEVEL_NAME")
  if self.RoleName == "Player" then
    self.Text_Level:SetText(GText("UI_Player_Level"))
    if IsDisplayCurInfo then
      self.Text_LevelNum:SetText(self.CurrentLevel)
    else
      self.Text_LevelNum:SetText(self.CachedLevel)
    end
  elseif IsDisplayCurInfo then
    self.Text_Level:SetText(self.LevelText .. self.CurrentLevel)
  else
    self.Text_Level:SetText(self.LevelText .. self.CachedLevel)
  end
  if self.RoleName == "Player" then
  end
  local IsReachMaxLevel = self.CachedLevel >= self.MaxLevel
  if IsReachMaxLevel then
    self:SetPercent_BarExp(1)
  else
    local DisplayPercent = 0
    if IsDisplayCurInfo then
      DisplayPercent = self.CurrentExp / self:GetRoleLevelMaxExp(self.CurrentLevel)
    else
      DisplayPercent = self.CachedExp / self:GetRoleLevelMaxExp(self.CachedLevel)
    end
    self:SetPercent_BarExp(DisplayPercent)
  end
  if IsShowTextWhenZero and 0 == self.IncreasedExp then
    if self.RoleName == "Player" then
      self.Switch_Exp:SetVisibility(ESlateVisibility.Collapsed)
    else
      self.Text_LevelMax:SetText(self.Name)
      self.Switch_Exp:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
      self.Switch_Exp:SetActiveWidgetIndex(1)
    end
  elseif IsReachMaxLevel then
    if self.bIsMaxEnhanceLevel then
      self.Text_LevelMax:SetText(GText("UI_Level_Max"))
    elseif self.bCanEnhance then
      self.Text_LevelMax:SetText(GText("UI_Level_Break"))
    else
      self.Text_LevelMax:SetText(GText("UI_Level_BreakAfter"))
    end
    self.Switch_Exp:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self.Switch_Exp:SetActiveWidgetIndex(1)
  else
    self.Text_Exp_Up:SetText("+" .. CommonUtils.GetCountStr(self.IncreasedExp))
    self.Switch_Exp:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self.Switch_Exp:SetActiveWidgetIndex(0)
  end
  return true
end

function WBP_DungeonSettlement_Role_C:PlayInAnimation()
  self:SetVisibility(ESlateVisibility.Visible)
  self:PlayAnimation(self.In)
end

function WBP_DungeonSettlement_Role_C:PlayExpAnim()
  if self.CachedLevel >= self.MaxLevel then
    return
  end
  local FullTime = 1
  local FrameRate = 24
  local DisLevel = self.CachedLevel
  local DisExp = self.CachedExp
  local TotalAddExp = 0
  local LevelMaxExp, DeltaAddExp = self:GetDeltaExpInfo(DisLevel, FrameRate)
  
  local function UpdateExpFun_Bar()
    local IsBreakLevel = false
    local NewDisExp = DisExp + DeltaAddExp
    if DisLevel == self.CurrentLevel then
      if NewDisExp > self.CurrentExp then
        TotalAddExp = TotalAddExp + self.CurrentExp - DisExp
        DisExp = self.CurrentExp
        self:RemoveTimer(self.UpdateExpKey_Bar, true)
        self:RemoveTimer(self.UpdateExpKey_Audio, true)
      else
        DisExp = NewDisExp
        TotalAddExp = TotalAddExp + DeltaAddExp
      end
    elseif NewDisExp < LevelMaxExp then
      DisExp = NewDisExp
      TotalAddExp = TotalAddExp + DeltaAddExp
    else
      TotalAddExp = TotalAddExp + LevelMaxExp - DisExp
      DisExp = 0
      DisLevel = DisLevel + 1
      LevelMaxExp, DeltaAddExp = self:GetDeltaExpInfo(DisLevel, FrameRate)
      IsBreakLevel = true
      AudioManager(self):PlayUISound(self, "event:/ui/common/level_sucess_exp_grow_update", nil, nil)
    end
    local DisPercent = DisExp / LevelMaxExp
    self:SetPercent_BarExp(DisPercent)
    if IsBreakLevel then
      self:SetPercent_BarExp(0)
      if self.RoleName ~= "Player" then
        self.Text_Level:SetText(self.LevelText .. DisLevel)
      else
        self.Text_LevelNum:SetText(DisLevel)
      end
    end
  end
  
  self:AddTimer(FullTime / FrameRate, UpdateExpFun_Bar, true, 0, self.UpdateExpKey_Bar, true)
  local AudioInterval = 0.05
  
  local function UpdateExpFun_Audio()
    AudioManager(self):PlayUISound(self, "event:/ui/common/level_sucess_exp_grow", nil, nil)
  end
  
  self:AddTimer(AudioInterval, UpdateExpFun_Audio, true, 0, self.UpdateExpKey_Audio, true)
end

function WBP_DungeonSettlement_Role_C:GetDeltaExpInfo(Level, DeltaNum)
  local LevelMaxExp = self:GetRoleLevelMaxExp(Level)
  local DeltaExp = math.ceil(LevelMaxExp / DeltaNum)
  return LevelMaxExp, DeltaExp
end

function WBP_DungeonSettlement_Role_C:GetRoleInfo(Avatar)
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  if self.RoleName == "Char" then
    return self:GetCharInfo(Player)
  elseif self.RoleName == "Player" then
    return self:GetPlayerInfo(Avatar)
  elseif self.RoleName == "MeleeWeapon" then
    return self:GetWeaponInfo(Player)
  elseif self.RoleName == "RangedWeapon" then
    return self:GetWeaponInfo(Player)
  end
end

function WBP_DungeonSettlement_Role_C:GetCharInfo(Player)
  if not self.CurInfo then
    self.CurInfo = {
      Exp = Player:GetAttr("Exp"),
      Level = Player:GetAttr("Level")
    }
  end
  local CharId = self.Id
  local EnhanceLevel = self.EnhanceLevel
  local CurrentExp = self.CurInfo.Exp
  local CurrentLevel = self.CurInfo.Level
  local CharInfo = DataMgr.Char[CharId]
  local Name = GText(CharInfo.CharName)
  local IconPath = CharInfo.Icon
  local MaxLevel = CharInfo.CharMaxLevel
  local bIsMaxEnhanceLevel = true
  local bCanEnhance = false
  local CharBreakInfo = DataMgr.CharBreak[CharId]
  if CharBreakInfo then
    local EnhanceLevelInfo = CharBreakInfo[EnhanceLevel + 1]
    if EnhanceLevelInfo then
      bIsMaxEnhanceLevel = false
      MaxLevel = EnhanceLevelInfo.CharBreakLevel
      local BreakLimitLevel = DataMgr.GlobalConstant["BreakLimitLevel_" .. EnhanceLevel + 1].ConstantValue
      if BreakLimitLevel <= self.AvatarLevel then
        bCanEnhance = true
      end
    end
  end
  assert(MaxLevel)
  return Name, IconPath, MaxLevel, CurrentLevel, CurrentExp, bIsMaxEnhanceLevel, bCanEnhance
end

function WBP_DungeonSettlement_Role_C:GetPlayerInfo(Avatar)
  local IconPath = "/Game/UI/Texture/Dynamic/Atlas/Prop/Item/T_Exp_Rank.T_Exp_Rank"
  local MaxLevel = #DataMgr.PlayerLevelUp
  local GameInstance = GWorld.GameInstance
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  local CurrentExp = Avatar.Exp
  local CurrentLevel = Avatar.Level
  local bIsMaxEnhanceLevel = true
  local bCanEnhance = false
  assert(MaxLevel)
  return "", IconPath, MaxLevel, CurrentLevel, CurrentExp, bIsMaxEnhanceLevel, bCanEnhance
end

function WBP_DungeonSettlement_Role_C:GetWeaponInfo(Player)
  if not Player[self.RoleName] then
    self.CurInfo = {
      Exp = self.CachedExp,
      Level = self.CachedLevel
    }
  end
  if not self.CurInfo then
    self.CurInfo = {
      Exp = Player[self.RoleName]:GetAttr("Exp"),
      Level = Player[self.RoleName]:GetAttr("Level")
    }
  end
  local WeaponId = self.Id
  local EnhanceLevel = self.EnhanceLevel
  local CurrentExp = self.CurInfo.Exp
  local CurrentLevel = self.CurInfo.Level
  local WeaponInfo = DataMgr.Weapon[WeaponId]
  local Name = GText(WeaponInfo.WeaponName)
  local IconPath = WeaponInfo.Icon
  local MaxLevel = WeaponInfo.WeaponMaxLevel
  local bIsMaxEnhanceLevel = true
  local bCanEnhance = false
  local WeaponBreakInfo = DataMgr.WeaponBreak[WeaponId]
  if WeaponBreakInfo then
    local EnhanceLevelInfo = WeaponBreakInfo[EnhanceLevel + 1]
    if EnhanceLevelInfo then
      bIsMaxEnhanceLevel = false
      MaxLevel = EnhanceLevelInfo.WeaponBreakLevel
      local BreakLimitLevel = DataMgr.GlobalConstant["BreakLimitLevel_" .. EnhanceLevel + 1].ConstantValue
      if BreakLimitLevel <= self.AvatarLevel then
        bCanEnhance = true
      end
    end
  end
  assert(MaxLevel)
  return Name, IconPath, MaxLevel, CurrentLevel, CurrentExp, bIsMaxEnhanceLevel, bCanEnhance
end

function WBP_DungeonSettlement_Role_C:GetRoleLevelMaxExp(Level)
  if self.RoleName == "Char" then
    return DataMgr.LevelUp[Level].CharLevelMaxExp
  elseif self.RoleName == "Player" then
    return DataMgr.PlayerLevelUp[Level].PlayerLevelMaxExp
  else
    return DataMgr.WeaponLevelUp[Level].WeaponLevelMaxExp
  end
end

function WBP_DungeonSettlement_Role_C:SetPercent_BarExp(percent)
  if self.RoleName == "Player" then
    DebugPrint("thy     percent", percent)
    local ColorBarProgress = self.Bar:GetDynamicMaterial()
    DebugPrint("thy     ColorBarProgress", ColorBarProgress)
    ColorBarProgress:SetScalarParameterValue("Percent", percent)
    return
  end
  self.CachedPercent = percent
  local SetSucc = self:TryRealSetPercent()
  if SetSucc then
    return
  end
  if self:IsExistTimer("SetPercentDelay") then
    return
  end
  self:AddTimer(0.1, function()
    local res = self:TryRealSetPercent()
    if res then
      self:RemoveTimer("SetPercentDelay")
    end
  end, true, 0, "SetPercentDelay", true)
end

function WBP_DungeonSettlement_Role_C:TryRealSetPercent()
  local Length = USlateBlueprintLibrary.GetLocalSize(self.Bg_Exp:GetCachedGeometry()).X
  if Length <= 0 then
    return false
  end
  local Exp_Slot = UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(self.Bg_Exp)
  local Exp_Slot2 = UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(self.Bar_Exp)
  if Exp_Slot and Exp_Slot2 then
    local NewOffset = Exp_Slot2:GetOffsets()
    NewOffset.Right = Length * (1 - self.CachedPercent)
    Exp_Slot2:SetOffsets(NewOffset)
  end
  return true
end

function WBP_DungeonSettlement_Role_C:CalcIncreasedExp()
  if self.CachedLevel > self.CurrentLevel then
    return 0
  end
  local resExp = self.CurrentExp - self.CachedExp
  for Level = self.CachedLevel, self.CurrentLevel - 1 do
    resExp = resExp + self:GetRoleLevelMaxExp(Level)
  end
  return resExp
end

return WBP_DungeonSettlement_Role_C
