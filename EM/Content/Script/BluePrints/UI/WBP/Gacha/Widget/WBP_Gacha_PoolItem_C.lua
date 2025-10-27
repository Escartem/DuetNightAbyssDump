require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:Construct()
  self.Btn_Click.OnClicked:Add(self, self.OnItemClick)
  self.Btn_Click.OnHovered:Add(self, self.OnItemHovered)
  self.Btn_Click.OnUnhovered:Add(self, self.OnItemUnhovered)
  self.Btn_Click.OnPressed:Add(self, self.OnItemOnPressed)
end

function M:OnListItemObjectSet(Content)
  self.Content = Content
  self.Content.SelfWidget = self
  self.Parent = Content.Parent
  self.TabId = Content.TabId
  self.Text_PoolTitle:SetText(GText(Content.TabName))
  local IconDynaMaterial = self.Image_Pool:GetDynamicMaterial()
  if IconDynaMaterial then
    local Icon = LoadObject(Content.Icon)
    IconDynaMaterial:SetTextureParameterValue("IconMap", Icon)
  end
  self:BindClickEvent(Content.ClickEvent)
  if Content.bSelected then
    self:OnItemClick(true)
  end
end

function M:SetReddot(bShow)
  if bShow then
    self.Reddot:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  else
    self.Reddot:SetVisibility(ESlateVisibility.Collapsed)
  end
end

function M:BindClickEvent(ClickEvent)
  self.ClickObj = ClickEvent.Obj
  self.ClickCallback = ClickEvent.Callback
end

function M:OnItemClick(bNotPlayMusic)
  if self.bSelected then
    return
  end
  if not self.ClickCallback then
    return
  end
  self.bSelected = true
  self:PlayAnimation(self.Click)
  self.ClickCallback(self.ClickObj, self.TabId, self.Content, not bNotPlayMusic)
end

function M:OnItemHovered()
  if self.bSelected then
    return
  end
  self:PlayAnimation(self.Hover)
end

function M:OnItemUnhovered()
  if self.bSelected then
    return
  end
  self:PlayAnimation(self.Unhover)
end

function M:OnItemOnPressed()
  if self.bSelected then
    return
  end
  self:PlayAnimation(self.Press)
end

function M:UnSelect()
  self.bSelected = false
  self:PlayAnimation(self.Normal)
end

function M:OnKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local IsEventHandled = false
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) and InKeyName == UIConst.GamePadKey.DPadLeft then
    self.Parent:OnGamePadDown(InKeyName)
  else
  end
end

return M
