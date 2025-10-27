require("UnLua")
local WikiCommon = require("BluePrints.UI.WBP.Wiki.WikiCommon")
local M = Class("BluePrints.UI.BP_UIState_C")

function M:Construct()
  self.IconMap = {
    [0] = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_System.T_Tab_System'",
    [2] = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_Monster.T_Tab_Monster'",
    [3] = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_Machine.T_Tab_Machine'",
    [4] = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_Battle.T_Tab_Battle'",
    [5] = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_System.T_Tab_System'",
    [6] = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_Level.T_Tab_Level'"
  }
  self.TextMap = {
    [0] = GText("UI_Wiki_EntryUnlock"),
    [2] = GText("UI_Monster_Tutorial"),
    [3] = GText("UI_Mechanism_Tutorial"),
    [4] = GText("UI_Combat_Tutorial"),
    [5] = GText("UI_System_Tutorial"),
    [6] = GText("UI_Dungeon_Tutorial")
  }
end

function M:InitUIInfo(Name, IsInUIMode, EventList, ...)
  AudioManager(self):PlayUISound(self, "event:/ui/common/tutorial_info_show", nil, nil)
  self.GuideNoteId = (...)
  if self.GuideNoteId == WikiCommon.WikiTipsGuideNoteId then
    self.GuideNoteTab = 0
    self.WS_Key:SetVisibility(ESlateVisibility.Collapsed)
  else
    self.GuideNoteTab = DataMgr.GuideBook[self.GuideNoteId].GuideNoteTab
  end
  assert(self.IconMap[self.GuideNoteTab], "\228\184\141\229\173\152\229\156\168" .. self.GuideNoteTab .. "\229\143\183GuideNoteTab")
  local Icon = LoadObject(self.IconMap[self.GuideNoteTab])
  local Material = self.Image_BookType:GetDynamicMaterial()
  Material:SetTextureParameterValue("Mask", Icon)
  if CommonUtils.GetDeviceTypeByPlatformName(self) == "Mobile" then
    self.WS_Key:SetVisibility(ESlateVisibility.Collapsed)
    if self.GuideNoteId ~= WikiCommon.WikiTipsGuideNoteId then
      self.Btn_ClickPhone.OnClicked:Add(self, self.OpenGuideBook)
    end
  else
    local IconList = UIUtils.GetIconListByActionName("OpenGuideBook")
    self.Com_KeyAdd:CreateCommonKey({
      KeyInfoList = {
        {
          Type = "Img",
          ImgShortPath = IconList[1],
          Owner = self
        },
        {
          Type = "Img",
          ImgShortPath = IconList[2],
          Owner = self
        }
      },
      Type = "Add"
    })
    self.KeyText = CommonUtils:GetKeyText(CommonUtils:GetActionMappingKeyName("OpenGuideBook"))
    self.Common_Key_Show_Text_PC:CreateCommonKey({
      KeyInfoList = {
        {
          Type = "Text",
          Text = self.KeyText
        }
      }
    })
  end
  self.Text_BookType:SetText(self.TextMap[self.GuideNoteTab])
  if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
    self.WS_Key:SetActiveWidgetIndex(1)
  else
    self.WS_Key:SetActiveWidgetIndex(0)
  end
  if self.GuideNoteId ~= WikiCommon.WikiTipsGuideNoteId then
    self:ListenForInputAction("OpenGuideBook", EInputEvent.IE_Pressed, true, {
      self,
      self.OpenGuideBook
    })
  end
  self.Super.InitUIInfo(self, Name, IsInUIMode, EventList, ...)
end

function M:OnLoaded(...)
  self.CloseTimer = self:AddTimer(2.5, self.Close, false, nil, nil, false)
end

function M:OpenGuideBook()
  local UIManager = GWorld.GameInstance:GetGameUIManager()
  if not UIManager then
    return
  end
  self:RemoveTimer(self.CloseTimer)
  self:Close()
  UIManager:LoadUINew("GuideBook", self.GuideNoteTab, self.GuideNoteId)
end

function M:OnUpdateUIStyleByInputTypeChange(CurInputType, CurGamepadName)
  self.Super.OnUpdateUIStyleByInputTypeChange(self, CurInputType, CurGamepadName)
  if CurInputType == ECommonInputType.Gamepad then
    self.WS_Key:SetActiveWidgetIndex(1)
  else
    self.WS_Key:SetActiveWidgetIndex(0)
  end
end

return M
