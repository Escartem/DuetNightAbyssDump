require("UnLua")
local M = {}

function M:GetDoubleModDropData()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return nil
  end
  local defaultData = {
    EventId = CommonConst.DoubleModDropEventID,
    DropTimes = 0,
    EliteRushTimes = 0
  }
  self.DoubleModDrop = Avatar.DoubleModDrop
  if not self.DoubleModDrop then
    return defaultData
  end
  local result = {}
  local keyMap = {
    EventId = "EventId",
    DropTimes = "DropTimes",
    EliteRushTimes = "EliteRushTimes"
  }
  for _, value in pairs(self.DoubleModDrop) do
    if value.Props then
      for name, id in pairs(value.Props) do
        if keyMap[name] then
          result[keyMap[name]] = id
        end
      end
    end
  end
  for k, v in pairs(defaultData) do
    if nil == result[k] then
      result[k] = v
    end
  end
  return result
end

function M:IsDoubleMod()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return false
  end
  if not self:IsPrerequisiteSatisfied() then
    return false
  end
  if Avatar.ActivityTimeOpen and Avatar.ActivityTimeOpen[CommonConst.DoubleModDropEventID] then
    return true
  end
  return false
end

function M:IsPrerequisiteSatisfied()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return false
  end
  local DoubleModEventInfo = DataMgr.EventMain[103009001]
  if not DoubleModEventInfo then
    return false
  end
  local PrerequisiteQuestId = {}
  if DoubleModEventInfo.PretextTasks1 then
    table.insert(PrerequisiteQuestId, DoubleModEventInfo.PretextTasks1)
  end
  for _, QuestId in pairs(DoubleModEventInfo.PretextTasks2 or {}) do
    table.insert(PrerequisiteQuestId, QuestId)
  end
  for _, QuestId in pairs(PrerequisiteQuestId) do
    local QuestChain = Avatar.QuestChains[QuestId]
    if not QuestChain then
      ScreenPrint("\233\173\148\228\185\139\230\165\148 \233\133\141\231\189\174\228\186\134\228\184\128\228\184\170\228\184\141\229\173\152\229\156\168\231\154\132\228\187\187\229\138\161\233\147\190Id\239\188\129\232\175\183\231\173\150\229\136\146\230\163\128\230\159\165\239\188\129Id:" .. QuestId)
      return false
    end
    if not QuestChain:IsFinish() then
      return false
    end
  end
  return true
end

return M
