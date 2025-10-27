local Class = _G.TypeClass
local BaseTypes = require("BluePrints.Client.CustomTypes.BaseTypes")
local CustomTypes = require("BluePrints.Client.CustomTypes.CustomTypes")
local prop = require("NetworkEngine.Common.Prop")
local FormatProperties = require("NetworkEngine.Common.Assemble").FormatProperties
local Walnut = Class("Walnut", CustomTypes.CustomAttr)
Walnut.__Props__ = {
  WalnutBag = prop.prop("Int2IntDict", "save"),
  RewardSequences = prop.prop("RewardSequence.RewardSequenceAttr", "cross save"),
  ConsumeRecord = prop.prop("Int2IntDict", "save"),
  ValidWalnutDungeons = prop.prop("Dict", "", {}),
  WalnutLastRefreshTime = prop.prop("Int", "", 0),
  WalnutId = prop.prop("Int", "cross", 0),
  WalnutRewardList = prop.prop("List", ""),
  bCanSelectWalnut = prop.prop("Int", "")
}

function Walnut:GetCount(WalnutId)
  return self.WalnutBag[WalnutId] or 0
end

function Walnut:Add(WalnutId, Count)
  if not DataMgr.Walnut[WalnutId] then
    return false
  end
  local PreCount = self.WalnutBag[WalnutId] or 0
  self.WalnutBag[WalnutId] = PreCount + Count
  return true
end

function Walnut:Remove(WalnutId, Count, bConsume)
  Count = Count or 1
  local PreCount = self.WalnutBag[WalnutId]
  if not PreCount then
    return false
  end
  if Count > PreCount then
    return false
  end
  self.WalnutBag[WalnutId] = PreCount - Count
  if bConsume then
    local ConsumeCount = self.ConsumeRecord[WalnutId] or 0
    ConsumeCount = ConsumeCount + Count
    self.ConsumeRecord[WalnutId] = ConsumeCount
  end
  return true
end

function Walnut:SelectWalnut(WalnutId)
  self.WalnutId = WalnutId
  self:SetCanSelectWalnut(false)
end

function Walnut:UpdateWalnutRewardList(WalnutRewardList)
  self.WalnutRewardList = WalnutRewardList
end

function Walnut:SetCanSelectWalnut(bCanSelect)
  self.bCanSelectWalnut = bCanSelect and 1 or 0
end

function Walnut:CanSelectWalnut()
  return 1 == self.bCanSelectWalnut and self.WalnutId > 0
end

FormatProperties(Walnut)
return {Walnut = Walnut}
