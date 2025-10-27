require("UnLua")
local M = Class("BluePrints.UI.BP_UIState_C")

function M:Construct()
  self.BtnCD = 0.5
  self.Rarity2Color = {
    "Blue",
    "Purple",
    "Yellow"
  }
end

function M:OnListItemObjectSet(Content)
  Content.SelfWidget = self
  self:OnLoaded(Content.AwardInfo, Content.Parent, Content.NotHit)
end

function M:OnLoaded(...)
  local AwardInfo, Parent, NotHit = ...
  self.NotHit = NotHit
  if NotHit then
    self.Button_Select:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  end
  PrintTable(AwardInfo, 10)
  self.AwardType = AwardInfo.AwardType
  self.AwardId = AwardInfo.AwardId
  self.Parent = Parent
  self.AwardLevel = AwardInfo.AwardLevel
  self:PlayAnimation(self.Normal)
  self["WBP_Rouge" .. self.AwardType .. "ItemPart"]:OnLoaded(AwardInfo)
  self.IsSelected = false
  local AwardData, AwardDesc
  self.ExplanationId = nil
  if self.AwardType == "Blessing" then
    AwardData = DataMgr.RougeLikeBlessing
    AwardDesc = UIUtils.GenRougeBlessingDesc(self.AwardId, AwardInfo.AwardLevel or 0)
    local BlessingGroup = DataMgr.RougeLikeBlessing[self.AwardId].BlessingGroup
    local SuitName = DataMgr.BlessingGroup[BlessingGroup].Name
    self.Text_SuitTitle:SetText(GText(SuitName))
    self.ExplanationId = AwardData[self.AwardId].ExplanationId
  elseif self.AwardType == "Treasure" then
    AwardData = DataMgr.RougeLikeTreasure
    AwardDesc = UIUtils.GenRougeTreasureDesc(self.AwardId)
    self.ExplanationId = AwardData[self.AwardId].ExplanationId
  end
  if self.ExplanationId ~= nil and #self.ExplanationId > 0 then
    AwardDesc = UIUtils.GenRougeCombatTermDesc(AwardDesc, self.ExplanationId)
  end
  self.Text_Desc:SetText(AwardDesc)
  self.Button_Select.OnHovered:Add(self, self.OnBtnHover)
  self.Button_Select.OnClicked:Add(self, self.OnBtn_SelectClicked)
  self.Btn_Desc.OnClicked:Add(self, self.OnBtn_DescClicked)
  self.StartTime = UE4.UGameplayStatics.GetRealTimeSeconds(self)
  self.Rarity = AwardData[self.AwardId][self.AwardType .. "Rarity"]
  self.WidgetSwitcher_VX:SetActiveWidgetIndex(self.Rarity - 1)
  if self.AwardType == "Treasure" then
    self.Image_Sign:SetBrushResourceObject(self["Sign_" .. self.Rarity2Color[self.Rarity]])
    local TreasureNum = UIUtils.GetTreasureGroupNum(self.AwardId)
    local CurrentTreasureNum = UIUtils.GetCurrentTreasureGroupNum(self.AwardId)
    if self.Parent.ItemNum and 1 == self.Parent.ItemNum or self.NotHit then
      CurrentTreasureNum = CurrentTreasureNum + 1
      if CurrentTreasureNum == TreasureNum then
        self.Rouge_SuitSign:PlayAnimation(self.Rouge_SuitSign.Active)
      end
    end
    local Text = tostring(CurrentTreasureNum) .. "/" .. tostring(TreasureNum)
    local ItemInfo = DataMgr.TreasureGroup[DataMgr.RougeLikeTreasure[self.AwardId].TreasureGroup]
    if ItemInfo then
      self.Rouge_SuitSign.Text_SuitTitle:SetText(Text)
      if ItemInfo.Icon then
        local IconObj = LoadObject(ItemInfo.Icon)
        assert(IconObj, "\230\156\170\230\137\190\229\136\176\229\175\185\229\186\148TreasureGroup\231\154\132Icon:" .. DataMgr.RougeLikeTreasure[self.AwardId].TreasureGroup)
        self.Rouge_SuitSign.Image_TitleIcon:SetBrushResourceObject(IconObj)
      else
        self.Rouge_SuitSign.Image_TitleIcon:SetVisibility(UIConst.VisibilityOp.Collapsed)
      end
      self.Rouge_SuitSign:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
      self.bShowSuitSign = true
    else
      self.Rouge_SuitSign:SetVisibility(UIConst.VisibilityOp.Collapsed)
      self.bShowSuitSign = false
    end
    self.Rouge_SuitSign.ItemDetails_MenuAnchor.ItemDetailsMenuAnchor.OnMenuOpenChanged:Remove(self, self.ItemMenuAnchorChanged)
    self.Rouge_SuitSign.ItemDetails_MenuAnchor.ItemDetailsMenuAnchor.OnMenuOpenChanged:Add(self, self.ItemMenuAnchorChanged)
    self.Rouge_SuitSign.Com_BtnQa:Init({
      OwnerWidget = self,
      ClickCallback = function()
        local TreasureGroupId = DataMgr.RougeLikeTreasure[self.AwardId].TreasureGroup
        if TreasureGroupId then
          TreasureNum = UIUtils.GetTreasureGroupNum(self.AwardId)
          CurrentTreasureNum = UIUtils.GetCurrentTreasureGroupNum(self.AwardId)
          local bActiveTreasure = false
          if TreasureNum == CurrentTreasureNum + 1 and (self.NotHit or self.IsSelected) then
            bActiveTreasure = true
          end
          local Content = {
            ItemType = "TreasureGroup",
            ItemId = TreasureGroupId,
            MenuPlacement = EMenuPlacement.MenuPlacement_MenuRight,
            bActive = bActiveTreasure
          }
          self.Rouge_SuitSign.ItemDetails_MenuAnchor:OpenItemDetailsWidget(false, Content)
        else
          DebugPrint("@@@ Rouge\230\178\161\230\137\190\229\136\176TreasureGroupId")
        end
      end
    })
  else
    self.BlessingBuffIcon:PlayAnimation(self.BlessingBuffIcon[self.Rarity2Color[self.Rarity]])
    UE.UResourceLibrary.LoadObjectAsync(self, AwardData[self.AwardId].TypeIcon, {
      self,
      M.OnBlessingBuffIconLoadFinish
    })
  end
  self:AddTimer(0.1, function()
    UIUtils.SetTextJustificationByLineCount(self.Text_Desc)
    self.Text_Desc:SetAutoWrapText(false)
  end)
  if not self.GameInputModeSubsystem then
    self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(self)
  end
  if self.NotHit then
    self.Key_Definition:CreateCommonKey({
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "A"}
      },
      Desc = GText("UI_CTL_Explain")
    })
  else
    self.Key_Definition:CreateCommonKey({
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "UP"}
      },
      Desc = GText("UI_CTL_Explain")
    })
  end
  self:UpdateCompadKeyDefinition(false)
  self.Super.OnLoaded(self, ...)
end

function M:ItemMenuAnchorChanged(bIsOpen)
  if not bIsOpen then
    self.Parent.bInSuitScroll = false
    self:SetFocus()
    if type(self.Parent.ShowTreasureSuitGamePadKey) == "function" then
      self.Parent:ShowTreasureSuitGamePadKey()
    end
  end
end

function M:OnBtnHover()
  if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
    self:AddDelayFrameFunc(function()
      self:SelectItem()
    end, 1)
  end
end

function M:OnBtn_SelectClicked()
  if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad and self.IsSelected == true then
    self.Parent:OnConfirmBtnClicked()
    return
  end
  self:SelectItem()
end

function M:OnBtn_DescClicked()
  if not self.IsSelected and self.Button_Select:GetVisibility() == UIConst.VisibilityOp.Visible then
    self:SelectItem()
    return
  end
  if self.ExplanationId == nil then
    print("lgc ExplanationId is nil")
    return
  end
  local DefinitionWidget = UIManager(self):LoadUINew("Rouge_Definition", self.ExplanationId)
  if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad and DefinitionWidget then
    DefinitionWidget.Button_Close:SetFocus()
  end
end

function M:SelectItem()
  DebugPrint("\230\163\128\230\181\139\229\136\176\232\162\171\233\128\137\228\184\173")
  if self:IsAnimationPlaying(self.Hover) then
    self:StopAnimation(self.Hover)
  end
  self.IsSelected = true
  self:PlayAnimationForward(self.Click)
  AudioManager(self):PlayUISound(self, "event:/ui/roguelike/choose_point_click", nil, nil)
  self.Parent:SelectItem(self.AwardId, self)
end

function M:UpdateCompadKeyDefinition(bShowGamepadKey)
  if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad and bShowGamepadKey and self.ExplanationId ~= nil and #self.ExplanationId > 0 then
    self.Key_Definition:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    return
  end
  if self.Key_Definition:GetVisibility() ~= ESlateVisibility.Collapsed then
    self.Key_Definition:SetVisibility(ESlateVisibility.Collapsed)
  end
end

function M:OnBtn_ConfirmClicked()
  self.CurrentTime = UE4.UGameplayStatics.GetRealTimeSeconds(self)
  DebugPrint("\230\163\128\230\181\139\229\136\176\230\140\137\233\148\174\230\140\137\228\184\139")
  if self.CurrentTime - self.StartTime < self.BtnCD then
    self:PlayAnimationForward(self.Normal)
    return
  end
  self.StartTime = UE4.UGameplayStatics.GetRealTimeSeconds(self)
  AudioManager(self):PlayUISound(self, "event:/ui/roguelike/choose_point_confirm", nil, nil)
  self.Parent:ChooseItem(self.AwardId, self)
end

function M:SwitchDesc(IsSimple)
  if self.AwardId == nil then
    return
  end
  local AwardData, AwardDesc
  if self.AwardType == "Blessing" then
    AwardData = DataMgr.RougeLikeBlessing
    AwardDesc = UIUtils.GenRougeBlessingSimpleDesc(self.AwardId)
    if not IsSimple or nil == AwardDesc then
      AwardDesc = UIUtils.GenRougeBlessingDesc(self.AwardId, self.AwardLevel or 0)
    end
  elseif self.AwardType == "Treasure" then
    AwardData = DataMgr.RougeLikeTreasure
    AwardDesc = UIUtils.GenRougeTreasureSimpleDesc(self.AwardId)
    if not IsSimple or nil == AwardDesc then
      AwardDesc = UIUtils.GenRougeTreasureDesc(self.AwardId)
    end
  end
  if nil == AwardDesc then
    Battle(self):ShowBattleError("\232\130\137\233\184\189" + self.AwardType + "\232\161\168\228\184\173Id\228\184\186" + tostring(self.AwardId)("\231\154\132\230\143\143\232\191\176\228\184\186\231\169\186"))
  end
  if nil ~= self.ExplanationId and #self.ExplanationId > 0 then
    AwardDesc = UIUtils.GenRougeCombatTermDesc(AwardDesc, self.ExplanationId)
  end
  self.Text_Desc:SetText(AwardDesc)
  if IsSimple then
    self["WBP_Rouge" .. self.AwardType .. "ItemPart"].Text_ArchiveSign:SetVisibility(UIConst.VisibilityOp.Collapsed)
  else
    self["WBP_Rouge" .. self.AwardType .. "ItemPart"].Text_ArchiveSign:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  end
end

function M:OnBlessingBuffIconLoadFinish(Object)
  if Object and IsValid(self) then
    self.BlessingBuffIcon.Image_BlessingBuffIcon:SetBrushResourceObject(Object)
  end
end

function M:OnKeyUp(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if InKeyName == Const.GamepadDPadUp then
    self:OnBtn_DescClicked()
  end
  return UE4.UWidgetBlueprintLibrary.Handled()
end

function M:OnFocusReceived(MyGeometry, InFocusEvent)
  if self.GameInputModeSubsystem and UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
    if self.Parent then
      if self.Parent.ChangeSelectItem then
        self.Parent:ChangeSelectItem(self)
      end
      self.Parent.CurrentSelectItem = self
      if self.Parent.OnItemSelected then
        self.Parent:OnItemSelected()
      end
      if self.Parent.ShowBottomGamePadKey then
        self.Parent:ShowBottomGamePadKey(true)
      end
    end
    self.GameInputModeSubsystem:SetTargetUIFocusWidget(self)
    self.GameInputModeSubsystem:UpdateCurrentFocusWidgetPos()
  end
  return M.Super.OnFocusReceived(self, MyGeometry, InFocusEvent)
end

function M:OnUpdateUIStyleByInputTypeChange(CurInputType, CurGamepadName)
  if CurInputType == ECommonInputType.Gamepad then
  end
end

return M
