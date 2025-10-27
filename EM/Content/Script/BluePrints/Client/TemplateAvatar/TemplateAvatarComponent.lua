local Class = _G.TypeClass
local Assemble = require("NetworkEngine.Common.Assemble")
local TemplateAvatar = Class("TemplateAvatar")
TemplateAvatar.__Props__ = "BluePrints.Client.TemplateAvatar.TemplateAvatar"
TemplateAvatar.__Component__ = {
  "BluePrints.Client.TemplateAvatar.TemplateAppearanceMgr",
  "BluePrints.Client.TemplateAvatar.TemplateCharAccessoryMgr",
  "BluePrints.Client.TemplateAvatar.TemplateCharMgr",
  "BluePrints.Client.TemplateAvatar.TemplateWeaponMgr",
  "BluePrints.Client.TemplateAvatar.TemplateModMgr",
  "BluePrints.Client.TemplateAvatar.TemplateGM",
  "BluePrints.Client.Entities.Components.EntityBase",
  "BluePrints.Client.TemplateAvatar.TemplateSquadMgr",
  "BluePrints.Client.TemplateAvatar.TemplatePetMgr"
}

function TemplateAvatar:Init()
  if skynet then
    local Logger = require("engine.common.logger")
    self.logger = Logger.NewGameLogger("TemplateAvatar")
  else
    local LogManager = require("NetworkEngine.Common.LogManager")
    self.logger = LogManager:GenClientLogger("TemplateAvatar", self.__Name__)
  end
end

Assemble.AssembleComponents(TemplateAvatar)
Assemble.FormatProperties(TemplateAvatar)
return TemplateAvatar
