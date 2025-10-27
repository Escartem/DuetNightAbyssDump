require("UnLua")
local M = Class({
  "BluePrints.UI.BP_UIState_C"
})
M._components = {
  "BluePrints.UI.WBP.PersonInfo.Data.PersonInfoDataPageBaseView"
}

function M:Construct()
  self:AddTimer(0.2, function()
    self:InitTab()
    self:InitNormalBottonKey()
  end)
  self.Com_SortDown:BindOnRemovedFromFocusPathEvent(self, function()
    if self.IsGamePad then
      self:InitNormalBottonKey()
    end
  end)
  self:SetFocus()
end

function M:InitNormalBottonKey()
  DebugPrint("InitNormalBottonKey The Length of ScrollBox is :" .. self.ScrollBox:GetScrollOffsetOfEnd())
  if self.ScrollBox:GetScrollOffsetOfEnd() > 1 then
    self:InitTab()
  else
    self:InitTabWithoutScroll()
  end
end

function M:InitBaseView()
end

function M:InitTab()
  local TabInfo = {
    Tabs = self.AllTabInfo,
    DynamicNode = {
      "Back",
      "Tip",
      "BottomKey"
    },
    BottomKeyInfo = {
      {
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "RV",
            Owner = self
          }
        },
        Desc = GText("UI_Controller_Slide")
      },
      {
        KeyInfoList = {
          {
            Type = "Text",
            Text = "Esc",
            ClickCallback = self.OnReturnKeyDown,
            Owner = self
          }
        },
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "B",
            ClickCallback = self.OnReturnKeyDown,
            Owner = self
          }
        },
        Desc = GText("UI_BACK")
      }
    },
    StyleName = "Text",
    OwnerPanel = self,
    TitleName = GText("UI_PersonInfo_Name"),
    BackCallback = self.OnReturnKeyDown
  }
  self.Root.Com_Tab:Init(TabInfo)
end

function M:InitTabWithScroll()
  local ScroolKeyInfo = {
    GamePadInfoList = {
      {
        Type = "Img",
        ImgShortPath = "RV",
        Owner = self
      }
    },
    Desc = GText("UI_Controller_Slide")
  }
  local BottomKeyInfo = {
    {
      GamePadInfoList = {
        {
          Type = "Img",
          ImgShortPath = "RV",
          Owner = self
        }
      },
      Desc = GText("UI_Controller_Slide")
    },
    {
      KeyInfoList = {
        {
          Type = "Text",
          Text = "Esc",
          ClickCallback = self.OnReturnKeyDown,
          Owner = self
        }
      },
      GamePadInfoList = {
        {
          Type = "Img",
          ImgShortPath = "B",
          ClickCallback = self.OnReturnKeyDown,
          Owner = self
        }
      },
      Desc = GText("UI_BACK")
    }
  }
  self.Root.Com_Tab:UpdateSingleBottomKeyInfo(ScroolKeyInfo)
end

function M:InitTabWithoutScroll()
  local BottomKeyInfo = {}
  self.Root.Com_Tab:UpdateSingleBottomKeyInfo(1, BottomKeyInfo)
end

function M:InitTabInSortDown()
  local BottomKeyInfo = {
    {
      GamePadInfoList = {
        {
          Type = "Img",
          ImgShortPath = "A",
          Owner = self
        }
      },
      Desc = GText("UI_Tips_Ensure")
    },
    {
      KeyInfoList = {
        {
          Type = "Text",
          Text = "Esc",
          ClickCallback = self.OnReturnKeyDown,
          Owner = self
        }
      },
      GamePadInfoList = {
        {
          Type = "Img",
          ImgShortPath = "B",
          ClickCallback = self.OnReturnKeyDown,
          Owner = self
        }
      },
      Desc = GText("UI_BACK")
    }
  }
  self.Root.Com_Tab:UpdateBottomKeyInfo(BottomKeyInfo)
end

function M:OnReturnKeyDown()
end

function M:OnKeyDown(MyGeometry, InKeyEvent)
  local IsEventHandled = false
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  self.Com_SortDown:ReceiveKeyDown_Lua(MyGeometry, InKeyEvent)
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) then
    self.IsGamePad = true
    IsEventHandled = self:OnGamePadDown(InKeyName)
    return UE4.UWidgetBlueprintLibrary.Handled()
  else
    self.IsGamePad = false
    if "Escape" == InKeyName then
      self:OnReturnKeyDown()
      IsEventHandled = true
    end
  end
  return UE4.UWidgetBlueprintLibrary.Handled()
end

function M:OnGamePadDown(InKeyName)
  local IsEventHandled = false
  ScreenPrint("OnGamePadDown" .. InKeyName)
  if InKeyName == UIConst.GamePadKey.FaceButtonRight then
    self:OnReturnKeyDown()
    IsEventHandled = true
  elseif InKeyName == UIConst.GamePadKey.LeftThumb then
    self:InitTabInSortDown()
  end
  return IsEventHandled
end

function M:OnAnalogValueChanged(MyGeometry, InAnalogInputEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InAnalogInputEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if InKeyName == UIConst.GamePadKey.RightAnalogY then
    local DeltaOffset = -1 * UKismetInputLibrary.GetAnalogValue(InAnalogInputEvent) * 20
    if self.ScrollBox then
      self:AddDeltaOffset(DeltaOffset)
    end
  end
  return UIUtils.Handled
end

function M:AddDeltaOffset(DeltaOffset)
  local CurrentOffset = self.ScrollBox:GetScrollOffset()
  local OffsetToEnd = self.ScrollBox:GetScrollOffsetOfEnd()
  local NextOffset = math.clamp(CurrentOffset + DeltaOffset, 0, OffsetToEnd)
  ScreenPrint("CurrentOffset  " .. CurrentOffset .. "  OffsetToEnd  " .. OffsetToEnd)
  self.ScrollBox:SetScrollOffset(NextOffset)
end

AssembleComponents(M)
return M
