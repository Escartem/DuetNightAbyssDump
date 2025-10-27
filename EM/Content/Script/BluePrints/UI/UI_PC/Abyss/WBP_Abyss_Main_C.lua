require("UnLua")
local TimeUtils = require("Utils.TimeUtils")
local EMCache = require("EMCache.EMCache")
local WBP_Abyss_Main_C = Class("BluePrints.UI.BP_UIState_C")

function WBP_Abyss_Main_C:Construct()
  self.CurFocusedLevel = nil
  self.NodeLevelContent = nil
  self.LastLevelContent = nil
  self.CanJump = false
  self.AbyssMainInitFinished = false
  self.Super.Construct(self)
end

function WBP_Abyss_Main_C:Destruct()
  self:DestructMgr()
  self:DestructAbyssMain()
  self.Super.Destruct(self)
end

function WBP_Abyss_Main_C:OnLoaded(...)
  self.Super.OnLoaded(self, ...)
  local FirstSelectedAbyssId, DoNotInit, isFromActivity = ...
  self.IsFromActivity = isFromActivity
  self:InitMgr()
  self:InitAbyssMain(FirstSelectedAbyssId, DoNotInit)
end

function WBP_Abyss_Main_C:InitAbyssMain(FirstSelectedAbyssId, DoNotInit)
  if not DoNotInit then
    self:InitInfo(FirstSelectedAbyssId)
  end
  self:OpenSubUI({Idx = "AbyssMain"}, DoNotInit)
  self:ShowReviewPopUp()
end

function WBP_Abyss_Main_C:DestructAbyssMain()
  if self.FirstTimer then
    self:RemoveTimer(self.FirstTimer)
    self.FirstTimer = nil
  end
  if self.ScrollTimer then
    self:RemoveTimer(self.ScrollTimer)
    self.ScrollTimer = nil
  end
  self:ClearListenEvent()
  self.List_Level:ClearListItems()
  AudioManager(self):StopSound(self, "AbyssMainOpenSound")
end

function WBP_Abyss_Main_C:SwitchIn(DoNotInit, FirstSelectedAbyssId, PlayBack)
  if not DoNotInit and not self.AbyssMainInitFinished then
    self:InitInfo(FirstSelectedAbyssId)
  end
  self:InitTable()
  if self:IsAnyAnimationPlaying() then
    self:StopAllAnimations()
  end
  AudioManager(self):PlayUISound(self, "event:/ui/activity/open", "AbyssMainOpenSound", nil)
  if PlayBack then
    self:PlayAnimation(self.Back)
  else
    self:PlayAnimation(self.In)
  end
  self.Main:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
end

function WBP_Abyss_Main_C:SwitchOut()
  self.Main:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  self.Tip_Fragment:Hide()
  if not self.BindOutAnimation then
    self:BindToAnimationFinished(self.Out, {
      self,
      function()
        self.Main:SetVisibility(UIConst.VisibilityOp.Collapsed)
      end
    })
    self.BindOutAnimation = true
  end
  AudioManager(self):SetEventSoundParam(self, "AbyssMainOpenSound", {ToEnd = 1})
  AudioManager(self):StopSound(self, "AbyssMainOpenSound")
  self:PlayAnimation(self.Out)
end

function WBP_Abyss_Main_C:SetRewardParams()
  self.Params = {}
  local ConfigData = {
    Items = {},
    ShowIcon = true,
    IconPath = "PaperSprite'/Game/UI/Texture/Static/Atlas/Abyss/T_Abyss_Star02.T_Abyss_Star02'",
    Text_Total = "Abyss_RewardProgress_Difficulty",
    ReceiveAllCallBack = self.GetAllRewards,
    ReceiveAllParam = {
      SelectAbyssId = self.SelectAbyssId
    },
    SortType = 2,
    Rewards = {},
    NowNum = 0,
    NumMax = 0,
    ReceiveButtonText = "UI_Achievement_GetAllReward"
  }
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    local Abyss = Avatar.Abysses[self.SelectAbyssId]
    if DataMgr.AbyssSeason[self.SelectAbyssId] then
      ConfigData.NowNum = Abyss:GetAllPassRoomCount()
      local RewardList = DataMgr.AbyssSeason[self.SelectAbyssId].AbyssRewardList or {}
      local Pre
      local Rewards = {}
      local Item
      for _, RewardId in ipairs(RewardList) do
        local RewardItem = DataMgr.AbyssRewardList[RewardId]
        if RewardItem then
          if Pre and Pre.RewardAddOn then
            local Level = Pre.Level
            while Level < RewardItem.Level do
              local NewItem = CommonUtils.DeepCopy(Item)
              NewItem.SourceNum = Level
              NewItem.ItemId = Level
              NewItem.CanReceive = Abyss:CheckRewardCanGet(Level)
              NewItem.RewardsGot = Abyss:CheckRewardIsGot(Level)
              table.insert(ConfigData.Items, NewItem)
              Level = Level + Pre.RewardAddOn
            end
          end
          Item = {
            Text = GText("UI_ModGuideBook_RewardView"),
            ItemId = RewardId,
            CanReceive = Abyss:CheckRewardCanGet(RewardItem.Level),
            RewardsGot = Abyss:CheckRewardIsGot(RewardItem.Level),
            InProgress = false,
            Rewards = {},
            Nums = 1,
            NotreachText = "UI_GameEvent_ToBeFinished",
            Hint = "Abyss_RewardList_Content",
            ShowIcon = true,
            IconPath = "PaperSprite'/Game/UI/Texture/Static/Atlas/Abyss/T_Abyss_Star02.T_Abyss_Star02'",
            ReceiveCallBack = self.GetRewards,
            LeftAligned = true,
            SourceNum = RewardItem.Level,
            ReceiveButtonText = "UI_Achievement_GetReward",
            ReceiveParm = {
              SelectAbyssId = self.SelectAbyssId
            },
            IsWalnutReward = RewardItem.WalnutReward
          }
          Rewards = {}
          local RewardItemId = RewardItem.Reward
          local RewardInfo = DataMgr.Reward[RewardItemId]
          if RewardInfo then
            local Ids = RewardInfo.Id or {}
            local RewardCount = RewardInfo.Count or {}
            local TableName = RewardInfo.Type or {}
            for i = 1, #Ids do
              local ItemId = Ids[i]
              local Count = RewardUtils:GetCount(RewardCount[i])
              local Rarity = ItemUtils.GetItemRarity(ItemId, TableName[i])
              local ItemType = TableName[i]
              local RewardContent = {
                ItemType = ItemType,
                ItemId = ItemId,
                Count = Count,
                Rarity = Rarity
              }
              table.insert(Rewards, RewardContent)
            end
          end
          Item.Rewards = Rewards
          Pre = DataMgr.AbyssRewardList[RewardId]
          if RewardItem.RewardAddOn == nil then
            table.insert(ConfigData.Items, Item)
          end
        end
      end
      if Pre then
        ConfigData.NumMax = Pre.Level
        ConfigData.NumMax = tostring(ConfigData.NumMax)
      end
      if Pre and Pre.RewardAddOn then
        table.insert(ConfigData.Items, Item)
        if ConfigData.NowNum > Pre.Level then
          local Level = Pre.Level + Pre.RewardAddOn
          local FinialLevel = ConfigData.NowNum + Pre.RewardAddOn * 5
          while Level <= FinialLevel do
            local NewItem = CommonUtils.DeepCopy(Item)
            NewItem.SourceNum = Level
            NewItem.ItemId = Level
            NewItem.CanReceive = Abyss:CheckRewardCanGet(Level)
            NewItem.RewardsGot = Abyss:CheckRewardIsGot(Level)
            table.insert(ConfigData.Items, NewItem)
            Level = Level + Pre.RewardAddOn
          end
          ConfigData.NumMax = tostring(Level - Pre.RewardAddOn)
        end
      end
      self.Params.ConfigData = ConfigData
    end
  end
  local TitleText = DataMgr.AbyssSeason[self.SelectAbyssId].AbyssRewardListTitle
  self.Params.Title = GText(TitleText)
  local AbyssInfo = DataMgr.AbyssSeason[self.SelectAbyssId]
  local AbyssSeasonId = AbyssInfo.AbyssSeasonId
  if AbyssSeasonId then
    local AbyssSeasonInfo = DataMgr.AbyssSeasonList[AbyssSeasonId]
    local AbyssEndTime = AbyssSeasonInfo.AbyssEndTime
    if AbyssEndTime then
      local RemainTime = AbyssEndTime - TimeUtils.NowTime()
      self.Params.CountDownParams = {Name = nil, RemainTime = RemainTime}
    end
  end
  self:RefreshTipFragment(self.Params.ConfigData.Items)
end

function WBP_Abyss_Main_C:RefreshTipFragment(RewardItems)
  self.Tip_Fragment:Hide()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  for _, Item in pairs(RewardItems) do
    if Item.IsWalnutReward and Item.CanReceive then
      local AbyssSeasonId = Avatar.CurrentAbyssSeasonId
      if AbyssSeasonId and DataMgr.AbyssSeasonList[AbyssSeasonId] then
        local WalnutId = DataMgr.AbyssSeason[self.SelectAbyssId].WalnutId
        local IconPath
        if WalnutId then
          IconPath = DataMgr.Walnut[WalnutId].Icon
        end
        local CharId = DataMgr.AbyssSeasonList[AbyssSeasonId].CharId
        local CharName = DataMgr.Char[CharId].CharName
        local Params = {
          Text = string.format(GText("Abyss_CharReward_Walnut"), GText(CharName)),
          IconPath = IconPath
        }
        self.Tip_Fragment:Init(Params)
        self.Tip_Fragment:PlayInAnim()
      end
      return
    end
  end
end

function WBP_Abyss_Main_C:OpenReward()
  self:SetRewardParams()
  UIManager(self):ShowCommonPopupUI(100158, self.Params, self)
end

function WBP_Abyss_Main_C:InitInfo(FirstSelectedAbyssId)
  self.AbyssMainInitFinished = true
  self:PlayAnimation(self.Normal)
  self.Btn_BacktoTop.OnClicked:Add(self, self.OnBackBtnClicked)
  self.Btn_BacktoTop.OnHovered:Add(self, self.OnBackBtnHovered)
  self.Btn_BacktoTop.OnUnhovered:Add(self, self.OnBackBtnUnhovered)
  self.Btn_BacktoTop.OnPressed:Add(self, self.OnBackBtnPressed)
  self.Btn_BacktoTop.OnReleased:Add(self, self.OnBackBtnReleased)
  self.Store:BindEventOnClicked(self, self.OpenStore)
  self.Entry.Btn_Click.OnClicked:Add(self, self.OpenEntry)
  self.Mode_01:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Mode_02:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Mode_03:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Text_BacktoTop:SetText(GText("Abyss_Level_Back"))
  self.Store:SetText(GText("Abyss_ExchangeStore"))
  self.Title:SetInfo({
    MainTitle = "Abyss_entry"
  })
  self.BacktoTop:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Panel_RefreshTime:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.WBox_Mode:ClearChildren()
  self.Index2AbyssId = {}
  self.AbyssId2Index = {}
  self.Index2LevelId = {}
  self.LevelId2Index = {}
  self.ChangeSpeed = 5
  local AbyssIds = {}
  local TitleInfo = {
    MainTitle = "Abyss_entry"
  }
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    local AbyssSeasonId = Avatar.CurrentAbyssSeasonId
    if AbyssSeasonId and DataMgr.AbyssSeasonList[AbyssSeasonId] then
      TitleInfo.SubTitle = DataMgr.AbyssSeasonList[AbyssSeasonId].AbyssSeasonName
    end
  end
  self.Title:SetInfo(TitleInfo)
  if Avatar and Avatar.Abysses then
    local Abysses = DataMgr.AbyssSeason
    for AbyssId, _ in pairs(Abysses) do
      if Avatar.Abysses[AbyssId] and (not Avatar.Abysses[AbyssId].AbyssSeasonId or Avatar.Abysses[AbyssId].AbyssSeasonId == Avatar.CurrentAbyssSeasonId) then
        table.insert(AbyssIds, AbyssId)
      end
    end
    table.sort(AbyssIds, function(a, b)
      return Abysses[a].Order < Abysses[b].Order
    end)
    for Index, AbyssId in ipairs(AbyssIds) do
      self.Index2AbyssId[Index] = AbyssId
      self.AbyssId2Index[AbyssId] = Index
    end
    for Index, AbyssId in ipairs(self.Index2AbyssId) do
      local Obj = self:CreateWidgetNew("AbyssModeSelection")
      Obj:BindEventOnClicked(self, self.OnClickedAbyssModeSelectionCell, Obj)
      local IsLocked = Avatar.Abysses[AbyssId]:IsLocked()
      Obj:Init(self, Index, AbyssId, IsLocked, FirstSelectedAbyssId)
      self.WBox_Mode:AddChild(Obj)
    end
  end
  self.List_Level:SetNavigationRuleCustom(EUINavigation.Left, {
    self,
    self.OnUINavigation
  })
  self.List_Level.BP_OnEntryGenerated:Add(self, self.OnEntryGenerated)
  self.List_Level.BP_OnEntryReleased:Add(self, self.OnEntryReleased)
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
  if IsValid(self.GameInputModeSubsystem) then
    self:RefreshOpInfoByInputDevice(self.GameInputModeSubsystem:GetCurrentInputType(), self.GameInputModeSubsystem:GetCurrentGamepadName())
  end
  self:InitListenEvent()
  self:InitWidgetInfoInGamePad()
end

function WBP_Abyss_Main_C:OnClickedAbyssModeSelectionCell(AbyssModeSelectionCell, DoNotPlaySound)
  if AbyssModeSelectionCell.IsLocked then
    UIManager(self):ShowUITip(UIConst.Tip_CommonToast, GText(DataMgr.AbyssSeason[AbyssModeSelectionCell.AbyssId].DifficultyLockToast))
    return
  end
  if self.SelectCell then
    self.SelectCell:UnSelected()
    self:PlayModeAnimation(self.SelectCell.Index, true)
  end
  self.SelectCell = AbyssModeSelectionCell
  self.SelectCell:Selected(DoNotPlaySound)
  self.SelectIndex = AbyssModeSelectionCell.Index
  self.SelectAbyssId = AbyssModeSelectionCell.AbyssId
  self.BacktoTop:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self:RefreshAbyssLevelInfo(self.SelectAbyssId)
  self:RefreshRewardBtnInfo(self.SelectAbyssId)
  self:RefreshTimerInfo(self.SelectAbyssId)
  self:PlayModeAnimation(self.SelectCell.Index, false)
end

function WBP_Abyss_Main_C:PlayModeAnimation(Index, IsReverse)
  self:AddTimer(0.01, function()
    self["Mode_0" .. Index]:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
    if IsReverse then
      self:PlayAnimation(self["Mode0" .. Index], 0, 1, 1, 1)
    else
      self:PlayAnimation(self["Mode0" .. Index], 0, 1, 0, 1)
    end
  end, false)
end

function WBP_Abyss_Main_C:RefreshAbyssLevelInfo(AbyssId)
  local Abysses = DataMgr.AbyssSeason
  local AbyssLevel = DataMgr.AbyssLevel
  local Abyss = Abysses[AbyssId]
  local AbyssType = Abyss.AbyssType
  self.GotStar = 0
  self.SumStar = 0
  self.Max = 1
  self.Target = 1
  self.AbyssLevelPlayInAnimation = true
  self.IsEndless = false
  if Abyss and Abyss.AbyssLevelId then
    self.List_Level:ClearListItems()
    self.CurFocusedLevel = nil
    self.NodeLevelContent = nil
    self.LastLevelContent = nil
    self.List_Level:ScrollToTop()
    local ClassPath = "/Game/UI/UI_PC/Common/Common_Item_subsize_PC_Content.Common_Item_subsize_PC_Content_C"
    if 3 == AbyssType then
      self.IsEndless = true
      local Avatar = GWorld:GetAvatar()
      if Avatar then
        local JumpStep
        if Abyss.InfiniteNode then
          JumpStep = Abyss.InfiniteNode[1]
        end
        local MaxAbyssProgress = Avatar.Abysses[AbyssId].MaxAbyssProgress
        local MaybeAllLevelNum = MaxAbyssProgress[1] + 1
        local AllLevelNum = 1
        for i = 1, MaybeAllLevelNum do
          if i > 1 then
            if Avatar.Abysses[AbyssId].AbyssLevelList[i - 1]:IsAbyssLevelPass() then
              AllLevelNum = i
            else
              break
            end
          else
            AllLevelNum = i
          end
        end
        local LevelIndex = (AllLevelNum - 1) % #Abyss.AbyssLevelId + 1
        local AbyssLevelId = Abyss.AbyssLevelId[LevelIndex]
        local AbyssDungeon1 = AbyssLevel[AbyssLevelId].AbyssDungeon1
        local AbyssDungeon2 = AbyssLevel[AbyssLevelId].AbyssDungeon2
        local SumRoom = 0
        if DataMgr.AbyssDungeon[AbyssDungeon1] and DataMgr.AbyssDungeon[AbyssDungeon1].RoomId then
          SumRoom = SumRoom + #DataMgr.AbyssDungeon[AbyssDungeon1].RoomId
        end
        if DataMgr.AbyssDungeon[AbyssDungeon2] and DataMgr.AbyssDungeon[AbyssDungeon2].RoomId then
          SumRoom = SumRoom + #DataMgr.AbyssDungeon[AbyssDungeon2].RoomId
        end
        self.Max = AllLevelNum
        self.MaxLevelNum = AllLevelNum
        self.CanJump = false
        if JumpStep then
          self.JumpIndex = (math.floor((AllLevelNum - 1) / JumpStep) + 1) * JumpStep
          if 0 ~= AllLevelNum % JumpStep and Avatar:CheckAbyssCanJump(AbyssId, self.JumpIndex) then
            self.CanJump = true
          end
        end
        for Index = 1, AllLevelNum do
          local LevelChooseObj = NewObject(UE4.LoadClass(ClassPath))
          local AbyssLevelId = Abyss.AbyssLevelId[(Index - 1) % #Abyss.AbyssLevelId + 1]
          local SumLevelStar = self:GetSumLevelStar(AbyssLevelId)
          local GotLevelStar = self:GetGotLevelStar(AbyssId, AbyssLevelId, Index)
          LevelChooseObj.AbyssId = AbyssId
          LevelChooseObj.AbyssLevelId = AbyssLevelId
          LevelChooseObj.Index = Index
          LevelChooseObj.IsEndless = true
          LevelChooseObj.Root = self
          LevelChooseObj.IsLocked = false
          if not LevelChooseObj.IsLocked then
            self.Target = Index
          end
          if Index == AllLevelNum then
            self.LastLevelContent = LevelChooseObj
            LevelChooseObj.IsLastLevel = true
            if self.CanJump then
              LevelChooseObj.IsLastNormalLevel = true
            end
          end
          LevelChooseObj.SumLevelStar = SumLevelStar
          LevelChooseObj.GotLevelStar = GotLevelStar
          self.SumStar = self.SumStar + SumLevelStar
          self.GotStar = self.GotStar + GotLevelStar
          self.List_Level:AddItem(LevelChooseObj)
        end
        if self.CanJump then
          local PlayNodeLevelUnlockAnimation = true
          if EMCache:Get("LastUnlockNodeLevel") == self.JumpIndex then
            PlayNodeLevelUnlockAnimation = false
          end
          self.Max = self.Max + 2
          self.MaxLevelNum = self.JumpIndex
          local LevelChooseObj_JumpTip = NewObject(UE4.LoadClass(ClassPath))
          LevelChooseObj_JumpTip.IsJumpTip = true
          LevelChooseObj_JumpTip.AbyssId = AbyssId
          LevelChooseObj_JumpTip.Root = self
          self.List_Level:AddItem(LevelChooseObj_JumpTip)
          local LevelChooseObj = NewObject(UE4.LoadClass(ClassPath))
          self.NodeLevelContent = LevelChooseObj
          local AbyssLevelId = Abyss.AbyssLevelId[(self.JumpIndex - 1) % #Abyss.AbyssLevelId + 1]
          local SumLevelStar = self:GetSumLevelStar(AbyssLevelId)
          local GotLevelStar = self:GetGotLevelStar(AbyssId, AbyssLevelId, self.JumpIndex)
          LevelChooseObj.AbyssId = AbyssId
          LevelChooseObj.AbyssLevelId = AbyssLevelId
          LevelChooseObj.Index = self.JumpIndex
          LevelChooseObj.NodeIndex = math.floor(self.JumpIndex / JumpStep)
          LevelChooseObj.IsEndless = true
          LevelChooseObj.Root = self
          LevelChooseObj.IsLocked = false
          if not LevelChooseObj.IsLocked then
            self.Target = self.JumpIndex
          end
          LevelChooseObj.IsNodeLevel = true
          LevelChooseObj.PlayNodeLevelUnlockAnimation = PlayNodeLevelUnlockAnimation
          LevelChooseObj.SumLevelStar = SumLevelStar
          LevelChooseObj.GotLevelStar = GotLevelStar
          self.List_Level:AddItem(LevelChooseObj)
        end
      end
    else
      self.IsEndless = false
      self.Max = #Abyss.AbyssLevelId
      self.MaxLevelNum = #Abyss.AbyssLevelId
      for Index, AbyssLevelId in ipairs(Abyss.AbyssLevelId) do
        local LevelChooseObj = NewObject(UE4.LoadClass(ClassPath))
        local SumLevelStar = self:GetSumLevelStar(AbyssLevelId)
        local GotLevelStar = self:GetGotLevelStar(AbyssId, AbyssLevelId, Index)
        LevelChooseObj.AbyssId = AbyssId
        LevelChooseObj.AbyssLevelId = AbyssLevelId
        LevelChooseObj.Index = Index
        LevelChooseObj.IsEndless = false
        LevelChooseObj.Root = self
        LevelChooseObj.IsLocked = not self:CheckAbyssLevelIsOpen(AbyssId, AbyssLevelId, Index)
        if not LevelChooseObj.IsLocked then
          self.Target = Index
        end
        LevelChooseObj.SumLevelStar = SumLevelStar
        LevelChooseObj.GotLevelStar = GotLevelStar
        self.SumStar = self.SumStar + SumLevelStar
        self.GotStar = self.GotStar + GotLevelStar
        self.List_Level:AddItem(LevelChooseObj)
      end
    end
    self:RemoveTimer(self.FirstTimer)
    if self.IsEndless then
      self.FirstTimer = nil
      self.FirstTimer = self:AddTimer(0.001, function()
        local MaxCount = UIUtils.GetListViewContentMaxCount(self.List_Level)
        self.Mid = math.ceil(MaxCount / 2)
        self.List_Level:ScrollToBottom()
        self:AddTimer(0.001, function()
          self.BottomOffset = self.List_Level:GetScrollOffset()
          self.TargetOffset = self.BottomOffset
        end)
        self:RemoveTimer(self.FirstTimer)
        self.FirstTimer = nil
      end)
    else
      self.List_Level:ScrollIndexIntoView(self.Target - 1)
    end
  end
end

function WBP_Abyss_Main_C:ScrollToOffest(CurrentOffest, TargetOffest, IsPlayInAnimation)
  self.AbyssLevelPlayInAnimation = IsPlayInAnimation
  self.LerpAlpha = 0
  self.ScrollTimer = self:AddTimer(0.033, function(_, DeltaTime)
    self.LerpAlpha = self.LerpAlpha + self.ChangeSpeed * DeltaTime
    if self.LerpAlpha >= 1 then
      self.LerpAlpha = 1
      self.List_Level:SetScrollOffset(TargetOffest)
      self.List_Level:SetVisibility(ESlateVisibility.Visible)
      self.AbyssLevelPlayInAnimation = false
      self:RemoveTimer(self.ScrollTimer)
      self.ScrollTimer = nil
      if self.CurFocusedLevel then
        if self.NodeLevelContent then
          self.List_Level:BP_NavigateToItem(self.NodeLevelContent)
        elseif self.LastLevelContent then
          self.List_Level:BP_NavigateToItem(self.LastLevelContent)
        end
      end
      return
    end
    local Offset = UE4.UKismetMathLibrary.Lerp(CurrentOffest, TargetOffest, self.LerpAlpha)
    self.List_Level:SetScrollOffset(Offset)
  end, true, 0, "UpdateOffset", true, 0.033)
end

function WBP_Abyss_Main_C:OnBackBtnClicked()
  self:StopAllBtnAnimations()
  self:PlayAnimation(self.Click)
  if not self.ScrollTimer then
    local CurrentOffest = self.List_Level:GetScrollOffset()
    self:ScrollToOffest(CurrentOffest, self.TargetOffset, false)
  end
end

function WBP_Abyss_Main_C:TryClickedBackBtn_GamePad()
  if self.BacktoTop:GetVisibility() == UIConst.VisibilityOp.Collapsed then
    return false
  else
    self:OnBackBtnClicked()
    return true
  end
end

function WBP_Abyss_Main_C:OnBackBtnHovered()
  self.IsHovering = true
  self:StopAllBtnAnimations()
  self:PlayAnimation(self.Normal)
  self:PlayAnimation(self.Hover)
end

function WBP_Abyss_Main_C:OnBackBtnUnhovered()
  self.IsHovering = false
  if not self.IsPressing then
    self:StopAllBtnAnimations()
    self:PlayAnimation(self.Unhover)
  end
end

function WBP_Abyss_Main_C:OnBackBtnPressed()
  self.IsPressing = true
  self:StopAllBtnAnimations()
  self:PlayAnimation(self.Press)
end

function WBP_Abyss_Main_C:OnBackBtnReleased()
  self.IsPressing = false
  if not self.IsHovering then
    self:StopAllBtnAnimations()
    self:PlayAnimationReverse(self.Press)
  else
    self:StopAllBtnAnimations()
    self:PlayAnimation(self.Normal)
  end
end

function WBP_Abyss_Main_C:StopAllBtnAnimations()
  self:StopAnimation(self.Normal)
  self:StopAnimation(self.Press)
  self:StopAnimation(self.Unhover)
  self:StopAnimation(self.Hover)
  self:StopAnimation(self.Click)
end

function WBP_Abyss_Main_C:RefreshRewardBtnInfo(AbyssId)
  self:SetRewardParams()
  self.Reward:Init(self, self.OpenReward, AbyssId, self.Params.ConfigData.NowNum, self.Params.ConfigData.NumMax)
end

function WBP_Abyss_Main_C:RefreshTimerInfo(AbyssId)
  self:RemoveTimer("RefreshAbyssRewardInfoTimer")
  local AbyssInfo = DataMgr.AbyssSeason[AbyssId]
  local AbyssSeasonId = AbyssInfo.AbyssSeasonId
  if AbyssSeasonId then
    local AbyssSeasonInfo = DataMgr.AbyssSeasonList[AbyssSeasonId]
    local AbyssEndTime = AbyssSeasonInfo.AbyssEndTime
    if AbyssEndTime then
      self.Panel_RefreshTime:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
      self:SetTimer(AbyssEndTime)
    else
      self.Panel_RefreshTime:SetVisibility(UIConst.VisibilityOp.Collapsed)
    end
  else
    self.Panel_RefreshTime:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

function WBP_Abyss_Main_C:SetTimer(EndTime)
  self:Refresh(EndTime)
  self:AddTimer(1, self.Refresh, true, 0, "RefreshAbyssRewardInfoTimer", true, EndTime)
end

function WBP_Abyss_Main_C:Refresh(EndTime)
  local NextRefreshTime = EndTime
  local CurrentTime = TimeUtils.NowTime()
  local RemainRefreshTime = NextRefreshTime - CurrentTime
  if RemainRefreshTime < 0 then
    RemainRefreshTime = 0
  end
  local RemainTimeStr = ""
  local TimeCount = 0
  if RemainRefreshTime > 86400 then
    TimeCount = TimeCount + 1
    RemainTimeStr = RemainTimeStr .. string.format(GText("UI_Time_Day_NotHighlight"), math.floor(RemainRefreshTime / 86400))
    RemainRefreshTime = RemainRefreshTime % 86400
  end
  if RemainRefreshTime > 3600 or 1 == TimeCount then
    TimeCount = TimeCount + 1
    RemainTimeStr = RemainTimeStr .. string.format(GText("UI_Time_Hour_NotHighlight"), math.floor(RemainRefreshTime / 3600))
    RemainRefreshTime = RemainRefreshTime % 3600
  end
  if RemainRefreshTime > 60 and TimeCount < 2 or 1 == TimeCount then
    TimeCount = TimeCount + 1
    RemainTimeStr = RemainTimeStr .. string.format(GText("UI_Time_Minute_NotHighlight"), math.floor(RemainRefreshTime / 60))
    RemainRefreshTime = RemainRefreshTime % 60
  end
  if RemainRefreshTime > 0 and TimeCount < 2 or 1 == TimeCount then
    TimeCount = TimeCount + 1
    RemainTimeStr = RemainTimeStr .. string.format(GText("UI_Time_Second_NotHighlight"), RemainRefreshTime)
  end
  self.Text_RemainTime:SetText(RemainTimeStr)
end

function WBP_Abyss_Main_C:GetSumLevelStar(AbyssLevelId)
  local AbyssLevelInfo = DataMgr.AbyssLevel[AbyssLevelId]
  local SumStar = 0
  if AbyssLevelInfo.DungeonReward1 then
    SumStar = SumStar + AbyssLevelInfo.DungeonReward1
  end
  if AbyssLevelInfo.DungeonReward2 then
    SumStar = SumStar + AbyssLevelInfo.DungeonReward2
  end
  return SumStar
end

function WBP_Abyss_Main_C:GetGotLevelStar(AbyssId, AbyssLevelId, LevelIndex)
  local Avatar = GWorld:GetAvatar()
  local GotStar = 0
  if Avatar then
    local Abyss = Avatar.Abysses[AbyssId]
    if Abyss.AbyssLevelList[LevelIndex] then
      GotStar = Abyss.AbyssLevelList[LevelIndex].MaxAbyssLevelProgress
    end
  end
  return GotStar
end

function WBP_Abyss_Main_C:GetOffsetByIndex(Index)
  if Index <= self.Mid then
    return 0
  elseif self.Max - Index <= self.Mid - 1 then
    return self.BottomOffset
  else
    local k = self.BottomOffset / (self.Max - self.Mid + 1 - self.Mid)
    local z = -k * self.Mid
    return k * Index + z
  end
end

function WBP_Abyss_Main_C:OnClickedAbyssLevelCell(AbyssLevelCell)
  if AbyssLevelCell.IsLocked then
    UIManager(self):ShowUITip(UIConst.Tip_CommonToast, string.format(GText("Abyss_BuffLockToast"), AbyssLevelCell.Index - 1))
    return
  end
  self:OpenSubUI({
    Idx = "AbyssSelect"
  }, false, self.SelectAbyssId, AbyssLevelCell.Index)
end

function WBP_Abyss_Main_C:CheckAbyssLevelIsOpen(AbyssId, AbyssLevelId, AbyssLevelIndex)
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    local MaxAbyssProgress = Avatar.Abysses[AbyssId].MaxAbyssProgress
    if AbyssLevelIndex <= MaxAbyssProgress[1] then
      return true
    elseif AbyssLevelIndex == MaxAbyssProgress[1] + 1 then
      local AbyssLevel = DataMgr.AbyssLevel
      local AbyssDungeon1 = AbyssLevel[AbyssLevelId].AbyssDungeon1
      local AbyssDungeon2 = AbyssLevel[AbyssLevelId].AbyssDungeon2
      local SumRoom = 0
      if DataMgr.AbyssDungeon[AbyssDungeon1] and DataMgr.AbyssDungeon[AbyssDungeon1].RoomId then
        SumRoom = SumRoom + #DataMgr.AbyssDungeon[AbyssDungeon1].RoomId
      end
      if DataMgr.AbyssDungeon[AbyssDungeon2] and DataMgr.AbyssDungeon[AbyssDungeon2].RoomId then
        SumRoom = SumRoom + #DataMgr.AbyssDungeon[AbyssDungeon2].RoomId
      end
      if MaxAbyssProgress[2] == SumRoom then
        return true
      end
    end
  end
  return false
end

function WBP_Abyss_Main_C:InitTable()
  self.TabConfigData = {
    TitleName = GText("Abyss_entry"),
    DynamicNode = {
      "Back",
      "BottomKey",
      "ResourceBar"
    },
    StyleName = "Text",
    OwnerPanel = self.Root,
    BackCallback = self.Root.OnClickBack,
    BottomKeyInfo = {
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
    },
    PopupInfoId = DataMgr.SystemUI.AbyssMain.PopupInfoId
  }
  local ResoucesTab = DataMgr.SystemUI.AbyssMain.TabCoin
  self.Root:InitOtherPageTab(self.TabConfigData, ResoucesTab, true)
end

function WBP_Abyss_Main_C:InitListenEvent()
  if IsValid(self.GameInputModeSubsystem) then
    self.GameInputModeSubsystem.OnInputMethodChanged:Add(self, self.RefreshOpInfoByInputDevice)
  end
end

function WBP_Abyss_Main_C:ClearListenEvent()
  if IsValid(self.GameInputModeSubsystem) then
    self.GameInputModeSubsystem.OnInputMethodChanged:Remove(self, self.RefreshOpInfoByInputDevice)
  end
end

function WBP_Abyss_Main_C:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  if CurInputDevice == ECommonInputType.Touch then
    return
  end
  local IsUseKeyAndMouse = CurInputDevice == ECommonInputType.MouseAndKeyboard
  self:UpdateUIStyleInPlatform(IsUseKeyAndMouse)
end

function WBP_Abyss_Main_C:UpdateUIStyleInPlatform(IsUseKeyAndMouse)
  if IsUseKeyAndMouse then
    self:InitKeyboardView()
  else
    self:InitGamepadView()
  end
end

function WBP_Abyss_Main_C:InitGamepadView()
  if self.Controller_Selection then
    self.Controller_Selection:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  if self.Controller_Reward then
    self.Controller_Reward:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  end
  if self.Controller_Entry then
    self.Controller_Entry:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  end
  if self.Controller_BacktoTop then
    self.Controller_BacktoTop:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  end
  if self.Controller_Store then
    self.Controller_Store:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  end
  self.Reward:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  self.Entry:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  if self:HasFocusedDescendants() or self:HasAnyUserFocus() then
    if self.SelectCell then
      self.SelectCell:SetFocus()
    else
      local Item = self.WBox_Mode:GetChildAt(0)
      Item:SetFocus()
    end
  end
end

function WBP_Abyss_Main_C:InitKeyboardView()
  if self.Controller_Selection then
    self.Controller_Selection:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  if self.Controller_Reward then
    self.Controller_Reward:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  if self.Controller_Entry then
    self.Controller_Entry:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  if self.Controller_BacktoTop then
    self.Controller_BacktoTop:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  if self.Controller_Store then
    self.Controller_Store:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  self.Reward:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  self.Entry:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
end

function WBP_Abyss_Main_C:InitWidgetInfoInGamePad()
  if self.Icon_Key_Reward then
    self.Icon_Key_Reward:CreateCommonKey({
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "Y"}
      }
    })
  end
  if self.Icon_Key_Selection then
    self.Icon_Key_Selection:CreateCommonKey({
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "LV"}
      }
    })
  end
  if self.Icon_Key_BacktoTop then
    self.Icon_Key_BacktoTop:CreateCommonKey({
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "LS"}
      }
    })
  end
  if self.Icon_Key_Entry then
    self.Icon_Key_Entry:CreateCommonKey({
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "View"}
      }
    })
  end
  if self.Controller_Store then
    self.Controller_Store:CreateCommonKey({
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "X"}
      }
    })
  end
  if self.Icon_Key_Selection then
    self.Icon_Key_Selection:CreateCommonKey({
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "Vertical"}
      }
    })
  end
end

function WBP_Abyss_Main_C:GetDesiredFocusTarget_AbyssMain()
  if self.SelectCell then
    return self.SelectCell
  else
    local Item = self.WBox_Mode:GetChildAt(0)
    return Item
  end
end

function WBP_Abyss_Main_C:OpenStore()
  UIManager(self):LoadUINew("ShopActivity", nil, nil, nil, "AbyssShop")
end

function WBP_Abyss_Main_C:InitMgr()
  self.StackSubUI = {}
  self.SubUI = {}
  EventManager:AddEvent(EventID.OnCurrentAbyssSeasonIdChange, self, self.ShowSeasonEndPopup)
  self:PlayInAnim()
end

function WBP_Abyss_Main_C:DestructMgr()
  EventManager:RemoveEvent(EventID.OnCurrentAbyssSeasonIdChange, self)
end

function WBP_Abyss_Main_C:ShowSeasonEndPopup()
  local UIManager = UIManager(self)
  local Params = {}
  
  function Params.RightCallbackFunction()
    local ExceptUIName = {"BattleMain"}
    UIManager:CloseAllUI_EX(ExceptUIName, "AbyssSeasonChange")
    UIUtils.PlayBattleMainInAnim()
  end
  
  UIManager:ShowCommonPopupUI(100225, Params)
end

function WBP_Abyss_Main_C:PlayInAnim()
  self:AddTimer(0.01, function()
    if self.Com_Tab.Play_WBP_Com_Tab_P_In then
      self.Com_Tab:Play_WBP_Com_Tab_P_In()
    elseif self.Com_Tab.Play_Com_Tab_M_In then
      self.Com_Tab:Play_Com_Tab_M_In()
    end
  end, false)
end

function WBP_Abyss_Main_C:OpenSubUI(WidgetInfo, ...)
  local TabId
  if WidgetInfo and WidgetInfo.Idx then
    TabId = WidgetInfo.Idx
  end
  if self.CurTabId == TabId then
    return self.CurSubUI
  end
  if self.CurSubUI and self.CurSubUI.SwitchOut then
    self.CurSubUI:SwitchOut(...)
  end
  if TabId then
    if not self.SubUI[TabId] then
      if "AbyssMain" ~= TabId then
        local Widget = self:CreateWidgetNew(TabId)
        if Widget then
          self.Group_Root:AddChild(Widget)
          Widget.Root = self
          Widget.WidgetInfo = WidgetInfo
          if self.CurSubUI then
            Widget.PreWidgetInfo = self.CurSubUI.WidgetInfo
          end
          local CanvasSlot = UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(Widget)
          if CanvasSlot then
            local Anchors = FAnchors()
            Anchors.Minimum = FVector2D(0, 0)
            Anchors.Maximum = FVector2D(1, 1)
            CanvasSlot:SetOffsets(FMargin(0, 0, 0, 0))
            CanvasSlot:SetAnchors(Anchors)
          end
          self.SubUI[TabId] = Widget
        end
      else
        local Widget = self
        Widget.Root = self
        Widget.WidgetInfo = WidgetInfo
        self.SubUI[TabId] = Widget
      end
    end
    self.CurTabId = TabId
    self.CurSubUI = self.SubUI[TabId]
    if self.CurSubUI and self.CurSubUI.SwitchIn then
      self.CurSubUI:SwitchIn(...)
      self.CurSubUI:SetFocus()
    end
  end
  return self.CurSubUI
end

function WBP_Abyss_Main_C:BP_GetDesiredFocusTarget()
  if self.CurSubUI == self then
    return self:GetDesiredFocusTarget_AbyssMain()
  else
    return self.CurSubUI
  end
end

function WBP_Abyss_Main_C:OnPreviewKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local IsEventHandled = false
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) and "Gamepad_LeftThumbstick" == InKeyName then
    IsEventHandled = self:TryClickedBackBtn_GamePad()
  end
  if IsEventHandled then
    return UE4.UWidgetBlueprintLibrary.Handled()
  else
    return UE4.UWidgetBlueprintLibrary.Unhandled()
  end
end

function WBP_Abyss_Main_C:OnKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local IsEventHandled = false
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) then
    if "Gamepad_FaceButton_Top" == InKeyName then
      IsEventHandled = true
      self.Reward:OnBtnClicked()
    elseif "Gamepad_FaceButton_Left" == InKeyName then
      IsEventHandled = true
      self.Store:OnBtnClicked()
    elseif "Gamepad_Special_Left" == InKeyName then
      IsEventHandled = true
      self.Entry:OnBtnClicked()
      self:OpenEntry()
    elseif "Gamepad_FaceButton_Right" == InKeyName then
      IsEventHandled = true
      self:OnReturnKeyDown()
    end
    if not IsEventHandled then
      IsEventHandled = self.Com_Tab:Handle_KeyEventOnGamePad(InKeyName)
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

function WBP_Abyss_Main_C:OnReturnKeyDown()
  UIUtils.PlayCommonBtnSe(self)
  self:OnClickBack()
end

function WBP_Abyss_Main_C:OnClickBack()
  if self.Com_Tab:IsAnimationPlaying(self.Com_Tab.In) then
    return
  end
  if self.CurSubUI ~= self and self.CurSubUI.OnReturnKeyDown then
    self.CurSubUI:OnReturnKeyDown()
  else
    self:ReturnPreWidget()
  end
end

function WBP_Abyss_Main_C:ReturnPreWidget()
  if not self.CurSubUI or not self.CurSubUI.PreWidgetInfo then
    self:PlayOutAnim()
  elseif self.CurSubUI then
    self:OpenSubUI(self.CurSubUI.PreWidgetInfo)
  end
end

function WBP_Abyss_Main_C:PlayOutAnim()
  self:UnbindAllFromAnimationFinished(self.Out)
  if self:IsAnimationPlaying(self.Out) then
    return
  end
  self:BindToAnimationFinished(self.Out, {
    self,
    self.Close
  })
  self:PlayAnimationForward(self.Out)
  self.Com_Tab:PlayAnimationForward(self.Com_Tab.Out)
  if self.IsFromActivity then
    EventManager:FireEvent(EventID.OnReturnToActivityEntry)
  end
end

function WBP_Abyss_Main_C:InitOtherPageTab(TabConfigData, ResoucesTab, DontPlayInAnim, Object, Callback)
  if TabConfigData then
    TabConfigData.OverridenTopResouces = ResoucesTab or DataMgr.SystemUI.AbyssMain.TabCoin
  end
  self.Com_Tab:Init(TabConfigData, DontPlayInAnim)
  self.Com_Tab:BindEventOnTabSelected(Object, Callback)
end

function WBP_Abyss_Main_C:Close()
  if self.SubUI then
    for _, Widget in pairs(self.SubUI) do
      if Widget ~= self then
        Widget:RemoveFromParent()
      end
    end
  end
  self.Super.Close(self)
end

function WBP_Abyss_Main_C:GetRewards(Content)
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    local function CallBack(Ret, Reward)
      local Abyss = Avatar.Abysses[Content.ConfigData.ReceiveParm.SelectAbyssId]
      
      Content.ConfigData.CanReceive = Abyss:CheckRewardCanGet(Content.ConfigData.SourceNum)
      Content.ConfigData.RewardsGot = Abyss:CheckRewardIsGot(Content.ConfigData.SourceNum)
      Content.SelfWidget:RefreshBtn(0 == Ret)
      Content.Owner:RefreshButton(Abyss:CheckHaveRewardToGet())
    end
    
    Avatar:GetAbyssReward(Content.ConfigData.ReceiveParm.SelectAbyssId, Content.ConfigData.SourceNum, CallBack)
  end
end

function WBP_Abyss_Main_C:GetAllRewards(ReceiveAllParm)
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    local function CallBack(Ret, Reward)
      local HaveReWardToGet = false
      
      for i = 0, ReceiveAllParm.SelfWidget.List_Item:GetNumItems() - 1 do
        local Item = ReceiveAllParm.SelfWidget.List_Item:GetItemAt(i)
        local Abyss = Avatar.Abysses[ReceiveAllParm.SelectAbyssId]
        local CanReceive = Abyss:CheckRewardCanGet(Item.ConfigData.SourceNum)
        local IsGot = Abyss:CheckRewardIsGot(Item.ConfigData.SourceNum)
        if CanReceive then
          HaveReWardToGet = true
        end
        Item.ConfigData.CanReceive = CanReceive
        Item.ConfigData.RewardsGot = IsGot
        if Item.SelfWidget then
          Item.SelfWidget:RefreshBtn(IsGot)
        end
      end
      ReceiveAllParm.SelfWidget:RefreshButton(HaveReWardToGet)
    end
    
    Avatar:GetAbyssAllReward(ReceiveAllParm.SelectAbyssId, CallBack)
  end
end

function WBP_Abyss_Main_C:OpenEntry()
  local ConfigData = {
    Type = 3,
    AbyssId = self.SelectAbyssId
  }
  local New = UIManager(self):LoadUINew("AbyssEntry", ConfigData)
end

function WBP_Abyss_Main_C:ShowReviewPopUp()
  local Avatar = GWorld:GetAvatar()
  local AbyssSeasonId = Avatar.CurrentAbyssSeasonId
  if not DataMgr.AbyssSeasonList[AbyssSeasonId] then
    return
  end
  if EMCache:Get("LastViewAbyss") == AbyssSeasonId then
    return
  end
  EMCache:Set("LastViewAbyss", AbyssSeasonId)
  local LastSeasonId = DataMgr.AbyssSeasonList[AbyssSeasonId].LastSeason
  if not LastSeasonId then
    return
  end
  local AbyssId = Avatar:GetAbyssSeasonBestAbyssId(LastSeasonId)
  if not AbyssId then
    return
  end
  local Params = {SeasonId = LastSeasonId, AbyssId = AbyssId}
  UIManager(self):ShowCommonPopupUI(100191, Params, self)
end

function WBP_Abyss_Main_C:TryChangeSelectedTab(NavigationDirection, Index)
  if NavigationDirection == EUINavigation.Up then
    return self:OnNavigationToIndex(Index, Index - 1)
  elseif NavigationDirection == EUINavigation.Down then
    return self:OnNavigationToIndex(Index, Index + 1)
  end
end

function WBP_Abyss_Main_C:OnNavigationToIndex(CurIndex, TargetIndex)
  if TargetIndex <= 0 or TargetIndex > #self.Index2AbyssId then
    return self.WBox_Mode:GetChildAt(CurIndex - 1)
  end
  local Cell = self.WBox_Mode:GetChildAt(TargetIndex - 1)
  Cell:OnCellClicked()
  return Cell
end

function WBP_Abyss_Main_C:FocusToFirstMission()
  return self:NavigateToFirstDisplayedItem(self.List_Level)
end

function WBP_Abyss_Main_C:NavigateToFirstDisplayedItem(List)
  local ItemUIs = List:GetDisplayedEntryWidgets()
  if ItemUIs:Length() > 0 then
    local TargetWidget
    for i = 1, ItemUIs:Length() do
      local Widget = ItemUIs:GetRef(i)
      local Index = Widget.Content.Index
      if Index and not TargetWidget then
        TargetWidget = Widget
      end
    end
    if TargetWidget then
      List:BP_NavigateToItem(TargetWidget.Content)
      return TargetWidget
    end
  end
  return List
end

function WBP_Abyss_Main_C:OnUINavigation(NavigationDirection)
  if NavigationDirection == EUINavigation.Left then
    if self.CurFocusedLevel then
      self.CurFocusedLevel:HideIcon()
    end
    self.CurFocusedLevel = nil
    return self.SelectCell
  end
end

function WBP_Abyss_Main_C:NavigateToNodeLevel(Entry)
  local Index = self.List_Level:GetIndexForItem(Entry.Content)
  local TargetIndex = Index + 2
  local Item = self.List_Level:GetItemAt(TargetIndex)
  self.List_Level:BP_NavigateToItem(Item)
  return Item.Entry
end

function WBP_Abyss_Main_C:NavigateToLastNormalLevel(Entry)
  local Index = self.List_Level:GetIndexForItem(Entry.Content)
  local TargetIndex = Index - 2
  local Item = self.List_Level:GetItemAt(TargetIndex)
  self.List_Level:BP_NavigateToItem(Item)
  return Item.Entry
end

function WBP_Abyss_Main_C:TryChangeCurFocusedMissionList(Item)
  if self.CurFocusedLevel then
    self.CurFocusedLevel:HideIcon()
  end
  self.CurFocusedLevel = Item
  self.CurFocusedLevel:ShowIcon()
end

function WBP_Abyss_Main_C:OnEntryGenerated(Entry)
  if self.IsEndless then
    if self.CanJump then
      if Entry.Content.IsNodeLevel then
        self.BacktoTop:SetVisibility(UIConst.VisibilityOp.Collapsed)
      end
    elseif Entry.Content.IsLastLevel then
      self.BacktoTop:SetVisibility(UIConst.VisibilityOp.Collapsed)
    end
  end
end

function WBP_Abyss_Main_C:OnEntryReleased(Entry)
  if self.IsEndless then
    if self.CanJump then
      if Entry.Content.IsNodeLevel then
        self.BacktoTop:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
      end
    elseif Entry.Content.IsLastLevel then
      self.BacktoTop:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    end
  end
end

return WBP_Abyss_Main_C
