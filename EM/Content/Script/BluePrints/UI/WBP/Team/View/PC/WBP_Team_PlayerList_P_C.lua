require("UnLua")
local TeamModel = TeamController:GetModel()
local M = Class({
  "BluePrints.UI.WBP.Team.View.WBP_Team_PlayerList_Base"
})

function M:InitUIInfo(Name, bInUIMode, EventList, ...)
  self.bIniting = true
  M.Super.InitUIInfo(self, Name, bInUIMode, EventList, ...)
  local PlayerChar = GWorld:GetMainPlayer()
  PlayerChar:FlushInputKeyExceptMove()
  if GWorld:IsStandAlone() then
    if not PlayerChar:CheckForbidTags("BattleWheelForbid") then
      PlayerChar:AddForbidTag("BattleWheelForbid")
    end
    PlayerChar.Controller:AddDisableRotationInputTag("OpenTeamInfoUI")
    local GameInputSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(self)
    if IsValid(GameInputSubsystem) then
      local Params = FGameInputModeParams()
      Params.WidgetToFocus = self
      Params.bShowMouseCursor = true
      Params.MouseLockMode = EMouseLockMode.DoNotLock
      GameInputSubsystem:EnableInputMode(self.WidgetName or self.ConfigName, EGameInputMode.GameAndUI, Params)
    end
  else
    self:SetFocus()
  end
  self:OnMenuOpenChanged(false)
  self.Key_Select:CreateSubKeyDesc({
    Type = "Img",
    Desc = GText("UI_SWITCH"),
    KeyInfoList = {
      {
        Owner = self,
        Type = "Img",
        ImgShortPath = "Vertical"
      }
    }
  })
  self.Key_A:CreateSubKeyDesc({
    Type = "Img",
    Desc = GText("UI_Tips_Ensure"),
    KeyInfoList = {
      {
        Owner = self,
        Type = "Img",
        ImgShortPath = "A"
      }
    }
  })
  self.Btn_Invite:SetGamePadImg("Y")
  self.Btn_Leave:SetGamePadImg("X")
  UIManager(self):GetGameInputModeSubsystem().OnInputMethodChanged:Add(self, self.OnInputDeviceChange)
  UIManager(self):SetDisableAnalongNavigation(true)
  self.LastIsGamepad = TeamController:IsGamepad()
  self:OnInputDeviceChange()
  if TeamController:IsGamepad() then
    self:FocusToFirstTeammate()
  else
    self:SetFocus()
  end
  self.bOpenBtnList = false
  self.OpenedUid = nil
  self.bIniting = false
end

function M:OnInputDeviceChange()
  if TeamController:IsGamepad() then
    self.Panel_GamePad:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  elseif not TeamController:IsMobile() then
    self.Panel_GamePad:SetVisibility(UIConst.VisibilityOp.Collapsed)
    if not self.bIniting and self.LastIsGamepad then
      self:Close()
    end
  end
  self.LastIsGamepad = TeamController:IsGamepad()
end

function M:FocusToFirstTeammate()
  for _, Widget in pairs(self.WB_Player:GetAllChildren()) do
    Widget:SetNavigationRuleBase(EUINavigation.Up, EUINavigationRule.Escape)
  end
  local FirstTeammate = self.WB_Player:GetChildAt(0)
  FirstTeammate:SetNavigationRuleBase(EUINavigation.Up, EUINavigationRule.Stop)
  FirstTeammate:SetFocus()
end

function M:FocusUIByUid(Uid)
  if TeamModel:IsYourself(Uid) then
    self.Mine:SetFocus()
  else
    local TeammateBar = self.Teammate2UI[Uid]
    if IsValid(TeammateBar) then
      TeammateBar:SetFocus()
    end
  end
  self.bOpenBtnList = false
  self.OpenedUid = nil
end

function M:OnFocusLost()
  if self:HasUserFocusedDescendants(GWorld:GetMainPlayer().Controller) then
    return
  end
  self:StopAnimation(self.Auto_In)
  self:Close()
end

function M:OnMenuOpenChanged(bOpen)
  if not bOpen then
    self.Key_Back:CreateSubKeyDesc({
      Type = "Img",
      Desc = GText("UI_BACK"),
      KeyInfoList = {
        {
          Owner = self,
          Type = "Img",
          ImgShortPath = UIUtils.GetIconListByActionName("ShowTeamInfo")[1]
        }
      }
    })
  else
    self.Key_Back:CreateSubKeyDesc({
      Type = "Img",
      Desc = GText("UI_BACK"),
      KeyInfoList = {
        {
          Owner = self,
          Type = "Img",
          ImgShortPath = "B"
        }
      }
    })
  end
end

function M:Close()
  local BattleMain = UIManager(self):GetUIObj("BattleMain")
  Traceback("\229\147\170\233\135\140\232\176\131\231\148\168\228\186\134Close")
  BattleMain:PlayAnimation(BattleMain.Team_In)
  local PlayerChar = GWorld:GetMainPlayer()
  if GWorld:IsStandAlone() then
    PlayerChar:MinusForbidTag("BattleWheelForbid")
    PlayerChar.Controller:RemoveDisableRotationInputTag("OpenTeamInfoUI")
    self:SetInputUIOnly(false)
  end
  UIManager(self):GetGameInputModeSubsystem().OnInputMethodChanged:Remove(self, self.OnInputDeviceChange)
  UIManager(self):SetDisableAnalongNavigation(false)
  self.IsInit = true
  M.Super.Close(self)
end

function M:_UpdateMemberTag(Uid)
  if TeamModel:IsYourself(Uid) then
    self.Mine:UpdateTag()
  elseif self.Teammate2UI[Uid] then
    self.Teammate2UI[Uid]:UpdateTag()
  end
end

function M:OnKeyUp(MyGeo, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  DebugPrint(DebugTag, LXYTag, "Team_Playerlist_P  OnKeyUp", InKeyName)
  local InputAction = DataMgr.KeyboardMap.ShowTeamInfo
  if InKeyName == InputAction.Key then
    DebugPrint(DebugTag, LXYTag, "\229\133\179\233\151\173TeamInfoUI")
    self:StopAnimation(self.Auto_In)
    self:Close()
  end
  return UIUtils.Handled
end

function M:OnPreviewKeyDown(MyGeo, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local InputAction = DataMgr.GamepadMap.ShowTeamInfo
  if InKeyName == "Gamepad_" .. InputAction.GamepadKey[1] then
    DebugPrint(DebugTag, LXYTag, "\229\133\179\233\151\173TeamInfoUI")
    self:StopAnimation(self.Auto_In)
    self:Close()
  end
  return UIUtils.Unhandled
end

function M:OnKeyDown(MyGeometry, InKeyEvent)
  M.Super.OnKeyDown(self, MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if InKeyName == UIConst.GamePadKey.FaceButtonRight then
    if self.bOpenBtnList then
      self:FocusUIByUid(self.OpenedUid)
    end
  elseif InKeyName == UIConst.GamePadKey.FaceButtonLeft then
    self.Btn_Leave:OnBtnClicked()
  elseif InKeyName == UIConst.GamePadKey.FaceButtonTop then
    self.Btn_Invite:OnBtnClicked()
  end
  return UIUtils.Handled
end

function M:OnMouseButtonDown(MyGeo, InMouseEvent)
  return UE4.UWidgetBlueprintLibrary.Handled()
end

return M
