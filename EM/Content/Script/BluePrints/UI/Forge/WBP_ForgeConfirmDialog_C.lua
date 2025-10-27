require("UnLua")
local ForgeConst = require("Blueprints.UI.Forge.ForgeConst")
local WBP_ForgeConfirmDialog_C = Class("BluePrints.UI.BP_UIState_C")

function WBP_ForgeConfirmDialog_C:Initialize()
  self.Super.Initialize(self)
end

function WBP_ForgeConfirmDialog_C:OnLoaded(WindowContent)
  self.Super.OnLoaded(self)
  local PopupId = WindowContent.PopupId
  self.YesCallBackFunction = WindowContent.YesCallBackFunction
  self.NoCallBackFunction = WindowContent.NoCallBackFunction
  local Context = DataMgr.CommonPopupUIContext[PopupId]
  if Context then
    self.Text_TipsTitle:SetText(GText(Context.Title))
    local PopeverText = ""
    if WindowContent.TipsTextParm then
      PopeverText = string.format(GText(Context.PopoverText), WindowContent.TipsTextParm)
    else
      PopeverText = GText(Context.PopoverText)
    end
    self.Text_Tips:SetText(PopeverText)
    self.Btn_Confirm:SetTextInfo(GText(Context.YesButtonText), "Enter")
    self.Btn_Cancel:SetTextInfo(GText(Context.NoButtonText), "Esc")
  end
  if self.YesCallBackFunction then
    self.Btn_Confirm:BindEventOnClicked(self, self.OnYesButtonClicked)
    self.Btn_Confirm:SetVisibility(UE4.ESlateVisibility.Visible)
  else
    self.Btn_Confirm:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
  if self.NoCallBackFunction then
    self.Btn_Cancel:BindEventOnClicked(self, self.OnNoButtonClicked)
    self.Btn_Cancel:SetVisibility(UE4.ESlateVisibility.Visible)
  else
    self.Btn_Cancel:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
  local ResInfos = WindowContent.ResInfos
  self.List_Item:ClearListItems()
  for _, ResInfo in ipairs(ResInfos) do
    local Class = LoadClass("/Game/UI/UI_PC/Common/Common_Item_subsize_PC_Content.Common_Item_subsize_PC_Content_C")
    local Content = NewObject(Class)
    Content.UnitId = ResInfo.ResId
    Content.Count = ResInfo.ResNum
    Content.Type = ResInfo.ResType
    if ResInfo.ResType == "Weapon" then
      local WeaponData = DataMgr.Weapon[ResInfo.ResId]
      if WeaponData then
        Content.Rarity = WeaponData.WeaponRarity
        Content.Icon = LoadObject(WeaponData.Icon)
      end
    elseif ResInfo.ResType == "Mod" then
      local ModData = DataMgr.Mod[ResInfo.ResId]
      if ModData then
        Content.Rarity = ModData.Rarity
        Content.Icon = LoadObject(ModData.Icon)
        Content.bEnableDrag = false
      end
    elseif ResInfo.ResType == "Resource" then
      local ResourceData = DataMgr.Resource[ResInfo.ResId]
      if ResourceData then
        Content.Icon = LoadObject(ResourceData.Icon)
        Content.Rarity = ResourceData.Rarity
        Content.bEnableDrag = false
      end
    end
    self.List_Item:AddItem(Content)
  end
  self.Canvas:SetRenderOpacity(1)
  self:PlayAnimation(self.In)
  self:SetFocus()
end

function WBP_ForgeConfirmDialog_C:OnYesButtonClicked()
  DebugPrint("Tianyi@ On Yes Button Clicked")
  if self.YesCallBackFunction then
    self.YesCallBackFunction()
  end
  self:PlayOutAnimation()
end

function WBP_ForgeConfirmDialog_C:OnKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if "Escape" == InKeyName then
    self:OnNoButtonClicked()
  elseif "Enter" == InKeyName then
    self:OnYesButtonClicked()
  end
  return UE4.UWidgetBlueprintLibrary.Handled()
end

function WBP_ForgeConfirmDialog_C:OnNoButtonClicked()
  DebugPrint("Tianyi@ On No Button Clicked")
  if self.NoCallBackFunction then
    self.NoCallBackFunction()
  end
  self:PlayOutAnimation()
end

function WBP_ForgeConfirmDialog_C:PlayOutAnimation()
  self:PlayAnimation(self.Out)
end

function WBP_ForgeConfirmDialog_C:OnAnimationFinished(Animation)
  if Animation == self.Out then
    self:Close()
  end
end

return WBP_ForgeConfirmDialog_C
