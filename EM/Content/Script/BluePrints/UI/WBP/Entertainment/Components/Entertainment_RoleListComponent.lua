local FEntertainmentUtils = require("BluePrints.UI.WBP.Entertainment.EntertainmentUtils")
local Component = Class()

function Component:OnInitialize()
  self.ChangeCharacterSound = "event:/ui/common/role_replace"
end

function Component:OnConstruct()
  self.EMListView_Role.BP_OnItemClicked:Add(self, self.OnCharacterItemClicked)
  self.SelectItem = nil
end

function Component:OnDestruct()
  self.EMListView_Role.BP_OnItemClicked:Remove(self, self.OnCharacterItemClicked)
  self.SelectItem = nil
  self.RoleContentList = nil
end

function Component:OpenComponentPanel()
  self.Tab_L:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  self:RefreshSelect()
end

function Component:CloseComponentPanel()
  self.Tab_L:SetVisibility(ESlateVisibility.Collapsed)
end

function Component:OnInitUIInfo()
  self:InitRoleContentList()
  self:InitRoleListView()
end

function Component:CreateRoleListItem(CharacterData, IsSelected)
  local BPClass = UIUtils.GetCommonItemContentClass()
  local ContentObj = NewObject(BPClass)
  if nil == CharacterData then
    return ContentObj
  end
  ContentObj.Parent = self
  ContentObj.Type = "Npc"
  ContentObj.IsSelected = IsSelected or false
  ContentObj.Id = CharacterData.Id
  ContentObj.Rarity = CharacterData.Rarity
  ContentObj.Icon = CharacterData.IconPath
  ContentObj.Upgradeable = FEntertainmentUtils:IsCharacterShowRedDot(CharacterData.Id)
  ContentObj.bPriority = CharacterData.bPriority
  return ContentObj
end

function Component:RefreshRedDot()
  for _, Content in pairs(self.RoleContentList) do
    Content.Upgradeable = FEntertainmentUtils:IsCharacterShowRedDot(Content.Id)
    if Content.Widget then
      Content.Widget:SetReddot(nil, Content.Upgradeable)
    end
  end
end

function Component:SetSelectItem(Item)
  local OldItem = self.SelectItem
  self.SelectItem = Item
  if OldItem then
    OldItem.IsSelected = false
    if OldItem.Widget then
      OldItem.Widget:SetIsSelected(false)
    end
  end
  Item.IsSelected = true
  if Item.Widget then
    Item.Widget:SetIsSelected(true)
  end
  if self.EMListView_Role:HasAnyUserFocus() or self.EMListView_Role:HasFocusedDescendants() then
    self.EMListView_Role:BP_NavigateToItem(Item)
  end
end

function Component:RefreshSelect()
  if self.SelectItem and self.CharacterData then
    if self.SelectItem.Id ~= self.CharacterData.Id then
      for _, Content in pairs(self.RoleContentList) do
        if Content.Id == self.CharacterData.Id then
          self:SetSelectItem(Content)
          break
        end
      end
    end
    self:SortItem()
    self:InitRoleListView()
  end
end

function Component:InitRoleContentList()
  self.RoleContentList = {}
  local OwnedCharacterDataMap = self.OwnedCharacterDataMap
  local SelectCharacterData = self.CharacterData
  for CharId, CharacterData in pairs(OwnedCharacterDataMap) do
    local bIsSelected = SelectCharacterData.Id == CharacterData.Id
    local Item = self:CreateRoleListItem(CharacterData, bIsSelected)
    table.insert(self.RoleContentList, Item)
    if bIsSelected then
      self:SetSelectItem(Item)
    end
  end
  self:SortItem()
end

function Component:SortItem()
  local CharacterData = self.CharacterData
  local SelectId = CharacterData.Id
  table.sort(self.RoleContentList, function(Item1, Item2)
    if Item1.bPriority and not Item2.bPriority then
      return true
    end
    if not Item1.bPriority and Item2.bPriority then
      return false
    end
    if SelectId == Item1.Id then
      return true
    end
    if SelectId == Item2.Id then
      return false
    end
    if Item1.Rarity == Item2.Rarity then
      return Item1.Id > Item2.Id
    end
    return Item1.Rarity > Item2.Rarity
  end)
  self:SetSelectItem(self.SelectItem)
end

function Component:InitRoleListView()
  self.EMListView_Role:ClearListItems()
  for _, Content in ipairs(self.RoleContentList) do
    self.EMListView_Role:AddItem(Content)
  end
  self.EMListView_Role:ScrollToTop()
end

function Component:EnsureFillListView()
  local nCnt = UIUtils.GetListViewContentMaxCount(self.EMListView_Role)
  local nItemCnt = #self.RoleContentList
  for i = nItemCnt + 1, nCnt do
    self.EMListView_Role:AddItem(self:CreateRoleListItem(nil))
  end
end

function Component:OnCharacterItemClicked(Item)
  if Item == self.SelectItem then
    return
  end
  self:SetSelectItem(Item)
  local CharacterData = self.OwnedCharacterDataMap[Item.Id]
  self:HandleOnSettedCharacterDataChanged(CharacterData)
  self:HandleOnSelectedCharacterDataChanged(CharacterData)
  self.SwitchCharacter:SetSettedCharacterData(CharacterData)
  AudioManager(self):PlayUISound(self, self.ChangeCharacterSound, nil, nil)
end

return Component
