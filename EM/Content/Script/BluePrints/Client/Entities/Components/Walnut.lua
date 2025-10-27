local WalnutBagController = require("BluePrints.UI.WBP.Walnut.WalnutBag.WalnutBagController")
local Component = {}

function Component:EnterWorld()
  WalnutBagController:Init()
end

function Component:LeaveWorld()
  WalnutBagController:Destory()
end

function Component:SelectWalnut(Callback, DungeonId, WalnutId)
  local function cb(ret)
    if not ErrorCode:Check(ret) then
      return
    end
    if Callback then
      Callback(ret)
    end
  end
  
  self:CallServer("SelectWalnut", cb, DungeonId, WalnutId)
end

function Component:OnRepWalnutBag(WalnutBag, ConsumeRecord)
  self.logger.info("OnRepWalnutBag")
  self.Walnuts.WalnutBag = WalnutBag
  if ConsumeRecord then
    self.Walnuts.ConsumeRecord = ConsumeRecord
  end
  local PlayerAvatar = GWorld:GetAvatar()
  if PlayerAvatar then
    local WalnutBagServerData = PlayerAvatar.Walnuts.WalnutBag
    for WalnutId, Count in pairs(WalnutBagServerData) do
      if Count > 0 then
        WalnutBagController:GetModel():AddReddotCount(WalnutId)
      end
    end
  end
end

function Component:CheckWalnutEnough(Walnuts)
  for Id, Count in pairs(Walnuts) do
    if Count > self.Walnuts:GetCount(Id) then
      return false
    end
  end
  return true
end

function Component:UpdateWalnutData(Data, bTriggerEvent)
  print(_G.LogTag, "UpdateWalnutData")
  for k, v in pairs(Data) do
    self.Walnuts[k] = v
  end
  if bTriggerEvent then
    EventManager:FireEvent(EventID.OnDungeonsUpdate)
  end
end

return Component
