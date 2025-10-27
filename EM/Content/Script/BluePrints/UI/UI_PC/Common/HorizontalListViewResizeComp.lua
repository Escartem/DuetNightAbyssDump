local Component = {}

function Component:HorizontalListViewResize_TearDown()
  EventManager:RemoveEvent(EventID.GameViewportSizeChanged, self)
  self._ItemWidth = nil
  if self._OriginWidth then
    self.WidgetSlot:SetSize(FVector2D(self._OriginWidth, self.WidgetSlot:GetSize().Y))
  end
end

function Component:HorizontalListViewResize_SetUp(Widget, ListViewBase, XAnchor)
  if not Widget or not ListViewBase then
    return
  end
  self.WidgetSlot = UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(Widget)
  if not self.WidgetSlot then
    DebugPrint(ErrorTag, LXYTag, "HorizontalListViewResizeComp: \228\188\160\229\133\165\231\154\132Widget\230\143\146\230\167\189\228\184\141\230\152\175CanvasSlot")
    return
  end
  self._StardardVPWidth = UIConst.DPIBaseOnSize[CommonUtils.GetDeviceTypeByPlatformName(self)].X
  XAnchor = math.clamp(XAnchor, 0, 1)
  local Position = self.WidgetSlot:GetPosition()
  local Anchors = self.WidgetSlot:GetAnchors()
  local Offsets = self.WidgetSlot:GetOffsets()
  local SizeX = self._StardardVPWidth - Offsets.Right - Offsets.Left
  local bUseSize = true
  local Aligment = self.WidgetSlot:GetAlignment()
  if Anchors.Minimum.X == Anchors.Maximum.X then
    SizeX = self.WidgetSlot:GetSize().X
    bUseSize = false
  else
    Aligment.X = 0
  end
  Anchors.Minimum.X = XAnchor
  Anchors.Maximum.X = XAnchor
  self.WidgetSlot:SetAnchors(Anchors)
  Position.X = Position.X + (SizeX - self._StardardVPWidth) * (XAnchor - Aligment.X)
  Aligment.X = XAnchor
  self.WidgetSlot:SetAlignment(Aligment)
  self.WidgetSlot:SetPosition(Position)
  self.ListViewBase = ListViewBase
  self:HorizontalListViewResize_TearDown()
  self._OriginWidth = self.WidgetSlot:GetSize().X
  if bUseSize then
    self._OriginWidth = SizeX
  end
  EventManager:AddEvent(EventID.GameViewportSizeChanged, self, self._OnViewPortSizeChanged)
  self:_OnViewPortSizeChanged()
end

function Component:_CalcListItemWidth()
  local ItemWidth = 0
  if self.ListViewBase:IsA(UTileView) then
    local TileView = self.ListViewBase
    ItemWidth = TileView:GetEntryWidth()
  elseif self.ListViewBase:IsA(UListView) then
    local ListView = self.ListViewBase
    if ListView.Orientation ~= EOrientation.Orient_Horizontal then
      DebugPrint(WarningTag, LXYTag, "HorizontalListViewResizeComp: ListView is not horizontal")
      return
    end
    local ItemUIs = ListView:GetDisplayedEntryWidgets()
    if 0 == ItemUIs:Length() then
      DebugPrint(WarningTag, LXYTag, "UIUtils.GetListViewContentMaxCount\239\188\154ListView\229\191\133\233\161\187\229\133\136\231\148\159\230\136\144\228\184\128\228\184\170ItemUI\230\137\141\232\131\189\229\135\134\231\161\174\232\174\161\231\174\151\228\184\170\230\149\176")
      return
    end
    local ItemSize = UIManager(self):GetWidgetRenderSize(ItemUIs:GetRef(1).WidgetTree.RootWidget)
    ItemWidth = ItemSize.X
  end
  return ItemWidth
end

function Component:_OnViewPortSizeChanged()
  local NewViewportScale = UWidgetLayoutLibrary.GetViewportScale(self)
  local NewViewportSizeX = UWidgetLayoutLibrary.GetViewportSize(self).X / NewViewportScale
  if CommonUtils.GetDeviceTypeByPlatformName(self) == "Mobile" then
    local SafeZonePadding = 0
    if self.MainSafeZone and self.MainSafeZone.GetSafeMargin then
      local Margin = self.MainSafeZone:GetSafeMargin()
      SafeZonePadding = Margin.Left + Margin.Right
    end
    NewViewportSizeX = NewViewportSizeX - SafeZonePadding
  end
  local DiffWidth = NewViewportSizeX - self._StardardVPWidth
  if not self._ItemWidth then
    self._ItemWidth = self:_CalcListItemWidth()
  end
  local PadCount = math.floor(DiffWidth / self._ItemWidth + 0.5)
  local RealDiffWidth = PadCount * self._ItemWidth
  local WidgetSize = self.WidgetSlot:GetSize()
  local NewWidgetSize = FVector2D(self._OriginWidth + RealDiffWidth, WidgetSize.Y)
  self.WidgetSlot:SetSize(NewWidgetSize)
  if self.OnHorizontalListViewResizeDone then
    self:OnHorizontalListViewResizeDone(NewViewportSizeX, NewWidgetSize.X)
  end
end

return Component
