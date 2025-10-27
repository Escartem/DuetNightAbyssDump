require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:Construct()
  self.Title_Button.OnHovered:Add(self, self.OnBtnHovered)
  self.Title_Button.OnUnhovered:Add(self, self.OnBtnUnhovered)
  self.CurInputDeviceType = nil
end

function M:OnListItemObjectSet(Content)
  self.Content = Content
  self.SuitId = Content.GroupId
  self.Items = Content.Items
  self.DataModel = Content.DataModel
  self.IsGuide = Content.IsGuide
  self.Index = Content.Index
  self.Owner = Content.Owner
  self.SuitNeedCount = 0
  self.SuitCurrentCount = 0
  self:InitNavigationRules()
  self:InitSuitInfo()
  self:ShowAllButtomTips()
  self:InitListenEvent()
end

function M:InitListenEvent()
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
  if IsValid(self.GameInputModeSubsystem) then
    self:RefreshOpInfoByInputDevice(self.GameInputModeSubsystem:GetCurrentInputType(), self.GameInputModeSubsystem:GetCurrentGamepadName())
  end
  if IsValid(self.GameInputModeSubsystem) then
    self.GameInputModeSubsystem.OnInputMethodChanged:Add(self, self.RefreshOpInfoByInputDevice)
  end
end

function M:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  self.CurInputDeviceType = CurInputDevice
  local IsGamePad = CurInputDevice == ECommonInputType.Gamepad
  if IsGamePad then
    self.Title_Button.OnClicked:Add(self, self.OnSuitTitleClicked)
  else
    self.Title_Button.OnClicked:Remove(self, self.OnSuitTitleClicked)
    if self.HoveredTitle then
      self:PlayAnimation(self.UnHover)
    end
  end
end

function M:InitSuitInfo()
  local TreasureGroupDataMgr = DataMgr.TreasureGroup
  local Des
  if TreasureGroupDataMgr[self.SuitId] then
    Des = GText(TreasureGroupDataMgr[self.SuitId].Name)
    UE.UResourceLibrary.LoadObjectAsync(self, TreasureGroupDataMgr[self.SuitId].Icon, {
      self,
      M.OnSuitIconLoadFinish
    })
    if not self.IsGuide then
      if UE.ARougeLikeManager and TreasureGroupDataMgr[self.SuitId].ActivateNeed then
        self.SuitNeedCount = #TreasureGroupDataMgr[self.SuitId].ActivateNeed
        for _, value in pairs(TreasureGroupDataMgr[self.SuitId].ActivateNeed) do
          if UE.ARougeLikeManager.IsTreasureExist(GWorld.GameInstance, value) then
            self.SuitCurrentCount = self.SuitCurrentCount + 1
          end
        end
      end
      Des = string.format("%s  (%d/%d)", Des, self.SuitCurrentCount, self.SuitNeedCount)
    end
  else
    self.Group_TitleIcon:SetVisibility(UE4.ESlateVisibility.Collapsed)
    Des = string.format("\194\183 %s", GText("UI_DUNGEON_DES_TRAINING_23"))
  end
  self.Text_SuitTitle:SetText(Des)
  self.Text_SuitEffectTitle:SetText(GText("RL_GroupEffect"))
  self.List_Box:ClearChildren()
  for i = 1, #self.Items do
    local EntryItem = self:CreateEntryItem(self.Items[i])
    local EntryWidget = UIManager(self):CreateWidget("/Game/UI/WBP/RougeLike/Widget/CheckDetail/WBP_Rouge_CheckDetail_Item.WBP_Rouge_CheckDetail_Item")
    self.List_Box:AddChild(EntryWidget)
    EntryWidget:OnListItemObjectSet(EntryItem)
    EntryWidget.Index = i - 1
    EntryWidget:SetNavigationRuleCustom(UE4.EUINavigation.Up, {
      EntryWidget,
      EntryWidget.OnDetailNavigateUp
    })
    EntryWidget:SetNavigationRuleCustom(UE4.EUINavigation.Down, {
      EntryWidget,
      EntryWidget.OnDetailNavigateDown
    })
  end
  self:InitSuitTips()
end

function M:InitSuitTips()
  if -1 == self.SuitId then
    self.Com_BtnQa:SetVisibility(ESlateVisibility.Collapsed)
    self.Text_SuitEffectTitle:SetVisibility(ESlateVisibility.Collapsed)
  else
    self.Com_BtnQa:SetVisibility(ESlateVisibility.Visible)
    self.Text_SuitEffectTitle:SetVisibility(ESlateVisibility.Visible)
    self.ItemDetails_MenuAnchor.ItemDetailsMenuAnchor.OnMenuOpenChanged:Remove(self, self.ItemMenuAnchorChanged)
    self.ItemDetails_MenuAnchor.ItemDetailsMenuAnchor.OnMenuOpenChanged:Add(self, self.ItemMenuAnchorChanged)
    self.Com_BtnQa:Init({
      OwnerWidget = self,
      ClickCallback = self.OnSuitTipClicked
    })
    
    function self.Com_BtnQa.OpenMenuAnchor()
    end
  end
end

function M:ShowAllButtomTips()
  if self.CurInputDeviceType == ECommonInputType.Gamepad then
    self.Owner.Common_Tab:UpdateBottomKeyInfo({
      {
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "A",
            Owner = self
          }
        },
        Desc = GText("UI_Controller_Check"),
        bLongPress = false
      },
      {
        KeyInfoList = {
          {
            Type = "Text",
            Text = "Esc",
            ClickCallback = self.CloseSelf,
            Owner = self
          }
        },
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "B",
            ClickCallback = self.CloseSelf,
            Owner = self
          }
        },
        Desc = GText("UI_BACK")
      }
    })
  end
end

function M:HiedAllButtomTips()
  if self.CurInputDeviceType == ECommonInputType.Gamepad then
    self.Owner.Common_Tab:UpdateBottomKeyInfo({})
  end
end

function M:OnSuitTitleClicked()
  self.Com_BtnQa:PlayAnimation(self.Com_BtnQa.Click)
  self.Com_BtnQa.Btn_Click:SetChecked(true)
  self:OnSuitTipClicked()
end

function M:OnSuitTipClicked()
  if self.SuitId and -1 ~= self.SuitId then
    local bActiveTreasure = false
    if self.SuitCurrentCount == self.SuitNeedCount then
      bActiveTreasure = true
    end
    local Content = {
      ItemType = "TreasureGroup",
      ItemId = self.SuitId,
      bGuide = self.IsGuide,
      bActive = bActiveTreasure,
      MenuPlacement = EMenuPlacement.MenuPlacement_MenuRight
    }
    self.ItemDetails_MenuAnchor:OpenItemDetailsWidget(false, Content)
  else
    DebugPrint("@@@ Rouge\230\178\161\230\137\190\229\136\176TreasureGroupId")
  end
  self:HiedAllButtomTips()
end

function M:ItemMenuAnchorChanged(bIsOpen)
  if not bIsOpen then
    self:SetFocus()
    self:ShowAllButtomTips()
    self.Com_BtnQa:ResetStyle()
  end
end

function M:CreateEntryItem(EntryData)
  local Content = NewObject(UIUtils.GetCommonItemContentClass())
  Content.ItemId = EntryData.ItemId
  Content.ShopItemType = EntryData.ItemType
  Content.RougeGuideName = EntryData.RougeGuideName
  Content.DataModel = EntryData.DataModel
  Content.Parent = self
  return Content
end

function M:OnBtnHovered()
  if self:IsAnimationPlaying(self.In) then
    return
  end
  if self.GameInputModeSubsystem:GetCurrentInputType() == ECommonInputType.Gamepad then
    self:PlayAnimation(self.Hover)
    self.HoveredTitle = true
  end
end

function M:OnBtnUnhovered()
  if self:IsAnimationPlaying(self.In) then
    return
  end
  if self.GameInputModeSubsystem:GetCurrentInputType() == ECommonInputType.Gamepad then
    self:PlayAnimation(self.UnHover)
    self.HoveredTitle = false
  end
end

function M:OnSuitIconLoadFinish(Object)
  if Object and IsValid(self) then
    self.Group_TitleIcon:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    self.Image_TitleIcon:SetBrushResourceObject(Object)
  end
end

function M:Destruct()
  self.ItemDetails_MenuAnchor.ItemDetailsMenuAnchor.OnMenuOpenChanged:Remove(self, self.ItemMenuAnchorChanged)
  self.Title_Button.OnClicked:Remove(self, self.OnSuitTitleClicked)
end

function M:InitNavigationRules()
  self:SetNavigationRuleCustom(UE4.EUINavigation.Up, {
    self,
    self.OnSuitNavigateUp
  })
  self:SetNavigationRuleCustom(UE4.EUINavigation.Down, {
    self,
    self.OnSuitNavigateDown
  })
end

function M:OnSuitNavigateUp()
  local PreSuitItem = self:GetPreListSuitItem()
  if not PreSuitItem then
    return nil
  end
  return PreSuitItem.List_Box:GetChildAt(PreSuitItem.List_Box:GetChildrenCount() - 1)
end

function M:OnSuitNavigateDown()
  return self.List_Box:GetChildAt(0)
end

function M:GetPreListSuitItem()
  if self.Owner and self.Owner.List_SuitItem and self.Index > 0 then
    local PreItem = UE4.URuntimeCommonFunctionLibrary.GetEntryWidgetFromItem(self.Owner.List_SuitItem, self.Index - 1)
    return PreItem
  end
  return nil
end

function M:GetNextListSuitItem()
  if self.Owner and self.Owner.List_SuitItem then
    local PreItem = UE4.URuntimeCommonFunctionLibrary.GetEntryWidgetFromItem(self.Owner.List_SuitItem, self.Index + 1)
    return PreItem
  end
  return nil
end

return M
