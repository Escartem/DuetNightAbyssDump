local WBP_ImpressionResult_Mobile = Class("BluePrints.Story.Talk.UI.Common.WBP_ImpressionResult_Common")
local ECheckMode = {
  Normal = "Normal",
  ImpressionShop = "ImpressionShop"
}

function WBP_ImpressionResult_Mobile:AdaptPlatform()
  DebugPrint("WBP_ImpressionResult_Mobile:AdaptPlatform")
  self.WS_Key:SetActiveWidgetIndex(1)
  self.Com_BtnClose:Init("Close", self, self.OnBtn_EscPressed)
  self.Button_Skip:BindEventOnClicked(self, self.OnSkipButtonClicked)
  self.Button_Skip:SetCurrentTextBlock(GText("UI_TALK_SKIP_MOIILE"))
end

function WBP_ImpressionResult_Mobile:SwitchBindDicePressInput(bBind)
  DebugPrint("WBP_ImpressionResult_Mobile:SwitchBindDicePressInput", bBind)
  self.bListenPressInput = bBind
  if bBind then
    self.WS_Key:SetActiveWidgetIndex(1)
    self.Btn_Dice:SetVisibility(UE4.ESlateVisibility.Visible)
    self.Btn_Dice.OnPressed:Add(self, self.OnBtn_DicePressed)
    self.Group_Close:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  else
    self.Btn_Dice.OnPressed:Clear()
    self.Group_Close:SetVisibility(ESlateVisibility.Collapsed)
  end
end

function WBP_ImpressionResult_Mobile:SwitchBindDiceReleaseInput(bBind)
  DebugPrint("WBP_ImpressionResult_Mobile:SwitchBindDiceReleaseInput", bBind)
  self.bListenReleaseInput = bBind
  if bBind then
    self.Btn_Dice:SetVisibility(UE4.ESlateVisibility.Visible)
    self.Btn_Dice.OnReleased:Add(self, self.OnBtn_DiceReleased)
  else
    self.Btn_Dice:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    self.Btn_Dice.OnReleased:Clear()
  end
end

function WBP_ImpressionResult_Mobile:SwitchBindSkipInput(bBind)
  DebugPrint("WBP_ImpressionResult_Mobile:SwitchBindSkipInput", bBind)
  if bBind then
    self.WS_Key:SetActiveWidgetIndex(0)
    self.Button_Skip:SetVisibility(ESlateVisibility.Visible)
  else
    self.Button_Skip:SetVisibility(ESlateVisibility.Collapsed)
  end
end

return WBP_ImpressionResult_Mobile
