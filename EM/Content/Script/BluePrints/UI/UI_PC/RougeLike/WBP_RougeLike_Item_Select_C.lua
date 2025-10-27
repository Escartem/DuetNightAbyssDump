local WBP_RougeLike_Item_Select_C = Class("BluePrints.UI.BP_UIState_C")

function WBP_RougeLike_Item_Select_C:OnLoaded(AwardList)
  self:UISetGamePaused(self.WidgetName or self.ConfigName, true)
  self.AwardList = AwardList
  self:ShowNextAward()
  for i = 1, 3 do
    local ItemWidgetName = string.format("RogueLike_Select_Item_Widget_%s", i)
    local ItemWidget = self[ItemWidgetName]
    assert(ItemWidget, string.format("RougeLike_Item_Select\228\184\173\230\137\190\228\184\141\229\136\176\230\142\167\228\187\182:\227\128\144%s\227\128\145", ItemWidgetName))
    ItemWidget:OnLoaded()
  end
end

function WBP_RougeLike_Item_Select_C:ShowNextAward()
  if next(self.AwardList) == nil then
    self:Close()
    return
  end
  self.ItemSelectInfo = self.AwardList[1]
  self.AwardType = self.ItemSelectInfo.AwardType
  local RandomId = self.ItemSelectInfo.RandomId
  assert(self.AwardType == "Blessing" or self.AwardType == "Treasure", string.format("RougeLike_Item_Select\228\188\160\229\133\165\231\154\132Type:\227\128\144%s\227\128\145\228\184\141\230\152\175\230\156\137\230\149\136\231\154\132Type", tostring(self.AwardType)))
  local InfoList = self.ItemSelectInfo.InfoList
  if self.ItemSelectInfo.RandomType == "Random_3" then
    for i = 1, 3 do
      local ItemWidgetName = string.format("RogueLike_Select_Item_Widget_%s", i)
      local ItemWidget = self[ItemWidgetName]
      assert(ItemWidget, string.format("RougeLike_Item_Select\228\184\173\230\137\190\228\184\141\229\136\176\230\142\167\228\187\182:\227\128\144%s\227\128\145", ItemWidgetName))
      local InfoId, InfoData = self:GetInfoDataFromItemInfo(self.AwardType, InfoList[i].ItemId)
      ItemWidget:SetInfo(self, InfoId, InfoData)
    end
  elseif self.ItemSelectInfo.RandomType == "Random_1" then
    for i = 1, 2 do
      local ItemWidgetName = string.format("RogueLike_Select_Item_Widget_%s", i)
      local ItemWidget = self[ItemWidgetName]
      assert(ItemWidget, string.format("RougeLike_Item_Select\228\184\173\230\137\190\228\184\141\229\136\176\230\142\167\228\187\182:\227\128\144%s\227\128\145", ItemWidgetName))
      ItemWidget:SetVisibility(UE4.ESlateVisibility.Collapsed)
    end
    local InfoId, InfoData = self:GetInfoDataFromItemInfo(self.AwardType, InfoList[1].ItemId)
    self.RogueLike_Select_Item_Widget_3:SetInfo(self, InfoId, InfoData)
  end
  table.remove(self.AwardList, 1)
end

function WBP_RougeLike_Item_Select_C:ChooseItem(ItemId, ChooseWidget)
  PrintTable({WBP_RougeLike_Item_Select_C = 1, ChooseItem = ItemId})
  if self.ItemSelectInfo.RandomType == "Random_3" then
    local Avatar = GWorld:GetAvatar()
    assert(Avatar, "Avatar\228\184\141\229\173\152\229\156\168")
    if self.AwardType == "Blessing" then
      Avatar:GetBlessing(ItemId, function()
        self:ShowNextAward()
      end)
    elseif self.AwardType == "Treasure" then
      Avatar:GetTreasure(ItemId, function()
        self:ShowNextAward()
      end)
    end
  elseif self.ItemSelectInfo.RandomType == "Random_1" and GWorld.RougeLikeManager then
    local RougeLikeMgr = GWorld.RougeLikeManager
    if self.AwardType == "Blessing" then
      RougeLikeMgr:AddBlessings(ItemId)
      self:ShowNextAward()
    elseif self.AwardType == "Treasure" then
      RougeLikeMgr:AddTreasures(ItemId)
      self:ShowNextAward()
    end
  end
end

function WBP_RougeLike_Item_Select_C:GetInfoDataFromItemInfo(AwardType, ItemId)
  if "Blessing" == AwardType then
    local InfoData = DataMgr.RougeLikeBlessing[ItemId]
    assert(InfoData, string.format("\228\188\160\229\133\165\231\154\132\229\136\187\229\141\176\231\188\150\229\143\183\227\128\144%s\227\128\145\228\184\141\229\173\152\229\156\168", ItemId))
    return InfoData.BlessingId, InfoData
  end
  if "Treasure" == AwardType then
    local InfoData = DataMgr.RougeLikeTreasure[ItemId]
    assert(InfoData, string.format("\228\188\160\229\133\165\231\154\132\229\174\157\231\137\169\231\188\150\229\143\183\227\128\144%s\227\128\145\228\184\141\229\173\152\229\156\168", ItemId))
    return InfoData.TreasureId, InfoData
  end
end

function WBP_RougeLike_Item_Select_C:Close()
  self:UISetGamePaused(self.WidgetName or self.ConfigName, false)
  local Avatar = GWorld:GetAvatar()
  EventManager:FireEvent(EventID.OnSwitchRole, Avatar.CurrentChar)
  self.Super.Close(self)
end

return WBP_RougeLike_Item_Select_C
