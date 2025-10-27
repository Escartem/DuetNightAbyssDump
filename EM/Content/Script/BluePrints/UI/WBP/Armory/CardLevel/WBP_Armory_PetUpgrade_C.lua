require("UnLua")
local MiscUtils = require("Utils.MiscUtils")
local ArmoryUtils = require("BluePrints.UI.WBP.Armory.ArmoryUtils")
local SkillUtils = require("Utils.SkillUtils")
local PreConsumeCount = 5
local Extra_Opacity_Add = 0.5
local LongPressTimerInterval = 0.1
local LongPressThreshold = 0.8
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C",
  "BluePrints.Common.TimerMgr"
})
M._components = {
  "BluePrints.UI.UI_PC.Common.LSFocusComp"
}

function M:Init(Params)
  self.CurrentWidget = nil
  self.Parent = Params.Parent
  self.Target = Params.Target
  self.SuccessToast.Text_Success:SetText(GText("Pet_LevelUp_Success"))
  self.ListView_Item.BP_OnEntryInitialized:Add(self, self.OnListItemInited)
  self.Sort_Pet:Init(self.Parent.FilterTagNames, "View", self)
  self.Sort_Pet:SelectItem(self.Parent.FilterTagIdx)
  self.Sort_Pet:BindEventOnSelectionsChanged(self, self.OnSortListSelectionsChanged)
  self.IsMobile = CommonUtils.GetDeviceTypeByPlatformName(self) == "Mobile"
  self:InitPreConsumeList()
  self:InitDetails()
end

function M:Construct()
  self.Text_Exp:SetText(GText("UI_Panel_Experience"))
  self:BindToAnimationFinished(self.LevelUp_In, {
    self,
    self.OnLevelUpInAnimFinished
  })
  self:BindToAnimationFinished(self.LevelUp_Out, {
    self,
    self.OnLevelUpOutAnimFinished
  })
  self:AddLSFocusTarget(nil, self.Sort_Pet, "View", true)
end

function M:Destruct()
  self:UnbindAllFromAnimationFinished(self.LevelUp_In)
  self:UnbindAllFromAnimationFinished(self.LevelUp_Out)
  self:RemoveFocusTarget("View")
end

function M:OnPreviewKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local IsHandled = false
  if InKeyName == UIConst.GamePadKey.SpecialLeft then
    IsHandled = self:OnKeyDownForLSComp(MyGeometry, InKeyEvent)
  end
  if IsHandled then
    return UIUtils.Handled
  end
  return UIUtils.UnHandled
end

function M:IsFull()
  return self.SelectedCount == self.PreConsumeCount
end

function M:IsEmpty()
  return 0 == self.SelectedCount
end

function M:IsPrecious()
  local PreConsumeArray = self.ListWidgets
  for i, Widget in pairs(PreConsumeArray) do
    local Content = Widget.Content
    if i <= self.SelectedCount and not self:IsCommonResource(Content.Uuid) and (Content.IsPremium or Content.Rarity >= 5) then
      return true
    end
  end
  return false
end

function M:OnListItemInited(Content, EntryUI)
  self:OnPreConsumeListGenerated(Content, EntryUI)
end

function M:OnPetIntensifyDone(CostPetUniqueId, bLevelUp)
  self.LevelUping = true
  local PreConsumeArray = self.ListWidgets
  for i = 1, self.SelectedCount do
    local DelContent = PreConsumeArray[i].Content
    self:OnItemMinusBtnClick(DelContent)
  end
  self:ClearResourceCnt()
  if self:IsEmpty() then
    local Player = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
    local PetData = self.Target:Data()
    local PetNameTag = PetData and PetData.PetNameTag
    if bLevelUp then
      self:HidePreConsumeList(true)
      self.Panel_Hint:SetVisibility(UIConst.VisibilityOp.Hidden)
      self.Panel_Exp:SetVisibility(UIConst.VisibilityOp.Hidden)
      self.Sort_Pet:SetVisibility(UIConst.VisibilityOp.Hidden)
      self.Num_LevelUp:SetText(self.Target.Level)
      self:PlayAnimation(self.LevelUp_In)
      AudioManager(self):StopSound(Player, "PetLevelUp")
      AudioManager(self):PlayUISound(self, "event:/ui/common/same_card_strengthen_success", nil, nil)
      AudioManager(self):PlayPetVoice(Player, PetNameTag, "vo_upgrade", "PetLevelUp")
    else
      AudioManager(self):StopSound(Player, "PetLevelUp")
      AudioManager(self):PlayPetVoice(Player, PetNameTag, "vo_happy", "PetLevelUp")
      self:ReInitAfterIntensify()
    end
  end
end

function M:ReInitAfterIntensify()
  self.Parent.Btn_Auto:ForbidBtn(false)
  self:HidePreConsumeList(false)
  self:InitDetails()
  self.Parent:ReNavigateToListItem(true)
end

function M:HidePreConsumeList(bHide)
  self.PreConsumeCount = bHide and 0 or PreConsumeCount
  self.PreConsumeList:Clear()
  for i = 1, PreConsumeCount do
    local EmptyContent = self:CreateSlotContent(i)
    self.PreConsumeList:Add(EmptyContent)
  end
  local PreConsumeArray = self.ListWidgets
  for i, Widget in pairs(PreConsumeArray) do
    local NewContent = self.PreConsumeList[i]
    NewContent.bAllUseAsyncLoadWidget = false
    Widget:Init(NewContent)
    self:OnPreConsumeListGenerated(NewContent, Widget)
  end
end

function M:GetConsumeContents()
  local PreConsumeArray = self.ListWidgets
  local ConsumeContents = {}
  for i, Widget in pairs(PreConsumeArray) do
    local Content = Widget.Content
    table.insert(ConsumeContents, Content)
  end
  return ConsumeContents
end

function M:UpdatePreConsumeList(PreConsumeList)
  local PreConsumeArray = self.ListWidgets
  for i, Widget in pairs(PreConsumeArray) do
    local NewContent = PreConsumeList[i]
    NewContent.bAllUseAsyncLoadWidget = false
    Widget:Init(NewContent)
    self:OnPreConsumeListGenerated(NewContent, Widget)
  end
  if self.CurrentWidget then
    self.CurrentWidget.Item:PlayAnimation(self.CurrentWidget.Item.Hover)
  end
end

function M:InitPreConsumeList(bSkipAnim)
  self.SelectedCount = 0
  self.PreConsumeCount = PreConsumeCount
  self.PreConsumeList:Clear()
  for i = 1, PreConsumeCount do
    local EmptyContent = self:CreateSlotContent(i)
    self.PreConsumeList:Add(EmptyContent)
  end
  self.ListView_Item:ClearListItems()
  for _, Content in pairs(self.PreConsumeList) do
    Content.bAllUseAsyncLoadWidget = false
    self.ListView_Item:AddItem(Content)
  end
  self.ListWidgets = {}
  self:ClearResourceCnt()
end

function M:CreateSlotContent(i)
  local EmptyContent = NewObject(UIUtils.GetCommonItemContentClass())
  EmptyContent.Index = i
  self:ReInitSlotContent(EmptyContent)
  return EmptyContent
end

function M:ReInitSlotContent(Content)
  if Content.Index <= self.PreConsumeCount then
    Content.NotInteractive = false
    Content.OnMouseButtonDownEvent = {
      Obj = self,
      Callback = function()
        if Content.Uuid and self:IsCommonResource(Content.Uuid) then
          self:OnMinusStart(Content)
          self.MinusPressed = true
        end
      end,
      Params = {bIgnoreRightMouseDown = true}
    }
    Content.OnMouseButtonUpEvents = {
      Obj = self,
      Callback = function()
        if self.IsMobile and Content.SelfWidget then
          Content.SelfWidget.Item:PlayAnimation(Content.SelfWidget.Item.UnHover)
        end
        if Content.Uuid then
          if not self:IsCommonResource(Content.Uuid) and not self.MinusPressed then
            self:OnItemMinusBtnClick(Content)
          else
            self:OnMinusEnd()
          end
        elseif self.MinusPressed then
          AudioManager(self):PlayItemSound(self, self.MinusContent.UnitId, "Click", self.MinusContent.ItemType)
        else
          AudioManager(self):PlayUISound(self, "event:/ui/common/click_mid", nil, nil)
          if self.IsPreviewLevelMax then
            UIManager(self):ShowUITip(UIConst.Tip_CommonToast, GText("Max_Level_Achieved"))
          elseif not self:HasAnyChoiceOfContent() then
            UIManager(self):ShowUITip(UIConst.Tip_CommonToast, GText("UI_Armory_Toast_NoMaterial"))
          elseif self.Parent and self.Parent.bListExpand then
            UIManager(self):ShowUITip(UIConst.Tip_CommonToast, GText("UI_Armory_Toast_Material"))
          end
          self:OnExpandList(true, false)
        end
        self.MinusPressed = false
      end
    }
    Content.OnMouseEnterEvent = {
      Obj = self,
      Callback = function()
        self.CurrentWidget = Content.SelfWidget
      end
    }
    Content.OnMouseLeaveEvent = {
      Obj = self,
      Callback = function()
        self.CurrentWidget = nil
      end
    }
  else
    Content.NotInteractive = true
    Content.OnMouseButtonUpEvents = nil
  end
end

function M:HasAnyChoiceOfContent()
  local AllParentContents = self.Parent:GetAllListContent()
  local Result = false
  for key, value in pairs(AllParentContents or {}) do
    if not value.IsLocked then
      Result = true
      break
    end
  end
  return Result
end

function M:OnPreConsumeListGenerated(Content, Widget)
  local Index = Content.Index
  self.ListWidgets[Index] = Widget
  local LastWidget = Index > 1 and self.ListWidgets[Index - 1] or nil
  if Content.Index <= self.PreConsumeCount then
    if LastWidget then
      LastWidget:SetNavigationRuleExplicit(EUINavigation.Right, Widget)
      Widget:SetNavigationRuleExplicit(EUINavigation.Left, LastWidget)
    else
      Widget:SetNavigationRuleBase(EUINavigation.Left, EUINavigationRule.Stop)
    end
    Widget:SetNavigationRuleBase(EUINavigation.Right, EUINavigationRule.Stop)
  else
    Widget:SetNavigationRuleBase(EUINavigation.Left, EUINavigationRule.Stop)
    Widget:SetNavigationRuleBase(EUINavigation.Right, EUINavigationRule.Stop)
  end
  if not Content.UnitId then
    Widget:SetAdd(not Content.NotInteractive)
    Widget:SetItemMinus(false)
  else
    Widget:SetAdd(false)
    Widget:SetItemMinus(true)
    local MinusBtn = Widget.MinusWidget and Widget.MinusWidget.Btn_Minus
    if not MinusBtn then
      return
    end
    MinusBtn:UnBindEventOnClicked(self, self.OnItemMinusBtnClick)
    MinusBtn:UnBindEventOnPressed(self, self.OnMinusStart)
    MinusBtn:UnBindEventOnReleased(self, self.OnMinusEnd)
    if not self:IsCommonResource(Content.Uuid) then
      MinusBtn:BindSingleEventOnClicked(self, self.OnItemMinusBtnClick, Content)
    else
      MinusBtn:BindEventOnPressed(self, self.OnMinusStart, Content)
      MinusBtn:BindEventOnReleased(self, self.OnMinusEnd)
    end
  end
end

function M:CopyItemToConsumeList(AddContent)
  self.SelectedCount = self.SelectedCount + 1
  self.PreConsumeList:Clear()
  local PreConsumeArray = self.ListWidgets
  local Target
  for i, Widget in pairs(PreConsumeArray) do
    local Content = Widget.Content
    if i == self.SelectedCount then
      if self:IsCommonResource(AddContent.Uuid) then
        Target = self.Parent._Avatar.Resources[AddContent.UnitId]
        assert(Target and Target.Count > 0, "\233\128\154\231\148\168\229\174\160\231\137\169\229\141\135\231\186\167\231\180\160\230\157\144\228\184\141\229\173\152\229\156\168\230\136\150\229\183\178\232\128\151\229\176\189")
        Content = ArmoryUtils:NewResourceItemContent(Target)
        Content.Count = 1
        Content.Uuid = AddContent.Uuid
        Content.Index = i
        Content.Exp = AddContent.Exp
      else
        Target = ArmoryUtils:GetPet(AddContent.Uuid)
        assert(Target, AddContent.Uuid .. "\239\188\140\232\191\153\228\184\170\229\174\160\231\137\169\230\149\176\230\141\174\229\183\178\231\187\143\229\164\177\230\149\136\228\186\134\239\188\140\232\175\183\230\141\162\230\150\176\229\143\183\229\142\187\230\181\139")
        Content = ArmoryUtils:NewPetItemContent(Target)
        Content.Index = i
      end
      self:ReInitSlotContent(Content)
    end
    self.PreConsumeList:Add(Content)
  end
  self:UpdatePreConsumeList(self.PreConsumeList)
  if self.Parent then
    self.Parent:SetContentSelected(AddContent, true)
  end
  local Delta = self:GetDeltaValue(Target)
  self:UpdateDetails(Delta)
end

function M:OnItemMinusBtnClick(DelContent)
  if not DelContent then
    return
  end
  self.PreConsumeList:Clear()
  local PreConsumeArray = self.ListWidgets
  for i, Widget in pairs(PreConsumeArray) do
    local Content = Widget.Content
    if Content.Index == DelContent.Index then
    else
      if Content.Index > DelContent.Index then
        Content.Index = Content.Index - 1
        self:ReInitSlotContent(Content)
      end
      self.PreConsumeList:Add(Content)
    end
  end
  for i = self.PreConsumeList:Num() + 1, PreConsumeCount do
    local EmptyContent = self:CreateSlotContent(i)
    EmptyContent.bEmpty = true
    self.PreConsumeList:Add(EmptyContent)
  end
  self.SelectedCount = self.SelectedCount - 1
  self:UpdatePreConsumeList(self.PreConsumeList)
  if self.Parent then
    self.Parent:SetContentSelected(DelContent, false)
  end
  self:UpdateAutoBtnState()
  if 0 == self.SelectedCount then
    self:InitDetails()
  else
    local Delta
    if not self:IsCommonResource(DelContent.Uuid) then
      Delta = -self:GetDeltaValue(ArmoryUtils:GetPet(DelContent.Uuid))
    else
      Delta = -DelContent.Exp
    end
    self:UpdateDetails(Delta)
  end
end

function M:FindSelectedContent(Uuid)
  local PreConsumeArray = self.ListWidgets
  for i, Widget in pairs(PreConsumeArray) do
    local Content = Widget.Content
    if Content.Uuid and Content.Uuid == Uuid then
      return Content
    end
  end
  return nil
end

function M:OnMinusStart(Content)
  if not self.MinusPressed then
    self.MinusPressed = true
    self.MinusPressTime = 0
    self.MinusContent = Content or self:GetCurrentContent()
    self.MinusTimer = self:AddTimer(LongPressTimerInterval, self.UpdateMinus, true, 0, nil, true)
    self:RemoveCurrentContent()
  end
end

function M:OnMinusEnd()
  if self.MinusPressed then
    self.MinusPressed = false
    if self.MinusTimer then
      self:RemoveTimer(self.MinusTimer)
      self.MinusTimer = nil
    end
  end
end

function M:UpdateMinus()
  if self.MinusPressed then
    self.MinusPressTime = self.MinusPressTime + LongPressTimerInterval
    if self.MinusPressTime >= LongPressThreshold then
      self:RemoveCurrentContent()
    end
  end
end

function M:RemoveCurrentContent()
  local Content = self.MinusContent
  DebugPrint("WBP_Armory_PetUpgrade_C:RemoveCurrentContent", Content)
  if not Content or not Content.Uuid then
    return
  end
  if Content and Content.Count and Content.Count <= 1 then
    self:OnMinusEnd()
  end
  if not self:IsCommonResource(Content.Uuid) then
    if self.MinusTimer then
      self:RemoveTimer(self.MinusTimer)
      self.MinusTimer = nil
    end
    self:OnItemMinusBtnClick(Content)
  else
    Content.Count = Content.Count - 1
    self:SetResourceCount(Content.Uuid, Content.Count)
    if Content.Count > 0 then
      Content.SelfWidget:SetCount(Content.Count)
      self:UpdateDetails(-Content.Exp)
    else
      self:OnItemMinusBtnClick(Content)
      if self.MinusTimer then
        self:RemoveTimer(self.MinusTimer)
        self.MinusTimer = nil
      end
    end
    self:UpdateAutoBtnState()
  end
end

function M:OnPlusStart(Content)
  if not self.PlusPressed then
    self.PlusPressed = true
    self.PlusPressTime = 0
    self.PlusContent = Content
    self.PlusTimer = self:AddTimer(LongPressTimerInterval, self.UpdatePlus, true, 0, nil, true)
    self:AddResource()
  end
end

function M:OnPlusEnd()
  if self.PlusPressed then
    if self.PlusTimer then
      self:RemoveTimer(self.PlusTimer)
      self.PlusTimer = nil
    end
    self.PlusPressed = false
    local PlusContent
  end
end

function M:UpdatePlus()
  if self.PlusPressed then
    self.PlusPressTime = self.PlusPressTime + LongPressTimerInterval
    if self.PlusPressTime >= LongPressThreshold then
      self:AddResource()
    end
  end
end

function M:AddResource()
  DebugPrint("WBP_Armory_PetUpgrade_C:AddResource")
  local PlusContent = self.PlusContent
  if not PlusContent then
    return
  end
  local CurContent = self:FindSelectedContent(PlusContent.Uuid)
  local emptyIndex
  local ConsumeContents = self:GetConsumeContents()
  for i = 1, self.PreConsumeCount do
    if not ConsumeContents[i].UnitId then
      emptyIndex = i
      break
    end
  end
  if not CurContent and emptyIndex then
    self:CopyItemToConsumeList(PlusContent)
    self:SetResourceCount(PlusContent.Uuid, 1)
  elseif not CurContent and not emptyIndex then
    return
  else
    if self:PreviewLevelMax() then
      if not self.bAutoSelecting then
        UIManager(self):ShowUITip(UIConst.Tip_CommonToast, GText("Max_Level_Achieved"), 1.5)
      end
      if self.PlusTimer then
        self:RemoveTimer(self.PlusTimer)
        self.PlusTimer = nil
      end
      return
    end
    if CurContent.Count < PlusContent.Count then
      CurContent.Count = CurContent.Count + 1
      CurContent.SelfWidget:SetCount(CurContent.Count)
      self:SetResourceCount(CurContent.Uuid, CurContent.Count)
      self:UpdateDetails(CurContent.Exp)
    end
  end
end

function M:ClearResourceCnt()
  for Uuid, _ in pairs(self.Parent.ContentMap) do
    if self:IsCommonResource(Uuid) then
      self:SetResourceCount(Uuid, 0)
    end
  end
end

function M:SetResourceCount(ResourceId, Cnt)
  local Content = self.Parent.ContentMap[ResourceId]
  DebugPrint("WBP_Armory_PetUpgrade_C:SetResourceCount", Cnt, Content, Content and Content.SelfWidget)
  if not Content or not Content.SelfWidget then
    return
  end
  local Widget = Content.SelfWidget
  local Num = Cnt > 0 and Cnt or nil
  Widget:SetSelectNum(Num)
  if Num and Num >= 1 then
    Widget:SetItemSelect(false)
  end
end

function M:GetCurrentContent()
  return self.CurrentWidget and self.CurrentWidget.Content
end

function M:UpdateAutoBtnState(bAutoSelect)
  self.Parent:SwitchAutoBtnState(bAutoSelect)
end

function M:GetDeltaValue(Target)
  if not Target then
    return 0
  end
  if Target.PetId then
    return MiscUtils.Int(Target:CalcProvideExp())
  else
    return Target.UseParam
  end
end

function M:UpdateDetails(Delta)
  if self.LevelUping then
    return
  end
  local Target = self.Target
  self.Parent.Btn_Enhance:ForbidBtn(0 == self.SelectedCount)
  self.IsPreviewLevelMax = false
  local BarExp = self.LastTotalExp + Delta
  local MaxLevel = Target:GetMaxLevel()
  local PreviewLevel = math.min(Target:GetPreviewLevelByExp(BarExp), MaxLevel)
  self.Num_Exp_Add:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  self.Num_Exp_Add:SetText("+" .. BarExp - Target.Exp)
  self.Num_Exp_Now:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  self.Num_Exp_Now:SetText(BarExp)
  local MaxExp = self:CalcRequiredExp(Target.Level, PreviewLevel)
  self.Num_Exp_Total:SetText(MaxExp)
  if PreviewLevel > Target.Level then
    self.Preview:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    self.Exp_Bar:SetVisibility(UIConst.VisibilityOp.Collapsed)
    if MaxLevel <= PreviewLevel then
      self:SetExpBar(MaxExp, MaxExp, self.Exp_Bar_Add)
      self.IsPreviewLevelMax = true
    else
      local PreviewExp = self:CalcRequiredExp(Target.Level, PreviewLevel - 1)
      self:SetExpBar(BarExp - PreviewExp, MaxExp - PreviewExp, self.Exp_Bar_Add)
    end
  else
    self.Exp_Bar:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    self.Preview:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self:SetExpBar(BarExp, MaxExp, self.Exp_Bar_Add)
  end
  self.Text_Level_Preview:SetText(PreviewLevel)
  self.LastTotalExp = BarExp
  return true
end

function M:CalcRequiredExp(CurrentLevel, ExpectLevel)
  local TotalExp = 0
  for Level = CurrentLevel, ExpectLevel do
    if Level >= self.Target:GetMaxLevel() then
      break
    end
    TotalExp = TotalExp + self.Target:LevelUpData(Level).PetLevelMaxExp
  end
  return TotalExp
end

function M:PreviewLevelMax()
  local Target = self.Target
  local LastLevel = Target:GetPreviewLevelByExp(self.LastTotalExp)
  local MaxLevel = Target:GetMaxLevel()
  if LastLevel >= MaxLevel then
    return true
  end
  return false
end

function M:OnAutoSelectClick(SelectContents)
  if self.bAutoSelecting then
    return
  end
  self:ClearListItems()
  self.bAutoSelecting = true
  for i, Content in pairs(SelectContents) do
    if Content.Uuid and not Content.IsLocked then
      if self:PreviewLevelMax() then
        break
      end
      if not self:IsCommonResource(Content.Uuid) then
        self:CopyItemToConsumeList(Content)
      else
        for j = 1, Content.Count do
          if self:PreviewLevelMax() then
            goto lbl_45
          end
          self.PlusContent = Content
          self:AddResource()
        end
        goto lbl_45
        break
      end
    end
    ::lbl_45::
  end
  if not self.Parent.bListExpand then
    self.ListView_Item:NavigateToIndex(0)
  end
  self.bAutoSelecting = false
  self:UpdateAutoBtnState(true)
end

function M:OnClearClick()
  if self.bClearing then
    return
  end
  self.bClearing = true
  self:ClearListItems()
  if not self.Parent.bListExpand then
    self.ListView_Item:NavigateToIndex(0)
  end
  self:UpdateAutoBtnState()
  self:InitDetails()
  self.bClearing = false
end

function M:ClearListItems()
  self.PreConsumeList:Clear()
  local PreConsumeArray = self.ListWidgets
  for i = PreConsumeCount, 1, -1 do
    local Content = PreConsumeArray[i].Content
    if self.Parent then
      self.Parent:SetContentSelected(Content, false)
    end
    local EmptyContent = self:CreateSlotContent(PreConsumeCount - i + 1)
    self.PreConsumeList:Add(EmptyContent)
  end
  self:UpdatePreConsumeList(self.PreConsumeList)
  self:ClearResourceCnt()
  self.SelectedCount = 0
  self.LastTotalExp = self.Target.Exp
end

function M:RevertLastSelect()
  local PreConsumeArray = self.ListWidgets
  local FinalContent = PreConsumeArray[self.SelectedCount].Content
  self:OnItemMinusBtnClick(FinalContent)
end

function M:InitDetails()
  local Target = self.Target
  self.LevelUping = false
  self.IsPreviewLevelMax = false
  self.LastTotalExp = Target.Exp
  self.Panel_Exp:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  self.Exp_Bar:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  self.Preview:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Text_Level_Now:SetText(Target.Level)
  local MaxExp = Target:GetMaxExp()
  self.Num_Exp_Add:SetText("")
  self.Num_Exp_Add:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Panel_Hint:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Text_Same:SetText(GText("Pet_LevelUp_CostToast"))
  self.Text_Level_Preview:SetText("")
  self:SetExpBar(0, MaxExp, self.Exp_Bar_Add)
  self.Parent.Btn_Enhance:ForbidBtn(0 == self.SelectedCount)
  if Target:IsMaxLevelBeforeBreak() then
    self.Num_Exp_Now:SetText("-")
    self.Num_Exp_Total:SetText("-")
    self:SetExpBar(MaxExp, MaxExp, self.Exp_Bar)
  else
    self.Num_Exp_Now:SetText(Target.Exp)
    self.Num_Exp_Total:SetText(MaxExp)
    self:SetExpBar(Target.Exp, MaxExp, self.Exp_Bar)
  end
end

function M:OnSortListSelectionsChanged(ItemIdx)
  self.Parent:OnFilterTagChanged(ItemIdx)
  local PreConsumeArray = self.ListWidgets
  for i, Widget in pairs(PreConsumeArray) do
    local Content = Widget.Content
    if self.Parent then
      self.Parent:SetContentSelected(Content, true)
    end
  end
end

function M:SetExpBar(Value, MaxValue, Bar)
  local BGSlot = UWidgetLayoutLibrary.SlotAsCanvasSlot(self.Image_Exp_BG)
  local MaxWidth = BGSlot:GetSize().X
  local Slot = UWidgetLayoutLibrary.SlotAsCanvasSlot(Bar)
  local Width = MaxValue > 0 and math.clamp(Value / MaxValue, 0, 1) * MaxWidth or MaxWidth
  local Size = Slot:GetSize()
  Size.X = Width
  Slot:SetSize(Size)
end

function M:GetConsumeIds()
  local PreConsumeArray = self.ListWidgets
  local ConsumeIds = {}
  for i = 1, self.SelectedCount do
    local Content = PreConsumeArray[i].Content
    if not self:IsCommonResource(Content.Uuid) then
      table.insert(ConsumeIds, Content.Uuid)
    end
  end
  return ConsumeIds
end

function M:GetConsumeResources()
  local ConsumeResources = {}
  local PreConsumeArray = self.ListWidgets
  for i, Widget in pairs(PreConsumeArray) do
    local Content = Widget.Content
    if self:IsCommonResource(Content.Uuid) then
      ConsumeResources[Content.UnitId] = Content.Count
    end
  end
  return ConsumeResources
end

function M:IsCommonResource(Uuid)
  if not Uuid then
    return false
  end
  return type(Uuid) == "number" and Uuid < 0
end

function M:OnExpandList(bExpandList, bRefreshList)
  if self.Parent then
    if self.Parent.bItemDetailsShowed then
      self.Parent:ShowItemDetails(false)
    end
    self.Parent:OnExpandList(bExpandList, bRefreshList)
    self.Parent:ReNavigateToListItem(false, true)
  end
end

function M:OnLevelUpInAnimFinished()
  self:AddTimer(1.5, function()
    self:PlayAnimation(self.LevelUp_Out)
  end, false, 0, nil, true)
end

function M:OnLevelUpOutAnimFinished()
  self.LevelUping = false
  self.Panel_Exp:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  self.Sort_Pet:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  if self.Parent then
    self.Parent:OnLevelUpAnimFinishedCallback()
  end
end

AssembleComponents(M)
return M
