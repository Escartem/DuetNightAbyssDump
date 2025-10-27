local Component = {}

function Component:QueryRankList(RankId)
  self.logger.debug("QueryRankList", RankId)
  RankId = RankId or 1
  self:CallServerMethod("QueryRankList", RankId)
end

function Component:OnQueryRankList(RankId, RankListInfo)
  self.logger.debug("OnQueryRankList", RankId)
  local UIManager = GWorld.GameInstance:GetGameUIManager()
  local wbp_rankpanel = UIManager:LoadUI("/Game/BluePrints/UI/Rank/WBP_RankPanel.WBP_RankPanel", "RankPanel", UIConst.ZORDER_FOR_ZERO, RankListInfo)
end

return Component
