require("UnLua")
local TimeUtils = require("Utils.TimeUtils")
local UpgradeUtils = require("Utils.UpgradeUtils")
local ArmoryUtils = require("BluePrints.UI.WBP.Armory.ArmoryUtils")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})
M._components = {
  "BluePrints.UI.WBP.Armory.Armory_List_Attr_Compoment",
  "BluePrints.UI.BP_EMUserWidgetUtils_C"
}

function M:Construct()
  self.Btn_Voice:SetText(GText("UI_CharVoice_Tab"))
  self.Btn_Record:SetText(GText("UI_Chardata_Data"))
  self.Btn_ShowPic:SetText(GText("UI_ShowCharStand"))
  self.Text_Ability:SetText(GText("UI_Ability"))
  self.Text_Record:SetText(GText("UI_Armory_Information"))
  self.Btn_Voice:BindEventOnClicked(self, self.OnBtnVoiceClicked)
  self.Btn_Voice:SetDefaultGamePadImg("X")
  self.Btn_Record:BindEventOnClicked(self, self.OnBtnRecordClicked)
  self.Btn_Record:SetDefaultGamePadImg("Y")
  self.Btn_ShowPic:BindEventOnClicked(self, self.OnBtnShowPicClicked)
  self.Btn_ShowPic:SetGamePadVisibility(UIConst.VisibilityOp.Collapsed)
  self.Btn_ShowPic:OverrideGamePadVisibility(UIConst.VisibilityOp.Collapsed)
  self.Btn_ShowPic.bIsFocusable = true
  self.List_Ability:DisableScroll(true)
  self:RefreshBaseInfo()
end

function M:Init(Params)
  self._OnAddedToFocusPath = Params.OnAddedToFocusPath
  self._OnRemovedFromFocusPath = Params.OnRemovedFromFocusPath
  self.Parent = Params.Parent
  self.Target = Params.Target
  self.IsPreviewMode = Params.IsPreviewMode or Params.IsTargetUnowned
  self:UpdateTargetInfo(self.Target)
  self:UpdateRecordListView(self.Target)
  self:UpdateDispatchList(self.Target)
  if self.IsPreviewMode then
    local bOwnedChar = false
    local Avatar = GWorld:GetAvatar()
    for _, Char in pairs(Avatar.Chars) do
      if Char.CharId == self.Target.CharId then
        bOwnedChar = true
        break
      end
    end
    if bOwnedChar then
      self.WidgetSwitcher_State:SetActiveWidgetIndex(0)
      if Params.bNeedStandBtn then
        self.Btn_ShowPic:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
      else
        self.Btn_ShowPic:SetVisibility(UIConst.VisibilityOp.Collapsed)
      end
    else
      self.WidgetSwitcher_State:SetActiveWidgetIndex(1)
      self.Hint.WidgetSwitcher_State:SetActiveWidgetIndex(2)
      self.Hint.Text_Hint_Locked:SetText(GText("UI_Char_Locked"))
      self.Btn_ShowPic:SetVisibility(UIConst.VisibilityOp.Collapsed)
    end
  else
    self:UpdataReddotInfo(self.Target.CharId)
    self.WidgetSwitcher_State:SetActiveWidgetIndex(0)
    self.Btn_ShowPic:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  self:InitNavigationRules()
end

function M:UpdataReddotInfo(CharId)
  local NodeName = table.concat({"Record", CharId}, "_")
  
  local function Callback(self, Count)
    if Count > 0 then
      self.Btn_Record:SetReddot(true)
    else
      self.Btn_Record:SetReddot(false)
    end
  end
  
  if self.ListenReddotName then
    ReddotManager.RemoveListener(self.ListenReddotName, self)
  end
  self.ListenReddotName = NodeName
  if ReddotManager.GetTreeNode(NodeName) then
    ReddotManager.AddListener(NodeName, self, Callback)
  else
    ArmoryUtils:InitCharRecoedReddotNode(CharId)
    ReddotManager.AddListener(NodeName, self, Callback)
  end
end

function M:UpdateTargetInfo(Target)
  local MaxLevel = UpgradeUtils.GetMaxLevel(Target, "Char")
  local TargetId = Target.CharId
  local BreakLevelUpData = DataMgr.CharBreak[TargetId]
  local LevelUpData
  LevelUpData = DataMgr.LevelUp[Target.Level]
  local Percent = math.clamp(Target.Exp / LevelUpData.CharLevelMaxExp, 0, 1)
  self.LevelInfo:Init(Target.Level, MaxLevel, Percent, Target.EnhanceLevel or 0, BreakLevelUpData)
end

function M:UpdateRecordListView(Target)
  local CharData = DataMgr.CharacterData[Target.CharId]
  if not CharData then
    return
  end
  local year, month, day = TimeUtils.ExcelTimestampToLuaData(CharData.CharBirthday)
  local RecordTable = {
    {
      GText("UI_Chardata_Char_Sex"),
      GText(not CharData.CharSex and "UI_Chardata_Char_Male" or "UI_Chardata_Char_Female")
    },
    {
      GText("UI_Chardata_Char_BrithPlace"),
      GText(CharData.CharBirth)
    },
    {
      GText("UI_Chardata_Char_Brithday"),
      GDate("Date_MD", {
        Year = year,
        Month = month,
        Day = day
      }, CommonConst.SystemLanguage)
    },
    {
      GText("UI_Chardata_Char_Force"),
      GText(CharData.CharForce)
    }
  }
  self:StopAttrListFramingIn(self.List_Record)
  self.List_Record:ClearListItems()
  for i, value in ipairs(RecordTable) do
    local Obj = NewObject(UIUtils.GetCommonItemContentClass())
    Obj.AttrName = value[1]
    Obj.AttrValue = value[2]
    Obj.Idx = i
    self.List_Record:AddItem(Obj)
  end
  self.List_Record:ScrollToTop()
  self:AddTimer(0.01, function()
    self.List_Record:RegenerateAllEntries()
    self:PlayAttrListFramingIn(self.List_Record)
  end)
end

function M:UpdateDispatchList(Target)
  self.List_Ability:ClearListItems()
  local CharData = Target:Data()
  if CharData and CharData.DispatchTag then
    local DispatchTags = CharData.DispatchTag
    local DispatchUnlock = CharData.DispatchUnlock or {}
    local CharDispatchTagTable = DataMgr.CharDispatchTag
    local CharDispatchTagData
    for index, value in ipairs(DispatchTags) do
      CharDispatchTagData = CharDispatchTagTable[value]
      if CharDispatchTagData then
        local Obj = NewObject(UIUtils.GetCommonItemContentClass())
        Obj.Owner = self
        Obj.Icon = CharDispatchTagData.Icon
        Obj.Name = GText(CharDispatchTagData.Name)
        Obj.DispatchTag = value
        Obj.Description = GText(CharDispatchTagData.Description)
        local UnlockLevel = DispatchUnlock[index]
        if UnlockLevel then
          if UnlockLevel <= Target.EnhanceLevel then
            Obj.Unlocked = true
          else
            Obj.HintText = string.format(GText("UI_Armory_Dispatch_Locked"), UnlockLevel)
          end
        end
        self.List_Ability:AddItem(Obj)
      end
    end
  end
end

function M:OnBtnVoiceClicked()
  local UIConfig = DataMgr.SystemUI.ArmoryFile
  UIManager(self):LoadUI(UIConst.LoadInConfig, UIConfig.UIName, self.Parent:GetZOrder(), CommonConst.ArmoryType.Char, self.Target, ArmoryUtils.FilesTabType[1], false)
end

function M:OnBtnRecordClicked()
  local UIConfig = DataMgr.SystemUI.ArmoryFile
  UIManager(self):LoadUI(UIConst.LoadInConfig, UIConfig.UIName, self.Parent:GetZOrder(), CommonConst.ArmoryType.Char, self.Target, ArmoryUtils.FilesTabType[2], true)
end

function M:OnBtnShowPicClicked()
  if not self.Target then
    return
  end
  UIManager(self):LoadUI(UIConst.CHARPIECTURE, "CharPicture", self.Parent:GetZOrder(), self.Target.CharId)
end

function M:PlayInAnim()
  self:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  self.LevelInfo:PlayStarsInAnim()
  self:PlayAnimation(self.In)
end

function M:PlayOutAnim()
  self:PlayAnimation(self.Out)
  self:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
end

function M:OnAnimationFinished(Animation)
  if self.In == Animation then
    self:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  elseif self.Out == Animation then
    self:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

function M:OnFocusReceived(MyGeometry, InFocusEvent)
  if not self.List_Ability:HasAnyUserFocus() then
    self.List_Ability:NavigateToIndex(0)
  end
  return UWidgetBlueprintLibrary.SetUserFocus(UWidgetBlueprintLibrary.Handled(), self.List_Ability)
end

function M:InitNavigationRules()
  self.List_Ability:SetNavigationRuleBase(EUINavigation.Up, EUINavigationRule.Stop)
  if self.Btn_ShowPic:IsVisible() then
    self.Btn_ShowPic:SetNavigationRuleCustom(EUINavigation.Up, function()
      local Content = self.List_Ability:GetItemAt(self.List_Ability:GetNumItems() - 1)
      if Content and Content.UI then
        return Content.UI
      else
        return self.List_Ability
      end
    end)
    self.Btn_ShowPic:SetNavigationRuleBase(EUINavigation.Down, EUINavigationRule.Stop)
    self.List_Ability:SetNavigationRuleCustom(EUINavigation.Down, function()
      return self.Btn_ShowPic
    end)
  else
    self.List_Ability:SetNavigationRuleBase(EUINavigation.Down, EUINavigationRule.Stop)
  end
end

function M:SetTipsMode(bTipsMode)
  if self.CurInputDevice == ECommonInputType.Gamepad then
    self.Btn_Voice:SetPCVisibility(bTipsMode)
    self.Btn_Record:SetPCVisibility(bTipsMode)
  end
end

function M:OnParentKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if InKeyName == Const.GamepadFaceButtonLeft then
    self:OnBtnVoiceClicked()
    return UE4.UWidgetBlueprintLibrary.Handled(), true
  elseif InKeyName == Const.GamepadFaceButtonUp then
    self:OnBtnRecordClicked()
    return UE4.UWidgetBlueprintLibrary.Handled(), true
  end
  return UE4.UWidgetBlueprintLibrary.Unhandled(), false
end

function M:OnAddedToFocusPath()
  if self._OnAddedToFocusPath then
    self._OnAddedToFocusPath(self.Parent, self)
  end
end

function M:OnRemovedFromFocusPath()
  if self._OnRemovedFromFocusPath then
    self._OnRemovedFromFocusPath(self.Parent, self)
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
  self.CurGamepadName = CurGamepadName
  local IsUseKeyAndMouse = CurInputDevice == ECommonInputType.MouseAndKeyboard
  local ActiveWidgetIndex = IsUseKeyAndMouse and 0 or 1
  if IsUseKeyAndMouse then
  else
  end
  self.CurInputDevice = CurInputDevice
end

function M:Destruct()
  if self.ListenReddotName then
    ReddotManager.RemoveListener(self.ListenReddotName, self)
  end
end

AssembleComponents(M)
return M
