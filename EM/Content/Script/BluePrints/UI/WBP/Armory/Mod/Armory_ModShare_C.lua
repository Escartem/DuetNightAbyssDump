require("UnLua")
local ModModel = ModController:GetModel()
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:Construct()
  self.Btn_CopyLink:BindEventOnClicked(self, function()
    ModController:ShowToast(GText("UI_Mod_Toast_CopyedSuit"))
    ModModel:CacheSuitInfoCopyed()
    self:ResetFocus()
  end)
  self.Btn_CopyCommunity:BindEventOnClicked(self, function()
    ModController:ShowToast(GText("UI_Dye_Output_Copy"))
    ModModel:CreateModSuitCopyCode()
    self:ResetFocus()
  end)
  self.Btn_Import:BindEventOnClicked(self, function()
    UIManager(self):ShowCommonPopupUI(ModCommon.ModCopySuitCodeDialog, {
      UseGenaral = true,
      MultilineType = 1,
      TextLenMax = 50,
      HintText = GText("UI_Dye_Input_Content"),
      RightCallbackObj = self,
      DontFocusParentWidget = true,
      RightCallbackFunction = function(self, Data, Dialog)
        local Code = Data.ComDialogInput.Text
        local ModSuitInfo = ModModel:CopyCodeToModSuitInfo(Code)
        if not ModSuitInfo then
          ModController:ShowToast(GText("UI_Mod_ImportError_WrongCode"))
          self:ResetFocus()
          return
        end
        self.ModMain:BlockAllUIInput(true)
        ModController:LaunchAutoEquipMod(ModSuitInfo)
        Dialog:Close()
        self:ResetFocus()
      end
    }, self.ModMain)
  end)
  self.Btn_CopyLink:SetText(GText("UI_Armory_Share_Chat"))
  self.Btn_CopyCommunity:SetText(GText("UI_Armory_Share_Community"))
  self.Btn_Import:SetText(GText("UI_Mod_ImportPlan"))
  ModController:RegisterEvent(self)
end

function M:NotifyOnModSuitCopyFaild()
  self.ModMain:BlockAllUIInput(false)
end

function M:ForbidCopy(bForbid)
  self.Btn_CopyLink:ForbidBtn(bForbid)
  self.Btn_CopyCommunity:ForbidBtn(bForbid)
end

function M:Destruct()
  self.Btn_CopyLink:UnBindEventOnClickedByObj(self)
  self.Btn_CopyCommunity:UnBindEventOnClickedByObj(self)
  self.Btn_Import:UnBindEventOnClickedByObj(self)
  ModController:UnRegisterEvent(self)
end

function M:Show()
  self:SetVisibility(UIConst.VisibilityOp.Visible)
  self.bIsFocusable = true
  self:SetFocus()
  self.ModMain = ModController:GetView(self, ModCommon.ArmoryMod)
  self.ModMain.Mod_Plan.Key_Gamepad:SetVisibility(UIConst.VisibilityOp.Collapsed)
  if ModController:IsGamepad() then
    for _, Widget in pairs(self.VB_Main:GetAllChildren()) do
      if not Widget.IsForbidden then
        Widget:SetFocus()
        break
      end
    end
  end
  self.Btn_CopyLink.Key_GamePad:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Btn_CopyCommunity.Key_GamePad:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Btn_Import.Key_GamePad:SetVisibility(UIConst.VisibilityOp.Collapsed)
end

function M:ResetFocus()
  self:OnRemovedFromFocusPath()
  self.ModMain:SetFocus()
end

function M:OnRemovedFromFocusPath(InFocusEvent)
  if self.bIsFocusable == false then
    return
  end
  self.bIsFocusable = false
  self:SetVisibility(UIConst.VisibilityOp.Collapsed)
  if ModController:IsGamepad() then
    self.ModMain.Mod_Plan.Key_Gamepad:SetVisibility(UIConst.VisibilityOp.Visible)
  end
end

return M
