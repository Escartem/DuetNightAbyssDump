require("UnLua")
require("DataMgr")
local WBP_GuideTextFloat_C = Class("BluePrints.UI.BP_UIState_C")

function WBP_GuideTextFloat_C:Construct()
  AudioManager(self):PlayUISound(self, "event:/ui/common/guide_bar_show", nil, nil)
  self:AddDispatcher(EventID.OnChangeKeyBoardSet, self, self.RefreshText)
  self.IsDestroied = false
end

function WBP_GuideTextFloat_C:ShowDungeonGuide(TextIndex, Duration)
  self:AddTimer(Duration, self.Close)
  self:PlayAnimation(self.GuideText_in)
  self.Text_Title:SetVisibility(ESlateVisibility.Collapsed)
  self.WidgetSwitcher_0:SetActiveWidget(self.TextBlock_Content_5)
  local Text = GText(TextIndex)
  if Text then
    self.TextBlock_Content_5:SetText(Text)
  end
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  local UIManager = GameInstance:GetGameUIManager()
  if nil == UIManager then
    return
  end
  local UIManager = GameInstance:GetGameUIManager()
  local WarningHint = UIManager:GetUIObj(UIConst.WarningHintName)
  WarningHint = WarningHint or UIManager:LoadUI(UIConst.WARNINGHINT, UIConst.WarningHintName, UIConst.ZORDER_FOR_SECONDARY_POPUP)
  WarningHint:InitializeData(Duration)
end

function WBP_GuideTextFloat_C:GuideUIInit(UIKey, MessageId, Time, ExecuteLogic, IsTimeDilation, IsForceClick)
  self:AddGuideMessage(UIKey, MessageId, Time, nil)
  if ExecuteLogic and "" ~= ExecuteLogic then
    self:SetInfoAboutGuide(ExecuteLogic, IsTimeDilation)
  end
end

function WBP_GuideTextFloat_C:GuideUIInit_String(UIKey, Message, Time, ExecuteLogic, IsTimeDilation, IsForceClick)
  self:AddGuideMessage(UIKey, nil, Time, Message)
  if ExecuteLogic and "" ~= ExecuteLogic then
    self:SetInfoAboutGuide(ExecuteLogic, IsTimeDilation)
  end
end

function WBP_GuideTextFloat_C:GuideUIInit_EnumArray(UIKey, MessageId, Actions, Time, IsForceTouch, IsTimeDailation, ForbidSuccessAnim, IsNotForceRelease)
  self:AddGuideMessage(UIKey, MessageId, Time, nil)
  Actions = Actions:ToTable()
  PrintTable(Actions, 2)
  self:SetInfoAboutGuide_Enum(Actions, IsForceTouch, IsTimeDailation, ForbidSuccessAnim, IsNotForceRelease)
end

function WBP_GuideTextFloat_C:Initialize(Initializer)
  self.Super.Initialize(self)
  self.NowShowMessageId = nil
  self.LastTime = 0
  self.LineMaxFontCount = 16
  self.CurrentInputDevice = {
    "KeyboardKey",
    "MouseButton"
  }
end

function WBP_GuideTextFloat_C:SetShowInfoVisible(VisibleType)
  for i = 1, 7 do
    local ui_index = i - i // 2
    if 1 == i % 2 then
      self["TextBlock_Content_" .. ui_index]:SetVisibility(VisibleType)
    else
      self["Key_" .. ui_index]:SetVisibility(VisibleType)
    end
  end
end

function WBP_GuideTextFloat_C:AddGuideMessage(UIKey, MessageId, LastTime, Message)
  self.MessageRecord = Message
  self:InitListenEvent()
  self.UIKey = UIKey
  self.NowShowMessageId = MessageId
  self.LastTime = LastTime
  self:PlayAnimation(self.GuideText_in)
  self.MessageContent = nil
  self:SetShowInfoVisible(UE4.ESlateVisibility.Visible)
  self:UpdateTextContent(Message)
  self:RefreshOpInfoByInputDevice(self.GameInputModeSubsystem:GetCurrentInputType(), self.GameInputModeSubsystem:GetCurrentGamepadName())
  if self.LastTime > 0 then
    self:AddTimer(self.LastTime, self.PlayOutAnim, false, 0, "GuideTextFloatPlayOutAnim", false)
  end
end

function WBP_GuideTextFloat_C:DeleteGuideMessage(IsExecuteFinish)
  DebugPrint("==================================IsExecuteFinish===DeleteGuideMessage=========", IsExecuteFinish)
  if not self.IsNotForceRelease then
    self:StopListeningForAllInputActions()
    local PlayerCharacter = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
    PlayerCharacter:ForceReleaseGamepadUseSkill()
    self.NowState = nil
  end
  self.NowShowMessageId = nil
  self:PlayOutAnim(IsExecuteFinish)
end

function WBP_GuideTextFloat_C:Close()
  self.IsInit = false
  if self.IsInUIMode then
    self:SetInputUIOnly(false)
  end
  self.UIKey = self.UIKey or "GuideTextFloat"
  UIManager(self):UnLoadUI(self.UIKey)
  local GuideTextFloatList = UIManager(self):GetUIObj("GuideTextFloatList")
  if GuideTextFloatList then
    GuideTextFloatList:close()
  end
  if self.ExecuteLogic or self.IsForceTouch or self.IsTimePause then
    self:ChangePlayerInputable(true)
  end
  if self.OnGuideEnd:IsBound() then
    self.OnGuideEnd:Broadcast()
  end
  self.IsDestroied = true
end

function WBP_GuideTextFloat_C:PlayOutAnim(IsExecuteFinish)
  if self:IsAnimationPlaying(self.Complete) or self:IsAnimationPlaying(self.GuideText_Out) then
    return
  end
  if IsExecuteFinish or nil == IsExecuteFinish then
    DebugPrint("==================================IsExecuteFinish============")
    self:PlayAnimation(self.Complete)
    AudioManager(self):PlayUISound(self, "event:/ui/common/simple_task_check", "", nil)
    self:AddTimer(self.Complete:GetEndTime() * UE4.UGameplayStatics.GetGlobalTimeDilation(self), self.Close)
  else
    self:PlayAnimation(self.GuideText_Out)
    self:AddTimer(self.GuideText_Out:GetEndTime() * UE4.UGameplayStatics.GetGlobalTimeDilation(self), self.Close)
  end
  if self.LastTime > 0 then
    self.LastTime = 0
  end
  if self.NowState then
  end
end

function WBP_GuideTextFloat_C:UpdateTextContent(Messgae)
  local MessageContent = ""
  local TitleContent = ""
  local GuideType = ""
  local TextMapId, TitleId
  if not self.NowShowMessageId and not self.MessageContent and not Messgae then
    self:PlayOutAnim()
    return
  end
  if self.NowShowMessageId then
    TextMapId = CommonUtils.ChooseOptionByPlatform(DataMgr.Message[self.NowShowMessageId].MessageContentPC, DataMgr.Message[self.NowShowMessageId].MessageContentPhone)
    if self.UsingGamepad == true then
      TextMapId = DataMgr.Message[self.NowShowMessageId].MessageContentGamePad or DataMgr.Message[self.NowShowMessageId].MessageContentPC
    end
    TitleId = DataMgr.Message[self.NowShowMessageId].MessageTitlePC
    GuideType = DataMgr.Message[self.NowShowMessageId].MessageType
  end
  MessageContent = Messgae or GText(TextMapId)
  TitleContent = GText(TitleId)
  if "" ~= MessageContent and self.MessageContent ~= MessageContent or self.UsingGamepad then
    self.MessageContent = MessageContent
    self:SetText(self.MessageContent)
  end
  self:SetGuideColorByType(GuideType)
  local AllFontCount = self:getFontLength(MessageContent)
  self:UpdateGuideBgContentSize(AllFontCount, self.LineMaxFontCount)
end

function WBP_GuideTextFloat_C:RefreshText()
  if self.MessageContent == nil or self.MessageContent == "" then
    return
  end
  self:SetText(self.MessageContent)
end

function WBP_GuideTextFloat_C:SetText(MessageContent)
  local strs = self:AnalyzeText(MessageContent)
  if strs then
    for i = 1, 7 do
      local ui_index = i - i // 2
      if not strs[i] then
        if 1 == i % 2 then
          self["TextBlock_Content_" .. ui_index]:SetVisibility(UE4.ESlateVisibility.Collapsed)
        else
          self["Key_" .. ui_index]:SetVisibility(UE4.ESlateVisibility.Collapsed)
        end
      elseif string.find(strs[i], "&") then
        self:SetCommonKey(strs[i], i)
      else
        self["TextBlock_Content_" .. ui_index]:SetText(strs[i])
        self["TextBlock_Content_" .. ui_index]:SetVisibility(UE4.ESlateVisibility.Visible)
      end
    end
  end
end

function WBP_GuideTextFloat_C:CheckSpecialPadkey(ActionName)
  if "R" == ActionName or "L" == ActionName or "DpadV" == ActionName then
    return true
  end
  return false
end

function WBP_GuideTextFloat_C:GetSpecialPadkey(ActionName)
  if "R" == ActionName then
    return "R", "GamepadKey"
  elseif "L" == ActionName then
    return "L", "GamepadKey"
  elseif "DpadV" == ActionName then
    return "Vertical", "GamepadKey"
  end
  return nil, nil
end

function WBP_GuideTextFloat_C:SetCommonKey(KeyInfo, TableIndex)
  local KeyType
  local ActionName = string.sub(KeyInfo, 2, -2)
  local bplayLoopAnim = false
  if string.match(ActionName, "#%w+#") then
    bplayLoopAnim = true
    ActionName = string.gsub(ActionName, "#", "")
  end
  local Key, UIIndex
  if self:CheckSpecialPadkey(ActionName) and self.UsingGamepad then
    Key, KeyType = self:GetSpecialPadkey(ActionName)
  else
    Key, KeyType = self:GetKeyName(ActionName)
  end
  UIIndex = TableIndex - TableIndex // 2
  local Widget
  if "ControlAngle" == ActionName then
    if self.CurrentInputDevice[1] == "GamepadKey" then
      return
    else
      Widget = UE4.UWidgetBlueprintLibrary.Create(self, self:GetCommonKeyBlueprint(true))
      Widget:CreateCommonKey({
        KeyInfoList = {
          {Type = "Text", Text = Key}
        }
      })
      self["Key_" .. UIIndex]:ClearChildren()
      self["Key_" .. UIIndex]:AddChild(Widget)
    end
    return
  end
  if "ControlMove" == ActionName then
    if self.CurrentInputDevice[1] == "GamepadKey" then
      return
    else
      self["Key_" .. UIIndex]:ClearChildren()
      Widget = UE4.UWidgetBlueprintLibrary.Create(self, self:GetCommonKeyBlueprint(true))
      local Widget1 = UE4.UWidgetBlueprintLibrary.Create(self, self:GetCommonKeyBlueprint(true))
      local Widget2 = UE4.UWidgetBlueprintLibrary.Create(self, self:GetCommonKeyBlueprint(true))
      local Widget3 = UE4.UWidgetBlueprintLibrary.Create(self, self:GetCommonKeyBlueprint(true))
      Widget:CreateCommonKey({
        KeyInfoList = {
          {Type = "Text", Text = "W"}
        }
      })
      Widget1:CreateCommonKey({
        KeyInfoList = {
          {Type = "Text", Text = "A"}
        }
      })
      Widget2:CreateCommonKey({
        KeyInfoList = {
          {Type = "Text", Text = "S"}
        }
      })
      Widget3:CreateCommonKey({
        KeyInfoList = {
          {Type = "Text", Text = "D"}
        }
      })
      self["Key_" .. UIIndex]:AddChild(Widget)
      self["Key_" .. UIIndex]:AddChild(Widget1)
      self["Key_" .. UIIndex]:AddChild(Widget2)
      self["Key_" .. UIIndex]:AddChild(Widget3)
    end
    return
  end
  if not Key or not KeyType then
    print(_G.LogTag, "Error: Wrong Action Name, cannot find this Action's Key\239\188\154", ActionName)
    self:DeleteGuideMessage()
    return
  end
  if "KeyboardKey" == KeyType then
    Widget = UE4.UWidgetBlueprintLibrary.Create(self, self:GetCommonKeyBlueprint(true))
    Widget:CreateCommonKey({
      KeyInfoList = {
        {Type = "Text", Text = Key}
      }
    })
    self["Key_" .. UIIndex]:ClearChildren()
    self["Key_" .. UIIndex]:AddChild(Widget)
  elseif "MouseButton" == KeyType or "GamepadKey" == KeyType then
    if "MouseButton" == KeyType then
      Widget = UE4.UWidgetBlueprintLibrary.Create(self, self:GetCommonKeyBlueprint(true))
      Widget:CreateCommonKey({
        KeyInfoList = {
          {Type = "Text", Text = Key}
        }
      })
    else
      Widget = UE4.UWidgetBlueprintLibrary.Create(self, self:GetCommonKeyBlueprint(false))
      Widget:CreateCommonKey({
        KeyInfoList = {
          {Type = "Img", ImgShortPath = Key}
        }
      })
    end
    self["Key_" .. UIIndex]:ClearChildren()
    self["Key_" .. UIIndex]:AddChild(Widget)
    self["Key_" .. UIIndex]:SetVisibility(UE4.ESlateVisibility.Visible)
  end
  if Widget and bplayLoopAnim then
    Widget:PlayAnimation(Widget.Remind)
  end
end

function WBP_GuideTextFloat_C:GetCommonKeyBlueprint(bText)
  if bText then
    return UE4.UClass.Load("WidgetBlueprint'/Game/UI/WBP/Common/Key/WBP_Com_KeyText.WBP_Com_KeyText_C'")
  else
    return UE4.UClass.Load("WidgetBlueprint'/Game/UI/WBP/Common/Key/WBP_Com_KeyImg.WBP_Com_KeyImg_C'")
  end
end

function WBP_GuideTextFloat_C:GetKeyName(ActionName)
  local InputSetting = UE4.UInputSettings.GetInputSettings()
  local ActionKeys = UE4.TArray(UE4.FInputActionKeyMapping)
  InputSetting:GetActionMappingByName(ActionName, ActionKeys)
  for i, KeyMap in pairs(ActionKeys) do
    local key = KeyMap.Key
    for i, v in pairs(self.CurrentInputDevice) do
      if self.UsingGamepad then
        if string.find(KeyMap.Key.KeyName, "Gamepad") == nil then
          local List = UIUtils.GetIconListByActionName(ActionName)
          return List[#List], "GamepadKey"
        elseif string.find(KeyMap.Key.KeyName, "Gamepad") ~= nil then
          local List = UIUtils.GetIconListByActionName(ActionName)
          return List[#List], "GamepadKey"
        end
      elseif UE4.UKismetInputLibrary["Key_Is" .. v](key) then
        local res = UE4.UFormulaFunctionLibrary.Key_GetFName(key)
        local res_TextMap_index = string.gsub(res, " ", "_")
        res = res_TextMap_index
        return res, v
      end
    end
  end
  return nil, nil
end

function WBP_GuideTextFloat_C:AnalyzeText(MessageContent)
  local match_res = {}
  if nil == MessageContent then
    return
  end
  local match_word = string.gmatch(MessageContent, "&.[^&]*&")
  for word in match_word, nil, nil, nil do
    local start_index, end_index = string.find(MessageContent, word)
    table.insert(match_res, string.sub(MessageContent, 1, start_index - 1))
    table.insert(match_res, word)
    MessageContent = string.sub(MessageContent, end_index + 1)
  end
  table.insert(match_res, MessageContent)
  return match_res
end

function WBP_GuideTextFloat_C:getFontLength(str)
  if not str or #str <= 0 then
    return 0
  end
  local length = 0
  local index = 1
  while true do
    local curByteNum = string.byte(str, index)
    if curByteNum >= 0 and curByteNum <= 127 then
      index = index + 1
    elseif curByteNum >= 194 and curByteNum <= 223 then
      index = index + 2
    elseif curByteNum >= 224 and curByteNum <= 239 then
      index = index + 3
    elseif curByteNum >= 240 and curByteNum <= 247 then
      index = index + 4
    else
      index = index + 4
    end
    length = length + 1
    if index > #str then
      break
    end
  end
  return length
end

function WBP_GuideTextFloat_C:SetInfoAboutGuide(ExecuteLogic, IsTimePause)
  if not ExecuteLogic or "" == ExecuteLogic then
    print(_G.LogTag, "ERROR: Use ShowGuideMessage but don't have ActionName")
    self:DeleteGuideMessage()
    return
  end
  self.ExecuteLogic = ExecuteLogic
  self.IsTimePause = IsTimePause
  self:AnalyzeExecuteLogic(ExecuteLogic)
  if -2 == self.LastTime then
    self:ChangePlayerInputable(false)
  end
end

function WBP_GuideTextFloat_C:AnalyzeExecuteLogic(LogicStr)
  local index = string.find(LogicStr, ",")
  self.ExecuteLogics = {}
  while index do
    table.insert(self.ExecuteLogics, string.sub(LogicStr, 1, index - 1))
    LogicStr = string.sub(LogicStr, index + 1)
    index = string.find(LogicStr, ",")
  end
  if string.sub(LogicStr, 1) and string.sub(LogicStr, 1) ~= "" then
    table.insert(self.ExecuteLogics, string.sub(LogicStr, 1))
  end
  for i, v in pairs(self.ExecuteLogics) do
    self:ListenForInputAction(v, UE4.EInputEvent.IE_Pressed, true, {
      self,
      self["Execute" .. v .. "Logic"]
    })
  end
  self.NowState = self.ExecuteLogics[1]
  self.NowStateIndex = 1
end

function WBP_GuideTextFloat_C:ChangePlayerInputable(IfAble)
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  local PlayerCharacter = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  if not IfAble then
    UEPrint("WBP_GuideTextFloat Disable input")
    if self.IsTimePause then
      UE4.UGameplayStatics.SetGlobalTimeDilation(self, 0.05)
    end
    PlayerCharacter:AddDisableInputTag("GuideTextFloat")
  else
    UEPrint("WBP_GuideTextFloat Enable input")
    if self.IsTimePause then
      UE4.UGameplayStatics.SetGlobalTimeDilation(self, 1)
    end
    PlayerCharacter:RemoveDisableInputTag("GuideTextFloat")
  end
end

function WBP_GuideTextFloat_C:Destruct()
  WBP_GuideTextFloat_C.Super.Destruct(self)
  self:SetInputUIOnly(false)
  if self.IsTimePause then
    UE4.UGameplayStatics.SetGlobalTimeDilation(self, 1)
  end
  local GameInstance = GWorld.GameInstance
  local PlayerCharacter = UE4.UGameplayStatics.GetPlayerCharacter(GameInstance, 0)
  if PlayerCharacter then
    PlayerCharacter:RemoveDisableInputTag("GuideTextFloat")
  end
end

function WBP_GuideTextFloat_C:LogicExecuteFinish()
  if self.NowState == self.ExecuteLogics[#self.ExecuteLogics] then
    UE4.UGameplayStatics.SetGlobalTimeDilation(self, 1)
    self:DeleteGuideMessage(self.ForbidSuccessAnim ~= true)
  else
    self.NowStateIndex = self.NowStateIndex + 1
    self.NowState = self.ExecuteLogics[self.NowStateIndex]
  end
end

function WBP_GuideTextFloat_C:ExecuteJumpLogic()
  if self.NowState ~= "Jump" then
    return
  end
  local PlayerCharacter = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  PlayerCharacter:StartJump()
  self:LogicExecuteFinish()
end

function WBP_GuideTextFloat_C:ExecuteSlideLogic()
  if self.NowState ~= "Slide" then
    return
  end
  local PlayerCharacter = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  if UE4.UKismetMathLibrary.Vector_IsZero(PlayerCharacter.MoveInputCache) then
    PlayerCharacter:PlayCrouch()
  else
    PlayerCharacter:PlaySlide()
  end
  self:LogicExecuteFinish()
end

function WBP_GuideTextFloat_C:ExecuteFireLogic()
  if self.NowState ~= "Fire" then
    return
  end
  local PlayerCharacter = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  PlayerCharacter:StartFire()
  self:LogicExecuteFinish()
end

function WBP_GuideTextFloat_C:ExecuteAttackLogic()
  if self.NowState ~= "Attack" then
    return
  end
  local PlayerCharacter = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  PlayerCharacter:ReleaseAttack()
  self:LogicExecuteFinish()
end

function WBP_GuideTextFloat_C:ExecuteSkill1Logic()
  if self.NowState ~= "Skill1" then
    return
  end
  local PlayerCharacter = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  PlayerCharacter:PressSkill1()
  self:LogicExecuteFinish()
end

function WBP_GuideTextFloat_C:ReleaseSkill1Logic()
  if self.NowState ~= "Skill1" then
    return
  end
  local PlayerCharacter = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  PlayerCharacter:ReleaseSkill1()
  self:LogicExecuteFinish()
end

function WBP_GuideTextFloat_C:ExecuteSkill2Logic()
  if self.NowState ~= "Skill2" then
    return
  end
  local PlayerCharacter = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  PlayerCharacter:PressSkill2()
  PlayerCharacter:ForceReleaseGamepadUseSkill()
  self:LogicExecuteFinish()
end

function WBP_GuideTextFloat_C:ExecuteSkill3Logic()
  if self.NowState ~= "Skill3" then
    return
  end
  local PlayerCharacter = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  PlayerCharacter:PressSkill3()
  PlayerCharacter:ForceReleaseGamepadUseSkill()
  self:LogicExecuteFinish()
end

function WBP_GuideTextFloat_C:ExecuteOpenMenuLogic()
  if self.NowState ~= "OpenMenu" then
    return
  end
  local PlayerCharacter = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  PlayerCharacter:PressOpenMenu()
  self:LogicExecuteFinish()
end

function WBP_GuideTextFloat_C:PressSkillCombLogic()
  if not string.match(self.NowState, "Skill1") then
    return
  end
  local PlayerCharacter = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  PlayerCharacter:PressGamepadUseSkill()
end

function WBP_GuideTextFloat_C:ReleaseSkillCombLogic()
  if self.NowState ~= "Skill1" then
    return
  end
  local PlayerCharacter = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  PlayerCharacter:ForceReleaseGamepadUseSkill()
end

function WBP_GuideTextFloat_C:SetInfoAboutGuide_Enum(Actions, IsForceTouch, IsTimeDilation, ForbidSuccessAnim, IsNotForceRelease)
  if self.LastTime < 0 and (IsForceTouch or IsTimeDilation) and 0 == #Actions then
    print(_G.LogTag, "Error: WBP_GuideTextFloat_C \229\188\186\229\136\182\232\190\147\229\133\165/\230\151\182\233\151\180\232\134\168\232\131\128, \230\140\129\231\187\173\230\151\182\233\151\180\228\184\186-1, \228\189\134\230\152\175\230\178\161\230\156\137\233\156\128\232\166\129\232\191\155\232\161\140\231\154\132\230\147\141\228\189\156, UI\228\184\141\228\188\154\229\133\179\233\151\173, \231\142\169\229\174\182\230\151\160\230\179\149\230\147\141\228\189\156/\230\151\182\233\151\180\228\184\128\231\155\180\232\134\168\232\131\128, \232\161\168\231\142\176\233\148\153\232\175\175")
    self:DeleteGuideMessage()
    return
  end
  self.IsTimePause = IsTimeDilation
  self.IsForceTouch = IsForceTouch
  self.ForbidSuccessAnim = ForbidSuccessAnim
  self.IsNotForceRelease = IsNotForceRelease
  if IsForceTouch then
    self:ChangePlayerInputable(false)
  end
  self:AnalyzeExecuteLogic_Enum(Actions)
end

function WBP_GuideTextFloat_C:AnalyzeExecuteLogic_Enum(Actions)
  self.ExecuteLogics = {}
  local EnumSkill = UE4.ESkillName
  for i, skill_enum in pairs(Actions) do
    local ActionName = EnumSkill:GetNameByValue(skill_enum)
    if ActionName then
      table.insert(self.ExecuteLogics, ActionName)
      if self.IsForceTouch then
        if "OpenMenu" == ActionName then
          self:ListenForInputAction(ActionName, UE4.EInputEvent.IE_Pressed, false, {
            self,
            self["Execute" .. ActionName .. "Logic"]
          })
        elseif string.match(ActionName, "Skill") then
          self:ListenForInputAction("GamepadUseSkill", UE4.EInputEvent.IE_Pressed, true, {
            self,
            self.PressSkillCombLogic
          })
          self:ListenForInputAction("GamepadUseSkill", UE4.EInputEvent.IE_Released, false, {
            self,
            self.ReleaseSkillCombLogic
          })
          self:ListenForInputAction(ActionName, UE4.EInputEvent.IE_Pressed, true, {
            self,
            self["Execute" .. ActionName .. "Logic"]
          })
          self:ListenForInputAction(ActionName, UE4.EInputEvent.IE_Released, true, {
            self,
            self["Release" .. ActionName .. "Logic"]
          })
        else
          self:ListenForInputAction(ActionName, UE4.EInputEvent.IE_Pressed, true, {
            self,
            self["Execute" .. ActionName .. "Logic"]
          })
        end
      elseif "BulletJump" == ActionName then
        self:ListenForInputAction("Jump", UE4.EInputEvent.IE_Repeat, false, {
          self,
          self["Wait" .. ActionName .. "LogicExecute"]
        })
        self:ListenForInputAction("Jump", UE4.EInputEvent.IE_Released, false, {
          self,
          self["Wait" .. ActionName .. "LogicExecute"]
        })
      elseif "HeavyAttack" == ActionName then
        self:ListenForInputAction("Attack", UE4.EInputEvent.IE_Pressed, false, {
          self,
          self["Wait" .. ActionName .. "PressLogicExecute"]
        })
        self:ListenForInputAction("Attack", UE4.EInputEvent.IE_Released, false, {
          self,
          self["Wait" .. ActionName .. "ReleaseLogicExecute"]
        })
      elseif "FireInAir" == ActionName then
        self:ListenForInputAction("Fire", UE4.EInputEvent.IE_Pressed, false, {
          self,
          self["Wait" .. ActionName .. "LogicExecute"]
        })
      elseif "ContinuousShooting" == ActionName then
        self:ListenForInputAction("Fire", UE4.EInputEvent.IE_Pressed, false, {
          self,
          self["Wait" .. ActionName .. "PressLogicExecute"]
        })
        self:ListenForInputAction("Fire", UE4.EInputEvent.IE_Released, false, {
          self,
          self["Wait" .. ActionName .. "ReleaseLogicExecute"]
        })
      elseif "ControlMove" == ActionName then
        self:AddTimer(0.1, self.WaitControlMoveLogicExecute, true, 0, "TryControlMove")
      elseif "ControlAngle" == ActionName then
        self:AddTimer(0.1, self.WaitControlAngleLogicExecute, true, 0, "TryControlAngle")
      elseif "FallAttack" == ActionName then
        self:ListenForInputAction("Attack", UE4.EInputEvent.IE_Pressed, false, {
          self,
          self["Wait" .. ActionName .. "LogicExecute"]
        })
      elseif "SlideAttack" == ActionName then
        self:ListenForInputAction("Attack", UE4.EInputEvent.IE_Released, false, {
          self,
          self["Wait" .. ActionName .. "LogicExecute"]
        })
      elseif "OpenMenu" == ActionName then
        self:ListenForInputAction("OpenMenu", UE4.EInputEvent.IE_Released, false, {
          self,
          self["Wait" .. ActionName .. "LogicExecute"]
        })
      else
        self:ListenForInputAction(ActionName, UE4.EInputEvent.IE_Pressed, false, {
          self,
          function()
            self:LogicExecuteFinish()
          end
        })
      end
    end
  end
  self.NowState = self.ExecuteLogics[1]
  self.NowStateIndex = 1
end

function WBP_GuideTextFloat_C:WaitBulletJumpLogicExecute()
  if self.NowState ~= "BulletJump" then
    return
  end
  local PlayerCharacter = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  if "BulletJump" == PlayerCharacter:GetCharacterTag() then
    self:LogicExecuteFinish()
  end
end

function WBP_GuideTextFloat_C:WaitHeavyAttackPressLogicExecute()
  if self.NowState ~= "HeavyAttack" then
    return
  end
  self:AddTimer(0.2, function()
    self:LogicExecuteFinish()
  end, false, 0, "TryHeavyAttack")
end

function WBP_GuideTextFloat_C:WaitHeavyAttackReleaseLogicExecute()
  if self.NowState ~= "HeavyAttack" then
    return
  end
  self:RemoveTimer("TryHeavyAttack")
end

function WBP_GuideTextFloat_C:WaitFireInAirLogicExecute()
  if self.NowState ~= "FireInAir" then
    return
  end
  local PlayerCharacter = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  if PlayerCharacter.IsInAir then
    self:LogicExecuteFinish()
  end
end

function WBP_GuideTextFloat_C:WaitContinuousShootingPressLogicExecute()
  if self.NowState ~= "ContinuousShooting" then
    return
  end
  self:AddTimer(0.2, function()
    self:LogicExecuteFinish()
  end, false, 0, "TryContinuousShooting")
end

function WBP_GuideTextFloat_C:WaitContinuousShootingReleaseLogicExecute()
  if self.NowState ~= "ContinuousShooting" then
    return
  end
  self:RemoveTimer("TryContinuousShooting")
end

function WBP_GuideTextFloat_C:WaitControlMoveLogicExecute()
  local PlayerCharacter = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  if 0 ~= PlayerCharacter.MoveInput.X or 0 ~= PlayerCharacter.MoveInput.Y then
    self:RemoveTimer("TryControlMove")
    self:LogicExecuteFinish()
  end
end

function WBP_GuideTextFloat_C:WaitControlAngleLogicExecute()
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  if not self.ControllerLastRotator then
    self.ControllerLastRotator = PlayerController:GetControlRotation()
  end
  if PlayerController:GetControlRotation() ~= self.ControllerLastRotator then
    self:RemoveTimer("TryControlAngle")
    self:LogicExecuteFinish()
  else
    self.ControllerLastRotator = PlayerController:GetControlRotation()
  end
end

function WBP_GuideTextFloat_C:WaitFallAttackLogicExecute()
  if self.NowState ~= "FallAttack" then
    return
  end
  self:AddTimer(0.1, function()
    local PlayerCharacter = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
    if PlayerCharacter.CurrentSkillId == PlayerCharacter:GetSkillByType(Const.FallAttack) then
      self:LogicExecuteFinish()
    end
  end)
end

function WBP_GuideTextFloat_C:WaitSlideAttackLogicExecute()
  if self.NowState ~= "SlideAttack" then
    return
  end
  self:AddTimer(0.1, function()
    local PlayerCharacter = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
    if PlayerCharacter.CurrentSkillId == PlayerCharacter:GetSkillByType(Const.SlideSkill) then
      self:LogicExecuteFinish()
    end
  end)
end

function WBP_GuideTextFloat_C:WaitOpenMenuLogicExecute()
  if self.NowState ~= "OpenMenu" then
    return
  end
  self:AddTimer(0.1, function()
    local PlayerCharacter = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
    if PlayerCharacter.CurrentSkillId == PlayerCharacter:GetSkillByType(Const.SlideSkill) then
      self:LogicExecuteFinish()
    end
  end)
end

function WBP_GuideTextFloat_C:InitListenEvent()
  if IsValid(self.GameInputModeSubsystem) then
    self.GameInputModeSubsystem.OnInputMethodChanged:Add(self, self.RefreshOpInfoByInputDevice)
  end
end

function WBP_GuideTextFloat_C:RefreshBaseInfo()
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
  if IsValid(self.GameInputModeSubsystem) then
    self:RefreshOpInfoByInputDevice(self.GameInputModeSubsystem:GetCurrentInputType(), self.GameInputModeSubsystem:GetCurrentGamepadName())
  end
end

function WBP_GuideTextFloat_C:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  if CurInputDevice == ECommonInputType.Touch then
    return
  end
  local IsUseKeyAndMouse = CurInputDevice == ECommonInputType.MouseAndKeyboard
  if IsUseKeyAndMouse then
    self.UsingGamepad = false
    if not self.NowShowMessageId then
      return
    end
    local TextMapId = CommonUtils.ChooseOptionByPlatform(DataMgr.Message[self.NowShowMessageId].MessageContentPC, DataMgr.Message[self.NowShowMessageId].MessageContentPhone)
    self.MessageContent = GText(TextMapId)
    self:RefreshText()
  else
    self.UsingGamepad = true
    self:UpdateTextContent(self.MessageRecord)
  end
end

return WBP_GuideTextFloat_C
