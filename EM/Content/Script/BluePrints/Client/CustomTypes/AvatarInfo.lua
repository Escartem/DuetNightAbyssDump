local Class = _G.TypeClass
local BaseTypes = require("BluePrints.Client.CustomTypes.BaseTypes")
local CustomTypes = require("BluePrints.Client.CustomTypes.CustomTypes")
local prop = require("NetworkEngine.Common.Prop")
local FormatProperties = require("NetworkEngine.Common.Assemble").FormatProperties
local AvatarInfo = Class("AvatarInfo", CustomTypes.CustomAttr)
AvatarInfo.__Props__ = {
  Account = prop.prop("Str", "client save"),
  Eid = prop.prop("ObjId", "client save"),
  Uid = prop.prop("Int", "client save"),
  Nickname = prop.prop("Str", "client save"),
  Hostnum = prop.prop("Int", "client save", 0),
  Level = prop.prop("Int", "client save", 0),
  HeadIconId = prop.prop("Int", "client save", 0),
  HeadFrameId = prop.prop("Int", "client save", -1),
  LastLogoutTime = prop.prop("Float", "client save", 0),
  LastLoginTime = prop.prop("Float", "client save", 0),
  Signature = prop.prop("Str", "client save"),
  CurrentRegionId = prop.prop("Int", "client save", 0),
  ChannelId = prop.prop("Int", "client save"),
  TitleBefore = prop.prop("Int", "client save"),
  TitleAfter = prop.prop("Int", "client save"),
  TitleFrame = prop.prop("Int", "client save"),
  IsOnline = prop.prop("Bool", "client save", false),
  IsInDungeon = prop.prop("Bool", "client save", false),
  IsInSpecialQuest = prop.prop("Bool", "client save", false)
}

function AvatarInfo:Init(Uid, Infos)
  self.Uid = Uid
  if Infos then
    self:Update(Infos)
  end
  self.Mailbox = nil
end

function AvatarInfo:Update(Infos)
  if type(Infos) ~= "table" then
    return
  end
  for key, value in pairs(Infos) do
    self[key] = value
  end
  if Infos.IsOnline == nil then
    if self.LastLoginTime > self.LastLogoutTime then
      self.IsOnline = true
    else
      self.IsOnline = false
    end
  end
  if self.IsOnline == false then
    self.Mailbox = nil
  end
end

function AvatarInfo:Online(mailbox)
  self.Mailbox = mailbox
  self.IsOnline = true
end

function AvatarInfo:Offline()
  self.Mailbox = nil
  self.IsOnline = false
end

function AvatarInfo:GetMailbox()
  return self.Mailbox:all_dump(self.Mailbox)
end

function AvatarInfo:GetHostnum()
  return self.Hostnum
end

function AvatarInfo:Serialize()
  local info = self:all_dump(self)
  if self.Mailbox then
    info.Mailbox = self.Mailbox
  end
  return info
end

FormatProperties(AvatarInfo)
local AvatarInfoDict = Class("AvatarInfoDict", CustomTypes.CustomDict)
AvatarInfoDict.KeyType = BaseTypes.Int
AvatarInfoDict.ValueType = AvatarInfo

function AvatarInfoDict:NewAvatarInfo(Uid, Infos)
  return AvatarInfo(Uid, Infos)
end

return {AvatarInfo = AvatarInfo, AvatarInfoDict = AvatarInfoDict}
