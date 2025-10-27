require("UnLua")
local AttrModel = require("BluePrints.UI.UI_PC.Experience.WBP_Experience_Attr_Model")
local WBP_Experience_Main_C = Class("BluePrints.UI.BP_UIState_C")

function WBP_Experience_Main_C:ReceiveEnterState(StackAction)
  self.Super.ReceiveEnterState(self, StackAction)
end

function WBP_Experience_Main_C:ReceiveExitState(StackAction)
  self.Super.ReceiveExitState(self, StackAction)
  if 1 == StackAction then
    if self.IsHome then
      self:PlayNPCAnim(21000502)
    else
      UIManager(self):SwitchUINpcCamera(false, "ExperienceMain", self.NpcId, {
        bDestroyNpc = true,
        IsHaveInOutAnim = self.IsNeedPlayNpcAnim
      })
    end
  end
end

function WBP_Experience_Main_C:PlayBaiAnim()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  self:EnableTickWhenPaused(true)
  self.IsHome = Avatar:CheckSubRegionType(nil, CommonConst.SubRegionType.Home)
  if self.IsHome then
    self:SwitchCamera()
    self:PlayNPCAnim(21000501)
  else
    UIManager(self):SwitchUINpcCamera(true, "ExperienceMain", self.NpcId, {
      IsHaveInOutAnim = self.IsNeedPlayNpcAnim
    })
  end
end

function WBP_Experience_Main_C:EnableTickWhenPaused(Value)
  local TweenActor = UE4.ALTweenActor.GetLTweenInstance(self:GetWorld())
  if Value then
    if TweenActor then
      TweenActor:SetTickableWhenPaused(true)
    end
    UE4.UGameplayStatics.GetPlayerController(self, 0).bShouldPerformFullTickWhenPaused = true
  else
    if TweenActor then
      TweenActor:SetTickableWhenPaused(false)
    end
    UE4.UGameplayStatics.GetPlayerController(self, 0).bShouldPerformFullTickWhenPaused = false
  end
end

function WBP_Experience_Main_C:PlayNPCAnim(NpcAnimId)
  local PlayNPC = UE4.ANpcCharacter.GetNpc(self, self.NpcId)
  if PlayNPC then
    if PlayNPC.NPCNameWidgetComponent then
      local NameWidget = PlayNPC.NPCNameWidgetComponent:GetWidget()
      if NameWidget then
        NameWidget:SetVisibility(UE4.ESlateVisibility.Collapsed)
      end
    end
    if PlayNPC.BubbleWidgetComponent then
      local BubbleWidget = PlayNPC.BubbleWidgetComponent:GetWidget()
      if BubbleWidget then
        BubbleWidget:SetVisibility(UE4.ESlateVisibility.Collapsed)
      end
    end
    PlayNPC:PlayUITalkAction(NpcAnimId)
  end
end

function WBP_Experience_Main_C:SwitchCamera(bPlayer)
  local PlayerController = UGameplayStatics.GetPlayerController(self, 0)
  if bPlayer then
    if IsValid(self.CameraHandle) then
      ULTweenBPLibrary.KillIfIsTweening(self, self.CameraHandle)
    end
    local PlayerCharacter = UGameplayStatics.GetPlayerCharacter(self, 0)
    if PlayerCharacter then
      PlayerCharacter:SetActorHideTag("ExperienceMain", false)
    end
  else
    local ShopCamera = UGameplayStatics.GetActorOfClass(self, self.CameraClass)
    if ShopCamera then
      ShopCamera.Camera:K2_SetRelativeLocation(ShopCamera.DefaultLocation, false, nil, false)
      PlayerController:SetViewTargetWithBlend(ShopCamera, 0, EViewTargetBlendFunction.VTBlend_Linear, 0, false)
      self:MoveCamera(ShopCamera.Camera)
    end
    local PlayerCharacter = UGameplayStatics.GetPlayerCharacter(self, 0)
    if PlayerCharacter then
      PlayerCharacter:SetActorHideTag("ExperienceMain", true)
    end
  end
end

function WBP_Experience_Main_C:MoveCamera(Camera)
  local StartPosition = Camera.RelativeLocation
  local EndPosition = FVector(0)
  self.CameraHandle = ULTweenBPLibrary.Vector3To(self, {
    self,
    function(_, Value)
      Camera:K2_SetRelativeLocation(Value, false, nil, false)
    end
  }, StartPosition, EndPosition, 0.5, 0, 17)
end

function WBP_Experience_Main_C:Construct()
  self.Super.Construct(self)
  self.WrapBox_Buff:ClearChildren()
  self.SwitchHeight = 275
  self.bShoulFocusToLastFocusedWidget = false
  self.NpcId = 910003
  self.IsNeedPlayNpcAnim = true
  self.NeedShowTip = false
  self.Magnification = 0.94
  self.ChangeSpeedSlow = 5
  self.ChangeSpeedFast = 10
  self.ScrollBox:ClearChildren()
  self.ScrollBox:SetControlScrollbarInside(false)
  self.List_Item:DisableScroll(true)
  self.ListView_Promote:SetScrollBarVisibility(ESlateVisibility.Hidden)
  self.ListView_Promote:SetControlScrollbarInside(true)
  self.EMMenuAnchor_Item.OnGetMenuContentEvent:Bind(self, self.OnAnchorGetUserMenuContent)
  self.EMMenuAnchor_Item.OnMenuOpenChanged:Clear()
  self.EMMenuAnchor_Item.OnMenuOpenChanged:Add(self, self.OnMenuOpenChanged)
  self.BtnReward:BindEventOnClicked(self, self.OnBtnRewardClicked)
  self.Btn_L.Btn.OnClicked:Add(self, self.OnBtnLClicked)
  self.Btn_R.Btn.OnClicked:Add(self, self.OnBtnRClicked)
  self:InitNormalInfo()
  self:InitScrollBox()
  self:InitWidgetInfoInGamePad()
  self:InitBtn()
  self:InitCommonTab()
  AudioManager(self):PlayUISound(self, "event:/ui/armory/open", "ExperienceMainOpenSound", nil)
  self:PlayAnimation(self.In)
  self.IsInSelectState = false
  self.IsInTipState = false
  if IsValid(self.GameInputModeSubsystem) then
    self:RefreshOpInfoByInputDevice(self.GameInputModeSubsystem:GetCurrentInputType(), self.GameInputModeSubsystem:GetCurrentGamepadName())
  end
  self.Text_Desc:SetText(GText("UI_Player_LevelReward_Title1"))
  self.Text_Desc_1:SetText(GText("UI_Player_LevelReward_Title2"))
  EventManager:AddEvent(EventID.OnPlayerLevelUp, self, self.RefreshLevelInfo)
  AudioManager(self):SetEventSoundParam(self, "EnergySupplyOpen", {ToEnd = 1})
end

function WBP_Experience_Main_C:Destruct()
  self.Super.Destruct(self)
  self.WrapBox_Buff:ClearChildren()
  AudioManager(self):StopSound(self, "ExperienceMainOpenSound")
  self:RemoveTimer("ExperienceMainScrollBoxUserScrolledEnd")
  self.EMMenuAnchor_Item.OnMenuOpenChanged:Remove(self, self.OnMenuOpenChanged)
  EventManager:RemoveEvent(EventID.OnPlayerLevelUp, self)
end

function WBP_Experience_Main_C:RefreshLevelInfo()
  self:InitNormalInfo()
  self:RefreshItemInfo()
  self:UpdateBtnState()
  self:UpdateBuffInfo()
end

function WBP_Experience_Main_C:OnLoaded(...)
  self.Super.OnLoaded(self, ...)
  self:PlayBaiAnim()
end

function WBP_Experience_Main_C:InitCommonTab()
  self.TabConfigData = {
    TitleName = GText("UI_Player_Level_Reward"),
    LeftKey = "Q",
    RightKey = "E",
    DynamicNode = {"Back", "BottomKey"},
    StyleName = "Text",
    OwnerPanel = self,
    BackCallback = self.OnClickBack,
    BottomKeyInfo = {
      {
        GamePadInfoList = {
          {Type = "Img", ImgShortPath = "LS"}
        },
        Desc = GText("UI_Controller_CheckReward"),
        bLongPress = false
      },
      {
        KeyInfoList = {
          {
            Type = "Text",
            Text = "Esc",
            ClickCallback = self.OnClickBack,
            Owner = self
          }
        },
        GamePadInfoList = {
          {Type = "Img", ImgShortPath = "B"}
        },
        Desc = GText("UI_BACK"),
        bLongPress = false
      }
    }
  }
  self.Com_Tab:Init(self.TabConfigData, false)
end

function WBP_Experience_Main_C:InitNormalTab()
  local BottomKeyInfo = {
    {
      KeyInfoList = {
        {
          Type = "Text",
          Text = "Esc",
          ClickCallback = self.OnClickBack,
          Owner = self
        }
      },
      GamePadInfoList = {
        {Type = "Img", ImgShortPath = "B"}
      },
      Desc = GText("UI_BACK"),
      bLongPress = false
    }
  }
  if self.NeedShowTip then
    table.insert(BottomKeyInfo, 1, {
      GamePadInfoList = {
        {Type = "Img", ImgShortPath = "RV"}
      },
      Desc = GText("UI_Controller_Slide"),
      bLongPress = false
    })
  end
  if self.Com_Tab.UpdateBottomKeyInfo then
    self.Com_Tab:UpdateBottomKeyInfo(BottomKeyInfo, false)
  end
end

function WBP_Experience_Main_C:InitSelectTab()
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
          ClickCallback = self.OnClickBack,
          Owner = self
        }
      },
      GamePadInfoList = {
        {Type = "Img", ImgShortPath = "B"}
      },
      Desc = GText("UI_BACK"),
      bLongPress = false
    }
  }
  self.Com_Tab:UpdateBottomKeyInfo(BottomKeyInfo, false)
end

function WBP_Experience_Main_C:InitItemTipOpenTab()
  if self.CurInputDeviceType == ECommonInputType.Gamepad then
    local BottomKeyInfo = {}
    self.Com_Tab:UpdateBottomKeyInfo(BottomKeyInfo, false)
  end
end

function WBP_Experience_Main_C:InitTipOpenTab()
  local BottomKeyInfo = {
    {
      KeyInfoList = {
        {
          Type = "Text",
          Text = "Esc",
          ClickCallback = self.OnClickBack,
          Owner = self
        }
      },
      GamePadInfoList = {
        {Type = "Img", ImgShortPath = "B"}
      },
      Desc = GText("UI_CTL_CloseTips"),
      bLongPress = false
    }
  }
  self.Com_Tab:UpdateBottomKeyInfo(BottomKeyInfo, false)
end

function WBP_Experience_Main_C:InitNormalInfo(...)
  self.Text_Tips:SetText(GText("PlayerLv_Now"))
  self.Text_EXTips:SetText(GText("PlayerLevel_ExpNow"))
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    self.Text_LvNum:SetText(Avatar.Level)
    local CurrentExp = Avatar.Exp
    local CurrentLevel = Avatar.Level
    local LevelInfo = DataMgr.PlayerLevelUp[CurrentLevel]
    local MaxExp
    if LevelInfo then
      MaxExp = LevelInfo.PlayerLevelMaxExp
    end
    if CurrentExp then
      self.Text_EXNum:SetText(tostring(CurrentExp))
    end
    if MaxExp then
      self.Text_EXNumMax:SetText(tostring(MaxExp))
    end
  end
  local NumMax = 0
  for Index, LevelInfo in pairs(DataMgr.PlayerLevelUp) do
    NumMax = NumMax + 1
  end
  self.NumMax = NumMax
  self.Text_LvNumMax:SetText("/" .. self.NumMax)
  if self.Text_Title then
    self.Text_Title:SetText(GText("UI_Player_Level_Reward"))
  end
  self.WBP_Com_BtnLockCondition:SetText(GText("PlayerLv_Insufficient"))
  self.Img_Pitchon:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.BtnReward:SetText(GText("UI_Achievement_GetReward"))
  self.Text_Btn:SetText(GText("UI_Reward_Received"))
end

function WBP_Experience_Main_C:InitScrollBox()
  self.ScrollBox.OnUserScrolled:Add(self, self.OnUserScrolled)
  self.ScrollBox.OnMouseButtonUp:Add(self, self.ScrollBoxOnMouseButtonUp)
  self.ChangeSpeed = 5
  if not self.ScrollBoxSizeX then
    local CanvasSlot = UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(self.ScrollBox)
    self.ScrollBoxSizeX = CanvasSlot:GetSize().X
  end
  self.ScrollBox:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  local LevelInfos = {}
  for Index, LevelInfo in pairs(DataMgr.PlayerLevelUp) do
    table.insert(LevelInfos, {
      PlayerLevel = LevelInfo.PlayerLevel
    })
  end
  table.sort(LevelInfos, function(A, B)
    return A.PlayerLevel < B.PlayerLevel
  end)
  self:AddSpaceItem()
  for Index, LevelInfo in ipairs(LevelInfos) do
    local Obj = self:CreateWidgetNew("ExperienceItem")
    if not self.ItemSizeX then
      local CanvasSlot = UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(Obj.Panel)
      self.ItemSizeX = CanvasSlot:GetSize().X
    end
    if not self.SumDistance then
      self:CalculateSumDistance()
    end
    Obj:Init(Index, LevelInfo.PlayerLevel, self)
    Obj:BindEventOnClicked(self, self.UpdateSelectedInfo, Obj)
    self.ScrollBox:AddChild(Obj)
  end
  self:AddSpaceItem()
  self:AddTimer(0.001, function()
    local AllChildren = self.ScrollBox:GetAllChildren()
    for i = 1, AllChildren:Length() do
      local ChildItem = AllChildren:GetRef(i)
      if ChildItem.Index then
        local Distance = self:GetDistance(ChildItem.Index)
        local Magnification = self:GetMagnification(Distance)
        ChildItem:SetMagnification(Magnification)
      end
    end
    self.ScrollBox:SetScrollOffset(0)
    self.ScrollBox:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    self:PlayAnimationForward(self.In)
    self:SelectFirstItem()
  end)
end

function WBP_Experience_Main_C:AddSpaceItem()
  local Obj = self:CreateWidgetNew("ExperienceItem")
  Obj:InitSpace(self.ScrollBoxSizeX, self)
  self.ScrollBox:AddChild(Obj)
end

function WBP_Experience_Main_C:CalculateSumDistance()
  self.SumDistance = (self.NumMax - 1) * self.ItemSizeX
end

function WBP_Experience_Main_C:GetDistance(Index, CurrentOffset)
  CurrentOffset = CurrentOffset or self.ScrollBox:GetScrollOffset()
  local EndOffset = self.ScrollBox:GetScrollOffsetOfEnd()
  local CurrentDistance = self.SumDistance / EndOffset * CurrentOffset
  local IndexDistance = (Index - 1) * self.ItemSizeX
  return CurrentDistance - IndexDistance
end

function WBP_Experience_Main_C:GetMagnification(Distance)
  if Distance < 0 then
    Distance = -Distance
  end
  if not self.Fa then
    self.Fa = (self.Magnification - 1) / (self.ItemSizeX / 2)
    self.Fb = 1
  end
  return self.Fa * Distance + self.Fb
end

function WBP_Experience_Main_C:SelectFirstItem()
  local Avatar = GWorld:GetAvatar()
  local TargetIndex = 1
  local FirstItem
  if Avatar then
    TargetIndex = Avatar.Level
  end
  local AllChildren = self.ScrollBox:GetAllChildren()
  for i = 1, AllChildren:Length() do
    local ChildItem = AllChildren:GetRef(i)
    if ChildItem.Index and ChildItem.CanGet and not ChildItem.IsGot then
      FirstItem = ChildItem
      break
    end
  end
  FirstItem = FirstItem or AllChildren:GetRef(TargetIndex + 1)
  self.CanPlayNumChangeSound = false
  FirstItem:OnCellClicked(nil, nil, true)
  self.CanPlayNumChangeSound = true
end

function WBP_Experience_Main_C:SelectItem(Index)
  local Item = self.ScrollBox:GetChildAt(Index)
  if Item then
    Item:OnCellClicked()
  end
end

function WBP_Experience_Main_C:GetTargetIndex(Offset)
  local EndOffset = self.ScrollBox:GetScrollOffsetOfEnd()
  local EachItemOffset = EndOffset / (self.NumMax - 1)
  return math.floor((Offset + EachItemOffset / 2) / EachItemOffset) + 1
end

function WBP_Experience_Main_C:GetTargetOffset(Offset)
  local TargetIndex = self:GetTargetIndex(Offset)
  return self:GetTargetOffsetByIndex(TargetIndex)
end

function WBP_Experience_Main_C:GetTargetOffsetByIndex(Index)
  local EndOffset = self.ScrollBox:GetScrollOffsetOfEnd()
  return (Index - 1) * (EndOffset / (self.NumMax - 1))
end

function WBP_Experience_Main_C:OnUserScrolled(CurrentOffset)
  self:ScrolledTo(CurrentOffset, false)
  if not self.DragScrollBox then
    self:AddTimer(0.3, self.ScrollBoxOnMouseButtonUp, false, 0, "ExperienceMainScrollBoxUserScrolledEnd", true)
  end
end

function WBP_Experience_Main_C:ScrolledTo(CurrentOffset, isAutoScroll)
  local AllChildren = self.ScrollBox:GetAllChildren()
  for i = 1, AllChildren:Length() do
    local ChildItem = AllChildren:GetRef(i)
    if ChildItem.Index then
      local Distance = self:GetDistance(ChildItem.Index, CurrentOffset)
      local Magnification = self:GetMagnification(Distance)
      ChildItem:SetMagnification(Magnification)
    end
  end
  if false == isAutoScroll then
    local TargetIndex = self:GetTargetIndex(CurrentOffset)
    if self.SelectedItem.Index ~= TargetIndex then
      local Item = self.ScrollBox:GetChildAt(TargetIndex)
      if Item then
        Item:OnCellClicked(nil, true)
      end
    end
  end
end

function WBP_Experience_Main_C:ScrollBoxOnMouseButtonUp(Geometry, MouseEvent)
  self.DragScrollBox = false
  self.ScrollBox:EndInertialScrolling()
  local CurrentOffset = self.ScrollBox:GetScrollOffset()
  local TargetIndex = self:GetTargetIndex(CurrentOffset)
  if self.SelectedItem.Index ~= TargetIndex then
    self:SelectItem(TargetIndex)
  else
    local TargetOffset = self:GetTargetOffsetByIndex(TargetIndex)
    self:ScrollToTargetOffset(CurrentOffset, TargetOffset, self.ChangeSpeedSlow)
  end
end

function WBP_Experience_Main_C:ScrollToTargetOffset(CurrentOffset, TargetOffset, ChangeSpeed)
  self.ScrollBox:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  self.LerpAlpha = 0
  self.ScrollTimer = self:AddTimer(0.033, function(_, DeltaTime)
    self.LerpAlpha = self.LerpAlpha + ChangeSpeed * DeltaTime
    if self.LerpAlpha >= 1 then
      self.LerpAlpha = 1
      self.ScrollBox:SetScrollOffset(TargetOffset)
      self:ScrolledTo(TargetOffset)
      self.ScrollBox:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
      self:RemoveTimer(self.ScrollTimer)
      self.ScrollTimer = nil
      return
    end
    local Offset = UE4.UKismetMathLibrary.Lerp(CurrentOffset, TargetOffset, self.LerpAlpha)
    self.ScrollBox:SetScrollOffset(Offset)
    self:ScrolledTo(Offset)
  end, true, 0, "UpdateOffset", true, 0.033)
end

function WBP_Experience_Main_C:OnKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local IsEventHandled = false
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) then
    if InKeyName == UIConst.GamePadKey.LeftThumb then
      IsEventHandled = true
      local RewardItemUIs = self.List_Item:GetDisplayedEntryWidgets()
      if not RewardItemUIs[1]:HasAnyUserFocus() then
        self:EnterSelectMode("Reward")
      else
        self:LeaveSelectMode()
      end
    elseif InKeyName == UIConst.GamePadKey.SpecialLeft then
      IsEventHandled = true
      self:EnterSelectMode("Walnut")
    elseif InKeyName == UIConst.GamePadKey.FaceButtonTop then
      local Index = self.Switcher_Btn:GetActiveWidgetIndex()
      if 0 == Index and not self.IsInSelectState and not self.IsInTipState then
        IsEventHandled = true
        self:OnBtnRewardClicked()
      end
    elseif InKeyName == UIConst.GamePadKey.FaceButtonBottom then
      if not self.IsInSelectState and not self.IsInTipState then
        IsEventHandled = true
      end
    elseif InKeyName == UIConst.GamePadKey.FaceButtonLeft then
      if not self.IsInSelectState and not self.IsInTipState then
        IsEventHandled = true
        self:ClickEXBtn()
      end
    elseif InKeyName == UIConst.GamePadKey.FaceButtonRight then
      if self.IsInSelectState then
        IsEventHandled = true
        self:LeaveSelectMode()
      end
      if not IsEventHandled then
        if self.IsInTipState then
          self:LeaveTipMode()
        else
          self:OnReturnKeyDown()
        end
      end
    elseif InKeyName == UIConst.GamePadKey.LeftShoulder then
      if not self.IsInSelectState and not self.IsInTipState then
        IsEventHandled = true
        self:OnBtnLClicked()
      end
    elseif InKeyName == UIConst.GamePadKey.RightShoulder and not self.IsInSelectState and not self.IsInTipState then
      IsEventHandled = true
      self:OnBtnRClicked()
    end
  elseif "Escape" == InKeyName then
    IsEventHandled = true
    self:OnReturnKeyDown()
  end
  if IsEventHandled then
    return UE4.UWidgetBlueprintLibrary.Handled()
  else
    return UE4.UWidgetBlueprintLibrary.UnHandled()
  end
end

function WBP_Experience_Main_C:OnReturnKeyDown()
  self:OnClickBack(true)
end

function WBP_Experience_Main_C:OnClickBack(Sound)
  if self:IsAnimationPlaying(self.In) then
    return
  end
  if Sound then
    UIUtils.PlayCommonBtnSe(self)
  end
  self:PlayOutAnim()
end

function WBP_Experience_Main_C:PlayOutAnim()
  if self:IsAnimationPlaying(self.Out) then
    return
  end
  self:BindToAnimationFinished(self.Out, {
    self,
    self.Close
  })
  AudioManager(self):SetEventSoundParam(self, "ExperienceMainOpenSound", {ToEnd = 1})
  self:PlayAnimationForward(self.Out)
  self:SwitchCamera(true)
  self:DoRecoverCamera()
end

function WBP_Experience_Main_C:Close()
  self.Super.Close(self)
  self.ScrollBox:ClearChildren()
end

function WBP_Experience_Main_C:UpdateSelectedInfo(ExperienceItem, Speed, isDragSelect, IsFirstTime)
  Speed = Speed or self.ChangeSpeedSlow
  if self.SelectedItem then
    self.SelectedItem:UnSelected()
  end
  self.SelectedItem = ExperienceItem
  self.SelectedItem:Selected()
  local CurrentOffset = self.ScrollBox:GetScrollOffset()
  local TargetOffset = self:GetTargetOffsetByIndex(self.SelectedItem.Index)
  if true ~= isDragSelect then
    self:ScrollToTargetOffset(CurrentOffset, TargetOffset, Speed)
  end
  self:UpdateBuffInfo(IsFirstTime)
  self:UpdateNodeInfo()
  self:UpdateRewardInfo()
  self:AddTimer(0.01, function()
    self:OnRefreshListLater()
    self.List_Item:ScrollToTop()
  end, false, 0, "OnRefreshListLater", true)
  self:UpdateArrow()
  self:StopAnimation(self.Refresh)
  self:PlayAnimation(self.Refresh)
end

function WBP_Experience_Main_C:UpdateBtnState()
  if self.SelectedItem.IsGot then
    self.Switcher_Btn:SetActiveWidgetIndex(2)
  elseif self.SelectedItem.CanGet then
    self.Switcher_Btn:SetActiveWidgetIndex(0)
  else
    self.Switcher_Btn:SetActiveWidgetIndex(1)
  end
end

function WBP_Experience_Main_C:UpdateRewardInfo()
  self:UpdateBtnState()
  local Rewards = {
    DataMgr.PlayerLevelUp[self.SelectedItem.Level].PlayerLevelReward
  }
  self.List_Item:ClearListItems()
  for _, RewardId in pairs(Rewards) do
    local RewardInfo = DataMgr.Reward[RewardId]
    if RewardInfo then
      local Ids = RewardInfo.Id or {}
      local RewardCount = RewardInfo.Count or {}
      local TableName = RewardInfo.Type or {}
      for i = 1, #Ids do
        local Content = NewObject(UIUtils.GetCommonItemContentClass())
        local ItemId = Ids[i]
        Content.UIName = "ExperienceMain"
        Content.IsShowDetails = true
        Content.Id = ItemId
        Content.Count = RewardUtils:GetCount(RewardCount[i])
        local ItemData = DataMgr[TableName[i]][ItemId]
        Content.Icon = ItemData.Icon
        Content.Rarity = ItemUtils.GetItemRarity(ItemId, TableName[i])
        Content.ItemType = TableName[i]
        Content.ParentWidget = self
        Content.bHasGot = self.SelectedItem.IsGot ~= nil
        Content.OnMenuOpenChangedEvents = {
          Obj = self,
          Callback = self.MenuOpenChangedEvent
        }
        Content.OnFocusReceivedEvent = {
          Obj = self,
          Callback = function()
            self:OnAddedToFocusPathEvent()
          end
        }
        self.List_Item:AddItem(Content)
      end
    end
  end
end

function WBP_Experience_Main_C:UpdateNodeInfo()
  local LevelInfos = DataMgr.PlayerLevelUp
  local LevelInfo = LevelInfos[self.SelectedItem.Level]
  if LevelInfo and LevelInfo.NodeType then
    self.Switch_promote:SetActiveWidgetIndex(1)
    local ClassPath = "/Game/UI/UI_PC/Common/Common_Item_subsize_PC_Content.Common_Item_subsize_PC_Content_C"
    self.ListView_Promote:ClearListItems()
    for Index, Type in ipairs(LevelInfo.NodeType) do
      local Content = NewObject(UE4.LoadClass(ClassPath))
      Content.Root = self
      Content.Index = Index
      Content.Type = Type
      Content.Title = LevelInfo.NodeTitle[Index]
      Content.Content = LevelInfo.NodeContent[Index] or {}
      Content.Level = self.SelectedItem.Level
      self.ListView_Promote:AddItem(Content)
    end
    self:AddTimer(0.1, function()
      local AllEntryHeight = 0
      local DisplayedEntries = self.ListView_Promote:GetDisplayedEntryWidgets()
      for i = 1, DisplayedEntries:Length() do
        local Entry = DisplayedEntries:GetRef(i)
        local EntryHeight = Entry:GetDesiredSize().Y
        AllEntryHeight = AllEntryHeight + EntryHeight
      end
      if AllEntryHeight > self.SwitchHeight then
        self.NeedShowTip = true
      else
        self.NeedShowTip = false
      end
      self:InitNormalTab()
    end, false, 0, "UpdateNodeInfoTimer", true)
  else
    self.NeedShowTip = false
    self.Switch_promote:SetActiveWidgetIndex(0)
    local TargetLevel
    for Level, Info in ipairs(LevelInfos) do
      if Level > self.SelectedItem.Level and Info.NodeType then
        TargetLevel = Level
        break
      end
    end
    if TargetLevel then
      self.Com_EmptyBg:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
      local Text = string.format(GText("PlayerLevel_Toast_Locked"), TargetLevel)
      self.Com_EmptyBg.Text_Empty:SetText(Text)
    else
      self.Com_EmptyBg:SetVisibility(UIConst.VisibilityOp.Collapsed)
    end
    self:InitNormalTab()
  end
end

function WBP_Experience_Main_C:OnRefreshListLater()
  self.List_Item:RegenerateAllEntries()
  self.List_Item:SetRenderOpacity(0)
  self:AddTimer(0.1, function()
    self.List_Item:SetRenderOpacity(1)
    local DisplayedEntries = self.List_Item:GetDisplayedEntryWidgets()
    for i = 1, DisplayedEntries:Length() do
      local Entry = DisplayedEntries:GetRef(i)
      Entry:SetVisibility(UIConst.VisibilityOp.Visible)
      Entry:StopAllAnimations()
      Entry:PlayAnimation(Entry.In)
    end
  end, false, 0, "OnRefreshListLater", true)
end

function WBP_Experience_Main_C:UpdateArrow()
  if 1 == self.SelectedItem.Index then
    self.Btn_L:PlayAnimation(self.Btn_L.Grey)
    if self.Switcher_L then
      self.Switcher_L:SetVisibility(UIConst.VisibilityOp.Collapsed)
    else
      self.Btn_L:SetVisibility(UIConst.VisibilityOp.Collapsed)
    end
  else
    self.Btn_L:PlayAnimation(self.Btn_L.Normal)
    if self.Switcher_L then
      self.Switcher_L:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    else
      self.Btn_L:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    end
  end
  if self.SelectedItem.Index == self.NumMax then
    self.Btn_R:PlayAnimation(self.Btn_L.Grey)
    if self.Switcher_R then
      self.Switcher_R:SetVisibility(UIConst.VisibilityOp.Collapsed)
    else
      self.Btn_R:SetVisibility(UIConst.VisibilityOp.Collapsed)
    end
  else
    self.Btn_R:PlayAnimation(self.Btn_L.Normal)
    if self.Switcher_R then
      self.Switcher_R:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    else
      self.Btn_R:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    end
  end
end

function WBP_Experience_Main_C:OnBtnLClicked()
  local NextIndex = self.SelectedItem.Index - 1
  if NextIndex >= 1 then
    self:SelectItem(NextIndex)
  end
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_small", nil, nil)
end

function WBP_Experience_Main_C:OnBtnRClicked()
  local NextIndex = self.SelectedItem.Index + 1
  if NextIndex <= self.NumMax then
    self:SelectItem(NextIndex)
  end
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_small", nil, nil)
end

function WBP_Experience_Main_C:OnBtnRewardClicked()
  local Avatar = GWorld:GetAvatar()
  self.CanPlayNumChangeSound = false
  
  local function Callback(Rewards)
    self:RefreshItemInfo()
    self:RefreshReddotInfo()
    self:RefreshNextRewardInfo()
    UIUtils.ShowGetItemPageAndOpenBagIfNeeded(nil, nil, nil, Rewards, false, nil, self)
    self:AddTimer(0.1, function()
      self.CanPlayNumChangeSound = true
    end)
  end
  
  if Avatar then
    Avatar:GetAvatarLevelRewards(Callback, self.SelectedItem.Level)
  end
end

function WBP_Experience_Main_C:RefreshItemInfo()
  local AllChildren = self.ScrollBox:GetAllChildren()
  for i = 1, AllChildren:Length() do
    local ChildItem = AllChildren:GetRef(i)
    if ChildItem.Index then
      ChildItem:RefreshInfo()
    end
  end
end

function WBP_Experience_Main_C:RefreshNextRewardInfo()
  local StartIndex = self.SelectedItem.Index
  local AllChildren = self.ScrollBox:GetAllChildren()
  for i = 1, AllChildren:Length() do
    local ChildItem = AllChildren:GetRef(i)
    if ChildItem.Index and StartIndex < ChildItem.Index and ChildItem.CanGet and not ChildItem.IsGot then
      ChildItem:OnCellClicked()
      return
    end
  end
  self:UpdateRewardInfo()
end

function WBP_Experience_Main_C:RefreshReddotInfo()
  local CacheDetail = ReddotManager.GetLeafNodeCacheDetail("ExperienceItem")
  if CacheDetail[self.SelectedItem.Level] then
    local Count = 0
    for i = 1, self.SelectedItem.Level do
      if CacheDetail[i] then
        CacheDetail[i] = nil
        Count = Count + 1
      end
    end
    if Count > 0 then
      ReddotManager.DecreaseLeafNodeCount("ExperienceItem", Count)
    end
  end
end

function WBP_Experience_Main_C:TipsOut()
  if not self.EMMenuAnchor_Item:IsOpen() then
    return
  end
  self.EMMenuAnchor_Item:Close()
  self.Com_Tab:SetFocus()
end

function WBP_Experience_Main_C:OnAnchorGetUserMenuContent()
  if not IsValid(self.Bubble) then
    self.Bubble = UIManager(self):CreateWidget("/Game/UI/WBP/Guide/Widget/WBP_Guide_ContentBlock.WBP_Guide_ContentBlock")
    local CanvasSlot = UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(self.Bubble.Panel_Text)
    local Anchors = FAnchors()
    Anchors.Minimum = FVector2D(0.5, 0)
    Anchors.Maximum = FVector2D(0.5, 0)
    CanvasSlot:SetAnchors(Anchors)
  end
  return self.Bubble
end

function WBP_Experience_Main_C:OnMenuOpenChanged(IsOpened)
  if self.EMMenuAnchor_Item.bAllowHover then
    return
  end
  self:TipsChanged(IsOpened)
end

function WBP_Experience_Main_C:TipsChanged(IsOpened)
  if IsOpened then
    self.IsInTipState = true
    self.Img_Pitchon:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    self.Bubble:InitMessage(GText("UI_Toast_Experience_Content"), FVector2D(0, -1))
    self.Bubble:SetWidgetOpacity(1)
  else
    self.IsInTipState = false
    self.Img_Pitchon:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

function WBP_Experience_Main_C:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  self.CurInputDeviceType = CurInputDevice
  if CurInputDevice == ECommonInputType.Touch then
    return
  end
  local IsUseKeyAndMouse = CurInputDevice == ECommonInputType.MouseAndKeyboard
  self:UpdateUIStyleInPlatform(IsUseKeyAndMouse)
end

function WBP_Experience_Main_C:UpdateUIStyleInPlatform(IsUseKeyAndMouse)
  self.IsInSelectState = false
  self.IsInTipState = false
  if IsUseKeyAndMouse then
    self:InitKeyboardView()
    self:InitKeyboardVisibility()
    self.BtnReward:SetGamePadVisibility(UIConst.VisibilityOp.Collapsed)
  else
    self:InitGamepadView()
    self:InitGamepadVisibility()
    self:InitNormalTab()
    self.BtnReward:SetGamePadVisibility(UIConst.VisibilityOp.HitTestInvisible)
    if UIUtils.HasAnyFocus(self) then
      self.Com_Tab:SetFocus()
    end
  end
end

function WBP_Experience_Main_C:InitGamepadView()
  if self.Switcher_L then
    self.Switcher_L:SetActiveWidgetIndex(1)
  end
  if self.Switcher_R then
    self.Switcher_R:SetActiveWidgetIndex(1)
  end
  if self.KeyImg_EX then
    self.KeyImg_EX:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  end
  if self.Image_Check then
    self.Image_Check:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  if self.KeyImg_Promote then
    self.KeyImg_Promote:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  end
end

function WBP_Experience_Main_C:InitGamepadVisibility()
  self.ScrollBox:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  self.Switcher_Btn:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  self.List_Item:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  self.ListView_Promote:SetVisibility(ESlateVisibility.HitTestInvisible)
end

function WBP_Experience_Main_C:InitKeyboardView()
  if self.Switcher_L then
    self.Switcher_L:SetActiveWidgetIndex(0)
  end
  if self.Switcher_R then
    self.Switcher_R:SetActiveWidgetIndex(0)
  end
  if self.KeyImg_EX then
    self.KeyImg_EX:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  if self.Image_Check then
    self.Image_Check:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  end
  if self.KeyImg_Promote then
    self.KeyImg_Promote:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

function WBP_Experience_Main_C:InitKeyboardVisibility()
  self.ScrollBox:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  self.Switcher_Btn:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  self.List_Item:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  self.ListView_Promote:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
end

function WBP_Experience_Main_C:InitWidgetInfoInGamePad()
  self.WBP_Com_BtnLockCondition:SetGamepadIconVisibility(false)
  self.BtnReward:SetDefaultGamePadImg("Y")
  if self.KeyImg_L then
    self.KeyImg_L:CreateCommonKey({
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "LB"}
      }
    })
  end
  if self.KeyImg_R then
    self.KeyImg_R:CreateCommonKey({
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "RB"}
      }
    })
  end
  if self.KeyImg_EX then
    self.KeyImg_EX:CreateCommonKey({
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "X"}
      }
    })
  end
  if self.KeyImg_Promote then
    self.KeyImg_Promote:CreateCommonKey({
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "LS"}
      }
    })
  end
end

function WBP_Experience_Main_C:EnterSelectMode(Name)
  if self.IsInSelectState then
    return
  end
  if IsValid(self.GameInputModeSubsystem) then
    local EnterSuccess = false
    if "Reward" == Name then
      self.List_Item:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
      self.SelectedIndex = 0
      self.List_Item:NavigateToIndex(self.SelectedIndex)
      local Item = self.List_Item:GetItemAt(self.SelectedIndex)
      local Widget = Item.SelfWidget
      Widget:SetNavigationRuleCustom(EUINavigation.Left, {
        self,
        self.OnUINavigation
      })
      Widget:SetNavigationRuleCustom(EUINavigation.Right, {
        self,
        self.OnUINavigation
      })
      EnterSuccess = true
    elseif "Walnut" == Name and 1 == self.Switch_promote:GetActiveWidgetIndex() then
      local Contents = self.ListView_Promote:GetListItems()
      local TargetContent
      for _, Content in pairs(Contents) do
        if "Walnut" == Content.Type and Content.Entry then
          TargetContent = Content
        end
      end
      if TargetContent then
        self.ListView_Promote:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
        self.ListView_Promote:BP_NavigateToItem(TargetContent)
        local Widget = TargetContent.Entry
        Widget.List_UnlockItem:NavigateToIndex(0)
        EnterSuccess = true
      end
    end
    if EnterSuccess then
      self.bShoulFocusToLastFocusedWidget = true
      self:InitKeyboardView()
      self:InitSelectTab()
      self.BtnReward:SetGamePadVisibility(UIConst.VisibilityOp.Collapsed)
      self.IsInSelectState = true
      self.NeedOpenMenuWhenResoureFocused = false
      self:AllItemIconRefresh()
    end
  end
end

function WBP_Experience_Main_C:LeaveSelectMode()
  if not self.IsInSelectState then
    return
  end
  if IsValid(self.GameInputModeSubsystem) then
    self.bShoulFocusToLastFocusedWidget = false
    self.List_Item:SetVisibility(ESlateVisibility.HitTestInvisible)
    self.ListView_Promote:SetVisibility(ESlateVisibility.HitTestInvisible)
    self.Com_Tab:SetFocus()
    self:InitGamepadView()
    self:InitNormalTab()
    self.BtnReward:SetGamePadVisibility(UIConst.VisibilityOp.HitTestInvisible)
    self.IsInSelectState = false
    self:AllItemIconRefresh()
  end
end

function WBP_Experience_Main_C:MenuOpenChangedEvent(IsOpened)
  if ModController:IsMobile() then
    return
  end
  if IsOpened then
    self:InitItemTipOpenTab()
  else
    self:InitSelectTab()
  end
end

function WBP_Experience_Main_C:OnUINavigation(NavigationDirection)
  if NavigationDirection == EUINavigation.Left then
    return self:OnNavigationToIndex(self.SelectedIndex - 1)
  elseif NavigationDirection == EUINavigation.Right then
    return self:OnNavigationToIndex(self.SelectedIndex + 1)
  end
  return nil
end

function WBP_Experience_Main_C:OnNavigationToIndex(Index)
  local Item = self.List_item:GetItemAt(Index)
  if Item then
    local Widget = Item.SelfWidget
    Widget:SetNavigationRuleCustom(EUINavigation.Left, {
      self,
      self.OnUINavigation
    })
    Widget:SetNavigationRuleCustom(EUINavigation.Right, {
      self,
      self.OnUINavigation
    })
    self.SelectedIndex = Index
    return Widget
  end
  return nil
end

function WBP_Experience_Main_C:OnAddedToFocusPathEvent(Widget)
  if self.NeedOpenMenuWhenResoureFocused and Widget then
    Widget:OpenItemMenu()
  end
end

function WBP_Experience_Main_C:UpdateBuffInfo(IsFirstTime)
  local CurrentLevel = self.SelectedItem.Level
  local BuffId = DataMgr.PlayerLevelUp[CurrentLevel].PlayerBuffId
  local BuffLevel = DataMgr.PlayerLevelUp[CurrentLevel].PlayerBuffLevel
  local Avatar = GWorld:GetAvatar()
  local PlayerLevel = Avatar.Level
  local PlayerBuffId = DataMgr.PlayerLevelUp[PlayerLevel].PlayerBuffId
  local PlayerBuffLevel = DataMgr.PlayerLevelUp[PlayerLevel].PlayerBuffLevel
  local PlayerAttrName2Info = AttrModel:GetAttrName2Info(PlayerBuffId, PlayerBuffLevel)
  local PreLevel = self.SelectedItem.Level - 1
  if PreLevel <= 0 then
    PreLevel = CurrentLevel
  end
  local PreBuffId = DataMgr.PlayerLevelUp[PreLevel].PlayerBuffId
  local PreBuffLevel = DataMgr.PlayerLevelUp[PreLevel].PlayerBuffLevel
  local AttrName2Info = AttrModel:GetAttrName2Info(BuffId, BuffLevel) or {}
  local PreAttrName2Info
  if BuffId == PreBuffId and BuffLevel == PreBuffLevel then
    PreAttrName2Info = AttrName2Info
  else
    PreAttrName2Info = AttrModel:GetAttrName2Info(PreBuffId, PreBuffLevel)
  end
  local AttrName2Color = {}
  for Attr, ValueStr in pairs(AttrName2Info) do
    if PreAttrName2Info[Attr] and PreAttrName2Info[Attr] == ValueStr then
      AttrName2Color[Attr] = "Normal"
    else
      AttrName2Color[Attr] = "HighLight"
    end
  end
  local PlayerBuffAttrs = {}
  for Attr, Info in pairs(DataMgr.PlayerBuffAttrs) do
    table.insert(PlayerBuffAttrs, Info)
  end
  table.sort(PlayerBuffAttrs, function(a, b)
    return a.UnlockLevel < b.UnlockLevel
  end)
  for Index, Info in ipairs(PlayerBuffAttrs) do
    local BuffItem = self.WrapBox_Buff:GetChildAt(Index - 1)
    if BuffItem then
      BuffItem:Init(Info, AttrName2Info, AttrName2Color, Index, IsFirstTime, PlayerAttrName2Info)
    else
      BuffItem = self:CreateWidgetNew("ExperienceMainBuffItem")
      BuffItem:Init(Info, AttrName2Info, AttrName2Color, Index, IsFirstTime, PlayerAttrName2Info)
      self.WrapBox_Buff:AddChild(BuffItem)
    end
  end
end

function WBP_Experience_Main_C:InitBtn()
  self.Button_EX.OnClicked:Add(self, self.ClickEXBtn)
  self.Text_Tips_EX:SetText(GText("PlayerLevel_ExpSource"))
end

function WBP_Experience_Main_C:ClickEXBtn()
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_level_03", nil, nil)
  self:OpenEXSource()
end

function WBP_Experience_Main_C:OpenEXSource()
  local Params = {Parent = self}
  UIManager(self):ShowCommonPopupUI(100249, Params, self)
end

function WBP_Experience_Main_C:AllItemIconRefresh()
  local ItemUIs = self.ListView_Promote:GetDisplayedEntryWidgets()
  for i = 1, ItemUIs:Length() do
    local Entry = ItemUIs:GetRef(i)
    Entry:ItemIconRefresh()
  end
end

function WBP_Experience_Main_C:OnAnalogValueChanged(MyGeometry, InAnalogInputEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InAnalogInputEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if InKeyName == UIConst.GamePadKey.RightAnalogY then
    local DeltaOffset = UKismetInputLibrary.GetAnalogValue(InAnalogInputEvent)
    local CurrentOffset = self.ListView_Promote:GetScrollOffset()
    local NextOffset = math.clamp(CurrentOffset - DeltaOffset, 0, UIUtils.GetMaxScrollOffsetOfListView(self.ListView_Promote))
    self.ListView_Promote:SetScrollOffset(NextOffset)
    return UIUtils.Handled
  end
  return UIUtils.Unhandled
end

return WBP_Experience_Main_C
