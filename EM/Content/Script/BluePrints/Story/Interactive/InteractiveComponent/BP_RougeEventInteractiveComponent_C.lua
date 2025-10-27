local RougeConst = require("BluePrints.UI.UI_PC.RougeLike.RougeAchive.RougeConst")
require("UnLua")
local M = Class("BluePrints.Story.Interactive.InteractiveComponent.BP_HomeInteractiveComponent_C")

function M:LoadUI()
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  local UIManager = GameInstance:GetGameUIManager()
  local RougeLikeManager = GWorld.RougeLikeManager
  if not RougeLikeManager then
    return
  end
  if 0 == RougeLikeManager.RoomId then
    return
  end
  local ShopStoryId = DataMgr.RougeLikeRoom[RougeLikeManager.RoomId].ShopStoryId
  if not ShopStoryId then
    return
  end
  UIManager:LoadUINew("Rouge_Event_Main", {
    nil,
    ShopStoryId,
    nil,
    true
  })
  local Avatar = GWorld:GetAvatar()
  if not Avatar.RougeLike:IsManualUnlocked(RougeConst.ArchiveType.Story, DataMgr.RougeLikeStoryEvent[ShopStoryId].RLArchiveSubId) then
    Avatar:NotifyTriggerRougeLikeStoryEvent(ShopStoryId)
  end
end

return M
