local UIUtils = require("Utils.UIUtils")
require("UnLua")
local CommonUtils = require("Utils.CommonUtils")
local M = Class({
  "BluePrints.Common.TimerMgr",
  "BluePrints.UI.BP_UIState_C"
})

function M:Construct()
  self.Overridden.Construct(self)
  self:SetVisibility(ESlateVisibility.Collapsed)
  self.DropIgnoreMap = {
    GetResource = 1,
    GetWeapon = 1,
    GetMod = 1
  }
  self.UsingItemList = {}
  self.WaitingList = {}
  if CommonUtils.GetDeviceTypeByPlatformName(self) ~= "PC" then
    self.VerticalBox_Bottom:RemoveChildAt(3)
    self.VerticalBox_Bottom:RemoveChildAt(2)
  end
end

function M:Destruct()
  self:StopAllAnimations()
  self:CleanTimer()
end

function M:OnUpdateTips(ItemId, ItemCount, TableName)
  self:SetVisibility(ESlateVisibility.Visible)
  if not self:AddValidTipsItem(ItemId, ItemCount, TableName) then
    if not self.WaitingList[TableName] then
      self.WaitingList[TableName] = {}
    end
    table.insert(self.WaitingList[TableName], {ItemId, ItemCount})
  end
end

function M:AddValidTipsItem(ItemId, ItemCount, TableName)
  local ItemData = DataMgr[TableName][ItemId]
  if not ItemData then
    return nil
  end
  local UIType
  if "Resource" == TableName or "Mod" == TableName then
    if ItemData.Type == "Ordinary" then
      UIType = "Ordinary"
    end
  else
    UIType = TableName
  end
  if not UIType then
    return false
  end
  if "Drop" == UIType or "Ordinary" == UIType then
    if not self.DropIgnoreMap[ItemData.UseEffectType] then
      local TipsItem
      for i = 0, self.VerticalBox_Bottom:GetChildrenCount() - 1 do
        local ChildItem = self.VerticalBox_Bottom:GetChildAt(i)
        if ChildItem.ItemId == ItemId then
          if ChildItem:IsAnimationPlaying(ChildItem.out) then
            return false
          end
          ChildItem:AddItemCount(ItemCount)
          return true
        end
      end
      for i = 0, self.VerticalBox_Bottom:GetChildrenCount() - 1 do
        if self.VerticalBox_Bottom:GetChildAt(i):IsTipsCanUse() then
          TipsItem = self.VerticalBox_Bottom:GetChildAt(i)
          break
        end
      end
      if not TipsItem then
        return false
      end
      TipsItem:RemoveFromParent()
      self.UsingItemList[TipsItem] = 1
      local Slot = self.VerticalBox_Bottom:AddChildToVerticalBox(TipsItem)
      TipsItem:UpdateTips(ItemId, ItemCount, nil, TableName)
      Slot:SetPadding(FMargin(0))
      return true
    elseif 0 == CommonUtils.TableLength(self.UsingItemList) then
      self:SetVisibility(ESlateVisibility.Collapsed)
    end
  end
  return false
end

function M:AddTopItem(ItemId, ItemCount, TableName)
  local ItemData = DataMgr[TableName][ItemId]
  if not ItemData then
    return nil
  end
  if self.VerticalBox_Top:GetChildrenCount() >= 3 then
    return false
  end
  local TipsItem
  local bChangeBackground = false
  local Padding = UE4.FMargin(0, 0, 0, 0)
  if "Resource" == TableName then
    if ItemData.Type == "Rare" then
      TipsItem = self:LoadTipsItem(self.RareResourceRewardClass)
      bChangeBackground = true
    else
      TipsItem = self:LoadTipsItem(self.ResourceRewardClass)
    end
  elseif "Mod" == TableName then
    TipsItem = self:LoadTipsItem(self.ModRewardClass)
    bChangeBackground = true
    Padding.Left = 200
  end
  if not TipsItem then
    return nil
  end
  self.UsingItemList[TipsItem] = 1
  local Slot = self.VerticalBox_Top:AddChildToVerticalBox(TipsItem)
  Slot:SetPadding(Padding)
  TipsItem:UpdateTips(ItemId, ItemCount, nil, TableName, bChangeBackground)
  return true
end

function M:LoadTipsItem(UIClass)
  return UE4.UWidgetBlueprintLibrary.Create(self, UIClass)
end

function M:OnTipsItemClose(InItem)
  if not InItem then
    return
  end
  self.UsingItemList[InItem] = nil
  UIUtils.ShowTopTips()
  for TableName, TipsInfoList in pairs(self.WaitingList) do
    if 0 ~= #TipsInfoList then
      local TipsInfo = TipsInfoList[1]
      if self:AddValidTipsItem(TipsInfo[1], TipsInfo[2], TableName) then
        table.remove(TipsInfoList, 1)
      end
    end
  end
  if 0 == CommonUtils.TableLength(self.UsingItemList) then
    self:SetVisibility(ESlateVisibility.Collapsed)
  end
end

function M:TryPlayOutAnimation()
  local OriItemCount = 0
  for i = 0, self.VerticalBox_Bottom:GetChildrenCount() - 1 do
    if self.VerticalBox_Bottom:GetChildAt(i).ItemId ~= nil then
      OriItemCount = OriItemCount + 1
      if OriItemCount > 1 then
        return
      end
    end
  end
end

function M:SpecialRewardIsCanUse()
  return self.WBP_Special_Reward:IsTipsCanUse()
end

return M
