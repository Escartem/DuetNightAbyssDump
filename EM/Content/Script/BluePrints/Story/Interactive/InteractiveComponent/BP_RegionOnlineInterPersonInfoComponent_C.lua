require("UnLua")
require("DataMgr")
local EMCache = require("EMCache.EMCache")
local BP_RegionOnlineInterPersonInfoComponent_C = Class("BluePrints.Story.Interactive.InteractiveComponent.BP_InteractiveBaseComponent_C")

function BP_RegionOnlineInterPersonInfoComponent_C:ReceiveBeginPlay()
  self.Priority = "Normal"
end

function BP_RegionOnlineInterPersonInfoComponent_C:InitRegionInfo(Eid, ObjId)
  self.CharEid = Eid
  self.CharObjId = ObjId
end

function BP_RegionOnlineInterPersonInfoComponent_C:SetInteractiveName(Name)
  self.DisplayInteractiveName = "\230\183\187\229\138\160\229\165\189\229\143\139"
end

function BP_RegionOnlineInterPersonInfoComponent_C:DisplayInteractiveBtn(PlayerActor)
  local UIManager = UGameplayStatics.GetGameInstance(self):GetGameUIManager()
  local InteractiveUI = UIManager:LoadUINew(UIConst.InteractiveUIName)
  if not InteractiveUI then
    return
  end
  print(_G.LogTag, "DisplayInteractiveBtn")
  InteractiveUI:AddInteractiveItem(self)
  self:SetBtnDisplayed(PlayerActor, true)
  self:RefreshInteractiveBtn(PlayerActor)
  self.IsDisplayed = true
end

function BP_RegionOnlineInterPersonInfoComponent_C:RefreshInteractiveBtn(PlayerActor)
  local bChanged, bLocked = self:UpdateLockState()
  if not bLocked and not bChanged then
    bChanged = self:UpdateForbiddenState(PlayerActor)
  end
  if bChanged then
    self:UpdateInteractiveUIState()
  end
end

function BP_RegionOnlineInterPersonInfoComponent_C:BtnClicked(PlayerActor, InPressTimeSeconds)
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    local RegionAvatars = Avatar.RegionAvatars or {}
    local OtherAvatar = RegionAvatars[self.CharObjId]
    local AvatarInfo = OtherAvatar and OtherAvatar.AvatarInfo
    if AvatarInfo and AvatarInfo.Uid then
      TeamController:GetAvatar():CheckOtherPlayerPersonallInfo(AvatarInfo.Uid)
    end
  end
end

function BP_RegionOnlineInterPersonInfoComponent_C:IsCanInteractive(PlayerActor)
  return true
end

function BP_RegionOnlineInterPersonInfoComponent_C:NotDisplayInteractiveBtn(PlayerActor)
  self:SetBtnDisplayed(PlayerActor, false)
  local UIManager = UGameplayStatics.GetGameInstance(self):GetGameUIManager()
  local InteractiveUI = UIManager:GetUIObj(UIConst.InteractiveUIName)
  if not InteractiveUI then
    return
  end
  InteractiveUI:RemoveInteractiveItem(self)
end

function BP_RegionOnlineInterPersonInfoComponent_C:CheckCanEnterOrEixt()
  if not self:GetOwner().UnitId then
    return false
  end
  local UnitId = self:GetOwner().UnitId
  if not DataMgr.Mechanism[UnitId] and not self:GetOwner():IsMonster() then
    return false
  end
  if not self:GetOwner().MontageName and not self.MontageName then
    return false
  end
  return true
end

function BP_RegionOnlineInterPersonInfoComponent_C:GetInteractiveIcon(PlayerActor)
  return "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_CheckPersonalInfo.T_Interactive_CheckPersonalInfo'"
end

function BP_RegionOnlineInterPersonInfoComponent_C:GetInteractiveName()
  return GText("UI_Chat_ShowRecord")
end

function BP_RegionOnlineInterPersonInfoComponent_C:InitCommonUIConfirmID(CommonUIConfirmID)
  self.CommonUIConfirmID = CommonUIConfirmID
  local Data = DataMgr.CommonUIConfirm[CommonUIConfirmID]
  if not Data then
    return
  end
  self.InteractiveDistance = Data.InteractiveRadius or self.InteractiveDistance
  self.InteractiveAngle = Data.InteractiveAngle or self.InteractiveAngle
  self.InteractiveFaceAngle = Data.PlayerFaceAngle or self.InteractiveFaceAngle
  self.ListPriority = Data.InteractivePriority or 0
end

return BP_RegionOnlineInterPersonInfoComponent_C
