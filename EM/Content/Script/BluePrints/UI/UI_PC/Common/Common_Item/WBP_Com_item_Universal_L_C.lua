require("UnLua")
local M = Class({
  "BluePrints.UI.UI_PC.Common.Common_Item.WBP_Com_Item_Base_C"
})

function M:InitData(Content)
  M.Super.InitData(self, Content)
  self.bConflict = Content.bConflict
  self.bMinus = Content.bMinus
  self.CurrencyId = Content.CurrencyId
  self.CurrencyNum = Content.CurrencyNum
  self.Polarity = Content.Polarity
  self.PolarityNum = Content.PolarityNum
  self.bSelectTag = Content.bSelectTag
  self.bSet = Content.bSet
  self.SetOwnText = Content.SetOwnText
  self.bUnrevealed = Content.bUnrevealed
  self.LevelCardNum = Content.LevelCardNum
  self.StartLevelNum = Content.StartLevelNum
  self.AttrIcon = Content.AttrIcon
  self.IsPhantom = Content.IsPhantom
  self.bAura = Content.bAura
  self.TeamIdx = Content.TeamIdx
  self.TeamCharId = Content.TeamCharId
end

function M:InitCommonView()
  if self.bDontRemoveSubWidget then
    for _, Widget in pairs(self.Node_Widget:GetAllChildren()) do
      Widget:SetVisibility(UIConst.VisibilityOp.Collapsed)
    end
  else
    self.Node_Widget:ClearChildren()
    self.WidgetMap = {}
  end
  M.Super.InitCommonView(self)
end

function M:InitCompView()
  M.Super.InitCompView(self)
  self:SetCount(self.Count, self.NeedCount, self.MaxCount, self.NotCountFormat, self.bShowNotHaveStyle)
  self:SetBonus(self.BonusType, self.ExtraBonusText)
  self:SetName(self.ItemName)
  self:SetLevel(self.Level)
  self:SetIsCanGet(self.bCanGet, self.CanGetStyle)
  self:SetAttrIcon(self.AttrIcon)
  self:SetOutline(self.bOutline)
  if self.Content.Type == CommonConst.ArmoryType.Pet then
    self:SetPetStarLevel(self.Content.BreakNum)
    self:SetPetPremium(self.Content.IsPremium)
    if self.Content.PetEntry and #self.Content.PetEntry > 0 then
      self:SetLevel(nil)
      self:SetPetEntryId(self.Content.PetEntry)
    end
  else
    self:SetPetPremium(false)
  end
  if self.ItemType == "Weapon" then
    self:SetWeaponPhantomIcon(self.Uuid)
  end
  self:SetItemPolarity(self.Polarity, self.PolarityNum)
  self:SetItemLevelCard(self.LevelCardNum)
  self:SetItemStartLevel(self.StartLevelNum)
  self:SetItemMoney(self.CurrencyId, self.CurrencyNum)
  self:SetItemSold(self.bSold)
  self:SetAura(self.bAura)
  self:SetItemConflict(self.bConflict)
  self:SetIsGot(self.bHasGot)
  self:SetLock(self.LockType)
  self:SetItemMinus(self.bMinus)
  self:SetItemSelect(self.bSelectTag)
  self:SetSelectNum(self.SelectNeedCount, self.SelectTotalCount)
  self:SetItemSet(self.bSet, self.SetOwnText)
  self:SetShadow(self.bShadow)
  self:SetPhantomWeaponIcon(self.Id, self.IsPhantom)
  self:SetItemUnrevealed(self.bUnrevealed)
  self:SetRareTag(self.bRare)
  self:SetTryOutText(self.TryOutText)
  self:SetTimeLimitData(self.TimeLimitData)
  self:SetRedDot(self.RedDotType)
  self:SetTeamIcon(self.TeamIdx, self.TeamCharId)
  self:SetInGear(self.bInGear)
end

return M
