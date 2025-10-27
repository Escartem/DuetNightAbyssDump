local ActivityReddotHelper = {}

function ActivityReddotHelper.RefreshReddotNode(ActivityId)
  local NodeName = ActivityReddotHelper.GetEventMainNodeName(ActivityId)
  if not NodeName then
    return
  end
  local Node = ReddotManager.GetTreeNode(NodeName)
  if Node then
    Node:OnRefreshNodeData(ActivityId)
  end
end

function ActivityReddotHelper.AddReddotListenByEventId(EventId, CallbackInfo)
  local NodeName = ActivityReddotHelper.GetEventMainNodeName(EventId)
  if not NodeName then
    return
  end
  local Node = ReddotManager.GetTreeNode(NodeName)
  if not Node then
    return
  end
  ReddotManager.AddListenerEx(NodeName, CallbackInfo.Obj, CallbackInfo.Func)
end

function ActivityReddotHelper.RemoveReddotListenByEventId(EventId, CallbackObj)
  local NodeName = ActivityReddotHelper.GetEventMainNodeName(EventId)
  if not NodeName then
    return
  end
  local Node = ReddotManager.GetTreeNode(NodeName)
  if not Node then
    return
  end
  ReddotManager.RemoveListener(NodeName, CallbackObj)
end

function ActivityReddotHelper.AddReddotListenByTabId(TabId, CallbackInfo)
  local NodeName = ActivityReddotHelper.GetEventTabNodeName(TabId)
  if not NodeName then
    return
  end
  local Node = ReddotManager.GetTreeNode(NodeName)
  if not Node then
    return
  end
  ReddotManager.AddListenerEx(NodeName, CallbackInfo.Obj, CallbackInfo.Func)
end

function ActivityReddotHelper.RemoveReddotListenByTabId(TabId, CallbackObj)
  local NodeName = ActivityReddotHelper.GetEventTabNodeName(TabId)
  if not NodeName then
    return
  end
  local Node = ReddotManager.GetTreeNode(NodeName)
  if not Node then
    return
  end
  ReddotManager.RemoveListener(NodeName, CallbackObj)
end

function ActivityReddotHelper.InitReddot(ActivityUtils)
  local Node = ReddotManager.GetTreeNode("ActivityHub")
  if not Node then
    ReddotManager.AddNodeEx("ActivityHub")
  end
  local Avatar = GWorld:GetAvatar()
  ActivityReddotHelper._ClearUIUnlockHandler()
  ActivityReddotHelper.UIUnlockHandler = Avatar:BindOnUIFirstTimeUnlock("GameEvent", function()
    ActivityUtils.RefreshActivityReddotNode()
    ActivityReddotHelper._ClearUIUnlockHandler()
  end)
end

function ActivityReddotHelper._ClearUIUnlockHandler()
  if ActivityReddotHelper.UIUnlockHandler then
    local Avatar = GWorld:GetAvatar()
    Avatar:UnBindOnUIFirstTimeUnlock("GameEvent", ActivityReddotHelper.UIUnlockHandler)
    ActivityReddotHelper.UIUnlockHandler = nil
  end
end

function ActivityReddotHelper.TryAddReddotCount(ActivityUtils, EventId, CacheKey)
  local NodeName = ActivityReddotHelper.GetEventMainNodeName(EventId)
  if not NodeName then
    return
  end
  local Node = ReddotManager.GetTreeNode(NodeName)
  if not Node then
    return
  end
  ReddotManager.IncreaseLeafNodeCount(NodeName, 1, {CacheKey = CacheKey, EventId = EventId})
end

function ActivityReddotHelper.TrySubReddotCount(ActivityUtils, EventId, CacheKey)
  local NodeName = ActivityReddotHelper.GetEventMainNodeName(EventId)
  if not NodeName then
    return
  end
  local Node = ReddotManager.GetTreeNode(NodeName)
  if not Node then
    return
  end
  ReddotManager.DecreaseLeafNodeCount(NodeName, 1, {CacheKey = CacheKey, EventId = EventId})
end

function ActivityReddotHelper.GetEventTabNodeName(TabId)
  local EventTab = DataMgr.EventTab[TabId]
  if not EventTab then
    return
  end
  return EventTab.ReddotNode
end

function ActivityReddotHelper.GetEventMainNodeName(EventId)
  local EventMain = DataMgr.EventMain[EventId]
  if not EventMain then
    return
  end
  return EventMain.ReddotNode
end

return ActivityReddotHelper
