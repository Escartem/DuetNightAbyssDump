local SpecialQuestEvent = Class("BluePrints.Common.ClientEvent.SpecialQuestEvent")
local DynamicQuestEvent = Class("BluePrints.Common.ClientEvent.DynamicQuestEvent")
local TimeUtils = require("Utils.TimeUtils")
local ClientEventUtils = {
  CurrentActiveDynamicEvent = {},
  CurrentDoingDynamicEvent = nil,
  SpecialQuestEvents = {},
  CurrentEvent = nil
}

function ClientEventUtils:GetCurrentEvent()
  return self.CurrentEvent
end

function ClientEventUtils:StartSpecialQuestEvent(...)
  local SpecialQuestId = (...)
  if self.CurrentEvent then
    DebugPrint("\231\137\185\230\174\138\228\187\187\229\138\161\228\184\173\229\188\128\229\167\139\229\143\166\228\184\128\231\137\185\230\174\138\228\187\187\229\138\161" .. SpecialQuestId)
    return
  end
  if self.SpecialQuestEvents[SpecialQuestId] then
    DebugPrint("\233\135\141\229\164\141\229\188\128\229\167\139\231\155\184\229\144\140\231\154\132\231\137\185\230\174\138\228\187\187\229\138\161" .. SpecialQuestId)
    return
  end
  local SpecialEvent = SpecialQuestEvent(...)
  self.SpecialQuestEvents[SpecialQuestId] = SpecialEvent
  SpecialEvent:StartEvent()
end

function ClientEventUtils:SetCurrentEvent(SpecialEvent)
  self.CurrentEvent = SpecialEvent
end

function ClientEventUtils:ClearSpecailQuestEvent(SpecialQuestId)
  local SpecialEvent = self.SpecialQuestEvents[SpecialQuestId]
  if SpecialEvent then
    if self.CurrentEvent and self.CurrentEvent.SpecialQuestId == SpecialQuestId then
      self.CurrentEvent = nil
    end
    self.SpecialQuestEvents[SpecialQuestId] = nil
  end
end

function ClientEventUtils:CheckWhenNodeClear(SpecialQuestId)
  local SpecialEvent = self.SpecialQuestEvents[SpecialQuestId]
  if SpecialEvent then
    local Ans = SpecialEvent:CheckWhenNodeClear()
    if Ans then
      self:ClearSpecailQuestEvent()
    end
  end
end

function ClientEventUtils:GetCurrentActiveDynamicEvent(DynQuestId)
  if DynQuestId then
    for _, value in pairs(self.CurrentActiveDynamicEvent) do
      if value.DynamicQuestId == DynQuestId then
        return value
      end
    end
  else
    return self.CurrentActiveDynamicEvent
  end
end

function ClientEventUtils:StartDynamicEvent(...)
  local DynamicQuestId = (...)
  local DynamicQuestConfig = DataMgr.DynQuest[DynamicQuestId]
  if not DynamicQuestConfig then
    DebugPrint("\230\137\190\228\184\141\229\136\176\229\138\168\230\128\129\228\187\187\229\138\161\231\188\150\229\143\183:\227\128\144" .. tostring(DynamicQuestId) .. "\227\128\145")
    return
  end
  local Avatar = GWorld:GetAvatar()
  local SubRegionId = Avatar:GetCurrentRegionId()
  local RegionId = Avatar:GetSubRegionId2RegionId(SubRegionId)
  if Avatar and RegionId == DynamicQuestConfig.RegionId then
    DebugPrint("[\229\138\168\230\128\129\228\186\139\228\187\182]\229\138\168\230\128\129\228\186\139\228\187\182Id" .. tostring(DynamicQuestId) .. "\232\167\163\233\148\129 " .. TimeUtils.TimeToHMSStr())
    local DynamicEvent = DynamicQuestEvent(...)
    table.insert(self.CurrentActiveDynamicEvent, DynamicEvent)
    DynamicEvent:StartEvent()
  end
end

function ClientEventUtils:SetCurrentDoingDynamicEvent(DynQuestEvent)
  if self.CurrentDoingDynamicEvent then
    if DynQuestEvent == self.CurrentDoingDynamicEvent then
      DebugPrint("\233\135\141\229\164\141\229\188\128\229\167\139\231\155\184\229\144\140\231\154\132\229\138\168\230\128\129\228\187\187\229\138\161" .. TimeUtils.TimeToHMSStr())
      return
    end
    self.CurrentDoingDynamicEvent:Destroy()
  end
  self.CurrentDoingDynamicEvent = DynQuestEvent
end

function ClientEventUtils:GetCurrentDoingDynamicEvent()
  return self.CurrentDoingDynamicEvent
end

function ClientEventUtils:ClearCurrentActiveDynamicEvent(DynQuestId)
  for pos, value in pairs(self.CurrentActiveDynamicEvent) do
    if value.DynamicQuestId == DynQuestId then
      table.remove(self.CurrentActiveDynamicEvent, pos)
      return
    end
  end
end

function ClientEventUtils:PlayTaskBarAnimIn()
  local TaskBar = self:GetMainTaskBar()
  if TaskBar then
    TaskBar:PlayAnimation(TaskBar.DynamicEvent_In)
    TaskBar.Tips:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    if CommonUtils.GetDeviceTypeByPlatformName(self) == "PC" then
      TaskBar:PlayAnimation(TaskBar.Tooltip_In)
    end
  end
end

function ClientEventUtils:GetMainTaskBar()
  local GameInstance = GWorld.GameInstance
  local UIManager = GameInstance:GetGameUIManager()
  local TaskUIObj
  local BattleMainUI = UIManager:GetUIObj("BattleMain")
  if nil ~= BattleMainUI and BattleMainUI.Pos_TaskBar:GetChildAt(0) then
    TaskUIObj = BattleMainUI.Pos_TaskBar:GetChildAt(0)
  end
  if nil ~= TaskUIObj then
    return TaskUIObj
  end
  return nil
end

function ClientEventUtils:TryPlayDelayedDynEventAnim()
  local DynEventUI = self:GetDynEventUI()
  if DynEventUI then
    if DynEventUI.DelayFailAnim then
      DynEventUI:PlayFailAnim(GText("UI_DYNQUEST_FAIL"), self.PlayTaskBarAnimIn)
      DynEventUI.DelayFailAnim = false
    elseif DynEventUI.DelaySuccessAnim then
      DynEventUI:PlaySuccessAnim(GText("UI_DYNQUEST_SUCCESS"), self.PlayTaskBarAnimIn)
      DynEventUI.DelaySuccessAnim = false
    end
  end
end

function ClientEventUtils:ClearAllActiveDynamicEvent()
  for _, value in pairs(self.CurrentActiveDynamicEvent) do
    value:Destroy(false)
  end
  self.CurrentActiveDynamicEvent = {}
end

function ClientEventUtils:ClearCurrentDoingDynamicEvent(FinishEvent, ForbidAnim)
  if self.CurrentDoingDynamicEvent then
    if FinishEvent then
      self.CurrentDoingDynamicEvent:TryFinishEvent(false, function()
        self.CurrentDoingDynamicEvent = nil
      end, nil, nil, ForbidAnim)
    else
      self.CurrentDoingDynamicEvent = nil
    end
  end
end

function ClientEventUtils:CheckDynamicEventStarted(DynQuestId)
  for _, value in pairs(self.CurrentActiveDynamicEvent) do
    if value.DynamicQuestId == DynQuestId then
      return true
    end
  end
  return false
end

function ClientEventUtils:ShowDynEventUI(DynEvent)
  local UIManager = GWorld.GameInstance:GetGameUIManager()
  local BattleMain = UIManager:GetUIObj("BattleMain")
  if BattleMain then
    local DynamicEventUI = BattleMain:GetOrAddDynamicEventWidget()
    if DynamicEventUI then
      DynamicEventUI:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
      DynamicEventUI:SetEventInfo(DynEvent.DynamicQuestConfig.DynName, nil)
      local Avatar = GWorld:GetAvatar()
      if DynEvent.DynQuest and Avatar and Avatar:CheckDynamicQuestIsFirstTrigger(DynEvent.DynQuest.DynamicQuestId) then
        DynamicEventUI:PlayFirstInAnim(GText("UI_DYNQUEST"))
      else
        DynamicEventUI:PlayInAnim(GText("UI_DYNQUEST"))
      end
    end
  end
end

function ClientEventUtils:GetDynEventUI(NotCreate)
  local UIManager = GWorld.GameInstance:GetGameUIManager()
  local BattleMain = UIManager:GetUIObj("BattleMain")
  if BattleMain then
    local DynamicEventUI
    if NotCreate then
      DynamicEventUI = BattleMain:GetDynamicEventWidget()
    else
      DynamicEventUI = BattleMain:GetOrAddDynamicEventWidget()
    end
    return DynamicEventUI
  end
end

function ClientEventUtils:HideDynEventUI()
end

function ClientEventUtils.GetDynEventInfo(Id)
  local Message = ""
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    local DynamicQuest = Avatar.DynamicQuests
    
    local function GetState(State)
      if 0 == State then
        return "\230\156\170\230\191\128\230\180\187"
      elseif 1 == State then
        return "\229\143\175\230\191\128\230\180\187"
      elseif 2 == State then
        return "\232\191\155\232\161\140\228\184\173"
      elseif 3 == State then
        return "\229\183\178\229\174\140\230\136\144"
      elseif 4 == State then
        return "\229\164\177\232\180\165"
      end
    end
    
    if DynamicQuest then
      if nil == Id or "" == Id or "nil" == Id then
        Message = Message .. "-------------\230\137\128\230\156\137\229\138\168\230\128\129\228\186\139\228\187\182\228\191\161\230\129\175--------------\n"
        for _, DynQuest in pairs(DynamicQuest) do
          Message = Message .. "\229\138\168\230\128\129\228\186\139\228\187\182Id:" .. DynQuest.DynamicQuestId .. "   "
          Message = Message .. "\228\186\139\228\187\182\231\138\182\230\128\129:" .. GetState(DynQuest.State) .. "   "
          Message = Message .. "\232\167\166\229\143\145\230\166\130\231\142\135:" .. tostring(DynQuest.Chance) .. "\n"
        end
      else
        local Exist = false
        for _, DynQuest in pairs(DynamicQuest) do
          if _ == tonumber(Id) then
            Exist = true
            local StartTime = "\230\151\160"
            local EndTime = "\230\151\160"
            Message = Message .. "\229\138\168\230\128\129\228\186\139\228\187\182Id:" .. _ .. "\n"
            Message = Message .. "\228\186\139\228\187\182\231\138\182\230\128\129:" .. GetState(DynQuest.State) .. "\n"
            if DynQuest.StartTime > 0 then
              StartTime = TimeUtils.TimeToStr(DynQuest.StartTime)
            end
            Message = Message .. "\229\188\128\229\167\139\230\151\182\233\151\180:" .. StartTime .. "\n"
            if DynQuest.StartTime > 0 then
              EndTime = TimeUtils.TimeToStr(DynQuest.LastEndTime)
            end
            Message = Message .. "\228\184\138\228\184\128\230\172\161\231\187\147\230\157\159\230\151\182\233\151\180:" .. EndTime .. "\n"
            Message = Message .. "\229\183\178\229\174\140\230\136\144\230\172\161\230\149\176:" .. tostring(DynQuest.AlreadyCompleteTimes) .. "\n"
            Message = Message .. "\232\167\166\229\143\145\230\166\130\231\142\135:" .. tostring(DynQuest.Chance) .. "\n"
          end
        end
        if not Exist then
          Message = Message .. "\230\151\160Id\228\184\186" .. tostring(Id) .. "\231\154\132\229\138\168\230\128\129\228\186\139\228\187\182\n"
        end
      end
      Message = Message .. "-------------\229\174\162\230\136\183\231\171\175\229\138\168\230\128\129\228\186\139\228\187\182\228\191\161\230\129\175--------------\n"
      local CurrentDoing = ClientEventUtils:GetCurrentDoingDynamicEvent()
      if CurrentDoing then
        Message = Message .. "\229\189\147\229\137\141\232\191\155\232\161\140\231\154\132\229\138\168\230\128\129\228\186\139\228\187\182ID\239\188\154" .. tostring(CurrentDoing.DynamicQuestId) .. "\n"
      else
        Message = Message .. "\230\151\160\230\173\163\229\156\168\232\191\155\232\161\140\231\154\132\229\138\168\230\128\129\228\186\139\228\187\182\n"
      end
      local ActiveEvent = ClientEventUtils:GetCurrentActiveDynamicEvent()
      if ActiveEvent and 0 ~= #ActiveEvent then
        Message = Message .. "\229\189\147\229\137\141\229\183\178\231\187\143\230\191\128\230\180\187Trigger\231\154\132\229\138\168\230\128\129\228\186\139\228\187\182ID\239\188\154"
        for _, Event in pairs(ActiveEvent) do
          Message = Message .. tostring(Event.DynamicQuestId) .. " "
        end
      else
        Message = Message .. "\230\178\161\230\156\137\229\183\178\231\187\143\230\191\128\230\180\187Trigger\231\154\132\229\138\168\230\128\129\228\186\139\228\187\182"
      end
    else
      Message = Message .. "\230\151\160\229\138\168\230\128\129\228\186\139\228\187\182"
    end
  else
    Message = Message .. "\230\151\160Avatar"
  end
  return Message
end

return ClientEventUtils
