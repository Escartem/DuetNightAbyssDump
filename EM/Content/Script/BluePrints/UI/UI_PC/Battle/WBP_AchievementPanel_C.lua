require("UnLua")
local WBP_AchievementPanel_C = Class("BluePrints.UI.BP_UIState_C")

function WBP_AchievementPanel_C:Initialize(Initializer)
  WBP_AchievementPanel_C.Super.Initialize(self, Initializer)
  self.AchievementId = nil
  self.AchievementConfigData = nil
  self.ShowQueen = {}
  self.index = 1
  self.StartTime = 0
end

function WBP_AchievementPanel_C:OnLoaded(...)
  self.Super.OnLoaded(self, ...)
  local AchievementId, CountStage, TargetNeedCount, NewIndex = ...
  self.IconMaterial = self.VX_Icon_Light:GetDynamicMaterial()
  self:SetVisibility(ESlateVisibility.HitTestInvisible)
  local Offset = self.Offset_M
  if Offset and CommonUtils.GetDeviceTypeByPlatformName(self) == "Mobile" then
    local Padding = self.Padding
    Padding.Bottom = Offset
    self:SetPadding(Padding)
  end
  self:PlayAnimation(self.FadeIn, self.FadeIn:GetEndTime(), 1, EUMGSequencePlayMode.Reverse, 1, false)
  self:AddQuene(AchievementId, CountStage, TargetNeedCount, NewIndex)
  self:AddTimer(0.01, function()
    if self:GetVisibility() ~= ESlateVisibility.Collapsed then
      self:Text_Title_End_Event()
    end
  end)
end

function WBP_AchievementPanel_C:Destruct()
  self.Super.Destruct(self)
  self.IconMaterial = nil
end

function WBP_AchievementPanel_C:CloseProgressBar(CurrentProgress)
  self.TriggerUnlockItem = nil
  local AchvData = DataMgr.Achievement[self.AchievementId]
  local TargetCount = 1
  if AchvData.TargetProgressRenew then
    TargetCount = #AchvData.TargetProgressRenew + 1
  end
end

function WBP_AchievementPanel_C:UpdateAchievementPage(CountStage, TargetNeedCount, NewIndex)
  if not self.AchievementConfigData then
    print(_G.LogTag, "ZJT_ UpdateAchievementPage Not exist ")
    return
  end
  
  local function wrapfunc()
    if self:IsAnimationPlaying(self.FadeIn) or self:IsAnimationPlaying(self.FadeOut) then
      self:StopAnimation(self.FadeIn)
      self:StopAnimation(self.FadeOut)
    end
    self:PlayAnimation(self.FadeOut, 0, 1, EUMGSequencePlayMode.Forward, 1, true)
  end
  
  self:AddTimer(5.0, wrapfunc)
  self.StartTime = UE4.UGameplayStatics.GetTimeSeconds(self)
  local Text_Title_Info = GText(self.AchievementConfigData.AchievementName)
  local Straight_matter_Desc = GText("UI_AchievementToast_Progress")
  local desc = ""
  local PercentValue = 0
  local TargetCount = 1
  if self.AchievementConfigData.TargetProgressRenew then
    TargetCount = #self.AchievementConfigData.TargetProgressRenew + 1
  end
  if 1 == TargetCount then
    desc = 1 .. "/" .. 1
    PercentValue = 1.0
  else
    desc = CountStage .. "/" .. TargetNeedCount
    PercentValue = CountStage / TargetNeedCount
  end
  Straight_matter_Desc = Straight_matter_Desc .. " " .. desc
  self.ProgressBar_Achievement:SetPercent(PercentValue)
  local EffectMaterial = self.RetainerBox_Text:GetEffectMaterial()
  if EffectMaterial then
    EffectMaterial:SetScalarParameterValue("HPValue1", PercentValue)
  end
  self.Text_Title:SetText(Text_Title_Info)
  self.Straight_matter:SetText(Straight_matter_Desc)
  local Icon = LoadObject(DataMgr.AchievementType[DataMgr.Achievement[self.AchievementId].AchievementType].AchievementTypeIcon2)
  if Icon then
    self.Icon:GetDynamicMaterial():SetTextureParameterValue("IconMap", Icon)
    self.VX_Icon_Light:GetDynamicMaterial():SetTextureParameterValue("IconMap", Icon)
  end
  self:CloseProgressBar(NewIndex)
  if self:IsAnimationPlaying(self.FadeIn) or self:IsAnimationPlaying(self.FadeOut) then
    self:StopAnimation(self.FadeIn)
    self:StopAnimation(self.FadeOut)
  end
  self:PlayAnimation(self.FadeIn, 0, 1, EUMGSequencePlayMode.Forward, 1, false)
end

function WBP_AchievementPanel_C:AddQuene(AchvId, Count, TargetNeedCount, NewIndex)
  local info = {}
  info.AchievementId = AchvId
  info.Count = Count
  info.NewIndex = NewIndex
  info.TargetNeedCount = TargetNeedCount
  table.insert(self.ShowQueen, info)
end

function WBP_AchievementPanel_C:Text_Title_End_Event()
  local avatar = GWorld:GetAvatar()
  if self.ShowQueen[self.index] ~= nil and avatar then
    local Info = self.ShowQueen[self.index]
    self.AchievementId = Info.AchievementId
    self.AchievementConfigData = DataMgr.Achievement[Info.AchievementId]
    local Count = Info.Count
    local NewIndex = Info.NewIndex
    local TargetNeedCount = Info.TargetNeedCount
    self:StopAllAnimations()
    local achieve = avatar.Achvs:GetAchv(self.AchievementId)
    if achieve and achieve:IsIndividual() then
      Count = achieve.CompletionValue
    end
    self:UpdateAchievementPage(Count, TargetNeedCount, NewIndex)
    self.ShowQueen[self.index] = nil
    self.index = self.index + 1
    if not self.ShowQueen[self.index] then
      self.index = 1
    end
    return
  end
  self:Close()
end

function WBP_AchievementPanel_C:TriggerUnlock()
  if self.TriggerUnlockItem then
    AudioManager(self):PlayUISound(self, "event:/ui/common/achieve_toast_check", "", nil)
    self.TriggerUnlockItem:StopAllAnimations()
    self.TriggerUnlockItem:PlayAnimation(self.TriggerUnlockItem.Unlock)
  end
end

function WBP_AchievementPanel_C:CloseSelfBlend()
  if self.AchievCanvasPanel then
    self.AchievCanvasPanel:SetRenderOpacity(0)
  end
end

function WBP_AchievementPanel_C:OpenSelfBlend()
  if self.AchievCanvasPanel then
    self.AchievCanvasPanel:SetRenderOpacity(1)
  end
end

function WBP_AchievementPanel_C:StartTalk()
end

function WBP_AchievementPanel_C:EndTalk()
end

function WBP_AchievementPanel_C:Show(HideTag)
  WBP_AchievementPanel_C.Super.Show(self, HideTag)
  local IsHide = not IsEmptyTable(self.HideTags)
  if not IsHide then
    self:Text_Title_End_Event()
  end
end

return WBP_AchievementPanel_C
