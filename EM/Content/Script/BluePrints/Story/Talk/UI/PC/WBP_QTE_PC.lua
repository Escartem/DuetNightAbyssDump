require("UnLua")
local M = Class("BluePrints.Story.Talk.UI.Common.WBP_QTE_Common")

function M:SwitchBindButtonClickEvents(bBind)
  if bBind then
    self:InitButtonPerformance()
    self.Key_Handle:AddExecuteLogic(self, self.OnInputPress)
    self.Key_Handle:EnableKey()
  else
    self.Key_Handle:DisableKey()
  end
end

function M:RefreshOpInfoByInputDevice(CurInputType, CurGamepadName)
  if CurInputType == ECommonInputType.Gamepad then
    self:InitGamepadView()
  else
    self:InitKeyBoardView()
  end
  M.Super.RefreshOpInfoByInputDevice(self, CurInputType, CurGamepadName)
end

function M:InitGamepadView()
  self.Key_Handle:CreateCommonKey({
    KeyInfoList = {
      {
        Type = "Img",
        ImgShortPath = "Y",
        bLargeSize = true
      }
    }
  })
end

function M:InitKeyBoardView()
  self.Key_Handle:CreateCommonKey({
    KeyInfoList = {
      {
        Type = "Text",
        Text = self:GetClickButtonText(),
        bLargeSize = true
      }
    }
  })
end

function M:InitButtonPerformance()
  if self.bHasInitButtonPerformance then
    return
  end
  self.bHasInitButtonPerformance = true
  if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
    self:InitGamepadView()
  else
    self:InitKeyBoardView()
  end
end

function M:AdaptPlatform()
  local UIPosName = self.QTEConfig.UIPosition
  local Offset = {x = 0, y = 0}
  if UIPosName then
    local Config = DataMgr.QTEPosition[tonumber(UIPosName)]
    if Config then
      Offset.x = Config.OffsetX
      Offset.y = Config.OffsetY
    end
  end
  local Slot = UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(self.Main)
  Slot:SetPosition(FVector2D(Offset.x, Offset.y))
end

function M:SwitchShowMouseCursorInPIE(bShow)
end

return M
