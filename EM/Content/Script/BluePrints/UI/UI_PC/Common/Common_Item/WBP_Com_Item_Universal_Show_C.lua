require("UnLua")
local M = Class({
  "BluePrints.UI.BP_UIState_C"
})

function M:Init(ParentWidget)
  self.ParentWidget = ParentWidget
  self.WidgetMap = {}
end

function M:InitCommonView()
  self.Node_Widget:ClearChildren()
  self:SetItem(self.ParentWidget.Type)
  self:SetItemIcon(self.ParentWidget.ItemIcon)
  self:SetTypeIcon(self.ParentWidget.TypeIcon)
  self:SetName(self.ParentWidget.Name)
  self:SetRarity(self.ParentWidget.Rarity, self.ParentWidget.IsLock)
  self:SetAscend(self.ParentWidget.Type, self.ParentWidget.Id, self.ParentWidget.EnhanceLevel)
  self:SetIntron(self.ParentWidget.Type, self.ParentWidget.Id, self.ParentWidget.GradeLevel)
  self:SetCheckBtn(self.ParentWidget.OnClickCheckBtnEvent)
  self.ParentWidget:SetNew(self.ParentWidget.Content.IsNew)
  self.ParentWidget:SetSelected(self.ParentWidget.Content.IsSelect)
end

function M:SetItem(Type)
  if "Weapon" == Type then
    local Object = LoadObject("/Game/UI/Materials/CommonItem/MI_CommonItem_Show_Weapon.MI_CommonItem_Show_Weapon")
    self.Item.Image_Item:SetBrushResourceObject(Object)
  elseif "Character" == Type then
    local Object = LoadObject("/Game/UI/Materials/CommonItem/MI_CommonItem_Show_Char.MI_CommonItem_Show_Char")
    self.Item.Image_Item:SetBrushResourceObject(Object)
  else
    DebugPrint("Type Error")
  end
end

function M:SetItemIcon(ItemIconPath)
  local ItemIcon = LoadObject(ItemIconPath)
  local ItemDynamicMaterial = self.Item.Image_Item:GetDynamicMaterial()
  ItemDynamicMaterial:SetTextureParameterValue("IconMap", ItemIcon)
end

function M:SetTypeIcon(TypeIconPath)
  if TypeIconPath then
    if not self.WidgetMap[self.AttributeWidget] then
      self.AttributeWidget = self:CreateWidgetNew("ItemShowAttribute")
      local TypeIcon = LoadObject(TypeIconPath)
      self.AttributeWidget.Attribute:SetBrushResourceObject(TypeIcon)
      self:AddWidgetToNode(self.AttributeWidget)
    end
  elseif self.WidgetMap[self.AttributeWidget] then
    self:RemoveWidgetFromNode(self.AttributeWidget)
  end
end

function M:PlayAttributeWidgetNormal()
  if self.WidgetMap[self.AttributeWidget] then
    self.AttributeWidget:PlayAnimation(self.AttributeWidget.Normal)
  end
end

function M:PlayAttributeWidgeClick()
  if self.WidgetMap[self.AttributeWidget] then
    self.AttributeWidget:PlayAnimation(self.AttributeWidget.Click)
  end
end

function M:SetRarity(Rarity, IsLock)
  if not Rarity or Rarity < 1 or Rarity > 5 then
    DebugPrint("No Rarity")
    return
  end
  local TempRarity = Rarity
  local Saturation = 0
  if IsLock then
    TempRarity = 0
    Saturation = self.Item.Saturation
  end
  local ItemDynamicMaterial = self.Item.Image_Item:GetDynamicMaterial()
  local BgDynamicMaterial = self.Item.Image_Bg:GetDynamicMaterial()
  local LightBigColor = self.Item["Color_BottomBG_" .. TempRarity]
  local LightSmallColor = self.Item["Color_UpperBG_" .. TempRarity]
  local OutlineColor = self.Item["Color_OutLine_" .. Rarity]
  local TextColor = self.Item["Color_" .. Rarity]
  ItemDynamicMaterial:SetScalarParameterValue("Saturation", Saturation)
  ItemDynamicMaterial:SetVectorParameterValue("Light_Big_Color", LightBigColor)
  ItemDynamicMaterial:SetVectorParameterValue("Light_Small_Color", LightSmallColor)
  ItemDynamicMaterial:SetVectorParameterValue("OutlineColor", OutlineColor)
  BgDynamicMaterial:SetVectorParameterValue("OutlineColor", OutlineColor)
  self.Item.Image_Text:SetBrushTintColor(TextColor)
end

function M:SetName(Name)
  if Name then
    if not self.WidgetMap[self.NameWidget] then
      self.NameWidget = self:CreateWidgetNew("ItemShowName")
      self:AddWidgetToNode(self.NameWidget)
    end
    self.NameWidget.Text_Name:SetText(GText(Name))
  elseif self.WidgetMap[self.NameWidget] then
    self:RemoveWidgetFromNode(self.NameWidget)
  end
end

function M:SetStar(Num)
  if Num then
    if not self.WidgetMap[self.StarWidget] then
      self.StarWidget = self:CreateWidgetNew("ItemShowStar")
      self:AddWidgetToNode(self.StarWidget)
    end
    self.StarWidget.ListView_Star:ClearListItems()
    for i = 1, Num do
      local Content = NewObject(UIUtils.GetCommonItemContentClass())
      self.StarWidget.ListView_Star:AddItem(Content)
    end
  elseif self.WidgetMap[self.StarWidget] then
    self:RemoveWidgetFromNode(self.StarWidget)
  end
end

function M:SetNew(IsNew)
  if IsNew then
    if not self.WidgetMap[self.NewWidget] then
      self.NewWidget = self:CreateWidgetNew("ItemShowNew")
      self:AddWidgetToNode(self.NewWidget)
    end
  elseif self.WidgetMap[self.NewWidget] then
    self:RemoveWidgetFromNode(self.NewWidget)
  end
end

function M:SetCheckBtn(Event)
  if Event then
    if not self.WidgetMap[self.CheckBtnWidget] then
      self.CheckBtnWidget = self:CreateWidgetNew("ItemShowCheckBtn")
      self:AddWidgetToNode(self.CheckBtnWidget)
    end
    if Event.Params then
      self.CheckBtnWidget.Btn_Check:BindEventOnClicked(Event.Obj, Event.Callback, table.unpack(Event.Params))
    else
      self.CheckBtnWidget.Btn_Check:BindEventOnClicked(Event.Obj, Event.Callback)
    end
    if Event.CreateInfo then
      self.CheckBtnWidget.Key_Controller:CreateCommonKey(Event.CreateInfo)
    end
  elseif self.WidgetMap[self.CheckBtnWidget] then
    self:RemoveWidgetFromNode(self.CheckBtnWidget)
  end
end

function M:SetAscend(Type, Id, Num)
  if Num then
    if not self.WidgetMap[self.AscendWidget] then
      self.AscendWidget = self:CreateWidgetNew("ItemShowAscend")
      self:AddWidgetToNode(self.AscendWidget)
    end
    self.AscendWidget.ListView_Star:ClearListItems()
    if "Character" == Type then
      Type = "Char"
    end
    local BreakLevelUpData = DataMgr[Type .. "Break"][Id]
    local MaxNumber = BreakLevelUpData and #BreakLevelUpData or 0
    for i = 1, MaxNumber do
      local Content = NewObject(UIUtils.GetCommonItemContentClass())
      if i <= Num then
        Content.Light = true
      else
        Content.Light = false
      end
      self.AscendWidget.ListView_Star:AddItem(Content)
    end
  elseif self.WidgetMap[self.AscendWidget] then
    self:RemoveWidgetFromNode(self.AscendWidget)
  end
end

function M:SetIntron(Type, Id, Num)
  if Num then
    self.Item.Image_Type:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
    self.Item.Image_Type_Glow:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
    local ImageTypeDynamicMaterial = self.Item.Image_Type:GetDynamicMaterial()
    ImageTypeDynamicMaterial:SetScalarParameterValue("Index", Num)
    local MaxIntron
    if "Character" == Type then
      MaxIntron = DataMgr.GlobalConstant.CharCardLevelMax.ConstantValue
    else
      MaxIntron = DataMgr.WeaponCardLevel[Id].CardLevelMax
    end
    if MaxIntron and Num >= MaxIntron then
      self.Item:PlayAnimation(self.Item.Max)
    else
      self.Item:PlayAnimation(self.Item.Min)
    end
  else
    self.Item.Image_Type:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.Item.Image_Type_Glow:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

function M:AddWidgetToNode(Widget)
  if not self.Node_Widget or not Widget then
    return
  end
  if not self.WidgetMap then
    self.WidgetMap = {}
  end
  self.WidgetMap[Widget] = true
  local Slot = self.Node_Widget:AddChild(Widget)
  Slot:SetVerticalAlignment(EVerticalAlignment.HAlign_Fill)
  Slot:SetHorizontalAlignment(EHorizontalAlignment.HAlign_Fill)
end

function M:RemoveWidgetFromNode(Widget)
  if not self.Node_Widget or not Widget then
    return
  end
  self.WidgetMap[Widget] = nil
  Widget:RemoveFromParent()
end

function M:SetCheckBtnKeyTipVisible(IsVisible)
  if not self.WidgetMap[self.CheckBtnWidget] then
    return
  end
  self.ParentWidget.Content.ShowCheckBtnKeyTip = IsVisible
  if IsVisible then
    self.CheckBtnWidget.Key_Controller:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  else
    self.CheckBtnWidget.Key_Controller:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

function M:HideCheckBtnKeyTip()
  if not self.WidgetMap[self.CheckBtnWidget] then
    return
  end
  self.CheckBtnWidget.Key_Controller:SetVisibility(UIConst.VisibilityOp.Collapsed)
end

function M:OnParentRefreshOpInfoByInputDevice(CurInputType, CurGamepadName)
  if CurInputType == ECommonInputType.Gamepad then
    self:InitGamepadView()
  else
    self:InitKeyboardView()
  end
end

function M:InitGamepadView()
  self:SetCheckBtnKeyTipVisible(self.ParentWidget.Content.ShowCheckBtnKeyTip)
end

function M:InitKeyboardView()
  self:HideCheckBtnKeyTip()
end

return M
