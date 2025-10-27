require("UnLua")
local Menu_Portrait_PC_C = Class({
  "Blueprints.UI.BP_UIState_C"
})

function Menu_Portrait_PC_C:Initialize(Initializer)
  self.Super.Initialize(self)
end

function Menu_Portrait_PC_C:OnLoaded(...)
end

function Menu_Portrait_PC_C:SetImage(Path, Id, IsHeadFrame)
  if nil == Path then
    Path = "/Game/UI/Texture/Dynamic/Atlas/Entrance/T_Entrance_Armory.T_Entrance_Armory"
  end
  local ImageResource = LoadObject(Path)
  if nil ~= ImageResource then
    local Material = self.Img_Item:GetDynamicMaterial()
    if self.IsHeadFrame then
      self.Img_Item:SetBrushResourceObject(ImageResource)
    else
      Material:SetTextureParameterValue("IconMap", ImageResource)
    end
  end
  self.Icon_Empty:SetVisibility(UIConst.VisibilityOp.Collapsed)
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    if not IsHeadFrame then
      if Id == Avatar.HeadIconId then
        self:PlayAnimation(self.Select_Normal)
        self:PlayAnimation(self.Click)
        self.IsSelect = true
      end
    else
      if Id == Avatar.HeadFrameId then
        self:PlayAnimation(self.Select_Normal)
        self:PlayAnimation(self.Click)
        self.IsSelect = true
      end
      if -1 == Id then
        self.Icon_Empty:SetVisibility(UIConst.VisibilityOp.Visible)
      end
    end
  end
  if self.IsSelect then
    self:SetGamePadFocus()
  end
end

function Menu_Portrait_PC_C:SetGamePadFocus()
  if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad and self.GameInputModeSubsystem then
    self.GameInputModeSubsystem:SetTargetUIFocusWidget(self)
    self.GameInputModeSubsystem:UpdateCurrentFocusWidgetPos()
  end
end

function Menu_Portrait_PC_C:OnListItemObjectSet(Content)
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(self)
  self.Owner = Content.Owner
  self.Content = Content
  self:StopAllAnimations()
  self.Img_Item:SetVisibility(UIConst.VisibilityOp.Visible)
  self.Btn_Click:SetVisibility(UIConst.VisibilityOp.Visible)
  self:SetVisibility(UIConst.VisibilityOp.Visible)
  self.Icon_Empty:SetVisibility(UIConst.VisibilityOp.Collapsed)
  if Content.IsEmpty then
    self.IsEmpty = true
    Content.SelfWidget = self
    self:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
    self.Btn_Click:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
    self.Img_Item:SetVisibility(UIConst.VisibilityOp.Collapsed)
    return
  end
  self.IsSelect = false
  Content.SelfWidget = self
  self.IsHeadFrame = Content.IsHeadFrame
  self.PortraitId = Content.PortraitId
  if self.IsSelect then
    self:PlayAnimation(self.Select_Normal)
  end
  if -1 == Content.PortraitId then
    self.Img_Item:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  self:SetImage(Content.PortraitPath, Content.PortraitId, Content.IsHeadFrame)
  if Content.IsHeadFrame then
    self:AddReddotListener("PortraitFrame", self.OnPortraitFrameReddotChange)
  else
    self:AddReddotListener("Portrait", self.OnPortraitReddotChange)
  end
  self.Btn_Click.OnClicked:Add(self, self.OnClicked)
  self.Btn_Click.OnPressed:Add(self, self.OnPressed)
  self.Btn_Click.OnHovered:Add(self, self.OnHovered)
  self.Btn_Click.OnUnHovered:Add(self, self.OnUnHovered)
  self.Btn_Click.OnReleased:Add(self, self.OnBtnReleased)
end

function Menu_Portrait_PC_C:OnHovered()
  self.IsHover = true
  if not self.IsSelect then
    self:PlayAnimation(self.Hover)
  end
end

function Menu_Portrait_PC_C:OnFocusReceived(MyGeometry, InFocusEvent)
  if self.GameInputModeSubsystem and UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
    if not self.Owner then
      return Menu_Portrait_PC_C.Super.OnFocusReceived(self, MyGeometry, InFocusEvent)
    end
    self.GameInputModeSubsystem:SetTargetUIFocusWidget(self)
    self.GameInputModeSubsystem:UpdateCurrentFocusWidgetPos()
    self:AddTimer(0.01, function()
      self.Owner:OnListItemClicked(self.Content)
    end, false, 0, nil, true)
  end
  return Menu_Portrait_PC_C.Super.OnFocusReceived(self, MyGeometry, InFocusEvent)
end

function Menu_Portrait_PC_C:OnUnHovered()
  self.IsHover = false
  if not self.IsSelect then
    self:StopAnimation(self.Hover)
    self:PlayAnimation(self.UnHover)
  end
end

function Menu_Portrait_PC_C:OnPressed()
  if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
    return
  end
  self:PlayAnimation(self.Press)
end

function Menu_Portrait_PC_C:OnBtnReleased()
  if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
    return
  end
  self:StopAllAnimations()
  if self.IsHover then
    self:PlayAnimation(self.Hover)
  else
    self:PlayAnimation(self.Normal)
  end
end

function Menu_Portrait_PC_C:OnClicked()
  if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
    if 0 == self.Owner.Switcher_Btn:GetActiveWidgetIndex() then
      self.Owner:ConfirmChange()
    end
  else
    self.Owner:OnListItemClicked(self.Content)
  end
end

function Menu_Portrait_PC_C:AddReddotListener(ReddotNodeName, func)
  if self.ListenedReddot then
    return
  end
  self:RemoveReddotListener(ReddotNodeName)
  ReddotManager.AddListener(ReddotNodeName, self, func)
  self.ListenedReddot = true
end

function Menu_Portrait_PC_C:RemoveReddotListener(ReddotNodeName)
  if self.ListenedReddot then
    ReddotManager.RemoveListener(ReddotNodeName, self)
    self.New:SetEnable(false)
    self.ListenedReddot = false
  end
end

function Menu_Portrait_PC_C:OnPortraitReddotChange(Count)
  local CacheKey = tostring(self.PortraitId)
  local CacheDetail = ReddotManager.GetLeafNodeCacheDetail("Portrait")
  self.New:SetEnable(CacheDetail[CacheKey] and Count > 0)
end

function Menu_Portrait_PC_C:OnPortraitFrameReddotChange(Count)
  local CacheKey = tostring(self.PortraitId)
  local CacheDetail = ReddotManager.GetLeafNodeCacheDetail("PortraitFrame")
  self.New:SetEnable(CacheDetail[CacheKey] and Count > 0)
end

function Menu_Portrait_PC_C:Destruct()
  self:PlayAnimation(self.UnSelect)
  self:PlayAnimation(self.Normal)
  if self.IsHeadFrame then
    self:RemoveReddotListener("PortraitFrame", self.OnPortraitFrameReddotChange)
  else
    self:RemoveReddotListener("Portrait", self.OnPortraitReddotChange)
  end
  self.Super.Destruct(self)
end

function Menu_Portrait_PC_C:OnKeyDown(MyGeometry, InKeyEvent)
  local IsEventHandled = false
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if not UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) or "Gamepad_FaceButton_Bottom" == InKeyName then
  elseif "Gamepad_FaceButton_Right" == InKeyName then
    IsEventHandled = true
  end
  return IsEventHandled
end

function Menu_Portrait_PC_C:ClearData()
  if self.IsHeadFrame then
    self:RemoveReddotListener("PortraitFrame", self.OnPortraitFrameReddotChange)
  else
    self:RemoveReddotListener("Portrait", self.OnPortraitReddotChange)
  end
  self.IsHeadFrame = nil
  self.PortraitId = nil
  self.New:SetEnable(false)
  self.IsEmpty = false
end

return Menu_Portrait_PC_C
