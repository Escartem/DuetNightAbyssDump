require("UnLua")
local ForgeConst = require("Blueprints.UI.Forge.ForgeConst")
local M = Class({
  "BluePrints.UI.BP_UIState_C"
})

function M:PreInit(RowIndex, ColIndex, Owner, OnSelectedCallback)
  self.RowIndex = RowIndex
  self.ColIndex = ColIndex
  self.Owner = Owner
  self.OnSelectedCallback = OnSelectedCallback
  self:SetNavigationRuleCustom(UE4.EUINavigation.Up, {
    self,
    self.OnNavigateUp
  })
  self:SetNavigationRuleCustom(UE4.EUINavigation.Down, {
    self,
    self.OnNavigateDown
  })
end

function M:OnNavigateUp()
  local NextWidget = self.Owner:GetNavigateUpWidget(self.RowIndex, self.ColIndex)
  return NextWidget
end

function M:OnNavigateDown()
  local NextWidget = self.Owner:GetNavigateDownWidget(self.RowIndex, self.ColIndex)
  return NextWidget
end

function M:OnFocusReceived(MyGeometry, InFocusEvent)
  local CurInputDeviceType = UIUtils.UtilsGetCurrentInputType()
  CurInputDeviceType = UIUtils.UtilsGetCurrentInputType()
  if CurInputDeviceType == UE4.ECommonInputType.Gamepad then
    self:TriggerOnSelected()
    AudioManager(self):PlayItemSound(self, self.Item.Id, "Click", self.Item.ItemType)
  end
  return self.Super.OnFocusReceived(self, MyGeometry, InFocusEvent)
end

function M:OnItemMouseButtonUp()
  local CurInputDeviceType = UIUtils.UtilsGetCurrentInputType()
  if CurInputDeviceType == UE4.ECommonInputType.Gamepad then
    self:TriggerOnSelected(true)
  else
    self:TriggerOnSelected()
  end
end

function M:TriggerOnSelected(bSelectedByGamepadClick)
  self.OnSelectedCallback(self.Owner, self.RowIndex, self.ColIndex, bSelectedByGamepadClick)
end

function M:TriggerBtnStartClicked()
  if self.Owner then
    self.Owner:OnDetailsViewBtnStartClicked()
  end
end

function M:SetSelected(IsSelected, HasNextRowItems)
  self.Item:SetSelected(IsSelected)
  if IsSelected then
    self:PlayAnimation(self.Item_In)
    self.Frame:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    if self.RowIndex > 1 and HasNextRowItems then
      self:SetDownLineVisible(true)
    end
  else
    self.Frame:SetVisibility(UE4.ESlateVisibility.Collapsed)
    if self.RowIndex > 1 then
      self:SetDownLineVisible(false)
    end
  end
end

function M:UpdateView(Content)
  Content.OnMouseButtonUpEvents = {
    Obj = self,
    Callback = self.OnItemMouseButtonUp
  }
  if self.Owner.IsInCompendiumMode then
    Content.Count = Content.NeedCount
    Content.NeedCount = nil
    Content.MaxCount = nil
  end
  self.Item:Init(Content)
  if 0 ~= Content.Id then
    self:SetVisibility(UE4.ESlateVisibility.Visible)
    if not self.IsInCompendiumMode then
      self.State:SetVisibility(UE4.ESlateVisibility.HitTestInvisible)
    end
    if Content.Count and Content.NeedCount and Content.NeedCount > Content.Count then
      self:PlayAnimation(self.lack)
    else
      self:PlayAnimation(self.lack, 0, 1, UE4.EUMGSequencePlayMode.Reverse)
    end
  else
    self:SetEmpty()
  end
end

function M:UpdateDraftState(DraftState, ShowRedDot)
  if self:IsAnimationPlaying(self.Casting) then
    self:StopAnimation(self.Casting)
  end
  if DraftState == ForgeConst.PathItemDraftState.CanProduce then
    self:PlayAnimation(self.Castable)
  elseif DraftState == ForgeConst.PathItemDraftState.Producing then
    self:PlayAnimation(self.Casting, 0, 0)
  elseif DraftState == ForgeConst.PathItemDraftState.ConditionsNotMet then
    self:PlayAnimation(self.limitedCast)
  elseif DraftState == ForgeConst.PathItemDraftState.CantProduce then
    self:PlayAnimation(self.DisCast)
  end
  if not self.IsInCompendiumMode and ShowRedDot then
    self.Item:SetRedDot(UIConst.RedDotType.CommonRedDot)
  end
end

function M:SetUpLineVisible(IsShow)
  if IsShow then
    self.Line01_Connect:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    self:PlayAnimation(self.ParentConnect)
  elseif self.Line01_Connect:GetVisibility() == UE4.ESlateVisibility.SelfHitTestInvisible then
    self:PlayAnimation(self.ParentConnect, 0, 1, UE4.EUMGSequencePlayMode.Reverse)
  else
    self.Line01_Connect:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
  self.ShowUpLine = IsShow
end

function M:SetDownLineVisible(IsShow)
  if IsShow then
    self.Line02_Connect:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    self:PlayAnimation(self.ChildConnect)
    self.Arrow:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  else
    if self.Line02_Connect:GetVisibility() == UE4.ESlateVisibility.SelfHitTestInvisible then
      self:PlayAnimation(self.ChildConnect, 0, 1, UE4.EUMGSequencePlayMode.Reverse)
    else
      self.Line02_Connect:SetVisibility(UE4.ESlateVisibility.Collapsed)
    end
    self.Arrow:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
  self.ShowDownLine = IsShow
end

function M:IsEmpty()
  return not self.Item.Id or 0 == self.Item.Id
end

function M:SetEmpty()
  self.Item:Init({Id = 0})
  if not self.IsInCompendiumMode then
    self.State:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
  self:SetSelected(false)
  self:SetUpLineVisible(false)
  self:PlayAnimation(self.lack, 0, 1, UE4.EUMGSequencePlayMode.Reverse)
  self:SetVisibility(UE4.ESlateVisibility.HitTestInvisible)
end

function M:OnAnimationFinished(InAnimation)
  if InAnimation == self.ChildConnect and self.ShowDownLine == false then
    self.Line02_Connect:SetVisibility(UE4.ESlateVisibility.Collapsed)
  elseif InAnimation == self.ParentConnect and false == self.ShowUpLine then
    self.Line01_Connect:SetVisibility(UE4.ESlateVisibility.Collapsed)
  elseif InAnimation == self.Item_In then
    self.Item:PlayAnimation(self.Item.Normal)
  end
end

function M:InitCompendiumView()
  self.IsInCompendiumMode = true
  self.State:SetVisibility(UE4.ESlateVisibility.Collapsed)
end

function M:SetClickable(bIsClickable)
  if bIsClickable then
    self.Item:SetVisibility(UE4.ESlateVisibility.Visible)
  else
    self.Item:SetVisibility(UE4.ESlateVisibility.HitTestInvisible)
  end
end

return M
