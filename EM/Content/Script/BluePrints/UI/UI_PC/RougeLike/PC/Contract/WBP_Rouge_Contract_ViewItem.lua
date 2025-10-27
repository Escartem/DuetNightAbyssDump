local TimeUtils = require("Utils.TimeUtils")
local EMCache = require("EMCache.EMCache")
local WBP_Rouge_Contract_ViewItem = Class("BluePrints.UI.BP_UIState_C", "BluePrints.UI.BP_EMUserWidget_C")

function WBP_Rouge_Contract_ViewItem:Construct()
  self.Arrow_L.Btn.OnClicked:Clear()
  self.Arrow_L.Btn.OnClicked:Add(self, self.OnBtnDecreaseLevelClicked)
  self.Arrow_R.Btn.OnClicked:Clear()
  self.Arrow_R.Btn.OnClicked:Add(self, self.OnBtnIncreaseLevelClicked)
  self.Btn_Defintion.OnClicked:Clear()
  self.Btn_Defintion.OnClicked:Add(self, self.OnBtnDefintionClicked)
  self.Icon_Key_Decrease:CreateCommonKey({
    KeyInfoList = {
      {
        Type = "Img",
        ImgLongPath = UIUtils.UtilsGetKeyIconPathInGamepad("LB", self.CurGamepadName)
      }
    }
  })
  self.Icon_Key_Increase:CreateCommonKey({
    KeyInfoList = {
      {
        Type = "Img",
        ImgLongPath = UIUtils.UtilsGetKeyIconPathInGamepad("RB", self.CurGamepadName)
      }
    }
  })
  self:SetNavigationRuleCustom(UE4.EUINavigation.Up, {
    self,
    self.OnNavigateUp
  })
  self:SetNavigationRuleCustom(UE4.EUINavigation.Down, {
    self,
    self.OnNavigateDown
  })
end

function WBP_Rouge_Contract_ViewItem:InitKeyboardView()
  self.Arrow_L:SetVisibility(UE4.ESlateVisibility.Visible)
  self.Arrow_R:SetVisibility(UE4.ESlateVisibility.Visible)
  self.Btn_Defintion:SetVisibility(UE4.ESlateVisibility.Visible)
  self:ShowControllerIcon(false)
end

function WBP_Rouge_Contract_ViewItem:InitGamepadView()
  self.Arrow_L:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self.Arrow_R:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self.Btn_Defintion:SetVisibility(UE4.ESlateVisibility.Collapsed)
end

function WBP_Rouge_Contract_ViewItem:ShowControllerIcon(bShow)
  if bShow then
    self.Controller_Decrease:SetVisibility(UE4.ESlateVisibility.Visible)
    self.Controller_Increase:SetVisibility(UE4.ESlateVisibility.Visible)
    self:PlayAnimation(self.Hover)
  else
    self.Controller_Decrease:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.Controller_Increase:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self:PlayAnimation(self.Unhover)
  end
end

function WBP_Rouge_Contract_ViewItem:OnNavigateUp(Navigation)
  if self.Item.OnNavigateUp then
    self.Item.OnNavigateUp(self.Owner, self.Item, self)
  end
  return nil
end

function WBP_Rouge_Contract_ViewItem:OnNavigateDown(Navigation)
  if self.Item.OnNavigateDown then
    self.Item.OnNavigateDown(self.Owner, self.Item, self)
  end
  return nil
end

function WBP_Rouge_Contract_ViewItem:OnFocusReceived(MyGeometry, InFocusEvent)
  if UIUtils.UtilsGetCurrentInputType() == UE4.ECommonInputType.Gamepad then
    self:ShowControllerIcon(true)
    if self.Item.OnNavigated then
      self.Item.OnNavigated(self.Owner, self.Item, self)
    end
  end
  return self.Super.OnFocusReceived(self, MyGeometry, InFocusEvent)
end

function WBP_Rouge_Contract_ViewItem:OnFocusLost(InFocusEvent)
  if UIUtils.UtilsGetCurrentInputType() == UE4.ECommonInputType.Gamepad then
    self:ShowControllerIcon(false)
  end
end

function WBP_Rouge_Contract_ViewItem:OnListItemObjectSet(ListItemObject)
  self.Item = ListItemObject
  self.Owner = ListItemObject.Owner
  self.OnDecreaseLevel = ListItemObject.OnDecreaseLevel
  self.OnIncreaseLevel = ListItemObject.OnIncreaseLevel
  self.Text_Name:SetText(ListItemObject.Name)
  self.Text_Describe:SetText(ListItemObject.Desc)
  self.Text_HeatNum:SetText(ListItemObject.HeatValuePerLevel)
  if ListItemObject.Icon then
    local IconObj = LoadObject(ListItemObject.Icon)
    if IconObj then
      self.Icon:GetDynamicMaterial():SetTextureParameterValue("Mask", IconObj)
    end
  end
  self:UpdateView()
  if ListItemObject.SelectedLevel > 0 then
    self:PlayAnimation(self.Active)
  else
    self:PlayAnimation(self.Noactive)
  end
  self:ValidateButtonState()
  if UIUtils.UtilsGetCurrentInputType() == UE4.ECommonInputType.Gamepad then
    self:InitGamepadView()
  else
    self:InitKeyboardView()
  end
end

function WBP_Rouge_Contract_ViewItem:OnKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if InKeyName == Const.GamepadLeftShoulder then
    self:OnBtnDecreaseLevelClicked()
  elseif InKeyName == Const.GamepadRightShoulder then
    self:OnBtnIncreaseLevelClicked()
  elseif InKeyName == Const.GamepadFaceButtonLeft then
    self:OnBtnDefintionClicked()
  end
  return UE4.UWidgetBlueprintLibrary.UnHandled()
end

function WBP_Rouge_Contract_ViewItem:UpdateView()
  self.Text_Level:SetText(self.Item.SelectedLevel)
  self.Text_TotalNum:SetText(self.Item.SelectedLevel * self.Item.HeatValuePerLevel)
  local Desc = self.Item.Model:MakeContractDesc(DataMgr.RougeLikeContract[self.Item.ContractId], self.Item.SelectedLevel)
  local Terms = DataMgr.RougeLikeContract[self.Item.ContractId].ExplanationId
  if Terms then
    Desc = UIUtils.GenRougeCombatTermDesc(Desc, Terms)
  end
  self.Text_Describe:SetText(Desc)
  if self.Item.SelectedLevel <= 0 then
    self:StopAllAnimations()
    self:PlayAnimation(self.Noactive)
  elseif not self:IsAnimationPlaying(self.Up) then
    self:PlayAnimation(self.Active)
  end
  self:ValidateButtonState()
end

function WBP_Rouge_Contract_ViewItem:OnBtnDefintionClicked()
  local ExplanationId = DataMgr.RougeLikeContract[self.Item.ContractId].ExplanationId
  if ExplanationId then
    UIManager(self):LoadUINew("Rouge_Definition", ExplanationId)
  end
end

function WBP_Rouge_Contract_ViewItem:OnBtnDecreaseLevelClicked()
  local PrevLevel = self.Item.SelectedLevel
  if PrevLevel > 0 then
    AudioManager(self):PlayUISound(self, "event:/ui/roguelike/depth_affix_level_dec_click", nil, nil)
  end
  self.Item.SelectedLevel = math.max(0, self.Item.SelectedLevel - 1)
  if 0 == self.Item.SelectedLevel and PrevLevel > 0 then
    self:StopAllAnimations()
    self:PlayAnimation(self.Noactive)
  end
  self:UpdateView()
  if self.OnDecreaseLevel then
    self.OnDecreaseLevel(self.Owner, self.Item.ContractId, PrevLevel, self.Item.SelectedLevel)
  end
end

function WBP_Rouge_Contract_ViewItem:OnBtnIncreaseLevelClicked()
  local PrevLevel = self.Item.SelectedLevel
  if PrevLevel > 0 then
    AudioManager(self):PlayUISound(self, "event:/ui/roguelike/depth_affix_level_add_click", nil, nil)
  end
  self.Item.SelectedLevel = math.min(self.Item.MaxLevel, self.Item.SelectedLevel + 1)
  if self.Item.SelectedLevel > 0 and 0 == PrevLevel then
    self:StopAllAnimations()
    self:PlayAnimation(self.Up)
    AudioManager(self):PlayUISound(self, "event:/ui/roguelike/depth_affix_active", nil, nil)
  end
  self:UpdateView()
  if self.OnIncreaseLevel then
    self.OnIncreaseLevel(self.Owner, self.Item.ContractId, PrevLevel, self.Item.SelectedLevel)
  end
end

function WBP_Rouge_Contract_ViewItem:ValidateButtonState()
  if 0 == self.Item.SelectedLevel then
    self.Arrow_L.Btn:SetIsEnabled(false)
    self:AddTimer(0.05, function()
      self.Arrow_L:StopAllAnimations()
      self.Arrow_L:PlayAnimation(self.Arrow_L.Forbidden)
    end)
  else
    self.Arrow_L.Btn:SetIsEnabled(true)
    self.Arrow_L:SetRenderOpacity(0.8)
    self.Arrow_L:PlayAnimation(self.Arrow_L.Normal)
  end
  if self.Item.SelectedLevel == self.Item.MaxLevel then
    self.Arrow_R.Btn:SetIsEnabled(false)
    self:AddTimer(0.05, function()
      self.Arrow_R:StopAllAnimations()
      self.Arrow_R:PlayAnimation(self.Arrow_R.Forbidden)
    end)
  else
    self.Arrow_R.Btn:SetIsEnabled(true)
    self.Arrow_R:SetRenderOpacity(0.8)
    self.Arrow_R:PlayAnimation(self.Arrow_R.Normal)
  end
end

function WBP_Rouge_Contract_ViewItem:OnAnimationFinished(InAnimation)
  if InAnimation == self.Up then
    self:PlayAnimation(self.Active)
  elseif InAnimation == self.Down then
    self:PlayAnimation(self.Noactive)
  end
end

function WBP_Rouge_Contract_ViewItem:Destruct()
  self.Super.Destruct(self)
end

return WBP_Rouge_Contract_ViewItem
