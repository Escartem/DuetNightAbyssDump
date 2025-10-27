require("UnLua")
local M = Class({
  "BluePrints.UI.BP_UIState_C"
})

function M:Initialize(Initializer)
  self.Super.Initialize(self)
  self.PlayerEids = {}
  self.PreProgress = {}
  self.CurProgress = {}
  self.DeltaProgress = {}
  self.LastProgress = {}
  self.CurMode = 1
  self.PlayersInfo = {}
  self.ArchivePoints = {}
  self.Points = {}
  self.RealPoints = {}
  self.PointActiveState = {}
  self.BuffTime = {}
  self.GameEnd = false
  self.Length = 396.0
  self.CompleteNum = 0
  self.AllPlayNum = 0
end

function M:UpdateProgress()
  if not (self.PartyPlayerDisPercentValues and self.LastProgress ~= {} and self.PlayersInfo ~= {} and self.GameState) or self.IsInFallTrigger or self.GameEnd then
    return
  end
  for Eid, Percent in pairs(self.LastProgress) do
    self.LastProgress[Eid] = self.LastProgress[Eid] + self.DeltaProgress[Eid]
    local Pos = FVector2D(0.0, 0.0)
    if Eid == self.CurPlayer.Eid then
      if self.LastProgress[Eid] < 0.125 and 1 ~= self.CurMode then
        self.CurMode = 1
        self:PlayAnimationReverse(self.ProgressBG_ToMid)
        self.StartPoint:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
      elseif self.LastProgress[Eid] > 0.125 and self.LastProgress[Eid] < 0.875 and 1 == self.CurMode then
        self.CurMode = 2
        self:PlayAnimation(self.ProgressBG_ToMid)
        self.StartPoint:SetVisibility(ESlateVisibility.Hidden)
      elseif self.LastProgress[Eid] > 0.125 and self.LastProgress[Eid] < 0.875 and 3 == self.CurMode then
        self.CurMode = 2
        self:PlayAnimationReverse(self.ProgressBG_ToRight)
        self.EndPoint:SetVisibility(ESlateVisibility.Hidden)
      elseif self.LastProgress[Eid] > 0.875 and 3 ~= self.CurMode then
        self.CurMode = 3
        self:PlayAnimation(self.ProgressBG_ToRight)
        self.EndPoint:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
      end
      if 1 == self.CurMode then
        local PosX = self.Length * math.clamp(self.LastProgress[Eid] / 0.125 * 0.5, 0.0, 0.5)
        Pos.X = PosX
      elseif 2 == self.CurMode then
        local PosX = self.Length * 0.5
        Pos.X = PosX
      elseif 3 == self.CurMode then
        local PosX = self.Length * math.clamp(0.5 + (self.LastProgress[Eid] - 0.875) / 0.125 * 0.5, 0.5, 1.0)
        Pos.X = PosX
      end
    elseif 1 == self.CurMode then
      if self.LastProgress[Eid] < 0.25 then
        local PosX = self.Length * self.LastProgress[Eid] * 4
        Pos.X = PosX
      else
        Pos.X = self.Length
      end
    elseif 2 == self.CurMode then
      local MainPlayerProgress = self.LastProgress[self.CurPlayer.Eid]
      if self.LastProgress[Eid] < MainPlayerProgress - 0.125 then
      elseif self.LastProgress[Eid] > MainPlayerProgress + 0.125 then
        Pos.X = self.Length
      else
        local Delta = self.LastProgress[Eid] - MainPlayerProgress
        local PosX = self.Length * math.clamp(0.5 + Delta / 0.25, 0.0, 1.0)
        Pos.X = PosX
      end
    elseif 3 ~= self.CurMode or self.LastProgress[Eid] < 0.75 then
    else
      Pos.X = self.Length * math.clamp((self.LastProgress[Eid] - 0.75) / 0.25, 0.0, 1.0)
    end
    self.PlayersInfo[Eid][2]:SetRenderTranslation(Pos)
    self.PlayersInfo[Eid][3]:SetRenderTranslation(Pos)
  end
  if self.ArchivePoints and #self.ArchivePoints > 2 then
    for i = 2, #self.ArchivePoints - 1 do
      if self.Points[i] then
        self.Points[i]:SetVisibility(ESlateVisibility.Hidden)
      end
      local ArchivePoint = self.GameState.ArchivePointMap:Find(i)
      if ArchivePoint and ArchivePoint:CheckIsActive(self.CurPlayer.Eid) and not self.PointActiveState[i] then
        self.PointActiveState[i] = true
        self.Points[i]:PlayAnimation(self.Points[i].Switch)
        AudioManager(self):PlayUISound(self, "event:/ui/common/multi_player_challenge_achieve_stage", nil, nil)
      end
      local Percent = self.ArchivePoints[i]
      local Pos = FVector2D(0.0, 0.0)
      if 1 == self.CurMode and Percent < 0.25 then
        local PosX = self.Length * self.ArchivePoints[i] * 4
        Pos.X = PosX
        self.Points[i]:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
      elseif 2 == self.CurMode then
        local PerDis = Percent - self.LastProgress[self.CurPlayer.Eid]
        if PerDis > -0.125 and PerDis < 0.125 then
          local PosX = self.Length * math.clamp(0.5 + PerDis / 0.25, 0.0, 1.0)
          Pos.X = PosX
          self.Points[i]:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
        end
      elseif 3 == self.CurMode and Percent > 0.75 then
        local PosX = self.Length * math.clamp((Percent - 0.75) / 0.25, 0.0, 1.0)
        Pos.X = PosX
        self.Points[i]:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
      end
      self.Points[i]:SetRenderTranslation(Pos)
    end
  end
end

function M:ConstructInfo()
  self:InitListenEvent()
  self:InitInfo()
end

function M:InitListenEvent()
  self:AddDispatcher(EventID.OnPartyProgressUpdate, self, self.OnPartyProgressUpdate)
  self:AddDispatcher(EventID.OnPartyPlayerGetBuff, self, self.OnPartyPlayerGetBuff)
  self:AddDispatcher(EventID.OnUpdatePartyRightUI, self, self.OnUpdatePartyRightUI)
  self:AddDispatcher(EventID.OnPlayerEnterToExit, self, self.OnPlayerEnterToExit)
  self:AddDispatcher(EventID.OnOnePlayerEnd, self, self.OnOnePlayerEnd)
  self:AddDispatcher(EventID.OnPartyPlayerTriggerFallTrigger, self, self.OnPartyPlayerTriggerFallTrigger)
  self:AddDispatcher(EventID.OnPlayerGetDeBuff, self, self.OnPlayerGetDeBuff)
end

function M:InitInfo()
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  if not GameInstance then
    return
  end
  self.DungeonId = GameInstance:GetCurrentDungeonId()
  self.DungeonInfo = DataMgr.Dungeon[self.DungeonId]
  if not self.DungeonInfo then
    return
  end
  self:AddTimer(0.02, self.UpdateProgress, true, 0, "UpdateProgress")
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  self.Group_ProgressSign:ClearChildren()
  self.Group_ProgressHeadOther:ClearChildren()
  self.Group_ProgressHeadMine:ClearChildren()
  self.Text_MulrTempleProgressTitle:SetText(GText("UI_Party_Parkour_FinishingRate") .. " 0%")
  self:SetVisibility(ESlateVisibility.Hidden)
end

function M:OnPartyProgressUpdate()
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  self.GameState = GameState
  self.CurPlayer = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  if not GameState or not self.CurPlayer then
    return
  end
  if self.GameEnd then
    return
  end
  self.PartyPlayerDisPercentValues = GameState.PartyPlayerDisPercentValues
  DebugPrint("zwk \230\180\190\229\175\185\229\189\147\229\137\141\228\186\186\230\149\176\239\188\154", self.PartyPlayerDisPercentValues:Num())
  if not self.PartyPlayerDisPercentValues then
    return
  end
  if not self.HasAdd then
    self.HasAdd = true
    self:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self:PlayAnimation(self.In)
    self:PlayAnimation(self.ProgressBG_Left)
    local PointNum = GameState.ArchivePointProgress:Num()
    DebugPrint("zzz000 ", PointNum)
    for i = 1, PointNum do
      self.ArchivePoints[i] = GameState.ArchivePointProgress:Find(i)
      DebugPrint("zzz111 ", self.ArchivePoints[i])
    end
    for i = 1, PointNum do
      self.ArchivePoints[i] = GameState.ArchivePointProgress:Find(i)
      if i > 1 and i < PointNum and not self.Points[i] then
        local Point = self:CreateWidgetNew("PartyPoint")
        self.Group_ProgressSign:AddChild(Point)
        local SlotArrow = UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(Point)
        local Anchors = SlotArrow:GetAnchors()
        Anchors.Minimum = FVector2D(0.0, 0.5)
        Anchors.Maximum = FVector2D(0.0, 0.5)
        SlotArrow:SetAnchors(Anchors)
        SlotArrow:SetAlignment(FVector2D(0.5, 0.5))
        SlotArrow:SetPosition(FVector2D(0.0, 0.0))
        self.Points[i] = Point
        if self.ArchivePoints[i] > 0.25 then
          self.Points[i]:SetVisibility(ESlateVisibility.Hidden)
        else
          local PosX = self.Length * self.ArchivePoints[i] * 4
          local Pos = FVector2D(PosX, 0.0)
          self.Points[i]:SetRenderTranslation(Pos)
        end
      end
    end
    self.AllPlayNum = 0
    for Eid, Percent in pairs(self.PartyPlayerDisPercentValues) do
      local Bar = self:CreateWidgetNew("PartyHeadArrow")
      self.Group_ProgressSign:AddChild(Bar)
      local Head = self:CreateWidgetNew("PartyHead")
      if Eid == self.CurPlayer.Eid then
        self.Group_ProgressHeadMine:AddChild(Head)
        Head.Image_MyselfBG:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
        Bar.WS_SubItem02:SetActiveWidgetIndex(1)
      else
        self.Group_ProgressHeadOther:AddChild(Head)
        Bar.WS_SubItem02:SetActiveWidgetIndex(0)
      end
      self.PlayersInfo[Eid] = {
        Percent,
        Bar,
        Head
      }
      self.AllPlayNum = self.AllPlayNum + 1
      local SlotArrow = UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(Bar)
      local Anchors = SlotArrow:GetAnchors()
      Anchors.Minimum = FVector2D(0.0, 0.5)
      Anchors.Maximum = FVector2D(0.0, 0.5)
      SlotArrow:SetAnchors(Anchors)
      SlotArrow:SetAlignment(FVector2D(0.5, 0.5))
      SlotArrow:SetPosition(FVector2D(0.0, 0.0))
      if Eid == self.CurPlayer.Eid then
        SlotArrow:SetZOrder(1)
      end
      local SlotHead = UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(Head)
      local Anchors = SlotHead:GetAnchors()
      Anchors.Minimum = FVector2D(0.0, 0.5)
      Anchors.Maximum = FVector2D(0.0, 0.5)
      SlotHead:SetAnchors(Anchors)
      SlotHead:SetAlignment(FVector2D(0.5, 0.5))
      SlotHead:SetPosition(FVector2D(0.0, 0.0))
      SlotHead:SetAutoSize(true)
      local Player = Battle(self):GetEntity(Eid)
      local CharName = DataMgr.Char[Player.CurrentRoleId].GUIPathVariable
      local Path = "/Game/UI/Texture/Dynamic/Image/Head/Mini/T_Normal_Mini_" .. CharName
      local IconDynaMaterial = Head.Image_Head:GetDynamicMaterial()
      if IconDynaMaterial then
        local Texture = LoadObject(Path)
        Texture = Texture or LoadObject("/Game/UI/Texture/Dynamic/Image/Head/Mini/T_Normal_Mini_Heitao")
        IconDynaMaterial:SetTextureParameterValue("MainTex", Texture)
      end
      Head:PlayAnimation(Head.Normal)
      self.BuffTime[Eid] = {0.0, 0.0}
    end
    self.StartPoint = self:CreateWidgetNew("PartyStartPoint")
    self.Group_ProgressSign:AddChild(self.StartPoint)
    local SlotStartPoint = UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(self.StartPoint)
    local Anchors = SlotStartPoint:GetAnchors()
    Anchors.Minimum = FVector2D(0.0, 0.5)
    Anchors.Maximum = FVector2D(0.0, 0.5)
    SlotStartPoint:SetAnchors(Anchors)
    SlotStartPoint:SetAlignment(FVector2D(0.5, 0.5))
    SlotStartPoint:SetPosition(FVector2D(0.0, 0.0))
    self.StartPoint:SetRenderTranslation(FVector2D(0.0, 0.0))
    self.EndPoint = self:CreateWidgetNew("PartyEndPoint")
    self.Group_ProgressSign:AddChild(self.EndPoint)
    local SlotEndPoint = UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(self.EndPoint)
    local Anchors = SlotEndPoint:GetAnchors()
    Anchors.Minimum = FVector2D(0.0, 0.5)
    Anchors.Maximum = FVector2D(0.0, 0.5)
    SlotEndPoint:SetAnchors(Anchors)
    SlotEndPoint:SetAlignment(FVector2D(0.5, 0.5))
    SlotEndPoint:SetPosition(FVector2D(0.0, 0.0))
    self.EndPoint:SetVisibility(ESlateVisibility.Hidden)
    self.EndPoint:SetRenderTranslation(FVector2D(self.Length, 0.0))
  end
  for Eid, Info in pairs(self.PlayersInfo) do
    if Info[2] then
      Info[2]:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    end
    if Info[3] then
      Info[3]:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    end
  end
  for Eid, Percent in pairs(self.PartyPlayerDisPercentValues) do
    self.CurProgress[Eid] = math.clamp(Percent, 0.0, 1.0)
  end
  for Eid, Percent in pairs(self.PartyPlayerDisPercentValues) do
    if not self.PreProgress[Eid] then
      self.PreProgress[Eid] = 0.0
    end
    self.DeltaProgress[Eid] = (self.CurProgress[Eid] - self.PreProgress[Eid]) * 0.02
    self.LastProgress[Eid] = self.PreProgress[Eid]
    self.PreProgress[Eid] = self.CurProgress[Eid]
    if self.PlayersInfo[Eid][4] then
      self.LastProgress[Eid] = self.PreProgress[Eid]
      self.DeltaProgress[Eid] = 0.0
      self:UpdateProgress()
      self.PlayersInfo[Eid][4] = false
      self.PlayersInfo[Eid][3]:StopAllAnimations()
      self.PlayersInfo[Eid][3]:UnbindAllFromAnimationFinished(self.PlayersInfo[Eid][3].Rebirth_In)
      if Eid == self.CurPlayer.Eid then
        AudioManager(self):PlayUISound(self, "event:/ui/common/multi_player_challenge_revive", nil, nil)
      end
      self.PlayersInfo[Eid][3]:BindToAnimationFinished(self.PlayersInfo[Eid][3].Rebirth_In, function()
        if self:IsExistTimer("PlayerGetBuff_" .. Eid) and self.PlayersInfo[Eid] and self.PlayersInfo[Eid][3] then
          if self.PlayersInfo[Eid][5] then
            self.PlayersInfo[Eid][3]:PlayAnimation(self.PlayersInfo[Eid][3].Victory)
          else
            self.PlayersInfo[Eid][3]:PlayAnimation(self.PlayersInfo[Eid][3].Failure)
          end
        end
      end)
      self.PlayersInfo[Eid][3]:PlayAnimation(self.PlayersInfo[Eid][3].Rebirth_In)
      local RebirthPlayerPosX = self.PlayersInfo[Eid][3].RenderTransform.Translation.X
      local MinX = self.Length
      local MinIndex = 1
      for i, v in pairs(self.Points) do
        if MinX > math.abs(v.RenderTransform.Translation.X - RebirthPlayerPosX) then
          MinX = v.RenderTransform.Translation.X
          MinIndex = i
        end
      end
      self.Points[MinIndex]:PlayAnimation(self.Points[MinIndex].Rebirth_In)
    end
  end
end

function M:OnPartyPlayerGetBuff(Eid, BuffId, IsPositive, Time)
  if self.PlayersInfo[Eid] and self.PlayersInfo[Eid][3] then
    self.PlayersInfo[Eid][5] = IsPositive
    if IsPositive then
      self.PlayersInfo[Eid][3]:PlayAnimation(self.PlayersInfo[Eid][3].Victory)
    else
      self.PlayersInfo[Eid][3]:PlayAnimation(self.PlayersInfo[Eid][3].Failure)
    end
    
    local function PlayNormal()
      if self.PlayersInfo[Eid] and self.PlayersInfo[Eid][3] then
        self.PlayersInfo[Eid][3]:PlayAnimation(self.PlayersInfo[Eid][3].Normal)
      end
    end
    
    self:RemoveTimer("PlayerGetBuff_" .. Eid)
    self:AddTimer(Time, PlayNormal, false, 0, "PlayerGetBuff_" .. Eid)
  end
end

function M:OnPlayerGetDeBuff(BuffId, LastTime, Eid)
  DebugPrint("zwkkk OnPlayerGetDeBuff", BuffId, LastTime, Eid)
  if not DataMgr.PartyDebuff or not DataMgr.PartyDebuff[BuffId] then
    return
  end
  if self.PlayersInfo[Eid] and self.PlayersInfo[Eid][3] then
    self.PlayersInfo[Eid][5] = false
    self.PlayersInfo[Eid][3]:PlayAnimation(self.PlayersInfo[Eid][3].Failure)
    
    local function PlayNormal()
      if self.PlayersInfo[Eid] and self.PlayersInfo[Eid][3] then
        self.PlayersInfo[Eid][3]:PlayAnimation(self.PlayersInfo[Eid][3].Normal)
      end
    end
    
    self:RemoveTimer("PlayerGetBuff_" .. Eid)
    self:AddTimer(LastTime, PlayNormal, false, 0, "PlayerGetBuff_" .. Eid)
  end
end

function M:OnUpdatePartyRightUI(CompletionRate, Rank, TotalNum)
  if self.AlreadyFinish then
    return
  end
  if self.RemainTime ~= nil then
    return
  end
  if self.GameState and self.GameState.CurPlayerComplete then
    self.Text_MulrTempleProgressTitle:SetText(GText("UI_Evacuated"))
  else
    self.Text_MulrTempleProgressTitle:SetText(GText("UI_Party_Parkour_FinishingRate") .. " " .. self:GetCompletionRate(CompletionRate) .. "%")
  end
end

function M:OnPlayerEnterToExit(Info, bIsWaiting)
  DebugPrint("zwk OnPlayerEnterToExit ", self.GameState.ExitCountDown, self.GameState.ReplicatedTimeSeconds, Info.StartExitCountdownTime, Info.WaitingPlayerNum, bIsWaiting)
  if self.GameEnd then
    return
  end
  self.RemainTime = self.GameState.ExitCountDown - math.max(math.floor(self.GameState.ReplicatedTimeSeconds - Info.StartExitCountdownTime), 0)
  if bIsWaiting then
    self.Text_MulrTempleProgressTitle:SetText(string.format(GText("UI_PARTY_PARKOUR_ENDPOINTWAIT"), self.CompleteNum, self.AllPlayNum))
  end
  if bIsWaiting and not self.AlreadyFinish then
    self.AlreadyFinish = true
    self:PlayAnimation(self.TextRefresh)
    self.GameState:ShowDungeonToast_Lua("UI_PARTY_PARKOUR_ENDPOINTREACH", 3, EToastType.Success)
  end
  if not self.AlreadyFinish then
    self:PlayAnimation(self.TextRefresh)
    if self.RemainTime > self.MinTime then
      self.Text_MulrTempleProgressTitle:SetText(GText("UI_PARTY_PARKOUR_TEAMWAIT") .. "(" .. self:GetTimeStr(self.RemainTime) .. ")")
    else
      self.Text_MulrTempleProgressTitle:SetText(GText("UI_PARTY_PARKOUR_TEAMWAIT") .. "(" .. "<Warning>" .. self:GetTimeStr(self.RemainTime) .. "</>" .. ")")
      AudioManager(self):PlayUISound(self, "event:/ui/common/countdown_warning_short_reverb", nil, nil)
    end
  end
  if not self.FirstNotify then
    self.FirstNotify = true
    if not bIsWaiting then
      self.GameState:ShowDungeonToast_Lua("UI_PARTY_PARKOUR_ENDPOINT", 3, EToastType.Common)
    end
    self:AddTimer(1, self.UpdateRemainTime, true, 0, "UpdateRemainTime")
  end
end

function M:UpdateRemainTime()
  if self.RemainTime <= 0 then
    self.Text_MulrTempleProgressTitle:SetText(GText("UI_PARTY_PARKOUR_TEAMWAIT") .. "(" .. "<Warning>" .. self:GetTimeStr(0) .. "</>" .. ")")
    self.GameEnd = true
    self:OnGameEnd()
    return
  end
  if self.AlreadyFinish then
    return
  end
  self.RemainTime = self.RemainTime - 1
  if self.RemainTime > self.MinTime then
    self.Text_MulrTempleProgressTitle:SetText(GText("UI_PARTY_PARKOUR_TEAMWAIT") .. "(" .. self:GetTimeStr(self.RemainTime) .. ")")
  else
    self.Text_MulrTempleProgressTitle:SetText(GText("UI_PARTY_PARKOUR_TEAMWAIT") .. "(" .. "<Warning>" .. self:GetTimeStr(self.RemainTime) .. "</>" .. ")")
    AudioManager(self):PlayUISound(self, "event:/ui/common/countdown_warning_short_reverb", nil, nil)
  end
end

function M:OnOnePlayerEnd(Eid)
  self.PlayersInfo[Eid][3].Image_Done:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  local Complete = 0
  for i, v in pairs(self.PlayersInfo) do
    if v[3] and v[3].Image_Done:GetVisibility() == ESlateVisibility.SelfHitTestInvisible then
      Complete = Complete + 1
    end
  end
  self.CompleteNum = Complete
  if self.GameEnd then
    return
  end
  if self.AlreadyFinish then
    self.Text_MulrTempleProgressTitle:SetText(string.format(GText("UI_PARTY_PARKOUR_ENDPOINTWAIT"), self.CompleteNum, self.AllPlayNum))
  end
end

function M:OnPartyPlayerTriggerFallTrigger(Eid)
  DebugPrint("zwkkk OnPartyPlayerTriggerFallTrigger", Eid)
  if self.PlayersInfo[Eid] then
    self.PlayersInfo[Eid][2]:SetVisibility(ESlateVisibility.Hidden)
    self.PlayersInfo[Eid][3]:SetVisibility(ESlateVisibility.Hidden)
    self.PlayersInfo[Eid][3]:PlayAnimation(self.PlayersInfo[Eid][3].Normal)
    self.PlayersInfo[Eid][4] = true
  end
end

function M:GetCompletionRate(CompletionRate)
  if CompletionRate < 0 then
    return 0
  end
  local PercentValue = math.floor(CompletionRate * 100)
  if PercentValue > 100 then
    PercentValue = 100
  end
  return PercentValue
end

function M:OnGameEnd()
  self:RemoveDispatcher(EventID.OnPartyProgressUpdate)
  self:RemoveDispatcher(EventID.OnPartyPlayerGetBuff)
  self:RemoveDispatcher(EventID.OnUpdatePartyRightUI)
  self:RemoveDispatcher(EventID.OnPlayerEnterToExit)
  self:RemoveDispatcher(EventID.OnOnePlayerEnd)
  self:RemoveDispatcher(EventID.OnPartyPlayerTriggerFallTrigger)
  self:RemoveDispatcher(EventID.OnPlayerGetDeBuff)
  self:RemoveTimer("UpdateRemainTime")
end

function M:Destruct()
  self:RemoveTimer("UpdateProgress")
  M.Super.Destruct(self)
end

return M
