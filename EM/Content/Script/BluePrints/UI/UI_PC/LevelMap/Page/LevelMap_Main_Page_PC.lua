require("UnLua")
local M = Class("BluePrints.UI.BP_UIState_C")
local TaskUtils = require("BluePrints.UI.TaskPanel.TaskUtils")
local GuidePointLocData = require("BluePrints.UI.TaskPanel/QuestGuidePointLocData")

function M:Construct()
  self.Super.Construct(self)
  self.AreaTable = {}
  self.ReturnHomePop = false
  self.ReturnHomeCondition = DataMgr.GlobalConstant.BackToHomeBaseCondition.ConstantValue
  self.ReturnHomeConditionRes = true
  self.DeviceInPc = CommonUtils.GetDeviceTypeByPlatformName(self) ~= "Mobile"
  self.MapRegionType = "Now"
  self.bCanDragMap = false
  self.SliderPecent = GWorld.GameInstance.RegionMapScale or 0.5
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(UGameplayStatics.GetPlayerController(self, 0))
  self.CurrentMainRegionId = nil
  self:UpdateConditionRes()
  self.LevelMap_World:Init(self)
  self:InitWidgetVisibility()
  self.Button_Area.OnClicked:Clear()
  self.Button_Area.OnClicked:Add(self, self.OnAreaClicked)
  self.Panel_Interactive:SetVisibility(ESlateVisibility.Collapsed)
  self.DispatchList = nil
  self.DispatchDetail = nil
  self.DispatchItem = nil
  self.DispatchId = -1
  self.DispatchAgentList = nil
  ReddotManager.AddListener(DataMgr.ReddotNode.Dispatch.Name, self, self.OnReddotChange)
end

function M:Destruct()
  M.Super.Destruct(self)
  ReddotManager.RemoveListener(DataMgr.ReddotNode.Dispatch.Name, self)
end

function M:OnLoaded(...)
  self.Super.OnLoaded(self, ...)
  self:UpdateConditionRes()
  AudioManager(self):PlayUISound(self, "event:/ui/common/map_open", "MapOpen", nil)
end

function M:InitUIInfo(Name, IsInUIMode, EventList, ...)
  M.Super.InitUIInfo(self, Name, IsInUIMode, EventList, ...)
  local IsOpenMap, OpenRegionId, InitCompleteFunc, InitCompleteParam = ...
  self.IsOpenMap = IsOpenMap
  self.CurrentMainRegionId = OpenRegionId
  if InitCompleteFunc then
    self.InitCompleteFunc = type(InitCompleteFunc) == "function" and InitCompleteFunc or function()
      local FunctionName = "On" .. InitCompleteFunc .. "Click"
      if self.RealWildMap[FunctionName] then
        self.RealWildMap[FunctionName](self.RealWildMap, InitCompleteParam, true)
      end
      self.InitCompleteFunc = nil
    end
  end
  if not IsOpenMap then
    self.AreaInfo:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  end
  self:InitCommonWidget()
end

function M:UpdateConditionRes()
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    self.ReturnHomeConditionRes = ConditionUtils.CheckCondition(Avatar, self.ReturnHomeCondition)
    self.MapRegionType = "Now"
  end
end

function M:InitWidgetVisibility()
  self.Panel_UI:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  local Avatar = GWorld:GetAvatar()
  if not self.ReturnHomeConditionRes then
    self.Btn_ReturnHome:SetVisibility(ESlateVisibility.Collapsed)
  else
    self.Btn_ReturnHome:SetVisibility(ESlateVisibility.Visible)
  end
end

function M:InitBackToWorldMapGuidePoint(InRegionId)
  local QuestRegionMapId
  local Info = TaskUtils:GetTrackingQuestDetailInfo()
  if Info and Info.SubRegionId and Info.SubRegionId > 0 then
    QuestRegionMapId = Info.SubRegionId
  else
    local Avatar = GWorld:GetAvatar()
    if not Avatar then
      return false
    end
    local CurTrackingQuestChainId = Avatar.TrackingQuestChainId
    if nil == CurTrackingQuestChainId or 0 == CurTrackingQuestChainId then
      return false
    end
    local UIObjs = MissionIndicatorManager:GetIndicatorUIObjByQuestChainIdWithType(CurTrackingQuestChainId, "Task")
    if IsEmptyTable(UIObjs) then
      return false
    end
    for _, v in pairs(UIObjs) do
      local TargetKey = v.GuideInfoCache.PointOrStaticCreatorName
      if TargetKey and GuidePointLocData[TargetKey] and GuidePointLocData[TargetKey].SubRegionId > 0 then
        QuestRegionMapId = GuidePointLocData[TargetKey].SubRegionId
        break
      end
      ScreenPrint(string.format("CheckIsTrackingQuest: \230\140\135\229\188\149\231\130\185\229\140\186\229\159\159\230\149\176\230\141\174\228\184\141\229\173\152\229\156\168, \228\187\187\229\138\161\229\140\186\229\159\159\228\191\161\230\129\175\232\142\183\229\143\150\229\164\177\232\180\165\239\188\140\232\175\183\230\163\128\230\159\165\229\175\188\229\135\186\230\149\176\230\141\174, \230\140\135\229\188\149\231\130\185: %s", v:GetName()))
      break
    end
  end
  if not (QuestRegionMapId and DataMgr.SubRegion[QuestRegionMapId] and DataMgr.SubRegion[QuestRegionMapId].RegionId and DataMgr.Region[DataMgr.SubRegion[QuestRegionMapId].RegionId]) or not DataMgr.Region[DataMgr.SubRegion[QuestRegionMapId].RegionId].RegionMapId then
    return false
  end
  local IsInEXRegion = false
  local CurWorldMapIndex = 0
  local TaskMapIndex = 0
  local CurMapRegionMapId = DataMgr.Region[InRegionId].RegionMapId
  local TaskRegionMapId = DataMgr.Region[DataMgr.SubRegion[QuestRegionMapId].RegionId].RegionMapId
  for WorldMapId, Data in pairs(DataMgr.WorldMap) do
    for _, WorldMapRegion in pairs(Data.WorldMapRegion) do
      if WorldMapRegion == CurMapRegionMapId then
        CurWorldMapIndex = WorldMapId
        break
      end
    end
  end
  for WorldMapId, Data in pairs(DataMgr.WorldMap) do
    for _, WorldMapRegion in pairs(Data.WorldMapRegion) do
      if WorldMapRegion == TaskRegionMapId then
        TaskMapIndex = WorldMapId
        if Data.UIRegionType == "EX" then
          IsInEXRegion = true
        end
        break
      end
    end
  end
  if IsInEXRegion then
    TaskUtils.TaskRegionMap = "EX"
  else
    TaskUtils.TaskRegionMap = "Now"
  end
end

function M:InitCommonWidget()
  self.Tab:Init({
    PlatformName = CommonUtils.GetDeviceTypeByPlatformName(self),
    LeftKey = "Q",
    RightKey = "E",
    LeftGamePadKey = "LeftShoulder",
    RightGamePadKey = "RightShoulder",
    ChildWidgetName = "MapTabSubItem",
    Tabs = {
      [1] = {
        Text = GText("UI_Map_Title_World"),
        TabId = 1
      },
      [2] = {
        Text = GText("UI_Map_Title_Region"),
        TabId = 2,
        IsLast = true
      }
    },
    SoundFunc = self.OnClickTabSound,
    SoundFuncReceiver = self
  })
  self.TabBack.Btn_Back.OnClicked:Add(self, self.OnReturnKeyDown)
  self.WildMapGamePadKeys = {
    {
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "A"}
      },
      Desc = GText("UI_RegionMap_AddMark")
    },
    {
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "LS"}
      },
      Desc = GText("UI_RegionMap_GotoPosition")
    },
    {
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "B"}
      },
      Desc = GText("UI_BACK")
    }
  }
  self.WildMapGamePadEnsureKeys = {
    {
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "A"}
      },
      Desc = GText("UI_Tips_Ensure")
    },
    {
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "LS"}
      },
      Desc = GText("UI_RegionMap_GotoPosition")
    },
    {
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "B"}
      },
      Desc = GText("UI_BACK")
    }
  }
  self.WildMapKeys = {
    {
      KeyInfoList = {
        {
          Type = "Text",
          ImgShortPath = "Mouse_Button"
        }
      },
      Desc = GText("UI_RegionMap_Scale")
    },
    {
      KeyInfoList = {
        {
          Type = "Text",
          ImgShortPath = "LeftMouseButton"
        }
      },
      Desc = GText("UI_RegionMap_AddMark")
    },
    {
      KeyInfoList = {
        {
          Type = "Text",
          Text = "V",
          Owner = self,
          ClickCallback = self.OnGotoPositionKeyDown
        }
      },
      Desc = GText("UI_RegionMap_GotoPosition")
    },
    {
      KeyInfoList = {
        {
          Type = "Text",
          Text = "Esc",
          Owner = self,
          ClickCallback = self.OnUIReturnKeyDown
        }
      },
      Desc = GText("UI_BACK")
    }
  }
  self.BackKey = {
    {
      KeyInfoList = {
        {
          Type = "Text",
          Text = "Esc",
          Owner = self,
          ClickCallback = self.OnUIReturnKeyDown
        }
      },
      Desc = GText("UI_BACK")
    }
  }
  self.BackGamePadKey = {
    {
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "B"}
      },
      Desc = GText("UI_BACK")
    }
  }
  if self.DeviceInPc then
    self:InitBottomTab()
  end
  self.Tab:BindEventOnTabSelected(self, self.OnTabItemClick)
  self.Tab:SelectTab(2)
  local ConfigData = {
    InitValue = self.SliderPecent * 100,
    ClickInterval = 10,
    MinValue = 0,
    MaxValue = 100,
    OwnerPanel = self,
    AddBtnCallback = self.OnClickSliderAddorMinus,
    MinusBtnCallback = self.OnClickSliderAddorMinus,
    SliderChangeCallback = self.OnPlayerChangeSlider,
    PlatformName = CommonUtils.GetDeviceTypeByPlatformName(self),
    ForbidGamePadLTRTKey = true
  }
  self.Slider_Zoom:Init(ConfigData)
  if self.DeviceInPc then
    self.Btn_ReturnHome.Switch_Type:SetActiveWidgetIndex(0)
    self.Btn_ReturnHome.Key:CreateCommonKey({
      KeyInfoList = {
        {Type = "Text", Text = "H"}
      }
    })
  else
    self.Btn_ReturnHome.Switch_Type:SetActiveWidgetIndex(1)
  end
  self.Btn_ReturnHome.Text_Return:SetText(GText("UI_WORLDMAP_RETURNHOMEBASE"))
  self.Btn_ReturnHome.Btn_Back.OnClicked:Add(self, self.OnReturnHomeKeyDown)
  self.Btn_ReturnHome.Btn_Back.OnPressed:Add(self, self.OnReturnHomePress)
  self.Btn_ReturnHome.Btn_Back.OnHovered:Add(self, self.OnReturnHomeHover)
  self.Btn_ReturnHome.Btn_Back.OnUnhovered:Add(self, self.OnReturnHomeUnhover)
  self.Btn_ReturnHome:PlayAnimation(self.Btn_ReturnHome.Normal)
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    local TrackingId = Avatar.TrackingQuestChainId
    local IconObj = TaskUtils:GetIconTextureByQuestChainType(TrackingId)
    if IconObj then
      self.Btn_ReturnHome.GuidePoint.Img_GuidePoint_Icon:SetBrushResourceObject(IconObj)
    end
    if Avatar.QuestChains[TrackingId] then
      local DoingQuestId = Avatar.QuestChains[TrackingId].DoingQuestId
      if MissionIndicatorManager:GetTargetTaskSubRegionId(TrackingId, DoingQuestId) == Const.HomeBaseSubRegionId then
        self.Btn_ReturnHome.GuidePoint:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
      else
        self.Btn_ReturnHome.GuidePoint:SetVisibility(ESlateVisibility.Collapsed)
      end
    else
      self.Btn_ReturnHome.GuidePoint:SetVisibility(ESlateVisibility.Collapsed)
    end
  end
  self.Entrance_Dispatch.Btn_Click.OnClicked:Add(self, self.OnClickDispatch)
  self.Entrance_Dispatch.Text_Name:SetText(GText("UI_Disptach_Title"))
end

function M:InitBottomTab()
  self.Key_Tip.Panel_Key:ClearChildren()
  self.Key_Esc = UIManager(self):_CreateWidgetNew("ComKeyTextDesc")
  self.Key_Tip.Panel_Key:AddChild(self.Key_Esc)
  self.Key_Esc:CreateCommonKey({
    KeyInfoList = {
      {
        Type = "Text",
        Text = "Esc",
        Owner = self,
        ClickCallback = self.OnUIReturnKeyDown
      }
    },
    Desc = GText("UI_BACK")
  })
end

function M:InitWildMap()
  self.LevelMap_World:HideWorldMap()
  local WildMap = self:LoadOrUnLoadWildMap(true, false)
  local Avatar = GWorld:GetAvatar()
  local RegionId = DataMgr.SubRegion[Avatar.CurrentRegionId].RegionId
  local RealRegionId
  if DataMgr.Region[RegionId].RegionMapId then
    RealRegionId = DataMgr.RegionMap[DataMgr.Region[RegionId].RegionMapId].RegionId
  end
  if RealRegionId then
    self.Slider_Zoom:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  else
    self.Slider_Zoom:SetVisibility(ESlateVisibility.Collapsed)
  end
  WildMap.OriginalRegionId = RealRegionId
  WildMap:Init(false, RealRegionId, self)
  WildMap:OnScaleChange(self.SliderPecent)
end

function M:InitWildMapWithoutShow()
  local RegionMapPath = "/Game/UI/WBP/Map/Widget/RegionMap/WBP_Map_Region.WBP_Map_Region_C"
  self.Slider_Zoom:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  local WildMap = self:RealLoadOrUnLoad("RealWildMap", RegionMapPath, self.WildMap, true, self)
  self.RealWildMap:SetVisibility(UE4.ESlateVisibility.Collapsed)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  local RegionId = DataMgr.SubRegion[Avatar.CurrentRegionId].RegionId
  local RegionMapId = DataMgr.Region[RegionId].RegionMapId
  WildMap:Init(false, DataMgr.RegionMap[RegionMapId].RegionId, self)
  WildMap:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self.AreaInfo:SetVisibility(UE4.ESlateVisibility.Collapsed)
end

function M:OnTabItemClick(TabWidget)
  local TabId = TabWidget.Idx
  self.CurTabId = TabId
  if 1 == self.CurTabId then
    self:OnOpenWorldMap()
    self:UpdateWorldMapKeys()
    self.LevelMap_World.Area03_Name:SetFocus()
    self.FloorWidget:SetVisibility(ESlateVisibility.Collapsed)
    self.FloorWidget.Key_Controller_Up:SetVisibility(ESlateVisibility.Collapsed)
    self.FloorWidget.Key_Controller_Down:SetVisibility(ESlateVisibility.Collapsed)
    if self.Btn_Location then
      self.Btn_Location:SetVisibility(ESlateVisibility.Collapsed)
    end
    self.Slider_Zoom:SetVisibility(UE4.ESlateVisibility.Collapsed)
  else
    local Avatar = GWorld:GetAvatar()
    local RegionId = DataMgr.SubRegion[Avatar.CurrentRegionId].RegionId
    local RealRegionId = self.CurrentMainRegionId
    if not RealRegionId and DataMgr.Region[RegionId].RegionMapId then
      RealRegionId = DataMgr.RegionMap[DataMgr.Region[RegionId].RegionMapId].RegionId
    end
    if RealRegionId and 0 ~= RealRegionId then
      self.Slider_Zoom:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    else
      self.Slider_Zoom:SetVisibility(ESlateVisibility.Collapsed)
    end
    self.FloorWidget:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self.WildMapKeysShow = true
    local WildMap = self:LoadOrUnLoadWildMap(true)
    if not self.IsOpenMap then
      WildMap.OriginalRegionId = RealRegionId
      WildMap.NormalInit = self.InitCompleteFunc == nil
      WildMap:Init(false, RealRegionId, self, function()
        WildMap:ShowMissionIndicatorsInRegionMap()
        WildMap:SetFocus()
        if self.InitCompleteFunc then
          self.InitCompleteFunc()
        end
        self.InitCompleteFunc = nil
        WildMap:OnScaleChange(self.SliderPecent)
      end)
    else
      WildMap.MainMap = self
      WildMap.NormalInit = false
    end
    self.IsOpenMap = false
    self:UpdateWildMapKeys()
    self.AreaInfo:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    if self.Btn_Location then
      self.Btn_Location:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    end
  end
end

function M:UpdateWildMapKeys()
  if not self.DeviceInPc or not self.RealWildMap then
    return
  end
  if self.RealWildMap.IsOpenDispatch == true then
    return
  end
  if self.WildMapKeysShow then
    if self.ReturnHomeConditionRes then
      self.Btn_ReturnHome:SetVisibility(ESlateVisibility.Visible)
    end
  else
    self.Btn_ReturnHome:SetVisibility(ESlateVisibility.Collapsed)
  end
  local MapTipsWidgetVisible = self.RealWildMap.MapTipsWidget and self.RealWildMap.MapTipsWidget:IsVisible()
  if self.GameInputModeSubsystem:GetCurrentInputType() == ECommonInputType.Gamepad then
    if not MapTipsWidgetVisible then
      self.Key_Tip:UpdateKeyInfo(not (not self:IsInteractiveOpen() and self.WildMapKeysShow) and self.BackGamePadKey or self.WildMapGamePadKeys)
    end
    self.Entrance_Dispatch.WS_Type:SetActiveWidgetIndex(1)
    self.Entrance_Dispatch.Icon_Key:CreateGamepadKey("X")
    self.Btn_ReturnHome.Switch_Type:SetActiveWidgetIndex(2)
    self.Btn_ReturnHome.Key_Controller:CreateGamepadKey(UIConst.GamePadImgKey.RightThumb)
  else
    self.Key_Tip:UpdateKeyInfo(not (not self:IsInteractiveOpen() and self.WildMapKeysShow) and self.BackKey or self.WildMapKeys)
    self.Entrance_Dispatch.WS_Type:SetActiveWidgetIndex(0)
    self.Btn_ReturnHome.Switch_Type:SetActiveWidgetIndex(0)
    self.Entrance_Dispatch.Key:CreateCommonKey({
      KeyInfoList = {
        {Type = "Text", Text = "L"}
      }
    })
  end
  if self.IsPanelOpen or self.RealWildMap.IsEmpty then
    self.Slider_Zoom:SetVisibility(ESlateVisibility.Collapsed)
  else
    self.Slider_Zoom:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  end
end

function M:UpdateWorldMapKeys()
  if not self.DeviceInPc then
    return
  end
  local Keys = {
    {
      KeyInfoList = {
        {
          Type = "Text",
          Text = "Esc",
          Owner = self,
          ClickCallback = self.OnUIReturnKeyDown
        }
      },
      Desc = GText("UI_BACK")
    }
  }
  local GamepadKeys = {
    {
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "A"}
      },
      Desc = GText("UI_Controller_Go")
    },
    {
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "B"}
      },
      Desc = GText("UI_BACK")
    }
  }
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
  if self.GameInputModeSubsystem:GetCurrentInputType() == ECommonInputType.Gamepad then
    self.Key_Tip:UpdateKeyInfo(GamepadKeys)
  else
    self.Key_Tip:UpdateKeyInfo(Keys)
  end
end

function M:OnReturnKeyDown()
  self:PlayOutAnim()
end

function M:OnUIReturnKeyDown()
  if self.DispatchAgentList ~= nil then
    self.DispatchAgentList:OnClickClose()
    self.DispatchAgentList = nil
    return
  end
  if nil ~= self.DispatchList and nil ~= self.DispatchDetail or nil ~= self.DispatchList then
    if self.DispatchList then
      self.DispatchList:Close()
    end
    self.Dispatch = nil
    self.DispatchList = nil
    return
  end
  if self.RealWildMap and self.RealWildMap:ClosePanel() then
    return
  end
  if self:IsInteractiveOpen() then
    self:OnAreaClicked()
    self.RealWildMap:SetFocus()
    return
  end
  self:OnReturnKeyDown()
end

function M:OnGotoPositionKeyDown()
  self.RealWildMap:OpenOptionSelect()
end

function M:OnReturnHomeKeyDown()
  self.Btn_ReturnHome:PlayAnimation(self.Btn_ReturnHome.Normal)
  self.Btn_ReturnHome:PlayAnimation(self.Btn_ReturnHome.Click)
  local Params = {}
  
  function Params.LeftCallbackFunction(Data)
    self.Btn_ReturnHome:PlayAnimation(self.Btn_ReturnHome.Normal)
    self.ReturnHomePop = false
  end
  
  function Params.RightCallbackFunction(Data)
    self.Btn_ReturnHome:PlayAnimation(self.Btn_ReturnHome.Normal)
    self:ReturnHome()
  end
  
  function Params.CloseBtnCallbackFunction(Data)
    self.Btn_ReturnHome:PlayAnimation(self.Btn_ReturnHome.Normal)
    self.ReturnHomePop = false
  end
  
  local GameInstance = self:GetGameInstance()
  local UIManager = GameInstance:GetGameUIManager()
  self.ReturnHomePop = UIManager:ShowCommonPopupUI(100037, Params, self)
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_large", nil, nil)
end

function M:ReturnHome()
  local GameMode = UE.UGameplayStatics.GetGameMode(self)
  GameMode:HandleLevelDeliver(1, 210101, 1)
  self:PlayOutAnim()
end

function M:OnReturnHomePress()
  self.Btn_ReturnHome:PlayAnimation(self.Btn_ReturnHome.Normal)
  self.Btn_ReturnHome:PlayAnimation(self.Btn_ReturnHome.Press)
end

function M:OnReturnHomeHover()
  self.Btn_ReturnHome:PlayAnimation(self.Btn_ReturnHome.Normal)
  self.Btn_ReturnHome:PlayAnimation(self.Btn_ReturnHome.Hover)
end

function M:OnReturnHomeUnhover()
  self.Btn_ReturnHome:PlayAnimation(self.Btn_ReturnHome.Normal)
  self.Btn_ReturnHome:PlayAnimation(self.Btn_ReturnHome.UnHover)
end

function M:OnOpenWorldMap()
  self.RealWildMap:Close()
  self:LoadOrUnLoadWildMap(false, true)
  self.Entrance_Dispatch:SetVisibility(ESlateVisibility.Collapsed)
end

function M:OnClickTabSound()
  print(_G.LogTag, "LXZ OnClickTabSound")
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_level_01", nil, nil)
end

function M:PlayOutAnim()
  if self:IsAnimationPlaying(self.Auto_In) or self:IsAnimationPlaying(self.Auto_Out) then
    return
  end
  if self.RealWildMap then
    self.RealWildMap:PlayCloseAnimation()
    GWorld.GameInstance.RegionMapScale = self.SliderPecent
  end
  AudioManager(self):SetEventSoundParam(self, "MapOpen", {ToEnd = 1})
  self.LevelMap_World:HideWorldMap()
  self:Close()
end

function M:RealClose()
  if self.DispatchList then
    self.DispatchList:RealClose()
  end
  if self.DispatchDetail then
    self.DispatchDetail:RealClose()
  end
  if self.DispatchAgentList then
    self.DispatchAgentList:OnClose()
  end
  if self.RealWildMap then
    self.RealWildMap:Close()
  end
  self:LoadOrUnLoadWildMap(false, false)
  M.Super.RealClose(self)
end

function M:OnKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  print(_G.LogTag, "LXZ OnKeyDown", InKeyName)
  local OpenMapKey = CommonUtils:GetActionMappingKeyName("OpenMap")
  if "Escape" == InKeyName or InKeyName == UIConst.GamePadKey.FaceButtonRight then
    if self.DispatchAgentList ~= nil then
      self.DispatchAgentList:OnClickClose()
      self.DispatchAgentList = nil
      return UWidgetBlueprintLibrary.Handled()
    end
    if nil ~= self.DispatchList and nil ~= self.DispatchDetail or nil ~= self.DispatchList then
      if self.DispatchList then
        self.DispatchList:Close()
      end
      self.Dispatch = nil
      self.DispatchList = nil
      return UWidgetBlueprintLibrary.Handled()
    end
    if nil == self.DispatchList and nil ~= self.DispatchDetail and self.DispatchAgentList == nil then
      self.RealWildMap:ClosePanel()
      return UWidgetBlueprintLibrary.Handled()
    end
    if self:IsInteractiveOpen() then
      self:OnAreaClicked()
      self.RealWildMap:SetFocus()
      return UWidgetBlueprintLibrary.Handled()
    end
    if self.RealWildMap and self.RealWildMap.MapTipsWidget and self.RealWildMap.MapTipsWidget:GetVisibility() == ESlateVisibility.SelfHitTestInvisible then
      self.RealWildMap:ClosePanel()
      self.RealWildMap:SetFocus()
      return UWidgetBlueprintLibrary.Handled()
    end
    self:OnReturnKeyDown()
    return UWidgetBlueprintLibrary.Handled()
  elseif InKeyName == OpenMapKey and self.bIsCanCloseByHotKey then
    self:PlayOutAnim()
    return UWidgetBlueprintLibrary.Handled()
  elseif ("H" == InKeyName or InKeyName == UIConst.GamePadKey.RightThumb) and self.ReturnHomeConditionRes then
    self:OnReturnHomeKeyDown()
    return UWidgetBlueprintLibrary.Handled()
  else
    if self.DeviceInPc then
      if self.GameInputModeSubsystem:GetCurrentInputType() == ECommonInputType.Gamepad then
        self.Tab:Handle_KeyEventOnGamePad(InKeyName)
      else
        self.Tab:Handle_KeyEventOnPC(InKeyName)
      end
    end
    return UWidgetBlueprintLibrary.Unhandled()
  end
end

function M:OnMouseWheelTurned(Percent)
  if self.RealWildMap then
    self.SliderPecent = Percent
  end
  self.Slider_Zoom:OnSliderValueChanged(Percent)
  AudioManager(self):PlayUISound(self, "event:/ui/common/map_process_bar_drag", nil, nil)
end

function M:OnClickSliderAddorMinus(CurrentCount, OldNumberValue)
  self.SliderPecent = CurrentCount / 100
  if self.RealWildMap then
    self.RealWildMap:OnScaleChange(self.SliderPecent)
    AudioManager(self):PlayUISound(self, "event:/ui/common/map_process_bar_drag", nil, nil)
  end
end

function M:OnPlayerChangeSlider(Value)
  self.SliderPecent = Value / 100
  if self.RealWildMap then
    self.RealWildMap:OnScaleChange(self.SliderPecent)
    AudioManager(self):PlayUISound(self, "event:/ui/common/map_process_bar_drag", nil, nil)
  end
end

function M:GetMainRegionId()
end

function M:LoadOrUnLoadWildMap(bLoad, bShowWorldMap)
  local RegionMapPath = "/Game/UI/WBP/Map/Widget/RegionMap/WBP_Map_Region.WBP_Map_Region_C"
  if bLoad then
    self.Slider_Zoom:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    if self.ReturnHomeConditionRes then
      self.Btn_ReturnHome:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    end
    self.LevelMap_World:HideWorldMap()
    AudioManager(self):PlayUISound(self, "event:/ui/common/map_switch_to_level", "", nil)
  else
    self.Slider_Zoom:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.Btn_ReturnHome:SetVisibility(UE4.ESlateVisibility.Collapsed)
    if bShowWorldMap then
      self.LevelMap_World:ShowWorldMap()
    end
    self.CurrentMainRegionId = nil
    AudioManager(self):PlayUISound(self, "event:/ui/common/map_switch_to_chapter", "", nil)
  end
  return self:RealLoadOrUnLoad("RealWildMap", RegionMapPath, self.WildMap, bLoad, self)
end

function M:RealLoadOrUnLoad(WidgetName, Path, Parent, bLoad, Root)
  self.HasOpenWildMap = bLoad
  if Root[WidgetName] and false == bLoad then
    Root[WidgetName]:RemoveFromParent()
    Root[WidgetName] = nil
    return Root[WidgetName]
  end
  if not Root[WidgetName] and true == bLoad then
    Root[WidgetName] = self:LoadTempWidget(Path, Parent, Root)
    Root[WidgetName].RootPage = Root
    return Root[WidgetName]
  end
  if Root[WidgetName] and true == bLoad then
    Root[WidgetName]:RemoveFromParent()
    Root[WidgetName] = self:LoadTempWidget(Path, Parent, Root)
    Root[WidgetName].RootPage = Root
    return Root[WidgetName]
  end
end

function M:LoadTempWidget(Path, Parent, Root)
  local TempWidget = self:CreateWidgetToParent(Parent, Path, false)
  local CanvasSlot = UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(TempWidget)
  if CanvasSlot then
    Root:SetWidgetOffset(CanvasSlot, 0, 0, 0, 0)
    Root:SetWidgetAnchors(CanvasSlot, FVector2D(0, 0), FVector2D(1, 1))
  end
  TempWidget:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  return TempWidget
end

function M:CreateWidgetToParent(Parent, Path, NeedShowInWindow, ZOrder)
  local Widget = UIManager(Parent):CreateWidget(Path, NeedShowInWindow, ZOrder)
  Parent:AddChild(Widget)
  return Widget
end

function M:HideWildMapByNotInRegion()
  self.Slider_Zoom:SetVisibility(UE4.ESlateVisibility.Collapsed)
  local RegionMapPath = "/Game/UI/WBP/Map/Widget/RegionMap/WBP_Map_Region.WBP_Map_Region_C"
  local WildMap = self:RealLoadOrUnLoad("RealWildMap", RegionMapPath, self.WildMap, true, self)
  self.RealWildMap:SetVisibility(UE4.ESlateVisibility.Collapsed)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  local RegionId = DataMgr.SubRegion[Avatar.CurrentRegionId].RegionId
  local RegionMapId = DataMgr.Region[RegionId].RegionMapId
  WildMap:Init(false, DataMgr.RegionMap[RegionMapId].RegionId, self)
  WildMap:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self.RealWildMap:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self.AreaInfo:SetVisibility(UE4.ESlateVisibility.Collapsed)
end

function M:OpenSelectList(SelectTable)
  if self.ScrollBox_Interactive:GetChildrenCount() > 0 then
    return
  end
  self.Panel_Interactive:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  self.ScrollBox_Interactive:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  self.Interactive_Locate:SetVisibility(ESlateVisibility.Collapsed)
  self:AddTimer(0.001, function()
    local ItemSize = FVector2D(612, 60)
    local AbsolutePosition = UUIFunctionLibrary.GetGeometryAbsolutePosition(SelectTable[1]:GetCachedGeometry())
    local LocalPosition = USlateBlueprintLibrary.AbsoluteToLocal(self.Panel_Interactive:GetCachedGeometry(), AbsolutePosition)
    local MaxSize = self.RealWildMap.ScreenSize * 2 - self.RealWildMap.BgHeight
    local Alignment = self.Overlay_Interactive.Slot:GetAlignment()
    if LocalPosition.Y + #SelectTable * ItemSize.Y >= MaxSize.Y then
      Alignment:Set(0, 1)
    else
      Alignment:Set(0, 0)
    end
    if LocalPosition.X + SelectTable[1]:GetDesiredSize().X + ItemSize.X > MaxSize.X then
      Alignment:Set(1, Alignment.Y)
    else
      LocalPosition:Set(LocalPosition.X + SelectTable[1]:GetDesiredSize().X, LocalPosition.Y)
      Alignment:Set(0, Alignment.Y)
    end
    self.Overlay_Interactive.Slot:SetAlignment(Alignment)
    self.Overlay_Interactive:SetRenderTranslation(LocalPosition)
  end)
  self.Img_Mouse:SetVisibility(ESlateVisibility.Collapsed)
  for i = 1, #SelectTable do
    local Item = UIManager(self):_CreateWidgetNew("RegionMapSelectItem")
    self.ScrollBox_Interactive:AddChild(Item)
    Item:Init(SelectTable[i], self)
    if 1 == i then
      Item:SetFocus()
    end
  end
  self:UpdateWildMapKeys()
end

function M:OpenOptionSelect()
  self.Panel_Interactive:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  self.ScrollBox_Interactive:SetVisibility(ESlateVisibility.Collapsed)
  self.Interactive_Locate:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  self.Interactive_Locate.Wbox:GetChildAt(0):SetFocus()
  for _, Child in pairs(self.Interactive_Locate.Wbox:GetAllChildren():ToTable()) do
    Child:PlayAnimation(Child.In)
  end
  self:UpdateWildMapKeys()
end

function M:OnAreaClicked()
  if self:IsInteractiveOpen() and not self.AreaClicked then
    self.AreaClicked = true
    for _, Child in pairs(self.ScrollBox_Interactive:GetAllChildren():ToTable()) do
      Child:PlayAnimation(Child.Out)
    end
    for _, Child in pairs(self.Interactive_Locate.Wbox:GetAllChildren():ToTable()) do
      Child:PlayAnimation(Child.Out)
    end
    self.RealWildMap:ClosePanel(false)
    self:AddTimer(0.2, function()
      self.AreaClicked = false
      self.ScrollBox_Interactive:ClearChildren()
      self.Panel_Interactive:SetVisibility(ESlateVisibility.Collapsed)
      self:UpdateWildMapKeys()
    end)
  end
end

function M:IsInteractiveOpen()
  return self.Panel_Interactive:GetVisibility() == ESlateVisibility.SelfHitTestInvisible
end

function M:OnClickDispatch()
  DebugPrint("OnClickDispatch")
  self.RealWildMap.IsOpenDispatch = true
  self.RealWildMap:ClosePanel(true)
  self.RealWildMap:CloseForDispatch(true)
  self.RealWildMap:OnPanelOpen(5)
  self.Panel_UI:SetVisibility(ESlateVisibility.Collapsed)
  self:ShoworHideTopTab(false)
  self.DispatchList = self:CreateWidgetNew("DispatchList")
  if self.DispatchList == nil then
    return
  end
  self.Dispatch_List:AddChild(self.DispatchList)
  self.DispatchList:InitDispatch(self)
end

function M:OnCloseDispatch()
  DebugPrint("OnCloseDispatch")
  self.RealWildMap.IsOpenDispatch = false
  self.RealWildMap:ClosePanel(false)
  self.RealWildMap:CloseForDispatch(false)
  self.Panel_UI:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  self:ShoworHideTopTab(true)
  if self.DispatchDetail ~= nil then
    self.DispatchDetail:Close()
  end
  self.DispatchDetail = nil
  self.DispatchList = nil
  self.Dispatch = nil
  self.RealWildMap:BackToOriginalRegion()
  self:InitBottomTab()
end

function M:OpenAgentList()
  if self.DispatchList ~= nil then
    self.DispatchList:SetVisibility(ESlateVisibility.Collapsed)
  end
  self.RealWildMap.IsOpenDispatch = true
  self.RealWildMap:CloseForDispatch(true)
  if nil == self.DispatchAgentList then
    self.DispatchAgentList = self:CreateWidgetNew("DispatchAgentList")
    self.Dispatch_AgentList:AddChild(self.DispatchAgentList)
    self.DispatchAgentList:InitAgentList(self)
  else
    self.DispatchAgentList:Refresh()
  end
end

function M:CreateOrRefreshDispatchDetail(Dispatch)
  if self.DispatchDetail == nil then
    self.DispatchDetail = self:CreateWidgetNew("DispatchDetail")
    self.Dispatch_Detail:AddChild(self.DispatchDetail)
    self.DispatchDetail.Owner = self
    self.DispatchDetail:InitDispatchDetail(Dispatch)
  else
    self.DispatchDetail:RrefreshDispatchDetail(Dispatch)
  end
end

function M:OnKeyUp(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local OpenMapKey = CommonUtils:GetActionMappingKeyName("OpenMap")
  if InKeyName == OpenMapKey then
    self.bIsCanCloseByHotKey = true
  end
  return UWidgetBlueprintLibrary.Unhandled()
end

function M:OnReddotChange()
  local RedNode = ReddotManager.GetTreeNode(DataMgr.ReddotNode.Dispatch.Name)
  if RedNode.Count > 0 then
    self.Entrance_Dispatch.Reddot:SetVisibility(ESlateVisibility.Visible)
  else
    self.Entrance_Dispatch.Reddot:SetVisibility(ESlateVisibility.Collapsed)
  end
end

function M:InitPadTab()
end

function M:ShoworHideTopTab(bShow)
  if bShow then
    self.Tab_Top:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  else
    self.Tab_Top:SetVisibility(ESlateVisibility.Collapsed)
  end
end

function M:ShoworHideBottomTab(bShow)
  if not self.DeviceInPc then
    return
  end
  if bShow then
    self.Tab_Bottom:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  else
    self.Tab_Bottom:SetVisibility(ESlateVisibility.Collapsed)
  end
end

function M:OnUpdateUIStyleByInputTypeChange(CurInputDevice, CurGamepadName)
  if self.LastInputDevice == CurInputDevice then
    return
  end
  self.LastInputDevice = CurInputDevice
  if 1 == self.CurTabId then
    self:UpdateWorldMapKeys()
    self.LevelMap_World.Area03_Name:SetFocus()
    self.FloorWidget.Key_Controller_Up:SetVisibility(ESlateVisibility.Collapsed)
    self.FloorWidget.Key_Controller_Down:SetVisibility(ESlateVisibility.Collapsed)
  else
    self:UpdateWildMapKeys()
    if self:HasFocusedDescendants() or self:HasAnyUserFocus() then
      if self:IsInteractiveOpen() then
        if self.Interactive_Locate:GetVisibility() == ESlateVisibility.SelfHitTestInvisible then
          self.Interactive_Locate.Wbox:GetChildAt(0):SetFocus()
        elseif self.ScrollBox_Interactive:GetVisibility() == ESlateVisibility.SelfHitTestInvisible then
          self.ScrollBox_Interactive:GetChildAt(0):SetFocus()
        end
      elseif self.RealWildMap then
        if self.RealWildMap.IsOpenDispatch == true then
          if self.DispatchAgentList ~= nil then
            self.DispatchAgentList.List_Agent:SetFocus()
          end
          if nil ~= self.DispatchList then
            self.DispatchList:SetFocus()
          end
        elseif self.DispatchDetail then
          self.DispatchDetail:SetFocus()
        elseif not self.RealWildMap.LastPanelId then
          self.RealWildMap:SetFocus()
        end
      end
    else
      local TopUI = UIManager(self):GetLastestAndFocusableUIWidgetObj()
      TopUI:SetFocus()
    end
  end
end

function M:SetFocus_Lua()
end

function M:OnFocusReceived(MyGeometry, InFocusEvent)
  if self.DispatchAgentList == nil and nil == self.DispatchList and self.DispatchDetail then
    self.DispatchDetail:SetFocus()
    return UWidgetBlueprintLibrary.Handle
  elseif self.DispatchAgentList then
    self.DispatchAgentList.List_Agent:SetFocus()
    return UWidgetBlueprintLibrary.Handle
  elseif self.DispatchList then
    self.DispatchList:SetFocus()
    return UWidgetBlueprintLibrary.Handle
  end
  return UWidgetBlueprintLibrary.Unhandle
end

return M
