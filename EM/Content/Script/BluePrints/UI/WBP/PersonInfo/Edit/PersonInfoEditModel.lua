local UnLua = require("UnLua")
local M = Class("BluePrints.Common.MVC.Model")
local ArmoryUtils = require("BluePrints.UI.WBP.Armory.ArmoryUtils")

function M:Init()
  M.Super.Init(self)
  self._Avatar = nil
  self:GetAvatar()
end

function M:GetWeaponItemsData(WeaponTag)
  local Avatar = self._Avatar
  self[WeaponTag .. "ItemContentsMap"] = {}
  self[WeaponTag .. "ItemContentsArray"] = {}
  local ItemContentsMap = self[WeaponTag .. "ItemContentsMap"]
  local ItemContentsArray = self[WeaponTag .. "ItemContentsArray"]
  local Obj
  for Uuid, Weapon in pairs(Avatar.Weapons) do
    if Weapon:HasTag(WeaponTag) then
      Obj = ArmoryUtils:NewCharOrWeaponItemContent(Weapon, CommonConst.ArmoryType.Weapon, self.WeaponTag, true)
      table.insert(ItemContentsArray, Obj)
      ItemContentsMap[Uuid] = Obj
    end
  end
  return ItemContentsArray
end

function M:GetCharItemsData()
  local Avatar = self._Avatar
  self.CharItemContentsMap = {}
  self.CharItemContentsArray = {}
  local Obj
  for Uuid, Char in pairs(Avatar.Chars) do
    Obj = ArmoryUtils:NewCharOrWeaponItemContent(Char, CommonConst.ArmoryType.Char, CommonConst.ArmoryTag.Char, true)
    Obj.IsNew = false
    self.CharItemContentsMap[Uuid] = Obj
    table.insert(self.CharItemContentsArray, Obj)
  end
  return self.CharItemContentsArray
end

function M:GetMeleeItemsData()
  return self:GetWeaponItemsData("Melee")
end

function M:GetRangedItemsData()
  return self:GetWeaponItemsData("Ranged")
end

function M:InitEditData(EditPage)
  if not self._Avatar then
    self._Avatar = GWorld:GetAvatar()
  end
  EditPage.MeleeItemContentsCache:Clear()
  EditPage.RangedItemContentsCache:Clear()
  EditPage.CharItemContentsCache:Clear()
  local MeleeItems = self:GetMeleeItemsData()
  if MeleeItems then
    for i = 1, #MeleeItems do
      local Item = MeleeItems[i]
      if Item then
        EditPage.MeleeItemContentsCache:Add(Item)
      else
        DebugPrint("Invalid MeleeItem at index:" .. tostring(i))
      end
    end
  end
  local RangedItems = self:GetRangedItemsData()
  if RangedItems then
    for i = 1, #RangedItems do
      local Item = RangedItems[i]
      if Item then
        EditPage.RangedItemContentsCache:Add(Item)
      else
        DebugPrint("Invalid RangedItem at index:" .. tostring(i))
      end
    end
  end
  local CharItems = self:GetCharItemsData()
  if CharItems then
    for i = 1, #CharItems do
      local Item = CharItems[i]
      if Item then
        EditPage.CharItemContentsCache:Add(Item)
      else
        DebugPrint("Invalid CharItem at index:" .. tostring(i))
      end
    end
  end
end

function M:Destory()
  M.Super.Destory(self)
end

return M
