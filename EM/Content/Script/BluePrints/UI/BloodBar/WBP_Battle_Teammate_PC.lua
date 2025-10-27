require("UnLua")
local BloodBarUtils = require("BluePrints.UI.BloodBar.BloodBarUtils")
local WBP_Teammate_PC_C = Class("BluePrints.UI.BP_UIState_C")

function WBP_Teammate_PC_C:Initialize(Initializer)
  self.Super.Initialize(self)
  self.MaxHp = 0
  self.CurHp = 0
  self.LastHp = 0
  self.MaxShield = 0
  self.CurShield = 0
  self.LastShield = 0
  self.CurOverShield = 0
  self.LastOverShield = 0
  self.Owner = nil
  self.HpBar = nil
  self.ShieldBar = nil
  self.BarLength = 0
  self.RoleId = 0
  self.Eid = 0
  self.LowHpPercent = 0.3
  self.BloodState = {}
end

function WBP_Teammate_PC_C:InitConfig(Owner)
  if not IsValid(Owner) then
    return
  end
  self.Owner = Owner
  self.RoleId = Owner.CurrentRoleId
  self.Eid = Owner.Eid
  self:ClearBloodAllState(self.Eid)
  self:InitValue()
  self.Group_HPBarRoot:ClearChildren()
  self.Group_ShieldRoot:ClearChildren()
  self:LoadHpBar()
  self:CheckAndLoadShieldBar()
  self:SetName()
  self:SetImage(false)
  self:UpdateCharBuffUI()
  self:BindToAnimationFinished(self.In, {
    self,
    function()
      self:UnbindAllFromAnimationFinished(self.In)
      local HpBarGeometry = self.Group_HPBarRoot:GetTickSpaceGeometry()
      local Size = UE4.USlateBlueprintLibrary.GetLocalSize(HpBarGeometry)
      if self.HpBar then
        self.HpBar:SetLength(Size.X)
        self.HpBar:SetHeight(Size.Y)
      end
      if self.ShieldBar then
        self.ShieldBar:SetLength(Size.X * 0.98)
        self.ShieldBar:SetHeight(Size.Y)
      end
    end
  })
  self:InitUISettingByPlatform()
  self:PlayAnimation(self.In)
  self.IsDestroied = nil
  self:InitShortageUI()
end

function WBP_Teammate_PC_C:InitWithOutCharacter(PlayerState)
  if PlayerState:IsA(AEMPlayerState) then
    self.Text_Name:SetText(PlayerState.PlayerName)
    self:SetNameMaterial(self.NameMaterial_Player)
  elseif PlayerState:IsA(APhantomState) then
    self.Text_Name:SetText(GText(DataMgr.BattleChar[PlayerState.CharId].CharName))
    self:SetNameMaterial(self.NameMaterial_Phantom)
  end
  self.RoleId = PlayerState.CharId
  self.Eid = PlayerState.Eid
  self.MaxShield = 1
  self:SetImage(PlayerState.TeamRecoveryState ~= ETeamRecoveryState.Alive)
  local Player = Battle(self):GetEntity(PlayerState.Eid)
  if not IsValid(Player) then
    self:AddBloodState(self.Eid, BloodBarUtils.AllBloodState.OverReach)
  else
    self:RemoveBloodState(self.Eid, BloodBarUtils.AllBloodState.OverReach)
  end
  self:CheckAndLoadShieldBar()
  self:LoadHpBar()
  self.HpBar:SetBarPercent(1)
  self.ShieldBar:SetBarPercent(1)
  self:PlayAnimation(self.In)
  self.IsDestroied = nil
end

function WBP_Teammate_PC_C:SetNameMaterial(MaterialRef)
  UResourceLibrary.LoadObjectAsync(self, tostring(MaterialRef), {
    self,
    function(obj, Material)
      if not IsValid(obj) then
        return
      end
      local Owner = Battle(self):GetEntity(self.Eid)
      if not IsValid(Owner) then
        return
      end
      if Owner:IsPhantom() and MaterialRef ~= self.NameMaterial_Phantom then
        return
      end
      if Owner:IsPlayer() and MaterialRef ~= self.NameMaterial_Player then
        return
      end
      local Font = self.Text_Name.Font
      Font.FontMaterial = Material
      self.Text_Name:SetFont(Font)
    end
  })
end

function WBP_Teammate_PC_C:InitValue(IsDead)
  local Owner = self.Owner
  if not IsValid(Owner) then
    return
  end
  self.MaxHp = Owner:GetAttr("MaxHp")
  self.CurHp = Owner:GetAttr("Hp")
  self.LastHp = self.CurHp
  self.MaxShield = Owner:GetAttr("MaxES") or 0
  self.CurShield = Owner:GetAttr("ES") or 0
  self.LastShield = self.CurShield
  self.CurOverShield = Owner:GetAttr("OverShield") or 0
  self.LastOverShield = self.CurOverShield
  self.BloodState[BloodBarUtils.AllBloodState.Dead] = Owner:IsDead() and 1 or nil
  if nil == IsDead then
    self:SetImage(Owner:IsDead())
  else
    self:SetImage(IsDead)
  end
end

function WBP_Teammate_PC_C:InitUISettingByPlatform()
  if CommonUtils.GetDeviceTypeByPlatformName(self) == "Mobile" then
    local PlayerAvatar = GWorld:GetAvatar()
    if not GWorld:IsStandAlone() then
      self.Button_Area.OnClicked:Clear()
      self.Button_Area.OnClicked:Add(self, self.OpenTeamInfo)
      self.Button_Area:SetVisibility(UE4.ESlateVisibility.Visible)
    else
      self.Button_Area:SetVisibility(UE4.ESlateVisibility.Collapsed)
    end
  end
end

function WBP_Teammate_PC_C:ReInit()
  self:InitValue()
  self:UpdateBar()
end

function WBP_Teammate_PC_C:UpdateBar()
  if not IsValid(self.Owner) then
    return
  end
  self.LastHp = self.CurHp
  self.LastShield = self.CurShield
  self.LastOverShield = self.CurOverShield
  self.CurHp = self.Owner:GetAttr("Hp") or 0
  self.CurShield = self.Owner:GetAttr("ES") or 0
  self.CurOverShield = self.Owner:GetAttr("OverShield") or 0
  local IsHeal = self.LastHp < self.CurHp
  if self.MaxShield > 0 and self.ShieldBar then
    self.ShieldBar:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    local CurPercent = math.clamp(self.CurShield / self.MaxShield, 0, 1)
    if self.LastShield < self.CurShield then
      self.ShieldBar:SetBarPercent(CurPercent, false)
      self.ShieldBar:PlayRecoveryShield()
    else
      self.ShieldBar:SetBarPercent(CurPercent)
    end
  end
  if self.HpBar then
    local CurPercent = math.clamp(self.CurHp / self.MaxHp, 0, 1)
    self.HpBar:SetBarPercent(CurPercent)
  end
  if self.ShieldBar and self.MaxShield > 0 then
    local CurPercent = math.clamp(self.CurOverShield / self.MaxShield, 0, 1)
    if self.CurOverShield <= self.LastOverShield then
      self.ShieldBar:SetOverShieldPercent(CurPercent)
      self.ShieldBar:PlayOverShieldDeduct(true)
    elseif self.CurOverShield > self.LastOverShield then
      self.ShieldBar:SetOverShieldPercent(CurPercent)
      if self.LastOverShield <= 1.0E-5 then
        self.ShieldBar:ShowOrHideOverShieldGroup(true)
        self.ShieldBar:OnFirstAddOverShield()
      end
      self.ShieldBar:PlayOverShieldRecover()
    end
  end
  if IsHeal then
    self:PlayHealAnimation()
  end
end

function WBP_Teammate_PC_C:LoadHpBar()
  self.HpBar = BloodBarUtils.LoadSubWidget(self, self.Group_HPBarRoot, "HPBar", false, 0)
end

function WBP_Teammate_PC_C:CheckAndLoadShieldBar()
  if self.MaxShield <= 0 then
    self.Group_ShieldRoot:SetVisibility(UE4.ESlateVisibility.Collapsed)
    return
  end
  self.ShieldBar = BloodBarUtils.LoadSubWidget(self, self.Group_ShieldRoot, "ShieldBar", 0, 0)
end

function WBP_Teammate_PC_C:SetName()
  self.Text_Name:SetText("")
  if self.Owner:IsPhantom() then
    local NameKey = DataMgr.BattleChar[self.RoleId].CharName
    if string.find(DataMgr.TextMap_ContentEN[NameKey].ContentEN, "{nickname") and not IsStandAlone(self) then
      local PhantomState = GameState(self):GetPhantomState(self.Owner.Eid)
      if not PhantomState then
        local PhantomOwner = self.Owner.PhantomOwner
        if PhantomOwner then
          local OwnerState = GameState(self):GetPlayerState(PhantomOwner.Eid)
          if OwnerState and OwnerState.PlayerName then
            self.Text_Name:SetText(OwnerState.PlayerName)
          end
        end
        self.bPendingPhantomSetName = true
        return
      end
      local PhantomOwnerEid = PhantomState.OwnerEid
      if PhantomOwnerEid then
        local OwnerState = GameState(self):GetPlayerState(PhantomOwnerEid)
        if OwnerState and OwnerState.PlayerName then
          self.Text_Name:SetText(OwnerState.PlayerName)
        else
          self.Text_Name:SetText(GText(NameKey))
          self.bPendingPhantomSetName = true
          DebugPrint(ErrorTag, "WBP_Teammate_PC_C:SetName  \228\184\187\232\167\146\233\173\133\229\189\177\230\137\190\228\184\141\229\136\176\229\174\131\231\154\132OwnerPlayerName")
        end
      else
        DebugPrint(ErrorTag, "WBP_Teammate_PC_C:SetName  \228\184\187\232\167\146\233\173\133\229\189\177\230\137\190\228\184\141\229\136\176\229\174\131\231\154\132Owner\239\188\140 \230\151\160\230\179\149\232\181\139\228\186\136\229\144\141\231\167\176")
        self.Text_Name:SetText("<ERROR>")
      end
    else
      self.Text_Name:SetText(GText(NameKey))
    end
    self:SetNameMaterial(self.NameMaterial_Phantom)
  elseif self.Owner:IsPlayer() and self.Owner.GetNickName then
    self.Text_Name:SetText(self.Owner:GetNickName())
    self:SetNameMaterial(self.NameMaterial_Player)
  end
end

function WBP_Teammate_PC_C:OnDead()
  self:SetImage(true)
  self:PlayAnimation(self.LifeSwitch)
  self:PlayHpBarGreyAnimation(false)
end

function WBP_Teammate_PC_C:OnRecovery(Eid)
  if Eid ~= self.Eid then
    return
  end
  if not IsValid(self.Owner) then
    self:SetImage(false)
  end
  self:InitValue(false)
  if self.HpBar then
    self.HpBar:ReInit()
  end
  if self.ShieldBar then
    self.ShieldBar:ReInit()
  end
  self:PlayAnimation(self.ReverseLifeSwitch)
  self:PlayHpBarGreyAnimation(true)
  if self.BloodState[BloodBarUtils.AllBloodState.OverReach] == nil then
    self.Group_HPBarRoot:SetRenderOpacity(1.0)
    self.Group_ShieldRoot:SetRenderOpacity(1.0)
    self:RemoveBloodState(self.Eid, BloodBarUtils.AllBloodState.OverReach)
  end
  self:RemoveBloodState(self.Eid, BloodBarUtils.AllBloodState.Dead)
end

function WBP_Teammate_PC_C:OnTeammateRecoverStateChange(Eid, State, PrevState)
  if Eid ~= self.Eid then
    return
  end
  if State == UE4.ETeamRecoveryState.Dying then
    self:OnDead()
  elseif State == UE4.ETeamRecoveryState.Alive then
    self:OnRecovery(Eid)
  end
end

function WBP_Teammate_PC_C:UpdateCharBuffUI()
end

function WBP_Teammate_PC_C:RefreshInvincibleState()
  local IsGodLike = self.Owner.bIsInvincible or self.Owner:IsInvincible()
  self:SetInvincible(IsGodLike)
end

function WBP_Teammate_PC_C:SetInvincible(IsInvincibility)
  self.IsInvincibility = IsInvincibility
  if IsInvincibility then
    self:PlayAnimation(self.Invincibility)
    self.VX_Teammate_InvincibilLight:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  else
    self:StopAnimation(self.Invincibility)
    self:PlayAnimationReverse(self.Invincibility)
    self.VX_Teammate_InvincibilLight:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
  if self.HpBar then
    if self.HpBar:IsAnimationPlaying(self.HpBar.Grey) then
      self.WaitingToPlayGreyAnim = self.HpBar:IsAnimationPlayingForward(self.HpBar.Grey) and 1 or 0
      self.HpBar:StopAnimation(self.HpBar.Grey)
    end
    self.HpBar:PlayInvincibility(IsInvincibility)
  end
  if self.ShieldBar then
    self.ShieldBar:PlayInvincibility(IsInvincibility)
  end
  if not IsInvincibility and self.WaitingToPlayGreyAnim ~= nil then
    self:PlayHpBarGreyAnimation(0 == self.WaitingToPlayGreyAnim)
  end
end

function WBP_Teammate_PC_C:PlayHealAnimation()
  if self.CurHp == self.MaxHp and self.IsPlayingReturning then
    self:StopReturning()
    return
  end
  if self.IsCharInHotUI then
    self:UpdateCharHotUIState(true)
    return
  end
  if not self:IsAnimationPlaying(self.BloodReturn) then
    self:PlayAnimation(self.BloodReturn)
  end
end

function WBP_Teammate_PC_C:OpenTeamInfo()
  local BattleMain = UIManager(self):GetUIObj("BattleMain")
  if nil ~= BattleMain and type(BattleMain.OpenTeamInfo) == "function" then
    BattleMain.Team:SetVisibility(UE4.ESlateVisibility.Collapsed)
    BattleMain:OpenTeamInfo()
  end
end

function WBP_Teammate_PC_C:UpdateCharHotUIState(HotUI)
  self.IsCharInHotUI = HotUI
  if self.CurHp == self.MaxHp and self.IsPlayingReturning then
    self:StopReturning()
    return
  end
  if HotUI then
    self:StartReturing()
  else
    self:StopReturning()
  end
end

function WBP_Teammate_PC_C:StartReturing()
  if not self.PlayerBloodReturn then
    return
  end
  self:PlayAnimation(self.BloodReturning)
  self.IsPlayingReturning = true
end

function WBP_Teammate_PC_C:StopReturning()
  if not self.PlayerBloodReturn then
    return
  end
  self:StopAnimation(self.BloodReturning)
  self:PlayAnimation(self.BloodReturnEnd)
  self.IsPlayingReturning = false
end

function WBP_Teammate_PC_C:BuffSpecialEffect_InvincibleUI(IsShow)
  self:SetInvincible(IsShow)
end

function WBP_Teammate_PC_C:SetImage(IsDead)
  local MiniIconPath = "Texture2D'/Game/UI/Texture/Dynamic/Image/Head/Mini/"
  local Prefix = IsDead and "T_Dead_" or "T_Normal_"
  local PhantomGuideIconImg = DataMgr.BattleChar[self.RoleId].GuideIconImg
  local NormalIconName = Prefix .. PhantomGuideIconImg
  UE4.UResourceLibrary.LoadObjectAsync(self, MiniIconPath .. NormalIconName .. "." .. NormalIconName .. "'", {
    self,
    WBP_Teammate_PC_C.LoadImageFinish
  })
end

function WBP_Teammate_PC_C:LoadImageFinish(Object)
  if Object and self.Img_Head then
    local IconDynaMaterial = self.Img_Head:GetDynamicMaterial()
    if IconDynaMaterial then
      IconDynaMaterial:SetTextureParameterValue("MainTex", Object)
    end
  end
end

function WBP_Teammate_PC_C:GetTeammatePlayerState(Eid)
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  local TargetPlayerState
  for key, PlayerState in pairs(GameState.PlayerArray) do
    if PlayerState.Eid == Eid then
      TargetPlayerState = PlayerState
    end
  end
  return TargetPlayerState
end

function WBP_Teammate_PC_C:ClearBloodAllState(TargetEid)
  if self.BloodState == nil or IsEmptyTable(self.BloodState) then
    return
  end
  for k, v in pairs(BloodBarUtils.AllBloodState) do
    if self.BloodState[v] ~= nil then
      local Func = self["_RemoveBloodIn" .. v .. "State"]
      if Func then
        Func(self)
      end
    end
  end
end

function WBP_Teammate_PC_C:CheckStateCondition(StateName)
  if StateName == BloodBarUtils.AllBloodState.Dead then
    return self.Owner and not self.Owner:IsPhantom()
  end
  return true
end

function WBP_Teammate_PC_C:AddBloodState(TargetEid, StateName)
  if nil == StateName or TargetEid ~= self.Eid then
    return
  end
  if StateName == BloodBarUtils.AllBloodState.OverReach and nil ~= self.BloodState[BloodBarUtils.AllBloodState.Dead] then
    return
  end
  if not self:CheckStateCondition(StateName) then
    return
  end
  local Func = self["_SetBloodIn" .. StateName .. "State"]
  if Func then
    Func(self, TargetEid)
  end
  self.BloodState[StateName] = 1
end

function WBP_Teammate_PC_C:RemoveBloodState(TargetEid, StateName)
  if nil == StateName or TargetEid ~= self.Eid then
    return
  end
  local Func = self["_RemoveBloodIn" .. StateName .. "State"]
  if Func then
    Func(self)
  end
  self.BloodState[StateName] = nil
end

function WBP_Teammate_PC_C:_SetBloodInDeadState(TargetEid)
  if self.BloodState[BloodBarUtils.AllBloodState.OverReach] ~= nil then
    self:_RemoveBloodInOverReachState()
  end
  if not self.WidgetInDead then
    self.WidgetInDead = self:CreateWidgetNew("TeamBattlePlayerDead")
    if nil ~= self.WidgetInDead then
      self.Pos_Resurrection:AddChildToOverlay(self.WidgetInDead)
    end
  end
  self.Pos_Resurrection:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  self.WidgetInDead:Init(self.Owner, self:GetTeammatePlayerState(TargetEid))
end

function WBP_Teammate_PC_C:_RemoveBloodInDeadState()
  local function AfterBloodResurrectionAnim()
    self.Pos_Resurrection:SetVisibility(UE4.ESlateVisibility.Collapsed)
    
    if self.BloodState[BloodBarUtils.AllBloodState.OverReach] ~= nil then
      self:_SetBloodInOverReachState()
    end
  end
  
  if self.WidgetInDead then
    self.WidgetInDead:Clear()
    self:AddTimer(2.0, AfterBloodResurrectionAnim, false, 0, "BloodResurrectionAnim")
  else
    AfterBloodResurrectionAnim()
  end
end

function WBP_Teammate_PC_C:_SetBloodInOverReachState(TargetEid)
  local CurWorld = self:GetWorld()
  if not CurWorld then
    return
  end
  if not self.WidgetInOverReach then
    self.WidgetInOverReach = self:CreateWidgetNew("TeamBattleOverReach")
    if self.WidgetInOverReach ~= nil then
      self.Pos_Overreach:AddChildToOverlay(self.WidgetInOverReach)
      if self.TimerHandleForAnim then
        self:RemoveTimer(self.TimerHandleForAnim)
      end
      self.TimerHandleForAnim = self:AddTimer(5.0, function()
        self.WidgetInOverReach:PlayAnimation(self.WidgetInOverReach.Loop)
      end, true, 0, "BloodOverReachLoopAnim")
    end
  end
  self.Group_HPBarRoot:SetRenderOpacity(0.3)
  self.Group_ShieldRoot:SetRenderOpacity(0.3)
  self.Text_Overreach:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  self.Pos_Overreach:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
end

function WBP_Teammate_PC_C:_RemoveBloodInOverReachState()
  self.Group_HPBarRoot:SetRenderOpacity(1.0)
  self.Group_ShieldRoot:SetRenderOpacity(1.0)
  self.Text_Overreach:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self.Pos_Overreach:SetVisibility(UE4.ESlateVisibility.Collapsed)
end

function WBP_Teammate_PC_C:Construct()
  WBP_Teammate_PC_C.Super.Construct(self)
  if IsStandAlone(self) then
    self:AddDispatcher(EventID.CharRecover, self, self.OnRecovery)
  else
    self:AddDispatcher(EventID.OnTeamRecoveryStateChange, self, self.OnTeammateRecoverStateChange)
  end
  self:AddDispatcher(EventID.OnRepOwnerEidPhantomState, self, self._SyncPlayerName)
  self:AddDispatcher(EventID.OnRepPlayerName, self, self._SyncPlayerName)
  self:AddDispatcher(EventID.OnCloseLoading, self, self._SyncPlayerName)
end

function WBP_Teammate_PC_C:_SyncPlayerName()
  if self.bPendingPhantomSetName then
    self:SetName()
    self.bPendingPhantomSetName = false
  end
end

function WBP_Teammate_PC_C:InitShortageUI()
  self.ShortageItems = self.ShortageItems or {}
  local Path = "/Game/UI/WBP/Battle/Widget/WBP_Battle_Shortage.WBP_Battle_Shortage"
  local ShortageItem = UIManager(self):CreateWidget(Path)
  self.Pos_Shortage:AddChildToWrapBox(ShortageItem)
  ShortageItem:InitConfig(self.Owner, nil, 901)
  self.ShortageItems[901] = ShortageItem
  local ShortageItem2 = UIManager(self):CreateWidget(Path)
  self.Pos_Shortage:AddChildToWrapBox(ShortageItem2)
  ShortageItem2:InitConfig(self.Owner, "/Game/UI/Texture/Dynamic/Atlas/Buff/T_Buff_Energy_Down.T_Buff_Energy_Down", 902)
  self.ShortageItems[902] = ShortageItem2
end

function WBP_Teammate_PC_C:ShowShortageUI(BuffId, bShow)
  if not self.ShortageItems[BuffId] then
    return
  end
  if bShow then
    self.ShortageItems[BuffId]:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  else
    self.ShortageItems[BuffId]:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
end

function WBP_Teammate_PC_C:Destruct()
  self.IsDestroied = true
  WBP_Teammate_PC_C.Super.Destruct(self)
end

function WBP_Teammate_PC_C:PlayHpBarGreyAnimation(bReverse)
  if not self.IsInvincibility then
    if not bReverse then
      self.HpBar:PlayAnimation(self.HpBar.Grey)
    else
      self.HpBar:PlayAnimationReverse(self.HpBar.Grey)
    end
    self.WaitingToPlayGreyAnim = nil
    return
  end
  self.WaitingToPlayGreyAnim = bReverse and 0 or 1
end

return WBP_Teammate_PC_C
