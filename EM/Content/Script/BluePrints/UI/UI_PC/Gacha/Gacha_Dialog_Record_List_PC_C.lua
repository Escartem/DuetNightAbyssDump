require("UnLua")
local TimeUtils = require("Utils.TimeUtils")
local GachaCommon = require("BluePrints.UI.WBP.Gacha.GachaCommon")
local G = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function G:OnListItemObjectSet(Content)
  local RecordData = DataMgr[GachaCommon.GachaItemTypeMap[Content.ItemType]][Content.ItemId]
  local NameText = GachaCommon.GachaItemTypeMap[Content.ItemType] .. "Name"
  local TargetName = RecordData[NameText] or RecordData.Name
  local TargetRarity = RecordData.Rarity or RecordData[GachaCommon.GachaItemTypeMap[Content.ItemType] .. "Rarity"] or 1
  local RarityText
  if GachaCommon.GachaItemTypeMap[Content.ItemType] == "Skin" or GachaCommon.GachaItemTypeMap[Content.ItemType] == "WeaponSkin" or GachaCommon.GachaItemTypeMap[Content.ItemType] == "CharAccessory" or GachaCommon.GachaItemTypeMap[Content.ItemType] == "WeaponAccessory" then
    RarityText = GachaCommon.RarityName[TargetRarity]
  else
    RarityText = GachaCommon.ItemRarityName[TargetRarity]
  end
  if Content.Count > 1 then
    TargetName = GText(TargetName) .. "\195\151" .. Content.Count
  end
  self.Text_Designation:SetText(GText(TargetName))
  self.Text_Quality:SetText(GText(RarityText))
  self:SetRarityColor(TargetRarity)
  self:SetBg(Content.Id)
  local GachaInfo = DataMgr.SkinGacha[Content.GachaId]
  self.Text_Type:SetText(GText(GachaInfo.GachaName))
  self.Text_Time:SetText(TimeUtils.TimeToYMDStr(Content.GachaTime, nil, "/") .. " " .. TimeUtils.TimeToHMSStr(Content.GachaTime, nil, ":"))
end

function G:SetRarityColor(Rarity)
  if 5 == Rarity then
    self.Text_Designation:SetDefaultColorAndOpacity(UE4.UUIFunctionLibrary.StringToSlateColor("DDB058FF"))
    self.Text_Quality:SetDefaultColorAndOpacity(UE4.UUIFunctionLibrary.StringToSlateColor("DDB058FF"))
    self.Text_Type:SetDefaultColorAndOpacity(UE4.UUIFunctionLibrary.StringToSlateColor("DDB058FF"))
    self.Text_Time:SetDefaultColorAndOpacity(UE4.UUIFunctionLibrary.StringToSlateColor("DDB058FF"))
  elseif 4 == Rarity then
    self.Text_Designation:SetDefaultColorAndOpacity(UE4.UUIFunctionLibrary.StringToSlateColor("B77CFFFF"))
    self.Text_Quality:SetDefaultColorAndOpacity(UE4.UUIFunctionLibrary.StringToSlateColor("B77CFFFF"))
    self.Text_Type:SetDefaultColorAndOpacity(UE4.UUIFunctionLibrary.StringToSlateColor("B77CFFFF"))
    self.Text_Time:SetDefaultColorAndOpacity(UE4.UUIFunctionLibrary.StringToSlateColor("B77CFFFF"))
  else
    self.Text_Designation:SetDefaultColorAndOpacity(UE4.UUIFunctionLibrary.StringToSlateColor("FFFFFFCC"))
    self.Text_Quality:SetDefaultColorAndOpacity(UE4.UUIFunctionLibrary.StringToSlateColor("FFFFFFCC"))
    self.Text_Type:SetDefaultColorAndOpacity(UE4.UUIFunctionLibrary.StringToSlateColor("FFFFFFCC"))
    self.Text_Time:SetDefaultColorAndOpacity(UE4.UUIFunctionLibrary.StringToSlateColor("FFFFFFCC"))
  end
end

function G:SetBg(Index)
  local num1, num2 = math.modf(Index / 2)
  if 0 == num2 then
    self.Image_ItemBG:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  else
    self.Image_ItemBG:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
end

return G
