require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:InitPage(EventId)
  self.EventId = EventId
  self.EventInfo = DataMgr.EventMain[self.EventId]
  if not self.EventInfo then
    ScreenPrint("\229\136\157\229\167\139\229\140\150\229\137\141\231\189\174\228\187\187\229\138\161\231\187\132\228\187\182\232\175\187\232\161\168\229\164\177\232\180\165\239\188\129EventId:", self.EventId)
    return
  end
  self:UpdateVisibility()
  self.Text_TaskTitle:SetText(GText("UI_PretextTasks"))
  self.TaskListContents = {}
  local MainQuestInfo = self:GetMainQuestInfo()
  if MainQuestInfo.DisplayTextName then
    local MainQuestContent = NewObject(UIUtils.GetCommonItemContentClass())
    MainQuestContent.ParentWidget = self
    MainQuestContent.OnClickedParams = {
      Obj = self,
      Callback = self.OnClicked_TaskBtn,
      Params = table.pack(MainQuestInfo.JumpQuestChainId)
    }
    MainQuestContent.BtnName = "Main"
    MainQuestContent.DisplayText = MainQuestInfo.DisplayTextName
    MainQuestContent.IsShowLock = MainQuestInfo.IsShowLock
    MainQuestContent.IsForbidClick = MainQuestInfo.IsForbidClick
    MainQuestContent.IsShowFinish = MainQuestInfo.IsShowFinish
    self.List_Task:AddItem(MainQuestContent)
    table.insert(self.TaskListContents, MainQuestContent)
  end
  local SideQuestInfo = self:GetSideQuestInfo()
  if SideQuestInfo.DisplayTextName then
    local SideQuestContent = NewObject(UIUtils.GetCommonItemContentClass())
    SideQuestContent.ParentWidget = self
    SideQuestContent.OnClickedParams = {
      Obj = self,
      Callback = self.OnClicked_TaskBtn,
      Params = table.pack(SideQuestInfo.JumpQuestChainId)
    }
    SideQuestContent.BtnName = "Side"
    SideQuestContent.DisplayText = SideQuestInfo.DisplayTextName
    SideQuestContent.IsShowLock = SideQuestInfo.IsShowLock
    SideQuestContent.IsForbidClick = SideQuestInfo.IsForbidClick
    SideQuestContent.IsShowFinish = SideQuestInfo.IsShowFinish
    self.List_Task:AddItem(SideQuestContent)
    table.insert(self.TaskListContents, SideQuestContent)
  end
  self.Key_PerTaskTitle:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "View"}
    }
  })
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(self)
  if IsValid(self.GameInputModeSubsystem) then
    self:OnUpdateSubUIViewStyle(self.GameInputModeSubsystem:GetCurrentInputType() == ECommonInputType.Gamepad)
  end
end

function M:UpdatePage()
  self:UpdateVisibility()
  for _, QuestContent in pairs(self.TaskListContents) do
    if IsValid(QuestContent) then
      local FunName = "Get" .. QuestContent.BtnName .. "QuestInfo"
      local NewQuestInfo = FunName(self)
      QuestContent.OnClickedParams = {
        Obj = self,
        Callback = self.OnClicked_TaskBtn,
        Params = table.pack(NewQuestInfo.JumpQuestChainId)
      }
      QuestContent.DisplayText = NewQuestInfo.DisplayTextName
      QuestContent.IsShowLock = NewQuestInfo.IsShowLock
      QuestContent.IsForbidClick = NewQuestInfo.IsForbidClick
      QuestContent.SelfWidget:OnListItemObjectSet(QuestContent)
    end
  end
end

function M:UpdateVisibility()
  self.IsShow = self:IsNeedShow()
  DebugPrint("PreTaskSubWidget:UpdateVisibility IsShow", self.IsShow)
  if self.IsShow then
    self:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  else
    self:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
end

function M:OnSubWidgetReceivedFocus()
  if self.IsShow then
    self.List_Task:SetFocus()
    self.Key_PerTaskTitle:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
  return "SelectView", self.List_Task
end

function M:OnSubWidgetLostFocus()
  if self.IsShow then
    self.Key_PerTaskTitle:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  end
  return nil, nil
end

function M:OnUpdateSubUIViewStyle(IsUseGamePad)
  if self.IsShow then
    if IsUseGamePad then
      self.Key_PerTaskTitle:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    else
      self.Key_PerTaskTitle:SetVisibility(UE4.ESlateVisibility.Collapsed)
    end
  end
end

function M:IsNeedShow()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return false
  end
  local EventInfo = DataMgr.EventMain[self.EventId]
  if not EventInfo then
    ScreenPrint("EventMain\232\161\168\228\184\173\230\137\190\228\184\141\229\136\176\230\173\162\230\181\129\230\180\187\229\138\168\231\155\184\229\133\179\228\191\161\230\129\175\239\188\129\232\175\187\229\143\150\231\154\132EventId:" .. self.EventId)
    return false
  end
  local PrerequisiteQuestId = {}
  if EventInfo.PretextTasks1 then
    table.insert(PrerequisiteQuestId, EventInfo.PretextTasks1)
  end
  for _, QuestId in pairs(EventInfo.PretextTasks2 or {}) do
    table.insert(PrerequisiteQuestId, QuestId)
  end
  for _, QuestId in pairs(PrerequisiteQuestId) do
    local QuestChain = Avatar.QuestChains[QuestId]
    if not QuestChain then
      return true
    end
    if not QuestChain:IsFinish() then
      return true
    end
  end
  return false
end

function M:OnClicked_TaskBtn(JumpQuestChainId)
  DebugPrint("OnClicked_JumpQuestChainId", JumpQuestChainId)
  PageJumpUtils:JumpToTargetPageByJumpId(23, JumpQuestChainId)
end

function M:GetMainQuestInfo()
  local Res = {}
  local ConfigedMainQuestChainId = self.EventInfo.PretextTasks1
  if not ConfigedMainQuestChainId then
    return Res
  end
  local ConfigedMainQuestChainState = self:GetQuestChainState(ConfigedMainQuestChainId)
  if "Unlock" == ConfigedMainQuestChainState then
    local Avatar = GWorld:GetAvatar()
    for QuestChainId, Data in pairs(Avatar.QuestChains) do
      local QuestChainType = DataMgr.QuestChain[QuestChainId].QuestChainType
      if QuestChainType == Const.MainQuestChainType and 1 == Data.State then
        Res.JumpQuestChainId = QuestChainId
        break
      end
    end
    Res.IsShowLock = true
    Res.IsForbidClick = false
  else
    Res.JumpQuestChainId = ConfigedMainQuestChainId
    Res.IsShowLock = false
    if "Doing" == ConfigedMainQuestChainState then
      Res.IsForbidClick = false
      Res.IsShowFinish = false
    else
      Res.IsForbidClick = true
      Res.IsShowFinish = true
    end
  end
  local ChapterName = DataMgr.QuestChain[ConfigedMainQuestChainId].ChapterName or ""
  local QuestChainName = DataMgr.QuestChain[ConfigedMainQuestChainId].QuestChainName or ""
  Res.DisplayTextName = GText(ChapterName) .. "\194\183" .. GText(QuestChainName)
  return Res
end

function M:GetSideQuestInfo()
  local Res = {}
  local ConfigedSideQuestChainIds = self.EventInfo.PretextTasks2
  if not ConfigedSideQuestChainIds then
    return Res
  end
  local FirstDoingQuestChainId = 0
  local IsAllFinished = true
  for _, SideQuestChainId in pairs(ConfigedSideQuestChainIds) do
    local SideQuestChainState = self:GetQuestChainState(SideQuestChainId)
    IsAllFinished = IsAllFinished and "Finish" == SideQuestChainState
    if "Doing" == SideQuestChainState then
      FirstDoingQuestChainId = SideQuestChainId
      break
    end
  end
  local LastQuestChainId = ConfigedSideQuestChainIds[#ConfigedSideQuestChainIds]
  local ChapterName = DataMgr.QuestChain[LastQuestChainId].ChapterName or ""
  local QuestChainName = DataMgr.QuestChain[LastQuestChainId].QuestChainName or ""
  Res.DisplayTextName = GText(ChapterName) .. "\194\183" .. GText(QuestChainName)
  Res.IsShowLock = FirstDoingQuestChainId ~= LastQuestChainId
  Res.IsForbidClick = 0 == FirstDoingQuestChainId
  Res.JumpQuestChainId = FirstDoingQuestChainId
  Res.IsShowFinish = IsAllFinished
  return Res
end

function M:GetQuestChainState(QuestChainId)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return ""
  end
  if not Avatar.QuestChains[QuestChainId] then
    return "Unlock"
  end
  if Avatar.QuestChains[QuestChainId]:IsFinish() then
    return "Finish"
  elseif Avatar.QuestChains[QuestChainId]:IsDoing() then
    return "Doing"
  else
    return "Unlock"
  end
end

return M
