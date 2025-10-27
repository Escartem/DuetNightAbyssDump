require("UnLua")
local TimeUtils = require("Utils.TimeUtils")
local ItemPath = "/Game/UI/WBP/Armory/Widget/Record/WBP_Armory_Record_Item.WBP_Armory_Record_Item"
local ArmoryUtils = require("BluePrints.UI.WBP.Armory.ArmoryUtils")
local RecordTag = ArmoryUtils.FilesTabType[2]
local VoiceTag = ArmoryUtils.FilesTabType[1]
local M = Class("BluePrints.UI.BP_UIState_C")
M._components = {
  "BluePrints.UI.WBP.Armory.MainComponent.Armory_PointerInputComponent"
}

function M:Initialize(Initializer)
  self.MainTabs = {
    {
      Text = GText(DataMgr.CharRecordTab[1].Text),
      IconPath = DataMgr.CharRecordTab[1].IconPath
    },
    {
      Text = GText(DataMgr.CharRecordTab[2].Text),
      IconPath = DataMgr.CharRecordTab[2].IconPath
    }
  }
  self.Languages = {
    CommonConst.SystemVoices.CN,
    CommonConst.SystemVoices.EN,
    CommonConst.SystemVoices.JP,
    CommonConst.SystemVoices.KR
  }
end

function M:Construct()
  M.Super.Construct(self)
  self.RecordTabs = {}
  for _, Data in ipairs(DataMgr.CharRecordType) do
    table.insert(self.RecordTabs, {
      Text = GText(Data.Text),
      Type = RecordTag
    })
  end
  self.RecordTabConfig = {
    LeftKey = "A",
    RightKey = "D",
    Tabs = self.RecordTabs,
    SoundFunc = function()
      AudioManager(self):PlayUISound(self, "event:/ui/common/click_level_02", nil, nil)
    end
  }
  self.CharVoiceTabs = {}
  for _, Data in ipairs(DataMgr.CharVoiceType) do
    table.insert(self.CharVoiceTabs, {
      Text = GText(Data.Text),
      Type = VoiceTag
    })
  end
  self.CharVoiceTabConfig = {
    LeftKey = "A",
    RightKey = "D",
    Tabs = self.CharVoiceTabs,
    SoundFunc = function()
      AudioManager(self):PlayUISound(self, "event:/ui/common/click_level_02", nil, nil)
    end
  }
  self.CurrentVoiceLanguage = CommonConst.SystemVoice
  self.OriginalVoiceLanguage = CommonConst.SystemVoice
  self.Tab_Record:BindEventOnTabSelected(self, self.OnTopTabSelected)
  self.Tab_Switch:BindEventOnTabSelected(self, self.OnSubTabSelected)
  self:UnbindAllFromAnimationFinished(self.Auto_In)
  self:BindToAnimationFinished(self.Auto_In, {
    self,
    function()
      self:BlockAllUIInput(false)
    end
  })
  self.Common_SortList:BindEventOnSelectionsChanged(self, self.OnVoiceLanguageChanged)
  self:InitKeySetting()
end

function M:Destruct()
  self:UnbindAllFromAnimationFinished(self.Auto_In)
  local Language = AudioManager(self):GetLanguage(self.OriginalVoiceLanguage)
  UFMODBlueprintStatics.LoadBanksWithLanguage(Language)
  self.Super.Destruct(self)
end

function M:InitKeySetting()
  self.TopTabLeftKey = "Q"
  self.TopTabRightKey = "E"
  self.SubTabLeftKey = "A"
  self.SubTabRightKey = "D"
  self.LeftMouseButton = "LeftMouseButton"
  self.Escape = "Escape"
  self.KeyDownEvent = {}
  self.KeyDownEvent[self.TopTabLeftKey] = self.OnTopTabLeftKeyDown
  self.KeyDownEvent[self.TopTabRightKey] = self.OnTopTabRightKeyDown
  self.KeyDownEvent[self.SubTabLeftKey] = self.OnSubTabLeftKeyDown
  self.KeyDownEvent[self.SubTabRightKey] = self.OnSubTabRightKeyDown
  self.KeyDownEvent[self.Escape] = self.OnBackKeyDown
  self.KeyDownEvent[self.LeftMouseButton] = self.OnMenuCloseKeyDown
end

function M:OnMenuCloseKeyDown()
  EventManager:FireEvent(EventID.OnMenuClose)
end

function M:OnMouseWheel(MyGeometry, MouseEvent)
  return self:OnMouseWheelScroll(MyGeometry, MouseEvent)
end

function M:OnMouseButtonDown(MyGeometry, MouseEvent)
  return self:OnPointerDown(MyGeometry, MouseEvent)
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

function M:OnKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  self.Common_SortList:ReceiveKeyDown_Lua(MyGeometry, InKeyEvent)
  if self.KeyDownEvent[InKeyName] then
    EventManager:FireEvent(EventID.OnMenuClose)
    self.KeyDownEvent[InKeyName](self)
  end
  return UE4.UWidgetBlueprintLibrary.Handled()
end

function M:OnTopTabLeftKeyDown()
  self.Tab_Record:TabToLeft()
end

function M:OnTopTabRightKeyDown()
  self.Tab_Record:TabToRight()
end

function M:OnBackKeyDown()
  self:BlockAllUIInput(true)
  self:Close()
end

function M:Close()
  self:ClearPlayingVoice()
  if self.CurrentSubTabWidget and self.CurrentTopTabType == RecordTag then
    local len = #self.Contents
    local Items = self.Contents
    for i = 1, len do
      if not Items[i].IsEmptyItem and not Items[i].IsLocked then
        ArmoryUtils:SetReddotRead(Items[i])
      end
    end
  end
  self:RemoveReddotlisten()
  self.Super.Close(self)
  local ArmoryMain = UIManager(self):GetArmoryUIObj()
  if ArmoryMain then
    ArmoryMain:UpdateMontageAndCamera()
  end
end

function M:InitUIInfo(Name, IsInUIMode, EventList, ...)
  M.Super.InitUIInfo(self, Name, IsInUIMode, EventList, ...)
  self.Parent, self.Char, self.InitTabName, self.bEnableReddot = ...
  local ArmoryMain = UIManager(self):GetArmoryUIObj()
  if ArmoryMain then
    self.ArmoryPlayer = ArmoryMain.ArmoryPlayer
    self.ArmoryHelper = ArmoryMain.ArmoryHelper
  end
  self:Init(self.Char)
  self:BlockAllUIInput(true)
  if ArmoryUtils.FilesTabType[1] == self.InitTabName then
    self.Tab_Record:SelectTab(1)
  else
    self.Tab_Record:SelectTab(2)
  end
end

function M:AddReddotListen()
  if not self.bEnableReddot then
    return
  end
  if not self.ReddotNames then
    self.ReddotNames = {}
  end
  
  local function TabCallback(Count, TabConf, TabWidget, Type)
    TabConf[Type].IsNew = Count > 0
    if TabWidget and TabWidget.Idx == Type then
      TabWidget:SetReddot(Count > 0)
    end
  end
  
  local CharId = self.Char.CharId
  local CharacterData = DataMgr.CharacterDataTarget[CharId]
  for RecordType, _ in ipairs(self.RecordTabs) do
    if not CharacterData then
      break
    end
    local NodeName = table.concat({
      RecordTag,
      CharId,
      RecordType
    }, "_")
    if ReddotManager.GetTreeNode(NodeName) then
      ReddotManager.AddListener(NodeName, self, function(self, Count)
        TabCallback(Count, self.RecordTabs, self.CurrentSubTabWidget, RecordType)
      end)
      self.ReddotNames[NodeName] = 1
    end
  end
  local CharVoiceData = DataMgr.CharVoice[CharId]
  for VoiceType, _ in ipairs(self.CharVoiceTabs) do
    if not CharVoiceData then
      break
    end
    local NodeName = table.concat({
      VoiceTag,
      CharId,
      VoiceType
    }, "_")
    if ReddotManager.GetTreeNode(NodeName) then
      ReddotManager.AddListener(NodeName, self, function(self, Count)
        TabCallback(Count, self.CharVoiceTabs, self.CurrentSubTabWidget, VoiceType)
      end)
      self.ReddotNames[NodeName] = 1
    end
  end
  for Idx, TabTag in ipairs(ArmoryUtils.FilesTabType) do
    local LeafNodes = {}
    local NodeName = table.concat({TabTag, CharId}, "_")
    for VoiceType, _ in ipairs(self.CharVoiceTabs) do
      if TabTag ~= VoiceTag then
        break
      end
      local LeafNodeName = table.concat({
        VoiceTag,
        CharId,
        VoiceType
      }, "_")
      LeafNodes[LeafNodeName] = ReddotManager.GetTreeNode(LeafNodeName) and 1 or nil
    end
    for RecordType, _ in ipairs(self.RecordTabs) do
      if TabTag ~= RecordTag then
        break
      end
      local LeafNodeName = table.concat({
        RecordTag,
        CharId,
        RecordType
      }, "_")
      LeafNodes[LeafNodeName] = ReddotManager.GetTreeNode(LeafNodeName) and 1 or nil
    end
    if not self.ReddotNames[NodeName] and not IsEmptyTable(LeafNodes) then
      ReddotManager.AddListener(NodeName, self, function(self, Count)
        TabCallback(Count, self.MainTabs, self.CurrentTopTabWidget, Idx)
      end, LeafNodes)
      self.ReddotNames[NodeName] = 1
    end
  end
end

function M:RemoveReddotlisten()
  for NodeName, _ in pairs(self.ReddotNames or {}) do
    ReddotManager.RemoveListener(NodeName, self)
  end
end

function M:Init(Char)
  local ArmoryMain = UIManager(self):GetArmoryUIObj()
  if ArmoryMain then
    ArmoryMain:SetArmoryCameraTag("Char", "Files")
  end
  local AttrName = DataMgr.BattleChar[Char.CharId].Attribute
  self.Text_RoleName:SetText(GText(Char.CharName))
  local IconName = "Armory_" .. AttrName
  local AttributeIcon = LoadObject("/Game/UI/Texture/Dynamic/Atlas/Armory/T_" .. IconName .. ".T_" .. IconName)
  self.Image_Attribute:SetBrushResourceObject(AttributeIcon or LoadObject("/Game/UI/Texture/Dynamic/Atlas/Armory/T_Armory_Default.T_Armory_Default"))
  self:AddReddotListen()
  self.TopTabConfigData = {
    TitleName = GText("UI_Armory_Information"),
    LeftKey = "Q",
    RightKey = "E",
    Tabs = self.MainTabs,
    DynamicNode = {
      "Back",
      "ResourceBar",
      "BottomKey"
    },
    BottomKeyInfo = {
      {
        KeyInfoList = {
          {
            Type = "Text",
            Text = CommonUtils:GetKeyText("Escape"),
            ClickCallback = self.OnBackKeyDown,
            Owner = self
          }
        },
        Desc = GText("UI_BACK"),
        bLongPress = false
      }
    },
    StyleName = "Text",
    BackCallback = self.OnBackKeyDown,
    OwnerPanel = self
  }
  self.LastTopTabType = nil
  self.CurrentTopTabType = nil
  self.LastSubTabWidget = nil
  self.CurrentSubTabWidget = nil
  self.Tab_Record:Init(self.TopTabConfigData, true)
  self.Tab_Record:PlayTabInAnim()
  self.Tab_Record:UpdateReddots()
  self:InitCharInfos()
end

function M:InitCharInfos()
  local CharData = DataMgr.CharacterData[self.Char.CharId]
  if CharData then
    self.Gender:SetText(GText("UI_Chardata_Char_Sex") .. ": ", GText(not CharData.CharSex and "UI_Chardata_Char_Male" or "UI_Chardata_Char_Female"))
    self.BirthPlace:SetText(GText("UI_Chardata_Char_BrithPlace") .. ": ", GText(CharData.CharBirth))
    local year, month, day = TimeUtils.ExcelTimestampToLuaData(CharData.CharBirthday)
    self.BirthDate:SetText(GText("UI_Chardata_Char_Brithday") .. ": ", GDate("Date_MD", {
      Year = year,
      Month = month,
      Day = day
    }, CommonConst.SystemLanguage))
    self.Force:SetText(GText("UI_Chardata_Char_Force") .. ": ", GText(CharData.CharForce))
    self.Language2Idx = {}
    self.LanguageDisplayList = {}
    for i, value in ipairs(self.Languages) do
      table.insert(self.LanguageDisplayList, GText("UI_Voice_Actor_" .. value) .. ": " .. GText(CharData["Cv" .. value .. "Name"] or ""))
      self.Language2Idx[value] = i
    end
    self.Common_SortList:Init(self.LanguageDisplayList, "RS", self)
    self.Common_SortList:SelectItem(self.Language2Idx[self.CurrentVoiceLanguage])
  end
end

function M:OnLoaded(...)
  self.Super.OnLoaded(self, ...)
  self:BlockAllUIInput(false)
  self:SetFocus()
end

function M:OnTopTabSelected(TabWidget, Content)
  EventManager:FireEvent(EventID.OnMenuClose)
  self:ClearPlayingVoice()
  self.LastTopTabWidget = self.CurrentTopTabWidget
  self.CurrentTopTabWidget = TabWidget
  self.LastTopTabType = self.CurrentTopTabType
  self.CurrentTopTabType = ArmoryUtils.FilesTabType[TabWidget.Idx]
  self.Tab_Switch:Init(self[self.CurrentTopTabType .. "TabConfig"])
  self.Tab_Switch:UpdateReddots()
  self.Tab_Switch:SelectTab(1)
end

function M:OnListItemClicked(Content)
  EventManager:FireEvent(EventID.OnMenuClose)
  if Content.IsEmptyItem then
    return
  end
  if Content.IsLocked then
    ConditionUtils.CheckCondition(GWorld:GetAvatar(), Content.UnlockCondition, true)
    return
  end
  if Content.IsNew then
    self:SetItemReddotRead(Content)
  end
  self:ChangeSelectedContent(Content)
  if self["On" .. self.CurrentTopTabType .. "ItemClicked"] then
    self["On" .. self.CurrentTopTabType .. "ItemClicked"](self, Content)
  end
end

function M:SetItemReddotRead(Content)
  ArmoryUtils:SetReddotRead(Content, true)
end

function M:ChangeSelectedContent(Content)
  if self.SelectedContent == Content then
    self.SelectedContent = nil
  else
    if self.SelectedContent then
      self.SelectedContent.IsSelected = false
      if self.SelectedContent.UI then
        self.SelectedContent.UI:SetIsSelected(false)
      end
    end
    self.SelectedContent = Content
  end
end

function M:OnRecordSubTabSelected(TabWidget)
  self.Common_SortList:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.ScrollBox:ClearChildren()
  local CharDataTarget = DataMgr.CharacterDataTarget[self.Char.CharId]
  if not CharDataTarget then
    return
  end
  local CharDataType = TabWidget.Idx
  local Datas = {}
  for _, Data in pairs(CharDataTarget) do
    if Data.CharDataType == CharDataType then
      table.insert(Datas, Data)
    end
  end
  table.sort(Datas, function(a, b)
    return a.CharDataTarget < b.CharDataTarget
  end)
  local TypeIdx = 1
  local UIMgr = UIManager(self)
  self.Contents = {}
  for Idx, Data in ipairs(Datas) do
    local Obj = {}
    Obj.Type = RecordTag
    Obj.Title = GText(TabWidget.Info.Text) .. GText("UI_Chardata_Data_Of") .. GText("UI_Chardata_Data_Num_" .. TypeIdx)
    Obj.SubTitle = GText(Data.CharDataTargetDescribe)
    Obj.Parent = self
    Obj.OnClicked = self.OnListItemClicked
    Obj.IsLocked = false
    if not Obj.IsLocked then
      local WildcardSubsystem = UWildcardGameInstanceSubsystem.GetSubsystem(GWorld.GameInstance)
      Obj.Details = WildcardSubsystem:ReplaceWildcard(GText(Data.CharText))
    end
    Obj.IsNew = ArmoryUtils:TryAddNewRecordReddot(Data, table.concat({
      self.Char.CharId,
      Data.CharDataTarget
    }, "_")) and self.bEnableReddot
    Obj.CharDataTarget = Data.CharDataTarget
    Obj.ReddotType = Data.CharDataType
    Obj.CharId = self.Char.CharId
    local Widget = UIMgr:CreateWidget(ItemPath)
    Widget:OnListItemObjectSet(Obj)
    self.ScrollBox:AddChild(Widget)
    table.insert(self.Contents, Obj)
    TypeIdx = TypeIdx + 1
  end
  local RestCount = self:CalcRestItemCount(#Datas)
  self:FillEmptyItems(RestCount)
  self.ScrollBox:ScrollToStart()
end

function M:CalcRestItemCount(TotalCount)
  local UIMgr = UIManager(self)
  local ItemUI = self.ScrollBox:GetChildAt(0)
  local ScrollBoxSize = UIMgr:GetWidgetRenderSize(self.ScrollBox)
  local ItemSize = ItemUI:GetSize()
  if ItemSize.Y <= 0 then
    ItemSize.Y = ScrollBoxSize.Y
  end
  local RestCount = math.floor(ScrollBoxSize.Y / ItemSize.Y + 0.5) - TotalCount
  return RestCount
end

function M:OnCharVoiceSubTabSelected(TabWidget)
  self.Common_SortList:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  self.ScrollBox:ClearChildren()
  local VoiceDatas = DataMgr.CharVoice[self.Char.CharId]
  if not VoiceDatas then
    return
  end
  local VoiceType = TabWidget.Idx
  local Avatar = GWorld:GetAvatar()
  local Datas = {}
  for _, Data in pairs(VoiceDatas) do
    if Data.VoiceType == VoiceType then
      table.insert(Datas, Data)
    end
  end
  table.sort(Datas, function(a, b)
    return a.VoiceId < b.VoiceId
  end)
  local UIMgr = UIManager(self)
  self.Contents = {}
  for Idx, Data in ipairs(Datas) do
    local Obj = {}
    Obj.Type = VoiceTag
    Obj.CharId = self.Char.CharId
    Obj.VoiceId = Data.VoiceId
    Obj.ReddotType = Data.VoiceType
    local Des = ""
    if Data.VoiceDes then
      for _, value in ipairs(Data.VoiceDes) do
        Des = Des .. GText(value)
      end
    end
    Obj.Title = Des
    Obj.Parent = self
    Obj.OnClicked = self.OnListItemClicked
    if Data.UnlockOption then
      Obj.UnlockCondition = Data.UnlockOption
      Obj.IsLocked = not ConditionUtils.CheckCondition(Avatar, Data.UnlockOption, false)
    else
      Obj.IsLocked = false
    end
    Obj.IsNew = ArmoryUtils:TryAddNewCharVoiceReddot(Data, table.concat({
      self.Char.CharId,
      Data.VoiceId
    }, "_")) and self.bEnableReddot
    if not Obj.IsLocked then
      local WildcardSubsystem = UWildcardGameInstanceSubsystem.GetSubsystem(GWorld.GameInstance)
      Obj.Details = WildcardSubsystem:ReplaceWildcard(GText(Data.VoiceText and Data.VoiceText[1]))
      Obj.VoiceRes = Data.VoiceRes and Data.VoiceRes[1]
    end
    Obj.OnBtnClicked = self.OnPlayVoiceBtnClicked
    Obj.IsShowBtnPlay = true
    local Widget = UIMgr:CreateWidget(ItemPath)
    Widget:OnListItemObjectSet(Obj)
    self.ScrollBox:AddChild(Widget)
    table.insert(self.Contents, Obj)
  end
  local RestCount = self:CalcRestItemCount(#Datas)
  self:FillEmptyItems(RestCount)
  self.ScrollBox:ScrollToStart()
end

function M:FillEmptyItems(Count)
  local UIMgr = UIManager(self)
  for i = 1, Count do
    local Obj = {}
    Obj.IsEmptyItem = true
    local Widget = UIMgr:CreateWidget(ItemPath)
    Widget:OnListItemObjectSet(Obj)
    self.ScrollBox:AddChild(Widget)
  end
end

function M:OnPlayVoiceBtnClicked(Content)
  if not Content then
    return
  end
  if Content.IsPlaying then
    self:OnCharVoiceEnd()
  else
    self:SetItemReddotRead(Content)
    self:ChangeVoicePlayingContent(Content)
    local AudioManager = AudioManager(self)
    local Language = AudioManager:GetLanguage(self.CurrentVoiceLanguage)
    self.VoiceEventInstance = AudioManager:PlayCharVoice(self.ArmoryPlayer, DataMgr.CharVoice[Content.CharId][Content.VoiceId].VoiceChar, Content.VoiceRes, Language, "ArmoryRoleVoice", true)
  end
end

function M:OnCharVoiceItemClicked(Content)
  if not Content then
    return
  end
end

function M:Tick()
  if self.VoiceEventInstance then
    local AudioManager = AudioManager(self)
    local Position = AudioManager:GetEventInstanceTimelinePosition(self.VoiceEventInstance)
    local Length = AudioManager:GetEventInstanceLength(self.VoiceEventInstance)
    if Position >= Length then
      self:OnCharVoiceEnd()
    end
  end
end

function M:ChangeVoicePlayingContent(Content)
  if self.VoicePlayingContent then
    self.VoicePlayingContent.IsPlaying = false
    if self.VoicePlayingContent.UI then
      self.VoicePlayingContent.UI:SetIsPlaying(self.VoicePlayingContent.IsPlaying)
    end
  end
  self.VoicePlayingContent = Content
  if self.VoicePlayingContent then
    self.VoicePlayingContent.IsPlaying = true
    if self.VoicePlayingContent.UI then
      self.VoicePlayingContent.UI:SetIsPlaying(self.VoicePlayingContent.IsPlaying)
    end
  end
end

function M:ClearPlayingVoice()
  self:OnCharVoiceEnd()
end

function M:OnCharVoiceEnd()
  if self.VoiceEventInstance then
    AudioManager(self):StopSound(self.ArmoryPlayer, "ArmoryRoleVoice")
  end
  self.VoiceEventInstance = nil
  self:ChangeVoicePlayingContent(nil)
end

function M:OnVoiceLanguageChanged(VoiceActorIndex)
  self.CurrentVoiceLanguage = self.Languages[VoiceActorIndex]
  local Language = AudioManager(self):GetLanguage(self.CurrentVoiceLanguage)
  UFMODBlueprintStatics.LoadBanksWithLanguage(Language)
  self:ClearPlayingVoice()
end

function M:OnSubTabSelected(TabWidget)
  self.SelectedContent = nil
  EventManager:FireEvent(EventID.OnMenuClose)
  self:ClearPlayingVoice()
  self.LastSubTabWidget = self.CurrentSubTabWidget
  self.CurrentSubTabWidget = TabWidget
  if self.LastSubTabWidget and self.LastSubTabWidget.Info.Type == RecordTag then
    local len = #self.Contents
    local Items = self.Contents
    for i = 1, len do
      if not Items[i].IsEmptyItem and not Items[i].IsLocked then
        ArmoryUtils:SetReddotRead(Items[i], true)
      end
    end
    self.LastSubTabWidget:SetReddot(false)
  end
  local TabType = self.CurrentTopTabType
  if TabType and self["On" .. TabType .. "SubTabSelected"] then
    self["On" .. TabType .. "SubTabSelected"](self, TabWidget)
  end
end

function M:OnSubTabLeftKeyDown()
  self.Tab_Switch:TabToLeft()
end

function M:OnSubTabRightKeyDown()
  self.Tab_Switch:TabToRight()
end

function M:BP_GetDesiredFocusTarget()
  local SelectedContent = self.SelectedContent
  local UI = SelectedContent and SelectedContent.UI
  UI = UI or self.ScrollBox:GetChildAt(0)
  if UI then
    return UI.Common_List_Subcell_PC.Button_Area
  end
  return self
end

AssembleComponents(M)
return M
