require("UnLua")
local M = Class("BluePrints.UI.BP_EMUserWidget_C")

function M:Init(CharId, SkinId, ColorVarName, ClickCallback, ParentWiget)
  local CharInfo = DataMgr.Char[CharId]
  local BattleCharInfo = DataMgr.BattleChar[CharId]
  if CharInfo and BattleCharInfo then
    self:FillWithTitleInfo(CharInfo.CharName, CharInfo.CharRarity, CharId, ColorVarName)
  end
  self.ParentWiget = ParentWiget
  if SkinId then
    self.SkinId = SkinId
    self.Group_DetailBtn:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.Btn_Detail:SetVisibility(UE4.ESlateVisibility.Collapsed)
    return
  end
  self.ClickCallback = ClickCallback
  self.Btn_Detail.OnClicked:Clear()
  self.Btn_Detail.OnClicked:Add(self, self.BtnClicked)
end

function M:FillWithTitleInfo(TargetName, TargetRarity, CharId, ColorVarName)
  self.Text_CharName:SetText(GText(TargetName))
  for i = 1, CommonConst.GachaRarityMax do
    if self["Gacha_Star_" .. i] then
      self["Gacha_Star_" .. i]:SetVisibility(UE4.ESlateVisibility.Collapsed)
    end
  end
  local BattleCharInfo = DataMgr.BattleChar[CharId]
  local TargetProperty = BattleCharInfo.Attribute
  if TargetProperty then
    local IconName = "Armory_" .. TargetProperty
    local AttributeIcon = LoadObject("/Game/UI/Texture/Dynamic/Atlas/Armory/T_" .. IconName .. ".T_" .. IconName)
    if AttributeIcon then
      self.Image_CharType:SetBrushResourceObject(AttributeIcon)
    end
  end
  if ColorVarName and self[ColorVarName] then
    self.Img_TryOutBG:SetColorAndOpacity(self[ColorVarName].SpecifiedColor)
  end
end

function M:BtnClicked()
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_small", nil, nil)
  if self.ClickCallback then
    self.ClickCallback(self.ParentWiget)
  end
end

return M
