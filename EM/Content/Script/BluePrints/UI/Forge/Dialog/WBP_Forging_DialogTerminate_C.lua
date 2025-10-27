local ForgeConst = require("Blueprints.UI.Forge.ForgeConst")
local ForgeUtils = require("Blueprints.UI.Forge.ForgeUtils")
local TimeUtils = require("Utils.TimeUtils")
local ControllerFSM = require("Blueprints.UI.ControllerFSM")
require("UnLua")
local WBP_Forging_DialogTerminate_C = Class("BluePrints.UI.UI_PC.Common.Common_Dialog.Common_Dialog_ContentBase")
local FSMState = {
  Normal = 1,
  CheckItem = 2,
  ShowTip = 3
}

function WBP_Forging_DialogTerminate_C:InitContent(Params, PopupData, Owner)
  self.Super.InitContent(self, Params, PopupData, Owner)
  self.CancelParams = Params.CancelParams
  self:InitView()
end

function WBP_Forging_DialogTerminate_C:InitView()
  self.Text_TitleDone:SetText(GText("UI_FORGING_COMPLETED"))
  self.Text_TitleRefund:SetText(GText("UI_Return_Forge_Unfinished"))
  self.Text_Empty:SetText(GText("No_Blueprints"))
  table.sort(self.CancelParams.ReturnItemList, function(Item_1, Item_2)
    local ResRarity_1 = ItemUtils.GetItemRarity(Item_1.ItemId, Item_1.ItemType)
    local ResRarity_2 = ItemUtils.GetItemRarity(Item_2.ItemId, Item_2.ItemType)
    if ResRarity_1 ~= ResRarity_2 then
      return ResRarity_1 > ResRarity_2
    end
    local RewardTypeData_1 = DataMgr.RewardType[Item_1.ItemType]
    local RewardTypeData_2 = DataMgr.RewardType[Item_2.ItemType]
    if RewardTypeData_1.DungeonRewardSeq ~= RewardTypeData_2.DungeonRewardSeq then
      return RewardTypeData_1.DungeonRewardSeq > RewardTypeData_2.DungeonRewardSeq
    end
    return Item_1.ItemId > Item_2.ItemId
  end)
  for Index, Item in ipairs(self.CancelParams.ReturnItemList) do
    local Widget = self.Material:GetChildAt(Index - 1)
    if not Widget then
      Widget = self:CreateWidgetNew("ComItemUniversalM")
      Widget.bIsFocusable = true
      Widget:SetVisibility(UE4.ESlateVisibility.Visible)
      self.Material:AddChild(Widget)
    end
    local ResRarity = ItemUtils.GetItemRarity(Item.ItemId, Item.ItemType)
    local ResourceIcon = ItemUtils.GetItemIconPath(Item.ItemId, Item.ItemType)
    Widget:Init({
      UIName = "ForgeMain",
      IsShowDetails = true,
      MenuPlacement = EMenuPlacement.MenuPlacement_MenuRight,
      Id = Item.ItemId,
      ItemType = Item.ItemType,
      Rarity = ResRarity,
      Icon = ResourceIcon,
      Count = Item.ItemNum,
      OnMenuOpenChangedEvents = {
        Obj = self,
        Callback = self.OnMenuOpenChange
      }
    })
  end
  if self.CancelParams.CompleteItem then
    local ResRarity = ItemUtils.GetItemRarity(self.CancelParams.CompleteItem.ItemId, self.CancelParams.CompleteItem.ItemType)
    local ResourceIcon = ItemUtils.GetItemIconPath(self.CancelParams.CompleteItem.ItemId, self.CancelParams.CompleteItem.ItemType)
    self.Item:Init({
      UIName = "ForgeMain",
      IsShowDetails = true,
      MenuPlacement = EMenuPlacement.MenuPlacement_MenuRight,
      Id = self.CancelParams.CompleteItem.ItemId,
      ItemType = self.CancelParams.CompleteItem.ItemType,
      Rarity = ResRarity,
      Icon = ResourceIcon,
      Count = self.CancelParams.CompleteItem.ItemNum,
      OnMenuOpenChangedEvents = {
        Obj = self,
        Callback = self.OnMenuOpenChange
      }
    })
    self.Switch_Type:SetActiveWidgetIndex(1)
  else
    self.Switch_Type:SetActiveWidgetIndex(0)
  end
  self.ControllerFSM = ControllerFSM.New(self, {
    [FSMState.Normal] = {
      OnEnter = self.OnEnterState_Normal
    },
    [FSMState.CheckItem] = {
      OnEnter = self.OnEnterState_CheckItem
    },
    [FSMState.ShowTip] = {
      OnEnter = self.OnEnterState_ShowTip
    }
  })
  local CurInputDeviceType = UIUtils.UtilsGetCurrentInputType()
  if CurInputDeviceType == UE4.ECommonInputType.Gamepad then
    self.ControllerFSM:Enter(FSMState.Normal)
  end
end

function WBP_Forging_DialogTerminate_C:OnEnterState_ShowTip()
  self:HideAllGamepadShortcut()
end

function WBP_Forging_DialogTerminate_C:OnEnterState_CheckItem()
  self:HideGamepadShortcut(self.GamepadCheckItemKeyInfo)
  self.GamepadBackKeyInfo = self:ShowGamepadShortcutBtn({
    KeyInfoList = {
      {
        Type = "Img",
        ImgShortPath = UIConst.GamePadImgKey.FaceButtonRight
      }
    },
    Desc = GText("UI_BACK")
  })
  self.GamepadCheckDetailsKeyInfo = self:ShowGamepadShortcutBtn({
    KeyInfoList = {
      {
        Type = "Img",
        ImgShortPath = UIConst.GamePadImgKey.FaceButtonBottom
      }
    },
    Desc = GText("UI_Controller_CheckDetails")
  })
  self:SetGamepadBtnKeyVisibility(false)
end

function WBP_Forging_DialogTerminate_C:OnEnterState_Normal()
  self:HideGamepadShortcut(self.GamepadBackKeyInfo)
  self:HideGamepadShortcut(self.GamepadCheckDetailsKeyInfo)
  self.GamepadCheckItemKeyInfo = self:ShowGamepadShortcutBtn({
    KeyInfoList = {
      {
        Type = "Img",
        ImgShortPath = UIConst.GamePadImgKey.LeftThumb
      }
    },
    Desc = GText("UI_Controller_CheckItems")
  })
  self:SetFocus()
  self:SetGamepadBtnKeyVisibility(true)
end

function WBP_Forging_DialogTerminate_C:OnMenuOpenChange(IsOpen)
  if IsOpen then
    self.ControllerFSM:Enter(FSMState.ShowTip)
  else
    self.ControllerFSM:Enter(FSMState.CheckItem)
  end
end

function WBP_Forging_DialogTerminate_C:OnContentKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local IsEventHandled = false
  if InKeyName == Const.GamepadLeftThumbstick then
    if self.ControllerFSM:Current() == FSMState.Normal then
      self.ControllerFSM:Enter(FSMState.CheckItem)
      if self.CancelParams.CompleteItem then
        self.Item:SetFocus()
      else
        local FirstWidget = self.Material:GetChildAt(0)
        if FirstWidget then
          FirstWidget:SetFocus()
        end
      end
    end
    IsEventHandled = true
  elseif InKeyName == Const.GamepadFaceButtonRight then
    if self.ControllerFSM:Current() == FSMState.CheckItem then
      self.ControllerFSM:Enter(FSMState.Normal)
      IsEventHandled = true
    end
  elseif InKeyName == Const.GamepadFaceButtonBottom and self.ControllerFSM:Current() == FSMState.CheckItem then
    self.ControllerFSM:Enter(FSMState.ShowTip)
  end
  return IsEventHandled
end

return WBP_Forging_DialogTerminate_C
