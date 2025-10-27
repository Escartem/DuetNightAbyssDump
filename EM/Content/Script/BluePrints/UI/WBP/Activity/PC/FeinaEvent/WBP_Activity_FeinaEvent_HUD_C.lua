require("UnLua")
local M = Class({
  "BluePrints.UI.BP_UIState_C"
})

function M:Construct()
  self.HideUITable = {
    Pos_Entry = 1,
    Pos_Drops = 1,
    Pos_SpecialDrops = 1,
    Pos_NewMonster = 1,
    Battle_Map = 1,
    Btn_Esc = 1,
    Btn_GuideBook = 1,
    Group_ChatEntry = 1,
    Buff = 1,
    Char_Skill = 1,
    Team = 1
  }
  self.PassiveEffectId = 18011
  self.IsLoading = true
  self.CollectLevel = 0
end

function M:InitUIInfo(Name, IsInUIMode, EventList, ...)
  self.Super.InitUIInfo(self, Name, IsInUIMode, EventList, ...)
  self.Player = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  self.FeinaPassive = self.Player:GetPassiveEffectById(self.PassiveEffectId)
  if not IsValid(self.FeinaPassive) then
    DebugPrint("\230\137\190\228\184\141\229\136\176FeinaPassive")
    return
  end
  self:InitDungeonInfo()
  self.ColorMax = self.FeinaPassive.ColorMax
  self:InitEsc()
  self:InitPaintInfo()
  self:InitCollectProgress()
  self:ChoosePaint(self.FeinaPassive.ColorIndex)
  self:ListenForInputAction("ChargeBullet", EInputEvent.IE_Pressed, false, {
    self,
    self.ChangeColor
  })
  self:InitListenEvents()
  if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
    self:AddDelayFrameFunc(function()
      self:InitGamepadView()
    end, 2)
  end
end

function M:InitListenEvents()
  self:AddDispatcher(EventID.OnRepFeinaStar, self, self.OnCollectFeinaStar)
  self:AddDispatcher(EventID.CloseLoading, self, self.OnCloseLoading)
  self:AddDispatcher(EventID.OnChangeKeyBoardSet, self, self.RefreshKeyName)
  self:AddDispatcher(EventID.OnSwitchGamepadSet, self, self.SetGamepadIcons)
end

function M:PlayInAnim()
  self:PlayAnimation(self.In)
end

function M:PlayOutAnim()
  self:PlayAnimation(self.Out)
end

function M:RefreshKeyName()
  local KeyName = CommonUtils:GetActionMappingKeyName("ChargeBullet")
  self.Key_Switch:CreateCommonKey({
    KeyInfoList = {
      {Type = "Text", Text = KeyName}
    },
    Desc = GText("FeinaEvent_DungeonColor_Switch")
  })
end

function M:SetGamepadIcons()
  local GamepadList = UIUtils.GetIconListByActionName("ChargeBullet")
  self.Controller_Switch:CreateSubKeyDesc({
    KeyInfoList = {
      {
        Type = "Img",
        ImgShortPath = GamepadList[1],
        Owner = self
      },
      {
        Type = "Img",
        ImgShortPath = GamepadList[2],
        Owner = self
      }
    },
    Type = "Add",
    Desc = GText("FeinaEvent_DungeonColor_Switch")
  })
end

function M:InitDungeonInfo()
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  if not IsValid(GameState) then
    DebugPrint("\230\137\190\228\184\141\229\136\176GameState")
    return
  end
  self.DungeonId = GameState.DungeonId
  local DungeonName = DataMgr.FeinaEventDungeon[self.DungeonId].DungeonName
  local DungeonDes = DataMgr.FeinaEventDungeon[self.DungeonId].DungeonSDes
  self.Text_Title:SetText(GText(DungeonName))
  self.Text_Target:SetText(GText(DungeonDes))
end

function M:InitEsc()
  self.Btn_Esc.bForceInvisible = nil
  self.Btn_Esc.Btn_top.OnClicked:Add(self, function()
    UIUtils.OpenEsc()
  end)
  self.Btn_Esc:LoadImage(11)
end

function M:InitPaintInfo()
  local KeyName = CommonUtils:GetActionMappingKeyName("ChargeBullet")
  local GamepadList = UIUtils.GetIconListByActionName("ChargeBullet")
  self.Key_Switch:CreateCommonKey({
    KeyInfoList = {
      {Type = "Text", Text = KeyName}
    },
    Desc = GText("FeinaEvent_DungeonColor_Switch")
  })
  self.Controller_Switch:CreateSubKeyDesc({
    KeyInfoList = {
      {
        Type = "Img",
        ImgShortPath = GamepadList[1],
        Owner = self
      },
      {
        Type = "Img",
        ImgShortPath = GamepadList[2],
        Owner = self
      }
    },
    Type = "Add",
    Desc = GText("FeinaEvent_DungeonColor_Switch")
  })
  self:InitPaintIcon()
end

function M:InitPaintIcon()
  for i = 1, 3 do
    if i <= self.ColorMax then
      self["Paint0" .. i]:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
      self["Paint0" .. i]:InitPaint(i)
    else
      self["Paint0" .. i]:SetVisibility(ESlateVisibility.Collapsed)
    end
  end
  if 1 == self.ColorMax then
    self.WS_Type:SetVisibility(ESlateVisibility.Collapsed)
  else
    self.WS_Type:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  end
end

function M:UpdatePaintIcon(ColorMax)
  self.ColorMax = ColorMax
  if self.IsLoading then
    self.NeedToast = true
  else
    self:InitHUDToast()
  end
end

function M:InitHUDToast()
  self:InitPaintIcon()
  AudioManager(self):PlayUISound(self, "event:/ui/activity/feina_brush_unlock", nil, nil)
  self.Toast = self:CreateWidgetNew("FeinaEventToast")
  self.Pos_Toast:AddChild(self.Toast)
  self.Toast.Text_Toast:SetText(GText("FeinaEvent_DungeonColor_Unlock"))
  self.Toast:PlayAnimation(self.Toast.In)
  self.Toast.Paint:InitPaint(self.ColorMax)
  self:AddTimer(self.ToastExistTime, function()
    self.Toast:PlayAnimation(self.Toast.Out)
  end, false, nil, nil, false)
end

function M:OnCloseLoading()
  self.IsLoading = false
  if self.NeedToast then
    self:InitHUDToast()
    self.NeedToast = false
  end
end

function M:InitCollectProgress()
  if not self.DungeonId then
    return
  end
  self.CollectTargets = DataMgr.FeinaEventDungeon[self.DungeonId].Level
  for Index, Target in ipairs(self.CollectTargets) do
    self.CollectProgress["Point0" .. Index].Text_Num:SetText(Target)
    self.CollectProgress["Point0" .. Index]:PlayAnimation(self.CollectProgress["Point0" .. Index].Normal)
    self.MaxTargetNum = Target
  end
  self.CollectProgress.Text_Num:SetText(0)
  self.CollectProgress.Bar:SetPercent(0)
end

function M:OnCollectFeinaStar(StarNum)
  AudioManager(self):PlayUISound(self, "event:/ui/activity/feina_add_feather", nil, nil)
  self:PlayAnimation(self.Add)
  self.CollectProgress:PlayAnimation(self.CollectProgress.Add)
  self.CollectProgress.Text_Num:SetText(StarNum)
  self.CollectProgress.Bar:SetPercent(StarNum / self.MaxTargetNum)
  for Index, Target in ipairs(self.CollectTargets) do
    if StarNum >= Target and Index > self.CollectLevel then
      self.CollectLevel = Index
      self.CollectProgress["Point0" .. Index]:StopAnimation(self.CollectProgress["Point0" .. Index].Normal)
      self.CollectProgress["Point0" .. Index]:PlayAnimation(self.CollectProgress["Point0" .. Index].Achieve)
    end
  end
end

function M:ChangeColor()
  self:AddDelayFrameFunc(function()
    self:ChoosePaint(self.FeinaPassive.ColorIndex)
  end, 2)
end

function M:ChoosePaint(Index)
  if Index > self.ColorMax then
    return
  end
  if Index == self.ColorIndex then
    return
  end
  self.ColorIndex = Index
  AudioManager(self):PlayUISound(self, "event:/ui/activity/feina_brush_change", nil, nil)
  for i = 1, 3 do
    if i <= self.ColorMax then
      if i == Index then
        self["Paint0" .. i]:PlayAnimation(self["Paint0" .. i].Click)
      else
        if self["Paint0" .. i]:IsAnimationPlaying(self["Paint0" .. i].Click) then
          self["Paint0" .. i]:StopAnimation(self["Paint0" .. i].Click)
        end
        self["Paint0" .. i]:PlayAnimation(self["Paint0" .. i].Normal)
      end
    end
  end
end

function M:OnUpdateUIStyleByInputTypeChange(CurInputType, CurGamepadName)
  self.Super.OnUpdateUIStyleByInputTypeChange(self, CurInputType, CurGamepadName)
  if CurInputType == ECommonInputType.Gamepad then
    self:InitGamepadView()
  else
    self:InitKeyBoardView()
  end
end

function M:InitGamepadView()
  self.WS_Type:SetActiveWidgetIndex(1)
end

function M:InitKeyBoardView()
  self.WS_Type:SetActiveWidgetIndex(0)
end

return M
