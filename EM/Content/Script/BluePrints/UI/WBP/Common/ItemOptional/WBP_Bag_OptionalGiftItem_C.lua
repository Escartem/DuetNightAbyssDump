require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:Construct()
end

function M:Destruct()
end

function M:OnListItemObjectSet(Content)
  self:Init(Content)
end

function M:Init(Content)
  if not Content.ItemType then
    return
  end
  if not self._components then
    if Content.ItemType == "SelectResource" then
    end
    AssembleComponents(self)
  end
  self.ChooseCallback = Content.ChooseCallback
  self.ParentWidget = Content.ParentWidget
  self.ItemType = Content.ItemType
  self.ChooseDataInfo = {
    ResourceId = Content.ResourceId,
    OptionalId = Content.OptionalId,
    ChooseId = Content.Id,
    ChooseIndex = Content.ChooseIndex,
    ChooseName = Content.Name,
    ConsumeCount = 1,
    ChooseWidget = self
  }
  self.Content = Content
  self.Count = Content.Count
  self:InitCommonView(Content)
end

function M:InitCommonView(Content)
  self.Text_Name:SetText(Content.Name)
  self.Text_Num:SetText("\195\151" .. Content.Count)
  local GiftContent = NewObject(UIUtils.GetCommonItemContentClass())
  GiftContent.ParentWidget = self
  GiftContent.Id = Content.Id
  GiftContent.Rarity = Content.Rarity
  GiftContent.ItemType = CommonConst.DataType.Resource
  GiftContent.Name = Content.Name
  GiftContent.IsShowDetails = true
  GiftContent.Icon = Content.Icon
  GiftContent.HandleMouseDown = true
  GiftContent.OnMenuOpenChangedEvents = {
    Obj = self,
    Callback = self.OnMenuOpenChangedEvents
  }
  self.Item_Gift:Init(GiftContent)
end

function M:OnMenuOpenChangedEvents(bIsOpen)
  self.ParentWidget:OnMenuOpenChangedEvents(bIsOpen)
end

function M:SetSelected(IsSelected)
end

function M:OnComListClicked()
end

function M:OnItemClicked()
end

function M:OnMouseEnter(MyGeometry, MouseEvent)
end

function M:OnMouseLeave(MyGeometry, MouseEvent)
end

function M:OnBtnChooseHovered()
  if CommonUtils.GetDeviceTypeByPlatformName(self) == CommonConst.CLIENT_DEVICE_TYPE.MOBILE then
    return
  end
  if self.IsSelected then
    return
  end
  if not self.IsInHovered then
    self.Com_List:StopAllAnimations()
    self.Com_List:PlayAnimation(self.Com_List.Hover)
  end
  self.IsInHovered = true
end

function M:OnBtnChooseUnHovered()
  if CommonUtils.GetDeviceTypeByPlatformName(self) == CommonConst.CLIENT_DEVICE_TYPE.MOBILE then
    return
  end
  if self.IsSelected then
    return
  end
  if self.IsInHovered then
    self.Com_List:StopAllAnimations()
    self.Com_List:PlayAnimation(self.Com_List.UnHover)
  end
  self.IsInHovered = false
end

return M
