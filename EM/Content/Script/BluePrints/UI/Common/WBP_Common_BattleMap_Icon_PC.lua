require("UnLua")
local WBP_Common_BattleMap_Icon_PC = Class("BluePrints.UI.BP_UIState_C")

function WBP_Common_BattleMap_Icon_PC:Initialize(Initializer)
end

function WBP_Common_BattleMap_Icon_PC:Construct()
  self.Super.Construct(self)
end

function WBP_Common_BattleMap_Icon_PC:AttachEvent()
  if self.IsHostage then
    EventManager:AddEvent(EventID.TriggerHostageBattleMapChangeStyle, self, self.ChangeHostageIconStyle)
  end
end

function WBP_Common_BattleMap_Icon_PC:ChangeHostageIconStyle(IsDead)
  if not self.IsHostage then
    return
  end
  local Path = IsDead and "/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_Rescue_HostageB.T_Gp_Rescue_HostageB" or "/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_Rescue_HostageA.T_Gp_Rescue_HostageA"
  UE4.UResourceLibrary.LoadObjectAsync(self, Path, {
    self,
    WBP_Common_BattleMap_Icon_PC.OnHostageIconLoadFinish
  })
end

function WBP_Common_BattleMap_Icon_PC:OnHostageIconLoadFinish(Object)
  if self.Icon and Object then
    self.Icon:SetBrushResourceObject(Object)
  end
end

function WBP_Common_BattleMap_Icon_PC:Destruct()
  if self.IsHostage then
    EventManager:RemoveEvent(EventID.TriggerHostageBattleMapChangeStyle, self)
  end
end

return WBP_Common_BattleMap_Icon_PC
