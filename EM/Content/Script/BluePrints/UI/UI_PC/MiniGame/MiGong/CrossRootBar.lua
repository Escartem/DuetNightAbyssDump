require("UnLua")
local CrossRootBar = Class({
  "BluePrints.UI.UI_PC.MiniGame.MiGong.RootBar"
})

function CrossRootBar:SetCrossPercent()
  local Center = FVector2D((self.Left + self.Right) / 2, (self.Top + self.Down) / 2)
  local ArrowRelativePos = self.ArrowPosition - Center
  local PercentRight = -2.0
  local PercentDown = -2.0
  local PercentLeft = -2.0
  local PercentUp = -2.0
  PercentRight = ArrowRelativePos.X / self.Width * 2
  PercentLeft = -PercentRight
  if 2 == self.ProgressBar_Left.ArrowType then
    PercentLeft = 1 - PercentLeft
  end
  if 0 == self.ProgressBar_Right.ArrowType then
    PercentRight = 1 - PercentRight
  end
  PercentDown = ArrowRelativePos.Y / self.Height * 2
  PercentUp = -PercentDown
  if 3 == self.ProgressBar_Up.ArrowType then
    PercentUp = 1 - PercentUp
  end
  if 1 == self.ProgressBar_Down.ArrowType then
    PercentDown = 1 - PercentDown
  end
  self:SetPercent(PercentLeft, PercentRight, PercentUp, PercentDown)
end

function CrossRootBar:SetCrossFillType()
  local SourceDiection = "Left"
  for i, v in pairs(self.RootWidget.GameMap[self.LastBarIndex]) do
    if v == self.Index then
      SourceDiection = i
    end
  end
  if "Left" == SourceDiection then
    self.Line_Left.Slot:SetZOrder(0)
    self.Line_Right.Slot:SetZOrder(99)
    self.Line_Up.Slot:SetZOrder(0)
    self.Line_Down.Slot:SetZOrder(0)
    self.ProgressBar_Left:SetFillType(0)
    self.ProgressBar_Right:SetFillType(0)
    self.ProgressBar_Up:SetFillType(1)
    self.ProgressBar_Down:SetFillType(3)
  elseif "Up" == SourceDiection then
    self.Line_Left.Slot:SetZOrder(0)
    self.Line_Right.Slot:SetZOrder(0)
    self.Line_Up.Slot:SetZOrder(0)
    self.Line_Down.Slot:SetZOrder(99)
    self.ProgressBar_Left:SetFillType(0)
    self.ProgressBar_Right:SetFillType(2)
    self.ProgressBar_Up:SetFillType(1)
    self.ProgressBar_Down:SetFillType(1)
  elseif "Right" == SourceDiection then
    self.Line_Left.Slot:SetZOrder(99)
    self.Line_Right.Slot:SetZOrder(0)
    self.Line_Up.Slot:SetZOrder(0)
    self.Line_Down.Slot:SetZOrder(0)
    self.ProgressBar_Left:SetFillType(2)
    self.ProgressBar_Right:SetFillType(2)
    self.ProgressBar_Up:SetFillType(1)
    self.ProgressBar_Down:SetFillType(3)
  elseif "Down" == SourceDiection then
    self.Line_Left.Slot:SetZOrder(0)
    self.Line_Right.Slot:SetZOrder(0)
    self.Line_Up.Slot:SetZOrder(99)
    self.Line_Down.Slot:SetZOrder(0)
    self.ProgressBar_Left:SetFillType(0)
    self.ProgressBar_Right:SetFillType(2)
    self.ProgressBar_Up:SetFillType(3)
    self.ProgressBar_Down:SetFillType(3)
  end
end

function CrossRootBar:ChangeNowBarSetPercent(NextBarIndex)
  local DirectionType = {
    "Left",
    "Right",
    "Up",
    "Down"
  }
  local LastDiection = ""
  local NextDiection = ""
  for i, v in pairs(self.RootWidget.GameMap[self.Index]) do
    if v == self.LastBarIndex then
      LastDiection = i
    end
  end
  for i, v in pairs(self.RootWidget.GameMap[self.Index]) do
    if v == NextBarIndex then
      NextDiection = i
    end
  end
  local PercentRight = 0
  local PercentDown = 0
  local PercentLeft = 0
  local PercentUp = 0
  for i, v in pairs(DirectionType) do
    if v == LastDiection or v == NextDiection then
      self["ProgressBar_" .. v]:SetPercent(1)
    else
      self["ProgressBar_" .. v]:SetPercent(0)
    end
  end
end

function CrossRootBar:InitPositionAndSize(Discrete)
  UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(self.Line_Left):SetSize(FVector2D(Discrete / 2, self.Thick))
  UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(self.Line_Right):SetSize(FVector2D(Discrete / 2, self.Thick))
  UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(self.Line_Up):SetSize(FVector2D(self.Thick, Discrete / 2))
  UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(self.Line_Down):SetSize(FVector2D(self.Thick, Discrete / 2))
end

return CrossRootBar
