local ArmoryUtils = require("BluePrints.UI.WBP.Armory.ArmoryUtils")
local M = {}

function M:ComponentInitDispatcher()
  self:AddDispatcher(EventID.OnSwitchPet, self, self.OnSwitchPet)
  self:AddDispatcher(EventID.PetAddExpMulti, self, self.OnPetExpChanged)
  self:AddDispatcher(EventID.OnPetBreakLevelUp, self, self.OnPetBreakLevelUp)
  self:AddDispatcher(EventID.OnPetNameChanged, self, self.OnPetNameChanged)
  self:AddDispatcher(EventID.OnPetLocked, self, self.OnPetLocked)
  self:AddDispatcher(EventID.OnPetEntryReplace, self, self.OnPetEntryReplace)
  self:AddDispatcher(EventID.OnPetEntryUp, self, self.OnPetEntryUp)
  self:AddDispatcher(EventID.OnNewPetObtained, self, self.OnNewPetObtained)
  self:AddDispatcher(EventID.OnPetDeleted, self, self.OnPetDeleted)
  self:AddDispatcher(EventID.OnPropChangePets, self, self.OnPropChangePets)
  self:AddDispatcher(EventID.OnPetReddotRead, self, self.OnPetReddotRead)
end

function M:PetMain_Init()
  self.Panel_SubTab:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  if self.IsPreviewMode then
    self.Tab_PetAlive:SetVisibility(UIConst.VisibilityOp.Collapsed)
  else
    self.Tab_PetAlive:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  end
  if not self.UseablePetItemContentsArray or self.bRecreateContent then
    self:PetMain_PreprocessContents()
  end
  self.CurPetTabIdx = 1
  if #self.ResourcePetItemContentsArray > 0 then
    self.Tab_PetAlive:Init({
      Parent = self,
      TabIdx = self.CurPetTabIdx,
      OnClicked = self.PetMain_OnPetTabClicked
    })
    self.Tab_PetAlive:Forbid(false)
  else
    self.Tab_PetAlive:Forbid(true)
  end
  self.PetMain_LastChar = self.ComparedChar
  self.ActorController:ChangeToProtagonist()
  self:InitRoleListByPetTab(self.CurPetTabIdx)
  self:SelectRoleListItem(self.PetMain_CmpContent)
  self:PlayAnimation(self.RoleList_In)
  self:UpdateBoxReddot()
end

function M:PetMain_PreprocessContents(Type, PreprocessParams)
  PreprocessParams = PreprocessParams or {}
  local UniqueId = PreprocessParams.SelectedTargetUuid
  local Id = PreprocessParams.SelectedTargetId
  local Index = PreprocessParams.SelectedTargetIndex
  self:PetMain_CreateItemContents()
  self:PetMain_SwitchCurrentContents()
  local Avatar = ArmoryUtils:GetAvatar()
  if self.PetItemContentsMap[Avatar.CurrentPet] then
    self.CurrentPet = Avatar.Pets[Avatar.CurrentPet]
  end
  self.ComparedPet = self.CurrentPet or Avatar.Pets[self.PetItemContentsArray[1].UniqueId]
  if self.CurrentPet then
    self:PetMain_InitContentState()
    self:PetMain_SortItemContents()
  else
    self:PetMain_SortItemContents()
    self:PetMain_InitContentState()
  end
  local ContentArray = self.PetItemContentsArray
  if UniqueId then
    self.ComparedPet = Avatar.Pets[UniqueId]
  elseif Id then
    for _, value in ipairs(ContentArray) do
      if value.UnitId == Id then
        self.ComparedPet = Avatar.Pets[value.UniqueId]
      end
    end
  elseif Index then
    local Content = ContentArray[Index]
    if Content then
      self.ComparedPet = Avatar.Pets[Content.UniqueId]
    end
  end
  if self.ComparedChar and self.CharItemContentsMap[self.ComparedChar.Uuid] then
    self.ComparedChar = Avatar.Chars[self.ComparedChar.Uuid] or self.ComparedChar
  else
    self.ComparedChar = nil
  end
  if self.ComparedPet then
    if self.PetItemContentsMap[self.ComparedPet.UniqueId] then
      self.ComparedPet = Avatar.Pets[self.ComparedPet.UniqueId]
    else
      self.ComparedPet = nil
    end
  end
  if not self.ComparedPet and ContentArray[1] then
    self.ComparedPet = Avatar.Pets[ContentArray[1].UniqueId]
  end
end

function M:PetMain_InitContentState()
  if self.PetMain_CurContent then
    self.PetMain_CurContent.bInGear = false
  end
  if self.PetMain_CmpContent then
    self.PetMain_CmpContent.IsSelect = false
  end
  local Avatar = ArmoryUtils:GetAvatar()
  if self.CurrentPet then
    self.PetMain_CurContent = self.PetItemContentsMap[self.CurrentPet.UniqueId]
    if self.PetMain_CurContent then
      self.CurrentPet = Avatar.Pets[self.CurrentPet.UniqueId]
      self.PetMain_CurContent.bInGear = true
    else
      self.CurrentPet = nil
    end
  end
  if self.ComparedPet then
    if self.PetItemContentsMap[self.ComparedPet.UniqueId] then
      self.ComparedPet = Avatar.Pets[self.ComparedPet.UniqueId]
    else
      self.ComparedPet = nil
    end
  end
  if not self.ComparedPet then
    self.ComparedPet = Avatar.Pets[self.PetItemContentsArray[1].UniqueId]
  end
  self.PetMain_CmpContent = self.PetItemContentsMap[self.ComparedPet.UniqueId]
  self.PetMain_CmpContent.IsSelect = true
end

function M:PetMain_PreMainTabChange()
  self.Tab_PetAlive:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Btn_Edit:SetVisibility(UIConst.VisibilityOp.Collapsed)
  if self.PetMain_LastChar then
    self.ActorController:ChangeCharModel(self.PetMain_LastChar)
  end
end

function M:PetMain_SetAllReddotRead()
  for _, Content in ipairs(self.PetItemContentsArray) do
    ArmoryUtils:SetItemReddotRead(Content, true)
  end
end

function M:PetMain_InitSubUI()
  self:DefaultInitSubUI({
    Target = self.ComparedPet,
    CurPet = self.CurrentPet,
    bHideDeployBtn = self.Params.bHideDeployBtn
  })
  self:CallFunctionByName("PetMain_InitSubUI_" .. self.CurSubTab.Name)
end

function M:PetMain_InitSubUI_Attribute()
  if self.CurrentSubUI then
    self.SubUIButtonStyleInfo = self.CurrentSubUI:GetButtonStyleInfo()
  end
end

function M:PetMain_InitSubUI_Entry()
  if self.CurrentSubUI then
    self.SubUIButtonStyleInfo = self.CurrentSubUI:GetButtonStyleInfo()
  end
end

function M:UpdatePetInfos(Content)
  self.Panel_Element:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Tab_L:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  if self.bHideBoxBtn then
    self.BoxWidget:SetVisibility(UIConst.VisibilityOp.Collapsed)
  else
    self.BoxWidget:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  end
  if self.IsPreviewMode then
    self.Panel_Lock:SetVisibility(UIConst.VisibilityOp.Collapsed)
  else
    self.Panel_Lock:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  end
  if 1 == Content.LockType then
    self.Switcher_Lock:SetActiveWidgetIndex(0)
  else
    self.Switcher_Lock:SetActiveWidgetIndex(1)
  end
  self.TextBlock_Name:SetText(Content.UnitName)
  self:SetStars(Content.Rarity or 0)
end

function M:PetMain_UpdateBoxReddot()
  local PetNode = ReddotManager.GetTreeNode(CommonConst.DataType.Pet) or {Count = 0}
  local ResourcePetNode = ReddotManager.GetTreeNode("Resource" .. CommonConst.DataType.Pet) or {Count = 0}
  if self.UseablePetItemContentsArray == self.PetItemContentsArray then
    self.Btn_Selective:SetReddot(PetNode.Count - ResourcePetNode.Count > 0, false)
  else
    self.Btn_Selective:SetReddot(ResourcePetNode.Count > 0, false)
  end
  local bShowReddot = self.Tab_PetAlive:IsVisible() and not self.Tab_PetAlive.bIsForbidden
  self.Tab_PetAlive:SetReddotRight(bShowReddot and ResourcePetNode.Count > 0)
  self.Tab_PetAlive:SetReddotLeft(bShowReddot and PetNode.Count - ResourcePetNode.Count > 0)
end

function M:PetMain_OnRoleListEntryInitialized(Content, Widget)
  if not Content.Level then
    Widget:SetLevel(1)
  end
end

function M:PetMain_OnRoleListItemClicked(Content)
  if self.PetMain_CmpContent == Content then
    return
  end
  self:SelectRoleListItem(Content)
end

function M:PetMain_SelectRoleListItem(Content)
  ArmoryUtils:SetItemReddotRead(Content, true)
  local Avatar = ArmoryUtils:GetAvatar()
  self.ComparedPet = Avatar.Pets[Content.UniqueId]
  ArmoryUtils:SetItemIsSelected(self.PetMain_CmpContent, false)
  ArmoryUtils:SetItemIsSelected(Content, true)
  self.PetMain_CmpContent = Content
  self:UpdatePetInfos(Content)
  self:CreateAndSelectSubTab({
    Pet = self.ComparedPet
  })
  self.ActorController:ChangePetModel(self.ComparedPet)
  self.EMListView_Role:BP_ScrollItemIntoView(Content)
end

function M:PetMain_InitRoleList()
  self.EMListView_Role:ClearListItems()
  for _, Content in ipairs(self.PetItemContentsArray) do
    self.EMListView_Role:AddItem(Content)
    if Content.IsSelect then
      self.EMListView_Role:BP_ScrollItemIntoView(Content)
    end
  end
  self.EMListView_Role:RegenerateAllEntries()
end

function M:PetMain_SortItemContents()
  if self.PetItemContentsArray == self.ResourcePetItemContentsArray then
    ArmoryUtils:SortItemContents(self.PetItemContentsArray, {
      "Rarity",
      "_PetEntryId",
      "SortPriority",
      "UnitId"
    }, CommonConst.DESC, self.PetMain_CurContent)
  else
    ArmoryUtils:SortItemContents(self.PetItemContentsArray, {
      "BreakNum",
      "Level",
      "Rarity",
      "SortPriority",
      "UnitId"
    }, CommonConst.DESC, self.PetMain_CurContent)
  end
end

local function AddContent(self, Pet)
  local Obj = ArmoryUtils:NewPetItemContent(Pet)
  Obj.bHideItemLevel = self.bFromArchive
  Obj.IsOwned = true
  self.BP_PetItemContents:Add(Obj)
  if Obj.IsResourcePet then
    Obj._PetEntryId = Obj.Entry and Obj.Entry[1]
    self.ResourcePetItemContentsMap[Obj.UniqueId] = Obj
    table.insert(self.ResourcePetItemContentsArray, Obj)
  else
    self.UseablePetItemContentsMap[Obj.UniqueId] = Obj
    table.insert(self.UseablePetItemContentsArray, Obj)
  end
  self:OnRoleListContentCreated(Obj)
  return Obj
end

local function RemoveContent(self, UniqueId)
  if self.ResourcePetItemContentsMap[UniqueId] then
    local Obj = self.ResourcePetItemContentsMap[UniqueId]
    self.ResourcePetItemContentsMap[UniqueId] = nil
    for index, value in ipairs(self.ResourcePetItemContentsArray) do
      if value.UniqueId == UniqueId then
        table.remove(self.ResourcePetItemContentsArray, index)
        break
      end
    end
    self.BP_PetItemContents:RemoveItem(Obj)
  elseif self.UseablePetItemContentsMap[UniqueId] then
    local Obj = self.UseablePetItemContentsMap[UniqueId]
    self.UseablePetItemContentsMap[UniqueId] = nil
    for index, value in ipairs(self.UseablePetItemContentsArray) do
      if value.UniqueId == UniqueId then
        table.remove(self.UseablePetItemContentsArray, index)
        break
      end
    end
    self.BP_PetItemContents:RemoveItem(Obj)
  end
end

function M:PetMain_CreateItemContents()
  local Avatar = ArmoryUtils:GetAvatar()
  self.UseablePetItemContentsMap = {}
  self.UseablePetItemContentsArray = {}
  self.ResourcePetItemContentsMap = {}
  self.ResourcePetItemContentsArray = {}
  self.BP_PetItemContents:Clear()
  local OwnedPets = {}
  local Pets = Avatar.Pets
  if self.Params.PetUniqueIds then
    local RealAvatar = GWorld:GetAvatar()
    if RealAvatar then
      for _, value in pairs(RealAvatar.Pets) do
        OwnedPets[value.PetId] = value
      end
    end
    Pets = {}
    for _, UniqueId in ipairs(self.Params.PetUniqueIds) do
      if Avatar.Pets[UniqueId] then
        table.insert(Pets, Avatar.Pets[UniqueId])
      end
    end
  end
  
  local function InsertLogic(Pet)
    local Obj = AddContent(self, Pet)
    if self.bFromArchive then
      if OwnedPets[Obj.UnitId] or self.IsPreviewMode then
        Obj.IsOwned = true
      else
        Obj.IsOwned = false
      end
    end
  end
  
  if self.DoNotSort and self.IsPreviewMode then
    local PetArray = {}
    if self.InitialOrderPetUniqueId then
      for _, value in ipairs(self.InitialOrderPetUniqueId) do
        table.insert(PetArray, Pets[value])
      end
    else
      PetArray = Pets
    end
    for _, Pet in ipairs(PetArray) do
      InsertLogic(Pet)
    end
  else
    for _, Pet in pairs(Pets) do
      InsertLogic(Pet)
    end
  end
  self.CurPetTabIdx = self.CurPetTabIdx or 1
  if 1 == self.CurPetTabIdx and 0 == #self.UseablePetItemContentsArray then
    self.CurPetTabIdx = 2
  end
end

function M:PetMain_SwitchCurrentContents()
  if 1 == self.CurPetTabIdx then
    self.PetItemContentsArray = self.UseablePetItemContentsArray
    self.PetItemContentsMap = self.UseablePetItemContentsMap
  else
    self.PetItemContentsArray = self.ResourcePetItemContentsArray
    self.PetItemContentsMap = self.ResourcePetItemContentsMap
  end
end

function M:PetMain_OnPetTabClicked(TabIdx)
  self:InitRoleListByPetTab(TabIdx)
  if 1 == TabIdx then
    self.SubTabName_JumpTo = ArmoryUtils.ArmorySubTabNames.Attribute
  end
  self:SelectRoleListItem(self.PetMain_CmpContent)
  self:UpdateBoxReddot()
end

function M:InitRoleListByPetTab(TabIdx)
  self.CurPetTabIdx = TabIdx
  self:PetMain_SwitchCurrentContents()
  if 1 == TabIdx then
    self:PetMain_InitContentState()
    self:PetMain_SortItemContents()
  else
    self:PetMain_SortItemContents()
    self:PetMain_InitContentState()
  end
  local Avatar = ArmoryUtils:GetAvatar()
  if 0 ~= Avatar.CurrentPet then
    self.CurrentPet = Avatar.Pets[Avatar.CurrentPet]
  end
  if self.CurrentPet then
    self.PetMain_CurContent = self.PetItemContentsMap[self.CurrentPet.UniqueId]
  end
  local UniqueId = self.ComparedPet and self.ComparedPet.UniqueId
  if UniqueId then
    if not self.PetItemContentsMap[UniqueId] then
      UniqueId = self.PetItemContentsArray[1].UniqueId
    end
  else
    UniqueId = self.PetItemContentsArray[1].UniqueId
  end
  self.ComparedPet = Avatar.Pets[UniqueId]
  self.PetMain_CmpContent = self.PetItemContentsMap[self.ComparedPet.UniqueId]
  self:InitRoleList()
end

function M:PetMain_UpdateResourceInfos()
  self.Tab_Arm:UpdateResource()
end

function M:ResetPetData()
  local Avatar = ArmoryUtils:GetAvatar()
  self.ComparedPet = Avatar.Pets[self.ComparedPet.UniqueId]
  if self.CurrentPet then
    self.CurrentPet = Avatar.Pets[self.CurrentPet.UniqueId]
  end
end

function M:OnNewPetObtained(UniqueID)
  if self.Params.PetUniqueIds or not self.PetItemContentsMap then
    return
  end
  local Avatar = ArmoryUtils:GetAvatar()
  local Pet = Avatar.Pets[UniqueID]
  if Pet then
    AddContent(self, Pet)
    if #self.ResourcePetItemContentsArray > 0 then
      self.Tab_PetAlive:Forbid(false)
    else
      self.Tab_PetAlive:Forbid(true)
    end
    self:InitRoleListByPetTab(self.CurPetTabIdx)
    self:UpdateBoxReddot()
  end
end

function M:OnPetDeleted(UniqueID)
  if self.Params.PetUniqueIds or not self.PetItemContentsMap then
    return
  end
  RemoveContent(self, UniqueID)
  if #self.ResourcePetItemContentsArray > 0 then
    self.Tab_PetAlive:Forbid(false)
  else
    self.Tab_PetAlive:Forbid(true)
  end
  self:InitRoleListByPetTab(self.CurPetTabIdx)
  self:UpdateBoxReddot()
end

function M:OnSwitchPet()
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_confirm_positive", nil, nil)
  self.CurrentPet = self.ComparedPet
  ArmoryUtils:SetItemInGear(self.PetMain_CurContent, false)
  ArmoryUtils:SetItemInGear(self.PetMain_CmpContent, true)
  self.PetMain_CurContent = self.PetMain_CmpContent
  self.CurrentSubUI:UpdateButtonStyle(self.CurrentPet, self.ComparedPet)
  if self.ActorController then
    self.ActorController:PlayPetVoice("vo_happy")
  end
end

function M:OnPetEntryReplace(ErrCode, UniqueId)
  if ErrCode ~= ErrorCode.RET_SUCCESS then
    return
  end
  local Avatar = ArmoryUtils:GetAvatar()
  local Pet = Avatar.Pets[UniqueId]
  if not Pet then
    return
  end
  self:ResetPetData()
  local Content = self.UseablePetItemContentsMap[UniqueId]
  if not Content then
    return
  end
  if self.PetMain_CmpContent == Content then
    self:InitSubUI()
  end
end

function M:OnPetEntryUp(ErrCode, UniqueId, EntryIndex, ConsumePetUniqueIds)
  if ErrCode ~= ErrorCode.RET_SUCCESS then
    return
  end
  local Avatar = ArmoryUtils:GetAvatar()
  local Pet = Avatar.Pets[UniqueId]
  if not Pet then
    return
  end
  self:ResetPetData()
  local Content = self.UseablePetItemContentsMap[UniqueId] or self.ResourcePetItemContentsMap[UniqueId]
  if not Content then
    return
  end
  if Content.IsResourcePet == true and self.IsListExpanded then
    local EntryID = Content.PetEntry[1]
    if DataMgr.PetEntry[EntryID] then
      local NewEntryID = DataMgr.PetEntry[Content.PetEntry[1]].PetEntryUPID
      ArmoryUtils:ResetResourcePetEntryIcons(Content, NewEntryID)
    end
  end
  if self.PetMain_CmpContent == Content then
    self:InitSubUI()
  end
end

function M:PetMain_OnEditBtnClicked()
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_small", nil, nil)
  local PetName = self.PetMain_CmpContent.UnitName
  local UniqueId = self.PetMain_CmpContent.UniqueId
  local MaxNameLen = CommonConst.PetNameLenghtLimit or 14
  self.NameEditDialog = UIManager(self):ShowCommonPopupUI(100176, {
    EditTextConfig = {
      Text = PetName,
      IsMultiLine = false,
      Owner = self,
      TextLimit = MaxNameLen,
      bLimitSpaces = true,
      bNotAllowEmpty = true,
      Events = {
        OnTextChanged = function(Text)
          if Text == PetName then
            self.NameEditDialog:GetButtonBar().Btn_Yes:ForbidBtn(true)
          else
            self.NameEditDialog:GetButtonBar().Btn_Yes:ForbidBtn(false)
          end
        end
      },
      bNeedCheckStringSensitive = true,
      OnCheckStringSensitive = function(self, bSuccess, Name)
        if bSuccess then
          Name = Name or ""
          if "" ~= Name then
            local Avatar = GWorld:GetAvatar()
            Avatar:PetSetName(UniqueId, Name)
          end
        end
      end
    }
  }, self)
end

function M:OnPetNameChanged(ErrCode, UniqueId, Name)
  if not ErrorCode:Check(ErrCode) then
    return
  end
  local PetContent = self.UseablePetItemContentsMap[UniqueId] or self.ResourcePetItemContentsMap[UniqueId]
  if PetContent then
    PetContent.UnitName = Name
    if PetContent == self.PetMain_CmpContent then
      self.TextBlock_Name:SetText(PetContent.UnitName)
    end
  end
end

function M:PetMain_OnLockBtnClicked()
  if self.ComparedPet.IsLock then
    local function CancelFunc()
      self:SetFocus()
    end
    
    local function ConfirmFunc()
      self:SetFocus()
      local Avatar = ArmoryUtils:GetAvatar()
      self:BlockAllUIInput(true)
      Avatar:UnLockPet(self.ComparedPet.UniqueId)
    end
    
    UIManager(self):ShowCommonPopupUI(100019, {
      LeftCallbackFunction = CancelFunc,
      RightCallbackFunction = ConfirmFunc,
      CloseBtnCallbackFunction = CancelFunc
    }, self)
  else
    self:BlockAllUIInput(true)
    local Avatar = ArmoryUtils:GetAvatar()
    Avatar:LockPet(self.ComparedPet.UniqueId)
  end
end

function M:OnPetLocked(ErrCode, UniqueId, IsLocked)
  self:BlockAllUIInput(false)
  if not ErrorCode:Check(ErrCode) then
    return
  end
end

function M:UpdatePetLockState(UniqueId)
  self:ResetPetData()
  local Avatar = ArmoryUtils:GetAvatar()
  local Pet = Avatar.Pets[UniqueId]
  local Content = self.UseablePetItemContentsMap[UniqueId] or self.ResourcePetItemContentsMap[UniqueId]
  if Pet and Content then
    Content.LockType = Pet.IsLock and 1 or 0
    if Content.SelfWidget then
      Content.SelfWidget:SetLock(Content.LockType)
    end
    if Content == self.PetMain_CmpContent then
      if 1 == Content.LockType then
        self.Switcher_Lock:SetActiveWidgetIndex(0)
        if self:IsVisible() then
          UIManager(self):ShowError(7006, nil, UIConst.Tip_CommonToast)
        end
      else
        self.Switcher_Lock:SetActiveWidgetIndex(1)
        if self:IsVisible() then
          UIManager(self):ShowError(7007, nil, UIConst.Tip_CommonToast)
        end
      end
    end
  end
end

function M:UpdatePetBreakLevel(UniqueId)
  local Avatar = ArmoryUtils:GetAvatar()
  local Pet = Avatar.Pets[UniqueId]
  local Content = self.UseablePetItemContentsMap[UniqueId] or self.ResourcePetItemContentsMap[UniqueId]
  if not Content or not Pet then
    return
  end
  self:ResetPetData()
  Content.BreakNum = Pet.BreakNum
  if Content.Widget then
    Content.Widget:SetPetStar(Content)
  end
  if Content.SelfWidget then
    Content.SelfWidget:SetPetStarLevel(Content.BreakNum)
  end
end

function M:UpdatePetLevel(UniqueId)
  self:ResetPetData()
  local Avatar = ArmoryUtils:GetAvatar()
  local Pet = Avatar.Pets[UniqueId]
  local Content = self.UseablePetItemContentsMap[UniqueId] or self.ResourcePetItemContentsMap[UniqueId]
  if not Content or not Pet then
    return
  end
  Content.Level = Pet.Level
  ArmoryUtils:SetItemLevel(Content, Pet.Level)
  if self.PetMain_CmpContent == Content then
    self:InitSubUI()
  end
end

function M:OnPetExpChanged(ErrCode, UniqueId)
  if ErrCode ~= ErrorCode.RET_SUCCESS then
    return
  end
  self:UpdatePetLevel(UniqueId)
  self:InitRoleListByPetTab(self.CurPetTabIdx)
end

function M:OnPetBreakLevelUp(ErrCode, UniqueId)
  if ErrCode ~= ErrorCode.RET_SUCCESS then
    return
  end
  self:UpdatePetBreakLevel(UniqueId)
  self:UpdatePetLevel(UniqueId)
  self:InitRoleListByPetTab(self.CurPetTabIdx)
end

function M:OnPropChangePets(keys)
  if not self.UseablePetItemContentsMap then
    return
  end
  keys = keys or {}
  local UniqueId = keys[1]
  local AttrName = keys[2]
  local Content = self.UseablePetItemContentsMap[UniqueId] or self.ResourcePetItemContentsMap[UniqueId]
  if Content and "IsLock" == AttrName then
    self:UpdatePetLockState(UniqueId)
  end
end

function M:OnPetReddotRead(UniqueId, InContent)
  local Content = self.UseablePetItemContentsMap[UniqueId] or self.ResourcePetItemContentsMap[UniqueId]
  if Content and InContent == Content then
    return
  end
  Content.IsNew = false
  ArmoryUtils:UpdateContentRetDotType(Content)
end

function M:PetMain_ReceiveEnterState()
  self:ResetPetData()
  self:UpdateMontageAndCamera()
end

function M:Destruct()
  self.Tab_PetAlive:SetVisibility(UIConst.VisibilityOp.Collapsed)
end

function M:PetMain_OnFocusReceived(ReplyInfo)
end

function M:PetMain_UpdateGamepadStyle()
  if self.IsGamepadInput and not self.IsPreviewMode and not self.IsListExpanded then
    self.Key_GamePad_Lock:CreateCommonKey({
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "Right"}
      }
    })
    if not self.IsSubUIFocused then
      self.Key_GamePad_Lock:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    else
      self.Key_GamePad_Lock:SetVisibility(UIConst.VisibilityOp.Collapsed)
    end
  else
    self.Key_GamePad_Lock:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.Btn_Edit:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  if self.IsGamepadInput then
    self.Btn_Edit:SetVisibility(UIConst.VisibilityOp.Collapsed)
  elseif self.IsPreviewMode then
    self.Btn_Edit:SetVisibility(UIConst.VisibilityOp.Collapsed)
  else
    self.Btn_Edit:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  end
end

function M:PetMain_InitKeySetting(KeyDownEvents, KeyUpEvents, BottomKeyInfo)
  if not self.bHideSquadBuildBtn or not self.IsPreviewMode then
    self:AddKeyEvents(KeyDownEvents, self.MenuKeyDownEvents)
  end
  self:AddKeyEvents(KeyDownEvents, self.MainTabKeyDownEvents, self.CommonKeyDownEvents)
  if self.Tab_L:IsVisible() then
    table.insert(BottomKeyInfo, self.RoleUpDownBottomKeyInfoList)
    self:AddKeyEvents(KeyDownEvents, self.RoleTabKeyDownEvents)
  end
  if not self.IsPreviewMode then
    if self.IsSubUIFocused then
      table.insert(BottomKeyInfo, self.SelectBottomKeyInfoList)
    else
      table.insert(BottomKeyInfo, self.EditNameBottomKeyInfoList)
      self:AddKeyEvents(KeyDownEvents, self.EditNameKeyDownEvents)
      self:AddKeyEvents(KeyDownEvents, self.LockKeyDownEvents)
      if self.CurSubTab.Name == ArmoryUtils.ArmorySubTabNames.Attribute and not self.SubUIButtonStyleInfo[1].ForbidBtn then
        self:AddKeyEvents(KeyDownEvents, self.UpgradeKeyDownEvents)
      end
    end
  end
  self:AddKeyEvents(KeyDownEvents, self.LeftThumbstickKeyDownEvents)
  table.insert(BottomKeyInfo, self.ESCKeyInfoList)
end

function M:PetMain_InitNavigationRules()
  self:InitNavigationRulesCommon()
end

function M:PetMain_OnViewKeyDown()
end

function M:PetMain_OnLeftThumbstickKeyDown(ReplyInfo)
  if self.Tab_PetAlive:IsVisible() then
    self.Tab_PetAlive:OnBtnClicked()
    if self.Tab_PetAlive.bIsForbidden then
      return
    end
    if self.IsSubTabFocused then
      if 2 == self.CurPetTabIdx then
        ReplyInfo.Widget = self:NavigateToRoleList()
      else
        ReplyInfo.Widget = self:NavigateToSubTab()
      end
      ReplyInfo.IsHandled = true
    else
      ReplyInfo.Widget = self:NavigateToRoleList()
      ReplyInfo.IsHandled = true
    end
  end
end

function M:PetMain_OnLockKeyDown()
  self:PetMain_OnLockBtnClicked()
end

function M:PetMain_OnEditNameKeyDown()
  self:PetMain_OnEditBtnClicked()
end

return M
