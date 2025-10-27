local Component = {}

function Component:ExploreIdActive(RarelyId, SubRegionId)
  if not self:IsRealInBigWorld() then
    return
  end
  if not DataMgr.SubRegion[SubRegionId] then
    return
  end
  local Explore = self.Explores[RarelyId]
  if Explore and not Explore:IsInActive() then
    return
  end
  
  local function Callback(RetCode)
    if self:CheckRegionErrorCode(RetCode) then
      EventManager:FireEvent(EventID.OnExploreGroupActive, RarelyId)
    else
      GWorld.logger.error(string.format("ZJT_ \232\175\165\230\142\162\231\180\162\231\187\132\230\191\128\230\180\187\229\164\177\232\180\165 \232\175\165\230\142\162\231\180\162\231\187\132\229\148\175\228\184\128ID\239\188\154%d \230\156\141\229\138\161\229\153\168\232\191\148\229\155\158\233\148\153\232\175\175\231\160\129\239\188\154%d", RarelyId, RetCode))
    end
  end
  
  self:CallServer("ExploreIdActive", Callback, RarelyId, SubRegionId)
end

function Component:SetExploreSpecialActiveState(RarelyId)
  if not self.Explores[RarelyId] then
    DebugPrint("ZJT_ \228\184\141\229\173\152\229\156\168\230\142\162\231\180\162\231\187\132\230\149\176\230\141\174 \231\137\185\230\174\138\230\191\128\230\180\187\229\164\177\232\180\165 ", RarelyId)
    return
  end
  if not self.Explores[RarelyId]:IsDoing() then
    DebugPrint("ZJT_ \229\173\152\229\156\168\230\142\162\231\180\162\231\187\132\230\149\176\230\141\174 \231\138\182\230\128\129\233\157\158\230\191\128\230\180\187 \231\137\185\230\174\138\230\191\128\230\180\187\229\164\177\232\180\165 ", RarelyId)
    return
  end
  
  local function Callback(Ret)
    DebugPrint("ZJT_ SetExploreSpecialActiveState ServerCallClient ", RarelyId, Ret)
    if self:CheckRegionErrorCode(Ret) then
      EventManager:FireEvent(EventID.OnExploreGroupSpecialActive, RarelyId)
    end
  end
  
  self:CallServer("SetExploreSpecialActiveState", Callback, RarelyId)
end

function Component:ExploreIdsActive(RarelyIdTable)
  if not self:IsRealInBigWorld() then
    return
  end
  if not RarelyIdTable or type(RarelyIdTable) ~= "table" then
    return
  end
  if next(RarelyIdTable) == nil then
    return
  end
  
  local function Callback(Ret, ActiveRarelyIds)
    if not (self:CheckRegionErrorCode(Ret) and ActiveRarelyIds) or 0 == #ActiveRarelyIds then
      GWorld.logger.error(string.format("ZJT_ \230\156\172\230\172\161\230\142\162\231\180\162\231\187\132\231\154\132\230\191\128\230\180\187\229\133\168\233\131\168\229\164\177\232\180\165 \232\175\183\232\129\148\231\179\187\230\156\141\229\138\161\231\171\175\229\144\140\229\173\166\229\184\174\229\191\153\230\159\165\231\156\139 \233\148\153\232\175\175\231\160\129\239\188\154 %d ", Ret))
      return
    end
    self:CombineAddRegionData(true)
    for _, Result in ipairs(ActiveRarelyIds) do
      for RarelyId, RetCode in pairs(Result) do
        if self:CheckRegionErrorCode(RetCode) then
          EventManager:FireEvent(EventID.OnExploreGroupActive, RarelyId)
        else
          GWorld.logger.error(string.format("ZJT_ \232\175\165\230\142\162\231\180\162\231\187\132\230\191\128\230\180\187\229\164\177\232\180\165 \232\175\165\230\142\162\231\180\162\231\187\132\229\148\175\228\184\128ID\239\188\154%d \230\156\141\229\138\161\229\153\168\232\191\148\229\155\158\233\148\153\232\175\175\231\160\129\239\188\154%d", RarelyId, RetCode))
        end
      end
    end
    self:CombineAddRegionData(false)
  end
  
  self:CallServer("ExploreIdsActive", Callback, RarelyIdTable)
end

function Component:ExploreIdCompleteLimit(RarelyId)
  if not self:IsRealInBigWorld() then
    return
  end
  
  local function Callback(Ret)
    if self:CheckRegionErrorCode(Ret) then
      EventManager:FireEvent(EventID.OnExploreGroupLimitComplete, RarelyId)
    end
  end
  
  self:CallServer("SetExploreChallageComplete", Callback, RarelyId)
end

function Component:ExploreIdComplete(RarelyId)
  if not self:IsRealInBigWorld() then
    return
  end
  if not self.Explores[RarelyId] then
    return
  end
  
  local function Callback(Ret, TotalReward)
    if self:CheckRegionErrorCode(Ret) then
      EventManager:FireEvent(EventID.OnExploreGroupComplete, RarelyId, TotalReward)
    else
      GWorld.logger.error(string.format("ZJT_ \232\175\165\230\142\162\231\180\162\231\187\132\229\174\140\230\136\144\229\164\177\232\180\165 \232\175\165\230\142\162\231\180\162\231\187\132\229\148\175\228\184\128ID\239\188\154%d \230\156\141\229\138\161\229\153\168\232\191\148\229\155\158\233\148\153\232\175\175\231\160\129\239\188\154%d", RarelyId, Ret))
    end
  end
  
  self:CallServer("ExploreIdComplete", Callback, RarelyId or 0)
end

function Component:ExploreIdsComplete(RarelyIdTable)
  if not self:IsRealInBigWorld() then
    return
  end
  if not RarelyIdTable or type(RarelyIdTable) ~= "table" then
    return
  end
  if next(RarelyIdTable) == nil then
    return
  end
  
  local function Callback(Ret, CompleteRarelyIdTable)
    if self:CheckRegionErrorCode(Ret) then
      for _, Result in ipairs(CompleteRarelyIdTable) do
        for RarelyId, RetCode in pairs(Result) do
          if self:CheckRegionErrorCode(RetCode) then
            EventManager:FireEvent(EventID.OnExploreGroupComplete, RarelyId)
          else
            GWorld.logger.error(string.format("ZJT_ \232\175\165\230\142\162\231\180\162\231\187\132\229\174\140\230\136\144\229\164\177\232\180\165 %\232\175\165\230\142\162\231\180\162\231\187\132\229\148\175\228\184\128ID\239\188\154d \230\156\141\229\138\161\229\153\168\232\191\148\229\155\158\233\148\153\232\175\175\231\160\129\239\188\154%d", RarelyId, Ret))
          end
        end
      end
    else
      GWorld.logger.error("ZJT_ \232\175\165\230\142\162\231\180\162\231\187\132\229\174\140\230\136\144\229\133\168\233\131\168\229\164\177\232\180\165 ", RarelyIdTable)
    end
  end
  
  self:CallServer("ExploreIdsComplete", Callback, RarelyIdTable)
end

function Component:UpdateExploreData(RarelyId, DataKey, DataValue)
  if not self.Explores[RarelyId] then
    return
  end
  if not self.Explores[RarelyId]:IsDoing() or not DataKey then
    return
  end
  
  local function Callback(Ret)
  end
  
  self:CallServer("UpdateExploreData", Callback, RarelyId, DataKey, DataValue)
end

function Component:ResetingExplore(RarelyId, SubRegionId)
  if not RarelyId then
    return
  end
  local ClientExplore = self.Explores[RarelyId]
  if not ClientExplore then
    return
  end
  if ClientExplore:IsInActive() then
    return
  end
  
  local function Callback(Ret)
    self.logger.info("ZJT_ ResetingExplore ", RarelyId, SubRegionId, Ret)
    if self:CheckRegionErrorCode(Ret) then
      EventManager:FireEvent(EventID.OnExploreGroupDeactive, RarelyId)
      EventManager:FireEvent(EventID.OnExploreGroupReset, RarelyId)
    end
  end
  
  self:CallServer("ResetingExplore", Callback, RarelyId)
end

function Component:SetState2InExploreChanllenge(ExploreId)
  if not ExploreId or ExploreId <= 0 then
    self.logger.debug("ZJT_ ExitState2InExploreChanllenge \229\188\128\229\144\175\229\164\177\232\180\165 \230\178\161\230\156\137\230\142\162\231\180\162Id ", ExploreId)
    return
  end
  local Explore = self.Explores[ExploreId]
  if not Explore then
    self.logger.debug("ZJT_ ExitState2InExploreChanllenge \229\188\128\229\144\175\229\164\177\232\180\165 \230\178\161\230\156\137\230\142\162\231\180\162\230\149\176\230\141\174 ", ExploreId)
    return
  end
  if not Explore:IsDoing() then
    self.logger.debug("ZJT_ ExitState2InExploreChanllenge \229\188\128\229\144\175\229\164\177\232\180\165 \228\184\141\229\156\168\230\137\167\232\161\140\228\184\173 ", ExploreId)
    return
  end
  if self:InExploreChanllenge() then
    self.logger.debug("ZJT_ ExitState2InExploreChanllenge \229\188\128\229\144\175\229\164\177\232\180\165 \229\189\147\229\137\141\229\156\168\230\140\145\230\136\152\228\184\173 ", ExploreId)
    return
  end
  
  local function Callback(Ret)
    self.logger.debug("ZJT_ SetAvatarState2InExploreChanllenge \229\188\128\229\144\175\230\136\144\229\138\159 ", Ret, ExploreId)
  end
  
  self:CallServer("SetState2InExploreChanllenge", Callback, ExploreId)
end

function Component:ExitState2InExploreChanllenge(ExploreId)
  if not ExploreId or ExploreId <= 0 then
    self.logger.debug("ZJT_ ExitState2InExploreChanllenge \233\128\128\229\135\186\229\164\177\232\180\165 \230\178\161\230\156\137\230\142\162\231\180\162Id ", ExploreId)
    return
  end
  local Explore = self.Explores[ExploreId]
  if not Explore then
    self.logger.debug("ZJT_ ExitState2InExploreChanllenge \233\128\128\229\135\186\229\164\177\232\180\165 \230\178\161\230\156\137\230\142\162\231\180\162\230\149\176\230\141\174 ", ExploreId)
    return
  end
  if not Explore:IsDoing() then
    self.logger.debug("ZJT_ ExitState2InExploreChanllenge \233\128\128\229\135\186\229\164\177\232\180\165 \228\184\141\229\156\168\230\137\167\232\161\140\228\184\173 ", ExploreId)
    return
  end
  if not self:InExploreChanllenge() then
    self.logger.debug("ZJT_ ExitState2InExploreChanllenge \233\128\128\229\135\186\229\164\177\232\180\165 \228\184\141\229\156\168\230\140\145\230\136\152\228\184\173 ", ExploreId)
    return
  end
  
  local function Callback(Ret)
    self.logger.debug("ZJT_ ExitState2InExploreChanllenge \233\128\128\229\135\186\230\136\144\229\138\159 ", Ret, ExploreId)
  end
  
  self:CallServer("ExitState2InExploreChanllenge", Callback, ExploreId)
end

return Component
