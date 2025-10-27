require("UnLua")
local WBP_Settlement_DataDisplay_C = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function WBP_Settlement_DataDisplay_C:Construct()
  local LevelEnterData = DataMgr.LevelEnterData
  self.SwitchBattleDataTypeToText = {
    Damage = LevelEnterData.Damage.HighLightName,
    Kill = LevelEnterData.Kill.HighLightName,
    Damaged = LevelEnterData.Damaged.HighLightName,
    Heal = LevelEnterData.Heal.HighLightName,
    DamageSingle = LevelEnterData.DamageSingle.HighLightName,
    Destroy = LevelEnterData.Destroy.HighLightName,
    HitCount = LevelEnterData.HitCount.HighLightName
  }
  self.IconColorByType = {
    [1] = self.Color_Red,
    [2] = self.Color_Blue,
    [3] = self.Color_Green,
    [4] = self.Color_Yellow
  }
end

function WBP_Settlement_DataDisplay_C:Init(Parmas)
  self.Parmas = Parmas
  if not self.Parmas then
    return
  end
  self.TitleText = GText(self.SwitchBattleDataTypeToText[self.Parmas.DataName])
  self.Text_Type:SetText(self.TitleText)
  self:InitUIByType()
  self:SetColor()
  self:InitData()
end

function WBP_Settlement_DataDisplay_C:SetColor()
  local DataType = DataMgr.LevelEnterData[self.Parmas.DataName].Type
  if not DataType then
    return
  end
  local Color = self.IconColorByType[DataType]
  self.Icon_Type:SetColorAndOpacity(Color.SpecifiedColor)
end

function WBP_Settlement_DataDisplay_C:InitUIByType()
  local IconPath = DataMgr.LevelEnterData[self.Parmas.DataName].Icon
  if not IconPath then
    return
  end
  IconPath = string.format("Texture2D'/%s'", IconPath)
  local Img = LoadObject(IconPath)
  if not Img then
    DebugPrint("\231\188\186\229\176\145\229\155\190\231\137\135\232\181\132\230\186\144: ImgPath = " .. IconPath)
    return
  end
  self.Icon_Type:SetBrushResourceObject(Img)
end

function WBP_Settlement_DataDisplay_C:InitData()
  local NumText = 0
  if self.Parmas.Value < 10000 then
    self.Text_Unit:SetVisibility(ESlateVisibility.Collapsed)
    NumText = self.Parmas.Value
    self.Text_Data:SetVisibility(ESlateVisibility.Visible)
    if self.Parmas.DataName == "Damage" or self.Parmas.DataName == "Damaged" then
      NumText = string.format("%s", NumText) .. "%"
    end
    self.Text_Data:SetText(NumText)
  else
    self.Text_Unit:SetVisibility(ESlateVisibility.Visible)
    NumText = math.floor(self.Parmas.Value / 10000)
    self.Text_Data:SetVisibility(ESlateVisibility.Visible)
    self.Text_Data:SetText(NumText)
  end
end

return WBP_Settlement_DataDisplay_C
