local ForgePathModel = {}
require("UnLua")

function ForgePathModel:PreInitData()
  self.MaterialMap = DataMgr.Item2DraftIdMap
end

function ForgePathModel:GetModel(DraftId)
  self:PreInitData()
  self.RowNumber = 1
  self.RowInfos = {}
  self.RowSelectedIndex = {}
  local PathRootNode = self:ConstructNodeFromDraftId(DraftId, 1, 1)
  self.RowInfos[1] = {PathRootNode}
  return self
end

function ForgePathModel:ConstructNodeFromDraftId(DraftId, RowIndex, ColIndex)
  local DraftInfo = DataMgr.Draft[DraftId]
  local Node = {RowIndex = RowIndex, ColIndex = ColIndex}
  Node.DraftId = DraftId
  Node.ResourceId = DraftInfo.ProductId
  Node.ResourceType = DraftInfo.ProductType
  if 1 == RowIndex then
    Node.Pos = 3
  else
    Node.Pos = ColIndex >= 3 and ColIndex + 1 or ColIndex
  end
  return Node
end

function ForgePathModel:ConstructNodeFromResourceId(ResInfo, RowIndex, ColIndex)
  local Node = {RowIndex = RowIndex, ColIndex = ColIndex}
  local DraftIds = self.MaterialMap[ResInfo.Type or "Resource"][ResInfo.Id].DraftIds
  Node.DraftId = DraftIds and DraftIds[1] or nil
  Node.ResourceId = ResInfo.Id
  Node.ResourceType = ResInfo.Type or "Resource"
  Node.ResNeedNum = ResInfo.Num
  if 1 == RowIndex then
    Node.Pos = 3
  else
    Node.Pos = ColIndex >= 3 and ColIndex + 1 or ColIndex
  end
  return Node
end

function ForgePathModel:GetNode(RowIndex, ColIndex)
  if not self.RowInfos[RowIndex] then
    return nil
  end
  if not self.RowInfos[RowIndex][ColIndex] then
    return nil
  end
  return self.RowInfos[RowIndex][ColIndex]
end

function ForgePathModel:GetRowNum(RowIndex)
  if not self.RowInfos[RowIndex] then
    return 0
  end
  return #self.RowInfos[RowIndex]
end

function ForgePathModel:GetPathMaxLen(DraftId)
  local ProductId = DataMgr.Draft[DraftId].ProductId
  local ProductType = DataMgr.Draft[DraftId].ProductType
  return DataMgr.Item2DraftIdMap[ProductType][ProductId].MaxLen
end

return ForgePathModel
