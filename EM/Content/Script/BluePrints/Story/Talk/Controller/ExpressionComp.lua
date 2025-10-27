local ExpressionComp_C = {}
local Utils = require("Utils")
local FeishuErrorTitle = "\230\146\173\230\148\190\232\161\168\230\131\133\229\135\186\233\148\153(\232\181\132\230\186\144\231\188\186\229\164\177/\229\161\171\232\161\168\233\148\153\232\175\175)"

function ExpressionComp_C.New(bResumeOnTalkEnd)
  if nil == bResumeOnTalkEnd then
    bResumeOnTalkEnd = true
  end
  local Obj = setmetatable({}, {__index = ExpressionComp_C})
  Obj.bResumeOnTalkEnd = bResumeOnTalkEnd
  Obj.ResumeActors = {}
  return Obj
end

function ExpressionComp_C:PrintErrorToFeishu(TalkActor, ExpressionId, MontagePath)
  local Message = "\230\137\190\228\184\141Montage\232\181\132\230\186\144" .. "\nNpc\229\144\141\229\173\151:" .. TalkActor:GetName() .. "\n\232\161\168\230\131\133Id(FacialId):" .. ExpressionId .. "\nMontage\232\183\175\229\190\132:" .. MontagePath
  UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, FeishuErrorTitle, Message)
end

function ExpressionComp_C:PlayFacialAnimation(TalkActor, FacialData, TalkContext, TalkTask)
  DebugPrint("ExpressionComp_C:PlayFacialAnimation", TalkActor, FacialData.ExpressionId, TalkContext, TalkTask)
  if not TalkActor then
    return
  end
  if self.bResumeOnTalkEnd then
    self.ResumeActors = self.ResumeActors or {}
    table.insert(self.ResumeActors, TalkActor)
  end
  TalkActor:NewPlayFacial(FacialData.ExpressionId)
end

function ExpressionComp_C:OnTalkInterrupted()
  self:OnTalkEnd()
end

function ExpressionComp_C:Clear()
  self:OnTalkEnd()
end

function ExpressionComp_C:OnTalkEnd()
  if self.bResumeOnTalkEnd then
    for _, Actor in pairs(self.ResumeActors) do
      if IsValid(Actor) and Actor.ReinitDefaultFacial then
        Actor:NewInitDefaultFacial()
      end
    end
  end
end

return ExpressionComp_C
