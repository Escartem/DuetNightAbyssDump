require("UnLua")
local ArmoryUtils = require("BluePrints.UI.WBP.Armory.ArmoryUtils")
local ActorController = require("BluePrints.UI.WBP.Armory.ActorController.Armory_ActorController")
local WeaponModel = require("BluePrints.Common.MVC.Model.WeaponModel")
local UIUtils = require("Utils.UIUtils")
local Handled = UE4.UWidgetBlueprintLibrary.Handled()
local M = Class("BluePrints.UI.BP_UIState_C")

function M:Construct()
  self.Loaded = false
  M.Super.Construct(self)
  self:CreateConstInfos()
  self:SetVisibility(UIConst.VisibilityOp.Visible)
  self.TextBlock_Name:SetText("")
  self.EMListView_SubTab:SetScrollbarVisibility(UIConst.VisibilityOp.Collapsed)
  self.EMListView_SubTab:DisableScroll(true)
  self.WaitForCloseEventCount = 0
  self.NoneTab = {Name = "None"}
  self.CurMainTab = self.NoneTab
  self.CurSubTab = self.NoneTab
  self.Panel_SubUI:ClearChildren()
  self.SubUIs = {}
  self.SelectedContents = {}
  self.ComponentReceivedEvent = {}
  self:UnbindFromAnimationStarted(self.Auto_Out, {
    self,
    self.OnOutAnimStarted
  })
  self:BindToAnimationStarted(self.Auto_Out, {
    self,
    self.OnOutAnimStarted
  })
  self:UnbindFromAnimationFinished(self.Auto_Out, {
    self,
    self.OnOutAnimFinished
  })
  self:BindToAnimationFinished(self.Auto_Out, {
    self,
    self.OnOutAnimFinished
  })
  self:UnbindFromAnimationFinished(self.RoleList_In, {
    self,
    self.OnRoleListInAnimFinished
  })
  self:BindToAnimationFinished(self.RoleList_In, {
    self,
    self.OnRoleListInAnimFinished
  })
  self:UnbindFromAnimationStarted(self.RoleList_In, {
    self,
    self.OnRoleListInAnimStarted
  })
  self:BindToAnimationStarted(self.RoleList_In, {
    self,
    self.OnRoleListInAnimStarted
  })
  self.EMListView_SubTab.BP_OnItemClicked:Clear()
  self.EMListView_SubTab.BP_OnItemClicked:Add(self, self.OnSubTabItemClicked)
  self.EMListView_Role.BP_OnItemClicked:Clear()
  self.EMListView_Role.BP_OnItemClicked:Add(self, function(self, Content)
    self:OnRoleListItemClicked(Content)
  end)
  self.EMListView_Role.BP_OnEntryInitialized:Clear()
  self.EMListView_Role.BP_OnEntryInitialized:Add(self, self.OnRoleListEntryInitialized)
  self.Btn_Edit:BindEventOnClicked(self, self.OnEditBtnClicked)
  self.Btn_Locked:BindEventOnClicked(self, self.OnLockBtnClicked)
  self.Btn_Locked:TryOverrideSoundFunc(function()
    AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_small", nil, nil)
  end)
  self.Button_Element.OnHovered:Add(self, self.OnBtnElementHovered)
  self.Button_Element.OnUnhovered:Add(self, self.OnBtnElementUnhovered)
  self.Image_Click.OnMouseButtonDownEvent:Unbind()
  self.Image_Click.OnMouseButtonDownEvent:Bind(self, self.On_Image_Click_MouseButtonDown)
  if GWorld.GameInstance then
    GWorld.GameInstance:SetHighFrequencyMemoryCheckGCEnabled(true, "ArmoryMain")
  end
end

function M:GetDesiredFocusTargetInfo(Info)
  Info.Widget = self
end

function M:InitDispatcher()
  self:AddDispatcher(EventID.OnArmoryPreviewModeStateChanged, self, self.OnPreviewModeStateChanged)
  if self.IsPreviewMode then
    return
  end
  self:AddDispatcher(EventID.OnArmoryTargetStateChanged, self, self.OnArmoryTargetStateChanged)
  self:AddDispatcher(EventID.OnUpdateBagItem, self, self.OnBagItemLockedOrUnlocked)
  self:ComponentInitDispatcher()
end

function M:OnArmoryTargetStateChanged(...)
  self:CallFunctionByName(self.CurMainTab.Name .. "Main_OnArmoryTargetStateChanged", ...)
end

function M:ComponentInitDispatcher()
end

function M:On_Image_Click_MouseButtonDown(MyGeometry, MouseEvent)
  return self:OnPointerDown(MyGeometry, MouseEvent)
end

function M:OnMouseWheel(MyGeometry, MouseEvent)
  if self.ComponentReceivedEvent.WheelScroll then
    return Handled
  end
  return self:OnMouseWheelScroll(MyGeometry, MouseEvent)
end

function M:OnMouseButtonUp(MyGeometry, MouseEvent)
  return self:OnPointerUp(MyGeometry, MouseEvent)
end

function M:OnMouseMove(MyGeometry, MouseEvent)
  return self:OnPointerMove(MyGeometry, MouseEvent)
end

function M:OnTouchEnded(MyGeometry, InTouchEvent)
  return self:OnPointerUp(MyGeometry, InTouchEvent)
end

function M:OnTouchMoved(MyGeometry, InTouchEvent)
  return self:OnPointerMove(MyGeometry, InTouchEvent)
end

function M:OnMouseCaptureLost()
  self:OnPointerCaptureLost()
end

function M:OnEditBtnClicked()
  self:CallFunctionByName(self.CurMainTab.Name .. "Main_OnEditBtnClicked")
end

function M:OnLockBtnClicked()
  self:CallFunctionByName(self.CurMainTab.Name .. "Main_OnLockBtnClicked")
end

function M:OnBtnElementHovered()
  self:ShowElementTips(true)
end

function M:OnBtnElementUnhovered()
  self:ShowElementTips(false)
end

function M:OnBackgroundClicked()
  self:CallFunctionByName(self.CurMainTab.Name .. "Main_OnBackgroundClicked")
  EventManager:FireEvent(EventID.OnMenuClose)
end

function M:CallFunctionByName(FunctionName, ...)
  if self[FunctionName] then
    return self[FunctionName](self, ...)
  end
end

function M:InitUIInfo(Name, IsInUIMode, EventList, Params)
  M.Super.InitUIInfo(self, Name, IsInUIMode, EventList, Params)
  self.Loaded = false
  Params = Params or {}
  if CommonUtils:IfExistSystemGuideUI(self) and DataMgr.SystemGuide[SystemGuideManager.RunningId] then
    local Data = DataMgr.SystemGuide[SystemGuideManager.RunningId].GuideInfo
    if Data then
      for key, value in pairs(Data) do
        Params[key] = value
      end
    end
  end
  self.Params = Params
  self.OnCloseDelegate = Params.OnCloseDelegate
  self.bHideSquadBuildBtn = Params.bHideSquadBuildBtn
  self.bFromArchive = Params.bFromArchive
  if self.bFromArchive then
    self.ReddotFrom = "Archive"
  end
  self.DoNotSort = Params.DoNotSort
  self.bHideBoxBtn = Params.bHideBoxBtn
  if Params.Title then
    self.MainTabsStyle.TitleName = Params.Title
  end
  local MainTabName_JumpTo, SubTabName_JumpTo = Params.MainTabName, Params.SubTabName
  ArmoryUtils:SetIsPreviewMode(false)
  self.IsPreviewMode = false
  self.IsCharacterTrialMode = Params.IsCharacterTrialMode
  local PreviewModeLoadFailed = false
  if Params.PreviewCharIds or Params.PreviewCharInfos or Params.PreviewWeaponIds or Params.PreviewWeaponInfos or Params.PreviewPetIds or Params.PreviewPetInfos then
    try({
      exec = function()
        ArmoryUtils:CreateDummyAvatar({
          CharIds = Params.PreviewCharIds,
          WeaponIds = Params.PreviewWeaponIds,
          CharInfos = Params.PreviewCharInfos,
          WeaponInfos = Params.PreviewWeaponInfos,
          UWeaponInfos = Params.PreviewUWeaponInfos,
          MeleeWeapon = Params.MeleeWeapon,
          RangedWeapon = Params.RangedWeapon,
          PetIds = Params.PreviewPetIds,
          PetInfos = Params.PreviewPetInfos
        })
        ArmoryUtils:SetIsPreviewMode(true)
        if ArmoryUtils:HasAvatar(ArmoryUtils.PreviewTargetStates.Custom) then
          ArmoryUtils:SwitchPreviewTargetState(ArmoryUtils.PreviewTargetStates.Custom)
          self.bNeedPreviewSwitcher = false
        elseif ArmoryUtils:HasAvatar(ArmoryUtils.PreviewTargetStates.Prime) then
          ArmoryUtils:SwitchPreviewTargetState(ArmoryUtils.PreviewTargetStates.Prime)
          self.bNeedPreviewSwitcher = true
        else
          ArmoryUtils:SetIsPreviewMode(false)
          ArmoryUtils:DestroyDummyAvatar()
          return
        end
        self.IsPreviewMode = true
        local Avatar = ArmoryUtils:GetAvatar()
        if not MainTabName_JumpTo then
          if next(Avatar.Chars) then
            MainTabName_JumpTo = ArmoryUtils.ArmoryMainTabNames.Char
          elseif next(Avatar.Weapons) then
            MainTabName_JumpTo = ArmoryUtils.ArmoryMainTabNames.Weapon
          elseif next(Avatar.Pets) then
            MainTabName_JumpTo = ArmoryUtils.ArmoryMainTabNames.Pet
          end
        end
        DebugPrint("CY@ ArmoryPreviewMode")
      end,
      catch = function(err)
        PreviewModeLoadFailed = true
        local trace = debug.traceback()
        err = err or ""
        DebugPrint("Error: CY@ \233\162\132\232\167\136\230\168\161\229\188\143Avatar\229\136\155\229\187\186\229\164\177\232\180\165!\n" .. err .. "\n" .. trace)
      end
    })
  end
  if PreviewModeLoadFailed then
    self.LoadFailed = true
    return
  end
  local Avatar = ArmoryUtils:GetAvatar()
  if not Avatar then
    self.LoadFailed = true
    return
  end
  if self.DoNotSort then
    self:RecordInitialOrder()
  end
  AudioManager(self):PlayUISound(self, "event:/ui/armory/open", "ArmoryOpenedSound", nil)
  self.CurrentChar = Avatar.Chars[Avatar.CurrentChar]
  self.ComparedChar = self.CurrentChar or Avatar.Chars[1]
  local Type = MainTabName_JumpTo
  if self.IsPreviewMode then
    if not Params.Title then
      self.MainTabsStyle.TitleName = GText("UI_Preview_Title")
    end
    if not Type then
      self.LoadFailed = true
      return
    end
  end
  Type = Type or ArmoryUtils.ArmoryMainTabNames.Char
  local PreprocessParams = {
    SelectedTargetUuid = Params.SelectedTargetUuid,
    SelectedTargetId = Params.SelectedTargetId,
    SelectedTargetIndex = Params.SelectedTargetIndex
  }
  if self.ComparedChar and Type ~= ArmoryUtils.ArmoryMainTabNames.Char then
    self:CallFunctionByName("CharMain_PreprocessContents", nil, PreprocessParams)
  end
  self:CallFunctionByName(Type .. "Main_PreprocessContents", Type, PreprocessParams)
  self.ActorController = ActorController:New({
    ViewUI = self,
    IsPreviewMode = self.IsPreviewMode,
    IsCharacterTrialMode = self.IsCharacterTrialMode,
    EPreviewSceneType = Params.EPreviewSceneType,
    Char = self.ComparedChar,
    Weapon = self[self.ComparedWeaponName or ""],
    Pet = self.ComparedPet,
    bNeedEndCamera = not Params.bNoEndCamera,
    OnRecorverCameraEnd = {
      Func = self.OnRecorverCameraEnd,
      Obj = self
    },
    OnRecorverCameraStart = {
      Func = self.OnRecorverCameraStart,
      Obj = self
    }
  })
  self.ActorController:OnOpened()
  self.MainTabsStyle.ShowSquadBuildBtn = self:ShouldShowSquadBuildBtn()
  self:InitMainTabsStyle(self.MainTabsStyle)
  self.Tab_Arm:BindEventOnTabSelected(self, self.OnMainTabClicked)
  self:CreateMainTabs({
    Char = self.ComparedChar
  })
  self:UpdateMainTabs(self.MainTabs)
  self:JumpToTab(MainTabName_JumpTo or self.MainTabs[1].Name, SubTabName_JumpTo)
  self:PlayInAnim()
  self:AddMainTabReddotListen()
  self:InitDispatcher()
  self.Loaded = true
  self:AddTimer(0.1, function()
    local SubPageName = Params.SubPageName
    if SubPageName then
      self:JumpToSubPage(SubPageName)
    end
  end)
end

function M:JumpToSubPage(...)
  self:CallFunctionByName(self.CurMainTab.Name .. "Main_JumpToSubPage", ...)
end

function M:RecordInitialOrder()
  local Avatar = ArmoryUtils:GetAvatar()
  
  local function InsertInitialOrderUuids(InitialOrderTable, InfoArray, CreateInfo2Uuids)
    for index, value in ipairs(InfoArray) do
      table.insert(InitialOrderTable, CreateInfo2Uuids[value])
    end
  end
  
  local Params = self.Params
  if Params.PreviewCharIds and #Params.PreviewCharIds > 0 then
    self.InitialOrderCharUuids = {}
    InsertInitialOrderUuids(self.InitialOrderCharUuids, Params.PreviewCharIds, Avatar.CreateInfo2Uuids.Chars)
  end
  if Params.PreviewWeaponIds and #Params.PreviewWeaponIds > 0 then
    self.InitialOrderWeaponUuids = {}
    InsertInitialOrderUuids(self.InitialOrderWeaponUuids, Params.PreviewWeaponIds, Avatar.CreateInfo2Uuids.Weapons)
  end
  if Params.PreviewPetIds and #Params.PreviewPetIds > 0 then
    self.InitialOrderPetUniqueId = {}
    InsertInitialOrderUuids(self.InitialOrderPetUniqueId, Params.PreviewPetIds, Avatar.CreateInfo2Uuids.Pets)
  end
  if Params.PreviewCharInfos and #Params.PreviewCharInfos > 0 then
    self.InitialOrderCharUuids = {}
    InsertInitialOrderUuids(self.InitialOrderCharUuids, Params.PreviewCharInfos, Avatar.CreateInfo2Uuids.Chars)
  end
  if Params.PreviewWeaponInfos and #Params.PreviewWeaponInfos > 0 then
    self.InitialOrderWeaponUuids = {}
    InsertInitialOrderUuids(self.InitialOrderWeaponUuids, Params.PreviewWeaponInfos, Avatar.CreateInfo2Uuids.Weapons)
  end
  if Params.PreviewPetInfos and #Params.PreviewPetInfos > 0 then
    self.InitialOrderPetUniqueId = {}
    InsertInitialOrderUuids(self.InitialOrderPetUniqueId, Params.PreviewPetInfos, Avatar.CreateInfo2Uuids.Pets)
  end
end

function M:ShouldShowSquadBuildBtn()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  local ConditionInId = DataMgr.UIUnlockRule.Squad and DataMgr.UIUnlockRule.Squad.ConditionId or 4110
  return not self.bHideSquadBuildBtn and not self.IsPreviewMode and ConditionUtils.CheckCondition(Avatar, ConditionInId)
end

function M:CreateMainTabs(Params)
  self.MainTabs = self:CreateTabInfos(self:GetTabsConfigData(), Params)
  self:MappingMainTabIdx()
end

function M:MappingMainTabIdx()
  self.MainTabName2Idx = {}
  for index, Tab in ipairs(self.MainTabs) do
    self.MainTabName2Idx[Tab.Name] = index
  end
end

function M:MappingSubTabIdx()
  self.SubTabName2Idx = {}
  for index, Tab in ipairs(self.SubTabs) do
    self.SubTabName2Idx[Tab.Name] = index
  end
end

function M:JumpToTab(MainTabName, SubTabName)
  self.SubTabName_JumpTo = SubTabName
  if #self.MainTabs > 0 and MainTabName then
    local TabIdxToSelect, TabToSelecte
    local TabIdx = self.MainTabName2Idx[MainTabName]
    local MainTab = self.MainTabs[TabIdx]
    if MainTab then
      TabIdxToSelect = TabIdx
      TabToSelecte = MainTab
    end
    if TabIdxToSelect then
      if self.CurMainTab and TabToSelecte.Name == self.CurMainTab.Name then
        self:SelectMainTab(TabToSelecte)
      else
        self.Tab_Arm:SelectTab(TabIdxToSelect or 1)
      end
    end
  end
end

function M:OnLoaded(...)
  M.Super.OnLoaded(self, ...)
  self:BlockAllUIInput(false)
  if self.LoadFailed then
    self:Close()
    return
  end
  self.Loaded = true
end

function M:CreateTabInfos(TabsConfig, Params)
  Params = Params or {}
  local Char = Params.Char
  local ResultTabs = {}
  local Avatar = ArmoryUtils:GetAvatar()
  local TabIndexes = TabsConfig.TabIndexes
  local TabMap = TabsConfig.Tabs
  local AddTabId = 0
  for Idx, TabName in ipairs(TabIndexes) do
    local Tab = TabMap[TabName]
    if Tab.CreateFunc then
      local Tabs = Tab.CreateFunc(Avatar, Params)
      if Tabs then
        for _, value in ipairs(Tabs) do
          local IsUnlocked, LockReasonText = value.CheckIsUnlocked(Avatar, Char, Params)
          if IsUnlocked then
            table.insert(ResultTabs, self:CreateTabContent(value, Idx + AddTabId, Params))
            AddTabId = AddTabId + 1
          end
        end
      end
    else
      local IsUnlocked, LockReasonText = Tab.CheckIsUnlocked(Avatar, Char, Params)
      if IsUnlocked then
        table.insert(ResultTabs, self:CreateTabContent(Tab, Idx + AddTabId, Params))
      end
    end
  end
  return ResultTabs
end

function M:CreateTabContent(Tab, TabId, Params)
  local Obj
  if Params.bCreatedWidthClass then
    Obj = NewObject(UIUtils.GetCommonItemContentClass())
  else
    Obj = {}
  end
  Obj.Owner = self
  Obj.TabId = TabId
  Obj.Name = Tab.Name
  Obj.Type = Tab.Type
  Obj.Tag = Tab.Tag
  Obj.Text = Tab.Text
  Obj.IconPath = Tab.IconPath
  if self.IsPC then
    Obj.WidgetPath = Tab.PCWidgetPath
  else
    Obj.WidgetPath = Tab.MobileWidgetPath
  end
  if not self.IsPreviewMode then
    Obj.CheckReddot = Tab.CheckReddot
    if Tab.CheckReddot then
      Obj.IsNew, Obj.Upgradeable = Tab.CheckReddot(Params)
    end
  end
  Obj.TabData = Tab
  return Obj
end

function M:InitMainTabsStyle(MainTabsStyle, NoInAnim)
  self.CurrentMainTabsStyle = MainTabsStyle
  self.Tab_Arm:Init(MainTabsStyle, NoInAnim)
end

function M:UpdateMainTabs(MainTabs)
  self.CurrentMainTabsStyle.ForceHideTabs = #MainTabs <= 1
  self.Tab_Arm:UpdateTabs(MainTabs)
end

function M:SelectMainTab(Content)
  self:CallFunctionByName(self.CurMainTab.Name .. "Main_PreMainTabChange")
  self.CurMainTab = Content
  self:CallFunctionByName(Content.Name .. "Main_Init")
end

function M:OnMainTabClicked(Widget, Content)
  if Content == self.CurMainTab then
    return
  end
  self:SelectMainTab(Content)
end

function M:UpdateSubTabs(SubTabs)
  self.EMListView_SubTab:ClearListItems()
  local TabNameToSelect = not self.SubTabName_JumpTo and self.CurSubTab and self.CurSubTab.Name
  local TabTypeToSelect = self.CurSubTab and self.CurSubTab.Type
  self.SubTabName_JumpTo = nil
  local TabToSelect
  for _, Tab in ipairs(SubTabs) do
    local bShouldSelectTab = nil == TabTypeToSelect or TabTypeToSelect and Tab.Type == TabTypeToSelect
    if Tab.Name == TabNameToSelect and bShouldSelectTab then
      Tab.IsSelected = true
      TabToSelect = Tab
    else
      Tab.IsSelected = false
    end
    self.EMListView_SubTab:AddItem(Tab)
  end
  if SubTabs and #SubTabs > 1 then
    self.EMListView_SubTab:SetVisibility(UIConst.VisibilityOp.Visible)
  else
    self.EMListView_SubTab:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  if nil == TabToSelect then
    TabToSelect = SubTabs[1]
    TabToSelect.IsSelected = true
  end
  return TabToSelect
end

function M:CreateAndSelectSubTab(Params)
  local ConstMainTabConfig = self.MainTabs[self.MainTabName2Idx[self.CurMainTab.Name]].TabData
  local _Params = {
    Char = self.ComparedChar,
    bCreatedWidthClass = true
  }
  for key, value in pairs(Params or {}) do
    _Params[key] = value
  end
  self.SubTabs = self:CreateTabInfos(ConstMainTabConfig, _Params)
  self:MappingSubTabIdx()
  local TabToSelect = self:UpdateSubTabs(self.SubTabs)
  self:SelectSubTab(TabToSelect)
end

function M:SelectSubTab(Content)
  if self.CurSubTab then
    self.CurSubTab.IsSelected = false
    if self.CurSubTab.Widget then
      self.CurSubTab.Widget:SetIsSelected(false)
    end
  end
  Content.IsSelected = true
  if Content.Widget then
    Content.Widget:SetIsSelected(true)
  end
  self:CallFunctionByName(self.CurMainTab.Name .. "Main_PreSubTabChange")
  self.CurSubTab = Content
  self:UpdateMontageAndCamera()
  self:InitSubUI()
end

function M:OnSubTabItemClicked(Content)
  if Content == self.CurSubTab then
    return
  end
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_level_02", nil, nil)
  self:SelectSubTab(Content)
end

function M:InitSubUI()
  self:CallFunctionByName(self.CurMainTab.Name .. "Main_InitSubUI")
end

function M:DefaultInitSubUI(Params)
  local SubUIName
  if self.CurMainTab.WidgetPath then
    SubUIName = self.CurMainTab.Name
  else
    SubUIName = self.CurSubTab.Type .. self.CurSubTab.Name
  end
  local SubUI = self.SubUIs[SubUIName]
  if nil == SubUI then
    local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
    local UIManager = GameInstance:GetGameUIManager()
    local WidgetPath = self.CurMainTab.WidgetPath or self.CurSubTab.WidgetPath
    if UIManager and WidgetPath then
      SubUI = UIManager:CreateWidget(WidgetPath, false)
      if SubUI then
        self.Panel_SubUI:AddChild(SubUI)
        local CanvasSlot = SubUI.Slot
        local Anchors = FAnchors()
        Anchors.Minimum = FVector2D(0, 0)
        Anchors.Maximum = FVector2D(1, 1)
        CanvasSlot:SetAnchors(Anchors)
        CanvasSlot:SetOffsets(FMargin(0, 0, 0, 0))
        self.SubUIs[SubUIName] = SubUI
        if (self.CurSubTab.Type == CommonConst.ArmoryType.Weapon or self.CurSubTab.Type == CommonConst.ArmoryType.Char) and self.CurSubTab.Name == ArmoryUtils.ArmorySubTabNames.Attribute then
          self.SubUIs[CommonConst.ArmoryType.Weapon .. self.CurSubTab.Name] = SubUI
          self.SubUIs[CommonConst.ArmoryType.Char .. self.CurSubTab.Name] = SubUI
        end
      end
    end
  end
  DebugPrint("CY@ Armory:InitSubUI " .. (SubUIName or ""))
  self.SubUIs[SubUIName] = SubUI
  if self.CurrentSubUI and SubUI ~= self.CurrentSubUI then
    self.CurrentSubUI:PlayOutAnim()
    UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(self.CurrentSubUI):SetZOrder(0)
  end
  if SubUI and SubUI.Init then
    Params = Params or {}
    self:ModifySubUIInitParams(Params)
    SubUI:Init(Params)
    SubUI:SetVisibility(UIConst.VisibilityOp.Visible)
    SubUI:PlayInAnim()
    UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(SubUI):SetZOrder(1)
    if SubUI:IsVisible() then
      SubUI:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    end
    self.CurrentSubUI = SubUI
  end
end

function M:ModifySubUIInitParams(Params)
  Params.Parent = self
  Params.IsPreviewMode = Params.IsPreviewMode or self.IsPreviewMode
  Params.bNeedPreviewSwitcher = self.bNeedPreviewSwitcher
  Params.IsCharacterTrialMode = self.IsCharacterTrialMode
  Params.bFormPersonalPage = self.Params.bFormPersonalPage
  self:CallFunctionByName(self.CurMainTab.Name .. "Main_ModifySubUIInitParams", Params)
end

function M:InitRoleList(...)
  self:CallFunctionByName(self.CurMainTab.Name .. "Main_InitRoleList", ...)
end

function M:OnRoleListContentCreated(Content)
end

function M:OnRoleListItemClicked(Content)
  if self.ComponentReceivedEvent.OnRoleListItemClicked then
    return
  end
  self:CallFunctionByName(self.CurMainTab.Name .. "Main_OnRoleListItemClicked", Content)
  self.EMListView_Role:BP_ScrollItemIntoView(Content)
end

function M:SelectRoleListItem(Content)
  if self.ComponentReceivedEvent.SelectRoleListItem then
    return
  end
  self:CallFunctionByName(self.CurMainTab.Name .. "Main_SelectRoleListItem", Content)
end

function M:OnRoleListEntryInitialized(Content, Widget)
  if self.ComponentReceivedEvent.OnRoleListEntryInitialized then
    return
  end
  self:CallFunctionByName(self.CurMainTab.Name .. "Main_OnRoleListEntryInitialized", Content, Widget)
end

function M:UpdateResourceInfos(...)
  self:CallFunctionByName(self.CurMainTab.Name .. "Main_UpdateResourceInfos", ...)
end

function M:UpdateBoxReddot(...)
  if self.IsPreviewMode then
    return
  end
  self:CallFunctionByName(self.CurMainTab.Name .. "Main_UpdateBoxReddot", ...)
end

function M:SetStars(StarCount)
  self.ListView_Star:ClearListItems()
  for i = 1, StarCount do
    self.ListView_Star:AddItem(NewObject(UIUtils.GetCommonItemContentClass()))
  end
end

function M:ShowElementTips(IsShow)
  if IsShow then
    self.Stats:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  else
    self.Stats:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

function M:SetAllReddotRead(...)
  self:CallFunctionByName(self.CurMainTab.Name .. "Main_SetAllReddotRead", ...)
end

function M:ReceiveEnterState(StackAction)
  M.Super.ReceiveEnterState(self, StackAction)
  self:SetVisibility(UIConst.VisibilityOp.Visible)
  self.IsSecondaryUI = UIManager(self):StateCount() > 1
  if self.Loaded then
    DebugPrint("CY@ Armory:" .. self.CurMainTab.Name .. "Main_ReceiveEnterState")
    self:CallFunctionByName(self.CurMainTab.Name .. "Main_ReceiveEnterState", StackAction)
    if not self.ReceiveEnterStateNoAnim then
      self:PlayAnimation(self.RoleList_In)
      self:PlayAnimation(self.BG_BackFirst)
    end
  else
    self:BlockAllUIInput(true)
  end
  self.ReceiveEnterStateNoAnim = false
end

function M:ReceiveExitState(StackAction)
  M.Super.ReceiveExitState(self, StackAction)
  self:BlockAllUIInput(false)
end

function M:OnArmoryModClosed(...)
  if self.CurrentChar then
    local Avatar = ArmoryUtils:GetAvatar()
    self.CurrentChar = Avatar.Chars[self.CurrentChar.Uuid]
  end
  if self.ComponentReceivedEvent.OnModClosed then
    return
  end
  self:CallFunctionByName(self.CurMainTab.Name .. "Main_OnArmoryModClosed", ...)
  self:UpdateMontageAndCamera()
end

function M:UpdateMontageAndCamera(Duration)
  self.ActorController:FixedCameraTransTimeOnce(Duration)
  self.ActorController:SetMontageAndCamera(self.CurSubTab.Type, self.CurMainTab.Name, self.CurSubTab.Tag)
end

function M:ResetActorRotation()
  self.ActorController:ResetActorRotation()
end

function M:PlayInAnim()
  self.Tab_Arm:PlayInAnim()
end

function M:OnOutAnimStarted()
  self:ModifyWaitForCloseEventCount(true)
end

function M:OnOutAnimFinished()
  self:ModifyWaitForCloseEventCount(false)
end

function M:OnRoleListInAnimStarted()
end

function M:OnRoleListInAnimFinished()
end

function M:ModifyWaitForCloseEventCount(bIncrease)
  if bIncrease then
    self.WaitForCloseEventCount = self.WaitForCloseEventCount + 1
  else
    self.WaitForCloseEventCount = self.WaitForCloseEventCount - 1
    if self.WaitForCloseEventCount <= 0 then
      self:RealClose()
    end
  end
end

function M:PlayOutAnim()
  AudioManager(self):SetEventSoundParam(self, "ArmoryOpenedSound", {ToEnd = 1})
  for _, value in pairs(self.SubUIs) do
    if value ~= self.CurrentSubUI then
      value:SetVisibility(UIConst.VisibilityOp.Collapsed)
    end
  end
  if self.CurrentSubUI and self.CurrentSubUI.PlayOutAnim then
    self.CurrentSubUI:PlayOutAnim()
  end
  self:StopAnimation(self.RoleList_In)
end

function M:OnBagItemLockedOrUnlocked(...)
  self:CallFunctionByName(self.CurMainTab.Name .. "Main_OnBagItemLockedOrUnlocked", ...)
end

function M:Close()
  self.bRealClosed = false
  self:ModifyWaitForCloseEventCount(true)
  M.Super.Close(self)
  self:BlockAllUIInput(true)
  if self.IsPreviewMode then
    self:ModifyWaitForCloseEventCount(true)
    self:BindToAnimationFinished(self.Auto_Out, {
      self,
      function()
        self:ModifyWaitForCloseEventCount(false)
      end
    })
  elseif not self.IsSecondaryUI then
    local MenuWorld = UIManager(self):GetUIObj(UIConst.MenuWorld)
    if not MenuWorld then
      UIUtils.PlayBattleMainInAnim()
    end
    self:PlayOutAnim()
  end
  self:CallFunctionByName(self.CurMainTab.Name .. "Main_Close")
  self:Component_BeforeClose()
  if self.ActorController and not self.IsPreviewMode then
    self.ActorController:OnClosed()
  end
  self:ModifyWaitForCloseEventCount(false)
end

function M:Component_BeforeClose()
end

function M:OnRecorverCameraStart()
  self:ModifyWaitForCloseEventCount(true)
end

function M:OnRecorverCameraEnd()
  self:ModifyWaitForCloseEventCount(false)
end

function M:OnBackBtnClicked()
  if self.ComponentReceivedEvent.Back then
    return
  end
  self:Close()
end

function M:RealClose()
  if self.WaitForCloseEventCount > 0 then
    return
  end
  if self.bRealClosed then
    return
  end
  self.bRealClosed = true
  self:BlockAllUIInput(false)
  M.Super.RealClose(self)
  if self.OnCloseDelegate and self.OnCloseDelegate[2] then
    self.OnCloseDelegate[2](self.OnCloseDelegate[1], self.OnCloseDelegate[3])
  end
end

function M:Destruct()
  M.Super.Destruct(self)
  if self.ActorController then
    self.ActorController:OnDestruct()
  end
  self:RemoveMainTabReddotListen()
  self:RemoveSubTabReddotListen()
  if self.IsPreviewMode then
    ArmoryUtils:DestroyDummyAvatar()
  end
  if GWorld.GameInstance then
    GWorld.GameInstance:SetHighFrequencyMemoryCheckGCEnabled(false, "ArmoryMain")
  end
end

function M:OnPreviewModeStateChanged()
  if not self.IsPreviewMode then
    return
  end
  if self.ActorController then
    self.ActorController:SetAvatar(ArmoryUtils:GetAvatar())
  end
  self.bRecreateContent = true
  self:CallFunctionByName(self.CurMainTab.Name .. "Main_PreprocessContents")
  self.bRecreateContent = false
  self:CallFunctionByName(self.CurMainTab.Name .. "Main_Init")
end

function M:GetConstTab(MainTabName, SubTabName)
  local MainTabIdx = self.MainTabName2Idx[MainTabName]
  local MainTab = self.MainTabs[MainTabIdx]
  if MainTab then
    if SubTabName and MainTab.TabData.Tabs then
      return MainTab.TabData.Tabs[SubTabName]
    else
      return MainTab.TabData
    end
  end
end

function M:PlayMainTabSound(TabIdx)
  local MainTab = self.MainTabs[TabIdx]
  local SoundPath = self.MainTabSoundPath[MainTab.Name]
  if SoundPath then
    AudioManager(self):PlayUISound(self, SoundPath, nil, nil)
  elseif string.find(MainTab.Name, ArmoryUtils.ArmoryMainTabNames.UWeapon) then
    local Avatar = ArmoryUtils:GetAvatar()
    local Uuid = self.ComparedChar.UWeapon[MainTab.TabData.UWeaponIdx]
    local UWeapon = Uuid and Avatar.UWeapons[Uuid]
    if UWeapon then
      if UWeapon:HasTag(CommonConst.ArmoryTag.Melee) then
        AudioManager(self):PlayUISound(self, self.MainTabSoundPath[CommonConst.ArmoryTag.Melee], nil, nil)
      else
        AudioManager(self):PlayUISound(self, self.MainTabSoundPath[CommonConst.ArmoryTag.Ranged], nil, nil)
      end
    end
  end
end

function M:CreateConstInfos()
  self.MainTabsStyle = {
    TitleName = GText("MAIN_UI_ARMORY"),
    LeftKey = self.MainTabLeftKey,
    RightKey = self.MainTabRightKey,
    Tabs = {},
    DynamicNode = {
      "Back",
      "ResourceBar",
      "BottomKey"
    },
    BottomKeyInfo = {},
    StyleName = self.MainTabStyleName,
    InfoCallback = self.OnInfoClicked,
    BackCallback = self.OnBackBtnClicked,
    OwnerPanel = self
  }
  self.MainTabSoundPath = {
    [ArmoryUtils.ArmoryMainTabNames.Char] = "event:/ui/armory/click_select_role",
    [ArmoryUtils.ArmoryMainTabNames.Melee] = "event:/ui/armory/click_select_weapon",
    [ArmoryUtils.ArmoryMainTabNames.Ranged] = "event:/ui/armory/click_select_gun",
    [ArmoryUtils.ArmoryMainTabNames.Pet] = "event:/ui/common/click_select_pet"
  }
  
  function self.AlwaysReturnTrue()
    return true
  end
  
  self.WeaponGradeSubTab = {
    PCWidgetPath = "WidgetBlueprint'/Game/UI/WBP/Armory/PC/WBP_Armoy_Enhance_P.WBP_Armoy_Enhance_P'",
    MobileWidgetPath = "WidgetBlueprint'/Game/UI/WBP/Armory/Mobile/WBP_Armoy_Enhance_M.WBP_Armoy_Enhance_M'",
    Name = ArmoryUtils.ArmorySubTabNames.Grade,
    Type = CommonConst.ArmoryType.Weapon,
    Tag = CommonConst.ArmoryTag.Grade,
    Text = GText(DataMgr.WeaponTab[2].Text),
    IconPath = DataMgr.WeaponTab[2].IconPath,
    CheckIsUnlocked = function(Avatar, Char, Params)
      if self.Params.bHideWeaponGrade then
        return false
      end
      local Weapon = Params and Params.Weapon
      local CardLevelData = Weapon and DataMgr.WeaponCardLevel[Weapon.WeaponId]
      if CardLevelData and CardLevelData.CardLevelMax then
        return true
      end
    end,
    CheckReddot = function(Params)
      local Weapon = Params.Weapon or self[self.ComparedWeaponName]
      local Count = WeaponModel:GetConsumeWeaponCount(Weapon.Uuid)
      local Data = DataMgr.WeaponCardLevel[Weapon.WeaponId]
      local MaxGradeLevel = Data and Data.CardLevelMax or 0
      return false, Count > 0 and MaxGradeLevel > Weapon.GradeLevel
    end
  }
  self.WeaponAppearanceSubTab = {
    PCWidgetPath = "/Game/UI/WBP/Armory/PC/WBP_Armory_Appearance_P.WBP_Armory_Appearance_P",
    MobileWidgetPath = "/Game/UI/WBP/Armory/Mobile/WBP_Armory_Appearance_M.WBP_Armory_Appearance_M",
    Name = ArmoryUtils.ArmorySubTabNames.Appearance,
    Type = CommonConst.ArmoryType.Weapon,
    Tag = CommonConst.ArmoryTag.Appearance,
    Text = GText(DataMgr.WeaponTab[3].Text),
    IconPath = DataMgr.WeaponTab[3].IconPath,
    EnableMouseWheel = true,
    EnableDrag = true,
    CheckIsUnlocked = function(Avatar, Char)
      if self.Params.bHideWeaponAppearance then
        return false
      end
      return Avatar:CheckUIUnlocked("Swatch")
    end,
    CheckReddot = function(Params)
      local Weapon = Params.Weapon or self[self.ComparedWeaponName]
      if ArmoryUtils:GetWeaponByUuid(Weapon.Uuid) == nil then
        return
      end
      return self.CheckWeaponAppearanceReddot and self:CheckWeaponAppearanceReddot(Weapon), false
    end
  }
  self.WeaponTabIndexes = {
    ArmoryUtils.ArmorySubTabNames.Attribute,
    ArmoryUtils.ArmorySubTabNames.Grade,
    ArmoryUtils.ArmorySubTabNames.Appearance
  }
  self.ConstTabsConfig = {
    Tabs = {
      [ArmoryUtils.ArmoryMainTabNames.Char] = {
        Name = ArmoryUtils.ArmoryMainTabNames.Char,
        Text = GText(DataMgr.ArmoryTab[1].Text),
        IconPath = DataMgr.ArmoryTab[1].IconPath,
        Tabs = {
          [ArmoryUtils.ArmorySubTabNames.Attribute] = {
            PCWidgetPath = "WidgetBlueprint'/Game/UI/WBP/Armory/PC/WBP_Armory_RoleInfo_P.WBP_Armory_RoleInfo_P'",
            MobileWidgetPath = "WidgetBlueprint'/Game/UI/WBP/Armory/Mobile/WBP_Armory_RoleInfo_M.WBP_Armory_RoleInfo_M'",
            Name = ArmoryUtils.ArmorySubTabNames.Attribute,
            Type = CommonConst.ArmoryType.Char,
            Tag = CommonConst.ArmoryTag.Char,
            Text = GText(DataMgr.CharTab[1].Text),
            IconPath = DataMgr.CharTab[1].IconPath,
            EnableMouseWheel = true,
            EnableDrag = true,
            CheckIsUnlocked = function()
              return not self.Params.bHideCharAttribute
            end,
            CheckReddot = function(Params)
              local Char = Params.Char or self.ComparedChar
              if self.IsPreviewMode or not Char then
                return false
              end
              return false, ArmoryUtils:TryAddCharRewardReddot(Char.CharId) or ArmoryUtils:TryAddUnlockableCharReddot(Char.CharId)
            end
          },
          [ArmoryUtils.ArmorySubTabNames.Skill] = {
            PCWidgetPath = "WidgetBlueprint'/Game/UI/WBP/Armory/PC/WBP_Armory_CharSkill_P.WBP_Armory_CharSkill_P'",
            MobileWidgetPath = "WidgetBlueprint'/Game/UI/WBP/Armory/Mobile/WBP_Armory_CharSkill_M.WBP_Armory_CharSkill_M'",
            Name = ArmoryUtils.ArmorySubTabNames.Skill,
            Type = CommonConst.ArmoryType.Char,
            Tag = CommonConst.ArmoryTag.Skill,
            Text = GText(DataMgr.CharTab[2].Text),
            IconPath = DataMgr.CharTab[2].IconPath,
            CheckIsUnlocked = function(Avatar, Char)
              if self.Params.bHideCharSkill then
                return false
              end
              local ChasHasSkill = Char and Char.Skills
              if self.IsPreviewMode then
                return ChasHasSkill
              else
                return ChasHasSkill and Avatar:CheckUIUnlocked("Skill")
              end
            end,
            CheckReddot = function(Params)
              local Char = Params.Char or self.ComparedChar
              if ArmoryUtils:GetCharByUuid(Char.Uuid) == nil then
                return
              end
              return false, not self.IsPreviewMode and self.CheckCharSkillReddot and self:CheckCharSkillReddot(Char)
            end
          },
          [ArmoryUtils.ArmorySubTabNames.Grade] = {
            PCWidgetPath = "WidgetBlueprint'/Game/UI/WBP/Armory/PC/WBP_Armory_Inron_P.WBP_Armory_Inron_P'",
            MobileWidgetPath = "WidgetBlueprint'/Game/UI/WBP/Armory/Mobile/WBP_Armory_Inron_M.WBP_Armory_Inron_M'",
            Name = ArmoryUtils.ArmorySubTabNames.Grade,
            Type = CommonConst.ArmoryType.Char,
            Tag = CommonConst.ArmoryTag.Grade,
            Text = GText(DataMgr.CharTab[3].Text),
            IconPath = DataMgr.CharTab[3].IconPath,
            CheckIsUnlocked = function(Avatar, Char)
              if self.Params.bHideCharGrade then
                return false
              end
              local CharHasCardLevel = Char and DataMgr.CharCardLevelUp[Char.CharId]
              if self.IsPreviewMode then
                return CharHasCardLevel
              else
                return CharHasCardLevel and Avatar:CheckUIUnlocked("CardLevel")
              end
            end,
            CheckReddot = function(Params)
              local Char = Params.Char or self.ComparedChar
              if ArmoryUtils:GetCharByUuid(Char.Uuid) == nil then
                return
              end
              return false, not self.IsPreviewMode and self.CheckCharPromoteReddot and self:CheckCharPromoteReddot(Char)
            end
          },
          [ArmoryUtils.ArmorySubTabNames.Appearance] = {
            PCWidgetPath = "/Game/UI/WBP/Armory/PC/WBP_Armory_Appearance_P.WBP_Armory_Appearance_P",
            MobileWidgetPath = "/Game/UI/WBP/Armory/Mobile/WBP_Armory_Appearance_M.WBP_Armory_Appearance_M",
            Name = ArmoryUtils.ArmorySubTabNames.Appearance,
            Type = CommonConst.ArmoryType.Char,
            Tag = CommonConst.ArmoryTag.Appearance,
            Text = GText(DataMgr.CharTab[4].Text),
            IconPath = DataMgr.CharTab[4].IconPath,
            EnableMouseWheel = true,
            EnableDrag = true,
            CheckIsUnlocked = function()
              return not self.Params.bHideCharAppearance
            end,
            CheckReddot = function(Params)
              local Char = Params.Char or self.ComparedChar
              if ArmoryUtils:GetCharByUuid(Char.Uuid) == nil then
                return
              end
              return self.CheckCharAppearanceReddot and self:CheckCharAppearanceReddot(Char), false
            end
          },
          [ArmoryUtils.ArmorySubTabNames.Files] = {
            PCWidgetPath = "WidgetBlueprint'/Game/UI/WBP/Armory/PC/WBP_Armory_Record_P.WBP_Armory_Record_P'",
            MobileWidgetPath = "WidgetBlueprint'/Game/UI/WBP/Armory/Mobile/WBP_Armory_Record_M.WBP_Armory_Record_M'",
            Name = ArmoryUtils.ArmorySubTabNames.Files,
            Type = CommonConst.ArmoryType.Char,
            Tag = CommonConst.ArmoryTag.Files,
            Text = GText(DataMgr.CharTab[5].Text),
            IconPath = DataMgr.CharTab[5].IconPath,
            CheckIsUnlocked = function(Avatar, Char)
              local Gender2RoleIds = Const.DefaultAttributeMaster
              if self.Params.bHideCharFiles or Char.CharId == Gender2RoleIds[0] or Char.CharId == Gender2RoleIds[1] then
                return false
              end
              return not self.Params.bHideCharFiles
            end
          }
        },
        TabIndexes = {
          ArmoryUtils.ArmorySubTabNames.Attribute,
          ArmoryUtils.ArmorySubTabNames.Skill,
          ArmoryUtils.ArmorySubTabNames.Grade,
          ArmoryUtils.ArmorySubTabNames.Appearance,
          ArmoryUtils.ArmorySubTabNames.Files
        },
        CheckIsUnlocked = function(Avatar, Char)
          return not self.Params.bHideCharTab and not not Char
        end
      },
      [ArmoryUtils.ArmoryMainTabNames.Melee] = {
        Name = ArmoryUtils.ArmoryMainTabNames.Melee,
        Text = GText(DataMgr.ArmoryTab[2].Text),
        IconPath = DataMgr.ArmoryTab[2].IconPath,
        Tabs = {
          [ArmoryUtils.ArmorySubTabNames.Attribute] = {
            PCWidgetPath = "WidgetBlueprint'/Game/UI/WBP/Armory/PC/WBP_Armory_RoleInfo_P.WBP_Armory_RoleInfo_P'",
            MobileWidgetPath = "WidgetBlueprint'/Game/UI/WBP/Armory/Mobile/WBP_Armory_RoleInfo_M.WBP_Armory_RoleInfo_M'",
            Name = ArmoryUtils.ArmorySubTabNames.Attribute,
            Type = CommonConst.ArmoryType.Weapon,
            Tag = CommonConst.ArmoryTag.Melee,
            Text = GText(DataMgr.WeaponTab[1].Text),
            IconPath = DataMgr.WeaponTab[1].IconPath,
            EnableMouseWheel = true,
            EnableDrag = true,
            CheckIsUnlocked = function()
              return not self.Params.bHideWeaponAttribute
            end,
            CheckReddot = function(Params)
              local Weapon = Params.Weapon or self[self.ComparedWeaponName]
              if self.IsPreviewMode or not Weapon then
                return false
              end
              return false, ArmoryUtils:TryAddWeaponRewardReddot(Weapon.WeaponId)
            end
          },
          [ArmoryUtils.ArmorySubTabNames.Grade] = self.WeaponGradeSubTab,
          [ArmoryUtils.ArmorySubTabNames.Appearance] = self.WeaponAppearanceSubTab
        },
        TabIndexes = self.WeaponTabIndexes,
        CheckIsUnlocked = function(Avatar, Char)
          if self.Params.bHideMeleeTab then
            return false
          end
          if self.IsPreviewMode and not Char then
            return false
          else
            local Uuid = Avatar.MeleeWeapon
            local Weapon = Uuid and Avatar.Weapons[Uuid]
            if Weapon then
              return true
            end
            for _, value in pairs(Avatar.Weapons) do
              if value:HasTag("Melee") then
                return true
              end
            end
            return false
          end
        end
      },
      [ArmoryUtils.ArmoryMainTabNames.Ranged] = {
        Name = ArmoryUtils.ArmoryMainTabNames.Ranged,
        Type = CommonConst.ArmoryType.Weapon,
        Tag = CommonConst.ArmoryTag.Ranged,
        Text = GText(DataMgr.ArmoryTab[3].Text),
        IconPath = DataMgr.ArmoryTab[3].IconPath,
        Tabs = {
          [ArmoryUtils.ArmorySubTabNames.Attribute] = {
            PCWidgetPath = "WidgetBlueprint'/Game/UI/WBP/Armory/PC/WBP_Armory_RoleInfo_P.WBP_Armory_RoleInfo_P'",
            MobileWidgetPath = "WidgetBlueprint'/Game/UI/WBP/Armory/Mobile/WBP_Armory_RoleInfo_M.WBP_Armory_RoleInfo_M'",
            Name = ArmoryUtils.ArmorySubTabNames.Attribute,
            Type = CommonConst.ArmoryType.Weapon,
            Tag = CommonConst.ArmoryTag.Ranged,
            Text = GText(DataMgr.WeaponTab[1].Text),
            IconPath = DataMgr.WeaponTab[1].IconPath,
            EnableMouseWheel = true,
            EnableDrag = true,
            CheckIsUnlocked = function()
              return not self.Params.bHideWeaponAttribute
            end,
            CheckReddot = function(Params)
              local Weapon = Params.Weapon or self[self.ComparedWeaponName]
              if self.IsPreviewMode or not Weapon then
                return false
              end
              return false, ArmoryUtils:TryAddWeaponRewardReddot(Weapon.WeaponId)
            end
          },
          [ArmoryUtils.ArmorySubTabNames.Grade] = self.WeaponGradeSubTab,
          [ArmoryUtils.ArmorySubTabNames.Appearance] = self.WeaponAppearanceSubTab
        },
        TabIndexes = self.WeaponTabIndexes,
        CheckIsUnlocked = function(Avatar, Char)
          if self.Params.bHideRangedTab then
            return false
          end
          if self.IsPreviewMode and not Char then
            return false
          else
            local Uuid = Avatar.RangedWeapon
            local Weapon = Uuid and Avatar.Weapons[Uuid]
            if Weapon then
              return true
            end
            for _, value in pairs(Avatar.Weapons) do
              if value:HasTag("Ranged") then
                return true
              end
            end
            return false
          end
        end
      },
      [ArmoryUtils.ArmoryMainTabNames.UWeapon] = {
        CreateFunc = function(Avatar, Params)
          local Char = Params.Char
          local UWeaponTabConfig = {
            Type = CommonConst.ArmoryType.Weapon,
            Tag = CommonConst.ArmoryTag.UWeapon,
            Text = GText(DataMgr.ArmoryTab[4].Text),
            IconPath = DataMgr.ArmoryTab[4].IconPath,
            Tabs = {
              [ArmoryUtils.ArmorySubTabNames.Attribute] = {
                PCWidgetPath = "WidgetBlueprint'/Game/UI/WBP/Armory/PC/WBP_Armory_RoleInfo_P.WBP_Armory_RoleInfo_P'",
                MobileWidgetPath = "WidgetBlueprint'/Game/UI/WBP/Armory/Mobile/WBP_Armory_RoleInfo_M.WBP_Armory_RoleInfo_M'",
                Name = ArmoryUtils.ArmorySubTabNames.Attribute,
                Type = CommonConst.ArmoryType.Weapon,
                Tag = CommonConst.ArmoryTag.UWeapon,
                EnableMouseWheel = true,
                EnableDrag = true,
                CheckIsUnlocked = self.AlwaysReturnTrue
              }
            },
            TabIndexes = {
              ArmoryUtils.ArmorySubTabNames.Attribute
            },
            CheckIsUnlocked = function()
              return not self.Params.bHideUltraTab
            end
          }
          
          local function CopyTab(TabToBeCopy)
            local NewTab = {}
            for key, value in pairs(TabToBeCopy) do
              NewTab[key] = value
            end
            return NewTab
          end
          
          local Tabs = {}
          local IsUWeaponUnlocked = false
          if self.IsPreviewMode then
            IsUWeaponUnlocked = true
          else
            IsUWeaponUnlocked = Avatar:CheckUIUnlocked("UWeapon")
          end
          if Params.Avatar then
            Avatar = Params.Avatar
          end
          if Char and IsUWeaponUnlocked then
            for i, Uuid in ipairs(Char.UWeaponEids) do
              local bHasUWeapon = Uuid and Avatar.UWeapons[Uuid] and not DataMgr.UWeapon[Avatar.UWeapons[Uuid].WeaponId].IsInvisible
              if bHasUWeapon then
                local NewTab = CopyTab(UWeaponTabConfig)
                NewTab.Name = ArmoryUtils.ArmoryMainTabNames.UWeapon .. i
                NewTab.UWeaponIdx = i
                table.insert(Tabs, NewTab)
              end
            end
          end
          return Tabs
        end
      },
      [ArmoryUtils.ArmoryMainTabNames.Pet] = {
        Name = ArmoryUtils.ArmoryMainTabNames.Pet,
        Type = CommonConst.ArmoryType.Pet,
        Tag = CommonConst.ArmoryTag.Pet,
        Text = GText(DataMgr.ArmoryTab[5].Text),
        IconPath = DataMgr.ArmoryTab[5].IconPath,
        Tabs = {
          [ArmoryUtils.ArmorySubTabNames.Attribute] = {
            PCWidgetPath = "WidgetBlueprint'/Game/UI/WBP/Armory/PC/WBP_Armory_PetAttr_P.WBP_Armory_PetAttr_P'",
            MobileWidgetPath = "WidgetBlueprint'/Game/UI/WBP/Armory/Mobile/WBP_Armory_PetAttr_M.WBP_Armory_PetAttr_M'",
            Name = ArmoryUtils.ArmorySubTabNames.Attribute,
            Type = CommonConst.ArmoryType.Pet,
            Tag = ArmoryUtils.ArmorySubTabNames.Attribute,
            Text = GText(DataMgr.PetTab[1].Text),
            IconPath = DataMgr.PetTab[1].IconPath,
            EnableMouseWheel = true,
            EnableDrag = true,
            CheckIsUnlocked = function(Avatar, Char, Params)
              if self.Params.bHidePetAttribute then
                return false
              end
              if not Params.Pet then
                return false
              end
              return not Params.Pet:IsResourcePet()
            end
          },
          [ArmoryUtils.ArmorySubTabNames.Entry] = {
            PCWidgetPath = "WidgetBlueprint'/Game/UI/WBP/Armory/PC/WBP_Armory_PetEntry_P.WBP_Armory_PetEntry_P'",
            MobileWidgetPath = "WidgetBlueprint'/Game/UI/WBP/Armory/Mobile/WBP_Armory_PetEntry_M.WBP_Armory_PetEntry_M'",
            Name = ArmoryUtils.ArmorySubTabNames.Entry,
            Type = CommonConst.ArmoryType.Pet,
            Tag = ArmoryUtils.ArmorySubTabNames.Entry,
            Text = GText(DataMgr.PetTab[2].Text),
            IconPath = DataMgr.PetTab[2].IconPath,
            CheckIsUnlocked = function()
              return not self.Params.bHidePetEntry and not self.IsPreviewMode
            end
          }
        },
        TabIndexes = {
          ArmoryUtils.ArmorySubTabNames.Attribute,
          ArmoryUtils.ArmorySubTabNames.Entry
        },
        CheckIsUnlocked = function(Avatar, Char)
          if self.Params.bHidePetTab then
            return false
          end
          local HasAnyPet = false
          if Avatar.Pets then
            local Data = DataMgr.Pet
            for k, v in pairs(Avatar.Pets) do
              if Data[v.PetId] then
                HasAnyPet = true
                break
              end
            end
          end
          local IsUnlocked = HasAnyPet and Avatar:CheckUIUnlocked("Pet")
          return IsUnlocked, ""
        end
      },
      [ArmoryUtils.ArmoryMainTabNames.BattleWheel] = {
        PCWidgetPath = "WidgetBlueprint'/Game/UI/WBP/Armory/PC/WBP_Armory_BattleMenu_P.WBP_Armory_BattleMenu_P'",
        MobileWidgetPath = "WidgetBlueprint'/Game/UI/WBP/Armory/Mobile/WBP_Armory_BattleMenu_M.WBP_Armory_BattleMenu_M'",
        Name = ArmoryUtils.ArmoryMainTabNames.BattleWheel,
        Text = GText(DataMgr.ArmoryTab[6].Text),
        IconPath = DataMgr.ArmoryTab[6].IconPath,
        EnableMouseWheel = false,
        EnableDrag = false,
        CheckIsUnlocked = function(Avatar, Char)
          if self.IsPreviewMode or self.Params.bHideBattleWheel then
            return false, ""
          end
          local IsUnlocked = Avatar:CheckUIUnlocked("BattleWheel")
          return IsUnlocked, ""
        end
      },
      [ArmoryUtils.ArmoryMainTabNames.Weapon] = {
        Name = ArmoryUtils.ArmoryMainTabNames.Weapon,
        Type = CommonConst.ArmoryType.Weapon,
        Tag = CommonConst.ArmoryType.Weapon,
        Tabs = {
          [ArmoryUtils.ArmorySubTabNames.Attribute] = {
            PCWidgetPath = "WidgetBlueprint'/Game/UI/WBP/Armory/PC/WBP_Armory_RoleInfo_P.WBP_Armory_RoleInfo_P'",
            MobileWidgetPath = "WidgetBlueprint'/Game/UI/WBP/Armory/Mobile/WBP_Armory_RoleInfo_M.WBP_Armory_RoleInfo_M'",
            Name = ArmoryUtils.ArmorySubTabNames.Attribute,
            Type = CommonConst.ArmoryType.Weapon,
            Tag = CommonConst.ArmoryType.Weapon,
            Text = GText(DataMgr.WeaponTab[1].Text),
            IconPath = DataMgr.WeaponTab[1].IconPath,
            EnableMouseWheel = true,
            EnableDrag = true,
            CheckIsUnlocked = function()
              return not self.Params.bHideWeaponAttribute
            end
          },
          [ArmoryUtils.ArmorySubTabNames.Grade] = self.WeaponGradeSubTab,
          [ArmoryUtils.ArmorySubTabNames.Appearance] = self.WeaponAppearanceSubTab
        },
        TabIndexes = self.WeaponTabIndexes,
        CheckIsUnlocked = function(Avatar, Char)
          if self.Params.bHideWeaponTab then
            return false
          end
          if self.IsPreviewMode and not Char and Avatar.Weapons and next(Avatar.Weapons) then
            return true
          end
        end
      }
    },
    TabIndexes = {
      ArmoryUtils.ArmoryMainTabNames.Char,
      ArmoryUtils.ArmoryMainTabNames.Melee,
      ArmoryUtils.ArmoryMainTabNames.Ranged,
      ArmoryUtils.ArmoryMainTabNames.UWeapon,
      ArmoryUtils.ArmoryMainTabNames.Pet,
      ArmoryUtils.ArmoryMainTabNames.BattleWheel,
      ArmoryUtils.ArmoryMainTabNames.Weapon
    }
  }
end

function M:GetTabsConfigData()
  if self.IsPreviewMode then
    return self.ConstTabsConfig
  else
    return self.ConstTabsConfig
  end
end

return M
