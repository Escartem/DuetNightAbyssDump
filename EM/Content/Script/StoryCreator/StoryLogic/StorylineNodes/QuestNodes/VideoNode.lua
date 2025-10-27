local VideoNode = Class("StoryCreator.StoryLogic.StorylineNodes.BaseAsynQuestNode")

function VideoNode:Init()
  self.MediaSourceRef = ""
end

function VideoNode:Execute(Callback)
  DebugPrint("------------ VideoNode Execute------------------")
  
  local function _FireCallback()
    if Callback then
      Callback()
    end
  end
  
  local obj = LoadObject(self.MediaSourceRef)
  if obj then
    self.Action = UE4.UAsyncVideoAction.PlayVideoByMediaSource(GWorld.GameInstance, obj)
    if IsValid(self.Action) then
      self.ActionRefProxy = Ref(self.Action)
      self.Action.OnPlayEnd:Add(GWorld.GameInstance, function()
        self.Action.OnPlayEnd:Clear()
        _FireCallback()
      end)
    else
      DebugPrint("\230\146\173\230\148\190\232\167\134\233\162\145\229\164\177\232\180\165 PlayVideoByMediaSourcec\230\156\170\232\191\148\229\155\158\230\173\163\231\161\174\229\128\188", GWorld.GameInstance, obj)
      _FireCallback()
    end
  else
    DebugPrint("Error: Load Media Source Failed, Ref:", self.MediaSourceRef)
    _FireCallback()
  end
end

function VideoNode:Clear()
  if self.ActionRefProxy and IsValid(self.Action) then
    self.Action.OnPlayEnd:Clear()
  end
  self.ActionRefProxy = nil
end

return VideoNode
