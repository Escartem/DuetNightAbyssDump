require("UnLua")
local BP_MergeMechanism_C = Class()

function BP_MergeMechanism_C:ReceiveBeginPlay()
  self.MergeList = {}
  self.MergeName = ""
  self.Num = 0
end

function BP_MergeMechanism_C:SetInteractiveName(Name)
  self.BP_MergeInteractiveComponent.InteractiveName = Name
end

function BP_MergeMechanism_C:AddMergeList(ActorName, Interactive)
  self.Num = self.Num + 1
  self.MergeList[ActorName] = Interactive
end

function BP_MergeMechanism_C:DeleteMergeList(ActorName)
  self.Num = self.Num - 1
  self.MergeList[ActorName] = nil
  if 0 == self.Num then
    return true
  end
  return false
end

return BP_MergeMechanism_C
