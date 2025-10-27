require("UnLua")
local UIUtils = require("Utils.UIUtils")
local ChatCommon = require("BluePrints.UI.WBP.Chat.ChatCommon")
local ClientEventUtils = require("BluePrints.Common.ClientEvent.ClientEventUtils")
local TaskUtils = require("BluePrints.UI.TaskPanel.TaskUtils")
local AllPlayerBloodState = require("BluePrints.UI.BloodBar.BloodBarUtils").AllBloodState
local EMCache = require("EMCache.EMCache")
local WBP_Battle_C = Class("BluePrints.UI.BP_UIState_C")
WBP_Battle_C._components = {
  "BluePrints.UI.WBP.Chat.View.WBP_Battle_C_ChatComp",
  "BluePrints.UI.WBP.Team.View.WBP_Battle_C_TeamComp"
}

function WBP_Battle_C:Construct()
  WBP_Battle_C.Super.Construct(self)
  if self.Platform == nil then
    self.Platform = CommonUtils.GetDeviceTypeByPlatformName(self)
  end
  self.OnVisibilityChanged:Add(self, function(self, Visibility)
    if self:IsVisible() then
      UIManager():TryResumeAfterLoadingMgr({
        "TriggerGuide",
        "MainLineQuest",
        "DynamicQuest"
      })
      self:_RefreshEscReddot()
    end
  end)
  self.ColorAndOpacityDelegate:Bind(self, function(self)
    if 1 == self.ColorAndOpacity.SpecifiedColor.A then
      UIManager():TryResumeAfterLoadingMgr({
        "TriggerGuide",
        "MainLineQuest",
        "DynamicQuest"
      })
      self:_RefreshEscReddot()
    end
  end)
end

function WBP_Battle_C:OnLoaded(...)
  self.Super.OnLoaded(self, ...)
  self:TryRecoverUI()
  self:InitUID()
  self:InitChat()
  self:InitTeam()
  self:ListenForInputAction("OpenArmory", EInputEvent.IE_Pressed, false, {
    self,
    self.OpenArmory
  })
  self:ListenForInputAction("OpenBag", EInputEvent.IE_Pressed, false, {
    self,
    self.OpenBag
  })
  self:ListenForInputAction("OpenPlay", EInputEvent.IE_Pressed, false, {
    self,
    self.OpenPlay
  })
  self:ListenForInputAction("OpenTask", EInputEvent.IE_Pressed, false, {
    self,
    self.OpenTaskPanel
  })
  self:ListenForInputAction("OpenMenu", EInputEvent.IE_Pressed, false, {
    self,
    self.OpenCommonSetup
  })
  self:ListenForInputAction("OpenGuideBook", EInputEvent.IE_Pressed, false, {
    self,
    self.OpenGuideBook
  })
  self:ListenForInputAction("OpenEvent", EInputEvent.IE_Pressed, false, {
    self,
    self.OpenEvent
  })
  self:ListenForInputAction("OpenForge", EInputEvent.IE_Pressed, false, {
    self,
    self.OpenForge
  })
  self:ListenForInputAction("OpenGacha", EInputEvent.IE_Pressed, false, {
    self,
    self.OpenGacha
  })
  self:ListenForInputAction("OpenBattlePass", EInputEvent.IE_Pressed, false, {
    self,
    self.OpenBattlePass
  })
  self:ListenForInputAction("GamepadOpenSystem", EInputEvent.IE_Pressed, false, {
    self,
    self.ShowSystemEntrance
  })
  self:ListenForInputAction("GamepadOpenSystem", EInputEvent.IE_Released, false, {
    self,
    self.CloseSystemEntrance
  })
  self:AddDispatcher(EventID.ShowTeammateBloodUI, self, self.AddTeammateUI)
  self:AddDispatcher(EventID.CloseTeammateBloodUI, self, self.RemoveTeammateUI)
  self:AddDispatcher(EventID.OnMainUIReddotUpdate, self, self.UpdateRedDotStates)
  self:AddDispatcher(EventID.OnCompleteProduce, self, self.UpdateRedDotStates)
  self:AddDispatcher(EventID.OnBlueComplete, self, self.UpdateRedDotStates)
  self:AddDispatcher(EventID.OnReceiveNewQuest, self, self.UpdateRedDotStates)
  self:AddDispatcher(EventID.OnAchvRedPoint, self, self.UpdateRedDotStates)
  self:AddDispatcher(EventID.CharDie, self, self.OnTeammateDie)
  self:AddDispatcher(EventID.CharRecover, self, self.OnTeammateRecovery)
  self:AddDispatcher(EventID.OnGotTopicReward, self, self.UpdateRedDotStates)
  self:AddDispatcher(EventID.OnReceiveNewQuest, self, self.UpdateRedDotStates)
  self:AddDispatcher(EventID.UnLoadUI, self, self.OnSystemUIUnLoad)
  self:AddDispatcher(EventID.OnChangeKeyBoardSet, self, self.InitBtnList)
  self:AddDispatcher(EventID.OnSwitchRole, self, self.OnSwitchRole)
  self:AddDispatcher(EventID.OnHomeBaseBtnPlayAnim, self, self.OnHomeBaseBtnPlayAnim)
  self:AddDispatcher(EventID.ShowOrHideMainPlayerBloodUI, self, self.ShowOrHideMainPlayerBloodUI)
  self:AddDispatcher(EventID.EndRougeCanonMiniGame, self, self.OnEndRougeCanonMiniGame)
  self:AddDispatcher(EventID.OnTempleRightUI, self, self.OnTempleRightUI)
  self:AddDispatcher(EventID.OnPartyProgressStart, self, self.OnPartyProgressStart)
  self:AddDispatcher(EventID.OnModBookQuestFinished, self, self.OnModBookQuestFinished)
  self:AddDispatcher(EventID.OnNotifyShowLargeCountDown, self, self.OnNotifyShowLargeCountDown)
  self:AddDispatcher(EventID.OnNewDetectiveQuestion, self, self.OnNewDetectiveQuestion)
  self:AddDispatcher(EventID.OnHomeBaseeBtnShowNewClue, self, self.OnHomeBaseeBtnShowNewClue)
  self:AddDispatcher(EventID.OnEnableGuideBookKey, self, self.EnableGuideBookKey)
  local NodeName = DataMgr.ReddotNode.Quest.Name
  ReddotManager.AddListenerEx(NodeName, self, function(self, Count, RdType, RdName)
    if Count > 0 then
      self.Btn_Task.Common_Item_Subsize_New_PC:SetVisibility(UE4.ESlateVisibility.HitTestInvisible)
    else
      self.Btn_Task.Common_Item_Subsize_New_PC:SetVisibility(UE4.ESlateVisibility.Collapsed)
    end
  end)
  if not self:InitWithMainCharacter() then
    self:AddDispatcher(EventID.CloseLoading, self, self.InitWithMainCharacter)
  end
  self.SystemHideTags = {}
  self.IsPlayOutAnim = false
  self.HideGuideBookBtn = false
  self.HideSystemEntrance = false
  self:InitConditionMapSystem()
  self.VB_Teammate_Phantom:ClearChildren()
  self.VB_Teammate_Phantom:SetVisibility(UE4.ESlateVisibility.Collapsed)
  if self.Battle_Char_PC_0 then
    self.Battle_Char_PC_0:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
  self.Char_Skill:InitSkillAfterCharInitReady()
  self.PlayerBloodBar = self.HUD_MainBar
  self.Battle_Map.Battle = self
  self.Map_Img:SetVisibility(ESlateVisibility.Collapsed)
  self:PlayAnimation(self.CollapsedMap)
  self.Battle_Map:SetVisibility(0)
  if self.Btn_Close then
    self.Btn_Close.OnClicked:Clear()
    self.Btn_Close.OnClicked:Add(self, self.OnBattleMapClose)
  end
  self:SetOverrideInfo(self.SizeMap_Original, self.Task_Normal)
  self.RetainerBox_0:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  self.Task:ClearChildren()
  self.Pos_Weekly:ClearChildren()
  self.Pos_Abyss_CountDown:ClearChildren()
  self.Pos_Abyss_CountDown_1:ClearChildren()
  self.Pos_ModAchive:ClearChildren()
  self.Pos_TempleProgress:ClearChildren()
  self.Pos_Weekly_Buff:ClearChildren()
  self.TeammateEidSet = {}
  self:HidePlayerDeadUI()
  self:InitKeyTip()
  self:HideDynamicEventUI()
  self:CreatTakeAimIndicator()
  self.Btn_Task.IsBtnTask = true
  self:InitGameJumpWord()
end

function WBP_Battle_C:GetOrAddWidget(WidgetName, NodeToAdd)
  local Widget = NodeToAdd:GetChildAt(0)
  if Widget then
    return Widget
  end
  local Widget = self:CreateWidgetNew(WidgetName)
  if Widget then
    NodeToAdd:AddChild(Widget)
    NodeToAdd:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  else
    DebugPrint("CreateWidget failed! Widget name: ", WidgetName)
  end
  return Widget
end

function WBP_Battle_C:GetWidget(WidgetName, NodeToAdd)
  local Widget = NodeToAdd:GetChildAt(0)
  return Widget
end

function WBP_Battle_C:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  self.CurInputDeviceType = UIUtils.UtilsGetCurrentInputType()
  self.CurGamepadName = UIUtils.UtilsGetCurrentGamepadName()
  self:InitKeyTip()
end

function WBP_Battle_C:InitWithMainCharacter()
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  if not Player then
    return false
  end
  self.HUD_MainBar:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  self.HUD_MainBar:InitConfig(Player)
  self:AddTimer(0.5, function()
    if not Player:CheckCanChangeToMaster() then
      self:ShowOrHideMainPlayerBloodUI(true, "ChangeRoleToMaster")
    end
  end, false)
  self:InitDataPhone()
  return true
end

function WBP_Battle_C:GetOrAddDynamicEventWidget()
  self.Pos_DynamicEvent:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  return self:GetOrAddWidget("DynamicEvent", self.Pos_DynamicEvent)
end

function WBP_Battle_C:GetDynamicEventWidget()
  return self:GetWidget("DynamicEvent", self.Pos_DynamicEvent)
end

function WBP_Battle_C:AddTempleRightKeyTextDesc()
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  local TempleData = DataMgr.Temple[GameState.DungeonId]
  local FbdRule = TempleData.FbdRule
  self.ForbidInfo = self:TempleForbidSkills(FbdRule)
  if not self.ForbidInfo then
    return
  end
  for i = 1, #self.ForbidInfo do
    local RightKeyTextDescData = NewObject(UE4.LoadClass(UIConst.DUNGEONCOMRIGHTKEYTEXTDESCDATA))
    RightKeyTextDescData.Owner = self
    RightKeyTextDescData.Index = i
    self.List_TrainingSetting:AddItem(RightKeyTextDescData)
  end
end

function WBP_Battle_C:InitTrainingKeyTip()
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  if Player.UIModePlatform == "PC" then
    local CurInputDeviceType = UIUtils.UtilsGetCurrentInputType()
    if CurInputDeviceType == UE4.ECommonInputType.Gamepad then
      local KeyDescWidget = self:GetOrAddWidget("BattleKeyDescList", self.Pos_KeyTip)
      if GameState.GameModeType == "Training" then
        if KeyDescWidget then
          local CommonKeyDatas = {
            {
              Type = "Img",
              DescText = GText("UI_DUNGEON_DES_TRAINING_1"),
              ImgShortPath = UIUtils.GetIconListByActionName("TrainingOpenSetup")
            },
            {
              Type = "Img",
              DescText = GText("UI_Keyboard_Map_OpenArmory"),
              ImgShortPath = UIUtils.GetIconListByActionName("OpenArmory")
            },
            {
              Type = "Img",
              DescText = GText("UI_DUNGEON_DES_TRAINING_2"),
              ImgShortPath = UIUtils.GetIconListByActionName("TrainingCharacterSkills")
            },
            {
              Type = "Img",
              DescText = GText("UI_DUNGEON_DES_TRAINING_3"),
              ImgShortPath = UIUtils.GetIconListByActionName("TrainingKillMonsters")
            }
          }
          KeyDescWidget:InitKey(CommonKeyDatas)
          self:AddTrainingRightKeyListeners()
        end
      else
        local CommonKeyDatas = {
          {
            Type = "Img",
            DescText = GText("UI_DUNGEON_DES_TRAINING_2"),
            ImgShortPath = UIUtils.GetIconListByActionName("TrainingCharacterSkills")
          }
        }
        KeyDescWidget:InitKey(CommonKeyDatas)
        self:AddTrialRightKeyListeners()
      end
    else
      local KeyDescWidget = self:GetOrAddWidget("BattleKeyDescList", self.Pos_KeyTip)
      if KeyDescWidget then
        KeyDescWidget:SetVisibility(UE4.ESlateVisibility.Visible)
        local CommonKeyDatas = {}
        if GameState.GameModeType == "Training" then
          self:AddTrainingRightKeyListeners()
          table.insert(CommonKeyDatas, {
            Type = "Text",
            Text = "F1",
            DescText = GText("UI_DUNGEON_DES_TRAINING_2"),
            CallbackObj = self,
            CallbackFunc = self.TrainingCharacterSkills
          })
          table.insert(CommonKeyDatas, {
            Type = "Text",
            Text = "F4",
            DescText = GText("UI_DUNGEON_DES_TRAINING_1"),
            CallbackObj = self,
            CallbackFunc = self.TrainingOpenSetup
          })
          table.insert(CommonKeyDatas, {
            Type = "Text",
            Text = "F5",
            DescText = GText("UI_DUNGEON_DES_TRAINING_3"),
            CallbackObj = self,
            CallbackFunc = self.TrainingKillMonsters
          })
        else
          self:AddTrialRightKeyListeners()
          table.insert(CommonKeyDatas, {
            Type = "Text",
            Text = "F1",
            DescText = GText("UI_DUNGEON_DES_TRAINING_2"),
            CallbackObj = self,
            CallbackFunc = self.TrialCharacterSkills
          })
        end
        KeyDescWidget:InitKey(CommonKeyDatas)
      end
    end
  else
    local TrainingSetting = self:GetOrAddWidget("TrainingSetting_M", self.Pos_Training)
    TrainingSetting.Parent = self
  end
  if GameState.GameModeType == "Training" then
    local TaskBar = TaskUtils:GetTaskBarWidget()
    if TaskBar then
      TaskBar:SetUIVisibilityTag("Training", true)
    end
  end
end

function WBP_Battle_C:InitTrailKeyTip()
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  if Player.UIModePlatform == "PC" then
    local CurInputDeviceType = UIUtils.UtilsGetCurrentInputType()
    if CurInputDeviceType == UE4.ECommonInputType.Gamepad then
      local KeyDescWidget = self:GetOrAddWidget("BattleKeyDescList", self.Pos_KeyTip)
      local CommonKeyDatas = {
        {
          Type = "Img",
          DescText = GText("UI_Keyboard_Map_OpenArmory"),
          ImgShortPath = UIUtils.GetIconListByActionName("OpenArmory")
        },
        {
          Type = "Img",
          DescText = GText("UI_DUNGEON_DES_TRAINING_2"),
          ImgShortPath = UIUtils.GetIconListByActionName("TrainingCharacterSkills")
        }
      }
      KeyDescWidget:InitKey(CommonKeyDatas)
      self:AddTrialRightKeyListeners()
    else
      local KeyDescWidget = self:GetOrAddWidget("BattleKeyDescList", self.Pos_KeyTip)
      if KeyDescWidget then
        KeyDescWidget:SetVisibility(UE4.ESlateVisibility.Visible)
        local CommonKeyDatas = {}
        self:AddTrialRightKeyListeners()
        table.insert(CommonKeyDatas, {
          Type = "Text",
          Text = "F1",
          DescText = GText("UI_DUNGEON_DES_TRAINING_2"),
          CallbackObj = self,
          CallbackFunc = self.TrialCharacterSkills
        })
        KeyDescWidget:InitKey(CommonKeyDatas)
      end
    end
  else
    local TrainingSetting = self:GetOrAddWidget("TrainingSetting_M", self.Pos_Training)
    TrainingSetting.Parent = self
  end
end

function WBP_Battle_C:UnInitTrainingKeyTip()
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  self.Pos_KeyTip:ClearChildren()
  if Player.UIModePlatform == "Mobile" then
    self.Pos_Training:ClearChildren()
  end
  local TaskBar = TaskUtils:GetTaskBarWidget()
  if TaskBar then
    TaskBar:SetUIVisibilityTag("Training", false)
  end
end

function WBP_Battle_C:UnInitTrialKeyTip()
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  self.Pos_KeyTip:ClearChildren()
  if Player.UIModePlatform == "Mobile" then
    self.Pos_Training:ClearChildren()
  end
end

function WBP_Battle_C:InitKeyTip()
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  if nil ~= GameMode and nil ~= GameState and GameState.GameModeType == "Training" then
    self:InitTrainingKeyTip()
  elseif nil ~= GameMode and nil ~= GameState and GameState.GameModeType == "Temple" then
    self:AddDispatcher(EventID.OnTempleEnter, self, self.OnTempleEnter)
    self:AddDispatcher(EventID.OnTempleDelayStart, self, self.OnTempleDelayStart)
    self:AddDispatcher(EventID.OnTempleDelayEnd, self, self.OnTempleDelayEnd)
  elseif nil ~= GameMode and nil ~= GameState and GameState.GameModeType == "Rouge" then
    self:AddRougeKeyListeners()
  elseif GameState.GameModeType == "Trial" then
    self:InitTrailKeyTip()
    self.bInTrial = true
  else
    self:UnInitTrainingKeyTip()
    self:UnInitTrialKeyTip()
  end
  self:InitChatKeyTip()
end

function WBP_Battle_C:InitCommonKey(CommonKey, Index)
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  if nil ~= GameMode and nil ~= GameState and GameState.GameModeType == "Training" then
    local DescTest = ""
    if 1 == Index then
      DescTest = "F4"
    elseif 2 == Index then
      DescTest = "F1"
    elseif 3 == Index then
      DescTest = "F5"
    end
    CommonKey:CreateCommonKey({
      KeyInfoList = {
        {Type = "Text", Text = DescTest}
      },
      bLongPress = false,
      Desc = GText("UI_DUNGEON_DES_TRAINING_" .. Index)
    })
    CommonKey:AddExecuteLogic(self, function()
      self:OnTrainingRightKeyClicked(Index)
    end)
  end
  if nil ~= GameMode and nil ~= GameState and GameState.GameModeType == "Temple" then
    CommonKey:CreateCommonKey({
      KeyInfoList = {
        {
          Type = self.ForbidInfo[Index][2],
          Text = self.ForbidInfo[Index][3],
          ImgShortPath = self.ForbidInfo[Index][3]
        }
      },
      bLongPress = false,
      Desc = GText(self.ForbidInfo[Index][1])
    })
    CommonKey:ShowBanImg()
    CommonKey:DisableKey()
    local Player = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
    if Player.UIModePlatform == "Mobile" then
      CommonKey:MobileBanTextImg()
    end
  end
end

function WBP_Battle_C:SetOverrideInfo(MapWidth, PaddingTop)
  if self.SizeBox_Map then
    self.SizeBox_Map:SetWidthOverride(MapWidth)
  end
  if not self.Task then
    return
  end
  self.Task:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  local Slot = UE4.UWidgetLayoutLibrary.SlotAsVerticalBoxSlot(self.Task)
  if Slot then
    local Padding = Slot.Padding
    Padding.Top = PaddingTop
    Slot:SetPadding(Padding)
  end
end

function WBP_Battle_C:TempleForbidSkills(FbdRule)
  if not FbdRule then
    return
  end
  local KeyboardMap = DataMgr.KeyboardMap
  local ForbidInfo = {}
  if FbdRule.NoSkill and 0 ~= FbdRule.NoSkill then
    table.insert(ForbidInfo, {
      KeyboardMap.Skill1.ActionNameText,
      "Text",
      KeyboardMap.Skill1.Key
    })
    table.insert(ForbidInfo, {
      KeyboardMap.Skill2.ActionNameText,
      "Text",
      KeyboardMap.Skill2.Key
    })
    table.insert(ForbidInfo, {
      KeyboardMap.Skill3.ActionNameText,
      "Text",
      KeyboardMap.Skill3.Key
    })
  end
  if FbdRule.NoMelee and 0 ~= FbdRule.NoMelee then
    table.insert(ForbidInfo, {
      KeyboardMap.Attack.ActionNameText,
      "Img",
      KeyboardMap.Attack.Key
    })
  end
  if FbdRule.NoRanged and 0 ~= FbdRule.NoRanged then
    table.insert(ForbidInfo, {
      KeyboardMap.Fire.ActionNameText,
      "Img",
      KeyboardMap.Fire.Key
    })
  end
  if FbdRule.NoBattleWheel and 0 ~= FbdRule.NoBattleWheel then
    table.insert(ForbidInfo, {
      KeyboardMap.OpenBattleWheel.ActionNameText,
      "Text",
      KeyboardMap.OpenBattleWheel.Key
    })
  end
  return ForbidInfo
end

function WBP_Battle_C:AddTrainingRightKeyListeners()
  self:RemoveTrainingRightKeyListeners()
  self:ListenForInputAction("TrainingOpenSetup", EInputEvent.IE_Pressed, false, {
    self,
    self.TrainingOpenSetup
  })
  self:ListenForInputAction("TrainingCharacterSkills", EInputEvent.IE_Pressed, false, {
    self,
    self.TrainingCharacterSkills
  })
  self:ListenForInputAction("TrainingKillMonsters", EInputEvent.IE_Pressed, false, {
    self,
    self.TrainingKillMonsters
  })
end

function WBP_Battle_C:RemoveTrainingRightKeyListeners()
  self:StopListeningForInputAction("TrainingOpenSetup", EInputEvent.IE_Pressed)
  self:StopListeningForInputAction("TrainingCharacterSkills", EInputEvent.IE_Pressed)
  self:StopListeningForInputAction("TrainingKillMonsters", EInputEvent.IE_Pressed)
end

function WBP_Battle_C:AddRougeKeyListeners()
  self:RemoveRougeKeyListeners()
  self:ListenForInputAction("RougeOpenBag", EInputEvent.IE_Pressed, false, {
    self,
    self.OpenRogueShop
  })
end

function WBP_Battle_C:RemoveRougeKeyListeners()
  self:StopListeningForInputAction("RougeOpenBag", EInputEvent.IE_Pressed)
end

function WBP_Battle_C:OnTrainingRightKeyClicked(Index)
  if 1 == Index then
    self:TrainingOpenSetup()
  elseif 2 == Index then
    self:TrainingCharacterSkills()
  elseif 3 == Index then
    self:TrainingKillMonsters()
  end
end

function WBP_Battle_C:AddTrialRightKeyListeners()
  self:RemoveTrialRightKeyListeners()
  self:ListenForInputAction("TrainingCharacterSkills", EInputEvent.IE_Pressed, false, {
    self,
    self.TrialCharacterSkills
  })
  self:ListenForInputAction("OpenTask", EInputEvent.IE_Pressed, false, {
    self,
    self.TrialCharacterSkills
  })
end

function WBP_Battle_C:RemoveTrialRightKeyListeners()
  self:StopListeningForInputAction("TrainingCharacterSkills", EInputEvent.IE_Pressed)
  self:StopListeningForInputAction("OpenTask", EInputEvent.IE_Pressed)
end

function WBP_Battle_C:OnTrialRightKeyClicked(Index)
  if 2 == Index then
    self:TrialCharacterSkills()
  end
end

function WBP_Battle_C:TrialCharacterSkills()
  UIUtils.LoadPreviewSkillDetails(self, {
    OnClosedCallback = function()
      self:PlayInAnim()
    end
  })
end

function WBP_Battle_C:OnTempleEnter()
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  local UIManager = GameInstance:GetGameUIManager()
  if nil == UIManager then
    return
  end
  local UIManager = GameInstance:GetGameUIManager()
  local GuideCountDownFloat = UIManager:GetUIObj("GuideCountDown")
  if GuideCountDownFloat then
    GuideCountDownFloat:OnCountDownEnd()
    GuideCountDownFloat:Close()
  end
  GuideCountDownFloat = UIManager:LoadUINew("GuideCountDown")
  GuideCountDownFloat:SetVisibility(ESlateVisibility.Collapsed)
  self:AddTimer(1, self.ShowCountDown, false, 0, "ShowCountDown", nil, GuideCountDownFloat, 4)
  self.Pos_TaskBar:SetVisibility(ESlateVisibility.Collapsed)
  self.Pos_DynamicEvent:SetVisibility(ESlateVisibility.Collapsed)
end

function WBP_Battle_C:ShowCountDown(Widget, Count, bShowZeroText)
  Widget:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  Widget:InitTempleCountDown(Count, bShowZeroText)
end

function WBP_Battle_C:OnTempleDelayStart(Duration, Title)
  DebugPrint("zwk OnTempleDelayStart", Duration, Title)
  self.Pos_TempleTime:ClearChildren()
  self.CurDelayUI = self:CreateWidgetNew("DungeonTempleTime")
  self.Pos_TempleTime:AddChild(self.CurDelayUI)
  self.Pos_TempleTime:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  self.CurDelayUI:InitTempleDelayTimeUI(Title, Duration)
end

function WBP_Battle_C:OnTempleDelayEnd()
  DebugPrint("zwk OnTempleDelayEnd")
  if self.CurDelayUI then
    self.CurDelayUI:CloseDungeonUI()
  end
end

function WBP_Battle_C:TrainingOpenSetup()
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  local UIManager = GameInstance:GetGameUIManager()
  UIManager:LoadUINew("TrainingGroundSetup")
end

function WBP_Battle_C:TrainingCharacterSkills()
  UIUtils.LoadPreviewSkillDetails(self, {
    OnClosedCallback = function()
      self:PlayInAnim()
    end
  })
end

function WBP_Battle_C:TrainingKillMonsters()
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  if nil ~= GameMode then
    GameMode:TriggerDungeonComponentFun("RemoveMonster")
    UIManager(self):ShowUITip(UIConst.Tip_CommonTop, string.format(GText("UI_DUNGEON_DES_TRAINING_4"), self.MonsterCheckedTotalNum))
  end
end

function WBP_Battle_C:InitUID()
  self.Text_BottomTips:SetText(GText("UI_Loading_Testing"))
  local Avatar = GWorld:GetAvatar()
  if Avatar and 0 ~= Avatar.Uid then
    self.UID:SetUid()
    self.UID:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  else
    self.UID:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
end

function WBP_Battle_C:InitEsc()
  self.Btn_Esc.bForceInvisible = nil
  self.Btn_Esc.Btn_top.OnClicked:Add(self, self.OpenCommonSetup)
  self.Btn_Esc:LoadImage(11)
  self:_RefreshEscReddot()
end

function WBP_Battle_C:Destruct()
  for Eid, TeammateUI in pairs(self.TeammateEidSet or {}) do
    self:RemoveTeammateUI(Eid, TeammateUI)
  end
  self.TeammateEidSet = {}
  self:EndAim()
  self:EndChat()
  self:EndTeam()
  self:RemoveTrainingRightKeyListeners()
  self:RemoveTrialRightKeyListeners()
  self:RemoveRougeKeyListeners()
  local NodeName = DataMgr.ReddotNode.Quest.NodeName
  ReddotManager.RemoveListener(NodeName, self)
  WBP_Battle_C.Super.Destruct(self)
end

function WBP_Battle_C:InitDataPhone()
  if self.Battery then
    self.Battery.HB_Battery:SetVisibility(not UUCloudGameInstanceSubsystem.IsCloudGame() and UIConst.VisibilityOp.SelfHitTestInvisible or UIConst.VisibilityOp.Collapsed)
  end
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  if Player.UIModePlatform ~= "Mobile" then
    return
  end
  self.WifiImage = {
    self.Battery.Wifi_1,
    self.Battery.Wifi_2,
    self.Battery.Wifi_3
  }
  self.DataImage = {
    self.Battery.Image_Net_1,
    self.Battery.Image_Net_2,
    self.Battery.Image_Net_3,
    self.Battery.Image_Net_4
  }
  if not GWorld.IsDev then
    self.Btn_GM:SetVisibility(UIConst.VisibilityOp.Collapsed)
  else
    self.Btn_GM:SetVisibility(UIConst.VisibilityOp.Visible)
  end
  self:SetBattery(UE4.UUIFunctionLibrary.GetBatteryLevel())
  self:UpdateSignalStrength()
  self:AddTimer(5, self.UpdateDataPhone, true)
end

function WBP_Battle_C:UpdateDataPhone()
  self:SetBattery(UE4.UUIFunctionLibrary.GetBatteryLevel(), self.BatteryLevel)
  self:UpdateSignalStrength(self.SignalStrength)
end

function WBP_Battle_C:SetBattery(BatteryLevel, LastBatteryLevel)
  if BatteryLevel and not LastBatteryLevel then
    if BatteryLevel <= 20 then
      self.Battery:PlayAnimation(self.Battery.Low_Battery)
    else
      self.Battery:PlayAnimationReverse(self.Battery.Low_Battery)
    end
  elseif BatteryLevel <= 20 and LastBatteryLevel > 20 then
    self.Battery:PlayAnimation(self.Battery.Low_Battery)
  elseif BatteryLevel > 20 and LastBatteryLevel <= 20 then
    self.Battery:PlayAnimationReverse(self.Battery.Low_Battery)
  end
  if not self.BatteryLevel or BatteryLevel ~= self.BatteryLevel then
    self.Battery.Num_Battery:SetText(BatteryLevel .. "%")
    self.Battery.ProgressBar_Battery:SetPercent(BatteryLevel / 100)
    self.BatteryLevel = BatteryLevel
  end
end

function WBP_Battle_C:UpdateSignalStrength(LastSignalStrength)
  local IsConnectWifi = UE4.UMobilePatchingLibrary.HasActiveWiFiConnection()
  self.Battery.Switcher_Net:SetActiveWidgetIndex(IsConnectWifi and 1 or 0)
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  local PlayerState = Player:GetController().PlayerState
  if not PlayerState then
    DebugPrint(ErrorTag, "xuxiangnan::PlayerState\232\142\183\229\143\150\229\164\177\232\180\165\239\188\140\230\139\191\228\184\141\229\136\176\230\173\163\231\161\174ping\229\128\188")
    return
  end
  local Ping = PlayerState:GetPlayerPing()
  self.Battery.Num_Net:SetText(Ping)
  local Strength = 5
  for i = 1, #Const.SignalStrength do
    if Ping <= Const.SignalStrength[i] then
      Strength = Strength - i
      break
    end
  end
  for i = 2, #self.WifiImage do
    self.WifiImage[i]:SetVisibility(IsConnectWifi and i <= Strength and UE4.ESlateVisibility.SelfHitTestInvisible or UE4.ESlateVisibility.Collapsed)
  end
  for i = 2, #self.DataImage do
    self.DataImage[i]:SetVisibility(not IsConnectWifi and i <= Strength and UE4.ESlateVisibility.SelfHitTestInvisible or UE4.ESlateVisibility.Collapsed)
  end
  if not LastSignalStrength then
    if Strength <= 2 then
      self.Battery:PlayAnimation(self.Battery.Low_Net)
    else
      self.Battery:PlayAnimationReverse(self.Battery.Low_Net)
    end
  elseif Strength <= 2 and self.SignalStrength > 2 then
    self.Battery:PlayAnimation(self.Battery.Low_Net)
  elseif Strength > 2 and self.SignalStrength <= 2 then
    self.Battery:PlayAnimationReverse(self.Battery.Low_Net)
  end
  self.SignalStrength = Strength
end

function WBP_Battle_C:ExitHardBossBattle()
  local CommonDialog = UIManager(self):GetUIObj("CommonDialog")
  if CommonDialog then
    CommonDialog:Close()
  end
  self:SetInputUIOnly(false)
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  if IsStandAlone(Player) then
    local GameMode = UE4.UGameplayStatics.GetGameMode(Player)
    GameMode:SetGamePaused(UIConst.CommonSetUP, false)
  end
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    Avatar:ExitBattle(false, true)
  end
end

function WBP_Battle_C:ExitHardBattle()
  local CommonDialog = UIManager(self):GetUIObj("CommonDialog")
  if CommonDialog then
    CommonDialog:Close()
  end
  self:SetInputUIOnly(false)
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  if IsStandAlone(Player) then
    local GameMode = UE4.UGameplayStatics.GetGameMode(Player)
    GameMode:SetGamePaused(UIConst.CommonSetUP, false)
  end
  DebugPrint("gyy@SpecialQuestFail,ExitSpecialQuest")
  EventManager:FireEvent(EventID.OnSpecialQuestFail, "Exit")
end

function WBP_Battle_C:ContinueBattle()
  self:SetInputUIOnly(false)
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  if IsStandAlone(Player) then
    local GameMode = UE4.UGameplayStatics.GetGameMode(Player)
    GameMode:SetGamePaused(UIConst.CommonSetUP, false)
  end
end

function WBP_Battle_C:OpenCommonSetup()
  if TeamController:IsTeamPopupBarOpenInGamepad() then
    return
  end
  self:OpenSystemByAction("OpenCommonSetup")
end

function WBP_Battle_C:OpenSystemEntrance()
  self:OpenSystemByAction("OpenSystemEntrance")
end

function WBP_Battle_C:CloseSystemEntrance()
  self:OpenSystemByAction("CloseSystemEntrance")
end

function WBP_Battle_C:ShowSystemEntrance()
  self.IsShowSystemEntrance = true
  for i = 0, self.ListView:GetNumItems() - 1 do
    local Item = self.ListView:GetItemAt(i)
    if Item then
      Item.SelfWidget:ShowSystemEntranceOnGamePadInput(self.IsShowSystemEntrance)
    end
  end
  self.Btn_Task:ShowSystemEntranceOnGamePadInput(self.IsShowSystemEntrance)
end

function WBP_Battle_C:CloseSystemEntrance()
  self.IsShowSystemEntrance = false
  for i = 0, self.ListView:GetNumItems() - 1 do
    local Item = self.ListView:GetItemAt(i)
    if Item then
      Item.SelfWidget:ShowSystemEntranceOnGamePadInput(self.IsShowSystemEntrance)
    end
  end
  self.Btn_Task:ShowSystemEntranceOnGamePadInput(self.IsShowSystemEntrance)
end

function WBP_Battle_C:OpenArmory()
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  if GameState and GameState.GameModeType == "Trial" then
    local GameMode = UE4.UGameplayStatics.GetGameMode(self)
    if GameMode then
      GameMode:TriggerDungeonComponentFun("ShowArmory")
    end
  else
    self:OpenSystemByAction("OpenArmory")
  end
end

function WBP_Battle_C:OpenBag()
  self:OpenSystemByAction("OpenBag")
end

function WBP_Battle_C:OpenPlay()
  self:OpenSystemByAction("OpenPlay")
end

function WBP_Battle_C:OpenTaskPanel()
  self:OpenSystemByAction("OpenTask")
end

function WBP_Battle_C:OpenGuideBook()
  self:OpenSystemByAction("OpenGuideBook")
end

function WBP_Battle_C:OpenBattlePass()
  self:OpenSystemByAction("OpenBattlePass")
end

function WBP_Battle_C:OpenEvent()
  self:OpenSystemByAction("OpenEvent")
end

function WBP_Battle_C:OpenForge()
  self:OpenSystemByAction("OpenForge")
end

function WBP_Battle_C:OpenGacha()
  self:OpenSystemByAction("OpenGacha")
end

function WBP_Battle_C:OpenRogueShop()
  local UIManager = self:GetGameInstance():GetGameUIManager()
  UIManager:LoadUINew("RougeBag")
end

function WBP_Battle_C:OpenSystemByAction(ActionName, bEscMenu, ...)
  if not UIManager(self):TryOpenSystem("BattleHUD") then
    return
  end
  local FrameCount = UKismetSystemLibrary.GetFrameCount()
  if self.FrameCount == FrameCount then
    return
  end
  self.FrameCount = FrameCount
  if "OpenCommonSetup" == ActionName then
    UIUtils.OpenEsc()
    return
  elseif "OpenSystemEntrance" == ActionName then
    self:ShowSystemEntrance()
    return
  elseif "CloseSystemEntrance" == ActionName then
    self:CloseSystemEntrance()
    return
  end
  local Avatar = GWorld:GetAvatar()
  if Avatar and Avatar:IsInHardBoss() then
    return
  end
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  if Player:CheckForbidTags(ActionName) then
    return
  end
  if (self:IsPlayingAnimation(self.Out) or self:IsPlayingAnimation(self.In)) and not Player.IsImmersionModel then
    return
  end
  local SystemId
  for EnterId, SystemData in pairs(DataMgr.MainUI) do
    local SystemAction = SystemData.ActionName
    if SystemAction and SystemAction == ActionName then
      SystemId = EnterId
    end
  end
  if nil ~= SystemId then
    AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_system_entrance", nil, nil)
    UIUtils.OpenSystem(SystemId, bEscMenu, ...)
  end
end

function WBP_Battle_C:AddTeammateUI(Eid, bIsPlayer, Entity)
  DebugPrint(DebugTag, LXYTag, "TeamSyncDebug \230\156\137\232\167\146\232\137\178\228\186\167\231\148\159\239\188\140\233\173\133\229\189\177\230\136\150\231\142\169\229\174\182", bIsPlayer, Eid)
  if GameState(self):GetPhantomState(Eid) then
    DebugPrint("TeamSyncDebug  PhantomArray\229\173\152\229\156\168\232\175\165\233\173\133\229\189\177\239\188\140\231\156\139\228\184\128\228\184\139OwnerEid,", GameState(self):GetPhantomState(Eid).OwnerEid)
  end
  Entity = Entity or Battle(self):GetEntity(Eid)
  if self.TeammateEidSet[Eid] then
    if Entity and Entity.TeammateUI then
      Entity.TeammateUI:ReInit()
      self.TeammateEidSet[Eid] = Entity.TeammateUI
    end
    return
  end
  if not IsValid(Entity) or Entity.IsSimplePlayer or Entity.IsHostage or Entity.FromOtherWorld then
    return
  end
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  if Entity.Eid == Player.Eid then
    return
  end
  if self:AddBattleTeamBloodBar(Eid, bIsPlayer, Entity) then
    if bIsPlayer then
      return
    end
    if not bIsPlayer then
      local MainPlayer = GWorld:GetMainPlayer()
      local OwnerEid
      if Entity.PhantomOwner then
        OwnerEid = Entity.PhantomOwner.Eid
      elseif Entity.PhantomState then
        OwnerEid = Entity.PhantomState.OwnerEid
      end
      if not OwnerEid then
        Utils.Traceback(WarningTag, LXYTag .. "TeamSyncDebug\233\157\158\229\184\184\230\128\128\231\150\145\233\173\133\229\189\177\231\154\132\229\136\157\229\167\139\229\140\150\230\181\129\231\168\139\230\156\137\230\151\182\229\186\143\233\151\174\233\162\152..")
        return
      end
      if OwnerEid ~= MainPlayer.Eid then
        return
      end
    end
  end
  local TeammateUI = self:CreateWidgetNew("TeammateBloodBar")
  TeammateUI:InitConfig(Entity)
  Entity.TeammateUI = TeammateUI
  Entity:SetTeammateUI(TeammateUI)
  self.VB_Teammate_Phantom:AddChildToVerticalBox(TeammateUI)
  local VBSlot = UE4.UWidgetLayoutLibrary.SlotAsVerticalBoxSlot(TeammateUI)
  if VBSlot then
    local Margin = FMargin(0, 0, 0, 0)
    local Platform = CommonUtils:GetDeviceTypeByPlatformName(self)
    if "PC" == Platform then
      Margin.Top = 10
    end
    VBSlot:SetPadding(Margin)
  end
  if not next(self.TeammateEidSet) then
    self:Show1PTagBar(true)
    self.VB_Teammate_Phantom:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  end
  self.TeammateEidSet[Eid] = TeammateUI
end

function WBP_Battle_C:RemoveTeammateUI(Eid, TeammateBloodBarUI)
  if self:RemoveBattleTeamBloodBar(Eid) then
    return
  end
  if not TeammateBloodBarUI then
    return
  end
  TeammateBloodBarUI:BindToAnimationFinished(TeammateBloodBarUI.Out, {
    TeammateBloodBarUI,
    function()
      TeammateBloodBarUI:UnbindAllFromAnimationFinished(TeammateBloodBarUI.Out)
      self.VB_Teammate_Phantom:RemoveChild(TeammateBloodBarUI)
    end
  })
  TeammateBloodBarUI:PlayAnimation(TeammateBloodBarUI.Out)
  self.TeammateEidSet[TeammateBloodBarUI.Eid] = nil
  if not next(self.TeammateEidSet) then
    self:Show1PTagBar(false)
    self.VB_Teammate_Phantom:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

function WBP_Battle_C:UpdateRedDotStates()
  DebugPrint("Tianyi@ UpdateRedDotStates")
  local EntryList = self.ListView:GetDisplayedEntryWidgets():ToTable()
  for _, v in ipairs(EntryList) do
    v:UpdateRedDot()
  end
  self.Btn_Task:RefreshNewClueUI()
end

function WBP_Battle_C:InitConditionMapSystem()
  self.BattleEntry = self:CreateWidgetNew("BattleEntry")
  self.Pos_Entry:ClearChildren()
  self.Pos_Entry:AddChild(self.BattleEntry)
  self.ListView = self.BattleEntry.List_Entry
  self.ListView:DisableScroll(true)
  self.ConditionMapping = {}
  self.SignBoardNpcLoadComplete = false
  for SystemId, Data in pairs(DataMgr.MainUI) do
    local ConditionId = Data.ShowCondition
    if ConditionId then
      self.ConditionMapping[ConditionId] = true
    end
  end
  self:AddDispatcher(EventID.ConditionComplete, self, self.OnConditionComplete)
  self:AddDispatcher(EventID.OnAvatarStatusUpdate, self, self.OnAvatarStatusUpdate)
end

function WBP_Battle_C:OnConditionComplete(ConditionId)
  if 0 == #self.ConditionMapping then
    return
  end
  if self.ConditionMapping[ConditionId] then
    self:InitMainUIInBigWorld()
  end
end

function WBP_Battle_C:OnAvatarStatusUpdate(OldStatus, NewStatus)
  self:InitMainUIInBigWorld()
end

function WBP_Battle_C:InitMainUIInBigWorld()
  self.IsInHomebase = false
  local Avatar = GWorld:GetAvatar()
  if Avatar and Avatar:CheckSubRegionType(Avatar:GetCurrentRegionId(), CommonConst.SubRegionType.Home) and Avatar:IsInBigWorld() then
    self.IsInHomebase = true
    self:InitHomeBaseMain()
  else
    self:InitBtnList()
  end
end

function WBP_Battle_C:InitHomeBaseMain()
  self:InitBtnList()
  if not self.SignBoardNpcLoadComplete then
    self:TriggerSignBoardNpc()
    self:AddDispatcher(EventID.OnCharAppearanceChanged, self, self.OnCharAccessoryChange)
    self:AddDispatcher(EventID.OnCharAccessorySetted, self, self.OnCharAccessoryChange)
    self:AddDispatcher(EventID.OnCharAccessoryRemoved, self, self.OnCharAccessoryChange)
    self:AddDispatcher(EventID.OnCharShowPartMesh, self, self.OnCharAccessoryChange)
    self:AddDispatcher(EventID.OnCharCornerVisibilityChanged, self, self.OnCharAccessoryChange)
    self:AddDispatcher(EventID.OnCharSkinChanged, self, self.OnCharSkinChange)
    self:AddDispatcher(EventID.OnCharColorsChanged, self, self.OnCharColorsChanged)
    self:AddDispatcher(EventID.OnWindowResized, self, function(self)
      self.bRebuildChatSimple = true
    end)
  end
end

function WBP_Battle_C:InitBtnList()
  local SystemData = DataMgr.MainUI
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  self.SystemUnlockList = {}
  self.SystemSortList = {}
  self.SystemUnlockNums = 0
  for index, Data in pairs(SystemData) do
    table.insert(self.SystemSortList, {
      Id = index,
      Sequence = Data.Sequence or 0
    })
    if Data.ShowCondition ~= nil then
      local ConditionSucc = ConditionUtils.CheckCondition(Avatar, Data.ShowCondition)
      if ConditionSucc then
        self.SystemUnlockList[index] = false
        local RuleName = Data.UIUnlockRuleName
        if nil == RuleName then
          self.SystemUnlockList[index] = true
        else
          self.SystemUnlockList[index] = self:CheckUIUnlock(RuleName)
        end
      end
    end
  end
  self:InitSystemEntrance()
  if self.Btn_GuideBook then
    self:InitGuideBookBtn()
  end
  if self.Btn_Task then
    self:InitTaskPanelBtn()
  end
  self:InitEsc()
end

function WBP_Battle_C:InitGuideBookBtn()
  local SystemData = DataMgr.MainUI[13]
  if self:CheckUIUnlock(SystemData.UIUnlockRuleName) then
    self.Btn_GuideBook:LoadImage(13)
    self.Btn_GuideBook.Btn_top.OnClicked:Add(self, self.OpenGuideBook)
    if not self.HideGuideBookBtn then
      self.Btn_GuideBook:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    end
  else
    self.Btn_GuideBook:SetVisibility(ESlateVisibility.Collapsed)
  end
end

function WBP_Battle_C:InitTaskPanelBtn()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  local GameState = UE4.URuntimeCommonFunctionLibrary.GetCurrentGameState(self)
  local IsHide = false
  local IsInRouge = Avatar:IsInRougeLike()
  local IsInDG = false
  if GameState then
    IsInDG = GameState:IsInDungeon()
  end
  local IsInHB = Avatar:IsInHardBoss()
  IsHide = IsInRouge or IsInDG or IsInHB
  local SystemData = DataMgr.MainUI[9]
  if not IsHide then
    if SystemData.ShowCondition then
      local ConditionSucc = ConditionUtils.CheckCondition(Avatar, SystemData.ShowCondition)
      if not ConditionSucc then
        self.Btn_Task:SetVisibility(ESlateVisibility.Collapsed)
        return
      end
    end
    if self:CheckUIUnlock(SystemData.UIUnlockRuleName) then
      self.Btn_Task:LoadImage(9)
      self.Btn_Task.Btn_top.OnClicked:Add(self, self.OpenTaskPanel)
      self.Btn_Task:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    else
      self.Btn_Task:SetVisibility(ESlateVisibility.Collapsed)
    end
  else
    self.Btn_Task:SetVisibility(ESlateVisibility.Collapsed)
  end
end

function WBP_Battle_C:CheckUIUnlock(RuleName)
  local UIUnlockRule = DataMgr.UIUnlockRule
  local UIUnlockRuleId = UIUnlockRule[RuleName].UIUnlockRuleId
  local Avatar = GWorld:GetAvatar()
  if Avatar and UIUnlockRuleId then
    return Avatar:CheckUIUnlocked(UIUnlockRuleId)
  else
    return true
  end
end

function WBP_Battle_C:InitSystemEntrance()
  local ClassPath = UE4.LoadClass("/Game/UI/WBP/Battle/Widget/WBP_Main_Btnlist_Content.WBP_Main_Btnlist_Content_C")
  self.ListView:ClearListItems()
  table.sort(self.SystemSortList, function(Data1, Data2)
    return Data1.Sequence > Data2.Sequence
  end)
  local Avatar = GWorld:GetAvatar()
  for Key, Value in pairs(self.SystemSortList) do
    local MainUIConfig = DataMgr.MainUI[Value.Id]
    if MainUIConfig and UIUtils.CheckCdnHide(MainUIConfig.SystemUIName) then
    elseif self.SystemUnlockList[Value.Id] then
      self.SystemUnlockNums = self.SystemUnlockNums + 1
      local Content = NewObject(ClassPath)
      Content.BtnId = Value.Id
      local GameState = UE4.UGameplayStatics.GetGameState(self)
      if self.bInTrial then
        Content.bForbidReddot = true
        DebugPrint("yeke::trial\230\168\161\229\188\143\228\184\141\230\152\190\231\164\186\231\186\162\231\130\185")
      end
      self.ListView:AddItem(Content)
    end
  end
  if not self.HideSystemEntrance then
    if 0 == self.SystemUnlockNums then
      self.Pos_Entry:SetVisibility(UE4.ESlateVisibility.Collapsed)
    else
      self.Pos_Entry:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    end
  end
end

function WBP_Battle_C:TriggerSignBoardNpc()
  local Avatar = GWorld:GetAvatar()
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  local CreatorMap = GameState.StaticCreatorMap:ToTable()
  local DisplayName = {
    "ShowNpc" .. string.sub(DataMgr.TextMap.UI_SHOWNPC_NAME_SCENE1.TextMapId, -7),
    "ShowNpc" .. string.sub(DataMgr.TextMap.UI_SHOWNPC_NAME_SCENE2.TextMapId, -7),
    "ShowNpc" .. string.sub(DataMgr.TextMap.UI_SHOWNPC_NAME_SCENE3.TextMapId, -7)
  }
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  self.NpcStaticCreator = {}
  for i = 1, #DisplayName do
    for _, StaticCreator in pairs(CreatorMap) do
      if StaticCreator.UnitType == "Npc" and string.lower(StaticCreator.DisplayName) == string.lower(DisplayName[i]) then
        self.NpcStaticCreator[i] = StaticCreator
        if Avatar.SignBoardNpc[i] ~= CommonConst.SignBoardUnset then
          StaticCreator.UnitId = Avatar.SignBoardNpc[i]
          local StaticIds = TArray(0)
          StaticIds:Add(StaticCreator.StaticCreatorId)
          GameMode:TriggerActiveStaticCreator(StaticIds)
        end
        break
      end
    end
  end
  self:SetSignBoardNpcIdle()
end

function WBP_Battle_C:SetSignBoardNpcIdle()
  local Avatar = GWorld:GetAvatar()
  if nil == Avatar then
    return
  end
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  for key, value in pairs(Avatar.SignBoardNpc) do
    if value ~= CommonConst.SignBoardUnset then
      local NpcInfo = DataMgr.Npc[value]
      if NpcInfo and NpcInfo.ShowAnimationId then
        local ShowAnimation = NpcInfo.ShowAnimationId
        local ShowAnimationId = ShowAnimation[key]
        GameState:GetNpcInfoAsync(value, function(Npc)
          Npc:InitNpcAccessories(NpcInfo.CharId)
          if "Sit" == ShowAnimationId and key ~= CommonConst.SignBoardThird then
            Npc:SetSitPoseInteractive()
          else
            Npc:SetIdlePose(false)
          end
          local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
          if IsValid(GameInstance) then
            local Tag = GameInstance:GetGlobalGameUITag()
            if not Tag or "" == Tag then
              Tag = "None"
            end
            GameInstance:TriggerAllNpcPauseAndHide(Tag)
          end
        end)
      end
    end
  end
  self.SignBoardNpcLoadComplete = true
end

function WBP_Battle_C:OnCharAccessoryChange(Ret, CharUuid)
  if Ret == ErrorCode.RET_SUCCESS then
    local Avatar = GWorld:GetAvatar()
    if not Avatar then
      return
    end
    local Char = Avatar.Chars[CharUuid]
    if not Char then
      return
    end
    local CharId = Char.CharId
    for key, NpcId in pairs(Avatar.SignBoardNpc) do
      if NpcId ~= CommonConst.SignBoardUnset then
        local NpcInfo = DataMgr.Npc[NpcId]
        if NpcInfo and NpcInfo.CharId and NpcInfo.CharId == CharId then
          local GameInstance = GWorld.GameInstance
          local GameState = UE4.UGameplayStatics.GetGameState(GameInstance)
          GameState:GetNpcInfoAsync(NpcId, function(Npc)
            Npc:RefreshNpcAccessories(Char)
          end)
          break
        end
      end
    end
  end
end

function WBP_Battle_C:OnCharColorsChanged(Ret, SkinId)
  if Ret == ErrorCode.RET_SUCCESS then
    local SkinInfo = DataMgr.Skin[SkinId]
    if not SkinInfo then
      return
    end
    local CharId = SkinInfo.CharId
    self:UpdateSignBoardNpcSkin(CharId)
  end
end

function WBP_Battle_C:OnCharSkinChange(Ret, CharUuid)
  if Ret == ErrorCode.RET_SUCCESS then
    local Avatar = GWorld:GetAvatar()
    if not Avatar then
      return
    end
    local Char = Avatar.Chars[CharUuid]
    if not Char then
      return
    end
    local CharId = Char.CharId
    self:UpdateSignBoardNpcSkin(CharId)
  end
end

function WBP_Battle_C:UpdateSignBoardNpcSkin(CharId)
  local Avatar = GWorld:GetAvatar()
  local CharAvatar
  for key, Char in pairs(Avatar.Chars) do
    if Char.CharId == CharId then
      CharAvatar = Char
      break
    end
  end
  for key, NpcId in pairs(Avatar.SignBoardNpc) do
    if NpcId ~= CommonConst.SignBoardUnset then
      local NpcInfo = DataMgr.Npc[NpcId]
      if NpcInfo and NpcInfo.CharId and NpcInfo.CharId == CharId then
        local GameInstance = GWorld.GameInstance
        local GameState = UE4.UGameplayStatics.GetGameState(GameInstance)
        if NpcInfo.ShowAnimationId then
          local ShowAnimation = NpcInfo.ShowAnimationId
          local ShowAnimationId = ShowAnimation[key]
          GameState:GetNpcInfoAsync(NpcId, function(Npc)
            Npc:SetIdlePose(false)
            Npc:RefreshNpcAccessories(CharAvatar)
            if "Sit" == ShowAnimationId and key ~= CommonConst.SignBoardThird then
              Npc:SetSitPoseInteractive()
            end
          end)
        end
        break
      end
    end
  end
end

function WBP_Battle_C:OnHomeBaseBtnPlayAnim(UIName, AnimationName)
  self:AddTimer(0.01, function()
    local EntryList = self.ListView:GetDisplayedEntryWidgets():ToTable()
    for _, v in ipairs(EntryList) do
      v:OnHomeBaseBtnPlayAnim(UIName, AnimationName)
    end
  end, nil, nil, nil, false)
end

function WBP_Battle_C:OnSwitchRole()
  for i = 0, self.ListView:GetNumItems() - 1 do
    local Item = self.ListView:GetItemAt(i)
    if Item and Item.BtnId == CommonConst.ArmoryEnterId and Item.SelfWidget then
      Item.SelfWidget:UpdateArmoryIcon()
    end
  end
end

function WBP_Battle_C:OnSystemUIUnLoad(UIName)
  local SystemUIConfig = DataMgr.SystemUI[UIName]
  if SystemUIConfig and SystemUIConfig.IsHideBattleUnit and SystemUIConfig.IsHideBattleUnit ~= UIConst.EnumHideBattleUnitStyle.NormalShowAndHideAll and SystemUIConfig.IsHideBattleUnit ~= UIConst.EnumHideBattleUnitStyle.NormalShowAndHideAllExceptSelf then
    return
  end
  if 0 ~= UIManager(self).States:Num() then
    return
  end
  self:UnLoadSystem(UIName)
end

function WBP_Battle_C:UnLoadSystem(UIName)
  local SystemInfo, IsPlayInAnim = DataMgr.MainUI, false
  for SystemId, Info in pairs(SystemInfo) do
    if self:CheckNeedPlayInOutAnim(SystemId) then
      local SystemName = Info.SystemUIName
      if SystemName and SystemName == UIName then
        local MenuWorld = UIManager(self):GetUIObj(UIConst.MenuWorld)
        if MenuWorld then
          return false
        end
        IsPlayInAnim = self:TryRecoverUI()
        break
      end
    end
  end
  self:InitChatSimple()
  return IsPlayInAnim
end

function WBP_Battle_C:CheckNeedPlayInOutAnim(SystemId)
  if SystemId == CommonConst.ArmoryEnterId then
    return false
  elseif SystemId == ChatCommon.MainUIId then
    return false
  end
  return true
end

function WBP_Battle_C:TryRecoverUI()
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  if IsValid(Player) and Player.IsImmersionModel then
    self:SetVisibility(UIConst.VisibilityOp.Collapsed)
    return false
  end
  DebugPrint("-----yk---\228\184\187\231\149\140\233\157\162 in-------")
  self:PlayInAnim()
  self:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  return true
end

function WBP_Battle_C:PlayInAnim()
  DebugPrint("-----Jzn---\228\184\187\231\149\140\233\157\162 in-------")
  self:SetUIVisibilityTag("PlayBattleAni", false)
  self:UnbindAllFromAnimationFinished(self.In)
  
  local function ShowSelf()
    self:UnbindAllFromAnimationFinished(self.In)
  end
  
  self:BindToAnimationFinished(self.In, {self, ShowSelf})
  self:StopAnimation(self.Out)
  self:PlayAnimation(self.In)
  self.IsPlayOutAnim = false
  local Widget = self.Pos_Instruction_Mod:GetChildAt(0)
  if Widget and Widget:GetVisibility() ~= UE4.ESlateVisibility.Collapsed then
    Widget:TryGetReward()
  end
end

function WBP_Battle_C:_RefreshEscReddot()
  local Node = ReddotManager.GetTreeNode("BattleMainMenu")
  if Node then
    Node:TryFireOnCountChange(Node.Count, true)
  end
  local ActiNode = ReddotManager.GetTreeNode("ActivityHub")
  if ActiNode then
    local ActivityUtils = require("Blueprints.UI.WBP.Activity.ActivityUtils")
    ActivityUtils.RefreshActivityReddotNode()
  end
end

function WBP_Battle_C:PlayOutAnim(Obj, Func)
  DebugPrint("-----Jzn---\228\184\187\231\149\140\233\157\162 out-------")
  self:SetUIVisibilityTag("PlayBattleAni", true)
  self:StopAnimation(self.In)
  self:PlayAnimation(self.Out)
  self.IsPlayOutAnim = true
  self:UnbindAllFromAnimationFinished(self.Out)
  if Obj and Func then
    Func(Obj)
  end
  
  local function HideSelf()
    self.IsPlayOutAnim = false
    self:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
  
  self:BindToAnimationFinished(self.Out, {self, HideSelf})
end

function WBP_Battle_C:PlayDeathMaskIn()
  local Mask_Death = self:GetOrAddWidget("DeathMask", self.Pos_Death)
  if Mask_Death then
    Mask_Death:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    Mask_Death:PlayAnimation(Mask_Death.Mask_Death_In)
  end
end

function WBP_Battle_C:PlayDeathMaskOut()
  local Mask_Death = self:GetOrAddWidget("DeathMask", self.Pos_Death)
  if Mask_Death then
    local Visibility = Mask_Death.Panel_Death:GetVisibility()
    if Visibility == UE4.ESlateVisibility.Visible then
      Mask_Death.Panel_Death:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
      Mask_Death:PlayAnimation(Mask_Death.Mask_Death_Out)
    else
      Mask_Death:SetVisibility(UE4.ESlateVisibility.Collapsed)
    end
  end
end

function WBP_Battle_C:ShowPlayerDeadUI()
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  local ResurgenceUIName = Player:GetCurRecoveryUIName()
  local BattleResurgenceUI = UIManager(self):GetUI(ResurgenceUIName)
  if BattleResurgenceUI then
    self:ShowOrHideMainPlayerBloodUI(false, "Dead")
    self:HideSubSystem("Char_Skill", "Dead", true)
    if self.TakeAimIndicator then
      self.TakeAimIndicator:SetVisibility(UE4.ESlateVisibility.Collapsed)
    end
    self:ShowOrHideTeamDataTag(false)
  end
  if self.HBox then
    self.HBox:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
end

function WBP_Battle_C:HidePlayerDeadUI()
  self:ShowOrHideMainPlayerBloodUI(true, "Dead")
  self:HideSubSystem("Char_Skill", "Dead", false)
  local OwnerPlayer = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  self.Char_Skill:OnUpdateCharSp(nil, OwnerPlayer)
  if self.HBox then
    self.HBox:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  end
  if self.TakeAimIndicator then
    self.TakeAimIndicator:SetVisibility(UE4.ESlateVisibility.HitTestInvisible)
    self.TakeAimIndicator:RefreshUIShowPage()
  end
  local PlayerAvatar, IsNeedShowTeamTag = GWorld:GetAvatar(), false
  if nil ~= PlayerAvatar then
    if not GWorld:IsStandAlone() then
      IsNeedShowTeamTag = GameState(self).PlayerArray:Num() > 1
    else
      local TeamModelData = TeamController:GetModel()
      local TeamAvatarData = TeamModelData:GetTeam()
      local TeamNumber = nil == TeamAvatarData and 0 or #TeamAvatarData.Members
      IsNeedShowTeamTag = TeamNumber > 1
    end
  end
  self:ShowOrHideTeamDataTag(IsNeedShowTeamTag)
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  local ResurgenceUIName = Player:GetCurRecoveryUIName()
  local BattleResurgenceUI = UIManager(self):GetUI(ResurgenceUIName)
  if BattleResurgenceUI then
    BattleResurgenceUI:Close()
  end
end

function WBP_Battle_C:ShowBattleFortUI()
  local BattleFortUI = UIManager(self):GetUI("BattleFort")
  if BattleFortUI then
    if BattleFortUI.HideUITable then
      for Name, _ in pairs(BattleFortUI.HideUITable) do
        self:HideSubSystem(Name, "BattleFort", true)
        if "Pos_Entry" == Name then
          self.HideSystemEntrance = true
        elseif "Btn_GuideBook" == Name then
          self.HideGuideBookBtn = true
        end
      end
    end
    self:ShowOrHideMainPlayerBloodUI(false, "BattleFort")
    if self.TakeAimIndicator then
      self.TakeAimIndicator:SetVisibility(UE4.ESlateVisibility.Collapsed)
    end
    if IsValid(self.Joystick) then
      self.Joystick:SetTouchVisibility(UE4.ESlateVisibility.Collapsed)
    end
  end
end

function WBP_Battle_C:HideBattleFortUI()
  local BattleFortUI = UIManager(self):GetUI("BattleFort")
  if BattleFortUI then
    if BattleFortUI.HideUITable then
      for Name, VisibleState in pairs(BattleFortUI.HideUITable) do
        self:HideSubSystem(Name, "BattleFort", false)
        if "Pos_Entry" == Name then
          self.HideSystemEntrance = false
        elseif "Btn_GuideBook" == Name then
          self.HideGuideBookBtn = false
        end
      end
    end
    self:ShowOrHideMainPlayerBloodUI(true, "BattleFort")
    if self.TakeAimIndicator then
      self.TakeAimIndicator:SetVisibility(UE4.ESlateVisibility.HitTestInvisible)
      self.TakeAimIndicator:RefreshUIShowPage()
    end
    if IsValid(self.Joystick) then
      self.Joystick:SetTouchVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    end
    self:InitBtnList()
  end
end

function WBP_Battle_C:ShowFeinaEventHUD()
  local FeinaEventHUD = UIManager(self):LoadUINew("FeinaEventHUD")
  if FeinaEventHUD then
    if FeinaEventHUD.HideUITable then
      for Name, _ in pairs(FeinaEventHUD.HideUITable) do
        self:HideSubSystem(Name, "FeinaEvent", true)
        if "Pos_Entry" == Name then
          self.HideSystemEntrance = true
        elseif "Btn_GuideBook" == Name then
          self.HideGuideBookBtn = true
        end
      end
    end
    self:ShowOrHideMainPlayerBloodUI(false, "FeinaEvent")
    local TaskBar = TaskUtils:GetTaskBarWidget()
    if TaskBar then
      TaskBar:SetUIVisibilityTag("FeinaEvent", true)
    end
  end
end

function WBP_Battle_C:HideFeinaEventHUD()
  local FeinaEventHUD = UIManager(self):GetUI("FeinaEventHUD")
  if FeinaEventHUD then
    if FeinaEventHUD.HideUITable then
      for Name, _ in pairs(FeinaEventHUD.HideUITable) do
        self:HideSubSystem(Name, "FeinaEvent", false)
        if "Pos_Entry" == Name then
          self.HideSystemEntrance = false
        elseif "Btn_GuideBook" == Name then
          self.HideGuideBookBtn = false
        end
      end
    end
    self:ShowOrHideMainPlayerBloodUI(false, "FeinaEvent")
    local TaskBar = TaskUtils:GetTaskBarWidget()
    if TaskBar then
      TaskBar:SetUIVisibilityTag("FeinaEvent", false)
    end
    self:InitBtnList()
  end
end

function WBP_Battle_C:ShowOrHideMainPlayerBloodUI(bIsShow, Tag)
  DebugPrint("WBP_Battle_C:ShowOrHideMainPlayerBloodUI", bIsShow, Tag)
  if self.HUD_MainBar then
    self.HUD_MainBar:SetUIVisibilityTag(Tag, not bIsShow)
  end
end

function WBP_Battle_C:ShowOrHideTeamDataTag(bIsShowTag)
  local TargetWidgetNode
  if CommonUtils.GetDeviceTypeByPlatformName(self) == "Mobile" then
    TargetWidgetNode = nil
  else
    TargetWidgetNode = self.VB_Tag
  end
  if not TargetWidgetNode then
    return
  end
  if bIsShowTag then
    if not TargetWidgetNode:IsVisible() then
      TargetWidgetNode:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    end
  elseif TargetWidgetNode:IsVisible() then
    TargetWidgetNode:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
end

function WBP_Battle_C:SetUIVisibilityTag(HideTag, Invisible)
  if not IsValid(self) then
    return
  end
  if self.HideTags == nil then
    self.HideTags = {}
  end
  if Invisible then
    self.HideTags[HideTag] = 1
  else
    self.HideTags[HideTag] = nil
  end
  local IsHide = not IsEmptyTable(self.HideTags)
  local IsShippingPackage = UE4.UKismetSystemLibrary.IsPackagedForDistribution()
  if IsHide then
    if IsShippingPackage and CommonUtils.GetDeviceTypeByPlatformName(self) == "Mobile" then
      self:SetVisibility(UE4.ESlateVisibility.Collapsed)
      self.Panel_Content:SetVisibility(UE4.ESlateVisibility.Collapsed)
      SystemGuideManager:HideUIEvent(self.WidgetName)
    else
      SystemGuideManager:HideUIEvent(self.WidgetName)
      if self:GetVisibility() ~= ESlateVisibility.Collapsed then
        self:SetVisibility(UE4.ESlateVisibility.Collapsed)
      end
    end
  elseif IsShippingPackage and CommonUtils.GetDeviceTypeByPlatformName(self) == "Mobile" then
    self:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    self.Panel_Content:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    SystemGuideManager:ShowUIEvent(self.WidgetName)
  else
    if self:GetVisibility() == UE4.ESlateVisibility.Visibie or self:GetVisibility() == UE4.ESlateVisibility.SelfHitTestInvisible then
      SystemGuideManager:ShowUIEvent(self.WidgetName)
    end
    if self:GetVisibility() ~= UE4.ESlateVisibility.SelfHitTestInvisible then
      self:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
      SystemGuideManager:ShowUIEvent(self.WidgetName)
    end
  end
end

function WBP_Battle_C:OnBattleMapClose()
  self.Battle_Map:OnClickClose()
end

function WBP_Battle_C:SetVisibility(InVisibility)
  self.Overridden.SetVisibility(self, InVisibility)
  if IsValid(self.Joystick) then
    self.Joystick:SetTouchVisibilityFromBattle(InVisibility)
  else
    DebugPrint("Hy@== WBP_Battle_C:SetVisibility Error, Joystick is not valid")
  end
end

function WBP_Battle_C:ShowInstructionInfo(ActionName, IsHide)
  local Platform = CommonUtils:GetDeviceTypeByPlatformName(self)
  self.Pos_Instruction:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  local Instruction = self.Pos_Instruction:GetChildAt(0)
  if "PC" == Platform then
    if nil == Instruction then
      Instruction = self:GetOrAddWidget("InstructionPC", self.Pos_Instruction)
      if Instruction then
        Instruction:HideAllText()
      end
    end
  elseif nil == Instruction then
    Instruction = self:GetOrAddWidget("InstructionMobile", self.Pos_Instruction)
    if Instruction then
      Instruction:HideAllText()
    end
  end
  if Instruction then
    DebugPrint(ActionName, "===ShowInstructionInfo=============================")
    if IsHide then
      Instruction:HideActionText(ActionName)
    else
      Instruction:ShowActionText(ActionName)
    end
  end
end

function WBP_Battle_C:HideDynamicEventUI()
  local DynWidget = self:GetOrAddDynamicEventWidget()
  if DynWidget then
    DynWidget:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
end

function WBP_Battle_C:OnTeammateDie(TargetEid)
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  local Teammate = Battle(self):GetEntity(TargetEid)
  if Player.Eid ~= TargetEid then
    UIManager(self):ShowUITip(UIConst.Tip_CommonTop, string.format(GText("BATTLE_RECOVERY_TEAMMATEDEAD"), UIUtils.GetCharName(Teammate)))
  end
end

function WBP_Battle_C:OnTeammateRecovery(TargetEid)
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  local Teammate = Battle(self):GetEntity(TargetEid)
  if Player.Eid ~= TargetEid then
    if Teammate:IsPhantom() then
      UIManager(self):ShowUITip(UIConst.Tip_CommonTop, string.format(GText("BATTLE_RECOVERY_TEAMMATERECOVERY"), UIUtils.GetCharName(Teammate)))
    elseif Teammate:IsPlayer() then
      local GameState = UE4.UGameplayStatics.GetGameState(self)
      for key, value in pairs(GameState.PlayerArray) do
        if value == Teammate.PlayerState then
          UIManager(self):ShowUITip(UIConst.Tip_CommonTop, string.format(GText("BATTLE_RECOVERY_TEAMMATERECOVERY"), UIUtils.GetCharName(Teammate)))
        end
      end
    end
  end
end

function WBP_Battle_C:CreatTakeAimIndicator()
  self.TakeAimIndicator = self:CreateWidgetNew("TakeAimIndicator")
  if self.TakeAimIndicator then
    local Slot = self.Pos_Aim:AddChildToOverlay(self.TakeAimIndicator)
    Slot:SetHorizontalAlignment(EHorizontalAlignment.HAlign_Fill)
    Slot:SetVerticalAlignment(EVerticalAlignment.VAlign_Fill)
    local Player = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
    self.TakeAimIndicator:Init(Player)
    self.Pos_Aim:SetVisibility(UE4.ESlateVisibility.HitTestInvisible)
  end
end

function WBP_Battle_C:EndAim()
  self.Pos_Aim:ClearChildren()
end

function WBP_Battle_C:GetTakeAimIndicator()
  return self.TakeAimIndicator
end

function WBP_Battle_C:OnKeyDown(MyGeometry, InKeyEvent)
  return UIUtils.Unhandled
end

function WBP_Battle_C:OnPreviewKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if InKeyName == UIConst.GamePadKey.DPadDown or InKeyName == UIConst.GamePadKey.DPadUp or InKeyName == UIConst.GamePadKey.DPadRight or InKeyName == UIConst.GamePadKey.DPadLeft then
    return UIUtils.Handled
  end
  return UIUtils.Unhandled
end

function WBP_Battle_C:StartRougeCanonCountDown()
  self.Pos_Rouge_CountDown:ClearChildren()
  self.RougeGameCountDown = self:CreateWidgetNew("RougeGameCountDown")
  self.Pos_Rouge_CountDown:AddChild(self.RougeGameCountDown)
  self.RougeGameCountDown:InitRougeGameCountDown()
  self.Pos_Rouge_CountDown:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
end

function WBP_Battle_C:RefreshRougeGameCountDown(Time)
  if self.RougeGameCountDown then
    self.RougeGameCountDown:RefreshTime(Time)
  end
end

function WBP_Battle_C:OnEndRougeCanonMiniGame()
  self.Pos_Rouge_CountDown:ClearChildren()
  self.Pos_Rouge_CountDown:SetVisibility(UIConst.VisibilityOp.Collapsed)
end

function WBP_Battle_C:HideSubSystem(Name, HideTag, IsHide)
  if not HideTag or not Name then
    return
  end
  if self[Name] then
    if not self.SystemHideTags[Name] then
      self.SystemHideTags[Name] = {}
    end
    local Tags = self.SystemHideTags[Name]
    if IsHide then
      Tags[HideTag] = 1
    else
      Tags[HideTag] = nil
    end
    if IsEmptyTable(Tags) then
      self[Name]:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    else
      self[Name]:SetVisibility(UIConst.VisibilityOp.Collapsed)
    end
  end
end

function WBP_Battle_C:SetSubSystemVisibility(Name, Visibility)
  if self[Name] and not self:IsSubSystemHide(Name) then
    self[Name]:SetVisibility(Visibility)
  end
end

function WBP_Battle_C:IsSubSystemHide(Name)
  if not Name or not self[Name] then
    DebugPrint("System Does Not Exist. Name: ", Name)
    return
  end
  local Tags = self.SystemHideTags[Name]
  if not Tags or IsEmptyTable(Tags) then
    return false
  else
    return true
  end
end

function WBP_Battle_C:OnTempleRightUI()
  self.Group_Temple:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  self.Pos_TempleRight:ClearChildren()
  self.TempleRightUI = self:CreateWidgetNew("DungeonTempleRight")
  self.TempleRightUI:ConstructInfo()
  self.Pos_TempleRight:AddChild(self.TempleRightUI)
  self.Pos_TempleRight:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  local TaskBar = TaskUtils:GetTaskBarWidget()
  if TaskBar then
    TaskBar:SetUIVisibilityTag("Training", true)
  end
end

function WBP_Battle_C:OnPartyProgressStart()
  self.PartyProgress = self:CreateWidgetNew("PartyProgress")
  self.PartyProgress:ConstructInfo()
  self.Pos_TempleProgress:AddChild(self.PartyProgress)
end

function WBP_Battle_C:OnModBookQuestFinished(QuestId)
  DebugPrint("zwk OnModBookQuestFinished", QuestId)
  if not self.ModArchives then
    self.ModArchives = TArray(0)
  end
  self.ModArchives:Add(QuestId)
  if self.ModArchives:Length() > 0 and self.ModArchives:GetRef(1) == QuestId then
    self:ShowModBookTips(QuestId)
  end
end

function WBP_Battle_C:ShowModBookTips(QuestId)
  UIManager(self):LoadUINew("ModArchiveTaskTips", self, QuestId)
end

function WBP_Battle_C:OnPreModArchiveFinished(QuestId)
  if self.ModArchives then
    self.ModArchives:RemoveItem(QuestId)
  end
  if self.ModArchives:Length() > 0 then
    local QuestId = self.ModArchives:GetRef(1)
    self:ShowModBookTips(QuestId)
  end
end

function WBP_Battle_C:OnNotifyShowLargeCountDown(Count, bShowZeroText)
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  local UIManager = GameInstance:GetGameUIManager()
  if nil == UIManager then
    return
  end
  local UIManager = GameInstance:GetGameUIManager()
  local GuideCountDownFloat = UIManager:GetUIObj("GuideCountDown")
  if GuideCountDownFloat then
    GuideCountDownFloat:OnCountDownEnd()
    GuideCountDownFloat:Close()
  end
  GuideCountDownFloat = UIManager:LoadUINew("GuideCountDown")
  GuideCountDownFloat:SetVisibility(ESlateVisibility.Collapsed)
  self:ShowCountDown(GuideCountDownFloat, Count + 1, bShowZeroText)
end

function WBP_Battle_C:EMAfterInitialize()
  WBP_Battle_C.Super.EMAfterInitialize(self)
  self.Platform = CommonUtils.GetDeviceTypeByPlatformName(GWorld.GameInstance)
  if self.Platform == CommonConst.CLIENT_DEVICE_TYPE.MOBILE then
    if UIConst.OptimizeSwitch[CommonConst.CLIENT_DEVICE_TYPE.MOBILE].UI_WRAPPING_WITH_INVALIDBOX then
      self.InvalidationBox_AllEntry = self:ArrangeSingleWidgetWithInvalidBox(self.Pos_Entry, "InvalidationBox_AllEntry")
    end
    if UIConst.OptimizeSwitch[CommonConst.CLIENT_DEVICE_TYPE.MOBILE].UI_WRAPPING_WITH_RETAINERBOX then
      local IsShippingPackage = UE4.UKismetSystemLibrary.IsPackagedForDistribution()
      if IsShippingPackage then
        self:ArrangeSingleWidgetWithRetainerBox(self.Pos_TaskBar, "CustomRetainerBox_TaskBar", 1, 10)
      end
      self:ArrangeSingleWidgetWithRetainerBox(self.Pos_Drops, "CustomRetainerBox_CommonDrops", 5, 15)
      self:ArrangeSingleWidgetWithRetainerBox(self.Char_Skill, "CustomRetainerBox_Skill", 3, 5)
    end
  elseif self.Platform == CommonConst.CLIENT_DEVICE_TYPE.PC and UIConst.OptimizeSwitch[CommonConst.CLIENT_DEVICE_TYPE.PC].UI_WRAPPING_WITH_RETAINERBOX then
    self:ArrangeSingleWidgetWithRetainerBox(self.Pos_Drops, "CustomRetainerBox_CommonDrops", 1, 10)
    self:ArrangeSingleWidgetWithRetainerBox(self.Pos_SpecialDrops, "CustomRetainerBox_SpecialDrops", 5, 10)
    self:ArrangeSingleWidgetWithRetainerBox(self.Char_Skill, "CustomRetainerBox_Skill", 2, 10)
  end
end

function WBP_Battle_C:OnHomeBaseeBtnShowNewClue(UIName)
  self:AddTimer(5, function()
    self.Btn_Task:OnHomeBaseeBtnShowNewClue(UIName)
  end, nil, nil, nil, false)
end

function WBP_Battle_C:OnNewDetectiveQuestion(Question, IsFinished)
  local QuestionData = DataMgr.DetectiveQuestion[Question]
  if not QuestionData then
    return
  end
  if QuestionData.ParentQuestionID then
    return
  end
  local ReasoningToast
  self:AddTimer(1, function()
    ReasoningToast = UIManager(self):CreateWidget("WidgetBlueprint'/Game/UI/WBP/Reasoning/Widget/WBP_Reasoning_Toast.WBP_Reasoning_Toast'", true)
    ReasoningToast.Text_Title:SetText(GText(QuestionData.Tips))
    ReasoningToast.Text_Status:SetText(GText("Minigame_Textmap_100301"))
    if IsFinished then
      ReasoningToast.Text_Status:SetText(GText("Minigame_Textmap_100302"))
    end
    ReasoningToast:PlayAnimation(ReasoningToast.In)
    AudioManager(self):PlayUISound(self, "event:/ui/common/tuili_clue_toast", nil, nil)
  end, nil, nil, nil, false)
  self:AddTimer(3, function()
    ReasoningToast:PlayAnimation(ReasoningToast.Out)
  end, nil, nil, nil, false)
end

function WBP_Battle_C:CreateFortBack()
  self.Pos_FortBack:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  self.Pos_FortBack:ClearChildren()
  local FortBackKey = self:GetOrAddWidget("FortBackKey", self.Pos_FortBack)
  return FortBackKey
end

function WBP_Battle_C:DestoryFortBack()
  self.Pos_FortBack:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Pos_FortBack:ClearChildren()
end

function WBP_Battle_C:EnableGuideBookKey(bEnable)
  if bEnable then
    self:ListenForInputAction("OpenGuideBook", EInputEvent.IE_Pressed, false, {
      self,
      self.OpenGuideBook
    })
  else
    self:StopListeningForInputAction("OpenGuideBook", EInputEvent.IE_Pressed)
  end
end

function WBP_Battle_C:InitGameJumpWord()
  local JumpWordManager = USubsystemBlueprintLibrary.GetWorldSubsystem(self, UJumpWordManager)
  if JumpWordManager then
    local OptionName1 = "DamageTextAmount"
    local GameDamageTextAmount = EMCache:Get(OptionName1)
    if nil == GameDamageTextAmount then
      local OptionInfo = DataMgr.Option[OptionName1]
      local DefaultSize = OptionInfo.DefaultValue
      if CommonUtils.GetDeviceTypeByPlatformName(self) == "Mobile" and OptionInfo.DefaultValueM then
        DefaultSize = OptionInfo.DefaultValueM
      end
      GameDamageTextAmount = DefaultSize / OptionInfo.ScrollMappingScale
      EMCache:Set(OptionName1, GameDamageTextAmount)
    end
    JumpWordManager:SetMaxJumpWordCountRatio(GameDamageTextAmount)
    local OptionName2 = "DamageTextScale"
    local GameDamageTextScale = EMCache:Get(OptionName2)
    if nil == GameDamageTextScale then
      local OptionInfo = DataMgr.Option[OptionName2]
      local DefaultSize = OptionInfo.DefaultValue
      if CommonUtils.GetDeviceTypeByPlatformName(self) == "Mobile" and OptionInfo.DefaultValueM then
        DefaultSize = OptionInfo.DefaultValueM
      end
      GameDamageTextScale = DefaultSize / OptionInfo.ScrollMappingScale
      EMCache:Set(OptionName2, GameDamageTextScale)
    end
    JumpWordManager:SetJumpWordSize(tonumber(GameDamageTextScale))
  end
end

AssembleComponents(WBP_Battle_C)
return WBP_Battle_C
