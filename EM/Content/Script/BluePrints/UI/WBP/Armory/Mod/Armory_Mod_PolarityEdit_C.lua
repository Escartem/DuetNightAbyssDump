require("UnLua")
local ModModel = ModController:GetModel()
local M = Class({
  "BluePrints.UI.BP_UIState_C"
})

function M:Construct()
  self.Key_LB:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Key_RB:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.GameInputModeSubsystem = UIManager(self):GetGameInputModeSubsystem()
  if IsValid(self.GameInputModeSubsystem) then
    self.GameInputModeSubsystem.OnInputMethodChanged:Add(self, self.RefreshOpInfoByInputDevice)
    self:RefreshOpInfoByInputDevice(self.GameInputModeSubsystem:GetCurrentInputType(), self.GameInputModeSubsystem:GetCurrentGamepadName())
  end
end

function M:NotifyOnPolarityModSelectedChanged(SelectedStuff, LastSelectedStuff)
  self:SetUpWhenSelectSlot(SelectedStuff)
end

function M:NotifyOnPendingEditSlotPolarity(SlotId)
  self:CheckIsAnySlotDirty()
end

function M:NotifyOnRevertEditSlotPolarity()
  self:CheckIsAnySlotDirty()
end

function M:NotifyOnPolarityEditFailed()
  self.Button_Purchase:ForbidBtn(false)
  self:BlockAllUIInput(false)
end

function M:NotifyOnPolarityEditDone(TargetUuid)
  self:NotifyOnPolarityEditFailed()
  self:Close()
end

function M:Destruct()
  if self.IsInit then
    self.List_Polarity.OnCreateEmptyContent:Unbind()
    self.List_Polarity.BP_OnEntryInitialized:Remove(self, self.OnListPolarityAddEntry)
    ModController:UnRegisterEvent(self)
    self.Button_Purchase:UnBindEventOnClickedByObj(self)
    self.Btn_Reset:UnBindEventOnClickedByObj(self)
  end
  M.Super.Destruct(self)
end

function M:OnListPolarityAddEntry(_, Entry)
  Entry:InitSelectedState()
  Entry:SetOnItemSelectOn(function(InContent)
    for _, Widget in pairs(self.List_Polarity:GetDisplayedEntryWidgets()) do
      local Polarity = Widget.Content.Polarity
      if not Polarity then
        break
      end
      if Polarity ~= InContent.Polarity then
        Widget:DeSelect()
      end
    end
    ModController:EditSlotPolarity(InContent.Polarity)
  end)
end

function M:InitUIInfo(Name, IsInUIMode)
  self.bEnough = false
  M.Super.InitUIInfo(self, Name, IsInUIMode)
  self.TitleText = ""
  self:ShowWarning()
  self:SetUpFirstInit()
  self:SetUpWhenSelectSlot()
  self:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  self.Btn_Reset:SetDefaultGamePadImg("LS")
  self.Button_Purchase:SetDefaultGamePadImg("Y")
  self.Key_LB:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "LB"}
    }
  })
  self.Key_RB:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "RB"}
    }
  })
end

function M:SetUpFirstInit()
  self:SetUpButtonWidget()
  if self.IsInit then
    return
  end
  if ModController:IsMobile() then
    self.Main:SetRenderTranslation(FVector2D(0, self.Offset_M))
  end
  self.List_Polarity:DisableScroll(true)
  self.List_Polarity.OnCreateEmptyContent:Bind(self, function()
    local Obj = NewObject(UIUtils.GetCommonItemContentClass())
    return Obj
  end)
  self.List_Polarity.BP_OnEntryInitialized:Add(self, self.OnListPolarityAddEntry)
  self.Text_Hint:SetText(GText("UI_Mod_Polarity_Content"))
  ModController:RegisterEvent(self)
  self:SetUpPolarityList()
end

function M:CheckIsAnySlotDirty()
  local bDirty = 0 ~= ModModel.PolarityEditModeData:GetDirtyCount()
  DebugPrint(LXYTag, "Mod_PolarityEdit:CheckIsAnySlotDirty", bDirty)
  if bDirty then
    if self.bEnough then
      self.Button_Purchase:ForbidBtn(false)
    else
      self.Button_Purchase:ForbidBtn(true)
    end
    self.Btn_Reset:ForbidBtn(false)
  else
    self.Button_Purchase:ForbidBtn(true)
    self.Btn_Reset:ForbidBtn(true)
  end
  self:SetCostNum()
end

function M:SetCostNum()
  local ResourceId = self:GetResourceId()
  local OneCost = DataMgr.GlobalConstant["PolarizationCost_" .. ResourceId].ConstantValue
  local DirtyCount = ModModel.PolarityEditModeData:GetDirtyCount()
  local Cost = OneCost * DirtyCount
  local Avatar = ModModel:GetAvatar()
  local ResourceId = self:GetResourceId()
  local Resource = Avatar.Resources[ResourceId]
  local ResourceCount = Resource and Resource.Count or 0
  DebugPrint(LXYTag, "Mod_PolarityEdit:SetCostNum", OneCost, ResourceCount, Cost)
  self.Com_Cost.Text_Possess:SetText(Cost)
  self.bEnough = ResourceCount > 0 and Cost <= ResourceCount
  self.Com_Cost:SetIsEnough(self.bEnough)
  if Cost > 0 and self.bEnough then
    self.Panel_Cost:SetRenderOpacity(1)
    self.Panel_Cost:SetVisibility(UIConst.VisibilityOp.Visible)
  else
    self.Panel_Cost:SetRenderOpacity(self.CostZeroOpacity)
    self.Panel_Cost:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  end
end

function M:SetUpWhenSelectSlot(SelectedStuff)
  self:CheckIsAnySlotDirty()
  if not SelectedStuff or not SelectedStuff:IsSlot() then
    self.Text_Hint:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    self.Panel_Main:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.TitleText = GText("UI_Mod_Polarity_Hint")
    if not self.bWarning then
      self.Text_Title:SetText(self.TitleText)
    end
    return
  end
  self.Panel_Main:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  self.Text_Hint:SetVisibility(UIConst.VisibilityOp.Collapsed)
  local SlotUIData = ModModel:GetSlotUIData(SelectedStuff.SlotId)
  if SlotUIData.UIPolarity ~= CommonConst.NonePolarity then
    self.TitleText = GText("UI_Mod_EditPolarity")
  else
    self.TitleText = GText("UI_Mod_AddPolarity")
  end
  if not self.bWarning then
    self.Text_Title:SetText(self.TitleText)
  end
  for _, Widget in pairs(self.List_Polarity:GetDisplayedEntryWidgets()) do
    Widget:InitSelectedState()
  end
  self.Text_Num:SetText(SlotUIData:GetSlotIdStr())
  local Polarity = -1 == SlotUIData:GetPolarity() and 0 or SlotUIData:GetPolarity()
  self.List_Polarity:SetSelectedIndex(Polarity)
end

function M:_GetResourceIds()
  local TargetType = ModModel:GetTarget():GetTypeName()
  self.ResourceIds = "Char" == TargetType and DataMgr.ResourceSType2Resource.Polarization or DataMgr.ResourceSType2Resource.WeaponPolarization
  return self.ResourceIds
end

function M:GetResourceId()
  return self:_GetResourceIds()[1]
end

function M:OnApplyPolarityEdit()
  local function Callback()
    self.Button_Purchase:ForbidBtn(true)
    
    self:BlockAllUIInput(true)
    ModController:SetSelectedStuff(nil, nil)
    ModController:SendPolarityEdit(ModModel:GetTarget())
  end
  
  if ModModel.PolarityEditModeData:IsAnySlotOverCost() then
    local Params = {RightCallbackFunction = Callback}
    local ModNames = {}
    for i = #ModModel.PolarityEditModeData.DirtySlots, 1, -1 do
      local SlotUIData = ModModel.PolarityEditModeData.DirtySlots[i]
      if SlotUIData.bOverCost == false then
        break
      end
      local Mod = SlotUIData:GetMod()
      table.insert(ModNames, string.format("<H>%s</>", GText(Mod:Data().Name)))
    end
    Params.ShortTextParams = {
      table.concat(ModNames, "|")
    }
    UIManager():ShowCommonPopupUI(ModCommon.EditPolarityTakeOffDialog, Params, self)
  else
    Callback()
  end
end

function M:OnRevertPolarityEdit()
  local Params = {
    RightCallbackFunction = function()
      ModController:SetSelectedStuff(nil, nil)
      ModController:RevertAllSlotPolarity()
    end
  }
  Params.OnCloseCallbackObj = self
  Params.AutoFocus = true
  
  function Params.OnCloseCallbackFunction()
    self.Parent:SetDefaultGamepadFocus()
  end
  
  UIManager():ShowCommonPopupUI(ModCommon.EditPolarityResetDialog, Params, self)
end

function M:SetUpButtonWidget()
  self.Button_Purchase:SetText(GText("UI_ACCEPT"))
  self.Button_Purchase:UnBindEventOnClickedByObj(self)
  self.Button_Purchase:BindEventOnClicked(self, self.OnApplyPolarityEdit)
  self.Btn_Reset:SetText(GText("UI_Rougelike_Contract_Reset"))
  self.Btn_Reset:UnBindEventOnClickedByObj(self)
  self.Btn_Reset:BindEventOnClicked(self, self.OnRevertPolarityEdit)
  local ResourceId = self:GetResourceId()
  local ResourceConf = DataMgr.Resource[ResourceId]
  local Params = {
    ResourceId = ResourceId,
    bShowDenominator = false,
    CostText = GText(ResourceConf.ResourceName),
    Owner = self,
    Numerator = 0
  }
  self.Com_Cost:InitContent(Params)
  self.Panel_Cost:SetRenderOpacity(self.CostZeroOpacity)
  self.Panel_Cost:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
end

function M:SetUpPolarityList()
  local SortedConfs = ModModel:GetSortedPolarityConfs()
  for _, Conf in pairs(SortedConfs) do
    local Obj = NewObject(UIUtils.GetCommonItemContentClass())
    Obj.Polarity = Conf.Id
    Obj.bSelected = false
    self.List_Polarity:AddItem(Obj)
  end
  self.List_Polarity:RequestFillEmptyContent()
end

function M:Close()
  local function Callback()
    ModController:StopPolarityEditMode()
    
    M.Super.Close(self)
  end
  
  if ModModel.PolarityEditModeData:GetDirtyCount() > 0 then
    local Params = {RightCallbackFunction = Callback}
    UIManager():ShowCommonPopupUI(ModCommon.EditPolarityResetDialog, Params, self.Parent)
  else
    Callback()
  end
end

function M:RealClose()
  self:SetVisibility(UIConst.VisibilityOp.Collapsed)
  M.Super.RealClose(self)
end

function M:ShowWarning(Text)
  if string.isempty(Text) then
    self.bWarning = false
    self.Text_Title:SetText(self.TitleText)
    self.Bg_Top:SetBrushTintColor(self.BgColor_Normal)
  else
    self.bWarning = true
    self.Bg_Top:SetBrushTintColor(self.BgColor_Warning)
    self.Text_Title:SetText(Text)
  end
end

function M:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  if self.CurInputDeviceType == CurInputDevice then
    DebugPrint("thy    \229\183\178\231\187\143\230\152\190\231\164\186\231\154\132\230\152\175\232\175\165\232\190\147\229\133\165\230\168\161\229\188\143\239\188\140\228\184\141\233\156\128\232\166\129\232\191\155\232\161\140\229\136\183\230\150\176")
    return
  end
  self.CurInputDeviceType = CurInputDevice
  if self.CurInputDeviceType == ECommonInputType.Gamepad then
    DebugPrint("thy   IsGamePad")
    self.Key_LB:SetVisibility(UIConst.VisibilityOp.Visible)
    self.Key_RB:SetVisibility(UIConst.VisibilityOp.Visible)
  else
    DebugPrint("thy   IsPC")
    self.Key_LB:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.Key_RB:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

return M
