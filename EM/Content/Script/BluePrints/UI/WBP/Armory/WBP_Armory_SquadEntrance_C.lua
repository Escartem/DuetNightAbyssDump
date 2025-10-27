require("UnLua")
local WBP_Build_SquadEntrance_C = Class("BluePrints.UI.BP_UIState_C")

function WBP_Build_SquadEntrance_C:Construct()
  self:InitDeviceInfo()
  self:InitListenEvent()
  self:InitBtn()
  self.Btn_Click.OnClicked:Add(self, self.EnterSquadMainUI)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  local ConditionInId = DataMgr.UIUnlockRule.Squad and DataMgr.UIUnlockRule.Squad.ConditionId
  if not ConditionInId then
    GWorld.logger.error("DataMgr.UIUnlockRule.Squad.ConditionId \228\184\186 nil, \232\175\183\230\163\128\230\159\165\228\184\139UIUnlockRule\232\161\168\231\154\132\229\175\185\229\186\148\231\154\132\233\133\141\231\189\174\230\131\133\229\134\181")
    return
  end
  if not ConditionUtils.CheckCondition(Avatar, ConditionInId) then
    DebugPrint("thy   CheckSquadCondition false")
    return
  end
  if Avatar.Weapons[Avatar.MeleeWeapon] and Avatar.Weapons[Avatar.RangedWeapon] then
    Avatar:TryCreateDefaultSquad()
  else
    GWorld.logger.error("\229\136\155\229\187\186\233\187\152\232\174\164\231\154\132\233\162\132\232\174\190\233\152\181\229\174\185\229\164\177\232\180\165\228\186\134\239\188\140\229\136\155\229\187\186\233\187\152\232\174\164\233\162\132\232\174\190\233\152\181\229\174\185\231\154\132\230\157\161\228\187\182\230\152\175\232\167\146\232\137\178\232\186\171\228\184\138\230\139\165\230\156\137\228\184\128\230\138\138\232\191\145\230\136\152\230\173\166\229\153\168\229\146\140\228\184\128\230\138\138\232\191\156\231\168\139\230\173\166\229\153\168\239\188\140\231\156\139\229\136\176\232\191\153\230\157\161\228\191\161\230\129\175\232\161\168\231\164\186Avatar\233\135\140\230\178\161\230\137\190\229\136\176\228\189\160\231\154\132\228\184\164\230\138\138\230\173\166\229\153\168")
  end
end

function WBP_Build_SquadEntrance_C:InitUI()
  if self.CurInputDeviceType == ECommonInputType.Gamepad then
    local KeyInfo = {
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "Menu"}
      }
    }
    self.Key_Controller:CreateCommonKey(KeyInfo)
    self.Key_Controller:SetVisibility(ESlateVisibility.Visible)
    return
  end
  self.Key_Controller:SetVisibility(ESlateVisibility.Collapsed)
  self.Text_Build:SetText(GText("UI_Squad"))
end

function WBP_Build_SquadEntrance_C:EnterSquadMainUI()
  AudioManager(self):PlayUISound(nil, "event:/ui/common/click_btn_small", nil, nil)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  local ConditionInId = DataMgr.UIUnlockRule.Squad and DataMgr.UIUnlockRule.Squad.ConditionId
  if not ConditionInId then
    GWorld.logger.error("DataMgr.UIUnlockRule.Squad.ConditionId \228\184\186 nil, \232\175\183\230\163\128\230\159\165\228\184\139UIUnlockRule\232\161\168\231\154\132\229\175\185\229\186\148\231\154\132\233\133\141\231\189\174\230\131\133\229\134\181")
    return
  end
  if not ConditionUtils.CheckCondition(Avatar, ConditionInId) then
    DebugPrint("thy   CheckSquadCondition false")
    return
  end
  if Avatar.Weapons[Avatar.MeleeWeapon] and Avatar.Weapons[Avatar.RangedWeapon] then
    if 0 == CommonUtils.Size(Avatar.Squad) then
      Avatar:TryCreateDefaultSquad()
    end
    local SquadMainUI = UIManager(self):LoadUINew("SquadMainUINew")
  else
    GWorld.logger.error("\229\136\155\229\187\186\233\187\152\232\174\164\231\154\132\233\162\132\232\174\190\233\152\181\229\174\185\229\164\177\232\180\165\228\186\134\239\188\140\229\136\155\229\187\186\233\187\152\232\174\164\233\162\132\232\174\190\233\152\181\229\174\185\231\154\132\230\157\161\228\187\182\230\152\175\232\167\146\232\137\178\232\186\171\228\184\138\230\139\165\230\156\137\228\184\128\230\138\138\232\191\145\230\136\152\230\173\166\229\153\168\229\146\140\228\184\128\230\138\138\232\191\156\231\168\139\230\173\166\229\153\168\239\188\140\231\156\139\229\136\176\232\191\153\230\157\161\228\191\161\230\129\175\232\161\168\231\164\186Avatar\233\135\140\230\178\161\230\137\190\229\136\176\228\189\160\231\154\132\228\184\164\230\138\138\230\173\166\229\153\168")
  end
end

function WBP_Build_SquadEntrance_C:InitBtn()
  self.Btn_Click.OnClicked:Add(self, function()
    self:OnBtnClickClicked()
  end)
  self.Btn_Click.OnPressed:Add(self, function()
    self:OnBtnClickPressed()
  end)
  self.Btn_Click.OnHovered:Add(self, function()
    self:OnBtnClickHovered()
  end)
  self.Btn_Click.OnUnhovered:Add(self, function()
    self:OnBtnClickUnhovered()
  end)
  self:PlayAnimation(self.Normal)
end

function WBP_Build_SquadEntrance_C:OnBtnClickClicked()
  self:PlayAnimation(self.Click)
end

function WBP_Build_SquadEntrance_C:OnBtnClickPressed()
  self:PlayAnimation(self.Press)
end

function WBP_Build_SquadEntrance_C:OnBtnClickHovered()
  self:PlayAnimation(self.Hover)
end

function WBP_Build_SquadEntrance_C:OnBtnClickUnhovered()
  self:PlayAnimation(self.UnHover)
end

function WBP_Build_SquadEntrance_C:InitDeviceInfo()
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
  if IsValid(self.GameInputModeSubsystem) then
    self:RefreshOpInfoByInputDevice(self.GameInputModeSubsystem:GetCurrentInputType(), self.GameInputModeSubsystem:GetCurrentGamepadName())
  end
end

function WBP_Build_SquadEntrance_C:InitListenEvent()
  if IsValid(self.GameInputModeSubsystem) then
    self.GameInputModeSubsystem.OnInputMethodChanged:Add(self, self.RefreshOpInfoByInputDevice)
  end
end

function WBP_Build_SquadEntrance_C:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  DebugPrint("thy     CurGamepadName", CurGamepadName)
  self.CurInputDeviceType = CurInputDevice
  self.CurGamepadName = CurGamepadName
  self:InitUI()
end

return WBP_Build_SquadEntrance_C
