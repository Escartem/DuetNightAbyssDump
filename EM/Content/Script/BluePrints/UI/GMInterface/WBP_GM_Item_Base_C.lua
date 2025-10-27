require("UnLua")
local GMFunctionLibrary = require("BluePrints.UI.GMInterface.GMFunctionLibrary")
local GMVariable = require("BluePrints.UI.GMInterface.GMVariable")
local WBP_GM_Item_Base_C = Class("BluePrints.UI.BP_EMUserWidget_C")

function WBP_GM_Item_Base_C:SetItem()
  if self.Arrow then
    self.Arrow:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  if self.Command.Mode == "button" then
    self.Text_Name_Btn:SetText(self.Command.Text)
  elseif self.Command.Mode == "switch" then
    if self.Command.IsEnable then
      self.Text_Name_Btn:SetText(self.Command.Text .. "\239\188\154\229\188\128")
    else
      self.Text_Name_Btn:SetText(self.Command.Text .. "\239\188\154\229\133\179")
    end
  elseif self.Command.Mode == "edit" then
    if self.Text_Name_Para then
      self.Text_Name_Para:SetText(self.Command.Text)
    end
  elseif self.Command.Mode == "menu" then
    self.Text_Name_Btn:SetText(self.Command.Text)
    if self.Arrow then
      self.Arrow:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
    end
    if self.Command.Parameters:Length() <= 0 and not IsValid(self.SubMenuWidget) then
      self.Command.SubMenuWidget = self:CreateMenuWidget()
    end
  elseif self.Command.Mode == "text" then
    for i = 1, 10 do
      if self["Text_Name_" .. i] then
        self["Text_Name_" .. i]:SetText(self.Command.Parameters[i])
      else
        break
      end
    end
  end
  if self.WidgetSwitcher then
    if self.Command.Mode == "edit" then
      self.WidgetSwitcher:SetActiveWidgetIndex(1)
    else
      self.WidgetSwitcher:SetActiveWidgetIndex(0)
    end
  end
  if self.Command.ParentWidget then
    self.Command.ParentWidget:OnEntryNumChanged(self)
  end
end

function WBP_GM_Item_Base_C:OnSelfRemove()
  if self.MenuAnchor and self.MenuAnchor:IsOpen() then
    self.MenuAnchor:Close()
  end
end

function WBP_GM_Item_Base_C:Exec(...)
  UIUtils.PlayCommonBtnSe(self)
  if self.Command.CloseGM == true then
    local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
    local UIManager = GameInstance:GetGameUIManager()
    local GMPanel = UIManager:GetUIObj("GMCommandPanel")
    GMPanel:CloseAllMenus()
    GMPanel:Close()
  end
  self.Command.IsEnable = not self.Command.IsEnable
  if self.Command.Callback ~= nil and self.Command.Callback ~= "" then
    GMFunctionLibrary.Exec(self, self.Command, ...)
  end
  if self.Command.Mode == "switch" then
    if "" ~= self.Command.VarName then
      self.Command.IsEnable = GMVariable[self.Command.VarName]
    end
    if self.Command.IsEnable then
      self.Text_Name_Btn:SetText(self.Command.Text .. "\239\188\154\229\188\128")
    else
      self.Text_Name_Btn:SetText(self.Command.Text .. "\239\188\154\229\133\179")
    end
  elseif self.Command.Mode == "menu" then
    self:SubMenuToggleOpen()
  end
end

function WBP_GM_Item_Base_C:SubMenuToggleOpen()
  if self.Command.Parameters:Length() > 0 then
    local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
    local UIManger = GameInstance:GetGameUIManager()
    UIManger:LoadUI(self.Command.Parameters[1], self.Command.Parameters[2], UIConst.ZORDER_FOR_SECONDARY_POPUP, self.Command)
  else
    local SubMenuWidget = self.Command.SubMenuWidget
    if nil == SubMenuWidget or nil == self.MenuAnchor then
      UE4.UWidgetBlueprintLibrary.DismissAllMenus()
      return
    end
    if self.MenuAnchor:IsOpen() then
      self.MenuAnchor:Close()
      SubMenuWidget:OnClose()
    else
      self.MenuAnchor:Open(true)
      SubMenuWidget:OnOpen()
      local geometry = self.MenuAnchor:GetTickSpaceGeometry()
      local topleft = UE4.USlateBlueprintLibrary.GetLocalTopLeft(geometry)
      local vPos, _ = UE4.USlateBlueprintLibrary.LocalToViewport(self, geometry, topleft)
      local viewportSize = UE4.UWidgetLayoutLibrary.GetViewportSize(self)
      if vPos.X > viewportSize.X / 2 then
        local MA_Slot = UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(self.MenuAnchor)
        local offset = MA_Slot:GetSize()
        local DesiredSize = SubMenuWidget:GetDesiredSize()
        local Trans = DesiredSize
        Trans.X = Trans.X * -1 - offset.X
        Trans.Y = 0
        SubMenuWidget:SetRenderTranslation(Trans)
      end
    end
  end
end

return WBP_GM_Item_Base_C
