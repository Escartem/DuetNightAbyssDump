require("UnLua")
local WBP_Rouge_TalentTree_P_C = Class("BluePrints.UI.BP_EMUserWidget_C")

function WBP_Rouge_TalentTree_P_C:Construct()
  self.SelectedId = nil
  self.IsActivating = false
  self.BranchSumTalent = 0
  self.ActivedBranchTalent = 0
  self.Points = {}
  self.SelectWidget = {}
  self.PointLocation = {}
  self.Lines = {}
  self.Talent2PostTalents = {}
  self.PostTalent2Talents = {}
  self.CustomTargetTalentId = {}
  self.BranchActiveTalent = {}
  self.RougeTalent = DataMgr.RougeLikeTalent
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
  if IsValid(self.GameInputModeSubsystem) then
    self:RefreshOpInfoByInputDevice(self.GameInputModeSubsystem:GetCurrentInputType(), self.GameInputModeSubsystem:GetCurrentGamepadName())
  end
  self:InitListenEvent()
  self:InitWidgetInfoInGamePad()
end

function WBP_Rouge_TalentTree_P_C:NewPoint(TalentId, TalentType)
  local Point, Select
  if 1 == TalentType then
    Point, Select = self.NewPointS(self)
  else
    Point, Select = self.NewPointM(self)
  end
  Point:SetRenderScale(UKismetMathLibrary.Vector2D_One())
  Select:SetRenderScale(UKismetMathLibrary.Vector2D_One())
  return Point, Select
end

function WBP_Rouge_TalentTree_P_C:NewLine()
  local Line = self.Overridden.NewLine(self)
  Line:SetRenderScale(UKismetMathLibrary.Vector2D_One())
  return Line
end

function WBP_Rouge_TalentTree_P_C:OnTeleportPointClick(Id, DoNotPlayAnimation)
  if self.SelectedId and self.SelectedId == Id then
    return
  end
  if self.SelectedId then
    self.Points[self.SelectedId].IsSelected = false
    local Select = self.SelectWidget[self.SelectedId]
    Select:PlayAnimation(Select.UnSelect)
  end
  self.SelectedId = Id
  self.Parent:OpenTips(self.SelectedId, DoNotPlayAnimation)
end

function WBP_Rouge_TalentTree_P_C:ChangeBranch(Branch)
  self:Clear()
  local AllActiveTalent = {}
  local Avatar = GWorld:GetAvatar()
  self.FarthestTalentId = nil
  local FarthestPoint, FarthestX, ShortestX
  self.DefaultTalentPoint = nil
  self.Branch = Branch
  if Avatar then
    AllActiveTalent = Avatar.RougeLike.Talent
  end
  for TalentId, RougeTalentInfo in pairs(self.RougeTalent) do
    if RougeTalentInfo.Branch == self.Branch then
      self.BranchSumTalent = self.BranchSumTalent + 1
      if AllActiveTalent[TalentId] then
        self.ActivedBranchTalent = self.ActivedBranchTalent + 1
        self.BranchActiveTalent[TalentId] = true
      end
      local Point, Select = self:NewPoint(TalentId, RougeTalentInfo.Type, RougeTalentInfo.Icon)
      local Position = FVector2D(RougeTalentInfo.IconLoc[1], RougeTalentInfo.IconLoc[2])
      Point:SaveBtnSizeXY()
      if not FarthestX or FarthestX < Position.X then
        self.FarthestTalentId = TalentId
        FarthestPoint = Point
        FarthestX = Position.X
        self.FarthestX = FarthestX
      end
      if not ShortestX or ShortestX > Position.X then
        ShortestX = Position.X
        self.ShortestX = Position.X
      end
      local PointCanvasSlot = UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(Point)
      local SelectCanvasSlot = UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(Select)
      local CanVasSizeX = PointCanvasSlot:GetSize().X / 2
      PointCanvasSlot:SetPosition(Position)
      SelectCanvasSlot:SetPosition(Position)
      Point.Position = Position
      Select.WidgetSwitcher_0:SetActiveWidgetIndex(3 - RougeTalentInfo.Type)
      Select:SetVisibility(UE4.ESlateVisibility.HitTestInvisible)
      Select:PlayAnimation(Select.UnSelect)
      self.Points[TalentId] = Point
      self.SelectWidget[TalentId] = Select
      self.PointLocation[TalentId] = Position + FVector2D(CanVasSizeX, 0)
    end
  end
  if FarthestPoint then
    local NewSizeX = 400
    local PointCanvasSlot = UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(FarthestPoint)
    local PointLocation = PointCanvasSlot:GetPosition()
    local PointSize = PointCanvasSlot:GetSize()
    local OldSizeX = PointSize.X
    PointCanvasSlot:SetSize(FVector2D(NewSizeX, PointSize.Y))
    PointCanvasSlot:SetPosition(PointLocation - FVector2D(NewSizeX / 2 - OldSizeX / 2, 0))
  end
  for TalentId, RougeTalentInfo in pairs(self.RougeTalent) do
    if RougeTalentInfo.Branch == self.Branch then
      local TalentCanvasSlot = UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(self.Points[TalentId].Main)
      local TalentRadius = TalentCanvasSlot:GetSize().X / 2
      if RougeTalentInfo.UnLock then
        for _, PostTalentId in pairs(RougeTalentInfo.UnLock) do
          local PostTalentCanvasSlot = UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(self.Points[PostTalentId].Main)
          local PostTalentRadius = PostTalentCanvasSlot:GetSize().X / 2
          local TwoTalentVec = self.PointLocation[PostTalentId] - self.PointLocation[TalentId]
          local Edge = math.sqrt(TwoTalentVec.X * TwoTalentVec.X + TwoTalentVec.Y * TwoTalentVec.Y)
          local Sin = TwoTalentVec.Y / Edge
          local Cos = TwoTalentVec.X / Edge
          local AngleSin = UE4.UKismetMathLibrary.DegASin(Sin)
          local AngleCos = UE4.UKismetMathLibrary.DegACos(Cos)
          local StartArrowLocation = self.PointLocation[TalentId] + FVector2D(TalentRadius * Cos, TalentRadius * Sin)
          local EndArrowLocation = self.PointLocation[PostTalentId] - FVector2D(PostTalentRadius * Cos, PostTalentRadius * Sin)
          local MidLocation = StartArrowLocation + (EndArrowLocation - StartArrowLocation) * 0.5
          local Length = Edge - TalentRadius - PostTalentRadius
          local Location = MidLocation + FVector2D(-Length / 2, 0)
          local Line = self:NewLine()
          if AngleSin > 0 then
            Line:SetRenderTransformAngle(AngleCos)
          else
            Line:SetRenderTransformAngle(-AngleCos)
          end
          local LineCanvasSlot = UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(Line)
          local LineSize = LineCanvasSlot:GetSize()
          if Length <= 0 then
            Length = LineSize.X
          end
          local NewLineSize = FVector2D(Length, LineSize.Y)
          LineCanvasSlot:SetSize(NewLineSize)
          LineCanvasSlot:SetPosition(Location)
          if not self.Lines[PostTalentId] then
            self.Lines[PostTalentId] = {}
          end
          self.Lines[PostTalentId][TalentId] = Line
          if not self.Talent2PostTalents[TalentId] then
            self.Talent2PostTalents[TalentId] = {}
          end
          table.insert(self.Talent2PostTalents[TalentId], PostTalentId)
          if not self.PostTalent2Talents[PostTalentId] then
            self.PostTalent2Talents[PostTalentId] = {}
          end
          table.insert(self.PostTalent2Talents[PostTalentId], TalentId)
        end
      end
    end
  end
  self:InitNavigationForPoint()
  self:InitPointAndLineState(self.Parent.RemainingTalentPoint)
  if self.DefaultTalentPoint then
    self.DefaultTalentPoint:SelectedWhenCreatingTree()
  end
  return self.ActivedBranchTalent, self.BranchSumTalent
end

function WBP_Rouge_TalentTree_P_C:SelectDefaultTalentPoint(Point)
  Point.Priority = self:GetTalentPointPriority(Point)
  if not self.DefaultTalentPoint then
    self.DefaultTalentPoint = Point
    return
  end
  if Point.Priority > self.DefaultTalentPoint.Priority then
    self.DefaultTalentPoint = Point
  elseif Point.Priority == self.DefaultTalentPoint.Priority then
    if Point.Position.X < self.DefaultTalentPoint.Position.X then
      self.DefaultTalentPoint = Point
    elseif Point.Position.X == self.DefaultTalentPoint.Position.X and Point.Position.Y < self.DefaultTalentPoint.Position.Y then
      self.DefaultTalentPoint = Point
    end
  end
end

function WBP_Rouge_TalentTree_P_C:GetTalentPointPriority(Point)
  if Point.CurState == "CanActive" then
    if self.Parent.RemainingTalentPoint >= Point.Data.LevelUpPoint then
      return 4
    else
      return 3
    end
  elseif Point.CurState == "Active" then
    return 2
  else
    return 1
  end
end

function WBP_Rouge_TalentTree_P_C:InitPointAndLineState(RemainingTalentPoint)
  for TalentId, Point in pairs(self.Points) do
    local State = self:CheckState(TalentId)
    Point:Init(self, self.RougeTalent[TalentId], self.SelectWidget[TalentId], State, self.OnTeleportPointClick, self.OnTeleportHover, self.OnTeleportUnhover, RemainingTalentPoint)
    self:SelectDefaultTalentPoint(Point)
  end
  for PostTalentId, TalentLineTable in pairs(self.Lines) do
    for TalentId, Line in pairs(TalentLineTable) do
      local State = self:CheckLineState(PostTalentId, TalentId)
      Line:Init(State)
    end
  end
end

function WBP_Rouge_TalentTree_P_C:ChangePointAndLineState(RemainingTalentPoint)
  for TalentId, Point in pairs(self.Points) do
    local State = self:CheckState(TalentId)
    Point:ChangeState(State, RemainingTalentPoint)
  end
  for PostTalentId, TalentLineTable in pairs(self.Lines) do
    for TalentId, Line in pairs(TalentLineTable) do
      local State = self:CheckLineState(PostTalentId, TalentId)
      Line:ChangeState(State)
    end
  end
end

function WBP_Rouge_TalentTree_P_C:CheckLineState(PostTalentId, TalentId)
  if self.BranchActiveTalent[TalentId] then
    if self.BranchActiveTalent[PostTalentId] then
      return "Active"
    else
      return "CanActiveByPost"
    end
  elseif self.BranchActiveTalent[PostTalentId] then
    return "CanActiveByFront"
  else
    return "CantActive"
  end
end

function WBP_Rouge_TalentTree_P_C:CheckState(Id)
  if self.BranchActiveTalent[Id] then
    return "Active"
  elseif self:CheckCanActive(Id) then
    return "CanActive"
  else
    return "CantActive"
  end
end

function WBP_Rouge_TalentTree_P_C:CheckIsActive(Id)
  if self.BranchActiveTalent[Id] then
    return true
  else
    return false
  end
end

function WBP_Rouge_TalentTree_P_C:CheckCanActive(Id)
  if not self.Lines[Id] then
    return true
  end
  for FrontTalentId, _ in pairs(self.Lines[Id]) do
    if not self.BranchActiveTalent[FrontTalentId] then
      return false
    end
  end
  return true
end

function WBP_Rouge_TalentTree_P_C:ActiveTalent(Id, Level)
  if self.IsActivating then
    return
  end
  local Avatar = GWorld:GetAvatar()
  
  local function Callback(ret)
    self.IsActivating = false
    if not ErrorCode:Check(ret) then
      return
    end
    self.ActivedBranchTalent = self.ActivedBranchTalent + 1
    self.BranchActiveTalent[Id] = true
    self.Parent:RefreshTalentPoint()
    self.Parent:UpdateTabReddot()
    self.Parent:RefreshActivedTalentNumAndIcon(self.ActivedBranchTalent, self.BranchSumTalent, self.Branch)
    self:ChangePointAndLineState(self.Parent.RemainingTalentPoint)
  end
  
  if Avatar then
    self.IsActivating = true
    Avatar:SaveOneTalent(Id, Callback)
  end
end

function WBP_Rouge_TalentTree_P_C:GetPoint(TalentId)
  if TalentId then
    return self.Points[TalentId]
  end
end

function WBP_Rouge_TalentTree_P_C:GetFullSizeX()
  if self.FarthestTalentId then
    local FarthestPoint = self.Points[self.FarthestTalentId]
    local SizeX = self.PointLocation[self.FarthestTalentId].X
    local PointCanvasSlot = UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(FarthestPoint)
    local PointSize = PointCanvasSlot:GetSize()
    return SizeX + FarthestPoint.BtnSizeX / 2 + PointSize.X / 2
  else
    return 0
  end
end

function WBP_Rouge_TalentTree_P_C:Clear()
  if self.Points then
    for _, widget in pairs(self.Points) do
      widget:RemoveFromParent()
    end
    self.Points = {}
  end
  if self.SelectWidget then
    for _, widget in pairs(self.SelectWidget) do
      widget:RemoveFromParent()
    end
    self.SelectWidget = {}
  end
  if self.Lines then
    for _, LineTable in pairs(self.Lines) do
      for _, Line in pairs(LineTable) do
        Line:RemoveFromParent()
      end
    end
    self.Lines = {}
  end
  self.SelectedId = nil
  self.BranchSumTalent = 0
  self.ActivedBranchTalent = 0
  self.PointLocation = {}
  self.BranchActiveTalent = {}
  self.Talent2PostTalents = {}
  self.PostTalent2Talents = {}
  self.CustomTargetTalentId = {}
end

function WBP_Rouge_TalentTree_P_C:InitListenEvent()
  if IsValid(self.GameInputModeSubsystem) then
    self.GameInputModeSubsystem.OnInputMethodChanged:Add(self, self.RefreshOpInfoByInputDevice)
  end
end

function WBP_Rouge_TalentTree_P_C:ClearListenEvent()
  if IsValid(self.GameInputModeSubsystem) then
    self.GameInputModeSubsystem.OnInputMethodChanged:Remove(self, self.RefreshOpInfoByInputDevice)
  end
end

function WBP_Rouge_TalentTree_P_C:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  if CurInputDevice == ECommonInputType.Touch then
    return
  end
  local IsUseKeyAndMouse = CurInputDevice == ECommonInputType.MouseAndKeyboard
  self:UpdateUIStyleInPlatform(IsUseKeyAndMouse)
end

function WBP_Rouge_TalentTree_P_C:UpdateUIStyleInPlatform(IsUseKeyAndMouse)
  self.IsInSelectState = false
  if IsUseKeyAndMouse then
    self:InitKeyboardView()
  else
    self:InitGamepadView()
  end
end

function WBP_Rouge_TalentTree_P_C:InitGamepadView()
  if self.Parent then
    local Point = self.Parent:GetCurPoint()
    if Point then
      Point:SetFocus()
    end
  end
end

function WBP_Rouge_TalentTree_P_C:InitKeyboardView()
end

function WBP_Rouge_TalentTree_P_C:InitWidgetInfoInGamePad()
end

function WBP_Rouge_TalentTree_P_C:InitNavigationForPoint()
  for FirstTalentId, FirstPoint in pairs(self.Points) do
    local FirstLocation = self.PointLocation[FirstTalentId]
    local FirstLocationTable = {
      Left = FirstLocation.X,
      Right = FirstLocation.X + FirstPoint.BtnSizeX,
      Top = FirstLocation.Y,
      Bottom = FirstLocation.Y + FirstPoint.BtnSizeY
    }
    local LeftFlag = false
    local RightFlag = false
    local UpFlag = false
    local DownFlag = false
    for SecondTalentId, SecondPoint in pairs(self.Points) do
      if LeftFlag and RightFlag and UpFlag and DownFlag then
        break
      end
      if FirstTalentId ~= SecondTalentId then
        local SecondLocation = self.PointLocation[SecondTalentId]
        local SecondLocationTable = {
          Left = SecondLocation.X,
          Right = SecondLocation.X + SecondPoint.BtnSizeX,
          Top = SecondLocation.Y,
          Bottom = SecondLocation.Y + SecondPoint.BtnSizeY
        }
        if FirstLocation.Y > SecondLocation.Y then
          if not UpFlag and (FirstLocationTable.Left <= SecondLocationTable.Right and FirstLocationTable.Right >= SecondLocationTable.Left or FirstLocationTable.Right >= SecondLocationTable.Left and FirstLocationTable.Left <= SecondLocationTable.Right) then
            UpFlag = true
          end
        elseif FirstLocation.Y < SecondLocation.Y and not DownFlag and (FirstLocationTable.Left <= SecondLocationTable.Right and FirstLocationTable.Right >= SecondLocationTable.Left or FirstLocationTable.Right >= SecondLocationTable.Left and FirstLocationTable.Left <= SecondLocationTable.Right) then
          DownFlag = true
        end
      end
    end
    if not LeftFlag then
      self:TrySetNavigation(FirstTalentId, EUINavigation.Left)
    end
    if not RightFlag then
      self:TrySetNavigation(FirstTalentId, EUINavigation.Right)
    end
    if not UpFlag then
      self:TrySetNavigation(FirstTalentId, EUINavigation.Up)
    end
    if not DownFlag then
      self:TrySetNavigation(FirstTalentId, EUINavigation.Down)
    end
  end
end

function WBP_Rouge_TalentTree_P_C:TrySetNavigation(TalentId, Direction)
  local Point = self.Points[TalentId]
  local NextTalents = self.PostTalent2Talents[TalentId] or {}
  local TargetTalentIds = CommonUtils.DeepCopy(NextTalents)
  local PostTalents = self.Talent2PostTalents[TalentId] or {}
  for _, Id in pairs(PostTalents) do
    table.insert(TargetTalentIds, Id)
  end
  local FinalTalentId = self:TryGetBestTalentId(TalentId, Direction, TargetTalentIds)
  if FinalTalentId then
    if not self.CustomTargetTalentId[TalentId] then
      self.CustomTargetTalentId[TalentId] = {}
    end
    self.CustomTargetTalentId[TalentId][Direction] = FinalTalentId
    Point:SetNavigationRuleCustom(Direction, {
      Point,
      Point.OnUINavigation
    })
  end
end

function WBP_Rouge_TalentTree_P_C:TryGetBestTalentId(TalentId, Direction, TargetTalentIds)
  local FirstLocation = self.PointLocation[TalentId]
  local FinalTalentId, FinalPowLength
  for _, Id in pairs(TargetTalentIds) do
    local SecondLocation = self.PointLocation[Id]
    if Direction == EUINavigation.Left then
      if FirstLocation.X > SecondLocation.X then
        local TwoTalentVec = FirstLocation - SecondLocation
        local PowLength = TwoTalentVec.X * TwoTalentVec.X + TwoTalentVec.Y * TwoTalentVec.Y
        if not FinalPowLength then
          FinalTalentId = Id
          FinalPowLength = PowLength
        elseif PowLength < FinalPowLength then
          FinalTalentId = Id
          FinalPowLength = PowLength
        elseif PowLength == FinalPowLength and self.PointLocation[FinalTalentId].Y < SecondLocation.Y then
          FinalTalentId = Id
          FinalPowLength = PowLength
        end
      end
    elseif Direction == EUINavigation.Right then
      if FirstLocation.X < SecondLocation.X then
        local TwoTalentVec = FirstLocation - SecondLocation
        local PowLength = TwoTalentVec.X * TwoTalentVec.X + TwoTalentVec.Y * TwoTalentVec.Y
        if not FinalPowLength then
          FinalTalentId = Id
          FinalPowLength = PowLength
        elseif PowLength < FinalPowLength then
          FinalTalentId = Id
          FinalPowLength = PowLength
        elseif PowLength == FinalPowLength and self.PointLocation[FinalTalentId].Y > SecondLocation.Y then
          FinalTalentId = Id
          FinalPowLength = PowLength
        end
      end
    elseif Direction == EUINavigation.Up then
      if FirstLocation.Y > SecondLocation.Y then
        local TwoTalentVec = FirstLocation - SecondLocation
        local PowLength = TwoTalentVec.X * TwoTalentVec.X + TwoTalentVec.Y * TwoTalentVec.Y
        if not FinalPowLength or FinalPowLength > PowLength then
          FinalTalentId = Id
          FinalPowLength = PowLength
        end
      end
    elseif Direction == EUINavigation.Down and FirstLocation.Y < SecondLocation.Y then
      local TwoTalentVec = FirstLocation - SecondLocation
      local PowLength = TwoTalentVec.X * TwoTalentVec.X + TwoTalentVec.Y * TwoTalentVec.Y
      if not FinalPowLength or FinalPowLength > PowLength then
        FinalTalentId = Id
        FinalPowLength = PowLength
      end
    end
  end
  return FinalTalentId
end

function WBP_Rouge_TalentTree_P_C:OnUINavigation_Slot(NavigationDirection, TalentId)
  if self.CustomTargetTalentId[TalentId] and self.CustomTargetTalentId[TalentId][NavigationDirection] then
    return self.Points[self.CustomTargetTalentId[TalentId][NavigationDirection]]
  else
    return nil
  end
end

return WBP_Rouge_TalentTree_P_C
