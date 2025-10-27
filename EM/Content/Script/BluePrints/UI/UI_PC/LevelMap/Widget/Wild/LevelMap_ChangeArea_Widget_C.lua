require("UnLua")
local M = Class("BluePrints.UI.BP_EMUserWidget_C")
local TaskUtils = require("BluePrints.UI.TaskPanel.TaskUtils")
local GuidePointLocData = require("BluePrints.UI.TaskPanel/QuestGuidePointLocData")

function M:Construct()
  self.Text_Title:SetText(GText("UI_RegionMap_SelectRegion"))
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(self)
  self.GameInputModeSubsystem.OnInputMethodChanged:Add(self, self.RefreshOpInfoByInputDevice)
  self:RefreshOpInfoByInputDevice(self.GameInputModeSubsystem:GetCurrentInputType())
  self.RegionList = {}
  self.WorldList = {}
  self.Region2World = {}
  self.LastWorldWidget = nil
  self.LastWorldWidgetId = nil
  self.LastRegionWidgetId = nil
  self.CurrentRegionId = nil
  local avatar = GWorld:GetAvatar()
  for id, worldData in pairs(DataMgr.WorldMap) do
    if worldData.WorldMapUnlockCondition and not ConditionUtils.CheckCondition(avatar, worldData.WorldMapUnlockCondition) and not Const.UnlockRegionTeleport then
    else
      local worldWidget = NewObject(self.RegionClass, self)
      self.WrapBox:AddChild(worldWidget)
      self.WorldList[id] = worldWidget
      worldWidget.Tip_SpMission.Text_Content:SetText(GText("UI_QUEST_SpecialSlide"))
      worldWidget.WS_Type:SetActiveWidgetIndex(0)
      local IconTexture = TaskUtils:GetIconTextureByTrackQuestChainType()
      if IconTexture then
        worldWidget.GuidePoint.Img_GuidePoint_Icon:SetBrushResourceObject(IconTexture)
      end
      if self:CheckIsNeedShowGuideInWorldWidgtItem(id) then
        worldWidget.GuidePoint:PlayAnimation(worldWidget.GuidePoint.Loop, 0, 0)
        worldWidget.GuidePoint:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
      else
        worldWidget.GuidePoint:StopAllAnimations()
        worldWidget.GuidePoint:SetVisibility(ESlateVisibility.Collapsed)
      end
      worldWidget.Text_AreaName:SetText(GText(worldData.WorldMapName))
      worldWidget.Btn_Show.OnClicked:Add(self, function()
        AudioManager(self):PlayUISound(self, "event:/ui/common/click_level_02", nil, nil)
        self:OnWorldClick(id)
      end)
      if self:CheckIsNeedShowSpecialTaskGuideInWorldWidgtItem(id) then
        self.WorldList[id].Tip_SpMission:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
      else
        self.WorldList[id].Tip_SpMission:SetVisibility(ESlateVisibility.Collapsed)
      end
      worldWidget.WrapBox:SetVisibility(ESlateVisibility.Collapsed)
      if worldData.RegionIcon then
        do
          local Icon = LoadObject(worldData.RegionIcon)
          if Icon then
            worldWidget.Icon_Camp:SetBrushResourceObject(Icon)
          end
        end
      end
      for _, regionMapId in pairs(worldData.WorldMapRegion) do
        for _, subRegionId in pairs(DataMgr.Region[DataMgr.RegionMap[regionMapId].RegionId].IsRandom) do
          self.Region2World[subRegionId] = id
        end
      end
    end
  end
end

function M:Init(Parent)
  self.Parent = Parent
  self.LastWorldWidget = nil
  self.LastWorldWidgetId = nil
  self.LastRegionWidgetId = nil
  for RegionMapId, Data in pairs(DataMgr.RegionMap) do
    if Data.RegionId == self.Parent.RegionID then
      self.LastRegionWidgetId = RegionMapId
      break
    end
  end
  local Avatar = GWorld:GetAvatar()
  self.CurrentRegionId = Avatar.CurrentRegionId
  for _, world in pairs(self.WorldList) do
    world.IsOpen = false
    world:StopAllAnimations()
    world.WrapBox:SetVisibility(ESlateVisibility.Collapsed)
  end
  local worldId = self.Region2World[self.CurrentRegionId]
  self.DefaultFocus = false
  if worldId then
    self:OnWorldClick(worldId, true)
  end
  if not self.DefaultFocus then
    self.WrapBox:GetChildAt(self.WrapBox:GetChildrenCount() - 1):SetFocus()
  end
end

function M:Destruct()
  self:ClearData()
  self.GameInputModeSubsystem.OnInputMethodChanged:Remove(self, self.RefreshOpInfoByInputDevice)
end

function M:OnWorldClick(id)
  if self.LastWorldWidget and self.LastWorldWidget ~= self.WorldList[id] and self.LastWorldWidget.IsOpen then
    self.LastWorldWidget:PlayAnimation(self.LastWorldWidget.Normal)
    self.LastWorldWidget.IsOpen = false
  end
  if self.LastWorldWidget ~= self.WorldList[id] then
    self.WorldList[id]:PlayAnimation(self.WorldList[id].Click)
    self.WorldList[id].IsOpen = true
  elseif self.WorldList[id].IsOpen then
    self.WorldList[id]:PlayAnimation(self.WorldList[id].Normal)
    self.WorldList[id].IsOpen = false
  else
    self.WorldList[id]:PlayAnimation(self.WorldList[id].Click)
    self.WorldList[id].IsOpen = true
  end
  for _, region in pairs(self.RegionList) do
    region.Btn_ShowUp.OnClicked:Clear()
    region:RemoveFromParent()
  end
  self.RegionList = {}
  if self.LastWorldWidget then
    self.LastWorldWidget.WrapBox:SetVisibility(ESlateVisibility.Collapsed)
    if self:CheckIsNeedShowGuideInWorldWidgtItem(self.LastWorldWidgetId) then
      self.WorldList[self.LastWorldWidgetId].GuidePoint:PlayAnimation(self.WorldList[self.LastWorldWidgetId].GuidePoint.Loop, 0, 0)
      self.WorldList[self.LastWorldWidgetId].GuidePoint:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    else
      self.WorldList[self.LastWorldWidgetId].GuidePoint:StopAllAnimations()
      self.WorldList[self.LastWorldWidgetId].GuidePoint:SetVisibility(ESlateVisibility.Collapsed)
    end
  end
  for OtherId, v in pairs(self.WorldList) do
    if OtherId ~= id then
      if self:CheckIsNeedShowSpecialTaskGuideInWorldWidgtItem(OtherId) then
        self.WorldList[OtherId].Tip_SpMission:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
      else
        self.WorldList[OtherId].Tip_SpMission:SetVisibility(ESlateVisibility.Collapsed)
      end
    end
  end
  if self:CheckIsNeedShowGuideInWorldWidgtItem(id) then
    self.WorldList[id].GuidePoint:PlayAnimation(self.WorldList[id].GuidePoint.Loop, 0, 0)
    self.WorldList[id].GuidePoint:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  else
    self.WorldList[id].GuidePoint:StopAllAnimations()
    self.WorldList[id].GuidePoint:SetVisibility(ESlateVisibility.Collapsed)
  end
  if self.WorldList[id].IsOpen == false and self:CheckIsNeedShowSpecialTaskGuideInWorldWidgtItem(id) then
    self.WorldList[id].Tip_SpMission:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  else
    self.WorldList[id].Tip_SpMission:SetVisibility(ESlateVisibility.Collapsed)
  end
  if self.LastWorldWidget == self.WorldList[id] and not self.WorldList[id].IsOpen then
    if self.WorldList[self.Region2World[self.CurrentRegionId]] then
      self.WorldList[self.Region2World[self.CurrentRegionId]].WS_Type:SetActiveWidgetIndex(1)
    end
    return
  end
  self.WorldList[id].WrapBox:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  local WS_Type = false
  local Avatar = GWorld:GetAvatar()
  for _, regionMapId in pairs(DataMgr.WorldMap[id].WorldMapRegion) do
    local regionData = DataMgr.Region[DataMgr.RegionMap[regionMapId].RegionId]
    if regionData.RegionId == 2101 or DataMgr.RegionMap[regionMapId].RegionMapUnlockCondition and not ConditionUtils.CheckCondition(Avatar, DataMgr.RegionMap[regionMapId].RegionMapUnlockCondition) and not Const.UnlockRegionTeleport then
    else
      local widget = NewObject(self.IndoorClass, self)
      self.RegionList[regionMapId] = widget
      self.WorldList[id].WrapBox:AddChild(widget)
      local IconTexture = TaskUtils:GetIconTextureByTrackQuestChainType()
      if IconTexture then
        widget.GuidePoint.Img_GuidePoint_Icon:SetBrushResourceObject(IconTexture)
      end
      widget.Icon_Camp:SetVisibility(regionData.RegionType == "EX" and ESlateVisibility.SelfHitTestInvisible or ESlateVisibility.Collapsed)
      widget.Text_AreaName:SetText(GText(regionData.RegionName))
      widget.Tip_SpMission.Text_Content:SetText(GText("UI_QUEST_SpecialSlide"))
      widget.WS_Type:SetActiveWidgetIndex(0)
      if self:CheckIsNeedShowGuideInDoorWidgtItem(regionMapId) and IsValid(widget.GuidePoint) then
        widget.GuidePoint:PlayAnimation(widget.GuidePoint.Loop, 0, 0)
        widget.GuidePoint:SetLoopUISoundEnable(true)
        widget.GuidePoint:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
        self.WorldList[id].GuidePoint:SetVisibility(ESlateVisibility.Collapsed)
      else
        widget.GuidePoint:StopAllAnimations()
        widget.GuidePoint:SetVisibility(ESlateVisibility.Collapsed)
      end
      if self:CheckIsNeedShowSpecialTaskGuideInDoorWidgtItem(regionMapId) and IsValid(widget.Tip_SpMission) then
        widget.Tip_SpMission:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
        self.WorldList[id].Tip_SpMission:SetVisibility(ESlateVisibility.Collapsed)
      else
        widget.Tip_SpMission:SetVisibility(ESlateVisibility.Collapsed)
      end
      for _, subRegionId in pairs(regionData.IsRandom) do
        if subRegionId == self.CurrentRegionId then
          widget.WS_Type:SetActiveWidgetIndex(1)
          WS_Type = true
          break
        end
      end
      if regionData.RegionId == 1011 and self.CurrentRegionId == 210101 then
        widget.WS_Type:SetActiveWidgetIndex(1)
        WS_Type = true
      end
      widget.Btn_ShowUp.OnClicked:Add(self, function()
        AudioManager(self):PlayUISound(self, "event:/ui/common/click_level_03", nil, nil)
        if self.LastRegionWidgetId and self.RegionList[self.LastRegionWidgetId] and self.LastRegionWidgetId ~= regionMapId then
          self.RegionList[self.LastRegionWidgetId]:PlayAnimation(widget.Normal)
        end
        widget:PlayAnimation(widget.Click)
        if self.LastRegionWidgetId ~= regionMapId then
          self.Parent:OnRegionClick(regionData.RegionId)
        end
        self.LastRegionWidgetId = regionMapId
      end)
      widget:PlayAnimation(self.LastRegionWidgetId == regionMapId and widget.Click or widget.Normal)
      if self.LastRegionWidgetId == regionMapId then
        widget:SetFocus()
        self.DefaultFocus = true
      end
    end
  end
  if self.WorldList[self.Region2World[self.CurrentRegionId]] then
    self.WorldList[self.Region2World[self.CurrentRegionId]].WS_Type:SetActiveWidgetIndex(WS_Type and 0 or 1)
  end
  self.LastWorldWidget = self.WorldList[id]
  self.LastWorldWidgetId = id
end

function M:ShowOrHideRegionMapWidgtItemByTimeLine()
  if not self.WorldList then
    return
  end
  local MapRegionType = self.Parent.MainMap.MapRegionType
  print(_G.LogTag, " [THY] MapRegionType: ", MapRegionType)
  for id, worldWidget in pairs(self.WorldList) do
    local UIRegionType = DataMgr.WorldMap[id].UIRegionType
    print(_G.LogTag, " [THY] UIRegionType: ", UIRegionType)
    local isNeedShowByRegionType = "EX" == MapRegionType and UIRegionType == MapRegionType or ("Now" == MapRegionType or nil == MapRegionType) and "EX" ~= UIRegionType
    print(_G.LogTag, " [THY] isNeedShowByRegionType: ", isNeedShowByRegionType)
    if not isNeedShowByRegionType then
      worldWidget:SetVisibility(ESlateVisibility.Collapsed)
    else
      worldWidget:SetVisibility(ESlateVisibility.Visible)
    end
  end
end

function M:CheckIsNeedShowGuideInWorldWidgtItem(MapId)
  local Info = TaskUtils:GetTrackingQuestDetailInfo()
  if Info and Info.IsFairyLand then
    return false
  end
  local _, RegionMapId = TaskUtils:GetTrackingQuestMapInfo()
  if not RegionMapId then
    return false
  end
  if not (RegionMapId and DataMgr.RegionMap[RegionMapId]) or not DataMgr.RegionMap[RegionMapId].RegionId then
    return false
  end
  local WorldRegionIds = DataMgr.WorldMap[MapId].WorldMapRegion
  if WorldRegionIds then
    for _, v in pairs(WorldRegionIds) do
      if RegionMapId == v then
        return true
      end
    end
  end
  return false
end

function M:CheckIsNeedShowSpecialTaskGuideInWorldWidgtItem(MapId)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return false
  end
  for QuestChainId, QuestChainData in pairs(DataMgr.QuestChain) do
    if nil == QuestChainData or nil == QuestChainData.SpecialQuestDisplayName or nil == QuestChainData.QuestNpcId or QuestChainData.QuestChainType ~= Const.SpecialSideQuestChainType then
    elseif Avatar.QuestChains[QuestChainId] and 1 == Avatar.QuestChains[QuestChainId].State and GuidePointLocData[QuestChainData.SpecialQuestDisplayName] and GuidePointLocData[QuestChainData.SpecialQuestDisplayName].SubRegionId > 0 then
      local SubRegionId = GuidePointLocData[QuestChainData.SpecialQuestDisplayName].SubRegionId
      local TaskRegionMapId = DataMgr.Region[DataMgr.SubRegion[SubRegionId].RegionId].RegionMapId
      local WorldRegionIds = DataMgr.WorldMap[MapId].WorldMapRegion
      if WorldRegionIds then
        for _, v in pairs(WorldRegionIds) do
          if TaskRegionMapId == v then
            return true
          end
        end
      end
    end
  end
  return false
end

function M:CheckIsNeedShowGuideInDoorWidgtItem(RegionId)
  local _, QuestRegionMapId = TaskUtils:GetTrackingQuestMapInfo()
  if not QuestRegionMapId then
    return false
  end
  if not (QuestRegionMapId and DataMgr.RegionMap[QuestRegionMapId]) or not DataMgr.RegionMap[QuestRegionMapId].RegionId then
    return false
  end
  return RegionId == QuestRegionMapId
end

function M:CheckIsNeedShowSpecialTaskGuideInDoorWidgtItem(RegionId)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return false
  end
  for QuestChainId, QuestChainData in pairs(DataMgr.QuestChain) do
    if nil == QuestChainData or nil == QuestChainData.SpecialQuestDisplayName or nil == QuestChainData.QuestNpcId or QuestChainData.QuestChainType ~= Const.SpecialSideQuestChainType then
    elseif Avatar.QuestChains[QuestChainId] and 1 == Avatar.QuestChains[QuestChainId].State and GuidePointLocData[QuestChainData.SpecialQuestDisplayName] and GuidePointLocData[QuestChainData.SpecialQuestDisplayName].SubRegionId > 0 then
      local SubRegionId = GuidePointLocData[QuestChainData.SpecialQuestDisplayName].SubRegionId
      local TaskRegionId = DataMgr.SubRegion[SubRegionId].RegionId
      local CurRegionMapId = DataMgr.RegionMap[RegionId].RegionId
      if TaskRegionId == CurRegionMapId then
        return true
      end
    end
  end
  return false
end

function M:ClearData()
  for _, region in pairs(self.RegionList) do
    region.Btn_ShowUp.OnClicked:Clear()
    region:RemoveFromParent()
  end
  for _, world in pairs(self.WorldList) do
    world.Btn_Show.OnClicked:Clear()
    world:RemoveFromParent()
  end
end

function M:OnKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if InKeyName == UIConst.GamePadKey.FaceButtonBottom then
  elseif "Escape" == InKeyName or InKeyName == UIConst.GamePadKey.FaceButtonRight then
    self.Parent:ClosePanel()
  end
  return UWidgetBlueprintLibrary.Handled()
end

function M:OnKeyBackClick()
  self.Parent:ClosePanel()
end

function M:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  if self.Key_Back then
    if CurInputDevice == ECommonInputType.Gamepad then
      self.Key_Back:CreateCommonKey({
        KeyInfoList = {
          {Type = "Img", ImgShortPath = "B"}
        },
        Desc = GText("UI_BACK")
      })
    else
      self.Key_Back:CreateCommonKey({
        KeyInfoList = {
          {
            Type = "Text",
            Text = "Esc",
            Owner = self,
            ClickCallback = self.OnKeyBackClick
          }
        },
        Desc = GText("UI_BACK")
      })
    end
  end
  if CurInputDevice == ECommonInputType.Gamepad and self.WorldList then
    for _, WorldWidget in pairs(self.WorldList) do
      WorldWidget:SetFocus()
      break
    end
  end
end

function M:OnAnimationFinished(Animation)
  if Animation == self.Auto_Out then
    self:SetVisibility(ESlateVisibility.Collapsed)
    for _, World in pairs(self.WorldList) do
      World.GuidePoint:SetLoopUISoundEnable(false)
    end
    for _, Region in pairs(self.RegionList) do
      Region.GuidePoint:SetLoopUISoundEnable(false)
    end
  end
  self.Overridden.OnAnimationFinished(self, Animation)
end

function M:OnAnimationStarted(Animation)
  if Animation == self.Auto_In then
    for _, World in pairs(self.WorldList) do
      World.GuidePoint:SetLoopUISoundEnable(true)
    end
    for _, Region in pairs(self.RegionList) do
      Region.GuidePoint:SetLoopUISoundEnable(true)
    end
  end
end

return M
