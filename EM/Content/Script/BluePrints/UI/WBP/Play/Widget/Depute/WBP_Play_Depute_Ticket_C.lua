require("UnLua")
local M = Class({
  "BluePrints.UI.UI_PC.Common.Common_Dialog.Common_Dialog_ContentBase"
})

function M:Construct()
  self.Button_Area.OnHovered:Add(self, self.OnHovered)
  self.Button_Area.OnUnhovered:Add(self, self.OnUnhovered)
  self.Button_Area.OnPressed:Add(self, self.OnPressed)
  self.Button_Area.OnReleased:Add(self, self.OnReleased)
end

function M:InitInfo(TicketId, Owner, Parent)
  if TicketId then
    self.TicketId = TicketId
  end
  self.Parent = Parent
  self:InitItemInfo(TicketId, Owner)
end

function M:InitItemInfo(TicketId, Owner)
  self.Owner = Owner
  self.TicketId = TicketId
  local Content = {}
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  local ResourceServerData = Avatar.Resources[TicketId]
  self.Count = 0
  if ResourceServerData then
    self.Count = ResourceServerData.Count
  end
  if 0 ~= self.Count then
    self.WidgetSwitcher_State:SetActiveWidgetIndex(1)
  else
    self.WidgetSwitcher_State:SetActiveWidgetIndex(0)
  end
  if -1 ~= TicketId then
    self.WidgetSwitcher_Item:SetActiveWidgetIndex(0)
    local TicketData = DataMgr.Resource[TicketId]
    Content.Id = TicketId
    Content.Icon = ItemUtils.GetItemIconPath(TicketId, "Resource")
    Content.ParentWidget = self
    Content.ItemType = "Resource"
    Content.Rarity = TicketData.Rarity or 1
    Content.IsShowDetails = true
    Content.Count = self.Count
    Content.ItemDetailKeyDownEvent = {
      Obj = self,
      Callback = self.OnItemDetailKeyDown,
      Params = Content
    }
  else
    self.WidgetSwitcher_Item:SetActiveWidgetIndex(1)
  end
  self.bNotInteractive = false
  if -1 ~= self.TicketId and 0 == self.Count then
    self.bNotInteractive = true
  end
  self.Item_Ticket:Init(Content)
  self.Item_Ticket:BindEvents(self, {
    OnMenuOpenChanged = self.OnStuffMenuOpenChanged
  })
end

function M:OnClicked()
  if self:IsAnimationPlaying(self.Click) then
    return false
  end
  if self.bNotInteractive then
    UIManager(self):ShowUITip("CommonToastMain", "UI_Ticket_Insufficient")
    return false
  end
  self.Tips = {}
  local TicketData = DataMgr.Resource[self.TicketId]
  local TipsContent
  if -1 == self.TicketId then
    TipsContent = GText("UI_NoTicket")
  elseif TicketData.ResourceName and TicketData.UseParam then
    TipsContent = string.format(GText("UI_Ticket_Effect"), GText(TicketData.ResourceName), TicketData.UseParam / 100.0)
  else
    DebugPrint("ZDX_\233\151\168\231\165\168\229\175\185\229\186\148Resource\231\188\186\229\176\145Name\230\136\150Id")
  end
  table.insert(self.Tips, TipsContent)
  self:BroadcastDialogEvent("UpdateDialogTipText", {
    Tips = self.Tips,
    DialogItemIndex = 1,
    bShowTip = true
  })
  self:StopAllAnimations()
  self.IsSelected = true
  self:PlayAnimation(self.Click)
  return true
end

function M:OnHovered()
  if self:IsAnimationPlaying(self.Click) or self.IsSelected or self.bNotInteractive then
    return
  end
  if not self.Button_Area:HasMouseCapture() then
    self:StopAllAnimations()
    self:PlayAnimation(self.Hover)
  end
end

function M:OnUnhovered()
  if self:IsAnimationPlaying(self.Click) or self.IsSelected or self.bNotInteractive then
    return
  end
  if not self.Button_Area:HasMouseCapture() then
    self:StopAllAnimations()
    self:PlayAnimation(self.UnHover)
  end
end

function M:OnPressed()
  if self:IsAnimationPlaying(self.Click) or self.IsSelected or self.bNotInteractive then
    return
  end
  self:StopAllAnimations()
  self:PlayAnimation(self.Press)
end

function M:OnReleased()
  if self:IsAnimationPlaying(self.Click) or self.IsSelected or self.bNotInteractive then
    return
  end
  self:StopAllAnimations()
  self:PlayAnimation(self.Normal)
end

function M:OnCellUnSelect()
  self:StopAllAnimations()
  if self.bNotInteractive then
    self.WidgetSwitcher_State:SetActiveWidgetIndex(0)
  else
    self.WidgetSwitcher_State:SetActiveWidgetIndex(1)
  end
  self:PlayAnimation(self.Normal)
  self.IsSelected = false
end

function M:OnAnimationFinished(InAnimation)
  if InAnimation == self.UnHover then
    self:PlayAnimation(self.Normal)
  end
end

function M:OnAddedToFocusPath(MyGeometry, InFocusEvent)
  if UIUtils.UtilsGetCurrentInputType() ~= ECommonInputType.Gamepad then
    return
  end
  self.Parent:HideAllGamepadShortcut()
  local ActiveIndex = self.WidgetSwitcher_Item:GetActiveWidgetIndex()
  if 0 == ActiveIndex then
    self.GamepadCheckItemKeyInfo = self.Parent:ShowGamepadShortcutBtn({
      KeyInfoList = {
        {
          Type = "Img",
          ImgShortPath = UIConst.GamePadImgKey.LeftThumb
        }
      },
      Desc = GText("UI_Controller_CheckDetails")
    })
  end
  self.Parent:OnItemClicked(self.TicketId)
  return UE4.UWidgetBlueprintLibrary.Unhandled()
end

function M:OnKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local IsEventHandled = false
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) then
    IsEventHandled = self:OnGamePadDown(InKeyName)
  end
  if IsEventHandled then
    return UWidgetBlueprintLibrary.Handled()
  else
    return UWidgetBlueprintLibrary.UnHandled()
  end
end

function M:OnGamePadDown(InKeyName)
  local IsEventHandled = false
  if "Gamepad_LeftThumbstick" == InKeyName and -1 ~= self.TicketId then
    self.Item_Ticket:OpenItemMenu()
    IsEventHandled = true
  end
  return IsEventHandled
end

function M:OnPreviewKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local IsEventHandled = false
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) and InKeyName == Const.GamepadFaceButtonDown then
    self.Owner:OnRightBtnClicked()
    IsEventHandled = true
  end
  if IsEventHandled then
    return UWidgetBlueprintLibrary.Handled()
  else
    return UWidgetBlueprintLibrary.UnHandled()
  end
end

function M:OnStuffMenuOpenChanged(bIsOpen)
  if UIUtils.UtilsGetCurrentInputType() ~= ECommonInputType.Gamepad then
    return
  end
  self.IsTipsOpen = bIsOpen
  self.Parent:SetGamepadBtnKeyVisibility(not bIsOpen)
  if bIsOpen then
    self.Parent:HideAllGamepadShortcut()
  else
    local ActiveIndex = self.WidgetSwitcher_Item:GetActiveWidgetIndex()
    if 0 == ActiveIndex then
      self.GamepadCheckItemKeyInfo = self.Parent:ShowGamepadShortcutBtn({
        KeyInfoList = {
          {
            Type = "Img",
            ImgShortPath = UIConst.GamePadImgKey.LeftThumb
          }
        },
        Desc = GText("UI_Controller_CheckDetails")
      })
    end
  end
end

function M:OnItemDetailKeyDown(MyGeometry, InKeyEvent, Content)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if InKeyName == UIConst.GamePadKey.FaceButtonRight then
    return UWidgetBlueprintLibrary.SetUserFocus(UWidgetBlueprintLibrary.Handled(), self), true
  end
end

function M:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  if CurInputDevice == ECommonInputType.Touch then
    return
  end
  local IsUseKeyAndMouse = CurInputDevice == ECommonInputType.MouseAndKeyboard
  if not IsUseKeyAndMouse then
    self.Parent:SetGamepadBtnKeyVisibility(not self.IsTipsOpen)
  end
  self.Super.RefreshOpInfoByInputDevice(self, CurInputDevice, CurGamepadName)
end

return M
