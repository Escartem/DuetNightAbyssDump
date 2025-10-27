require("UnLua")
local M = Class("BluePrints.UI.UI_PC.Common.Common_Dialog.Common_Dialog_ContentBase")

function M:InitContent(Params, PopupData, Owner)
  self.Super.InitContent(self, Params, PopupData, Owner)
  self:AddInputMethodChangedListen()
  for i = 1, #Params.ItemId do
    local ShopType = Params.ItemType[i]
    local Content = NewObject(UIUtils.GetCommonItemContentClass())
    if "CharAccessory" == ShopType then
      Content.ItemId = Params.ItemId[i]
      Content.ItemType = "CharAccessory"
      Content.Icon = DataMgr.CharAccessory[Params.ItemId[i]].Icon
      Content.Name = DataMgr.CharAccessory[Params.ItemId[i]].Name
    elseif "WeaponAccessory" == ShopType then
      Content.ItemId = Params.ItemId[i]
      Content.ItemType = "WeaponAccessory"
      Content.Icon = DataMgr.WeaponAccessory[Params.ItemId[i]].Icon
      Content.Name = DataMgr.WeaponAccessory[Params.ItemId[i]].Name
    elseif "WeaponSkin" == ShopType then
      Content.ItemId = Params.ItemId[i]
      Content.ItemType = "WeaponSkin"
      Content.Icon = DataMgr.WeaponSkin[Params.ItemId[i]].Icon
      Content.Name = DataMgr.WeaponSkin[Params.ItemId[i]].Name
    elseif "Skin" == ShopType then
      Content.ItemId = Params.ItemId[i]
      Content.ItemType = "Skin"
      Content.Icon = DataMgr.Skin[Params.ItemId[i]].Icon
      Content.Name = DataMgr.Skin[Params.ItemId[i]].SkinName
    end
    self.CommonTileView_Rewards:AddItem(Content)
  end
  self.CommonTileView_Rewards:RequestRefresh()
  self:ShowGamepadShortcutBtn({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "A"}
    },
    Desc = GText("UI_GACHA_DESDETAIL")
  })
end

function M:HandleDialogFocused()
  return self.CommonTileView_Rewards
end

function M:OnUpdateUIStyleByInputTypeChange(CurInputType, CurGamepadName)
  if self:HasAnyFocus() then
    self.CommonTileView_Rewards:SetFocus()
  end
end

function M:OnContentKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
end

return M
