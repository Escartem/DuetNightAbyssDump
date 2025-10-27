local GachaModel = require("BluePrints.UI.WBP.Gacha.GachaModel")
local GachaCommon = require("BluePrints.UI.WBP.Gacha.GachaCommon")
local M = Class("BluePrints.Common.MVC.Controller")

function M:Init()
  M.Super.Init(self)
end

function M:Destory()
  M.Super.Destory(self)
end

function M:GetModel()
  return GachaModel
end

function M:GetEventName()
  return EventID.GachaControllerEvent
end

function M:OpenView(WorldContex, Param)
  return M.Super.OpenView(self, WorldContex, GachaCommon.UIName, Param)
end

function M:GetView(WorldContex)
  return M.Super.GetView(self, WorldContex, GachaCommon.UIName)
end

function M:TryGacha(GachaId, IsSingle)
  local GachaTimes = GachaCommon.GachaTenResults
  if IsSingle then
    GachaTimes = GachaCommon.GachaOneResult
  end
  local Res = GachaModel:CheckCanGacha(GachaId, GachaTimes, false)
  if 2 == Res then
    UIManager(GWorld.GameInstance):ShowError(ErrorCode.RET_GACHA_CONDITION_INVALID, 1.0, "CommonToastMain")
  end
  if 0 == Res then
    local Avatar = GWorld:GetAvatar()
    if Avatar then
      Avatar:DrawSkinGacha(GachaId, tonumber(GachaTimes))
    end
  end
  return Res
end

_G.GachaController = M
return M
