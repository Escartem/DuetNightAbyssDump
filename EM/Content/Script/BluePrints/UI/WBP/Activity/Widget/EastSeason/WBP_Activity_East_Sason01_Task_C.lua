require("UnLua")
local M = Class("BluePrints.UI.BP_UIState_C")
local EastSeasonQuestUtils = require("BluePrints.UI.WBP.Activity.Widget.EastSeason.EastSeasonQuestUtils")

function M:ReceiveEnterState(StackAction)
  M.Super.ReceiveEnterState(self, StackAction)
  self:RefreshTabReddot()
end

function M:OnLoaded(...)
  self.Super.OnLoaded(self)
  self.EventId, self.TabId, self.ParentWidget = ...
  self:InitUI()
  self.List_Item:NavigateToIndex(0)
  self.Btn_GetAll.Button_Area.OnClicked:Add(self, self.OnBtnGetAllClicked)
end

function M:Construct()
  self.Tab:BindEventOnTabSelected(self, self.OnTabChange)
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
  if IsValid(self.GameInputModeSubsystem) then
    self.GameInputModeSubsystem.OnInputMethodChanged:Add(self, self.RefreshOpInfoByInputDevice)
  end
end

function M:InitUI()
  self:PlayAnimation(self.In)
  self.AllTabInfo = {}
  self.BackgroundWidgets = {}
  local ConstQuestTabData = {}
  for _, phaseData in pairs(DataMgr.CommonQuestPhase) do
    if phaseData.Index >= 1 and phaseData.Index <= 4 and phaseData.EventId == self.EventId then
      ConstQuestTabData[phaseData.Index] = phaseData
    end
  end
  for index = 1, 4 do
    local phaseData = ConstQuestTabData[index]
    if phaseData then
      table.insert(self.AllTabInfo, {
        Text = GText(phaseData.QuestPhaseName),
        TabId = index,
        IconPath = phaseData.Icon,
        SplineBP = phaseData.SplineBP
      })
      if phaseData.SplineBP and IsValid(self.Pos_Spine) then
        local NewBgWidget = UIManager(self):CreateWidget(phaseData.SplineBP)
        if NewBgWidget then
          local OverSlot = self.Pos_Spine:AddChildToOverlay(NewBgWidget)
          OverSlot:SetHorizontalAlignment(EHorizontalAlignment.HAlign_Fill)
          OverSlot:SetVerticalAlignment(EVerticalAlignment.VAlign_Fill)
          if 1 == index then
            NewBgWidget:SetVisibility(UIConst.VisibilityOp.Visible)
          else
            NewBgWidget:SetVisibility(UIConst.VisibilityOp.Hidden)
          end
          self.BackgroundWidgets[index] = NewBgWidget
        end
      end
    end
  end
  self.Tab:Init({
    DynamicNode = {
      "Back",
      "ResourceBar",
      "BottomKey"
    },
    LeftKey = "Q",
    RightKey = "E",
    Tabs = self.AllTabInfo,
    BottomKeyInfo = {
      {
        KeyInfoList = {
          {
            Type = "Text",
            Text = "Esc",
            ClickCallback = self.CloseSelf,
            Owner = self
          }
        },
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "B",
            ClickCallback = self.CloseSelf,
            Owner = self
          }
        },
        Desc = GText("UI_BACK")
      }
    },
    StyleName = "Text",
    TitleName = GText("Event_Title_102001"),
    OwnerPanel = self,
    BackCallback = self.CloseSelf
  })
  self.CanPlayChange = false
  self.Tab:SelectTab(self.TabId)
  self.CanPlayChange = true
  self.Btn_GetAll:SetGamePadImg("Y")
  if IsValid(self.GameInputModeSubsystem) then
    self:RefreshOpInfoByInputDevice(self.GameInputModeSubsystem:GetCurrentInputType(), self.GameInputModeSubsystem:GetCurrentGamepadName())
  end
  self.Btn_GetAll:SetText(GText("UI_GameEvent_ClaimAll"))
  self.Text_Tip:SetText(GText("Event_102001_Quest01_Tips"))
  self:RefreshTabReddot()
end

function M:RefreshUI()
  self:BuildAndSortQuestList(self.TabId)
  if IsValid(self.GameInputModeSubsystem) then
    self:RefreshOpInfoByInputDevice(self.GameInputModeSubsystem:GetCurrentInputType(), self.GameInputModeSubsystem:GetCurrentGamepadName())
  end
end

function M:RefreshTabReddot()
  if not self.AllTabInfo then
    return
  end
  for i = 1, #self.AllTabInfo do
    local QuestPhaseId = EastSeasonQuestUtils:GetQuestPhaseIdByTabId(self.EventId, i)
    local needShowReddot = EastSeasonQuestUtils:IsQuestPhaseCanGetReward(self.EventId, QuestPhaseId)
    self.Tab:ShowTabRedDot(i, nil, needShowReddot, nil)
  end
end

function M:OnPreviewKeyDown(MyGeometry, InKeyEvent)
  if self.IsClosingUi then
    return UE4.UWidgetBlueprintLibrary.UnHandled()
  end
  local IsEventHandled = false
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local KeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if "Q" == KeyName or "Gamepad_LeftShoulder" == KeyName then
    self.Tab:TabToLeft()
    IsEventHandled = true
  elseif "E" == KeyName or "Gamepad_RightShoulder" == KeyName then
    self.Tab:TabToRight()
    IsEventHandled = true
  elseif "Escape" == KeyName then
    self:CloseSelf()
    IsEventHandled = true
  elseif ("Gamepad_FaceButton_Top" == KeyName or "SpaceBar" == KeyName) and self.IsCanGetAllReward then
    self:OnBtnGetAllClicked()
    IsEventHandled = true
  end
  if IsEventHandled then
    return UE4.UWidgetBlueprintLibrary.Handled()
  else
    return UE4.UWidgetBlueprintLibrary.UnHandled()
  end
end

function M:CloseSelf()
  if self.BackgroundWidgets then
    for index, widget in pairs(self.BackgroundWidgets) do
      if IsValid(widget) then
        widget:RemoveFromParent()
      end
    end
    self.BackgroundWidgets = {}
  end
  self.ParentWidget:RefreshUI()
  self.IsClosingUi = true
  self:PlayAnimation(self.Out)
end

function M:OnAnimationFinished(Animation)
  if Animation == self.Out then
    self.Super.Close(self)
  end
end

function M:OnTabChange(TabWidget)
  if self.CanPlayChange then
    self:PlayAnimation(self.Change)
  end
  local TabId = TabWidget.Idx
  self:InitQuestPhaseContent(TabId)
  self.List_Item:NavigateToIndex(0)
end

function M:BuildAndSortQuestList(TabId)
  for _, phaseConfig in pairs(DataMgr.CommonQuestPhase) do
    if phaseConfig.Index == TabId and phaseConfig.EventId == self.EventId then
      local QuestPhaseId = phaseConfig.QuestPhaseId
      self.List_Item:ClearListItems()
      local questList = {}
      for _, questConfig in pairs(DataMgr.CommonQuestDetail) do
        if questConfig.QuestPhaseId == QuestPhaseId then
          local Avatar = GWorld:GetAvatar()
          local Progress = 0
          local RewardsGot = false
          if Avatar and Avatar.CommonQuestActivity then
            local questData = Avatar.CommonQuestActivity[questConfig.EventId] and Avatar.CommonQuestActivity[questConfig.EventId][questConfig.QuestId]
            if questData then
              Progress = questData.Progress or 0
              RewardsGot = questData.RewardsGot or false
            end
          end
          local Target = questConfig.Target or 0
          local IsCanGetReward = Progress >= Target
          local priority = 0
          if RewardsGot then
            priority = 3
          elseif IsCanGetReward then
            priority = 1
          else
            priority = 2
          end
          table.insert(questList, {
            config = questConfig,
            priority = priority,
            progress = Progress,
            target = Target,
            isCanGetReward = IsCanGetReward,
            rewardsGot = RewardsGot
          })
        end
      end
      table.sort(questList, function(a, b)
        if a.priority ~= b.priority then
          return a.priority < b.priority
        end
        return (a.config.QuestId or 0) < (b.config.QuestId or 0)
      end)
      for _, questData in ipairs(questList) do
        local questConfig = questData.config
        local ItemContent = NewObject(UIUtils.GetCommonItemContentClass())
        ItemContent.QuestReward = questConfig.QuestReward
        ItemContent.JumpUIId = questConfig.JumpUIId
        ItemContent.StarterQuestDes = questConfig.StarterQuestDes
        ItemContent.EventId = questConfig.EventId
        ItemContent.QuestId = questConfig.QuestId
        ItemContent.Target = questConfig.Target
        ItemContent.ParentWidget = self
        self.List_Item:AddItem(ItemContent)
      end
    end
  end
end

function M:InitQuestPhaseContent(TabId)
  self.TabId = TabId
  self:BuildAndSortQuestList(TabId)
  for _, Widget in pairs(self.List_Item:GetDisplayedEntryWidgets()) do
    Widget:PlayAnimation(Widget.In)
  end
  self.QuestPhaseId = EastSeasonQuestUtils:GetQuestPhaseIdByTabId(self.EventId, TabId)
  local CompletedQuestCount, TotalQuestCount = EastSeasonQuestUtils:GetQuestPhaseInfo(self.EventId, self.QuestPhaseId)
  self.Text_Progress:SetText(CompletedQuestCount .. "/" .. TotalQuestCount)
  self.Text_Type:SetText(self.AllTabInfo[self.TabId].Text)
  if self.BackgroundWidgets then
    for index, widget in pairs(self.BackgroundWidgets) do
      if IsValid(widget) then
        if index == TabId then
          widget:SetVisibility(UIConst.VisibilityOp.Visible)
          widget:PlayAnimation(widget.In)
        else
          widget:SetVisibility(UIConst.VisibilityOp.Hidden)
        end
      end
    end
  end
  local IconTexture = LoadObject(self.AllTabInfo[self.TabId].IconPath)
  self.Icon:SetBrushFromTexture(IconTexture)
  self:UpdateGetAllBtn()
  if 1 == TabId then
    self.Text_Tip:SetVisibility(UIConst.VisibilityOp.Visible)
  else
    self.Text_Tip:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

function M:OnAddedToFocusPath(InFocusEvent)
  self:UpdateListItemState()
  self:UpdateGetAllBtn()
end

function M:UpdateListItemState()
  local DisplayedWidgets = self.List_Item:GetDisplayedEntryWidgets()
  for _, Widget in pairs(DisplayedWidgets) do
    Widget:UpdateListItemState()
  end
end

function M:UpdateGetAllBtn()
  if EastSeasonQuestUtils:IsQuestPhaseCanGetReward(self.EventId, self.QuestPhaseId) then
    self.Btn_GetAll:SetVisibility(UIConst.VisibilityOp.Visible)
    self.IsCanGetAllReward = true
    local BottomKeyInfo = {
      {
        KeyInfoList = {
          {
            Type = "Text",
            Text = "Space",
            ClickCallback = self.OnBtnGetAllClicked,
            Owner = self
          }
        },
        Desc = GText("UI_CTL_ClaimALL")
      },
      {
        KeyInfoList = {
          {
            Type = "Text",
            Text = "Esc",
            ClickCallback = self.CloseSelf,
            Owner = self
          }
        },
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "B",
            ClickCallback = self.CloseSelf,
            Owner = self
          }
        },
        Desc = GText("UI_BACK")
      }
    }
    if not ModController:IsMobile() then
      self.Tab:UpdateBottomKeyInfo(BottomKeyInfo)
    end
  else
    self.Btn_GetAll:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.IsCanGetAllReward = false
    local BottomKeyInfo = {
      {
        KeyInfoList = {
          {
            Type = "Text",
            Text = "Esc",
            ClickCallback = self.CloseSelf,
            Owner = self
          }
        },
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "B",
            ClickCallback = self.CloseSelf,
            Owner = self
          }
        },
        Desc = GText("UI_BACK")
      }
    }
    if not ModController:IsMobile() then
      self.Tab:UpdateBottomKeyInfo(BottomKeyInfo)
    end
  end
end

function M:OnBtnGetAllClicked()
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    local function Callback(Ret, Rewards)
      if 0 == Ret then
        UIUtils.ShowGetItemPageAndOpenBagIfNeeded(nil, nil, nil, Rewards, false, nil, self)
        
        self:RefreshUI()
        self.Btn_GetAll:SetVisibility(UIConst.VisibilityOp.Collapsed)
        self.IsCanGetAllReward = false
        self:RefreshTabReddot()
      end
    end
    
    Avatar:CallServer("CommonQuestActivityGetPhaseReward", Callback, self.EventId, self.QuestPhaseId)
  end
end

function M:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  if CurInputDevice == ECommonInputType.MouseAndKeyboard then
    self.Btn_GetAll:SetGamePadIconVisible(false)
  elseif CurInputDevice == ECommonInputType.Gamepad then
    self.Btn_GetAll:SetGamePadIconVisible(true)
  end
end

return M
