require("UnLua")
require("DataMgr")
local TalkUtils = require("BluePrints.Story.Talk.View.TalkUtils")
local BP_Fault_Black_UINew_C = Class("BluePrints.Story.Talk.UI.BP_TalkBaseUINew_C")

function BP_Fault_Black_UINew_C:Construct()
  self.Overridden.Construct(self)
  self:BindToAnimationFinished(self.Random, {
    self,
    self.OnWholeDialogueTypingFinsihed
  })
  self.Super.Construct(self)
  if self.CommonLoading then
    self.AllTalkEnd = false
    self.CanShowCommonLoading = false
    self.CommonLoading:SetVisibility(ESlateVisibility.Collapsed)
    EventManager:AddEvent(EventID.SetPlayerLocWithLoadLevel, self, self.SetPlayerLocWithLoadLevelEvent)
  end
  self.CanvasPanel_0:SetRenderOpacity(0)
  self.BackGround:SetRenderOpacity(0)
  AudioManager(self):PlayUISound(self, "event:/snapshot/ui/filter_fade_ui", "FaultBlackUI", nil)
  self:SetStoryInputModeEnabled(true)
end

function BP_Fault_Black_UINew_C:Destruct()
  EventManager:RemoveEvent(EventID.SetPlayerLocWithLoadLevel, self)
  AudioManager(self):StopSound(self, "FaultBlackUI")
  self.Super.Destruct(self)
end

function BP_Fault_Black_UINew_C:SetPlayerLocWithLoadLevelEvent()
  self.CanShowCommonLoading = true
  if self.AllTalkEnd then
    self:ShowCommonLoading()
  end
end

function BP_Fault_Black_UINew_C:ShowCommonLoading()
  self.CommonLoading:SetVisibility(ESlateVisibility.Visible)
  self.CommonLoading:PlayAnimation(self.CommonLoading.In)
  self.CommonLoading:BindToAnimationFinished(self.CommonLoading.In, {
    self.CommonLoading,
    function()
      self.CommonLoading:UnbindAllFromAnimationFinished(self.CommonLoading.In)
      self.CommonLoading:PlayAnimation(self.CommonLoading.Loop, 1, 0)
    end
  })
end

function BP_Fault_Black_UINew_C:PreEnterTalkTask(TalkTask, TaskData, OnPreEnterTalkTaskFinished)
  self.Super.PreEnterTalkTask(self, TalkTask, TaskData, OnPreEnterTalkTaskFinished)
end

function BP_Fault_Black_UINew_C:PreExitTalkTask(TalkTask, TaskData, OnPreExitTalkTaskFinished)
  if self.CommonLoading then
    self.CommonLoading:PlayAnimation(self.CommonLoading.Out)
  end
  self.Super.PreExitTalkTask(self, TalkTask, TaskData, OnPreExitTalkTaskFinished)
end

function BP_Fault_Black_UINew_C:PlayDialogue(TalkTask, DialogueData, TaskData)
  local Content = DialogueData.Content
  self.CanvasPanel_0:SetRenderOpacity(1)
  self.BackGround:SetRenderOpacity(1)
  self.Text_Talk:SetText(Content)
  self:PlayAnimation(self.Random)
  if DataMgr.Dialogue[DialogueData.DialogueId].NextDialogues == nil then
    self:BindToAnimationFinished(self.Random, {
      self,
      function()
        self.AllTalkEnd = true
        if self.CommonLoading and self.CanShowCommonLoading then
          self:ShowCommonLoading()
        end
      end
    })
  end
end

function BP_Fault_Black_UINew_C:OnWholeDialogueTypingFinsihed()
  self.WholeDialogueTypingFinished_Delegate:Fire(true)
end

function BP_Fault_Black_UINew_C:HasPageTypingFinished()
  return true
end

function BP_Fault_Black_UINew_C:HasWholeDialogueTypingFinished()
  return true
end

function BP_Fault_Black_UINew_C:IsAutoPlay()
  return true
end

return BP_Fault_Black_UINew_C
