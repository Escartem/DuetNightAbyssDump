local ShowOrHideUINode = Class("StoryCreator.StoryLogic.StorylineNodes.Questline.QuestNode")

function ShowOrHideUINode:Init()
  self.Function = nil
  self.UIParam = nil
  self.ActionParam = nil
  self.ShowOrHide = false
end

function ShowOrHideUINode:Start(Context)
  self.Context = Context
  local GameInstance = GWorld.GameInstance
  local GameMode = UE4.UGameplayStatics.GetGameMode(GameInstance)
  local GameState = GameMode.EMGameState
  DebugPrint("ShowOrHideUINode: Start", self.Function, self.UIParam, self.ActionParam, self.ShowOrHide)
  if self.Function == "HideUIInScreen" then
    if GameState and GameState.HideUIInScreen then
      GameState:HideUIInScreen(self.UIParam, self.ShowOrHide, self)
      DebugPrint("ShowOrHideUINode: Start self.RealSetVisibility", self.RealSetVisibility)
    end
  elseif self.Function == "SetContinuedPCGuideVisibility" and GameMode.SetContinuedPCGuideVisibility then
    GameMode:SetContinuedPCGuideVisibility(self.ActionParam, self.ShowOrHide)
  end
  self:FinishAction()
end

function ShowOrHideUINode:FinishAction()
  self:Finish()
end

function ShowOrHideUINode:OnQuestlineSuccess()
  if self.Function == "HideUIInScreen" then
    self.Context:SaveSuitUpdateData("UpdateSuitKey2Value", CommonConst.SuitType.PlayerCharacterSuit, CommonConst.PlayerCharacterSuit.HideUIInScreen, self.UIParam, self.ShowOrHide)
  elseif self.Function == "SetContinuedPCGuideVisibility" then
    self.Context:SaveSuitUpdateData("UpdateSuitKey2Value", CommonConst.SuitType.PlayerCharacterSuit, CommonConst.PlayerCharacterSuit.ContinuedGuide, self.ActionParam, self.ShowOrHide)
  end
end

function ShowOrHideUINode:OnQuestlineFail()
  DebugPrint("ShowOrHideUINode: OnQuestlineFail", self.Function, self.UIParam, self.ActionParam, self.ShowOrHide)
  local GameInstance = GWorld.GameInstance
  local GameMode = UE4.UGameplayStatics.GetGameMode(GameInstance)
  if self.Function == "HideUIInScreen" then
    DebugPrint("ShowOrHideUINode: OnQuestlineFail self.RealSetVisibility", self.RealSetVisibility)
    if self.RealSetVisibility == true and GameMode.HideUIInScreen then
      local GameState = GameMode.EMGameState
      if GameState and GameState.HideUIInScreen then
        GameState:HideUIInScreen(self.UIParam, not self.ShowOrHide, self)
      end
    end
  elseif self.Function == "SetContinuedPCGuideVisibility" then
    local BattleMainUI = UIManager(self):GetUIObj("BattleMain")
    if BattleMainUI then
      local Instruction = BattleMainUI.Pos_Instruction:GetChildAt(0)
      if Instruction and GameMode.SetContinuedPCGuideVisibility and true == Instruction["RealSet" .. self.ActionParam] then
        DebugPrint("ShowOrHideUINode: OnQuestlineFail SetContinuedPCGuideVisibility RealSet")
        BattleMainUI:AddTimer(1, function()
          GameMode:SetContinuedPCGuideVisibility(self.ActionParam, not self.ShowOrHide)
        end)
      end
    end
  end
end

return ShowOrHideUINode
