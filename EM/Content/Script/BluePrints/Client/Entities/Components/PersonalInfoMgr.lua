local Component = {}
local PersonInfoController = require("BluePrints.UI.WBP.PersonInfo.PersonInfoController")

function Component:EnterWorld()
  PersonInfoController:Init()
end

function Component:LeaveWorld()
  PersonInfoController:Destory()
end

function Component:AddCharDisplay(Callback, Id, AppearancePlan, ModPlan)
  if not (Id and AppearancePlan) or not ModPlan then
    DebugPrint("AddCharDisplay Invalid arguments")
    return
  end
  
  local function cb(ret)
    if not ErrorCode:Check(ret) then
      return
    end
    if Callback then
      Callback(ret)
    end
  end
  
  self:CallServer("AddCharDisplay", cb, Id, AppearancePlan, ModPlan)
end

function Component:RemoveCharDisplay(Callback, Index)
  if not Index then
    DebugPrint("RemoveCharDisplay Invalid arguments")
    return
  end
  
  local function cb(ret)
    if not ErrorCode:Check(ret) then
      return
    end
    if Callback then
      Callback(ret)
    end
  end
  
  self:CallServer("RemoveCharDisplay", cb, Index)
end

function Component:UpdateCharDisplay(Callback, Index, Id, AppearancePlan, ModPlan)
  if not (Index and Id and AppearancePlan) or not ModPlan then
    DebugPrint("UpdateCharDisplay Invalid arguments")
    return
  end
  
  local function cb(ret)
    if not ErrorCode:Check(ret) then
      return
    end
    if Callback then
      Callback(ret)
    end
  end
  
  self:CallServer("UpdateCharDisplay", cb, Index, Id, AppearancePlan, ModPlan)
end

function Component:AddWeaponDisplay(Callback, Id, ModPlan)
  if not Id or not ModPlan then
    DebugPrint("AddWeaponDisplay Invalid arguments")
    return
  end
  
  local function cb(ret)
    if not ErrorCode:Check(ret) then
      return
    end
    if Callback then
      Callback(ret)
    end
  end
  
  self:CallServer("AddWeaponDisplay", cb, Id, ModPlan)
end

function Component:RemoveWeaponDisplay(Callback, Index)
  if not Index then
    DebugPrint("RemoveWeaponDisplay Invalid arguments")
    return
  end
  
  local function cb(ret)
    if not ErrorCode:Check(ret) then
      return
    end
    if Callback then
      Callback(ret)
    end
  end
  
  self:CallServer("RemoveWeaponDisplay", cb, Index)
end

function Component:UpdateWeaponDisplay(Callback, Index, Id, ModPlan)
  if not (Index and Id) or not ModPlan then
    DebugPrint("UpdateWeaponDisplay Invalid arguments")
    return
  end
  
  local function cb(ret)
    if not ErrorCode:Check(ret) then
      return
    end
    if Callback then
      Callback(ret)
    end
  end
  
  self:CallServer("UpdateWeaponDisplay", cb, Index, Id, ModPlan)
end

function Component:CheckOtherPlayerPersonallInfo(PlayerUuid, bForceUsedServerData)
  self.logger.debug("CheckOtherPlayerPersonallInfo Begin", PlayerUuid)
  if not PlayerUuid then
    DebugPrint("CheckOtherPlayerPersonallInfo Invalid arguments")
    return
  end
  
  local function cb(ret, PlayerInfo)
    self.logger.debug("CheckOtherPlayerPersonallInfo Callback", ret, PlayerUuid, PlayerInfo)
    if not ErrorCode:Check(ret) then
      return
    end
    PlayerInfo.Uuid = PlayerUuid
    PersonInfoController:OpenView(PlayerInfo, bForceUsedServerData)
    DebugPrint("yklua Had Received Server Open PersonInfo")
  end
  
  DebugPrint("yklua Had Call Open PersonInfo")
  self:CallServer("CheckOtherPlayerPersonallInfo", cb, PlayerUuid)
end

function Component:SetPersonalInfoVisible(VisibleType)
  self.logger.debug("SetPersonalInfoVisible", VisibleType)
  if not CommonUtils.HasValue(CommonConst.PersonalInfoVisibleType, VisibleType) then
    DebugPrint("SetPersonalInfoVisible Invalid arguments")
    return
  end
  self:CallServerMethod("SetPersonalInfoVisible", VisibleType)
end

return Component
