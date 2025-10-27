require("UnLua")
local Component = {}

function Component:InitComponentCoroutine()
  local Coroutine = CreateCoroutine(self.InitFloorBox)
  table.insert(self.InitCoroutines, Coroutine)
  coroutine.resume(Coroutine, self, #self.InitCoroutines)
end

function Component:ClearData()
  if self.BuildingFloor2Map then
    for _, floorTable in pairs(self.BuildingFloor2Map) do
      for _, floor in pairs(floorTable) do
        floor:RemoveFromParent()
      end
    end
    self.BuildingFloor2Map = {}
  end
end

function Component:InitFloorBox(CoroutineIndex)
  self.DefaultFloorId = nil
  local sortFloor = {}
  if self.MapImage and self.MapImage.Panel_IndoorMap then
    for i = 1, self.MapImage.Panel_IndoorMap:GetChildrenCount() do
      local panel = self.MapImage.Panel_IndoorMap:GetChildAt(i - 1)
      for j = 1, panel:GetChildrenCount() do
        local floorMap = panel:GetChildAt(j - 1)
        local name, floor = self:GetBuildingNameAndId(floorMap:GetName())
        if floor then
          if not self.BuildingFloor2Map[floor] then
            table.insert(sortFloor, floor)
            self.BuildingFloor2Map[floor] = {}
          end
          table.insert(self.BuildingFloor2Map[floor], floorMap)
          if not self.BuildingName2Map[name] then
            self.BuildingName2Map[name] = {}
          end
          table.insert(self.BuildingName2Map[name], floorMap)
          self:CreateMapFog(floorMap, floor, tonumber(name))
        end
      end
    end
  end
  if not self.FloorWidget then
    self:InitCoroutineCheck(CoroutineIndex)
    return
  end
  self.FloorWidget.Key_Controller_Up:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "Up"}
    }
  })
  self.FloorWidget.Key_Controller_Down:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "Down"}
    }
  })
  self.FloorWidget:SetVisibility(ESlateVisibility.Collapsed)
  self.LastFloorWidget = nil
  self.FloorWidgetTable = {}
  local baseFloor = self.FloorWidget:NewFloor()
  baseFloor.Btn.OnClicked:Clear()
  baseFloor.Btn.OnClicked:Add(self, function()
    AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_sort_tab", nil, nil)
    self:OnFloorBtnClicked(self.MaxFloorId, false)
  end)
  baseFloor.Switch_Show:SetActiveWidgetIndex(0)
  self.FloorWidgetTable[self.MaxFloorId] = baseFloor
  baseFloor.SizeBox:SetRenderOpacity(0)
  local hasFloor = false
  table.sort(sortFloor, function(x, y)
    return y < x
  end)
  for _, floorId in pairs(sortFloor) do
    local floorWidget = self.FloorWidget:NewFloor()
    floorWidget.Btn.OnClicked:Clear()
    floorWidget.Btn.OnClicked:Add(self, function()
      AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_sort_tab", nil, nil)
      self:OnFloorBtnClicked(floorId, false)
    end)
    floorWidget.SizeBox:SetRenderOpacity(0)
    self.FloorWidgetTable[floorId] = floorWidget
    local index = 1
    if floorId < 1 then
      index = 2
    end
    floorWidget.Switch_Show:SetActiveWidgetIndex(index)
    hasFloor = true
    if floorId > 0 then
      baseFloor:RemoveFromParent()
      self.FloorWidget.WrapBox:AddChild(baseFloor)
    end
  end
  if not hasFloor then
    self.FloorWidgetTable = {}
    self.FloorWidget:ClearData()
    self.FloorWidget.Key_Controller_Up:SetVisibility(ESlateVisibility.Collapsed)
    self.FloorWidget.Key_Controller_Down:SetVisibility(ESlateVisibility.Collapsed)
    self:InitCoroutineCheck(CoroutineIndex)
    return
  end
  if self.GameInputModeSubsystem:GetCurrentInputType() == ECommonInputType.Gamepad then
    self.FloorWidget.Key_Controller_Up:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self.FloorWidget.Key_Controller_Down:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  end
  self.FloorWidget:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  if not self.IsMiniMap and self.IsInRegion then
    local battleMain = GWorld.GameInstance:GetGameUIManager():GetUI("BattleMain")
    if battleMain then
      local battleMap = battleMain.Battle_Map or battleMain.Battle_Map_PC
      if battleMap then
        self.DefaultFloorId = battleMap.WildMap.CurrentFloorId
      end
    end
  end
  if not self.DefaultFloorId then
    self.DefaultFloorId = self.MaxFloorId
  end
  self:InitCoroutineCheck(CoroutineIndex)
end

function Component:OnFloorBtnClicked(FloorId, NeedClickAni)
  self:ShowFloor(FloorId)
  local Floor = self.FloorWidgetTable[FloorId]
  if not Floor then
    return
  end
  Floor.IsSelected = true
  if self.LastFloorWidget and self.LastFloorWidget ~= Floor then
    self.LastFloorWidget:PlayAnimation(self.LastFloorWidget.Normal)
    self.LastFloorWidget.IsSelected = false
  end
  self.LastFloorWidget = Floor
  if NeedClickAni then
    Floor:PlayAnimation(Floor.Click)
  end
  self:OnScaleChange(self.CurrentPercent)
end

function Component:ShowFloor_Component(FloorId)
  for floor, mapArray in pairs(self.BuildingFloor2Map) do
    for _, map in pairs(mapArray) do
      if floor == FloorId then
        map:SetRenderOpacity(1)
        map.Slot:SetZOrder(1)
      else
        map:SetRenderOpacity(0.3)
        map.Slot:SetZOrder(0)
      end
    end
  end
  if FloorId == self.MaxFloorId then
    if self.NewMapType then
      for _, baseFloor in pairs(self.MapImageTable) do
        baseFloor:SetRenderOpacity(1)
      end
    else
      self.MapImage.Img_Map:SetRenderOpacity(1)
    end
    if self.MapImage.Panel_IndoorMap then
      self.MapImage.Panel_IndoorMap.Slot:SetZOrder(-1)
    end
  else
    if self.NewMapType then
      for _, baseFloor in pairs(self.MapImageTable) do
        baseFloor:SetRenderOpacity(0.3)
      end
    else
      self.MapImage.Img_Map:SetRenderOpacity(0.3)
    end
    if self.MapImage.Panel_IndoorMap then
      self.MapImage.Panel_IndoorMap.Slot:SetZOrder(1)
    end
  end
end

return Component
