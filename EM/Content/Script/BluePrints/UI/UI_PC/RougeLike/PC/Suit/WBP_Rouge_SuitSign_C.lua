require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:Construct()
  self.ItemDetails_MenuAnchor.ItemDetailsMenuAnchor.OnMenuOpenChanged:Add(self, self.ItemMenuAnchorChanged)
end

function M:Destruct()
  self.ItemDetails_MenuAnchor.ItemDetailsMenuAnchor.OnMenuOpenChanged:Remove(self, self.ItemMenuAnchorChanged)
end

function M:BindEventOnMenuOpenChanged(Obj, OnMenuOpenChangedFunc)
  self.Obj = Obj
  self.OnMenuOpenChangedFunc = OnMenuOpenChangedFunc
end

function M:InitSuitSign(TreasureId, GroupId, Count, bPreview)
  local TreasureGroupData = DataMgr.TreasureGroup[GroupId]
  if TreasureGroupData then
    local IconObj = LoadObject(TreasureGroupData.Icon)
    assert(IconObj, "\230\156\170\230\137\190\229\136\176\229\175\185\229\186\148TreasureGroup\231\154\132Icon:" .. GroupId)
    self.Image_TitleIcon:SetBrushResourceObject(IconObj)
    local TreasureNum = UIUtils.GetTreasureGroupNum(TreasureId)
    local Text = "<G>" .. tostring(Count) .. "</>/" .. tostring(TreasureNum)
    if TreasureNum > 0 then
      self.Text_SuitTitle:SetText(Text)
      self:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    end
    local bRealActive = false
    if not bPreview and Count == TreasureNum then
      bRealActive = true
    end
    self.Content = {
      ItemType = "TreasureGroup",
      ItemId = GroupId,
      MenuPlacement = EMenuPlacement.MenuPlacement_MenuRight
    }
    self.Com_BtnQa:Init({
      OwnerWidget = self,
      ClickCallback = function()
        if GroupId then
          local Content = {
            ItemType = "TreasureGroup",
            ItemId = GroupId,
            MenuPlacement = EMenuPlacement.MenuPlacement_MenuRight,
            bActive = bRealActive
          }
          self.ItemDetails_MenuAnchor:OpenItemDetailsWidget(false, Content)
        end
      end
    })
  else
    ScreenPrint("\230\156\170\230\137\190\229\136\176\229\175\185\229\186\148TreasureGroup\228\191\161\230\129\175\239\188\154" .. GroupId)
  end
end

function M:ItemMenuAnchorChanged(bOpen)
  if self.OnMenuOpenChangedFunc then
    self.OnMenuOpenChangedFunc(self.Obj, bOpen)
  end
end

function M:OnGamePadDown(InKeyName)
  if InKeyName == UIConst.GamePadKey.LeftThumb then
    self.ItemDetails_MenuAnchor:OpenItemDetailsWidget(false, self.Content)
    return UIUtils.Handled
  end
end

return M
