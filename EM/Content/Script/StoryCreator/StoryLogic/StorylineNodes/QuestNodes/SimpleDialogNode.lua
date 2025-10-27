local SimapleDialogNode = Class("StoryCreator.StoryLogic.StorylineNodes.Questline.QuestNode")

function SimapleDialogNode:Init()
  self.ui_type = ""
  self.camera_type = ""
  self.ui_caninteractive = false
  self.talk_id = 0
end

function SimapleDialogNode:Start(Context)
  self.Context = Context
  print("------------ CommonDialogNode ------------------")
  print(self.ui_type)
  print(self.camera_type)
  print(self.ui_caninteractive)
  print(self.talk_id)
end
