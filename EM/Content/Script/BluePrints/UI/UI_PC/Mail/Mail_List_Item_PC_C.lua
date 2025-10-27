require("UnLua")
local TimeUtils = require("Utils.TimeUtils")
local M = Class("BluePrints.UI.BP_EMUserWidget_C")

function M:OnListItemObjectSet(Content)
  self.Content = Content
  Content.SelfWidget = self
  self.Common_List_Subcell_PC:SetRenderOpacity(1.0)
  if -1 == Content.UniqueId then
    self:PlayAnimation(self.Empty_Normal)
    self.WS_Item:SetActiveWidgetIndex(0)
    self.Common_List_Subcell_PC.IsSelect = true
    self.Common_List_Subcell_PC:PlayAnimation(self.Common_List_Subcell_PC.Forbidden)
    self.Group_MailItemCommon:SetVisibility(UE4.ESlateVisibility.Collapsed)
    return
  end
  self.Common_List_Subcell_PC.IsSelect = false
  self.Group_MailItemCommon:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  self.MailInfo = Content.ParentWidget:GetMailInfo(Content)
  local MailTitle = self.MailInfo.MailTitle
  self.Text_Mail_NormalTitle:SetText(GText(MailTitle))
  self.Text_Mail_SelectTitle:SetText(GText(MailTitle))
  self:StopAnimation(self.List_Read)
  self:PlayAnimation(self.Normal)
  self:SetMailSenderIcon()
  self:SetMailRemainTime()
  if Content.IsStar then
    self.Group_MailStar:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  else
    self.Group_MailStar:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
  if self.MailInfo.MailReward == nil then
    self.Group_HaveGift:SetVisibility(UE4.ESlateVisibility.Collapsed)
  else
    self.Group_HaveGift:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  end
  self:SetListItemObjectReadState()
  self:SetListItemObjectRewardGotState()
  self.WS_Item:SetActiveWidgetIndex(1)
  self.Group_Item:SetActiveWidgetIndex(0)
  self.Common_List_Subcell_PC:SetAutoSelectWhenHoverInGamePadMod()
  if Content.IsSelected and Content.ParentWidget.SelectMailUniqueId == Content.UniqueId then
    self:OnListItemObjectClicked()
  else
    self:ClearListItemObjectSelectState()
  end
  self.Common_List_Subcell_PC:BindEventOnClicked(self, self.OnListItemObjectClicked)
end

function M:OnListItemObjectClicked()
  if -1 == self.Content.UniqueId then
    return
  end
  self.Content.ParentWidget:OnMailListItemClicked(self.Content)
  self:SetListItemObjectSelectState()
end

function M:SetListItemObjectSelectState()
  if -1 == self.Content.UniqueId then
    return
  end
  self.Content.IsSelected = true
  self.Common_List_Subcell_PC:SelectCell()
  self.Group_Item:SetActiveWidgetIndex(1)
  self:StopAnimation(self.List_Read)
  self:PlayAnimation(self.Normal)
end

function M:SetListItemObjectReadState()
  if -1 == self.Content.UniqueId then
    return
  end
  if 0 == self.Content.MailReaded then
    self.Common_Item_Subsize_New_PC:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    self.Common_Item_Subsize_Reddot_PC:SetVisibility(UE4.ESlateVisibility.Collapsed)
  else
    self.Common_Item_Subsize_New_PC:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.Common_Item_Subsize_Reddot_PC:SetVisibility(UE4.ESlateVisibility.Collapsed)
    if 0 == self.Content.RewardGot then
      self.Common_Item_Subsize_Reddot_PC:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    elseif not self.Content.IsSelected then
      self:StopAnimation(self.Normal)
      self:PlayAnimation(self.List_Read)
    end
  end
end

function M:SetListItemObjectRewardGotState()
  if -1 == self.Content.UniqueId then
    return
  end
  self.Image_Got_Normal:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self.Image_Got_Select:SetVisibility(UE4.ESlateVisibility.Collapsed)
  if 1 == self.Content.RewardGot then
    self.Group_HaveGift:SetVisibility(UE4.ESlateVisibility.Collapsed)
    if 1 == self.Content.MailReaded then
      self.Image_Got_Normal:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
      self.Image_Got_Select:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
      self.Common_Item_Subsize_New_PC:SetVisibility(UE4.ESlateVisibility.Collapsed)
      self.Common_Item_Subsize_Reddot_PC:SetVisibility(UE4.ESlateVisibility.Collapsed)
    else
      self.Common_Item_Subsize_New_PC:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
      self.Common_Item_Subsize_Reddot_PC:SetVisibility(UE4.ESlateVisibility.Collapsed)
    end
  else
    self.Common_Item_Subsize_New_PC:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.Common_Item_Subsize_Reddot_PC:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  end
end

function M:SetMailRemainTime()
  local MailTimeLimit = self.MailInfo.MailTimeLimit
  if -1 == MailTimeLimit or self.Content.IsStar then
    self.Text_Mail_RemainTime_Nomral:SetText(GText("UI_Mail_Date_Permanent"))
    self.Text_Mail_RemainTime_Select:SetText(GText("UI_Mail_Date_Permanent"))
  else
    self:SetMailDueTime(self.Content.DueTime)
  end
  if self.Content.IsStar then
    self.Text_Mail_RemainTime_Nomral:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.Text_Mail_RemainTime_Select:SetVisibility(UE4.ESlateVisibility.Collapsed)
  else
    self.Text_Mail_RemainTime_Nomral:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    self.Text_Mail_RemainTime_Select:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  end
end

function M:SetMailDueTime(DueTime)
  if DueTime >= CommonConst.SECOND_IN_DAY then
    local DayLeft = math.floor(DueTime / CommonConst.SECOND_IN_DAY)
    self.Text_Mail_RemainTime_Nomral:SetText(string.format(GText("UI_Mail_Date_Due"), DayLeft))
    self.Text_Mail_RemainTime_Select:SetText(string.format(GText("UI_Mail_Date_Due"), DayLeft))
  elseif DueTime >= CommonConst.SECOND_IN_HOUR then
    local HourLeft = math.floor(DueTime / CommonConst.SECOND_IN_HOUR)
    self.Text_Mail_RemainTime_Nomral:SetText(string.format(GText("UI_Mail_Date_Hour"), HourLeft))
    self.Text_Mail_RemainTime_Select:SetText(string.format(GText("UI_Mail_Date_Hour"), HourLeft))
  else
    local MinLeft = math.floor(DueTime / CommonConst.SECOND_IN_MINUTE)
    self.Text_Mail_RemainTime_Nomral:SetText(string.format(GText("UI_Mail_Date_Minute"), MinLeft))
    self.Text_Mail_RemainTime_Select:SetText(string.format(GText("UI_Mail_Date_Minute"), MinLeft))
  end
end

function M:SetMailSenderIcon()
  local Icon = "Bai_Idle"
  local NpcId = self.MailInfo.MailSenderId
  local Name = "Mail_Sender_Default"
  if NpcId then
    local NpcInfo = DataMgr.Npc[NpcId]
    if NpcInfo then
      if NpcInfo.UnitName then
        Name = NpcInfo.UnitName
      end
      if NpcInfo.MailHead then
        Icon = NpcInfo.MailHead
      elseif NpcInfo.GuideHeadId then
        Icon = NpcInfo.GuideHeadId
      end
    end
  end
  local DynamicIcon = LoadObject(Icon)
  if DynamicIcon then
    self.OldMat:SetTextureParameterValue("IconMap", DynamicIcon)
    self.Common_Head_Small.Img_Item:SetBrushFromMaterial(self.OldMat)
  else
    self.Common_Head_Small.Img_Item:SetBrushFromMaterial(self.HeadIcon)
    UIUtils.SwitchGuideHead(Icon, self.HeadIcon)
  end
  self.Common_Head_Small:SetDisableAction(true)
  self.Text_MailFrom_Normal:SetText(GText(Name))
  self.Text_MailFrom_Select:SetText(GText(Name))
end

function M:ClearListItemObjectSelectState(Content)
  if -1 == self.Content.UniqueId then
    return
  end
  self.Group_Item:SetActiveWidgetIndex(0)
  self.Common_List_Subcell_PC:OnCellUnSelect()
  self.Content.IsSelected = false
  if 1 == self.Content.MailReaded and 1 == self.Content.RewardGot then
    self:StopAnimation(self.Normal)
    self:PlayAnimation(self.List_Read)
  else
    self:StopAnimation(self.List_Read)
    self:PlayAnimation(self.Normal)
  end
end

return M
