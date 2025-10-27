local EMCache = require("EMCache.EMCache")
local WBP_Rouge_FilterSort_C = Class("BluePrints.UI.BP_UIState_C")

function WBP_Rouge_FilterSort_C:Construct()
  self.RomanNum = {
    "\226\133\160",
    "\226\133\161",
    "\226\133\162",
    "\226\133\163",
    "\226\133\164",
    "\226\133\165",
    "\226\133\166",
    "\226\133\167",
    "\226\133\168",
    "\226\133\169",
    "\226\133\170",
    "\226\133\171"
  }
  self.Btn_Filter_List.OnClicked:Add(self, self.ListOpenBtnClicked)
  self.Btn_Filter_List.OnPressed:Add(self, self.OnBtn_Filter_List_Pressed)
  self.Btn_Filter_List.OnHovered:Add(self, self.OnBtn_Filter_List_Hovered)
  self.Btn_Filter_List.OnUnhovered:Add(self, self.OnBtn_Filter_List_Unhovered)
end

function WBP_Rouge_FilterSort_C:ChangeSelectedItem(Index)
  self.SelectedItem.IsSelected = false
  self.SelectedItem = self.List:GetItemAt(Index)
  self.SelectedItem.IsSelected = true
  self.Text_Filterlist:SetText(self.SelectedItem.Text)
end

function WBP_Rouge_FilterSort_C:SetUnLockTable(UnLockedDifficulty, DifficultyLevel)
  self.UnLockedDifficulty = UnLockedDifficulty
  self.DifficultyLevel = DifficultyLevel
end

function WBP_Rouge_FilterSort_C:OnListItemClicked(Content)
  if self.IsListOutAnimPlaying then
    return
  end
  Content.IsSelected = true
  if self.SelectedItem ~= Content then
    self.SelectedItem.IsSelected = false
    self.SelectedItem.Entry:OnEntrySelectionChanged()
    self.SelectedItem = Content
  end
  self.Text_Filterlist:SetText(self.SelectedItem.Text)
  self:OnListClosed()
end

function WBP_Rouge_FilterSort_C:SwitchClose()
  self.IsListViewOpened = false
  self.Filter_List:SetVisibility(UIConst.VisibilityOp.Collapsed)
end

function WBP_Rouge_FilterSort_C:SetFirstSelectedItem()
  local RougeLikeDifficulty = EMCache:Get("RougeLikeDifficulty", true)
  for Index, DifficultyId in pairs(self.UnLockedDifficulty) do
    if DifficultyId == RougeLikeDifficulty then
      self:ChangeSelectedItem(Index - 1)
      return
    end
  end
end

function WBP_Rouge_FilterSort_C:ListOpenBtnClicked()
  self:PlayAnimation(self.Click)
  self.Filter_List:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  AudioManager(self):PlayUISound(self, "event:/ui/roguelike/difficulty_click", nil, nil)
  if self.SortBy_List then
    if self.IsListViewOpened then
      self:PlayListOutnAnim()
      self.IsListViewOpened = false
    else
      self:PlayListInAnim()
      self.IsListViewOpened = true
    end
  else
    self.Filter_List:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

function WBP_Rouge_FilterSort_C:Init(SortBy_List, SortType)
  self.CurSortType = SortType or CommonConst.DESC
  self.SortBy_List = SortBy_List or {}
  self.IsListViewOpened = false
  self.SelectedItem = nil
  self.IsListInAnimPlaying = false
  self.IsListOutAnimPlaying = false
  self.Filter_List:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.List:ClearListItems()
  self.Text_Filterlist:SetText("")
  if SortBy_List and #SortBy_List > 0 then
    self.Text_Filterlist:SetText(GText(SortBy_List[1]))
    local Obj = NewObject(UIUtils.GetCommonItemContentClass())
    Obj.Text = GText(SortBy_List[1])
    Obj.IsSelected = true
    Obj.Mode = "Single"
    Obj.Index = 1
    Obj.Owner = self
    self.SelectedItem = Obj
    self.List:AddItem(Obj)
    for i = 2, #SortBy_List do
      Obj = NewObject(UIUtils.GetCommonItemContentClass())
      Obj.Text = GText(SortBy_List[i])
      Obj.Mode = "Single"
      Obj.Index = i
      Obj.Owner = self
      Obj.IsSelected = false
      self.List:AddItem(Obj)
    end
    self.Btn_Filter_List:SetVisibility(UIConst.VisibilityOp.Visible)
  else
    self.Btn_Filter_List:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  if self.CurSortType == CommonConst.ASC then
    self.Sort_Type:SetRenderTransformAngle(0)
  else
    self.Sort_Type:SetRenderTransformAngle(180)
  end
end

function WBP_Rouge_FilterSort_C:OnBtn_Filter_List_Pressed()
  self:StopAnimation(self.Hover)
  self:PlayAnimation(self.Press)
end

function WBP_Rouge_FilterSort_C:OnBtn_Filter_List_Hovered()
  self:StopAnimation(self.Normal)
  self:PlayAnimation(self.Hover)
end

function WBP_Rouge_FilterSort_C:OnBtn_Filter_List_Unhovered()
  self:StopAnimation(self.Hover)
  self:PlayAnimation(self.Normal)
end

function WBP_Rouge_FilterSort_C:OnBtn_SortType_Hovered()
  self:PlayAnimation(self.Hover_Btn)
end

function WBP_Rouge_FilterSort_C:OnBtn_SortType_Unhovered()
  self:PlayAnimationReverse(self.Hover_Btn)
end

function WBP_Rouge_FilterSort_C:PlayListInAnim()
  self:StopListOutAnim()
  self.IsListInAnimPlaying = true
  
  local function WarpFunc()
    self.Filter_List:SetRenderOpacity(1)
    self:StopAnimation(self.List_Out)
    self:PlayAnimation(self.List_In)
    local Entrys = self.List:GetDisplayedEntryWidgets()
    local Len = Entrys:Length()
    local TotalTime = 0
    for i = Len, 1, -1 do
      local function func()
        Entrys[i]:SetRenderOpacity(1)
        
        Entrys[i]:PlayInAnim()
      end
      
      Entrys[i]:SetRenderOpacity(0)
      TotalTime = TotalTime + 0.02
      self:AddTimer(TotalTime, func, false, 0, "ListEntryInAnim" .. i)
    end
    local EndTime = self.List_In:GetEndTime()
    TotalTime = math.max(EndTime, TotalTime)
    if TotalTime > 0 then
      TotalTime = TotalTime + Entrys[1]:GetInAnimTime()
      
      local function EndListInAnimPlaying()
        self.IsListInAnimPlaying = false
      end
      
      self:AddTimer(TotalTime, EndListInAnimPlaying, false, 0, "ListInAnimPlaying")
    else
      self.IsListInAnimPlaying = false
    end
  end
  
  self:AddTimer(0.01, WarpFunc, false, 0, "List_In")
  self.Filter_List:SetRenderOpacity(0)
  self.Filter_List:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
end

function WBP_Rouge_FilterSort_C:StopListInAnim()
  self:RemoveTimer("List_In")
  self:RemoveTimer("ListInAnimPlaying")
  local Entrys = self.List:GetDisplayedEntryWidgets()
  local Len = Entrys:Length()
  for i = Len, 1, -1 do
    self:RemoveTimer("ListEntryInAnim" .. i)
  end
end

function WBP_Rouge_FilterSort_C:PlayListOutnAnim()
  self:StopListInAnim()
  self.IsListOutAnimPlaying = true
  local Entrys = self.List:GetDisplayedEntryWidgets()
  local Len = Entrys:Length()
  if Len <= 0 then
    self.IsListOutAnimPlaying = false
    self.Filter_List:SetVisibility(UIConst.VisibilityOp.Collapsed)
    return
  end
  local TotalTime = 0.01
  TotalTime = TotalTime + Entrys[1]:GetOutAnimTime()
  if self.List_Out then
    local EndTime = self.List_Out:GetEndTime()
    local TimeToPlayFilterOutAnim = TotalTime - EndTime
    if TimeToPlayFilterOutAnim > 0 then
      local function func()
        self:StopAnimation(self.List_In)
        
        self:PlayAnimation(self.List_Out)
      end
      
      self:AddTimer(TimeToPlayFilterOutAnim, func, false, 0, "ListBG_OutAnim")
    else
      self:PlayAnimation(self.List_Out)
      TotalTime = EndTime
    end
  end
  
  local function ListOutAnimPlayEnd()
    self.IsListOutAnimPlaying = false
    self.Filter_List:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  
  self:AddTimer(TotalTime, ListOutAnimPlayEnd, false, 0, "ListOutAnimPlaying")
end

function WBP_Rouge_FilterSort_C:StopListOutAnim()
  self:RemoveTimer("ListOutAnimPlaying")
  self:RemoveTimer("ListBG_OutAnim")
  local Entrys = self.List:GetDisplayedEntryWidgets()
  local Len = Entrys:Length()
  for i = 1, Len do
    self:AddTimer("ListEntryOutAnim" .. i)
  end
end

function WBP_Rouge_FilterSort_C:OnListClosed()
  if self.SortBy_List then
    if self.IsListViewOpened then
      self:PlayListOutnAnim()
      self.IsListViewOpened = false
    end
  else
    self.Filter_List:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

function WBP_Rouge_FilterSort_C:GetSortInfos()
  if self.SelectedItem and self.SelectedItem.Index then
    return self.SelectedItem.Index
  else
    return nil
  end
end

return WBP_Rouge_FilterSort_C
