local Component = {}
local CommonUtils = require("Utils.CommonUtils")

function Component:ServerSetUpDestructableBody()
  if not self:IsMonster() then
    return
  end
  local DistructableClass = UE4.UClass.Load(Const.CharResourcePaths.DistructableBodyBp)
  if not DistructableClass then
    return
  end
  if not self.DestructParts then
    return
  end
  local BindTransform = FTransform()
  for PartId, _Comp in pairs(self.DestructParts) do
    local NewDistructable = self:GetWorld():SpawnActor(DistructableClass, BindTransform, UE4.ESpawnActorCollisionHandlingMethod.AlwaysSpawn, self, self, nil)
    if NewDistructable then
      NewDistructable:K2_AttachToComponent(self.Mesh, "Root", UE4.EAttachmentRule.SnapToTarget, UE4.EAttachmentRule.SnapToTarget, UE4.EAttachmentRule.SnapToTarget)
      NewDistructable:InitInfoFromComponent(self, _Comp)
    end
  end
end

function Component:RegisterAttachment(AttachmentName, Attachment)
  self.SocketPartsMap:Add(AttachmentName, Attachment)
  local PartId = Attachment.PartId
  local PartToAttach = self.DestructParts[PartId]
  Attachment.AutoActive = PartToAttach.AutoActive
  Attachment.DisableCollision = PartToAttach.DisableCollision
  print(_G.LogTag, "RegisterAttachmentRegisterAttachmentRegisterAttachment", PartId, PartToAttach.AutoActive)
  Attachment.HpPercent = PartToAttach.HpPercent
  self:RegisterAttachment_Cpp(PartToAttach, Attachment)
  print(_G.LogTag, "RegisterAttachmentRegisterAttachment", PartToAttach.ItemMeshComp)
  Attachment:SetItemMesh(self.Mesh, PartToAttach.ItemMeshComp)
  Attachment.Material = Attachment.ItemMesh:CreateDynamicMaterialInstance(0)
  local SocketPartsMapNum = self.SocketPartsMap:Length()
  local PartNum = CommonUtils.TableLength(self.DestructParts)
  assert(SocketPartsMapNum <= PartNum, "Destructable body Num Dosen't Match" .. SocketPartsMapNum, PartNum)
  print(_G.LogTag, "GZJYRegisterAttachmentRegisterAttachment", SocketPartsMapNum, PartNum)
  if SocketPartsMapNum == PartNum then
    self:TryShowOrHideParts()
  end
end

function Component:TryShowOrHideParts()
  local HpNum = 0
  for Name, Comp in pairs(self.SocketPartsMap) do
    if Comp.AutoActive then
      HpNum = HpNum + 1
      Comp:Activate()
      self:SwitchHelpAimSocketPoint(Name, true)
    else
      Comp:Deactivate()
      self:SwitchHelpAimSocketPoint(Name, false)
    end
  end
  self.HpNum = HpNum
  print(_G.LogTag, "GZJY_BornWith", self.HpNum)
  self:GetOwnBlackBoardComponent():SetValueAsInt("ActivePartNum", self.HpNum)
end

function Component:GetSockeId(SocketName)
  return self.SocketPartsMap:FindRef(SocketName).PartId
end

function Component:ActivateParts(ShouldActivate, ActivateMap)
  for Name, Comp in pairs(ActivateMap) do
    if ShouldActivate and not Comp.IsActivated then
      self.HpNum = self.HpNum + 1
      Comp:Activate()
    elseif not ShouldActivate and Comp.IsActivated then
      self.HpNum = self.HpNum - 1
      Comp:Deactivate()
    elseif ShouldActivate == Comp.IsActivated then
      print(_G.LogTag, "GZJY Has Part was Activate before Reborn")
    end
    self:SwitchHelpAimSocketPoint(Name, ShouldActivate)
  end
  print(_G.LogTag, "GZJY_ReActiveDistructBodyPartsFinal", self.HpNum, ShouldActivate, debug.traceback("GZJY"))
  if not IsAuthority(self) then
    return
  end
  self:GetOwnBlackBoardComponent():SetValueAsInt("ActivePartNum", self.HpNum)
end

function Component:PreActivateParts(PartIds, ActivatePart)
  local PartToActivate = {}
  for Name, Comp in pairs(self.SocketPartsMap) do
    if PartIds:Contains(Comp.PartId) then
      PartToActivate[Name] = Comp
    end
  end
  self:ActivateParts(ActivatePart, PartToActivate)
end

return Component
