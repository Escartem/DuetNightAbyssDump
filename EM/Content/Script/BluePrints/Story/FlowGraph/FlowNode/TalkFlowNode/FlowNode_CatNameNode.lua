local M = Class("BluePrints.Story.FlowGraph.FlowNode.TalkFlowNode.FlowNode_TalkNodeBase")
local CommonPopupUIId = 100222
local CameraBlendTime = 1

function M:Start()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    self:FinishCancel()
    return
  end
  if Avatar.CatName and Avatar.CatName ~= "" then
    self:FinishAccept()
    return
  end
  local TalkTask = self:TryGetTalkTask()
  TalkTask:HideUI(true, "CatName")
  local CommonDialogParams = {
    UseGenaral = true,
    MultilineType = 1,
    TextLenMax = DataMgr.GlobalConstant.CatNameMaxLen.ConstantValue,
    OnSDKChecked = function(bRes, InputWidget, Text)
      if not bRes then
        return
      end
      
      local function Callback(ErrCode)
        if not ErrorCode:Check(ErrCode) then
          local ErrorCodeMessage = "\233\148\153\232\175\175\231\160\129\228\184\141\229\173\152\229\156\168"
          local ErrorCodeData = DataMgr.ErrorCode[ErrCode]
          if ErrorCodeData then
            ErrorCodeMessage = ErrorCodeData.ErrorCodeContent or "\233\148\153\232\175\175\231\160\129\228\184\141\229\173\152\229\156\168\232\175\180\230\152\142\229\134\133\229\174\185"
          end
          local Title = "\231\140\171\231\140\171\232\181\183\229\144\141\233\148\153\232\175\175"
          local Message = string.format("ErrorCode: %d\n%s\n\229\144\141\231\167\176\228\184\186\239\188\154%s", ErrCode, ErrorCodeMessage, Text)
          UStoryLogUtils.PrintToFeiShu(self, Title, Message)
          self:FinishCancel()
          return
        end
        self:FinishAccept()
      end
      
      Avatar:SetCatName(Text, Callback)
    end
  }
  
  function CommonDialogParams.LeftCallbackFunction()
    self:FinishCancel()
  end
  
  CommonDialogParams.CloseBtnCallbackFunction = CommonDialogParams.LeftCallbackFunction
  CommonDialogParams.Owner = self
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  local UIManager = GameInstance:GetGameUIManager()
  UIManager:ShowCommonPopupUI(CommonPopupUIId, CommonDialogParams, TalkTask.UI)
end

function M:K2_Cleanup()
  local TalkTask = self:TryGetTalkTask()
  TalkTask:HideUI(false, "CatName")
end

function M:CanSkip()
  return false
end

return M
