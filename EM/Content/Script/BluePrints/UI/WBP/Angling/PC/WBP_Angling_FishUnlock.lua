require("UnLua")
local M = Class("BluePrints.UI.BP_UIState_C")
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

function M:OnLoaded(...)
  local Info = (...)
  print(_G.LogTag, "LXZ OnLoaded", Info.FishingSpotId, Info.FishId)
  self.DeviceInPc = CommonUtils.GetDeviceTypeByPlatformName(self) ~= "Mobile"
  self.FishId = Info.FishId
  self.FishingPage = Info.FishingPage
  self.FishSize = Info.FishSize
  self.bIsNew = Info.IsNew
  self:PlayAnimation(self.IN)
  self:BindToAnimationFinished(self.Out, {
    self,
    self.OnOutEnd
  })
  self.Btn_Empty.OnClicked:Add(self, self.OnClickEmpty)
  self.Btn_Empty:SetFocus()
  self.Text_Tips:SetText(GText("UI_TRAIN_CLOSE"))
  if self.DeviceInPc then
    self.Key_Continue_Gamepad:CreateCommonKey({
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "A"}
      },
      Desc = GText("UI_CTL_Continue")
    })
  end
  self:InitUnLockWidget()
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(self)
  self.GameInputModeSubsystem.OnInputMethodChanged:Add(self, self.RefreshInfoByInputTypeChange)
  self.CurMode = self.GameInputModeSubsystem:GetCurrentInputType()
  self:RefreshInfoByInputTypeChange(self.CurMode)
  AudioManager(self):PlayUISound(self, "event:/ui/minigame/fish_info_unlock", nil, nil)
end

function M:OnClickEmpty()
  if self:IsPlayingAnimation(self.IN) then
    return
  end
  self:PlayAnimation(self.Out)
end

function M:OnOutEnd()
  local ResourceId = DataMgr.Fish[self.FishId].ResourceId
  UIUtils.ShowHudReward(GText("UI_Fishing_Reward"), {
    {
      ItemType = "Resource",
      ItemId = ResourceId,
      Count = 1,
      Rarity = ItemUtils.GetItemRarity(ResourceId, "Resource")
    }
  })
  self:Close()
end

function M:InitUnLockWidget()
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
  local IconPath = DataMgr.Fish[self.FishId].IconPath
  if IconPath then
    local Icon = LoadObject(IconPath)
    self.Icon_Fish:SetBrushResourceObject(Icon)
  end
  print(_G.LogTag, "LXZ InitUnLockWidget", self.FishId, Data.FishType)
  if 3 == Data.FishType then
    self.Panel_Title:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    local Icon = LoadObject("/Game/UI/WBP/Common/VX/Angling/MI_Angling_FishMap_Tag_King.MI_Angling_FishMap_Tag_King")
    self.RB_Tag:SetEffectMaterial(Icon)
    self.VX_TagGlow:SetColorAndOpacity(self.Tag_Glow_King)
    self.Text_Title:SetText(GText("UI_Fishing_FishType_3"))
    self.WS_Type:SetActiveWidgetIndex(0)
  elseif 2 == Data.FishType then
    self.Panel_Title:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    local Icon = LoadObject("/Game/UI/WBP/Common/VX/Angling/MI_Angling_FishMap_Tag_Variation.MI_Angling_FishMap_Tag_Variation")
    self.RB_Tag:SetEffectMaterial(Icon)
    self.VX_TagGlow:SetColorAndOpacity(self.Tag_Glow_Variation)
    self.Text_Title:SetText(GText("UI_Fishing_FishType_2"))
    self.WS_Type:SetActiveWidgetIndex(1)
  elseif 4 == Data.FishType then
    self.Panel_Title:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    local Icon = LoadObject("/Game/UI/WBP/Common/VX/Angling/MI_Angling_FishMap_Tag_Variation.MI_Angling_FishMap_Tag_Variation")
    self.RB_Tag:SetEffectMaterial(Icon)
    self.VX_TagGlow:SetColorAndOpacity(self.Tag_Glow_Variation)
    self.Text_Title:SetText(GText("UI_Fishing_FishType_4"))
    self.WS_Type:SetActiveWidgetIndex(1)
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
  if self.bIsNew then
    self.New:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self.Text_Top:SetText(GText("UI_Fishing_UnlockFishBook"))
  else
    self.New:SetVisibility(ESlateVisibility.Collapsed)
    self.Text_Top:SetText(GText("UI_Fishing_Success"))
  end
end

function M:GetWeight()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return 10
  end
  return self.FishSize
end

function M:GetPlace()
  local Data = DataMgr.Fish2FishingSpot[self.FishId]
  if not Data then
    return "\230\137\190\228\184\141\229\136\176\233\146\147\233\177\188\231\130\185"
  end
  for SpotId, Weight in pairs(Data) do
    local SpotData = DataMgr.FishingSpot[SpotId]
    if SpotData and SpotData.FishingSpotName then
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

function M:RefreshInfoByInputTypeChange(CurInputDevice, CurGamepadName)
  if CurInputDevice == ECommonInputType.MouseAndKeyboard and self.DeviceInPc then
    self.Switcher_Text:SetActiveWidgetIndex(0)
  elseif CurInputDevice == ECommonInputType.Gamepad and self.DeviceInPc then
    self.Switcher_Text:SetActiveWidgetIndex(1)
  elseif CurInputDevice == ECommonInputType.Touch then
    self.Switcher_Text:SetActiveWidgetIndex(0)
  end
end

return M
