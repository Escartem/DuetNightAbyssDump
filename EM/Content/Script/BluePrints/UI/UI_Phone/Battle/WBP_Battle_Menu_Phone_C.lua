require("UnLua")
local M = Class("BluePrints.UI.BP_EMUserWidget_C")
local BATTLE_WHEEL_CNT = 8
local BATTLE_WHEEL_STATE = {NORMAL = 0, CANCEL = 1}

function M:Initialize(Initializer)
end

function M:Construct()
  self:RefreshEquipInfo()
  self:InitSlotAnimation()
  self.Switcher_State:SetActiveWidgetIndex(BATTLE_WHEEL_STATE.NORMAL)
  self:InitEventDispatcher()
end

function M:InitEventDispatcher()
  EventManager:AddEvent(EventID.OnChangeBattleWheel, self, self.RefreshEquipInfo)
  EventManager:AddEvent(EventID.OnTakeOffBattleWheel, self, self.RefreshEquipInfo)
  EventManager:AddEvent(EventID.OnExchangeBattleWheel, self, self.RefreshEquipInfo)
  EventManager:AddEvent(EventID.OnPropChangeWheels, self, self.RefreshEquipInfo)
  EventManager:AddEvent(EventID.OnChangeWheel, self, self.RefreshEquipInfo)
end

function M:OnPressedButton()
  local PlayerCharacter = self.OwnerPanel.OwnerPlayer
  if PlayerCharacter then
    PlayerCharacter:OpenBattleWheel()
    RunAsyncTask(self, "OnPressedButtonTask", function(CoroutineObj)
      local InBattleWheelMenu = UIManager(self):GetUIObjAsync("InBattleWheelMenu", CoroutineObj)
      InBattleWheelMenu:SetWheelCenter(self.Bg)
      InBattleWheelMenu:BindMenuButton(self)
      self:SelectNoneSlot()
      EMUIAnimationSubsystem:EMPlayAnimation(self, self.Press)
      self.Switcher_State:SetActiveWidgetIndex(BATTLE_WHEEL_STATE.CANCEL)
    end)
  end
end

function M:OnReleasedButton()
  DebugPrint("gmy@OnReleasedButton")
  RunAsyncTask(self, "OnReleasedButtonTask", function(CoroutineObj)
    local InBattleWheelMenu = UIManager(self):GetUIObjAsync("InBattleWheelMenu", CoroutineObj)
    if InBattleWheelMenu then
      InBattleWheelMenu:SelectAndCloseMenu()
    end
    self:ClearSelectSlot()
    self.Switcher_State:SetActiveWidgetIndex(BATTLE_WHEEL_STATE.NORMAL)
  end)
end

function M:SelectSlot(Index)
  EMUIAnimationSubsystem:EMPlayAnimation(self, self["Select_" .. Index])
end

function M:ClearSelectSlot()
  if self.UIAnimationsMap then
    for Key, Value in pairs(self.UIAnimationsMap) do
      EMUIAnimationSubsystem:EMStopAnimation(self, Value)
    end
  end
  EMUIAnimationSubsystem:EMPlayAnimation(self, self.Normal)
end

function M:SelectNoneSlot()
  EMUIAnimationSubsystem:EMPlayAnimation(self, self.Press)
end

function M:RefreshEquipInfo()
  local Avatar = GWorld:GetAvatar()
  if nil == Avatar then
    return
  end
  local CurrentWheel = Avatar.Wheels[Avatar.WheelIndex]
  for Index = 1, BATTLE_WHEEL_CNT do
    local AvatarSlot = CurrentWheel[Index]
    if AvatarSlot then
      if not IsEmptyTable(AvatarSlot) and 0 ~= AvatarSlot.ResourceId then
        EMUIAnimationSubsystem:EMPlayAnimation(self, self["Set_" .. Index], EUMGSequencePlayMode.Forward)
      else
        EMUIAnimationSubsystem:EMPlayAnimation(self, self["Set_" .. Index], EUMGSequencePlayMode.Reverse)
      end
    end
  end
end

function M:Destruct()
  EventManager:RemoveEvent(EventID.OnChangeBattleWheel, self)
  EventManager:RemoveEvent(EventID.OnTakeOffBattleWheel, self)
  EventManager:RemoveEvent(EventID.OnExchangeBattleWheel, self)
  EventManager:RemoveEvent(EventID.OnPropChangeWheels, self, self.RefreshEquipInfo)
  EventManager:RemoveEvent(EventID.OnChangeWheel, self, self.RefreshEquipInfo)
end

function M.BattleMenuDown(BattlePhone, Index, StartPos)
  DebugPrint("gmy@WBP_Battle_Menu_Phone_C M.BattleMenuDown", BattlePhone, Index, StartPos)
  local BattleMenu = BattlePhone.Battle_Menu
  local PlayerCharacter = BattleMenu.OwnerPanel.OwnerPlayer
  BattleMenu.TotalDeltaDis = FVector2D(0, 0)
  if PlayerCharacter and PlayerCharacter:GetController().bEnableBattleWheel then
    PlayerCharacter:OpenBattleWheel()
    RunAsyncTask(M, "OnPressedButtonTask", function(CoroutineObj)
      local InBattleWheelMenu = UIManager(BattleMenu):GetUIObjAsync("InBattleWheelMenu", CoroutineObj)
      if InBattleWheelMenu then
        InBattleWheelMenu:SetWheelCenter(BattleMenu.Bg)
        InBattleWheelMenu:BindMenuButton(BattleMenu)
      end
    end)
    DebugPrint(LXYTag, "\232\189\174\231\155\152\230\140\137\233\146\174\230\146\173\230\148\190\230\137\147\229\188\128\229\138\168\230\149\136")
    EMUIAnimationSubsystem:EMPlayAnimation(BattleMenu, BattleMenu.Press)
    BattleMenu.Switcher_State:SetActiveWidgetIndex(BATTLE_WHEEL_STATE.CANCEL)
  end
end

function M.BattleMenuMove(BattlePhone, TouchFingerCount, Index, LastPos, TotalDeltaDis, LastDeltaDis)
  DebugPrint("gmy@BattleMenuMove", TouchFingerCount, Index, LastPos, TotalDeltaDis, LastDeltaDis)
  local BattleMenu = BattlePhone.Battle_Menu
  BattleMenu.TotalDeltaDis = TotalDeltaDis
end

function M.BattleMenuUp(BattlePhone, Index, WidgetLocalPos, LastWidgetTouchPos, EndTouchPos, TotalDeltaDis)
  DebugPrint("gmy@BattleMenuUp", Index, WidgetLocalPos, LastWidgetTouchPos, EndTouchPos, TotalDeltaDis)
  local BattleMenu = BattlePhone.Battle_Menu
  local PlayerCharacter = BattleMenu.OwnerPanel.OwnerPlayer
  if PlayerCharacter and PlayerCharacter:GetController().bEnableBattleWheel then
    PlayerCharacter:CloseBattleWheel()
  else
    return
  end
  DebugPrint(LXYTag, "\232\189\174\231\155\152\230\140\137\233\146\174\230\146\173\230\148\190\229\133\179\233\151\173\229\138\168\230\149\136")
  BattleMenu:ClearSelectSlot()
  BattleMenu.Switcher_State:SetActiveWidgetIndex(BATTLE_WHEEL_STATE.NORMAL)
  BattleMenu.TotalDeltaDis = FVector2D(0, 0)
end

function M:InitSlotAnimation()
  EMUIAnimationSubsystem:EMPlayAnimation(self, self.Normal)
end

return M
