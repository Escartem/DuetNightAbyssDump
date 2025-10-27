require("UnLua")
local M = Class({
  "BluePrints.UI.BP_UIState_C"
})

function M:Construct()
  self.Button_Close.OnClicked:Add(self, self.Close)
end

function M:InitUIInfo(Name, IsInUIMode, EventList, ...)
  self.Super.InitUIInfo(self, Name, IsInUIMode, EventList, ...)
  self.TermList = (...)
  self.Text_Tip:SetText(GText("UI_Armory_ClickEmpty"))
  self:InitDefinitionList()
  if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
    self:InitGamepadView()
  else
    self:InitKeyboardView()
  end
end

function M:InitDefinitionList()
  self.List_Definition:ClearListItems()
  for _, TermId in ipairs(self.TermList) do
    local Data = DataMgr.CombatTerm[TermId]
    local Obj = NewObject(UIUtils.GetCommonItemContentClass())
    Obj.TermName = Data.CombatTerm
    Obj.Explaination = Data.CombatTermExplaination
    self.List_Definition:AddItem(Obj)
  end
end

function M:OnUpdateUIStyleByInputTypeChange(CurInputType, CurGamepadName)
  self.Super.OnUpdateUIStyleByInputTypeChange(self, CurInputType, CurGamepadName)
  if CurInputType == ECommonInputType.Gamepad then
    self:InitGamepadView()
  else
    self:InitKeyboardView()
  end
end

function M:InitGamepadView()
  self.Panel_Key:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  self.Text_Tip:SetVisibility(UIConst.VisibilityOp.Collapsed)
  local BottomKeyWidget = self:CreateWidgetNew("ComKeyTextDesc")
  BottomKeyWidget:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "B"}
    },
    Desc = GText("UI_BACK")
  })
  self.Panel_Key:ClearChildren()
  self.Panel_Key:AddChild(BottomKeyWidget)
  self.Button_Close:SetIsShowNavigateGuide(false)
  self.List_Definition:SetIsShowNavigateGuide(false)
end

function M:InitKeyboardView()
  if self.Panel_Key then
    self.Panel_Key:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  self.Text_Tip:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
end

function M:OnKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if InKeyName == Const.GamepadFaceButtonRight or "Escape" == InKeyName then
    self:Close()
  end
  return UE4.UWidgetBlueprintLibrary.Handled()
end

return M
