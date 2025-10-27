require("UnLua")
local ModModel = ModController:GetModel()
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:Construct()
end

function M:InitUIInfo(Params)
  self.Parent = Params.Parent
  self.DyeDraftModel = Params.DyeDraftModel
  self.Btn_ShareChat:SetText(GText("UI_Armory_Share_Chat"))
  self.Btn_ShareChat:UnBindEventOnClicked(self, self.OnBtn_ShareChatClick)
  self.Btn_ShareChat:BindEventOnClicked(self, self.OnBtn_ShareChatClick)
  self.Btn_ShareChat.Key_GamePad:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Btn_ShareCommunity:SetText(GText("UI_Armory_Share_Community"))
  self.Btn_ShareCommunity:UnBindEventOnClicked(self, self.OnBtn_ShareCommunityClick)
  self.Btn_ShareCommunity:BindEventOnClicked(self, self.OnBtn_ShareCommunityClick)
  self.Btn_ShareCommunity.Key_GamePad:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Text_DyeCode:SetText(GText("UI_Dye_Output_Build"))
  self.Btn_CopyCode:UnBindEventOnClicked(self, self.OnBtn_CopyCodeClick)
  self.Btn_CopyCode:BindEventOnClicked(self, self.OnBtn_CopyCodeClick)
  self.Btn_CopyCode.Key_GamePad:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.WidgetSwitcher_State:SetActiveWidgetIndex(0)
  self.Btn_ShareChat:SetFocus()
  self.Btn_ShareChat:SetNavigationRuleCustom(EUINavigation.Down, {
    self,
    function()
      local currentIndex = self.WidgetSwitcher_State:GetActiveWidgetIndex()
      if 0 == currentIndex then
        return self.Btn_ShareCommunity
      elseif 1 == currentIndex then
        return self.Btn_CopyCode
      else
        return nil
      end
    end
  })
end

function M:OnBtn_ShareChatClick()
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  local UIManger = GameInstance:GetGameUIManager()
  local CurrentDraft = self.DyeDraftModel:GetDyeDraftPlan(self.Parent.CurrentSkin.SkinId, self.Parent.CurrentPlan)
  if CurrentDraft and next(CurrentDraft) then
    UIManger:ShowUITip(UIConst.Tip_CommonToast, GText("UI_Dye_Output_Temporary"))
  end
  local DyePlanInfo = self:GetCurrentDyePlanInfo()
  if not DyePlanInfo then
    return
  end
  ModModel:CacheDyePlanInfoCopyed(DyePlanInfo)
  UIManger:ShowUITip(UIConst.Tip_CommonToast, GText("UI_Dye_Output_CopyBoard"))
  self:Close()
end

function M:GetCurrentDyePlanInfo()
  local Parent = self.Parent
  if not Parent or not Parent.CurrentSkin then
    return nil
  end
  local DyePlanInfo = {}
  local CurrentSkin = Parent.CurrentSkin
  local CurrentPlan = Parent.CurrentPlan or 1
  if Parent.Type == CommonConst.ArmoryType.Char then
    DyePlanInfo.SkinType = "Char"
    DyePlanInfo.SkinId = CurrentSkin.SkinId
    local SkinData = DataMgr.Skin[CurrentSkin.SkinId]
    if SkinData then
      DyePlanInfo.TargetName = GText(SkinData.SkinName)
    end
  else
    DyePlanInfo.SkinType = "Weapon"
    DyePlanInfo.SkinId = CurrentSkin.SkinId
    local SkinData = DataMgr.WeaponSkin[CurrentSkin.SkinId]
    if SkinData then
      DyePlanInfo.TargetName = GText(SkinData.Name)
    else
      SkinData = DataMgr.Weapon[CurrentSkin.SkinId]
      if SkinData then
        DyePlanInfo.TargetName = GText(SkinData.WeaponName)
      end
    end
  end
  local PlanNames = Parent:GetPlanNames()
  DyePlanInfo.PlanName = PlanNames[CurrentPlan] or "\230\150\185\230\161\136" .. CurrentPlan
  local Colors = CurrentSkin:GetColors(CurrentPlan)
  DyePlanInfo.Colors = {}
  for i = 1, Parent.ColorPartCount do
    DyePlanInfo.Colors[i] = Colors[i] or Parent.DefaultColorId
  end
  return DyePlanInfo
end

function M:OnBtn_ShareCommunityClick()
  self.WidgetSwitcher_State:SetActiveWidgetIndex(1)
  self.Btn_CopyCode:SetFocus()
  local DyePlanInfo = self:GetCurrentDyePlanInfo()
  self.ShareCommunityCopyCode = ModModel:GenerateShareCommunityCopyCode(DyePlanInfo)
  self.Btn_CopyCode:SetText(GText(self.ShareCommunityCopyCode))
end

function M:OnBtn_CopyCodeClick()
  ULowEntryExtendedStandardLibrary.ClipboardSet(self.ShareCommunityCopyCode)
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  local UIManger = GameInstance:GetGameUIManager()
  UIManger:ShowUITip(UIConst.Tip_CommonToast, GText("UI_Dye_Output_Copy"))
end

function M:Close()
  self:SetVisibility(UIConst.VisibilityOp.Collapsed)
  if self.Parent and self.Parent.Btn_Share then
    self.Parent.Btn_Share:SetFocus()
  end
end

function M:OnKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if "Gamepad_FaceButton_Right" == InKeyName then
    self:Close()
    return UE4.UWidgetBlueprintLibrary.Handled()
  end
  return UE4.UWidgetBlueprintLibrary.Unhandled()
end

function M:OnAddedToFocusPath(InFocusEvent)
  self.HasAnyFocus = true
end

function M:OnRemovedFromFocusPath(InFocusEvent)
  self.HasAnyFocus = false
  self:SetVisibility(UIConst.VisibilityOp.Collapsed)
end

return M
