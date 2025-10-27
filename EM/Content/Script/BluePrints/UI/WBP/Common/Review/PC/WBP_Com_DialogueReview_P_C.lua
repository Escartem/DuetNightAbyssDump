require("UnLua")
local M = Class("BluePrints.UI.BP_UIState_C")

function M:Construct()
  if CommonUtils.GetDeviceTypeByPlatformName(self) == "PC" then
    local KeyText = CommonUtils:GetKeyText(CommonUtils:GetActionMappingKeyName("OpenMenu"))
    self.Key_Close:CreateCommonKey({
      KeyInfoList = {
        {
          Type = "Text",
          Text = KeyText,
          ClickCallback = self.CloseSelf,
          Owner = self
        }
      },
      Desc = GText("UI_Rouge_Event_ReviewESC")
    })
  end
  self.Btn_Close:Init("Close", self, self.CloseSelf)
end

function M:InitUIInfo(Name, IsInUIMode, EventList, DialogueList, ParentUI)
  self:SetFocus()
  AudioManager(self):PlayUISound(self, "event:/ui/roguelike/level_event_review_show", nil, nil)
  self:InitList(DialogueList)
  self.ParentUI = ParentUI
  self.Super.InitUIInfo(self, Name, IsInUIMode, EventList, DialogueList, ParentUI)
end

function M:InitList(DialogueList)
  self.ListView:ClearListItems()
  DebugPrint(#DialogueList)
  for i = 1, #DialogueList do
    local Obj = NewObject(self.ListContentClass)
    Obj.DialogueType = DialogueList[i].DialogueType
    Obj.SpeakerName = DialogueList[i].SpeakerName
    Obj.DialogueContent = DialogueList[i].DialogueContent
    self.ListView:AddItem(Obj)
  end
end

function M:OnPreviewKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if "Escape" == InKeyName then
    self:CloseSelf()
  elseif "Tab" == InKeyName then
    self:CloseSelf()
  end
  return self.Super.OnPreviewKeyDown(self, MyGeometry, InKeyEvent)
end

function M:CloseSelf()
  if not self.IsInit then
    return
  end
  self:Close()
  if self.ParentUI then
    self.ParentUI:SetFocus()
  end
end

return M
