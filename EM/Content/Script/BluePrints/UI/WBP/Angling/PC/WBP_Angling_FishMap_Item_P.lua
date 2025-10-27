require("UnLua")
local EMCache = require("EMCache.EMCache")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})
local RarityBG = {
  "/Game/UI/Texture/Dynamic/Image/Angling/T_Angling_Quality_Grey.T_Angling_Quality_Grey",
  "/Game/UI/Texture/Dynamic/Image/Angling/T_Angling_Quality_Green.T_Angling_Quality_Green",
  "/Game/UI/Texture/Dynamic/Image/Angling/T_Angling_Quality_Blue.T_Angling_Quality_Blue",
  "/Game/UI/Texture/Dynamic/Image/Angling/T_Angling_Quality_Purple.T_Angling_Quality_Purple",
  "/Game/UI/Texture/Dynamic/Image/Angling/T_Angling_Quality_Yellow.T_Angling_Quality_Yellow"
}
local RarityAnim = {
  "Grey",
  "Green",
  "Blue",
  "Purple",
  "Yellow"
}

function M:OnListItemObjectSet(Content)
  self.New:SetVisibility(ESlateVisibility.Collapsed)
  self.FishId = Content.FishId
  self:InitWidget()
  self.IsNotLocked = self:SetIsNotLocked()
  if self.IsNotLocked then
    self:InitUnLockWidget()
  else
    self:InitLockWidget()
  end
  self:PlayAnimation(self.In)
end

function M:SetIsNotLocked()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return true
  end
  print(_G.LogTag, "LXZ SetIsNotLocked", self.FishId, Avatar:GetFishCountByFishId(self.FishId))
  local Res = Avatar:GetFishCountByFishId(self.FishId) >= 1
  return Res
end

function M:InitWidget()
  self.Text_Title02:SetText(GText("UI_Fishing_FishType_2"))
end

function M:InitUnLockWidget()
  print(_G.LogTag, "LXZ InitUnLockWidget", self.FishId)
  self.Switcher:SetActiveWidgetIndex(0)
  self.Icon_Fish:SetColorAndOpacity(FLinearColor(1, 1, 1, 1))
  local IconPath = DataMgr.Fish[self.FishId].IconPath
  if IconPath then
    local Icon = LoadObject(IconPath)
    self.Icon_Fish:SetBrushResourceObject(Icon)
  end
  local Data = DataMgr.Fish[self.FishId]
  if not Data or not Data.ResourceId then
    GWorld.logger.error("\233\177\188" .. self.FishId .. "\230\178\161\230\156\137\230\149\176\230\141\174\230\136\150\232\181\132\230\186\144id")
    return
  end
  local ResourceData = DataMgr.Resource[Data.ResourceId]
  if not ResourceData then
    GWorld.logger.error("\233\177\188\232\181\132\230\186\144" .. Data.ResourceId .. "\230\178\161\230\156\137\232\181\132\230\186\144\230\149\176\230\141\174")
    return
  end
  if 3 == Data.FishType then
    local Icon = LoadObject("/Game/UI/WBP/Common/VX/Angling/MI_Angling_FishMap_Tag_King.MI_Angling_FishMap_Tag_King")
    self.RB_Bg:SetEffectMaterial(Icon)
    self.VX_TagGlow:SetColorAndOpacity(self.Tag_Glow_King)
    self.Text_Title:SetText(GText("UI_Fishing_FishType_3"))
  else
    self.Panel_Title:SetVisibility(ESlateVisibility.Collapsed)
  end
  local Rarity = ResourceData.Rarity
  local Icon = LoadObject(RarityBG[Rarity])
  self.Img_Quality:GetDynamicMaterial():SetTextureParameterValue("MainTex", Icon)
  self:PlayAnimation(self[RarityAnim[Rarity]])
  self.Text_FishName:SetText(GText(ResourceData.ResourceName))
  self.Text_Describe:SetText(GText(ResourceData.DetailDes))
  self.Text_Lv:SetText(Data.FishLevel)
  self.List_Text:ClearListItems()
  local Weight = self:GetWeight()
  local WeightContent = self:NewTextContent("/Game/UI/Texture/Static/Atlas/Angling/T_Angling_Icon06.T_Angling_Icon06", Weight)
  self.List_Text:AddItem(WeightContent)
  local Place = self:GetPlace()
  local PlaceContent = self:NewTextContent("/Game/UI/Texture/Static/Atlas/Angling/T_Angling_Icon08.T_Angling_Icon08", Place)
  self.List_Text:AddItem(PlaceContent)
  local IsFishNew = self:CheckIsFishNew(self.FishId)
  if IsFishNew then
    self.New:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  else
    self.New:SetVisibility(ESlateVisibility.Collapsed)
  end
  self:InitVariationFish(Data.VariationFishId)
end

function M:InitLockWidget()
  local Data = DataMgr.Fish[self.FishId]
  if not Data or not Data.ResourceId then
    GWorld.logger.error("\233\177\188" .. self.FishId .. "\230\178\161\230\156\137\230\149\176\230\141\174\230\136\150\232\181\132\230\186\144id")
    return
  end
  print(_G.LogTag, "LXZ InitLockWidget", self.FishId)
  self.Icon_Fish:SetColorAndOpacity(FLinearColor(0, 0, 0, 1))
  local IconPath = DataMgr.Fish[self.FishId].IconPath
  if IconPath then
    local FishIcon = LoadObject(IconPath)
    self.Icon_Fish:SetBrushResourceObject(FishIcon)
  end
  local Icon = LoadObject(RarityBG[1])
  self.Img_Quality:GetDynamicMaterial():SetTextureParameterValue("MainTex", Icon)
  self:PlayAnimation(self[RarityAnim[1]])
  local bHasUnlockVariationFish, FishId = self:InitVariationFish(Data.VariationFishId)
  if not bHasUnlockVariationFish then
    self.Switcher:SetActiveWidgetIndex(1)
    self.Text_FishName_Lock:SetText(GText("UI_BookArchive_SeriesLockedTitle"))
    self.Text_Describe_Lock:SetText(GText("UI_Fishing_FishingNote_Empty"))
  else
    self.Switcher:SetActiveWidgetIndex(0)
    local Data = DataMgr.Fish[self.FishId]
    if not Data or not Data.ResourceId then
      GWorld.logger.error("\233\177\188" .. self.FishId .. "\230\178\161\230\156\137\230\149\176\230\141\174\230\136\150\232\181\132\230\186\144id")
      return
    end
    local ResourceData = DataMgr.Resource[Data.ResourceId]
    if not ResourceData then
      GWorld.logger.error("\233\177\188\232\181\132\230\186\144" .. Data.ResourceId .. "\230\178\161\230\156\137\232\181\132\230\186\144\230\149\176\230\141\174")
      return
    end
    if 3 == Data.FishType then
      local Icon = LoadObject("/Game/UI/WBP/Common/VX/Angling/MI_Angling_FishMap_Tag_King.MI_Angling_FishMap_Tag_King")
      self.RB_Bg:SetEffectMaterial(Icon)
      self.VX_TagGlow:SetColorAndOpacity(self.Tag_Glow_King)
      self.Text_Title:SetText(GText("UI_Fishing_FishType_3"))
    else
      self.Panel_Title:SetVisibility(ESlateVisibility.Collapsed)
    end
    local Icon = LoadObject(RarityBG[1])
    self.Img_Quality:GetDynamicMaterial():SetTextureParameterValue("MainTex", Icon)
    self:PlayAnimation(self[RarityAnim[1]])
    self.Text_FishName:SetText(GText(ResourceData.ResourceName))
    self.Text_Describe:SetText(GText(ResourceData.DetailDes))
    self.Text_Lv:SetText(Data.FishLevel)
    self.List_Text:ClearListItems()
    local Weight = self:GetWeight()
    local WeightContent = self:NewTextContent("/Game/UI/Texture/Static/Atlas/Angling/T_Angling_Icon06.T_Angling_Icon06", Weight)
    self.List_Text:AddItem(WeightContent)
    local Place = self:GetPlace()
    local PlaceContent = self:NewTextContent("/Game/UI/Texture/Static/Atlas/Angling/T_Angling_Icon08.T_Angling_Icon08", Place)
    self.List_Text:AddItem(PlaceContent)
  end
end

function M:InitVariationFish(VariationFishId)
  local Res = false
  if VariationFishId then
    local VariationIdx = 1
    for i, v in pairs(VariationFishId) do
      local Avatar = GWorld:GetAvatar()
      local VariationIconPath = DataMgr.Fish[v].IconPath
      if not Avatar then
        self["FishSwitch0" .. VariationIdx].Switcher_0:SetActiveWidgetIndex(0)
        if VariationIconPath then
          local FishIcon = LoadObject(VariationIconPath)
          self["FishSwitch0" .. VariationIdx].Icon_Fish:SetBrushResourceObject(FishIcon)
        end
      elseif Avatar:GetFishCountByFishId(v) > 0 then
        self["FishSwitch0" .. VariationIdx].Switcher_0:SetActiveWidgetIndex(0)
        if VariationIconPath then
          local FishIcon = LoadObject(VariationIconPath)
          self["FishSwitch0" .. VariationIdx].Icon_Fish:SetBrushResourceObject(FishIcon)
        end
        local IsFishNew = self:CheckIsFishNew(v)
        if IsFishNew then
          self["FishSwitch0" .. VariationIdx].New:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
        else
          self["FishSwitch0" .. VariationIdx].New:SetVisibility(ESlateVisibility.Collapsed)
        end
        Res = true
      elseif VariationIconPath then
        self["FishSwitch0" .. VariationIdx].Switcher_0:SetActiveWidgetIndex(1)
        self["FishSwitch0" .. VariationIdx].New:SetVisibility(ESlateVisibility.Collapsed)
        local FishIcon = LoadObject(VariationIconPath)
        local Material = self["FishSwitch0" .. VariationIdx].Icon_Fish_Black:GetDynamicMaterial()
        Material:SetTextureParameterValue("Mask", FishIcon)
      end
      VariationIdx = VariationIdx + 1
    end
    for i = VariationIdx, 2 do
      self["FishSwitch0" .. i]:SetVisibility(ESlateVisibility.Collapsed)
    end
  end
  return Res
end

function M:GetWeight()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return 10
  end
  print(_G.LogTag, "LXZ GetWeight", self.FishId, Avatar:GetFishMaxSize(self.FishId))
  return Avatar:GetFishMaxSize(self.FishId)
end

function M:CheckIsFishNew(FishId)
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    if 0 == Avatar:GetFishCountByFishId(FishId) then
      return false
    end
    local UnLockData = EMCache:Get("FishMapUnLockData", true)
    if not UnLockData then
      UnLockData = {}
      UnLockData[FishId] = 1
      if ReddotManager.GetTreeNode("AnglingMap") and ReddotManager.GetTreeNode("AnglingMap").Count > 0 then
        ReddotManager.DecreaseLeafNodeCount("AnglingMap", 1)
      end
    elseif not UnLockData[FishId] or 0 == UnLockData[FishId] then
      UnLockData[FishId] = 1
      if ReddotManager.GetTreeNode("AnglingMap") and ReddotManager.GetTreeNode("AnglingMap").Count > 0 then
        ReddotManager.DecreaseLeafNodeCount("AnglingMap", 1)
      end
    elseif 1 == UnLockData[FishId] then
      UnLockData[FishId] = 2
    end
    EMCache:Set("FishMapUnLockData", UnLockData, true)
    return 1 == UnLockData[FishId]
  else
    return true
  end
end

function M:GetPlace()
  local Data = DataMgr.Fish2FishingSpot[self.FishId]
  if not Data then
    return "\230\137\190\228\184\141\229\136\176\233\146\147\233\177\188\231\130\185"
  end
  PrintTable(Data, 3)
  for SpotId, Weight in pairs(Data) do
    local SpotData = DataMgr.FishingSpot[SpotId]
    if SpotData and SpotData.FishingSpotName then
      print(_G.LogTag, "LXZ GetPlace", SpotId)
      local Name = SpotData.FishingSpotName
      return Name
    end
  end
  return "\230\137\128\230\156\137\233\146\147\233\177\188\231\130\185\233\131\189\230\178\161\230\156\137\229\144\141\229\173\151"
end

function M:GetWeather()
  return "bbbb"
end

function M:NewTextContent(IconPath, Text)
  local Class = LoadClass("/Game/UI/WBP/Angling/Widget/Angling_TextItem_Content.Angling_TextItem_Content")
  local Obj = NewObject(Class)
  Obj.IconPath = IconPath
  Obj.Text = Text
  return Obj
end

return M
