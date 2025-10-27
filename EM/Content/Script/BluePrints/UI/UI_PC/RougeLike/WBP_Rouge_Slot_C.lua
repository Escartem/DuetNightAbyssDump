require("UnLua")
local WBP_Rouge_Slot_C = Class("BluePrints.UI.BP_EMUserWidget_C")

function WBP_Rouge_Slot_C:Construct()
  self.CurState = nil
  self.Btn_Click.OnClicked:Add(self, self.OnClicked)
  self.Btn_Click.OnHovered:Add(self, self.OnHovered)
  self.Btn_Click.OnUnhovered:Add(self, self.OnUnhovered)
  self.Btn_Click.OnPressed:Add(self, self.OnPressed)
  self.Btn_Click.OnReleased:Add(self, self.OnReleased)
  self.IsHovering = false
  self.IsPressed = false
  self.IsSelected = false
  self.Flag = false
  self.BtnAnimation = {
    self.Hover,
    self.Unhover,
    self.Press
  }
end

function WBP_Rouge_Slot_C:Init(Parent, Data, SelectWidget, State, ClickFunction, HoverFunction, UnoverFunction, RemainingTalentPoint)
  self.Parent = Parent
  self.Data = Data
  self.SelectWidget = SelectWidget
  local IconPath = Data.Icon
  if IconPath then
    local image = LoadObject(IconPath)
    if image then
      self.Img_Icon:SetBrushFromTexture(image, true)
    end
  end
  self.ClickFunction = ClickFunction
  self.HoverFunction = HoverFunction
  self.UnoverFunction = UnoverFunction
  self:ChangeState(State, RemainingTalentPoint)
end

function WBP_Rouge_Slot_C:ChangeState(NewState, RemainingTalentPoint)
  local LastState = self.CurState
  self.CurState = NewState
  if self.CurState == "CantActive" or self.CurState == "CanActive" and RemainingTalentPoint < self.Data.LevelUpPoint then
    self.WidgetSwitcher_0:SetActiveWidgetIndex(1)
  else
    self.WidgetSwitcher_0:SetActiveWidgetIndex(0)
  end
  if LastState == self.CurState then
    return
  end
  self:StopAllAnimations()
  if self.CurState == "Active" then
    if "CanActive" == LastState then
      AudioManager(self):PlayUISound(self, "event:/ui/roguelike/spectrum_avtive", nil, nil)
      self:PlayAnimation(self.Unlock)
    else
      self:PlayAnimation(self.Unlock_Loop)
    end
  elseif self.CurState == "CanActive" then
    if "CantActive" == LastState then
      self:PlayAnimation(self.Unlock_Remind_In)
    else
      self:PlayAnimation(self.Unlock_Remind_Loop)
    end
  elseif self.CurState == "CantActive" then
    self:PlayAnimation(self.Normal)
  end
end

function WBP_Rouge_Slot_C:SelectedWhenCreatingTree()
  if self.IsSelected then
    return
  end
  if self.ClickFunction and type(self.ClickFunction) == "function" then
    self.ClickFunction(self.Parent, self.Data.TalentId, true)
  end
  self:StopBtnAnimation()
  if self.IsHoverd then
    self.IsHoverd = false
    self:PlayAnimation(self.Unhover)
  end
  self.IsSelected = true
  self:PlayAnimation(self.Click)
  self.SelectWidget:StopAllAnimations()
  self.SelectWidget:PlayAnimation(self.SelectWidget.Click)
end

function WBP_Rouge_Slot_C:OnClicked()
  if self.IsSelected then
    if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
      self.Parent.Parent:ActiveTalent()
    end
    return
  end
  if self.ClickFunction and type(self.ClickFunction) == "function" then
    self.ClickFunction(self.Parent, self.Data.TalentId)
  end
  self:StopBtnAnimation()
  if self.IsHoverd then
    self.IsHoverd = false
    self:PlayAnimation(self.Unhover)
  end
  self.IsSelected = true
  self:PlayAnimation(self.Click)
  self.SelectWidget:StopAllAnimations()
  self.SelectWidget:PlayAnimation(self.SelectWidget.Click)
  AudioManager(self):PlayUISound(self, "event:/ui/roguelike/spectrum_click", nil, nil)
end

function WBP_Rouge_Slot_C:OnHoveredOnGamepad()
  if self.IsSelected then
    return
  end
  if self.ClickFunction and type(self.ClickFunction) == "function" then
    self.ClickFunction(self.Parent, self.Data.TalentId)
  end
  self:StopBtnAnimation()
  if self.IsHoverd then
    self.IsHoverd = false
    self:PlayAnimation(self.Unhover)
  end
  self.IsSelected = true
  self:PlayAnimation(self.Click)
  self.SelectWidget:StopAllAnimations()
  self.SelectWidget:PlayAnimation(self.SelectWidget.Click)
  AudioManager(self):PlayUISound(self, "event:/ui/roguelike/spectrum_click", nil, nil)
end

function WBP_Rouge_Slot_C:OnHovered()
  if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
    self.Parent.Parent:ScrollToPoint(self.Data.TalentId)
    self:OnHoveredOnGamepad()
  end
  if self.IsSelected then
    return
  end
  if self.IsHoverd then
    return
  end
  self.IsHoverd = true
  self:StopBtnAnimation()
  self:PlayAnimation(self.Hover)
end

function WBP_Rouge_Slot_C:OnUnhovered()
  if self.IsSelected then
    return
  end
  if not self.IsHoverd then
    return
  end
  self.IsHoverd = false
  self:StopBtnAnimation()
  self:PlayAnimation(self.Unhover)
  self.SelectWidget:PlayAnimation(self.SelectWidget.Unselect)
end

function WBP_Rouge_Slot_C:OnPressed()
  if self.IsSelected then
    return
  end
  self.IsPressed = true
  self:StopBtnAnimation()
  self:PlayAnimation(self.Press)
  self.SelectWidget:StopAllAnimations()
  self.SelectWidget:PlayAnimation(self.SelectWidget.Press)
end

function WBP_Rouge_Slot_C:OnReleased()
  if self.IsSelected then
    return
  end
  if self.IsHoverd then
    return
  end
  if not self.IsPressed then
    return
  end
  self.IsPressed = false
  self:StopBtnAnimation()
  self:PlayAnimation(self.Click)
  self.SelectWidget:PlayAnimation(self.SelectWidget.Unselect)
end

function WBP_Rouge_Slot_C:StopBtnAnimation()
  for _, Animation in pairs(self.BtnAnimation) do
    if self:IsAnimationPlaying(Animation) then
      self:StopAnimation(Animation)
    end
  end
end

function WBP_Rouge_Slot_C:SaveBtnSizeXY()
  local MainCanvasSlot = UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(self.Main)
  local MainSize = MainCanvasSlot:GetSize()
  self.BtnSizeX = MainSize.X
  self.BtnSizeY = MainSize.Y
end

function WBP_Rouge_Slot_C:OnUINavigation(NavigationDirection)
  local Point = self.Parent:OnUINavigation_Slot(NavigationDirection, self.Data.TalentId)
  if Point then
    return Point.Btn_Click
  else
    return self.Btn_Click
  end
end

return WBP_Rouge_Slot_C
