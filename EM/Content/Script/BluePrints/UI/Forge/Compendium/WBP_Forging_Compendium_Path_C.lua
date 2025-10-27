require("UnLua")
local ForgeModel = require("Blueprints.UI.Forge.ForgeDataModel")
local ForgeConst = require("Blueprints.UI.Forge.ForgeConst")
local ControllerFSM = require("Blueprints.UI.ControllerFSM")
local WBP_Forging_Compendium_Path_C = Class("BluePrints.UI.BP_UIState_C")
local CompemdiumPathStates = {Normal = 1, FocusRight = 2}

function WBP_Forging_Compendium_Path_C:OnEnterState_Normal()
  self:UpdateGamepadBottomKeyInfo({
    ForgeConst.BottomKeyTypes.BottomKey_Back
  })
end

function WBP_Forging_Compendium_Path_C:OnEnterState_FocusRight()
  self:UpdateGamepadBottomKeyInfo({
    ForgeConst.BottomKeyTypes.BottomKey_Confirm,
    ForgeConst.BottomKeyTypes.BottomKey_Back
  })
end

function WBP_Forging_Compendium_Path_C:OnLoaded(DraftId)
  self.Super.OnLoaded(self)
  self.GamepadKeyCofig = {
    [ForgeConst.BottomKeyTypes.BottomKey_Back] = {
      KeyInfoList = {
        {
          Type = "Img",
          ImgShortPath = UIConst.GamePadImgKey.FaceButtonRight,
          Owner = self
        }
      },
      Desc = GText("UI_BACK")
    },
    [ForgeConst.BottomKeyTypes.BottomKey_Confirm] = {
      KeyInfoList = {
        {
          Type = "Img",
          ImgShortPath = UIConst.GamePadImgKey.FaceButtonBottom,
          Owner = self
        }
      },
      Desc = GText("UI_Tips_Ensure")
    }
  }
  self.ControllerFSM = ControllerFSM.New(self, {
    [CompemdiumPathStates.Normal] = {
      OnEnter = function()
        self:OnEnterState_Normal()
      end
    },
    [CompemdiumPathStates.FocusRight] = {
      OnEnter = function()
        self:OnEnterState_FocusRight()
      end
    }
  })
  self:Init(DraftId)
end

function WBP_Forging_Compendium_Path_C:UpdateGamepadBottomKeyInfo(KeyInfoTypeList)
  if not UIUtils.IsGamepadInput() then
    return
  end
  local KeyInfo = {}
  for Index, Value in ipairs(KeyInfoTypeList) do
    table.insert(KeyInfo, self.GamepadKeyCofig[Value])
  end
  self.Key_Tips:UpdateKeyInfo(KeyInfo)
end

function WBP_Forging_Compendium_Path_C:Init(DraftId)
  self.ControllerFSM:Enter(CompemdiumPathStates.Normal)
  self.PathTree:SetCompendiumMode(true)
  self.PathTree:Init(DraftId, nil, ForgeModel)
  self.PathTree.OnClosedCallback = {
    self,
    self.HandleCloseDraftPathView
  }
  self.PathTree.OnFocusToDetailsView = {
    self,
    self.OnFocusToDetailsView
  }
  self.PathTree.OnFocusToPathView = {
    self,
    self.RefocusToPathView
  }
  self:UpdateGamepadBottomKeyInfo({
    ForgeConst.BottomKeyTypes.BottomKey_Back
  })
  self:RefreshOpInfoByInputDevice()
end

function WBP_Forging_Compendium_Path_C:OnFocusToDetailsView()
  self.ControllerFSM:Enter(CompemdiumPathStates.FocusRight)
end

function WBP_Forging_Compendium_Path_C:RefocusToPathView()
  self.ControllerFSM:Enter(CompemdiumPathStates.Normal)
end

function WBP_Forging_Compendium_Path_C:OnKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local IsEventHandled = false
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) then
    IsEventHandled = self:Handle_KeyDownOnGamePad(InKeyName)
  elseif "Escape" == InKeyName then
    self.PathTree:OnClose()
    IsEventHandled = true
  end
  if IsEventHandled then
    return UE4.UWidgetBlueprintLibrary.Handled()
  else
    return UE4.UWidgetBlueprintLibrary.Unhandled()
  end
end

function WBP_Forging_Compendium_Path_C:Handle_KeyDownOnGamePad(InKeyName)
  local CurrentState = self.ControllerFSM:Current()
  local IsEventHandled = false
  return IsEventHandled
end

function WBP_Forging_Compendium_Path_C:HandleCloseDraftPathView()
  self.PathTree.HasPreInit = false
  self:Close()
end

function WBP_Forging_Compendium_Path_C:RefreshOpInfoByInputDevice(CurInputType, CurGamepadName)
  if UIUtils.IsGamepadInput() then
    self.ControllerFSM:Enter(CompemdiumPathStates.Normal)
    self.Key_Tips:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  elseif UIUtils.IsKeyboardInput() then
    self.Key_Tips:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
end

return WBP_Forging_Compendium_Path_C
