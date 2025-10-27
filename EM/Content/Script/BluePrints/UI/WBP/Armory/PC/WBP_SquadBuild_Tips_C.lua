local ModController = require("BluePrints.UI.WBP.Armory.Mod.Utils.ModController")
require("UnLua")
local WBP_Build_Tips_C = Class({
  "BluePrints.UI.BP_EMUserWidget_C",
  "BluePrints.Common.DelayFrameComponent"
})

function WBP_Build_Tips_C:Construct()
  self.Btn_Armory:SetDefaultGamePadImg("View")
  self.Edit_Tips.Btn_Confirm:SetDefaultGamePadImg("X")
end

function WBP_Build_Tips_C:InitWidget(Params)
  DebugPrint("thy      Widget is Initing!!!!!!!!!!!!!")
  self:PlayAnimation(self.In)
  self:InitData(Params)
  self:InitUI()
  self.Btn_Armory:SetText(GText("UI_BAG_Gotoarmory"))
  self.Btn_Armory:BindEventOnClicked(self.Owner, self.GoToArmoryCallback)
end

function WBP_Build_Tips_C:InitUI()
  if self.ItemInfo.Type ~= "Pet" then
    self.Switch_Tips:SetActiveWidgetIndex(0)
    self.Edit_Tips:SetComfirmCallball(self.MakeSureCallback, self.Owner)
    self.Edit_Tips:FreahWeaponView(self.Name, self.ItemInfo.Rarity, self.Uuid, nil, self.ItemInfo.Type == "Char")
    self.Edit_Tips.Btn_Confirm:SetText(GText("UI_Squad_Equip"))
    self.Edit_Tips.ModType01:SetFocus()
  else
    self.Switch_Tips:SetActiveWidgetIndex(1)
    self.Com_Tips:RefreshItemInfo(self.ItemInfo)
    self.Com_Tips:InitButtonEvent({
      ButtonIcon = 3,
      ButtonClickCallBack = self.ButtonEventCallback,
      ButtonClickText = "UI_Squad_Equip",
      ButtonClickPadKey = "Gamepad_FaceButton_Left"
    })
    self.Com_Tips.HandleKeyDown = false
    self:AddDelayFrameFunc(function()
      self.Com_Tips.Panel_Controller:SetVisibility(ESlateVisibility.Collapsed)
    end, 2, "DelayShow")
    self.Owner.IsPetTipsOpen = true
    self.Com_Tips:SetFocus()
  end
  self.Owner:SetCurFocusArea("Tip")
end

function WBP_Build_Tips_C:ButtonEventCallback()
  UIManager(self):GetUIObj("SquadMainUINew"):MakeSureCallback()
end

function WBP_Build_Tips_C:InitData(Params)
  self.ItemInfo = Params.ItemInfo
  self.Owner = Params.Owner
  self.MakeSureCallback = Params.MakeSureCallback
  self.GoToArmoryCallback = Params.GoToArmory
  if self.ItemInfo.Type ~= "Pet" then
    local ItemId = self.ItemInfo.UnitId
    if ItemId then
      self.Name = self.ItemInfo.Type == "Char" and DataMgr.Char[ItemId].CharName or DataMgr.Weapon[ItemId].WeaponName
    else
      self.Owner:CloseTips()
      return
    end
  end
  self.Uuid = self.ItemInfo.Uuid
end

function WBP_Build_Tips_C:CloseWidget()
  self:Close()
end

function WBP_Build_Tips_C:Handle_OnGamePadDown(InKeyName)
  if "Gamepad_FaceButton_Bottom" == InKeyName then
    return true
  end
  return false
end

function WBP_Build_Tips_C:OnKeyDown(MyGeometry, InKeyEvent)
  local IsEventHandled = false
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) then
    IsEventHandled = self:Handle_OnGamePadDown(InKeyName)
  else
  end
  if IsEventHandled then
    return UE4.UWidgetBlueprintLibrary.Handled()
  else
    return UE4.UWidgetBlueprintLibrary.UnHandled()
  end
end

return WBP_Build_Tips_C
