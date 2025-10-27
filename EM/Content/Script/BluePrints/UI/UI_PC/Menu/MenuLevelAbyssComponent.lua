local Component = {}

function Component:InitAbyss()
  self:InitAbyssRoomInfo()
  self:InitAbyssUi()
  self:HandleAbyssRoomSelection(self.AbyssDungeonIndex)
  self.Abyss_Btn_L.Btn_Click.OnClicked:Add(self, function()
    self:HandleAbyssRoomSelection(1)
  end)
  self.Abyss_Btn_R.Btn_Click.OnClicked:Add(self, function()
    self:HandleAbyssRoomSelection(2)
  end)
end

function Component:InitAbyssUi()
  self.Abyss_Team.Text_Title:SetText(GText("Abyss_PartySetup"))
  table.remove(self.BtnName, 3)
  table.remove(self.ClickFunction, 3)
  table.insert(self.BtnName, "UI_TEMPLE_RESTART")
  table.insert(self.ClickFunction, "AbyssRestart")
  table.insert(self.BtnName, "UI_Rouge_ESC_EndOut")
  table.insert(self.ClickFunction, "OnClickExitGame")
  if not ModController:IsMobile() then
    self.Key_L:CreateCommonKey({
      KeyInfoList = {
        {Type = "Text", Text = "A"}
      }
    })
    self.Key_R:CreateCommonKey({
      KeyInfoList = {
        {Type = "Text", Text = "D"}
      }
    })
    self.Key_Controller_Abyss_L:CreateCommonKey({
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "LT"}
      }
    })
    self.Key_Controller_Abyss_R:CreateCommonKey({
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "RT"}
      }
    })
  end
  self.WidgetSwitcher_Show:SetActiveWidgetIndex(1)
  self.WidgetSwitcher_Type:SetActiveWidgetIndex(2)
  if self.BRoomNum then
    self.WidgetSwitcher_AbyssTitle:SetActiveWidgetIndex(1)
    self.Abyss_Btn_L.Text_Title:SetText(GText("Abyss_DungeonA"))
    self.Abyss_Btn_R.Text_Title:SetText(GText("Abyss_DungeonB"))
  else
    self.WidgetSwitcher_AbyssTitle:SetActiveWidgetIndex(0)
    self.Text_Title_Single:SetText(GText("Abyss_DungeonA"))
  end
end

function Component:InitAbyssRoomInfo()
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  local AbyssLogicServerInfo = GameMode:GetDungeonComponent().AbyssLogicServerInfo
  self.AbyssId = AbyssLogicServerInfo.AbyssId
  self.AbyssLevelId = AbyssLogicServerInfo.AbyssLevelId
  self.AbyssDungeonIndex = AbyssLogicServerInfo.AbyssDungeonIndex
  self.AbyssRoomIndex = GameMode:TriggerDungeonComponentFun("GetAbyssRoomIndex")
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    DebugPrint("thy      AbyssSettlement can not get Avatar!!!")
    return
  end
  self.AbyssName = GText(DataMgr.AbyssSeason[self.AbyssId].AbyssIdName)
  local levelName = string.format(GText("Abyss_LevelName"), self.AbyssLevelId)
  self.AbyssTitle = string.format(GText(self.AbyssName) .. " <Highlight>%s</>", levelName)
  self.Text_Abyss_Floor:SetText(self.AbyssTitle)
  self.Panel_Abyss_Floor:SetVisibility(UE4.ESlateVisibility.Visible)
  self.AbyssInfo = Avatar.Abysses[self.AbyssId]
  if not self.AbyssInfo then
    DebugPrint("thy     self.AbyssInfo is nil")
    return
  end
  self.AbyssLevelInfo = self.AbyssInfo.AbyssLevelList[self.AbyssLevelId]
  if not self.AbyssLevelInfo then
    DebugPrint("thy      self.AbyssLevelInfo is nil")
    return
  end
  self.AbyssProgress = self.AbyssLevelInfo.AbyssLevelProgress
  self.PassARoomNum = self.AbyssProgress[1]
  self.PassBRoomNum = self.AbyssProgress[2]
  DebugPrint("thy    self.PassARoomNum", self.PassARoomNum)
  DebugPrint("thy    self.PassBRoomNum", self.PassBRoomNum)
  self.PreAbyssLevelProgress = GWorld.GameInstance.PreAbyssLevelProgress
  self.MaxAbyssLevelProgress = self.AbyssLevelInfo.MaxAbyssLevelProgress
  DebugPrint("thy    self.MaxAbyssLevelProgress", self.MaxAbyssLevelProgress)
  self.ARoomNum = self.AbyssLevelInfo.DungeonReward1
  self.BRoomNum = self.AbyssLevelInfo.DungeonReward2
  self.AbyssTeamInfo = self.AbyssLevelInfo.AbyssLockedTeamList
end

function Component:RefreshAbyssRoomInfo(index)
  local totalRooms = 5
  for i = 1, totalRooms do
    local routeWidget = self["Abyss_Route_" .. i]
    if routeWidget then
      routeWidget:StopAnimation(routeWidget.Pass)
      routeWidget:StopAnimation(routeWidget.Present)
      routeWidget:StopAnimation(routeWidget.Later)
      routeWidget:PlayAnimation(routeWidget.Later)
      local floorText = GText(string.format(GText("Abyss_NextDungeonShow"), GText("UI_Chardata_Data_Num_" .. i)))
      routeWidget.Text_Floor:SetText(floorText)
    end
  end
  if index ~= self.AbyssDungeonIndex then
    local nextPassRoom = self.PassBRoomNum
    if 1 == index then
      nextPassRoom = self.PassARoomNum
    end
    for i = 1, nextPassRoom do
      local routeWidget = self["Abyss_Route_" .. i]
      if routeWidget then
        routeWidget:StopAnimation(routeWidget.Later)
        routeWidget:PlayAnimation(routeWidget.Pass)
      end
    end
    return
  end
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  if not GameMode then
    return
  end
  local currentRoomIndex = self.AbyssRoomIndex or 0
  local DisplayRemainTime = 0
  local bShowTime = false
  local bIsNextRoom = false
  local AbyssBattleTime = false
  DisplayRemainTime = CommonUtils.GetClientTimerStructRemainTime("AbyssNextRoom")
  if DisplayRemainTime >= 0 then
    bIsNextRoom = true
  end
  if DisplayRemainTime <= 0 then
    DisplayRemainTime = CommonUtils.GetClientTimerStructRemainTime("AbyssBattle")
  end
  if DisplayRemainTime <= 0 then
    AbyssBattleTime = true
    DisplayRemainTime = CommonUtils.GetClientTimerStructRemainTime("AbyssBattleNew")
  end
  if DisplayRemainTime >= 0 then
    bShowTime = true
  end
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  for i = 1, totalRooms do
    local routeWidget = self["Abyss_Route_" .. i]
    if routeWidget then
      local MaxNum = GameState and GameState.AbyssBattleMaxNum or 1
      local Count = GameState and GameState.AbyssBattleCount or 0
      if 5 == currentRoomIndex then
        if AbyssBattleTime and -1 == Count then
          Count = 1
        else
          Count = 0
        end
        MaxNum = 1
      end
      if i == currentRoomIndex then
        self.Time_Abyss:SetVisibility(UE4.ESlateVisibility.Visible)
        if bShowTime or 1 ~= currentRoomIndex or Count > 0 then
          if bIsNextRoom then
            self.WS_Type_Abyss:SetActiveWidgetIndex(2)
            self.Text_Next_Abyss:SetText(GText("TARGET_DUNGEON_Abyss_Switch"))
          else
            self.WS_Type_Abyss:SetActiveWidgetIndex(1)
            if Count < MaxNum then
              self.Text_Finish_Abyss:SetColorAndOpacity(UE4.UUIFunctionLibrary.StringToSlateColor("DA2A4A"))
            else
              self.Text_Finish_Abyss:SetColorAndOpacity(UE4.UUIFunctionLibrary.StringToSlateColor("FFFFFF"))
            end
            self.Text_Progress_Abyss:SetText(GText("UI_AbyssRoom_Count"))
            if -1 == Count then
              Count = 0
            end
            self.Text_Finish_Abyss:SetText(tostring(Count))
            self.Text_All_Abyss:SetText(tostring(MaxNum))
            if DisplayRemainTime < 0 then
              DisplayRemainTime = 0
            end
            local Minute = math.floor(DisplayRemainTime / 60)
            local Second = math.floor(DisplayRemainTime % 60)
            local TimeDict = {}
            table.insert(TimeDict, 1, {TimeType = "Min", TimeValue = Minute})
            table.insert(TimeDict, 2, {TimeType = "Sec", TimeValue = Second})
            self.Time_Abyss:SetTimeText("", TimeDict)
            self.Time_Abyss.Text_TimeTitle:SetText(GText("Abyss_Battle_RemainTime"))
          end
        else
          self.WS_Type_Abyss:SetActiveWidgetIndex(0)
          self.Text_Start_Abyss:SetText(GText("UI_AbyssRoom_BattleStart1"))
          self.Time_Abyss:SetVisibility(UE4.ESlateVisibility.Collapsed)
        end
      end
      routeWidget:StopAnimation(routeWidget.Later)
      if i < currentRoomIndex then
        routeWidget:PlayAnimation(routeWidget.Pass)
      elseif i == currentRoomIndex then
        routeWidget:PlayAnimation(routeWidget.Present)
        if Count == MaxNum then
          routeWidget:StopAnimation(routeWidget.Present_Hide)
          routeWidget:StopAnimation(routeWidget.Present)
          routeWidget:PlayAnimation(routeWidget.Pass)
        end
      else
        routeWidget:PlayAnimation(routeWidget.Later)
      end
      routeWidget:SetVisibility(UE4.ESlateVisibility.Visible)
    end
  end
end

function Component:RefreshAbyssTeamInfo(index)
  local TeamInfo = self.AbyssTeamInfo[index]
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  local CharInfo = DataMgr.Char
  local WeaponInfo = DataMgr.Weapon
  local PetInfo = DataMgr.Pet
  if not (CharInfo and WeaponInfo) or not PetInfo then
    DebugPrint("thy   CharInfo or WeaponInfo or PetInfo is nil")
    return
  end
  local Char = Avatar.Chars[TeamInfo.Char]
  local MeleeWeapon = Avatar.Weapons[TeamInfo.MeleeWeapon]
  local RangedWeapon = Avatar.Weapons[TeamInfo.RangedWeapon]
  local Pet = Avatar.Pets[TeamInfo.Pet]
  local Phantom1 = Avatar.Chars[TeamInfo.Phantom1]
  local PhantomWeapon1 = Phantom1 and Avatar.Weapons[TeamInfo.PhantomWeapon1]
  local Phantom2 = Avatar.Chars[TeamInfo.Phantom2]
  local PhantomWeapon2 = Phantom2 and Avatar.Weapons[TeamInfo.PhantomWeapon2]
  local iconData = {
    {
      slot = self.Abyss_Team.Character,
      icon = Char and CharInfo[Char.CharId].Icon,
      type = "Char"
    },
    {
      slot = self.Abyss_Team.Melee,
      icon = MeleeWeapon and WeaponInfo[MeleeWeapon.WeaponId].Icon,
      type = "Weapon"
    },
    {
      slot = self.Abyss_Team.Range,
      icon = RangedWeapon and WeaponInfo[RangedWeapon.WeaponId].Icon,
      type = "Weapon"
    },
    {
      slot = self.Abyss_Team.Pet,
      icon = Pet and PetInfo[Pet.PetId].Icon,
      type = "Pet"
    },
    {
      slot = self.Abyss_Team.Phantom01,
      icon = Phantom1 and CharInfo[Phantom1.CharId].Icon,
      type = "Char"
    },
    {
      slot = self.Abyss_Team.Phantom_Weapon01,
      icon = PhantomWeapon1 and WeaponInfo[PhantomWeapon1.WeaponId].Icon,
      type = "Weapon"
    },
    {
      slot = self.Abyss_Team.Phantom02,
      icon = Phantom2 and CharInfo[Phantom2.CharId].Icon,
      type = "Char"
    },
    {
      slot = self.Abyss_Team.Phantom_Weapon02,
      icon = PhantomWeapon2 and WeaponInfo[PhantomWeapon2.WeaponId].Icon,
      type = "Weapon"
    }
  }
  for _, data in ipairs(iconData) do
    local slot = data.slot
    local icon = data.icon
    local type = data.type
    if slot then
      if icon then
        slot.IsEmpty = false
        slot.Icon_Empty:SetVisibility(UE4.ESlateVisibility.Collapsed)
        slot.Icon_Item:SetVisibility(UE4.ESlateVisibility.HitTestInvisible)
        if slot.WeaponSlot then
          slot.WeaponSlot:SetForbidden(false)
        end
        slot:SetIcon(icon)
        slot:SetSoundPath(type)
      else
        slot.IsEmpty = true
        slot.Icon_Empty:SetVisibility(UE4.ESlateVisibility.HitTestInvisible)
        slot.Icon_Item:SetVisibility(UE4.ESlateVisibility.Collapsed)
      end
      slot.AbyssMenu = self
    end
  end
end

function Component:AbyssRestart()
  if self.IsEditOpen then
    self.IsEditOpen = false
    self:PlayAnimation(self.Edit_List_Out)
  end
  local Params = {}
  Params.RightCallbackObj = self
  Params.RightCallbackFunction = self.ClickConfirmAbyssRestart
  UIManager(self):ShowCommonPopupUI(100216, Params, self)
end

function Component:ClickConfirmAbyssRestart()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    DebugPrint("thy     \229\133\179\229\141\161\232\175\166\230\131\133\231\149\140\233\157\162\232\191\155\229\133\165\229\133\179\229\141\161\229\164\177\232\180\165\239\188\140Avatar\232\142\183\229\143\150\229\164\177\232\180\165")
    return
  end
  Avatar:TriggerReEnterAbyss()
  self:CloseSelf()
end

function Component:RefreshAbyssUiWhenInputChange(CurInputDevice)
  if ModController:IsMobile() then
    return
  end
  if not self.BRoomNum then
    return
  end
  if CurInputDevice == ECommonInputType.MouseAndKeyboard then
    self.WS_Abyss_L:SetActiveWidgetIndex(0)
    self.WS_Abyss_R:SetActiveWidgetIndex(0)
    self.KeyTips:SetVisibility(UIConst.VisibilityOp.Collapsed)
  else
    self.WS_Abyss_L:SetActiveWidgetIndex(1)
    self.WS_Abyss_R:SetActiveWidgetIndex(1)
    self.KeyTips:UpdateKeyInfo({
      {
        KeyInfoList = {
          {Type = "Img", ImgShortPath = "X"}
        },
        Desc = GText("UI_COMMONPOP_TITLE_100096")
      },
      {
        KeyInfoList = {
          {Type = "Img", ImgShortPath = "A"}
        },
        Desc = GText("UI_Tips_Ensure")
      },
      {
        KeyInfoList = {
          {Type = "Img", ImgShortPath = "B"}
        },
        Desc = GText("UI_Tips_Close")
      }
    })
    self.KeyTips:SetVisibility(UIConst.VisibilityOp.Visible)
    self.Btn_1:SetFocus()
  end
end

function Component:HandleAbyssRoomSelection(index)
  if index == self.AbyssUiRoomIndex then
    return
  end
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_level_02", nil, nil)
  self.AbyssUiRoomIndex = index
  self:RefreshAbyssTeamInfo(index)
  self:RefreshAbyssRoomInfo(index)
  self:PlayAnimation(self.Abyss_Switch)
  local BtnList = {
    self.Abyss_Btn_L,
    self.Abyss_Btn_R
  }
  for _, Btn in ipairs(BtnList) do
    Btn.IsSelect = false
    Btn:StopAnimation(Btn.Click)
    Btn:PlayAnimation(Btn.Normal)
  end
  BtnList[index].IsSelect = true
  BtnList[index]:PlayAnimation(BtnList[index].Click)
end

function Component:OnKeyDownAbyss(InKeyName)
  if not self.BRoomNum then
    return
  end
  if "A" == InKeyName or "Gamepad_LeftTrigger" == InKeyName then
    self:HandleAbyssRoomSelection(1)
    return true
  elseif "D" == InKeyName or "Gamepad_RightTrigger" == InKeyName then
    self:HandleAbyssRoomSelection(2)
    return true
  end
  return false
end

return Component
