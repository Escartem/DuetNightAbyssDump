local ArmoryUtils = require("BluePrints.UI.WBP.Armory.ArmoryUtils")
local EPanelMode = {ChooseItem = 0, ChoosePlan = 1}
local ImportItemNum = 3
local M = Class({
  "BluePrints.UI.BP_UIState_C"
})

function M:Construct()
  self.Btn_Import:SetText(GText("UI_LOGIN_ENSURE"))
  self.Btn_Import:BindEventOnClicked(self, self.StartImport)
  self.Btn_Import:TryOverrideSoundFunc(function()
    AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_confirm", nil, nil)
  end)
  self.Btn_Previous:SetText(GText("UI_REGISTER_BACK"))
  self.Btn_Previous:BindEventOnClicked(self, self.OnClickBtnPrevious)
  self.Btn_Previous:TryOverrideSoundFunc(function()
    AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_cancel", nil, nil)
  end)
  self.Btn_Confirm:SetText(GText("UI_CONFIRM_SELECTION"))
  self.Btn_Confirm:BindEventOnClicked(self, self.OnClickBtnConfirm)
  self.Btn_Confirm:TryOverrideSoundFunc(function()
    AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_confirm", nil, nil)
  end)
  self.Btn_Switch.Button_Area.OnClicked:Add(self, self.OnClickBtnSwitch)
  self.Text_Warning:SetText(GText("UI_Mod_Warning_Import"))
  for i = 1, ImportItemNum do
    self["ModImportItem_" .. i]:Init(i, self)
  end
  self.List_Weapon.BP_OnItemClicked:Clear()
  self.List_Weapon.BP_OnItemClicked:Add(self, self.OnListItemClicked)
  self.Btn_Close.OnClicked:Add(self, self.OnBtnCloseClicked)
  ModController:RegisterEvent(self)
  self:BindToAnimationFinished(self.Auto_In, function()
    if self.bUseGamepad then
      self:FocusToDefaultWidget()
    end
  end)
end

function M:Destruct()
  ModController:UnRegisterEvent(self)
  self:UnbindAllFromAnimationFinished(self.Auto_In)
end

function M:InitUIInfo(Name, IsInUIMode, EventList, ...)
  M.Super.InitUIInfo(self, Name, IsInUIMode, EventList, ...)
  self.Target, self.CloseCallback = ...
  self.ItemType = self.Target:GetTypeName()
  local ItemData = {}
  local ItemName = "Name"
  if self.ItemType == "Char" then
    self.ItemId = self.Target.CharId
    ItemData = DataMgr[self.ItemType][self.ItemId]
    ItemName = GText(ItemData.CharName)
  elseif self.ItemType == "Weapon" or self.ItemType == "UWeapon" then
    self.ItemId = self.Target.WeaponId
    ItemData = DataMgr[self.ItemType][self.ItemId]
    ItemName = GText(ItemData.WeaponName)
  end
  self.Text_Name:SetText(ItemName)
  if self.ItemType ~= "Weapon" then
    self.Btn_Switch:SetVisibility(UE4.ESlateVisibility.Collapsed)
  else
    self.Btn_Switch:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  end
  self:SetFocus()
  self:InitItemContent()
  self:SwitchPanelMode(EPanelMode.ChoosePlan)
  self:ImportItemChanged(1)
  self:RefreshBaseInfo()
end

function M:InitItemContent()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    DebugPrint("Armory_Mod_Import:InitItemContent@ Avatar\230\151\160\230\149\136")
  end
  self._Avatar = Avatar
  local ItemContent = {}
  if self.ItemType == "Char" then
    for Uuid, Char in pairs(Avatar.Chars) do
      if Char.CharId == self.ItemId then
        ItemContent = self:NewItemContent(Char, CommonConst.ArmoryType.Char)
        break
      end
    end
  elseif self.ItemType == "UWeapon" then
    for Uuid, Weapon in pairs(Avatar.UWeapons) do
      if Weapon.WeaponId == self.ItemId then
        ItemContent = self:NewItemContent(Weapon, CommonConst.ArmoryType.Weapon)
        break
      end
    end
  elseif self.ItemType == "Weapon" then
    self.ItemContentsMap = {}
    self.ItemContentsArray = {}
    self.BP_ItemContents:Clear()
    local Obj
    for Uuid, Weapon in pairs(Avatar.Weapons) do
      if Weapon.WeaponId == self.ItemId then
        Obj = self:NewItemContent(Weapon, CommonConst.ArmoryType.Weapon)
        Obj.IsChosen = false
        local WeaponTag, CurrWeapon
        if Weapon:HasTag("Melee") then
          WeaponTag = "Melee"
          CurrWeapon = Avatar.MeleeWeapon
        elseif Weapon:HasTag("Ranged") then
          WeaponTag = "Ranged"
          CurrWeapon = Avatar.RangedWeapon
        end
        if Obj.Uuid == CurrWeapon then
          Obj.bInGear = true
        end
        self.ItemContentsMap[Uuid] = Obj
        self.BP_ItemContents:Add(Obj)
        table.insert(self.ItemContentsArray, Obj)
      end
    end
    self:ReInitList()
    ItemContent = self.ItemContentsArray[1]
    ItemContent.bSelectTag = true
  end
  self.SelectedContent = ItemContent
  self:ChangePreviewItem(ItemContent)
end

function M:ReInitList()
  ArmoryUtils:SortItemContents(self.ItemContentsArray, {"Level"}, nil, self.SelectedContent)
  self.List_Weapon:ClearListItems()
  for i, Content in ipairs(self.ItemContentsArray) do
    self.List_Weapon:AddItem(Content)
  end
  self.List_Weapon:RegenerateAllEntries()
end

function M:ChangePreviewItem(Content)
  self.List_Preview:ClearListItems()
  local Content = self:NewItemContent(self._Avatar[self.ItemType .. "s"][Content.Uuid], Content.Type)
  Content.NotInteractive = true
  self.List_Preview:AddItem(Content)
end

function M:OnListItemClicked(Content)
  if Content == self.ComparedContent then
    return
  end
  if self.ComparedContent and self.ComparedContent.SelfWidget then
    self.ComparedContent.SelfWidget:SetSelected(false)
    self.ComparedContent.SelfWidget:SetItemSelect(false)
  end
  self.ComparedContent = Content
  if Content.SelfWidget then
    Content.SelfWidget:SetSelected(true)
    Content.SelfWidget:SetItemSelect(true)
  end
  self:ChangePreviewItem(Content)
  self.List_Preview:RegenerateAllEntries()
end

function M:OnBtnCloseClicked()
  if self.PanelMode == EPanelMode.ChooseItem then
    self:SwitchPanelMode(EPanelMode.ChoosePlan)
  else
    self:Close()
  end
end

function M:StartImport()
  self:BlockAllUIInput(true)
  try({
    exec = function()
      ModController:CopyModToRealAvatar(self.ItemType, self.SelectedContent.Uuid, self.ItemIdx, function(Ret, NotOwnedMods, LackCostMods, CallBack)
        self:HandleImportReturnValue(Ret, NotOwnedMods, LackCostMods, CallBack)
      end)
    end,
    catch = function(err)
      DebugPrint("Armory_Mod_Import@Error", Traceback(err))
      UIManager(self):ShowUITip("CommonToastMain", GText(err))
    end,
    final = function(ok)
      if not ok then
        ModController:TryAbortImport()
        self:NotifyOnImportAbort()
      end
    end
  })
end

function M:HandleImportReturnValue(Ret, NotOwnedMods, LackCostMods, CallBack)
  if 0 == Ret then
    self:Close()
    ModController:ShowToast(GText("UI_Mod_Toast_ImportSuccess"))
  elseif 1 == Ret then
    local NotOwnedStr
    if NotOwnedMods and next(NotOwnedMods) then
      NotOwnedStr = ""
      for _, v in pairs(NotOwnedMods) do
        local ModName = GText(DataMgr.Mod[v].Name)
        if "" ~= NotOwnedStr then
          NotOwnedStr = NotOwnedStr .. "\227\128\129"
        end
        NotOwnedStr = NotOwnedStr .. ModName
      end
    end
    local LackCostStr
    if LackCostMods and next(LackCostMods) then
      LackCostStr = ""
      for _, v in pairs(LackCostMods) do
        local ModName = GText(DataMgr.Mod[v].Name)
        if "" ~= LackCostStr then
          LackCostStr = LackCostStr .. "\227\128\129"
        end
        LackCostStr = LackCostStr .. ModName
      end
    end
    local TitleAndTexts = {}
    if NotOwnedStr then
      table.insert(TitleAndTexts, {
        Title = GText("UI_COMMONPOP_TEXT_100161"),
        Text = NotOwnedStr,
        bShowLine = true
      })
    end
    if LackCostStr then
      table.insert(TitleAndTexts, {
        Title = GText("UI_COMMONPOP_TEXT_100162"),
        Text = LackCostStr,
        bShowLine = false
      })
    end
    local Params = {Text03_ListView = TitleAndTexts}
    
    function Params.LeftCallbackFunction()
      ModController:TryAbortImport()
      self:NotifyOnImportFinished()
    end
    
    function Params.RightCallbackFunction()
      if CallBack then
        CallBack()
        self:BlockAllUIInput(true)
      end
    end
    
    UIManager():ShowCommonPopupUI(ModCommon.ModImportDialog, Params, self)
    self:BlockAllUIInput(false)
  else
    GWorld.logger.error("\229\175\188\229\133\165Mod\230\151\182\229\135\186\233\148\153")
    ModController:TryAbortImport()
    self:NotifyOnImportAbort()
  end
end

function M:OnClickBtnPrevious()
  self:SwitchPanelMode(EPanelMode.ChoosePlan)
end

function M:OnClickBtnConfirm()
  if self.ComparedContent ~= self.SelectedContent then
    self.ComparedContent.bSelectTag = true
    self.SelectedContent.bSelectTag = false
    self.SelectedContent = self.ComparedContent
  end
  self:SwitchPanelMode(EPanelMode.ChoosePlan)
end

function M:OnClickBtnSwitch()
  self:SwitchPanelMode(1 - self.PanelMode)
end

function M:NewItemContent(Target, Type)
  local Obj = NewObject(UIUtils.GetCommonItemContentClass())
  Obj.Uuid = Target.Uuid
  Obj.Type = Type
  Obj.ItemType = Type
  Obj.UnitId = Target[Type .. "Id"]
  Obj.Rarity = Target[Type .. "Rarity"]
  Obj.Icon = Target:Data().Icon
  Obj.Level = Target.Level
  Obj.GradeLevel = Target.GradeLevel
  Obj.AnimNameWithCreate = "In_OnlyOpacity"
  Obj.SortPriority = Target:Data().SortPriority or 0
  return Obj
end

function M:SwitchPanelMode(Case)
  if Case == EPanelMode.ChoosePlan then
    if self.PanelMode == EPanelMode.ChooseItem and self.ComparedContent ~= self.SelectedContent then
      self:ChangePreviewItem(self.SelectedContent)
      self.List_Preview:RegenerateAllEntries()
    end
    self.WidgetSwitcher_State:SetActiveWidgetIndex(0)
    self.WidgetSwitcher_Btn:SetActiveWidgetIndex(0)
    self.Panel_Warning:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    self.Text_Hint:SetText(GText("UI_Mod_Tips_Ensure"))
    self.Text_Plan:SetText(GText("UI_MOD_PLAN"))
  elseif Case == EPanelMode.ChooseItem then
    self:ReInitList()
    self.ComparedContent = self.SelectedContent
    self.WidgetSwitcher_State:SetActiveWidgetIndex(1)
    self.WidgetSwitcher_Btn:SetActiveWidgetIndex(1)
    self.Panel_Warning:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.Text_Hint:SetText(GText("UI_Mod_Tips_Switch"))
    self.Text_Plan:SetText(GText("UI_SHOP_SUBTAB_NAME_WEAPON"))
  end
  self.PanelMode = Case
  if self.bUseGamepad then
    self:FocusToDefaultWidget()
    self:RefreshGamepadKeys()
  end
end

function M:ImportItemChanged(ItemIdx)
  if not type(ItemIdx) == "number" or 0 ~= ItemIdx % 1 or ItemIdx < 1 or ItemIdx > ImportItemNum then
    DebugPrint("Armory_Mod_Import:ImportItemChanged@ ItemIdx\230\151\160\230\149\136")
    return
  end
  local CurrentImportItem = self.ItemIdx and self["ModImportItem_" .. self.ItemIdx]
  if CurrentImportItem then
    CurrentImportItem:SetIsChecked(false)
  end
  local NewImportItem = self["ModImportItem_" .. ItemIdx]
  NewImportItem:SetIsChecked(true)
  self.ItemIdx = ItemIdx
end

function M:RefreshGamepadKeys()
  if ModController:IsMobile() then
    return
  end
  local BottomKeyInfo = {}
  if self.PanelMode == EPanelMode.ChoosePlan then
    if self.ItemType == "Weapon" then
      table.insert(BottomKeyInfo, {
        KeyInfoList = {
          {Type = "Img", ImgShortPath = "X"}
        },
        Desc = GText("UI_Controller_Switch")
      })
    end
    table.insert(BottomKeyInfo, {
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "A"}
      },
      Desc = GText("UI_Tips_Ensure")
    })
    table.insert(BottomKeyInfo, {
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "B"}
      },
      Desc = GText("UI_Tips_Close")
    })
    self.Key_Gamepad:UpdateKeyInfo(BottomKeyInfo)
  elseif self.PanelMode == EPanelMode.ChooseItem then
    BottomKeyInfo = {
      {
        KeyInfoList = {
          {Type = "Img", ImgShortPath = "A"}
        },
        Desc = GText("UI_Tips_Ensure")
      }
    }
    self.Key_Gamepad:UpdateKeyInfo(BottomKeyInfo)
  end
end

function M:RefreshBaseInfo()
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
  if IsValid(self.GameInputModeSubsystem) then
    self:RefreshOpInfoByInputDevice(self.GameInputModeSubsystem:GetCurrentInputType(), self.GameInputModeSubsystem:GetCurrentGamepadName())
  end
end

function M:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  if ModController:IsMobile() then
    return
  end
  local bUseGamepad = CurInputDevice == ECommonInputType.Gamepad
  if bUseGamepad then
    self.bUseGamepad = true
    self:RefreshGamepadKeys()
    self.Key_Gamepad:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    self.ProgressBar_Btn:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self:FocusToDefaultWidget()
  else
    self.bUseGamepad = false
    self.Key_Gamepad:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.ProgressBar_Btn:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  end
end

function M:FocusToDefaultWidget()
  if self.PanelMode == EPanelMode.ChoosePlan then
    local PlanItem = self["ModImportItem_" .. self.ItemIdx]
    if PlanItem then
      PlanItem:SetFocus()
    end
  else
    local SelectedItem = self.List_Weapon:BP_GetSelectedItem()
    if SelectedItem then
      self.List_Weapon:BP_NavigateToItem(SelectedItem)
    else
      self.List_Weapon:NavigateToIndex(0)
    end
  end
end

function M:OnKeyDown(MyGeometry, InKeyEvent)
  if ModController:IsMobile() then
    return
  end
  local InKey = UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UFormulaFunctionLibrary.Key_GetFName(InKey)
  local IsEventHandled = false
  if "Escape" == InKeyName then
    self:OnBtnCloseClicked()
    IsEventHandled = true
  elseif InKeyName == UIConst.GamePadKey.FaceButtonLeft then
    if self.ItemType == "Weapon" then
      self:OnClickBtnSwitch()
    end
    IsEventHandled = true
  elseif InKeyName == UIConst.GamePadKey.FaceButtonRight then
    if self.PanelMode == EPanelMode.ChooseItem then
      self.Btn_Previous:OnBtnPressed()
    else
      self:Close()
    end
    IsEventHandled = true
  elseif InKeyName == UIConst.GamePadKey.FaceButtonTop then
    if self.PanelMode == EPanelMode.ChoosePlan then
      if not self.ImportPressed then
        self.ImportPressed = true
        self.Btn_Import:OnBtnPressed()
      end
    else
      self.Btn_Confirm:OnBtnPressed()
    end
    IsEventHandled = true
  end
  if IsEventHandled then
    return UWidgetBlueprintLibrary.Handled()
  end
  return UWidgetBlueprintLibrary.UnHandled()
end

function M:OnKeyUp(MyGeometry, InKeyEvent)
  if ModController:IsMobile() then
    return
  end
  local InKey = UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UFormulaFunctionLibrary.Key_GetFName(InKey)
  local IsEventHandled = false
  if InKeyName == UIConst.GamePadKey.FaceButtonTop then
    if self.PanelMode == EPanelMode.ChoosePlan then
      self.Btn_Import:OnBtnClicked()
      self.ImportPressed = false
    else
      self.Btn_Confirm:OnBtnClicked()
    end
    IsEventHandled = true
  elseif InKeyName == UIConst.GamePadKey.FaceButtonRight and self.PanelMode == EPanelMode.ChooseItem then
    self.Btn_Previous:OnBtnClicked()
    IsEventHandled = true
  end
  if IsEventHandled then
    return UWidgetBlueprintLibrary.Handled()
  end
  return UWidgetBlueprintLibrary.UnHandled()
end

function M:RealClose()
  if self.CloseCallback then
    self.CloseCallback()
  end
  self:SetInputUIOnly(false)
  M.Super.RealClose(self)
end

function M:NotifyOnImportFinished()
  self:BlockAllUIInput(false)
end

function M:NotifyOnImportTimeOut()
  self:NotifyOnImportFinished()
end

function M:NotifyOnImportAbort()
  self:NotifyOnImportFinished()
end

return M
