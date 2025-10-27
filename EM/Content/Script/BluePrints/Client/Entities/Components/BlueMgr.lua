local Decorator = require("BluePrints.Client.Wrapper.Decorator")
local ForgeModel = require("Blueprints.UI.Forge.ForgeDataModel")
local Component = {}
for key, value in pairs(Decorator) do
  Component[key] = value
end
setmetatable(Component, getmetatable(Decorator))

function Component:EnterWorld()
  ForgeModel:Initialize()
end

Component:LimitCall(0.1)

function Component:StartProduct(DraftId, SelectParam, ProduceNum)
  self.logger.debug("ZJT_ StartProduct ClientCallServer DraftId ", DraftId, ProduceNum)
  SelectParam = SelectParam or {}
  
  local function Callback(Ret)
    self.logger.debug("ZJT_ StartProduct ServerCallClient ", DraftId, Ret)
    EventManager:FireEvent(EventID.OnStartProduce, DraftId, Ret)
  end
  
  self:CallServer("StartProduct", Callback, DraftId, ProduceNum, SelectParam)
end

Component:LimitCall(0.1)

function Component:CompleteProduct(DraftId)
  self.logger.debug("ZJT_ CompleteProduct DraftId", DraftId)
  
  local function Callback(Ret, CompleteNum)
    self.logger.debug("ZJT_ CompleteProduct Callback ", DraftId, Ret)
    EventManager:FireEvent(EventID.OnCompleteProduce, {
      [DraftId] = CompleteNum
    }, Ret)
  end
  
  self:CallServer("CompleteProduct", Callback, DraftId)
end

function Component:OnBlueProductComplete(DraftId)
  DebugPrint("Tianyi@ OnBlueProductComplete")
  EventManager:FireEvent(EventID.OnBlueComplete, DraftId)
  self.logger.debug("ZJT_ SeverCallClient OnBlueProductComplete ", DraftId)
  ForgeModel:IncreaseReddotByDraftInfo(DraftId)
end

Component:LimitCall(0.1)

function Component:AccelerateProduct(DraftId)
  self.logger.debug("ZJT_ AccelerateBlueProduct DraftId", DraftId)
  
  local function Callback(Ret)
    self.logger.debug("ZJT_ AccelerateBlueProduct ServerCallClient ", Ret)
    EventManager:FireEvent(EventID.OnAccerateProduce, DraftId, Ret)
  end
  
  self:CallServer("AccelerateProduct", Callback, DraftId)
end

Component:LimitCall(0.1)

function Component:CancelProduct(DraftId)
  self.logger.debug("ZJT_ CancelProduct DraftId ")
  
  local function Callback(Ret, InCount, Count)
    self.logger.debug("ZJT_ ServerCallClient CancelProduct DraftId ", DraftId, Ret)
    EventManager:FireEvent(EventID.OnCancelProduce, DraftId, Ret, InCount, Count)
  end
  
  self:CallServer("CancelProduct", Callback, DraftId)
end

function Component:GetAllDraftCompleteReward(SeleteParam)
  local function Callback(Ret, DraftId2CompleteNum)
    self.logger.debug("ZJT_ ServerCallClient GetAllDraftCompleteReward ", Ret)
    
    EventManager:FireEvent(EventID.OnCompleteBatchProduce, DraftId2CompleteNum, Ret)
  end
  
  self:CallServer("GetAllDraftCompleteReward", Callback, SeleteParam)
end

function Component:_OnPropChangeDrafts(Keys)
  local DraftIdTable = {}
  for _, DraftId in ipairs(Keys) do
    if self.Drafts[DraftId] then
      table.insert(DraftIdTable, DraftId)
    end
  end
  EventManager:FireEvent(EventID.OnGetNewDraft, DraftIdTable)
end

function Component:CheckDraftEnough(CheckData)
  if next(CheckData) == nil then
    return true
  end
  for DraftId, Count in pairs(CheckData) do
    if not DataMgr.Draft[DraftId] then
      return false
    end
    local Draft = self.Drafts[DraftId]
    if not Draft then
      return false
    end
    if Draft.Count <= 0 and not Draft.IsInfinity and Count <= Draft.Count then
      return false
    end
  end
  return true
end

return Component
