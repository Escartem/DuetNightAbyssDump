require("UnLua")
local WBP_CommonDialogTip_PC_C = Class("BluePrints.UI.BP_UIState_C")

function WBP_CommonDialogTip_PC_C:Construct()
  self.Escape = "Escape"
  self.KeyUpEvent = {}
  self.KeyUpEvent[self.Escape] = self.CloseSelf
  self.Button_Close.OnClicked:Add(self, self.CloseSelf)
  self:BindToAnimationFinished(self.Out, {
    self,
    self.OnOutAnimationFinished
  })
end

function WBP_CommonDialogTip_PC_C:OnLoaded(...)
  self.Super.OnLoaded(self, ...)
  self:PlayAnimation(self.In)
  self:InitTip(...)
  self:SetFocus()
end

function WBP_CommonDialogTip_PC_C:InitTip(...)
  local TipTitle, TipContent = ...
  if TipTitle and TipContent then
    self.Text_Title:SetText(GText(TipTitle))
    self.Text_Tip:SetText(GText(TipContent))
  else
    DebugPrint("[Esc] ExpTip is nil]")
  end
end

function WBP_CommonDialogTip_PC_C:OnKeyDown(MyGeometry, InKeyEvent)
  return UE4.UWidgetBlueprintLibrary.Handled()
end

function WBP_CommonDialogTip_PC_C:OnKeyUp(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if self.KeyUpEvent[InKeyName] then
    self.KeyUpEvent[InKeyName](self)
  end
  return UE4.UWidgetBlueprintLibrary.Handled()
end

function WBP_CommonDialogTip_PC_C:CloseSelf()
  local AnimObj = self:GetAnimationByName("Out")
  if self:IsAnimationPlaying(self.Out) then
    return
  end
  self:StopAnimation(self.In)
  self:PlayAnimation(AnimObj)
  local MenuWorld = UIManager(GWorld.GameInstance):GetUIObj(UIConst.MenuWorld)
  if MenuWorld then
    MenuWorld:SetFocus()
  end
end

function WBP_CommonDialogTip_PC_C:OnOutAnimationFinished()
  self:Close()
end

return WBP_CommonDialogTip_PC_C
