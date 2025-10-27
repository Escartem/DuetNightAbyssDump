local M = Class("BluePrints.Story.Talk.Controller.LightTalkTask")

function M:PlayDialogue()
  local CurrentDialogueData = DataMgr.Dialogue[self.TalkTaskData.FirstDialogueId]
  if CurrentDialogueData.VoiceName then
    self:OnPlayingDialogue(CurrentDialogueData)
    self.TalkAudioComp:PlayDialogue(CurrentDialogueData, self.TalkTaskData, self, {
      Func = function()
        self:Finish()
      end
    }, true, self.TalkTaskData.AudioAttachActor, IsValid(self.AudioAttachActor))
  else
    self:Finish()
  end
end

return M
