require("UnLua")
local StrLib = require("BluePrints.Common.DataStructure")
local Deque = StrLib.Deque
local Stack = StrLib.Stack
local EMCache = require("EMCache.EMCache")
local GMVariable = require("BluePrints.UI.GMInterface.GMVariable")
local CommonUtils = require("Utils.CommonUtils")
local BP_UIManagerComponent_C = Class({
  "BluePrints.Common.TimerMgr"
})
local EUIManageLoadStateTags = {
  NormalMode = "Normal",
  StoryMode = Const.TalkHideTag,
  SkillFeatureMode = Const.SkillFeatureHideTag,
  GMMode = "GM"
}
local ENormalModeSubState = {
  ExclusiveMode = "Exclusive",
  ConditionMode = "Condition",
  BlockedMode = "Blocked"
}

function BP_UIManagerComponent_C:Initialize(Initializer)
  self.UniqueCount = {}
  self.AllNotRenderWorldUI = {}
  self.WidgetComponentList = {}
  self.WaitToTriggerTipsInfo = {}
  self.HideByStateTagUIList = {}
  self.AllUIStateTagsCluster = {}
  self.PopUpUIWidgetRecord = {}
  self.ShortCutHudKeys = {}
  self.BanActionCallbackMap = {}
  self.GMShowUIOnly = nil
  self.ShowInStoryUINames = {}
  self.AllUIActorCameraHelper = {}
  self.AllUINpcActor = {}
  self.CacheModifyHiddenEntity = {}
  self.IsMenuAnchorOpen = false
  self.GameInputModeSubsystem = nil
  self.FlowList = {}
  self.AsyncLoadHandlers = {}
  self.AsyncGetUIContexts = {}
  self.AsyncUnloadFlags = {}
  self.SystemOpenFrameFlag = 0
  self:InitAllContainerData()
  self:InitUIConfigBySetting()
end

function BP_UIManagerComponent_C:InitUIConfigBySetting()
  if EMCache then
    local GMInfo = EMCache:Get("GMInfo")
    if GMInfo and GMInfo.DisableScreenMessages then
      UE4.UKismetSystemLibrary.ExecuteConsoleCommand(nil, "DisableAllScreenMessages")
    else
      UE4.UKismetSystemLibrary.ExecuteConsoleCommand(nil, "EnableAllScreenMessages")
    end
  end
end

function BP_UIManagerComponent_C:InitAllContainerData()
  self.UILoadingDeque = Deque.New()
  self.UIJumpToDeque = Deque.New()
  self._CommonToastQueue = Deque.New()
  self._CommonToastTimer = "UIManager_CommonToastTimer"
  self._CommonToastSet = {}
  self._StoryToastQueue = Deque.New()
  self._StoryToastTimer = "UIManager_StoryToastTimer"
  self._StoryToastSet = {}
  self.UIManagerModeTagsStack = Stack.New()
  self:PushCurrentModeStateTag(EUIManageLoadStateTags.NormalMode)
end

function BP_UIManagerComponent_C:InitUIStates()
  self:_InitGameDPI()
  local SceneManager = GWorld.GameInstance:GetSceneManager()
  local IsPIE = UE4.URuntimeCommonFunctionLibrary.IsPlayInEditor(GWorld.GameInstance)
  if not IsPIE and not UUCloudGameInstanceSubsystem.IsCloudGame() then
    if SceneManager then
      SceneManager:SetWindowDeactivatedEventDelegate()
      SceneManager:SetOnWindowResizedDelegate()
      SceneManager:SetOnWindowMovedDelegate()
    end
  elseif SceneManager then
    local UInputSettings = UE4.UInputSettings.GetInputSettings()
    if UInputSettings.GetInputSettings().bUseMouseForTouch then
      SceneManager:UpdateUIDPIStandValue(UIConst.DPIBaseOnSize.Mobile.X, UIConst.DPIBaseOnSize.Mobile.Y)
    else
      SceneManager:UpdateUIDPIStandValue(UIConst.DPIBaseOnSize.PC.X, UIConst.DPIBaseOnSize.PC.Y)
    end
  end
  self.Overridden.InitUIStates(self)
  UE4.UMainBar.SetIsForbidenShowBloodUI(false)
  self:InitGlobalVersionDisplay()
end

function BP_UIManagerComponent_C:PreloadUI()
  local bMobile = CommonUtils.GetDeviceTypeByPlatformName(self) == "Mobile"
  for UIName, UIData in pairs(DataMgr.SystemUI) do
    if UIData.IsPreloadBP then
      local Class
      if bMobile then
        Class = LoadClass(UIData.MobileBPPath)
      else
        Class = LoadClass(UIData.PCBPPath)
      end
      if Class then
        self.PreLoadUIStates:Add(UIName, Class)
      end
    end
  end
  for UIName, UIData in pairs(DataMgr.WidgetUI) do
    if UIData.PreCreateNum and UIData.PreCreateNum > 0 then
      local Class
      if bMobile then
        Class = LoadClass(UIData.MobileBPPath)
      else
        Class = LoadClass(UIData.BPPath)
      end
      if Class then
        self:PreCreateWidgetUI(UIName, Class, UIData.PreCreateNum)
      end
    end
  end
end

function BP_UIManagerComponent_C:_InitGameDPI()
  local HUDSizeConf = DataMgr.Option.HUDSize
  if not HUDSizeConf then
    return
  end
  local HUDSizeVal = EMCache:Get(HUDSizeConf.EMCacheName)
  if not HUDSizeVal or 0 == HUDSizeVal then
    for i, ValStr in ipairs(HUDSizeConf.UnFoldText) do
      if i == math.floor(tonumber(HUDSizeConf.DefaultValue)) then
        HUDSizeVal = tonumber(table.pack(string.gsub(ValStr, "%%", ""))[1]) * 0.01
        EMCache:Set(HUDSizeConf.EMCacheName, HUDSizeVal)
        break
      end
    end
  end
  UE.UUIFunctionLibrary.SetGameDPI(HUDSizeVal)
end

function BP_UIManagerComponent_C:AddWidgetComponentToList(ActorEid, WidgetName, WidgetComp)
  if not self.WidgetComponentList[ActorEid] then
    self.WidgetComponentList[ActorEid] = {}
  end
  self.WidgetComponentList[ActorEid][WidgetName] = WidgetComp
  EventManager:FireEvent(EventID.OnAddWidgetComponent, {WidgetName = WidgetName, WidgetComponent = WidgetComp})
  if self:CheckUIMgrIsInSpecialState() == EUIManageLoadStateTags.GMMode and WidgetName ~= self.GMShowUIOnly then
    if type(WidgetComp.SetWidgetHiddenByTag) == "function" then
      WidgetComp:SetWidgetHiddenByTag(true, UIConst.CommonHideTagName.GMShowUIOnly)
    else
      local Widget = WidgetComp:GetWidget()
      if Widget then
        Widget:Hide(UIConst.CommonHideTagName.GMShowUIOnly)
      end
    end
  end
end

function BP_UIManagerComponent_C:RemoveWidgetComponentToList(ActorEid, WidgetName)
  if self.WidgetComponentList[ActorEid] ~= nil then
    self.WidgetComponentList[ActorEid][WidgetName] = nil
    if IsEmptyTable(self.WidgetComponentList[ActorEid]) then
      self.WidgetComponentList[ActorEid] = nil
    end
  end
end

function BP_UIManagerComponent_C:CreateAndAttachToParentWidget(BPClassPath, UIName, ParentWidget, IsWrapChildWithPanel)
  local UIConfig = UIConst.AllUIConfig[UIName] or {}
  local ExistUIObj = self:GetUI(UIName)
  if nil ~= ExistUIObj and not UIConfig.allowmulti then
    return ExistUIObj
  end
  if nil == BPClassPath then
    print(self:GetLogMask(), "The UI Whitch Named " .. UIName .. "BPClass is nil !!!!!!!")
    return
  end
  local UMG_Class
  if type(BPClassPath) == "string" then
    UMG_Class = UE4.UClass.Load(BPClassPath)
  elseif type(BPClassPath) == "userdata" then
    UMG_Class = BPClassPath
  elseif type(BPClassPath) == "table" then
    UMG_Class = BPClassPath
  else
    print(self:GetLogMask(), "BPClassPath is not valid")
    return
  end
  local UIObj = self.Overridden.CreateAndAttachToParentWidget(self, UMG_Class, UIName, ParentWidget, IsWrapChildWithPanel)
  return UIObj
end

function BP_UIManagerComponent_C:_CreateWidgetNew(UIName)
  local WidgetUIConfig = DataMgr.WidgetUI[UIName]
  assert(WidgetUIConfig, "UI:" .. UIName .. "\228\184\141\229\156\168WidgetUI\232\161\168\228\184\173")
  local PlatformName, BPClassPath = (CommonUtils.GetDeviceTypeByPlatformName(self))
  if PlatformName == CommonConst.CLIENT_DEVICE_TYPE.PC then
    BPClassPath = WidgetUIConfig.BPPath
  elseif PlatformName == CommonConst.CLIENT_DEVICE_TYPE.MOBILE then
    BPClassPath = WidgetUIConfig.MobileBPPath or WidgetUIConfig.BPPath
  else
    BPClassPath = WidgetUIConfig.BPPath
  end
  local bIsAddToCachePool = UIConst.OptimizeSwitch[PlatformName].UI_ADD_IN_CACHE and WidgetUIConfig.IsAddToCachePool
  local Widget = self:CreateWidget(BPClassPath, WidgetUIConfig.NeedShowInWindow, WidgetUIConfig.ZOrder, nil, bIsAddToCachePool)
  self:UpdateArgs(Widget, WidgetUIConfig.Params)
  return Widget
end

function BP_UIManagerComponent_C:CreateWidgetAsync(UIName, CoroutineOrCBFunc, BPPath, ...)
  if not CoroutineOrCBFunc then
    if UIName then
      return self:_CreateWidgetNew(UIName)
    elseif BPPath then
      return self:CreateWidget(BPPath, ...)
    end
  end
  local WidgetUIConfig, BPClassPath
  local PlatformName = CommonUtils.GetDeviceTypeByPlatformName(self)
  if BPPath then
    BPClassPath = BPPath
    local NeedShowInWindow, ZOrder, ExUIName, bIsAddToCachePool = ...
    WidgetUIConfig = UIConst.AllUIConfig[UIName] or {
      NeedShowInWindow = NeedShowInWindow,
      ZOrder = ZOrder,
      IsAddToCachePool = bIsAddToCachePool and UIConst.OptimizeSwitch[PlatformName].UI_ADD_IN_CACHE
    }
  else
    WidgetUIConfig = DataMgr.WidgetUI[UIName]
    assert(WidgetUIConfig, "UI:" .. UIName .. "\228\184\141\229\156\168WidgetUI\232\161\168\228\184\173")
    if PlatformName == CommonConst.CLIENT_DEVICE_TYPE.PC then
      BPClassPath = WidgetUIConfig.BPPath
    elseif PlatformName == CommonConst.CLIENT_DEVICE_TYPE.MOBILE then
      BPClassPath = WidgetUIConfig.MobileBPPath or WidgetUIConfig.BPPath
    else
      BPClassPath = WidgetUIConfig.BPPath
    end
  end
  
  local function AfterLoadUMGClassDone(UMG_Class, CbFunc)
    local UMG_Widget_Ins = self:_CreateWidgetByUMGClass(UMG_Class, WidgetUIConfig.NeedShowInWindow, WidgetUIConfig.ZOrder, nil, WidgetUIConfig.IsAddToCachePool)
    if nil == UMG_Widget_Ins then
      DebugPrint(ErrorTag, "BP_UIManagerComponent_C: CreateWidget Error, BPClassPath is ", BPClassPath)
    end
    if CbFunc then
      CbFunc(UMG_Widget_Ins)
    end
    return UMG_Widget_Ins
  end
  
  local UMG_Class
  DebugPrint("CreateWidget \229\188\128\229\167\139\229\188\130\230\173\165\229\138\160\232\189\189UMGCLass", UIName)
  local Handler
  Handler = UE.UResourceLibrary.LoadClassAsync(self, BPClassPath, {
    self,
    function(self, UIClass)
      DebugPrint("CreateWidget \229\188\130\230\173\165\229\138\160\232\189\189UMGCLass\229\174\140\230\136\144", UIName)
      UMG_Class = UIClass
      if type(CoroutineOrCBFunc) == "function" then
        if Handler then
          AfterLoadUMGClassDone(UIClass, CoroutineOrCBFunc)
        end
      elseif type(CoroutineOrCBFunc) == "thread" and coroutine.status(CoroutineOrCBFunc) == "suspended" then
        coroutine.resume(CoroutineOrCBFunc, UIClass)
      end
    end
  })
  if not UMG_Class then
    if not UResourceLibrary.IsValidResource(self, Handler) then
      return
    end
    DebugPrint("CreateWidget \231\173\137\229\190\133\229\188\130\230\173\165\229\138\160\232\189\189UMGCLass...", UIName)
    if type(CoroutineOrCBFunc) == "thread" then
      UMG_Class = coroutine.yield()
    elseif type(CoroutineOrCBFunc) == "function" then
      return
    end
  end
  return AfterLoadUMGClassDone(UMG_Class)
end

function BP_UIManagerComponent_C:CreateWidget(BPClassPath, NeedShowInWindow, ZOrder, UIName, bIsAddToCachePool)
  local UMG_Class
  if type(BPClassPath) == "string" then
    UMG_Class = LoadClass(BPClassPath)
  else
    UMG_Class = BPClassPath
  end
  local PlatformName = CommonUtils.GetDeviceTypeByPlatformName(self)
  bIsAddToCachePool = UIConst.OptimizeSwitch[PlatformName].UI_ADD_IN_CACHE and bIsAddToCachePool
  local Widget = self:_CreateWidgetByUMGClass(UMG_Class, NeedShowInWindow, ZOrder, UIName, bIsAddToCachePool)
  if nil == Widget then
    DebugPrint(ErrorTag, "BP_UIManagerComponent_C: CreateWidget fail, Maybe The Current World is Null or tearing down, BPClassPath is ", BPClassPath)
  end
  return Widget
end

function BP_UIManagerComponent_C:_CreateWidgetByUMGClass(UMG_Class, NeedShowInWindow, ZOrder, UIName, bIsAddToCachePool)
  if nil == UMG_Class then
    return
  end
  local UMG_Widget_Ins
  if nil ~= UIName then
    UMG_Widget_Ins = self:CreateWidgetAndAddToMgr(UMG_Class, UIName, bIsAddToCachePool)
  else
    UMG_Widget_Ins = self:CreateWidgetWithParams(UMG_Class, nil, nil, bIsAddToCachePool)
  end
  if nil ~= UMG_Widget_Ins then
    if NeedShowInWindow then
      UMG_Widget_Ins:AddToViewport(ZOrder)
    elseif nil ~= ZOrder then
      UMG_Widget_Ins:SetZOrder(ZOrder)
    end
  end
  return UMG_Widget_Ins
end

function BP_UIManagerComponent_C:AddUIToStateTagsCluster(UIStateTag, UIName, IsAdd)
  if IsAdd then
    if self.AllUIStateTagsCluster[UIStateTag] == nil then
      self.AllUIStateTagsCluster[UIStateTag] = {}
    end
    self.AllUIStateTagsCluster[UIStateTag][UIName] = 1
  elseif self.AllUIStateTagsCluster[UIStateTag] ~= nil then
    self.AllUIStateTagsCluster[UIStateTag][UIName] = nil
  end
end

function BP_UIManagerComponent_C:GenerateSpecialUIListBeforeUICreate(UIName, KeyInList)
  local ResultStateTag, ResultList = ENormalModeSubState.ConditionMode, {}
  if KeyInList == UIConst.WidgetAllStateTag.Queue then
    for k, v in pairs(self.AllUIStateTagsCluster[KeyInList]) do
      table.insert(ResultList, k)
    end
  elseif KeyInList == UIConst.WidgetAllStateTag.Precedence then
    for k, v in pairs(self.AllUIStateTagsCluster[KeyInList]) do
      local SystemUIConfig = DataMgr.SystemUI[k]
      if nil ~= SystemUIConfig and nil ~= SystemUIConfig.SpecialUINameList then
        for _, CheckUIName in ipairs(SystemUIConfig.SpecialUINameList) do
          if nil == ResultList[CheckUIName] then
            ResultList[CheckUIName] = {k}
          else
            table.insert(ResultList[CheckUIName], k)
          end
        end
      end
    end
  elseif KeyInList == UIConst.WidgetAllStateTag.Mutual then
    local SystemUIConfig = DataMgr.SystemUI[UIName]
    if nil ~= SystemUIConfig and nil ~= SystemUIConfig.SpecialUINameList then
      for _, CheckUIName in ipairs(SystemUIConfig.SpecialUINameList) do
        table.insert(ResultList, CheckUIName)
      end
    end
  elseif KeyInList == UIConst.WidgetAllStateTag.Group then
    for k, v in pairs(self.AllUIStateTagsCluster[KeyInList]) do
      local SystemUIConfig = DataMgr.SystemUI[k]
      if nil ~= SystemUIConfig and nil ~= SystemUIConfig.SpecialUINameList then
        for _, CheckUIName in ipairs(SystemUIConfig.SpecialUINameList) do
          if nil == ResultList[k] then
            ResultList[k] = {CheckUIName}
          else
            table.insert(ResultList[k], CheckUIName)
          end
        end
      end
    end
  end
  return ResultStateTag, ResultList
end

function BP_UIManagerComponent_C:CheckUIMgrIsInSpecialState()
  local CurrentLevelName = UGameplayStatics.GetCurrentLevelName(self)
  if "Login" == CurrentLevelName or "Game_Start" == CurrentLevelName then
    return EUIManageLoadStateTags.NormalMode
  end
  if self.GMShowUIOnly then
    return EUIManageLoadStateTags.GMMode
  end
  local CurrentUIMgrStateTag = self:GetCurrentModeStateTag()
  return CurrentUIMgrStateTag
end

function BP_UIManagerComponent_C:GetSubTagInNormalState(UIName)
  local SubTag, SpecialUINameList = nil, {}
  if self:CheckUIMgrIsInSpecialState() == EUIManageLoadStateTags.GMMode then
    return SubTag, SpecialUINameList
  end
  if not IsEmptyTable(self.AllUIStateTagsCluster) then
    local SubWidgetList
    if not IsEmptyTable(self.AllUIStateTagsCluster[UIConst.WidgetAllStateTag.Exclusive]) then
      SubTag = ENormalModeSubState.ExclusiveMode
    elseif not IsEmptyTable(self.AllUIStateTagsCluster[UIConst.WidgetAllStateTag.Blocked]) then
      SubTag = ENormalModeSubState.BlockedMode
    else
      if not IsEmptyTable(self.AllUIStateTagsCluster[UIConst.WidgetAllStateTag.Precedence]) then
        SubTag, SubWidgetList = self:GenerateSpecialUIListBeforeUICreate(UIName, UIConst.WidgetAllStateTag.Precedence)
        SpecialUINameList[UIConst.WidgetAllStateTag.Precedence] = SubWidgetList
      end
      if not IsEmptyTable(self.AllUIStateTagsCluster[UIConst.WidgetAllStateTag.Mutual]) and self.AllUIStateTagsCluster[UIConst.WidgetAllStateTag.Mutual][UIName] ~= nil then
        SubTag, SubWidgetList = self:GenerateSpecialUIListBeforeUICreate(UIName, UIConst.WidgetAllStateTag.Mutual)
        SpecialUINameList[UIConst.WidgetAllStateTag.Mutual] = SubWidgetList
      end
      if not IsEmptyTable(self.AllUIStateTagsCluster[UIConst.WidgetAllStateTag.Queue]) then
        SubTag, SubWidgetList = self:GenerateSpecialUIListBeforeUICreate(UIName, UIConst.WidgetAllStateTag.Queue)
        SpecialUINameList[UIConst.WidgetAllStateTag.Queue] = SubWidgetList
      end
      if not IsEmptyTable(self.AllUIStateTagsCluster[UIConst.WidgetAllStateTag.Group]) then
        SubTag, SubWidgetList = self:GenerateSpecialUIListBeforeUICreate(UIName, UIConst.WidgetAllStateTag.Group)
        SpecialUINameList[UIConst.WidgetAllStateTag.Group] = SubWidgetList
      end
    end
  end
  return SubTag, SpecialUINameList
end

function BP_UIManagerComponent_C:AddUIManagerCurrentModeTag(ModeStateTag)
  self:PushCurrentModeStateTag(ModeStateTag)
  if ModeStateTag == EUIManageLoadStateTags.SkillFeatureMode or ModeStateTag == EUIManageLoadStateTags.StoryMode then
    self:RefreshAllUIVisibilityBySpecialTag(true, ModeStateTag)
    local Objs = MissionIndicatorManager:GetAllIndicatorUIObjs()
    if not IsEmptyTable(Objs) then
      for Name, UIObj in pairs(Objs) do
        UIObj:Hide(ModeStateTag)
      end
    end
  end
end

function BP_UIManagerComponent_C:RemoveUIManagerCurrentModeTag(ModeStateTag)
  if nil == ModeStateTag then
    ModeStateTag = self:GetCurrentModeStateTag()
  end
  local Result = self:PopCurrentModeStateTag(ModeStateTag)
  if nil ~= Result and (ModeStateTag == EUIManageLoadStateTags.SkillFeatureMode or ModeStateTag == EUIManageLoadStateTags.StoryMode) then
    self:RefreshAllUIVisibilityBySpecialTag(false, ModeStateTag)
    local Objs = MissionIndicatorManager:GetAllIndicatorUIObjs()
    if not IsEmptyTable(Objs) then
      for Name, UIObj in pairs(Objs) do
        UIObj:Show(ModeStateTag)
      end
    end
  end
end

function BP_UIManagerComponent_C:GetCurrentModeStateTag()
  return self.UIManagerModeTagsStack:Peek()
end

function BP_UIManagerComponent_C:PushCurrentModeStateTag(ModeStateTag)
  self.UIManagerModeTagsStack:Push(ModeStateTag)
end

function BP_UIManagerComponent_C:PopCurrentModeStateTag(ModeStateTag)
  local Result
  if nil ~= ModeStateTag then
    Result = self.UIManagerModeTagsStack:FindAndRemove(ModeStateTag)
  else
    Result = self.UIManagerModeTagsStack:Pop()
  end
  return Result
end

function BP_UIManagerComponent_C:PlaceJumpUIToTop(JumpUIObj, JumpUIName)
  self:PlaceItemToQueueBack(JumpUIObj)
  self:PlaceUIStateToTop(JumpUIName)
end

function BP_UIManagerComponent_C:PrintJumpPageDequeInfo()
  local DequeSize = self.UIJumpToDeque:Size()
  for i = 1, DequeSize do
    local CurrentFirstUIObj = self.UIJumpToDeque:Get(i)
    DebugPrint("BP_UIManagerComponent_C: PrintJumpPageDequeInfo, The Info is: ", CurrentFirstUIObj:GetName(), CurrentFirstUIObj:GetCameraViewCurrentTarget():GetName())
  end
end

function BP_UIManagerComponent_C:AddToJumpPageDeque(UIObj)
  if not UIObj then
    return
  end
  local DequeSize = self.UIJumpToDeque:Size()
  if DequeSize >= 3 then
    local FirstUIObj = self.UIJumpToDeque:PopFront()
    if IsValid(FirstUIObj) then
      if type(FirstUIObj.Close) == "function" then
        FirstUIObj:Close()
      else
        self:UnLoadUI(FirstUIObj.ConfigName, FirstUIObj.WidgetName)
      end
    end
  end
  UIObj.IsAddInDeque = true
  self.UIJumpToDeque:PushBack(UIObj)
  EventManager:FireEvent(EventID.OnJumpToPage, self:GetLastJumpPage(), UIObj)
end

function BP_UIManagerComponent_C:RemoveToJumpPageDeque(UIObj)
  local CurrentLastUIObj = self.UIJumpToDeque:Back()
  if CurrentLastUIObj == UIObj then
    self.UIJumpToDeque:PopBack()
    EventManager:FireEvent(EventID.OnJumpBackToPage, UIObj, self:GetLastJumpPage())
  end
end

function BP_UIManagerComponent_C:GetLastJumpPage()
  return self.UIJumpToDeque:Back()
end

function BP_UIManagerComponent_C:PlaceItemToQueueBack(Element)
  if nil == Element then
    return
  end
  local Index = self:CheckIsInJumpPageDeque(Element)
  local DequeSize = self.UIJumpToDeque:Size()
  if nil == Index then
    self:AddToJumpPageDeque(Element)
  else
    for i = Index, DequeSize - 1 do
      local NextUIObj = self.UIJumpToDeque:Get(i + 1)
      self.UIJumpToDeque:Set(i, NextUIObj)
    end
    self.UIJumpToDeque:Set(DequeSize, Element)
  end
end

function BP_UIManagerComponent_C:CheckIsInJumpPageDeque(UIObj)
  local DequeSize, SearchIndex = (self.UIJumpToDeque:Size())
  for i = 1, DequeSize do
    local TargetUIObj = self.UIJumpToDeque:Get(i)
    if TargetUIObj == UIObj then
      SearchIndex = i
      break
    end
  end
  return SearchIndex
end

function BP_UIManagerComponent_C:CheckIsInLoadingDeque(CheckList, UIName)
  if 1 == #CheckList and CheckList[1] == UIName then
    return true
  end
  local DequeSize, IsInDeque = self.UILoadingDeque:Size(), false
  for i = 1, DequeSize do
    local UIInfo = self.UILoadingDeque:Get(i)
    if UIInfo and UIInfo.UIName == UIName then
      IsInDeque = true
      break
    end
  end
  return IsInDeque
end

function BP_UIManagerComponent_C:LoadUINew(UIName, ...)
  local SystemUIConfig = DataMgr.SystemUI[UIName]
  assert(SystemUIConfig, "UI:" .. UIName .. "\228\184\141\229\156\168SystemUI\232\161\168\228\184\173")
  return self:LoadUI(UIConst.LoadInConfig, UIName, SystemUIConfig.ZOrder, ...)
end

function BP_UIManagerComponent_C:LoadUIAsync(UIName, CoroutineOrCBFunc, ...)
  local SystemUIConfig = DataMgr.SystemUI[UIName]
  assert(SystemUIConfig, "UI:" .. UIName .. "\228\184\141\229\156\168SystemUI\232\161\168\228\184\173")
  local Param = {
    ...
  }
  table.insert(Param, CoroutineOrCBFunc)
  table.insert(Param, "Async")
  return self:LoadUI(UIConst.LoadInConfig, UIName, SystemUIConfig.ZOrder, table.unpack(Param))
end

function BP_UIManagerComponent_C:LoadUI(BPClassPath, UIName, ZOrder, ...)
  if IsDedicatedServer(self) then
    return
  end
  local FinalName, ExistUIObj, UIConfig = UIName
  local SpecialSignPos = string.find(UIName, "#")
  if nil ~= SpecialSignPos then
    local UINameDataArray = Split(UIName, "#")
    UIName = UINameDataArray[1]
    FinalName = UINameDataArray[2]
  end
  ExistUIObj = self:GetUI(FinalName)
  if IsValid(ExistUIObj) then
    DebugPrint("The Widget is Already Exist, Name is ", UIName)
    return ExistUIObj
  end
  if UIUtils.CheckCdnHide(UIName, true) then
    return
  end
  local SystemUI = DataMgr.SystemUI[UIName]
  if nil ~= SystemUI then
    local IsConditionSuccess, ShowConditiontext = self:CheckCombatcondition(SystemUI.CombatconditionIdList, SystemUI.ConditiontextList)
    if not IsConditionSuccess then
      if ShowConditiontext then
        self:ShowUITip(UIConst.Tip_CommonTop, GText(ShowConditiontext))
        return
      else
        DebugPrint("The UI Load in fail, Because Combatcondition is not met, UIName is", UIName)
        return
      end
    end
    if SystemUI.IfDevOnly and not GMVariable.IsInDebugMode then
      DebugPrint("The UI Load in fail, Because IfDevOnly Set in SystemUI Config, UIName is", UIName)
      return
    end
  end
  UIConfig, BPClassPath = self:SetUIConfig(BPClassPath, UIName, SystemUI)
  if UIConfig.allowmulti then
    local UICount = self.UniqueCount[UIName] or 0
    local LimitCount = UIConfig.limitcount or UIConst.MAXEXISTNUM
    if LimitCount >= UICount + 1 then
      self.UniqueCount[UIName] = UICount + 1
    else
      self.UniqueCount[UIName] = 1
    end
    FinalName = UIName .. tostring(self.UniqueCount[UIName])
  end
  if nil ~= UIConfig.statetag then
    self:AddUIToStateTagsCluster(UIConfig.statetag, UIName, true)
  end
  local Params = {
    ...
  }
  local NormalStateSubTag, SpecialUINameList = self:GetSubTagInNormalState(UIName)
  if UIConfig.specialvisiblemode ~= "forceshow" then
    if NormalStateSubTag == ENormalModeSubState.BlockedMode then
      DebugPrint("The UI Whitch Named " .. UIName .. " Create Fail, It has been Blocked")
      return
    elseif NormalStateSubTag == ENormalModeSubState.ConditionMode and UIConfig.statetag == UIConst.WidgetAllStateTag.Queue then
      local AllLoadingListUI = SpecialUINameList[UIConst.WidgetAllStateTag.Queue]
      if nil ~= AllLoadingListUI and #AllLoadingListUI > 0 and not self:CheckIsInLoadingDeque(AllLoadingListUI, UIName) then
        self.UILoadingDeque:PushBack({UIName = UIName, Params = Params})
        DebugPrint("The UI Whitch Named " .. UIName .. " Create Fail, It has been Added in Loading Queue, It Will show when Condition met")
        return
      end
    end
  end
  if type(BPClassPath) == "table" and UIConfig.haschildBP then
    local SubChildrenName = Params[1]
    BPClassPath = BPClassPath[SubChildrenName]
    table.remove(Params, 1)
  end
  if nil == BPClassPath then
    DebugPrint("The UI Whitch Named " .. UIName .. " BPClass is nil !!!!!!!")
    return
  end
  if nil == ZOrder then
    ZOrder = UIConfig.zorder or UIConst.ZORDER_FOR_ZERO
  end
  
  local function AfterLoadUMGClassDone(UMG_Class, CbFunc)
    local UIObj
    if not self.AsyncUnloadFlags[UIName] and UMG_Class then
      if UIConfig.IsGlobalUI then
        local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
        UIObj = GameInstance:LoadGlobalUI(UMG_Class, FinalName, ZOrder)
        if nil ~= UIObj then
          UIObj.IsGlobalUI = true
        end
      else
        local IsAddToStack = not not UIConfig.addtostack
        UIObj = self.Overridden.LoadUI(self, UMG_Class, FinalName, ZOrder, IsAddToStack)
      end
      if nil ~= UIObj then
        local NowUIMgrStateTag = self:CheckUIMgrIsInSpecialState()
        self:UpdateUIObjByConfig(UIObj, UIConfig, UIName, FinalName, Params, NowUIMgrStateTag, NormalStateSubTag, SpecialUINameList)
        self:OnUIObjLoadCompleted(UIName, UIConfig)
      end
    end
    if not UMG_Class then
      DebugPrint(ErrorTag, "BPClassPath is not valid")
    end
    if self.AsyncLoadHandlers[UIName] then
      self.AsyncLoadHandlers[UIName] = nil
    end
    if self.AsyncGetUIContexts[UIName] then
      self:AddTimer(0.01, function()
        DebugPrint(LXYTag, "GetUIObjAsync\229\188\130\230\173\165\229\155\158\232\176\131\229\164\132\231\144\134")
        for _, CoroutineOrCBFunc in ipairs(self.AsyncGetUIContexts[UIName]) do
          if type(CoroutineOrCBFunc) == "function" then
            CoroutineOrCBFunc(UIObj)
          elseif type(CoroutineOrCBFunc) == "thread" and coroutine.status(CoroutineOrCBFunc) == "suspended" then
            coroutine.resume(CoroutineOrCBFunc, UIObj)
          end
        end
        self.AsyncGetUIContexts[UIName] = nil
      end, false, 0, nil, true)
    end
    self.AsyncUnloadFlags[UIName] = nil
    if CbFunc then
      CbFunc(UIObj)
    end
    return UIObj
  end
  
  local UMG_Class = self:GetPreloadUIClass(UIName)
  if nil == UMG_Class then
    if "string" == type(BPClassPath) then
      local CoroutineOrCBFunc
      if "Async" == Params[#Params] then
        table.remove(Params, #Params)
        CoroutineOrCBFunc = Params[#Params]
        table.remove(Params, #Params)
      end
      if CoroutineOrCBFunc then
        DebugPrint(LXYTag, "\229\188\128\229\167\139\229\188\130\230\173\165\229\138\160\232\189\189UMGClass", UIName, BPClassPath)
        local Handler = UE.UResourceLibrary.LoadClassAsync(self, BPClassPath, {
          self,
          function(self, UIClass)
            if not IsValid(UIClass) then
              DebugPrint(LXYTag, "\229\155\158\232\176\131\229\134\133\239\188\140\229\188\130\230\173\165\229\138\160\232\189\189UMGCLass\229\164\177\232\180\165", UIName, BPClassPath)
              return
            end
            DebugPrint(LXYTag, "\229\188\130\230\173\165\229\138\160\232\189\189UMGCLass\229\174\140\230\136\144", UIName, BPClassPath)
            UMG_Class = UIClass
            if type(CoroutineOrCBFunc) == "function" or type(CoroutineOrCBFunc) == "nil" then
              if self.AsyncLoadHandlers[UIName] then
                AfterLoadUMGClassDone(UIClass, CoroutineOrCBFunc)
              end
            elseif type(CoroutineOrCBFunc) == "thread" and coroutine.status(CoroutineOrCBFunc) == "suspended" then
              coroutine.resume(CoroutineOrCBFunc, UIClass)
            end
          end
        })
        if not UMG_Class then
          if UResourceLibrary.IsValidResource(self, Handler) then
            DebugPrint(LXYTag, "\231\173\137\229\190\133\229\188\130\230\173\165\229\138\160\232\189\189UMGCLass...", UIName)
            self.AsyncLoadHandlers[UIName] = Handler
          else
            DebugPrint(LXYTag, "\229\188\130\230\173\165\229\138\160\232\189\189UMGCLass\229\164\177\232\180\165\239\188\140\228\188\176\232\174\161\232\183\175\229\190\132\230\156\137\233\151\174\233\162\152", UIName, BPClassPath)
            return
          end
          if type(CoroutineOrCBFunc) == "thread" then
            UMG_Class = coroutine.yield()
          elseif type(CoroutineOrCBFunc) == "function" then
            return
          end
        end
      else
        UMG_Class = UE4.UClass.Load(BPClassPath)
      end
    elseif type(BPClassPath) == "userdata" then
      UMG_Class = BPClassPath
    elseif "table" == type(BPClassPath) then
      UMG_Class = BPClassPath
    end
  end
  return AfterLoadUMGClassDone(UMG_Class)
end

function BP_UIManagerComponent_C:RevertRealStopGame(IsStopGame)
  if nil == IsStopGame then
    return false
  end
  if true == IsStopGame then
    return true
  end
  local Avatar = GWorld:GetAvatar()
  if Avatar and Avatar.CurrentOnlineType and -1 ~= Avatar.CurrentOnlineType then
    return IsStopGame > 0 and IsStopGame < 2
  end
  return nil ~= IsStopGame and false ~= IsStopGame and IsStopGame > 0
end

function BP_UIManagerComponent_C:SetUIConfig(BPClassPath, UIName, SystemUI)
  local UIConfig = UIConst.AllUIConfig[UIName] or {}
  BPClassPath = BPClassPath or UIConfig.resource
  if BPClassPath == UIConst.LoadInConfig and nil ~= SystemUI then
    UIConfig.zorder = SystemUI.ZOrder
    UIConfig.popup = SystemUI.Popup
    UIConfig.statetag = SystemUI.StateTag
    UIConfig.ExtraArgs = SystemUI.Params
    UIConfig.IsStopGame = self:RevertRealStopGame(SystemUI.IsStopGame)
    UIConfig.GlobalGameUITag = SystemUI.GlobalGameUITag
    UIConfig.IsHideBattleUnit = SystemUI.IsHideBattleUnit
    UIConfig.IgnoreHideTags = SystemUI.IgnoreHideTags
    UIConfig.KeyboardSetName = SystemUI.KeyboardSetName
    UIConfig.IsHideDrop = SystemUI.IsHideDrop
    UIConfig.ShowInStory = SystemUI.ShowInStory
    UIConfig.ConditionShowStateTags = SystemUI.ConditionShowStateTags
    UIConfig.System = SystemUI.System
    UIConfig.PauseAfterLoadingState = SystemUI.PauseAfterLoadingState
    UIConfig.IsHideInImmersionMode = SystemUI.IsHideInImmersionMode
    if SystemUI.ConfigName then
      local SystemUIConfig = DataMgr.SystemUIConfig[SystemUI.ConfigName]
      if SystemUIConfig then
        UIConfig.addtostack = SystemUIConfig.AddToStack
        UIConfig.allowmulti = nil ~= SystemUIConfig.AllowMulti and SystemUIConfig.AllowMulti or false
        UIConfig.haschildBP = nil ~= SystemUIConfig.HasChildBP and SystemUIConfig.HasChildBP or false
        UIConfig.limitcount = SystemUIConfig.limitcount or UIConst.MAXEXISTNUM
        UIConfig.specialvisiblemode = SystemUIConfig.SpecialVisibleMode
        UIConfig.StopWorldRender = SystemUIConfig.StopWorldRender
        UIConfig.eventlist = SystemUIConfig.EventList
        UIConfig.needuimode = nil ~= SystemUIConfig.NeedUIMode and SystemUIConfig.NeedUIMode or false
      end
    end
    local PlatformName = CommonUtils.GetDeviceTypeByPlatformName(self)
    if UIConfig.haschildBP then
      BPClassPath = UIConfig.resource
    elseif "PC" == PlatformName then
      BPClassPath = SystemUI.PCBPPath
      UIConfig.resource = BPClassPath
    elseif "Mobile" == PlatformName then
      BPClassPath = SystemUI.MobileBPPath or SystemUI.PCBPPath
      UIConfig.resource = BPClassPath
    end
  end
  self:RecordShowInStoryConfig(UIConfig, UIName)
  return UIConfig, BPClassPath
end

function BP_UIManagerComponent_C:UpdateUIObjByConfig(UIObj, UIConfig, UIName, FinalName, Params, NowUIMgrStateTag, NormalStateSubState, SpecialUINameList)
  if UIConfig.popup == true then
    UIObj.IsUIPopUp = true
    self:CloseResidentUI(FinalName)
  end
  if UIConfig.IgnoreHideTags then
    UIObj.IgnoreHideTags = UIConfig.IgnoreHideTags
  end
  local IsHideCurUIObj = false
  if UIConfig.specialvisiblemode ~= "forceshow" then
    IsHideCurUIObj = self:HideUIByAllFlag(UIObj)
  end
  self:UpdateArgs(UIObj, UIConfig.ExtraArgs)
  if type(UIObj.InitUIInfo) == "function" then
    UIObj:InitUIInfo(UIName, UIConfig.needuimode, UIConfig.eventlist, table.unpack(Params, 1, 15))
  end
  if UIConfig.StopWorldRender then
    UIObj:SetIsPauseWorldRendering(true)
    self:SetPauseWorldRenderingSwitch(UIName, true)
  end
  if UIConfig.statetag ~= nil then
    UIObj:SetUIStateTag(UIConfig.statetag)
  end
  if UIConfig.System == "Battle" or UIConfig.System == "Common" then
    UIObj:SetIsFrequentlyUI(true)
  end
  if UIConfig.IsHideInImmersionMode then
    IsHideCurUIObj = self:SetIsHideInImmersionMode(UIObj)
  end
  IsHideCurUIObj = IsHideCurUIObj or self:DealWithOtherWidgetsVisibilityByUIShow(UIName, UIObj, UIConfig, NowUIMgrStateTag, NormalStateSubState, SpecialUINameList)
  if UIConfig.IsStopGame then
    UIObj.IsStopGame = true
    if not IsHideCurUIObj then
      UIObj:UISetGamePaused(UIName, true)
    end
  end
  if UIConfig.GlobalGameUITag then
    local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
    GameInstance:SetGlobalGameUITag(UIConfig.GlobalGameUITag)
    UIObj.GlobalGameUITag = UIConfig.GlobalGameUITag
  end
  if UIConfig.KeyboardSetName then
    UIObj.KeyboardSetName = UIConfig.KeyboardSetName
    UIManager(self):SetBannedActionCallback(UIConfig.KeyboardSetName, true, UIObj:GetName())
    UIObj.IsBanningAction = true
  end
  if UIConfig.PauseAfterLoadingState and UIObj then
    self:TryPauseAfterLoadingMgr(UIConfig.PauseAfterLoadingState)
  end
end

function BP_UIManagerComponent_C:DealWithOtherWidgetsVisibilityByUIShow(UIName, UIObj, UIConfig, NowUIMgrStateTag, NormalStateSubState, SpecialUINameList)
  local IsHideCurUIObj = false
  if UIConfig.specialvisiblemode ~= "forceshow" then
    if NowUIMgrStateTag == EUIManageLoadStateTags.GMMode then
      if UIName ~= self.GMShowUIOnly then
        IsHideCurUIObj = true
        UIObj:Hide(UIConst.CommonHideTagName.GMShowUIOnly)
        if self.HideByStateTagUIList[NowUIMgrStateTag] == nil then
          self.HideByStateTagUIList[NowUIMgrStateTag] = {UIObj}
        else
          table.insert(self.HideByStateTagUIList[NowUIMgrStateTag], UIObj)
        end
      end
    elseif NowUIMgrStateTag ~= EUIManageLoadStateTags.NormalMode then
      local ConditionShowStateTags, IsInHideList = UIConfig.ConditionShowStateTags, true
      if ConditionShowStateTags then
        for index, value in ipairs(ConditionShowStateTags) do
          if value == NowUIMgrStateTag then
            IsInHideList = false
            break
          end
        end
      end
      if IsInHideList then
        DebugPrint("The UI Whitch Named " .. UIName .. " Will Hide And delay to Show, Now is in " .. NowUIMgrStateTag .. " State!")
        IsHideCurUIObj = true
        UIObj:Hide(NowUIMgrStateTag)
        self:HandleUIWidgetsVisibilityByUIShow(UIName, UIObj, NormalStateSubState, SpecialUINameList)
      end
    else
      IsHideCurUIObj = self:HandleUIWidgetsVisibilityByUIShow(UIName, UIObj, NormalStateSubState, SpecialUINameList)
    end
  end
  return IsHideCurUIObj
end

function BP_UIManagerComponent_C:HandleUIWidgetsVisibilityByUIShow(UIName, UIObj, NormalStateSubState, SpecialUINameList)
  local ReasonString, IsHideCurUIObj = "InUIConfigure", false
  if NormalStateSubState == ENormalModeSubState.ExclusiveMode then
    IsHideCurUIObj = true
    UIObj:Hide(ReasonString .. NormalStateSubState)
    if self.HideByStateTagUIList[NormalStateSubState] == nil then
      self.HideByStateTagUIList[NormalStateSubState] = {UIObj}
    else
      table.insert(self.HideByStateTagUIList[NormalStateSubState], UIObj)
    end
  elseif NormalStateSubState == ENormalModeSubState.ConditionMode then
    local function HideUIWithConditionMode(UIObjInst, UINameText, ReasonStr, SubState)
      UIObjInst:Hide(ReasonStr .. UINameText)
      
      if self.HideByStateTagUIList[SubState] == nil then
        self.HideByStateTagUIList[SubState] = {}
        self.HideByStateTagUIList[SubState][UINameText] = {UIObjInst}
      elseif self.HideByStateTagUIList[SubState][UINameText] == nil then
        self.HideByStateTagUIList[SubState][UINameText] = {UIObjInst}
      else
        table.insert(self.HideByStateTagUIList[SubState][UINameText], UIObjInst)
      end
    end
    
    if SpecialUINameList[UIConst.WidgetAllStateTag.Precedence] ~= nil then
      for CheckUIName, Value in pairs(SpecialUINameList[UIConst.WidgetAllStateTag.Precedence]) do
        if CheckUIName == UIName then
          IsHideCurUIObj = true
          for _, v in ipairs(Value) do
            if nil ~= self:GetUIObj(CheckUIName) then
              DebugPrint("UIManagerComponent PrecedenceMode: The UI Which Named " .. UIName .. " Hide, The Reason is Effected by " .. v)
              HideUIWithConditionMode(UIObj, v, ReasonString, NormalStateSubState)
            end
          end
        else
          local IsInEffectList, CheckUIObj = false, self:GetUIObj(CheckUIName)
          for _, v in ipairs(Value) do
            if v == UIName then
              IsInEffectList = true
              break
            end
          end
          if IsInEffectList then
            if nil == CheckUIObj then
              self:GetUIObjAsync(CheckUIName, function(UIObjInst)
                if UIObjInst then
                  DebugPrint("UIManagerComponent PrecedenceMode: The UI Which Named " .. CheckUIName .. " Hide, The Reason is Effected by " .. UIName)
                  HideUIWithConditionMode(UIObjInst, UIName, ReasonString, NormalStateSubState)
                end
              end)
            else
              DebugPrint("UIManagerComponent PrecedenceMode: The UI Which Named " .. CheckUIName .. " Hide, The Reason is Effected by " .. UIName)
              HideUIWithConditionMode(CheckUIObj, UIName, ReasonString, NormalStateSubState)
            end
          end
        end
      end
    end
    if nil ~= SpecialUINameList[UIConst.WidgetAllStateTag.Mutual] then
      for _, CheckUIName in ipairs(SpecialUINameList[UIConst.WidgetAllStateTag.Mutual]) do
        local CheckUIObj = self:GetUIObj(CheckUIName)
        if nil == CheckUIObj then
          self:GetUIObjAsync(CheckUIName, function(UIObjInst)
            if UIObjInst then
              DebugPrint("UIManagerComponent MutualMode: The UI Which Named " .. CheckUIName .. " Hide, The Reason is Effected by " .. UIName)
              HideUIWithConditionMode(UIObjInst, UIName, ReasonString, NormalStateSubState)
            end
          end)
        else
          DebugPrint("UIManagerComponent MutualMode: The UI Which Named " .. CheckUIName .. " Hide, The Reason is Effected by " .. UIName)
          HideUIWithConditionMode(CheckUIObj, UIName, ReasonString, NormalStateSubState)
        end
      end
    end
    if nil ~= SpecialUINameList[UIConst.WidgetAllStateTag.Group] then
      IsHideCurUIObj = self:DealWithGroupUIVisibility(SpecialUINameList[UIConst.WidgetAllStateTag.Group], UIName, UIObj, NormalStateSubState, ReasonString)
    end
  end
  return IsHideCurUIObj
end

function BP_UIManagerComponent_C:SetIsHideInImmersionMode(UIObj)
  local PlayerCharacter = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  if PlayerCharacter and PlayerCharacter.IsImmersionModel then
    UIObj:Hide("ImmersionMode")
    UIObj:SetRenderOpacity(0)
  end
end

function BP_UIManagerComponent_C:LoadGuideIconAsync(BPClassPath, UIName, ZOrder, CoroutineOrCBFunc, ...)
  local Param = {
    ...
  }
  table.insert(Param, CoroutineOrCBFunc)
  table.insert(Param, "Async")
  return self:LoadUI(BPClassPath, UIName, ZOrder, table.unpack(Param))
end

function BP_UIManagerComponent_C:UpdateArgs(UIObj, Args)
  if not UIObj or not UIObj.UpdateArgs then
    return
  end
  if not Args then
    return
  end
  UIObj:UpdateArgs(Args)
end

function BP_UIManagerComponent_C:GetBannedActionNameList(KeyboardSetName)
  local KeyboardSetData = DataMgr.UIKeyboardSet[KeyboardSetName]
  if not KeyboardSetData then
    DebugPrint("Tianyi@ \230\137\190\228\184\141\229\136\176\230\140\137\233\148\174\231\166\129\231\148\168\231\187\132: " .. KeyboardSetName)
    return nil
  end
  if KeyboardSetData.IsWhiteList then
    local AllActionList = DataMgr.KeyboardMap
    local ActionNameList = {}
    for Key, _ in pairs(AllActionList) do
      for _, ActionName in ipairs(KeyboardSetData.ActionNameList or {}) do
        if Key ~= ActionName then
          goto lbl_35
        end
        goto lbl_43
        ::lbl_35::
      end
      table.insert(ActionNameList, Key)
      ::lbl_43::
    end
    return ActionNameList
  else
    return KeyboardSetData.ActionNameList
  end
end

function BP_UIManagerComponent_C:CheckCombatcondition(CombatconditionIdList, ConditiontextList)
  if nil == CombatconditionIdList then
    return true
  end
  ConditiontextList = ConditiontextList or {}
  local PlayerCharacter = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  local IsConditionSuccess, ShowConditiontext = true
  local TraceInfo = "From BP_UIManagerComponent_C:CheckCombatcondition"
  for i, v in ipairs(CombatconditionIdList) do
    local ConditionSucc = Battle(self):CheckConditionNew(v, PlayerCharacter, nil, TraceInfo)
    if not ConditionSucc then
      IsConditionSuccess = false
      ShowConditiontext = ConditiontextList[i]
      break
    end
  end
  return IsConditionSuccess, ShowConditiontext
end

function BP_UIManagerComponent_C:SetBannedActionCallback(KeyboardSetName, IsBanned, UIName)
  UIName = UIName or "Common"
  self.ActivateBannedUI = self.ActivateBannedUI or {}
  if self.ActivateBannedUI[UIName] and true == IsBanned then
    return
  end
  self.ActivateBannedUI[UIName] = true
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  if not Player then
    DebugPrint("Tianyi@ Player is not valid")
    return
  end
  local ActionList = self:GetBannedActionNameList(KeyboardSetName)
  if not ActionList then
    return
  end
  if IsBanned then
    local AllActionList = DataMgr.KeyboardMap
    local AllowedList = TArray(FName)
    for _, Action in pairs(AllActionList) do
      local Flag = false
      for _, BannedAction in ipairs(ActionList) do
        if Action.ActionName == BannedAction then
          Flag = true
          break
        end
      end
      if not Flag then
        AllowedList:Add(Action.ActionName)
      end
    end
    Player:FlushInputKeyExcept(AllowedList)
  end
  DebugPrint("Tianyi@ \232\174\190\231\189\174\231\166\129\231\148\168Action: , IsBanned = " .. tostring(IsBanned))
  self.BanActionCallbackMap = self.BanActionCallbackMap or {}
  for _, Action in ipairs(ActionList) do
    if IsBanned then
      Player:AddToActionGroups("UI", Action)
      self.BanActionCallbackMap[Action] = (self.BanActionCallbackMap[Action] or 0) + 1
    else
      Player:RemoveFromGroups("UI", Action)
      self.BanActionCallbackMap[Action] = (self.BanActionCallbackMap[Action] or 0) - 1
      if self.BanActionCallbackMap[Action] <= 0 then
        self.BanActionCallbackMap[Action] = nil
      end
    end
  end
  if IsBanned then
    Player:AddForbidTag("UI")
  else
    Player:MinusForbidTag("UI")
    self.ActivateBannedUI[UIName] = nil
  end
end

function BP_UIManagerComponent_C:SetAllBattleEntityHidden(bHidden, TagName, UnitType)
  local Entities = Battle(self):GetAllEntities()
  if bHidden then
    for _, Entity in pairs(Entities) do
      if IsValid(Entity) and Entity.UnitType == UnitType and not Entity.bHidden then
        Entity:SetActorHiddenInGame(true)
      end
    end
    self.CacheModifyHiddenEntity[TagName] = 1
  else
    self.CacheModifyHiddenEntity[TagName] = nil
    if IsEmptyTable(self.CacheModifyHiddenEntity) then
      for _, Entity in pairs(Entities) do
        if IsValid(Entity) and Entity.UnitType == UnitType and Entity.bHidden then
          Entity:SetActorHiddenInGame(false)
        end
      end
    end
  end
end

function BP_UIManagerComponent_C:CheckIsActionBanned(ActionName)
  local IsActionBanned = self.BanActionCallbackMap and self.BanActionCallbackMap[ActionName]
  return IsActionBanned
end

function BP_UIManagerComponent_C:DealWithGroupUIVisibility(CheckList, UIName, UIObj, NormalStateSubState, ReasonString)
  local IsHideCurUIObj = false
  for CheckUIName, Value in pairs(CheckList) do
    if type(Value) == "table" then
      if UIName == CheckUIName then
        local AllUI = self.UIInstances:ToTable()
        for _UIName, TargetWidget in pairs(AllUI) do
          local IsNeedHide = true
          for _, _CheckUIName in ipairs(Value) do
            if _UIName == _CheckUIName or _UIName == UIName then
              IsNeedHide = false
              break
            end
          end
          if IsNeedHide then
            DebugPrint("UIManagerComponent GroupMode: The UI Which Named " .. _UIName .. " Hide, The Reason is Effected by " .. UIName)
            TargetWidget:Hide(ReasonString .. UIName)
            if self.HideByStateTagUIList[NormalStateSubState] == nil then
              self.HideByStateTagUIList[NormalStateSubState] = {}
              self.HideByStateTagUIList[NormalStateSubState][UIName] = {TargetWidget}
            elseif self.HideByStateTagUIList[NormalStateSubState][UIName] == nil then
              self.HideByStateTagUIList[NormalStateSubState][UIName] = {TargetWidget}
            else
              table.insert(self.HideByStateTagUIList[NormalStateSubState][UIName], TargetWidget)
            end
          end
        end
      else
        local IsNeedHide = true
        for _, _CheckUIName in ipairs(Value) do
          if _CheckUIName == UIName then
            IsNeedHide = false
          end
        end
        if IsNeedHide then
          DebugPrint("UIManagerComponent GroupMode: The UI Which Named " .. UIName .. " Hide, The Reason is Effected by " .. CheckUIName)
          IsHideCurUIObj = true
          UIObj:Hide(ReasonString .. CheckUIName)
          if self.HideByStateTagUIList[NormalStateSubState] == nil then
            self.HideByStateTagUIList[NormalStateSubState] = {}
            self.HideByStateTagUIList[NormalStateSubState][CheckUIName] = {UIObj}
          elseif self.HideByStateTagUIList[NormalStateSubState][CheckUIName] == nil then
            self.HideByStateTagUIList[NormalStateSubState][CheckUIName] = {UIObj}
          else
            table.insert(self.HideByStateTagUIList[NormalStateSubState][CheckUIName], UIObj)
          end
        end
      end
    end
  end
  return IsHideCurUIObj
end

function BP_UIManagerComponent_C:OnUIObjLoadCompleted(UIName, UIConfig)
  self:SetEntitiesVisibility(UIName, UIConfig.IsHideBattleUnit == UIConst.EnumHideBattleUnitStyle.NormalShowAndHideAll, UIConfig.IsHideBattleUnit == UIConst.EnumHideBattleUnitStyle.NormalShowAndHideAllExceptSelf, true)
  if UIConfig.IsHideDrop then
    self:SetAllBattleEntityHidden(true, UIName, "Drop")
  end
  EventManager:FireEvent(EventID.LoadUI, UIName)
end

function BP_UIManagerComponent_C:UnLoadUINew(UIName)
  local SystemUIConfig = DataMgr.SystemUI[UIName]
  assert(SystemUIConfig, "UI:" .. UIName .. "\228\184\141\229\156\168SystemUI\232\161\168\228\184\173")
  if UIConst.AllUIConfig[UIName] then
    UIConst.AllUIConfig[UIName] = {
      resource = UIConst.LoadInConfig
    }
  end
  return self:UnLoadUI(UIName, UIName)
end

function BP_UIManagerComponent_C:UnLoadUI(UIConfigName, UIName)
  if IsDedicatedServer(self) then
    return
  end
  UIName = UIName or UIConfigName
  local UIConfig = UIConst.AllUIConfig[UIConfigName] or {}
  local SystemUI = DataMgr.SystemUI[UIName]
  if nil == SystemUI then
    SystemUI = DataMgr.SystemUI[UIConfigName]
  end
  if nil ~= SystemUI then
    UIConfig.popup = SystemUI.Popup or UIConfig.popup
    UIConfig.statetag = SystemUI.StateTag
    UIConfig.IsStopGame = self:RevertRealStopGame(SystemUI.IsStopGame)
    UIConfig.GlobalGameUITag = SystemUI.GlobalGameUITag
    UIConfig.IsHideBattleUnit = SystemUI.IsHideBattleUnit
    UIConfig.IsHideDrop = SystemUI.IsHideDrop
    UIConfig.PauseAfterLoadingState = SystemUI.PauseAfterLoadingState
    if SystemUI.ConfigName then
      local SystemUIConfig = DataMgr.SystemUIConfig[SystemUI.ConfigName]
      if SystemUIConfig then
        UIConfig.addtostack = SystemUIConfig.AddToStack
        UIConfig.StopWorldRender = SystemUIConfig.StopWorldRender
      end
    end
  end
  if UIConfig.popup == true then
    self:OpenResidentUI(UIName)
  end
  self:DealWithOtherWidgetsVisibilityByUIHide(UIConfigName, UIName, UIConfig.statetag)
  local UIObj = self:GetUIObj(UIName)
  if UIObj and UIObj.IsAddInDeque then
    self:RemoveToJumpPageDeque(UIObj)
  end
  self:SetEntitiesVisibility(UIName, UIConfig.IsHideBattleUnit == UIConst.EnumHideBattleUnitStyle.NormalShowAndHideAll, UIConfig.IsHideBattleUnit == UIConst.EnumHideBattleUnitStyle.NormalShowAndHideAllExceptSelf, false)
  if UIConfig.IsHideDrop then
    self:SetAllBattleEntityHidden(false, UIName, "Drop")
  end
  if UIConfig.PauseAfterLoadingState and UIObj then
    self:TryResumeAfterLoadingMgr(UIConfig.PauseAfterLoadingState)
  end
  if UIConfig.IsGlobalUI then
    local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
    GameInstance:CloseGlobalUI(UIName)
  else
    local bIsRemoveInStack = not not UIConfig.addtostack
    self:UnLoadUI_CPP(UIName, bIsRemoveInStack, UIObj and UIObj.IsNeedSearchInStack)
  end
  if self.AsyncLoadHandlers[UIName] then
    self.AsyncUnloadFlags[UIName] = true
  end
  if self.FlowList[UIName] then
    local flow = self.FlowList[UIName]
    self.FlowList[UIName] = nil
    local FlowManager = USubsystemBlueprintLibrary.GetWorldSubsystem(GWorld.GameInstance, UGameFlowManager)
    FlowManager:RemoveFlow(flow)
    DebugPrint("WXT UIManagerComponent_C:RemoveFlow", UIName)
  end
  EventManager:FireEvent(EventID.UnLoadUI, UIName)
end

function BP_UIManagerComponent_C:DealWithOtherWidgetsVisibilityByUIHide(UIConfigName, UIName, UIStatetag)
  if nil == UIStatetag or UIStatetag == UIConst.WidgetAllStateTag.Blocked then
    return
  end
  self:AddUIToStateTagsCluster(UIStatetag, UIName, false)
  if UIStatetag == UIConst.WidgetAllStateTag.Queue then
    if self.UILoadingDeque:Size() > 0 then
      local NextLoadUI = self.UILoadingDeque:PopFront()
      self:AddTimer(0.1, self.LoadUINew, false, 0, "LoadUIInQueue", nil, NextLoadUI.UIName, table.unpack(NextLoadUI.Params))
    end
  else
    self:HandleUIWidgetsVisibilityByUIHide(UIConfigName, UIName, UIStatetag)
  end
end

function BP_UIManagerComponent_C:HandleUIWidgetsVisibilityByUIHide(UIConfigName, UIName, UIStatetag)
  local HideUIList, ReShowUIWithReasonStr = nil, "InUIConfigure"
  if UIStatetag == UIConst.WidgetAllStateTag.Exclusive then
    local AllExclusiveUI = self.AllUIStateTagsCluster[UIStatetag]
    if IsEmptyTable(AllExclusiveUI) then
      HideUIList = self.HideByStateTagUIList[ENormalModeSubState.ExclusiveMode]
      self:ReShowUIWithReason(HideUIList, ReShowUIWithReasonStr .. ENormalModeSubState.ExclusiveMode)
      self.HideByStateTagUIList[ENormalModeSubState.ExclusiveMode] = nil
    end
    return
  end
  local ConditionUIList = self.HideByStateTagUIList[ENormalModeSubState.ConditionMode]
  if (UIStatetag == UIConst.WidgetAllStateTag.Precedence or UIStatetag == UIConst.WidgetAllStateTag.Group) and nil ~= ConditionUIList then
    if nil ~= UIConfigName then
      HideUIList = ConditionUIList[UIConfigName]
      ConditionUIList[UIConfigName] = nil
      self:ReShowUIWithReason(HideUIList, ReShowUIWithReasonStr .. UIConfigName)
    else
      HideUIList = ConditionUIList[UIName]
      ConditionUIList[UIName] = nil
      self:ReShowUIWithReason(HideUIList, ReShowUIWithReasonStr .. UIName)
    end
  end
  if not IsEmptyTable(ConditionUIList) then
    for k, v in pairs(ConditionUIList) do
      if type(v) == "table" then
        local NeedRemoveIndex
        for Index, CheckName in ipairs(v) do
          if CheckName == UIConfigName then
            NeedRemoveIndex = Index
            break
          end
        end
        if NeedRemoveIndex then
          local NeedShowUI = self:GetUIObj(k)
          if NeedShowUI then
            NeedShowUI:Show(ReShowUIWithReasonStr .. v[NeedRemoveIndex])
          end
          table.remove(v, NeedRemoveIndex)
        end
      end
    end
  end
end

function BP_UIManagerComponent_C:ReShowUIWithReason(UIList, ReasonString)
  if nil == UIList or type(UIList) ~= "table" then
    return
  end
  for i, v in ipairs(UIList) do
    local UIWidget = v
    if type(v) == "string" then
      UIWidget = self:GetUIObj(v)
    end
    if IsValid(UIWidget) then
      UIWidget:Show(ReasonString)
    end
  end
end

function BP_UIManagerComponent_C:GetUIObj(UIName, bUseRegularMatch)
  if bUseRegularMatch then
    local UIPathes = self:GetUIPathFromString(UIName)
    local len = #UIPathes
    if len > 1 then
      local root_ui = self:GetUI(UIPathes[1])
      for i = 2, len do
        root_ui = root_ui[UIPathes[i]]
      end
      return root_ui
    end
  end
  return self:GetUI(UIName)
end

function BP_UIManagerComponent_C:GetUIObjAsync(UIName, CoroutineOrCBFunc)
  local UI = self:GetUIObj(UIName)
  if not UI and self.AsyncLoadHandlers[UIName] then
    DebugPrint(LXYTag, "\229\188\128\229\167\139\229\188\130\230\173\165GetUIObj...", UIName)
    if not self.AsyncGetUIContexts[UIName] then
      self.AsyncGetUIContexts[UIName] = {}
    end
    table.insert(self.AsyncGetUIContexts[UIName], CoroutineOrCBFunc)
    if type(CoroutineOrCBFunc) == "thread" then
      UI = coroutine.yield()
      return UI
    end
  end
  if type(CoroutineOrCBFunc) == "function" then
    CoroutineOrCBFunc(UI)
  end
  return UI
end

function BP_UIManagerComponent_C:GetUIObjIsAsyncLoading(UIName)
  return self.AsyncLoadHandlers[UIName] ~= nil
end

function BP_UIManagerComponent_C:GetUIPathFromString(InputString)
  if not InputString then
    return nil
  end
  local Parents = {}
  for v in string.gmatch(InputString, "%a+[_%a+%d*]*") do
    table.insert(Parents, v)
  end
  return Parents
end

function BP_UIManagerComponent_C:GetUIObjCountByBaseName(UIName)
  return self.Overridden.GetUIObjCountByBaseName(self, UIName)
end

function BP_UIManagerComponent_C:HideOrShowUIByBaseName(UIName, IsShow)
  local UIConfig = UIConst.AllUIConfig[UIName] or {}
  if UIConfig.allowmulti then
    local UICount = self.UniqueCount[UIName] or 1
    for i = 1, UICount do
      local FinalName = UIName .. tostring(i)
      local ExistUIObj = self:GetUI(FinalName)
      if nil ~= ExistUIObj then
        if IsShow then
          ExistUIObj:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
        else
          ExistUIObj:SetVisibility(UE4.ESlateVisibility.Collapsed)
        end
      end
    end
  else
    local ExistUIObj = self:GetUI(UIName)
    if nil ~= ExistUIObj then
      if IsShow then
        ExistUIObj:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
      else
        ExistUIObj:SetVisibility(UE4.ESlateVisibility.Collapsed)
      end
    end
  end
end

function BP_UIManagerComponent_C:GetTexture2DResource(TexturePath)
  if string.find(TexturePath, "/Game/") == nil then
    TexturePath = "/Game/" .. TexturePath
  end
  local ImageResource = LoadObject(TexturePath)
  return ImageResource
end

function BP_UIManagerComponent_C:GetLogMask()
  return _G.LogTag
end

function BP_UIManagerComponent_C:CloseResidentUI(PopUIName)
  if not IsEmptyTable(self.PopUpUIWidgetRecord) then
    return
  end
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  if Player then
    Player:SetCanInteractiveTrigger(false)
  end
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  local SceneMgrComponent = GameInstance:GetSceneManager()
  if IsValid(SceneMgrComponent) then
    SceneMgrComponent:ShowOrHideAllSceneGuideIcon(false, "UIPopUp")
  end
  self:HideAllComponentUI(true, "UIPopUp")
  local Result = self:GetCurrnetAllUIBySystem(UIConst.PopUpUIName.SpecificSystemList)
  for i, v in ipairs(UIConst.PopUpUIName.SpecificUIList) do
    if nil == Result[v] then
      local UIWidget = self:GetUI(v)
      if nil ~= UIWidget then
        Result[v] = UIWidget
      end
    end
  end
  for UIName, Widget in pairs(Result) do
    if "BattleMain" == UIName then
      if not Widget.IsPlayOutAnim then
        Widget:Hide("UIPopUp")
      end
    else
      Widget:Hide("UIPopUp")
    end
  end
  local Objs = MissionIndicatorManager:GetAllIndicatorUIObjs()
  if not IsEmptyTable(Objs) then
    for Name, UIObj in pairs(Objs) do
      UIObj:Hide("UIPopUp")
    end
  end
  if nil ~= PopUIName then
    self.PopUpUIWidgetRecord[PopUIName] = 1
  end
end

function BP_UIManagerComponent_C:OpenResidentUI(PopUIName)
  if not self:CheckNeedExitPopUp(PopUIName) then
    return
  end
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  if Player then
    Player:SetCanInteractiveTrigger(true)
  end
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  local SceneMgrComponent = GameInstance:GetSceneManager()
  if IsValid(SceneMgrComponent) then
    SceneMgrComponent:ShowOrHideAllSceneGuideIcon(true, "UIPopUp")
  end
  self:HideAllComponentUI(false, "UIPopUp")
  local Result = self:GetCurrnetAllUIBySystem(UIConst.PopUpUIName.SpecificSystemList)
  for i, v in ipairs(UIConst.PopUpUIName.SpecificUIList) do
    if nil == Result[v] then
      local UIWidget = self:GetUI(v)
      if nil ~= UIWidget then
        Result[v] = UIWidget
      end
    end
  end
  for UIName, Widget in pairs(Result) do
    if "BattleMain" == UIName then
      local Player = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
      if Player and Player.CleanInputWhenEnterTalk then
        Player:CleanInputWhenEnterTalk(false)
      end
    end
    Widget:Show("UIPopUp")
  end
  local Objs = MissionIndicatorManager:GetAllIndicatorUIObjs()
  if not IsEmptyTable(Objs) then
    for Name, UIObj in pairs(Objs) do
      UIObj:Show("UIPopUp")
    end
  end
  if nil ~= PopUIName then
    self.PopUpUIWidgetRecord[PopUIName] = nil
  end
end

function BP_UIManagerComponent_C:CheckNeedExitPopUp(ExceptUIName)
  local NeedRecover = true
  for k, v in pairs(self.PopUpUIWidgetRecord) do
    if k ~= ExceptUIName and 1 == v then
      NeedRecover = false
      break
    end
  end
  return NeedRecover
end

function BP_UIManagerComponent_C:GetCurrnetAllUIBySystem(SystemList)
  local AllUI, Result = self.UIInstances:ToTable(), {}
  for _, Widget in pairs(AllUI) do
    local ConfigUIName = Widget.ConfigName or Widget.WidgetName
    local UIConfigData = DataMgr.SystemUI[ConfigUIName]
    if nil ~= UIConfigData then
      local IsNeedAddInList = false
      for i, SystemName in ipairs(SystemList) do
        if UIConfigData.System == SystemName then
          IsNeedAddInList = true
          break
        end
      end
      if IsNeedAddInList then
        Result[ConfigUIName] = Widget
      end
    end
  end
  return Result
end

function BP_UIManagerComponent_C:GetUIManagerShowStateInViewport()
  local BattleWidget = self:GetUIObj("BattleMain")
  if BattleWidget then
    if BattleWidget:IsInViewport() and BattleWidget:IsVisible() then
      return UIConst.GameUIShowState.HUD
    else
      return UIConst.GameUIShowState.System
    end
  end
end

function BP_UIManagerComponent_C:IsInHUDShowMode()
  return self:GetUIManagerShowStateInViewport() == UIConst.GameUIShowState.HUD
end

function BP_UIManagerComponent_C:ShowCommonPopupUI_Old(PopupId, CallbackObj, YesCallBackFunction, NoCallBackFunction, BlankAreaClicked, OverrideText)
  local Params = {}
  Params.LeftCallbackFunction = NoCallBackFunction
  Params.LeftCallbackObj = CallbackObj
  Params.RightCallbackFunction = YesCallBackFunction
  Params.RightCallbackObj = CallbackObj
  Params.CloseBtnCallbackFunction = BlankAreaClicked
  Params.CloseBtnCallbackObj = CallbackObj
  Params.ShortText = OverrideText
  Params.LongText = OverrideText
  return self:ShowCommonPopupUI(PopupId, Params)
end

function BP_UIManagerComponent_C:ShowDisconnectUIConfirm(PopupId, IsStopGame, Params)
  local DisconnectUIName = "NetDisConnectedDialog"
  if UIConst.AllUIConfig[DisconnectUIName] == nil then
    local NewUIConfig = self:SetUIConfig(UIConst.LoadInConfig, DisconnectUIName, DataMgr.SystemUI[DisconnectUIName])
    UIConst.AllUIConfig[DisconnectUIName] = NewUIConfig
  end
  UIConst.AllUIConfig[DisconnectUIName].IsStopGame = IsStopGame
  local PopupUI = self:LoadUI(UIConst.AllUIConfig[DisconnectUIName].resource, DisconnectUIName)
  if nil ~= PopupUI then
    Params = Params or {}
    
    function Params.OnCloseCallbackFunction()
      EventManager:FireEvent(EventID.OnToggleDisconnectUI, false)
    end
    
    EventManager:FireEvent(EventID.OnToggleDisconnectUI, true)
    PopupUI:ShowPopup(PopupId, Params)
    local StorySubsystem = UEMCommonInputSubsystem.Get(self)
    if StorySubsystem then
      StorySubsystem:ClearUIInputBlock()
    end
  end
  return PopupUI
end

function BP_UIManagerComponent_C:ShowCommonPopupUI(PopupId, Params, ParentWidget, Coroutine)
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  if not GameInstance:CheckCanShowPopup() then
    GameInstance:RequestShowPopup(PopupId, Params, ParentWidget)
    return
  end
  local PopupData = DataMgr.CommonPopupUIContext[PopupId]
  local PopupStyle = DataMgr.CommonPopupUIStyle[PopupData.Style]
  local PopupUI
  if Coroutine then
    PopupUI = self:LoadUIAsync("CommonDialog", Coroutine, Params, ParentWidget)
  else
    PopupUI = self:LoadUINew("CommonDialog", PopupId, Params, ParentWidget)
  end
  PopupUI:ShowPopup(PopupId, Params, ParentWidget)
  if Params and Params.BindScript and PopupUI.Script then
    return PopupUI.Script
  else
    return PopupUI
  end
end

function BP_UIManagerComponent_C:ShowCommonPopupUI_Interrupt(PopupId, Params, ParentWidget)
  local CommonDialog = self:GetUI("CommonDialog")
  if not CommonDialog then
    DebugPrint("Tianyi@ ShowCommonPopupUI_Interrupt \229\143\170\232\131\189\229\156\168\233\128\154\231\148\168\229\188\185\231\170\151\230\152\190\231\164\186\229\135\186\230\157\165\231\154\132\230\151\182\229\128\153\232\176\131\231\148\168!")
    return
  end
  CommonDialog:ShowPopupInterrupt(PopupId, Params, ParentWidget)
end

function BP_UIManagerComponent_C:PreviewCommonPopupStyle(StyleId)
  local PopupStyle = DataMgr.CommonPopupUIStyle[StyleId]
  if not PopupStyle then
    DebugPrint("TianyI@ PopupStyle is nil")
    return
  end
  local PopupWidget = self:LoadUINew("CommonDialog")
  PopupWidget:PlayAnimation(PopupWidget.In)
  PopupWidget:UpdateView(StyleId)
end

function BP_UIManagerComponent_C:GetGameInputModeSubsystem()
  if not self.GameInputModeSubsystem then
    self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(GWorld.GameInstance)
  end
  return self.GameInputModeSubsystem
end

function BP_UIManagerComponent_C:ShowError(ErrCode, Duration, TipType, ...)
  if nil == TipType then
    TipType = UIConst.Tip_CommonTop
  end
  local Err = DataMgr.ErrorCode[ErrCode]
  if Err then
    local Content = ErrorCode:GetText(ErrCode)
    Content = string.format(Content or "", ...)
    if not Content or "" == Content then
      self:ShowUITip(TipType, "Unconfigured ErrorCode\239\188\154" .. tostring(ErrCode), Duration)
    else
      self:ShowUITip(TipType, Content, Duration)
    end
  else
    self:ShowUITip(TipType, "Unknown ErrorCode\239\188\154" .. tostring(ErrCode), Duration)
  end
end

function BP_UIManagerComponent_C:ShowUITip(TipType, TipContent, LastTime, IsWaitToTrigger, ExtraData)
  ExtraData = ExtraData or {}
  LastTime = LastTime or 2.0
  if TipType == UIConst.Tip_Quest then
    if type(TipContent) == "table" then
      local TaskStateInfo = ExtraData.TaskStateStr
      local UITips = UE4.UUIStateAsyncActionBase.ShowQuestBeginEndTip(self, TipContent[1], TaskStateInfo[1], LastTime)
      UITips.OnGuideEnd:Add(self, function()
        UE4.UUIStateAsyncActionBase.ShowQuestBeginEndTip(self, TipContent[2], TaskStateInfo[2], LastTime)
      end)
    elseif IsWaitToTrigger then
      self.WaitToTriggerTipsInfo[TipType] = {Content = TipContent, Extra = ExtraData}
    else
      local WaitToTriggerTipsInfo = self.WaitToTriggerTipsInfo[TipType]
      if WaitToTriggerTipsInfo then
        local UITips = UE4.UUIStateAsyncActionBase.ShowQuestBeginEndTip(self, WaitToTriggerTipsInfo.Content, WaitToTriggerTipsInfo.Extra.TaskStateStr, LastTime)
        UITips.OnGuideEnd:Add(self, function()
          UE4.UUIStateAsyncActionBase.ShowQuestBeginEndTip(self, TipContent, ExtraData.TaskStateStr, LastTime)
        end)
        self.WaitToTriggerTipsInfo[TipType] = nil
      else
        local QuestBeginEnd = self:GetUI("QuestBeginEnd")
        if QuestBeginEnd and QuestBeginEnd.IsShowing then
          print(_G.LogTag, "BP_UIManagerComponent_C:ShowUITip Now Tip Is Showing,Discard This Tip, Id: ", TipContent)
          return
        end
        UE4.UUIStateAsyncActionBase.ShowQuestBeginEndTip(self, TipContent, ExtraData.TaskStateStr, LastTime)
      end
    end
  elseif TipType == UIConst.Tip_CommonTop or TipType == UIConst.Tip_CommonToast then
    TipContent = GText(TipContent)
    local UITipList = self:GetUI("CommonTopToastList")
    if nil == UITipList then
      UITipList = self:LoadUINew("CommonTopToastList", TipContent, LastTime)
    elseif UITipList:IsHide() then
      local TS = TalkSubsystem()
      if not TS or not TS:IsGameUIHidden() then
        UITipList:ClearAllHideTags()
        UITipList:Show()
      end
    end
    local NextTipsIndex = UITipList:AddAndUpdateCurrentUITips()
    RunAsyncTask(self, TipContent .. tostring(NextTipsIndex), function(CoroutineObj)
      local UITopTip = self:CreateWidgetAsync(DataMgr.WidgetUI.CommonToastItem.UIName, CoroutineObj)
      if nil ~= UITopTip then
        UITopTip:SetNeedPaintDeferred(self.IsMenuAnchorOpen and not self:IsInHUDShowMode())
        UITipList:AddNewUITips(UITopTip)
        UITopTip:OnLoaded(TipContent, LastTime)
        if ExtraData.Color then
          UITopTip:ChangeFlashColor(ExtraData.Color)
        end
        AudioManager(self):PlayUISound(UITopTip, "event:/ui/common/toast_normal", nil, nil)
      end
    end)
  elseif TipType == UIConst.Tip_CommonWarning then
    local function WrapLoadWarningTip()
      if IsValid(self.WarningToastUI) and not self.WarningToastUI.IsClose then
        self.WarningToastUI:Close()
      end
      local UITopTip = self:LoadUINew("WarningToast", TipContent, LastTime)
      AudioManager(self):PlayUISound(UITopTip, "event:/ui/common/toast_warning", nil, nil)
      local Pos = FVector2D(0, 0)
      UITopTip.Panel_Toast:SetRenderTranslation(Pos)
      self.WarningToastUI = UITopTip
      self.WarningToastUI.Panel_Toast:SetRenderOpacity(1.0)
      if ExtraData then
        self:HideWarningUITip(ExtraData)
        UITopTip.MessageId = ExtraData
      end
    end
    
    if IsValid(self.WarningToastUI) and not self.WarningToastUI.IsClose then
      self.WarningToastUI:BindToAnimationFinished(self.WarningToastUI.Out, {
        self.WarningToastUI,
        WrapLoadWarningTip
      })
      self.WarningToastUI:PlayAnimation(self.WarningToastUI.Out)
    else
      WrapLoadWarningTip()
    end
  elseif TipType == UIConst.Tip_StoryToast then
    if self._StoryToastSet[TipContent] then
      DebugPrint("UIManager:ShowUItip StoryToast, Repeat Toast", TipContent)
      return
    end
    self._StoryToastSet[TipContent] = true
    if self._StoryToastQueue:Size() > 0 and not ExtraData.bPopWait then
      self:_BreakInTopToastInQueue("_StoryToastQueue", "_StoryToastSet", "_StoryToastTimer", "CommonStoryToast", ExtraData)
    end
    self._StoryToastQueue:PushFront({TipContent, LastTime})
    if not self:IsExistTimer(self._StoryToastTimer) then
      self:_ProcessCommonToastQueue("_StoryToastQueue", "_StoryToastSet", "_StoryToastTimer", "CommonStoryToast", ExtraData)
    end
  elseif TipType == UIConst.Tip_ExcavationToast then
    local UITipList = self:GetUI("CommonTopToastList")
    if nil == UITipList then
      UITipList = self:LoadUINew("CommonTopToastList", TipContent, LastTime)
    end
    local ExcavationToast = self:CreateWidget(UIConst.EXCAVATIONDUNGEONTEXTFLOAT, false)
    UITipList.VerticalBox_Toast:AddChildToVerticalBox(ExcavationToast)
    ExcavationToast:OnLoaded(LastTime, TipContent, ExtraData.Level, ExtraData.OrderText)
  end
end

function BP_UIManagerComponent_C:_ProcessCommonToastQueue(QueneContainerName, SetContainerName, TimerKeyName, ToastUIName, ExtraData)
  local TipContent, ToastLastTime = table.unpack(self[QueneContainerName]:Back())
  local SoundEvent = ExtraData and ExtraData.SoundEvent or nil
  self:LoadUINew(ToastUIName, TipContent, ToastLastTime, SoundEvent)
  self:AddTimer(ToastLastTime + 0.1, function()
    local ToastUI = self:GetUI(ToastUIName)
    if IsValid(ToastUI) then
      ToastUI:Close()
    end
    self:_DoPopNextToastQueue(QueneContainerName, SetContainerName, TimerKeyName, ToastUIName, ExtraData)
  end, false, 0, self[TimerKeyName], true)
end

function BP_UIManagerComponent_C:_DoPopNextToastQueue(QueneContainerName, SetContainerName, TimerKeyName, ToastUIName, ExtraData)
  local TipContent = table.unpack(self[QueneContainerName]:Back())
  self[QueneContainerName]:PopBack()
  if nil ~= self[SetContainerName] then
    self[SetContainerName][TipContent] = nil
  end
  if not self[QueneContainerName]:IsEmpty() then
    self:_ProcessCommonToastQueue(QueneContainerName, SetContainerName, TimerKeyName, ToastUIName, ExtraData)
  else
    self[SetContainerName] = {}
  end
end

function BP_UIManagerComponent_C:_BreakInTopToastInQueue(QueneContainerName, SetContainerName, TimerKeyName, ToastUIName, ExtraData)
  local ToastUI = self:GetUI(ToastUIName)
  if ToastUI then
    ToastUI:Close()
  end
  self:RemoveTimer(self[TimerKeyName])
  self:_DoPopNextToastQueue(QueneContainerName, SetContainerName, TimerKeyName, ToastUIName, ExtraData)
end

function BP_UIManagerComponent_C:ShowUITip_BattleCommonTop(TipType, TipContent, LastTime, IsWaitToTrigger, ExtraData)
  if TipType == UIConst.Tip_CommonTop then
    if not self["BattleCommonTopInCD_" .. TipContent] then
      self:ShowUITip(TipType, GText(TipContent), LastTime, IsWaitToTrigger, ExtraData)
      self["BattleCommonTopInCD_" .. TipContent] = true
      
      local function TimerFunc()
        self["BattleCommonTopInCD_" .. TipContent] = false
      end
      
      self:AddTimer(Const.BattleTip_CommonTop_CD, TimerFunc, false, 0, TipContent, true)
    end
    return
  end
end

function BP_UIManagerComponent_C:HideWarningUITip(MessageId)
  if self.WarningToastUI and self.WarningToastUI.MessageId == MessageId then
    self.WarningToastUI:PlayOutAnim()
  end
end

function BP_UIManagerComponent_C:ShowCommonBlackScreen(Params)
  local NewHandleName = Params.BlackScreenHandle
  if nil == NewHandleName then
    self.CommonBlackScreenAutoCounter = (self.CommonBlackScreenAutoCounter or 0) + 1
    NewHandleName = "AutoGenBlackScreenHandle" .. self.CommonBlackScreenAutoCounter
    Params.BlackScreenHandle = NewHandleName
  end
  if nil == self.CommonBlackScreenInstances then
    self.CommonBlackScreenInstances = {}
  end
  if IsValid(self.CommonBlackScreenInstances[NewHandleName]) then
    DebugPrint("Common_BlackScreen: \231\155\184\229\144\140\231\154\132HandleName\229\183\178\229\173\152\229\156\168\239\188\129")
    return NewHandleName
  end
  local NewBlackScreen = self:LoadUINew("CommonBlackScreen", Params)
  DebugPrint("Common_BlackScreen: NewBlackScreen", NewHandleName)
  return NewHandleName
end

function BP_UIManagerComponent_C:RegisterBlackScreenInstance(NewHandleName, BlackScreenInstance)
  if self.CommonBlackScreenInstances == nil then
    self.CommonBlackScreenInstances = {}
  end
  self.CommonBlackScreenInstances[NewHandleName] = BlackScreenInstance
  DebugPrint("Common_BlackScreen: RegisterBlackScreenInstance", NewHandleName)
end

function BP_UIManagerComponent_C:HideCommonBlackScreen(BlackScreenHandle)
  assert(BlackScreenHandle, "HideCommonBlackScreen\229\191\133\233\161\187\232\190\147\229\133\165BlackScreenHandle\239\188\129")
  if self.CommonBlackScreenInstances == nil then
    self.CommonBlackScreenInstances = {}
  end
  local CommonBlackScreen = self.CommonBlackScreenInstances[BlackScreenHandle]
  if IsValid(CommonBlackScreen) then
    CommonBlackScreen:HideCommonBlackScreen()
  end
end

function BP_UIManagerComponent_C:OnCommonBlackScreenClosed(BlackScreenHandle)
  if self.CommonBlackScreenInstances == nil then
    self.CommonBlackScreenInstances = {}
  end
  self.CommonBlackScreenInstances[BlackScreenHandle] = nil
  DebugPrint("Common_BlackScreen: OnCommonBlackScreenClosed", BlackScreenHandle)
end

function BP_UIManagerComponent_C:IsCommonBlackScreenExist(BlackScreenHandle)
  assert(BlackScreenHandle, "IsCommonBlackScreenExist\229\191\133\233\161\187\232\190\147\229\133\165BlackScreenHandle\239\188\129")
  if self.CommonBlackScreenInstances == nil then
    self.CommonBlackScreenInstances = {}
  end
  return IsValid(self.CommonBlackScreenInstances[BlackScreenHandle])
end

function BP_UIManagerComponent_C:CloseCommonBlackScreenWithoutCB(BlackScreenHandle)
  assert(BlackScreenHandle, "CloseCommonBlackScreenWithoutCB\229\191\133\233\161\187\232\190\147\229\133\165BlackScreenHandle\239\188\129")
  if self.CommonBlackScreenInstances == nil then
    self.CommonBlackScreenInstances = {}
  end
  local CommonBlackScreen = self.CommonBlackScreenInstances[BlackScreenHandle]
  if IsValid(CommonBlackScreen) then
    self:OnCommonBlackScreenClosed(BlackScreenHandle)
    CommonBlackScreen:Close()
    DebugPrint("Common_BlackScreen: CloseCommonBlackScreenWithoutCB", BlackScreenHandle)
  end
end

function BP_UIManagerComponent_C:IsHaveMenuAnchorOpen()
  return self.IsMenuAnchorOpen
end

function BP_UIManagerComponent_C:SetIsMenuAnchorOpen(bIsOpen)
  self.IsMenuAnchorOpen = bIsOpen
end

function BP_UIManagerComponent_C:ShowLevelUpToast(Level, Type, Id)
  self:CacheLevelUpInfo(Level, Type, Id)
  local LevelUpUI = self:LoadUIAsync("CharLevelUp", function()
  end, false)
end

function BP_UIManagerComponent_C:ShowPlayerLevelUpToast(IsInSystem)
  if IsInSystem then
    self:LoadUIAsync("CharLevelUp_System", function()
    end, true)
  else
    self:LoadUIAsync("CharLevelUp", function()
    end, true)
  end
end

function BP_UIManagerComponent_C:CacheLevelUpInfo(Level, Type, Id)
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  if GameInstance.LevelUpToastQueue == nil then
    GameInstance.LevelUpToastQueue = {
      Player = nil,
      Role = nil,
      MeleeWeapon = nil,
      RangedWeapon = nil
    }
  end
  GameInstance.LevelUpToastQueue[Type] = {
    Level,
    Type,
    Id
  }
end

function BP_UIManagerComponent_C:TryShowPlayerLevelUpInfo(LevelUpInfo)
  local Avatar = GWorld:GetAvatar()
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  if not Avatar then
    return
  end
  if not GameInstance.LevelUpToastQueue then
    GameInstance.LevelUpToastQueue = {}
  end
  GameInstance.LevelUpToastQueue.Player = LevelUpInfo
  if Avatar:IsInDungeon() and LevelUpInfo.ShowProgressBar then
    return
  end
  if not self:IsInHUDShowMode() then
    local SupportUIName = DataMgr.SystemUI.CharLevelUp_System.Params.SupportUIName
    if SupportUIName then
      for _, UIName in ipairs(SupportUIName) do
        local UIObj = self:GetUI(UIName)
        if UIObj then
          self:ShowPlayerLevelUpToast(true)
          return
        end
      end
    end
    if not self.WaitToShowPlayerLevelUpTimerHandle then
      self.WaitToShowPlayerLevelUpTimerHandle = self:AddTimer(1, function()
        if self:IsInHUDShowMode() then
          self:ShowPlayerLevelUpToast()
          if self.WaitToShowPlayerLevelUpTimerHandle then
            self:RemoveTimer(self.WaitToShowPlayerLevelUpTimerHandle)
            self.WaitToShowPlayerLevelUpTimerHandle = nil
          end
        end
      end, true)
    end
    return
  end
  self:ShowPlayerLevelUpToast()
end

function BP_UIManagerComponent_C:CreateOrGetArmoryPlayerActor(Char, InAvatar)
  local IsCreated = false
  if not self.ArmoryPlayer or not self.ArmoryPlayer:IsValid() then
    local Player = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
    local actor = self:GetWorld():SpawnActor(LoadClass("/Game/BluePrints/Char/BP_PlayerCharacter.BP_PlayerCharacter_C"), Player:GetTransform(), UE4.ESpawnActorCollisionHandlingMethod.Default, Player, Player, nil)
    if actor then
      actor:RemoveBuffManager()
      actor:SetTickableWhenPaused(true)
      local Avatar = InAvatar or GWorld:GetAvatar()
      Char = Char or Avatar.Chars[Avatar.CurrentChar]
      local AvatarBattleInfo = AvatarUtils:GetDefaultBattleInfo(Avatar, {Char = Char})
      local GameMode = UE4.UGameplayStatics.GetGameMode(self)
      if GameMode then
        AvatarBattleInfo = GameMode:SimplifyInfoForInit(AvatarBattleInfo)
        AvatarBattleInfo.FromOtherWorld = true
        AvatarBattleInfo.FromArmory = true
        actor:InitCharacterInfo(AvatarBattleInfo)
      end
      actor:ForceClearActorHideTag()
      actor.CapsuleComponent:SetCollisionEnabled(ECollisionEnabled.NoCollision)
      actor.Mesh:SetCollisionEnabled(ECollisionEnabled.NoCollision)
      actor.Mesh:SetTickableWhenPaused(true)
      actor.DitherDisabled = true
    end
    self.ArmoryPlayer = actor
    IsCreated = true
  end
  return self.ArmoryPlayer, IsCreated
end

function BP_UIManagerComponent_C:CreateShowWeapon(Owner, Params, Callback)
  self.ShowWeaponOwners = self.ShowWeaponOwners or {}
  self.ShowWeaponOwners[Owner] = Params
  if self.ShowWeapon then
    self.ShowWeapon:SetActorHideTag("CreateShowWeapon", true)
  end
  local PlayerCharacter = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  PlayerCharacter:SpawnShowWeaponAsync(Params.WeaponId, Params.Transform, Params.ReplaceAttrs, Params.SkillInfos, Params.AppearanceInfo, Params.WeaponInfo, function(WeaponActor)
    self:ForceDestroyShowWeapon()
    self.ShowWeapon = WeaponActor
    if not self.ShowWeaponOwners[Owner] then
      self:DestroyShowWeapon(Owner)
      return
    end
    if self.ShowWeapon then
      self.ShowWeapon:SetActorHideTag("CreateShowWeapon", false)
    end
    if Callback then
      Callback(self.ShowWeapon)
    end
  end)
end

function BP_UIManagerComponent_C:DestroyShowWeapon(Owner)
  self.ShowWeaponOwners = self.ShowWeaponOwners or {}
  if Owner then
    self.ShowWeaponOwners[Owner] = nil
  end
  if next(self.ShowWeaponOwners) then
    return
  end
  self:ForceDestroyShowWeapon()
end

function BP_UIManagerComponent_C:ForceDestroyShowWeapon()
  if IsValid(self.ShowWeapon) then
    if self.ShowWeapon.ChildWeapon then
      self.ShowWeapon.ChildWeapon:K2_DestroyActor()
    end
    self.ShowWeapon:K2_DestroyActor()
    self.ShowWeapon = nil
  end
end

function BP_UIManagerComponent_C:CreateAndGetUINpcActor(NpcId)
  local ToCreateUIActor = self.AllUINpcActor[NpcId]
  if nil ~= ToCreateUIActor and IsValid(ToCreateUIActor) and ToCreateUIActor.NpcId == NpcId then
    if ToCreateUIActor.IsInOutAnim then
      ToCreateUIActor:DestroyActorTemp()
    else
      return ToCreateUIActor
    end
  end
  local SpawnNpcConfig = DataMgr.SpawnNPC[NpcId]
  if nil == SpawnNpcConfig then
    return
  end
  local DistanceRadius = SpawnNpcConfig.SpawnRadius
  local DistanceAngle = tonumber(SpawnNpcConfig.SpawnAngle)
  local PlayerCharacter = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  local PlayerForwardVector = PlayerCharacter:GetActorForwardVector()
  PlayerForwardVector:Normalize()
  local PlayerTransform = PlayerCharacter:GetTransform()
  local NPCPointVector = UE4.UKismetMathLibrary.RotateAngleAxis(PlayerForwardVector, DistanceAngle, PlayerCharacter:GetActorUpVector())
  PlayerTransform.Translation.X = PlayerTransform.Translation.X + DistanceRadius * NPCPointVector.X
  PlayerTransform.Translation.Y = PlayerTransform.Translation.Y + DistanceRadius * NPCPointVector.Y
  local PlayerBackVector = UE4.UKismetMathLibrary.RotateAngleAxis(PlayerForwardVector, 180, PlayerCharacter:GetActorUpVector())
  local TraceEndPos = PlayerTransform.Translation + PlayerBackVector * SpawnNpcConfig.DetectionDiatance
  local HitWallResult = FHitResult()
  local bHitWall = UE4.UKismetSystemLibrary.LineTraceSingle(self, PlayerTransform.Translation, TraceEndPos, ETraceTypeQuery.TraceExceptChar, false, nil, 0, HitWallResult, true)
  local NewNpcRotation = PlayerTransform.Rotation:ToRotator()
  if bHitWall then
    NewNpcRotation.Pitch, NewNpcRotation.Yaw, NewNpcRotation.Roll = 0, NewNpcRotation.Yaw - 90, 0
  else
    NewNpcRotation.Pitch, NewNpcRotation.Yaw, NewNpcRotation.Roll = 0, NewNpcRotation.Yaw + 90, 0
  end
  PlayerTransform.Rotation = NewNpcRotation:ToQuat()
  ToCreateUIActor = self:GetWorld():SpawnActor(LoadClass(SpawnNpcConfig.BPPath), PlayerTransform, UE4.ESpawnActorCollisionHandlingMethod.AdjustIfPossibleButAlwaysSpawn, PlayerCharacter, PlayerCharacter, nil)
  
  local function TryGetActorOverlapImpactLocation(Actor)
    local ActorCapsuleRaduis = Actor.CapsuleComponent:GetUnscaledCapsuleRadius()
    local Start = Actor.CapsuleComponent:K2_GetComponentLocation()
    local End = Actor.CapsuleComponent:K2_GetComponentLocation()
    Start.Z = Start.Z + Actor.CapsuleComponent:GetUnscaledCapsuleHalfHeight()
    End.Z = End.Z - Actor.CapsuleComponent:GetUnscaledCapsuleHalfHeight() * 0.5
    local HitResult = FHitResult()
    local bHit = UE4.UKismetSystemLibrary.SphereTraceSingle(Actor, Start, End, ActorCapsuleRaduis, ETraceTypeQuery.TraceExceptChar, true, nil, 0, HitResult, true, UE4.FLinearColor(1, 0, 0, 1), UE4.FLinearColor(0, 1, 0, 1), 5)
    if bHit then
      return HitResult.ImpactPoint
    else
      return nil
    end
  end
  
  local FirstImpactLocation = TryGetActorOverlapImpactLocation(ToCreateUIActor)
  if nil ~= FirstImpactLocation then
    PlayerTransform.Translation.X = FirstImpactLocation.X
    PlayerTransform.Translation.Y = FirstImpactLocation.Y
    PlayerTransform.Translation.Z = FirstImpactLocation.Z + ToCreateUIActor.CapsuleComponent:GetUnscaledCapsuleHalfHeight()
    ToCreateUIActor:K2_SetActorTransform(PlayerTransform, false, nil, false)
    local SecondImpactLocation = TryGetActorOverlapImpactLocation(ToCreateUIActor)
    if nil ~= SecondImpactLocation then
      local CurLocationVector = PlayerTransform.Translation
      local NewLocationVector = UE.UNavigationFunctionLibrary.ProjectPointToNavigation(CurLocationVector, ToCreateUIActor)
      if NewLocationVector.X > 0 and NewLocationVector.Y > 0 and NewLocationVector.Z > 0 then
        PlayerTransform.Translation.X = NewLocationVector.X
        PlayerTransform.Translation.Y = NewLocationVector.Y
        PlayerTransform.Translation.Z = NewLocationVector.Z + ToCreateUIActor.CapsuleComponent:GetUnscaledCapsuleHalfHeight()
        ToCreateUIActor:K2_SetActorTransform(PlayerTransform, false, nil, false)
      end
    end
  end
  if ToCreateUIActor then
    ToCreateUIActor.NpcId = NpcId
    ToCreateUIActor.ModelId = DataMgr.Npc[NpcId].ModelId
    ToCreateUIActor.CapsuleComponent:SetCollisionEnabled(ECollisionEnabled.NoCollision)
    ToCreateUIActor.Mesh:SetCollisionEnabled(ECollisionEnabled.NoCollision)
    ToCreateUIActor:SetTickableWhenPaused(true)
    ToCreateUIActor.Mesh:SetTickableWhenPaused(true)
  end
  ToCreateUIActor.IsNeedSetPos = false
  self.AllUINpcActor[NpcId] = ToCreateUIActor
  return ToCreateUIActor
end

function BP_UIManagerComponent_C:GetUINpcActor(NpcId)
  return self.AllUINpcActor[NpcId]
end

function BP_UIManagerComponent_C:HideOrShowPlayerFX(Player, bHide, Tag)
  if Player and Player.Mesh then
    local Components = TArray(USceneComponent)
    URuntimeCommonFunctionLibrary.SetSceneComponentHiddenInGame(Player.Mesh, bHide, true, Tag, Components)
  end
end

function BP_UIManagerComponent_C:HideOrShowOtherUINpcActor(bHide, HideTag, ExNpcId)
  for NpcId, UINpcActor in pairs(self.AllUINpcActor) do
    if NpcId ~= ExNpcId then
      if UINpcActor.SetActorHideTag then
        UINpcActor:SetActorHideTag(HideTag, bHide)
      else
        UINpcActor:SetActorHiddenInGame(bHide)
      end
    end
  end
  if IsValid(self.ArmoryPlayer) then
    self.ArmoryPlayer:SetActorHideTag(HideTag, bHide)
    self.ArmoryPlayer:HideAllEffectCreature(HideTag, bHide)
  end
end

function BP_UIManagerComponent_C:HideNpcActor(bHide, HideTag, ExNpcId)
  for NpcId, UINpcActor in pairs(self.AllUINpcActor) do
    if NpcId ~= ExNpcId then
      if UINpcActor.SetActorHideTag then
        UINpcActor:SetActorHideTag(HideTag, bHide)
      else
        UINpcActor:SetActorHiddenInGame(bHide)
      end
    end
  end
end

function BP_UIManagerComponent_C:HideNpcById(NpcId, bHide, HideTag)
  local UINpcActor = self.AllUINpcActor and self.AllUINpcActor[NpcId]
  if not UINpcActor then
    DebugPrint("HideNpcById  \230\137\190\228\184\141\229\136\176npc")
    return
  end
  if UINpcActor.SetActorHideTag then
    UINpcActor:SetActorHideTag(HideTag or "DefaultHideTag", bHide)
  else
    UINpcActor:SetActorHiddenInGame(bHide)
  end
end

function BP_UIManagerComponent_C:CreateUIActorCameraHelper(Player)
  local ToCreateUIActorCameraHelper = self:GetWorld():SpawnActor(LoadClass("/Game/BluePrints/Char/BP_PlayerCharacterArmoryHelper.BP_PlayerCharacterArmoryHelper_C"), Player:GetTransform(), UE4.ESpawnActorCollisionHandlingMethod.Default)
  ToCreateUIActorCameraHelper:K2_AttachToActor(Player, "Root", UE4.EAttachmentRule.KeepWorld, UE4.EAttachmentRule.KeepWorld, UE4.EAttachmentRule.KeepWorld, true)
  ToCreateUIActorCameraHelper:K2_AddActorLocalOffset(FVector(0, 0, 0), false, nil, false)
  return ToCreateUIActorCameraHelper
end

function BP_UIManagerComponent_C:GetUIActorCameraHelper(NpcId)
  return self.AllUIActorCameraHelper[NpcId]
end

function BP_UIManagerComponent_C:PlayUINpcAnimation(bInOut, UIName, NpcId, Params)
  local UINpcActor = self:GetUINpcActor(NpcId)
  local SpawnNpcConfig = DataMgr.SpawnNPC[NpcId]
  if nil == UINpcActor or nil == SpawnNpcConfig then
    return
  end
  local bDestroyNpc = Params.bDestroyNpc
  local IsHaveInOutAnim = Params.IsHaveInOutAnim
  if bInOut then
    local OnInActionFinished = Params.OnInActionFinished
    if UINpcActor.IsNeedSetPos then
      local DistanceRadius = SpawnNpcConfig.SpawnRadius
      local DistanceAngle = SpawnNpcConfig.SpawnAngle
      local PlayerForwardVector = Player:GetActorForwardVector()
      PlayerForwardVector:Normalize()
      local PlayerTransform = Player:GetTransform()
      local NPCPointVector = UE4.UKismetMathLibrary.RotateAngleAxis(PlayerForwardVector, DistanceAngle, Player:GetActorUpVector())
      PlayerTransform.Translation.X = PlayerTransform.Translation.X + DistanceRadius * NPCPointVector.X
      PlayerTransform.Translation.Y = PlayerTransform.Translation.Y + DistanceRadius * NPCPointVector.Y
      local PlayerBackVector = UE4.UKismetMathLibrary.RotateAngleAxis(PlayerForwardVector, 180, Player:GetActorUpVector())
      local TraceEndPos = PlayerTransform.Translation + PlayerBackVector * SpawnNpcConfig.DetectionDiatance
      local HitWallResult = FHitResult()
      local bHitWall = UE4.UKismetSystemLibrary.LineTraceSingle(self, PlayerTransform.Translation, TraceEndPos, ETraceTypeQuery.TraceExceptChar, false, nil, 0, HitWallResult, true)
      local NewNpcRotation = PlayerTransform.Rotation:ToRotator()
      if bHitWall then
        NewNpcRotation.Pitch, NewNpcRotation.Yaw, NewNpcRotation.Roll = 0, NewNpcRotation.Yaw - 90, 0
      else
        NewNpcRotation.Pitch, NewNpcRotation.Yaw, NewNpcRotation.Roll = 0, NewNpcRotation.Yaw + 90, 0
      end
      PlayerTransform.Rotation = NewNpcRotation:ToQuat()
      UINpcActor:K2_SetActorTransform(PlayerTransform, false, nil, false)
      
      local function TryGetActorOverlapImpactLocation(Actor)
        local ActorCapsuleRaduis = Actor.CapsuleComponent:GetUnscaledCapsuleRadius()
        local Start = Actor.CapsuleComponent:K2_GetComponentLocation()
        local End = Actor.CapsuleComponent:K2_GetComponentLocation()
        Start.Z = Start.Z + Actor.CapsuleComponent:GetUnscaledCapsuleHalfHeight()
        End.Z = End.Z - Actor.CapsuleComponent:GetUnscaledCapsuleHalfHeight() * 0.5
        local HitResult = FHitResult()
        local bHit = UE4.UKismetSystemLibrary.SphereTraceSingle(Actor, Start, End, ActorCapsuleRaduis, ETraceTypeQuery.TraceExceptChar, true, nil, 0, HitResult, true, UE4.FLinearColor(1, 0, 0, 1), UE4.FLinearColor(0, 1, 0, 1), 5)
        if bHit then
          return HitResult.ImpactPoint
        else
          return nil
        end
      end
      
      local FirstImpactLocation = TryGetActorOverlapImpactLocation(UINpcActor)
      if nil ~= FirstImpactLocation then
        PlayerTransform.Translation.X = FirstImpactLocation.X
        PlayerTransform.Translation.Y = FirstImpactLocation.Y
        PlayerTransform.Translation.Z = FirstImpactLocation.Z + UINpcActor.CapsuleComponent:GetUnscaledCapsuleHalfHeight()
        UINpcActor:K2_SetActorTransform(PlayerTransform, false, nil, false)
        local SecondImpactLocation = TryGetActorOverlapImpactLocation(UINpcActor)
        if nil ~= SecondImpactLocation then
          local CurLocationVector = PlayerTransform.Translation
          local NewLocationVector = UE.UNavigationFunctionLibrary.ProjectPointToNavigation(CurLocationVector, UINpcActor)
          PlayerTransform.Translation.X = NewLocationVector.X
          PlayerTransform.Translation.Y = NewLocationVector.Y
          PlayerTransform.Translation.Z = NewLocationVector.Z + UINpcActor.CapsuleComponent:GetUnscaledCapsuleHalfHeight()
          UINpcActor:K2_SetActorTransform(PlayerTransform, false, nil, false)
        end
      end
    end
    self:HideOrShowOtherUINpcActor(true, UIName, NpcId)
    
    local function PlayInActionFinished()
      UINpcActor:SetCharacterTag("Interactive")
      if OnInActionFinished then
        OnInActionFinished()
      end
    end
    
    if IsHaveInOutAnim and nil ~= SpawnNpcConfig.StartDialogue then
      UINpcActor:PlayUITalkAction(SpawnNpcConfig.StartDialogue, {self, PlayInActionFinished})
    else
      PlayInActionFinished()
    end
  else
    if UINpcActor.BaiBox then
      UINpcActor.BaiBox:SetHiddenInGame(true, false)
    end
    local ToCreateUIActorCameraHelper = self.AllUIActorCameraHelper[NpcId]
    
    local function PlayOutActionFinished()
      if bDestroyNpc and IsValid(UINpcActor) then
        UINpcActor:DestroyActorTemp()
        self.AllUINpcActor[NpcId] = nil
      else
        CommonUtils:SetActorTickableWhenPaused(UINpcActor, false)
        if type(UINpcActor.SetEmoIdleEnabled) == "function" then
          UINpcActor:SetEmoIdleEnabled(true)
        end
        if "function" == type(UINpcActor.KawaiiSwitch) then
          UINpcActor:KawaiiSwitch(true)
        end
        UINpcActor.IsNeedSetPos = true
        UINpcActor:SetCharacterTag("Idle")
        UINpcActor:K2_SetActorLocation(FVector(-1000000, -1000000, -1000000), false, nil, false)
        UINpcActor:SetActorHiddenInGame(true)
      end
      self:HideOrShowOtherUINpcActor(false, UIName, NpcId)
      ToCreateUIActorCameraHelper:K2_DestroyActor()
    end
    
    if IsHaveInOutAnim and nil ~= SpawnNpcConfig.EndDialogue then
      UINpcActor.IsInOutAnim = true
      UINpcActor:PlayUITalkAction(SpawnNpcConfig.EndDialogue, {self, PlayOutActionFinished})
    else
      PlayOutActionFinished()
    end
  end
end

function BP_UIManagerComponent_C:SwitchUINpcCamera(bNpcCamera, UIName, NpcId, Params)
  local SpawnNpcConfig, UINpcActorForCreate = DataMgr.SpawnNPC[NpcId]
  if nil == SpawnNpcConfig then
    DebugPrint("BP_UIManagerComponent_C SwitchUINpcCamera SpawnNpcConfig is nil, NpcId is ", NpcId)
    return
  end
  if nil ~= SpawnNpcConfig.ConditionID then
    local PlayerAvatar = GWorld:GetAvatar()
    if nil ~= PlayerAvatar and not ConditionUtils.CheckCondition(PlayerAvatar, SpawnNpcConfig.ConditionID) then
      return
    end
  end
  local IsOnlyMoveCamera = SpawnNpcConfig.IsOnlyMoveCamera
  if nil == IsOnlyMoveCamera then
    UINpcActorForCreate = self:CreateAndGetUINpcActor(NpcId)
    if nil == UINpcActorForCreate or not IsValid(UINpcActorForCreate) then
      DebugPrint("BP_UIManagerComponent_C SwitchUINpcCamera Create UIActor failed, The NpcId is", NpcId)
      return
    end
    if UINpcActorForCreate.BaiBox then
      UINpcActorForCreate.BaiBox:SetHiddenInGame(false, false)
    end
  end
  Params = Params or {}
  local RecoverTime, IsHaveInOutAnim = Params.RecoverTime, Params.IsHaveInOutAnim
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  local UIActorCameraHelper = self:GetUIActorCameraHelper(NpcId)
  if nil == UIActorCameraHelper or not IsValid(UIActorCameraHelper) then
    UIActorCameraHelper = self:CreateUIActorCameraHelper(Player)
    self.AllUIActorCameraHelper[NpcId] = UIActorCameraHelper
  end
  if not IsValid(UIActorCameraHelper) then
    DebugPrint("SwitchUINpcCamera UIActorCameraHelper Create Failed, Npc Id is ", NpcId)
    return
  end
  local ViewTargetActor = self:GetUINpcActor(NpcId)
  if IsOnlyMoveCamera then
    if nil == ViewTargetActor then
      local CameraComponent = Player:GetComponentByClass(UCameraComponent:StaticClass())
      UIActorCameraHelper:SetCameraStartTrans(CameraComponent:K2_GetComponentToWorld(), CameraComponent.FieldOfView, Player)
    end
    self:SetCameraParamWithConfigData(UIActorCameraHelper, SpawnNpcConfig)
    return
  end
  if bNpcCamera then
    self:SetTargetActorState(true, UINpcActorForCreate, UIName, IsHaveInOutAnim)
    self:PlayUINpcAnimation(true, UIName, NpcId, Params)
    local CameraComponent = Player:GetComponentByClass(UCameraComponent:StaticClass())
    UIActorCameraHelper:SetCameraStartTrans(CameraComponent:K2_GetComponentToWorld(), CameraComponent.FieldOfView, UINpcActorForCreate)
    self:SetCameraParamWithConfigData(UIActorCameraHelper, SpawnNpcConfig)
  else
    if IsHaveInOutAnim then
      if IsValid(Player) and Player.IsInAir then
        IsHaveInOutAnim = false
      end
      local UIObj = self:GetUIObj(UIName)
      if nil ~= UIObj and UIObj.IsAddInDeque then
        IsHaveInOutAnim = false
      end
    end
    self:SetTargetActorState(false, UINpcActorForCreate, UIName, IsHaveInOutAnim)
    self:PlayUINpcAnimation(false, UIName, NpcId, Params)
    if nil ~= RecoverTime then
      local function OnRecorverCameraEnd()
        local TargetUI = self:GetUIObj(UIName)
        
        if TargetUI and TargetUI.OnRecorverCameraEnd then
          TargetUI:OnRecorverCameraEnd()
        end
      end
      
      UIActorCameraHelper:RecorverCamera(self, OnRecorverCameraEnd, RecoverTime)
    end
  end
end

local FixedCameraCache = {}

function BP_UIManagerComponent_C:SwitchFixedCamera(bInOut, NpcId, Hidetag, OriginSelf, UIName, Parms)
  if nil == NpcId then
    ScreenPrint("SwitchFixedCamera:\232\183\179\232\189\172\233\149\156\229\164\180\229\164\177\232\180\165NpcId\228\184\186\231\169\186")
    DebugPrint("SwitchFixedCamera Failed NpcId is nil ")
    return
  end
  local PlayerController = UGameplayStatics.GetPlayerController(self, 0)
  local PlayerCharacter = UGameplayStatics.GetPlayerCharacter(self, 0)
  local SpawnNpcConfig, UINpcActorForCreate = DataMgr.SpawnNPC[NpcId]
  if nil == SpawnNpcConfig then
    ScreenPrint("SwitchFixedCamera:\230\178\161\230\156\137\230\137\190\229\136\176\232\161\168\229\134\133\230\149\176\230\141\174\239\188\140\232\175\183\230\163\128\230\159\165NpcId" .. (NpcId or "NpcId\228\184\186\231\169\186"))
    DebugPrint("SwitchFixedCamera:\230\178\161\230\156\137\230\137\190\229\136\176\232\161\168\229\134\133\230\149\176\230\141\174 SpawnNpcConfig \228\184\186\231\169\186 ")
    return
  end
  
  local function CreatNpcAndSwitch()
    if UIName then
      self:SwitchUINpcCamera(bInOut, UIName, NpcId, Parms)
    else
      ScreenPrint("\231\148\159\230\136\144NPC\233\149\156\229\164\180UIName\228\184\186\231\169\186")
    end
  end
  
  local cameraPath
  local CurrentPlatform = CommonUtils.GetDeviceTypeByPlatformName(self)
  if "Mobile" == CurrentPlatform and SpawnNpcConfig.FixedCameraM then
    cameraPath = SpawnNpcConfig.FixedCameraM
  elseif SpawnNpcConfig.FixedCamera then
    cameraPath = SpawnNpcConfig.FixedCamera
  else
    DebugPrint("SwitchFixedCamera:\232\161\168\229\134\133\230\178\161\230\156\137\233\133\141\231\189\174\229\155\186\229\174\154\233\149\156\229\164\180\239\188\154\231\148\159\230\136\144NPC\233\149\156\229\164\180")
    CreatNpcAndSwitch()
    return
  end
  
  local function GetOrCreateCamera()
    if FixedCameraCache[cameraPath] and IsValid(FixedCameraCache[cameraPath].actor) then
      return FixedCameraCache[cameraPath].actor
    end
    local CameraClass = LoadClass(cameraPath)
    if not CameraClass then
      ScreenPrint("SwitchFixedCamera:\230\151\160\230\179\149\229\138\160\232\189\189\231\155\184\230\156\186\232\147\157\229\155\190\231\177\187\239\188\140\232\175\183\230\163\128\230\159\165\232\183\175\229\190\132\230\152\175\229\144\166\230\173\163\231\161\174\239\188\154" .. cameraPath)
      return nil
    end
    local actor = UGameplayStatics.GetActorOfClass(OriginSelf, CameraClass)
    if not actor then
      ScreenPrint("SwitchFixedCamera:[WARNING] \230\156\170\230\137\190\229\136\176\231\155\184\230\156\186\229\174\158\228\190\139")
      return
    end
    FixedCameraCache[cameraPath] = {class = CameraClass, actor = actor}
    return actor
  end
  
  local ShopCamera = GetOrCreateCamera()
  if not ShopCamera then
    ScreenPrint("\230\156\170\230\137\190\229\136\176\231\155\184\230\156\186\229\174\158\228\190\139")
    CreatNpcAndSwitch()
    return
  end
  if bInOut then
    local ShopCamera = GetOrCreateCamera()
    if ShopCamera then
      ShopCamera.Camera:K2_SetRelativeLocation(ShopCamera.DefaultLocation, false, nil, false)
      PlayerController:SetViewTargetWithBlend(ShopCamera, 0, EViewTargetBlendFunction.VTBlend_Linear, 0, false)
      self.MoveFixedCamera(OriginSelf, ShopCamera.Camera)
    end
    if PlayerCharacter and Hidetag then
      PlayerCharacter:SetActorHideTag(Hidetag, true)
    end
  else
    if IsValid(OriginSelf.CameraHandle) then
      ULTweenBPLibrary.KillIfIsTweening(OriginSelf, OriginSelf.CameraHandle)
    end
    local CachedViewTarget = rawget(OriginSelf, "OriginalViewTarget")
    if IsValid() then
      PlayerController:SetViewTargetWithBlend(OriginSelf.OriginalViewTarget, 0, UE4.EViewTargetBlendFunction.VTBlend_Linear, 0, false)
    else
      DebugPrint("SwitchFixedCamera:UIState\231\154\132OriginalViewTarget\228\184\186\231\169\186  " .. (UIName or "UIName\228\184\186\231\169\186"))
      OriginSelf:GetOwningPlayer():SetViewTargetWithBlend(PlayerCharacter, 0, UE4.EViewTargetBlendFunction.VTBlend_Linear, 0, false)
    end
    if PlayerCharacter and Hidetag then
      PlayerCharacter:SetActorHideTag(Hidetag, false)
    end
  end
end

function BP_UIManagerComponent_C:MoveFixedCamera(Camera)
  local StartPosition = Camera.RelativeLocation
  local EndPosition = FVector(0)
  self.CameraHandle = ULTweenBPLibrary.Vector3To(self, {
    self,
    function(_, Value)
      Camera:K2_SetRelativeLocation(Value, false, nil, false)
    end
  }, StartPosition, EndPosition, 0.5, 0, 17)
end

function BP_UIManagerComponent_C:SetCameraParamWithConfigData(ToCreateUIActorCameraHelper, SpawnNpcConfig)
  local CameraPositionStart, CameraRotationStart, CameraPosition, CameraRotation
  local PlatformName = CommonUtils.GetDeviceTypeByPlatformName(self)
  if "Mobile" == PlatformName and SpawnNpcConfig.CameraPositionStartM then
    CameraPositionStart = SpawnNpcConfig.CameraPositionStartM
    CameraRotationStart = SpawnNpcConfig.CameraRotationStartM
    CameraPosition = SpawnNpcConfig.CameraPositionM
    CameraRotation = SpawnNpcConfig.CameraRotationM
    CameraRotation = self:CalculatorCameraRotationbyResolution(SpawnNpcConfig, CameraRotation)
  else
    CameraPositionStart = SpawnNpcConfig.CameraPositionStart
    CameraRotationStart = SpawnNpcConfig.CameraRotationStart
    CameraPosition = SpawnNpcConfig.CameraPosition
    CameraRotation = SpawnNpcConfig.CameraRotation
    CameraRotation = self:CalculatorCameraRotationbyResolution(SpawnNpcConfig, CameraRotation)
  end
  local StartCameraLocation = FVector(CameraPositionStart[1], CameraPositionStart[2], CameraPositionStart[3])
  local StartCameraRotation = FRotator(CameraRotationStart[1], CameraRotationStart[2], CameraRotationStart[3])
  local Controller = UE4.UGameplayStatics.GetPlayerController(self, 0)
  Controller:SetViewTargetWithBlend(ToCreateUIActorCameraHelper, 0, UE4.EViewTargetBlendFunction.VTBlend_Linear, 0, false)
  if SpawnNpcConfig.CameraFov then
    ToCreateUIActorCameraHelper:StartFOVAnim(SpawnNpcConfig.CameraFov, SpawnNpcConfig.CameraTime, 14)
  end
  ToCreateUIActorCameraHelper:TransformCamera(FVector(CameraPosition[1], CameraPosition[2], CameraPosition[3]), FRotator(CameraRotation[1], CameraRotation[2], CameraRotation[3]), SpawnNpcConfig.CameraTime, 17, StartCameraLocation, StartCameraRotation)
end

function BP_UIManagerComponent_C:CalculatorCameraRotationbyResolution(SpawnNpcConfig, CameraRotation)
  local CameraRotationDelta = SpawnNpcConfig.CameraRotation2
  if nil == CameraRotationDelta then
    return CameraRotation
  end
  if not (type(CameraRotationDelta) == "table" and CameraRotationDelta[1] and CameraRotationDelta[2]) or not CameraRotationDelta[3] then
    ScreenPrint("SpawnNpc\232\161\168\228\184\173\231\154\132CameraRotationDelta\230\149\176\230\141\174\230\156\137\232\175\175\239\188\140\230\178\161\230\137\190\229\136\176\229\175\185\229\186\148\231\154\1323\228\184\170\229\157\144\230\160\135")
    return CameraRotation
  end
  local FinalCameraRotation = {
    CameraRotation[1] + CameraRotationDelta[1],
    CameraRotation[2] + CameraRotationDelta[2],
    CameraRotation[3] + CameraRotationDelta[3]
  }
  local resolution = UWidgetLayoutLibrary.GetViewportSize(self) / UWidgetLayoutLibrary.GetViewportScale(self)
  local width = resolution.X
  local height = resolution.Y
  local Aspectratio = width / height
  local Aspectratio23To9 = 2.5555555555555554
  local Aspectratio16To9 = 1.7777777777777777
  local Aspectratio4To3 = 1.3333333333333333
  local Alalpha = (Aspectratio - Aspectratio16To9) / (Aspectratio23To9 - Aspectratio16To9)
  local minAlpha = (Aspectratio4To3 - Aspectratio16To9) / (Aspectratio23To9 - Aspectratio16To9)
  local maxAlpha = 1.0
  Alalpha = math.clamp(Alalpha, minAlpha, maxAlpha)
  local AimCameraRotationEnd = {
    math.lerp(CameraRotation[1] or 0, FinalCameraRotation[1] or 0, Alalpha) or 0,
    math.lerp(CameraRotation[2] or 0, FinalCameraRotation[2] or 0, Alalpha) or 0,
    math.lerp(CameraRotation[3] or 0, FinalCameraRotation[3] or 0, Alalpha) or 0
  }
  DebugPrint("yklua CalculatorCameraRotationbyResolution Aspectratio:" .. (Aspectratio or "nil") .. " Alalpha:" .. (Alalpha or "nil") .. "resolution X:" .. (width or "nil") .. " Y:" .. (height or "nil"))
  return AimCameraRotationEnd
end

function BP_UIManagerComponent_C:TweenToMoveCamera(Camera, EndPosition)
  if not IsValid(Camera) then
    return
  end
  if self.UINpcCameraHandle then
    ULTweenBPLibrary.KillIfIsTweening(self, self.UINpcCameraHandle)
  end
  local StartPosition = Camera.RelativeLocation
  self.UINpcCameraHandle = ULTweenBPLibrary.Vector3To(self, {
    self,
    function(_, Value)
      Camera:K2_SetRelativeLocation(Value, false, nil, false)
    end
  }, StartPosition, EndPosition, 0.5, 0, 17)
end

function BP_UIManagerComponent_C:SetTargetActorState(IsLoaded, TargetActor, ReasonStr, IsHaveInOutAnim)
  if IsValid(TargetActor) and not IsHaveInOutAnim then
    CommonUtils:SetActorTickableWhenPaused(TargetActor, IsLoaded)
    if TargetActor.MeleeWeapon then
      CommonUtils:SetActorTickableWhenPaused(TargetActor.MeleeWeapon, IsLoaded)
    end
    if TargetActor.RangedWeapon then
      CommonUtils:SetActorTickableWhenPaused(TargetActor.RangedWeapon, IsLoaded)
    end
    if TargetActor.UltraWeapon then
      CommonUtils:SetActorTickableWhenPaused(TargetActor.UltraWeapon, IsLoaded)
    end
    if type(TargetActor.SetEmoIdleEnabled) == "function" then
      TargetActor:SetEmoIdleEnabled(not IsLoaded)
    end
    if "function" == type(TargetActor.KawaiiSwitch) then
      TargetActor:KawaiiSwitch(IsLoaded)
    end
    TargetActor:SetActorHiddenInGame(not IsLoaded)
  end
end

function BP_UIManagerComponent_C:RegisterBattleShortCutHudKey(ShortCutKeyHud)
  DebugPrint("RegisterBattleShortCutHudKey:" .. tostring(ShortCutKeyHud))
  if nil == ShortCutKeyHud then
    return
  end
  self.ShortCutHudKeys[ShortCutKeyHud] = true
end

function BP_UIManagerComponent_C:UnRegisterBattleShortCutHudKey(ShortCutKeyHud)
  DebugPrint("UnRegisterBattleShortCutHudKey:" .. tostring(ShortCutKeyHud))
  if nil == ShortCutKeyHud then
    return
  end
  self.ShortCutHudKeys[ShortCutKeyHud] = nil
end

function BP_UIManagerComponent_C:SetBattleShortCutHudKeysHidden(bHidden)
  if bHidden then
    for KeyHud, _ in pairs(self.ShortCutHudKeys) do
      if IsValid(KeyHud) then
        KeyHud:SetVisibility(UE4.ESlateVisibility.Hidden)
      end
    end
  else
    for KeyHud, _ in pairs(self.ShortCutHudKeys) do
      if IsValid(KeyHud) then
        KeyHud:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
      end
    end
  end
end

function BP_UIManagerComponent_C:HideAllComponentUI(IsHide, Tag, CompName)
  if "Billboard" == CompName or nil == CompName then
    DebugPrint("BP_UIManagerComponent_C:HideAllComponentUI SetIsForbidenShowBloodUI", IsHide, Tag)
    UE4.UMainBar.SetIsForbidenShowBloodUI(IsHide)
  end
  for Eid, WidgetInfo in pairs(self.WidgetComponentList) do
    for WidgetName, WidgetComp in pairs(WidgetInfo) do
      if CompName and "" ~= CompName and CompName ~= WidgetName then
      elseif IsValid(WidgetComp) then
        local Widget = WidgetComp:GetWidget()
        if "Billboard" == WidgetName and not IsHide and Widget and (Widget:Cast(UMainBar) or Widget:Cast(UHUD_ToughnessBar)) then
        elseif type(WidgetComp.SetWidgetHiddenByTag) == "function" then
          WidgetComp:SetWidgetHiddenByTag(IsHide, Tag)
        elseif Widget then
          if IsHide then
            Widget:Hide(Tag)
          else
            Widget:Show(Tag)
          end
        end
      end
    end
  end
  EventManager:FireEvent(EventID.OnHideAllComponentUI, IsHide, Tag)
end

function BP_UIManagerComponent_C:PlayScreenEffectAnim(BPPath, EffectName, AnimInfoList)
  local ScreenEffectUI = self:LoadUI(BPPath, EffectName, UIConst.ZORDER_SCREEN_EFFECT)
  if nil == ScreenEffectUI then
    return
  end
  ScreenEffectUI:Show()
  if #AnimInfoList > 1 then
    if not ScreenEffectUI:IsAnimationPlaying(ScreenEffectUI[AnimInfoList[1].AnimName]) and not ScreenEffectUI:IsAnimationPlaying(ScreenEffectUI[AnimInfoList[2].AnimName]) then
      local function PlayAnimFinished(EffectPanelUI)
        if IsValid(EffectPanelUI) then
          EffectPanelUI:PlayAnimation(EffectPanelUI[AnimInfoList[2].AnimName], AnimInfoList[2].StartTime, AnimInfoList[2].LoopNums)
        end
      end
      
      ScreenEffectUI:BindToAnimationFinished(ScreenEffectUI[AnimInfoList[1].AnimName], {ScreenEffectUI, PlayAnimFinished})
      ScreenEffectUI:PlayAnimation(ScreenEffectUI[AnimInfoList[1].AnimName], AnimInfoList[1].StartTime, AnimInfoList[1].LoopNums)
    end
  else
    local AnimInfo = AnimInfoList[1]
    if not ScreenEffectUI:IsAnimationPlaying(ScreenEffectUI[AnimInfo.AnimName]) then
      ScreenEffectUI:PlayAnimation(ScreenEffectUI[AnimInfo.AnimName], AnimInfo.StartTime, AnimInfo.LoopNums)
    end
  end
  return ScreenEffectUI
end

function BP_UIManagerComponent_C:CheckNeedExitUIMode(ExceptUI)
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  local TalkContext = GameInstance:TryGetTalkContext()
  if TalkContext and TalkContext:HasHiddenGameUI() then
    return false
  end
  local allUI = self.UIInstances:ToTable()
  for _, widget in pairs(allUI) do
    if widget.IsInUIMode and widget ~= ExceptUI and (widget:GetParent() or widget:IsInViewport()) then
      return false
    end
  end
  return true
end

function BP_UIManagerComponent_C:GetTopUIModeUI(ExceptUI)
  local allUI = self.UIInstances:ToTable()
  local ZOrder = -10000
  local TopWidget
  for _, widget in pairs(allUI) do
    if widget.IsInUIMode and widget ~= ExceptUI and (widget:GetParent() or widget:IsInViewport()) then
      local CurZOeder = widget:GetZOrder()
      if ZOrder <= CurZOeder then
        ZOrder = CurZOeder
        TopWidget = widget
      end
    end
  end
  return TopWidget
end

function BP_UIManagerComponent_C:SetPauseWorldRenderingSwitch(UIName, bOpen)
  if bOpen then
    self.AllNotRenderWorldUI[UIName] = 1
    if UE4.UGameplayStatics.GetEnableWorldRendering(self) then
      UE4.UGameplayStatics.SetEnableWorldRendering(self, false)
    end
  else
    self.AllNotRenderWorldUI[UIName] = nil
    if IsEmptyTable(self.AllNotRenderWorldUI) then
      UE4.UGameplayStatics.SetEnableWorldRendering(self, true)
    end
  end
end

function BP_UIManagerComponent_C:ShowBossBattleOpenTitle(bIsShow)
  local BossBattleOpenUI = self:GetUIObj("HardBossBattleOpen")
  if BossBattleOpenUI then
    BossBattleOpenUI:ShowHardBossTitle(bIsShow)
  else
    DebugPrint("\230\137\190\228\184\141\229\136\176Boss\230\136\152\229\188\128\230\136\152UI")
  end
end

function BP_UIManagerComponent_C:RecordShowInStoryConfig(UIConfig, UIName)
  self.ShowInStoryUINames = self.ShowInStoryUINames or {}
  if UIConfig.ShowInStory then
    self.ShowInStoryUINames[UIName] = UIName
  end
end

function BP_UIManagerComponent_C:GetShowInStoryUINames()
  return self.ShowInStoryUINames or {}
end

function BP_UIManagerComponent_C:PlayBattleButtonPhoneVX(SkillName, IsClose)
  local Widget = self:GetUIObj("BattleMain")
  if not Widget then
    print(_G.LogTag, "UIManager get widget BattleMain failed")
    return
  end
  Widget = Widget.Char_Skill
  if CommonUtils.GetDeviceTypeByPlatformName(self) == "Mobile" then
    Widget.Jump:PlayVX(SkillName, IsClose)
  end
end

function BP_UIManagerComponent_C:LoadBossSkillTipsUI(BossSkillToastId)
  local BossSkillToastConfig = DataMgr.BossSkillToast[BossSkillToastId]
  local TipsStyle = BossSkillToastConfig.TipsStyle or "Common"
  TipsStyle = string.lower(TipsStyle)
  local UIName
  if "common" == TipsStyle then
    UIName = "BossSkillToast"
  else
    UIName = "SpecialBossSkillToast"
  end
  local BossSkillTipsUI = self:GetUIObj(UIName)
  if BossSkillTipsUI then
    BossSkillTipsUI:Close()
  end
  return self:LoadUINew(UIName, BossSkillToastId)
end

function BP_UIManagerComponent_C:GetArmoryUIObj()
  return self:GetUI("ArmoryDetail") or self:GetUI("ArmoryMain")
end

function BP_UIManagerComponent_C:ShowDispatchTip(DispatchId)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  local RegionId = DataMgr.Dispatch[DispatchId].RegionId
  local Condition = DataMgr.Region[RegionId].RegionDispCondition
  local Check = ConditionUtils.CheckCondition(Avatar, Condition)
  if false == Check then
    DebugPrint("\228\186\139\228\187\182\230\137\128\229\156\168\229\140\186\229\159\159\230\156\170\232\167\163\233\148\129")
    return
  end
  local DispatchUIId = DataMgr.Dispatch[DispatchId].DispatchUIId
  local DispatchName = DataMgr.DispatchUI[DispatchUIId].DispatchName
  self:AddTimer(1.8, function()
    local Text = string.format(GText("UI_Dispatch_Toast_Unlock"), "\227\128\144" .. GText(DispatchName) .. "\227\128\145")
    UIManager(self):ShowUITip(UIConst.Tip_CommonTop, Text)
    DebugPrint("lkkkShowDispatchTip ", DispatchId)
  end, false, 0, nil, false)
end

function BP_UIManagerComponent_C:LaunchAfterLoadingMgr()
  DebugPrint(WarningTag, "UIManager.AfterLoadingMgr, \229\144\175\229\138\168\231\138\182\230\128\129\230\156\186")
  self:DestroyAfterLoadingMgr()
  local AfterLoadingMgr = require("BluePrints.UI.Common.AfterLoadingMgr")
  self.AfterLoadingMgr = AfterLoadingMgr.New()
  EventManager:AddEvent(EventID.OnGuideEnd, self.AfterLoadingMgr, function(_, GuidId)
    self.AfterLoadingMgr.bGuideEndPending = true
    self:TryResumeAfterLoadingMgr({
      "TriggerGuide",
      "MainLineQuest",
      "DynamicQuest"
    })
  end)
  self.AfterLoadingMgr:Continue()
end

function BP_UIManagerComponent_C:DestroyAfterLoadingMgr()
  if self.AfterLoadingMgr and not self.AfterLoadingMgr:IsEnd() then
    DebugPrint(WarningTag, "UIManager.AfterLoadingMgr, \229\188\186\229\136\182\230\184\133\231\144\134\230\142\137\228\184\138\230\172\161\230\178\161\230\137\167\232\161\140\229\174\140\231\154\132\231\138\182\230\128\129\230\156\186")
  end
  if self.AfterLoadingMgr then
    EventManager:RemoveEvent(EventID.OnGuideEnd, self.AfterLoadingMgr)
  end
  self.AfterLoadingMgr = nil
end

function BP_UIManagerComponent_C:TryPauseAfterLoadingMgr(PauseAfterLoadingState)
  if not self.AfterLoadingMgr then
    return
  end
  for _, State in ipairs(PauseAfterLoadingState) do
    if self.AfterLoadingMgr:IsCurrentState(State) then
      DebugPrint(WarningTag, "UIManager.AfterLoadingMgr, UI\230\137\147\229\188\128\232\167\166\229\143\145\231\187\167\231\187\173\231\138\182\230\128\129\230\156\186\230\154\130\229\129\156")
      self.AfterLoadingMgr:Pause()
      return
    end
  end
end

function BP_UIManagerComponent_C:FallbackAfterLoadingMgr()
  if not self.AfterLoadingMgr then
    return
  end
  if self.AfterLoadingMgr.bPause then
    return
  end
  DebugPrint(WarningTag, "UIManager.AfterLoadingMgr, \228\191\157\229\186\149\231\187\167\231\187\173\230\137\167\232\161\140\231\138\182\230\128\129\230\156\186\239\188\140\233\129\191\229\133\141\229\141\161\228\189\143")
  self.AfterLoadingMgr:Fallback()
end

function BP_UIManagerComponent_C:TryResumeAfterLoadingMgr(PauseAfterLoadingState)
  if not self.AfterLoadingMgr then
    return
  end
  for _, State in ipairs(PauseAfterLoadingState) do
    if self.AfterLoadingMgr:IsCurrentState(State) then
      self:AddTimer(0.01, function()
        if self.AfterLoadingMgr and not self.AfterLoadingMgr:IsEnd() then
          DebugPrint(WarningTag, "UIManager.AfterLoadingMgr, UI\229\133\179\233\151\173\232\167\166\229\143\145\231\187\167\231\187\173\230\137\167\232\161\140\231\138\182\230\128\129\230\156\186")
          self.AfterLoadingMgr:Continue()
        end
        return
      end, false, 0, State)
      return
    end
  end
end

function BP_UIManagerComponent_C:AddTimer(Interval, Func, IsLoop, Delay, Key, IsRealTime, ...)
  if nil == IsRealTime then
    IsRealTime = true
  end
  return BP_UIManagerComponent_C.Super.AddTimer(self, Interval, Func, IsLoop, Delay, Key, IsRealTime, ...)
end

function BP_UIManagerComponent_C:SetUIPauseGame(UIName, IsPause)
  if not self.UIPauseGameMap then
    self.UIPauseGameMap = {}
  end
  self.UIPauseGameMap[UIName] = IsPause and true or nil
end

function BP_UIManagerComponent_C:IsUIPauseGame()
  if not self.UIPauseGameMap then
    return false
  end
  local Num = CommonUtils.TableLength(self.UIPauseGameMap)
  return Num > 0
end

function BP_UIManagerComponent_C:NotifyClientShowDungeonToast(Color)
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  UE4.UGameplayStatics.GetGameMode():NotifyClientShowDungeonToast("AvailablePet_Empty", 1.0, EToastType.Common, Color or EToastColor.Yellow)
end

function BP_UIManagerComponent_C:LoadTitleFrameWidget(TitleFrameID)
  local TitleConfig = DataMgr.TitleFrame[TitleFrameID]
  if not TitleConfig then
    ScreenPrint("\231\167\176\229\143\183\229\138\160\232\189\189\229\164\177\232\180\165\239\188\154TitleFrame \232\161\168\229\134\133\230\178\161\230\156\137\233\133\141\231\189\174TitleFrameID=" .. TitleFrameID or "\231\169\186")
    return
  end
  local BPPath = TitleConfig.FramePath
  if not BPPath then
    ScreenPrint("\231\167\176\229\143\183\229\138\160\232\189\189\229\164\177\232\180\165\239\188\154TitleFrame \232\161\168\229\134\133\230\178\161\230\156\137\233\133\141\231\189\174\232\181\132\230\186\144\229\156\176\229\157\128\239\188\140\229\133\136\231\148\168\233\187\152\232\174\164\231\154\132=" .. TitleFrameID or "\231\169\186")
    BPPath = "WidgetBlueprint'/Game/UI/WBP/PersonalInfo/Widget/Title/Title/WBP_PersonalInfo_Title_01.WBP_PersonalInfo_Title_01'"
  end
  local Widget = self:CreateWidget(BPPath, false)
  return Widget
end

function BP_UIManagerComponent_C:GetCurrentWindowSize()
  return GWorld.GameInstance:GetSceneManager():GetWindowSize()
end

function BP_UIManagerComponent_C:AddFlow(WidgetName, Flow)
  self.FlowList[WidgetName] = Flow
  DebugPrint("WXT UIManagerComponent_C:AddFlow", WidgetName)
end

function BP_UIManagerComponent_C:TryOpenSystem(source)
  local currentFrame = UKismetSystemLibrary.GetFrameCount()
  if self.SystemOpenFrameFlag ~= currentFrame and self.SystemOpenFrameFlag ~= currentFrame - 1 then
    self.SystemOpenFrameFlag = currentFrame
    return true
  end
  DebugPrint("\233\152\178\230\173\162\229\144\140\228\184\128\229\184\167\230\137\147\229\188\128\229\164\154\228\184\170\231\179\187\231\187\159:", "\230\157\165\230\186\144:", source, "\229\184\167\229\143\183:", currentFrame)
  return false
end

function BP_UIManagerComponent_C:InitGlobalVersionDisplay()
  if UE.URuntimeCommonFunctionLibrary.IsDistribution() then
    return
  end
  local bpPath = "WidgetBlueprint'/Game/UI/WBP/Battle/Widget/WBP_Battle_Version.WBP_Battle_Version'"
  local versionWidget = self:CreateWidget(bpPath, true, 999)
  if versionWidget then
    self.GlobalVersionWidget = versionWidget
    versionWidget:InitVersionDisplay()
  end
end

function BP_UIManagerComponent_C:ShowGlobalVersion()
  if self.GlobalVersionWidget then
    self.GlobalVersionWidget:Show()
  end
end

function BP_UIManagerComponent_C:HideGlobalVersion()
  if self.GlobalVersionWidget then
    self.GlobalVersionWidget:Hide()
  end
end

return BP_UIManagerComponent_C
