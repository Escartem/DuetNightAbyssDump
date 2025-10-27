local Component = {}
local GachaController = require("BluePrints.UI.WBP.Gacha.GachaController")
local EMCache = require("EMCache.EMCache")

function Component:EnterWorld()
  GachaController:Init()
end

function Component:LeaveWorld()
  GachaController:Destory()
end

function Component:DrawGacha(GachaId, Counts)
  self.logger.info("Avatar DrawGacha", GachaId, Counts)
  
  local function callback(ret, Data, RebateData)
    self.logger.info("DrawGacha Result callback", ret)
    EventManager:FireEvent(EventID.OnDrawGacha, ret, Data)
  end
  
  self:CallServer("ClientDrawGacha", callback, GachaId, Counts)
end

function Component:OnGachaPoolUpdate(GachaId, GachaType)
  EventManager:FireEvent(EventID.OnGachaPoolUpdate)
end

function Component:OpenGachaRecord(Callback)
  self.logger.info("OpenGachaRecord")
  
  local function cb(ret, Records)
    if not ErrorCode:Check(ret) then
      return
    end
    if Callback then
      Callback(Records)
    end
  end
  
  self:CallServer("OpenGachaRecord", cb)
end

function Component:PrologueGacha(Obj, Func)
  self.logger.debug("PrologueGacha Start", Obj, Func)
  
  local function callback(Ret, IsFinish, RewardReturn)
    self.logger.debug("PrologueGacha Result", Ret, IsFinish, RewardReturn)
    if Obj and Func then
      Func(Obj)
    end
  end
  
  self:CallServer("PrologueGacha", callback)
end

function Component:OnDailyRefreshGachaCache()
  local CacheData = EMCache:Get("GachaSystem")
  self.logger.debug("----jzn---OnDailyRefreshGachaCache----", CacheData)
  if CacheData then
    for key, value in pairs(CacheData) do
      CacheData[key] = false
    end
    EMCache:Set("GachaSystem", CacheData)
  end
end

function Component:OnDailyRefreshGachaBubble()
  local Cache = EMCache:Get("GachaBubble")
  self.logger.debug("----jzn---OnDailyRefreshGachaBubble----", Cache)
  if nil ~= Cache then
    EMCache:Set("GachaBubble", false)
  end
end

function Component:SetGachaSelfSelect(Callback, GachaId, SelfSelect)
  self:CommonSetGachaSelfSelect(Callback, GachaId, "", SelfSelect)
end

function Component:SetSkinGachaSelfSelect(Callback, GachaId, SelfSelect)
  self:CommonSetGachaSelfSelect(Callback, GachaId, "Skin", SelfSelect)
end

function Component:DrawSkinGacha(GachaId, Counts)
  self.logger.info("Avatar DrawSkinGacha", GachaId, Counts)
  
  local function callback(ret, Data, RebateData)
    self.logger.info("DrawSkinGacha Result callback", ret)
    EventManager:FireEvent(EventID.OnDrawGacha, ret, Data, RebateData)
  end
  
  self:CallServer("ClientDrawSkinGacha", callback, GachaId, Counts)
end

function Component:CommonSetGachaSelfSelect(Callback, GachaId, Type, SelfSelect)
  self.logger.info("SetGachaSelfSelect", GachaId, Type, SelfSelect)
  
  local function cb(ret)
    if not ErrorCode:Check(ret) then
      return
    end
    if Callback then
      Callback(ret)
    end
  end
  
  self:CallServer("SetGachaSelfSelect", cb, GachaId, Type, SelfSelect)
end

function Component:GetGachaCumulativeReward(Callback, GachaId, Stage)
  self.logger.info("GetGachaCumulativeReward", Stage)
  
  local function cb(ret, Reward)
    if Callback then
      Callback(ret, Reward)
    end
  end
  
  self:CallServer("GetGachaCumulativeReward", cb, GachaId, Stage)
end

return Component
