require("UnLua")
local PersonInfoCommon = require("BluePrints.UI.WBP.PersonInfo.PersonInfoCommon")
local PersonInfoController = require("BluePrints.UI.WBP.PersonInfo.PersonInfoController")
local EditModel = PersonInfoController:GetEdirModel()
local ArmoryUtils = require("BluePrints.UI.WBP.Armory.ArmoryUtils")
local PersonInfoModel = PersonInfoController:GetModel()
local M = Class()
M._components = {
  "BluePrints.UI.WBP.PersonInfo.PersonInfo_ExpandListCompoment",
  "BluePrints.Common.TimerMgr"
}

function M:Initialize()
  self.IsEditPage = true
  self.CurMainTab = nil
  self.SelectedWeaeponTab = nil
  self.SelectBoxIdx = nil
  self.TempCharShowPlan = nil
  self.TempWeaponShowPlan = nil
  self.SelectItem = nil
  self.bHaveChange = false
  self.bIsTipsopen = false
  self.TempBoxItem = {}
  EditModel:InitEditData(self)
  self:InitEditData()
end

function M:Construct()
  self.TileView_Select_Role.BP_OnItemClicked:Clear()
  self.TileView_Select_Role.BP_OnItemClicked:Add(self, self.OnListItemClicked)
  self.TileView_Select_Role.BP_OnEntryInitialized:Clear()
  self.TileView_Select_Role.BP_OnEntryInitialized:Add(self, self.OnListItemInited)
  self.EMListView_Filter.BP_OnItemClicked:Clear()
  self.Btn_Confirm.Button_Area.OnClicked:Add(self, self.ReallySaveModelData)
  self.Btn_Cancel.Button_Area.OnClicked:Add(self, self.OnReturnKeyDown)
  self.Type_Melee.Btn_Click.OnClicked:Add(self, self.OnMeleeSelect)
  self.Type_Range.Btn_Click.OnClicked:Add(self, self.OnRangedSelect)
  self.EMListView_Filter.BP_OnItemClicked:Add(self, self.OnFilterListItemClicked)
  for i = 1, 3 do
    self["Edit_AvatarItem_" .. i].Btn_Click.OnClicked:Add(self, function()
      self:OnBoxItemClick(i)
    end)
    self["Edit_AvatarItem_" .. i].Btn_Removes.Button_Area.OnClicked:Add(self, function()
      self:OnBoxItemRemoveClick(i)
    end)
  end
end

function M:InitBaseView(TabName, BoxIndex)
  self.Btn_Cancel.Text_Button:SetText(GText("UI_PATCH_CANCEL"))
  self.Btn_Confirm.Text_Button:SetText(GText("UI_RegionMap_Save"))
  self.WBP_PersonalInfo_Edit_Tips:SetComfirmCallball(self.OnClickChangePlan, self)
  self.WBP_PersonalInfo_Edit_Tips.Root:SetRenderOpacity(0)
  self.WBP_PersonalInfo_Edit_Tips:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Btn_Confirm:ForbidBtn(true)
  self.Btn_Confirm:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  if BoxIndex then
    self.FixedBoxindex = BoxIndex
  end
  self:InitTabContent(TabName)
end

function M:InitItemSelected()
  local bisWeaopn, str
  if self.CurMainTab.Name == "Char" then
    bisWeaopn = false
    str = "Char"
  else
    bisWeaopn = true
    str = "Weapon"
  end
  for i = 1, 3 do
    local Uuid = PersonInfoModel:GetDisplayItemsUuid(bisWeaopn, i)
    local plan = PersonInfoModel:GetTemporModelBoxItemData(bisWeaopn, i, self)
    if nil ~= plan and nil ~= plan[str .. "Id"] then
      Uuid = plan[str .. "Id"]
    end
    if -1 ~= Uuid then
      local str
      if bisWeaopn then
        str = plan.Tag[1]
      else
        str = self.CurMainTab.Name
      end
      local item = EditModel[str .. "ItemContentsMap"][Uuid]
      if nil ~= item then
        item.IsChosen = true
        item.ChosenBoxIdx = i
      end
    end
  end
end

function M:InitBoxView()
  local FirstEmptyBox, bisWeaopn
  if self.CurMainTab.Name == "Char" then
    bisWeaopn = false
  else
    bisWeaopn = true
  end
  for i = 1, 3 do
    local data = PersonInfoModel:GetTemporModelBoxItemData(bisWeaopn, i, self)
    self:FreshBoxView(i, data)
  end
  FirstEmptyBox = self:FindFirstEmptyBoxIndex(bisWeaopn)
  local Index = self.FixedBoxindex or FirstEmptyBox
  self:OnBoxItemClick(Index)
  if self.FixedBoxindex then
    self.FixedBoxindex = nil
  end
  if Index then
    self["Edit_AvatarItem_" .. Index]:OnItemClick()
  end
end

function M:FindFirstEmptyBoxIndex(bIsWeapon)
  local FirstEmptyBox
  for i = 1, 3 do
    local data = PersonInfoModel:GetTemporModelBoxItemData(bIsWeapon, i, self)
    if nil == data and nil == FirstEmptyBox then
      FirstEmptyBox = i
    end
    if bIsWeapon and data then
      data.TagImage = self[data.Tag[1] .. "2Icon"][data.Tag[2]]
    end
  end
  if nil == FirstEmptyBox then
    FirstEmptyBox = 1
  end
  return FirstEmptyBox
end

function M:OnBoxItemClick(index)
  if index == self.SelectBoxIdx then
    return
  end
  if self.SelectBoxIdx then
    local oldBoxItem = self["Edit_AvatarItem_" .. self.SelectBoxIdx]
    oldBoxItem:PlayAnimation(oldBoxItem.Normal)
    oldBoxItem.Btn_Click:SetVisibility(UIConst.VisibilityOp.Visible)
  end
  self.SelectBoxIdx = index
  self["Edit_AvatarItem_" .. self.SelectBoxIdx]:PlayAnimation(self["Edit_AvatarItem_" .. self.SelectBoxIdx].Click)
  self["Edit_AvatarItem_" .. self.SelectBoxIdx].Btn_Click:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
end

function M:OnBoxItemRemoveClick(index)
  local bisWeaopn
  if self.CurMainTab.Name == "Char" then
    bisWeaopn = false
  else
    bisWeaopn = true
  end
  self:OnChangeBoxData(index, nil)
  if bisWeaopn then
    if self.TempWeaponShowPlan == nil then
      self.TempWeaponShowPlan = {}
    end
    if self.TempWeaponShowPlan[index] == nil then
      self.TempWeaponShowPlan[index] = {}
    end
    self.TempWeaponShowPlan[index].WeaponId = -1
  else
    if nil == self.TempCharShowPlan then
      self.TempCharShowPlan = {}
    end
    if nil == self.TempCharShowPlan[index] then
      self.TempCharShowPlan[index] = {}
    end
    self.TempCharShowPlan[index].CharId = -1
  end
  self:OnChangeData()
end

function M:OnChangeData()
  if not self.bHaveChange then
    self.Btn_Confirm:ForbidBtn(false)
    self.Btn_Confirm:PlayButtonUnForbidAnim()
    self.Btn_Confirm:SetVisibility(UIConst.VisibilityOp.Visible)
    self.bHaveChange = true
  end
end

function M:OnBGClick()
  self:TryToCloseTips()
  return UIUtils.Unhandled
end

function M:FreshBoxView(index, data)
  if nil == data then
    self["Edit_AvatarItem_" .. index]:SetEmpty()
  else
    self["Edit_AvatarItem_" .. index]:FreshView(data.image, data.name, data.lv, data.Rarity, data.Uuid)
  end
end

function M:OnChangeBoxData(index, data, bNotCancel)
  if self["Edit_AvatarItem_" .. index].bIsEmpty == false and self["Edit_AvatarItem_" .. index].Uuid ~= nil and true ~= bNotCancel then
    self:CancelSelectItem(self["Edit_AvatarItem_" .. index].Uuid)
  end
  self:FreshBoxView(index, data)
end

function M:OnClickChangePlan(ModIndex, AppearanceIdx)
  local OldBoxIndex
  if self.SelectItem.IsChosen == true then
    OldBoxIndex = self.SelectItem.ChosenBoxIdx
  end
  if self.CurMainTab.Name == "Char" then
    if self.TempCharShowPlan == nil then
      self.TempCharShowPlan = {}
    end
    self.TempCharShowPlan[self.SelectBoxIdx] = {
      CharId = self.SelectItem.Uuid,
      AppearancePlan = AppearanceIdx,
      ModPlan = ModIndex
    }
    if OldBoxIndex and OldBoxIndex ~= self.SelectBoxIdx then
      self.TempCharShowPlan[OldBoxIndex] = {
        CharId = -1,
        AppearancePlan = -1,
        ModPlan = -1
      }
    end
  else
    if nil == self.TempWeaponShowPlan then
      self.TempWeaponShowPlan = {}
    end
    self.TempWeaponShowPlan[self.SelectBoxIdx] = {
      WeaponId = self.SelectItem.Uuid,
      ModPlan = ModIndex
    }
    if OldBoxIndex and OldBoxIndex ~= self.SelectBoxIdx then
      self.TempWeaponShowPlan[OldBoxIndex] = {WeaponId = -1, ModPlan = -1}
    end
  end
  self:OnChangeData()
  self:TryToCloseTips(false)
  ArmoryUtils:SetItemIsSelected(self.SelectItem, false)
  if self.SelectItem.UI then
    self.SelectItem.UI:SetItemSelect(true)
  end
  self.SelectItem.IsChosen = true
  self.SelectItem.ChosenBoxIdx = self.SelectBoxIdx
  local bisWeaopn
  if self.CurMainTab.Name ~= "Char" then
    bisWeaopn = true
  end
  local data = PersonInfoModel:GetTempEditBoxItemData(bisWeaopn, self.SelectBoxIdx, self)
  if bisWeaopn then
    data.TagImage = self[self.CurMainTab.Name .. "2Icon"][data.Tag]
  end
  local bNotCancel = false
  if nil ~= OldBoxIndex and OldBoxIndex ~= self.SelectBoxIdx then
    self:OnChangeBoxData(OldBoxIndex, nil, true)
  end
  if nil ~= OldBoxIndex and OldBoxIndex == self.SelectBoxIdx then
    self:OnChangeBoxData(self.SelectBoxIdx, data, true)
  else
    self:OnChangeBoxData(self.SelectBoxIdx, data)
  end
  local NextSelectBox
  for i = 1, 3 do
    if true == self["Edit_AvatarItem_" .. i].bIsEmpty and nil == NextSelectBox then
      NextSelectBox = i
    end
  end
  if nil ~= NextSelectBox then
    self:OnBoxItemClick(NextSelectBox)
  end
  if self.SelectItem.UI then
    self.SelectItem.UI:SetVisibility(UIConst.VisibilityOp.Visible)
  end
  self.SelectItem = nil
end

function M:CancelSelectItem(Uuid)
  local str, item
  if self.CurMainTab.Name ~= "Char" then
    item = EditModel["Melee" .. "ItemContentsMap"][Uuid] or EditModel["Ranged" .. "ItemContentsMap"][Uuid]
  else
    str = "Char"
    item = EditModel[str .. "ItemContentsMap"][Uuid]
  end
  if item then
    item.IsChosen = false
    if item.UI then
      item.UI:SetVisibility(UIConst.VisibilityOp.Visible)
      item.UI:SetItemSelect(false)
      item.ChosenBoxIdx = false
    end
  end
end

function M:ReallySaveModelData()
  self.bHaveChange = false
  PersonInfoModel:SaveShowPlan(self.TempCharShowPlan, self.TempWeaponShowPlan)
  UIManager(self):ShowUITip("CommonToastMain", GText("UI_PersonInfo_Saved"))
  PersonInfoController:CloseEditView()
end

function M:OnMeleeSelect()
  local kind = "Melee"
  if self.SelectedWeaeponTab == "Ranged" then
    self.Type_Range:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    self.Type_Range:SetSwitchOn(false)
  end
  self.SelectedWeaeponTab = kind
  self.Type_Melee:PlayAnimation(self.Type_Melee.Click)
  self.CurMainTab.Name = kind
  self:ExpandList(true)
  self.Type_Melee:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  self:TryToCloseTips()
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_level_02", nil, nil)
end

function M:OnRangedSelect()
  local kind = "Ranged"
  if self.SelectedWeaeponTab == "Melee" then
    self.Type_Melee:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    self.Type_Melee:SetSwitchOn(false)
  end
  self.SelectedWeaeponTab = kind
  self.Type_Range:PlayAnimation(self.Type_Range.Click)
  self.CurMainTab.Name = kind
  self:ExpandList(true)
  self.Type_Range:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  self:TryToCloseTips()
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_level_02", nil, nil)
end

function M:OnTabItemSelected(TabWidget, TabData)
  local InTabId = TabData.TabId
  self.CurMainTab = TabData
  if 1 == InTabId then
    self.CurMainTab.Name = "Char"
    self:FreshCharBoxView()
    if CommonUtils.GetDeviceTypeByPlatformName() == "PC" then
      self.Text_DetailTitle:SetText(GText("UI_PersonInfo_ShowCase_Char"))
    end
  else
    self.CurMainTab.Name = "Weapon"
    self:OnMeleeSelect()
    self:FreshWeaponBoxView()
    if CommonUtils.GetDeviceTypeByPlatformName() == "PC" then
      self.Text_DetailTitle:SetText(GText("UI_PersonInfo_ShowCase_Weapon"))
    end
  end
  self:InitBoxView()
  self:InitItemSelected()
  self:TryToCloseTips()
  if self.CurInputDeviceType == ECommonInputType.Gamepad and self.RefreshFocusItem then
    self:RefreshFocusItem()
  end
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_level_01", nil, nil)
end

function M:TryToCloseTips(bNotCancelSelect)
  if self.bIsTipsopened then
    self.bIsTipsopened = false
    self.WBP_PersonalInfo_Edit_Tips:PlayAnimation(self.WBP_PersonalInfo_Edit_Tips.Out)
    self:PlayAnimation(self.Tips_Out)
    self.WBP_PersonalInfo_Edit_Tips:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
    if self.SelectItem and false ~= bNotCancelSelect then
      ArmoryUtils:SetItemIsSelected(self.SelectItem, false)
      if self.SelectItem.UI then
        self.SelectItem.UI:SetVisibility(UIConst.VisibilityOp.Visible)
      end
      self.SelectItem = nil
    end
    if self.CurInputDeviceType == ECommonInputType.Gamepad and self.LastSelectedListContent.UI and CommonUtils.GetDeviceTypeByPlatformName() == "PC" then
      self.LastSelectedListContent.UI:SetFocus()
      self:UpdataGamePadBottomAInfo(1)
      self.Common_Sort_List:SetControllerKeyHidden(false)
    end
    return true
  end
  return false
end

function M:OpenTips()
  if not self.bIsTipsopened then
    self.WBP_PersonalInfo_Edit_Tips:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    self.WBP_PersonalInfo_Edit_Tips:PlayAnimation(self.WBP_PersonalInfo_Edit_Tips.In)
    self:PlayAnimation(self.Tips_In)
    self.bIsTipsopened = true
  else
    self.WBP_PersonalInfo_Edit_Tips:PlayAnimation(self.WBP_PersonalInfo_Edit_Tips.In)
  end
end

function M:FreshWeaponBoxView()
  self.Group_Tab:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  self.Image_WeaponBG:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  self.Text_Empty:SetText(GText("UI_Armory_Weapon_Empty"))
end

function M:FreshCharBoxView()
  self.Image_WeaponBG:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Group_Tab:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Text_Empty:SetText(GText("UI_Armory_Char_Empty"))
  self:ExpandList(true)
end

function M:OnReturnKeyDown()
  if self:TryToCloseTips() then
    return
  end
  if self.bHaveChange == true then
    local Params = {}
    Params.RightCallbackFunction = PersonInfoController.CloseEditView
    Params.RightCallbackObj = PersonInfoController
    if UIManager(self):GetUIObj("CommonDialog") == nil then
      UIManager(self):ShowCommonPopupUI(100169, Params, self)
    end
  else
    PersonInfoController:CloseEditView()
  end
end

function M:InitEditData()
  self.MeleeItemContentsArray = self.MeleeItemContentsCache:ToTable()
  self.RangedItemContentsArray = self.RangedItemContentsCache:ToTable()
  self.CharItemContentsArray = self.CharItemContentsCache:ToTable()
end

function M:OnSortListSelectionsChanged()
  local SortByIdx, SortType = self.Common_Sort_List:GetSortInfos()
  if self.Event_SortFuncion then
    self.Event_SortFuncion(self.EventReceiver, self.FilteredContents, SortByIdx, SortType)
    self:FillListView()
  end
end

function M:OnSortTypeChanged()
  local SortByIdx, SortType = self.Common_Sort_List:GetSortInfos()
  if self.Event_SortFuncion then
    self.Event_SortFuncion(self.EventReceiver, self.FilteredContents, SortByIdx, SortType)
    self:FillListView()
  end
end

function M:OnListItemInited(Content, EntryUI)
  Content.UI = EntryUI
  EntryUI:SetItemSelect(Content.IsChosen)
  EntryUI:SetVisibility(UIConst.VisibilityOp.Visible)
  if self.Event_OnEntryInitialized then
    self.Event_OnEntryInitialized(self.EventReceiver, Content, EntryUI)
  end
end

function M:OnListItemClicked(Content)
  if self.Event_OnListItemClicked then
    self.Event_OnListItemClicked(self.EventReceiver, Content)
  end
end

function M:OnListItemClickedCommon(Content)
  self:OpenTips()
  self.bIsTipsopened = true
  ArmoryUtils:SetItemIsSelected(self.SelectItem, false)
  if self.SelectItem and self.SelectItem.UI then
    self.SelectItem.UI:SetVisibility(UIConst.VisibilityOp.Visible)
  end
  self.SelectItem = Content
  Content.UI:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  ArmoryUtils:SetItemIsSelected(Content, true)
end

function M:CharMain_OnListItemClicked(Content)
  AudioManager(self):PlayUISound(self, "event:/ui/armory/click_select_role", nil, nil)
  local SelectFashionId, SelectModId
  if Content.IsChosen then
    local plan = PersonInfoModel:GetTemporModelPlan(false, Content.ChosenBoxIdx, self)
    SelectFashionId = plan.AppearancePlan
    SelectModId = plan.ModPlan
  end
  self.WBP_PersonalInfo_Edit_Tips:FreahCharView(Content.UnitName, Content.Rarity, SelectFashionId, SelectModId, Content.Uuid)
  self:OnListItemClickedCommon(Content)
end

function M:WeaponMain_OnListItemClicked(Content)
  AudioManager(self):PlayUISound(self, "event:/ui/armory/click_select_weapon", nil, nil)
  local SelectModId
  if Content.IsChosen then
    local plan = PersonInfoModel:GetTemporModelPlan(true, Content.ChosenBoxIdx, self)
    SelectModId = plan.ModPlan
  end
  self.WBP_PersonalInfo_Edit_Tips:FreahWeaponView(Content.UnitName, Content.Rarity, PersonInfoModel:GetItemUuid(Content), SelectModId)
  self:OnListItemClickedCommon(Content)
end

function M:MeleeMain_OnListItemClicked(Content)
  self:WeaponMain_OnListItemClicked(Content)
end

function M:RangedMain_OnListItemClicked(Content)
  self:WeaponMain_OnListItemClicked(Content)
end

function M:OnListItemSelectionChanged(Content, IsSelected)
  self:UpdataGamePadBottomAInfo(1)
  if IsSelected then
    self.LastSelectedListContent = Content
  end
  if self.Event_OnListItemSelectionChanged then
    self.Event_OnListItemSelectionChanged(self.EventReceiver, Content, IsSelected)
  end
end

function M:OnItemIsHoverChanged(Content)
  if self.Event_OnItemIsHoverChanged then
    self.Event_OnItemIsHoverChanged(self.EventReceiver, Content)
  end
end

function M:OnFilterListItemClicked(Content)
  self.LastSelectedFilterContent = Content
  if self.FilterMod == "Single" then
    if Content.IsSelected then
      return
    end
    for Tag, Value in pairs(self.SelectedFilterContents) do
      if Value ~= Content then
        self:SetFilterContentIsSelected(Value, false)
        self.SelectedFilterContents[Tag] = nil
      end
    end
    if self.FilterContentObj_All ~= Content then
      self:SetFilterContentIsSelected(self.FilterContentObj_All, false)
    end
    self:SetFilterContentIsSelected(Content, true)
  end
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_sort_tab", nil, nil)
  self:UpdateFilterInfos()
  local FilterIdxes = self.FilterIdxes
  if self.Event_FilterFunction then
    self.FilteredContents = self.Event_FilterFunction(self.EventReceiver, self.AllItemContents, FilterIdxes) or {}
    if self.Event_SortFuncion then
      local SortByIdx, SortType = self.Common_Sort_List:GetSortInfos()
      self.Event_SortFuncion(self.EventReceiver, self.FilteredContents, SortByIdx, SortType)
    end
    if self:FillListView() == false then
      self:OnFilterListItemClicked(Content)
    end
  end
end

function M:FreshAgain()
  local FilterIdxes = self.FilterIdxes
  if self.Event_FilterFunction then
    self.AllItemContents = self[self.CurMainTab.Name .. "ItemContentsArray"]
    self.FilteredContents = {}
    if self.AllItemContents then
      for index, value in ipairs(self.AllItemContents) do
        table.insert(self.FilteredContents, value)
      end
    end
    if 0 ~= #FilterIdxes then
      self.FilteredContents = self.Event_FilterFunction(self.EventReceiver, self.AllItemContents, FilterIdxes) or {}
      if self.Event_FilterFunction then
        self.FilteredContents = self.Event_FilterFunction(self.EventReceiver, self.AllItemContents, FilterIdxes) or {}
      end
    end
    if self.Event_SortFuncion then
      self.Event_SortFuncion(self.EventReceiver, self.FilteredContents, 1, 2)
    end
    self:FillListView(false)
  end
end

function M:SetFilterContentIsSelected(Content, IsSelected)
  Content.IsSelected = IsSelected
  if Content.UI then
    Content.UI:SetIsSelected(Content.IsSelected)
  end
  if Content.Tag then
    self.SelectedFilterContents[Content.Tag] = Content
  end
end

function M:InitEditListView(Parent, Params)
  self.Parent = Parent
  self.Params = Params
  self.Filters = Params.Filters or {}
  self.FilterMod = Params.FilterMod or "Single"
  self.FilterIdxes = {}
  self.OrderByDisplayNames = Params.OrderByDisplayNames
  self.SortType = Params.SortType
  self.AllItemContents = Params.ItemContents
  self.EMListView_Filter:ClearListItems()
  self.SelectedFilterContents = {}
  self.FilteredContents = {}
  if self.AllItemContents then
    for index, value in ipairs(self.AllItemContents) do
      table.insert(self.FilteredContents, value)
    end
  end
  self.LastSelectedFilterContent = nil
  self.FilterContentObj_All = nil
  if #self.Filters > 0 then
    self.FilterContentObj_All = NewObject(UIUtils.GetCommonItemContentClass())
    self.FilterContentObj_All.IsSelecte = true
    self.FilterContentObj_All.Index = 0
    self.FilterContentObj_All.Icon = "/Game/UI/Texture/Static/Atlas/Armory/T_Armory_Select.T_Armory_Select"
    self.FilterContentObj_All.IsSelected = true
    self.LastSelectedFilterContent = self.FilterContentObj_All
    self.EMListView_Filter:AddItem(self.FilterContentObj_All)
    self.Panel_FilterTab:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  else
    self.Panel_FilterTab:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  for Index, Tag in ipairs(self.Filters) do
    local Obj = NewObject(UIUtils.GetCommonItemContentClass())
    for key, value in pairs(Tag) do
      Obj[key] = value
    end
    Obj.Index = Index
    self.EMListView_Filter:AddItem(Obj)
  end
  self.Common_Sort_List:Init(self.Root, self.OrderByDisplayNames, self.SortType or CommonConst.DESC, {
    OnGetBackFocusWidget = function(_self, MyGeometry, InKeyEvent)
      return self:OnSortListWidgetBack(MyGeometry, InKeyEvent)
    end,
    OnAddedToFocusPath = function()
      self:OnSortListAddedToFocusPath()
    end,
    OnRemovedFromFocusPath = function()
      self:OnSortListRemovedFromFocusPath()
    end
  })
  self.Common_Sort_List:BindEventOnSelectionsChanged(self, self.OnSortListSelectionsChanged)
  self.Common_Sort_List:BindEventOnSortTypeChanged(self, self.OnSortTypeChanged)
  self.WS_List:SetActiveWidgetIndex(0)
  self.Event_SortFuncion(self.EventReceiver, self.FilteredContents, 1, 2)
  self:FillListView()
  self:InitNavigationRules()
end

function M:BindEvents(EventReceiver, Events)
  self.EventReceiver = EventReceiver
  self.Event_OnListItemClicked = Events.OnListItemClicked
  self.Event_OnListItemSelectionChanged = Events.OnListItemSelectionChanged
  self.Event_SortFuncion = Events.SortFuncion
  self.Event_FilterFunction = Events.FilterFunction
  self.Event_OnListItemInited = Events.OnListItemInited
  self.Event_OnEntryInitialized = Events.OnEntryInitialized
  self.Event_OnItemIsHoverChanged = Events.OnItemIsHoverChanged
end

function M:FillListView(bfresh)
  self:PlayAnimation(self.List_Change)
  self.TileView_Select_Role:ClearListItems()
  self.LastSelectedListContent = nil
  if not self.LastSelectedListContent then
    self.LastSelectedListContent = self.FilteredContents[1]
  end
  for index, value in ipairs(self.FilteredContents) do
    if IsValid(value) then
      self.TileView_Select_Role:AddItem(value)
    else
      if false == bfresh then
        return
      end
      self.TileView_Select_Role:ClearListItems()
      EditModel:InitEditData(self)
      self:InitEditData()
      DebugPrint("Item\229\164\177\230\149\136\239\188\140\229\176\157\232\175\149\233\135\141\230\150\176\229\136\155\229\187\186", index)
      UKismetSystemLibrary.PrintString(nil, index .. "Item\229\164\177\230\149\136\239\188\140\229\176\157\232\175\149\233\135\141\230\150\176\229\136\155\229\187\186", true, false, FLinearColor(1, 0, 0, 1), 2)
      self:FreshAgain()
      return
    end
  end
  if #self.FilteredContents <= 0 then
    self.WS_List:SetActiveWidgetIndex(1)
    self.Common_Sort_List:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.TileView_Select_Role:SetVisibility(UIConst.VisibilityOp.Collapsed)
  else
    self.WS_List:SetActiveWidgetIndex(0)
    self.Common_Sort_List:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    self.TileView_Select_Role:SetVisibility(UIConst.VisibilityOp.Visible)
    self:AddTimer(0.001, function()
      if 0 == GWorld.GameInstance:GetGameUIManager():GetWidgetRenderSize(self.TileView_Select_Role).X then
        return
      end
      local ItemUIs = self.TileView_Select_Role:GetDisplayedEntryWidgets()
      local XCount, YCount = UIUtils.GetTileViewContentMaxCount(self.TileView_Select_Role, "XY")
      local ItemLen = ItemUIs:Length()
      local RestCount = XCount * YCount - ItemLen
      if RestCount <= 0 then
        RestCount = XCount - #self.FilteredContents % XCount
      end
      self:FillEmptyItems(RestCount)
      self.TileView_Select_Role:ScrollToTop()
      if self.Event_OnListItemInited then
        self.Event_OnListItemInited(self.EventReceiver)
      end
    end, false, 0, "DelayAddEmptyItem", true)
  end
end

function M:UpdateFilterInfos()
  local Indexes = {}
  local bHasItem = next(self.SelectedFilterContents) ~= nil
  local Items = self.EMListView_Filter:GetListItems()
  local Len = Items:Length()
  if bHasItem then
    for i = 2, Len do
      if self.SelectedFilterContents[Items[i].Tag] then
        table.insert(Indexes, Items[i].Index)
      end
    end
  else
    for i = 2, Len do
      table.insert(Indexes, Items[i].Index)
    end
  end
  self.FilterIdxes = Indexes
  return self.FilterIdxes
end

function M:FillEmptyItems(Count)
  for i = 1, Count do
    self.TileView_Select_Role:AddItem(NewObject(UIUtils.GetCommonItemContentClass()))
  end
end

function M:CallFunctionByName(FunctionName, ...)
  if self[FunctionName] then
    return self[FunctionName](self, ...)
  end
end

function M:Destruct()
  self.MeleeItemContentsCache:Clear()
  self.RangedItemContentsCache:Clear()
  self.CharItemContentsCache:Clear()
end

function M:InitNavigationRules()
  self.TileView_Select_Role:SetNavigationRuleBase(EUINavigation.Up, EUINavigationRule.Stop)
  self.TileView_Select_Role:SetNavigationRuleBase(EUINavigation.Down, EUINavigationRule.Stop)
  self.TileView_Select_Role:SetNavigationRuleBase(EUINavigation.Down, EUINavigationRule.Stop)
  self.TileView_Select_Role:SetNavigationRuleCustom(EUINavigation.Left, {
    self,
    self.OnRoleListNavigation
  })
  self.EMListView_Filter:SetNavigationRuleBase(EUINavigation.Up, EUINavigationRule.Stop)
  self.EMListView_Filter:SetNavigationRuleBase(EUINavigation.Down, EUINavigationRule.Stop)
  self.EMListView_Filter:SetNavigationRuleBase(EUINavigation.Down, EUINavigationRule.Stop)
  self.EMListView_Filter:SetNavigationRuleCustom(EUINavigation.Left, {
    self,
    self.OnFilterListNavigation
  })
  self.TileView_Select_Role.bWrapHorizontalNavigation = not self.Panel_FilterTab:IsVisible()
end

function M:OnRoleListNavigation(NavigationDirection)
  if NavigationDirection == EUINavigation.Left then
    self.EMListView_Filter:BP_SetSelectedItem(self.LastSelectedFilterContent)
    self.EMListView_Filter:BP_NavigateToItem(self.LastSelectedFilterContent)
    return self.EMListView_Filter
  end
  return self.TileView_Select_Role
end

function M:OnFilterListNavigation(NavigationDirection)
  if NavigationDirection == EUINavigation.Right then
    self.TileView_Select_Role:BP_SetSelectedItem(self.LastSelectedListContent)
    self.TileView_Select_Role:BP_NavigateToItem(self.LastSelectedListContent)
    return self.TileView_Select_Role
  end
  return self.EMListView_Filter
end

function M:OnSortListRemovedFromFocusPath()
end

function M:OnSortListAddedToFocusPath()
  if UIUtils.HasAnyFocus(self.EMListView_Filter) then
    self.LastFocusList = self.EMListView_Filter
  else
    self.LastFocusList = self.TileView_Select_Role
  end
end

function M:SetFocusToList()
  self.TileView_Select_Role:SetFocus()
  if self.LastSelectedListContent then
    self.TileView_Select_Role:BP_SetSelectedItem(self.LastSelectedListContent)
    self.TileView_Select_Role:BP_NavigateToItem(self.LastSelectedListContent)
  else
    error("LastSelectedListContent is nil")
  end
  if not self.TileView_Select_Role:HasFocusedDescendants() then
    local items = self.TileView_Select_Role:GetListItems()
    if items[1] then
      local firstItem = items[1]
      local ReturnWidget = firstItem.SelfWidget or firstItem.ParentWidget or firstItem.UI
      ReturnWidget:SetFocus()
    end
  end
end

AssembleComponents(M)
return M
