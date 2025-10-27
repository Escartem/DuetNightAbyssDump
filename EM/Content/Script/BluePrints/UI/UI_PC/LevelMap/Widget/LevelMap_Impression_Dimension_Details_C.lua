require("UnLua")
local ImpressionTypes = require("BluePrints.UI.UI_PC.Impression.ImpressionConst").ImpressionTypes
local M = Class("BluePrints.UI.BP_UIState_C")

function M:Close()
  if self.Animating then
    return
  end
  M.Super.Close(self)
  self.Animating = true
  self.DimensionGraph:SwitchActive(false)
  self.Panel:SetFocus()
end

function M:OnAnimationFinished(Animation)
  self.Animating = false
end

function M:Construct()
  local UIModePlatform = CommonUtils.GetDeviceTypeByPlatformName(self)
  if "Mobile" == UIModePlatform then
    self.bInMobile = true
  end
end

function M:Init(RegionId, Panel, bInShop)
  if self.Animating then
    return
  end
  self.Animating = true
  self.Panel = Panel
  self.RegionId = RegionId
  AudioManager(self):PlayUISound(self, "event:/ui/common/map_five_dimension_btn_hover", "", nil)
  local Avatar = GWorld:GetAvatar()
  local ImpressionAreaId = Avatar:GetImpressionAreaIdFromRegionId(RegionId)
  self:InitDimensionGraph(ImpressionAreaId)
  self.DimensionGraph:SwitchActive(true)
  self.Text_Area:SetText(GText(DataMgr.WorldMap[self.Panel.WorldId].WorldMapName))
  self.Text_Desc:SetText(GText("UI_RegionMap_ImpressionTitle"))
  self.Btn_Go:SetText(GText("UI_ImpressionShop_ShopName_Short"))
  self.Btn_Go:SetDefaultGamePadImg("Y")
  self.Btn_Go:BindEventOnClicked(self, self.GoShop)
  self.Btn_Close:Init("Close", self, self.Close)
  if self.Key_Tips then
    self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(UGameplayStatics.GetPlayerController(self, 0))
    self:RefreshOpInfoByInputDevice(self.GameInputModeSubsystem:GetCurrentInputType(), nil)
  end
  local RegionData = DataMgr.ImpressionRegion[ImpressionAreaId]
  self.ImpressionRegionId = ImpressionAreaId
  self.RegionPointId = RegionData.RegionPointId
  self.GoUnlocked = false
  if self.RegionPointId then
    local ConditionId = DataMgr.RegionPoint[self.RegionPointId].UnlockConditionId
    if ConditionId then
      self.GoUnlocked = ConditionUtils.CheckCondition(Avatar, ConditionId)
    end
  end
  self.Btn_Go:SetVisibility(not bInShop and self.GoUnlocked and ESlateVisibility.Visible or ESlateVisibility.Collapsed)
end

function M:InitDimensionGraph(ImpressionAreaId)
  self.DimensionGraph = self.Dimension
  local RegionInfo = DataMgr.ImpressionRegion[ImpressionAreaId]
  if RegionInfo and RegionInfo.UIName then
    local Widget = self:CreateWidgetNew(RegionInfo.UIName)
    if Widget then
      self.Group_Anchor:ClearChildren()
      self.Group_Anchor:AddChild(Widget)
      self.DimensionGraph = Widget
    end
  end
  self.DimensionGraph:Init(ImpressionAreaId)
end

function M:GoShop()
  self:Close()
  if self.ImpressionRegionId and self.RegionPointId then
    self.Panel:ChangeRegion(self.ImpressionRegionId, function()
      self.Panel:OnRegionPointClick(self.RegionPointId, true)
    end)
  end
end

function M:OnKeyDown(MyGeometry, InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(UKismetInputLibrary.GetKey(InKeyEvent))
  if "Escape" == InKeyName or InKeyName == UIConst.GamePadKey.FaceButtonRight then
    self:Close()
  elseif InKeyName == UIConst.GamePadKey.FaceButtonTop and self.GoUnlocked then
    self:GoShop()
  end
  return UE4.UWidgetBlueprintLibrary.Handled()
end

function M:OnUpdateUIStyleByInputTypeChange(CurInputDevice, CurGamepadName)
  if self.bInMobile then
    return
  end
  self:SetFocus()
  if CurInputDevice == ECommonInputType.Gamepad then
    local KeyInfo = {
      {
        KeyInfoList = {
          {
            Type = "Img",
            ImgShortPath = "B",
            ClickCallback = self.Close,
            Owner = self
          }
        },
        Desc = GText("UI_BACK")
      }
    }
    self.Key_Tips:UpdateKeyInfo(KeyInfo)
  else
    local KeyInfo = {
      {
        KeyInfoList = {
          {
            Type = "Text",
            Text = "Esc",
            ClickCallback = self.Close,
            Owner = self
          }
        },
        Desc = GText("UI_BACK")
      }
    }
    self.Key_Tips:UpdateKeyInfo(KeyInfo)
  end
end

return M
