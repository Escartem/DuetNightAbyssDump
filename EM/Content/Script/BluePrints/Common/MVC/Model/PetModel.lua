local ArmoryUtils = require("BluePrints.UI.WBP.Armory.ArmoryUtils")
local M = Class()
local _ResourcePetMap, _PetMap

function M:Init(Pets)
  _PetMap = {}
  _ResourcePetMap = {}
  if Pets then
    for key, Pet in pairs(Pets) do
      _PetMap[key] = key
      if Pet:IsResourcePet() then
        _ResourcePetMap[key] = key
      end
    end
  end
  EventManager:AddEvent(EventID.OnNewPetObtained, self, self.OnNewPetObtained)
  EventManager:AddEvent(EventID.OnPetDeleted, self, self.OnPetDeleted)
  ArmoryUtils:CreateReddotInfos(CommonConst.DataType.Pet)
end

function M:IsPetExist(UniqueID)
  return not not _PetMap[UniqueID], not not _ResourcePetMap[UniqueID]
end

function M:OnNewPetObtained(UniqueID)
  local Avatar = GWorld:GetAvatar()
  local Pet = Avatar.Pets[UniqueID]
  if Pet then
    _PetMap[UniqueID] = UniqueID
    if Pet:IsResourcePet() then
      _ResourcePetMap[UniqueID] = UniqueID
    end
    ArmoryUtils:TryAddNewPetReddot(Pet, UniqueID)
  end
end

function M:OnPetDeleted(UniqueID)
  _PetMap[UniqueID] = nil
  _ResourcePetMap[UniqueID] = nil
  ArmoryUtils:SetItemReddotRead({
    ItemType = CommonConst.DataType.Pet,
    UniqueId = UniqueID
  }, true, true, true)
end

function M:Destory()
  _PetMap = {}
  _ResourcePetMap = {}
  EventManager:RemoveEvent(EventID.OnNewPetObtained, self)
  EventManager:RemoveEvent(EventID.OnPetDeleted, self)
end

return M
