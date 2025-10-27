require("UnLua")
local MonsterUtils = require("Utils.MonsterUtils")
local MONSTER_BOSS_ICON = "/Game/UI/Texture/Static/Atlas/Play/T_Play_BossMonster.T_Play_BossMonster"
local MONSTER_ELITE_ICON = "/Game/UI/Texture/Static/Atlas/Play/T_Play_EliteMonster.T_Play_EliteMonster"
local MONSTER_INFO_WEAKNESS_ITEM = "/Game/UI/WBP/Play/Widget/Depute/MonsterInfo_Tab_Item_Content.MonsterInfo_Tab_Item_Content"
local M = Class("BluePrints.UI.BP_EMUserWidget_C")

function M:Construct()
  self.Button_Area.OnClicked:Add(self, self.onButtonAreaClicked)
  self.Button_Area.OnHovered:Add(self, self.OnButtonAreaHovered)
  self.Button_Area.OnUnhovered:Add(self, self.OnBtnUnhovered)
  self.Button_Area.OnPressed:Add(self, self.OnBtnPressed)
end

function M:Destruct()
  self.Button_Area.OnClicked:Clear()
  self.Button_Area.OnHovered:Clear()
  self.Button_Area.OnUnhovered:Clear()
end

function M:OnListItemObjectSet(Obj)
  DebugPrint("gmy@TabOnListItemObjectSet", Obj.MonsterId, Obj.bIsDefaultSelected)
  local MonsterId = Obj.MonsterId
  local MonsterInfo = DataMgr.Monster[MonsterId]
  if self.ParentWidget and self.MonsterId and self.ParentWidget.MonsterIdToItem and self.ParentWidget.MonsterIdToItem[self.MonsterId] == self then
    self.ParentWidget.MonsterIdToItem[self.MonsterId] = nil
  end
  self.MonsterId = MonsterId
  self.ParentWidget = Obj.ParentWidget
  self.ParentWidget.MonsterIdToItem[MonsterId] = self
  self.DisableSelect = Obj.DisableSelect
  self.SoundEvent = Obj.SoundEvent
  assert(MonsterInfo, string.format("MonsterInfo is nil, MonsterId = %s", MonsterId))
  local bIsBoss = MonsterUtils.IsBoss(MonsterId)
  local bIsElite = MonsterUtils.IsElite(MonsterId)
  local bIsNormal = not bIsElite and not bIsBoss
  local MonsterIcon = LoadObject(string.format("Texture2D'%s'", MonsterInfo.Icon))
  if bIsNormal then
    self.Icon_Monster_Type:SetVisibility(UE4.ESlateVisibility.Collapsed)
  else
    self.Icon_Monster_Type:SetVisibility(UE4.ESlateVisibility.Visible)
    local MonsterTypeIcon
    if bIsBoss then
      MonsterTypeIcon = LoadObject(string.format("%s", MONSTER_BOSS_ICON))
    else
      MonsterTypeIcon = LoadObject(string.format("%s", MONSTER_ELITE_ICON))
    end
    self.Icon_Monster_Type:SetBrushResourceObject(MonsterTypeIcon)
  end
  self:RefreshWeaknessIcon(Obj)
  local ImgMat = self.Monster_Head:GetDynamicMaterial()
  ImgMat:SetTextureParameterValue("IconMap", MonsterIcon)
  local ShouldSelect = false
  if self.ParentWidget then
    local SelectedMonsterId
    if self.ParentWidget.DisplayMonsters and self.ParentWidget.NowSelectingIndex then
      SelectedMonsterId = self.ParentWidget.DisplayMonsters[self.ParentWidget.NowSelectingIndex]
    end
    if SelectedMonsterId and SelectedMonsterId == MonsterId then
      ShouldSelect = true
    elseif Obj.bIsDefaultSelected and not SelectedMonsterId then
      ShouldSelect = true
    end
  end
  if ShouldSelect then
    if self.ParentWidget.SelectingItem ~= self then
      self:ForceToSelection()
    else
      self.IsSelect = true
      self:PlayAnimation(self.Select)
    end
  else
    local SelectedMonsterId
    if self.ParentWidget and self.ParentWidget.DisplayMonsters and self.ParentWidget.NowSelectingIndex then
      SelectedMonsterId = self.ParentWidget.DisplayMonsters[self.ParentWidget.NowSelectingIndex]
    end
    if self.ParentWidget and self.ParentWidget.SelectingItem == self and SelectedMonsterId ~= MonsterId then
      self.ParentWidget.SelectingItem = nil
    end
    self:CancelTabSelect()
  end
end

function M:SetBasicData(MonsterId, Obj)
  local MonsterInfo = DataMgr.Monster[MonsterId]
  local bIsBoss = MonsterUtils.IsBoss(MonsterId)
  local bIsElite = MonsterUtils.IsElite(MonsterId)
  local bIsNormal = not bIsElite and not bIsBoss
  local MonsterIcon = LoadObject(string.format("Texture2D'%s'", MonsterInfo.Icon))
  if bIsNormal then
    self.Icon_Monster_Type:SetVisibility(UE4.ESlateVisibility.Collapsed)
  else
    self.Icon_Monster_Type:SetVisibility(UE4.ESlateVisibility.Visible)
    local MonsterTypeIcon
    if bIsBoss then
      MonsterTypeIcon = LoadObject(string.format("Texture2D'%s'", MONSTER_BOSS_ICON))
    else
      MonsterTypeIcon = LoadObject(string.format("Texture2D'%s'", MONSTER_ELITE_ICON))
    end
    self.Icon_Monster_Type:SetBrushResourceObject(MonsterTypeIcon)
  end
  self:RefreshWeaknessIcon(Obj)
  local ImgMat = self.Monster_Head:GetDynamicMaterial()
  ImgMat:SetTextureParameterValue("IconMap", MonsterIcon)
end

function M:RefreshWeaknessIcon(Obj)
  if Obj.WeaknessIcon then
    self.Group_Weak:SetVisibility(ESlateVisibility.Visible)
    local IconSet = Obj.WeaknessIcon
    local IconList = {}
    for Icon, WeaknessType in pairs(IconSet) do
      table.insert(IconList, {Icon = Icon, WeaknessType = WeaknessType})
    end
    table.sort(IconList, MonsterUtils.SortWeaknessTypeIcon)
    self.List_Weak:ClearListItems()
    local Class = LoadClass(MONSTER_INFO_WEAKNESS_ITEM)
    for _, v in ipairs(IconList) do
      local Content = NewObject(Class)
      Content.WeaknessIcon = v.Icon
      self.List_Weak:AddItem(Content)
    end
  else
    self.Group_Weak:SetVisibility(ESlateVisibility.Collapsed)
  end
end

function M:ForceToSelection()
  if not self.DisableSelect then
    self.IsSelect = true
    self:PlayAnimation(self.Select)
  end
  self.ParentWidget:SetTabItemSelection(self)
end

function M:onButtonAreaClicked()
  if not self.ParentWidget:IsAnimationPlaying(self.ParentWidget.Out) then
    AudioManager(self):PlayUISound(self, self.SoundEvent, nil, nil)
    self.ParentWidget:SelectMonsterInfoItem(self.MonsterId)
    if self.ParentWidget.TryMoveMonsterInfo then
      self.ParentWidget:TryMoveMonsterInfo(0)
    end
  end
end

function M:OnButtonAreaHovered()
  if not self.IsSelect then
    self:PlayAnimation(self.Hover)
  end
end

function M:OnBtnPressed()
  if not self.IsSelect then
    self:PlayAnimation(self.Press)
  end
end

function M:OnBtnUnhovered()
  if not self.IsSelect then
    self:PlayAnimation(self.Normal)
  end
end

function M:CancelTabSelect()
  self.IsSelect = false
  self:PlayAnimation(self.Normal)
end

return M
