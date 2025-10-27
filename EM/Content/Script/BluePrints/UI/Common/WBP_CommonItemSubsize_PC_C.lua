require("UnLua")
local WBP_CommonItemSubsize_C = Class({
  "BluePrints.Common.TimerMgr",
  "BluePrints.UI.BP_EMUserWidget_C"
})

function WBP_CommonItemSubsize_C:Initialize(Initializer)
  self.SlotModId = nil
  self.IsDraging = false
  self.Parent = nil
  self.IsCanUnLoad = true
  self.IsShowModLevelUp = false
  self.CallbackUI2 = nil
end

function WBP_CommonItemSubsize_C:OnInFinished()
  self:SetVisibility(ESlateVisibility.Visible)
  self:SetIsSelected(self.IsSelected, false)
  if self._OnInFinished then
    self._OnInFinished(self, self.Content)
  end
end

function WBP_CommonItemSubsize_C:Construct()
  self:BindToAnimationFinished(self.In, {
    self,
    self.OnInFinished
  })
  self:BindToAnimationFinished(self.Selected_Loop, {
    self,
    self.OnSelectedLoopAnimFinished
  })
  self:BindToAnimationFinished(self.UnHover, {
    self,
    self.OnUnHoverAnimFinished
  })
  self.ItemDetails_MenuAnchor.ItemDetailsMenuAnchor.OnMenuOpenChanged:Remove(self, self.OnMenuOpenChanged)
  self.ItemDetails_MenuAnchor.ItemDetailsMenuAnchor.OnMenuOpenChanged:Add(self, self.OnMenuOpenChanged)
  EventManager:AddEvent(EventID.UnLoadUI, self, function(self, UIName)
    if self._OnUnLoadUI then
      self._OnUnLoadUI(self, self.Content, UIName)
    end
  end)
  self:InitAnimationVariables()
end

function WBP_CommonItemSubsize_C:Destruct()
  self:UnbindFromAnimationFinished(self.In, {
    self,
    self.OnInFinished
  })
  self:UnbindFromAnimationFinished(self.Selected_Loop, {
    self,
    self.OnSelectedLoopAnimFinished
  })
  self:UnbindFromAnimationFinished(self.UnHover, {
    self,
    self.OnUnHoverAnimFinished
  })
  self.ItemDetails_MenuAnchor.ItemDetailsMenuAnchor.OnMenuOpenChanged:Remove(self, self.OnMenuOpenChanged)
  EventManager:RemoveEvent(EventID.UnLoadUI, self)
end

function WBP_CommonItemSubsize_C:InitVariables(Content)
  self.bHovered = false
  self.bPressed = false
  self.Type = Content.Type
  self.StuffType = Content.StuffType
  self.Parent = Content.Parent
  self.bInteractive = Content.bInteractive
  self.bEnableDrag = Content.bEnableDrag
  self.IsSelected = Content.IsSelected
  self.IsShowDetails = Content.IsShowDetails
  self.UnitId = Content.UnitId
  self.HandleMouseDown = Content.HandleMouseDown
  self.DragPivot = Content.DragPivot
  self.DragOffset = Content.DragOffset
  self.AudioType = Content.AudioType or self.Type or self.StuffType
  self.bSyncLoadIcon = Content.bSyncLoadIcon
  self.UIName = Content.UIName
  self._OnInFinished = Content.OnInFinished
  self._OnUnLoadUI = Content.OnUnLoadUI
  self._OnDragCancelled = Content.OnDragCancelled
  self._OnDragEnter = Content.OnDragEnter
  self._OnDragLeave = Content.OnDragLeave
  self._CreateDragWidget = Content.CreateDragWidget
  self._OnMouseLeave = Content.OnMouseLeave
  self._OnMouseEnter = Content.OnMouseEnter
  self._OnMouseButtonUp = Content.OnMouseButtonUp
  self._MouseButtonUpEvent = Content.MouseButtonUpEvent
  self._OnMouseButtonDown = Content.OnMouseButtonDown
  self._MouseButtonDownEvent = Content.MouseButtonDownEvent
  self._OnMouseButtonDownEarly = Content.OnMouseButtonDownEarly
  self._OnSelectedChanged = Content.OnSelectedChanged
  self._OnBtnAddClickedFin = Content.OnBtnAddClickedFin
  self._OnBtnAddClicked = Content.OnBtnAddClicked
  self._MenuOpenChangedEvent = Content.MenuOpenChangedEvent
  self._OnAddedToFocusPathEvent = Content.OnAddedToFocusPathEvent
  self._OnRemovedFromFocusPathEvent = Content.OnRemovedFromFocusPathEvent
end

function WBP_CommonItemSubsize_C:OnListItemObjectSet(Content)
  self:FlushAnimations()
  if self.Content ~= nil and self.Content.Type ~= Content.Type then
    self:RefreshStuffNodeStyle(Content)
  end
  if nil ~= Content.StuffType and Content.StuffType ~= "EmptyGrid" then
    self:SetStuffStyleByStateTag(Content)
  end
  self.Content = Content
  self:InitVariables(Content)
  Content.UI = self
  self.ItemDetails_MenuAnchor:InitializeSetUp(self, Content)
  self.ItemDetails_MenuAnchor:CloseItemDetailsWidget()
  if nil == Content.Icon then
    if nil == self.bInteractive then
      self.bInteractive = false
    end
    self:SetIsEmpty(true)
  else
    if self.bInteractive ~= false then
      self.bInteractive = true
    end
    self:SetIsEmpty(false)
    if Content.bNotShowInfo then
      self.Panel_Info:SetVisibility(UE4.ESlateVisibility.Collapsed)
    end
    if self["Update" .. self.Type .. "Item"] then
      self["Update" .. self.Type .. "Item"](self, Content)
    else
      self:UpdateCommonItem(Content)
    end
    self:SetIsSelected(self.IsSelected, false)
  end
  if Content.AnimNameWithCreate == "In_OnlyOpacity" then
    self.Panel_Content:SetRenderOpacity(0.0)
    self.Panel_Empty:SetRenderOpacity(0.0)
    self:PlayAnimation(self[Content.AnimNameWithCreate])
  end
  self:ShowContentWarning(Content.ShowWarningText)
end

function WBP_CommonItemSubsize_C:SetIsEmpty(IsEmpty)
  if IsEmpty then
    self.Switch_Type:SetActiveWidget(self.Panel_Empty)
  else
    self.Switch_Type:SetActiveWidget(self.Panel_Content)
  end
end

function WBP_CommonItemSubsize_C:ShowAddIcon(IsShow)
  if IsShow then
    self.Panel_Add:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    if not self.Btn_Add.OnClicked:IsBound() then
      self.Btn_Add.OnClicked:Add(self, self.OnBtnAddClicked)
      self.Btn_Add.OnPressed:Add(self, self.OnBtnAddPressed)
      self.Btn_Add.OnReleased:Add(self, self.OnBtnAddReleased)
      self.Btn_Add.OnHovered:Add(self, self.OnBtnAddHovered)
      self.Btn_Add.OnUnhovered:Add(self, self.OnBtnUnhovered)
    end
    self:UnbindAllFromAnimationFinished(self.Empty_Click)
    self:BindToAnimationFinished(self.Empty_Click, {
      self,
      self.OnEmpty_ClickFinished
    })
  else
    self.Panel_Add:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

function WBP_CommonItemSubsize_C:OnBtnAddClicked()
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_add_material", nil, nil)
  if self._OnBtnAddClicked then
    self._OnBtnAddClicked(self.Content)
  end
  self:FlushAnimations()
  self:StopAllAnimations()
  self:PlayAnimation(self.Empty_Click)
end

function WBP_CommonItemSubsize_C:OnEmpty_ClickFinished()
  if self._OnBtnAddClickedFin then
    self._OnBtnAddClickedFin(self.Content)
  end
  if self.Btn_Add:IsHovered() then
    self:FlushAnimations()
    self:StopAllAnimations()
    self:PlayAnimation(self.Empty_Hover)
  end
end

function WBP_CommonItemSubsize_C:OnBtnAddPressed()
  if not self:IsAnimationPlaying(self.Empty_Click) then
    self:FlushAnimations()
    self:StopAllAnimations()
    self:PlayAnimation(self.Empty_Press)
  end
end

function WBP_CommonItemSubsize_C:OnBtnAddReleased()
  if not self:IsAnimationPlaying(self.Empty_Click) then
    self:FlushAnimations()
    self:StopAllAnimations()
    self:PlayAnimation(self.Empty_Normal)
  end
end

function WBP_CommonItemSubsize_C:OnBtnAddHovered()
  if not self:IsAnimationPlaying(self.Empty_Click) then
    self:FlushAnimations()
    self:StopAllAnimations()
    self:PlayAnimation(self.Empty_Hover)
  end
end

function WBP_CommonItemSubsize_C:OnBtnUnhovered()
  if not self:IsAnimationPlaying(self.Empty_Click) then
    self:FlushAnimations()
    self:StopAllAnimations()
    self:PlayAnimation(self.Empty_Unhover)
  end
end

function WBP_CommonItemSubsize_C:SetInteractivity(bInteractive)
  self.bInteractive = bInteractive
end

function WBP_CommonItemSubsize_C:RefreshStuffNodeStyle(Content)
  if self.StuffType == "Mod" then
    self.GradeLevel:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.Name:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.Star:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.Star_Sell:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.Polarity:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.InGear:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.List_ModStar:SetVisibility(UIConst.VisibilityOp.Collapsed)
  elseif self.StuffType == "Weapon" then
    self.WeaponCardLevel:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.Name:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.Attribute:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.Level:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.InGear:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.Phantom:SetVisibility(UE4.ESlateVisibility.Collapsed)
  else
    self.Level:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.Num:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.Phantom:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
end

function WBP_CommonItemSubsize_C:SetStuffStyleByStateTag(Content)
  local StateTagInfo = Content.StateTagInfo
  if nil == StateTagInfo then
    self:RefreshItemsByStateTag({Name = "Normal"}, Content)
    return
  end
  if nil ~= self.Content and nil ~= self.Content.StateTagInfo then
    if self.Content.StateTagInfo.Name == "IsToChoose" then
      self.Select:SetVisibility(UE4.ESlateVisibility.Collapsed)
      self.SelectNum:SetVisibility(UE4.ESlateVisibility.Collapsed)
      self.Money:SetVisibility(UE4.ESlateVisibility.Collapsed)
    elseif self.Content.StateTagInfo.Name == "InSelectList" then
      self.Minus:SetVisibility(UE4.ESlateVisibility.Collapsed)
      self.SelectNum:SetVisibility(UE4.ESlateVisibility.Collapsed)
      self.Money:SetVisibility(UE4.ESlateVisibility.Collapsed)
    end
  end
  self:RefreshItemsByStateTag(StateTagInfo, Content)
end

function WBP_CommonItemSubsize_C:RefreshItemsByStateTag(StateTagInfo, Content)
  if StateTagInfo.ExtraData ~= nil then
    if not self.SelectNumWidget then
      self.SelectNumWidget = Utils.UIManager(self):CreateWidget("/Game/UI/UI_PC/Common/Item_Subsize_Widget/Common_Item_Subsize_SelectNum_PC.Common_Item_Subsize_SelectNum_PC_C", false)
      self.SelectNum:ClearChildren()
      self.SelectNum:AddChild(self.SelectNumWidget)
    end
    if not self.SaleMoneyWidget and Content.StuffType ~= "Weapon" then
      self.SaleMoneyWidget = Utils.UIManager(self):CreateWidget("/Game/UI/UI_PC/Common/Item_Subsize_Widget/Common_Item_Subsize_Money_PC.Common_Item_Subsize_Money_PC_C", false)
      self.Money:ClearChildren()
      self.Money:AddChild(self.SaleMoneyWidget)
    end
  end
  if StateTagInfo.Name == "IsToChoose" then
    if not self.SelectWidget then
      self.SelectWidget = Utils.UIManager(self):CreateWidget("/Game/UI/UI_PC/Common/Item_Subsize_Widget/Common_Item_Subsize_Select_PC.Common_Item_Subsize_Select_PC_C", false)
      self.Select:ClearChildren()
      self.Select:AddChild(self.SelectWidget)
    end
    if StateTagInfo.ExtraData ~= nil then
      self.SelectNumWidget.Num_Select:SetText(Utils.FormatNumber(StateTagInfo.ExtraData[1], true))
      self.SelectNumWidget.Num_Max:SetText(Utils.FormatNumber(StateTagInfo.ExtraData[2], true))
      if Content.StuffType ~= "Weapon" then
        self.SaleMoneyWidget.Text_Cost:SetText(Utils.FormatNumber(math.floor(StateTagInfo.ExtraData[3] + 0.5), true))
        local CoinIcon = LoadObject(DataMgr.Resource[StateTagInfo.ExtraData[4]].Icon)
        self.SaleMoneyWidget.Img_Coin:SetBrushResourceObject(CoinIcon)
      end
    end
    self.Select:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    self.SelectNum:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    if Content.StuffType == "Weapon" then
      self.Money:SetVisibility(UE4.ESlateVisibility.Collapsed)
    else
      self.Money:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    end
  elseif StateTagInfo.Name == "InSelectList" then
    if not self.MinusWidget then
      self.MinusWidget = Utils.UIManager(self):CreateWidget("/Game/UI/UI_PC/Common/Item_Subsize_Widget/Common_Item_Subsize_Minus_PC.Common_Item_Subsize_Minus_PC_C", false)
      self.Minus:ClearChildren()
      self.Minus:AddChild(self.MinusWidget)
    end
    if StateTagInfo.ExtraData ~= nil then
      self.MinusWidget.Button_Minus.OnClicked:Add(self, self.CancelSelectClick)
      self.SelectNumWidget.Num_Select:SetText(Utils.FormatNumber(StateTagInfo.ExtraData[1], true))
      self.SelectNumWidget.Num_Max:SetText(Utils.FormatNumber(StateTagInfo.ExtraData[2], true))
      if Content.StuffType ~= "Weapon" then
        self.SaleMoneyWidget.Text_Cost:SetText(Utils.FormatNumber(math.floor(StateTagInfo.ExtraData[3] + 0.5), true))
        local CoinIcon = LoadObject(DataMgr.Resource[StateTagInfo.ExtraData[4]].Icon)
        self.SaleMoneyWidget.Img_Coin:SetBrushResourceObject(CoinIcon)
      end
    end
    self.Minus:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    self.SelectNum:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    if Content.StuffType == "Weapon" then
      self.Money:SetVisibility(UE4.ESlateVisibility.Collapsed)
    else
      self.Money:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    end
  elseif StateTagInfo.Name == "Normal" then
    if StateTagInfo.ExtraData ~= nil then
      self.SelectNumWidget.Num_Select:SetText("0")
      self.SelectNumWidget.Num_Max:SetText(Utils.FormatNumber(StateTagInfo.ExtraData[1], true))
      if Content.StuffType ~= "Weapon" then
        self.SaleMoneyWidget.Text_Cost:SetText(Utils.FormatNumber(math.floor(StateTagInfo.ExtraData[2] + 0.5), true))
        if StateTagInfo.ExtraData[3] ~= nil then
          local CoinIcon = LoadObject(DataMgr.Resource[StateTagInfo.ExtraData[3]].Icon)
          self.SaleMoneyWidget.Img_Coin:SetBrushResourceObject(CoinIcon)
        end
      end
      self.Minus:SetVisibility(UE4.ESlateVisibility.Collapsed)
      self.Select:SetVisibility(UE4.ESlateVisibility.Collapsed)
      self.SelectNum:SetVisibility(UE4.ESlateVisibility.Collapsed)
      if Content.StuffType == "Weapon" then
        self.Money:SetVisibility(UE4.ESlateVisibility.Collapsed)
      else
        self.Money:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
      end
    else
      self.Minus:SetVisibility(UE4.ESlateVisibility.Collapsed)
      self.Select:SetVisibility(UE4.ESlateVisibility.Collapsed)
      self.SelectNum:SetVisibility(UE4.ESlateVisibility.Collapsed)
      self.Money:SetVisibility(UE4.ESlateVisibility.Collapsed)
    end
  end
  self:UpdateGrey(StateTagInfo.IsShowGrey, Content)
end

function WBP_CommonItemSubsize_C:SetWalnutRealChoice(IsSelected)
  if not self.SelectNumWidget then
    self.SelectNumWidget = Utils.UIManager(self):CreateWidget("/Game/UI/UI_PC/Common/Item_Subsize_Widget/Common_Item_Subsize_SelectNum_PC.Common_Item_Subsize_SelectNum_PC_C", false)
    self.SelectNum:ClearChildren()
    self.SelectNum:AddChild(self.SelectNumWidget)
    self.SelectNumWidget.Num_Max:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.SelectNumWidget.Split_1:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.SelectNumWidget.Num_Select:SetText(GText("UI_Walnut_Select"))
  end
  self.Content.SetWalnutRealChoice = IsSelected
  if IsSelected then
    self.SelectNum:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  else
    self.SelectNum:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
end

function WBP_CommonItemSubsize_C:CancelSelectClick()
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_return", nil, nil)
  if self.Parent ~= nil and self.Content.StateTagInfo then
    local AllCount = #self.Content.StateTagInfo.ExtraData
    self.Content.StateTagInfo.ExtraData[AllCount](self.Parent, self.Content.Uuid)
  end
end

function WBP_CommonItemSubsize_C:UpdateGrey(bGrey, Content, IsToChild)
  IsToChild = IsToChild or false
  if bGrey then
    if Content.StuffType == "Weapon" then
      Content.ShowWarningText = GText("UI_Bag_Decompose_Unable")
    else
      Content.ShowWarningText = GText("UI_Tips_CantSell")
    end
    self:ShowContentWarning(Content.ShowWarningText)
  else
    Content.ShowWarningText = nil
    self:ShowContentWarning()
  end
end

function WBP_CommonItemSubsize_C:UpdateCommonItem(Content)
  local ItemData = DataMgr[Content.Type][Content.UnitId]
  if not ItemData then
    return
  end
  self:SetIsLock(false)
  self:SetIcon(Content.Icon)
  self:SetCount(Content.Count)
  self:SetRarity(Content.Rarity)
end

function WBP_CommonItemSubsize_C:UpdateMonsterItem(Content)
  self:SetIcon(Content.Icon)
  self:SetName(GText(Content.Name))
  self:SetRarity()
  self:SetReddot(Content.IsNew)
end

function WBP_CommonItemSubsize_C:UpdateRewardItem(Content)
  local ItemData = DataMgr[Content.Type][Content.UnitId]
  if not ItemData then
    return
  end
  self:SetIsLock(Content.IsLocked)
  self:SetIcon(Content.Icon)
  self:SetCount(Content.Count)
  self:SetRarity(Content.Rarity)
end

function WBP_CommonItemSubsize_C:UpdateResourceItem(Content)
  local ItemData = DataMgr[Content.Type][Content.UnitId]
  if not ItemData then
    return
  end
  self:SetIsLock(Content.IsLocked)
  self:SetIcon(Content.Icon)
  self:SetCount(Content.Count)
  self:SetPhantomWeaponIcon(Content.UnitId, Content.IsPhantom)
  self:SetAttrIcon(Content.AttrIcon)
  self:SetReddot(Content.IsNew)
  self:SetRarity(Content.Rarity)
end

function WBP_CommonItemSubsize_C:UpdateModItem(Content)
  Content.bInteractive = true
  local ModDataInfo, ModPolarity, ModCost, Mod
  local ModId = Content.UnitId
  if Content.Uuid then
    local Avatar = GWorld:GetAvatar()
    local ModUuid = Content.Uuid
    Mod = Avatar.Mods[ModUuid]
    ModId = Mod.ModId
    ModDataInfo = DataMgr.Mod[ModId]
    self:SetIsLock(Mod:IsLock())
    self:SetGradeLevel(Content.Count)
    self:SetStars(Mod.Level, true)
    ModPolarity = Mod.Polarity
    ModCost = Mod.Cost
    self:ShowModStar(Mod)
  else
    ModId = Content.UnitId
    ModDataInfo = DataMgr.Mod[ModId]
    self:SetIsLock(false)
    self:SetGradeLevel(Content.Count)
    self:SetStars(not Content.bNotShowStar and 0 or nil, true)
    ModPolarity = ModDataInfo.Polarity
    ModCost = ModDataInfo.Cost
  end
  UResourceLibrary.LoadObjectAsync(self, ModDataInfo.Icon, {
    self,
    function(_, Icon)
      if not Icon then
        Icon = LoadObject("Texture2D'/Game/UI/Texture/Dynamic/Image/Head/Monster/T_Head_Empty.T_Head_Empty'")
        DebugPrint(ErrorTag, string.format("Mod%s\230\178\161\230\156\137\233\133\141\231\189\174\229\155\190\230\160\135\230\136\150\232\128\133\231\148\168\233\148\153\229\155\190\230\160\135\232\183\175\229\190\132\228\186\134\239\188\129\239\188\129\239\188\129\232\191\153\233\135\140\231\148\168\233\187\152\232\174\164\231\154\132\229\155\190\230\160\135\233\161\182\228\184\128\228\184\139\n \232\161\168\233\135\140\233\133\141\231\154\132\233\148\153\232\183\175\229\190\132\230\152\175\239\188\154%s", ModId, ModDataInfo.Icon))
      end
      self:SetIcon(Icon)
    end
  })
  self:SetName(GText(ModDataInfo.Name), (Mod and Mod.Level or 0) >= ModDataInfo.MaxLevel)
  self:SetIsNew(Content.IsNew)
  if "Mod" == Content.StuffType then
    self:SetIsEquipped(Content.IsEquipped)
    self:SetName(Content.Count)
    self.GradeLevel:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
  self:SetRarity(Content.Rarity)
  if Content.OnUpdateModItem then
    Content.OnUpdateModItem(self, Content, Mod)
  end
  self:SetIsChosen(Content.IsChosen)
end

function WBP_CommonItemSubsize_C:UpdateCharItem(Content)
  self:SetAttrIcon(Content.AttrIcon)
  self:SetIsEquipped(Content.IsEquipped)
  if Content.bHideItemLevel then
    self:SetName(Content.UnitName)
    self:SetIsOwned(Content.IsOwned)
  else
    self:SetLevel(Content.Level)
    self:SetIsLock(Content.IsLocked)
  end
  self:SetIcon(Content.Icon)
  self:SetReddot(Content.IsNew, Content.Upgradeable)
  self:SetRarity(Content.Rarity)
  self:SetWeaponGradeLevel(nil)
end

function WBP_CommonItemSubsize_C:UpdateSkinItem(Content)
  self:SetIsEquipped(Content.IsEquipped)
  self:SetIcon(Content.Icon)
  self:SetRarity(Content.Rarity)
end

function WBP_CommonItemSubsize_C:UpdateWeaponItem(Content)
  self:SetAttrIcon(Content.AttrIcon)
  self:SetIsEquipped(Content.IsEquipped)
  if Content.bHideItemLevel then
    self:SetName(Content.UnitName)
    self:SetIsOwned(Content.IsOwned)
  else
    self:SetLevel(Content.Level)
    self:SetIsLock(Content.IsLocked)
  end
  self:SetIcon(Content.Icon)
  self:SetReddot(Content.IsNew, Content.Upgradeable)
  if Content.StuffType ~= "Weapon" then
    self:SetCount(Content.Count)
  end
  self:SetWeaponPhantomIcon(Content.Uuid)
  self:SetRarity(Content.Rarity)
  self:SetIsChosen(Content.IsChosen)
  self:SetWeaponGradeLevel(Content.GradeLevel)
end

function WBP_CommonItemSubsize_C:UpdateNpcItem(Content)
  self:SetIcon(Content.Icon)
  self:SetIsSetted(Content.IsSetted, Content.SettedTipText)
  self.Bg04:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self:SetRarity(Content.Rarity)
  self:SetReddot(false, Content.Upgradeable)
end

function WBP_CommonItemSubsize_C:UpdateCharAccessoryItem(Content)
  self:SetIsSetted(Content.IsEquipped, GText("UI_Accessory_Equipped"))
  self:SetIcon(Content.Icon)
  self:SetReddot(Content.IsNew, Content.Upgradeable)
  self:SetIsLock_Middle(Content.IsLocked)
  self:SetWeaponPhantomIcon(Content.Uuid)
  self:SetRarity(Content.Rarity)
end

function WBP_CommonItemSubsize_C:UpdateWeaponAccessoryItem(Content)
  self:SetIsSetted(Content.IsEquipped, GText("UI_Accessory_Equipped"))
  self:SetIcon(Content.Icon)
  self:SetReddot(Content.IsNew, Content.Upgradeable)
  self:SetIsLock_Middle(Content.IsLocked)
  self:SetWeaponPhantomIcon(Content.Uuid)
  self:SetRarity(Content.Rarity)
end

function WBP_CommonItemSubsize_C:UpdatePetItem(Content)
  self:SetIsEquipped(Content.IsEquipped)
  self:SetIcon(Content.Icon)
  self:SetReddot(Content.IsNew, Content.Upgradeable)
  self:SetIsLock(Content.IsLocked)
  self:SetRarity(Content.Rarity)
  self:SetLevel(Content.Level)
end

function WBP_CommonItemSubsize_C:UpdatePetEntryItem(Content)
  self:SetName(Content.UnitName)
  self:SetIsOwned(Content.IsOwned)
  self:SetIcon(Content.Icon)
  self:SetReddot(Content.IsNew)
  self:SetRarity(Content.Rarity)
  self:SetIsSelected(Content.IsSelected)
end

function WBP_CommonItemSubsize_C:UpdateWalnutItem(Content)
  self:SetIcon(Content.Icon)
  self:SetReddot(Content.IsNew, Content.Upgradeable)
  self:SetRarity(Content.Rarity)
  self:SetWalnutNumber(Content.WalnutNumber)
  self.VerticalBox_NameLevelNum:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  self:SetCount(Content.Count)
  self:SetWalnutRealChoice(Content.IsWalnutRealChoice)
  if type(Content.Count) == "number" then
    self:SetItemGrey(Content.Count)
  end
end

function WBP_CommonItemSubsize_C:UpdateDispatchAgentItem(Content)
  self.Id = Content.Id
  self.Uuid = Content.Uuid
  self.Owner = Content.Owner
  self.State = Content.State
  if -1 == self.Id then
    self.Item.Switch_Type:SetActiveWidgetIndex(1)
    return
  end
  self.Content = Content
  local IsChoose = self.Parent.ChooseAgentList[self.Uuid] and true or false
  self.IsChoose = IsChoose
  local CharInfo = DataMgr.Char[self.Id]
  self:SetMinusBtn(true, self.Parent, Content.MinusBtn)
  self:SetIcon(CharInfo.Icon)
  self:SetRarity(CharInfo.CharRarity)
  if 2 == self.State then
    self:SetDispatchAgent(self.State, GText("UI_Disptach_Agent_State_Doing"))
  elseif 1 == self.State then
    self:SetDispatchAgent(self.State, GText("UI_Disptach_Agent_State_Busy"))
  else
    self:SetDispatchAgent(self.State, nil)
  end
  if self.IsChoose then
    local Info = self.Set:GetChildAt(0)
    Info.Img_Mask:SetVisibility(ESlateVisibility.Visible)
    Info.TipText:SetVisibility(ESlateVisibility.Visible)
    Info.TipText:SetText(GText("UI_Disptach_Chosen"))
    self.Minus:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  else
    self.Minus:SetVisibility(ESlateVisibility.Collapsed)
  end
  self.VerticalBox_NameLevelNum:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self.WBox_Ability:ClearChildren()
  self:AddAbility(self.Uuid)
end

function WBP_CommonItemSubsize_C:UpdateFishingRodItem(Content)
  self:SetIsLock(Content.IsLocked)
  self:SetIcon(Content.Icon)
  self:SetCount(Content.Count)
  self:SetIsChosen(Content.IsChosen)
  self:SetRarity(Content.Rarity)
  self:SetLevel(Content.Level)
end

function WBP_CommonItemSubsize_C:SetItemGrey(Count)
  if nil == Count then
    return
  end
  local bShowGrey = Count <= 0
  if bShowGrey then
    self.Bg04:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.Num:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self:SetRenderOpacity(0.6)
  else
    self.Bg04:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    self.Num:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    self:SetRenderOpacity(1.0)
  end
end

function WBP_CommonItemSubsize_C:SetPhantomWeaponIcon(UnitId, IsPhantom)
  local Avatar = GWorld:GetAvatar()
  local resource = Avatar.Resources[UnitId]
  local bShow = IsPhantom
  local WeaponUuid = resource and resource.WeaponUuid
  if bShow then
    self.Phantom:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    if not self.PhantomWidget then
      self.PhantomWidget = Utils.UIManager(self):CreateWidget("/Game/UI/UI_PC/Common/Item_Subsize_Widget/Common_Item_Subsize_Phantom_PC.Common_Item_Subsize_Phantom_PC", false)
      self.Phantom:ClearChildren()
      self.Phantom:AddChild(self.PhantomWidget)
    end
    local Icon
    if WeaponUuid then
      local Weapon = Avatar.Weapons[WeaponUuid]
      if Weapon then
        Icon = LoadObject(DataMgr.Weapon[Weapon.WeaponId].Icon)
      end
    end
    self.PhantomWidget:SetWeaponIcon(Icon)
    self.PhantomWidget.Switch_Type:SetActiveWidgetIndex(0)
  else
    self.Phantom:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
end

function WBP_CommonItemSubsize_C:SetWeaponPhantomIcon(_Uuid)
  local Avatar = GWorld:GetAvatar()
  local Uuid = _Uuid
  local Weapon = Uuid and Avatar.Weapons[Uuid]
  if not Weapon then
    Uuid = CommonUtils.Str2ObjId(_Uuid)
    Weapon = Avatar.Weapons[Uuid]
  end
  local AssisterId = Weapon and Weapon.AssisterId
  if AssisterId and DataMgr.Resource[AssisterId] then
    self.Phantom:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    if not self.PhantomWidget then
      self.PhantomWidget = Utils.UIManager(self):CreateWidget("/Game/UI/UI_PC/Common/Item_Subsize_Widget/Common_Item_Subsize_Phantom_PC.Common_Item_Subsize_Phantom_PC", false)
      self.Phantom:ClearChildren()
      self.Phantom:AddChild(self.PhantomWidget)
    end
    local CharId = DataMgr.Resource[AssisterId].UseParam
    if CharId and DataMgr.BattleChar[CharId] then
      self.PhantomWidget.Switch_Type:SetActiveWidgetIndex(1)
      local MiniIconPath = "Texture2D'/Game/UI/Texture/Dynamic/Image/Head/Mini/"
      local PhantomGuideIconImg = "T_Normal_" .. DataMgr.BattleChar[CharId].GuideIconImg
      local IconImage = LoadObject(MiniIconPath .. PhantomGuideIconImg .. "." .. PhantomGuideIconImg .. "'")
      self.PhantomWidget:SetCharIcon(IconImage)
    else
      self.Phantom:SetVisibility(UE4.ESlateVisibility.Collapsed)
    end
  else
    self.Phantom:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
end

function WBP_CommonItemSubsize_C:SetPhantomIconInWeaponItem(Id)
  if Id then
    self.Phantom:SetVisibility(UE4.ESlateVisibility.Visibility)
    if not self.PhantomWidget then
      self.PhantomWidget = Utils.UIManager(self):CreateWidget("/Game/UI/UI_PC/Common/Item_Subsize_Widget/Common_Item_Subsize_Phantom_PC.Common_Item_Subsize_Phantom_PC", false)
      self.Phantom:ClearChildren()
      self.Phantom:AddChild(self.PhantomWidget)
    end
    self.PhantomWidget.Switch_Type:SetActiveWidgetIndex(1)
    local MiniIconPath = "Texture2D'/Game/UI/Texture/Dynamic/Image/Head/Mini/"
    local PhantomGuideIconImg = "T_Normal_" .. DataMgr.BattleChar[Id].GuideIconImg
    local IconImage = LoadObject(MiniIconPath .. PhantomGuideIconImg .. "." .. PhantomGuideIconImg .. "'")
    self.PhantomWidget:SetCharIcon(IconImage)
  else
    self.Phantom:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
end

function WBP_CommonItemSubsize_C:PlayPhantomJitterAnim()
  if IsValid(self.PhantomWidget) then
    self.PhantomWidget:PlayJitterAnim()
  end
end

function WBP_CommonItemSubsize_C:SetIcon(Icon)
  local IconDynaMaterial = self.Img_Item:GetDynamicMaterial()
  if IconDynaMaterial then
    if type(Icon) == "string" then
      if self.bSyncLoadIcon then
        IconDynaMaterial:SetTextureParameterValue("IconMap", LoadObject(Icon))
      else
        IconDynaMaterial:SetTextureParameterValue("IconMap", self.LoadingIcon)
        self:LoadTextureAsync(Icon, function(Texture)
          if Texture then
            local __IconDynaMaterial = self.Img_Item:GetDynamicMaterial()
            if __IconDynaMaterial then
              __IconDynaMaterial:SetTextureParameterValue("IconMap", Texture)
            end
          end
        end, "LoadIcon")
      end
    else
      IconDynaMaterial:SetTextureParameterValue("IconMap", Icon)
    end
  end
end

function WBP_CommonItemSubsize_C:LoadTextureAsync(TexturePath, cb, TaskName)
  rawset(self, "LoadResourceID", nil)
  local Handle = UE.UResourceLibrary.LoadObjectAsyncWithId(self, TexturePath, {
    self,
    function(self, Texture, ResourceID)
      if not IsValid(self) or nil ~= ResourceID and rawget(self, "LoadResourceID") ~= ResourceID then
        return
      end
      cb(Texture)
    end
  })
  if Handle then
    rawset(self, "LoadResourceID", Handle.ResourceID)
  end
end

function WBP_CommonItemSubsize_C:SetLevel(Level)
  if not Level then
    self.Level:SetVisibility(UE4.ESlateVisibility.Collapsed)
    return
  end
  if not self.LevelWidget then
    self.LevelWidget = Utils.UIManager(self):CreateWidget("/Game/UI/UI_PC/Common/Item_Subsize_Widget/Common_Item_Subsize_Level_PC.Common_Item_Subsize_Level_PC", false)
    self.Level:ClearChildren()
    self.Level:AddChild(self.LevelWidget)
  end
  self.Bg03:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self.LevelWidget.Text_Lv_1:SetText(GText("UI_LEVEL_NAME"))
  self.LevelWidget.Text_Lv:SetText(Level)
  self.Level:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
end

function WBP_CommonItemSubsize_C:SetWeaponGradeLevel(GradeLevel)
  if GradeLevel and GradeLevel > 0 then
    if not self.WeaponCardLevelWidget then
      self.WeaponCardLevelWidget = Utils.UIManager(self):CreateWidget("/Game/UI/UI_PC/Common/Item_Subsize_Widget/Common_Item_Subsize_WeaponCardLevel_PC.Common_Item_Subsize_WeaponCardLevel_PC", false)
      self.WeaponCardLevel:ClearChildren()
      self.WeaponCardLevel:AddChild(self.WeaponCardLevelWidget)
    end
    local Data = DataMgr.WeaponCardLevel[self.UnitId]
    local MaxGradeLevel = Data and Data.CardLevelMax or 0
    if GradeLevel >= MaxGradeLevel then
      self.WeaponCardLevelWidget:SetMaxLevelColor()
    else
      self.WeaponCardLevelWidget:SetNormalColor()
    end
    self.WeaponCardLevelWidget.Text_Level:SetText(GradeLevel)
    self.WeaponCardLevel:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  else
    self.WeaponCardLevel:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

function WBP_CommonItemSubsize_C:SetCount(Count)
  if not Count then
    self.Num:SetVisibility(UE4.ESlateVisibility.Collapsed)
    return
  end
  if not Utils.IsValid(self.NumWidget) then
    self.NumWidget = Utils.UIManager(self):CreateWidget("/Game/UI/UI_PC/Common/Item_Subsize_Widget/Common_Item_Subsize_Number_PC.Common_Item_Subsize_Number_PC", false)
    self.Num:ClearChildren()
    self.Num:AddChild(self.NumWidget)
  end
  self.NumWidget.Text_Num:SetText(Count)
  self.Num:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
end

function WBP_CommonItemSubsize_C:SetWalnutNumber(WalnutNumber)
  if WalnutNumber then
    if not IsValid(self.WalnutNumberWidget) then
      self.WalnutNumberWidget = Utils.UIManager(self):CreateWidget("/Game/UI/UI_PC/Common/Item_Subsize_Widget/Common_Item_Subsize_WalnutNum.Common_Item_Subsize_WalnutNum", false)
      self.Walnut_Num:ClearChildren()
      self.Walnut_Num:AddChild(self.WalnutNumberWidget)
    end
    local Num, NumWidget
    for i = 3, 1, -1 do
      Num = WalnutNumber % 10
      WalnutNumber = WalnutNumber // 10
      NumWidget = self.WalnutNumberWidget["Num_" .. i]
      NumWidget:SetText(Num)
      if Num > 0 then
        NumWidget:SetColorAndOpacity(self.WalnutNumberWidget.ActiveColor)
      else
        NumWidget:SetColorAndOpacity(self.WalnutNumberWidget.NormalColor)
      end
    end
    self.Walnut_Num:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  else
    self.Walnut_Num:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

function WBP_CommonItemSubsize_C:SetStars(CurrentLevel, bUsePlus)
  if nil == bUsePlus then
    bUsePlus = true
  end
  if not CurrentLevel or CurrentLevel <= 0 then
    self.Star:SetVisibility(UE4.ESlateVisibility.Collapsed)
    return
  end
  if not self.StarWidget then
    self.StarWidget = Utils.UIManager(self):CreateWidget("/Game/UI/UI_PC/Common/Item_Subsize_Widget/Common_Item_Subsize_Star_PC.Common_Item_Subsize_Star_PC", false)
    self.Star:ClearChildren()
    self.Star:AddChild(self.StarWidget)
  end
  self:UpdateStarWidget(CurrentLevel, bUsePlus)
  self.Star:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
end

function WBP_CommonItemSubsize_C:SetStarsInBagSell(Content, bUsePlus)
  local ModDataInfo = DataMgr.Mod[self.UnitId]
  if nil == ModDataInfo or nil == self.StarWidgetInSell then
    return
  end
  local MaxLevel = tonumber(ModDataInfo.MaxLevel)
  local CurrentLevel = self.CurrentLevel
  if not CurrentLevel or CurrentLevel <= 0 then
    self.Star_Sell:SetVisibility(UE4.ESlateVisibility.Collapsed)
    return
  end
  if MaxLevel <= CurrentLevel then
    self.StarWidgetInSell.Text_Plus:SetFont(self.StarWidgetInSell.Font_Max)
    self.StarWidgetInSell.Text_StarLevel:SetFont(self.StarWidgetInSell.Font_Max)
    self.StarWidgetInSell.Text_Plus:SetColorAndOpacity(self.StarWidgetInSell.Color_Max)
    self.StarWidgetInSell.Text_StarLevel:SetColorAndOpacity(self.StarWidgetInSell.Color_Max)
  else
    self.StarWidgetInSell.Text_Plus:SetFont(self.StarWidgetInSell.Font_Normal)
    self.StarWidgetInSell.Text_StarLevel:SetFont(self.StarWidgetInSell.Font_Normal)
    self.StarWidgetInSell.Text_Plus:SetColorAndOpacity(self.StarWidgetInSell.Color_Normal)
    self.StarWidgetInSell.Text_StarLevel:SetColorAndOpacity(self.StarWidgetInSell.Color_Normal)
  end
  self.StarWidgetInSell.Text_Plus:SetText(bUsePlus and "+" or GText("UI_LEVEL_NAME"))
  self.StarWidgetInSell.Text_StarLevel:SetText(CurrentLevel)
end

function WBP_CommonItemSubsize_C:UpdateStarWidget(CurrentLevel, bUsePlus)
  local ModDataInfo = DataMgr.Mod[self.UnitId]
  if nil == ModDataInfo then
    return
  end
  local MaxLevel = tonumber(ModDataInfo.MaxLevel)
  if CurrentLevel >= MaxLevel then
    self.StarWidget.Text_Plus:SetFont(self.StarWidget.Font_Max)
    self.StarWidget.Text_StarLevel:SetFont(self.StarWidget.Font_Max)
    self.StarWidget.Text_Plus:SetColorAndOpacity(self.StarWidget.Color_Max)
    self.StarWidget.Text_StarLevel:SetColorAndOpacity(self.StarWidget.Color_Max)
  else
    self.StarWidget.Text_Plus:SetFont(self.StarWidget.Font_Normal)
    self.StarWidget.Text_StarLevel:SetFont(self.StarWidget.Font_Normal)
    self.StarWidget.Text_Plus:SetColorAndOpacity(self.StarWidget.Color_Normal)
    self.StarWidget.Text_StarLevel:SetColorAndOpacity(self.StarWidget.Color_Normal)
  end
  self.StarWidget.Text_Plus:SetText(bUsePlus and "+" or GText("UI_LEVEL_NAME"))
  self.StarWidget.Text_StarLevel:SetText(CurrentLevel)
end

function WBP_CommonItemSubsize_C:SetIsSelected(IsSelected, bPlayClick)
  if nil == bPlayClick then
    bPlayClick = true
  end
  self.IsSelected = IsSelected
  self:OnSelectedChanged(IsSelected, bPlayClick)
  if self._OnSelectedChanged then
    self._OnSelectedChanged(self, IsSelected)
  end
end

function WBP_CommonItemSubsize_C:SetIsChosen(IsChosen)
  if IsChosen then
    if not self.SelectWidget then
      self.SelectWidget = Utils.UIManager(self):CreateWidget("/Game/UI/UI_PC/Common/Item_Subsize_Widget/Common_Item_Subsize_Select_PC.Common_Item_Subsize_Select_PC_C", false)
      self.Select:ClearChildren()
      self.Select:AddChild(self.SelectWidget)
    end
    self.Select:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  else
    self.Select:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

function WBP_CommonItemSubsize_C:ShowCorner(IsShow)
  if IsShow then
    self.Icon_Corner:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  else
    self.Icon_Corner:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

function WBP_CommonItemSubsize_C:BP_OnEntryReleased()
  if self.Content then
    self.Content.UI = nil
  end
  self:PlayAnimation(self.Normal)
end

function WBP_CommonItemSubsize_C:SetAttrIcon(AttrIcon)
  if not AttrIcon then
    self.Attribute:SetVisibility(UE4.ESlateVisibility.Collapsed)
    return
  end
  if not self.AttrIconWidget then
    self.AttrIconWidget = Utils.UIManager(self):CreateWidget("/Game/UI/UI_PC/Common/Item_Subsize_Widget/Common_Item_Subsize_Attribute_PC.Common_Item_Subsize_Attribute_PC", false)
    self.Attribute:ClearChildren()
    self.Attribute:AddChild(self.AttrIconWidget)
  end
  if AttrIcon then
    if type(AttrIcon) == "string" then
      self.AttrIconWidget.Attribute:SetBrushResourceObject(LoadObject(AttrIcon))
    else
      self.AttrIconWidget.Attribute:SetBrushResourceObject(AttrIcon)
    end
    self.Attribute:SetVisibility(UE4.ESlateVisibility.HitTestInvisible)
  else
    self.Attribute:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
end

function WBP_CommonItemSubsize_C:SetIsEquipped(IsEquipped)
  if not self.IsEquippedWidget then
    self.IsEquippedWidget = Utils.UIManager(self):CreateWidget("/Game/UI/UI_PC/Common/Item_Subsize_Widget/Common_Item_Subsize_InGear_PC.Common_Item_Subsize_InGear_PC", false)
    self.InGear:ClearChildren()
    self.InGear:AddChild(self.IsEquippedWidget)
  end
  if IsEquipped then
    self.InGear:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  else
    self.InGear:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
end

function WBP_CommonItemSubsize_C:SetRarity(Rarity)
  if not Rarity or Rarity < 1 or Rarity > 5 then
    self.Switch_Style:SetActiveWidgetIndex(1)
    self.Panel_QualityLine:SetVisibility(UE4.ESlateVisibility.Collapsed)
    if self.NameWidget and self.Name:GetVisibility() == UE4.ESlateVisibility.SelfHitTestInvisible or self.LevelWidget and self.Level:GetVisibility() == UE4.ESlateVisibility.SelfHitTestInvisible or self.NumWidget and self.Num:GetVisibility() == UE4.ESlateVisibility.SelfHitTestInvisible then
      self.VerticalBox_NameLevelNum:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
      self.Spacer_Switch:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    else
      self.VerticalBox_NameLevelNum:SetVisibility(UE4.ESlateVisibility.Collapsed)
      self.Spacer_Switch:SetVisibility(UE4.ESlateVisibility.Collapsed)
    end
    return
  end
  self.VerticalBox_NameLevelNum:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  self.Spacer_Switch:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self.Switch_Style:SetActiveWidgetIndex(0)
  self.Panel_QualityLine:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  if not self.RarityWidget then
    self.RarityWidget = Utils.UIManager(self):CreateWidget("/Game/UI/UI_PC/Common/Item_Subsize_Widget/Common_Item_Subsize_Quality_PC.Common_Item_Subsize_Quality_PC", false)
    self.Quality:ClearChildren()
    self.Quality:AddChild(self.RarityWidget)
  end
  if self.RarityWidget then
    self.RarityWidget.Img_Quality:SetBrushTintColor(self.RarityWidget["Color_" .. Rarity])
  end
  local RarityLine = LoadObject("/Game/UI/UI_PNG/Common/Deco/Deco_Quality_" .. UIConst.RarityColorName[Rarity] .. ".Deco_Quality_" .. UIConst.RarityColorName[Rarity])
  self.Img_Line:SetBrushResourceObject(RarityLine)
  if self.IsEquippedWidget then
    self.IsEquippedWidget.Img_InGear:SetBrushResourceObject(RarityLine)
  end
end

function WBP_CommonItemSubsize_C:SetIsLock(IsLock)
  if not self.IsLockWidget then
    self.IsLockWidget = Utils.UIManager(self):CreateWidget("/Game/UI/UI_PC/Common/Item_Subsize_Widget/Common_Item_Subsize_Lock_PC.Common_Item_Subsize_Lock_PC", false)
    self.Lock:ClearChildren()
    self.Lock:AddChild(self.IsLockWidget)
  end
  if IsLock then
    self.Lock:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  else
    self.Lock:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
end

function WBP_CommonItemSubsize_C:SetIsLock_Middle(IsLock)
  if not self.IsLockWidget_Middle then
    self.IsLockWidget_Middle = Utils.UIManager(self):CreateWidget("/Game/UI/UI_PC/Common/Item_Subsize_Widget/Common_Item_Subsize_NotUnLocked_PC.Common_Item_Subsize_NotUnLocked_PC", false)
    self.NotUnLocked:ClearChildren()
    self.NotUnLocked:AddChild(self.IsLockWidget_Middle)
  end
  if IsLock then
    self.NotUnLocked:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  else
    self.NotUnLocked:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
end

function WBP_CommonItemSubsize_C:SetIsOwned(IsOwned)
  if not self.IsOwnedWidget then
    self.IsOwnedWidget = Utils.UIManager(self):CreateWidget("/Game/UI/UI_PC/Common/Item_Subsize_Widget/Common_Item_Subsize_NotUnLocked_PC.Common_Item_Subsize_NotUnLocked_PC", false)
    self.IsOwnedWidget.Icon_Locked:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.NotUnLocked:ClearChildren()
    self.NotUnLocked:AddChild(self.IsOwnedWidget)
  end
  if IsOwned then
    self.NotUnLocked:SetVisibility(UE4.ESlateVisibility.Collapsed)
  else
    self.NotUnLocked:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  end
end

function WBP_CommonItemSubsize_C:SetIsNew(IsNew)
  if not self.IsNew_Widget then
    self.IsNew_Widget = Utils.UIManager(self):CreateWidget("/Game/UI/UI_PC/Common/Item_Subsize_Widget/Common_Item_Subsize_New_PC.Common_Item_Subsize_New_PC", false)
    self.New:ClearChildren()
    self.New:AddChild(self.IsNew_Widget)
  end
  if IsNew then
    self.New:SetVisibility(UE4.ESlateVisibility.HitTestInvisible)
  else
    self.New:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
  self.Reddot:SetVisibility(UE4.ESlateVisibility.Collapsed)
end

function WBP_CommonItemSubsize_C:SetReddot(IsNew, Upgradeable, Ohter)
  if IsNew then
    self:SetIsNew(IsNew)
    return
  end
  self.New:SetVisibility(UE4.ESlateVisibility.Collapsed)
  if not self.ReddotWidget then
    self.ReddotWidget = Utils.UIManager(self):CreateWidget("/Game/UI/UI_PC/Common/Item_Subsize_Widget/Common_Item_Subsize_Reddot_PC.Common_Item_Subsize_Reddot_PC", false)
    self.Reddot:ClearChildren()
    self.Reddot:AddChild(self.ReddotWidget)
  end
  if Upgradeable then
    self.ReddotWidget:SetReddotStyle(0)
    self.Reddot:SetVisibility(UE4.ESlateVisibility.HitTestInvisible)
  else
    self.Reddot:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
end

function WBP_CommonItemSubsize_C:SetGradeLevel(GradeLevel)
  if not self.GradeLevelWidget then
    self.GradeLevelWidget = Utils.UIManager(self):CreateWidget("/Game/UI/UI_PC/Common/Item_Subsize_Widget/Common_Item_Subsize_GradeLevel_PC.Common_Item_Subsize_GradeLevel_PC", false)
    self.GradeLevel:ClearChildren()
    self.GradeLevel:AddChild(self.GradeLevelWidget)
  end
  if GradeLevel and GradeLevel > 1 then
    self.GradeLevelWidget.Text_GradeLevel:SetText(GradeLevel)
    self.GradeLevel:SetVisibility(UE4.ESlateVisibility.HitTestInvisible)
  else
    self.GradeLevel:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
end

function WBP_CommonItemSubsize_C:SetPolarity(Polarity, Cost)
  if not Polarity or not Cost then
    return
  end
  if not self.PolarityWidget then
    self.PolarityWidget = Utils.UIManager(self):CreateWidget("/Game/UI/UI_PC/Common/Item_Subsize_Widget/Common_Item_Subsize_Polarity_PC.Common_Item_Subsize_Polarity_PC", false)
    self.Polarity:ClearChildren()
    self.Polarity:AddChild(self.PolarityWidget)
  end
  self.PolarityWidget.Icon_Polarity:SetVisibility(UIConst.VisibilityOp.Collapsed)
  if Polarity ~= CommonConst.NonePolarity then
    self.PolarityWidget.Icon_Polarity:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    local PolarityText = ModController:GetModel():GetPolarityText(Polarity)
    self.PolarityWidget.Icon_Polarity:SetText(PolarityText)
  end
  self.PolarityWidget.Text_Polarity:SetText(Cost)
  self.Polarity:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
end

function WBP_CommonItemSubsize_C:SetName(Name, IsMaxLevel)
  self.Bg03:SetVisibility(UE4.ESlateVisibility.Collapsed)
  if not self.NameWidget then
    self.NameWidget = Utils.UIManager(self):CreateWidget("/Game/UI/UI_PC/Common/Item_Subsize_Widget/Common_Item_Subsize_Name_PC.Common_Item_Subsize_Name_PC", false)
    self.Name:ClearChildren()
    self.Name:AddChild(self.NameWidget)
  end
  self.NameWidget.Name:SetText(Name)
  self.Name:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  if self.StarWidget then
    local NowFontSize = self.NameWidget.Name.Font.Size
    if IsMaxLevel then
      local OriginFontSize = self.StarWidget.Font_Max.Size
      self.StarWidget.Font_Max.Size = NowFontSize
      self.NameWidget.Name:SetFont(self.StarWidget.Font_Max)
      self.NameWidget.Name:SetColorAndOpacity(self.NameWidget.Color_Max)
      self.StarWidget.Font_Max.Size = OriginFontSize
    else
      local OriginFontSize = self.StarWidget.Font_Normal.Size
      self.StarWidget.Font_Normal.Size = NowFontSize
      self.NameWidget.Name:SetFont(self.StarWidget.Font_Normal)
      self.NameWidget.Name:SetColorAndOpacity(self.NameWidget.Color_Normal)
      self.StarWidget.Font_Normal.Size = OriginFontSize
    end
  end
  if IsMaxLevel then
    self.NameWidget.Name:SetColorAndOpacity(self.NameWidget.Color_Max)
  else
    self.NameWidget.Name:SetColorAndOpacity(self.NameWidget.Color_Normal)
  end
end

function WBP_CommonItemSubsize_C:SetIsSetted(IsSetted, SettedText)
  if not self.IsSettedWidget then
    self.IsSettedWidget = Utils.UIManager(self):CreateWidget("/Game/UI/UI_PC/Common/Item_Subsize_Widget/Common_Item_Subsize_Set_PC.Common_Item_Subsize_Set_PC", false)
    self.Set:ClearChildren()
    self.Set:AddChild(self.IsSettedWidget)
  end
  if SettedText then
    self.IsSettedWidget.TipText:SetText(SettedText)
  else
    self.IsSettedWidget.TipText:SetText(GText("UI_SHOWNPC_SETTLED"))
  end
  if IsSetted then
    self.Set:SetVisibility(UE4.ESlateVisibility.HitTestInvisible)
  else
    self.Set:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
end

function WBP_CommonItemSubsize_C:SetMinusBtn(bShow, Obj, Func)
  if bShow then
    if not self.MinusWidget then
      self.MinusWidget = Utils.UIManager(self):CreateWidget("/Game/UI/UI_PC/Common/Item_Subsize_Widget/Common_Item_Subsize_Minus_PC.Common_Item_Subsize_Minus_PC_C", false)
      self.Minus:ClearChildren()
      self.Minus:AddChild(self.MinusWidget)
    end
    self.Minus:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    self.MinusWidget.Button_Minus.OnClicked:Clear()
    self.MinusWidget.Button_Minus.OnClicked:Add(self, function()
      AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_minus", nil, nil)
      Func(Obj, self.Content)
    end)
  else
    self.Minus:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

function WBP_CommonItemSubsize_C:SetDispatchAgent(State, SettedText)
  self.Set:SetVisibility(UE4.ESlateVisibility.HitTestInvisible)
  if not self.IsSettedWidget then
    self.IsSettedWidget = Utils.UIManager(self):CreateWidget("/Game/UI/UI_PC/Common/Item_Subsize_Widget/Common_Item_Subsize_Set_PC.Common_Item_Subsize_Set_PC", false)
    self.Set:ClearChildren()
    self.Set:AddChild(self.IsSettedWidget)
  end
  if 1 == State then
    self.IsSettedWidget.TipText:SetText(SettedText)
    self.IsSettedWidget.TipText:SetVisibility(UE4.ESlateVisibility.Visible)
    self.IsSettedWidget.Img_Mask:SetVisibility(UE4.ESlateVisibility.Visible)
    self.IsSettedWidget.Bg_Mask:SetVisibility(UE4.ESlateVisibility.Visible)
  elseif 3 == State then
    self.IsSettedWidget.TipText:SetText(SettedText)
    self.IsSettedWidget.TipText:SetVisibility(UE4.ESlateVisibility.Visible)
    self.IsSettedWidget.Img_Mask:SetVisibility(UE4.ESlateVisibility.Visible)
    self.IsSettedWidget.Bg_Mask:SetVisibility(UE4.ESlateVisibility.Visible)
  else
    self.IsSettedWidget.TipText:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.IsSettedWidget.Img_Mask:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
end

function WBP_CommonItemSubsize_C:AddAbility(Uuid)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  local Char = Avatar.Chars[CommonUtils.Str2ObjId(Uuid)]
  self.AbilityList = Char:GetCurrentUnlockDispatchTag()
  for Type, Count in pairs(self.AbilityList) do
    for i = 1, Count do
      local TagInfo = DataMgr.CharDispatchTag[Type]
      local Path = "/Game/UI/WBP/Map/Widget/Dispatch/WBP_Map_Ability_S.WBP_Map_Ability_S"
      local Item = UIManager(self):CreateWidget(Path)
      Item.Icon_Ability:SetBrushResourceObject(LoadObject(TagInfo.Icon))
      self:SetColor(Item, TagInfo.DispatchTag)
      self.WBox_Ability:AddChildToWrapBox(Item)
    end
  end
end

function WBP_CommonItemSubsize_C:SetColor(Item, Type)
  local ColorName = UIUtils.GetDispathchColorNameByType(Type)
  if ColorName and Item["Color_BG_" .. ColorName] then
    Item.BG:SetColorAndOpacity(Item["Color_BG_" .. ColorName])
  else
    Item:PlayAnimation(Item.Special)
  end
end

function WBP_CommonItemSubsize_C:InitAnimationVariables()
  self.InteractionAnimations = {
    [self.Normal] = "Normal",
    [self.hover] = "hover",
    [self.UnHover] = "UnHover",
    [self.Press] = "Press",
    [self.Click] = "Click",
    [self.Selected_Loop] = "Selected_Loop"
  }
  self.CurAnim = self.Normal
end

function WBP_CommonItemSubsize_C:TryPlayAnimation(Animation, ...)
  if self.CurAnim == Animation then
    return
  end
  self.PlayAnimParams = table.pack(...)
  local AnimToStop = self.CurAnim
  self.CurAnim = Animation
  if self:IsAnimationPlaying(AnimToStop) then
    self:StopAnimation(AnimToStop)
  elseif not self:IsAnimationPlaying(Animation) then
    self:PlayAnimation(Animation, ...)
  end
end

function WBP_CommonItemSubsize_C:OnAnimationFinished(Animation)
  if self.CurAnim == Animation then
    return
  end
  if self.InteractionAnimations[Animation] and not self:IsAnimationPlaying(self.CurAnim) then
    self:PlayAnimation(self.CurAnim, table.unpack(self.PlayAnimParams))
  end
end

function WBP_CommonItemSubsize_C:OnHoveredChanged(bHovered)
  self.bHovered = bHovered
  if self.IsSelected then
    return
  end
  if bHovered then
    if self.CurAnim == self.hover then
      return
    end
    self:TryPlayAnimation(self.hover)
  else
    self:TryPlayAnimation(self.UnHover)
  end
end

function WBP_CommonItemSubsize_C:OnPressedChanged(bPressed)
  self.bPressed = bPressed
  if self.IsSelected then
    return
  end
  if bPressed then
    self:TryPlayAnimation(self.Press)
  elseif self:IsHovered() then
    self:TryPlayAnimation(self.hover)
  else
    self:TryPlayAnimation(self.Normal)
  end
end

function WBP_CommonItemSubsize_C:OnSelectedChanged(bSelected, bPlayClick)
  if bSelected then
    if bPlayClick then
      self:TryPlayAnimation(self.Click)
    else
      self:TryPlayAnimation(self.Click, 0, 1, 0, 1000)
    end
  elseif self:IsHovered() then
    self:TryPlayAnimation(self.hover)
  else
    self:TryPlayAnimation(self.Normal)
  end
end

function WBP_CommonItemSubsize_C:OnSelectedLoopAnimFinished()
  self:CheckAndPlayCurrentAnim()
end

function WBP_CommonItemSubsize_C:OnUnHoverAnimFinished()
  self:CheckAndPlayCurrentAnim()
end

function WBP_CommonItemSubsize_C:CheckAndPlayCurrentAnim()
  if self.bPressed then
    self:TryPlayAnimation(self.Press)
  elseif self:IsHovered() then
    self:TryPlayAnimation(self.hover)
  else
    self:TryPlayAnimation(self.Normal)
  end
end

function WBP_CommonItemSubsize_C:OnMouseEnter(MyGeometry, MouseEvent)
  if not self.bInteractive then
    return
  end
  self:OnHoveredChanged(true)
  if not self.bEnableDrag then
    return
  end
  if self._OnMouseEnter then
    self._OnMouseEnter(self, self.Content)
  end
end

function WBP_CommonItemSubsize_C:OnMouseLeave(MouseEvent)
  if not self.bInteractive then
    return
  end
  self:OnHoveredChanged(false)
  if self.bPressed then
    self:OnPressedChanged(false)
  end
  if not self.bEnableDrag then
    return
  end
  if self._OnMouseLeave then
    self._OnMouseLeave(self, self.Content)
  end
end

function WBP_CommonItemSubsize_C:OnMenuOpenChanged(IsOpened)
  UIManager(self):SetIsMenuAnchorOpen(IsOpened)
  if self.ItemDetails_MenuAnchor.bAllowHover then
    return
  end
  if IsOpened then
    AudioManager(self):PlayUISound(self, "event:/ui/common/tip_show_click", nil, nil)
  end
  if self._MenuOpenChangedEvent then
    self._MenuOpenChangedEvent(self.Parent, IsOpened)
  end
  self:SetIsSelected(IsOpened)
end

function WBP_CommonItemSubsize_C:OnMouseButtonDown(MyGeometry, MouseEvent)
  DebugPrint(DebugTag, LXYTag, "WBP_CommonItemSubsize_C::Onmousebuttondown")
  CommonUtils:CloseGuideTouchIfExist(self)
  if self._OnMouseButtonDownEarly then
    local Reply = self._OnMouseButtonDownEarly(self, self.Content, MouseEvent)
    if Reply then
      return Reply
    end
  end
  if not self.bInteractive then
    return UE4.UWidgetBlueprintLibrary.Unhandled()
  end
  if UKismetInputLibrary.PointerEvent_IsMouseButtonDown(MouseEvent, EKeys.RightMouseButton) then
    return UE4.UWidgetBlueprintLibrary.Unhandled()
  end
  self.MouseDownPos = UE4.UKismetInputLibrary.PointerEvent_GetScreenSpacePosition(MouseEvent)
  self:OnPressedChanged(true)
  if self._MouseButtonDownEvent then
    self._MouseButtonDownEvent(self.Parent, self.Content, MouseEvent)
  end
  if self._OnMouseButtonDown then
    self._OnMouseButtonDown(self, self.Content)
  end
  if self.HandleMouseDown then
    return UE4.UWidgetBlueprintLibrary.Handled()
  end
  return UE4.UWidgetBlueprintLibrary.Unhandled()
end

function WBP_CommonItemSubsize_C:OnMouseCaptureLost()
  self:OnPressedChanged(false)
  self:OnHoveredChanged(false)
end

function WBP_CommonItemSubsize_C:OnMouseButtonUp(MyGeometry, MouseEvent)
  DebugPrint(DebugTag, LXYTag, "WBP_CommonItemSubsize_C::OnmousebuttonUp")
  self.MouseDownPos = nil
  if not self.bInteractive then
    return UE4.UWidgetBlueprintLibrary.Unhandled()
  end
  self:OnPressedChanged(false)
  AudioManager(self):PlayItemSound(self, self.UnitId, "Click", self.AudioType)
  if self._MouseButtonUpEvent then
    self._MouseButtonUpEvent(self.Parent, self.Content, MouseEvent)
  end
  if self._OnMouseButtonUp then
    self._OnMouseButtonUp(self, self.Content)
  end
  self.ItemDetails_MenuAnchor:OpenItemDetailsWidget(false)
  return UE4.UWidgetBlueprintLibrary.Unhandled()
end

function WBP_CommonItemSubsize_C:OnMouseMove(MyGeometry, MouseEvent)
  if self.bEnableDrag and self:HasMouseCapture() and self.MouseDownPos and UUIFunctionLibrary.HasTraveledFarEnoughToTriggerDrag(MouseEvent, self.MouseDownPos) then
    self.ItemDetails_MenuAnchor:SetAllowRetain(false)
    self:SetIsSelected(false)
    self.MouseDownPos = nil
    return UWidgetBlueprintLibrary.DetectDragIfPressed(MouseEvent, self, UE4.EKeys.LeftMouseButton)
  end
  return UE4.UWidgetBlueprintLibrary.Unhandled()
end

function WBP_CommonItemSubsize_C:OnTouchStarted(MyGeometry, InTouchEvent)
  CommonUtils:CloseGuideTouchIfExist(self)
  if not self.bInteractive then
    return UE4.UWidgetBlueprintLibrary.Unhandled()
  end
  if self._OnMouseEnter then
    self._OnMouseEnter(self, self.Content)
  end
  return self:OnMouseButtonDown(MyGeometry, InTouchEvent, true)
end

function WBP_CommonItemSubsize_C:OnTouchEnded(MyGeometry, InTouchEvent)
  if not self.bInteractive then
    return UE4.UWidgetBlueprintLibrary.Unhandled()
  end
  if self._OnMouseLeave then
    self._OnMouseLeave(self, self.Content)
  end
  return self:OnMouseButtonUp(MyGeometry, InTouchEvent, true)
end

function WBP_CommonItemSubsize_C:OnTouchMoved(MyGeometry, InTouchEvent)
  if self.bEnableDrag then
    self.ItemDetails_MenuAnchor:SetAllowRetain(false)
    self:SetIsSelected(false)
  end
  return UE4.UWidgetBlueprintLibrary.Unhandled()
end

function WBP_CommonItemSubsize_C:OnDragDetected(MyGeometry, PointerEvent)
  self:OnPressedChanged(false)
  if not self.bEnableDrag and not self._OnDragLeave then
    return
  end
  local DragDropOperation = NewObject(self.DragDropOperationClass)
  DragDropOperation.Payload = self.Content
  if self._CreateDragWidget then
    DragDropOperation.DefaultDragVisual = self._CreateDragWidget(self.Parent, self.Content)
  end
  if not DragDropOperation.DefaultDragVisual then
    return nil
  end
  DragDropOperation.Tag = "WBP_CommonItemSubsize_C"
  DragDropOperation.Pivot = self.DragPivot or UE4.EDragPivot.CenterCenter
  DragDropOperation.Offset = self.DragOffset or DragDropOperation.Offset
  if self.IsShowDetails then
    self.ItemDetails_MenuAnchor:CloseItemDetailsWidget()
  end
  return DragDropOperation
end

function WBP_CommonItemSubsize_C:OnDragLeave(PointerEvent, Operation)
  DebugPrint(LXYTag, "WBP_CommonItemSubsize_C::OnDragLeave")
  if Operation.Tag ~= "WBP_CommonItemSubsize_C" then
    return
  end
  if self._OnDragLeave then
    self._OnDragLeave(self.Parent, self.Content, PointerEvent, Operation.DefaultDragVisual)
  end
end

function WBP_CommonItemSubsize_C:OnDragEnter(MyGeometry, PointerEvent, Operation)
  if Operation.Tag ~= "WBP_CommonItemSubsize_C" then
    return
  end
  if self._OnDragEnter then
    self._OnDragEnter(self.Parent, self.Content)
  end
  if Operation.DefaultDragVisual then
    self:OnDragEnter_Lua(Operation.DefaultDragVisual)
  end
end

function WBP_CommonItemSubsize_C:OnDragCancelled(PointerEvent, Operation)
  if Operation.Tag ~= "WBP_CommonItemSubsize_C" then
    return
  end
  self:OnHoveredChanged(false)
  self:SetIsSelected(false)
  if self._OnDragCancelled then
    self._OnDragCancelled(self.Parent, self.Content, Operation, PointerEvent)
  end
  if Operation.DefaultDragVisual then
    self:OnDragCancel_Lua(Operation.DefaultDragVisual)
  end
end

function WBP_CommonItemSubsize_C:OnDragCancel_Lua(CreateDragUI)
  if not CreateDragUI.Content or CreateDragUI.IsCancel then
    return
  end
  CreateDragUI.IsDraging = false
end

function WBP_CommonItemSubsize_C:OnDragEnter_Lua(CreateDragUI)
  CreateDragUI.IsDraging = true
end

function WBP_CommonItemSubsize_C:SetEnableDrag(IsEnableDrag)
  self.bEnableDrag = IsEnableDrag
end

function WBP_CommonItemSubsize_C:ShowContentWarning(Text)
  if not self.Conflict then
    return
  end
  if not Text then
    self.Conflict:SetVisibility(UIConst.VisibilityOp.Collapsed)
  else
    local Widget = self.Conflict:GetChildAt(0)
    if not IsValid(Widget) then
      Widget = UIManager(self):CreateWidget("/Game/UI/UI_PC/Common/Item_Subsize_Widget/Common_Item_Subsize_Conflict_PC.Common_Item_Subsize_Conflict_PC")
      self.Conflict:AddChild(Widget)
      Widget.Panel_SoldOut:SetVisibility(UIConst.VisibilityOp.Visible)
    end
    self.Conflict:SetVisibility(UIConst.VisibilityOp.Visible)
    Widget.Text_SoldOut:SetText(Text)
  end
end

function WBP_CommonItemSubsize_C:ShowModStar(Mod)
  if not self.List_ModStar or not self.ModStar then
    return
  end
  if not Mod or not Mod:HasCardLevel() then
    self.ModStar:SetVisibility(UIConst.VisibilityOp.Collapsed)
  else
    self.ModStar:SetVisibility(UIConst.VisibilityOp.Visible)
    self.List_ModStar:ClearListItems()
    for i = 1, Mod.ModCardLevelMax do
      local StarContent = NewObject(UIUtils.GetCommonItemContentClass())
      StarContent.Idx = i
      StarContent.bActivate = i <= Mod.CurrentModCardLevel
      StarContent.bGolden = false
      self.List_ModStar:AddItem(StarContent)
    end
  end
end

function WBP_CommonItemSubsize_C:SetGetItemInfo(Rarity, Count)
  self.Name:SetVisibility(ESlateVisibility.Collapsed)
  self:SetCount(Count)
  if 1 == Rarity then
    self:PlayAnimation(self.GetItem_In_White)
  elseif 2 == Rarity then
    self:PlayAnimation(self.GetItem_In_Green)
  elseif 3 == Rarity then
    self:PlayAnimation(self.GetItem_In_Blue)
  elseif 4 == Rarity then
    self:PlayAnimation(self.GetItem_In_Purple)
  elseif 5 == Rarity then
    self:PlayAnimation(self.GetItem_In_Orange)
  end
  self.Attribute:SetVisibility(ESlateVisibility.Collapsed)
  self.Polarity:SetVisibility(ESlateVisibility.Collapsed)
  self.Star:SetVisibility(ESlateVisibility.Collapsed)
  self.Lock:SetVisibility(ESlateVisibility.Collapsed)
  self.Set:SetVisibility(ESlateVisibility.Collapsed)
  self.Minus:SetVisibility(ESlateVisibility.Collapsed)
  self.SelectNum:SetVisibility(ESlateVisibility.Collapsed)
  self.GradeLevel:SetVisibility(ESlateVisibility.Collapsed)
  self.New:SetVisibility(ESlateVisibility.Collapsed)
end

function WBP_CommonItemSubsize_C:OnAddedToFocusPath(InFocusEvent)
  if self._OnAddedToFocusPathEvent then
    self._OnAddedToFocusPathEvent(self.Parent, self)
  end
end

function WBP_CommonItemSubsize_C:OnRemovedFromFocusPath(InFocusEvent)
  if self._OnRemovedFromFocusPathEvent then
    self._OnRemovedFromFocusPathEvent(self.Parent, self)
  end
end

function WBP_CommonItemSubsize_C:IsMenuOpen()
  return self.IsShowDetails and self.ItemDetails_MenuAnchor.ItemDetailsMenuAnchor:IsOpen()
end

function WBP_CommonItemSubsize_C:OnCloseMenuAnchor(IsNeedMenuChangedCallback)
  if self:IsMenuOpen() then
    self.ItemDetails_MenuAnchor:CloseItemDetailsWidget()
    if IsNeedMenuChangedCallback then
      self.ItemDetails_MenuAnchor:InitMenuOpenChangedListen()
    end
    self.ItemDetails_MenuAnchor:CloseItemDetailsWidget()
  end
end

AssembleComponents(WBP_CommonItemSubsize_C)
return WBP_CommonItemSubsize_C
