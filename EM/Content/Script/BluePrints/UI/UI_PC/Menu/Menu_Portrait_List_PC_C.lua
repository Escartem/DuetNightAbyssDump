require("UnLua")
local uiconst = require("BluePrints.UI.UIConst")
local Menu_Portrait_List_PC_C = Class({
  "BluePrints.UI.UI_PC.Common.Common_Dialog.Common_Dialog_ContentBase"
})

function Menu_Portrait_List_PC_C:Initialize(Initializer)
  self.Super.Initialize(self)
  self.CurPortraitPath = nil
end

function Menu_Portrait_List_PC_C:InitContent(Params, PopupData, Owner)
  self:BindDialogEvent(DialogEvent.OnTitleTabSelected, self.OnTabSelected)
  self.BtnText.AudioEventPath = "event:/ui/common/click_btn_confirm"
  self.BtnText.Button_Area.OnClicked:Add(self, self.ConfirmChange)
  self.IsHeadFrame = false
  self.BtnText:SetText(GText("UI_HeadFrame_Change"))
  self.Text_Btn:SetText(GText("UI_HeadFrame_Wearing"))
  self:SetCurPortrait()
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    self.Text_Tips:SetText(string.format(GText("UI_HeadFrame_Own"), self:GetCount(Avatar.HeadIconList)))
  end
  self.Text_Empty:SetText(GText("UI_HeadFrame_None"))
  self:PlayAnimation(self.In)
  self:InitPortrait()
  self.List_Item:SetFocus()
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
  if Params.TabConfigData.FreshCallback ~= nil then
    self._FreshCallback = Params.TabConfigData.FreshCallback
  end
  local GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(self)
  if IsValid(GameInputModeSubsystem) then
    GameInputModeSubsystem.OnInputMethodChanged:Add(self, self.RefreshOpInfoByInputDevice)
  end
end

function Menu_Portrait_List_PC_C:GetCount(Table)
  local Count = 0
  if not Table then
    return Count
  end
  for index, value in pairs(Table) do
    Count = Count + 1
  end
  return Count
end

function Menu_Portrait_List_PC_C:OnTabSelected(TabWidget)
  self.IsHeadFrame = 2 == TabWidget.Idx
  self:Refresh()
  self:SetCurPortrait()
end

function Menu_Portrait_List_PC_C:Refresh()
  if self.IsHeadFrame then
    if not self.FilledHeadFrame then
      local NumCount = self.List_Item_Frame:GetNumItems()
      self:FillEmpty(self.List_Item_Frame, NumCount)
      self.FilledHeadFrame = true
    end
    self.WidgetSwitcher_List:SetActiveWidgetIndex(1)
    self.List_Item_Frame:SetFocus()
    local AllItemCount = self.List_Item_Frame:GetNumItems()
    if 1 == AllItemCount then
      self.List_Item_Frame:SetIsShowNavigateGuide(false)
    else
      self.List_Item_Frame:SetIsShowNavigateGuide(true)
    end
    self.List_Item_Frame:SetFocus()
    self.GameInputModeSubsystem:UpdateCurrentFocusWidgetPos()
    for i = 0, AllItemCount - 1 do
      local Item = self.List_Item_Frame:GetItemAt(i)
      if Item.PortraitId == self.HeadFrameId then
        self.List_Item_Frame:ScrollIndexIntoView(i)
        self:AddTimer(0.1, function()
          if Item.SelfWidget then
            Item.SelfWidget:SetGamePadFocus()
          end
        end, false, 0, nil, true)
      end
    end
  else
    self.WidgetSwitcher_List:SetActiveWidgetIndex(0)
    self.List_Item:SetFocus()
  end
  self.Switcher_Btn:SetActiveWidgetIndex(1)
  local Avatar = GWorld:GetAvatar()
  if self.IsHeadFrame then
    if Avatar and Avatar.HeadFrameList then
      local Find = false
      for _, value in pairs(Avatar.HeadFrameList) do
        Find = true
      end
      if not Find then
        self.Switcher_Dialog:SetActiveWidgetIndex(1)
      end
      self.Text_Tips:SetText(string.format(GText("UI_HeadFrame_Own"), self:GetCount(Avatar.HeadFrameList)))
    end
  else
    self.Switcher_Dialog:SetActiveWidgetIndex(0)
    if Avatar then
      self.Text_Tips:SetText(string.format(GText("UI_HeadFrame_Own"), self:GetCount(Avatar.HeadIconList)))
    end
  end
end

function Menu_Portrait_List_PC_C:SetCurPortrait()
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    self.HeadFrameId = Avatar.HeadFrameId
    if self.HeadFrameId then
      self:SetHeadFrameInfo(self.HeadFrameId)
    end
    self.HeadIconId = Avatar.HeadIconId
    if self.HeadIconId then
      self:SetPortraitInfo(self.HeadIconId)
    end
  end
end

function Menu_Portrait_List_PC_C:SetHeadFrameInfo(Id)
  if -1 == Id then
    self.Text_RoleName:SetText("\228\184\141\228\189\169\230\136\180")
    self.Head_Frame:SetVisibility(uiconst.VisibilityOp.Collapsed)
  else
    local Path = DataMgr.HeadFrame[Id].SmallIcon
    local Name = GText(DataMgr.HeadFrame[Id].Name)
    local ImageResource = LoadObject(Path)
    if nil ~= ImageResource then
      self.Head_Frame:SetBrushResourceObject(ImageResource)
    end
    if self.IsHeadFrame then
      self.Text_RoleName:SetText(Name)
    end
    self.Head_Frame:SetVisibility(uiconst.VisibilityOp.Visible)
  end
end

function Menu_Portrait_List_PC_C:SetPortraitInfo(Id)
  local Path = DataMgr.HeadSculpture[Id].HeadPath
  local Name = GText(DataMgr.HeadSculpture[Id].Name)
  local ImageResource = LoadObject(Path)
  if nil ~= ImageResource then
    local NpcMaterial = self.Icon_Head:GetDynamicMaterial()
    NpcMaterial:SetTextureParameterValue("IconMap", ImageResource)
  end
  if not self.IsHeadFrame then
    self.Text_RoleName:SetText(Name)
  end
end

function Menu_Portrait_List_PC_C:SetItemSelect(PreId)
  local UsedList = self.List_Item
  if self.IsHeadFrame then
    UsedList = self.List_Item_Frame
  end
  local AllItemCount = UsedList:GetNumItems()
  for i = 0, AllItemCount - 1 do
    local Item = UsedList:GetItemAt(i)
    if Item.PortraitId == self.SelectId then
      Item.SelfWidget:PlayAnimation(Item.SelfWidget.Select)
    elseif Item.PortraitId == PreId then
      Item.SelfWidget:PlayAnimation(Item.SelfWidget.UnSelect)
      Item.SelfWidget:PlayAnimation(Item.SelfWidget.Normal)
    end
  end
end

function Menu_Portrait_List_PC_C:TrySetHeadFrame(...)
  if self.SelectId then
    self:SetHeadFrameInfo(self.SelectId)
    UIUtils.TrySubReddotCacheDetail(self.SelectId, "PortraitFrame")
  end
end

function Menu_Portrait_List_PC_C:TrySetPortrait()
  if self.SelectId then
    self:SetPortraitInfo(self.SelectId)
    UIUtils.TrySubReddotCacheDetail(self.SelectId, "Portrait")
  end
end

function Menu_Portrait_List_PC_C:OnListItemClicked(Content)
  self.PortraitPath = Content.PortraitPath
  self.SelectId = Content.PortraitId
  if not Content.IsHeadFrame then
    self:TrySetPortrait()
    AudioManager(self):PlayUISound(nil, "event:/ui/common/click_btn_confirm", nil, nil)
  else
    self:TrySetHeadFrame()
    AudioManager(self):PlayUISound(nil, "event:/ui/common/click_level_03", nil, nil)
  end
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    if not (self.SelectId ~= Avatar.HeadIconId or Content.IsHeadFrame) or self.SelectId == Avatar.HeadFrameId and Content.IsHeadFrame then
      self.Switcher_Btn:SetActiveWidgetIndex(1)
    else
      self.Switcher_Btn:SetActiveWidgetIndex(0)
    end
  end
  self:RefreshItemClick(Content)
  Content.SelfWidget:StopAllAnimations()
  Content.SelfWidget:PlayAnimation(Content.SelfWidget.Click)
  Content.SelfWidget.IsSelect = true
end

function Menu_Portrait_List_PC_C:ConfirmChange()
  local Avatar = GWorld:GetAvatar()
  local PreId
  if Avatar then
    local MenuWorld = UIManager(self):GetUIObj(UIConst.MenuWorld)
    if self.IsHeadFrame then
      PreId = Avatar.HeadFrameId
      Avatar:SetAvatarHeadFrame(self.SelectId, function(Ret)
        if Ret then
          UIManager(self):ShowUITip("CommonToastMain", GText("UI_Change_Success"))
          self:SetCurPortrait()
          self:SetItemSelect(PreId)
          MenuWorld:SetPlayerInfo()
        end
      end)
    else
      PreId = Avatar.HeadIconId
      local MenuWorld = UIManager(self):GetUIObj(UIConst.MenuWorld)
      Avatar:SetAvatarHeadIcon(self.SelectId, function(Ret)
        if Ret then
          UIManager(self):ShowUITip("CommonToastMain", GText("UI_Change_Success"))
          self:SetCurPortrait()
          self:SetItemSelect(PreId)
          MenuWorld:SetPlayerInfo()
        end
      end)
    end
    MenuWorld:SetPlayerInfo()
  end
  if self._FreshCallback then
    if self.IsHeadFrame then
      self._FreshCallback(true, self.SelectId)
    else
      self._FreshCallback(false, self.SelectId)
    end
  end
  self.Switcher_Btn:SetActiveWidgetIndex(1)
end

function Menu_Portrait_List_PC_C:ClickConfirmChangePortrait()
end

function Menu_Portrait_List_PC_C:RefreshItemClick(Content)
  local UsedList = self.List_Item
  if self.IsHeadFrame then
    UsedList = self.List_Item_Frame
  end
  local AllItemCount = UsedList:GetNumItems()
  for i = 0, AllItemCount - 1 do
    local Item = UsedList:GetItemAt(i)
    if Item.SelfWidget and Item.SelfWidget.IsSelect and Item.SelfWidget ~= Content.SelfWidget then
      Item.SelfWidget:PlayAnimation(Item.SelfWidget.Normal)
      Item.SelfWidget.IsSelect = false
    end
  end
end

function Menu_Portrait_List_PC_C:InitPortrait()
  self.List_Item:ClearListItems()
  self.List_Item_Frame:ClearListItems()
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    local NumCount = 0
    local ClassPath = UIUtils.GetCommonItemContentClass()
    local MenuContent = NewObject(ClassPath)
    MenuContent.Owner = self
    MenuContent.PortraitId = -1
    MenuContent.IsHeadFrame = true
    self.List_Item_Frame:AddItem(MenuContent)
    NumCount = 1
    local UnlockedHeadFrameIcon = Avatar.HeadFrameList
    for _, Value in ipairs(UnlockedHeadFrameIcon) do
      MenuContent = NewObject(ClassPath)
      MenuContent.Owner = self
      MenuContent.PortraitPath = DataMgr.HeadFrame[Value].SmallIcon
      MenuContent.PortraitId = Value
      MenuContent.IsHeadFrame = true
      self.List_Item_Frame:AddItem(MenuContent)
      NumCount = NumCount + 1
    end
    NumCount = 0
    local UnlockedHeadIcon = Avatar.HeadIconList
    ClassPath = UIUtils.GetCommonItemContentClass()
    for _, Value in ipairs(UnlockedHeadIcon) do
      local MenuContent = NewObject(ClassPath)
      MenuContent.Owner = self
      MenuContent.PortraitPath = DataMgr.HeadSculpture[Value].HeadPath
      MenuContent.PortraitId = Value
      MenuContent.IsHeadFrame = false
      self.List_Item:AddItem(MenuContent)
      NumCount = NumCount + 1
    end
    self:FillEmpty(self.List_Item, NumCount)
  end
end

function Menu_Portrait_List_PC_C:FillEmpty(InListView, NumCount)
  self:AddTimer(0.01, function()
    local XCount, YCount = UIUtils.GetTileViewContentMaxCount(InListView, "XY")
    local EmptyItemNum
    if NumCount - XCount * YCount <= 0 then
      EmptyItemNum = XCount * YCount - NumCount
    else
      EmptyItemNum = XCount - NumCount % XCount
    end
    for i = 1, EmptyItemNum do
      local Obj = NewObject(UIUtils.GetCommonItemContentClass())
      Obj.IsEmpty = true
      InListView:AddItem(Obj)
    end
    self:AddTimer(0.01, function()
    end)
  end)
end

function Menu_Portrait_List_PC_C:CloseSelf()
  local Parent = UIManager(self):GetUI(UIConst.MenuWorld)
  if nil ~= Parent then
    Parent.IsEditOpen = false
    Parent:PlayAnimation(self.Edit_List_Out)
    Parent:SetFocus()
  end
  local AnimObj = self:GetAnimationByName("Out")
  self:PlayAnimation(AnimObj)
  self:BindToAnimationFinished(AnimObj, {
    self,
    self.Close
  })
end

function Menu_Portrait_List_PC_C:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  local IsUseKeyAndMouse = CurInputDevice == ECommonInputType.MouseAndKeyboard
  if IsUseKeyAndMouse then
  else
    local UsedList = self.List_Item
    if self.IsHeadFrame then
      UsedList = self.List_Item_Frame
    end
    local AllItemCount = UsedList:GetNumItems()
    for i = 0, AllItemCount - 1 do
      local Item = UsedList:GetItemAt(i)
      if Item.SelfWidget and Item.SelfWidget.IsSelect then
        Item.SelfWidget:SetGamePadFocus()
      end
    end
  end
end

function Menu_Portrait_List_PC_C:Destruct()
  self:UnbindDialogEvent(DialogEvent.OnTitleTabSelected)
  self.Super.Destruct(self)
end

return Menu_Portrait_List_PC_C
