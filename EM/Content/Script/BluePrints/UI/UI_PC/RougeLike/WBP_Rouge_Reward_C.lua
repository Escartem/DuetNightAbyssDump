require("UnLua")
local TimeUtils = require("Utils.TimeUtils")
local WBP_Rouge_Reward_C = Class({
  "BluePrints.UI.BP_UIState_C"
})

function WBP_Rouge_Reward_C:Destruct()
  self.Super.Destruct(self)
  self:ClearListenEvent()
end

function WBP_Rouge_Reward_C:OnLoaded(...)
  self.Super.OnLoaded(self, ...)
  self:SetFocus()
  self.Index = 0
  self.ChangeSpeed = 3
  self.PlayInAnimation = true
  self.IsInSelectState = false
  self.CurFocusedItem = nil
  self.CurCommonTabCanGet = nil
  self.RemainRefreshTime = nil
  self.Btn_Click:SetVisibility(UIConst.VisibilityOp.Visible)
  self.Btn_Click.OnClicked:Add(self, self.PlayOutAnim)
  self.Btn_Close:Init("Close", self, self.PlayOutAnim)
  self.Btn_GetAllBtn:BindEventOnClicked(self, self.GetRougeLikeReward)
  self.Btn_GetAllBtn:SetText(GText("UI_Mail_Recieveall"))
  self.Text_Title:SetText(GText("UI_Rougelike_RewardScore"))
  self.Text_Desc:SetText(GText("UI_Rougelike_WeekRewardDesc"))
  self.Text_Click:SetText(GText("UI_RougeLike_ClickEmptyContinue"))
  self.List_Reward:SetScrollbarVisibility(UIConst.VisibilityOp.Hidden)
  self.List_Reward:SetControlScrollbarInside(false)
  self:SetInfo()
  self:SetTimer()
  if self.GameInputModeSubsystem:GetCurrentInputType() == ECommonInputType.Touch then
    self.Key_Tips:SetVisibility(UIConst.VisibilityOp.Collapsed)
  else
    self.Key_Tips:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  end
  self:PlayAnimation(self.In)
  if not ReddotManager.GetTreeNode("RougeLikeReward") then
    ReddotManager.AddNode("RougeLikeReward")
  end
  ReddotManager.AddListener("RougeLikeReward", self, self.UpdateButton)
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
  if IsValid(self.GameInputModeSubsystem) then
    self:RefreshOpInfoByInputDevice(self.GameInputModeSubsystem:GetCurrentInputType(), self.GameInputModeSubsystem:GetCurrentGamepadName())
  end
  self:InitListenEvent()
  self:InitWidgetInfoInGamePad()
end

function WBP_Rouge_Reward_C:SetInfo()
  local ClassPath = "/Game/UI/UI_PC/Common/Common_Item_subsize_PC_Content.Common_Item_subsize_PC_Content_C"
  self.List_Reward:SetVisibility(ESlateVisibility.HitTestInvisible)
  self.List_Reward:ClearListItems()
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    local SeasonId = Avatar.RougeLike.ProgressingSeasonId
    local RougeLikeSeasonInfo = DataMgr.RougeLikeSeason[SeasonId]
    if RougeLikeSeasonInfo and RougeLikeSeasonInfo.EndPointsIcon then
      local Icon = LoadObject(RougeLikeSeasonInfo.EndPointsIcon)
      if Icon then
        self.Icon_Token:SetBrushResourceObject(Icon)
      end
    end
    local RougeLikeRewardId = Avatar.RougeLike.WeeklyRewardId
    local RewardInfo = DataMgr.RougeLikeReward[RougeLikeRewardId]
    if RewardInfo and RewardInfo.Reward and RewardInfo.EachGradePoints then
      self.MaxRewardGot = #RewardInfo.Reward
      local CurWeeklyMaxScore = Avatar.RougeLike.WeeklyTotalScore
      local MaxScore = #RewardInfo.Reward * RewardInfo.EachGradePoints
      if CurWeeklyMaxScore > MaxScore then
        CurWeeklyMaxScore = MaxScore
      end
      self.EachGradePoints = RewardInfo.EachGradePoints
      local CurCanGetRewardGot = math.floor(CurWeeklyMaxScore / RewardInfo.EachGradePoints)
      self.ScrollIndex = CurCanGetRewardGot
      self.Text_Score:SetText(CurWeeklyMaxScore)
      self.Text_MaxScore:SetText(MaxScore)
    end
    local Object = NewObject(UE4.LoadClass(ClassPath))
    Object.NotReward = true
    self.List_Reward:AddItem(Object)
  end
  self:AddTimer(0.001, function()
    local MaxCount = UIUtils.GetListViewContentMaxCount(self.List_Reward)
    self.List_Reward:SetEmptyGridItemCount(0)
    self.Mid = math.ceil(MaxCount / 2)
    self.List_Reward:ClearListItems()
    if Avatar then
      local RougeLikeRewardId = Avatar.RougeLike.WeeklyRewardId
      local RewardInfo = DataMgr.RougeLikeReward[RougeLikeRewardId]
      if RewardInfo and RewardInfo.Reward and RewardInfo.EachGradePoints then
        for Index, RewardId in ipairs(RewardInfo.Reward) do
          local Object = NewObject(UE4.LoadClass(ClassPath))
          Object.RewardInfoId = RewardId
          Object.GradePoints = RewardInfo.EachGradePoints * Index
          Object.StartTime = UGameplayStatics.GetTimeSeconds(self)
          Object.Index = Index
          Object.Parent = self
          self.List_Reward:AddItem(Object)
        end
      end
    end
    self:AddTimer(0.001, function()
      self.List_Reward:ScrollToBottom(self.ScrollIndex)
      self:AddTimer(0.001, function()
        self.BottomOffset = self.List_Reward:GetScrollOffset()
        self:GetOffsetByIndex(self.ScrollIndex)
        self.List_Reward:ScrollToTop()
        self.LerpAlpha = 0
        self:AddTimer(0.033, function(_, DeltaTime)
          self.LerpAlpha = self.LerpAlpha + self.ChangeSpeed * DeltaTime
          if self.LerpAlpha >= 1 then
            self.LerpAlpha = 1
            self.List_Reward:SetScrollOffset(self.TargetOffset)
            self.PlayInAnimation = false
            self.List_Reward:SetVisibility(ESlateVisibility.Visible)
            if self.ScrollIndex > 0 then
              self.List_Reward:NavigateToIndex(self.ScrollIndex - 1)
            else
              self.List_Reward:NavigateToIndex(0)
            end
            self:RemoveTimer("UpdateOffset")
            return
          end
          local Offset = UE4.UKismetMathLibrary.Lerp(0, self.TargetOffset, self.LerpAlpha)
          self.List_Reward:SetScrollOffset(Offset)
        end, true, 0, "UpdateOffset", true, 0.033)
      end)
    end)
  end)
end

function WBP_Rouge_Reward_C:GetOffsetByIndex(Index)
  if Index <= self.Mid then
    self.TargetOffset = 0
  elseif self.MaxRewardGot - Index <= self.Mid - 1 then
    self.TargetOffset = self.BottomOffset
  else
    local k = self.BottomOffset / (self.MaxRewardGot - self.Mid + 1 - self.Mid)
    local z = -k * self.Mid
    self.TargetOffset = k * Index + z
  end
end

function WBP_Rouge_Reward_C:SetTimer()
  self:Refresh()
  self:AddTimer(1, self.Refresh, true, 0, "RefreshRougeRewardTimer", true)
end

function WBP_Rouge_Reward_C:Refresh()
  local refresh_hms = CommonConst.GAME_REFRESH_HMS
  local NextRefreshTime = TimeUtils.NextWeeklyRefreshTime(nil, refresh_hms)
  local CurrentTime = TimeUtils.NowTime()
  local RemainRefreshTime = NextRefreshTime - CurrentTime
  if self.RemainRefreshTime and RemainRefreshTime > self.RemainRefreshTime then
    self:SetInfo()
  end
  self.RemainRefreshTime = RemainRefreshTime
  local RemainTimeStr = ""
  local TimeCount = 0
  if RemainRefreshTime > 86400 then
    TimeCount = TimeCount + 1
    RemainTimeStr = RemainTimeStr .. string.format(GText("UI_Rougelike_Reward_Day"), math.floor(RemainRefreshTime / 86400))
    RemainRefreshTime = RemainRefreshTime % 86400
  end
  if RemainRefreshTime > 3600 or 1 == TimeCount then
    TimeCount = TimeCount + 1
    RemainTimeStr = RemainTimeStr .. string.format(GText("UI_Rougelike_Reward_Hour"), math.floor(RemainRefreshTime / 3600))
    RemainRefreshTime = RemainRefreshTime % 3600
  end
  if RemainRefreshTime > 60 and TimeCount < 2 or 1 == TimeCount then
    TimeCount = TimeCount + 1
    RemainTimeStr = RemainTimeStr .. string.format(GText("UI_Rougelike_Reward_Minute"), math.floor(RemainRefreshTime / 60))
    RemainRefreshTime = RemainRefreshTime % 60
  end
  if RemainRefreshTime > 0 and TimeCount < 2 or 1 == TimeCount then
    TimeCount = TimeCount + 1
    RemainTimeStr = RemainTimeStr .. string.format(GText("UI_Rougelike_Reward_Second"), RemainRefreshTime)
  end
  self.Text_RemainTime:SetText(RemainTimeStr)
end

function WBP_Rouge_Reward_C:OnKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local IsEventHandled = false
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) then
    if InKeyName == UIConst.GamePadKey.FaceButtonTop then
      IsEventHandled = true
      self:TryGetRougeLikeReward()
    elseif InKeyName == UIConst.GamePadKey.FaceButtonRight then
      IsEventHandled = true
      self:PlayOutAnim()
    end
  elseif "Escape" == InKeyName then
    IsEventHandled = true
    self:PlayOutAnim()
  end
  if IsEventHandled then
    return UE4.UWidgetBlueprintLibrary.Handled()
  else
    return UE4.UWidgetBlueprintLibrary.UnHandled()
  end
end

function WBP_Rouge_Reward_C:OnPreviewKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local IsEventHandled = false
  if "SpaceBar" == InKeyName then
    IsEventHandled = true
    self:TryGetRougeLikeReward()
  end
  if IsEventHandled then
    return UE4.UWidgetBlueprintLibrary.Handled()
  else
    return UE4.UWidgetBlueprintLibrary.UnHandled()
  end
end

function WBP_Rouge_Reward_C:PlayOutAnim()
  if self:IsAnimationPlaying(self.In) then
    return
  end
  if self:IsAnimationPlaying(self.Out) then
    return
  end
  self:BindToAnimationFinished(self.Out, {
    self,
    self.Close
  })
  self:PlayAnimationForward(self.Out)
end

function WBP_Rouge_Reward_C:UpdateItems()
  local Entrys = self.List_Reward:GetDisplayedEntryWidgets()
  local Len = Entrys:Length()
  for i = Len, 1, -1 do
    if Entrys[i]:CheckIsCompleteState() then
      Entrys[i]:ChangeState("Received")
    end
  end
end

function WBP_Rouge_Reward_C:GetRougeLikeReward()
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    local function Callback(Rewards)
      self:UpdateItems()
      
      ReddotManager.ClearLeafNodeCount("RougeLikeReward")
      UIUtils.ShowGetItemPageAndOpenBagIfNeeded(nil, nil, nil, Rewards, false, function()
        self:SetFocus()
      end, self)
    end
    
    Avatar:GetRougeLikeWeeklyReward(Callback)
  end
end

function WBP_Rouge_Reward_C:TryGetRougeLikeReward()
  if self.Btn_GetAllBtn:GetVisibility() == ESlateVisibility.SelfHitTestInvisible then
    self:GetRougeLikeReward()
  end
end

function WBP_Rouge_Reward_C:UpdateButton()
  local CacheDetail = ReddotManager.GetTreeNode("RougeLikeReward")
  if not CacheDetail then
    self.Btn_GetAllBtn:SetVisibility(ESlateVisibility.Collapsed)
    return
  end
  if CacheDetail.Count and CacheDetail.Count > 0 then
    self.Btn_GetAllBtn:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  else
    self.Btn_GetAllBtn:SetVisibility(ESlateVisibility.Collapsed)
  end
  if self.GameInputModeSubsystem:GetCurrentInputType() == ECommonInputType.MouseAndKeyboard then
    self:InitKeyboardCommonTab()
  end
end

function WBP_Rouge_Reward_C:CheckHaveAnyRewardCanGet()
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    local WeeklyTotalScore = Avatar.RougeLike.WeeklyTotalScore or 0
    local RougeLikeRewardId = Avatar.RougeLike.WeeklyRewardId
    if RougeLikeRewardId then
      local RewardInfo = DataMgr.RougeLikeReward[RougeLikeRewardId]
      if RewardInfo and RewardInfo.Reward and RewardInfo.EachGradePoints then
        for Index, RewardId in ipairs(RewardInfo.Reward) do
          local GradePoints = RewardInfo.EachGradePoints * Index
          if WeeklyTotalScore >= GradePoints and not Avatar:IsRougeLikeWeeklyRewardGot(Index) then
            return true
          end
        end
      end
    end
  end
  return false
end

function WBP_Rouge_Reward_C:Close()
  self.Super.Close(self)
  ReddotManager.RemoveListener("RougeLikeReward", self)
end

function WBP_Rouge_Reward_C:InitListenEvent()
  if IsValid(self.GameInputModeSubsystem) then
    self.GameInputModeSubsystem.OnInputMethodChanged:Add(self, self.RefreshOpInfoByInputDevice)
  end
end

function WBP_Rouge_Reward_C:ClearListenEvent()
  if IsValid(self.GameInputModeSubsystem) then
    self.GameInputModeSubsystem.OnInputMethodChanged:Remove(self, self.RefreshOpInfoByInputDevice)
  end
end

function WBP_Rouge_Reward_C:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  if CurInputDevice == ECommonInputType.Touch then
    return
  end
  local IsUseKeyAndMouse = CurInputDevice == ECommonInputType.MouseAndKeyboard
  self:UpdateUIStyleInPlatform(IsUseKeyAndMouse)
end

function WBP_Rouge_Reward_C:UpdateUIStyleInPlatform(IsUseKeyAndMouse)
  if IsUseKeyAndMouse then
    self:InitKeyboardView()
  else
    self:InitGamepadView()
  end
end

function WBP_Rouge_Reward_C:InitGamepadView()
  if UIUtils.HasAnyFocus(self) then
    self:SetFocus()
    self:NavigateToFirstDisplayedItem(self.List_Reward)
  end
  self.Btn_GetAllBtn:SetGamePadVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  self:InitCommonTab(false)
end

function WBP_Rouge_Reward_C:InitKeyboardView()
  self.Btn_GetAllBtn:SetGamePadVisibility(UIConst.VisibilityOp.Collapsed)
  if self.CurFocusedItem then
    self:TryLeaveSelectMode(self.CurFocusedItem)
  end
  self.CurFocusedItem = nil
  self:InitKeyboardCommonTab()
end

function WBP_Rouge_Reward_C:InitWidgetInfoInGamePad()
  self.Btn_GetAllBtn:SetDefaultGamePadImg("Y")
end

function WBP_Rouge_Reward_C:TryEnterSelectMode(Entry)
  if self.IsInSelectState then
    return false
  end
  Entry:EnterSelectMode()
  self:InitSelectTab()
  self.IsInSelectState = true
  return true
end

function WBP_Rouge_Reward_C:TryLeaveSelectMode(Entry)
  if not self.IsInSelectState then
    return false
  end
  Entry:LeaveSelectMode()
  if Entry:CheckIsCompleteState() then
    self:InitCommonTab(true)
  else
    self:InitCommonTab(false)
  end
  self.IsInSelectState = false
  return true
end

function WBP_Rouge_Reward_C:NavigateToFirstDisplayedItem(List)
  local ItemUIs = List:GetDisplayedEntryWidgets()
  if ItemUIs:Length() > 0 then
    local TargetWidget
    for i = 1, ItemUIs:Length() do
      local Widget = ItemUIs:GetRef(i)
      local Index = Widget.Content.Index
      if Index and (not TargetWidget or Index < TargetWidget.Content.Index) then
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

function WBP_Rouge_Reward_C:TryChangeCurFocusedItem(Item)
  self.CurFocusedItem = Item
  if self.GameInputModeSubsystem:GetCurrentInputType() == ECommonInputType.Gamepad and not self.IsInSelectState then
    if self.CurFocusedItem:CheckIsCompleteState() then
      self:InitCommonTab(true)
    else
      self:InitCommonTab(false)
    end
  end
end

function WBP_Rouge_Reward_C:InitKeyboardCommonTab()
  self.CurCommonTabCanGet = nil
  local BottomKeyInfo = {
    {
      KeyInfoList = {
        {
          Type = "Text",
          Text = "Esc",
          ClickCallback = self.PlayOutAnim,
          Owner = self
        }
      },
      Desc = GText("UI_BACK")
    }
  }
  if self:CheckHaveAnyRewardCanGet() then
    table.insert(BottomKeyInfo, 1, {
      KeyInfoList = {
        {
          Type = "Text",
          Text = "Space",
          ClickCallback = self.GetRougeLikeReward,
          Owner = self
        }
      },
      Desc = GText("UI_GameEvent_ClaimAll"),
      bLongPress = false
    })
  end
  self.Key_Tips:UpdateKeyInfo(BottomKeyInfo)
end

function WBP_Rouge_Reward_C:InitCommonTab(CanGet)
  if self.CurCommonTabCanGet == CanGet then
    return
  end
  self.CurCommonTabCanGet = CanGet
  local BottomKeyInfo = {
    {
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "LS"}
      },
      Desc = GText("UI_Controller_CheckReward")
    },
    {
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "B"}
      },
      Desc = GText("UI_BACK")
    }
  }
  if CanGet then
    table.insert(BottomKeyInfo, 2, {
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "A"}
      },
      Desc = GText("UI_Achievement_GetReward")
    })
  end
  self.Key_Tips:UpdateKeyInfo(BottomKeyInfo)
end

function WBP_Rouge_Reward_C:InitSelectTab()
  self.CurCommonTabCanGet = nil
  local BottomKeyInfo = {
    {
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "A"}
      },
      Desc = GText("UI_Tips_Ensure")
    },
    {
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "B"}
      },
      Desc = GText("UI_BACK")
    }
  }
  self.Key_Tips:UpdateKeyInfo(BottomKeyInfo)
end

function WBP_Rouge_Reward_C:InitEmptyTab()
  self.CurCommonTabCanGet = nil
  local BottomKeyInfo = {}
  self.Key_Tips:UpdateKeyInfo(BottomKeyInfo)
end

function WBP_Rouge_Reward_C:OnMenuOpenChanged(bIsOpen)
  if bIsOpen then
    self:InitEmptyTab()
    self.Btn_Click:SetVisibility(UIConst.VisibilityOp.Collapsed)
  else
    self.Btn_Click:SetVisibility(UIConst.VisibilityOp.Visible)
    if self.GameInputModeSubsystem:GetCurrentInputType() == ECommonInputType.Gamepad then
      if self.IsInSelectState then
        self:InitSelectTab()
      elseif self.CurFocusedItem and self.CurFocusedItem:CheckIsCompleteState() then
        self:InitCommonTab(true)
      else
        self:InitCommonTab(false)
      end
    else
      self:InitKeyboardCommonTab()
    end
  end
end

return WBP_Rouge_Reward_C
