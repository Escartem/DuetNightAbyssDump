require("UnLua")
local M = Class("BluePrints.UI.BP_EMUserWidget_C")

function M:Construct()
  self.Common_Key_Btn_Desc_A_PC_Auto:CreateCommonKey({
    KeyInfoList = {
      {Type = "Text", Text = "Tab"}
    },
    bLongPress = false,
    Desc = GText("UI_TALK_AUTO_1")
  })
  self.Common_Key_Btn_Desc_A_PC_Auto:AddExecuteLogic(self, self.OnAutoPlayClicked)
  self.Common_Key_Btn_Desc_A_PC_Skip:CreateCommonKey({
    SoundFunc = function()
    end,
    KeyInfoList = {
      {
        Type = "Text",
        Text = GText("SpaceBar")
      }
    },
    bLongPress = true,
    Desc = GText("UI_TALK_SKIP")
  })
  self.Common_Key_Btn_Desc_A_PC_Skip:AddExecuteLogic(self, self.OnSkipClicked)
  self.bAutoPlay = false
end

function M:ChangeToDiceMode(Obj, Func)
  self:DisableAutoPlay()
  self.Common_Key_Btn_Desc_A_PC_Auto:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self:EnableSkip()
  self.Common_Key_Btn_Desc_A_PC_Skip:CreateCommonKey({
    KeyInfoList = {
      {
        Type = "Text",
        Text = GText("SpaceBar")
      }
    },
    bLongPress = false,
    Desc = GText("UI_Impression_Throw")
  })
end

function M:SetAutoPlay(bAutoPlay)
  self.bAutoPlay = bAutoPlay
  if bAutoPlay then
    self.Common_Key_Btn_Desc_A_PC_Auto:SetDescription(GText("UI_TALK_AUTO_2"))
    self.Common_Key_Btn_Desc_A_PC_Auto:PlayLoopAnim()
  else
    self.Common_Key_Btn_Desc_A_PC_Auto:SetDescription(GText("UI_TALK_AUTO_1"))
    self.Common_Key_Btn_Desc_A_PC_Auto:StopLoopAnim()
  end
end

function M:OnAutoPlayClicked()
  if self.AutoPlayCallback then
    self.AutoPlayCallback.Func(self.AutoPlayCallback.Obj, not self.bAutoPlay)
  end
  self:SetAutoPlay(not self.bAutoPlay)
end

function M:OnSkipClicked()
  if self.SkipCallback then
    self.SkipCallback.Func(self.SkipCallback.Obj)
  end
end

function M:DisableAutoPlay()
  self.Common_Key_Btn_Desc_A_PC_Auto:DisableKey()
end

function M:EnableAutoPlay()
  self.Common_Key_Btn_Desc_A_PC_Auto:EnableKey()
end

function M:DisableSkip()
  self.Common_Key_Btn_Desc_A_PC_Skip:DisableKey()
end

function M:EnableSkip()
  self.Common_Key_Btn_Desc_A_PC_Skip:EnableKey()
end

function M:BindAutoPlay(InObj, InFunc)
  self.AutoPlayCallback = {Func = InFunc, Obj = InObj}
end

function M:UnbindAutoPlay(InObj, InFunc)
  self.AutoPlayCallback = nil
end

function M:BindSkip(InObj, InFunc)
  self.SkipCallback = {Func = InFunc, Obj = InObj}
end

function M:UnbindSkip()
  self.SkipInfo = nil
end

function M:SetAutoPlayButtonHidden(bHidden)
  if bHidden then
    self.Common_Key_Btn_Desc_A_PC_Auto:SetVisibility(ESlateVisibility.Collapsed)
  else
    self.Common_Key_Btn_Desc_A_PC_Auto:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  end
end

function M:SetSkipButtonHidden(bHidden)
  if bHidden then
    self.Common_Key_Btn_Desc_A_PC_Skip:SetVisibility(ESlateVisibility.Collapsed)
  else
    self.Common_Key_Btn_Desc_A_PC_Skip:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  end
end

function M:GetAutoPlayButtonHidden()
  return self.Common_Key_Btn_Desc_A_PC_Auto:GetVisibility() == ESlateVisibility.Collapsed
end

function M:GetSkipButtonHidden()
  return self.Common_Key_Btn_Desc_A_PC_Skip:GetVisibility() == ESlateVisibility.Collapsed
end

function M:OnAutoKeyPressed()
  self.Common_Key_Btn_Desc_A_PC_Auto:OnShortCutPressed()
end

function M:OnAutoKeyReleased()
  self.Common_Key_Btn_Desc_A_PC_Auto:OnShortCutReleased()
end

function M:OnSkipKeyPressed()
  self.Common_Key_Btn_Desc_A_PC_Skip:OnShortCutPressed()
end

function M:OnSkipKeyReleased()
  self.Common_Key_Btn_Desc_A_PC_Skip:OnShortCutReleased()
end

function M:OnActive()
  self:StopAllAnimations()
  self:PlayAnimation(self.In)
end

function M:OnDeactive()
  self:StopAllAnimations()
  self:PlayAnimation(self.Out)
end

return M
