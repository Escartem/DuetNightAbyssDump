require("UnLua")
local Menu_EditItem_C = Class({
  "Blueprints.UI.BP_UIState_C"
})

function Menu_EditItem_C:Initialize(Initializer)
  self.Super.Initialize(self)
end

function Menu_EditItem_C:OnLoaded(...)
end

function Menu_EditItem_C:Construct()
  self:InitButton()
end

function Menu_EditItem_C:OnMouseEnter(MyGeometry, MouseEvent)
  if self.CurBtnContent.Id then
    self.Owner.BtnIdx = self.CurBtnContent.Id - 1
  end
  self:StopAnimation(self.UnHover)
  self:PlayAnimation(self.Hover)
end

function Menu_EditItem_C:OnMouseLeave(MyGeometry, MouseEvent)
  self:StopAnimation(self.Hover)
  self:PlayAnimation(self.UnHover)
end

function Menu_EditItem_C:OnClicked()
  self.Owner:OnListBtnClicked(self.CurBtnContent)
end

function Menu_EditItem_C:OnListItemObjectSet(Content)
  self.CurBtnContent = Content
  self.CurBtnContent.SelfWidget = self
  self.Owner = Content.ParentWidget
  self.BtnName = Content.BtnName
  self.ReddotName = Content.ReddotName
  self.Text_Cell:SetText(GText(Content.BtnName))
  self.IsChangePortrait = Content.IsChangePortrait
  if Content.BtnClickFunction then
    self.Button_Area.OnClicked:Add(self, Content.BtnClickFunction)
    self.Button_Area:SetVisibility(UIConst.VisibilityOp.Visible)
  end
  if self.ReddotName then
    self:AddReddotListener(self.ReddotName, self.OnReddotChange)
  end
end

function Menu_EditItem_C:OnKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local IsEventHandled = false
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) and InKeyName == UIConst.GamePadKey.FaceButtonRight then
    IsEventHandled = true
    self.Owner:OnClickEdit()
  end
  return IsEventHandled
end

function Menu_EditItem_C:SetStytle(Hover)
  if Hover then
    self:PlayAnimation(self.Hover)
  else
    self:StopAnimation(self.Hover)
    self:PlayAnimation(self.UnHover)
  end
end

function Menu_EditItem_C:AddReddotListener(ReddotNodeName, func)
  self:RemoveReddotListener(ReddotNodeName)
  ReddotManager.AddListener(ReddotNodeName, self, func)
  self.ListenedReddot = true
end

function Menu_EditItem_C:RemoveReddotListener(ReddotNodeName)
  if self.ListenedReddot then
    ReddotManager.RemoveListener(ReddotNodeName, self)
    self.New:SetEnable(false)
    self.ListenedReddot = false
  end
end

function Menu_EditItem_C:OnReddotChange(Count)
  local CacheKey = self.ReddotName
  local CacheDetail = ReddotManager.GetLeafNodeCacheDetail(self.ReddotName)
  self.New:SetEnable(Count > 0)
end

function Menu_EditItem_C:Destruct()
  if self.IsHeadFrame then
    self:RemoveReddotListener(self.ReddotName, self.OnReddotChange)
  end
  self.Super.Destruct(self)
end

function Menu_EditItem_C:OnFocusReceived(MyGeometry, InFocusEvent)
  if not self.GameInputModeSubsystem or UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
  end
  return UIUtils.Handled
end

return Menu_EditItem_C
