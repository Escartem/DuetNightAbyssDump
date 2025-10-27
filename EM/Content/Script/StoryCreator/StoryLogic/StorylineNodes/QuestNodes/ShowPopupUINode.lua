local ShowPopupUINode = Class("StoryCreator.StoryLogic.StorylineNodes.BaseAsynQuestNode")

function ShowPopupUINode:Init()
  self.PopupId = nil
end

function ShowPopupUINode:Execute(Callback)
  if self.PopupId then
    local Param = {}
    
    function Param.RightCallbackFunction()
      DebugPrint("Tianyi@ Return True")
      if Callback then
        Callback("True")
      end
    end
    
    function Param.LeftCallbackFunction()
      DebugPrint("Tianyi@ Return False")
      if Callback then
        Callback("False")
      end
    end
    
    function Param.CloseBtnCallbackFunction()
      DebugPrint("Tianyi@ Return False")
      if Callback then
        Callback("False")
      end
    end
    
    local GameInstance = GWorld.GameInstance
    local UIManager = GameInstance:GetGameUIManager()
    UIManager:ShowCommonPopupUI(self.PopupId, Param, nil)
  end
end

function ShowPopupUINode:Clear()
  self.PopupId = nil
end

return ShowPopupUINode
