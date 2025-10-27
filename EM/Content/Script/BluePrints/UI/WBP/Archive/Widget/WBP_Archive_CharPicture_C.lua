require("UnLua")
local M = Class({
  "BluePrints.UI.BP_UIState_C"
})

function M:Construct()
  M.Super.Construct(self)
  self.bIsFocusable = true
  self.Btn_Close:Init("Close", self, self.OnBtnCloseClicked)
end

function M:InitUIInfo(Name, IsInUIMode, EventList, ...)
  M.Super.InitUIInfo(self, Name, IsInUIMode, EventList, ...)
  self:LoadCharStand(...)
end

function M:LoadCharStand(CharId)
  local Data = DataMgr.Char[CharId]
  self.Img_Char:SetBrushFromTexture(self.DefaulPic)
  if Data and Data.BigIcon then
    self.Img_Char:SetBrushFromTexture(LoadObject(Data.BigIcon))
  end
end

function M:OnKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if "Escape" == InKeyName or InKeyName == Const.GamepadFaceButtonRight then
    self:OnBackKeyDown()
  end
  return UE4.UWidgetBlueprintLibrary.Handled()
end

function M:OnBackKeyDown()
  self:Close()
end

function M:OnBtnCloseClicked()
  self:Close()
end

return M
