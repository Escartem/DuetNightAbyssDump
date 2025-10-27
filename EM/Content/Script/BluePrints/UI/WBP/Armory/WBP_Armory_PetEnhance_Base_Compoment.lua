require("UnLua")
local ArmoryUtils = require("BluePrints.UI.WBP.Armory.ArmoryUtils")
local SkillUtils = require("Utils.SkillUtils")
local M = Class({})
M._components = {
  "BluePrints.UI.WBP.Armory.Armory_PetEnhance_Selective_Listing_Compoment"
}

function M:Initialize()
  self.EntryContents = nil
  self.CurEntryContent = nil
  self.EntryItemWidgets = nil
  self.SelectedItemIdx = nil
  self.ConsumeCount = nil
  self.ConsumeContents = {
    {},
    {},
    {}
  }
end

function M:Construct()
  for i = 1, 4 do
    self["EntryItem_" .. i].Button_Area.OnClicked:Add(self, function()
      AudioManager(self):PlayUISound(self, "event:/ui/common/pet_potential_click", nil, nil)
      self:OnEntryClicked(i)
    end)
    self["EntryItem_" .. i].WidgetIndex = i
  end
  self.Btn_Enhance.Text_Button:SetText(GText("Pet_Affix_Break"))
  self.Text_Same:SetText(GText("Pet_Break_CostToast"))
  self.Selective_Listing:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Btn_Enhance.Button_Area.OnClicked:Add(self, self.OnEnhanceClicked)
  self.Btn_Enhance:SetDefaultGamePadImg("X")
  self.Selective_Listing.bIsShowNavigateGuide = false
  self.SuccessToast.Text_Success:SetText(GText("Pet_Affix_Break_Success"))
end

function M:OnLoaded(Pet, CurEntryContent)
  self.Pet = Pet
  self.CurEntryContentIdx = CurEntryContent and CurEntryContent.Index
  if not self.CurEntryContentIdx then
    self.CurEntryContentIdx = self:FindFirstNoMaxEntryIdx()
  end
  self:InitTabInfo()
  self:RefreshBaseInfo()
  self.ActorController = UIManager(self):GetArmoryUIObj().ActorController
  local Avatar = GWorld:GetAvatar()
  local CameraTag1
  if 1 == Avatar.Sex then
    CameraTag1 = "Nvzhu"
  else
    CameraTag1 = "Nanzhu"
  end
  self.ActorController:SetArmoryCameraTag(CameraTag1, "Entry", "LevelUp", CommonConst.ArmoryType.Pet)
end

function M:FindFirstNoMaxEntryIdx()
  for i, v in ipairs(self.Pet.Entry) do
    if 0 ~= v then
      local EntryData = DataMgr.PetEntry[v]
      if EntryData and EntryData.PetEntryUPID then
        return i
      end
    end
  end
  return 1
end

function M:RefreshBaseInfo()
  self:UpdateEntryInfos(self.Pet)
  self.ConsumeCount = 3
  self:ChanegeSelectEntry(self.EntryItemWidgets[self.CurEntryContentIdx].WidgetIndex)
end

function M:UpdateEntryInfos(Pet, beNotChangeView)
  if not Pet or not Pet.Entry then
    error("\230\178\161\230\156\137\228\188\160\229\133\165\229\174\160\231\137\169")
    return
  end
  local Data, EntryId
  local BreakData = DataMgr.PetBreak[Pet.PetId]
  local MaxEntry = 0
  if BreakData then
    MaxEntry = BreakData[#BreakData].EntryNum or 0
  end
  local UnlockedEntryNum = BreakData[Pet.BreakNum].EntryNum or 0
  if Pet:IsResourcePet() then
    MaxEntry = 1
    for i = 1, 4 do
      self["EntryItem_" .. i]:SetVisibility(UIConst.VisibilityOp.Collapsed)
    end
    self.EntryItemWidgets = {
      self.EntryItem_3
    }
    self.EntryItem_3:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  else
    for i = 1, 4 do
      self["EntryItem_" .. i]:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    end
    if Pet:IsPremium() then
      self.EntryItemWidgets = {
        self.EntryItem_1,
        self.EntryItem_3,
        self.EntryItem_4,
        self.EntryItem_2
      }
    else
      self.EntryItemWidgets = {
        self.EntryItem_1,
        self.EntryItem_3,
        self.EntryItem_2
      }
      self.EntryItem_4:SetVisibility(UIConst.VisibilityOp.Collapsed)
    end
  end
  self.EntryContents = {}
  for i, Widget in ipairs(self.EntryItemWidgets) do
    Widget.ContentIdx = i
  end
  local HasAnyEntry = false
  for i, Widget in ipairs(self.EntryItemWidgets) do
    EntryId = Pet.Entry[i]
    Data = DataMgr.PetEntry[EntryId]
    local Content = {index = i, Owner = self}
    if Data then
      Content.EntryId = EntryId
      Content.Name = GText(Data.PetEntryName)
      Content.IconPath = GText(Data.Icon)
      Content.Rarity = Data.Rarity
      Content.Desc = SkillUtils.CalcPetEntryDesc(EntryId)
    end
    if 0 == EntryId or nil == EntryId then
      Content.IsEmpty = true
    else
      Content.IsEmpty = false
    end
    Content.IsLocked = UnlockedEntryNum < i
    if EntryId then
      HasAnyEntry = true
    end
    if self.EntryItemWidgets[i] and not beNotChangeView then
      self.EntryItemWidgets[i]:Init(Content)
    end
    table.insert(self.EntryContents, Content)
  end
  self.CurEntryContent = self.EntryContents[self.CurEntryContentIdx]
  if self.EntryItemWidgets[self.CurEntryContent.index].SetIsSelected then
    self.EntryItemWidgets[self.CurEntryContent.index]:SetIsSelected(true)
  else
    self.EntryItemWidgets[self.CurEntryContent.index]:SetSelected(true)
  end
end

function M:OnEntryClicked(WidgetIndex)
  ArmoryUtils:SetContentIsSelected(self.CurEntryContent, false)
  self.CurEntryContent = self.EntryContents[self["EntryItem_" .. WidgetIndex].ContentIdx]
  ArmoryUtils:SetContentIsSelected(self.CurEntryContent, true)
  self:ChanegeSelectEntry()
end

function M:OnPetItemClicked(WidgetInex)
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_mid", nil, nil)
  if self.IsListExpanded == false then
    self:ExpandList(true)
    self:FocusListItem()
  else
    local FilteredPets = self:GetFilteredPet(self.CurEntryContent.EntryId)
    if FilteredPets and 0 == #FilteredPets then
      UIManager(self):ShowUITip(UIConst.Tip_CommonToast, GText("AvailablePet_Empty"))
    else
      UIManager(self):ShowUITip(UIConst.Tip_CommonToast, GText("UI_Armory_Toast_Material"))
    end
  end
end

function M:ChanegeSelectEntry(bNotPlayAni)
  for i = 1, 3 do
    if next(self.ConsumeContents[i]) then
      self:CancelChosenContent(self.ConsumeContents[i].Father)
    end
  end
  if self.CurEntryContent.IsLocked then
    self:InitLockedEntry()
  elseif self.CurEntryContent.IsEmpty then
    self:InitLNullEntry()
  elseif self.CurEntryContent.EntryId and DataMgr.PetEntry[self.CurEntryContent.EntryId].PetEntryUPID == nil then
    self:InitMaxEntry()
    if not bNotPlayAni then
      self:PlayAnimation(self.PromptLevelUp)
    end
  else
    self:InitEnhaceEntry()
    if not bNotPlayAni then
      self:PlayAnimation(self.PromptLevelUp)
    end
  end
end

function M:InitEnhaceEntry()
  self.HB_Entry:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  self.Preview:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  self.WB_Item:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  self.WidgetSwitcher_Btn:SetActiveWidgetIndex(0)
  self.Panel_Hint:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  local EntryId = self.CurEntryContent.EntryId
  local NewEntryId = DataMgr.PetEntry[EntryId].PetEntryUPID
  local OriginContent = {
    Rarity = DataMgr.PetEntry[EntryId].Rarity,
    Name = GText(DataMgr.PetEntry[EntryId].PetEntryName),
    IconPath = DataMgr.PetEntry[EntryId].IconS
  }
  local NewContent = {
    Rarity = DataMgr.PetEntry[NewEntryId].Rarity,
    Name = GText(DataMgr.PetEntry[NewEntryId].PetEntryName),
    IconPath = DataMgr.PetEntry[EntryId].IconS
  }
  self.EntryTag_Now:Init(OriginContent)
  self.EntryTag_Preview:Init(NewContent)
  self.Text_Detail:SetText(SkillUtils.CalcPetEntryEnhanceDesc(EntryId, DataMgr.PetEntry[EntryId].PetEntryUPID))
  self.ConsumeCount = DataMgr.PetEntry[EntryId].PetEntryUPCount or 0
  self.FirstEmptyItemIndex = 1
  self.Text_Total:SetText("/" .. self.ConsumeCount)
  self.ConsumeContents = {
    {},
    {},
    {}
  }
  self:RebuildSlots()
  self:OnPetNumChange()
end

function M:InitMaxEntry()
  self.HB_Entry:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  self.Preview:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Text_Detail:SetText(SkillUtils.CalcPetEntryDesc(self.CurEntryContent.EntryId))
  self.WB_Item:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.WidgetSwitcher_Btn:SetActiveWidgetIndex(1)
  self.Hint_Pet.WidgetSwitcher_State:SetActiveWidgetIndex(1)
  self.Panel_Hint:SetVisibility(UIConst.VisibilityOp.Hidden)
  local EntryId = self.CurEntryContent.EntryId
  local OriginContent = {
    Rarity = DataMgr.PetEntry[EntryId].Rarity,
    Name = GText(DataMgr.PetEntry[EntryId].PetEntryName),
    IconPath = DataMgr.PetEntry[EntryId].Icon
  }
  self.EntryTag_Now:Init(OriginContent)
end

function M:InitLockedEntry()
  self.WB_Item:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  self.WidgetSwitcher_Btn:SetActiveWidgetIndex(0)
  self.Hint_Pet.Text_Hint_Normal:SetText(GText(""))
  self.HB_Entry:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Panel_Hint:SetVisibility(UIConst.VisibilityOp.Hidden)
  self.Btn_Enhance:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  self.Btn_Enhance:ForbidBtn(true)
  self.Text_Detail:SetText(GText("Pet_AffixSlot_LockToast"))
  self:ClearConsumeContent()
end

function M:InitLNullEntry()
  self.WB_Item:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  self.WidgetSwitcher_Btn:SetActiveWidgetIndex(0)
  self.Hint_Pet.Text_Hint_Normal:SetText(GText(""))
  self.HB_Entry:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Panel_Hint:SetVisibility(UIConst.VisibilityOp.Hidden)
  self.Btn_Enhance:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  self.Btn_Enhance:ForbidBtn(true)
  self.Text_Detail:SetText(GText("UI_Pet_Affix_Without"))
  self:ClearConsumeContent()
end

function M:InitTransition()
  local EntryId = self.CurEntryContent.EntryId
  local NewEntryId = DataMgr.PetEntry[EntryId].PetEntryUPID
  local NewContent = {
    Rarity = DataMgr.PetEntry[NewEntryId].Rarity,
    Name = GText(DataMgr.PetEntry[NewEntryId].PetEntryName)
  }
  self.EntryTag_Now:Init(NewContent)
  self:ClearConsumeContent()
  self.Btn_Enhance:ForbidBtn(true)
  self.Btn_Enhance:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  self.Preview:SetVisibility(UIConst.VisibilityOp.Collapsed)
end

function M:IsPetFull()
  local emptyIndex
  for i = 1, self.ConsumeCount do
    if not next(self.ConsumeContents[i]) then
      emptyIndex = i
      break
    end
  end
  if nil == emptyIndex then
    UIManager(self):ShowUITip(UIConst.Tip_CommonToast, GText("Pet_LevelUp_AddMax"))
    return true
  end
  return false
end

function M:TryAddConsumeContent(Content, bForceChose)
  Content.IsSelected = false
  local emptyIndex
  for i = 1, self.ConsumeCount do
    if not next(self.ConsumeContents[i]) then
      emptyIndex = i
      break
    end
  end
  if emptyIndex then
    self.ConsumeContents[emptyIndex] = Content
    self:SetSlotContent(emptyIndex, Content)
    self:OnPetNumChange()
    return true
  else
    UIManager(self):ShowUITip(UIConst.Tip_CommonToast, GText("Pet_LevelUp_AddMax"))
    return false
  end
end

function M:DeleteConsumeContent(index)
  self:CancelChosenContent(self.ConsumeContents[index].Father)
  self.ConsumeContents[index] = {}
  for i = index, self.ConsumeCount - 1 do
    if next(self.ConsumeContents[i + 1]) then
      self.ConsumeContents[i] = self.ConsumeContents[i + 1]
      self.ConsumeContents[i + 1] = {}
    end
  end
  self:OnPetNumChange()
  self:RebuildSlots()
end

function M:ClearConsumeContent()
  for i = 1, 3 do
    if next(self.ConsumeContents[i]) and self.ConsumeContents[i].Father then
      self:CancelChosenContent(self.ConsumeContents[i].Father)
    end
  end
  self.ConsumeContents = {
    {},
    {},
    {}
  }
  self:RebuildSlots(true)
end

function M:RebuildSlots(bForceNoAdd)
  for i = 1, 3 do
    local Content = self.ConsumeContents[i]
    if nil == Content then
      Content = {}
    end
    if next(Content) and Content.bIsEmpty ~= true then
      self:SetSlotContent(i, Content)
    elseif not next(Content) then
      local bCanAdd = false
      if i <= self.ConsumeCount and true ~= bForceNoAdd then
        bCanAdd = true
      else
        bCanAdd = false
      end
      self:SetEmptySlot(i, bCanAdd)
    end
  end
end

function M:SetSlotContent(Index, Content)
  Content.IsChosen = false
  Content.Index = Index
  Content.OnMouseButtonUpEvents = {
    Obj = self,
    Callback = function()
      self:DeleteConsumeContent(Index)
    end,
    Params = {Index}
  }
  
  function Content.OnBtnAddClicked()
    self:DeleteConsumeContent(Index)
  end
  
  Content.bAllUseAsyncLoadWidget = false
  self["Item_" .. Index]:OnListItemObjectSet(Content)
  self["Item_" .. Index]:SetItemSelect(false)
  self["Item_" .. Index]:SetAdd(false)
  self["Item_" .. Index]:SetItemMinus(true)
  local Widget = self["Item_" .. Index]
  local MinusBtn = Widget.MinusWidget and Widget.MinusWidget.Btn_Minus
  if not MinusBtn then
    return
  end
  MinusBtn.ClickLogics = {}
  MinusBtn:BindEventOnClicked(self, self.DeleteConsumeContent, Index)
end

function M:SetEmptySlot(Index, bCanAdd)
  if nil == bCanAdd then
    bCanAdd = false
  end
  local EmptyContent = NewObject(UIUtils.GetCommonItemContentClass())
  EmptyContent.bAllUseAsyncLoadWidget = false
  EmptyContent.Index = Index
  if bCanAdd then
    EmptyContent.OnMouseButtonUpEvents = {
      Obj = self,
      Callback = function()
        self:OnPetItemClicked(Index)
      end,
      Parms = {Index}
    }
  end
  EmptyContent.bIsEmpty = true
  self["Item_" .. Index]:OnListItemObjectSet(EmptyContent)
  self["Item_" .. Index]:SetAdd(bCanAdd)
end

function M:OnPetNumChange()
  local num = 0
  for i = 1, 3 do
    if self.ConsumeContents[i] and self.ConsumeContents[i].Uuid then
      num = num + 1
    end
  end
  self.Text_Num:SetText(num)
  if num == self.ConsumeCount then
    self.Btn_Enhance:ForbidBtn(false)
    self.Btn_Enhance:SetVisibility(UIConst.VisibilityOp.Visible)
  else
    self.Btn_Enhance:ForbidBtn(true)
    self.Btn_Enhance:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  end
end

function M:OnEnhanceClicked()
  self:ExpandList(false)
  local Avatar = GWorld:GetAvatar()
  local ConsumePetUniqueIds = {}
  for i = 1, 3 do
    if self.ConsumeContents[i] and self.ConsumeContents[i].Uuid then
      table.insert(ConsumePetUniqueIds, self.ConsumeContents[i].UniqueId)
    end
  end
  local InAniStr = "LevelUp_In"
  local OutAniStr = "LevelUp_Out"
  local NewEntryId = DataMgr.PetEntry[self.CurEntryContent.EntryId].PetEntryUPID
  local bIsMax = false
  if NewEntryId and DataMgr.PetEntry[NewEntryId].PetEntryUPID == nil then
    InAniStr = "LevelUp_Max_In"
    OutAniStr = "LevelUp_Max_Out"
    bIsMax = true
  end
  
  local function Callback(ErrCode)
    if ErrCode ~= ErrorCode.RET_SUCCESS then
      local ErrorCodeData = DataMgr.ErrorCode[ErrCode]
      UIManager(self):ShowUITip(UIConst.Tip_CommonToast, GText(ErrorCodeData.ErrorCodeContent))
      self:BlockAllUIInput(false)
      return
    end
    self:BindToAnimationFinished(self[InAniStr], function()
      self:UnbindAllFromAnimationFinished(self[InAniStr])
      ScreenPrint("\230\146\173\230\148\190out\229\138\168\231\148\187")
      self:PlayAnimation(self[OutAniStr])
    end)
    self:UnbindAllFromAnimationFinished(self[OutAniStr])
    self:BindToAnimationFinished(self[OutAniStr], function()
      self:ChanegeSelectEntry(true)
      if bIsMax then
        self:AddTimer(0.01, function()
          ScreenPrint("\230\146\173\230\148\190out\229\138\168\231\148\187\229\174\140\230\175\149")
          local slot = UE4.UWidgetLayoutLibrary.SlotAsVerticalBoxSlot(self.WB_Item)
          if slot then
            slot:SetPadding(FMargin(0, 0, 0, 0))
          end
          self.WB_Item:SetRenderOpacity(1)
        end)
      end
      if self.CurInputDeviceType == ECommonInputType.Gamepad then
        self.GameInputModeSubsystem:SetNavigateWidgetOpacity(1)
      end
      self:FreshEntryUi()
      self:AddTimer(0.2, function()
        self.EntryItemWidgets[self.CurEntryContent.index]:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
      end)
    end)
    if self.CurInputDeviceType == ECommonInputType.Gamepad then
      self.GameInputModeSubsystem:SetNavigateWidgetOpacity(0)
    end
    self:PlayAnimation(self[InAniStr])
    for i = 1, 3 do
      if self.ConsumeContents[i] and self.ConsumeContents[i].Uuid then
        self:RemoveConsumePet(self.ConsumeContents[i].Father)
      end
    end
    self:InitTransition()
    self:UpgradeEntry(self.CurEntryContent)
    AudioManager(self):PlayUISound(nil, "event:/ui/common/same_card_strengthen_success", nil, nil)
    if self.ActorController then
      self.ActorController:PlayPetVoice("vo_happy")
    end
  end
  
  self:BlockAllUIInput(true)
  self:AddTimer(1, function()
    ScreenPrint("\232\167\163\233\153\164\232\190\147\229\133\165\233\153\144\229\136\182")
    self:BlockAllUIInput(false)
  end)
  Avatar:PetEntryUp(self.Pet.UniqueId, self.CurEntryContent.index, ConsumePetUniqueIds, Callback)
end

function M:UpgradeEntry(EntryContent)
  local NewEntryId = DataMgr.PetEntry[EntryContent.EntryId].PetEntryUPID
  local Data = DataMgr.PetEntry[NewEntryId]
  if Data then
    EntryContent.EntryId = NewEntryId
    EntryContent.Name = GText(Data.PetEntryName)
    EntryContent.IconPath = GText(Data.Icon)
    EntryContent.Rarity = Data.Rarity
    EntryContent.Desc = SkillUtils.CalcPetEntryDesc(NewEntryId)
  end
  local Entry = {
    self.CurEntryContent.EntryId
  }
  self:UpdateEntryPets(Entry)
end

function M:FreshEntryUi()
  self.EntryItemWidgets[self.CurEntryContent.index]:PlayAnimation(self.EntryItemWidgets[self.CurEntryContent.index].RefreshColor)
  self.EntryItemWidgets[self.CurEntryContent.index]:Init(self.CurEntryContent)
  self.EntryItemWidgets[self.CurEntryContent.index]:SetIsSelected(true)
end

function M:PlayInAnim()
  self:PlayAnimation(self.In)
end

function M:PlayOutAnim()
  if self.ActorController then
    self.ActorController:SetMontageAndCamera(CommonConst.ArmoryType.Pet, "Pet", nil, nil)
  end
  self:BindToAnimationFinished(self.Out, {
    self,
    self.Close
  })
  self:PlayAnimationForward(self.Out)
end

function M:Close()
  EventManager:FireEvent(EventID.OnPetEntryUpReturn)
end

function M:CheckIsCanCloseSelf()
  if self:IsAnimationPlaying(self.In) then
    return false
  end
  return true
end

function M:OnListExpand(bExpand)
  if bExpand then
    self.Image_ClickNotPass:SetVisibility(UIConst.VisibilityOp.Visible)
  else
    self.Image_ClickNotPass:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

function M:FocusListItem()
  local TileView = self.Selective_Listing.TileView_Select_Role
  if TileView:GetNumItems() > 0 then
    local SelectedItem = TileView:BP_GetSelectedItem()
    TileView:NavigateToIndex(0)
  end
  if self.CurInputDeviceType == ECommonInputType.Gamepad and self.SetSingleBottomKeyInfo then
    self:SetSingleBottomKeyInfo(1)
  end
end

AssembleComponents(M)
return M
