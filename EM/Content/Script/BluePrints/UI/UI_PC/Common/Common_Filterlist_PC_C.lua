require("UnLua")
local M = Class("BluePrints.UI.BP_UIState_C")

function M:Init(Filters1, Filters2, Filters3, SortType)
  self.CurSortType = SortType or CommonConst.DESC
  self.Filters = {}
  self.IsListViewOpened = {
    [1] = false,
    [2] = false
  }
  self.SelectedItems = {
    [1] = {},
    [2] = {},
    [3] = {}
  }
  self.IsListInAnimPlaying = {}
  self.IsListOutAnimPlaying = {}
  self.FilterInAnims = {
    self.List01_In,
    self.List02_In,
    self.List03_In
  }
  self.FilterOutAnims = {
    self.List01_Out,
    self.List02_Out,
    self.List03_Out
  }
  self.FilterListBGs = {
    self.Filter_List01,
    self.Filter_List02,
    self.Filter_List03
  }
  self.FilterBtns = {
    self.Btn_Filter_List01,
    self.Btn_Filter_List02
  }
  self.ListViews = {
    self.List01,
    self.List02,
    self.List03
  }
  self.FilterListBGs[1]:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.FilterListBGs[2]:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.ListViews[1]:ClearListItems()
  if Filters1 and #Filters1 > 0 then
    self.Filters[1] = Filters1
    self.Text_Filterlist1:SetText(GText(Filters1[1]))
    local Obj = NewObject(self.FilterItemContentClass)
    Obj.Text = Filters1[1]
    Obj.IsSelected = true
    Obj.Mode = "Single"
    Obj.Index = 1
    self.SelectedItems[1] = Obj
    self.ListViews[1]:AddItem(Obj)
    for i = 2, #Filters1 do
      Obj = NewObject(self.FilterItemContentClass)
      Obj.Text = Filters1[i]
      Obj.Mode = "Single"
      Obj.Index = i
      self.ListViews[1]:AddItem(Obj)
    end
    self.FilterBtns[1]:SetVisibility(UIConst.VisibilityOp.Visible)
  else
    self.FilterBtns[1]:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  self.ListViews[2]:ClearListItems()
  if Filters2 and #Filters2 > 0 then
    self.Filters[2] = Filters2
    for i, value in ipairs(Filters2) do
      local Obj = NewObject(self.FilterItemContentClass)
      Obj.Text = value
      Obj.Mode = "Multi"
      Obj.IsSelected = false
      Obj.Index = i
      self.ListViews[2]:AddItem(Obj)
    end
    self.FilterBtns[2]:SetVisibility(UIConst.VisibilityOp.Visible)
  else
    self.FilterBtns[2]:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  self.ListViews[3]:ClearListItems()
  if Filters3 and #Filters3 > 0 then
    self.Filters[3] = Filters3
    local Obj = NewObject(self.FilterItemContentClass)
    Obj.Text = Filters3[1].TextMapId
    Obj.IsSelected = true
    Obj.Mode = "Single"
    Obj.Index = 1
    Obj.Icon = Filters3[1].Icon
    self.SelectedItems[3] = Obj
    self.ListViews[3]:AddItem(Obj)
    for i = 2, #Filters3 do
      Obj = NewObject(self.FilterItemContentClass)
      Obj.Text = Filters3[i].TextMapId
      Obj.Mode = "Single"
      Obj.IsSelected = false
      Obj.Index = i
      Obj.Icon = Filters3[i].Icon
      self.ListViews[3]:AddItem(Obj)
    end
    self.FilterListBGs[3]:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  else
    self.FilterListBGs[3]:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  self:UpdateFilterInfos()
  self.Text_Border_Properties:SetText("")
  self.Border_Properties:SetVisibility(UIConst.VisibilityOp.Collapsed)
  if self.CurSortType == CommonConst.ASC then
    self.CanvasPanel_SortType:SetRenderTransformAngle(0)
  else
    self.CanvasPanel_SortType:SetRenderTransformAngle(180)
  end
end

function M:BindEventOnSelectionsChanged(Obj, Event)
  self.Obj_OnSelectionsChanged = Obj
  self.Event_OnSelectionsChanged = Event
end

function M:BindEventOnSortTypeChanged(Obj, Event)
  self.Obj_OnSortTypeChanged = Obj
  self.Event_OnSortTypeChanged = Event
end

function M:GetFilterInfos()
  return self.Filter1Res, self.Filter2Res, self.Filter3Res, self.CurSortType
end

function M:UpdateFilterInfos()
  local Filter2HintText = ""
  local Indexes2 = {}
  local bHasItem = next(self.SelectedItems[2]) ~= nil
  local Items = self.ListViews[2]:GetListItems()
  local Len = Items:Length()
  if bHasItem then
    for i = 1, Len do
      if self.SelectedItems[2][Items[i].Text] then
        Filter2HintText = Filter2HintText .. GText(Items[i].Text) .. ", "
        table.insert(Indexes2, Items[i].Index)
      end
    end
    Filter2HintText = string.sub(Filter2HintText, 1, #Filter2HintText - 2)
  else
    for i = 1, Len do
      table.insert(Indexes2, Items[i].Index)
    end
  end
  if bHasItem then
    self.IconFiltered = self.IconFiltered or LoadObject("/Game/UI/Texture/Dynamic/Atlas/Armory/T_Armory_Filter02.T_Armory_Filter02")
    self.Image_Filter2:SetBrushResourceObject(self.IconFiltered)
  else
    self.IconUnFiltered = self.IconUnFiltered or LoadObject("/Game/UI/Texture/Dynamic/Atlas/Armory/T_Armory_Filter.T_Armory_Filter")
    self.Image_Filter2:SetBrushResourceObject(self.IconUnFiltered)
  end
  self.Filter1Res = self.SelectedItems[1].Index
  self.Filter2Res = Indexes2
  self.Filter3Res = self.SelectedItems[3].Index
  return self.Filter1Res, self.Filter2Res, self.Filter3Res, self.CurSortType, Filter2HintText
end

function M:Construct()
  self:AddDispatcher(EventID.OnMenuClose, self, self.OnFilterListsClosed)
end

function M:ListOpenBtnClicked(Idx)
  UIUtils.PlayCommonBtnSe(self)
  if self.Filters[Idx] then
    if self.IsListViewOpened[Idx] then
      self:PlayListOutnAnim(Idx)
      self.IsListViewOpened[Idx] = false
    else
      self.Border_Properties:SetVisibility(UIConst.VisibilityOp.Collapsed)
      self:PlayListInAnim(Idx)
      self.IsListViewOpened[Idx] = true
      local AnotherIdx = Idx % 2 + 1
      if self.IsListViewOpened[AnotherIdx] then
        self:PlayListOutnAnim(AnotherIdx)
        self.IsListViewOpened[AnotherIdx] = false
      end
    end
  else
    self.FilterListBGs[Idx]:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

function M:PlayListInAnim(Idx)
  self:StopListOutAnim(Idx)
  self.IsListInAnimPlaying[Idx] = true
  
  local function WarpFunc()
    self.FilterListBGs[Idx]:SetRenderOpacity(1)
    self:StopAnimation(self.FilterOutAnims[Idx])
    self:PlayAnimation(self.FilterInAnims[Idx])
    local Entrys = self.ListViews[Idx]:GetDisplayedEntryWidgets()
    local Len = Entrys:Length()
    local TotalTime = 0
    for i = Len, 1, -1 do
      local function func()
        Entrys[i]:SetRenderOpacity(1)
        
        Entrys[i]:PlayInAnim()
      end
      
      Entrys[i]:SetRenderOpacity(0)
      TotalTime = TotalTime + 0.02
      self:AddTimer(TotalTime, func, false, 0, "List" .. Idx .. "EntryInAnim" .. i)
    end
    local EndTime = self.FilterInAnims[Idx]:GetEndTime()
    TotalTime = math.max(EndTime, TotalTime)
    if TotalTime > 0 then
      TotalTime = TotalTime + Entrys[1]:GetInAnimTime()
      
      local function EndListInAnimPlaying()
        self.IsListInAnimPlaying[Idx] = false
      end
      
      self:AddTimer(TotalTime, EndListInAnimPlaying, false, 0, "List" .. Idx .. "InAnimPlaying")
    else
      self.IsListInAnimPlaying[Idx] = false
    end
  end
  
  self:AddTimer(0.01, WarpFunc, false, 0, "List" .. Idx .. "_In")
  self.FilterListBGs[Idx]:SetRenderOpacity(0)
  self.FilterListBGs[Idx]:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
end

function M:StopListInAnim(Idx)
  self:RemoveTimer("List" .. Idx .. "_In")
  self:RemoveTimer("List" .. Idx .. "InAnimPlaying")
  local Entrys = self.ListViews[Idx]:GetDisplayedEntryWidgets()
  local Len = Entrys:Length()
  for i = Len, 1, -1 do
    self:RemoveTimer("List" .. Idx .. "EntryInAnim" .. i)
  end
end

function M:PlayListOutnAnim(Idx)
  self:StopListInAnim(Idx)
  self.IsListOutAnimPlaying[Idx] = true
  local Entrys = self.ListViews[Idx]:GetDisplayedEntryWidgets()
  local Len = Entrys:Length()
  if Len <= 0 then
    self.IsListOutAnimPlaying[Idx] = false
    self.FilterListBGs[Idx]:SetVisibility(UIConst.VisibilityOp.Collapsed)
    return
  end
  local TotalTime = 0.01
  TotalTime = TotalTime + Entrys[1]:GetOutAnimTime()
  if self.FilterOutAnims[Idx] then
    local EndTime = self.FilterOutAnims[Idx]:GetEndTime()
    local TimeToPlayFilterOutAnim = TotalTime - EndTime
    if TimeToPlayFilterOutAnim > 0 then
      local function func()
        self:StopAnimation(self.FilterInAnims[Idx])
        
        self:PlayAnimation(self.FilterOutAnims[Idx])
      end
      
      self:AddTimer(TimeToPlayFilterOutAnim, func, false, 0, "ListBG_OutAnim" .. Idx)
    else
      self:PlayAnimation(self.FilterOutAnims[Idx])
      TotalTime = EndTime
    end
  end
  
  local function ListOutAnimPlayEnd()
    self.IsListOutAnimPlaying[Idx] = false
    self.FilterListBGs[Idx]:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  
  self:AddTimer(TotalTime, ListOutAnimPlayEnd, false, 0, "List" .. Idx .. "OutAnimPlaying")
end

function M:StopListOutAnim(Idx)
  self:RemoveTimer("List" .. Idx .. "OutAnimPlaying")
  self:RemoveTimer("ListBG_OutAnim" .. Idx)
  local Entrys = self.ListViews[Idx]:GetDisplayedEntryWidgets()
  local Len = Entrys:Length()
  for i = 1, Len do
    self:AddTimer("List" .. Idx .. "EntryOutAnim" .. i)
  end
end

function M:OnListItemClicked(ListIndex, Content)
  if self.IsListOutAnimPlaying[ListIndex] then
    return
  end
  if 1 == ListIndex then
    Content.IsSelected = true
    Content.Entry:OnEntryClicked()
    self:ListOpenBtnClicked(1)
    if self.SelectedItems[1] ~= Content then
      self.SelectedItems[1].IsSelected = false
      self.SelectedItems[1].Entry:OnEntrySelectionChanged()
      Content.Entry:OnEntrySelectionChanged()
      self.SelectedItems[1] = Content
    else
      return
    end
  elseif 2 == ListIndex then
    Content.IsSelected = not Content.IsSelected
    Content.Entry:OnEntryClicked()
    Content.Entry:OnEntrySelectionChanged()
    if Content.IsSelected then
      self.SelectedItems[2][Content.Text] = Content
    else
      self.SelectedItems[2][Content.Text] = nil
    end
  elseif 3 == ListIndex then
    Content.IsSelected = true
    Content.Entry:OnEntryClicked()
    Content.Entry:OnEntrySelectionChanged()
    if self.SelectedItems[3] ~= Content then
      self.SelectedItems[3].IsSelected = false
      self.SelectedItems[3].Entry:OnEntrySelectionChanged()
      Content.Entry:OnEntrySelectionChanged()
      self.SelectedItems[3] = Content
    else
      return
    end
  end
  local Filter1, Filter2, Filter3, SortType, Filter2HintText = self:UpdateFilterInfos()
  self.Text_Filterlist1:SetText(GText(self.SelectedItems[1].Text))
  self.Text_Border_Properties:SetText(Filter2HintText)
  if self.Event_OnSelectionsChanged then
    self.Event_OnSelectionsChanged(self.Obj_OnSelectionsChanged, Filter1, Filter2, Filter3, SortType)
  end
end

function M:OnListItemHoveredChanged(ListIndex, Content, IsHover)
  Content.Entry:OnEntryHoveredChanged(IsHover)
end

function M:Btn_Filter_List02_Hovered()
  if self.IsListViewOpened[2] then
    return
  end
  if self.Text_Border_Properties:GetText() ~= "" then
    self:StopAnimation(self.Hower_Out)
    self:PlayAnimation(self.Hower_In)
    self.Border_Properties:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  end
end

function M:Btn_Filter_List02_Unhovered()
  if self.IsListViewOpened[2] then
    return
  end
  if self.Text_Border_Properties:GetText() ~= "" then
    self:StopAnimation(self.Hower_In)
    self:PlayAnimation(self.Hower_Out)
  end
end

function M:OnSortTypeButtonClicked()
  if self.CurSortType == CommonConst.ASC then
    self.CurSortType = CommonConst.DESC
    self.CanvasPanel_SortType:SetRenderTransformAngle(180)
  else
    self.CurSortType = CommonConst.ASC
    self.CanvasPanel_SortType:SetRenderTransformAngle(0)
  end
  if self.Event_OnSortTypeChanged then
    self.Event_OnSortTypeChanged(self.Obj_OnSortTypeChanged, self.CurSortType)
  end
end

function M:OnFilterListsClosed()
  for Idx, value in pairs(self.IsListViewOpened) do
    if self.Filters[Idx] then
      if self.IsListViewOpened[Idx] then
        self:PlayListOutnAnim(Idx)
        self.IsListViewOpened[Idx] = false
      end
    else
      self.FilterListBGs[Idx]:SetVisibility(UIConst.VisibilityOp.Collapsed)
    end
  end
end

return M
