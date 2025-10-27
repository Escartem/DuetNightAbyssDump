require("UnLua")
local ArmoryUtils = require("BluePrints.UI.WBP.Armory.ArmoryUtils")
local M = Class("Blueprints.UI.BP_UIState_C")
M._components = {
  "BluePrints.UI.UIComponent.StarsUIComponent"
}

function M:Construct()
end

function M:OnLoaded(...)
  self.Super.OnLoaded(self, ...)
  self.Text_Title:SetText(GText("UI_CharTrial_CharIntro"))
  self.Btn_Close.OnClicked:Add(self, self.CloseSelf)
  self.Btn_FullScreen.OnClicked:Add(self, self.CloseSelf)
  if CommonUtils.GetDeviceTypeByPlatformName(self) ~= "Mobile" then
    self.Switcher_Text:SetVisibility(UIConst.VisibilityOp.Visible)
    self.Text_Tips_1:SetVisibility(UIConst.VisibilityOp.Collapsed)
  else
    self.Text_Tips:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  self.ConfigData = (...)
  self:RefreshBaseInfo()
  self:SetFocus()
  self:InitItems()
  self:PlayInAnim()
  AudioManager(self):PlayUISound(nil, "event:/ui/common/role_trial_level_panel_show", "TrialCharacterSkills", nil)
end

function M:PlayInAnim()
  self:PlayAnimation(self.In)
end

function M:PlayAnimOut()
  self:PlayAnimation(self.Out)
end

function M:InitItems()
  local Avatar = GWorld:GetAvatar()
  local CharId
  if Avatar then
    local GameInstance = GWorld.GameInstance
    local Player = UE4.UGameplayStatics.GetPlayerCharacter(GameInstance, 0)
    if Player and Player.PlayerState then
      CharId = Player.PlayerState.CharId
    end
  end
  local Char = DataMgr.BattleChar[CharId]
  local BigIcon = DataMgr.Char[CharId].BigIcon
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  if GameMode and GameMode.PreInitInfo.CharTrialId then
    local QuestRoleId = DataMgr.CharTrial[GameMode.PreInitInfo.CharTrialId].QuestRoleId
    if QuestRoleId then
      local CharTemplateId = DataMgr.QuestRoleInfo[QuestRoleId].CharTemplateRuleId
      if CharTemplateId then
        local CharCostumeId = DataMgr.CharTemplate[CharTemplateId].CharCostumeId
        if CharCostumeId then
          local SkinId = DataMgr.CharCostumeTemplate[CharCostumeId].SkinId
          BigIcon = DataMgr.Skin[SkinId].BigIcon
        else
          DebugPrint("ljh@\232\175\149\231\142\169Icon\232\175\187\229\143\150\229\164\177\232\180\165\239\188\140CharCostumeId\228\184\186\231\169\186,CharTrialId\228\184\186:" .. tostring(GameMode.PreInitInfo.CharTrialId))
        end
      else
        DebugPrint("ljh@\232\175\149\231\142\169Icon\232\175\187\229\143\150\229\164\177\232\180\165\239\188\140CharTemplateId\228\184\186\231\169\186,CharTrialId\228\184\186:" .. tostring(GameMode.PreInitInfo.CharTrialId))
      end
    else
      DebugPrint("ljh@\232\175\149\231\142\169Icon\232\175\187\229\143\150\229\164\177\232\180\165\239\188\140QuestRoleId\228\184\186\231\169\186,CharTrialId\228\184\186:" .. tostring(GameMode.PreInitInfo.CharTrialId))
    end
  else
    DebugPrint("ljh@\232\175\149\231\142\169Icon\232\175\187\229\143\150\229\164\177\232\180\165\239\188\140CharTrialId\228\184\186\231\169\186")
  end
  local AttrName = Char.Attribute
  self.Text_Name:SetText(GText(Char.CharName))
  local IconName = "Armory_" .. AttrName
  local AttributeIcon = LoadObject("/Game/UI/Texture/Dynamic/Atlas/Armory/T_" .. IconName .. ".T_" .. IconName)
  if BigIcon then
    local BigIconObj = LoadObject(BigIcon)
    if BigIconObj and GameMode and GameMode.PreInitInfo.CharTrialId then
      local CharTrialId = GameMode.PreInitInfo.CharTrialId
      local OffsetU = DataMgr.CharTrial[CharTrialId].UOffset
      local OffsetV = DataMgr.CharTrial[CharTrialId].VOffset
      local DynamicMaterial = self.Img_Role:GetDynamicMaterial()
      DynamicMaterial:SetTextureParameterValue("MainTex", BigIconObj)
      if OffsetU then
        DynamicMaterial:SetScalarParameterValue("Main_U_Offset", OffsetU)
      end
      if OffsetV then
        DynamicMaterial:SetScalarParameterValue("Main_V_Offset", OffsetV)
      end
    end
  else
    DebugPrint("ljh@\232\175\149\231\142\169Icon\232\175\187\229\143\150\229\164\177\232\180\165IconPath\228\184\186\231\169\186")
  end
  self.Image_Element:SetBrushResourceObject(AttributeIcon or LoadObject("/Game/UI/Texture/Dynamic/Atlas/Armory/T_Armory_Default.T_Armory_Default"))
  self.List_Item:ClearListItems()
  local Id = 0
  for _, Skill in ipairs(Char.SkillList) do
    local SkillData = DataMgr.Skill[Skill]
    if SkillData and SkillData[1] and SkillData[1][0] then
      local Obj = NewObject(UIUtils.GetCommonItemContentClass())
      Obj.SkillId = Skill
      Obj.Owner = self
      Obj.Id = Id
      self.List_Item:AddItem(Obj)
      Id = Id + 1
    end
  end
end

function M:CloseSelf()
  AudioManager(self):SetEventSoundParam(nil, "TrialCharacterSkills", {ToEnd = 1})
  self:Close()
end

function M:RefreshBaseInfo()
  local GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(self)
  if IsValid(GameInputModeSubsystem) then
    self:RefreshOpInfoByInputDevice(GameInputModeSubsystem:GetCurrentInputType())
  end
end

function M:OnKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if "Escape" == InKeyName then
    self:CloseSelf()
  end
end

function M:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  local IsUseKeyAndMouse = CurInputDevice == ECommonInputType.MouseAndKeyboard
  self:UpdateUIVisibility(IsUseKeyAndMouse)
  self.Super.RefreshOpInfoByInputDevice(self, CurInputDevice, CurGamepadName)
  if IsUseKeyAndMouse then
  else
    local AllItemCount = self.List_Item:GetNumItems()
    self:AddTimer(0.01, function()
      for i = 0, AllItemCount - 1 do
        local Item = self.List_Item:GetItemAt(i)
        self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(self)
        self.GameInputModeSubsystem:SetTargetUIFocusWidget(Item.SelfWidget)
        self.GameInputModeSubsystem:UpdateCurrentFocusWidgetPos()
        Item.SelfWidget:SetFocus()
        return
      end
    end, false, 0, nil, true)
  end
end

function M:OnNavigateUp(Content)
end

function M:OnNavigateDown(Content)
end

function M:UpdateUIVisibility(IsUseKeyAndMouse)
  if CommonUtils.GetDeviceTypeByPlatformName(self) == "Mobile" then
    return
  end
  if not IsUseKeyAndMouse then
    self.Switcher_Text:SetActiveWidgetIndex(1)
    self.Gamepad_Shortcut01:CreateCommonKey({
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "RS"}
      },
      Desc = GText("\230\187\145\229\138\168\229\136\151\232\161\168")
    })
    self.Gamepad_Shortcut02:CreateCommonKey({
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "B"}
      },
      Desc = GText("UI_CharTrial_ClosePop")
    })
  else
    self.Switcher_Text:SetActiveWidgetIndex(0)
    self.Text_Tips_1:SetText(self.Tips)
  end
end

function M:GetTargetOffsetByIndex(Index)
  local EndOffset = self.ScrollBox:GetScrollOffsetOfEnd()
  return (Index - 1) * (EndOffset / (self.NumMax - 1))
end

function M:OnAnalogValueChanged(MyGeometry, InAnalogInputEvent)
  if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
    local InKey = UE4.UKismetInputLibrary.GetKey(InAnalogInputEvent)
    local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
    local AddOffset = UKismetInputLibrary.GetAnalogValue(InAnalogInputEvent) * 0.1
    if "Gamepad_RightY" == InKeyName then
      local CurScrollOffset = self.List_Item:GetScrollOffset()
      self.List_Item:SetScrollOffset(CurScrollOffset - AddOffset)
    end
    return UE4.UWidgetBlueprintLibrary.UnHandled()
  end
end

return M
