require("UnLua")
require("DataMgr")
local Guide_Gesture = Class("BluePrints.UI.BP_UIState_C")

function Guide_Gesture:GuideUIInit_ContentBlock(UIKey, MessageId, MessageSustainTime, Gesture, MessageLoc, MessageLocOffset)
  self:Init(MessageId, MessageSustainTime, Gesture, MessageLoc, MessageLocOffset)
end

function Guide_Gesture:Init(MessageId, MessageSustainTime, Gesture, MessageLoc, MessageLocOffset)
  local Message = DataMgr.Message[MessageId]
  if not Message then
    UEPrint("Message Id Wrong")
    return
  end
  self.OwnerPlayer = UGameplayStatics.GetPlayerCharacter(GWorld.GameInstance, 0)
  if not IsValid(self.OwnerPlayer) then
    return
  end
  self.PanelPos = UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(self.Panel_Guide):GetPosition()
  self.AnchorPos = UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(self[MessageLoc]):GetPosition()
  self.WidgetPos = self.PanelPos + self.AnchorPos
  local TextMapIndex = CommonUtils.ChooseOptionByPlatform(Message.MessageContentPC, Message.MessageContentPhone)
  self.MessageContent = GText(TextMapIndex)
  self.Gesture = Gesture
  self.MessageSustainTime = MessageSustainTime
  self.MessageLoc = self:GetPositionScale(MessageLoc)
  self.MessageLocOffset = MessageLocOffset
  if self.Gesture == "LookAround" then
    self.InAnimation = self.Translation_In
    self.LoopAnimation = self.Translation_Loop
    self.OutAnimation = self.Translation_Out
    self.OwnerPlayer.NeedFireEventForLookAroundGuide = true
  elseif self.Gesture == "ZoomInOut" then
    self.InAnimation = self.Scale_In
    self.LoopAnimation = self.Scale_Loop
    self.OutAnimation = self.Scale_Out
    self.OwnerPlayer.NeedFireEventForZoomGuide = true
  elseif self.Gesture == "MoveCamera" then
    self.InAnimation = self.Vertical_In
    self.LoopAnimation = self.Vertical_Loop
    self.OutAnimation = self.Vertical_Out
    self.OwnerPlayer.NeedFireEventForZoomGuide = true
  end
  self.LastTime = 0
  if MessageSustainTime >= 0 then
    local NowTime = UE4.UGameplayStatics.GetRealTimeSeconds(self)
    self.LastTime = NowTime + MessageSustainTime
  end
  self:SetVisibility(UE4.ESlateVisibility.HitTestInvisible)
  self:SetSelfAppearance()
  EventManager:AddEvent(EventID.LoadUI, self, self.LoadUIEvent)
  EventManager:AddEvent(EventID.UnLoadUI, self, self.UnLoadUIEvent)
end

function Guide_Gesture:SetSelfAppearance()
  local NowTime = UE4.UGameplayStatics.GetRealTimeSeconds(self)
  if self.MessageSustainTime > 0 and NowTime >= self.LastTime then
    self:PlayOutAnimation()
  else
    self:PlayInAnimation()
    if self.MessageLoc then
      self:CreateSelfGuideBubble()
    end
    local TimerTime = math.max(0.1, self.LastTime - NowTime) * UE4.UGameplayStatics.GetGlobalTimeDilation(self)
    self:AddTimer(TimerTime, self.SetSelfAppearance, false, 0, "ShowGestureTimer")
  end
end

function Guide_Gesture:PlayInAnimation()
  if self.IsPlayInAnimation then
    return
  end
  self.IsPlayInAnimation = true
  local TimerTime = 0
  if self.Gesture == "LookAround" then
    self:AddDispatcher(EventID.MoveAroundGesture, self, self.OnGestureRespond)
  elseif self.Gesture == "ZoomInOut" then
    self:AddDispatcher(EventID.ZoomInOutGesture, self, self.OnGestureRespond)
  end
  self:PlayAnimationForward(self.InAnimation)
  TimerTime = self.InAnimation:GetEndTime()
  self:AddTimer(TimerTime, function()
    self:PlayAnimation(self.LoopAnimation, 0, 0)
  end)
end

function Guide_Gesture:PlayOutAnimation()
  self:PlayAnimationForward(self.OutAnimation)
  local TimerTime = self.OutAnimation:GetEndTime()
  self:AddTimer(TimerTime, self.Close)
  if self:IsExistTimer("ShowGestureTimer") then
    self:RemoveTimer("ShowGestureTimer")
  end
end

function Guide_Gesture:Close()
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  local UIManger = GameInstance:GetGameUIManager()
  if self.Bubble then
    UIManger:UnLoadUI("GuideBubble")
  end
  UIManger:UnLoadUI("GuideGesture")
  if self.OnGuideEnd:IsBound() then
    self.OnGuideEnd:Broadcast()
  end
  EventManager:RemoveEvent(EventID.LoadUI, self)
  EventManager:RemoveEvent(EventID.UnLoadUI, self)
end

function Guide_Gesture:CreateSelfGuideBubble()
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  local UIManger = GameInstance:GetGameUIManager()
  self.Bubble = UIManger:GetUIObj("GuideBubble")
  if not self.Bubble then
    self.Bubble = UIManger:LoadUI("/Game/UI/WBP/Guide/Widget/WBP_Guide_ContentBlock.WBP_Guide_ContentBlock", "GuideBubble", self:GetZOrder(), self.MessageContent, self.MessageLoc)
  end
  self:CalcBubblePosition()
end

function Guide_Gesture:CalcBubblePosition()
  local BubbleSize = self.Bubble:GetTextRealSize()
  local BubblePosition
  local TouchBublleDistance = BubbleSize / 2
  BubblePosition = self.WidgetPos + TouchBublleDistance * self.MessageLoc + self.MessageLocOffset
  self:SetBubblePosition(BubblePosition)
end

function Guide_Gesture:SetBubblePosition(BubblePosition)
  if self.BubblePosition ~= BubblePosition then
    self.Bubble:SetWidgetOpacity(0)
    self.BubblePosition = BubblePosition
    local TimerTime = 0.1 * UE4.UGameplayStatics.GetGlobalTimeDilation(self)
    self:AddTimer(TimerTime, self.CalcBubblePosition)
    return
  end
  self.Bubble:SetWidgetOpacity(1)
  local BubbleSlot = UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(self.Bubble.Panel_Text)
  BubbleSlot:SetPosition(BubblePosition)
end

function Guide_Gesture:GetPositionScale(MessgaeLoc)
  self.BublleAddToViewport = true
  local PositionScale = FVector2D(0, 0)
  if not MessgaeLoc or "" == MessgaeLoc then
    self.BublleAddToViewport = false
    return
  end
  if string.match(MessgaeLoc, "Left") then
    PositionScale.X = -1
  end
  if string.match(MessgaeLoc, "Right") then
    PositionScale.X = 1
  end
  if string.match(MessgaeLoc, "Up") then
    PositionScale.Y = -1
  end
  if string.match(MessgaeLoc, "Down") then
    PositionScale.Y = 1
  end
  return PositionScale
end

function Guide_Gesture:OnGestureRespond()
  self.LastTime = 0
  self:SetSelfAppearance()
end

function Guide_Gesture:LoadUIEvent(UIKey)
  if not self.UIKey and UIManager(self):StateCount() > 0 then
    self.UIKey = UIKey
    self:SetVisibility(UE4.ESlateVisibility.Hidden)
    if self.Bubble then
      self.Bubble:SetVisibility(UE4.ESlateVisibility.Hidden)
      self.HideTime = UE4.UGameplayStatics.GetRealTimeSeconds(self)
      if self:IsExistTimer("ShowGestureTimer") then
        self:RemoveTimer("ShowGestureTimer")
      end
    end
  end
end

function Guide_Gesture:UnLoadUIEvent(UIKey)
  if self.UIKey == UIKey then
    self:SetVisibility(UE4.ESlateVisibility.HitTestInvisible)
    if self.Bubble then
      self.Bubble:SetVisibility(UE4.ESlateVisibility.HitTestInvisible)
      local TimerTime = math.max(0.1, self.LastTime - self.HideTime) * UE4.UGameplayStatics.GetGlobalTimeDilation(self)
      self:AddTimer(TimerTime, self.SetSelfAppearance, false, 0, "ShowGestureTimer")
    end
    self.UIKey = nil
  end
end

return Guide_Gesture
