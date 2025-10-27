require("UnLua")
local WBP_Play_Common_Root_C = Class("BluePrints.UI.BP_UIState_C")

function WBP_Play_Common_Root_C:Construct()
  self.IsInSelectState = false
  self:InitSubTab()
  self.Btn_Enter:SetText(GText("UI_GameEvent_Goto"))
  self.Text_BossRewards:SetText(GText("UI_HardBoss_Preview"))
  self.Btn_Enter:BindEventOnClicked(self, self.OnClickOpen)
  self.Btn_Shop:BindEventOnClicked(self, self.OnClickShop)
  self.Group_Title:RemoveChild(self.WBP_Rouge_LightLessChasm)
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
  if IsValid(self.GameInputModeSubsystem) then
    self:RefreshOpInfoByInputDevice(self.GameInputModeSubsystem:GetCurrentInputType(), self.GameInputModeSubsystem:GetCurrentGamepadName())
  end
  self:InitListenEvent()
  self:InitWidgetInfoInGamePad()
end

function WBP_Play_Common_Root_C:Destruct()
  self:RemoveTimer("AddPermanentItem")
  self:ClearListenEvent()
end

function WBP_Play_Common_Root_C:InitSubTab()
  local SortedSubTab = {}
  for _, SubTabData in pairs(DataMgr.PlaySubTab) do
    if SubTabData.WidgetUI == "PlayCommon" then
      table.insert(SortedSubTab, SubTabData)
    end
  end
  table.sort(SortedSubTab, function(a, b)
    return a.Sequence > b.Sequence
  end)
  local SortedUnlcokSubTab = {}
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    for _, SubTabData in ipairs(SortedSubTab) do
      local IsLocked = true
      if SubTabData.SubTabUnlockRuleId then
        local UIUnlockRuleInfo = DataMgr.UIUnlockRule[SubTabData.SubTabUnlockRuleId]
        local UIUnlockRuleId = UIUnlockRuleInfo.UIUnlockRuleId
        if UIUnlockRuleId then
          IsLocked = not Avatar:CheckUIUnlocked(UIUnlockRuleId)
        end
      else
        IsLocked = false
      end
      if not IsLocked then
        table.insert(SortedUnlcokSubTab, SubTabData)
      end
    end
  end
  local ClassPath = "/Game/UI/UI_PC/Common/Common_Item_subsize_PC_Content.Common_Item_subsize_PC_Content_C"
  local Index = 1
  local TryTime = 0
  self.List_Permanent:ClearListItems()
  local HasEmptyCell = false
  
  local function FillWrapBoxFunc()
    local ScrollBoxSize = USlateBlueprintLibrary.GetLocalSize(self.List_Permanent:GetCachedGeometry())
    local Item = self.List_Permanent:GetItemAt(0)
    if not Item then
      return false
    end
    local Entry = Item.Entry
    if not Entry then
      if Index <= 1 then
        return false
      elseif TryTime < 20 then
        TryTime = TryTime + 1
        return true
      else
        return false
      end
    end
    local EntrySize = USlateBlueprintLibrary.GetLocalSize(Entry:GetCachedGeometry())
    if 0 == ScrollBoxSize.X or 0 == EntrySize.X then
      return false
    end
    local XCount = math.floor(ScrollBoxSize.X / EntrySize.X) + 1
    if XCount < Index then
      return false
    end
    local SubItemObj = NewObject(UE4.LoadClass(ClassPath))
    SubItemObj.Parent = self
    SubItemObj.Empty = true
    Index = Index + 1
    self.List_Permanent:AddItem(SubItemObj)
    HasEmptyCell = true
    return true
  end
  
  self:AddTimer(self.IntervalTime, function()
    if Index > #SortedUnlcokSubTab then
      if not FillWrapBoxFunc() then
        self:RemoveTimer("AddPermanentItem")
      end
      return
    end
    local SubTabData = SortedUnlcokSubTab[Index]
    local SubItemObj = NewObject(UE4.LoadClass(ClassPath))
    SubItemObj.SubWidgetUIName = SubTabData.SubWidgetUI
    SubItemObj.Index = Index
    SubItemObj.Parent = self
    SubItemObj.Empty = false
    Index = Index + 1
    self.List_Permanent:AddItem(SubItemObj)
  end, true, 0, "AddPermanentItem", true)
  if HasEmptyCell then
    self.List_Permanent.ConsumeMouseWheel = EConsumeMouseWheel.Never
  else
    self.List_Permanent.ConsumeMouseWheel = EConsumeMouseWheel.WhenScrollingPossible
  end
end

function WBP_Play_Common_Root_C:RefreshListPermanentInfo(Index)
  if self.SelectedIndex ~= nil then
    local CurSelectPermanent = self.List_Permanent:GetItemAt(math.max(self.SelectedIndex - 1, 0))
    local SubCell = CurSelectPermanent.Entry
    CurSelectPermanent.IsSelect = false
    SubCell:StopBtnAnimations()
    SubCell:PlayAnimation(SubCell.Normal)
    self:PlayAnimation(self.Change)
  end
  if self.CurSubTabName then
    ReddotManager.RemoveListener(self.CurSubTabName, self)
  end
  self.SelectedIndex = Index
  local CurSelectPermanent = self.List_Permanent:GetItemAt(math.max(self.SelectedIndex - 1, 0))
  local BtnInfo = DataMgr.PlaySubTab
  local SubTabInfo = BtnInfo[CurSelectPermanent.SubWidgetUIName]
  self.CurSubTabName = CurSelectPermanent.SubWidgetUIName
  if DataMgr.ReddotNode[self.CurSubTabName] then
    if not ReddotManager.GetTreeNode(self.CurSubTabName) then
      ReddotManager.AddNode(self.CurSubTabName)
    end
    ReddotManager.AddListener(self.CurSubTabName, self, self["On" .. self.CurSubTabName .. "ReddotChange"])
  end
  local BackGround = LoadObject(SubTabInfo.BgImage)
  local ImgMat = self.Image_Permanent:GetDynamicMaterial()
  ImgMat:SetTextureParameterValue("IconMap", BackGround)
  if self.TitleWidget then
    self.Group_Title:RemoveChild(self.TitleWidget)
    self.TitleWidget = nil
  end
  if SubTabInfo.TitleBp then
    self.TitleWidget = UIManager(self):CreateWidget(SubTabInfo.TitleBp, false)
    local TitleInfo = {
      MainTitle = SubTabInfo.SubTabName
    }
    if self.CurSubTabName == "RougeMain" then
      local Avatar = GWorld:GetAvatar()
      if Avatar then
        local SeasonId = Avatar.RougeLike.ProgressingSeasonId
        if SeasonId and DataMgr.RougeLikeSeason[SeasonId] then
          TitleInfo.SubTitle = DataMgr.RougeLikeSeason[SeasonId].SubTitle
        end
      end
    elseif self.CurSubTabName == "AbyssMain" then
      local Avatar = GWorld:GetAvatar()
      if Avatar then
        local AbyssSeasonId = Avatar.CurrentAbyssSeasonId
        if AbyssSeasonId and DataMgr.AbyssSeasonList[AbyssSeasonId] then
          TitleInfo.SubTitle = DataMgr.AbyssSeasonList[AbyssSeasonId].AbyssSeasonName
        end
      end
    end
    self.TitleWidget:SetInfo(TitleInfo)
    self.Group_Title:AddChild(self.TitleWidget)
  end
  self.ListView_Rewards:ClearListItems()
  if SubTabInfo.RewardViewId then
    self.Text_BossRewards:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
    self.ListView_Rewards:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    local RewardInfo = DataMgr.RewardView[SubTabInfo.RewardViewId]
    if RewardInfo then
      local Ids = RewardInfo.Id or {}
      local RewardCount = RewardInfo.Quantity or {}
      local TableName = RewardInfo.Type or {}
      for i = 1, #Ids do
        local Content = NewObject(UIUtils.GetCommonItemContentClass())
        local ItemId = Ids[i]
        Content.UIName = "PlayCommon"
        Content.IsShowDetails = true
        Content.Id = ItemId
        if RewardCount[i] then
          Content.Count = RewardUtils:GetCount(RewardCount[i])
        end
        Content.Icon = ItemUtils.GetItemIconPath(ItemId, TableName[i])
        Content.Rarity = ItemUtils.GetItemRarity(ItemId, TableName[i])
        Content.ItemType = TableName[i]
        Content.OnMenuOpenChangedEvents = {
          Obj = self,
          Callback = self.OnMenuOpenChanged
        }
        self.ListView_Rewards:AddItem(Content)
      end
    end
  else
    self.Text_BossRewards:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.ListView_Rewards:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  if SubTabInfo.ShopJumpId then
    self.Btn_Shop:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  else
    self.Btn_Shop:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  self.Group_Time:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self.Text_Desc:SetText(GText(SubTabInfo.SubTabDes))
end

function WBP_Play_Common_Root_C:OnClickOpen()
  if DataMgr.PlaySubTab[self.CurSubTabName].JumpUIId then
    PageJumpUtils:JumpToTargetPageByJumpId(DataMgr.PlaySubTab[self.CurSubTabName].JumpUIId)
  else
    local WidgetUI = self.Root:OpenSubUI(self.CurSubTabName)
    self.Root.IsOpenSelectLevel = false
    WidgetUI:InitTable()
  end
end

function WBP_Play_Common_Root_C:OnClickShop()
  local ShopJumpId = DataMgr.PlaySubTab[self.CurSubTabName].ShopJumpId
  if ShopJumpId then
    PageJumpUtils:JumpToTargetPageByJumpId(ShopJumpId)
  end
end

function WBP_Play_Common_Root_C:OnRougeMainReddotChange()
  if not ReddotManager.GetTreeNode("RougeMain") then
    ReddotManager.AddNode("RougeMain")
  end
  local TreeNode = ReddotManager.GetTreeNode("RougeMain")
  if TreeNode.Count > 0 then
    self.Btn_Enter.Reddot:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  else
    self.Btn_Enter.Reddot:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
end

function WBP_Play_Common_Root_C:OnAbyssMainReddotChange()
  if not ReddotManager.GetTreeNode("AbyssMain") then
    ReddotManager.AddNode("AbyssMain")
  end
  local TreeNode = ReddotManager.GetTreeNode("AbyssMain")
  if TreeNode.Count > 0 then
    self.Btn_Enter.Reddot:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  else
    self.Btn_Enter.Reddot:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
end

function WBP_Play_Common_Root_C:InitListenEvent()
  if IsValid(self.GameInputModeSubsystem) then
    self.GameInputModeSubsystem.OnInputMethodChanged:Add(self, self.RefreshOpInfoByInputDevice)
  end
end

function WBP_Play_Common_Root_C:ClearListenEvent()
  if IsValid(self.GameInputModeSubsystem) then
    self.GameInputModeSubsystem.OnInputMethodChanged:Remove(self, self.RefreshOpInfoByInputDevice)
  end
end

function WBP_Play_Common_Root_C:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  if CurInputDevice == ECommonInputType.Touch then
    return
  end
  local IsUseKeyAndMouse = CurInputDevice == ECommonInputType.MouseAndKeyboard
  self:UpdateUIStyleInPlatform(IsUseKeyAndMouse)
end

function WBP_Play_Common_Root_C:UpdateUIStyleInPlatform(IsUseKeyAndMouse)
  if IsUseKeyAndMouse then
    self:InitKeyboardView()
  else
    self:InitGamepadView()
  end
end

function WBP_Play_Common_Root_C:InitGamepadView()
  if self.Btn_Enter then
    self.Btn_Enter:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
    self.Btn_Enter:SetGamePadVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  end
  if self.Btn_Shop then
    self.Btn_Shop.Key_Shop:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  end
  if self.Key_Rewards then
    self.Key_Rewards:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  end
  if self.Key_Rewards_1 then
    self.Key_Rewards_1:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  end
  self:SetFocus()
end

function WBP_Play_Common_Root_C:InitKeyboardView()
  self:LeaveSelectMode()
  if self.Btn_Enter then
    self.Btn_Enter:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    self.Btn_Enter:SetGamePadVisibility(UIConst.VisibilityOp.Collapsed)
  end
  if self.Btn_Shop then
    self.Btn_Shop.Key_Shop:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  if self.Key_Rewards then
    self.Key_Rewards:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  if self.Key_Rewards_1 then
    self.Key_Rewards_1:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

function WBP_Play_Common_Root_C:InitWidgetInfoInGamePad()
  if self.Btn_Enter then
    self.Btn_Enter:SetGamePadImg("A")
  end
  if self.Btn_Shop then
    self.Btn_Shop.Key_Shop:CreateGamepadKey("X")
  end
  if self.Key_Rewards then
    self.Key_Rewards:CreateCommonKey({
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "LS"}
      }
    })
  end
  if self.Key_Rewards_1 then
    self.Key_Rewards_1:CreateCommonKey({
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "X"}
      }
    })
  end
end

function WBP_Play_Common_Root_C:BP_GetDesiredFocusTarget()
  if self.SelectedIndex then
    local CurSelectPermanent = self.List_Permanent:GetItemAt(math.max(self.SelectedIndex - 1, 0))
    return CurSelectPermanent.Entry
  else
    return self.List_Permanent
  end
end

function WBP_Play_Common_Root_C:OnUINavigation(NavigationDirection)
  if NavigationDirection == EUINavigation.Left then
    self:OnNavigationToIndex(self.SelectedIndex - 1)
  elseif NavigationDirection == EUINavigation.Right then
    self:OnNavigationToIndex(self.SelectedIndex + 1)
  end
  return nil
end

function WBP_Play_Common_Root_C:OnNavigationToIndex(Index)
  local Item = self.List_Permanent:GetItemAt(Index - 1)
  if Item then
    if self.List_Permanent:BP_IsItemVisible(Item) then
      local Widget = Item.Entry
      if Widget.Content.Empty then
        return nil
      else
        self.List_Permanent:BP_NavigateToItem(Item)
        Widget:OnCellClicked()
        return Widget
      end
    else
      self.List_Permanent:BP_NavigateToItem(Item)
      Item.SelectOnListItemObjectSet = true
    end
  end
  return nil
end

function WBP_Play_Common_Root_C:TrySelectFirstTime(Entry)
  if not self.SelectFirstTime then
    self.SelectFirstTime = true
    Entry:OnCellClickedWithoutSound()
    Entry:SetFocus()
  end
end

function WBP_Play_Common_Root_C:HandleKeyDown(MyGeometry, InKeyEvent)
  local IsEventHandled = false
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) then
    if InKeyName == UIConst.GamePadKey.FaceButtonBottom then
      IsEventHandled = true
      self:OnClickOpen()
    elseif InKeyName == UIConst.GamePadKey.LeftThumb then
      IsEventHandled = true
      self:EnterSelectMode()
    elseif InKeyName == UIConst.GamePadKey.FaceButtonRight then
      if self.IsInSelectState then
        IsEventHandled = true
        self:LeaveSelectMode()
      end
    else
      if InKeyName == UIConst.GamePadKey.FaceButtonLeft and not self.IsInSelectState then
        IsEventHandled = true
        self:OnClickShop()
      else
      end
    end
  end
  return IsEventHandled
end

function WBP_Play_Common_Root_C:SwitchIn()
  self:InitNormalTab()
end

function WBP_Play_Common_Root_C:OnMenuOpenChanged(bIsOpen)
  if bIsOpen then
    self:InitMenuOpenTab()
  elseif self.IsInSelectState then
    self:InitSelectTab()
  else
    self:InitNormalTab()
  end
end

function WBP_Play_Common_Root_C:EnterSelectMode()
  if self.IsInSelectState then
    return
  end
  if self.Btn_Enter then
    self.Btn_Enter:SetGamePadVisibility(UIConst.VisibilityOp.Collapsed)
  end
  if self.Btn_Shop then
    self.Btn_Shop.Key_Shop:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  if self.Key_Rewards then
    self.Key_Rewards:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  if self.Key_Rewards_1 then
    self.Key_Rewards_1:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  self:InitSelectTab()
  self:SelectFirstItem(self.ListView_Rewards)
  self.IsInSelectState = true
end

function WBP_Play_Common_Root_C:LeaveSelectMode()
  if not self.IsInSelectState then
    return
  end
  if self.Btn_Enter then
    self.Btn_Enter:SetGamePadVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  end
  if self.Btn_Shop then
    self.Btn_Shop.Key_Shop:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  end
  if self.Key_Rewards then
    self.Key_Rewards:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  end
  if self.Key_Rewards_1 then
    self.Key_Rewards_1:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  end
  self:InitNormalTab()
  self:FocusOnFirstItem()
  self.IsInSelectState = false
end

function WBP_Play_Common_Root_C:SelectFirstItem(List)
  if List then
    if List:GetNumItems() > 0 then
      List:NavigateToIndex(0)
    else
      List:SetFocus()
    end
  end
end

function WBP_Play_Common_Root_C:FocusOnFirstItem()
  if self.SelectedIndex then
    local CurSelectPermanent = self.List_Permanent:GetItemAt(math.max(self.SelectedIndex - 1, 0))
    self.List_Permanent:BP_NavigateToItem(CurSelectPermanent)
  else
    self.List_Permanent:SetFocus()
  end
end

function WBP_Play_Common_Root_C:InitSelectTab()
  local BottomKeyInfo = {
    {
      GamePadInfoList = {
        {Type = "Img", ImgShortPath = "A"}
      },
      Desc = GText("UI_Controller_CheckDetails"),
      bLongPress = false
    },
    {
      KeyInfoList = {
        {
          Type = "Text",
          Text = "Esc",
          ClickCallback = self.Root.OnClickBack,
          Owner = self.Root
        }
      },
      GamePadInfoList = {
        {Type = "Img", ImgShortPath = "B"}
      },
      Desc = GText("UI_BACK"),
      bLongPress = false
    }
  }
  if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
    self.Root.ComTab:UpdateUIStyleInPlatform(false)
    self.Root.ComTab.WBP_Com_Tab_ResourceBar.Tip_GamePad:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
  self.Root:UpdateOtherPageTab(BottomKeyInfo)
end

function WBP_Play_Common_Root_C:InitNormalTab()
  local BottomKeyInfo = {
    {
      KeyInfoList = {
        {
          Type = "Text",
          Text = "Esc",
          ClickCallback = self.Root.OnClickBack,
          Owner = self.Root
        }
      },
      GamePadInfoList = {
        {Type = "Img", ImgShortPath = "B"}
      },
      Desc = GText("UI_BACK"),
      bLongPress = false
    }
  }
  if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
    self.Root.ComTab:UpdateUIStyleInPlatform(true)
    self.Root.ComTab.WBP_Com_Tab_ResourceBar.Tip_GamePad:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  else
    if self.Root.ComTab.UpdateUIStyleInPlatform then
      self.Root.ComTab:UpdateUIStyleInPlatform(false)
    end
    if self.Root.ComTab.WBP_Com_Tab_ResourceBar then
      self.Root.ComTab.WBP_Com_Tab_ResourceBar.Tip_GamePad:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    end
  end
  self.Root:UpdateOtherPageTab(BottomKeyInfo)
end

function WBP_Play_Common_Root_C:InitMenuOpenTab()
  local BottomKeyInfo = {
    {
      KeyInfoList = {
        {
          Type = "Text",
          Text = "Esc",
          ClickCallback = self.Root.OnClickBack,
          Owner = self.Root
        }
      },
      Desc = GText("UI_BACK"),
      bLongPress = false
    }
  }
  if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
    self.Root.ComTab:UpdateUIStyleInPlatform(false)
    self.Root.ComTab.WBP_Com_Tab_ResourceBar.Tip_GamePad:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
  self.Root:UpdateOtherPageTab(BottomKeyInfo)
end

return WBP_Play_Common_Root_C
