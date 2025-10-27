require("UnLua")
require("DataMgr")
local WBP_PickUpTipsItem_C = Class({
  "BluePrints.Common.TimerMgr",
  "BluePrints.UI.UI_PC.Battle.GetRewardTipsItemBase"
})

function WBP_PickUpTipsItem_C:Tick(MyGeometry, InDeltaTime)
  if self:IsAnimationPlaying(self.IN) then
    return
  end
  if self.Duration < 0 then
    return
  end
  self.Duration = self.Duration - InDeltaTime
  if self.Duration < 0 then
    self:PlayAnimation(self.Out)
  end
end

function WBP_PickUpTipsItem_C:UpdateTips(ItemId, ItemCount, Duration, TableName)
  Duration = Duration or 2.5
  ItemCount = ItemCount or 1
  self.ItemId = ItemId
  self:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  local ItemInfo = DataMgr[TableName][self.ItemId]
  assert(ItemInfo)
  local DisName = ItemUtils:GetDropName(self.ItemId, TableName) .. string.format("x%d", ItemCount)
  self.TextBlock_PickUpTips:SetText(DisName)
  local ImagePath = ItemInfo.Icon
  if string.find(ImagePath, "/Game/") == nil then
    ImagePath = "/Game/" .. ImagePath
  end
  self.CurrentIconPath = ImagePath
  self.LoadResourceID = nil
  local Handle = UE.UResourceLibrary.LoadObjectAsyncWithId(self, ImagePath, {
    self,
    WBP_PickUpTipsItem_C.OnIconLoadFinish
  })
  if Handle then
    self.LoadResourceID = Handle.ResourceID
  end
  self.Duration = Duration
  self:PlayAnimation(self.IN)
end

function WBP_PickUpTipsItem_C:OnAnimationFinished(InAnimation)
  if InAnimation == self.Out then
    self:CloseSelf()
  end
end

function WBP_PickUpTipsItem_C:OnIconLoadFinish(Object, ResourceID)
  if not (Object and IsValid(self)) or self.LoadResourceID ~= ResourceID then
    return
  end
  if self.Image_ItemIcon then
    self.Image_ItemIcon:SetBrushResourceObject(Object)
  end
end

return WBP_PickUpTipsItem_C
