require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C",
  "BluePrints.Common.TimerMgr"
})

function M:Init(bUseGamePad)
  self:UpdateKeyImg(bUseGamePad)
  self.Key_Auto:AddPressLogic(self, self.OnAutoPlayPressed)
  self.Key_Auto:AddReleaseLogic(self, self.OnAutoPlayReleased)
  self.Key_Skip:AddPressLogic(self, self.OnSkipPressed)
  self.Key_Skip:AddReleaseLogic(self, self.OnSkipReleased)
end

function M:UpdateKeyImg(bUseGamePad)
  if self.InDiceThrowMode then
    self:ChangeToDiceThrowMode(bUseGamePad)
  else
    self:ChangeToDiceSkipMode(bUseGamePad)
  end
end

function M:ChangeToDiceThrowMode(bUseGamePad)
  local KeyType = "Text"
  if bUseGamePad then
    KeyType = "Img"
  end
  self:ShowAutoPlayButton(true)
  self.Key_Auto:CreateCommonKey({
    KeyInfoList = {
      {
        ImgShortPath = UIUtils.GetIconListByActionName("TalkSkip")[1],
        Type = KeyType,
        Text = CommonUtils:GetActionMappingKeyName("TalkSkip")
      }
    },
    bLongPress = false,
    Desc = GText("UI_Impression_Throw")
  })
  self.Key_Skip:CreateCommonKey({
    KeyInfoList = {
      {
        ImgShortPath = UIUtils.GetIconListByActionName("TalkExit")[1],
        Type = KeyType,
        Text = CommonUtils:GetActionMappingKeyName("TalkExit")
      }
    },
    bLongPress = false,
    Desc = GText("UI_BACK")
  })
  self.InDiceThrowMode = true
end

function M:ChangeToDiceSkipMode(bUseGamePad)
  local KeyType = "Text"
  if bUseGamePad then
    KeyType = "Img"
  end
  self:ShowAutoPlayButton(false)
  self.Key_Skip:CreateCommonKey({
    KeyInfoList = {
      {
        ImgShortPath = UIUtils.GetIconListByActionName("TalkSkip")[1],
        Type = KeyType,
        Text = CommonUtils:GetActionMappingKeyName("TalkSkip")
      }
    },
    bLongPress = false,
    Desc = GText("UI_TALK_SKIP_MOIILE")
  })
  self.InDiceThrowMode = false
end

function M:OnAutoPlayPressed()
  if self.AutoPlayPressCallback then
    self.AutoPlayPressCallback.Func(self.AutoPlayPressCallback.Obj)
  end
end

function M:OnAutoPlayReleased()
  if self.AutoPlayReleaseCallback then
    self.AutoPlayReleaseCallback.Func(self.AutoPlayReleaseCallback.Obj)
  end
end

function M:OnSkipPressed()
  if self.SkipPressCallback then
    self.SkipPressCallback.Func(self.SkipPressCallback.Obj)
  end
end

function M:OnSkipReleased()
  if self.SkipReleaseCallback then
    self.SkipReleaseCallback.Func(self.SkipReleaseCallback.Obj)
  end
end

function M:SwitchBindAutoPlay(bBind, InObj, InFunc, bPress)
  if bBind then
    self:BindAutoPlay_Internal(InObj, InFunc, bPress)
  else
    self:UnbindAutoPlay_Internal(bPress)
  end
end

function M:SwitchBindSkip(bBind, InObj, InFunc, bPress)
  if bBind then
    self:BindSkip_Internal(InObj, InFunc, bPress)
  else
    self:UnbindSkip_Internal(bPress)
  end
end

function M:BindAutoPlay_Internal(InObj, InFunc, bPress)
  if bPress then
    self.AutoPlayPressCallback = {Func = InFunc, Obj = InObj}
  else
    self.AutoPlayReleaseCallback = {Func = InFunc, Obj = InObj}
  end
end

function M:UnbindAutoPlay_Internal(bPress)
  if bPress then
    self.AutoPlayPressCallback = nil
  else
    self.AutoPlayReleaseCallback = nil
  end
end

function M:BindSkip_Internal(InObj, InFunc, bPress)
  if bPress then
    self.SkipPressCallback = {Func = InFunc, Obj = InObj}
  else
    self.SkipReleaseCallback = {Func = InFunc, Obj = InObj}
  end
end

function M:UnbindSkip_Internal(bPress)
  if bPress then
    self.SkipPressCallback = nil
  else
    self.SkipReleaseCallback = nil
  end
end

function M:ShowAutoPlayButton(bShow)
  if bShow then
    self.Key_Auto:SetVisibility(ESlateVisibility.Visible)
  else
    self.Key_Auto:SetVisibility(ESlateVisibility.Collapsed)
  end
end

function M:ShowSkipButton(bShow)
  if bShow then
    self.Key_Skip:SetVisibility(ESlateVisibility.Visible)
    self.Key_Skip:_Reset2InitState()
  else
    self:OnSkipKeyReleased()
    self.Key_Skip:_Reset2InitState()
    self.Key_Skip:SetVisibility(ESlateVisibility.Collapsed)
  end
end

function M:OnAutoKeyPressed()
  self.Key_Auto:OnShortCutPressed()
end

function M:OnAutoKeyReleased()
  self.Key_Auto:OnShortCutReleased()
  self.Key_Auto:OnButtonReleasedInsideButtonFrame()
end

function M:OnSkipKeyPressed()
  self.Key_Skip:OnShortCutPressed()
end

function M:OnSkipKeyReleased()
  self.Key_Skip:OnShortCutReleased()
end

function M:OnActive()
  DebugPrint("WBP_Story_PlayKey:Active")
  self:PlayAnimation(self.In)
end

function M:OnDeactive()
  DebugPrint("WBP_Story_PlayKey:Deactive")
  self:PlayAnimation(self.Out)
end

return M
