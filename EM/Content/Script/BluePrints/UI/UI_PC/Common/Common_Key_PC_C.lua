require("UnLua")
local EMCache = require("EMCache.EMCache")
local Common_Key_PC = Class("BluePrints.UI.BP_EMUserWidget_C")
local ImgPathTransformer = {}

function ImgPathTransformer:Short2Long(ImgShortPath)
  return ""
end

local CommonKeyFactory = {}

function CommonKeyFactory:CreateTextKey(Text)
end

function CommonKeyFactory:CreateImgKey(ImgPath)
end

function CommonKeyFactory:CreateTextKeyWithDesc(Text, Desc)
end

function CommonKeyFactory:CreateImgKeyWithDesc(ImgPath, Desc)
end

function CommonKeyFactory:CreateTextAndTextKey(Text1, Text2)
end

function CommonKeyFactory:CreateTextAndImgKey(Text, ImgPath)
end

function CommonKeyFactory:CreateTextAndTextKeyWithDesc(Text1, Text2, Desc)
end

function CommonKeyFactory:CreateTextAndImgKeyWithDesc(Text, ImgPath, Desc)
end

function CommonKeyFactory:CreateTextButton(Text, bLongPress)
end

function CommonKeyFactory:CreateImgButton(ImgPath, bLongPress)
end

function CommonKeyFactory:CreateTextButtonWithDesc(Text, Desc)
end

function CommonKeyFactory:CreateImgButtonWithDesc(ImgPath, Desc)
end

function CommonKeyFactory:CreateTextAndTextButton(Text1, Text2, bLongPress)
end

function CommonKeyFactory:CreateTextAndImgButton(Text, ImgPath, bLongPress)
end

function CommonKeyFactory:CreateTextAndTextButtonWithDesc(Text1, Text2, Desc)
end

function CommonKeyFactory:CreateTextAndImgButtonWithDesc(Text, ImgPath, Desc)
end

function Common_Key_PC:Construct()
  if ChatController and ChatController.bInited then
    ChatController:RegisterEvent(self, function(self, EventId, ...)
      local BattleMain = UIManager():GetUIObj("BattleMain")
      if not BattleMain or not BattleMain:IsVisible() then
        return
      end
      if EventId == ChatCommon.EventID.OpenMainView then
        self:SetForbidKey(true)
      elseif EventId == ChatCommon.EventID.CloseMainView then
        self:SetForbidKey(false)
      end
    end)
  end
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
  if IsValid(self.GameInputModeSubsystem) then
    self.GameInputModeSubsystem.OnInputMethodChanged:Add(self, self.RefreshInfoByInputTypeChange)
  end
  rawset(self, "bIsSubKeyDesc", false)
end

function Common_Key_PC:Destruct()
  if ChatController and ChatController.bInited then
    ChatController:UnRegisterEvent(self)
  end
  if IsValid(self.GameInputModeSubsystem) then
    self.GameInputModeSubsystem.OnInputMethodChanged:Remove(self, self.RefreshInfoByInputTypeChange)
  end
end

function Common_Key_PC:SetForbidKey(bOn)
  if bOn == self.IsCurForbidkey then
    return
  end
  if bOn and self.bAllowForbid then
    EMUIAnimationSubsystem:EMStopAnimation(self, self.Normal)
    EMUIAnimationSubsystem:EMPlayAnimation(self, self.Forbidden)
  else
    EMUIAnimationSubsystem:EMStopAnimation(self, self.Forbidden)
    EMUIAnimationSubsystem:EMPlayAnimation(self, self.Normal)
  end
  self.IsCurForbidkey = bOn
end

function Common_Key_PC:RefreshInfoByInputTypeChange(CurInputDevice, CurGamepadName)
  if not self.CreateInfo then
    return
  end
  self:CreateCommonKey(self.CreateInfo)
end

function Common_Key_PC:CreateGamepadKey(GamepadImgKey)
  self:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = GamepadImgKey}
    }
  })
end

function Common_Key_PC:CreateCommonKey(CreateInfo)
  rawset(self, "CreateInfo", CreateInfo)
  rawset(self, "bLongPress", CreateInfo.bLongPress or false)
  rawset(self, "Desc", CreateInfo.Desc)
  rawset(self, "bEnable", true)
  if CreateInfo.bAllowForbid == nil then
    CreateInfo.bAllowForbid = true
  end
  rawset(self, "bAllowForbid", CreateInfo.bAllowForbid)
  rawset(self, "bHasButtonPressed", false)
  rawset(self, "PressTimer", 0)
  rawset(self, "bHasTriggerLongPress", false)
  rawset(self, "bHasTriggerLongRelease", false)
  rawset(self, "bIsHovered", false)
  rawset(self, "NeedUpdateCreateInfo", true)
  rawset(self, "_bSetImageInit", false)
  if self.bLongPress then
    local function func()
      AudioManager(self):PlayUISound(self, "event:/ui/common/btn_press", "LongPress", nil)
    end
    
    rawset(self, "SoundFunc", func)
  else
    local func = CreateInfo.SoundFunc or function()
      UIUtils.PlayCommonBtnSe(self)
    end
    rawset(self, "SoundFunc", func)
  end
  if self.KeyInfoList and CreateInfo.KeyInfoList and #self.KeyInfoList == #CreateInfo.KeyInfoList and 0 ~= #self.KeyInfoList then
    for i = 1, #self.KeyInfoList do
      if self.KeyInfoList[i].Type ~= CreateInfo.KeyInfoList[i].Type or self.KeyInfoList[i].ImgShortPath ~= CreateInfo.KeyInfoList[i].ImgShortPath or self.KeyInfoList[i].ImgLongPath ~= CreateInfo.KeyInfoList[i].ImgLongPath or self.KeyInfoList[i].Text ~= CreateInfo.KeyInfoList[i].Text or self.KeyInfoList[i].ClickCallback ~= CreateInfo.KeyInfoList[i].ClickCallback or self.KeyInfoList[i].Owner ~= CreateInfo.KeyInfoList[i].Owner then
        break
      end
      if i == #self.KeyInfoList then
        self.NeedUpdateCreateInfo = false
      end
    end
  end
  if self.NeedUpdateCreateInfo and self.SubWidgetList then
    self.SubWidgetList:Clear()
  end
  self.KeyInfoList = CreateInfo.KeyInfoList
  self.bSpecialLongPress = self.KeyInfoList[1].bSpecialLongPress or false
  self.bButton = self.IsButton or false
  if nil ~= CreateInfo.bButton then
    self.bButton = CreateInfo.bButton
  end
  self.bDisableResetWhenChangeDevice = self.bisForbid or CreateInfo.bDisableResetWhenChangeDevice or false
  self:_InitInternal(CreateInfo)
  self:_Reset2InitState()
end

function Common_Key_PC:_InitInternal(CreateInfo)
  if CreateInfo.bBattleKey then
    UIManager(self):RegisterBattleShortCutHudKey(self)
    self:_SetBattleShortCutKeyHidden()
  end
  if self:_IsCompound() then
    if CreateInfo.bIsSubKeyDesc then
      self:CreateSubKeyDesc(CreateInfo)
    elseif #CreateInfo.KeyInfoList > 1 then
      if self.NeedUpdateCreateInfo then
        self:_CreateSubKey(CreateInfo.KeyInfoList[1], "Key_1")
        self:_CreateSubKey(CreateInfo.KeyInfoList[2], "Key_2")
      end
    elseif self.NeedUpdateCreateInfo then
      self:_CreateSubKey(CreateInfo.KeyInfoList[1], "Key")
    end
    if self.Desc then
      self:SetDescription(self.Desc)
    end
  else
    self:_CheckAndRegisterCallback(CreateInfo.KeyInfoList[1])
    self:_InitSingleKeyContent(CreateInfo.KeyInfoList[1])
  end
  if self:_CanHandleButtonEvent(CreateInfo) and not self:IsDisableMouseKeyEvent(CreateInfo.KeyInfoList[1]) then
    self:_BindButtonEvent(self.Button_Key)
  elseif self.bButton then
    self.Button_Key:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  end
  if self:_IsLongPressButton() and self.LongPress then
    if self.ProgressBar_LongPress then
      self.ProgressBar_LongPress:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    end
    if self.Icon_Arrow then
      self.Icon_Arrow:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    end
    if self.Base_LongPress then
      self.Base_LongPress:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    end
    self.LongPressDuration = self.LongPress:GetEndTime() - self.LongPress:GetStartTime() + Const.ShortPressThreshold
    self.LongPressTimerInterval = 0.1
  else
    if self.ProgressBar_LongPress then
      self.ProgressBar_LongPress:SetVisibility(UE4.ESlateVisibility.Collapsed)
    end
    if self.Icon_Arrow then
      self.Icon_Arrow:SetVisibility(UIConst.VisibilityOp.Collapsed)
    end
    if self.Base_LongPress then
      self.Base_LongPress:SetVisibility(UIConst.VisibilityOp.Collapsed)
    end
  end
  if not self.NeedUpdateCreateInfo then
    self:_ResetWhenNotNeedUpdate()
  end
end

function Common_Key_PC:_ResetWhenNotNeedUpdate()
  if not self.SubWidgetList then
    return
  end
  for key, value in pairs(self.SubWidgetList) do
    if value.ProgressBar_LongPress and value.ProgressBar_LongPress.SetPercent then
      value.ProgressBar_LongPress:SetPercent(0)
      value:StopAllAnimations()
      value:PlayAnimation(value.Normal)
    end
  end
end

function Common_Key_PC:_Reset2InitState()
  if self.bDisableResetWhenChangeDevice then
    return
  end
  self:_ResetState(self.Normal)
end

function Common_Key_PC:_CanHandleButtonEvent(CreateInfo)
  return (CreateInfo.bEnableEvent or self.IsButton) and self.Button_Key
end

function Common_Key_PC:_CreateSubKey(KeyInfo, KeyName)
  local Widget = UE4.UWidgetBlueprintLibrary.Create(self, self:_GetBlueprintClass(KeyInfo.Type))
  Widget:CreateCommonKey({
    KeyInfoList = {KeyInfo},
    bEnableEvent = false,
    bButton = self.bButton,
    bLongPress = self.bLongPress
  })
  if self.SubWidgetList then
    self.SubWidgetList:Add(Widget)
  end
  self[KeyName]:ClearChildren()
  self[KeyName]:AddChild(Widget)
end

function Common_Key_PC:CreateSubKeyDesc(KeyInfo)
  self.bIsSubKeyDesc = true
  KeyInfo.bIsSubKeyDesc = true
  self.CreateInfo = KeyInfo
  self.KeyInfoList = KeyInfo.KeyInfoList
  if self.SubWidgetList then
    self.SubWidgetList:Clear()
  end
  self.KeyInfoList = KeyInfo.KeyInfoList
  if KeyInfo.Desc then
    self:SetDescription(KeyInfo.Desc)
  end
  local KeyWidget = UE4.UWidgetBlueprintLibrary.Create(self, self:_GetBlueprintClass(KeyInfo.Type))
  KeyWidget:CreateCommonKey({
    KeyInfoList = KeyInfo.KeyInfoList,
    bEnableEvent = true,
    bButton = false,
    bLongPress = true
  })
  self.Key:ClearChildren()
  self.Key:AddChild(KeyWidget)
  self:_Reset2InitState()
end

function Common_Key_PC:_InitSingleKeyContent(KeyInfo)
  if KeyInfo.Type == "Text" then
    if self.bIsSubKeyDesc then
      return
    end
    if KeyInfo.Text then
      self:_SetImage(KeyInfo.Type, KeyInfo.Text, KeyInfo.ImgLongPath, KeyInfo.bLargeSize)
    else
      self:_SetImage(KeyInfo.Type, KeyInfo.ImgShortPath, KeyInfo.ImgLongPath, KeyInfo.bLargeSize)
    end
  elseif KeyInfo.Type == "Img" then
    self:_SetImage(KeyInfo.Type, KeyInfo.ImgShortPath, KeyInfo.ImgLongPath, KeyInfo.bLargeSize)
  end
end

function Common_Key_PC:_AdjustSpacers(text)
  local isSingleChar = utf8.len(text) <= 1
  if self.Spacer_L then
    self.Spacer_L:SetVisibility(isSingleChar and UE4.ESlateVisibility.Collapsed or UE4.ESlateVisibility.Visible)
  end
  if self.Spacer_R then
    self.Spacer_R:SetVisibility(isSingleChar and UE4.ESlateVisibility.Collapsed or UE4.ESlateVisibility.Visible)
  end
end

function Common_Key_PC:_IsCompound()
  return self.Desc or #self.KeyInfoList > 1
end

function Common_Key_PC:_CheckAndRegisterCallback(KeyInfo)
  if KeyInfo.ClickCallback and type(KeyInfo.ClickCallback) == "function" then
    self:AddExecuteLogic(KeyInfo.Owner, KeyInfo.ClickCallback)
  end
  if KeyInfo.PressCallback and "function" == type(KeyInfo.PressCallback) then
    self:AddPressLogic(KeyInfo.Owner, KeyInfo.PressCallback)
  end
  if KeyInfo.ReleaseCallback and "function" == type(KeyInfo.ReleaseCallback) then
    self:AddReleaseLogic(KeyInfo.Owner, KeyInfo.ReleaseCallback)
  end
end

function Common_Key_PC:_IsLongPressButton()
  return self.bButton and self.bLongPress or self.bSpecialLongPress
end

function Common_Key_PC:_BindButtonEvent(Button)
  local OnPressed = Button.OnPressed
  local OnReleased = Button.OnReleased
  local OnClicked = Button.OnClicked
  local OnHovered = Button.OnHovered
  local OnUnhovered = Button.OnUnhovered
  OnPressed:Clear()
  OnReleased:Clear()
  OnClicked:Clear()
  OnHovered:Clear()
  OnUnhovered:Clear()
  OnPressed:Add(self, self.OnButtonPressed)
  OnReleased:Add(self, self.OnButtonReleased)
  OnClicked:Add(self, self.OnButtonReleasedInsideButtonFrame)
  OnHovered:Add(self, self.OnButtonHovered)
  OnUnhovered:Add(self, self.OnButtonUnhovered)
end

function Common_Key_PC:OnListItemObjectSet(ListItemObject)
  if ListItemObject.Owner ~= nil and nil ~= ListItemObject.Owner.InitCommonKey then
    ListItemObject.Owner:InitCommonKey(self, ListItemObject.Index)
  end
end

function Common_Key_PC:_SetBattleShortCutKeyHidden()
  local Avatar = GWorld:GetAvatar()
  local CurrentHidden
  if Avatar then
    CurrentHidden = EMCache:Get("BattleShortcutHudKeysHidden", true)
  end
  if CurrentHidden then
    self:SetVisibility(ESlateVisibility.Hidden)
  end
end

function Common_Key_PC:_GetBlueprintClass(Type)
  if "Text" == Type then
    return UE4.UClass.Load("WidgetBlueprint'/Game/UI/WBP/Common/Key/WBP_Com_KeyText.WBP_Com_KeyText_C'")
  elseif "Img" == Type then
    return UE4.UClass.Load("WidgetBlueprint'/Game/UI/WBP/Common/Key/WBP_Com_KeyImg.WBP_Com_KeyImg_C'")
  elseif "Add" == Type then
    return UE4.UClass.Load("WidgetBlueprint'/Game/UI/WBP/Common/Key/WBP_Com_KeyAdd.WBP_Com_KeyAdd_C'")
  elseif "Or" == Type then
    return UE4.UClass.Load("WidgetBlueprint'/Game/UI/WBP/Common/Key/WBP_Com_KeyOr.WBP_Com_KeyOr_C'")
  end
end

function Common_Key_PC:SetDescription(Description)
  self.Text_Desc:SetText(Description)
end

function Common_Key_PC:_SetImage(Type, ImgShortPath, ImgLongPath, bLargeSize)
  if not self._bSetImageInit then
    if self.Img then
      self.Img:SetVisibility(UIConst.VisibilityOp.Collapsed)
    end
    self._SetImageRequestID = self._SetImageRequestID or 0
    self._bSetImageInit = true
  end
  self._SetImageRequestID = self._SetImageRequestID + 1
  local currentRequestID = self._SetImageRequestID
  local ImgPath, Img
  if ImgShortPath then
    local FixPath
    if "Img" == Type then
      if bLargeSize then
        FixPath = UIUtils.UtilsGetKeyIconPathInGamepadByInstruction(ImgShortPath, self:_GetCurrentGamepadName())
      else
        FixPath = UIUtils.UtilsGetKeyIconPathInGamepad(ImgShortPath, self:_GetCurrentGamepadName())
      end
    else
      if bLargeSize then
        FixPath = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Instruction/T_Key_%s_L.T_Key_%s_L'"
      else
        FixPath = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Key/PC/T_Key_%s.T_Key_%s'"
      end
      if "Space" == ImgShortPath then
        ImgShortPath = "SpaceBar"
      elseif "Esc" == ImgShortPath then
        ImgShortPath = "Escape"
      end
    end
    local ReplaceKey = string.gsub(ImgShortPath, " ", "_")
    ImgPath = string.format(FixPath, ReplaceKey, ReplaceKey)
    Img = UE4.UResourceLibrary.LoadObjectAsync(self, ImgPath, {
      self,
      function(self, Object)
        if not IsValid(Object) then
          ImgPath = UIUtils.UtilsGetKeyIconPathInGamepad(ImgShortPath, self:_GetCurrentGamepadName())
          Img = UE4.UResourceLibrary.LoadObjectAsync(self, ImgPath, {
            self,
            function(self, Object)
              self:_AsyncLoadImgCallBack(Object, currentRequestID)
            end
          })
        else
          self.ImgPath = ImgPath
          self:_AsyncLoadImgCallBack(Object, currentRequestID)
        end
      end
    })
  else
    Img = UE4.UResourceLibrary.LoadObjectAsync(self, ImgLongPath, {
      self,
      function(self, Object)
        self:_AsyncLoadImgCallBack(Object, currentRequestID)
      end
    })
  end
  self.ImgPath = ImgPath
end

function Common_Key_PC:_AsyncLoadImgCallBack(Object, requestID)
  if self.Img then
    self.Img:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  end
  if requestID ~= self._SetImageRequestID then
    return
  end
  if not IsValid(Object) then
    DebugPrint("Common_Key_PC_C:\231\188\186\229\176\145\229\155\190\231\137\135\232\181\132\230\186\144: ImgPath = " .. self.ImgPath)
    return
  end
  if self.Img then
    local Material = self.Img:GetDynamicMaterial()
    if Material then
      Material:SetTextureParameterValue("MainTex", Object)
    else
      self.Img:SetBrushResourceObject(Object)
    end
    if Object.SourceDimension then
      self.Img:SetBrushSize(Object.SourceDimension)
    elseif Object.Blueprint_GetSizeX and Object.Blueprint_GetSizeY then
      local textureSize = UE4.FVector2D(Object:Blueprint_GetSizeX(), Object:Blueprint_GetSizeY())
      self.Img:SetBrushSize(textureSize)
    end
  end
end

function Common_Key_PC:_SetImageByInstruction(ImgShortPath, ImgLongPath)
  local ImgPath, Img
  if ImgShortPath then
    local FixPath = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Instruction/T_Key_%s_L.T_Key_%s_L'"
    local ReplaceKey = string.gsub(ImgShortPath, " ", "_")
    ImgPath = string.format(FixPath, ReplaceKey, ReplaceKey)
    Img = LoadObject(ImgPath)
    if not IsValid(Img) then
      ImgPath = UIUtils.UtilsGetKeyIconPathInGamepadByInstruction(ImgShortPath, self:_GetCurrentGamepadName())
      Img = LoadObject(ImgPath)
    end
  else
    Img = LoadObject(ImgLongPath)
  end
  if not IsValid(Img) then
    DebugPrint("\231\188\186\229\176\145\229\155\190\231\137\135\232\181\132\230\186\144: ImgPath = " .. ImgPath)
    return
  end
  if self.Img then
    local Size = FVector2D(Img:Blueprint_GetSizeX(), Img:Blueprint_GetSizeY())
    self.Img:SetBrushSize(Size)
    self.Img:SetBrushResourceObject(Img)
  end
end

function Common_Key_PC:SetImage(Type, ImgShortPath, ImgLongPath)
  self:_SetImage(Type, ImgShortPath, ImgLongPath)
end

function Common_Key_PC:SetImageByInstruction(ImgShortPath, ImgLongPath)
  self:_SetImageByInstruction(ImgShortPath, ImgLongPath)
end

function Common_Key_PC:ShowBanImg()
  local CommonWidget = self.Key:GetChildAt(0)
  if CommonWidget then
    CommonWidget.Group_Ban:SetVisibility(UE4.ESlateVisibility.Visible)
  end
end

function Common_Key_PC:MobileBanTextImg()
  local CommonWidget = self.Key:GetChildAt(0)
  if CommonWidget and CommonWidget.Img then
    CommonWidget.Img:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
  if CommonWidget and CommonWidget.Text_Key then
    CommonWidget.Text_Key:SetVisibility(UE4.ESlateVisibility.Collapsed)
    CommonWidget.Bg:SetVisibility(UE4.ESlateVisibility.Collapsed)
    CommonWidget.Bg_1:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
end

function Common_Key_PC:_GetCurrentGamepadName()
  if self.GameInputModeSubsystem == nil then
    local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
    self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
  end
  if IsValid(self.GameInputModeSubsystem) then
    return self.GameInputModeSubsystem:GetCurrentGamepadName()
  end
  return "Generic"
end

function Common_Key_PC:GetCurrentInputType()
  if self.GameInputModeSubsystem == nil then
    local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
    self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
  end
  if IsValid(self.GameInputModeSubsystem) then
    return self.GameInputModeSubsystem:GetCurrentInputType()
  end
  return ECommonInputType.MouseAndKeyboard
end

function Common_Key_PC:AddExecuteLogic(Object, ObjectFunc)
  self.ExecuteLogicObject = Object
  self.ExecuteLogicObjectFunc = ObjectFunc
end

function Common_Key_PC:RemoveExecuteLogic()
  self.ExecuteLogicObject = nil
  self.ExecuteLogicObjectFunc = nil
end

function Common_Key_PC:AddPressLogic(Object, ObjectFunc)
  self.PressLogicObject = Object
  self.PressLogicObjectFunc = ObjectFunc
end

function Common_Key_PC:RemovePressLogic()
  self.PressLogicObject = nil
  self.PressLogicObjectFunc = nil
end

function Common_Key_PC:AddReleaseLogic(Object, ObjectFunc)
  self.ReleaseLogicObject = Object
  self.ReleaseLogicObjectFunc = ObjectFunc
end

function Common_Key_PC:RemoveReleaseLogic()
  self.ReleaseLogicObject = nil
  self.ReleaseLogicObjectFunc = nil
end

function Common_Key_PC:_ExecuteLogic()
  if type(self.ExecuteLogicObjectFunc) == "function" then
    self.ExecuteLogicObjectFunc(self.ExecuteLogicObject)
  end
end

function Common_Key_PC:_PressLogic()
  if type(self.PressLogicObjectFunc) == "function" then
    self.PressLogicObjectFunc(self.PressLogicObject)
  end
end

function Common_Key_PC:_ReleaseLogic()
  if type(self.ReleaseLogicObjectFunc) == "function" then
    self.ReleaseLogicObjectFunc(self.ReleaseLogicObject)
  end
end

function Common_Key_PC:OnShortCutPressed()
  self:OnButtonPressed()
end

function Common_Key_PC:OnShortCutReleased()
  self:OnButtonReleased()
end

function Common_Key_PC:OnButtonPressed(bChild, bSetTimeRange, StartAtTime, EndAtTime)
  bChild = bChild or false
  bSetTimeRange = bSetTimeRange or false
  StartAtTime = StartAtTime or 0
  EndAtTime = EndAtTime or 0
  if self.bHasButtonPressed then
    return
  end
  if not self.bEnable then
    return
  end
  DebugPrint("OnButtonPressed", self.bEnable, self.bLongPress, self.bSpecialLongPress)
  if bSetTimeRange then
    self.LongPressDuration = EndAtTime - StartAtTime + Const.ShortPressThreshold
  end
  if bSetTimeRange then
    self:_ForeachChildren(function(v)
      v:OnButtonPressed(true, bSetTimeRange, StartAtTime, EndAtTime)
    end)
  else
    self:_ForeachChildren(function(v)
      v:OnButtonPressed(true)
    end)
  end
  if not bChild and self.SoundFunc and not self.bLongPress then
    self.SoundFunc()
  end
  self.bHasButtonPressed = true
  if not self.bLongPress then
    self:_OnButtonRealShortPressed()
  else
    self.PressTimer = 0
    self.bHasTriggerLongPress = false
    self.bHasTriggerLongRelease = false
    self.UpdateTimer = URuntimeCommonFunctionLibrary.K2_SetTimerDelegate({
      self,
      function()
        self:_Update(bSetTimeRange, StartAtTime, EndAtTime)
      end
    }, self.LongPressTimerInterval, true, 0)
  end
end

function Common_Key_PC:_ForeachChildren(func)
  if self.SubWidgetList and self.SubWidgetList:Num() > 0 then
    for i = 1, self.SubWidgetList:Num() do
      func(self.SubWidgetList[i])
    end
  end
end

function Common_Key_PC:OnButtonReleased()
  DebugPrint("OnButtonReleased", self.bEnable)
  if not self.bEnable then
    return
  end
  self:_ForeachChildren(function(v)
    v:OnButtonReleased()
  end)
  self.bHasButtonPressed = false
  if not self.bLongPress then
    self:_OnButtonRealShortReleased()
  else
    if self.UpdateTimer then
      URuntimeCommonFunctionLibrary.K2_ClearAndInvalidateTimerHandle(self, self.UpdateTimer)
    end
    self:_OnButtonRealLongReleased()
    self.PressTimer = 0
    self.bHasTriggerLongPress = false
    self.bHasTriggerLongRelease = false
  end
end

function Common_Key_PC:OnButtonReleasedInsideButtonFrame()
  if not self.bEnable then
    return
  end
  self:_ForeachChildren(function(v)
    v:OnButtonReleasedInsideButtonFrame()
  end)
  if not self.bLongPress then
    self:_ExecuteLogic()
  else
  end
end

function Common_Key_PC:_OnButtonRealShortPressed()
  DebugPrint("OnButtonRealShortPressed", self.Press)
  if self.Press then
    self:PlayAnimation(self.Press)
  end
  if not self.bIsHovered and self.Hover then
    self:PlayAnimation(self.Hover)
  end
  self:_PressLogic()
end

function Common_Key_PC:_OnButtonRealShortReleased()
  if self.Normal then
    self:PlayAnimation(self.Normal)
  end
  if not self.bIsHovered and self.UnHover then
    self:PlayAnimation(self.UnHover)
  end
  self:_ReleaseLogic()
end

function Common_Key_PC:_OnButtonRealLongPressed(bSetTimeRange, StartAtTime, EndAtTime)
  bSetTimeRange = bSetTimeRange or false
  StartAtTime = StartAtTime or 0
  EndAtTime = EndAtTime or 0
  if self.bLongPress then
    if bSetTimeRange then
      local Speed = self.LongPress:GetEndTime() / (EndAtTime - StartAtTime)
      self:PlayAnimation(self.LongPress, 0, 1, EUMGSequencePlayMode.Forward, Speed, false)
      DebugPrint(TXTTag, "bSetTimeRange", self.LongPress:GetEndTime(), Speed)
    else
      self:PlayAnimation(self.LongPress)
    end
  end
  if self.SoundFunc then
    self.SoundFunc()
  end
  if self.bIsHovered and self.UnHover then
    self:PlayAnimation(self.UnHover)
  end
end

function Common_Key_PC:_OnButtonRealLongReleased()
  if not self.bHasTriggerLongPress then
    return
  end
  if self.LongPress then
    self:_ResetState(self.LongPress)
    self:PlayAnimation(self.Normal)
    AudioManager(self):StopSound(self, "LongPress")
  elseif self.bSpecialLongPress and self.Press then
    self:PlayAnimation(self.Normal)
  end
  if self.bIsHovered and self.Hover then
    self:PlayAnimation(self.Hover)
  end
end

function Common_Key_PC:OnButtonHovered()
  if self.LongPress and self:IsAnimationPlaying(self.LongPress) then
    return
  end
  self.bIsHovered = true
  if not self.bEnable then
    return
  end
  self:_ForeachChildren(function(v)
    v:OnButtonHovered()
  end)
  if self.bLongPress and self.bHasTriggerLongPress then
    return
  end
  if not self.bLongPress and self.bHasButtonPressed then
    return
  end
  if self.Hover then
    self:PlayAnimation(self.Hover)
  end
end

function Common_Key_PC:OnButtonUnhovered()
  if self.LongPress and self:IsAnimationPlaying(self.LongPress) then
    return
  end
  self.bIsHovered = false
  if not self.bEnable then
    return
  end
  self:_ForeachChildren(function(v)
    v:OnButtonUnhovered()
  end)
  if self.bLongPress and self.bHasTriggerLongPress then
    return
  end
  if not self.bLongPress and self.bHasButtonPressed then
    return
  end
  if self.Hover then
    self:PlayAnimationReverse(self.Hover)
  end
end

function Common_Key_PC:DisableKey()
  self:_ForeachChildren(function(v)
    v:DisableKey()
  end)
  if self.bHasButtonPressed then
    self:OnButtonReleased()
  end
  self.bisForbid = true
  self.bEnable = false
  self.PressTimer = 0
  self.bHasButtonPressed = false
  if self.Hover then
    self:_ResetState(self.Hover)
  end
  self:StopAllAnimations()
  if self.Forbidden then
    self:PlayAnimation(self.Forbidden)
  end
end

function Common_Key_PC:EnableKey()
  self:_ForeachChildren(function(v)
    v:EnableKey()
  end)
  self.bisForbid = nil
  self.bEnable = true
  self.PressTimer = 0
  self.bHasButtonPressed = false
  self:StopAllAnimations()
  if self.Normal then
    self:PlayAnimation(self.Normal)
  end
end

function Common_Key_PC:ResetHasButtonPressed()
  self:_ForeachChildren(function(v)
    v.bHasButtonPressed = false
  end)
  self.bHasButtonPressed = false
end

function Common_Key_PC:PlayLoopAnim()
  self:_ForeachChildren(function(v)
    v:PlayLoopAnim()
  end)
  if self.Loop then
    self:PlayAnimation(self.Loop)
  end
end

function Common_Key_PC:StopLoopAnim()
  self:_ForeachChildren(function(v)
    v:StopLoopAnim()
  end)
  if self.Loop then
    self:_ResetState(self.Loop)
  end
end

function Common_Key_PC:_Update(bSetTimeRange, StartAtTime, EndAtTime)
  if self.bEnable and self.bHasButtonPressed and self.bLongPress then
    self.PressTimer = self.PressTimer + self.LongPressTimerInterval
    if not self.bHasTriggerLongPress and self.PressTimer >= Const.ShortPressThreshold then
      self.bHasTriggerLongPress = true
      self:_OnButtonRealLongPressed(bSetTimeRange, StartAtTime, EndAtTime)
    end
    if not self.bHasTriggerLongRelease and self.PressTimer >= self.LongPressDuration then
      self.bHasTriggerLongRelease = true
      if self.LongPress then
        self:_ResetState(self.LongPress)
      end
      self:OnButtonReleased()
      self:_ResetWhenNotNeedUpdate()
      self:_ExecuteLogic()
    end
  end
end

function Common_Key_PC:_ResetState(Anim)
  self:PlayAnimation(Anim)
  self:StopAnimation(Anim)
end

function Common_Key_PC:OnMouseButtonDown(MyGeometry, InKeyEvent)
  return UE4.UWidgetBlueprintLibrary.Handled()
end

function Common_Key_PC:ChangeText(KeyName)
  if self.Text_Key then
    self.Text_Key:SetText(KeyName)
  elseif self.Text_Desc then
    self.Text_Desc:SetText(KeyName)
  else
    return
  end
end

function Common_Key_PC:IsDisableMouseKeyEvent(KeyInfo)
  local ImageShortPath = KeyInfo.Text or KeyInfo.ImgShortPath
  local MouseKeys = {
    LeftMouseButton = true,
    MiddleMouseButton = true,
    MouseScroll = true,
    MouseScrollDown = true,
    MouseScrollUp = true,
    Mouse = true,
    Mouse_Button = true,
    RightMouseButton = true,
    ThumbMouseButton = true,
    ThumbMouseButton2 = true
  }
  if MouseKeys[ImageShortPath] then
    return true
  else
    return false
  end
end

return Common_Key_PC
