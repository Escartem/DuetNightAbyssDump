require("UnLua")
require("DataMgr")
local WBP_InteractivePanel_C = Class("BluePrints.UI.BP_UIState_C")

function WBP_InteractivePanel_C:Initialize(Initializer)
  self.Super.Initialize(self)
  self.PickUpOwner = nil
  self.MouseWheelTime = 0
  self.bConstructed = false
  self.BattleInteractiveComp = {}
  self.PickAllInteractiveItem = nil
end

function WBP_InteractivePanel_C:Construct()
  self.Super.Construct(self)
  if self.bConstructed then
    return
  end
  self.bConstructed = true
  self.IsSetedKeyMap = false
  self.MergeActors = {}
  self.CurSelectedItem = nil
  self.ScrollBox_Interactive:ClearChildren()
  self.PlatformName = CommonUtils.GetDeviceTypeByPlatformName()
  rawset(self, "PriorityItemList", {})
  rawset(self, "PriorityLevelList", {})
  self.CurInputDeviceType = nil
  self:InitListenEvent()
end

function WBP_InteractivePanel_C:Destruct()
  self:ClearListenEvent()
  WBP_InteractivePanel_C.Super.Destruct(self)
end

function WBP_InteractivePanel_C:InitListenEvent()
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
  if IsValid(self.GameInputModeSubsystem) then
    self:RefreshOpInfoByInputDevice(self.GameInputModeSubsystem:GetCurrentInputType(), self.GameInputModeSubsystem:GetCurrentGamepadName())
  end
  if IsValid(self.GameInputModeSubsystem) then
    self.GameInputModeSubsystem.OnInputMethodChanged:Add(self, self.RefreshOpInfoByInputDevice)
  end
end

function WBP_InteractivePanel_C:ClearListenEvent()
  if IsValid(self.GameInputModeSubsystem) then
    self.GameInputModeSubsystem.OnInputMethodChanged:Remove(self, self.RefreshOpInfoByInputDevice)
  end
end

function WBP_InteractivePanel_C:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  if self.CurInputDeviceType == CurInputDevice then
    return
  end
  if self.CurSelectedItem then
    self.CurSelectedItem:UseGamePadStyle(CurInputDevice == ECommonInputType.Gamepad)
  end
  if CommonUtils.GetDeviceTypeByPlatformName(self) == "PC" then
    if CurInputDevice == ECommonInputType.MouseAndKeyboard then
      local ResourceIconPath = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Key/PC/T_Key_MouseScroll.T_Key_MouseScroll'"
      rawset(self, "LoadResourceID", nil)
      local Handle = UE4.UResourceLibrary.LoadObjectAsyncWithId(self, ResourceIconPath, {
        self,
        WBP_InteractivePanel_C.OnInteractiveTipIconLoadFinished
      })
      if Handle then
        rawset(self, "LoadResourceID", Handle.ResourceID)
      end
      if self.Panel_Capture then
        local CapturePanel = self.Panel_Capture:GetChildAt(0)
        if CapturePanel then
          CapturePanel.WS_Type:SetActiveWidgetIndex(0)
        end
      end
    else
      self:UpdateMouseGamePadImage(CurGamepadName)
    end
  end
  self.CurInputDeviceType = CurInputDevice
end

function WBP_InteractivePanel_C:Tick(MyGeometry, InDeltaTime)
  if self.MouseWheelTime > 0 then
    self.MouseWheelTime = self.MouseWheelTime - InDeltaTime
  end
  if self.bPressed and IsValid(self:GetCurrentInteractiveItem()) and (self:GetCurrentInteractiveItem():IsLocked() or self:GetCurrentInteractiveItem():IsForbidden(UGameplayStatics.GetPlayerCharacter(self, 0))) then
    self:ReleasedSelectAction()
  end
end

function WBP_InteractivePanel_C:ReceiveExitState(StackAction)
  self.Super.ReceiveExitState(self, StackAction)
end

function WBP_InteractivePanel_C:AddNormalInteractiveItem(InItem)
  local ExistedItem, bMerge = self:CheckItemDataExist(InItem)
  if ExistedItem then
    ExistedItem:ReAdd()
    if bMerge then
      assert(self.MergeActors[InItem.MergeName], "\230\137\190\228\184\141\229\136\176\229\183\178\231\187\143\229\173\152\229\156\168\231\154\132\229\144\136\229\185\182\228\186\164\228\186\146" .. InItem.MergeName)
      self.MergeActors[InItem.MergeName]:AddMergeList(InItem:GetOwner():GetName(), InItem)
    end
    return
  end
  if InItem.MergeName == nil then
    self:AddUIItem(InItem)
    return InItem
  else
    local Ret
    if self.MergeActors[InItem.MergeName] == nil then
      local UnitSpawnPath = UE4.UClass.Load("/Game/BluePrints/Item/Chest/MergeMechanism.MergeMechanism")
      local MergeActor = self:GetWorld():SpawnActor(UnitSpawnPath, FTransform(), UE4.ESpawnActorCollisionHandlingMethod.AlwaysSpawn)
      self.MergeActors[InItem.MergeName] = MergeActor
      MergeActor.BP_MergeInteractiveComponent.TemplateInteractiveComponent = InItem
      MergeActor.BP_MergeInteractiveComponent:SetInteractiveName(InItem:GetInteractiveName())
      MergeActor.BP_MergeInteractiveComponent.MergeActorName = InItem.MergeName
      MergeActor.BP_MergeInteractiveComponent.ListPriority = 0
      self:AddUIItem(MergeActor.BP_MergeInteractiveComponent)
      Ret = MergeActor.BP_MergeInteractiveComponent
    end
    self.MergeActors[InItem.MergeName]:AddMergeList(InItem:GetOwner():GetName(), InItem)
    return Ret
  end
end

function WBP_InteractivePanel_C:AddBattleInteractiveItem(InItem)
  local HasDuplicateKey = false
  for _, Comp in ipairs(self.BattleInteractiveComp) do
    if Comp == InItem then
      HasDuplicateKey = true
    end
  end
  if not HasDuplicateKey then
    table.insert(self.BattleInteractiveComp, InItem)
    return InItem
  end
end

function WBP_InteractivePanel_C:RemoveBattleInteractiveItem(InItem)
  local IndexToRemove = -1
  for i, Item in ipairs(self.BattleInteractiveComp) do
    if Item == InItem then
      IndexToRemove = i
    end
  end
  if -1 ~= IndexToRemove then
    self:ReleasedSelectAction()
    table.remove(self.BattleInteractiveComp, IndexToRemove)
    if 0 == #self.BattleInteractiveComp then
      local CapturePanel = self.Panel_Capture:GetChildAt(0)
      if CapturePanel then
        CapturePanel:UnbindAllFromAnimationFinished(CapturePanel.Out)
        CapturePanel:BindToAnimationFinished(CapturePanel.Out, {
          self,
          function()
            self.WidgetSwitcher:SetActiveWidget(self.Panel_Interactive)
          end
        })
        CapturePanel:PlayAnimation(CapturePanel.Out)
      end
    end
  end
end

function WBP_InteractivePanel_C:AddInteractiveItem(InItem)
  if not InItem then
    return
  end
  local NewItem
  local Priority = InItem.Priority or "Normal"
  if "Battle" == Priority then
    NewItem = self:AddBattleInteractiveItem(InItem)
  else
    NewItem = self:AddNormalInteractiveItem(InItem)
  end
  if NewItem then
    self:PostChangeInteractiveBtn(NewItem, Priority)
  end
end

function WBP_InteractivePanel_C:AddUIItem(InItem)
  local UIManager = UIManager(self)
  assert(UIManager, "Can't get UIManager")
  local InteractiveItem = UIManager:GetWidgetFromPreload("InteractiveItem")
  InteractiveItem = InteractiveItem or UIManager:_CreateWidgetNew("InteractiveItem")
  InteractiveItem:InitInteractiveInfo(InItem)
  local Index = self:GetIndexByPriority(InteractiveItem)
  local TmpItemList = {}
  for i = Index, self.ScrollBox_Interactive:GetChildrenCount() - 1 do
    local Item = self.ScrollBox_Interactive:GetChildAt(i)
    table.insert(TmpItemList, Item)
  end
  local Slot = self.ScrollBox_Interactive:AddChild(InteractiveItem)
  Slot:SetHorizontalAlignment(UE4.EHorizontalAlignment.HAlign_Left)
  for i = 1, #TmpItemList do
    rawset(TmpItemList[i], "bSkipDestruct", true)
    Slot = self.ScrollBox_Interactive:AddChild(TmpItemList[i])
    rawset(TmpItemList[i], "bSkipDestruct", false)
    Slot:SetHorizontalAlignment(UE4.EHorizontalAlignment.HAlign_Left)
  end
  if 0 == Index then
    self:SelectFirstItem()
  end
  if CommonUtils.GetDeviceTypeByPlatformName(self) == "PC" then
    if self.ScrollBox_Interactive:GetChildrenCount() > 1 then
      self.Img_Mouse:SetVisibility(UE4.ESlateVisibility.HitTestInvisible)
    else
      self.Img_Mouse:SetVisibility(UE4.ESlateVisibility.Collapsed)
    end
  end
end

function WBP_InteractivePanel_C:GetIndexByPriority(InItem)
  local ItemPriorityLevel = InItem:GetInteractivePriority()
  local ListIndex = -1
  if self.PriorityItemList[ItemPriorityLevel] == nil then
    self.PriorityItemList[ItemPriorityLevel] = {InItem}
    table.insert(self.PriorityLevelList, ItemPriorityLevel)
    table.sort(self.PriorityLevelList, function(a, b)
      return b < a
    end)
    ListIndex = ListIndex + 1
  else
    table.insert(self.PriorityItemList[ItemPriorityLevel], InItem)
    ListIndex = ListIndex + #self.PriorityItemList[ItemPriorityLevel]
  end
  for _, Level in ipairs(self.PriorityLevelList) do
    if Level > ItemPriorityLevel then
      ListIndex = ListIndex + #self.PriorityItemList[Level]
    else
      break
    end
  end
  return ListIndex
end

function WBP_InteractivePanel_C:InteractiveItemPlayAnim(InItem, AnimName)
  if not InItem then
    return
  end
  local Priority = InItem.Priority or "Normal"
  if "Out" == AnimName and "Battle" == Priority then
    self:RemoveBattleInteractiveItem(InItem)
  end
  local ExistedItem = self:CheckItemDataExist(InItem)
  if not ExistedItem then
    return
  end
  if ExistedItem == self.CurSelectedItem then
    self:ReleasedSelectAction(false)
  end
  if InItem.MergeName == nil then
    self:PlayItemAnimation(InItem, AnimName)
  else
    local MergeActor = self.MergeActors[InItem.MergeName]
    if MergeActor and MergeActor:DeleteMergeList(InItem:GetOwner():GetName()) then
      self:PlayItemAnimation(MergeActor.BP_MergeInteractiveComponent, AnimName)
    end
  end
end

function WBP_InteractivePanel_C:PlayItemAnimation(InItem, AnimName, bNormalPlay)
  for i = 0, self.ScrollBox_Interactive:GetChildrenCount() - 1 do
    local InteractiveItem = self.ScrollBox_Interactive:GetChildAt(i)
    if InteractiveItem.InteractiveInfo == InItem then
      if not bNormalPlay then
        InteractiveItem:PlayInteractiveItemAnim(AnimName)
        break
      end
      InteractiveItem:PlayAnimation(InteractiveItem:GetAnimation(AnimName))
      break
    end
  end
end

function WBP_InteractivePanel_C:RemoveInteractiveItem(InItem)
  self:InteractiveItemPlayAnim(InItem, "Out")
end

function WBP_InteractivePanel_C:AddPickAllInteractiveItem()
  if self.PickAllInteractiveItem then
    self.PickAllInteractiveItem:ReAdd()
    return
  end
  local UIManager = UIManager(self)
  assert(UIManager, "Can't get UIManager")
  local InteractiveItem = UIManager:GetWidgetFromPreload("InteractiveItem")
  InteractiveItem = InteractiveItem or UIManager:_CreateWidgetNew("InteractiveItem")
  InteractiveItem:InitPickAllInfo()
  local InsertIndex = self:GetIndexByPriority(InteractiveItem)
  local TempItemList = {}
  for i = InsertIndex, self.ScrollBox_Interactive:GetChildrenCount() - 1 do
    local Item = self.ScrollBox_Interactive:GetChildAt(i)
    table.insert(TempItemList, Item)
  end
  local Slot = self.ScrollBox_Interactive:AddChild(InteractiveItem)
  Slot:SetHorizontalAlignment(UE4.EHorizontalAlignment.HAlign_Left)
  for i = 1, #TempItemList do
    rawset(TempItemList[i], "bSkipDestruct", true)
    Slot = self.ScrollBox_Interactive:AddChild(TempItemList[i])
    rawset(TempItemList[i], "bSkipDestruct", false)
    Slot:SetHorizontalAlignment(UE4.EHorizontalAlignment.HAlign_Left)
  end
  if 0 == InsertIndex then
    self:SelectFirstItem()
  end
  self.PickAllInteractiveItem = InteractiveItem
end

function WBP_InteractivePanel_C:RemovePickAllInteractiveItem()
  if not self.PickAllInteractiveItem then
    return
  end
  if not self.PickAllInteractiveItem:IsAnimationPlaying(self.PickAllInteractiveItem.Out) then
    self.PickAllInteractiveItem:PlayAnimation(self.PickAllInteractiveItem.Out)
    rawset(self, "bRemoveingPickUpAllItem", true)
  end
end

function WBP_InteractivePanel_C:CanDoAction()
  if not self.CurSelectedItem and 0 == #self.BattleInteractiveComp then
    return false
  elseif self.CurSelectedItem then
    return self.CurSelectedItem:CanDoAction()
  end
  return true
end

function WBP_InteractivePanel_C:GetCurrentInteractiveItem()
  if #self.BattleInteractiveComp > 0 then
    return self.BattleInteractiveComp[1]
  end
  return self.CurSelectedItem.InteractiveInfo
end

function WBP_InteractivePanel_C:PressedSelectAction(bFromItem)
  if not self:CanDoAction() then
    return
  end
  if self.bPressed then
    return
  end
  self.TouchStartTime = UGameplayStatics.GetTimeSeconds(self)
  self.bPressed = true
  if IsValid(self:GetCurrentInteractiveItem()) then
    self.bCurrentForbid = self:GetCurrentInteractiveItem():IsForbidden(UGameplayStatics.GetPlayerCharacter(self, 0))
    self.bCurrentLocked = self:GetCurrentInteractiveItem():IsLocked()
    self:GetCurrentInteractiveItem():BtnPressed(UE4.UGameplayStatics.GetPlayerCharacter(self, 0))
  end
  if self.CurSelectedItem and 0 == #self.BattleInteractiveComp then
    self.CurSelectedItem:PlayPressAnim()
  end
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_confirm", nil, nil)
  if self.CurInputDeviceType == ECommonInputType.Gamepad then
    local CapturePanel = self.Panel_Capture:GetChildAt(0)
    if CapturePanel and self:GetCurrentInteractiveItem().Capturing then
      CapturePanel.Key_Controller:OnButtonPressed(nil, true, 0, 2.5)
    end
  end
end

function WBP_InteractivePanel_C:ReleasedSelectAction(bFromItem)
  if not self.CurSelectedItem and 0 == #self.BattleInteractiveComp then
    self.bCurrentForbid = false
    self.bCurrentLocked = false
    return
  end
  if not self.bPressed then
    self.bCurrentForbid = false
    self.bCurrentLocked = false
    return
  end
  self.bPressed = false
  if self.CurSelectedItem and not self.CurSelectedItem:CanDoAction() then
    self.bCurrentForbid = false
    self.bCurrentLocked = false
    return
  end
  local CurTime = UGameplayStatics.GetTimeSeconds(self)
  if IsValid(self:GetCurrentInteractiveItem()) then
    self:GetCurrentInteractiveItem():BtnReleased(UE4.UGameplayStatics.GetPlayerCharacter(self, 0), CurTime - self.TouchStartTime)
  end
  if self.CurSelectedItem and 0 == #self.BattleInteractiveComp then
    self.CurSelectedItem:PlayReleaseAnim()
  end
  if not bFromItem then
    self:TryClickItem(CurTime)
  end
  if self.CurSelectedItem and 0 == #self.BattleInteractiveComp then
    self.CurSelectedItem.Tag_New:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
  self.bCurrentForbid = false
  self.bCurrentLocked = false
  if self.CurInputDeviceType == ECommonInputType.Gamepad then
    local CapturePanel = self.Panel_Capture:GetChildAt(0)
    if CapturePanel then
      CapturePanel.Key_Controller:OnButtonReleased()
    end
  end
end

function WBP_InteractivePanel_C:ClickSelectAction()
  if not self:CanDoAction() then
    return
  end
  local CurTime = UGameplayStatics.GetTimeSeconds(self)
  self:TryClickItem(CurTime)
  if self.CurSelectedItem and 0 == #self.BattleInteractiveComp then
    self.CurSelectedItem.Tag_New:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
end

function WBP_InteractivePanel_C:HoveredSelectAction(InUIItem)
  if not InUIItem then
    return
  end
  self:SelectSpecifiedItem(InUIItem)
end

function WBP_InteractivePanel_C:TryClickItem(CurTime)
  if not UIManager(self):TryOpenSystem("InteractiveItem") then
    return
  end
  if IsValid(self:GetCurrentInteractiveItem()) then
    if 0 == #self.BattleInteractiveComp and self.bCurrentForbid or self.bCurrentLocked then
      self.CurSelectedItem:PlayInteractiveItemAnim("Click")
    else
      self:GetCurrentInteractiveItem():BtnClicked(UE4.UGameplayStatics.GetPlayerCharacter(self, 0), self.bPressed and CurTime - self.TouchStartTime or 0)
    end
  end
  self:OnItemClicked()
end

function WBP_InteractivePanel_C:OnItemClicked()
  if not self.bUploadCD then
    self.bUploadCD = true
    self:AddTimer(1, function()
      self.bUploadCD = false
    end)
    local Avatar = GWorld:GetAvatar()
    local CurrentRegionId = 0
    if Avatar then
      CurrentRegionId = Avatar.CurrentRegionId
    end
    if IsValid(self:GetCurrentInteractiveItem()) then
      local InteractiveObjId
      local InteractiveObjPosition = UGameplayStatics.GetPlayerCharacter(self, 0):K2_GetActorLocation()
      local InteractiveOwner = self:GetCurrentInteractiveItem():GetOwner()
      if InteractiveOwner then
        if InteractiveOwner.UnitType and InteractiveOwner.UnitId then
          InteractiveObjId = InteractiveOwner.UnitType .. "_" .. tostring(InteractiveOwner.UnitId)
        end
        InteractiveObjPosition = InteractiveOwner:K2_GetActorLocation()
      end
      HeroUSDKSubsystem():UploadTrackLog_Lua("event_interaction", {
        map_id = WorldTravelSubsystem():GetCurrentSceneId(),
        sub_region_id = CurrentRegionId,
        interaction_id = tostring(self:GetCurrentInteractiveItem().CommonUIConfirmID) or "0",
        interaction_type = self:GetCurrentInteractiveItem():GetName(),
        position = tostring(InteractiveObjPosition),
        interaction_object_id = InteractiveObjId or "null"
      })
    elseif self.CurSelectedItem == self.PickAllInteractiveItem then
      local Player = UGameplayStatics.GetPlayerCharacter(self, 0)
      if Player then
        HeroUSDKSubsystem():UploadTrackLog_Lua("event_interaction", {
          map_id = WorldTravelSubsystem():GetCurrentSceneId(),
          sub_region_id = CurrentRegionId,
          interaction_id = "0",
          interaction_type = "PickUpAll",
          position = tostring(Player:K2_GetActorLocation()),
          interaction_object_id = "null"
        })
      end
      self:RemovePickAllInteractiveItem()
      self.IsPickingAllInteractiveItem = true
      self.ScrollBox_Interactive.Slot:SetVerticalAlignment(EVerticalAlignment.VAlign_Top)
      self:DoPickUpAllPickUpItems()
    end
  end
end

function WBP_InteractivePanel_C:GetCanPickUpItems()
  local TmpItemList = {}
  for i = 0, self.ScrollBox_Interactive:GetChildrenCount() - 1 do
    if not self.PickUpAllList then
      self.PickAllItemList = {}
    end
    local EntryItem = self.ScrollBox_Interactive:GetChildAt(i)
    if not self.PickAllItemList[EntryItem] and EntryItem:IsPickUpItemWithOneClick() then
      self.PickAllItemList[EntryItem] = true
      table.insert(TmpItemList, 1, EntryItem)
    end
  end
  return TmpItemList
end

function WBP_InteractivePanel_C:DoPickUpAllPickUpItems()
  self.TouchStartTime = -1
  self.bPressed = false
  local TmpItemList = self:GetCanPickUpItems()
  local DelayTime = 0.1
  for i = 1, #TmpItemList do
    rawset(TmpItemList[i], "bPickAll", true)
    self:AddTimer(DelayTime * i, function()
      TmpItemList[i]:OnInteractiveItemClicked()
    end)
  end
  local ClickAnimationTime = 0.3
  self:AddTimer(DelayTime * #TmpItemList + ClickAnimationTime, function()
    self.IsPickingAllInteractiveItem = false
    self.ScrollBox_Interactive.Slot:SetVerticalAlignment(EVerticalAlignment.VAlign_Center)
    local CanPickUpItems = self:GetCanPickUpItems()
    if #CanPickUpItems > 1 and not self.IsPickingAllInteractiveItem then
      self:AddPickAllInteractiveItem()
    else
      self:SelectFirstItem()
    end
  end)
end

function WBP_InteractivePanel_C:SelectFirstItem()
  self:AddDelayFrameFunc(function()
    if self.ScrollBox_Interactive:GetChildrenCount() <= 0 then
      self.CurSelectedItem = nil
      return
    end
    if CommonUtils.GetDeviceTypeByPlatformName(self) == "Mobile" then
      self:ReleasedSelectAction()
      self.CurSelectedItem = nil
      return
    end
    self:SelectSpecifiedItem(self.ScrollBox_Interactive:GetChildAt(0))
  end, 2)
end

function WBP_InteractivePanel_C:SelectSpecifiedItem(InUIItem, bSelectBattleItem)
  if not bSelectBattleItem and #self.BattleInteractiveComp > 0 then
    return
  end
  if not InUIItem then
    return
  end
  if -1 == self.ScrollBox_Interactive:GetChildIndex(InUIItem) then
    return
  end
  if InUIItem == self.CurSelectedItem then
    return
  end
  if IsValid(self.CurSelectedItem) then
    self.CurSelectedItem:SelectEntryItem(false, self.CurInputDeviceType == ECommonInputType.Gamepad)
    self:ReleasedSelectAction(true)
  end
  InUIItem:SelectEntryItem(true, self.CurInputDeviceType == ECommonInputType.Gamepad)
  self.CurSelectedItem = InUIItem
end

function WBP_InteractivePanel_C:UpSelectAction()
  if self.bPressed then
    return
  end
  if 0 == self.ScrollBox_Interactive:GetChildrenCount() then
    return
  end
  if self.MouseWheelTime > 0 then
    return
  end
  local CurSelectIndex = 0
  for i = 0, self.ScrollBox_Interactive:GetChildrenCount() - 1 do
    if self.ScrollBox_Interactive:GetChildAt(i) == self.CurSelectedItem then
      CurSelectIndex = i
    end
  end
  self.MouseWheelTime = 0.1
  if CurSelectIndex > 0 then
    CurSelectIndex = CurSelectIndex - 1
  end
  self:SelectSpecifiedItem(self.ScrollBox_Interactive:GetChildAt(CurSelectIndex))
  self.ScrollBox_Interactive:ScrollWidgetIntoView(self.ScrollBox_Interactive:GetChildAt(CurSelectIndex), true)
end

function WBP_InteractivePanel_C:DownSelectAction()
  if self.bPressed then
    return
  end
  if 0 == self.ScrollBox_Interactive:GetChildrenCount() then
    return
  end
  if self.MouseWheelTime > 0 then
    return
  end
  local CurSelectIndex = 0
  for i = 0, self.ScrollBox_Interactive:GetChildrenCount() - 1 do
    if self.ScrollBox_Interactive:GetChildAt(i) == self.CurSelectedItem then
      CurSelectIndex = i
    end
  end
  self.MouseWheelTime = 0.1
  if CurSelectIndex < self.ScrollBox_Interactive:GetChildrenCount() - 1 then
    CurSelectIndex = CurSelectIndex + 1
  end
  self:SelectSpecifiedItem(self.ScrollBox_Interactive:GetChildAt(CurSelectIndex))
  self.ScrollBox_Interactive:ScrollWidgetIntoView(self.ScrollBox_Interactive:GetChildAt(CurSelectIndex), true)
end

function WBP_InteractivePanel_C:CheckItemDataExist(InItem)
  local function CheckFunction(InInteractiveItem)
    for i = 0, self.ScrollBox_Interactive:GetChildrenCount() - 1 do
      if self.ScrollBox_Interactive:GetChildAt(i).InteractiveInfo == InInteractiveItem then
        return self.ScrollBox_Interactive:GetChildAt(i)
      end
    end
    return false
  end
  
  if InItem.MergeName then
    local MergeActor = self.MergeActors[InItem.MergeName]
    if MergeActor then
      return CheckFunction(MergeActor.BP_MergeInteractiveComponent), true
    end
    return false
  end
  return CheckFunction(InItem)
end

function WBP_InteractivePanel_C:PostChangeInteractiveBtn(InteractiveInfo, Priority)
  if 0 == #self.BattleInteractiveComp then
    self.WidgetSwitcher:SetActiveWidget(self.Panel_Interactive)
    if not self.PickAllInteractiveItem then
      local PickItemCount = 0
      for i = 0, self.ScrollBox_Interactive:GetChildrenCount() - 1 do
        local InteractiveItem = self.ScrollBox_Interactive:GetChildAt(i)
        if InteractiveItem:IsPickUpItemWithOneClick() then
          PickItemCount = PickItemCount + 1
        end
      end
      if PickItemCount > 1 and not self.IsPickingAllInteractiveItem then
        self:AddPickAllInteractiveItem()
      else
        self:RemovePickAllInteractiveItem()
      end
    else
      local PickUpItemCount = 0
      for i = 0, self.ScrollBox_Interactive:GetChildrenCount() - 1 do
        if self.ScrollBox_Interactive:GetChildAt(i):IsPickUpItemWithOneClick() then
          PickUpItemCount = PickUpItemCount + 1
        end
      end
      if PickUpItemCount < 2 and not self.IsPickingAllInteractiveItem then
        self:RemovePickAllInteractiveItem()
      elseif rawget(self, "bRemoveingPickUpAllItem") then
        self:AddPickAllInteractiveItem()
      end
    end
    if self.ScrollBox_Interactive:GetChildrenCount() > 0 and (self.CurSelectedItem == nil or self.CurSelectedItem.InteractiveInfo == InteractiveInfo) and not self.IsPickingAllInteractiveItem then
      self:SelectFirstItem()
    elseif self.ScrollBox_Interactive:GetChildrenCount() <= 0 then
      self.CurSelectedItem = nil
    end
  elseif self.WidgetSwitcher:GetActiveWidget() ~= self.Panel_Capture then
    self.WidgetSwitcher:SetActiveWidget(self.Panel_Capture)
    self:InitCapturePanel()
  end
  self:SetKeyMap(0 ~= self.ScrollBox_Interactive:GetChildrenCount() or #self.BattleInteractiveComp > 0)
  if CommonUtils.GetDeviceTypeByPlatformName(self) == "PC" then
    if self.ScrollBox_Interactive:GetChildrenCount() > 1 and not self.IsPickingAllInteractiveItem then
      self.Img_Mouse:SetVisibility(UE4.ESlateVisibility.HitTestInvisible)
    else
      self.Img_Mouse:SetVisibility(UE4.ESlateVisibility.Collapsed)
    end
  end
end

function WBP_InteractivePanel_C:SetKeyMap(IsSet)
  if IsSet == self.IsSetedKeyMap then
    return
  end
  self.IsSetedKeyMap = IsSet
  if IsSet then
    self:ListenForInputAction("UpSelect", EInputEvent.IE_Pressed, true, {
      self,
      self.UpSelectAction
    })
    self:ListenForInputAction("DownSelect", EInputEvent.IE_Pressed, true, {
      self,
      self.DownSelectAction
    })
    self:ListenForInputAction("Interactive", EInputEvent.IE_Pressed, true, {
      self,
      self.PressedSelectAction
    })
    self:ListenForInputAction("Interactive", EInputEvent.IE_Released, true, {
      self,
      self.ReleasedSelectAction
    })
  else
    self:StopListeningForAllInputActions()
  end
end

function WBP_InteractivePanel_C:TryClose()
  if not self:CheckNeedUnload() then
    return
  end
  self:Close()
end

function WBP_InteractivePanel_C:CheckNeedUnload()
  return 0 == self.ScrollBox_Interactive:GetChildrenCount() and 0 == #self.BattleInteractiveComp
end

function WBP_InteractivePanel_C:Close()
  local UIManager = UIManager(self)
  assert(UIManager, "Can't get UIManager")
  for i = 0, self.ScrollBox_Interactive:GetChildrenCount() - 1 do
    local InteractiveItem = self.ScrollBox_Interactive:GetChildAt(i)
    UIManager:RecycleWidgetToPreload("InteractiveItem", InteractiveItem)
  end
  self.ScrollBox_Interactive:ClearChildren()
  self.Super.Close(self)
end

function WBP_InteractivePanel_C:OnInteractiveItemRemoveAnimFinish(InInteractiveItem)
  if self.PickAllItemList then
    self.PickAllItemList[InInteractiveItem] = nil
  end
  local UIManager = UIManager(self)
  assert(UIManager, "Can't get UIManager")
  UIManager:RecycleWidgetToPreload("InteractiveItem", InInteractiveItem)
  self:OnInteractiveChildRemoved(InInteractiveItem)
  self.ScrollBox_Interactive:RemoveChild(InInteractiveItem)
  if IsValid(InInteractiveItem.InteractiveInfo) and InInteractiveItem.InteractiveInfo.MergeActorName then
    local MergeActor = self.MergeActors[InInteractiveItem.InteractiveInfo.MergeActorName]
    if MergeActor then
      MergeActor:K2_DestroyActor()
      self.MergeActors[InInteractiveItem.InteractiveInfo.MergeActorName] = nil
    end
  end
  self:SetInteractiveItemBtnDisplayed(InInteractiveItem, false)
  self:PostChangeInteractiveBtn(InInteractiveItem.InteractiveInfo, InInteractiveItem.InteractiveInfo)
  self:TryClose()
  if InInteractiveItem == self.PickAllInteractiveItem then
    self.PickAllInteractiveItem = nil
    rawset(self, "bRemoveingPickUpAllItem", false)
  end
  InInteractiveItem.InteractiveInfo = nil
end

function WBP_InteractivePanel_C:SetInteractiveItemBtnDisplayed(InInteractiveItem, bDisplay)
  if not IsValid(InInteractiveItem.InteractiveInfo) then
    return
  end
  InInteractiveItem.InteractiveInfo:SetBtnDisplayed(UE4.UGameplayStatics.GetPlayerCharacter(self, 0), bDisplay)
end

function WBP_InteractivePanel_C:OnInteractiveChildRemoved(InInteractiveItem)
  if not IsValid(InInteractiveItem) then
    return
  end
  if not InInteractiveItem.IsPickUpAllItem and not IsValid(InInteractiveItem.InteractiveInfo) then
    return
  end
  local ItemPriorityLevel = InInteractiveItem:GetInteractivePriority()
  if 1 == #self.PriorityItemList[ItemPriorityLevel] then
    self.PriorityItemList[ItemPriorityLevel] = nil
    for i, Level in ipairs(self.PriorityLevelList) do
      if Level == ItemPriorityLevel then
        table.remove(self.PriorityLevelList, i)
        break
      end
    end
  else
    local Index = 0
    for i, v in ipairs(self.PriorityItemList[ItemPriorityLevel]) do
      if v == InInteractiveItem then
        Index = i
        break
      end
    end
    table.remove(self.PriorityItemList[ItemPriorityLevel], Index)
  end
end

function WBP_InteractivePanel_C:InitCapturePanel()
  local CapturePanel = self.Panel_Capture:GetChildAt(0)
  local IsPC = CommonUtils.GetDeviceTypeByPlatformName(CapturePanel) == "PC"
  local WidgetName = ""
  if IsPC then
    WidgetName = "InteractiveCapturePC"
  else
    WidgetName = "InteractiveCaptureMobile"
  end
  if not CapturePanel then
    CapturePanel = self:CreateWidgetNew(WidgetName)
    CapturePanel.Btn_Capture.OnPressed:Add(self, self.PressedSelectAction)
    CapturePanel.Btn_Capture.OnClicked:Add(self, self.ClickSelectAction)
    CapturePanel.Btn_Capture.OnReleased:Add(self, self.ReleasedSelectAction)
    CapturePanel.IsPC = IsPC
    if not IsPC and CapturePanel.Text_Progress then
      CapturePanel.Text_Progress:SetText(GText("CAPTURE_LONGPRESS"))
      CapturePanel.Text_Percent:SetVisibility(ESlateVisibility.Collapsed)
    end
    self.Panel_Capture:AddChild(CapturePanel)
  end
  if not CapturePanel then
    return
  end
  CapturePanel.Root:SetRenderOpacity(1)
  if IsPC then
    CapturePanel.Text_Tips:SetText(GText("CAPTURE_LONGPRESS"))
    local CaptureButtonNameIndex = CommonUtils:GetActionMappingKeyName("Interactive")
    local CaptureButtonName = CommonUtils:GetKeyText(CaptureButtonNameIndex)
    CapturePanel.Text_Button:SetText(CaptureButtonName)
    CapturePanel.Key_Controller:CreateCommonKey({
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "Y"}
      },
      bLongPress = true,
      bButton = true
    })
    if self.CurInputDeviceType == ECommonInputType.MouseAndKeyboard then
      CapturePanel.WS_Type:SetActiveWidgetIndex(0)
    else
      CapturePanel.WS_Type:SetActiveWidgetIndex(1)
    end
  end
  CapturePanel:UnbindAllFromAnimationFinished(CapturePanel.In)
  CapturePanel:BindToAnimationFinished(CapturePanel.In, {
    self,
    function()
      CapturePanel:PlayAnimation(CapturePanel.Loop, 0, 0)
    end
  })
  CapturePanel:PlayAnimation(CapturePanel.In)
  CapturePanel:PauseAnimation(CapturePanel.Loop, 0, 0)
  AudioManager(self):PlayUISound(self, "event:/ui/common/catch_hud_show", nil, nil)
end

function WBP_InteractivePanel_C:TryDoCapture(InteractiveTime)
  local CapturePanel = self.Panel_Capture:GetChildAt(0)
  if not CapturePanel then
    return
  end
  if CapturePanel:IsAnimationPlaying(CapturePanel.ProgressTest) then
    return
  end
  if not CapturePanel.IsPC and CapturePanel.Text_Progress then
    if CapturePanel.SpendTime and CapturePanel.SpendTime <= 0 then
      CapturePanel.TotalTime = InteractiveTime
      CapturePanel.SpendTime = 0.001
      DebugPrint("WPSWPSWPS")
      CapturePanel:StartCapture()
      self:AddTimer(0.1, function()
        if not IsValid(CapturePanel) then
          return
        end
        CapturePanel.SpendTime = CapturePanel.SpendTime + 0.1
        local Percent = math.floor(CapturePanel.SpendTime / InteractiveTime * 100)
        CapturePanel.Text_Progress:SetText(Percent)
        CapturePanel.Text_Percent:SetVisibility(ESlateVisibility.Visibility)
      end, true, 0, "MobileCaptureUpdateText")
    end
    return
  end
  local Speed = CapturePanel.ProgressTest:GetEndTime() / InteractiveTime
  CapturePanel:PlayAnimation(CapturePanel.ProgressTest, 0, 0, EUMGSequencePlayMode.Forward, Speed, false)
end

function WBP_InteractivePanel_C:OnCaptureSuccess()
  local CapturePanel = self.Panel_Capture:GetChildAt(0)
  if not CapturePanel then
    return
  end
  if CapturePanel:IsAnimationPlaying(CapturePanel.Success) then
    return
  end
  CapturePanel:UnbindAllFromAnimationFinished(CapturePanel.Success)
  CapturePanel:BindToAnimationFinished(CapturePanel.Success, {
    self,
    function()
      self.WidgetSwitcher:SetActiveWidget(self.Panel_Interactive)
    end
  })
  self:StopAllAnimations()
  CapturePanel:PlayAnimation(CapturePanel.Success)
  if not CapturePanel.IsPC then
    self:RemoveTimer("MobileCaptureUpdateText")
  end
end

function WBP_InteractivePanel_C:StopCapture()
  local CapturePanel = self.Panel_Capture:GetChildAt(0)
  if not CapturePanel then
    return
  end
  CapturePanel:StopAnimation(CapturePanel.ProgressTest)
  if not CapturePanel.IsPC and CapturePanel.Text_Progress then
    CapturePanel.Text_Progress:SetText(GText("CAPTURE_LONGPRESS"))
    CapturePanel.Text_Percent:SetVisibility(ESlateVisibility.Collapsed)
    CapturePanel.TotalTime = 0
    CapturePanel.SpendTime = -1
    CapturePanel:StopCapture()
    self:RemoveTimer("MobileCaptureUpdateText")
  end
end

function WBP_InteractivePanel_C:UpdateInteractiveItemState(InteractiveComponent)
  for i = 0, self.ScrollBox_Interactive:GetChildrenCount() - 1 do
    local InteractiveItem = self.ScrollBox_Interactive:GetChildAt(i)
    if InteractiveItem.InteractiveInfo == InteractiveComponent then
      InteractiveItem:UpdateInteractiveItemState()
      break
    end
  end
end

function WBP_InteractivePanel_C:UpdateMouseGamePadImage(CurGamepadName)
  local ResourceIconPath = UIUtils.UtilsGetKeyIconPathInGamepad("Vertical", CurGamepadName)
  rawset(self, "LoadResourceID", nil)
  local Handle = UE4.UResourceLibrary.LoadObjectAsyncWithId(self, ResourceIconPath, {
    self,
    WBP_InteractivePanel_C.OnInteractiveTipIconLoadFinished
  })
  if Handle then
    rawset(self, "LoadResourceID", Handle.ResourceID)
  end
  local CapturePanel = self.Panel_Capture:GetChildAt(0)
  if CapturePanel then
    CapturePanel.WS_Type:SetActiveWidgetIndex(1)
  end
end

function WBP_InteractivePanel_C:OnInteractiveTipIconLoadFinished(Object, ResourceID)
  if not Object or rawget(self, "LoadResourceID") ~= ResourceID then
    return
  end
  self.Img_Mouse:SetBrushFromTexture(Object)
end

return WBP_InteractivePanel_C
