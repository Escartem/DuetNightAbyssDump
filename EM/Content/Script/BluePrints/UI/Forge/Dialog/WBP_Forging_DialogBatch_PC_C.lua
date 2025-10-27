local ForgeConst = require("Blueprints.UI.Forge.ForgeConst")
local ForgeUtils = require("Blueprints.UI.Forge.ForgeUtils")
local TimeUtils = require("Utils.TimeUtils")
local ControllerFSM = require("Blueprints.UI.ControllerFSM")
local FSMState = {
  Normal = 1,
  CheckItem = 2,
  ShowTip = 3
}
require("UnLua")
local WBP_Forging_DialogBatch_PC_C = Class("BluePrints.UI.UI_PC.Common.Common_Dialog.Common_Dialog_ContentBase")

function WBP_Forging_DialogBatch_PC_C:InitContent(Params, PopupData, Owner)
  self.Super.InitContent(self, Params, PopupData, Owner)
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
  self.ForgeItemContent = Params.ForgeItemContent
  self.DraftInfo = Params.DraftInfo
  self:InitView()
end

function WBP_Forging_DialogBatch_PC_C:InitGamepadView()
  local CurrentState = self.ControllerFSM:Current()
  if not CurrentState then
    self.ControllerFSM:Enter(FSMState.Normal)
    return
  end
  if self.ControllerFSM:Current() == FSMState.CheckItem then
    self.Item:SetFocus()
  end
end

function WBP_Forging_DialogBatch_PC_C:OnEnterState_Normal()
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
  self.Slider:UpdateUIStyleInPlatform(true)
  self:SetGamepadBtnKeyVisibility(true)
end

function WBP_Forging_DialogBatch_PC_C:OnEnterState_CheckItem()
  self.Slider:UpdateUIStyleInPlatform(false)
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

function WBP_Forging_DialogBatch_PC_C:OnEnterState_ShowTip()
  self:HideAllGamepadShortcut()
end

function WBP_Forging_DialogBatch_PC_C:InitView()
  self.CurrentCount = 1
  local Content = ForgeUtils:ConstructItemContentFromDraftId(self.ForgeItemContent.Id)
  Content.IsShowDetails = true
  Content.OnMenuOpenChangedEvents = {
    Obj = self,
    Callback = self.OnMenuOpenChange
  }
  self.Item:Init(Content)
  self.Item:SetVisibility(UE4.ESlateVisibility.Visible)
  self.Slider:Init({
    InitValue = 1,
    MinValue = 1,
    MaxValue = math.min(self.ForgeItemContent.MaxCanProduceNum, 999),
    EnableMiniBtn = true,
    EnableMaxBtn = true,
    SliderChangeCallback = self.OnProduceValueChange,
    AddBtnCallback = self.OnProduceValueChange,
    MinusBtnCallback = self.OnProduceValueChange,
    OwnerPanel = self
  })
  self.Text_Num:SetText("1")
  self.Text_Total:SetText(FormatNumber(self.ForgeItemContent.MaxCanProduceNum, true))
  self.Text_Name:SetText(string.format("%s x%d", self.ForgeItemContent.ProductName, self.ForgeItemContent.ProductNum))
  self.Text_ForgeNum:SetText(GText("UI_Forge_Num"))
  if self.DraftInfo.IsInfinity then
    self.Switch_Num:SetActiveWidgetIndex(1)
  else
    self.Switch_Num:SetActiveWidgetIndex(0)
    self.Text_BluePrintsNumName:SetText(GText("UI_FORGING_BLUEPRINT"))
    self.Text_BluePrintsNum:SetText(FormatNumber(self.ForgeItemContent.Count, true))
    self.Text_BluePrintsNum:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  end
  self.Text_ItemCurrentOwned:SetText(GText("UI_FORGING_CURRENT"))
  self.Text_ItemOwnedNum:SetText(FormatNumber(self.ForgeItemContent.ProductCount, true))
  self:UpdateMaterials()
  local CurInputDeviceType = UIUtils.UtilsGetCurrentInputType()
  if CurInputDeviceType == UE4.ECommonInputType.Gamepad then
    self.ControllerFSM:Enter(FSMState.Normal)
  end
end

function WBP_Forging_DialogBatch_PC_C:UpdateMaterials()
  for Index = 1, 4 do
    local Widget = self.Material:GetChildAt(Index - 1)
    if not Widget then
      Widget = self:CreateWidgetNew("ComItemUniversalM")
      self.Material:AddChild(Widget)
    end
    Widget:SetNavigationRuleCustom(UE4.EUINavigation.Left, {
      self,
      self.OnNavigateLeft
    })
    Widget:SetNavigationRuleCustom(UE4.EUINavigation.Right, {
      self,
      self.OnNavigateRight
    })
    local ResInfo = self.ForgeItemContent.ResourcesNeed[Index]
    if ResInfo then
      local ResType = ResInfo.Type or "Resource"
      local ResId = ResInfo.ResId
      local ResourceData = DataMgr.Resource[ResId]
      local ResRarity = ItemUtils.GetItemRarity(ResId, ResType)
      local ResourceIcon = ItemUtils.GetItemIconPath(ResId, ResType)
      Widget:Init({
        UIName = "ForgeMain",
        IsShowDetails = true,
        MenuPlacement = EMenuPlacement.MenuPlacement_MenuRight,
        Id = ResId,
        ItemType = ResType,
        Rarity = ResRarity,
        Icon = ResourceIcon,
        Count = ResInfo.Have,
        NeedCount = ResInfo.Required,
        OnMenuOpenChangedEvents = {
          Obj = self,
          Callback = self.OnMenuOpenChange
        }
      })
      Widget:SetVisibility(UE4.ESlateVisibility.Visible)
    else
      Widget:Init({Id = 0})
      Widget:SetVisibility(UE4.ESlateVisibility.HitTestInvisible)
    end
  end
end

function WBP_Forging_DialogBatch_PC_C:BindOnProduceValueChange(Obj, Callback)
  self.OnProduceValueChangeCallback = {Obj, Callback}
end

function WBP_Forging_DialogBatch_PC_C:OnProduceValueChange(NewValue)
  self.CurrentCount = NewValue
  self.Text_Num:SetText(tostring(FormatNumber(NewValue, true)))
  self.Text_Name:SetText(string.format("%s x%d", self.ForgeItemContent.ProductName, self.ForgeItemContent.ProductNum * NewValue))
  self:UpdateNeedCount(NewValue)
  if self.OnProduceValueChangeCallback then
    local Obj = self.OnProduceValueChangeCallback[1]
    local Callback = self.OnProduceValueChangeCallback[2]
    Callback(Obj, NewValue)
  end
end

function WBP_Forging_DialogBatch_PC_C:OnMenuOpenChange(IsOpen)
  if IsOpen then
    self.ControllerFSM:Enter(FSMState.ShowTip)
  else
    self.ControllerFSM:Enter(FSMState.CheckItem)
  end
end

function WBP_Forging_DialogBatch_PC_C:UpdateNeedCount(NewCount)
  for Index = 1, 4 do
    local Widget = self.Material:GetChildAt(Index - 1)
    if not self.ForgeItemContent.ResourcesNeed[Index] then
      break
    end
    Widget.NeedCount = NewCount * self.ForgeItemContent.ResourcesNeed[Index].Required
    Widget:SetCount(Widget.Count, Widget.NeedCount)
  end
end

function WBP_Forging_DialogBatch_PC_C:PackageData()
  DebugPrint("Tianyi@ Produce count is : " .. tostring(self.CurrentCount))
  local Result = {}
  Result.Count = self.CurrentCount
  return Result
end

function WBP_Forging_DialogBatch_PC_C:OnContentKeyUp(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local IsEventHandled = false
  if self.Slider:Handle_KeyUpEventOnGamePad(InKeyName) then
    return true
  end
  return IsEventHandled
end

function WBP_Forging_DialogBatch_PC_C:OnContentKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local IsEventHandled = false
  if self.Slider:Handle_KeyDownEventOnGamePad(InKeyName) then
    return true
  end
  if InKeyName == Const.GamepadLeftThumbstick then
    if self.ControllerFSM:Current() == FSMState.Normal then
      self.ControllerFSM:Enter(FSMState.CheckItem)
      self.Item:SetFocus()
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

return WBP_Forging_DialogBatch_PC_C
