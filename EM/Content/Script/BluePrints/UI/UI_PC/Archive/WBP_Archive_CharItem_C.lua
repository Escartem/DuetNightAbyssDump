require("UnLua")
local WBP_Archive_CharItem_C = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function WBP_Archive_CharItem_C:Initialize(Initializer)
  self.SlotModId = nil
  self.IsDraging = false
  self.Parent = nil
  self.IsCanUnLoad = true
  self.IsShowModLevelUp = false
  self.CallbackUI2 = nil
  self.AddListenerFnish = false
end

function WBP_Archive_CharItem_C:Construct()
  self.Btn_Click.OnClicked:Add(self, self.OnCellClicked)
  self.Btn_Click.OnHovered:Add(self, self.OnCellHovered)
  self.Btn_Click.OnUnhovered:Add(self, self.OnCellUnhovered)
  self.Btn_Click.OnPressed:Add(self, self.OnCellPressed)
  self.Btn_Click.OnReleased:Add(self, self.OnCellReleased)
end

function WBP_Archive_CharItem_C:OnListItemObjectSet(Content)
  self.bHovered = false
  self.bPressed = false
  self:FlushAnimations()
  self.Content = Content
  Content.UI = self
  self.Parent = Content.Parent
  self.UIName = Content.UIName
  if Content.Icon == nil then
    if nil == Content.bInteractive then
      Content.bInteractive = false
    end
    self:SetIsEmpty(true)
  else
    if false ~= Content.bInteractive then
      Content.bInteractive = true
    end
    self:SetIsEmpty(false)
    if Content.bNotShowInfo then
      self.Panel_Info:SetVisibility(UE4.ESlateVisibility.Collapsed)
    end
    self:UpdateItem(Content)
    if 1 == Content.Index then
      Content.Parent:TrySetFocusFirstTime(self)
    end
  end
  if not self.AddListenerFnish then
    self.AddListenerFnish = true
    if not ReddotManager.GetTreeNode(self.Content.NodeName) then
      ReddotManager.AddNode(self.Content.NodeName)
    end
    ReddotManager.AddListener(self.Content.NodeName, self, self.RefreshReddot)
  else
    self:RefreshReddot()
  end
end

function WBP_Archive_CharItem_C:SetIsEmpty(IsEmpty)
  if IsEmpty then
    self.Main:SetVisibility(UIConst.VisibilityOp.Collapsed)
  else
    self.Main:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  end
end

function WBP_Archive_CharItem_C:UpdateItem(Content)
  self:SetIsUnlock(Content.Unlock)
  self:SetName(Content.Name)
  self:SetIcon(Content.Icon)
  self:SetRarity(Content.Rarity)
  self:SetTag(Content.TagIcon)
end

function WBP_Archive_CharItem_C:SetIsUnlock(Unlock)
  if Unlock then
    self:PlayAnimation(self.Normal)
  else
    self:PlayAnimation(self.Lock)
  end
end

function WBP_Archive_CharItem_C:SetName(Name)
  self.Text_Name:SetText(GText(Name))
end

function WBP_Archive_CharItem_C:SetIcon(IconPath)
  local IconDynaMaterial = self.Icon:GetDynamicMaterial()
  local Icon = LoadObject(IconPath)
  if Icon then
    IconDynaMaterial:SetTextureParameterValue("IconMap", Icon)
    self.Icon:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  else
    self.Icon:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

function WBP_Archive_CharItem_C:SetRarity(Rarity)
  for i = 1, 5 do
    if i <= Rarity then
      self["CharStar_0" .. i]:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    else
      self["CharStar_0" .. i]:SetVisibility(UIConst.VisibilityOp.Collapsed)
    end
  end
  if self["Img_Quality_" .. Rarity] then
    self.Quality:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    self.Quality:SetBrushFromTexture(self["Img_Quality_" .. Rarity])
  else
    self.Quality:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  if 5 == Rarity then
    self.Frame_Inner:SetColorAndOpacity(self.Color_Inner_Yellow)
  elseif 4 == Rarity then
    self.Frame_Inner:SetColorAndOpacity(self.Color_Inner_Normal)
  end
end

function WBP_Archive_CharItem_C:SetTag(TagIconPath)
  if TagIconPath then
    local Icon = LoadObject(TagIconPath)
    self.Icon_Tag:SetBrushFromTexture(Icon)
    self.Icon_Tag:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  else
    self.Icon_Tag:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

function WBP_Archive_CharItem_C:OnMouseEnter(MyGeometry, MouseEvent)
end

function WBP_Archive_CharItem_C:OnMouseLeave(MouseEvent)
end

function WBP_Archive_CharItem_C:OnCellClicked()
  self:StopAnimation(self.Click)
  if self.Content and self.Content.Parent then
    self.Content.Parent:ClickListItem(self.Content)
  end
end

function WBP_Archive_CharItem_C:OnCellHovered()
  if not self:IsAnimationPlaying(self.Click) then
    self:StopAnimation(self.UnHover)
    self:StopAnimation(self.Lock)
    self:PlayAnimation(self.Hover)
  end
end

function WBP_Archive_CharItem_C:OnCellUnhovered()
  if not self:IsAnimationPlaying(self.Click) then
    self:StopAnimation(self.Hover)
    self:StopAnimation(self.Press)
    self:PlayAnimation(self.UnHover)
  end
end

function WBP_Archive_CharItem_C:OnCellPressed()
  self:PlayAnimation(self.Press)
end

function WBP_Archive_CharItem_C:OnCellReleased()
  self:StopAnimation(self.Press)
  if self.Content.Unlock then
    self:PlayAnimation(self.Normal)
  else
    self:PlayAnimation(self.Lock)
  end
end

function WBP_Archive_CharItem_C:RefreshReddot()
  local CacheDetail = ReddotManager.GetLeafNodeCacheDetail(self.Content.NodeName)
  if not self.Content or not self.Content.Id then
    return
  end
  if 1 == CacheDetail[self.Content.Id] then
    self.New:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  else
    self.New:SetVisibility(ESlateVisibility.Collapsed)
  end
end

return WBP_Archive_CharItem_C
