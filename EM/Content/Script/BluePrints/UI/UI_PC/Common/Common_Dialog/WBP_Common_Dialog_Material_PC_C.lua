require("UnLua")
local WBP_Common_Dialog_ItemSubsize_PC_C = Class("BluePrints.UI.UI_PC.Common.Common_Dialog.Common_Dialog_ContentBase")

function WBP_Common_Dialog_ItemSubsize_PC_C:PreInitContent(Params, PopupData, Ownwer)
  self.Super.PreInitContent(self, Params, PopupData, Ownwer)
  self:BindDialogEvent("UpdateItemSubSize", self.UpdateView)
end

function WBP_Common_Dialog_ItemSubsize_PC_C:InitContent(Params, PopupData, Owner)
  self.Super.InitContent(self, Params, PopupData, Owner)
  self:UpdateView(Params)
end

function WBP_Common_Dialog_ItemSubsize_PC_C:UpdateView(Params)
  self.Item:ClearChildren()
  local PadX = Params.ItemPadX and Params.ItemPadX or self.Item.InnerSlotPadding.X
  self.Item:SetInnerSlotPadding(FVector2D(PadX, 0))
  if not Params.ItemList then
    return
  end
  for _, ResInfo in ipairs(Params.ItemList) do
    local Icon, Rarity, Num, Need
    local ItemDatas = DataMgr[ResInfo.ItemType]
    if ItemDatas then
      local ItemData = ItemDatas[ResInfo.ItemId]
      if ItemData.Icon then
        Icon = ItemData.Icon
      end
      Rarity = ItemData.Rarity
      Num = ResInfo.ItemNum
      Need = ResInfo.ItemNeed
    end
    if ResInfo.ItemType == "Weapon" then
      local WeaponData = DataMgr.Weapon[ResInfo.ItemId]
      Icon = Icon or WeaponData.Icon
      Rarity = WeaponData.WeaponRarity
      Num = ResInfo.ItemNum
    elseif ResInfo.ItemType == "Mod" then
      local ModData = DataMgr.Mod[ResInfo.ItemId]
      Icon = Icon or ModData.Icon
      Rarity = ModData.Rarity
      Num = ResInfo.ItemNum
    elseif ResInfo.ItemType == "CharAccessory" then
      local CharAccessoryData = DataMgr.CharAccessory[ResInfo.ItemId]
      Icon = Icon or CharAccessoryData.Icon
      Num = ResInfo.ItemNum
    elseif ResInfo.ItemType == "Resource" then
      local ResourceData = DataMgr.Resource[ResInfo.ItemId]
      Icon = Icon or ResourceData.Icon
      Rarity = ResourceData.Rarity
      Num = ResInfo.ItemNum
      Need = ResInfo.ItemNeed
    end
    if Params.LargeSizeItem then
      local Content = {
        Id = ResInfo.ItemId,
        Icon = Icon,
        Count = Num,
        NeedCount = Need,
        ItemType = ResInfo.ItemType,
        Rarity = Rarity,
        IsShowDetails = true
      }
      self:ShowLargeItem(Params, Content)
    else
      local Content = {
        Id = ResInfo.ItemId,
        Icon = Icon,
        Count = Num,
        NeedCount = Need,
        ItemType = ResInfo.ItemType,
        Rarity = Rarity,
        IsShowDetails = true
      }
      self:ShowNormalItem(Params, Content)
    end
  end
end

function WBP_Common_Dialog_ItemSubsize_PC_C:ShowLargeItem(Params, Content)
  local ResWidget = self:CreateWidgetNew("ComItemUniversalL")
  self.Item:AddChild(ResWidget)
  ResWidget:OnListItemObjectSet(Content)
end

function WBP_Common_Dialog_ItemSubsize_PC_C:ShowNormalItem(Params, Content)
  local ResWidget = self:CreateWidgetNew("ComItemUniversalM")
  self.Item:AddChild(ResWidget)
  ResWidget:Init(Content)
end

function WBP_Common_Dialog_ItemSubsize_PC_C:SetText(Text)
  self.Text_Details:SetText(Text)
end

return WBP_Common_Dialog_ItemSubsize_PC_C
