require("UnLua")
require("DataMgr")
local EMCache = require("EMCache.EMCache")
local BP_RegionOnlineInterComponent_C = Class("BluePrints.Story.Interactive.InteractiveComponent.BP_InteractiveBaseComponent_C")

function BP_RegionOnlineInterComponent_C:ReceiveBeginPlay()
  self.Priority = "Normal"
end

function BP_RegionOnlineInterComponent_C:InitRegionInfo(Eid, ObjId)
  self.CharEid = Eid
  self.CharObjId = ObjId
end

function BP_RegionOnlineInterComponent_C:SetInteractiveName(Name)
  self.InteractiveName = Name
  self.DisplayInteractiveName = GText(Name)
  if self.DisplayInteractiveName == "" then
    self.DisplayInteractiveName = Name
  end
end

function BP_RegionOnlineInterComponent_C:DisplayInteractiveBtn(PlayerActor)
  local UIManager = UGameplayStatics.GetGameInstance(self):GetGameUIManager()
  local InteractiveUI = UIManager:LoadUINew(UIConst.InteractiveUIName)
  if not InteractiveUI then
    return
  end
  print(_G.LogTag, "DisplayInteractiveBtn")
  InteractiveUI:AddInteractiveItem(self)
  self:SetBtnDisplayed(PlayerActor, true)
  self:RefreshInteractiveBtn(PlayerActor)
end

function BP_RegionOnlineInterComponent_C:RefreshInteractiveBtn(PlayerActor)
  local bChanged, bLocked = self:UpdateLockState()
  if not bLocked and not bChanged then
    bChanged = self:UpdateForbiddenState(PlayerActor)
  end
  if bChanged then
    self:UpdateInteractiveUIState()
  end
end

function BP_RegionOnlineInterComponent_C:CheckAndDisplayAddFriendBtn(PlayerActor, RegionInterAddFriendComp)
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    local RegionAvatars = Avatar.RegionAvatars or {}
    local OtherAvatar = RegionAvatars[self.CharObjId]
    local AvatarInfo = OtherAvatar and OtherAvatar.AvatarInfo
    if AvatarInfo then
      local FriendModel = require("BluePrints.UI.WBP.Friend.FriendModel")
      local friendDict = FriendModel:GetFriendDict()
      if not friendDict[AvatarInfo.Uid] then
        RegionInterAddFriendComp:DisplayInteractiveBtn(PlayerActor)
        return
      end
    end
  end
end

function BP_RegionOnlineInterComponent_C:BtnClicked(PlayerActor, InPressTimeSeconds)
  self:NotDisplayInteractiveBtnSelf(PlayerActor)
  local Owner = self:GetOwner()
  if Owner.RegionInterAddFriendComp then
    self:CheckAndDisplayAddFriendBtn(PlayerActor, Owner.RegionInterAddFriendComp)
  end
  if Owner.RegionInterInviteTeamComp then
    Owner.RegionInterInviteTeamComp:DisplayInteractiveBtn(PlayerActor)
  end
  if Owner.RegionInterPersonInfoComp then
    Owner.RegionInterPersonInfoComp:DisplayInteractiveBtn(PlayerActor)
  end
end

function BP_RegionOnlineInterComponent_C:NotDisplayInteractiveBtn(PlayerActor)
  self:NotDisplayInteractiveBtnSelf(PlayerActor)
  local Owner = self:GetOwner()
  if Owner.RegionInterAddFriendComp then
    Owner.RegionInterAddFriendComp:NotDisplayInteractiveBtn(PlayerActor)
  end
  if Owner.RegionInterInviteTeamComp then
    Owner.RegionInterInviteTeamComp:NotDisplayInteractiveBtn(PlayerActor)
  end
  if Owner.RegionInterPersonInfoComp then
    Owner.RegionInterPersonInfoComp:NotDisplayInteractiveBtn(PlayerActor)
  end
end

function BP_RegionOnlineInterComponent_C:NotDisplayInteractiveBtnSelf(PlayerActor)
  self:SetBtnDisplayed(PlayerActor, false)
  local UIManager = UGameplayStatics.GetGameInstance(self):GetGameUIManager()
  local InteractiveUI = UIManager:GetUIObj(UIConst.InteractiveUIName)
  if not InteractiveUI then
    return
  end
  InteractiveUI:RemoveInteractiveItem(self)
end

function BP_RegionOnlineInterComponent_C:CheckCanEnterOrEixt()
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

function BP_RegionOnlineInterComponent_C:GetInteractiveIcon(PlayerActor)
  if self:IsLocked() then
    return "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Lock.T_Interactive_Lock'"
  end
  if self:IsForbidden(PlayerActor) then
    return "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Forbidden.T_Interactive_Forbidden'"
  end
  local Data = DataMgr.CommonUIConfirm[self.CommonUIConfirmID]
  if not Data or not Data.Icon then
    return nil
  end
  return Data.Icon
end

function BP_RegionOnlineInterComponent_C:GetInteractiveName()
  local Avatar = GWorld:GetAvatar()
  local Name = ""
  if not self.CharObjId then
    return GText(Name)
  end
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    local RegionAvatars = Avatar.RegionAvatars or {}
    local OtherAvatar = RegionAvatars[self.CharObjId]
    Name = OtherAvatar and OtherAvatar.AvatarInfo.Nickname
  end
  return GText(Name)
end

function BP_RegionOnlineInterComponent_C:InitCommonUIConfirmID(CommonUIConfirmID)
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

return BP_RegionOnlineInterComponent_C
