require("UnLua")
local Common_GuidePoint_C = Class("BluePrints.UI.BP_EMUserWidget_C")
local TaskUtils = require("BluePrints.UI.TaskPanel.TaskUtils")

function Common_GuidePoint_C:Construct()
  self.Button_GuidePoint.OnClicked:Add(self, self.OnClicked)
  self.Button_GuidePoint.OnHovered:Add(self, self.OnHover)
  self.Button_GuidePoint.OnUnhovered:Add(self, self.OnUnhovered)
  self.FloorId = nil
  self.IsSelected = false
  self.LoopUISoundEnable = false
end

function Common_GuidePoint_C:Destruct()
  self.Button_GuidePoint.OnClicked:Clear()
end

function Common_GuidePoint_C:Init(Parent, Data, ClickFunction, HoverFunction, UnoverFunction)
  self.Parent = Parent
  self.Data = Data
  self.ClickFunction = ClickFunction
  self.HoverFunction = HoverFunction
  self.UnoverFunction = UnoverFunction
  self:PlayAnimation(self.Loop, 0, 0)
end

function Common_GuidePoint_C:OnClicked()
  if self.ClickFunction and type(self.ClickFunction) == "function" then
    self.IsSelected = true
    self.ClickFunction(self.Parent, self.FloorId, self)
    self:BindToAnimationFinished(self.Press, {
      self,
      function()
        self:PlayAnimation(self.Click)
      end
    })
    self:PlayAnimation(self.Press)
  end
end

function Common_GuidePoint_C:OnHover()
  if self.HoverFunction and type(self.HoverFunction) == "function" and not self.IsSelected then
    self.HoverFunction(self.Parent)
    self:PlayAnimation(self.Hover)
  end
end

function Common_GuidePoint_C:OnUnhovered()
  if self.UnoverFunction and type(self.UnoverFunction) == "function" and not self.IsSelected then
    self.UnoverFunction(self.Parent)
    if not self:IsAnimationPlaying(self.Loop) and not self.IsSelected then
      self:PlayAnimation(self.Loop, 0, 0)
    end
    if not self.IsSelected then
      self:PlayAnimation(self.Normal)
    end
  end
end

function Common_GuidePoint_C:ClearAllFunc()
  self.Button_GuidePoint.OnClicked:Clear()
  self.Button_GuidePoint.OnHovered:Clear()
  self.Button_GuidePoint.OnUnhovered:Clear()
  self.IsSelected = false
end

function Common_GuidePoint_C:InitMiniGuidePointWidget(GuidePointName, Player)
  self.PointName = GuidePointName
  self.Player = Player
end

function Common_GuidePoint_C:TryChangeStyleByRange()
  if self.IsMapPoint and self.Player and self.PointName ~= nil then
    if not self:CheckIsNeedShowRangeStyle(self.PointName) then
      self.Img_GuidePoint_Icon:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
      self.Img_Range:SetVisibility(UE4.ESlateVisibility.Collapsed)
    else
      self.Img_GuidePoint_Icon:SetVisibility(UE4.ESlateVisibility.Collapsed)
      self.Img_Range:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    end
  end
end

function Common_GuidePoint_C:CheckIsNeedShowRangeStyle(Name)
  local GuidePointLocData = require("BluePrints.UI.TaskPanel/QuestGuidePointLocData")
  if self.Player == nil then
    return
  end
  if nil == GuidePointLocData[Name] or nil == GuidePointLocData[Name].R or not IsValid(self.Player) then
    return false
  end
  local RealRadius
  if GuidePointLocData[Name] and GuidePointLocData[Name].R and GuidePointLocData[Name].R > 0 then
    RealRadius = (GuidePointLocData[Name].R + 5) / 100
  end
  local PointLoc = FVector(GuidePointLocData[Name].X, GuidePointLocData[Name].Y, GuidePointLocData[Name].Z)
  local Distance = UKismetMathLibrary.Vector_Distance2D(self.Player.CurrentLocation, PointLoc) / 100.0
  local IsShowRange = RealRadius > Distance
  if nil ~= RealRadius and IsShowRange then
    return true
  end
  return false
end

function Common_GuidePoint_C:OnEnabled(InNpc)
  InNpc.IsNeedCollapsedOtherBubble = true
  InNpc:CollapsedOtherBubble()
  self:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
end

function Common_GuidePoint_C:OnDisabled(InNpc)
  InNpc.IsNeedCollapsedOtherBubble = false
  self:SetVisibility(UE4.ESlateVisibility.Collapsed)
end

function Common_GuidePoint_C:InitNpcSideQuestBubble(ParentHeadWidget)
  self:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self.ParentHeadWidget = ParentHeadWidget
end

function Common_GuidePoint_C:InitBubble(InWidget)
  if InWidget and InWidget.AttachedWidgetComponent then
    local Owner = InWidget.AttachedWidgetComponent:GetOwner()
    if Owner then
      for InQuestChainId, Data in pairs(DataMgr.QuestChain) do
        if Data and Data.QuestNpcId and Data.QuestNpcId == Owner.UnitId then
          if DataMgr.QuestChain[InQuestChainId] and DataMgr.QuestChain[InQuestChainId].QuestChainType == Const.SpecialSideQuestChainType then
            self.Img_GuidePoint_Icon:SetBrushResourceObject(LoadObject("/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_SpSideMission_Un.T_Gp_SpSideMission_Un"))
          else
            self.Img_GuidePoint_Icon:SetBrushResourceObject(LoadObject("/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_SideMission_Un.T_Gp_SideMission_Un"))
          end
        end
      end
    end
  end
end

function Common_GuidePoint_C:PlayLoopUISound()
  if self.LoopUISoundEnable then
    AudioManager(self):PlayUISound(self, "event:/ui/common/map_track_warning", "", {
      pan = self:GetCurrentSoundPosValue()
    })
  end
end

function Common_GuidePoint_C:GetCurrentSoundPosValue()
  local ScreenSize = UIManager(self):GetDesignedScreenSize(self)
  local _, ViewportPos = USlateBlueprintLibrary.AbsoluteToViewport(self, UUIFunctionLibrary.GetGeometryAbsolutePosition(self:GetCachedGeometry()))
  local Value = (ScreenSize.X - ViewportPos.X) / ScreenSize.X
  Value = (math.clamp(Value, 0, 1) - 0.5) * 2 * -1
  return Value
end

function Common_GuidePoint_C:SetLoopUISoundEnable(Enabled)
  self.LoopUISoundEnable = Enabled
end

return Common_GuidePoint_C
