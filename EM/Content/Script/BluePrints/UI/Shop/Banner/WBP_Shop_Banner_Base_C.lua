require("UnLua")
local M = Class({
  "BluePrints.Common.TimerMgr",
  "BluePrints.UI.BP_EMUserWidget_C"
})
local TimeUtils = require("Utils.TimeUtils")

function M:GetBannerTabData(BpName)
  for _, BannerTab in ipairs(DataMgr.ShopBannerTab) do
    if BannerTab.Bp == BpName then
      return BannerTab
    end
  end
end

function M:Construct()
  if self.Btn_Drag then
    self.Btn_Drag.OnPressed:Add(self, self.OnBtnPressed)
    self.Btn_Drag.OnReleased:Add(self, self.OnBtnReleased)
  end
end

function M:Destruct()
  if self.RefreshTimer then
    self:RemoveTimer(self.RefreshTimer)
    self.RefreshTimer = nil
  end
end

function M:NotifyTimeTick()
  if not self.EndTime then
    return
  end
  local NowTime = TimeUtils.NowTime()
  if self.OnBannerExpire and NowTime >= self.EndTime then
    self:OnBannerExpire()
  end
  if self.BannerEndTime and NowTime >= self.BannerEndTime then
    self.Owner:OnBannerExpire()
    return
  end
  local RemainTimeDict, _ = UIUtils.GetLeftTimeStrStyle2(self.EndTime)
  self.Com_Time:SetTimeText(GText("UI_Mail_Date_Remain"), RemainTimeDict)
end

function M:InitInterface(Owner)
  self.Owner = Owner
  self.BannerEndTime = self.BannerTab and self.BannerTab.EndTime
  if self.EndTime then
    self.RefreshTimer = self:AddTimer(1, function()
      self:NotifyTimeTick()
    end, true, nil, nil, true)
    self:NotifyTimeTick()
  end
  if CommonUtils.GetDeviceTypeByPlatformName(self) ~= "Mobile" then
    self.Key_ControllerGoto = self.Key_ControllerGoto or self.Key_ControllerBuy
    self.Key_ControllerGoto:CreateCommonKey({
      KeyInfoList = {
        {
          Type = "Img",
          ImgShortPath = "A",
          Owner = self
        }
      }
    })
    self:UpdateUIStyleInterface(UIUtils.UtilsGetCurrentInputType())
  end
end

function M:UpdateUIStyleInterface(CurInputDevice)
  if not self.Key_ControllerGoto then
    return
  end
  local IsGamepad = CurInputDevice == ECommonInputType.Gamepad
  self.Key_ControllerGoto:SetVisibility(IsGamepad and ESlateVisibility.SelfHitTestInvisible or ESlateVisibility.Collapsed)
end

function M:OnGoToInterface()
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_large_crystal", nil, nil)
  if not self.BannerTab or not self.BannerTab.InterfaceJumpId then
    return
  end
  local JumpUIId = self.BannerTab.InterfaceJumpId
  PageJumpUtils:JumpToTargetPageByJumpId(JumpUIId)
end

function M:OnGoToHovered()
  AudioManager(self):PlayUISound(self, "event:/ui/common/hover_btn_large_crystal", nil, nil)
end

function M:UpdateSlotSize(Size)
  local Slot = UWidgetLayoutLibrary.SlotAsCanvasSlot(self.Group_Content)
  if Slot then
    Size.Y = Slot:GetSize().Y
    Slot:SetSize(Size)
  end
end

function M:BindBtnEvent(Obj, Func)
  self.Obj = Obj
  self.Func = Func
end

function M:OnBtnPressed()
  local MousePos = UWidgetLayoutLibrary.GetMousePositionOnPlatform()
  self.PressX = MousePos.X
end

function M:OnBtnReleased()
  local MousePos = UWidgetLayoutLibrary.GetMousePositionOnPlatform()
  if self.Func then
    self.Func(self.Obj, MousePos.X > self.PressX)
  end
end

function M:AdjustGroupDetail()
  if self.Group_Detail then
    local CanvasSlot = UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(self.Group_Detail)
    if CanvasSlot then
      local Position = CanvasSlot:GetPosition()
      if CommonUtils.GetDeviceTypeByPlatformName(self) == "Mobile" then
        Position.Y = self.Group_Detail_PositionY_M
      elseif CommonUtils.GetDeviceTypeByPlatformName(self) == "PC" then
        Position.Y = self.Group_Detail_PositionY_P
      end
      CanvasSlot:SetPosition(Position)
    end
  end
end

return M
