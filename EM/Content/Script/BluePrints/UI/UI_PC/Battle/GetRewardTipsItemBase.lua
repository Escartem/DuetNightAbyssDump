require("UnLua")
local GetRewardTipsItemBase = Class("BluePrints.UI.BP_EMUserWidget_C")

function GetRewardTipsItemBase:Construct()
  if not self:IsTipsCanUse() then
    return
  end
  self:CleanUp()
end

function GetRewardTipsItemBase:CleanUp()
  self.ItemId = nil
  self.ItemCount = nil
  self.Duration = -1
  self:SetVisibility(ESlateVisibility.Collapsed)
  self:StopListeningForAllInputActions()
end

function GetRewardTipsItemBase:IsTipsCanUse()
  return self.ItemId == nil
end

function GetRewardTipsItemBase:CloseSelf()
  self:CleanUp()
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  local UIManger = GameInstance:GetGameUIManager()
  local PickUpInfoTipsUI
  local BattleMain = UIManger:GetUIObj("BattleMain")
  if BattleMain then
    PickUpInfoTipsUI = BattleMain.Battle_Combat_Pickup
  end
  if PickUpInfoTipsUI then
    PickUpInfoTipsUI:OnTipsItemClose(self)
  end
end

function GetRewardTipsItemBase:GetParentUI()
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  local UIManger = GameInstance:GetGameUIManager()
  local PickUpInfoTipsUI
  if CommonUtils.GetDeviceTypeByPlatformName(self) ~= "PC" then
    PickUpInfoTipsUI = UIManger:GetUIObj("PickUpInfoTips")
    if not PickUpInfoTipsUI then
      PickUpInfoTipsUI = UIManger:LoadUI(UIConst.PICKUPITEMTIPS, "PickUpInfoTips", UIConst.ZORDER_FOR_NORMAL)
    end
  else
    local BattleMain = UIManger:GetUIObj("BattleMain")
    if BattleMain then
      PickUpInfoTipsUI = BattleMain.Battle_Combat_Pickup
    end
  end
  return PickUpInfoTipsUI
end

return GetRewardTipsItemBase
