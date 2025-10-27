local Class = _G.TypeClass
local BaseTypes = require("BluePrints.Client.CustomTypes.BaseTypes")
local CustomTypes = require("BluePrints.Client.CustomTypes.CustomTypes")
local Appearance = require("BluePrints.Client.CustomTypes.Appearance")
local prop = require("NetworkEngine.Common.Prop")
local FormatProperties = require("NetworkEngine.Common.Assemble").FormatProperties
local CommonChar = Class("CommonChar", CustomTypes.CustomAttr)
CommonChar.__Props__ = {
  CharId = prop.prop("Int", "client save"),
  Count = prop.prop("Int", "client save", 1),
  OwnedSkins = prop.prop("Appearance.SkinDict", "client save"),
  SkinIds = prop.getter("Data", "SkinId"),
  RegainCharItemId = prop.getter("Data", "RegainCharItemId"),
  RegainCharItemNum = prop.getter("Data", "RegainCharItemNum"),
  DailySignBoardNpcTalkCount = prop.prop("Int", "client save", 0),
  SignBoardNpcAlreadyTalkList = prop.prop("IntList", "client save")
}

function CommonChar:Init(CharId)
  if not CharId then
    return
  end
  self.CharId = CharId
  local CharInfo = DataMgr.Char[CharId] or DataMgr.BattleChar[self.CharId]
  if CharInfo.DefaultSkinId then
    self.OwnedSkins:GetNewSkin(CharInfo.DefaultSkinId, CommonConst.SkinType.Char)
  end
end

function CommonChar:AddSkin(SkinId)
  self.OwnedSkins:GetNewSkin(SkinId, CommonConst.SkinType.Char)
end

function CommonChar:GetSkin(SkinId)
  return self.OwnedSkins:GetSkin(SkinId)
end

function CommonChar:Data()
  return DataMgr.Char[self.CharId] or DataMgr.BattleChar[self.CharId]
end

function CommonChar:RemoveSkin(SkinId)
  self.OwnedSkins[SkinId] = nil
end

function CommonChar:AddOne()
  self.Count = self.Count + 1
end

function CommonChar:ReduceOne()
  if self.Count >= 1 then
    self.Count = self.Count - 1
  end
end

FormatProperties(CommonChar)
local CommonCharDict = Class("CommonCharDict", CustomTypes.CustomDict)
CommonCharDict.KeyType = BaseTypes.Int
CommonCharDict.ValueType = CommonChar

function CommonCharDict:NewCommonChar(CharId)
  local _CommonChar = CommonChar(CharId)
  return _CommonChar
end

function CommonCharDict:GetCommonChar(CharId)
  return self[CharId]
end

function CommonCharDict:GetNewCommonChar(CharId)
  if not self[CharId] then
    self[CharId] = self:NewCommonChar(CharId)
  end
  return self[CharId]
end

return {CommonChar = CommonChar, CommonCharDict = CommonCharDict}
