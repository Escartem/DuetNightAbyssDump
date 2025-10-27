require("UnLua")
local TimeUtils = require("Utils.TimeUtils")
local M = Class("BluePrints.UI.BP_UIState_C")

function M:Construct()
  EventManager:AddEvent(EventID.OnGetFeiNaReward, self, self.OnGetFeiNaReward)
  EventManager:FireEvent(EventID.OnLeaveActivityEntry)
end

function M:Destruct()
  EventManager:RemoveEvent(EventID.OnGetFeiNaReward, self)
end

function M:OnGetFeiNaReward()
  local Avatar = GWorld:GetAvatar()
  local FeinaEventData = DataMgr.FeinaEvent
  for Index = 1, #FeinaEventData do
    local FeinaEventConfig = DataMgr.FeinaEvent[Index]
    local RewardInfo1 = Avatar and Avatar:GetFeinaRewardInfo(FeinaEventConfig.DungeonId[1]) or {}
    local RewardInfo2 = Avatar and Avatar:GetFeinaRewardInfo(FeinaEventConfig.DungeonId[2]) or {}
    local GetRewardCount = 0
    for i, Tag in pairs(RewardInfo1) do
      if Tag >= 1 then
        GetRewardCount = GetRewardCount + 1
      end
    end
    for i, Tag in pairs(RewardInfo2) do
      if Tag >= 1 then
        GetRewardCount = GetRewardCount + 1
      end
    end
    local FeinaLevelPanel = self["Level0" .. Index]
    FeinaLevelPanel.Text_Progress:SetText(GetRewardCount .. "/" .. FeinaEventConfig.RewardNum)
  end
end

function M:OnLoaded(...)
  local FeinaEventId = DataMgr.EventConstant.FeinaEventId.ConstantValue
  self.EventMainConfig = DataMgr.EventMain[FeinaEventId]
  self.LevelTable = {
    self.Level01,
    self.Level02,
    self.Level03,
    self.Level04
  }
  self.Reward:SetVisibility(self.EventMainConfig.PermanenEventTime and self.EventMainConfig.PermanenEventTime < TimeUtils.NowTime() and UE4.ESlateVisibility.Collapsed or UE4.ESlateVisibility.SelfHitTestInvisible)
  self.Reward.Btn_Click.OnClicked:Add(self, self.OnRewardBtnClick)
  self.Reward:Init()
  self:InitCommonTab()
  self:InitLevelPanel()
  self:SetLevelFocus()
  self:NormalPlayInAnimation()
  self:RefreshOpInfoByInputDevice()
  self.Reward.Key_Controller:CreateCommonKey({
    KeyInfoList = {
      {
        Type = "Img",
        ImgShortPath = "Y",
        Owner = self
      }
    }
  })
  self.Level01.Btn_Click:SetFocus()
  self:AddDelayFrameFunc(function()
    self.Level01.Btn_Click:SetFocus()
  end, 2)
  AudioManager(self):PlayUISound(self, "event:/ui/activity/feina_chapter_page_in", nil, nil)
end

function M:SetLevelFocus()
  local PreLevel
  for i = 1, #self.LevelTable do
    local CurLevel = self.LevelTable[i]
    local NextLevel = i ~= #self.LevelTable and self.LevelTable[i + 1]
    CurLevel:SettNavigationUI(PreLevel, NextLevel)
    PreLevel = CurLevel
  end
end

function M:InitCommonTab()
  self.Tab:Init({
    DynamicNode = {"Back", "BottomKey"},
    BottomKeyInfo = {},
    TitleName = GText("Event_Title_103010"),
    StyleName = "Text",
    OwnerPanel = self,
    BackCallback = self.CloseSelf,
    BottomKeyInfo = {
      {
        GamePadInfoList = {
          {Type = "Img", ImgShortPath = "A"}
        },
        Desc = GText("UI_Tips_Ensure")
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
          {Type = "Img", ImgShortPath = "B"}
        },
        Desc = GText("UI_BACK")
      }
    }
  })
end

function M:UpdateBottomKeyInfo()
  if UIUtils.IsMobileInput() then
    return
  end
  local BottomKeyInfo
  if self.CurSubUI and not self.CurSubUI.IsClose then
    if self.CurSubUI.IsGamepadClickItem then
      BottomKeyInfo = {
        {
          GamePadInfoList = {
            {Type = "Img", ImgShortPath = "A"}
          },
          Desc = GText("UI_Controller_CheckDetails")
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
            {Type = "Img", ImgShortPath = "B"}
          },
          Desc = GText("UI_BACK")
        }
      }
    else
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
            {Type = "Img", ImgShortPath = "B"}
          },
          Desc = GText("UI_BACK")
        }
      }
    end
  else
    BottomKeyInfo = {
      {
        GamePadInfoList = {
          {Type = "Img", ImgShortPath = "A"}
        },
        Desc = GText("UI_Tips_Ensure")
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
          {Type = "Img", ImgShortPath = "B"}
        },
        Desc = GText("UI_BACK")
      }
    }
  end
  self.Tab:UpdateBottomKeyInfo(BottomKeyInfo)
end

function M:CloseBottomKetInfo()
  if UIUtils.IsMobileInput() then
    return
  end
  self.Tab:UpdateBottomKeyInfo({})
end

function M:NormalPlayInAnimation()
  self:PlayAnimation(self.In)
end

function M:CloseSelf()
  if self:IsAnimationPlaying(self.Out) then
    return
  end
  if self.CurSubUI and not self.CurSubUI.IsClose then
    if self.CurSubUI.IsGamepadClickItem then
      self.CurSubUI.IsGamepadClickItem = false
      self.CurSubUI:SetFocus()
    else
      self.CurSubUI:CloseSelf()
      self:PlayAnimation(self.Back)
      self["Level0" .. self.CurSubUI.Index].Btn_Click:SetFocus()
    end
    self:UpdateBottomKeyInfo()
  else
    self:PlayAnimation(self.Out)
    EventManager:FireEvent(EventID.OnReturnToActivityEntry)
  end
end

function M:DirectlyClose()
  if self.CurSubUI and not self.CurSubUI.IsClose then
    self.CurSubUI:DirectlyClose()
  end
  self:Close()
end

function M:OnAnimationFinished(InAnimation)
  if InAnimation == self.Out then
    self:Close()
  end
end

function M:InitLevelPanel()
  local FeinaEventData = DataMgr.FeinaEvent
  for i = 1, #FeinaEventData do
    self:InitLevelPanelById(i)
  end
  self.Reward.Text_Reward:SetText(GText("PermanenEventReward"))
end

function M:InitLevelPanelById(Index)
  if not self["Level0" .. Index] then
    return
  end
  local FeinaEventConfig = DataMgr.FeinaEvent[Index]
  local FeinaLevelPanel = self["Level0" .. Index]
  FeinaLevelPanel.Text_Name:SetText(GText(FeinaEventConfig.DungeonName))
  local Avatar = GWorld:GetAvatar()
  local IsOpen = ConditionUtils.CheckCondition(Avatar, FeinaEventConfig.Condition)
  FeinaLevelPanel.Panel_Lock:SetVisibility(IsOpen and UE4.ESlateVisibility.Collapsed or UE4.ESlateVisibility.SelfHitTestInvisible)
  FeinaLevelPanel.Index = Index
  FeinaLevelPanel.IsActivityOpen = IsOpen
  FeinaLevelPanel.DungeonId = FeinaEventConfig.DungeonId
  FeinaLevelPanel:PlayAnimation(IsOpen and FeinaLevelPanel.Normal or FeinaLevelPanel.Forbidden)
  FeinaLevelPanel.RootPanel = self
  if IsOpen then
    if self.EventMainConfig.PermanenEventTime and self.EventMainConfig.PermanenEventTime >= TimeUtils.NowTime() then
      FeinaLevelPanel.Panel_Complete:SetVisibility(UE4.ESlateVisibility.Collapsed)
      FeinaLevelPanel.Panel_Progress:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
      local RewardInfo1 = Avatar and Avatar:GetFeinaRewardInfo(FeinaEventConfig.DungeonId[1]) or {}
      local RewardInfo2 = Avatar and Avatar:GetFeinaRewardInfo(FeinaEventConfig.DungeonId[2]) or {}
      local GetRewardCount = 0
      for i, Tag in pairs(RewardInfo1) do
        if Tag >= 1 then
          GetRewardCount = GetRewardCount + 1
        end
      end
      for i, Tag in pairs(RewardInfo2) do
        if Tag >= 1 then
          GetRewardCount = GetRewardCount + 1
        end
      end
      FeinaLevelPanel.Text_Progress:SetText(GetRewardCount .. "/" .. FeinaEventConfig.RewardNum)
    else
      FeinaLevelPanel.Panel_Complete:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
      FeinaLevelPanel.Panel_Progress:SetVisibility(UE4.ESlateVisibility.Collapsed)
      local IsPassDungeon1, IsPassDungeon2 = self:GetPassDungeon(Index)
      FeinaLevelPanel.Level02:SetVisibility(FeinaEventConfig.DungeonId[2] and UE4.ESlateVisibility.SelfHitTestInvisible or UE4.ESlateVisibility.Collapsed)
      if not IsPassDungeon1 then
        FeinaLevelPanel.Level01:PlayAnimation(FeinaLevelPanel.Level01.Progress)
        FeinaLevelPanel.Level02:PlayAnimation(FeinaLevelPanel.Level02.Progress)
      elseif FeinaEventConfig.DungeonId[2] then
        FeinaLevelPanel.Level01:PlayAnimation(not IsPassDungeon1 and FeinaLevelPanel.Level01.Progress or FeinaLevelPanel.Level01.Finish)
        FeinaLevelPanel.Level02:PlayAnimation(not IsPassDungeon2 and FeinaLevelPanel.Level02.Progress or FeinaLevelPanel.Level02.Finish)
      else
        FeinaLevelPanel.Level01:PlayAnimation(not IsPassDungeon1 and FeinaLevelPanel.Level01.Progress or FeinaLevelPanel.Level01.Finish)
        FeinaLevelPanel.Level02:PlayAnimation(not IsPassDungeon2 and FeinaLevelPanel.Level02.Progress or FeinaLevelPanel.Level02.Finish)
      end
    end
    self["Spine_Level0" .. Index].Spine_Story:SetAnimation(0, "Normal", true)
  else
    FeinaLevelPanel.Panel_Progress:SetVisibility(UE4.ESlateVisibility.Collapsed)
    FeinaLevelPanel.Panel_Complete:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
end

function M:PlayHoverSpineAnim(Index)
  if not self["Level0" .. Index] then
    return
  end
  self["Spine_Level0" .. Index].Spine_Story:SetAnimation(0, "Hover", false)
  self["Spine_Level0" .. Index].Spine_Story:AddAnimation(0, "Loop", true, 0)
end

function M:PlayUnHoverSpineAnim(Index)
  if not self["Level0" .. Index] then
    return
  end
  self["Spine_Level0" .. Index].Spine_Story:SetAnimation(0, "Normal", false)
end

function M:OpenSubUI(TabId, Index)
  self:CreateSubUI(TabId)
  self:InitCurSubUI(Index)
  if self.CurSubUI then
    self.CurSubUI:PlayAnimation(self.CurSubUI.In)
  end
end

function M:CreateSubUI(TabId)
  if self.CurSubUI then
    return
  end
  local Widget = self:CreateWidgetNew(TabId)
  if not Widget then
    return
  end
  self.CurSubUI = Widget
  self.Group_Root:AddChild(Widget)
  Widget.RootPanel = self
  local CanvasSlot = UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(Widget)
  if CanvasSlot then
    local Anchors = FAnchors()
    Anchors.Minimum = FVector2D(0, 0)
    Anchors.Maximum = FVector2D(1, 1)
    CanvasSlot:SetOffsets(FMargin(0, 0, 0, 0))
    CanvasSlot:SetAnchors(Anchors)
  end
end

function M:GetPassDungeon(Index)
  local FeinaEventConfig = DataMgr.FeinaEvent[Index]
  local DungeonId = FeinaEventConfig.DungeonId
  local Avatar = GWorld:GetAvatar()
  local IsPassDungeon1 = Avatar and Avatar:IsPassDungeon(DungeonId[1])
  local IsPassDungeon2 = Avatar and Avatar:IsPassDungeon(DungeonId[2])
  return IsPassDungeon1, IsPassDungeon2
end

function M:InitCurSubUI(Index)
  if not self.CurSubUI then
    return
  end
  local FeinaEventConfig = DataMgr.FeinaEvent[Index]
  local DungeonId = FeinaEventConfig.DungeonId
  local IsPassDungeon1, IsPassDungeon2 = self:GetPassDungeon(Index)
  self.CurSubUI:InitLevelDetail(DungeonId, IsPassDungeon1, IsPassDungeon2, Index)
  self.CurSubUI:SetFocus()
  self:PlayAnimation(self.Next)
  self:UpdateBottomKeyInfo()
end

function M:RefreshCurSubUI(Index)
  if not self.CurSubUI then
    return
  end
  local FeinaEventConfig = DataMgr.FeinaEvent[Index]
  if not FeinaEventConfig then
    return
  end
  if not self["Level0" .. Index].IsActivityOpen then
    FeinaEventConfig = DataMgr.FeinaEvent[Index]
    local FeinaEventDungeonConfig = DataMgr.FeinaEventDungeon[FeinaEventConfig.DungeonId[1]]
    UIManager(GWorld.GameInstance):ShowUITip(UIConst.Tip_CommonToast, FeinaEventDungeonConfig.LockToast and GText(FeinaEventDungeonConfig.LockToast) or "")
    return
  end
  local DungeonId = FeinaEventConfig.DungeonId
  local IsPassDungeon1, IsPassDungeon2 = self:GetPassDungeon(Index)
  self.CurSubUI:InitLevelDetail(DungeonId, IsPassDungeon1, IsPassDungeon2, Index)
  self.CurSubUI:PlayAnimation(self.CurSubUI.Change)
  self.CurSubUI:SetFocus()
end

function M:Destruct()
  self.Reward.Btn_Click.OnClicked:Remove(self, self.OnRewardBtnClick)
  self.IsFirstFocus = false
  self.Super.Destruct(self)
end

function M:OnKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if "Gamepad_FaceButton_Top" == InKeyName then
    self:OnRewardBtnClick()
  end
  if self.CurSubUI and not self.CurSubUI.IsClose then
    self:ParentOnKeyDown(MyGeometry, InKeyEvent)
  elseif "Escape" == InKeyName or "Gamepad_FaceButton_Right" == InKeyName then
    self:CloseSelf()
  end
  return UE4.UWidgetBlueprintLibrary.Handled()
end

function M:ParentOnKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if "Gamepad_FaceButton_Top" == InKeyName then
    self.CurSubUI:OnRewardBtnClick()
  elseif InKeyName == UIConst.GamePadKey.LeftShoulder and self.CurSubUI.RootPanel["Level0" .. self.CurSubUI.Index - 1] and not self.CurSubUI.IsGamepadClickItem then
    self.CurSubUI:ShowPreDungeon()
  elseif InKeyName == UIConst.GamePadKey.RightShoulder and self.CurSubUI.RootPanel["Level0" .. self.CurSubUI.Index + 1] and not self.CurSubUI.IsGamepadClickItem then
    self.CurSubUI:ShowNextDungeon()
  elseif InKeyName == UIConst.GamePadKey.LeftTriggerThreshold and not self.CurSubUI.IsGamepadClickItem then
    self.CurSubUI:OnBtnClick1()
  elseif InKeyName == UIConst.GamePadKey.RightTriggerThreshold and not self.CurSubUI.IsGamepadClickItem then
    self.CurSubUI:OnBtnClick2()
  elseif InKeyName == UIConst.GamePadKey.FaceButtonLeft and not self.CurSubUI.IsGamepadClickItem then
    self.CurSubUI:GoToDungeon()
  elseif "Escape" == InKeyName or "Gamepad_FaceButton_Right" == InKeyName then
    if self.CurSubUI.IsGamepadClickItem then
      self.CurSubUI:SetFocus()
      self.CurSubUI:HideGamepadTips(false)
      self.CurSubUI.IsGamepadClickItem = false
      self:UpdateBottomKeyInfo()
    else
      self:CloseSelf()
    end
  elseif InKeyName == UIConst.GamePadKey.LeftThumb then
    if self.CurSubUI.IsGamepadClickItem then
      self.CurSubUI:SetFocus()
      self.CurSubUI:HideGamepadTips(false)
    else
      self.CurSubUI.List_Reward:SetFocus()
      self.CurSubUI:HideGamepadTips(true)
    end
    self.CurSubUI.IsGamepadClickItem = not self.CurSubUI.IsGamepadClickItem
    self:UpdateBottomKeyInfo()
  end
  return UE4.UWidgetBlueprintLibrary.Handled()
end

function M:OnRewardBtnClick()
  if self.EventMainConfig.PermanenEventTime and self.EventMainConfig.PermanenEventTime >= TimeUtils.NowTime() then
    UIManager(self):LoadUINew("FeinaEventReward")
  end
end

function M:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  self.Reward.Key_Controller:SetVisibility(UIUtils.IsGamepadInput() and UE4.ESlateVisibility.SelfHitTestInvisible or UE4.ESlateVisibility.Collapsed)
  if self.CurSubUI and not self.CurSubUI.IsClose then
    self.CurSubUI:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  elseif UIUtils.IsGamepadInput() and not self.IsFirstFocus then
    self.IsFirstFocus = true
    self.Level01.Btn_Click:SetFocus()
  end
end

return M
