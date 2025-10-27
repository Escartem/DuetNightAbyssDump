local HeitaoLeaveTeamNode = Class("StoryCreator.StoryLogic.StorylineNodes.BaseAsynQuestNode")

function HeitaoLeaveTeamNode:Init()
end

function HeitaoLeaveTeamNode:FinishAction()
  self:Finish()
end

function HeitaoLeaveTeamNode:Execute(Callback)
  local GameMode = UE4.UGameplayStatics.GetGameMode(GWorld.GameInstance)
  local Avatar = GWorld:GetAvatar()
  if not Avatar and Callback then
    Callback()
  end
  
  local function FinishNode(ret, ResourceReturn)
    GWorld.GameInstance:RemoveTimer(self.DebugTimer)
    if 0 ~= ret then
      GWorld.logger.error("\233\187\145\230\161\131\231\166\187\233\152\159\232\138\130\231\130\185 \232\167\146\232\137\178\229\136\135\230\141\162\229\164\177\232\180\165\239\188\140\232\175\183\230\163\128\230\159\165\229\164\135\233\128\137\232\167\146\232\137\178\229\146\140\230\150\176\230\137\139\229\141\161\230\177\160\232\167\146\232\137\178Id\230\152\175\229\144\166\228\184\128\232\135\180\227\128\130ErrorCode:" .. ret)
      return
    end
    UIManager(self):ShowUITip(UIConst.Tip_StoryToast, GText("Quest_Chapter01_HeitaoLeave_Toast"))
    local ResourceInfoList = {}
    local bHasResource = false
    if ResourceReturn then
      for ResourceId, Count in pairs(ResourceReturn) do
        local ResourceData = DataMgr.Resource[ResourceId]
        local ResourceInfo = {
          ItemType = "Resource",
          ItemId = ResourceId,
          Count = Count,
          Rarity = ResourceData.Rarity
        }
        table.insert(ResourceInfoList, ResourceInfo)
        bHasResource = true
      end
    end
    if bHasResource then
      UIUtils.ShowHudReward(GText("Quest_Chapter01_HeitaoLeave_Tips"), ResourceInfoList)
    end
    if Callback then
      Callback()
    end
  end
  
  self.DebugTimer = GWorld.GameInstance:AddTimer(5, function()
    GWorld.logger.error("\233\187\145\230\161\131\231\166\187\233\152\159\232\138\130\231\130\185 \230\156\141\229\138\161\229\153\168\232\182\133\230\151\182")
  end)
  Avatar:ChangeChar(FinishNode)
end

return HeitaoLeaveTeamNode
