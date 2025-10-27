require("UnLua")
local WBP_Common_Phantom_C = Class("BluePrints.UI.BP_UIState_C")
local PhantomStateEnum = {
  Alive = 0,
  Dead = 1,
  Resurrecting = 2
}

function WBP_Common_Phantom_C:OnLoaded(...)
end

function WBP_Common_Phantom_C:Initialize(Initializer)
  self.PhantomEid = nil
  self.PhantomActor = nil
  self.GuideIconImg = nil
  self.FrontPhantomState = nil
  self.ArrowsWidget = nil
  self.IsHostage = false
  self.PlayerIndex = nil
end

function WBP_Common_Phantom_C:Construct()
  self.Super.Construct(self)
  EventManager:AddEvent(EventID.OnHostageDeadUpdateMiniMap, self, self.ChangeHostageMiniMapImage)
  EventManager:AddEvent(EventID.OnTeamRecoveryStateChange, self, self.ChangePhantomMiniMapIcon)
end

function WBP_Common_Phantom_C:Destruct()
  self.Super.Destruct(self)
  EventManager:RemoveEvent(EventID.OnHostageDeadUpdateMiniMap, self)
  EventManager:RemoveEvent(EventID.OnTeamRecoveryStateChange, self)
end

function WBP_Common_Phantom_C:ChangeHostageMiniMapImage(IsDead)
  if self.IsHostage then
    if IsDead then
      self.Img_Avatar:SetBrushResourceObject(LoadObject("/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_Rescue_HostageB.T_Gp_Rescue_HostageB"))
    else
      self.Img_Avatar:SetBrushResourceObject(LoadObject("/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_Rescue_HostageA.T_Gp_Rescue_HostageA"))
    end
  end
end

function WBP_Common_Phantom_C:GetCanRecoveryCount()
  if self.PhantomActor then
    return self.PhantomActor:GetRecoveryMaxCount() - self.PhantomActor:GetRecoveryCount()
  end
  return 0
end

function WBP_Common_Phantom_C:ChangePhantomMiniMapIcon(TargetEid, State, PrevState)
  if TargetEid ~= self.PhantomEid then
    return
  end
  if (not self.PhantomActor or not DataMgr.BattleChar[self.PhantomActor.UnitId]) and not self.PlayerIndex then
    return
  end
  if self.PlayerIndex and self.PlayerIndex > 0 then
    if State == UE4.ETeamRecoveryState.Alive then
      local TextTure = UGameplayStatics.GetGameInstance(self):GetSceneManager():GetPlayerGuideIcon(self.PlayerIndex, true)
      UE4.UResourceLibrary.LoadObjectAsync(self, TextTure, {
        self,
        WBP_Common_Phantom_C.SetImgAvatar
      })
    elseif State == UE4.ETeamRecoveryState.Dying then
      local TextTure = UGameplayStatics.GetGameInstance(self):GetSceneManager():GetPlayerGuideIcon(self.PlayerIndex, false)
      UE4.UResourceLibrary.LoadObjectAsync(self, TextTure, {
        self,
        WBP_Common_Phantom_C.SetImgAvatar
      })
    end
  elseif State == UE4.ETeamRecoveryState.Alive then
    local MiniIconPath = "/Game/UI/Texture/Dynamic/Image/Head/Mini/"
    if not self.PhantomActor then
      return
    end
    local PhantomGuideIconImg = DataMgr.BattleChar[self.PhantomActor.CurrentRoleId].GuideIconImg
    local NormalIconName = "T_Normal_" .. PhantomGuideIconImg
    UE4.UResourceLibrary.LoadObjectAsync(self, MiniIconPath .. NormalIconName .. "." .. NormalIconName, {
      self,
      WBP_Common_Phantom_C.SetImgAvatar
    })
  elseif State == UE4.ETeamRecoveryState.Dying then
    local MiniIconPath = "/Game/UI/Texture/Dynamic/Image/Head/Mini/"
    if not self.PhantomActor then
      return
    end
    local PhantomGuideIconImg = DataMgr.BattleChar[self.PhantomActor.CurrentRoleId].GuideIconImg
    local DeadIconName = "T_Dead_" .. PhantomGuideIconImg
    UE4.UResourceLibrary.LoadObjectAsync(self, MiniIconPath .. DeadIconName .. "." .. DeadIconName, {
      self,
      WBP_Common_Phantom_C.SetImgAvatar
    })
  end
end

function WBP_Common_Phantom_C:SetImgAvatar(IconImage)
  self.Img_Avatar:SetBrushResourceObject(IconImage)
end

return WBP_Common_Phantom_C
