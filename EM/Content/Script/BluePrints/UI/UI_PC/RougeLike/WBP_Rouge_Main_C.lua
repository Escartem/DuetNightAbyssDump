local TimeUtils = require("Utils.TimeUtils")
local ReddotManager = require("BluePrints.UI.Reddot.ReddotManager")
local RougeConst = require("BluePrints.UI.UI_PC.RougeLike.RougeAchive.RougeConst")
local WBP_Rouge_Main_C = Class("BluePrints.UI.BP_UIState_C")

function WBP_Rouge_Main_C:Construct()
  self.IsHovering = false
  self.IsPressing = false
  self.InDifficultySelect = false
  self.IsInSelectState = false
  self.JumpType = nil
  self:Init()
  self.Difficulty_Select:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.DifficultySelection:InitParent(self)
end

function WBP_Rouge_Main_C:Destruct()
  AudioManager(self):StopSound(self, "RougeMainOpenSound")
  self:ClearListenEvent()
end

function WBP_Rouge_Main_C:Init()
  self.SelectModeBtn = {
    self.Entrance_Store,
    self.Entrance_TalentTree,
    self.Entrance_Illustration
  }
  self.Entrance_Store.Btn_ForClick.OnClicked:Add(self, self.OpenStore)
  self.Entrance_TalentTree.Btn_ForClick.OnClicked:Add(self, self.OpenTalentTree)
  self.Entrance_Illustration.Btn_ForClick.OnClicked:Add(self, self.OpenIllustration)
  self.Btn_Enter.OnHovered:Add(self, self.OnBtnHovered)
  self.Btn_Enter.OnUnhovered:Add(self, self.OnBtnUnhovered)
  self.Btn_Enter.OnPressed:Add(self, self.OnBtnPressed)
  self.Btn_Enter.OnReleased:Add(self, self.OnBtnReleased)
  self.Btn_Enter.OnClicked:Add(self, self.OpenDifficultySelection)
  self.Entrance_Store.Text_Name:SetText(GText("UI_RougeExchangeShop_Title"))
  self.Entrance_Store.WorldText_Name01:SetText(EnText("UI_RougeExchangeShop_Title"))
  self.Entrance_Store.WorldText_Name02:SetText(EnText("UI_RougeExchangeShop_Title"))
  self.Entrance_TalentTree.Text_Name:SetText(GText("System_Name_Rouge_TalentTree"))
  self.Entrance_TalentTree.WorldText_Name01:SetText(EnText("System_Name_Rouge_TalentTree"))
  self.Entrance_TalentTree.WorldText_Name02:SetText(EnText("System_Name_Rouge_TalentTree"))
  self.Entrance_Illustration.Text_Name:SetText(GText("System_Name_Rouge_Index"))
  self.Entrance_Illustration.WorldText_Name01:SetText(EnText("System_Name_Rouge_Index"))
  self.Entrance_Illustration.WorldText_Name02:SetText(EnText("System_Name_Rouge_Index"))
  self.Text_Enter:SetText(GText("System_Name_Rouge_Enter"))
  self.Text_Ongoing:SetText(GText("System_Name_Rouge_Ongoing"))
  self.DifficultySelection:SetVisibility(UIConst.VisibilityOp.Collapsed)
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
  if IsValid(self.GameInputModeSubsystem) then
    self:RefreshOpInfoByInputDevice(self.GameInputModeSubsystem:GetCurrentInputType(), self.GameInputModeSubsystem:GetCurrentGamepadName())
  end
  self:InitListenEvent()
  self:InitWidgetInfoInGamePad()
end

function WBP_Rouge_Main_C:InitWidgetInfoInGamePad()
  if self.Icon_Key_Entrance then
    self.Icon_Key_Entrance:CreateCommonKey({
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "View"}
      }
    })
  end
  if self.Icon_Key_Enter then
    self.Icon_Key_Enter:CreateCommonKey({
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "A"}
      }
    })
  end
  if self.Icon_Key_RewardInfo then
    self.Icon_Key_RewardInfo:CreateCommonKey({
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "Y"}
      }
    })
  end
end

function WBP_Rouge_Main_C:HandleKeyDown(MyGeometry, InKeyEvent)
  local IsEventHandled = false
  if self.InDifficultySelect then
    IsEventHandled = self.DifficultySelection:HandleKeyDown(MyGeometry, InKeyEvent)
  else
    local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
    local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
    if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) then
      if InKeyName == UIConst.GamePadKey.FaceButtonTop then
        if not self.IsInSelectState then
          IsEventHandled = true
          self.RewardInfo:OnBtnClicked()
        end
      elseif InKeyName == UIConst.GamePadKey.SpecialLeft then
        IsEventHandled = true
        self:EnterSelectMode()
      elseif InKeyName == UIConst.GamePadKey.FaceButtonBottom then
        IsEventHandled = true
        self:OpenDifficultySelection()
      elseif InKeyName == UIConst.GamePadKey.FaceButtonRight and self.IsInSelectState then
        IsEventHandled = true
        self:LeaveSelectMode()
      end
    elseif "Escape" == InKeyName then
      IsEventHandled = true
      self:OnReturnKeyDown()
    end
  end
  return IsEventHandled
end

function WBP_Rouge_Main_C:InitListenEvent()
  if IsValid(self.GameInputModeSubsystem) then
    self.GameInputModeSubsystem.OnInputMethodChanged:Add(self, self.RefreshOpInfoByInputDevice)
  end
end

function WBP_Rouge_Main_C:ClearListenEvent()
  if IsValid(self.GameInputModeSubsystem) then
    self.GameInputModeSubsystem.OnInputMethodChanged:Remove(self, self.RefreshOpInfoByInputDevice)
  end
end

function WBP_Rouge_Main_C:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  if CurInputDevice == ECommonInputType.Touch then
    return
  end
  local IsUseKeyAndMouse = CurInputDevice == ECommonInputType.MouseAndKeyboard
  self:UpdateUIStyleInPlatform(IsUseKeyAndMouse)
end

function WBP_Rouge_Main_C:UpdateUIStyleInPlatform(IsUseKeyAndMouse)
  if IsUseKeyAndMouse then
    self:InitKeyboardView()
  else
    self:InitGamepadView()
  end
end

function WBP_Rouge_Main_C:InitGamepadView()
  if self.Controller_Entrance then
    self.Controller_Entrance:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  end
  if self.Controller_Enter then
    self.Controller_Enter:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  end
  if self.Controller_RewardInfo then
    self.Controller_RewardInfo:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  end
  self.RewardInfo:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  self.Btn_Enter:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  if UIUtils.HasAnyFocus(self) then
    if not self.InDifficultySelect then
      self.Bg:SetFocus()
    else
      self.DifficultySelection:SetFocusWhenSwitch()
    end
  end
end

function WBP_Rouge_Main_C:InitKeyboardView()
  self:LeaveSelectMode()
  if self.Controller_Entrance then
    self.Controller_Entrance:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  if self.Controller_Enter then
    self.Controller_Enter:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  if self.Controller_RewardInfo then
    self.Controller_RewardInfo:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  self.RewardInfo:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  self.Btn_Enter:SetVisibility(UIConst.VisibilityOp.Visible)
end

function WBP_Rouge_Main_C:EnterSelectMode()
  if self.IsInSelectState then
    return
  end
  if self.Icon_Key_Entrance then
    self.Icon_Key_Entrance:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  if self.Controller_Enter then
    self.Controller_Enter:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  if self.Controller_RewardInfo then
    self.Controller_RewardInfo:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  self:InitSelectTab()
  if IsValid(self.GameInputModeSubsystem) then
    for index, BtnName in ipairs(self.SelectModeBtn) do
      if nil ~= BtnName and BtnName:IsVisible() then
        self.IsInSelectState = true
        self.GameInputModeSubsystem:SetTargetUIFocusWidget(BtnName.Btn_ForClick)
        return
      end
    end
  end
end

function WBP_Rouge_Main_C:LeaveSelectMode()
  if not self.IsInSelectState then
    return
  end
  self.IsInSelectState = false
  if self.Icon_Key_Entrance then
    self.Icon_Key_Entrance:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  end
  if self.Controller_Enter then
    self.Controller_Enter:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  end
  if self.Controller_RewardInfo then
    self.Controller_RewardInfo:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  end
  if UIUtils.HasAnyFocus(self) then
    self:InitNormalTab()
    self.Bg:SetFocus()
  end
end

function WBP_Rouge_Main_C:InitSelectTab()
  self.TabConfigData = {
    DynamicNode = {
      "Back",
      "ResourceBar",
      "BottomKey"
    },
    StyleName = "Text",
    OwnerPanel = self,
    BackCallback = self.OnReturnKeyDown,
    BottomKeyInfo = {
      {
        GamePadInfoList = {
          {Type = "Img", ImgShortPath = "A"}
        },
        Desc = GText("UI_Tips_Ensure"),
        bLongPress = false
      },
      {
        KeyInfoList = {
          {
            Type = "Text",
            Text = "Esc",
            ClickCallback = self.OnReturnKeyDown,
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
  local ResoucesTab = {}
  self.Root:InitOtherPageTab(self.TabConfigData, ResoucesTab, true)
end

function WBP_Rouge_Main_C:InitNormalTab()
  self.TabConfigData = {
    DynamicNode = {
      "Back",
      "ResourceBar",
      "BottomKey"
    },
    StyleName = "Text",
    OwnerPanel = self,
    BackCallback = self.OnReturnKeyDown,
    BottomKeyInfo = {
      {
        KeyInfoList = {
          {
            Type = "Text",
            Text = "Esc",
            ClickCallback = self.OnReturnKeyDown,
            Owner = self
          }
        },
        GamePadInfoList = {
          {Type = "Img", ImgShortPath = "B"}
        },
        Desc = GText("UI_BACK"),
        bLongPress = false
      }
    },
    PopupInfoId = 100125
  }
  local ResoucesTab = {}
  self.Root:InitOtherPageTab(self.TabConfigData, ResoucesTab, true)
end

function WBP_Rouge_Main_C:OnFocusReceived(MyGeometry, InFocusEvent)
  self.Bg:SetFocus()
  return UIUtils.Unhandled
end

function WBP_Rouge_Main_C:SetInfo()
  self.InDifficultySelect = false
  self.Main:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  self.RewardInfo:RefreshInfo()
  self.Chinese:ClearChildren()
  local TitleWidget = self:CreateWidgetNew("RougeMainTitle")
  local TitleInfo = {
    MainTitle = "MAIN_UI_ROUGE"
  }
  TitleWidget:SetInfo(TitleInfo)
  self.Chinese:AddChild(TitleWidget)
  self.RewardInfo.Parent = self
  self.OnWorking:SetVisibility(UIConst.VisibilityOp.Collapsed)
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    self.SeasonId = Avatar.RougeLike.ProgressingSeasonId
    if not DataMgr.RougeLikeSeason[self.SeasonId] then
      return
    end
    TitleInfo = {
      MainTitle = "MAIN_UI_ROUGE",
      SubTitle = DataMgr.RougeLikeSeason[self.SeasonId].SubTitle
    }
    TitleWidget:SetInfo(TitleInfo)
    if Avatar:IsRougeLikeInProgress() then
      for Index, DifficultyId in pairs(DataMgr.RougeLikeSeason[self.SeasonId].DifficultyId) do
        if DifficultyId == Avatar.RougeLike.ProgressingDifficultyId then
          self.DifficultyIdIndex = Index
        end
      end
      self.OnWorking:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
    end
  end
  local Avatar = GWorld:GetAvatar()
  self.RougeTalent = DataMgr.RougeLikeTalent
  self.Lines = {}
  self.ReachableTable = {}
  self.ReddotCondition = false
  for TalentId, RougeTalentInfo in pairs(self.RougeTalent) do
    if RougeTalentInfo.UnLock then
      for _, PostTalentId in pairs(RougeTalentInfo.UnLock) do
        if not self.Lines[PostTalentId] then
          self.Lines[PostTalentId] = {}
        end
        self.Lines[PostTalentId][TalentId] = 1
      end
    end
  end
  self.AllActiveTalent = {}
  if Avatar then
    self.AllActiveTalent = Avatar.RougeLike.Talent
  end
  if Avatar then
    self.RemainingTalentPoint = Avatar:GetCurrentRougeLikeTalent()
  else
    self.RemainingTalentPoint = 0
  end
  for TalentId, RougeTalentInfo in pairs(self.RougeTalent) do
    if not self.ReddotCondition and self:CheckReachable(TalentId) and not self.AllActiveTalent[TalentId] then
      self.ReddotCondition = true
      break
    end
  end
  self.Entrance_TalentTree:Init(self.ReddotCondition)
  ReddotManager.RemoveListener("RougeArchiveTreasure", self)
  ReddotManager.AddListener("RougeArchiveMain", self, self.UpdateArchiveReddot)
end

function WBP_Rouge_Main_C:UpdateArchiveReddot(Count)
  self.Entrance_Illustration:Init(Count > 0)
end

function WBP_Rouge_Main_C:CheckReachable(TalentId)
  if 1 == self.ReachableTable[TalentId] then
    return true
  elseif 0 == self.ReachableTable[TalentId] then
    return false
  end
  if self.AllActiveTalent[TalentId] then
    self.ReachableTable[TalentId] = 1
    return true
  end
  if self.Lines[TalentId] then
    for FrontTalentId, _ in pairs(self.Lines[TalentId]) do
      if not self:CheckReachable(FrontTalentId) then
        self.ReachableTable[TalentId] = 0
        return false
      end
    end
  end
  if self.RemainingTalentPoint >= self.RougeTalent[TalentId].LevelUpPoint then
    self.ReachableTable[TalentId] = 1
    return true
  else
    self.ReachableTable[TalentId] = 0
    return false
  end
end

function WBP_Rouge_Main_C:InitTable(JumpType)
  AudioManager(self):PlayUISound(self, "event:/ui/roguelike/open", "RougeMainOpenSound", nil)
  self:SetInfo()
  self:LeaveSelectMode()
  self.JumpType = JumpType or self.JumpType
  self.IsClosing = false
  self.TabConfigData = {
    DynamicNode = {
      "Back",
      "ResourceBar",
      "BottomKey"
    },
    StyleName = "Text",
    OwnerPanel = self,
    BackCallback = self.OnReturnKeyDown,
    BottomKeyInfo = {
      {
        KeyInfoList = {
          {
            Type = "Text",
            Text = "Esc",
            ClickCallback = self.OnReturnKeyDown,
            Owner = self
          }
        },
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "B",
            ClickCallback = self.OnReturnKeyDown,
            Owner = self
          }
        },
        Desc = GText("UI_BACK"),
        bLongPress = false
      }
    },
    PopupInfoId = 100125
  }
  local ResoucesTab = {}
  self.Root:InitOtherPageTab(self.TabConfigData, ResoucesTab, true)
  if self.JumpType == "ExitFromRouge" then
    local Avatar = GWorld:GetAvatar()
    if Avatar then
      local RougeLikeReward = Avatar.FirstTimeRougeLikeReward
      if RougeLikeReward and next(RougeLikeReward) then
        UIUtils.ShowGetItemPageAndOpenBagIfNeeded(nil, nil, nil, RougeLikeReward, false, nil, self, false)
        Avatar.FirstTimeRougeLikeReward = nil
      end
    end
  end
  self:ShowSeasonFirstStory()
end

function WBP_Rouge_Main_C:OpenStore()
  UIManager(self):LoadUINew("ShopActivity", nil, nil, nil, "Rouge")
end

function WBP_Rouge_Main_C:OpenTalentTree()
  if self:IsAnimationPlaying(self.In) or self:IsAnimationPlaying(self.Back) then
    return
  end
  local TalentPage = self.Root:OpenSubUI("RougeTalentPage")
  self.Root.IsOpenSelectLevel = false
  TalentPage:InitTable()
end

function WBP_Rouge_Main_C:OpenIllustration()
  if self:IsAnimationPlaying(self.In) or self:IsAnimationPlaying(self.Back) then
    return
  end
  local ArchiveMain = self.Root:OpenSubUI("RougeArchiveMain")
  self.Root.IsOpenSelectLevel = false
  ArchiveMain:Init()
end

function WBP_Rouge_Main_C:OnBtnHovered()
  self.IsHovering = true
  AudioManager(self):PlayUISound(self, "event:/ui/roguelike/enter_btn_hover", nil, nil)
  self:StopAllAnimationsExceptInOut()
  self:PlayAnimation(self.Hover)
end

function WBP_Rouge_Main_C:OnBtnUnhovered()
  self.IsHovering = false
  if not self.IsPressing and not self:IsAnimationPlaying(self.Next) then
    self:StopAllAnimationsExceptInOut()
    self:PlayAnimation(self.Unhover)
  end
end

function WBP_Rouge_Main_C:OnBtnPressed()
  self.IsPressing = true
  self:StopAllAnimationsExceptInOut()
  self:PlayAnimation(self.Press)
end

function WBP_Rouge_Main_C:OnBtnReleased()
  self.IsPressing = false
  if not self.IsHovering then
    self:StopAllAnimationsExceptInOut()
    self:PlayAnimation(self.Unhover)
  end
end

function WBP_Rouge_Main_C:OnAnimationFinished(InAnimation)
  if InAnimation == self.Unhover then
    self:PlayAnimation(self.Normal)
  end
end

function WBP_Rouge_Main_C:StopAllAnimationsExceptInOut()
  if not self:IsAnimationPlaying(self.In) and not self:IsAnimationPlaying(self.Out) and not self:IsAnimationPlaying(self.Next) and not self:IsAnimationPlaying(self.Back) then
    self:StopAllAnimations()
  end
end

function WBP_Rouge_Main_C:OnReturnKeyDown()
  if not self:IsAnyAnimationPlaying() then
    AudioManager(self):SetEventSoundParam(self, "RougeMainOpenSound", {ToEnd = 1})
    self.IsClosing = true
    if self.JumpType == "NormalJump" then
      self.Root:PlayOutAnim()
    else
      self.Root:OpenSubUI("PlayCommon")
    end
  end
end

function WBP_Rouge_Main_C:SwitchIn()
end

function WBP_Rouge_Main_C:ShowSeasonFirstStory()
  if not self.SeasonId then
    return
  end
  local SeasonStoryId = DataMgr.RougeLikeSeason[self.SeasonId].SeasonStoryId
  if not SeasonStoryId then
    return
  end
  local Avatar = GWorld:GetAvatar()
  if Avatar.RougeLike:IsManualUnlocked(RougeConst.ArchiveType.Story, DataMgr.RougeLikeStoryEvent[SeasonStoryId].RLArchiveSubId) then
    return
  end
  UIManager(self):LoadUINew("Rouge_Event_Main", {
    nil,
    SeasonStoryId,
    nil,
    true,
    true
  })
  Avatar:NotifyTriggerRougeLikeStoryEvent(SeasonStoryId)
end

function WBP_Rouge_Main_C:CheckSeasonTimeValid(SeasonId)
  if not SeasonId then
    return false
  end
  if not DataMgr.RougeLikeSeason[SeasonId] then
    return false
  end
  local SeasonInfo = DataMgr.RougeLikeSeason[SeasonId]
  local NowTime = TimeUtils.NowTime()
  return NowTime >= SeasonInfo.SeasonStartTime and NowTime <= SeasonInfo.SeasonEndTime
end

function WBP_Rouge_Main_C:OpenDifficultySelection()
  AudioManager(self):PlayUISound(self, "event:/ui/roguelike/enter_btn_click", nil, nil)
  self.DifficultySelection:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  self.Main:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  self.DifficultySelection:StopAllAnimations()
  self:StopAllAnimations()
  self.DifficultySelection:PlayAnimation(self.DifficultySelection.In)
  self:PlayAnimation(self.Next)
  self:InitTableDifficultySelection()
  self.DifficultySelection:FocusOnFirstItem()
end

function WBP_Rouge_Main_C:InitTableDifficultySelection()
  self.DifficultySelection:SetInfo()
  self.InDifficultySelect = true
  self.TabConfigData = {
    TitleName = GText("UI_RL_ChooseDifficulty"),
    DynamicNode = {
      "Back",
      "ResourceBar",
      "BottomKey"
    },
    StyleName = "Text",
    OwnerPanel = self.DifficultySelection,
    BackCallback = self.DifficultySelection.OnClickEsc,
    BottomKeyInfo = {
      {
        KeyInfoList = {
          {
            Type = "Text",
            Text = "Esc",
            ClickCallback = self.DifficultySelection.OnClickEsc,
            Owner = self.DifficultySelection
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
  local ResoucesTab = {}
  self.Root:InitOtherPageTab(self.TabConfigData, ResoucesTab, true)
end

function WBP_Rouge_Main_C:BackToRougeMain()
  self.DifficultySelection:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  self.DifficultySelection:HideWeeklyPoints()
  self.DifficultySelection:HideSquad()
  self.Main:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  self.DifficultySelection:StopAllAnimations()
  self:StopAllAnimations()
  self.DifficultySelection:PlayAnimation(self.DifficultySelection.Out)
  self:PlayAnimation(self.Back)
  self:InitTable()
  self.Bg:SetFocus()
end

return WBP_Rouge_Main_C
