require("UnLua")
local M = Class("BluePrints.UI.BP_EMUserWidget_C")
local Handled = UWidgetBlueprintLibrary.Handled()

function M:BindOnClickEvent(Func)
  self.ClickFunc = Func
end

function M:BindOnMouseHover(Func)
  self.HoverFunc = Func
end

function M:SetHoldUp(bHoldUp)
  self.bHoldUp = bHoldUp
end

function M:Construct()
  self.Button_Area.OnHovered:Add(self, self.BtnAreaOnHovered)
  self.Button_Area.OnUnhovered:Add(self, self.BtnAreaOnUnhovered)
  self.Button_Area.OnReleased:Add(self, self.BtnAreaOnClicked)
  self.Button_Area.OnPressed:Add(self, self.BtnAreaOnPressed)
end

function M:Destruct()
  self.ClickFunc = nil
  self.HoverFunc = nil
  self.bHoldUp = nil
  self.bSelected = nil
  self.Button_Area.OnHovered:Remove(self, self.BtnAreaOnHovered)
  self.Button_Area.OnUnhovered:Remove(self, self.BtnAreaOnUnhovered)
  self.Button_Area.OnReleased:Remove(self, self.BtnAreaOnClicked)
  self.Button_Area.OnPressed:Remove(self, self.BtnAreaOnPressed)
end

function M:BtnAreaOnPressed(MyGeometry, MouseEvent)
  DebugPrint(LXYTag, "Common_Head_Small_C:BtnAreaOnPressed")
  if self.bDisableAction then
    return Handled
  end
  if self.bSelected then
    return Handled
  end
  self:StopAllAnimations()
  self:PlayAnimation(self.Press)
  return Handled
end

function M:SetHeadFrame(HeadFrameId)
  self.HeadFrameId = HeadFrameId
  if not HeadFrameId or HeadFrameId == CommonConst.DefaultNoHeadFrame then
    if not HeadFrameId then
      DebugPrint(LXYTag, "\230\156\141\229\138\161\231\171\175\230\178\161\230\156\137\229\144\140\230\173\165\229\164\180\229\131\143\230\161\134\230\149\176\230\141\174\239\188\140\230\154\130\230\151\182\228\184\141\230\152\190\231\164\186\229\164\180\229\131\143\230\161\134")
    end
    self.Head_Frame:SetVisibility(UIConst.VisibilityOp.Collapsed)
    return
  end
  local Conf = DataMgr.HeadFrame[HeadFrameId]
  if not Conf then
    DebugPrint(LXYTag, "\230\151\160\230\149\136\231\154\132\229\164\180\229\131\143\230\161\134id")
    return
  end
  UResourceLibrary.LoadObjectAsync(self, Conf.SmallIcon, {
    self,
    function(_, IconRes)
      self.Head_Frame:SetBrushResourceObject(IconRes)
    end
  })
  self.Head_Frame:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
end

function M:BtnAreaOnClicked(MyGeometry, MouseEvent)
  DebugPrint(LXYTag, "Common_Head_Small_C:BtnAreaOnClicked")
  if self.bDisableAction then
    return Handled
  end
  if self.bHead then
    AudioManager(self):PlayUISound(self, "event:/ui/common/team_avatar_click", nil, nil)
  else
    AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_small", nil, nil)
  end
  self:StopAllAnimations()
  self:PlayAnimation(self.Click)
  self.bSelected = true
  if self.ClickFunc then
    self.ClickFunc()
  end
  return Handled
end

function M:SetHeadIcon(HeadIcon, bUseBigHead)
  if bUseBigHead then
    self.Panel_Img:SetActiveWidgetIndex(2)
    local Material = self.Img_Head:GetDynamicMaterial()
    Material:SetTextureParameterValue("IconMap", HeadIcon)
    self.bUseBigHead = true
    return
  end
  self.bUseBigHead = false
  local Material = self.Img_Item:GetDynamicMaterial()
  Material:SetTextureParameterValue("IconMap", HeadIcon)
  self.bHead = true
end

function M:SetHeadIconById(HeadIconId, bUseBigHead)
  local HeadData = DataMgr.HeadSculpture[HeadIconId]
  if not HeadData or not HeadData.HeadPath then
    return
  end
  UResourceLibrary.LoadObjectAsync(self, HeadData.HeadPath, {
    self,
    function(_, HeadIcon)
      self:SetHeadIcon(HeadIcon, bUseBigHead)
    end
  })
end

function M:SetHeadIconEmpty(bIsEmpty)
  self.bHead = false
  self:StopAllAnimations()
  if bIsEmpty then
    self.WidgetSwitcher_State:SetActiveWidgetIndex(1)
    self.Panel_Img:SetActiveWidgetIndex(3)
    self:PlayAnimation(self.Empty)
    self:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
    self.Head_Frame:SetVisibility(UIConst.VisibilityOp.Collapsed)
  else
    self.WidgetSwitcher_State:SetActiveWidgetIndex(0)
    if self.bUseBigHead then
      self.Panel_Img:SetActiveWidgetIndex(2)
    else
      self.Panel_Img:SetActiveWidgetIndex(0)
    end
    self:PlayAnimation(self.Normal)
    self:SetVisibility(UIConst.VisibilityOp.Visible)
    if self.HeadFrameId then
      self.Head_Frame:SetVisibility(UIConst.VisibilityOp.Collapsed)
    end
  end
end

function M:BtnAreaOnHovered()
  DebugPrint(LXYTag, "Common_Head_Small_C:BtnAreaOnHovered")
  if self.bDisableAction then
    return
  end
  if self.bHoldUp and self.bSelected then
    return
  end
  self:StopAllAnimations()
  self:PlayAnimation(self.Hover)
  if self.HoverFunc then
    self.HoverFunc(true)
  end
end

function M:BtnAreaOnUnhovered()
  DebugPrint(LXYTag, "Common_Head_Small_C:BtnAreaOnUnhovered")
  if self.bDisableAction then
    return
  end
  if self.bHoldUp and self.bSelected then
    return
  end
  self:StopAllAnimations()
  self:PlayAnimation(self.UnHover)
  if self.HoverFunc then
    self.HoverFunc(false)
  end
end

function M:PlayNormal()
  self:StopAllAnimations()
  self:PlayAnimation(self.Normal)
  self.bSelected = false
end

function M:OnAnimationFinished(Animation)
  if Animation == self.Click and not self.bHoldUp then
    self:PlayAnimation(self.Normal)
  elseif Animation == self.UnHover then
    self:StopAllAnimations()
    self:PlayAnimation(self.Normal)
  end
end

function M:SetGamepadCursor()
  self.Button_Area:SetNavigatePosAngle(0)
  self.Button_Area:SetNavigatePosOffsetPercent(FVector2D(0.5, -0.5))
  self.Button_Area:SetNavigatePosOffsetAlignment(FVector2D(0.5, 0.5))
end

function M:SetDisableAction(bDisable)
  self.bDisableAction = bDisable
end

return M
