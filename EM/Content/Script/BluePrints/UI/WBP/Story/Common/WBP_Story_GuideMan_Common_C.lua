local EMCache = require("EMCache.EMCache")
local ForgeModel = require("Blueprints.UI.Forge.ForgeDataModel")
local TalkUtils = require("BluePrints.Story.Talk.View.TalkUtils")
local PlayDialogueTag = {Dialogue = "Dialogue", Forge = "Forge"}
local MaxTipUINum = 3
local TipUIShowTime = 3
local M = Class({
  "BluePrints.UI.BP_UIState_C"
})

function M:Construct()
  self.GuideManInfos = {}
  self.GuideManIdx = 0
  self.LastGuideManConfigId = nil
  self.bForgeVisible = false
  self:SetVisibility(UE4.ESlateVisibility.HitTestInvisible)
  if self:GetParent() then
    self:GetParent():SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  end
  self.LastFacialIdx = nil
  self:SwitchShowImage(false)
end

function M:Destruct()
  M.Super.Destruct(self)
end

function M:SwitchStyle(TaskData)
  self.GuideTalkStyle = TaskData.GuideTalkStyle
  if self.GuideTalkStyle == "Communicator" then
    self.StyleInAnimation = self.In_Radio
    self.StyleOutAnimation = self.Out_Radio
  else
    self.StyleInAnimation = self.In_Normal
    self.StyleOutAnimation = self.Out_Normal
  end
end

function M:BindAnimations()
  self:BindToAnimationFinished(self.In_Radio, {
    self,
    self.OnInRadioAnimationFinished
  })
end

function M:OnInRadioAnimationFinished()
  self:PlayAnimation(self.Loop_Radio, 0, 0)
end

function M:PlayDialogue(TalkTask, DialogueData, TaskData, LambdaCallback)
  self:SwitchStyle(TaskData)
  self:BindAnimations()
  self:TryPlayFadeInAnimationWithAudio(DialogueData, TaskData)
  self:SetUIVisibilityWhenPlayDialogue()
  self:SetNameText(DialogueData)
  self:SetDialogueText(DialogueData)
  local FacialIdx = self:GetGuideFacialId(DialogueData)
  self:SwitchGuideHeadInternal(FacialIdx, DialogueData)
  local TalkContext = GWorld.GameInstance:GetTalkContext()
  local WaitQueue = TalkContext.WaitQueueManager:CreateWaitQueue(self, {
    {
      Tag = PlayDialogueTag.Dialogue
    },
    {
      Tag = PlayDialogueTag.Forge
    }
  }, self, LambdaCallback)
  self.DialogueDurationTimer = self:AddTimer(DialogueData.Duration, function()
    WaitQueue:CompleteWaitItem(PlayDialogueTag.Dialogue)
  end)
  if self.bForgeVisible then
    local CanProduceDraftIds = self:GetCanProduceDraftIds()
    self:ProcessPlayForgingWaitTag(CanProduceDraftIds, 1, function()
      WaitQueue:CompleteWaitItem(PlayDialogueTag.Forge)
    end)
  else
    WaitQueue:CompleteWaitItem(PlayDialogueTag.Forge)
  end
end

function M:GetGuideFacialId(DialogueData)
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

function M:GetNpcHeadId(DialogueId, NpcId)
  local NpcData = DataMgr.Npc[NpcId]
  if not NpcData then
    local Message = string.format("\232\142\183\229\143\150\229\188\149\229\175\188\229\164\180\229\131\143\229\164\177\232\180\165\239\188\140Npc\230\149\176\230\141\174\230\151\160\230\149\136\239\188\140\229\143\176\230\156\172\231\188\150\229\143\183\239\188\154%s\239\188\140Npc\231\188\150\229\143\183\239\188\154%s", DialogueId, NpcId)
    UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "\232\142\183\229\143\150\229\188\149\229\175\188\229\164\180\229\131\143Id\229\164\177\232\180\165", Message)
    return
  end
  return NpcData.GuideHeadId
end

function M:GetNpcFacialId(DialogueId, NpcId, FacialId)
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

function M:MatchMasterStr(NpcName)
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

function M:ChangeNpcInfoByGender(NpcId)
  local NpcData = DataMgr.Npc[NpcId]
  if not NpcData then
    return nil
  end
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return nil
  end
  if NpcData.SwitchPlayer == "Player" then
    if NpcData.Gender == Avatar.Sex then
      return NpcId
    else
      return NpcData.RelateNpcId
    end
  elseif NpcData.SwitchPlayer == "EXPlayer" then
    if NpcData.Gender == Avatar.WeitaSex then
      return NpcId
    else
      return NpcData.RelateNpcId
    end
  else
    return NpcId
  end
end

function M:OnFinished(LambdaCallback)
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

function M:IsSameGuideMan(FacialA, FacialB)
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

function M:TryPlayFadeInAnimationWithAudio(DialogueData, TaskData)
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

function M:SetUIVisibilityWhenPlayDialogue()
  self:SetTextBorderHidden(false)
end

function M:SetTextBorderHidden(bHidden)
  if bHidden then
    self.DialogueText:SetVisibility(ESlateVisibility.Collapsed)
    self.NpcNameText:SetVisibility(ESlateVisibility.Collapsed)
  else
    self.DialogueText:SetVisibility(ESlateVisibility.Visible)
    self.NpcNameText:SetVisibility(ESlateVisibility.Visible)
  end
end

function M:SetNameText(DialogueData)
  local Name = self:GetDialogueSpeakerName(DialogueData)
  self.NpcNameText:SetText(Name)
end

function M:SetDialogueText(DialogueData)
  self.DialogueText:SetText(DialogueData.Content)
end

function M:SwitchShowImage(bShow)
  local ImageWidget = self.Image_GuideMan
  if bShow then
    ImageWidget:SetVisibility(ESlateVisibility.Visible)
  else
    ImageWidget:SetVisibility(ESlateVisibility.Collapsed)
  end
end

function M:GetDialogueSpeakerName(DialogueData)
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

function M:SwitchGuideHeadInternal(FacialIdx, DialogueData)
  if self.LastFacialIdx == FacialIdx then
    return
  end
  self.LastFacialIdx = FacialIdx
  if not self.LastFacialIdx then
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
      if self.LastFacialIdx ~= FacialIdx then
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

function M:OnInterrupted()
  self:Clear()
end

function M:OnPaused()
  self:ClearTimer()
  self:StopAllAnimations()
  self:ResetLastFacial()
  self:Hide("Paused")
end

function M:OnPauseResumed()
  self:StopAllAnimations()
  self:Show("Paused")
end

function M:ResetLastFacial()
  self.LastFacialIdx = nil
end

function M:Clear()
  self:RemoveTimer(self.DialogueDurationTimer)
  self:ClearTipUI()
end

function M:ClearTimer()
  self:RemoveTimer(self.DialogueDurationTimer)
  self:RemoveTimer(self.ShowForgeTimer)
end

function M:SetForgeVisibility(bForgeVisible)
  if self.bForgeVisible == bForgeVisible then
    return
  end
  self.bForgeVisible = bForgeVisible
  if self.bForgeVisible then
    self.ForgingTips:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self.Text_Workable:SetText(GText("UI_FORGING_READY"))
  else
    self.ForgingTips:SetVisibility(ESlateVisibility.Collapsed)
  end
end

function M:GetCanProduceDraftIds()
  local CanProduceDraftIds = {}
  local TargetDraftIds = EMCache:Get("TargetDraftIds", true)
  if TargetDraftIds then
    for DraftId, _ in pairs(TargetDraftIds) do
      local DraftInfo = ForgeModel:ConstructDraftInfoByDraftId(DraftId)
      if DraftInfo and ForgeModel:CanProduce(DraftInfo) > 0 then
        table.insert(CanProduceDraftIds, DraftId)
      end
    end
  end
  table.sort(CanProduceDraftIds, function(Id_1, Id_2)
    return Id_1 < Id_2
  end)
  return CanProduceDraftIds
end

function M:ProcessPlayForgingWaitTag(CanProduceDraftIds, Idx, Callback)
  local Num = #CanProduceDraftIds
  if Idx > Num then
    if Callback then
      Callback()
    end
    return
  end
  self:HideAllTipsUI()
  for i = Idx, Idx + MaxTipUINum - 1 do
    local Id = CanProduceDraftIds[i]
    if not Id then
      break
    end
    local TipUI = self:GetTipUI(i % MaxTipUINum)
    self:InitTipUI(TipUI, Id)
  end
  self.ShowForgeTimer = self:AddTimer(TipUIShowTime, self.ProcessPlayForgingWaitTag, false, 0, nil, false, CanProduceDraftIds, Idx + MaxTipUINum, Callback)
end

function M:HideAllTipsUI()
  self.TipUIs = self.TipUIs or {}
  for _, UI in pairs(self.TipUIs) do
    UI:HideDraftItem()
  end
end

function M:InitTipUI(TipUI, DraftId)
  TipUI:ShowDraftItem(DraftId)
end

function M:GetTipUI(Idx)
  self.TipUIs = self.TipUIs or {}
  local TipUI = self.TipUIs[Idx]
  if not TipUI then
    local UIPath = "WidgetBlueprint'/Game/UI/WBP/Forging/Widget/WBP_Forging_WorkableTips.WBP_Forging_WorkableTips_C'"
    local UIClass = UE.UClass.Load(UIPath)
    TipUI = UE.UWidgetBlueprintLibrary.Create(self, UIClass)
    self.VBox:AddChildToVerticalBox(TipUI)
  end
  self.TipUIs[Idx] = TipUI
  return TipUI
end

function M:ClearTipUI()
  self.VBox:ClearChildren()
  self.TipUIs = {}
end

return M
