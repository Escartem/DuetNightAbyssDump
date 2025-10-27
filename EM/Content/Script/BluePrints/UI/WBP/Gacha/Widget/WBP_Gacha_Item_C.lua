require("UnLua")
local M = Class({
  "BluePrints.UI.UI_PC.Common.Common_Item.WBP_Com_Item_Base_C"
})

function M:Init(Content)
  self:InitData(Content)
  self.DelayTime = Content.DelayTime or 0
  self.Panel_Change:SetVisibility(ESlateVisibility.Collapsed)
  self.Text_GetNum:SetText(Content.Count)
  if Content.bNew then
    self.New:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  else
    self.New:SetVisibility(ESlateVisibility.Collapsed)
  end
  self.bConvert = Content.bConvert
  if 6 == Content.Rarity then
    self:PlayAnimation(self.In_Red)
  elseif 5 == Content.Rarity then
    self:PlayAnimation(self.In_Yellow)
  elseif 4 == Content.Rarity then
    self:PlayAnimation(self.In_Purple)
  elseif 3 == Content.Rarity then
    self:PlayAnimation(self.In_Blue)
  end
  self:OnListItemObjectSet(Content)
end

function M:PlayConvertAnim()
  if self.bConvert then
    local ItemData = DataMgr[self.Content.ItemType][self.Content.Id]
    assert(ItemData, "\230\138\189\229\141\161\231\187\147\230\158\156\233\129\147\229\133\183\228\184\141\229\173\152\229\156\168")
    if ItemData.RegainItemId then
      self.ItemIcon:Init({
        Id = ItemData.RegainItemId,
        Icon = LoadObject(DataMgr.Resource[ItemData.RegainItemId].Icon),
        ItemType = "Resource",
        UIName = "GahcaMain",
        IsShowDetails = true,
        MenuPlacement = EMenuPlacement.MenuPlacement_MenuRight
      })
      self.Text_ItemNum:SetText("\195\151" .. ItemData.RegainItemNum)
    end
    AudioManager(self):PlayUISound(self, "event:/ui/common/gacha_trans_to_coin", nil, nil)
    self:PlayAnimation(self.Convert)
  end
end

function M:IsInAnimationPlaying()
  if self:IsAnimationPlaying(self.In_Red) or self:IsAnimationPlaying(self.In_Yellow) or self:IsAnimationPlaying(self.In_Purple) or self:IsAnimationPlaying(self.In_Blue) or self:IsAnimationPlaying(self.Convert) then
    return true
  end
  return false
end

function M:OnAnimationFinished(InAnim)
  if InAnim == self.In_Red or InAnim == self.In_Yellow or InAnim == self.In_Purple or InAnim == self.In_Blue then
    if self.DelayTime then
      self:AddTimer(self.DelayTime, function()
        self:PlayConvertAnim()
      end)
    end
  elseif InAnim == self.Convert then
    self.Panel_Change:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    if self:HasAnyFocus() then
      self.ItemIcon:SetFocus()
    end
  end
end

function M:OnFocusReceived(MyGeometry, InFocusEvent)
  if self.bConvert then
    self.ItemIcon:SetFocus()
  end
  return UWidgetBlueprintLibrary.Handled()
end

return M
