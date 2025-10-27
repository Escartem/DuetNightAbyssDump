local ImpressionTypes = require("BluePrints.UI.UI_PC.Impression.ImpressionConst").ImpressionTypes
local ETalkNodeFinishType = require("StoryCreator.StoryLogic.StorylineUtils").ETalkNodeFinishType
local EImpressionButtonState = require("BluePrints.UI.UI_PC.Impression.ImpressionConst").EImpressionButtonState
local ETalkOptionType = require("BluePrints.Story.Talk.Model.TalkOptionData").ETalkOptionType
local WBP_ImpressionItem_Common = Class({
  "BluePrints.UI.BP_EMUserWidget_C",
  "BluePrints.Common.TimerMgr"
})

function WBP_ImpressionItem_Common:InitUIData_Lua(ImpressionUI, ItemIndex, TalkTriggerId, OptionType, Option, OptionState, OnItemHandleEndDelegate, bIsSelected)
  self.OnBeginShowCheckOrPlusUIEvent = nil
  self.OnEndShowCheckOrPlusUIEvent = nil
  self.OnClickedEvent = nil
  self.ImpressionUI = ImpressionUI
  self.ItemIndex = ItemIndex
  self.TalkTriggerId = TalkTriggerId
  self.OptionType = OptionType
  self.Option = Option
  self.OnItemHandleEndDelegate = OnItemHandleEndDelegate
  self.CheckType = ""
  self.CheckValue = -1
  self.PlusType = ""
  self.PlusValue = -1
  self.SuccRate = -1
  self.bIsHandled = false
  self.bIsSelected = bIsSelected
  self:SetState(OptionState)
end

function WBP_ImpressionItem_Common:SwitchBindAnimationEvents(bBind)
  DebugPrint("WBP_ImpressionItem_Common:SwitchBindAnimationEvents", bBind)
  self:UnbindFromAnimationFinished(self.Click, {
    self,
    self.OnClickAnimFinished
  })
  if bBind then
    self:BindToAnimationFinished(self.Click, {
      self,
      self.OnClickAnimFinished
    })
  end
end

function WBP_ImpressionItem_Common:InitVisibility()
  self.HB_Normal:SetVisibility(ESlateVisibility.Collapsed)
end

function WBP_ImpressionItem_Common:InitImgIcon()
  local ImpressionConfigInfo = DataMgr.ImpressionConfig.Common
  local IconTexture = LoadObject(ImpressionConfigInfo.StatusCommonIcon)
  self.Img_Icon:SetBrushFromTexture(IconTexture)
end

function WBP_ImpressionItem_Common:InitTexts(Option)
  self.Text_Normal:SetText(Option.OptionText)
end

function WBP_ImpressionItem_Common:SwitchEnableClickEvents(bEnable)
  self:SwitchBindButtonEvents(bEnable)
end

function WBP_ImpressionItem_Common:SwitchBindButtonEvents(bBind)
  DebugPrint("WBP_ImpressionItem_Common:SwitchBindButtonEvents", bBind, self)
  self.Btn_ItemClick.OnClicked:Clear()
  self.Btn_ItemClick.OnPressed:Clear()
  self.Btn_ItemClick.OnReleased:Clear()
  self.Btn_ItemClick.OnHovered:Clear()
  self.Btn_ItemClick.OnUnhovered:Clear()
  if bBind then
    self.Btn_ItemClick.OnClicked:Add(self, self.OnClicked)
    self.Btn_ItemClick.OnPressed:Add(self, self.OnPressed)
    self.Btn_ItemClick.OnHovered:Add(self, self.OnHoveredByPlatform)
    self.Btn_ItemClick.OnUnhovered:Add(self, self.OnUnhoveredByPlatform)
    self.Btn_ItemClick.OnReleased:Add(self, self.OnReleased)
  end
end

function WBP_ImpressionItem_Common:Init(ImpressionUI, ItemIndex, TalkTriggerId, OptionState, OptionType, Option, bInMobile, OnItemHandleEndDelegate, UsingGM, bIsSelected)
  DebugPrint("WBP_ImpressionItem_Common:Init", self)
  self:InitUIData_Lua(ImpressionUI, ItemIndex, TalkTriggerId, OptionType, Option, OptionState, OnItemHandleEndDelegate, bIsSelected)
  self.UsingGM = UsingGM
  self:InitImpressionData()
  self:InitVisibility()
  self:InitImgIcon()
  self:InitTexts(Option)
  self:AdaptPlatform()
  self:SwitchBindAnimationEvents(true)
  self:DisplayOption()
  self:InitText_NormalVerifieNum()
end

function WBP_ImpressionItem_Common:InitText_NormalVerifieNum()
  if self.CheckValue then
    self.Text_NormalVerifieNum:SetText(string.format(GText("UI_ImpressionShop_HardLevel"), self.CheckValue))
    self.Text_NormalVerifieNum:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  end
end

function WBP_ImpressionItem_Common:Clear()
  DebugPrint("WBP_ImpressionItem_Common:Clear", self)
  self:ClearByPlatform()
  self:StopAllAnimations()
  self:SwitchBindButtonEvents(false)
  self:SwitchBindAnimationEvents(false)
end

function WBP_ImpressionItem_Common:ClearByPlatform()
  DebugPrint("Error: \230\156\170\229\174\158\231\142\176\231\154\132\229\135\189\230\149\176WBP_ImpressionItem_Common:ClearByPlatform")
end

function WBP_ImpressionItem_Common:TryFireOnItemHandleEndDelegate(FinishType)
  DebugPrint("WBP_ImpressionItem_Common:TryFireOnItemHandleEndDelegate", FinishType)
  self:Clear()
  if self.OnItemHandleEndDelegate then
    self.OnItemHandleEndDelegate(FinishType)
    self.OnItemHandleEndDelegate = nil
  end
end

function WBP_ImpressionItem_Common:InitImpressionData()
  local CheckInfo
  if self.OptionType == ETalkOptionType.Plus then
    CheckInfo = DataMgr.ImpressionPlus[self.Option.PlusId]
  elseif self.OptionType == ETalkOptionType.Check then
    CheckInfo = DataMgr.ImpressionCheck[self.Option.CheckId]
  end
  self.CheckInfo = CheckInfo
  if CheckInfo and CheckInfo.RegionId then
    self.ImpressionAreaId = CheckInfo.RegionId
  else
    self.ImpressionAreaId = 1011
  end
end

function WBP_ImpressionItem_Common:AdaptPlatform()
  DebugPrint("Error: \230\156\170\229\174\158\231\142\176\231\154\132\229\135\189\230\149\176WBP_ImpressionItem_Common:AdaptPlatform")
end

function WBP_ImpressionItem_Common:SetOnBeginShowCheckOrPlusUI(Delegate)
  DebugPrint("WBP_ImpressionItem_Common:SetOnBeginShowCheckOrPlusUI")
  self.OnBeginShowCheckOrPlusUIEvent = Delegate
end

function WBP_ImpressionItem_Common:SetOnEndShowCheckOrPlusUI(Delegate)
  DebugPrint("WBP_ImpressionItem_Common:SetOnEndShowCheckOrPlusUI")
  self.OnEndShowCheckOrPlusUIEvent = Delegate
end

function WBP_ImpressionItem_Common:SetOnInterruptedExit(Delegate)
  DebugPrint("WBP_ImpressionItem_Common:SetOnInterruptedExit")
  self.OnInterruptedExitEvent = Delegate
end

function WBP_ImpressionItem_Common:SetOnClicked(Delegate)
  DebugPrint("WBP_ImpressionItem_Common:SetOnClicked")
  self.OnClickedEvent = Delegate
end

function WBP_ImpressionItem_Common:SetOnHovered(Delegate)
end

function WBP_ImpressionItem_Common:SetOnUnhovered(Delegate)
end

function WBP_ImpressionItem_Common:SetSelect(bIsSelect)
  DebugPrint("WBP_ImpressionItem_Common:SetSelect", bIsSelect, self.ItemIndex)
  if bIsSelect then
    AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_add", nil, nil)
  end
  self:OnSelectedByPlatform(bIsSelect)
end

function WBP_ImpressionItem_Common:SetState(NewState)
  DebugPrint("WBP_ImpressionItem_Common:SetState", NewState)
  self.State = NewState
  if self.State == EImpressionButtonState.None then
    self:SetVisibility(ESlateVisibility.Collapsed)
  elseif self.State == EImpressionButtonState.Enabled then
    self:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self:PlayAnimation(self.Normal)
    if self.bIsSelected then
      self:PlayAnimation(self.Read)
    else
      self:PlayAnimationReverse(self.Read)
    end
  elseif self.State == EImpressionButtonState.Disabled then
    self:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self:PlayAnimation(self.Forbidden_Normal)
  end
end

function WBP_ImpressionItem_Common:OnNotWorking()
  self:SetState(EImpressionButtonState.None)
end

function WBP_ImpressionItem_Common:DisplayOption()
  DebugPrint("WBP_ImpressionItem_Common:DisplayOption")
  if self.OptionType == ETalkOptionType.Plus then
    self:DisplayPlus()
  elseif self.OptionType == ETalkOptionType.Check and not self.Option.NotCheck then
    self.HB_Normal:SetVisibility(ESlateVisibility.Visible)
    self:DisplayCheck()
  end
end

function WBP_ImpressionItem_Common:DisplayCheck()
  DebugPrint("WBP_ImpressionItem_Common:DisplayCheck")
  local CheckInfo = DataMgr.ImpressionCheck[self.Option.CheckId]
  local Avatar = GWorld:GetAvatar()
  local Impression = Avatar and Avatar:GetRegionImpression(self.ImpressionAreaId)
  for _, ImpressionType in pairs(ImpressionTypes) do
    local CheckValue = CheckInfo[ImpressionType .. "Check"]
    if CheckValue > 0 then
      self.CheckType = ImpressionType
      self.CheckValue = CheckValue
      local ImpressionText = GText("Impression_UI_Check_" .. ImpressionType)
      self.Text_NormalVerifieTitle:SetText(ImpressionText)
      local ImpressionConfigInfo = DataMgr.ImpressionConfig[ImpressionType]
      local IconTexture = LoadObject(ImpressionConfigInfo.StatusCommonIcon)
      self.Img_Icon:SetBrushFromTexture(IconTexture)
      local PlayerValue = Impression and Impression:GetImpressionValueByType(ImpressionType) or 0
      self.PlayerValue = PlayerValue
      self.SuccRate = self:GetSuccRate()
      self.Text_DifficultyNum:SetText(tostring(self.SuccRate) .. "%")
      local DifficultyText = GText("Impression_UI_CheckSuccRate") .. ":"
      self.Text_Difficulty:SetText(DifficultyText)
      local DifficultyInfo = self:GetDifficultyInfo(self.SuccRate)
      local DifficultyColor = self:GetDifficultyCorlor(DifficultyInfo)
      self.Image_DifficultyBG:SetColorAndOpacity(DifficultyColor)
    end
  end
end

function WBP_ImpressionItem_Common:DisplayPlus()
  DebugPrint("WBP_ImpressionItem_Common:DisplayPlus")
  local PlusInfo = DataMgr.ImpressionPlus[self.Option.PlusId]
  if PlusInfo then
    self.PlusValue = 0
    for _, ImpressionType in pairs(ImpressionTypes) do
      local PlusValue = PlusInfo[ImpressionType .. "Plus"]
      if PlusValue > 0 then
        self.PlusType = ImpressionType
        self.PlusValue = PlusValue
      end
    end
  end
end

function WBP_ImpressionItem_Common:GetSuccRate()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    DebugPrint("WBP_ImpressionItem_Common:NoAvatar")
    return 100
  end
  return Avatar:GetSuccRate(self.PlayerValue, self.CheckValue)
end

function WBP_ImpressionItem_Common:GetDifficultyInfo(SuccRate)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    DebugPrint("WBP_ImpressionItem_Common:NoAvatar")
    return
  end
  return Avatar:GetDifficultyInfo(SuccRate)
end

function WBP_ImpressionItem_Common:GetDifficultyCorlor(DifficultyInfo)
  if not DifficultyInfo then
    return
  end
  if DifficultyInfo.DifficultyId == "Easy" then
    return self.HardBG_Level01
  elseif DifficultyInfo.DifficultyId == "Middle" then
    return self.HardBG_Level02
  elseif DifficultyInfo.DifficultyId == "Hard" then
    return self.HardBG_Level03
  elseif DifficultyInfo.DifficultyId == "Impossible" then
    return self.HardBG_Level04
  else
    return self.HardBG_Level04
  end
end

function WBP_ImpressionItem_Common:HandleImpression()
  DebugPrint("WBP_ImpressionItem_Common:HandleImpression", self.OptionType)
  if self.OptionType == ETalkOptionType.Plus then
    self:HandlePlus()
  elseif self.OptionType == ETalkOptionType.Check then
    self:HandleCheck()
  else
    self:TryFireOnItemHandleEndDelegate()
  end
end

function WBP_ImpressionItem_Common:HandlePlus()
  DebugPrint("WBP_ImpressionItem_Common:HandlePlus", self.OptionType)
  local Avatar = GWorld:GetAvatar()
  local DialogueChain = self.ImpressionUI.TalkTask.DialogueRecordComponent:GetChain()
  if Avatar then
    Avatar:ImpressionAddByEnumId_New(DialogueChain, self.Option.OptionId, {
      self,
      self.OnImpressionHandled,
      self.OnImpressionTimeout
    }, self.UsingGM)
  else
    self:OnImpressionHandled(0)
  end
end

function WBP_ImpressionItem_Common:HandleCheck()
  self:InitCheckUI("Check")
end

function WBP_ImpressionItem_Common:OnImpressionTimeout(DialogueChain)
  local Title = "\229\141\176\232\177\161\229\138\160\229\128\188\232\182\133\230\151\182"
  local DialogueChainStr = ""
  local DialogueId
  DialogueChain = DialogueChain or {}
  for i, dialogueId in ipairs(DialogueChain) do
    if 1 ~= i then
      DialogueChainStr = DialogueChainStr .. " to\n"
    end
    DialogueId = dialogueId
    DialogueChainStr = DialogueChainStr .. tostring(DialogueId)
  end
  local Message = string.format("\229\141\176\232\177\161\229\138\160\229\128\188\230\156\170\230\148\182\229\136\176\230\156\141\229\138\161\229\153\168\229\155\158\232\176\131\239\188\140\229\189\147\229\137\141\233\128\137\233\161\185Id: %s\239\188\140\229\175\185\232\175\157\233\147\190:\n%s", DialogueId and tostring(DialogueId) or "\230\151\160", DialogueChainStr)
  UStoryLogUtils.PrintToFeiShu(self, Title, Message)
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    Avatar:DisconnectServer()
  end
end

function WBP_ImpressionItem_Common:InitCheckUI(Type)
  DebugPrint("WBP_ImpressionItem_Common:InitCheckUI")
  local CheckParams = {
    ImpressionAreaId = self.ImpressionAreaId,
    OptionId = self.Option.OptionId,
    TalkTriggerId = self.TalkTriggerId,
    Type = Type,
    UsingGM = self.UsingGM,
    CheckInfo = self.CheckInfo
  }
  self:BeginShowCheckOrPlusUI()
  local ImpressionResultUI = self.ImpressionUI:CreateWidgetNew("ImperssionResult")
  ImpressionResultUI:AddToViewport(self.ImpressionUI:GetZOrder())
  ImpressionResultUI:Init(self.ImpressionUI, self.PlayerValue, self.CheckType, self.CheckValue, CheckParams)
  ImpressionResultUI:SetOnCloseDelegate({
    self,
    self.EndShowCheckOrPlusUI
  })
  ImpressionResultUI:SetOnInterruptedExitDelegate({
    self,
    self.InterruptExit
  })
  ImpressionResultUI:SetOnReceiveRetryServerHandled(function(...)
    self:RefreshServerHandledInfo(...)
  end)
  ImpressionResultUI:FadeIn()
end

function WBP_ImpressionItem_Common:OnImpressionHandled(...)
  DebugPrint("WBP_ImpressionItem_Common:OnImpressionHandled", self.bIsHandled)
  if self.bIsHandled then
    return
  end
  self.bIsHandled = true
  local Error, DialogueChain = ...
  if not ErrorCode:Check(Error) then
    local ErrorCodeMessage = "\233\148\153\232\175\175\231\160\129\228\184\141\229\173\152\229\156\168"
    local ErrorCodeData = DataMgr.ErrorCode[Error]
    if ErrorCodeData then
      ErrorCodeMessage = ErrorCodeData.ErrorCodeContent or "\233\148\153\232\175\175\231\160\129\228\184\141\229\173\152\229\156\168\232\175\180\230\152\142\229\134\133\229\174\185"
    end
    local DialogueChainStr = ""
    DialogueChain = DialogueChain or {}
    for i, DialogueId in ipairs(DialogueChain) do
      if 1 ~= i then
        DialogueChainStr = DialogueChainStr .. " to\n"
      end
      DialogueChainStr = DialogueChainStr .. tostring(DialogueId)
    end
    local Title = "\229\141\176\232\177\161\231\179\187\231\187\159\233\148\153\232\175\175"
    local Message = string.format("ErrorCode: %d\n%s\239\188\140\229\175\185\232\175\157\233\147\190:\n%s", Error, ErrorCodeMessage, DialogueChainStr)
    UStoryLogUtils.PrintToFeiShu(self, Title, Message)
    self.ImpressionUI:StopStoryLine()
    return
  end
  if self.OptionType == ETalkOptionType.Plus then
    self:OnImpressionPlus()
  elseif self.OptionType == ETalkOptionType.Check then
    self:OnImpressionCheck(...)
  end
end

function WBP_ImpressionItem_Common:OnImpressionPlus()
  DebugPrint("WBP_ImpressionItem_Common:OnImpressionPlus", self.PlusValue)
  if 0 == self.PlusValue then
    self:EndShowCheckOrPlusUI(true)
    return
  end
  self:BeginShowCheckOrPlusUI()
  self:ShowPlusUI(true, {
    self,
    self.EndShowCheckOrPlusUI
  })
end

function WBP_ImpressionItem_Common:OnImpressionCheck(ErrorCode, Ret, Rand1, Rand2, CheckParams)
  DebugPrint("WBP_ImpressionItem_Common:OnImpressionCheck", ErrorCode, Ret, Rand1, Rand2, CheckParams)
  self:RefreshServerHandledInfo(ErrorCode, Ret, Rand1, Rand2, CheckParams)
  self:BeginShowCheckOrPlusUI()
  self:ShowCheckUI(Ret, Rand1, Rand2, {
    self,
    self.EndShowCheckOrPlusUI
  }, CheckParams, {
    self,
    self.InterruptExit
  })
end

function WBP_ImpressionItem_Common:BeginShowCheckOrPlusUI()
  DebugPrint("WBP_ImpressionItem_Common:BeginShowCheckOrPlusUI")
  if self.OnBeginShowCheckOrPlusUIEvent and self.OnBeginShowCheckOrPlusUIEvent[1] and self.OnBeginShowCheckOrPlusUIEvent[2] then
    self.OnBeginShowCheckOrPlusUIEvent[2](self.OnBeginShowCheckOrPlusUIEvent[1])
  end
end

function WBP_ImpressionItem_Common:EndShowCheckOrPlusUI(bCheckSucceed)
  DebugPrint("WBP_ImpressionItem_Common:EndShowCheckOrPlusUI", bCheckSucceed)
  
  local function AfterShowRewardCallback()
    if self.OnEndShowCheckOrPlusUIEvent and self.OnEndShowCheckOrPlusUIEvent[1] and self.OnEndShowCheckOrPlusUIEvent[2] then
      self.OnEndShowCheckOrPlusUIEvent[2](self.OnEndShowCheckOrPlusUIEvent[1])
    end
    if true == bCheckSucceed then
      self:TryFireOnItemHandleEndDelegate()
    elseif false == bCheckSucceed then
      self:TryFireOnItemHandleEndDelegate(ETalkNodeFinishType.Fail)
    end
  end
  
  if self.OptionType == ETalkOptionType.Check then
    local Avatar = GWorld:GetAvatar()
    local Data = self:GetServerHandledInfo()
    if Avatar then
      Avatar:ShowCommonImpressionReward(Data.ErrorCode, bCheckSucceed, Data.CheckParams.CheckInfo, Data.CheckParams.Rewards, AfterShowRewardCallback)
    else
      AfterShowRewardCallback()
    end
  else
    AfterShowRewardCallback()
  end
end

function WBP_ImpressionItem_Common:InterruptExit()
  if self.OnInterruptedExitEvent and self.OnInterruptedExitEvent[1] and self.OnInterruptedExitEvent[2] then
    self.OnInterruptedExitEvent[2](self.OnInterruptedExitEvent[1])
  end
end

function WBP_ImpressionItem_Common:ShowCheckUI(bCheckSucceed, Rand1, Rand2, OnCloseDelegate, CheckParams, OnInterruptedExitDelegate)
end

function WBP_ImpressionItem_Common:ShowPlusUI(bCheckSucceed, OnCloseDelegate)
  DebugPrint("WBP_ImpressionItem_Common:ShowPlusUI", bCheckSucceed)
  local ImpressionDimensionResultUI = self.ImpressionUI:CreateWidgetNew("ImpressionDimensionResult")
  ImpressionDimensionResultUI:AddToViewport(self.ImpressionUI:GetZOrder())
  ImpressionDimensionResultUI:Init(bCheckSucceed, self.ImpressionAreaId, self.PlusType, self.PlusValue)
  ImpressionDimensionResultUI:SetOnCloseDelegate(OnCloseDelegate)
  ImpressionDimensionResultUI:FadeIn()
end

function WBP_ImpressionItem_Common:OnClickAnimFinished()
  DebugPrint("WBP_ImpressionItem_Common:OnClickAnimFinished", self)
  if self.bIsSelected then
    return
  end
  self:HandleImpression()
end

function WBP_ImpressionItem_Common:PlayButtonClickAudioByOptionType()
  if self.OptionType == ETalkOptionType.Check then
    self:PlayButtonAudioByState()
  else
    AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_confirm", "", nil)
  end
end

function WBP_ImpressionItem_Common:PlayButtonAudioByState()
  if self:IsSelfEnabled() then
    AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_confirm", "", nil)
  elseif self:IsSelfDisabled() then
    AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_disable", "", nil)
  end
end

function WBP_ImpressionItem_Common:OnClicked()
  DebugPrint("WBP_ImpressionItem_Common: OnClicked", self, self.OnClickedEvent, self.State)
  if self:IsSelfEnabled() then
    if self.bIsSelected then
      self:PlayButtonClickAudioByOptionType()
      self:StopAllAnimations()
      self:PlayAnimation(self.Click)
      local TalkContext = GWorld.GameInstance:GetTalkContext()
      TalkContext:TalkShowUITip("CommonToastMain", "Impression_UI_Read")
    else
      self:PlayButtonClickAudioByOptionType()
      self:SwitchBindButtonEvents(false)
      self:StopAllAnimations()
      self:PlayAnimation(self.Click)
      self:FireButtonDelegate(self.OnClickedEvent, self)
    end
  elseif self:IsSelfDisabled() then
    local TalkContext = GWorld.GameInstance:GetTalkContext()
    TalkContext:TalkShowUITip("CommonToastMain", "Impression_UI_Recheck_03")
    self:PlayAnimation(self.Forbidden_Click)
  end
end

function WBP_ImpressionItem_Common:OnPressed()
  DebugPrint("WBP_ImpressionItem_Common: OnPressed", self)
  self:StopAllAnimations()
  self:PlayAnimationByEnabled(self.Press, self.Forbidden_Press)
end

function WBP_ImpressionItem_Common:OnReleased()
  DebugPrint("WBP_ImpressionItem_Common: OnReleased", self)
  self:OnReleasedByPlatform()
end

function WBP_ImpressionItem_Common:OnHoveredByPlatform()
  DebugPrint("WBP_ImpressionItem_Common: OnHovered", self, self.ItemIndex)
end

function WBP_ImpressionItem_Common:OnUnhoveredByPlatform()
  DebugPrint("WBP_ImpressionItem_Common: OnUnhovered", self, self.ItemIndex)
end

function WBP_ImpressionItem_Common:FireButtonDelegate(Delegate, ...)
  if Delegate and Delegate[1] and Delegate[2] then
    Delegate[2](Delegate[1], ...)
  end
end

function WBP_ImpressionItem_Common:IsSelfEnabled()
  return self.State == EImpressionButtonState.Enabled
end

function WBP_ImpressionItem_Common:IsSelfDisabled()
  return self.State == EImpressionButtonState.Disabled
end

function WBP_ImpressionItem_Common:IsSelfSelected()
  return self.ImpressionUI:GetCurrentSelectIndex() == self.ItemIndex
end

function WBP_ImpressionItem_Common:PlayAnimationByEnabled(EnableAnimation, DisableAnimation, ...)
  if self:IsSelfEnabled() then
    self:PlayAnimation(EnableAnimation, ...)
  else
    self:PlayAnimation(DisableAnimation, ...)
  end
end

function WBP_ImpressionItem_Common:RefreshServerHandledInfo(ErrorCode, Ret, Rand1, Rand2, CheckParams)
  self.ServerHandledInfo = {
    ErrorCode = ErrorCode,
    Ret = Ret,
    Rand1 = Rand1,
    Rand2 = Rand2,
    CheckParams = CheckParams
  }
  if Rand1 and Rand2 then
    self.ImpressionUI.TalkTask.DialogueRecordComponent:RecordCheckResult(Ret, tonumber(Rand1) * 10 + tonumber(Rand2) + self.PlayerValue)
  end
end

function WBP_ImpressionItem_Common:GetServerHandledInfo()
  return self.ServerHandledInfo or {}
end

function WBP_ImpressionItem_Common:OnSelectedByPlatform(bIsSelect)
  DebugPrint("Error: \230\156\170\229\174\158\231\142\176\231\154\132\229\135\189\230\149\176WBP_ImpressionItem_Common:OnSelectByPlatform", bIsSelect)
end

function WBP_ImpressionItem_Common:OnReleasedByPlatform()
  DebugPrint("Error: \230\156\170\229\174\158\231\142\176\231\154\132\229\135\189\230\149\176WBP_ImpressionItem_Common:OnReleasedByPlatform")
end

return WBP_ImpressionItem_Common
