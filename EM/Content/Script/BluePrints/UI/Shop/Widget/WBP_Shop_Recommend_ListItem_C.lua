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
  self.BannerId = Content.BannerId
  self.VirtualClickCallback = Content.VirtualClickCallback
  self.OnKeyDownCallBack = Content.OnKeyDownCallBack
  self.SetListItemCallBack = Content.SetListItemCallBack
  self.Parent = Content.Parent
  local BannerData = DataMgr.ShopBannerTab[self.BannerId]
  assert(BannerData, "\230\156\170\230\137\190\229\136\176\229\175\185\229\186\148\231\154\132Banner\233\161\181\228\191\161\230\129\175\239\188\154" .. self.BannerId)
  local BannerIcon = LoadObject(BannerData.BannerIcon)
  assert(BannerIcon, "\230\156\170\230\137\190\229\136\176Banner\233\161\181\229\175\185\229\186\148\231\154\132Icon:" .. self.BannerId)
  self.Text_Title:SetText(GText(BannerData.Text1))
  self.Image_ItemIcon:SetBrushResourceObject(BannerIcon)
  if BannerData.MarkText then
    self.Group_Sign:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self.Text_MoreNum:SetText(GText(BannerData.MarkText))
  else
    self.Group_Sign:SetVisibility(ESlateVisibility.Hidden)
  end
  self:BindClickEvent(Content.ClickEvent)
  if Content.bSelected then
    self:OnItemClick(nil, true)
  end
end

function M:BindClickEvent(ClickEvent)
  self.ClickObj = ClickEvent.Obj
  self.ClickCallback = ClickEvent.Callback
end

function M:OnItemClick(bTriggerWhenHover, bNotPlayMusic)
  if self.bSelected then
    if not bTriggerWhenHover and type(self.VirtualClickCallback) == "function" then
      self.VirtualClickCallback(self.Parent, self.BannerId)
    end
    return
  end
  if not self.ClickCallback then
    return
  end
  self.bSelected = true
  self:PlayAnimation(self.Click)
  self.ClickCallback(self.ClickObj, self.BannerId, self.Content, not bNotPlayMusic)
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
  self.SetListItemCallBack(self.Parent, self.BannerId, self)
  if self.OnKeyDownCallBack then
    return self.OnKeyDownCallBack(self.Parent, self.BannerId, MyGeometry, InKeyEvent)
  end
  return UIUtils.UnHandled
end

return M
