require("UnLua")
local WikiController = require("BluePrints.UI.WBP.Wiki.WikiController")
local M = Class({
  "BluePrints.UI.Common.Common_List_Cell_PC_C"
})

function M:Construct()
  self.IsFold = true
  self.IsSelected = false
  self.ReddotName = DataMgr.ReddotNode.WikiItems.Name
  self.IsNew = false
  self:BindEvent()
  self.Group_Normal:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  self.Group_Empty:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Com_Bg:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  self.Com_Bg:SetRenderOpacity(1.0)
  self.Text_Name:SetDefaultColorAndOpacity(self.Text_NormalColor)
  self:InitListenEvent()
  self:RefreshBaseInfo()
  self.Com_Bg:TryOverrideSoundFunc(function()
    AudioManager(self):PlayUISound(self, "event:/ui/common/click_level_03", nil, nil)
  end)
end

function M:OnListItemObjectSet(InObject)
  if not InObject then
    return
  end
  self.Index = InObject.Index
  self.EntryId = InObject.EntryId
  self.EntryTitle = InObject.EntryTitle
  self.OriginalTitle = InObject.OriginalTitle or InObject.EntryTitle
  self.IsDialogueEntry = InObject.IsDialogueEntry
  self.Owner = InObject.Parent
  self.Text_Name:SetText(GText(InObject.EntryTitle))
  self.Com_Bg:OnCellUnSelect()
  if WikiController:GetModel():IsEntryNew(self.EntryId) then
    self.New:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  else
    self.New:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

function M:Destruct()
  self:UnbindEvent()
end

function M:BindEvent()
  self.Com_Bg.Button_Area.OnClicked:Add(self, self.OnCellClicked)
  self.Com_Bg.Button_Area.OnHovered:Add(self, self.OnCellHovered)
  self.Com_Bg.Button_Area.OnUnhovered:Add(self, self.OnCellUnhovered)
  self.Com_Bg.Button_Area.OnPressed:Add(self, self.OnCellPressed)
  self.Com_Bg.Button_Area.OnReleased:Add(self, self.OnCellReleased)
end

function M:UnbindEvent()
  self.Com_Bg.Button_Area.OnClicked:Remove(self, self.OnCellClicked)
  self.Com_Bg.Button_Area.OnHovered:Remove(self, self.OnCellHovered)
  self.Com_Bg.Button_Area.OnUnhovered:Remove(self, self.OnCellUnhovered)
  self.Com_Bg.Button_Area.OnPressed:Remove(self, self.OnCellPressed)
  self.Com_Bg.Button_Area.OnReleased:Remove(self, self.OnCellReleased)
end

function M:OnCellUnSelect()
  self.IsSelected = false
  self.Text_Name:SetDefaultColorAndOpacity(self.Text_NormalColor)
  self.Com_Bg:OnCellUnSelect()
end

function M:OnCellClicked(bNotPlaySound)
  self.IsSelected = true
  self.Text_Name:SetDefaultColorAndOpacity(self.Text_SelectColor)
  if self.IsDialogueEntry then
    self.Owner:OnEntrySelected(self)
    self.Owner.Text_DescTitle:SetText(GText(self.EntryTitle))
  elseif self.Owner and self.Owner.Owner then
    self.Owner.Owner:OnEntrySelected(self)
    self.Owner.Owner.Text_DescTitle:SetText(GText(self.OriginalTitle))
    self.Owner:UpdateEntryStyle()
  end
  self.Com_Bg:OnCellClicked(bNotPlaySound)
  self:_OnWikiEntryTextReaded(self.EntryId)
  self.New:SetVisibility(UIConst.VisibilityOp.Collapsed)
end

function M:OnCellHovered()
  if not self.IsSelected then
    self.Com_Bg:StopAnimation(self.Normal)
    self.Com_Bg:PlayAnimation(self.Hover)
  end
end

function M:OnCellUnhovered()
  if not self.IsSelected then
    self:StopAnimation(self.Hover)
    self.Com_Bg:StopAnimation(self.Press)
    self.Com_Bg:PlayAnimation(self.Normal)
  end
end

function M:OnCellPressed()
  self.Com_Bg:PlayAnimation(self.Press)
end

function M:OnCellReleased()
  self.Com_Bg:PlayAnimation(self.Normal)
end

function M:BP_OnEntryReleased()
end

function M:_OnWikiEntryTextReaded(EntryId)
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    local entryTexts = WikiController:GetModel():GetWikiTextByEntryId(EntryId)
    for TextId, _ in pairs(entryTexts) do
      if WikiController:GetModel():IsTextNew(TextId) then
        Avatar:WikiEntryTextReaded(EntryId, TextId)
      end
    end
  end
end

function M:InitListenEvent()
  local PlayerController = self:GetOwningPlayer()
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
  if IsValid(self.GameInputModeSubsystem) then
    self.GameInputModeSubsystem.OnInputMethodChanged:Add(self, self.RefreshOpInfoByInputDevice)
  end
end

function M:RefreshBaseInfo()
  if IsValid(self.GameInputModeSubsystem) then
    self:RefreshOpInfoByInputDevice(self.GameInputModeSubsystem:GetCurrentInputType(), self.GameInputModeSubsystem:GetCurrentGamepadName())
  end
end

function M:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  self.CurGamepadName = CurGamepadName
  local IsUseKeyAndMouse = CurInputDevice == ECommonInputType.MouseAndKeyboard
  local ActiveWidgetIndex = IsUseKeyAndMouse and 0 or 1
  if IsUseKeyAndMouse then
  else
  end
  self.CurInputDevice = CurInputDevice
end

function M:OnAddedToFocusPath(InFocusEvent)
  if self.CurInputDevice == ECommonInputType.Gamepad then
    if self.Owner.Owner then
      self.Owner.Owner.CatalogueScroll:ScrollWidgetIntoView(self, true, UE4.EDescendantScrollDestination.IntoView)
    end
    self:OnCellClicked(true)
  end
end

function M:OnFocusReceived(MyGeometry, InFocusEvent)
  if not self.IsSelected then
    if CommonUtils.GetDeviceTypeByPlatformName() ~= "Mobile" then
      self.Owner.Owner.Com_Tab:UpdateBottomKeyInfo({
        {
          KeyInfoList = {
            {
              Type = "Text",
              Text = "Esc",
              ClickCallback = self.CloseSelf,
              Owner = self
            }
          },
          GamePadInfoList = {
            {
              Type = "Img",
              ImgShortPath = "B",
              ClickCallback = self.CloseSelf
            }
          },
          Desc = GText("UI_BACK"),
          bLongPress = false
        }
      })
    end
  elseif CommonUtils.GetDeviceTypeByPlatformName() ~= "Mobile" then
    self.Owner.Owner.Com_Tab:UpdateBottomKeyInfo({
      {
        KeyInfoList = {
          {
            Type = "Text",
            Text = "Esc",
            ClickCallback = self.CloseSelf,
            Owner = self
          }
        },
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "B",
            ClickCallback = self.CloseSelf
          }
        },
        Desc = GText("UI_BACK"),
        bLongPress = false
      }
    })
  end
  self:InitNavigationRules()
  return UE4.UWidgetBlueprintLibrary.Handled()
end

function M:InitNavigationRules()
  self:SetNavigationRuleCustom(EUINavigation.Down, {
    self,
    self.SetDownTarget
  })
  self:SetNavigationRuleCustom(EUINavigation.Up, {
    self,
    self.SetUpTarget
  })
end

function M:SetDownTarget()
  if self.Index < self.Owner.List_Box:GetChildrenCount() - 1 then
    return self.Owner.List_Box:GetChildAt(self.Index + 1)
  else
    return self.Owner:GetNextListCatalogueItem()
  end
end

function M:SetUpTarget()
  if self.Index > 0 then
    return self.Owner.List_Box:GetChildAt(self.Index - 1)
  else
    return self.Owner:GetSelfListCatalogueItem()
  end
end

return M
