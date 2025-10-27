local GWorld = require("GWorld")
local Utils = require("Utils")
local EntityManager = require("NetworkEngine.Common.EntityManager")
local EntityFactory = require("NetworkEngine.Common.EntityFactory")
local SetupClient = {}

function SetupClient:SetupEntityManager()
  GWorld.EntityManager = Utils.New(EntityManager)
end

function SetupClient:SetupEntityFactory()
  GWorld.EntityFactory = Utils.New(EntityFactory)
  self:RegisterClientEntity()
end

function SetupClient:SetupServerListMgr()
  GWorld.ServerListMgr = require("BluePrints/UI/GameLogin/ServerListMgr")
end

function SetupClient:RegisterClientEntity()
  local Account = require("BluePrints.Client.Entities.Account")
  GWorld.EntityFactory:RegisterEntity("Account", Account)
  local Avatar = require("BluePrints.Client.Entities.Avatar")
  GWorld.EntityFactory:RegisterEntity("Avatar", Avatar)
  local DSEntity = require("BluePrints.Client.Entities.DSEntity")
  GWorld.EntityFactory:RegisterEntity("DSEntity", DSEntity)
end

function SetupClient:Setup()
  self:SetupEntityManager()
  self:SetupEntityFactory()
  self:SetupServerListMgr()
end

return SetupClient
