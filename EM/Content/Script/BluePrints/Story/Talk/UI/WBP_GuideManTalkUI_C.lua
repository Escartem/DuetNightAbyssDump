local TalkUtils = require("BluePrints.Story.Talk.View.TalkUtils")
local WBP_GuideManTalkUI_C = Class("BluePrints.UI.BP_UIState_C")

function WBP_GuideManTalkUI_C:Construct()
  self.GuideManInfos = {}
  self.GuideManIdx = 0
  self.LastGuideManConfigId = nil
  self:SetVisibility(UE4.ESlateVisibility.HitTestInvisible)
  if self:GetParent() then
    self:GetParent():SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  end
  self.LastFacialIdx = nil
  self:SwitchShowImage(false)
end

function WBP_GuideManTalkUI_C:Destruct()
  WBP_GuideManTalkUI_C.Super.Destruct(self)
end

function WBP_GuideManTalkUI_C:SwitchStyle(TaskData)
  self.GuideTalkStyle = TaskData.GuideTalkStyle
  if self.ExtraOverriddenParams and self.ExtraOverriddenParams.GuideTalkStyle then
    self.GuideTalkStyle = self.ExtraOverriddenParams.GuideTalkStyle
  end
  if self.GuideTalkStyle == "Communicator" then
    self.StyleInAnimation = self.In_Radio
    self.StyleOutAnimation = self.Out_Radio
  else
    self.StyleInAnimation = self.In_Normal
    self.StyleOutAnimation = self.Out_Normal
  end
end

function WBP_GuideManTalkUI_C:BindAnimations()
  self:BindToAnimationFinished(self.In_Radio, {
    self,
    self.OnInRadioAnimationFinished
  })
end

function WBP_GuideManTalkUI_C:OnInRadioAnimationFinished()
  self:PlayAnimation(self.Loop_Radio, 0, 0)
end

function WBP_GuideManTalkUI_C:PlayDialogue(TalkTask, DialogueData, TaskData, LambdaCallback, ExtraOverriddenParams)
  DebugPrint("WBP_GuideManTalkUI_C:PlayDialogue", TalkTask, DialogueData, TaskData, LambdaCallback, ExtraOverriddenParams)
  self.ExtraOverriddenParams = ExtraOverriddenParams
  self:SwitchStyle(TaskData)
  self:BindAnimations()
  self:TryPlayFadeInAnimationWithAudio(DialogueData, TaskData)
  self:SetUIVisibilityWhenPlayDialogue()
  self:SetNameText(DialogueData)
  self:SetDialogueText(DialogueData)
  self:UpdateGuideManInfo_2D_New(DialogueData, TaskData, TalkTask)
  local DialogueDuration = DialogueData.Duration
  self:AddTimer(DialogueDuration, function()
    LambdaCallback()
  end, false, 0, "PlayDialogue", false)
end

function WBP_GuideManTalkUI_C:GetGuideFacialId(DialogueData)
  if DialogueData.GuideFacialId then
    if DialogueData.HeadIconType == "Special" then
      return DialogueData.GuideFacialId
    elseif DialogueData.HeadIconType == "Npc" then
      return self:GetNpcFacialId(DialogueData.DialogueId, DialogueData.TalkActorId, DialogueData.GuideFacialId)
    end
  end
  local NpcId = self:ChangeNpcInfoByGender(DialogueData.TalkActorId) or DialogueData.TalkActorId
  if NpcId then
    return self:GetNpcHeadId(DialogueData.DialogueId, NpcId)
  end
  return nil
end

function WBP_GuideManTalkUI_C:GetNpcHeadId(DialogueId, NpcId)
  local NpcData = DataMgr.Npc[NpcId]
  if not NpcData then
    local Message = string.format("\232\142\183\229\143\150\229\188\149\229\175\188\229\164\180\229\131\143\229\164\177\232\180\165\239\188\140Npc\230\149\176\230\141\174\230\151\160\230\149\136\239\188\140\229\143\176\230\156\172\231\188\150\229\143\183\239\188\154%s\239\188\140Npc\231\188\150\229\143\183\239\188\154%s", DialogueId, NpcId)
    UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "\232\142\183\229\143\150\229\188\149\229\175\188\229\164\180\229\131\143Id\229\164\177\232\180\165", Message)
    return
  end
  return NpcData.GuideHeadId
end

function WBP_GuideManTalkUI_C:GetNpcFacialId(DialogueId, NpcId, FacialId)
  NpcId = self:ChangeNpcInfoByGender(NpcId) or NpcId
  if not NpcId then
    local Message = string.format("\232\142\183\229\143\150Npc\232\161\168\230\131\133Id\229\164\177\232\180\165\239\188\140NpcId\230\151\160\230\149\136\239\188\140\229\143\141\233\166\136\231\173\150\229\136\146\230\163\128\230\159\165\233\133\141\231\189\174\239\188\140\229\143\176\230\156\172\231\188\150\229\143\183\239\188\154%s\239\188\140NpcId\239\188\154%s", DialogueId, NpcId)
    UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "\232\142\183\229\143\150Npc\232\161\168\230\131\133Id\229\164\177\232\180\165", Message)
    return
  end
  if not FacialId then
    local Message = string.format("\232\142\183\229\143\150Npc\232\161\168\230\131\133Id\229\164\177\232\180\165\239\188\140\232\161\168\230\131\133Id\230\151\160\230\149\136\239\188\140\229\143\141\233\166\136\231\173\150\229\136\146\230\163\128\230\159\165\233\133\141\231\189\174\239\188\140\229\143\176\230\156\172\231\188\150\229\143\183\239\188\154%s\239\188\140\232\161\168\230\131\133Id\239\188\154%s", DialogueId, FacialId)
    UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "\232\142\183\229\143\150Npc\232\161\168\230\131\133Id\229\164\177\232\180\165", Message)
    return
  end
  local NpcData = DataMgr.Npc[NpcId]
  if not NpcData then
    local Message = string.format("\232\142\183\229\143\150Npc\232\161\168\230\131\133Id\229\164\177\232\180\165\239\188\140Npc\230\149\176\230\141\174\230\151\160\230\149\136\239\188\140\229\143\141\233\166\136\231\173\150\229\136\146\230\163\128\230\159\165\233\133\141\231\189\174\239\188\140\229\143\176\230\156\172\231\188\150\229\143\183\239\188\154%s\239\188\140Npc\231\188\150\229\143\183\239\188\154%s", DialogueId, NpcId)
    UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "\232\142\183\229\143\150Npc\232\161\168\230\131\133Id\229\164\177\232\180\165", Message)
    return
  end
  local ModelId = NpcData.ModelId
  if not ModelId then
    local Message = string.format("\232\142\183\229\143\150Npc\232\161\168\230\131\133Id\229\164\177\232\180\165\239\188\140\230\168\161\229\158\139Id\230\151\160\230\149\136\239\188\140\229\143\141\233\166\136\231\173\150\229\136\146\230\163\128\230\159\165\233\133\141\231\189\174\239\188\140\229\143\176\230\156\172\231\188\150\229\143\183\239\188\154%s\239\188\140Npc\231\188\150\229\143\183\239\188\154%s", DialogueId, NpcId)
    UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "\232\142\183\229\143\150Npc\232\161\168\230\131\133Id\229\164\177\232\180\165", Message)
    return
  end
  local ModelData = DataMgr.Model[ModelId]
  if not ModelData then
    local Message = string.format("\232\142\183\229\143\150Npc\232\161\168\230\131\133Id\229\164\177\232\180\165\239\188\140\230\168\161\229\158\139\230\149\176\230\141\174\230\151\160\230\149\136\239\188\140\229\143\141\233\166\136\231\173\150\229\136\146\230\163\128\230\159\165\233\133\141\231\189\174\239\188\140\229\143\176\230\156\172\231\188\150\229\143\183\239\188\154%s\239\188\140Npc\231\188\150\229\143\183\239\188\154%s\239\188\140\230\168\161\229\158\139Id\239\188\154%s", DialogueId, NpcId, ModelId)
    UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "\232\142\183\229\143\150Npc\232\161\168\230\131\133Id\229\164\177\232\180\165", Message)
    return
  end
  if not ModelData.AvatarExpressionPrefix then
    local Message = string.format("\232\142\183\229\143\150Npc\232\161\168\230\131\133Id\229\164\177\232\180\165\239\188\140\230\168\161\229\158\139\230\149\176\230\141\174\228\184\173\230\178\161\230\156\137AvatarExpressionPrefix\239\188\140\229\143\141\233\166\136\231\173\150\229\136\146\230\163\128\230\159\165\233\133\141\231\189\174\239\188\140\229\143\176\230\156\172\231\188\150\229\143\183\239\188\154%s\239\188\140Npc\231\188\150\229\143\183\239\188\154%s\239\188\140\230\168\161\229\158\139Id\239\188\154%s", DialogueId, NpcId, ModelId)
    UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "\232\142\183\229\143\150Npc\232\161\168\230\131\133Id\229\164\177\232\180\165", Message)
    return
  end
  return string.format("%s%s", ModelData.AvatarExpressionPrefix, FacialId)
end

local PlayerNames = {Nvzhu = true, Nanzhu = true}
local EXPlayerNames = {WeitaF = true, Weita = true}
local Sex2PlayerName = {
  [0] = "Nanzhu",
  [1] = "Nvzhu"
}
local Sex2EXPlayerNames = {
  [0] = "Weita",
  [1] = "WeitaF"
}

function WBP_GuideManTalkUI_C:MatchMasterStr(NpcName)
  local Avatar = GWorld:GetAvatar()
  if nil == Avatar then
    return false
  end
  if PlayerNames[NpcName] then
    return true, Sex2PlayerName[Avatar.Sex]
  end
  if EXPlayerNames[NpcName] then
    return true, Sex2EXPlayerNames[Avatar.WeitaSex]
  end
  return false
end

function WBP_GuideManTalkUI_C:ChangeNpcInfoByGender(SourceUnitId)
  if DataMgr.NPC[SourceUnitId] == nil or 1 ~= DataMgr.NPC[SourceUnitId].PlayerInfo then
    return nil
  end
  local Avatar = GWorld:GetAvatar()
  if nil == Avatar then
    return nil
  end
  local FakeNpcInfo
  for _, value in pairs(DataMgr.GenderToNpcId) do
    if value.NpcId and value.NpcId == SourceUnitId then
      FakeNpcInfo = value
      break
    end
  end
  if nil == FakeNpcInfo then
    return nil
  end
  local FakeNpcInfo2
  for _, value in pairs(DataMgr.GenderToNpcId) do
    if value.GroupId and value.GroupId == FakeNpcInfo.GroupId and value.Gender ~= FakeNpcInfo.Gender then
      FakeNpcInfo2 = value
      break
    end
  end
  if nil == FakeNpcInfo2 then
    return nil
  end
  local AvatarGender
  if FakeNpcInfo2.SwitchPlayer == "Player" then
    AvatarGender = Avatar.Sex
  elseif FakeNpcInfo2.SwitchPlayer == "EXPlayer" then
    AvatarGender = Avatar.WeitaSex
  end
  if nil == AvatarGender then
    return nil
  end
  local RealNpcInfo
  if AvatarGender == FakeNpcInfo2.Gender then
    RealNpcInfo = FakeNpcInfo2
  elseif AvatarGender == FakeNpcInfo.Gender then
    RealNpcInfo = FakeNpcInfo
  end
  if nil == RealNpcInfo then
    return nil
  end
  return RealNpcInfo.NpcId
end

function WBP_GuideManTalkUI_C:OnFinished(LambdaCallback)
  AudioManager(self):PlayFMODSound(self, nil, "event:/ui/common/guider_hide", "GuideManTalk")
  self:BindToAnimationFinished(self.StyleOutAnimation, {
    self,
    function()
      LambdaCallback()
    end
  })
  self:StopAllAnimations()
  self:PlayAnimation(self.StyleOutAnimation)
end

function WBP_GuideManTalkUI_C:IsSameGuideMan(FacialA, FacialB)
  DebugPrint("WBP_GuideManTalkUI_C:IsSameGuideMan", FacialA, FacialB)
  if not FacialA or not FacialB then
    return false
  end
  if FacialA == FacialB then
    return true
  end
  local PosA = string.find(FacialA, "_", 1, false)
  local PosB = string.find(FacialB, "_", 1, false)
  if PosA ~= PosB then
    return false
  end
  for i = 1, PosA do
    if FacialA[i] ~= FacialB[i] then
      return false
    end
  end
  return true
end

function WBP_GuideManTalkUI_C:TryPlayFadeInAnimationWithAudio(DialogueData, TaskData)
  local GuideFacialId = self:GetGuideFacialId(DialogueData)
  local bIsSameGuideMan = self:IsSameGuideMan(GuideFacialId, self.LastFacialIdx)
  if not bIsSameGuideMan then
    self:PlayAnimation(self.StyleInAnimation)
    if TaskData.IsPlayStartSound == true then
      AudioManager(self):PlayFMODSound(self, nil, "event:/ui/common/guider_show", "GuideManTalk")
    end
  else
    DebugPrint("WBP_GuideManTalkUI_C Different GuideMan")
  end
end

function WBP_GuideManTalkUI_C:SetUIVisibilityWhenPlayDialogue()
  self:SetTextBorderHidden(false)
end

function WBP_GuideManTalkUI_C:SetTextBorderHidden(bHidden)
  if bHidden then
    self.DialogueText:SetVisibility(ESlateVisibility.Collapsed)
    self.NpcNameText:SetVisibility(ESlateVisibility.Collapsed)
  else
    self.DialogueText:SetVisibility(ESlateVisibility.Visible)
    self.NpcNameText:SetVisibility(ESlateVisibility.Visible)
  end
end

function WBP_GuideManTalkUI_C:SetNameText(DialogueData)
  local Name = self:GetDialogueSpeakerName(DialogueData)
  self.NpcNameText:SetText(Name)
end

function WBP_GuideManTalkUI_C:SetDialogueText(DialogueData)
  self.DialogueText:SetText(DialogueData.Content)
end

function WBP_GuideManTalkUI_C:SwitchShowImage(bShow)
  local ImageWidget = self.Image_GuideMan
  if bShow then
    ImageWidget:SetVisibility(ESlateVisibility.Visible)
  else
    ImageWidget:SetVisibility(ESlateVisibility.Collapsed)
  end
end

function WBP_GuideManTalkUI_C:GetDialogueSpeakerName(DialogueData)
  local Name
  if DialogueData.TalkActorName then
    Name = DialogueData.TalkActorName
  else
    local TalkActorData = DialogueData.TalkActorData
    if not TalkActorData then
      Name = TalkUtils:GetTalkActorName("Npc", DialogueData.TalkActorId)
    else
      Name = TalkUtils:GetTalkActorName(TalkActorData.TalkActorType, TalkActorData.TalkActorId)
    end
  end
  return GText(Name)
end

function WBP_GuideManTalkUI_C:UpdateGuideManInfo_2D_New(DialogueData, TaskData, TalkTask)
  local FacialIdx = self:GetGuideFacialId(DialogueData)
  self:SwitchGuideHeadInternal(FacialIdx, DialogueData)
end

function WBP_GuideManTalkUI_C:SwitchGuideHeadInternal(FacialIdx, DialogueData)
  if self.LastFacialIdx == FacialIdx then
    return
  end
  self.LastFacialIdx = FacialIdx
  if not FacialIdx then
    self:SwitchShowImage(false)
    return
  end
  local Path, X, Y = self:GetGuideHead(FacialIdx)
  if not UResourceLibrary.CheckResourceExistOnDisk(Path) then
    local Message = string.format("\229\188\149\229\175\188\229\145\152\229\164\180\229\131\143\232\183\175\229\190\132\230\151\160\230\149\136\239\188\140\229\143\141\233\166\136\231\173\150\229\136\146\230\163\128\230\159\165\233\133\141\231\189\174\239\188\140\229\143\176\230\156\172\231\188\150\229\143\183\239\188\154%s\239\188\140\229\164\180\229\131\143Id\239\188\154%s", DialogueData.DialogueId, FacialIdx)
    UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "\229\188\149\229\175\188\229\145\152\229\164\180\229\131\143Id\230\151\160\230\149\136", Message)
    self:SwitchShowImage(false)
    return
  end
  UResourceLibrary.LoadObjectAsync(self, Path, {
    self,
    function(_, Asset)
      if FacialIdx ~= self.LastFacialIdx then
        return
      end
      local Material = self.Image_GuideMan:GetDynamicMaterial()
      if not IsValid(Material) then
        return
      end
      Material:SetTextureParameterValue("HeadTex", Asset)
      Material:SetScalarParameterValue("XNum", X)
      Material:SetScalarParameterValue("YNum", Y)
      self:SwitchShowImage(true)
    end
  })
end

function WBP_GuideManTalkUI_C:OnInterrupted()
  self:Clear()
end

function WBP_GuideManTalkUI_C:OnPaused()
  self:ClearTimer()
  self:StopAllAnimations()
  self:ResetLastFacial()
  self:SetVisibility(UE4.ESlateVisibility.Collapsed)
end

function WBP_GuideManTalkUI_C:OnPauseResumed()
  self:StopAllAnimations()
  self:SetVisibility(UE4.ESlateVisibility.HitTestInvisible)
end

function WBP_GuideManTalkUI_C:ResetLastFacial()
  self.LastFacialIdx = nil
end

function WBP_GuideManTalkUI_C:Clear()
  DebugPrint("WBP_GuideManTalkUI_C:Clear")
  self:ClearTimer()
  if self:GetParent() then
    self:GetParent():SetVisibility(UE4.ESlateVisibility.Collapsed)
    self:RemoveFromParent()
  end
end

function WBP_GuideManTalkUI_C:ClearTimer()
  DebugPrint("WBP_GuideManTalkUI_C ClearTimer")
  self:RemoveTimer("PlayDialogue", false)
end

return WBP_GuideManTalkUI_C
