require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:Construct()
  self:SetVisibility(UIConst.VisibilityOp.Visible)
  self.TeamIdxIcons = {
    [0] = self.Text_A,
    [1] = self.Text_B
  }
end

function M:OnListItemObjectSet(Content)
  self.Content = Content
  Content.Widget = self
  if Content.Type == CommonConst.DataType.Weapon then
    self.TabItem:SetIcon(Content.Icon or Content.IconPath, 1)
  else
    self.TabItem:SetIcon(Content.Icon or Content.IconPath, 0)
  end
  self:ShowPhantomIdx(Content.Info)
  self:ShowPhantomIcon(Content.IsPhantomWeapon, Content.PhantomCharId)
  self:ShowEquippedIcon(Content.IsPhantomWeapon, Content.Info)
  self.TabItem:SetLevel(Content.Level)
  self.TabItem:SetRarity(Content.Rarity)
  self.TabItem:SetIsPremium(Content.IsPremium)
  self.TabItem:StopAllAnimations()
  self.TabItem:FlushAnimations()
  self:SetSelected(Content.IsSelected)
end

function M:ShowPhantomIdx(Info)
  if Info and Info.Tag then
    local SlotName = Info.Tag
    if "Phantom1" == SlotName or "Phantom2" == SlotName then
      local TeamIdx = Info.TeamIdx
      if TeamIdx and type(TeamIdx) == "number" then
        TeamIdx = TeamIdx - 1
        self.WS_Team:SetActiveWidgetIndex(TeamIdx)
        self.Panel_Abyss:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
        local TeamIdxIcon = self.TeamIdxIcons[TeamIdx]
        if TeamIdxIcon then
          if "Phantom1" == SlotName then
            TeamIdxIcon:SetText("1")
            return
          elseif "Phantom2" == SlotName then
            TeamIdxIcon:SetText("2")
            return
          end
        end
      end
    end
  end
  self.Panel_Abyss:SetVisibility(UE4.ESlateVisibility.Collapsed)
end

function M:ShowPhantomIcon(IsPhantomWeapon, PhantomCharId)
  if not IsPhantomWeapon then
    self.TabItem.Image_Phantom:SetVisibility(UE4.ESlateVisibility.Collapsed)
    return
  end
  local LoadFlag = self:SetPhantomIcon(PhantomCharId)
  if LoadFlag then
    self.TabItem.Image_Phantom:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  else
    self.TabItem.Image_Phantom:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
end

function M:ShowEquippedIcon(IsPhantomWeapon, Info)
  if IsPhantomWeapon or Info then
    self.TabItem.Image_Equipped:SetVisibility(UE4.ESlateVisibility.Collapsed)
    return
  else
    self.TabItem.Image_Equipped:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  end
end

function M:SetPhantomIcon(CharId)
  local MiniIconPath = "Texture2D'/Game/UI/Texture/Dynamic/Image/Head/Mini/"
  local PhantomGuideIconImg = "T_Normal_" .. DataMgr.BattleChar[CharId].GuideIconImg
  if not PhantomGuideIconImg then
    return false
  end
  local IconPath = MiniIconPath .. PhantomGuideIconImg .. "." .. PhantomGuideIconImg .. "'"
  if self.TabItem.Image_Phantom then
    local Icon = LoadObject(IconPath)
    if Icon then
      self.TabItem.Image_Phantom:SetBrushResourceObject(Icon)
      return true
    end
  end
  return false
end

function M:BP_OnEntryReleased()
  if self.Content then
    self.Content.Widget = nil
  end
end

function M:SetSelected(IsSelect)
  self.TabItem:SetSelected(IsSelect)
end

return M
