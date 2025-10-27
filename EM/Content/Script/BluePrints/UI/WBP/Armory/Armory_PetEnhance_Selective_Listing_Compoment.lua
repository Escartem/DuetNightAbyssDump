require("UnLua")
local ArmoryUtils = require("BluePrints.UI.WBP.Armory.ArmoryUtils")
local Component = Class()

function Component:Construct()
  self.EntryPets = {}
  self.ToCancelQueue = {}
  self.IsListExpanded = false
  if not IsValid(self.ItemDetailsWidget) then
    self.ItemDetailsWidget = self:CreateWidgetNew("ItemDetailsMain")
    self.Selective_Listing:AttachTipsWidget(self.ItemDetailsWidget)
    self.ItemDetailsWidget.Btn_Locked:UnBindEventOnClickedByObj(self)
    self.ItemDetailsWidget:InitLockedEvent({
      LockedButtonClickCallBack = function()
        self:OnDetailLockBtnClickComp()
      end
    })
  end
  self.ItemDetailsWidget:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Image_ClickNotPass.OnMouseButtonDownEvent:Bind(self, self.OnBackgroundClicked)
  self:AddDispatcher(EventID.OnPetLocked, self, self.OnPetLocked)
  self.Selective_Listing.TileView_Select_Role.BP_OnEntryInitialized:Clear()
  self.Selective_Listing.TileView_Select_Role.BP_OnEntryInitialized:Add(self, self.OnListItemInited)
  self.Selective_Listing.bIsShowNavigateGuide = false
  self:SetFocus()
end

function Component:CollectValidEntries(Pet, Entrys)
  if not Pet or not Pet.Entry then
    return {}
  end
  local validEntries = {}
  local targetSet = {}
  for _, id in ipairs(Entrys) do
    targetSet[id] = true
  end
  for _, entryId in ipairs(Pet.Entry) do
    if targetSet[entryId] and Pet ~= self.Pet then
      table.insert(validEntries, entryId)
    end
  end
  return validEntries
end

function Component:CreatePetItemContents(Entrys)
  if nil == Entrys then
    return
  end
  self.UseablePetItemContentsMap = {}
  self.UseablePetItemContentsArray = {}
  self.ResourcePetItemContentsMap = {}
  self.ResourcePetItemContentsArray = {}
  self.BP_PetItemContents:Clear()
  local RealAvatar = GWorld:GetAvatar()
  if RealAvatar then
    for _, petObj in pairs(RealAvatar.Pets) do
      if RealAvatar.CurrentPet == petObj.UniqueId then
      else
        local validEntries = self:CollectValidEntries(petObj, Entrys)
        if #validEntries > 0 then
          local obj = ArmoryUtils:NewPetItemContentWithEntry(petObj)
          obj.bAllUseAsyncLoadWidget = false
          obj.IsChosen = false
          if obj.LockType and 0 ~= obj.LockType then
            obj.IsLocked = true
          end
          self.BP_PetItemContents:Add(obj)
          for _, entryId in ipairs(validEntries) do
            if not self.EntryPets[entryId] then
              self.EntryPets[entryId] = {}
            end
            table.insert(self.EntryPets[entryId], obj)
          end
          if obj.IsResourcePet then
            self.ResourcePetItemContentsMap[obj.UniqueId] = obj
            table.insert(self.ResourcePetItemContentsArray, obj)
          else
            self.UseablePetItemContentsMap[obj.UniqueId] = obj
            table.insert(self.UseablePetItemContentsArray, obj)
          end
        end
      end
    end
  end
end

function Component:UpdateEntryPets(NewEntrys)
  if not NewEntrys then
    return
  end
  local RealAvatar = GWorld:GetAvatar()
  if RealAvatar then
    for _, petObj in pairs(RealAvatar.Pets) do
      local validEntries = self:CollectValidEntries(petObj, NewEntrys)
      for _, entryId in ipairs(validEntries) do
        if not self.EntryPets[entryId] then
          self.EntryPets[entryId] = {}
        end
        local obj = ArmoryUtils:NewPetItemContentWithEntry(petObj)
        self.BP_PetItemContents:Add(obj)
        table.insert(self.EntryPets[entryId], obj)
      end
    end
  end
end

function Component:IsPetHaveAnyUsefulEntry(Pet, Entrys)
  if not Pet or not Pet.Entry then
    return false
  end
  for _, EntryId in ipairs(Entrys) do
    if self:IfPetHaveEntry(Pet, EntryId) then
      return true
    end
  end
  return false
end

function Component:GetFilteredPet(EntryId)
  return self.EntryPets[EntryId] or {}
end

function Component:IfPetHaveEntry(Pet, EntryId)
  if Pet.Entry ~= nil then
    for _, entry in ipairs(Pet.Entry) do
      if entry == EntryId then
        return true
      end
    end
  else
    return false
  end
end

function Component:InitUIInfo()
  if self.bFromArchive then
    self.Arr_OrderBy = {
      "UI_RARITY_NAME"
    }
    self.CommonOrderByAttrNames = {
      "Rarity",
      "SortPriority",
      "UnitId"
    }
  else
    self.Arr_OrderBy = {
      "UI_LEVEL_SELECT",
      "UI_RARITY_NAME"
    }
    self.CommonOrderByAttrNames = {
      "Level",
      "Rarity",
      "SortPriority",
      "UnitId"
    }
  end
  self.PetOrderByDisplayNames = self.Arr_OrderBy
  self.PetOrderByAttrNames = self.CommonOrderByAttrNames
end

function Component:OnBackKeyDown()
  if not self.IsListExpanded then
    return
  end
  self:ExpandList(false)
end

function Component:SetChangeCamera(IsListExpanded)
  self.ActorController = UIManager(self):GetArmoryUIObj().ActorController
  local Avatar = GWorld:GetAvatar()
  local CameraTag1
  if 1 == Avatar.Sex then
    CameraTag1 = "Nvzhu"
  else
    CameraTag1 = "Nanzhu"
  end
  if IsListExpanded then
    self.ActorController:SetArmoryCameraTag(CameraTag1, nil, nil, "Pet")
  else
    self.ActorController:SetArmoryCameraTag(CameraTag1, "Entry", "LevelUp", CommonConst.ArmoryType.Pet)
  end
end

function Component:ExpandList(IsListExpanded)
  self.Selective_Listing:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  if IsListExpanded then
    if next(self.ToCancelQueue) then
      for _, v in pairs(self.ToCancelQueue) do
        v.IsChosen = false
        if v.UI then
          v.UI:SetItemSelect(false)
        end
      end
      self.ToCancelQueue = {}
    end
    self.IsListExpanded = true
    self.ExcelWeaponTags = nil
    if 0 == self.BP_PetItemContents:Num() then
      self:CreatePetItemContents(self.Pet.Entry)
    end
    self.Selective_Listing:BindEvents(self, {
      OnListItemClicked = self.PetMain_OnListItemClicked,
      SortFuncion = self.SortItemContents,
      FilterFunction = self.FilterItemContents
    })
    self.Selective_Listing:Init(self, {
      Filters = self.Filters,
      OrderByDisplayNames = self.PetOrderByDisplayNames,
      SortType = CommonConst.DESC,
      ItemContents = self:GetFilteredPet(self.CurEntryContent.EntryId)
    })
    self.Selective_Listing:SetEmptyStateText(GText("AvailablePet_Empty"))
    self.Selective_Listing:PlayInAnim()
    if self.Change then
      self:PlayAnimation(self.Change)
    end
    self:SetChangeCamera(IsListExpanded)
  else
    if false == self.IsListExpanded then
      return
    end
    if self.bItemDetailsShowed then
      self:ShowItemDetails(false, nil, false)
    end
    self.Selective_Listing:PlayOutAnim()
    self.IsListExpanded = false
    if self.CurInputDeviceType == ECommonInputType.Gamepad then
      self:SetOriginFocus()
    end
    if self.Change then
      self:PlayAnimationReverse(self.Change)
    end
    self:SetChangeCamera(IsListExpanded)
  end
  self:OnListExpand(IsListExpanded)
end

function Component:ShowItemDetails(bShow, Content, bNotSelect)
  self.bItemDetailsShowed = bShow
  if bShow then
    self.ItemDetailsWidget:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    if self.ItemDetailsContent ~= Content then
      self.ItemDetailsWidget:RefreshItemInfo(Content, true)
      if Content.IsLocked then
        self.ItemDetailsWidget.Switcher_Lock:SetActiveWidgetIndex(0)
      else
        self.ItemDetailsWidget.Switcher_Lock:SetActiveWidgetIndex(1)
      end
    end
    self.ItemDetailsWidget:PlayAnimation(self.ItemDetailsWidget.In)
    if not bNotSelect then
      if self.SelectItem and self.SelectItem ~= Content then
        self.SelectItem.IsSelected = false
        if self.SelectItem.UI then
          self.SelectItem.UI:SetSelected(false)
        end
      end
      Content.IsSelected = true
      self.SelectItem = Content
      if Content.UI then
        Content.UI:SetSelected(true)
      end
    end
  elseif self.ItemDetailsWidget then
    self.ItemDetailsWidget:PlayAnimation(self.ItemDetailsWidget.Out)
    if not bNotSelect and self.ItemDetailsContent then
      self.ItemDetailsContent.IsSelected = false
      if self.ItemDetailsContent.UI then
        self.ItemDetailsContent.UI:SetSelected(false)
      end
    end
  end
  self.ItemDetailsContent = Content
  if self.CurInputDeviceType == ECommonInputType.Gamepad then
    self.ItemDetailsWidget.Panel_Controller:SetVisibility(ESlateVisibility.Collapsed)
  end
end

function Component:OnListItemInited(Content, EntryUI)
  Content.UI = EntryUI
  if Content.IsChosen == nil then
    return
  end
  if Content.IsChosen == nil then
    return
  end
  Content.UI:SetSelected(Content.IsChosen)
end

function Component:PetMain_OnListItemClicked(Content)
  print("yklua,PetItemClick")
  if not self.IsListExpanded then
    return
  end
  if not Content.Uuid then
    return
  end
  if Content.IsChosen then
    self:DeleteContent(Content)
    local DelIdx = self:FindSelectedContentIndex(Content)
    if DelIdx then
      self:DeleteConsumeContent(DelIdx)
    end
    return
  end
  if self:IsPetFull() then
    return
  end
  if Content.IsLocked then
    self:ShowItemDetails(true, Content, false)
    UIManager(self):ShowUITip(UIConst.Tip_CommonToast, GText("UI_Pet_Locked"))
    return
  end
  if Content.IsPremium or Content.Rarity >= 5 or self.Pet.BreakNum > 0 then
    local function CancelFunc()
      self:SetFocus()
    end
    
    local function ConfirmFunc()
      ArmoryUtils:SetItemReddotRead(Content, true)
      self:SetContentChosen(Content)
    end
    
    UIManager():ShowCommonPopupUI(100174, {
      LeftCallbackFunction = CancelFunc,
      RightCallbackFunction = ConfirmFunc,
      CloseBtnCallbackFunction = CancelFunc
    }, self)
    return
  end
  if not Content.Uuid then
    return
  end
  ArmoryUtils:SetItemReddotRead(Content, true)
  if Content then
    self:SetContentChosen(Content)
  end
end

function Component:SetContentChosen(Content, bForceChose)
  if self:TryAddConsumeContent(self:CopyItem(Content), bForceChose) == false then
    return
  end
  if Content.IsChosen then
    return
  end
  self:ShowItemDetails(true, Content)
  Content.IsChosen = true
  if Content.UI then
    Content.UI:SetItemSelect(true)
  end
  self.CurrentSelected = Content
end

function Component:CopyItem(Content)
  local Target = ArmoryUtils:GetPet(Content.Uuid)
  local Copyitem = ArmoryUtils:NewPetItemContentWithEntry(Target)
  Copyitem.Father = Content
  assert(Copyitem)
  return Copyitem
end

function Component:DeleteContent(content)
  content.IsChosen = false
  if content.UI then
    content.UI:SetItemSelect(false)
    content.UI:SetSelected(false)
  end
end

function Component:FindSelectedContentIndex(Content)
  for i = 1, self.ConsumeCount do
    if self.ConsumeContents[i].Uuid == Content.Uuid then
      return i
    end
  end
end

function Component:CancelChosenContent(Content)
  if self.IsListExpanded == false then
    table.insert(self.ToCancelQueue, Content)
    return
  end
  if Content.UI then
    Content.UI:SetSelected(false)
    Content.UI:SetItemSelect(false)
  end
  Content.IsChosen = false
end

function Component:SortItemContents(InOutContentArray, SortByIdx, SortType)
  local FirtContent = self["Pet" .. "Main_CurContent"] or self["Pet" .. "Main_CmpContent"]
  local OrderByAttrNames = self["Pet" .. "OrderByAttrNames"]
  local SortByAttrNames = {
    OrderByAttrNames[SortByIdx]
  }
  for index, value in ipairs(OrderByAttrNames) do
    if index ~= SortByIdx then
      table.insert(SortByAttrNames, value)
    end
  end
  ArmoryUtils:SortItemContents(InOutContentArray, SortByAttrNames, SortType, FirtContent)
end

function Component:OnBackgroundClicked()
  if self.IsListExpanded then
    self:ExpandList(false)
  end
  return UIUtils.Handled
end

function Component:LockOrUnlockPet()
  if not self.ItemDetailsContent then
    return
  end
  local Avatar = GWorld:GetAvatar()
  if self.ItemDetailsContent.IsLocked then
    Avatar:UnLockPet(self.ItemDetailsContent.UniqueId)
  else
    Avatar:LockPet(self.ItemDetailsContent.UniqueId)
  end
end

function Component:OnPetLocked(ErrCode, UniqueId, IsLocked)
  local CurrentContent = self.ItemDetailsContent
  if not ErrorCode:Check(ErrCode) then
    return
  end
  CurrentContent.IsLocked = not CurrentContent.IsLocked
  if CurrentContent.UI then
    CurrentContent.UI:SetLock(CurrentContent.IsLocked and 1 or 0)
  end
  if self.ItemDetailsWidget then
    if CurrentContent.IsLocked then
      self.ItemDetailsWidget.Switcher_Lock:SetActiveWidgetIndex(0)
    else
      self.ItemDetailsWidget.Switcher_Lock:SetActiveWidgetIndex(1)
    end
  end
  if CurrentContent.IsChosen and CurrentContent.IsLocked then
    local DelIdx = self:FindSelectedContentIndex(CurrentContent)
    if DelIdx then
      self:DeleteConsumeContent(DelIdx)
    end
  end
end

function Component:RemoveConsumePet(Content)
  for _, pets in pairs(self.EntryPets) do
    for i = #pets, 1, -1 do
      if pets[i] == Content then
        table.remove(pets, i)
      end
    end
  end
  self:ExpandList(false)
end

function Component:OnDetailLockBtnClickComp()
  self:LockOrUnlockPet()
  self:SetFocus()
end

return Component
