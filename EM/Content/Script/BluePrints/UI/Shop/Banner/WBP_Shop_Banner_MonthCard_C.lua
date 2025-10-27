require("UnLua")
local MonthCardController = require("BluePrints.UI.WBP.Perk.MonthCard.MonthCardController")
local MonthCardCommon = require("BluePrints.UI.WBP.Perk.MonthCard.MonthCardCommon")
local MonthCardModel = require("BluePrints.UI.WBP.Perk.MonthCard.MonthCardModel")
local ItemUtil = require("Utils.ItemUtils")
local M = Class("BluePrints.UI.Shop.Banner.WBP_Shop_Banner_Base_C")

function M:Construct()
  M.Super.Construct(self)
end

function M:InitBannerPage(BannerId)
  self.WBP_Shop_MonthCard:InitBannerPage(BannerId)
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
  if IsValid(self.GameInputModeSubsystem) then
    self:RefreshOpInfoByInputDevice(self.GameInputModeSubsystem:GetCurrentInputType(), self.GameInputModeSubsystem:GetCurrentGamepadName())
  end
end

function M:PlayAnimationIn()
  self.WBP_Shop_MonthCard:PlayAnimationIn()
end

function M:PlayAnimationOut()
  self.WBP_Shop_MonthCard:PlayAnimationOut()
end

function M:OnPreviewKeyDown(MyGeometry, InKeyEvent)
  if self.WBP_Shop_MonthCard.OnPreviewKeyDown then
    return self.WBP_Shop_MonthCard:OnPreviewKeyDown(MyGeometry, InKeyEvent)
  end
  return UIUtils.UnHandled
end

function M:OnKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) then
    return self:OnGamePadDown(InKeyName)
  else
    return self:OnPCKeyDown(InKeyName)
  end
end

function M:OnKeyUp(MyGeometry, InKeyEvent)
  if self.WBP_Shop_MonthCard.OnKeyUp then
    return self.WBP_Shop_MonthCard:OnKeyUp(MyGeometry, InKeyEvent)
  end
  return UIUtils.UnHandled
end

function M:OnGamePadDown(InKeyName)
  if self.WBP_Shop_MonthCard.OnKeyDown then
    return self.WBP_Shop_MonthCard:OnKeyDown(nil, InKeyName)
  end
  return UIUtils.UnHandled
end

function M:OnPCKeyDown(InKeyName)
  if self.WBP_Shop_MonthCard.OnKeyDown then
    return self.WBP_Shop_MonthCard:OnKeyDown(nil, InKeyName)
  end
  return UIUtils.UnHandled
end

function M:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  if self.WBP_Shop_MonthCard.RefreshOpInfoByInputDevice then
    self.WBP_Shop_MonthCard:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  end
end

function M:OnGoToInterface()
  if self.WBP_Shop_MonthCard.OnKeyDown then
    self.WBP_Shop_MonthCard:OnKeyDown(nil, "SpaceBar")
  end
end

function M:SetListItem(ListItem)
  if self.WBP_Shop_MonthCard.SetListItem then
    self.WBP_Shop_MonthCard:SetListItem(ListItem)
  end
end

return M
