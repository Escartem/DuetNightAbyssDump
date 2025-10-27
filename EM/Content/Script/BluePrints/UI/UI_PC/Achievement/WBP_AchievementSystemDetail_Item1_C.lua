require("UnLua")
local M = Class("BluePrints.UI.BP_EMUserWidget_C")

function M:Destruct()
  if self.ID then
    ReddotManager.RemoveListener("AchvType" .. self.ID, self)
  end
end

function M:OnListItemObjectSet(Content)
  if self.ID then
    ReddotManager.RemoveListener("AchvType" .. self.ID, self)
  end
  self.ID = Content.ID
  self.Index = Content.Index
  self.AchievementSystem = Content.AchievementSystem
  self.Content = Content
  local data = DataMgr.AchievementType[Content.ID]
  if self.Index < 0 then
    self.Group_Normal:SetVisibility(ESlateVisibility.Collapsed)
    self.Group_Empty:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self.Common_List_Subcell_PC_0:SetRenderOpacity(0.5)
    self.Common_List_Subcell_PC_0:SetVisibility(ESlateVisibility.HitTestInvisible)
    return
  else
    self.Group_Normal:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self.Group_Empty:SetVisibility(ESlateVisibility.Collapsed)
    self.Common_List_Subcell_PC_0:SetRenderOpacity(1)
    self.Common_List_Subcell_PC_0:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  end
  if not data then
    return
  end
  if self.AchievementSystem.FirstIndex and self.AchievementSystem.FirstIndex == self.Index then
    self.Common_List_Subcell_PC_0:SelectCell()
    self:BP_OnItemSelectionChanged(true)
    self.AchievementSystem.FirstIndex = -1
  elseif self.AchievementSystem.CurrentTypeId == self.ID then
    self.Common_List_Subcell_PC_0:SelectCell()
    self:BP_OnItemSelectionChanged(true)
  else
    self:BP_OnItemSelectionChanged(false)
  end
  self.Common_List_Subcell_PC_0:BindEventOnClicked(self, self.OpenDetail)
  self.Common_List_Subcell_PC_0:TryOverrideSoundFunc(self.OnClickSound)
  self.Name:SetText(GText(data.AchievementTypeName))
  if data.AchievementTypeIcon1 then
    local icon1 = LoadObject(data.AchievementTypeIcon1)
    if icon1 then
      self.Icon:SetBrushFromTexture(icon1, false)
    end
  end
  local achievementId = self.AchievementSystem.AchievementType2ID[Content.ID]
  local avatar = GWorld:GetAvatar()
  local count = 0
  self.IdTable = {}
  for _, id in pairs(achievementId) do
    local achv = avatar.Achvs:GetAchv(id)
    self.IdTable[id] = true
    if achv:IsFinished() and not avatar.Achvs:IsAchvLocked(id) then
      count = count + 1
    end
  end
  self.Percent:SetText(string.format("%.0f", count / #achievementId * 100) .. "%")
  self:UpdateRedDot()
  if self.AchievementSystem.InitTypeID == self.ID then
    self.AchievementSystem.InitTypeID = nil
    self.AchievementSystem.Achievement_Root.List_Achievement:SetSelectedIndex(self.Index)
    if #self.CanReceiveId > 0 then
      self.AchievementSystem.CurrentReceiveId = self.CanReceiveId
      self.AchievementSystem.Achievement_Root.BP_Common_OneClickGet:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
      if CommonUtils.GetDeviceTypeByPlatformName(self) == "PC" then
        self.AchievementSystem:UpdateComTab(true)
      end
    else
      self.AchievementSystem.Achievement_Root.BP_Common_OneClickGet:SetVisibility(ESlateVisibility.Collapsed)
      if CommonUtils.GetDeviceTypeByPlatformName(self) == "PC" then
        self.AchievementSystem:UpdateComTab(false)
      end
    end
  end
  self.Common_List_Subcell_PC_0.Button_Area.OnClicked:Add(self, self.OnAchievementClicked)
  ReddotManager.AddListenerEx("AchvType" .. self.ID, self, self.OnReddotUpdate, nil, Const.ReddotCacheType.NoneCache, EReddotType.Normal)
end

function M:OpenDetail()
  self.AchievementSystem:OpenDetail(self.ID, self.Index)
end

function M:OnReddotUpdate(Count, RdType, RdName)
  if RdName ~= "AchvType" .. self.ID then
    return
  end
  if Count > 0 then
    self.Reddot:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  else
    self.Reddot:SetVisibility(ESlateVisibility.Collapsed)
  end
end

function M:UpdateRedDot(AchvId)
  if not self.Reddot or not self.IdTable then
    return
  end
  if AchvId and not self.IdTable[AchvId] then
    return
  end
  local avatar = GWorld:GetAvatar()
  local data = DataMgr.AchievementType[self.ID]
  self.CanReceiveId = {}
  for _, id in pairs(self.AchievementSystem.AchievementType2ID[self.ID]) do
    if avatar.Achvs:IsAchvCanGetReward(id) then
      self.CanReceiveId[#self.CanReceiveId + 1] = id
    end
  end
end

function M:OnAchvFinished(AchvId)
  if not self.IdTable then
    return
  end
  if AchvId and not self.IdTable[AchvId] then
    return
  end
  local achievementId = self.AchievementSystem.AchievementType2ID[self.ID]
  local avatar = GWorld:GetAvatar()
  local count = 0
  for id, _ in pairs(self.IdTable) do
    local achv = avatar.Achvs:GetAchv(id)
    if achv:IsFinished() and not avatar.Achvs:IsAchvLocked(id) then
      count = count + 1
    end
  end
  self.Percent:SetText(string.format("%.0f", count / #achievementId * 100) .. "%")
  self:UpdateRedDot()
end

function M:BP_OnItemSelectionChanged(IsSelected)
  self:StopAllAnimations()
  if not IsSelected then
    self.Common_List_Subcell_PC_0:OnCellUnSelect()
    self:PlayAnimation(self.TextNormal)
  else
    self:PlayAnimation(self.TextSelect)
  end
end

function M:OnClickSound()
  UE4.UFMODBlueprintStatics.PlayEvent2D(nil, UE4.UFMODBlueprintStatics.FindEventbyName("event:/ui/common/click_level_02"))
end

function M:OnFocusReceived(MyGeometry, InFocusEvent)
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
  if self.GameInputModeSubsystem:GetCurrentInputType() == ECommonInputType.Gamepad then
    self.Common_List_Subcell_PC_0:SelectCell()
    self:OpenDetail()
    self.Common_List_Subcell_PC_0.Button_Area:SetFocus()
    self.AchievementSystem.Achievement_Root.BP_Common_OneClickGet.Common_Button_Reward_PC.Img_GamePad:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  end
  return self.ID
end

function M:NavigateRight()
  self.AchievementSystem.Achievement_Root.List_Item:NavigateToIndex(0)
  return true
end

function M:NavigateDown()
  if self.AchievementSystem.Achievement_Root.List_Achievement:GetItemAt(self.Index + 1) == nil then
    return false
  end
  self.AchievementSystem.Achievement_Root.List_Achievement:NavigateToIndex(self.Index + 1)
  return true
end

function M:NavigateUp()
  if self.AchievementSystem.Achievement_Root.List_Achievement:GetItemAt(self.Index - 1) == nil then
    return false
  end
  self.AchievementSystem.Achievement_Root.List_Achievement:NavigateToIndex(self.Index - 1)
  return true
end

function M:OnAchievementClicked()
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
  if self.GameInputModeSubsystem:GetCurrentInputType() == ECommonInputType.Gamepad then
    self:NavigateRight()
  end
end

return M
