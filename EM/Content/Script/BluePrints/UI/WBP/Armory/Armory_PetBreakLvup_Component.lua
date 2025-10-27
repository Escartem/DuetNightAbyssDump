require("UnLua")
local ArmoryUtils = require("BluePrints.UI.WBP.Armory.ArmoryUtils")
local UpgradeUtils = require("Utils.UpgradeUtils")
local SkillUtils = require("Utils.SkillUtils")
local Component = {}
Component.BreakLevelUpWidget = "WidgetBlueprint'/Game/UI/WBP/Armory/Widget/Pet/WBP_Armory_PetAscend.WBP_Armory_PetAscend'"

function Component:InitBreakLevelUpComp(...)
  local User, Target, SubWidget, Params = ...
  self.Target = Target
  self.TargetData = Target.Props
  self.Type = Params.Type
  self.Tag = Params.Tag
  self.CurrentMode = Params.BehaviourType
  self:RefreshListComp()
  self.Selective_Listing:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  self:InitTab(GText("UI_Pet_BreakLevelUp"))
  self:OnExpandList(false, nil, true)
  self:ShowChooseBtn(true)
  self:ShowWarning(false)
  self.Btn_Enhance:UnBindEventOnClickedByObj(self)
  self.Btn_Enhance:BindEventOnClicked(self, self.OnUpgradeBtnClicked)
  self.Btn_Enhance:BindForbidStateExecuteEvent(self, self.OnUpgradeBtnForbiddenClicked)
  self.Btn_Auto:UnBindEventOnClickedByObj(self)
  self.Btn_Auto:BindEventOnClicked(self, self.OnAutoBtnClicked)
  self:AddDispatcher(EventID.OnPetBreakLevelUp, self, self.OnPetIntensifyDone)
  self:AddDispatcher(EventID.OnPetLocked, self, self.OnPetLocked)
  local WidgetPath = Component.BreakLevelUpWidget
  local SubWidgetParams = {
    Parent = self,
    Target = self.Target,
    Type = self.Type,
    Tag = self.Tag
  }
  self.EnhanceWidget = nil
  self:InitBreakLvUpIntensify(WidgetPath, SubWidgetParams)
  self:InitBreakLevelUpView()
  self.WidgetSwitcher_Mode:SetActiveWidgetIndex(1)
  self:InitBreakLvUpPanelInfo()
  self:RefreshBaseInfo()
  self:BindToAnimationFinished(self.Selective_Listing.In, {
    self,
    self.RefreshBaseInfo
  })
  self.AutoPressed = false
  self.EnhancePressed = false
  self:InitEntryItems()
end

function Component:InitEntryItems()
  self.bHasLockEntryItem = false
  local BreakConf = self.Target:BreakData()
  if not self.Target:IsMaxBreak() and BreakConf[self.Target.BreakNum + 1].EntryNum > BreakConf[self.Target.BreakNum].EntryNum then
    self.bHasLockEntryItem = true
  end
  if self.Panel_EntryItem:GetVisibility() ~= UIConst.VisibilityOp.SelfHitTestInvisible then
    self.Panel_EntryItem:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  end
  for i = 1, 4 do
    if self["EntryItem_" .. i] then
      self:BindToAnimationFinished(self["EntryItem_" .. i].UnLock, {
        self,
        function()
          self:UpdateEntryInfos(self.Target)
        end
      })
      self["EntryItem_" .. i]:SetForbidden(true)
    end
  end
  self:UpdateEntryInfos(self.Target)
end

function Component:CloseEntryItems()
  if self.Panel_EntryItem:GetVisibility() ~= UIConst.VisibilityOp.Collapsed then
    self.Panel_EntryItem:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  for i = 1, 4 do
    if self["EntryItem_" .. i] then
      self:UnbindAllFromAnimationFinished(self["EntryItem_" .. i].UnLock)
    end
  end
end

function Component:OnExpandListComp(bListExpand, bRefreshList)
  if self.CurrentMode == "BreakLevelUp" then
  end
end

function Component:OnUpgradeBtnClicked()
  if self.CurrentMode == "BreakLevelUp" then
    self:TryToBreakLevelUp()
  end
end

function Component:OnUpgradeBtnForbiddenClicked()
  if self.CurrentMode == "BreakLevelUp" then
    UIManager(self):ShowUITip("CommonToastMain", GText("UI_Armory_SelectedConsumeIsEmpty"), 1.5)
  end
end

function Component:SwitchAutoBtnState(bClear)
  if self.CurrentMode == "BreakLevelUp" then
    if self.bBtnClear == bClear then
      return
    end
    self.bBtnClear = bClear
    if self.bBtnClear then
      self.Btn_Auto:SetText(GText("UI_WeaponStrength_Clear"))
    else
      self.Btn_Auto:SetText(GText("UI_WeaponStrength_Auto"))
    end
  end
end

function Component:OnAutoBtnClicked()
  if self.CurrentMode == "BreakLevelUp" then
    if self.Target:IsFinalMaxLevel() then
      return
    end
    if not self.bBtnClear then
      if self.bItemDetailsShowed then
        self:ShowItemDetails(false)
      end
      self:ReNavigateToListItem()
      if self.bListEmpty then
        UIManager(self):ShowUITip(UIConst.Tip_CommonToast, GText("UI_Toast_WeaponStrength_NoAuto"), 1.5)
        return
      end
      local PreConsumeContents = {}
      local AllContent = self.Selective_Listing.TileView_Select_Role:GetListItems():ToTable()
      table.sort(AllContent, function(a, b)
        local aIsPet = a.ItemType == "Pet"
        local bIsPet = b.ItemType == "Pet"
        if aIsPet and not bIsPet then
          return true
        elseif not aIsPet and bIsPet then
          return false
        else
          return false
        end
      end)
      local Count = 0
      for _, Content in ipairs(AllContent) do
        if Content.Uuid and not self:IsContentLocked(Content) then
          local bAddConsumeContent = false
          if not Content.ItemType or Content.ItemType ~= "Resource" then
            bAddConsumeContent = true
          elseif Content.ItemType == "Resource" and Content.Count and Content.Count > 0 then
            bAddConsumeContent = true
          end
          if bAddConsumeContent then
            table.insert(PreConsumeContents, Content)
            Count = Count + 1
            if Count >= self.CurrentSubUI.PreConsumeCount then
              break
            end
          end
        end
      end
      if 0 == Count then
        UIManager(self):ShowUITip(UIConst.Tip_CommonToast, GText("UI_Toast_WeaponStrength_NoAuto"))
        return
      end
      self.CurrentSubUI:OnAutoSelectClick(PreConsumeContents)
    else
      self.CurrentSubUI:OnClearClick()
    end
  end
end

function Component:InitBreakLvUpIntensify(WidgetPath, Params)
  if self.EnhanceWidget then
    return
  end
  self.VB_Node:ClearChildren()
  self:CreateBreakLvUpWidget(WidgetPath, Params)
end

function Component:CreateBreakLvUpWidget(WidgetPath, Params)
  self.EnhanceWidget = UIManager(self):CreateWidget(WidgetPath, true)
  self.VB_Node:AddChild(self.EnhanceWidget)
  if self.EnhanceWidget then
    Params = Params or {}
    Params.Parent = self
    self.EnhanceWidget:Init(Params)
    if self.EnhanceWidget:IsVisible() then
      self.EnhanceWidget:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    end
    self.CurrentSubUI = self.EnhanceWidget
  end
end

function Component:InitBreakLvUpPanelInfo()
  self.Panel_Info:SetVisibility(UIConst.VisibilityOp.Visible)
  local TargetData = self.Target.Props
  local TargetName = DataMgr.Pet[TargetData.PetId].Name
  local TargetRarity = DataMgr.Pet[TargetData.PetId].Rarity
  self.Text_Limit:SetText(GText("Pet_LevelUp_LevelMax"))
  self.TextBlock_Name:SetText(GText(TargetName))
  self.Panel_Element:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self:SetStars(TargetRarity)
  self.Btn_Enhance:SetText(GText("UI_COMMONPOP_TITLE_100030"))
  self.Btn_Enhance:SetDefaultGamePadImg("Y")
  self.Btn_Auto:SetText(GText("UI_WeaponStrength_Auto"))
  self.Btn_Auto:SetDefaultGamePadImg("X")
  self.Btn_Enhance:ForbidBtn(self.CurrentSubUI:IsEmpty())
  self.Btn_Auto:ForbidBtn(false)
  self.CurrentSubUI:InitBreakLevelStars(self.Target.BreakNum + 1)
  self:SwitchAutoBtnState()
  self:UpdateBtnState(self.Target:IsFinalMaxLevel())
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
end

function Component:RefreshListComp()
  if self.CurrentMode == "BreakLevelUp" then
    local PetContents = {}
    local BreakConf = self.Target:BreakData()
    if BreakConf and BreakConf[self.Target.BreakNum] then
      local ConsumeResources = BreakConf[self.Target.BreakNum].ConsumeResource or {}
      for ResourceId, _ in pairs(ConsumeResources) do
        local Resource = self._Avatar.Resources[ResourceId]
        if Resource then
          local Obj = ArmoryUtils:NewResourceItemContent(Resource)
          Obj.Uuid = -ResourceId
          Obj.Parent = self
          Obj.Count = Resource.Count
          Obj.OnMouseButtonUpEvents = {
            Obj = self,
            Callback = function()
              self:OnBreakLvupListItemClicked(Obj)
            end
          }
          table.insert(PetContents, Obj)
        else
          local ResourceInfo = DataMgr.Resource[ResourceId]
          local Obj = NewObject(UIUtils.GetCommonItemContentClass())
          Obj.Type = CommonConst.DataType.Resource
          Obj.ItemType = CommonConst.DataType.Resource
          Obj.UnitId = ResourceId
          Obj.ResourceSType = ResourceInfo.ResourceSType
          Obj.IsEquiped = false
          Obj.Rarity = ResourceInfo.Rarity or 0
          Obj.Icon = ResourceInfo.Icon
          Obj.CharId = ResourceInfo.UseParam
          Obj.Uuid = -ResourceId
          Obj.Parent = self
          Obj.Count = 0
          Obj.bShadow = true
          Obj.OnMouseButtonUpEvents = {
            Obj = self,
            Callback = function()
              self:OnBreakLvupListItemClicked(Obj)
            end
          }
          table.insert(PetContents, Obj)
        end
      end
    end
    for UniqueId, Pet in pairs(self._Avatar.Pets) do
      if self.Target.UniqueId == UniqueId then
      elseif self._Avatar.CurrentPet == UniqueId then
      else
        local BreakData = DataMgr.PetBreak[self.Target.PetId][self.Target.BreakNum]
        local ConsumeIds = BreakData.ConsumePetId
        local bConsumePet = false
        for _, Id in pairs(ConsumeIds) do
          if Id == Pet.PetId then
            bConsumePet = true
            break
          end
        end
        if not bConsumePet then
        else
          local Obj = ArmoryUtils:NewPetItemContent(Pet)
          Obj.Parent = self
          Obj.OnMouseButtonUpEvents = {
            Obj = self,
            Callback = function()
              self:OnBreakLvupListItemClicked(Obj)
            end
          }
          table.insert(PetContents, Obj)
        end
      end
    end
    self:SortSelectiveList(PetContents, 1, CommonConst.DESC)
    self.Selective_Listing:Init(self, {
      ItemContents = PetContents,
      SortType = CommonConst.DESC,
      OrderByDisplayNames = {
        "UI_SHOWNPC_LIST_CONT_1",
        "UI_LEVEL_SELECT"
      }
    })
    self.Selective_Listing:SetEmptyStateText("")
    if 0 == #PetContents then
      self.Selective_Listing:SetEmptyStateText(GText("UI_Armory_PetListIsEmpty"))
    end
    self:SetListEmptyState(0 == #PetContents)
  end
end

function Component:IsBreakCommonResource(Uuid)
  return type(Uuid) == "number" and Uuid < 0
end

function Component:SortSelectiveList(InOutContentArray, SortBy, SortType)
  if self.CurrentMode == "BreakLevelUp" then
    self.SortType = SortType
    if not self.BreakLvupSortFunc then
      self.BreakLvupSortFunc = {}
      self.BreakLvupSortFunc[1] = function(P1, P2)
        if P1.Type == P2.Type then
          if P1.Rarity ~= P2.Rarity then
            return CommonUtils:Compare(P1.Rarity, P2.Rarity, self.SortType)
          end
          if P1.Level ~= P2.Level then
            return self:ComparePetLevel(P1, P2, self.SortType)
          end
        else
          if P1.Type == CommonConst.DataType.Resource then
            return true
          end
          if P2.Type == CommonConst.DataType.Resource then
            return false
          end
        end
        return CommonUtils:Compare(P2.UnitId, P1.UnitId, self.SortType)
      end
      self.BreakLvupSortFunc[2] = function(P1, P2)
        if P1.Type == P2.Type then
          if P1.Level and P2.Level and P1.Level ~= P2.Level then
            return self:ComparePetLevel(P1, P2, self.SortType)
          end
          if P1.Rarity ~= P2.Rarity then
            return CommonUtils:Compare(P1.Rarity, P2.Rarity, self.SortType)
          end
        else
          if P1.Type == CommonConst.DataType.Resource then
            return true
          end
          if P2.Type == CommonConst.DataType.Resource then
            return false
          end
        end
        return CommonUtils:Compare(P2.UnitId, P1.UnitId, self.SortType)
      end
    end
    table.sort(InOutContentArray, self.BreakLvupSortFunc[SortBy])
    self.SortType = nil
  end
end

function Component:OnBreakLvupListItemClicked(Content)
  if self.CurrentMode == "BreakLevelUp" then
    if self.CurrentSelected and self.CurrentSelected ~= Content and IsValid(self.CurrentSelected.SelfWidget) then
      self.CurrentSelected.SelfWidget:SetSelected(false)
    end
    if self.CurrentSelected ~= Content then
      self.CurrentSelected = Content
    end
    if IsValid(self.CurrentSelected.SelfWidget) then
      self.CurrentSelected.SelfWidget:SetSelected(true)
    end
    if not Content.Uuid then
      return
    end
    ArmoryUtils:SetItemReddotRead(Content, true)
    self:ShowItemDetails(true, Content)
    if self:IsContentLocked(Content) then
      UIManager(self):ShowUITip(UIConst.Tip_CommonToast, GText("UI_Pet_Locked"))
      return
    end
    if Content.bSelectTag then
      local DelContent = self.CurrentSubUI:FindSelectedContent(Content.Uuid)
      if DelContent then
        self.CurrentSubUI:OnItemMinusBtnClick(DelContent)
      end
      return
    end
    if Content.Count and Content.Count <= 0 then
      return
    end
    if self.CurrentSubUI:IsFull() then
      UIManager(self):ShowUITip(UIConst.Tip_CommonToast, GText("Pet_LevelUp_AddMax"))
      return
    end
    self.CurrentSubUI:CopyItemToConsumeList(Content)
  end
end

function Component:SetListEmptyState(bListEmpty)
  self.bListEmpty = bListEmpty
end

function Component:SetContentSelected(Content, bSelect)
  if self.CurrentMode == "BreakLevelUp" then
    if bSelect then
      Content.bSelectTag = true
      if Content.SelfWidget then
        Content.SelfWidget:SetItemSelect(Content.bSelectTag)
      end
      table.insert(self.SelectedContents, Content)
    else
      local MyDelContent = self.SelectedContents[Content.Index]
      if not MyDelContent then
        return
      end
      MyDelContent.bSelectTag = false
      if MyDelContent.SelfWidget then
        MyDelContent.SelfWidget:SetItemSelect(MyDelContent.bSelectTag)
      end
      table.remove(self.SelectedContents, Content.Index)
    end
  end
end

function Component:OnChosenItemChanged(CardLevelWidgetContents)
end

function Component:CloseComp()
  if self.CurrentMode == "BreakLevelUp" then
    if not self.bItemDetailsShowed then
      if self.CurrentSelected and self.CurrentSelected.SelfWidget then
        self.CurrentSelected.SelfWidget:SetSelected(false)
        self.CurrentSelected = nil
      end
      if self.Selective_Listing and IsValid(self.Selective_Listing) then
        self:UnbindAllFromAnimationFinished(self.Selective_Listing.In)
      end
    elseif self.CurInputDeviceType == ECommonInputType.Gamepad then
      self:ReNavigateToListItem(true)
    end
    self:RemoveDispatcher(EventID.OnPetBreakLevelUp)
    self:RemoveDispatcher(EventID.OnPetLocked)
  end
  self:CloseEntryItems()
end

function Component:RealCloseComp()
  if self.CurrentMode == "BreakLevelUp" then
    self.Btn_Enhance:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    self.Btn_Auto:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    self.GameInputModeSubsystem:SetNavigateWidgetOpacity(1)
  end
end

function Component:OnBackgroundClickedComp()
  if self.CurrentMode == "BreakLevelUp" then
    if self.CurrentSelected and self.CurrentSelected.SelfWidget then
      self.CurrentSelected.SelfWidget:SetSelected(false)
      self.CurrentSelected = nil
    end
    if self.bListExpand then
      if self.bItemDetailsShowed then
        self:ShowItemDetails(false)
      end
      self:OnExpandList(false, false)
    end
  end
end

function Component:OnDetailLockBtnClickComp()
  if self.CurrentMode == "BreakLevelUp" then
    self:LockOrUnlockPet()
  end
end

function Component:LockOrUnlockPet()
  if self.CurrentMode ~= "BreakLevelUp" then
    return
  end
  if self.BreakLvupLockTimer then
    self:RemoveTimer(self.BreakLvupLockTimer)
    self.BreakLvupLockTimer = nil
  end
  if not self.ItemDetailsContent then
    return
  end
  if self:IsContentLocked(self.ItemDetailsContent) then
    local function CancelFunc()
      self:SetFocus()
      
      if self.ItemDetailsWidget then
        self.ItemDetailsWidget.Btn_Locked.Switcher_Lock:SetActiveWidgetIndex(0)
      end
    end
    
    local function ConfirmFunc()
      self:SetFocus()
      local Avatar = GWorld:GetAvatar()
      self:BlockAllUIInput(true)
      Avatar:UnLockPet(self.ItemDetailsContent.UniqueId)
      self.BreakLvupLockTimer = self:AddTimer(5, function()
        UIManager(self):ShowUITip(UIConst.Tip_CommonToast, "\232\167\163\233\148\129\232\175\183\230\177\130\232\182\133\230\151\182", 1.5)
        self:BlockAllUIInput(false)
      end)
    end
    
    UIManager(self):ShowCommonPopupUI(100019, {
      LeftCallbackFunction = CancelFunc,
      RightCallbackFunction = ConfirmFunc,
      CloseBtnCallbackFunction = CancelFunc
    }, self)
  else
    self:BlockAllUIInput(true)
    local Avatar = GWorld:GetAvatar()
    Avatar:LockPet(self.ItemDetailsContent.UniqueId)
    self.BreakLvupLockTimer = self:AddTimer(5, function()
      UIManager(self):ShowUITip(UIConst.Tip_CommonToast, "\233\148\129\229\174\154\232\175\183\230\177\130\232\182\133\230\151\182", 1.5)
      self:BlockAllUIInput(false)
    end)
  end
end

function Component:OnPetLocked(ErrCode, UniqueId, IsLocked)
  if self.CurrentMode == "BreakLevelUp" then
    local CurrentContent = self.ItemDetailsContent
    if not CurrentContent then
      return
    end
    if self.BreakLvupLockTimer then
      self:RemoveTimer(self.BreakLvupLockTimer)
      self.BreakLvupLockTimer = nil
    end
    self:BlockAllUIInput(false)
    if not ErrorCode:Check(ErrCode) then
      return
    end
    CurrentContent.LockType = IsLocked and 1 or 0
    if CurrentContent.SelfWidget then
      CurrentContent.SelfWidget:SetLock(CurrentContent.LockType)
    end
    if self.ItemDetailsWidget then
      if IsLocked then
        self.ItemDetailsWidget.Switcher_Lock:SetActiveWidgetIndex(0)
      else
        self.ItemDetailsWidget.Switcher_Lock:SetActiveWidgetIndex(1)
      end
    end
    if CurrentContent.bSelectTag and IsLocked then
      local DelContent = self.EnhanceWidget:FindSelectedContent(CurrentContent.Uuid)
      if DelContent then
        self.EnhanceWidget:OnItemMinusBtnClick(DelContent)
      end
    end
  end
end

function Component:DestructComp()
end

function Component:Construct()
end

function Component:InitBreakLevelUpView()
  self.TargetId = self.Target[self.Type .. "Id"]
  self.BreakLevel = self.Target.BreakNum
  self.MaxBreakLevel = #DataMgr[self.Type .. "Break"][self.TargetId]
  self:UpdateBreakLevelUpInfo()
end

function Component:UpdateBreakLevelUpInfo()
  local BreakLevelUpData = DataMgr[self.Type .. "Break"][self.TargetId]
  local BreakLevel = self.BreakLevel
  if BreakLevel >= #BreakLevelUpData then
    self.ErrorText = "Max_BreakLevel_Achieved"
    self:PlayOutAnim()
    return
  end
end

function Component:TryToBreakLevelUp()
  local Avatar = GWorld:GetAvatar()
  if nil == Avatar then
    return
  end
  local PopupId = 100115
  local bShowCommonPopupUI = false
  if type(self.CurrentSubUI.GetConsumeContents) == "function" then
    local ConsumeContent = self.CurrentSubUI:GetConsumeContents()[1]
    if ConsumeContent.ItemType == "Pet" then
      local bPremium = ConsumeContent.IsPremium
      local bGoldRarity = ConsumeContent.Rarity > 4
      local bHasBreakUp = ConsumeContent.BreakNum > 0
      if bPremium or bGoldRarity or bHasBreakUp then
        bShowCommonPopupUI = true
        if bHasBreakUp then
          PopupId = 100219
        end
      end
    end
  end
  local ShowShortText = GText(DataMgr.CommonPopupUIContext[PopupId].PopoverText)
  if bShowCommonPopupUI then
    UIManager(self):ShowCommonPopupUI(PopupId, {
      RightCallbackFunction = function()
        local ConsumeId = self.CurrentSubUI:GetConsumeIds()[1]
        if not ConsumeId then
          UIManager(self):ShowUITip("CommonToastMain", GText("UI_Armory_SelectedConsumeIsEmpty"), 1.5)
          return
        end
        self:BlockAllUIInput(true)
        local Avatar = GWorld:GetAvatar()
        if self:IsBreakCommonResource(ConsumeId) then
          Avatar:PetBreak(self.Target.UniqueId, 0)
        else
          Avatar:PetBreak(self.Target.UniqueId, ConsumeId)
        end
        self.Btn_Enhance:ForbidBtn(true)
        self.Btn_Auto:ForbidBtn(true)
        self.GameInputModeSubsystem:SetNavigateWidgetOpacity(0)
        local ArmoryMain = UIManager(self):GetArmoryUIObj()
        ArmoryMain.ActorController:PetLvUpOrBreakUp()
      end,
      ShowShortText
    }, self)
  else
    local ConsumeId = self.CurrentSubUI:GetConsumeIds()[1]
    if not ConsumeId then
      UIManager(self):ShowUITip("CommonToastMain", GText("UI_Armory_SelectedConsumeIsEmpty"), 1.5)
      return
    end
    self:BlockAllUIInput(true)
    local Avatar = GWorld:GetAvatar()
    if self:IsBreakCommonResource(ConsumeId) then
      Avatar:PetBreak(self.Target.UniqueId, 0)
    else
      Avatar:PetBreak(self.Target.UniqueId, ConsumeId)
    end
    self.Btn_Enhance:ForbidBtn(true)
    self.Btn_Auto:ForbidBtn(true)
    self.GameInputModeSubsystem:SetNavigateWidgetOpacity(0)
    local ArmoryMain = UIManager(self):GetArmoryUIObj()
    ArmoryMain.ActorController:PetLvUpOrBreakUp()
  end
end

function Component:UpdateEntryInfos(Pet)
  if not Pet or not Pet.Entry then
    return
  end
  local Data, EntryId
  local BreakData = DataMgr.PetBreak[Pet.PetId]
  local MaxEntry = 0
  if BreakData then
    MaxEntry = BreakData[#BreakData].EntryNum or 0
  end
  local UnlockedEntryNum = BreakData[Pet.BreakNum].EntryNum or 0
  local EntryItemWidgets
  if Pet:IsResourcePet() then
    MaxEntry = 1
    for i = 1, 4 do
      self["EntryItem_" .. i]:SetVisibility(UIConst.VisibilityOp.Collapsed)
    end
    EntryItemWidgets = {
      self.EntryItem_3
    }
    self.EntryItem_3:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  else
    for i = 1, 4 do
      self["EntryItem_" .. i]:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    end
    if Pet:IsPremium() then
      EntryItemWidgets = {
        self.EntryItem_1,
        self.EntryItem_3,
        self.EntryItem_4,
        self.EntryItem_2
      }
    else
      EntryItemWidgets = {
        self.EntryItem_1,
        self.EntryItem_3,
        self.EntryItem_2
      }
      self.EntryItem_4:SetVisibility(UIConst.VisibilityOp.Collapsed)
    end
  end
  for i = 1, 4 do
    EntryId = Pet.Entry[i]
    Data = DataMgr.PetEntry[EntryId]
    local Content = {
      Index = i,
      Owner = self,
      OnClicked = self.OnEntryClicked
    }
    if Data then
      Content.EntryId = EntryId
      Content.Name = GText(Data.PetEntryName)
      Content.Rarity = Data.Rarity
      Content.Desc = SkillUtils.CalcPetEntryDesc(EntryId)
    end
    Content.IsEmpty = not EntryId or EntryId <= 0
    Content.IsLocked = UnlockedEntryNum < i
    if EntryItemWidgets[i] then
      EntryItemWidgets[i]:Init(Content)
    end
  end
end

function Component:OnPetIntensifyDone(ErrCode, UniqueId, CostPetUniqueID, bLevelUp)
  if self.CurrentMode == "BreakLevelUp" then
    local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
    local UIManager = GameInstance:GetGameUIManager()
    if not UIManager then
      return
    end
    try({
      exec = function()
        if not ErrorCode:Check(ErrCode, UIConst.Tip_CommonToast) then
          UIManager:ShowError(ErrCode, 1.5)
          self:BlockAllUIInput(false)
          return
        end
        self.CurrentSubUI:OnPetIntensifyDone(CostPetUniqueID, bLevelUp)
        if self.CurrentSubUI:IsEmpty() then
          self:BlockAllUIInput(false)
          if bLevelUp and self.bListExpand then
            if self.bItemDetailsShowed then
              self:ShowItemDetails(false)
            end
            self:OnExpandList(false, false)
            return
          end
        end
        if self.Params and self.Params.LeftCallbackObj and self.Params.LeftCallbackFunction then
          self.Params.LeftCallbackFunction(self.Params.LeftCallbackObj)
        end
      end,
      catch = function(err)
        DebugPrint("lhr@Error", err)
        UIManager:ShowUITip("CommonToastMain", GText(err))
        self.GameInputModeSubsystem:SetNavigateWidgetOpacity(1)
      end,
      final = function(ok)
        if not ok then
          self:BlockAllUIInput(false)
          self.GameInputModeSubsystem:SetNavigateWidgetOpacity(1)
        end
      end
    })
  end
end

function Component:OnBreakLevelUpAnimFinishedCallback()
  self:AddTimer(0.5, function()
    if not self.bHasLockEntryItem then
      return
    end
    self:BlockAllUIInput(false)
    self.GameInputModeSubsystem:SetNavigateWidgetOpacity(1)
    self:SetFocus()
    local BreakConf = self.Target:BreakData()
    local EntryIndex = {
      1,
      3,
      2
    }
    if self.Target:IsPremium() then
      EntryIndex = {
        1,
        3,
        4,
        2
      }
    end
    local CurrentEntrynum = BreakConf[self.Target.BreakNum].EntryNum
    local UnlockEntryName = "EntryItem_" .. tostring(EntryIndex[CurrentEntrynum])
    local UnlockEntry = self[UnlockEntryName]
    if BreakConf and BreakConf[self.Target.BreakNum] and UnlockEntry and UnlockEntry.IsLocked then
      UnlockEntry:PlayAnimation(UnlockEntry.UnLock)
      AudioManager(self):PlayUISound(self, "event:/ui/common/pet_potential_point_unlock", "", nil)
      UnlockEntry.WidgetSwitcher_State:SetActiveWidgetIndex(1)
      UnlockEntry.IsLocked = false
    end
    if self.Target.BreakNum >= 3 and self.Target.IsLock ~= nil and false == self.Target.IsLock then
      self:BlockAllUIInput(true)
      local Avatar = ArmoryUtils:GetAvatar()
      Avatar:LockPet(self.Target.UniqueId)
    end
  end)
  self:AddTimer(1.5, function()
    if not self then
      return
    end
    self.VB_Node:ClearChildren()
    local Params = {
      Target = self.Target,
      Type = self.Type,
      Tag = self.Tag,
      BehaviourType = "LevelUp",
      LeftCallbackObj = self.Params.LeftCallbackObj,
      LeftCallbackFunction = self.Params.LeftCallbackFunction,
      CloseBtnCallbackObj = self.Params.CloseBtnCallbackObj,
      CloseBtnCallbackFunction = self.Params.CloseBtnCallbackFunction,
      IsSwitch = true
    }
    local UIConfig = DataMgr.SystemUI.ArmoryCardLevelWeapon
    self:CloseComp()
    self:InitUIInfo(UIConfig.UIName, true, nil, self.Type, self.Target, self, Params)
    self:BlockAllUIInput(false)
  end)
  return
end

function Component:UpdateBtnState(bIsMaxLevel)
  if self.CurrentMode == "BreakLevelUp" then
    if bIsMaxLevel then
      self.Btn_Enhance:SetIsEnabled(false)
      self.Panel_Limit:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
      self.GameInputModeSubsystem:SetNavigateWidgetOpacity(0)
    else
      self.Btn_Enhance:SetIsEnabled(true)
      self.Panel_Limit:SetVisibility(UIConst.VisibilityOp.Collapsed)
    end
  end
end

function Component:RefreshOpInfoByInputDeviceComp(CurInputDevice, CurGamepadName)
  if self.CurrentMode == "BreakLevelUp" then
    self.CurInputDeviceType = CurInputDevice
    if CurInputDevice == ECommonInputType.Gamepad and self:HasAnyFocus() then
      self:ReNavigateToListItem()
    end
  end
end

function Component:OnFocusReceivedComp(MyGeometry, InFocusEvent)
  if self.CurrentMode == "BreakLevelUp" and self.CurInputDeviceType == ECommonInputType.Gamepad then
    self:ReNavigateToListItem()
  end
end

function Component:ReNavigateToListItem(bToList, bExpandingList)
  if self.CurrentMode == "BreakLevelUp" then
    if not bToList and self.bListExpand then
      local TileView = self.Selective_Listing.TileView_Select_Role
      if TileView:GetNumItems() > 0 then
        if bExpandingList then
          TileView:NavigateToIndex(0)
        else
          TileView:SetFocus()
        end
      end
    else
      self.CurrentSubUI.ListView_Item:NavigateToIndex(0)
    end
  end
end

function Component:OnKeyDownComp(MyGeometry, InKeyName)
  if self.CurrentMode == "BreakLevelUp" then
    if InKeyName == UIConst.GamePadKey.FaceButtonLeft then
      if not self.AutoPressed then
        self.AutoPressed = true
        self.Btn_Auto:OnBtnPressed()
      end
    elseif InKeyName == UIConst.GamePadKey.FaceButtonTop and not self.EnhancePressed then
      self.EnhancePressed = true
      self.Btn_Enhance:OnBtnPressed()
    end
  end
end

function Component:OnKeyUpComp(MyGeometry, InKeyName)
  if self.CurrentMode == "BreakLevelUp" then
    if InKeyName == UIConst.GamePadKey.FaceButtonLeft then
      if self.AutoPressed then
        self.AutoPressed = false
        self.Btn_Auto:OnBtnClicked()
      end
    elseif InKeyName == UIConst.GamePadKey.FaceButtonTop then
      if self.EnhancePressed then
        self.EnhancePressed = false
        self.Btn_Enhance:OnBtnClicked()
      end
    elseif InKeyName == UIConst.GamePadKey.RightThumb then
      if not self.bListExpand then
        return false
      end
      local SelectedContent = self.ItemDetailsContent and self.CurrentSubUI:FindSelectedContent(self.ItemDetailsContent.Uuid)
      self.CurrentSubUI:OnItemMinusBtnClick(SelectedContent)
    end
  end
end

return Component
