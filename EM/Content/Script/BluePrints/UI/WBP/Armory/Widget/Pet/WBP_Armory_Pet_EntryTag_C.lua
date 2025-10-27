require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:Construct()
  self.RariryColors = {
    [5] = self.Yellow,
    [4] = self.Purple,
    [3] = self.Blue
  }
end

function M:Init(Content, bHideName)
  self.Text_Entry:SetText(Content.Name)
  local IconPath
  if Content.IconPath then
    IconPath = Content.IconPath
  elseif Content.EntryId then
    local Data = DataMgr.PetEntry[Content.EntryId]
    IconPath = Data and Data.IconS
  end
  if IconPath then
    local DynaMaterial = self.Icon_Entry:GetDynamicMaterial()
    if DynaMaterial then
      DynaMaterial:SetTextureParameterValue("IconTex", LoadObject(IconPath))
    end
    self.Icon_Entry:SetColorAndOpacity(self.RariryColors[Content.Rarity])
  end
  if bHideName then
    self.Text_Entry:SetVisibility(UIConst.VisibilityOp.Collapsed)
  else
    self.Text_Entry:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  end
end

function M:InitByPetEntryId(PetEntryId, bHideName)
  local Data = DataMgr.PetEntry[PetEntryId]
  if Data then
    local Content = {}
    Content.EntryId = PetEntryId
    Content.Name = GText(Data.PetEntryName)
    Content.Rarity = Data.Rarity
    self:Init(Content, bHideName)
  end
end

return M
