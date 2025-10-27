require("UnLua")
local N = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function N:OnListItemObjectSet(Content)
  self:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self.Content = Content
  Content.SelfWidget = self
  self:SetImgAvatar()
  self.Set.TipText:SetText(GText("UI_SHOWNPC_SETTLED"))
  if 1 == Content.IsShow then
    self.Set:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  else
    self.Set:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
  if Content.IsSelected then
    self:SetPanelBg(1)
  else
    self:SetPanelBg(0)
  end
end

function N:PlayInAnimation()
  self:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  self:PlayAnimation(self.In)
end

function N:OnMouseButtonDown(MyGeometry, InKeyEvent)
  if UE4.UKismetInputLibrary.PointerEvent_IsMouseButtonDown(InKeyEvent, UE4.EKeys.LeftMouseButton) then
    if self:CheckNpcIsSet() then
      return UE4.UWidgetBlueprintLibrary.Handled()
    end
    if self.IsHoverState then
      self:PlayAnimationReverse(self.Hover)
      self.IsHoverState = false
    end
    self.Content.ParentWidget:ClearListSelectedState()
    self:PlayAnimation(self.Click)
    self:SetPanelBg(1)
    self.Content.ParentWidget:OnNpcListItemClicked(self.Content)
  end
  return UE4.UWidgetBlueprintLibrary.Handled()
end

function N:CheckNpcIsSet()
  for i = 1, self.Content.ParentWidget.SignBoardNums do
    if i ~= self.Content.ParentWidget.NowTabId and self.Content.ParentWidget.SignBoardNpcState[i] == self.Content.UnitId then
      local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
      local UIManager = GameInstance:GetGameUIManager()
      local ErrorContent = DataMgr.ErrorCode[5006].ErrorCodeContent
      UIManager:ShowUITip(UIConst.Tip_CommonTop, ErrorContent)
      return true
    end
  end
  return false
end

function N:OnMouseEnter(MyGeometry, MouseEvent)
  if not self.Content.IsSelected then
    self:PlayAnimation(self.Hover)
    self.IsHoverState = true
  end
end

function N:OnMouseLeave(MyGeometry, MouseEvent)
  if not self.Content.IsSelected then
    self:RecoverUnhovered()
  end
end

function N:RecoverUnhovered()
  self:PlayAnimationReverse(self.Hover)
  self.IsHoverState = false
end

function N:SetPanelBg(Index)
  self.Panel_Bg:SetActiveWidgetIndex(Index)
  if 1 == Index then
    self.Content.IsSelected = true
    self:PlayAnimation(self.Click)
  else
    self.Content.IsSelected = false
    self:PlayAnimation(self.Normal)
  end
end

function N:SetImgAvatar()
  local ShowNpc = DataMgr.Npc[self.Content.UnitId]
  local Icon = DataMgr.Char[ShowNpc.CharId].Icon
  local NpcIcon = LoadObject(Icon)
  local NpcMaterial = self.Img_Avatar:GetDynamicMaterial()
  NpcMaterial:SetTextureParameterValue("IconMap", NpcIcon)
  local Rarity = DataMgr.Char[ShowNpc.CharId].CharRarity
  local RarityIcon = LoadObject("/Game/UI/UI_PNG/Common/Deco/Deco_Quality_" .. UIConst.RarityColorName[Rarity] .. ".Deco_Quality_" .. UIConst.RarityColorName[Rarity])
  self.Img_Line:SetBrushResourceObject(RarityIcon)
end

return N
