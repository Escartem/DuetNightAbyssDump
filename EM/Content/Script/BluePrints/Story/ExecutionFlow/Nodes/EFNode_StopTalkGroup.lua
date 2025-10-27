local Timeutils = require("Utils.TimeUtils")
local M = {}

function M:CreateNode(Flow, TalkTask, Params)
  local ActorId = Params.ActorId
  local Duration = Params.Duration or 0.5
  local StopTalkGroupNode = Flow:CreateNode(UEFNode_Delegate)
  StopTalkGroupNode.DebugLog = string.format("StopTalkGroup ActorId: %s, Duration: %s", ActorId, Duration)
  StopTalkGroupNode.OnStart:Add(StopTalkGroupNode, function(Node)
    local TalkContext = GWorld.GameInstance:GetTalkContext()
    local TalkActorData = TalkContext:GetTalkActorData(TalkTask, ActorId) or {}
    local TalkActor = TalkActorData.TalkActor
    if not IsValid(TalkActor) then
      local DialogueData = DataMgr.Dialogue[Flow.DialogueId]
      local Scripts = DialogueData and DialogueData.Scripts or ""
      local Message = "StopTalkGroup\230\137\190\228\184\141\229\136\176\229\175\185\229\186\148Actor,Id\239\188\154" .. tostring(ActorId) .. "\n\229\143\176\232\175\141Id:" .. Flow.DialogueId .. "\n\232\132\154\230\156\172\239\188\154\n" .. Scripts
      UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "\232\132\154\230\156\172\232\191\144\232\161\140\230\151\182\229\135\186\233\148\153", Message)
      Node:Finish({
        Node.FinishPin
      })
      return
    end
    TalkActor:StopAllTalkAction()
    Node.DurationHandle = UKismetSystemLibrary.K2_SetTimerDelegate({
      Node,
      function()
        if not IsValid(Node) then
          return
        end
        Node:Finish({
          Node.FinishPin
        })
      end
    }, Duration, false)
  end)
  StopTalkGroupNode.OnSkip:Add(StopTalkGroupNode, function(Node)
    if Node.DurationHandle then
      UKismetSystemLibrary.K2_ClearAndInvalidateTimerHandle(Node.DurationHandle)
      Node.DurationHandle = nil
    end
    Node:Finish({
      Node.FinishPin
    })
  end)
  return StopTalkGroupNode
end

return M
