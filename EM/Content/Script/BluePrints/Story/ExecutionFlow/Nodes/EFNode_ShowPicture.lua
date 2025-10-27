local M = {}

function M:CreateNode(Flow, TalkTask, Params)
  local PictureId = Params.PictureId
  local FadeInTime = Params.FadeInTime or 0
  local FadeOutTime = Params.FadeOutTime or 0
  local Duration = Params.Duration or 0
  local DurationHandle
  local ShowPictureNode = Flow:CreateNode(UEFNode_Delegate)
  ShowPictureNode.DebugLog = string.format("ShowPicture PictureId: %s, FadeInTime: %s, FadeOutTime: %s, Duration: %s", PictureId, FadeInTime, FadeOutTime, Duration)
  ShowPictureNode.OnStart:Add(ShowPictureNode, function(Node)
    TalkTask.TalkTaskData.UI:ShowPicture(PictureId, FadeInTime, FadeOutTime, Duration)
    local DelaySeconds = FadeInTime + Duration + FadeOutTime
    if DelaySeconds <= 0 then
      Node:Finish({
        Node.FinishPin
      })
    else
      DurationHandle = UKismetSystemLibrary.K2_SetTimerDelegate({
        Node,
        function()
          Node:Finish({
            Node.FinishPin
          })
        end
      }, DelaySeconds, false)
    end
  end)
  ShowPictureNode.OnFinish:Add(ShowPictureNode, function(Node)
    if DurationHandle then
      UKismetSystemLibrary.K2_ClearAndInvalidateTimerHandle(Node, DurationHandle)
      DurationHandle = nil
    end
    TalkTask.TalkTaskData.UI:TryHideLastDialoguePic()
  end)
  ShowPictureNode.OnSkip:Add(ShowPictureNode, function(Node)
    Node:Finish({
      Node.FinishPin
    })
  end)
  return ShowPictureNode
end

return M
