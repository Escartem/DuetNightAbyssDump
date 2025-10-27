require("UnLua")
local EMCache = require("EMCache.EMCache")
local TimeUtils = require("Utils.TimeUtils")
local M = Class("BluePrints.UI.BP_UIState_C")
local FishingGameState = {
  WaitStart = 1,
  WaitFishing = 2,
  Fishing = 3,
  EndFishing = 4
}
local EaseFuc = {
  Linear = 0,
  InQuad = 1,
  OutQuad = 2,
  InOutQuad = 3,
  InCubic = 4,
  OutCubic = 5,
  InOutCubic = 6,
  InQuart = 7,
  OutQuart = 8,
  InOutQuart = 9,
  InSine = 10,
  OutSine = 11,
  InOutSine = 12,
  InExpo = 13,
  OutExpo = 14,
  InOutExpo = 15,
  InCirc = 16,
  OutCirc = 17,
  InOutCirc = 18,
  InElastic = 19,
  OutElastic = 20,
  InOutElastic = 21,
  InBack = 22,
  OutBack = 23,
  InOutBack = 24,
  InBounce = 25,
  OutBounce = 26,
  InOutBounce = 27,
  CurveFloat = 28
}

function M:Init(RootPage, FishingSpotId)
  self.RootPage = RootPage
  self.FishingSpotId = FishingSpotId
  self.SuccessTime = 10
  self.bCanSpace = true
  self.bCanEsc = true
  self.LastFishId = -1
  self.bIsSpecial = false
  self.FishingHookResponseTime = DataMgr.GlobalConstant.FishingHookResponseTime.ConstantValue
  self.FishingGameInitialProgress = DataMgr.GlobalConstant.FishingGameInitialProgress.ConstantValue
  self.Angling_Special:Init(self)
  self.Angling_Special:BindToAnimationFinished(self.Angling_Special.Out, {
    self,
    self.OnSpecialFishingPanelOut
  })
  self.ItemUpTime = DataMgr.FishingStick[1].MoveParam[1]
  self.ItemDownTime = DataMgr.FishingStick[1].MoveParam[2]
  self.DefaultBgLength = 392
  self.DefaultItemLength = 154
  self.DefaultItemY = 130
  self.ItemLength = DataMgr.FishingRod[self.RootPage.FishingRodId].Length or self.DefaultItemLength
  self.DeviceInPc = CommonUtils.GetDeviceTypeByPlatformName(self) ~= "Mobile"
  local bAutoPet = self.RootPage:CheckSkipFishingPet()
  self.WBP_Angling_Fishing_Btn:Init(self, bAutoPet)
  self.CurMode = self.GameInputModeSubsystem:GetCurrentInputType()
  self:RefreshInfoByInputTypeChange(self.CurMode)
  self:InitExitButton()
  EventManager:AddEvent(EventID.OnFishHook, self, self.OnFishHook)
  print(_G.LogTag, "LXZ Init", self.DeviceInPc)
  self.ResourceBar:InitResourceBar({
    DataMgr.FishingLure[self.RootPage.FishingLureId].ResourceId
  })
  local ResourceBarIcon = UIUtils.UtilsGetKeyIconPathInGamepad("RS", "Generic")
  self.ResourceBar:SetGamePadKeyImgByPath(ResourceBarIcon)
  self.ResourceBar:InitGamePadTip({
    KeyInfo = {
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "Menu"}
      },
      Desc = GText("UI_GACHA_DESDETAIL")
    },
    ClickFuncObj = self,
    ClickFunc = self.OnClickTip
  })
  self.ResourceBar:HideTip(false)
  if self.DeviceInPc then
    self.Key_PC.Panel_Key:ClearChildren()
    self.Key_FishingPC_A = UIManager(self):_CreateWidgetNew("ComKeyTextDesc")
    self.Key_PC.Panel_Key:AddChild(self.Key_FishingPC_A)
    self.Key_FishingPC_A:CreateCommonKey({
      KeyInfoList = {
        {
          Type = "Text",
          Text = "Space",
          PressCallback = self.OnSpaceDown,
          ReleaseCallback = self.OnCommonBtnSpaceUp,
          Owner = self
        }
      },
      Desc = GText("UI_CTL_Fish_Throw")
    })
    self.Key_FishingPC_B = UIManager(self):_CreateWidgetNew("ComKeyTextDesc")
    self.Key_PC.Panel_Key:AddChild(self.Key_FishingPC_B)
    self.Key_FishingPC_B:CreateCommonKey({
      KeyInfoList = {
        {
          Type = "Text",
          Text = "Esc",
          ClickCallback = self.OnClickEsc,
          Owner = self
        }
      },
      Desc = GText("UI_CTL_Quit")
    })
    self.Key_GamePad.Panel_Key:ClearChildren()
    self.Key_Fishing_A = UIManager(self):_CreateWidgetNew("ComKeyTextDesc")
    self.Key_GamePad.Panel_Key:AddChild(self.Key_Fishing_A)
    self.Key_Fishing_A:CreateCommonKey({
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "A"}
      },
      Desc = GText("UI_CTL_Fish_Throw")
    })
    self.Key_Fishing_B = UIManager(self):_CreateWidgetNew("ComKeyTextDesc")
    self.Key_GamePad.Panel_Key:AddChild(self.Key_Fishing_B)
    self.Key_Fishing_B:CreateCommonKey({
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "B"}
      },
      Desc = GText("UI_CTL_Quit")
    })
  end
  self.InitGameStateFrame = 0
end

function M:SwitchWaitStart(FromSpecial)
  print(_G.LogTag, "LXZ SwitchWaitStart", self.bIsSpecial, self.SpacePress, self.FishingGameState == FishingGameState.WaitStart, FromSpecial)
  if self.FishingGameState == FishingGameState.WaitStart and not FromSpecial then
    return
  end
  self.FishingGameState = FishingGameState.WaitStart
  self.Panel:SetVisibility(ESlateVisibility.Collapsed)
  self.bCanSpace = true
  self.bCanEsc = true
  if self.DeviceInPc then
    self.Key_FishingPC_A:ChangeText(GText("UI_CTL_Fish_Throw"))
    self.Key_FishingPC_B:ChangeText(GText("UI_CTL_Quit"))
    self.Key_Fishing_A:ChangeText(GText("UI_CTL_Fish_Throw"))
    self.Key_Fishing_B:ChangeText(GText("UI_CTL_Quit"))
  end
  if self.WBP_Angling_Fishing_Btn.ButtonPress then
    self.WBP_Angling_Fishing_Btn:OnReleaseButton(false)
  end
  if self.bIsSpecial then
    self.WBP_Angling_Fishing_Btn:SetVisibility(ESlateVisibility.Collapsed)
    self.Angling_Special:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self.Angling_Special:OnCanSpecialFishing()
    self.bIsSpecial = false
  else
    self.WBP_Angling_Fishing_Btn:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self.Angling_Special:SetVisibility(ESlateVisibility.Collapsed)
    self.LastFishId = -1
    local ResourceId = DataMgr.FishingLure[self.RootPage.FishingLureId].ResourceId
    local Count = 0
    local Avatar = GWorld:GetAvatar()
    if Avatar then
      Count = Avatar:GetResourceNum(ResourceId)
    end
    if 0 == Count then
      self.WBP_Angling_Fishing_Btn:SwitchWaitStart(true)
      self.RootPage.Angling_Main.BtnText:ForbidBtn(true)
    else
      self.WBP_Angling_Fishing_Btn:SwitchWaitStart(false)
      self.RootPage.Angling_Main.BtnText:ForbidBtn(false)
    end
  end
end

function M:SwitchWaitFishing(bIsSpecial)
  print(_G.LogTag, "LXZ SwitchWaitFishing", bIsSpecial)
  if self.FishingGameState == FishingGameState.WaitFishing then
    return
  end
  self.FishingGameState = FishingGameState.WaitFishing
  self.WBP_Angling_Fishing_Btn:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  self.WBP_Angling_Fishing_Btn:SwitchWaitFishing()
  self.Panel:SetVisibility(ESlateVisibility.Collapsed)
  self.Angling_Special:SetVisibility(ESlateVisibility.Collapsed)
  if self.DeviceInPc then
    self.Key_FishingPC_A:ChangeText(GText("UI_CTL_Fish_Collect"))
    self.Key_Fishing_A:ChangeText(GText("UI_CTL_Fish_Collect"))
  end
  self.RootPage:PlayPlayerMontage("Fish_StartFish_Montage")
  self:AvatarStartFish(bIsSpecial)
end

function M:SwitchFishing()
  print(_G.LogTag, "LXZ SwitchFishing", self.FishId, self.bIsSpecial)
  if self.FishingGameState == FishingGameState.Fishing then
    return
  end
  self:RemoveTimer("OnFishHookTimeOut")
  self.FishingGameState = FishingGameState.Fishing
  self.WBP_Angling_Fishing_Btn:SwitchFishing()
  self.RootPage.FishingSpot:OnFishing()
  self.Panel:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  self.Angling_Special:SetVisibility(ESlateVisibility.Collapsed)
  if self.DeviceInPc then
    self.Key_FishingPC_A:ChangeText(GText("UI_CTL_Fish_Lift"))
    self.Key_Fishing_A:ChangeText(GText("UI_CTL_Fish_Lift"))
    self.Key_FishingPC_B:ChangeText(GText("UI_CTL_Fish_Collect"))
    self.Key_Fishing_B:ChangeText(GText("UI_CTL_Fish_Collect"))
  end
  self:InitFishingGameState()
  self.RootPage:PlayPlayerMontage("Fish_GetFish_Montage")
end

function M:SwitchEndFishing(bInterupt, bSuccess)
  if self.FishingGameState == FishingGameState.EndFishing then
    return
  end
  self.FishingGameState = FishingGameState.EndFishing
  self.WBP_Angling_Fishing_Btn:SwitchEndFishing()
  self.Panel:SetVisibility(ESlateVisibility.Collapsed)
  self.Angling_Special:SetVisibility(ESlateVisibility.Collapsed)
  self.bCanEsc = false
  if IsValid(self.handle) then
    self.handle:Kill(false)
  end
  local Callback = {
    OnNotifyBegin = function()
      if not bInterupt then
        if bSuccess then
          self:AvatarCompleteFish(bSuccess, self.LastFishId)
        else
          self:AvatarCompleteFish(bSuccess, self.LastFishId)
        end
      end
      self:SwitchWaitStart()
    end
  }
  if bInterupt then
    self:AvatarStopFish()
    self.RootPage.FishingSpot:OnFishFail()
  elseif not bSuccess then
    self.bIsSpecial = false
  end
  if bSuccess then
    self.RootPage.FishingSpot:OnGetFishEnd()
  end
  self.RootPage:PlayPlayerMontage("Fish_GetFishEnd_Montage", Callback)
  AudioManager(self):StopSound(self, "OnFishHook")
  AudioManager(self):StopSound(self, "FishItemInRegion")
end

function M:OnSpecialFishingPanelOut()
  print(_G.LogTag, "LXZ OnSpecialFishingPanelOut")
  if self.DeviceInPc then
    self.WidgetSwitcher_MP:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  end
  if self.Angling_Special.bFailed then
    self.Angling_Special:SetVisibility(ESlateVisibility.Collapsed)
    self:SwitchWaitStart(true)
  else
    self:SwitchWaitFishing(true)
  end
end

function M:OnClickExit()
  print(_G.LogTag, "LXZ OnClickExit", self.FishingGameState)
  if not self.bCanEsc then
    return
  end
  if self.FishingGameState == FishingGameState.Fishing then
    self:SwitchEndFishing(false, false)
  elseif self.FishingGameState == FishingGameState.WaitFishing then
    self:RemoveTimer("OnFishHookTimeOut")
    self:SwitchEndFishing(true, false)
  else
    self.RootPage:SwitchOnMainPage()
  end
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_return", nil, nil)
end

function M:InitExitButton()
  self.Btn_Quit.OnClicked:Add(self, self.OnClickExit)
end

function M:OnClickAnglingButton()
  print(_G.LogTag, "LXZ OnClickAnglingButton", self.bCanSpace, self.FishingGameState)
  if self.WBP_Angling_Fishing_Btn:GetVisibility() == ESlateVisibility.Collapsed or not self.bCanSpace then
    return
  end
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    local FishSpotAvatar = Avatar.FishingSpots[self.FishingSpotId]
    if FishSpotAvatar and FishSpotAvatar.RemainFishCount <= 0 then
      UIManager(self):ShowUITip(UIConst.Tip_CommonTop, string.format(GText("UI_Fishing_Toast_NoFish"), self.RootPage.RemainTimeStr))
      return
    end
  end
  if self.FishingGameState == FishingGameState.WaitStart then
    self:SwitchWaitFishing(false)
  elseif self.FishingGameState == FishingGameState.WaitFishing then
    AudioManager(self):StopSound(self, "OnFishHook")
    if -1 == self.LastFishId then
      self:SwitchEndFishing(true, false)
    elseif not self:CheckSkipAngling() then
      self:SwitchFishing()
    else
      self:SwitchEndFishing(false, true)
    end
  elseif self.FishingGameState == FishingGameState.Fishing then
  end
end

function M:InitFishingGameState()
  self.InitSucc = false
  self.Angling_Bar:SetPercent(0)
  self.TotalGameTime = 0
  self.EffectGameTime = self.FishingGameInitialProgress * self.SuccessTime
  self:InitFishCurve()
  self.ItemLength = DataMgr.FishingRod[self.RootPage.FishingRodId].Length or self.DefaultItemLength
  local CanvasSlot1 = UWidgetLayoutLibrary.SlotAsCanvasSlot(self.WBP_Angling_Fishing_Item)
  local Position = CanvasSlot1:GetPosition()
  Position.Y = self.DefaultItemY + (self.DefaultItemLength - self.ItemLength) / 2
  CanvasSlot1:SetPosition(Position)
  local CanvasSlot2 = UWidgetLayoutLibrary.SlotAsCanvasSlot(self.Icon01)
  local Position = CanvasSlot2:GetPosition()
  Position.Y = 0
  CanvasSlot2:SetPosition(Position)
  local CanvasSlot3 = UWidgetLayoutLibrary.SlotAsCanvasSlot(self.WBP_Angling_Fishing_Item.Bg02)
  local Size = CanvasSlot3:GetSize()
  Size.Y = self.ItemLength
  CanvasSlot3:SetSize(Size)
  self.bInitGame = true
  print(_G.LogTag, "LXZ InitFishingGameState")
end

function M:InitWidgetPosition()
  local BGSize = UIManager(self):GetWidgetRenderSize(self.Bg01)
  self.MaxFishY = BGSize.Y / 2
  self.MinFishY = -BGSize.Y / 2
  local ItemSize = UIManager(self):GetWidgetRenderSize(self.WBP_Angling_Fishing_Item)
  self.EffectMaxY = ItemSize.Y / 2
  self.EffectMinY = -ItemSize.Y / 2
  self.MaxItemY = self.DefaultItemY + (self.DefaultItemLength - self.ItemLength) / 2
  self.MinItemY = -self.MaxItemY
  self:FishIconMove()
  self:UpdateFishingItem()
  self:CheckFish(0)
  self.InitSucc = true
  print(_G.LogTag, "LXZ InitWidgetPosition", BGSize, ItemSize)
end

function M:InitFishCurve()
  local FishData = DataMgr.Fish[self.LastFishId]
  if not FishData then
    GWorld.logger.error("LXZ InitFishingGameState \233\177\188\231\154\132Id\233\148\153\232\175\175,\228\184\141\229\173\152\229\156\168\233\177\188\232\161\168\231\154\132\230\149\176\230\141\174\239\188\140 FishId:", self.LastFishId)
  end
  local FishMoveId = FishData.FishMoveId
  if not FishMoveId or not DataMgr.FishMove[FishMoveId] then
    GWorld.logger.error("LXZ InitFishingGameState \233\177\188\231\154\132\232\191\144\229\138\168Id\233\148\153\232\175\175,\228\184\141\229\173\152\229\156\168\233\177\188\232\191\144\229\138\168\232\161\168\231\154\132\230\149\176\230\141\174\239\188\140 FishMoveId:", FishMoveId)
  end
  local FishMoveCurvePath = DataMgr.FishMove[FishMoveId].FishMoveCurve
  self.Curve = LoadObject(FishMoveCurvePath)
  self.CurveMaxTime = DataMgr.FishMove[FishMoveId].MaxTime
  if not FishMoveCurvePath or not self.Curve then
    GWorld.logger.error("LXZ InitFishingGameState \233\177\188\231\154\132\232\191\144\229\138\168\230\155\178\231\186\191\232\183\175\229\190\132\233\148\153\232\175\175,\228\184\141\229\173\152\229\156\168\230\155\178\231\186\191\232\183\175\229\190\132\230\136\150\229\175\185\229\186\148\230\155\178\231\186\191\232\181\132\228\186\167\239\188\140 FishMoveId:", FishMoveId)
  end
end

function M:Tick(MyGeometry, InDeltaTime)
  if self.bInitGame then
    self.InitGameStateFrame = self.InitGameStateFrame + 1
    if self.InitGameStateFrame > 1 then
      self:InitWidgetPosition()
      self.InitGameStateFrame = 0
      self.bInitGame = false
    end
  end
  if self.FishingGameState ~= FishingGameState.Fishing or not self.InitSucc then
    return
  end
  self.TotalGameTime = self.TotalGameTime + InDeltaTime
  if self.TotalGameTime > self.CurveMaxTime then
    self.TotalGameTime = 0
  end
  self:FishIconMove()
  self:UpdateFishingItem()
  self:CheckFish(InDeltaTime)
end

function M:FishIconMove()
  local CanvasSlot = UWidgetLayoutLibrary.SlotAsCanvasSlot(self.Icon01)
  local Position = CanvasSlot:GetPosition()
  local CurveY = self.Curve:GetFloatValue(self.TotalGameTime)
  Position.Y = math.min(CurveY, self.MaxFishY)
  Position.Y = math.max(CurveY, self.MinFishY)
  CanvasSlot:SetPosition(Position)
end

function M:UpdateFishingItem()
  local ItemSize = UIManager(self):GetWidgetRenderSize(self.WBP_Angling_Fishing_Item)
  local CanvasSlot = UWidgetLayoutLibrary.SlotAsCanvasSlot(self.WBP_Angling_Fishing_Item)
  local Position = CanvasSlot:GetPosition()
  local ItemSize = UIManager(self):GetWidgetRenderSize(self.WBP_Angling_Fishing_Item)
  self.EffectMaxY = Position.Y + ItemSize.Y / 2
  self.EffectMinY = Position.Y - ItemSize.Y / 2
end

function M:ChangeItemMove(bPress)
  if self.FishingGameState ~= FishingGameState.Fishing then
    return
  end
  local CanvasSlot = UWidgetLayoutLibrary.SlotAsCanvasSlot(self.WBP_Angling_Fishing_Item)
  local Position = CanvasSlot:GetPosition()
  if IsValid(self.handle) then
    self.handle:Kill(false)
  end
  local Long = self.MaxItemY - self.MinItemY
  if bPress then
    local MoveCurve = DataMgr.FishingStick[1].MoveCurve[1]
    local FuncName = EaseFuc[MoveCurve] or EaseFuc.InSine
    self.handle = self:GetEaseValue(Position.Y, Position.Y - Long, self.ItemUpTime, FuncName, {
      self,
      self.ChangeItemMoveUp
    })
  else
    local MoveCurve = DataMgr.FishingStick[1].MoveCurve[2]
    local FuncName = EaseFuc[MoveCurve] or EaseFuc.OutBounce
    local Time = math.sqrt((self.MaxItemY - Position.Y) / Long) * self.ItemDownTime
    self.handle = self:GetEaseValue(Position.Y, self.MaxItemY, Time, FuncName, {
      self,
      self.ChangeItemMoveDown
    })
  end
end

function M:CheckFish(InDeltaTime)
  local CanvasSlot = UWidgetLayoutLibrary.SlotAsCanvasSlot(self.Icon01)
  local Position = CanvasSlot:GetPosition()
  if Position.Y <= self.EffectMaxY and Position.Y >= self.EffectMinY then
    self.EffectGameTime = self.EffectGameTime + InDeltaTime
    if not self.bFishInAnimationPlayed then
      self.bFishInAnimationPlayed = true
      self.bFishOutAnimationPlayed = false
      self.WBP_Angling_Fishing_Item:StopAnimation(self.WBP_Angling_Fishing_Item.Area_Out)
      self.WBP_Angling_Fishing_Item:PlayAnimation(self.WBP_Angling_Fishing_Item.Area_In)
      AudioManager(self):PlayUISound(self, "event:/ui/minigame/fish_in_region", "FishItemInRegion", nil)
    end
  else
    self.EffectGameTime = math.max(self.EffectGameTime - InDeltaTime, 0)
    if not self.bFishOutAnimationPlayed then
      self.bFishInAnimationPlayed = false
      self.bFishOutAnimationPlayed = true
      self.WBP_Angling_Fishing_Item:StopAnimation(self.WBP_Angling_Fishing_Item.Area_In)
      self.WBP_Angling_Fishing_Item:PlayAnimation(self.WBP_Angling_Fishing_Item.Area_Out)
      AudioManager(self):StopSound(self, "FishItemInRegion")
      AudioManager(self):PlayUISound(self, "event:/ui/minigame/fish_out_region", nil, nil)
    end
  end
  local Percent = self.EffectGameTime / self.SuccessTime
  self.Angling_Bar:SetPercent(Percent)
  if self.EffectGameTime >= self.SuccessTime then
    self:SwitchEndFishing(false, true)
    AudioManager(self):StopSound(self, "FishItemInRegion")
  elseif self.EffectGameTime <= 0 then
    self:SwitchEndFishing(false, false)
    AudioManager(self):StopSound(self, "FishItemInRegion")
  end
end

function M:OnClickTip()
  local Params = {}
  print(_G.LogTag, "LXZ OnClickTip")
  UIManager(self):LoadUINew("GuideBook", 5, 84)
end

function M:OnSpaceDown()
  print(_G.LogTag, "LXZ OnSpaceDown", self.SpacePress, self.InitSucc, self.bCanSpace)
  if not (not self.SpacePress and self.InitSucc) or not self.bCanSpace then
    return
  end
  self.SpacePress = true
  self:ChangeItemMove(true)
end

function M:OnSpaceUp()
  print(_G.LogTag, "LXZ OnSpaceUp", self.SpacePress, self.InitSucc, self.bCanSpace)
  if not (self.SpacePress and self.InitSucc) or not self.bCanSpace then
    return
  end
  self.SpacePress = false
  if self.FishingGameState == FishingGameState.WaitFishing then
    print(_G.LogTag, "LXZ OnSpaceUp")
  else
    self:ChangeItemMove(false)
  end
end

function M:OnCommonBtnSpaceUp()
  self.WBP_Angling_Fishing_Btn:OnReleaseButton(true)
  self.WBP_Angling_Fishing_Btn:OnClickButton()
  self:OnSpaceUp()
end

function M:OnClickEsc()
  if self.Angling_Special:GetVisibility() ~= ESlateVisibility.Collapsed then
    self.Angling_Special:OnClickQuit()
  else
    self:OnClickExit()
  end
end

function M:Handle_KeyEventOnPC(InKeyName)
  if "SpaceBar" == InKeyName then
    self.WBP_Angling_Fishing_Btn:OnPressButton()
    self:OnSpaceDown()
  elseif "E" == InKeyName and self.Angling_Special:GetVisibility() ~= ESlateVisibility.Collapsed then
    self.Angling_Special:OnClickAngling()
  elseif "Escape" == InKeyName then
    self:OnClickEsc()
  end
  return true
end

function M:Handle_KeyUpEventOnPC(InKeyName)
  if "SpaceBar" == InKeyName then
    self.WBP_Angling_Fishing_Btn:OnReleaseButton(true)
    self.WBP_Angling_Fishing_Btn:OnClickButton()
    self:OnSpaceUp()
  end
  return true
end

function M:Handle_KeyEventOnGamePad(InKeyName)
  print(_G.LogTag, "LXZ Handle_KeyEventOnGamePad", InKeyName)
  if "Gamepad_FaceButton_Bottom" == InKeyName then
    if self.Angling_Special:GetVisibility() ~= ESlateVisibility.Collapsed then
      self.Angling_Special:OnClickAngling()
    else
      self.WBP_Angling_Fishing_Btn:OnPressButton()
      self:OnSpaceDown()
    end
  elseif "Gamepad_FaceButton_Left" == InKeyName then
    self.Angling_Special:OnClickAngling()
  elseif "Gamepad_FaceButton_Right" == InKeyName then
    if self.Angling_Special:GetVisibility() ~= ESlateVisibility.Collapsed then
      self.Angling_Special:OnClickQuit()
    else
      self:OnClickExit()
    end
  elseif "Gamepad_Special_Right" == InKeyName then
    self:OnClickTip()
  elseif InKeyName == UIConst.GamePadKey.RightThumb then
    self.ResourceBar:FocusToResource()
  end
  return true
end

function M:Handle_KeyUpEventOnGamePad(InKeyName)
  print(_G.LogTag, "LXZ Handle_KeyUpEventOnGamePad", InKeyName)
  if "Gamepad_FaceButton_Bottom" == InKeyName then
    self.WBP_Angling_Fishing_Btn:OnReleaseButton(true)
    self.WBP_Angling_Fishing_Btn:OnClickButton()
    self:OnSpaceUp()
  end
  return true
end

function M:Handle_PreviewKeyEventOnGamePad(InKeyName)
  return true
end

function M:GetEaseValue(Start, End, Time, Type, func)
  return UE4.ULTweenBPLibrary.FloatTo(self, func, Start, End, Time, 0, Type)
end

function M:ChangeItemMoveUp(value)
  local CanvasSlot = UWidgetLayoutLibrary.SlotAsCanvasSlot(self.WBP_Angling_Fishing_Item)
  local Position = CanvasSlot:GetPosition()
  Position.Y = math.max(value, self.MinItemY)
  CanvasSlot:SetPosition(Position)
end

function M:ChangeItemMoveDown(value)
  local CanvasSlot = UWidgetLayoutLibrary.SlotAsCanvasSlot(self.WBP_Angling_Fishing_Item)
  local Position = CanvasSlot:GetPosition()
  Position.Y = math.min(value, self.MaxItemY)
  CanvasSlot:SetPosition(Position)
end

function M:OnFishHook(FishId, bIsSpecial)
  if DataMgr.Fish[FishId] then
    self.SuccessTime = DataMgr.Fish[FishId].FishGetDuration or 10
    self.EffectGameTime = DataMgr.Fish[FishId].FishHookOffset or 1.5
  end
  self.bIsSpecial = bIsSpecial
  self.LastFishId = FishId
  self.WBP_Angling_Fishing_Btn:SwitchWaitStartFishing()
  self.RootPage.FishingSpot:OnFishHook(FishId, bIsSpecial)
  self.RootPage.Angling_Main:RefreshFishLure(self.RootPage.FishingLureId)
  AudioManager(self):PlayUISound(self, "event:/sfx/common/scene/fish/bite", "OnFishHook", nil)
  if not self:CheckSkipAngling() then
    self:AddTimer(self.FishingHookResponseTime, self.OnFishHookTimeOut, false, 0, "OnFishHookTimeOut")
  end
end

function M:OnFishHookTimeOut()
  UIManager(self):LoadUINew("ExploreToastFail", "UI_Fishing_FishEscape")
  AudioManager(self):StopSound(self, "OnFishHook")
  self:SwitchEndFishing(true, false)
end

function M:CheckSkipAngling()
  if not self.LastFishId or -1 == self.LastFishId then
    print(_G.LogTag, "Error: LXZ \230\178\161\230\156\137\228\184\138\233\146\169\231\154\132\233\177\188\231\154\132id\239\188\140\229\143\175\232\131\189\230\152\175\230\178\161\230\156\137\233\177\188\231\171\191\232\181\132\230\186\144\230\136\150\233\177\188\233\165\181\232\181\132\230\186\144")
    return
  end
  local AutoFishLevel = DataMgr.FishingRod[self.RootPage.FishingRodId].AutoFishingLevel or 1
  local FishLevel = DataMgr.Fish[self.LastFishId].FishLevel or 1
  if AutoFishLevel < FishLevel then
    return false
  end
  if _G.bSkipAngling then
    return true
  end
  local Res = self.RootPage:CheckSkipFishingPet()
  return Res
end

function M:AvatarStartFish(bIsSpecial)
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    if bIsSpecial then
      Avatar:OnFishStart(self.RootPage.FishingSpotId, self.RootPage.FishingRodId, -1, self.LastFishId)
      self.LastFishId = -1
    else
      Avatar:OnFishStart(self.RootPage.FishingSpotId, self.RootPage.FishingRodId, self.RootPage.FishingLureId, -1)
    end
  else
    self:AddTimer(3, self.OnFishHook)
  end
end

function M:AvatarStopFish()
  self.bIsSpecial = false
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    Avatar:OnFishStop(self.RootPage.FishingSpotId)
  else
  end
end

function M:AvatarCompleteFish(IsSuccess, LastFishId)
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    local function ShowFishMap(Ret, FishId, FishSize, AvatarIsSuccess)
      if AvatarIsSuccess then
        print(_G.LogTag, "LXZ Avatar:GetFishCountByFishId", Avatar:GetFishCountByFishId(FishId))
        
        self.RootPage.FishingSpot:OnFishSuccess()
        if 1 == Avatar:GetFishCountByFishId(FishId) then
          UIManager(self):LoadUINew("AnglingNewFish", {
            FishId = LastFishId,
            FishingPage = self,
            IsNew = true,
            FishSize = FishSize
          })
        else
          UIManager(self):LoadUINew("AnglingNewFish", {
            FishId = LastFishId,
            FishingPage = self,
            IsNew = false,
            FishSize = FishSize
          })
        end
        local UnLockData = EMCache:Get("FishUnLockData", true)
        local FishIdStr = tostring(LastFishId)
        if not UnLockData then
          UnLockData = {}
          UnLockData[FishIdStr] = 2
          EMCache:Set("FishUnLockData", UnLockData, true)
          ReddotManager.IncreaseLeafNodeCount("AnglingMap", 1)
        elseif 1 == UnLockData[FishIdStr] or nil == UnLockData[FishIdStr] then
          UnLockData[FishIdStr] = 2
          EMCache:Set("FishUnLockData", UnLockData, true)
          ReddotManager.IncreaseLeafNodeCount("AnglingMap", 1)
        end
      else
        UIManager(self):LoadUINew("ExploreToastFail", "UI_Fishing_Fail")
        self.RootPage.FishingSpot:OnFishFail()
      end
    end
    
    Avatar:OnCompleteFishGame(IsSuccess, ShowFishMap)
  else
  end
end

function M:ShowRewardUI(FishId)
  local ResourceId = DataMgr.Fish[FishId].ResourceId
  UIUtils.ShowHudReward(GText("UI_Fishing_Reward"), {
    {
      ItemType = "Resource",
      ItemId = ResourceId,
      Count = 1,
      Rarity = ItemUtils.GetItemRarity(ResourceId, "Resource")
    }
  })
end

function M:RefreshInfoByInputTypeChange(CurInputDevice, CurGamepadName)
  if CurInputDevice == ECommonInputType.MouseAndKeyboard and self.DeviceInPc then
    self.WidgetSwitcher_MP:SetActiveWidgetIndex(0)
    self.WidgetSwitcher_Tip:SetActiveWidgetIndex(0)
    self.WBP_Angling_Fishing_Btn.WidgetSwitcher_Key:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self.WBP_Angling_Fishing_Btn.WidgetSwitcher_Key:SetActiveWidgetIndex(0)
    self.ResourceBar:SwitchTipStyle(0)
  elseif CurInputDevice == ECommonInputType.Gamepad and self.DeviceInPc then
    self.WidgetSwitcher_MP:SetActiveWidgetIndex(1)
    self.WidgetSwitcher_Tip:SetActiveWidgetIndex(1)
    self.WBP_Angling_Fishing_Btn.WidgetSwitcher_Key:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self.WBP_Angling_Fishing_Btn.WidgetSwitcher_Key:SetActiveWidgetIndex(1)
    self.ResourceBar:SwitchTipStyle(1)
  elseif CurInputDevice == ECommonInputType.Touch then
  end
  self.Angling_Special:RefreshInfoByInputTypeChange(CurInputDevice, CurGamepadName)
end

return M
