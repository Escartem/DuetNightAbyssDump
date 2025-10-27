require("UnLua")
local WBP_CommonDialogChangeKey_PC_C = Class("BluePrints.UI.UI_PC.Common.Common_Dialog.Common_Dialog_ContentBase")

function WBP_CommonDialogChangeKey_PC_C:InitContent(Params, PopupData, Owner)
  self.Super.InitContent(self, Params, PopupData, Owner)
  self.Params = Params
  self:UpdateState(Params)
end

function WBP_CommonDialogChangeKey_PC_C:UpdateState(Params)
  self.Params = Params
  if Params and Params.ActionNameText then
    self.Text_KeyName:SetText(GText(Params.ActionNameText))
  end
  if self.Params.OldKey then
    self.Key_Set:CreateCommonKey({
      KeyInfoList = {
        {
          Type = "Text",
          Text = self.Params.OldKey
        }
      }
    })
  end
  if self.Params.OldKey then
    self.Key_Now:CreateCommonKey({
      KeyInfoList = {
        {
          Type = "Text",
          Text = self.Params.OldKey
        }
      }
    })
  end
  if self.Params.NewKey then
    self.Key_Change:CreateCommonKey({
      KeyInfoList = {
        {
          Type = "Text",
          Text = self.Params.NewKey
        }
      }
    })
  end
  if Params and Params.StateName then
    self["Set" .. Params.StateName .. "State"](self)
  end
end

function WBP_CommonDialogChangeKey_PC_C:SetSetState()
  self.Content:SetActiveWidgetIndex(1)
end

function WBP_CommonDialogChangeKey_PC_C:SetChangeFirstState()
  self.Content:SetActiveWidgetIndex(2)
  self.Transition:SetActiveWidgetIndex(0)
end

function WBP_CommonDialogChangeKey_PC_C:SetChangeSecondState()
  self.Content:SetActiveWidgetIndex(2)
  self.Transition:SetActiveWidgetIndex(1)
end

return WBP_CommonDialogChangeKey_PC_C
