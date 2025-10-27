require("UnLua")
local M = Class({
  "BluePrints.UI.BP_UIState_C"
})

function M:Construct()
  self.GuidePoint.Button_GuidePoint.OnClicked:Add(self, self.OnClicked)
  self.GuidePoint.Button_GuidePoint.OnHovered:Add(self, self.OnHovered)
  self.GuidePoint.Button_GuidePoint.OnUnhovered:Add(self, self.OnUnhovered)
end

function M:Destruct()
  self.GuidePoint.Button_GuidePoint.OnClicked:Remove(self, self.OnClicked)
  self.GuidePoint.Button_GuidePoint.OnHovered:Remove(self, self.OnHovered)
  self.GuidePoint.Button_GuidePoint.OnUnhovered:Remove(self, self.OnUnhovered)
  self:RemoveTimer("RemainTimeTimer")
end

function M:Init(Dispatch, Owner)
  self.Owner = Owner
  self.HeadList = {}
  self.AgentList = {}
  self.InProgress_Arrow:SetVisibility(ESlateVisibility.Collapsed)
  self.ExpirationTime:SetVisibility(ESlateVisibility.Collapsed)
  self:SetState(Dispatch)
  self:InitAgent()
  self:SetTimeRemaining(Dispatch)
  self.ExpirationTime:SetVisibility(ESlateVisibility.Collapsed)
  self.AgentTips:SetVisibility(ESlateVisibility.Collapsed)
end

function M:InitMini(Id)
  self:SetTypeIcon(Id)
  self.ExpirationTime:SetVisibility(ESlateVisibility.Collapsed)
  self.AgentTips:SetVisibility(ESlateVisibility.Collapsed)
  self.InProgress_Arrow:SetVisibility(ESlateVisibility.Collapsed)
  self.ExpirationTime:SetVisibility(ESlateVisibility.Collapsed)
end

function M:SetTypeIcon(Id)
  local Type = DataMgr.Dispatch[Id].DispatchType
  if "Battle" == Type then
    local Icon = LoadObject("/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_Dispatch_Battle.T_Gp_Dispatch_Battle")
    self.GuidePoint.Img_GuidePoint_Icon:SetBrushResourceObject(Icon)
  elseif "Collect" == Type then
    local Icon = LoadObject("/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_Dispatch_Produce.T_Gp_Dispatch_Produce")
    self.GuidePoint.Img_GuidePoint_Icon:SetBrushResourceObject(Icon)
  elseif "Social" == Type then
    local Icon = LoadObject("/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_Dispatch_Social.T_Gp_Dispatch_Social")
    self.GuidePoint.Img_GuidePoint_Icon:SetBrushResourceObject(Icon)
  end
end

function M:SetState(Dispatch)
  self.Dispatch = Dispatch
  if self.Dispatch.State == CommonConst.DispatchState.Success or self.Dispatch.State == CommonConst.DispatchState.Perfect or self.Dispatch.State == CommonConst.DispatchState.Qualified or self.Dispatch.State == CommonConst.DispatchState.Disqualified then
    local Icon = LoadObject("/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_Dispatch_Complete.T_Gp_Dispatch_Complete")
    self.GuidePoint.Img_GuidePoint_Icon:SetBrushResourceObject(Icon)
    self:PlayAnimation(self.Complete)
  elseif self.Dispatch.State == CommonConst.DispatchState.Unlock then
    local Icon = LoadObject("/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_Dispatch_Lock.T_Gp_Dispatch_Lock")
    self.GuidePoint.Img_GuidePoint_Icon:SetBrushResourceObject(Icon)
  elseif self.Dispatch.State == CommonConst.DispatchState.Doing then
    if self.Dispatch.DispatchCharsList:Length() > 0 then
      self:PlayAnimation(self.Dispatch)
      self:PlayAnimation(self.Dispatch_Loop, 0, 0)
      self:SetTypeIcon(self.Dispatch.DispatchId)
    else
      self:SetTypeIcon(self.Dispatch.DispatchId)
    end
  elseif self.Dispatch.State == CommonConst.DispatchState.CanDispatch then
    self:SetTypeIcon(self.Dispatch.DispatchId)
  end
end

function M:InitAgent()
  self.WBox_MiniHead:ClearChildren()
  for i = 1, self.Dispatch.DispatchPerson do
    local Path = "/Game/UI/WBP/Map/Widget/Dispatch/WBP_Map_AgentMiniHead.WBP_Map_AgentMiniHead"
    local Head = UIManager(self):CreateWidget(Path)
    self.WBox_MiniHead:AddChildToWrapBox(Head)
  end
  if self.Dispatch.DispatchCharsList:Length() > 0 then
    local Ind = 0
    for Index, Id in pairs(self.Dispatch.DispatchCharsList) do
      local CharId = self:GetIdByUuid(CommonUtils.ObjId2Str(Id))
      local Info = DataMgr.BattleChar[CharId].GuideIconImg
      local IconPath = "/Game/UI/Texture/Dynamic/Image/Head/Mini/" .. "T_Normal_" .. Info
      local Obj = LoadObject(IconPath)
      if nil == Obj then
        Obj = LoadObject("/Game/UI/Texture/Dynamic/Image/Head/Mini/T_Normal_Mini_Heitao.T_Normal_Mini_Heitao")
      end
      local Head = self.WBox_MiniHead:GetChildAt(Ind)
      Head.Img_Avatar:SetBrushFromTexture(Obj)
      Head.Img_Avatar:SetRenderOpacity(1)
      Head.IsChoose = true
      Ind = Ind + 1
    end
  else
    for i = 1, self.Dispatch.DispatchPerson do
      local Head = self.WBox_MiniHead:GetChildAt(i - 1)
      Head.Img_Avatar:SetRenderOpacity(0)
      Head:PlayAnimation(Head.Normal)
      Head.IsChoose = false
      Head.Id = nil
      Head.IsForid = false
    end
  end
end

function M:RefreshAgent(Id)
  self.AgentTips:SetVisibility(ESlateVisibility.Visible)
  local Head, Index = self:FindFirstHead()
  if nil ~= Head then
    self:AddAgent(Id, Index - 1)
  end
  self.Agent = Agent
end

function M:OnClicked()
  self.Owner:ClosePanel(true)
  self.Owner:OnPanelOpen(5)
  self.Owner:RefreshDispatchSelect()
  self.Owner:DispatchSelectClick(self.Dispatch.DispatchId)
  self.Owner:RefreshAllDispatchPoint()
  self.Slot:SetZOrder(20)
  self:ShowMiniHead(self.Dispatch.DispatchId)
  if self.Owner.MainMap.DispatchList then
    EventManager:FireEvent(EventID.ChangeDispatchItem, self.Dispatch.DispatchId)
  end
  self.Owner.MainMap:CreateOrRefreshDispatchDetail(self.Dispatch)
  if self.Owner.MainMap.DispatchAgentList then
    self.Owner.MainMap:OpenAgentList()
  end
  self:OnItemSelect(false)
end

function M:OnItemSelect(IsPlayAni)
  if self.Dispatch.State == CommonConst.DispatchState.Doing and self.Dispatch.DispatchCharsList:Length() > 0 or self.Dispatch.State == CommonConst.DispatchState.Perfect or self.Dispatch.State == CommonConst.DispatchState.Success or self.Dispatch.State == CommonConst.DispatchState.Qualified or self.Dispatch.State == CommonConst.DispatchState.Disqualified or self.Dispatch.State == CommonConst.DispatchState.CanDispatch then
    self.AgentTips:SetVisibility(ESlateVisibility.Visible)
    if IsPlayAni then
      self:AddTimer(0.5, function()
        self:PlayAnimation(self.In)
      end)
    end
  elseif self.Dispatch.State == CommonConst.DispatchState.Unlock then
    if self.Owner.MainMap.DispatchList and self.Owner.MainMap.DispatchDetail and self.Owner.MainMap.DispatchAgentList == nil then
      self:IsShowTime(false)
    elseif self.Owner.MainMap.DispatchList == nil and self.Owner.MainMap.DispatchDetail and self.Owner.MainMap.DispatchAgentList == nil then
      self:IsShowTime(true)
    elseif self.Owner.MainMap.DispatchDetail and self.Owner.MainMap.DispatchAgentList then
      self:IsShowTime(true)
    end
  end
end

function M:AddAgent(Id, Index)
  local CharId = self:GetIdByUuid(Id)
  local Info = DataMgr.BattleChar[CharId].GuideIconImg
  local IconPath = "/Game/UI/Texture/Dynamic/Image/Head/Mini/" .. "T_Normal_" .. Info
  local Obj = LoadObject(IconPath)
  if nil == Obj then
    Obj = LoadObject("/Game/UI/Texture/Dynamic/Image/Head/Mini/T_Normal_Mini_Heitao.T_Normal_Mini_Heitao")
  end
  local Head = self.WBox_MiniHead:GetChildAt(Index)
  Head.Img_Avatar:SetBrushFromTexture(Obj)
  Head.IsChoose = true
  Head.Id = CharId
  Head:PlayAnimation(Head.Normal)
  Head:PlayAnimation(Head.Add)
  local NextHead = self:FindFirstHead()
  if NextHead and NextHead.IsChoose == false and false == NextHead.IsForid then
    NextHead:PlayAnimation(NextHead.Select)
  end
  self.HeadList[Id] = Head
end

function M:RemoveAgent(Id)
  local CharId = self:GetIdByUuid(Id)
  local Childs = self.WBox_MiniHead:GetAllChildren()
  for key, value in pairs(Childs) do
    if value.IsChoose == true and value.IsForid == false and value.Id == CharId then
      value:PlayAnimation(value.Reduce)
      value:PlayAnimation(value.Select)
      value.IsChoose = false
      value.Id = nil
    end
  end
  local Head, Index = self:FindFirstHead()
  if Head then
    for key, value in pairs(Childs) do
      if value == Head and value.IsChoose == false and value.Id == nil then
        value:StopAnimation(value.Normal)
        value:PlayAnimation(value.Select)
      else
        value:StopAnimation(value.Select)
        value:PlayAnimation(value.Normal)
      end
    end
  end
end

function M:GetIdByUuid(Uuid)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  for _, Char in pairs(Avatar.Chars) do
    if CommonUtils.ObjId2Str(Char.Uuid) == Uuid then
      return Char.CharId
    end
  end
end

function M:SetTimeRemaining(Dispatch)
  self.Time.Text_TimeTitle:SetVisibility(ESlateVisibility.Collapsed)
  self.Time.Image_ClockIcon:SetVisibility(ESlateVisibility.Collapsed)
  self.Text_ExpirationTime:SetText(GText("UI_Disptach_State_Vanish"))
  
  local function RemainTime()
    local StartTime = Dispatch.RegisterTime
    local EndTime = StartTime + Dispatch.Ttk * 60
    local RemainTimeDict, TimeCount = UIUtils.GetLeftTimeStrStyle2(EndTime)
    self.Time:SetTimeText(GText("UI_Disptach_State_Vanish"), RemainTimeDict)
  end
  
  RemainTime()
  self:AddTimer(1, RemainTime, true, 0, "RemainTimeTimer")
end

function M:StartDispatch(Dispatch)
  self.Dispatch = Dispatch
  self:InitAgent()
  self:PlayAnimation(self.Dispatch)
  self:PlayAnimation(self.Dispatch_Loop, 0, 0)
end

function M:RefreshPoint()
  self.AgentTips:SetVisibility(ESlateVisibility.Collapsed)
  self:RefreshMiniHead()
  self.ExpirationTime:SetVisibility(ESlateVisibility.Collapsed)
  self.Slot:SetZOrder(0)
end

function M:RefreshMiniHead()
  if self.Dispatch.State == CommonConst.DispatchState.CanDispatch then
    local Childs = self.WBox_MiniHead:GetAllChildren()
    for key, value in pairs(Childs) do
      value.Img_Avatar:SetRenderOpacity(0)
      value.IsChoose = false
      value.Id = nil
    end
  end
end

function M:RefreshSinglePoint()
  self:InitAgent()
  self.ExpirationTime:SetVisibility(ESlateVisibility.Collapsed)
  self.Slot:SetZOrder(0)
end

function M:OnHovered()
  self.Owner:DispatchSelectHover(self.Dispatch.DispatchId)
end

function M:OnUnhovered()
  self.Owner:DispatchSelectUnHover(self.Dispatch.DispatchId)
end

function M:FindFirstHead()
  local Childs = self.WBox_MiniHead:GetAllChildren()
  for key, value in pairs(Childs) do
    if value.IsChoose == false and false == value.IsForid then
      return value, key
    end
  end
  return nil
end

function M:PlaySelectAnimation()
  if self.Dispatch.State == CommonConst.DispatchState.CanDispatch then
    local Head, Index = self:FindFirstHead()
    Head:PlayAnimation(Head.Select)
  end
end

function M:ShowMiniHead(Id)
  if self.Dispatch.State == CommonConst.DispatchState.Doing and self.Dispatch.DispatchCharsList:Length() <= 0 then
    self.AgentTips:SetVisibility(ESlateVisibility.Collapsed)
    self:IsShowTime(false)
    return
  end
  if self.Dispatch.State == CommonConst.DispatchState.Doing and self.Dispatch.DispatchCharsList:Length() > 0 then
    self.AgentTips:SetVisibility(ESlateVisibility.Visible)
    if Id == self.Dispatch.DispatchId then
      self:PlayAnimation(self.In_Arrow)
    else
      local Scale = self.AgentTips.RenderTransform.Scale
      if 1 == Scale.X then
        self:PlayAnimation(self.Out_Click)
      else
        self:PlayAnimation(self.Normal)
      end
    end
  elseif self.Dispatch.State == CommonConst.DispatchState.Perfect or self.Dispatch.State == CommonConst.DispatchState.Success or self.Dispatch.State == CommonConst.DispatchState.Qualified or self.Dispatch.State == CommonConst.DispatchState.Disqualified then
    self.AgentTips:SetVisibility(ESlateVisibility.Visible)
    if Id == self.Dispatch.DispatchId then
      self:PlayAnimation(self.In)
      AudioManager(self):PlayUISound(self, "event:/ui/common/dispatch_flag_show", "", nil)
    else
      local Scale = self.AgentTips.RenderTransform.Scale
      if 1 == Scale.X then
        self:PlayAnimation(self.Out_Click)
      else
        self:PlayAnimation(self.Normal)
      end
    end
  elseif self.Dispatch.State == CommonConst.DispatchState.Unlock then
    self:IsShowTime(false)
    if Id == self.Dispatch.DispatchId then
      if self.Owner.MainMap.DispatchAgentList then
        self:IsShowTime(true)
      else
        self:IsShowTime(false)
      end
    end
  elseif self.Dispatch.State == CommonConst.DispatchState.CanDispatch then
    self.AgentTips:SetVisibility(ESlateVisibility.Collapsed)
    self:IsShowTime(false)
    if Id == self.Dispatch.DispatchId then
      self.AgentTips:SetVisibility(ESlateVisibility.Visible)
      self:StopAnimation(self.Out_Click)
      self:PlayAnimation(self.In)
      AudioManager(self):PlayUISound(self, "event:/ui/common/dispatch_flag_show", "", nil)
      if self.Owner.MainMap.DispatchAgentList then
        self:IsShowTime(true)
      else
        self:IsShowTime(false)
      end
    else
      local Scale = self.AgentTips.RenderTransform.Scale
      if 1 == Scale.X then
        self:PlayAnimation(self.Out_Click)
      else
        self:PlayAnimation(self.Normal)
      end
    end
  end
end

function M:IsShowTime(IsShow)
  if IsShow then
    self.ExpirationTime:SetVisibility(ESlateVisibility.Visible)
  else
    self.ExpirationTime:SetVisibility(ESlateVisibility.Collapsed)
  end
end

return M
