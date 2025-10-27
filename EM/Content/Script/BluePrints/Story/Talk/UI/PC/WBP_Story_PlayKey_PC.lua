require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C",
  "BluePrints.Common.TimerMgr"
})

function M:Construct()
  self.Keys = {
    self.Key_Encyclopedia,
    self.Key_Story_Review,
    self.Key_Auto,
    self.Key_Skip,
    self.Key_Confirm
  }
end

function M:Init(bUseGamePad)
  self:UpdateKeyImg(bUseGamePad)
  self.Key_Auto:AddExecuteLogic(self, self.OnAutoPlayClicked)
  self.Key_Skip:AddExecuteLogic(self, self.OnSkipClicked)
  self.Key_Story_Review:AddExecuteLogic(self, self.OnReviewClicked)
  self.Key_Encyclopedia:AddExecuteLogic(self, self.OpenEncyclopedia)
  self:Enable()
end

function M:UpdateKeyImg(bUseGamePad)
  self.UsingGamepad = bUseGamePad
  if not bUseGamePad then
    self.Key_Auto:CreateCommonKey({
      KeyInfoList = {
        {
          Type = "Text",
          Text = CommonUtils:GetActionMappingKeyName("TalkAutoPlay")
        }
      },
      Desc = GText("UI_TALK_AUTO_1")
    })
    self.Key_Skip:CreateCommonKey({
      KeyInfoList = {
        {
          Type = "Text",
          Text = CommonUtils:GetActionMappingKeyName("TalkSkip")
        }
      },
      bLongPress = true,
      Desc = GText("UI_TALK_SKIP")
    })
    self.Key_Confirm:SetVisibility(ESlateVisibility.Collapsed)
    self.Key_Story_Review:CreateCommonKey({
      KeyInfoList = {
        {
          Type = "Text",
          Text = CommonUtils:GetActionMappingKeyName("TalkReview")
        }
      },
      Desc = GText("UI_TALK_Review")
    })
    self.Key_Encyclopedia:CreateCommonKey({
      KeyInfoList = {
        {Type = "Text", Text = "H"}
      },
      bLongPress = false,
      Desc = GText("UI_Wiki_WikiRefer")
    })
  else
    self.Key_Auto:CreateCommonKey({
      KeyInfoList = {
        {
          ImgShortPath = CommonUtils:GetKeyText(CommonUtils:GetActionMappingKeyName("TalkAutoPlay", true)),
          Type = "Img"
        }
      },
      Desc = GText("UI_TALK_AUTO_1")
    })
    self.Key_Skip:CreateCommonKey({
      KeyInfoList = {
        {
          ImgShortPath = CommonUtils:GetKeyText(CommonUtils:GetActionMappingKeyName("TalkSkip", true)),
          Type = "Img"
        }
      },
      bLongPress = true,
      Desc = GText("UI_TALK_SKIP")
    })
    self.Key_Confirm:CreateCommonKey({
      KeyInfoList = {
        {
          ImgShortPath = CommonUtils:GetKeyText(CommonUtils:GetActionMappingKeyName("TalkClick", true)),
          Type = "Img"
        }
      },
      Desc = GText("UI_CTL_Continue")
    })
    if self.bShowConfirm then
      self:ShowConfirmButton(true)
    end
    self.Key_Story_Review:CreateCommonKey({
      KeyInfoList = {
        {
          ImgShortPath = CommonUtils:GetKeyText(CommonUtils:GetActionMappingKeyName("TalkReview", true)),
          Type = "Img"
        }
      },
      Desc = GText("UI_TALK_Review")
    })
    self.Key_Encyclopedia:CreateCommonKey({
      KeyInfoList = {
        {ImgShortPath = "Right", Type = "Img"}
      },
      Desc = GText("UI_Wiki_WikiRefer")
    })
  end
  if GWorld.GameInstance.bGlobalAutoPlay then
    if self.AutoPlayTimer then
      self:RemoveTimer(self.AutoPlayTimer)
    end
    self.AutoPlayTimer = self:AddTimer(0.1, function()
      self.AutoPlayTimer = nil
      self:SetAutoPlay(true)
    end)
  end
end

function M:SetAutoPlay(bAutoPlay)
  if self.AutoPlayTimer then
    self:RemoveTimer(self.AutoPlayTimer)
    self.AutoPlayTimer = nil
  end
  self.bAutoPlay = bAutoPlay
  if bAutoPlay then
    self.Key_Auto:SetDescription(GText("UI_TALK_AUTO_2"))
    self.Key_Auto:StopAllAnimations()
    self.Key_Auto:PlayLoopAnim()
  else
    self.Key_Auto:SetDescription(GText("UI_TALK_AUTO_1"))
    self.Key_Auto:StopAllAnimations()
    self.Key_Auto:StopLoopAnim()
  end
end

function M:GetAutoPlay()
  return self.bAutoPlay
end

function M:OnAutoPlayClicked()
  self.bAutoPlay = not self.bAutoPlay
  if self.AutoPlayCallback then
    self.AutoPlayCallback.Func(self.AutoPlayCallback.Obj, not self.bAutoPlay)
  end
  self:SetAutoPlay(self.bAutoPlay)
end

function M:OnSkipClicked()
  if self.SkipCallback then
    self.SkipCallback.Func(self.SkipCallback.Obj)
  end
end

function M:OnReviewClicked()
  if self.ReviewCallback then
    self.ReviewCallback.Func(self.ReviewCallback.Obj)
  end
end

function M:SwitchBindAutoPlay(bBind, InObj, InFunc)
  if bBind then
    self:BindAutoPlay_Internal(InObj, InFunc)
  else
    self:UnbindAutoPlay_Internal()
  end
end

function M:SwitchBindSkip(bBind, InObj, InFunc)
  if bBind then
    self:BindSkip_Internal(InObj, InFunc)
  else
    self:UnbindSkip_Internal()
  end
end

function M:SwitchBindReview(bBind, InObj, InFunc)
  if bBind then
    self:BindReview_Internal(InObj, InFunc)
  else
    self:UnbindReview_Internal()
  end
end

function M:SwitchBindWiki(bBind, InObj, InFunc)
  if bBind then
    self:BindWiki_Internal(InObj, InFunc)
  else
    self:UnbindWiki_Internal()
  end
end

function M:BindAutoPlay_Internal(InObj, InFunc)
  self.AutoPlayCallback = {Func = InFunc, Obj = InObj}
end

function M:UnbindAutoPlay_Internal()
  self.AutoPlayCallback = nil
end

function M:BindSkip_Internal(InObj, InFunc)
  self.SkipCallback = {Func = InFunc, Obj = InObj}
end

function M:UnbindSkip_Internal()
  self.SkipCallback = nil
end

function M:BindReview_Internal(InObj, InFunc)
  self.ReviewCallback = {Func = InFunc, Obj = InObj}
end

function M:UnbindReview_Internal()
  self.ReviewCallback = nil
end

function M:BindWiki_Internal(InObj, InFunc)
  self.WikiCallback = {Func = InFunc, Obj = InObj}
end

function M:UnbindWiki_Internal()
  self.WikiCallback = nil
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
    self.Key_Skip:_ForeachChildren(function(v)
      v:_Reset2InitState()
    end)
  else
    self.Key_Skip:SetVisibility(ESlateVisibility.Collapsed)
  end
end

function M:ShowConfirmButton(bShow)
  if bShow then
    self.bShowConfirm = true
    if not self.UsingGamepad then
      return
    end
    self.Key_Confirm:SetVisibility(ESlateVisibility.Visible)
  else
    self.bShowConfirm = false
    self.Key_Confirm:SetVisibility(ESlateVisibility.Collapsed)
  end
end

function M:ShowReviewButton(bShow)
  if bShow then
    self.Key_Story_Review:SetVisibility(ESlateVisibility.Visible)
  else
    self.Key_Story_Review:SetVisibility(ESlateVisibility.Collapsed)
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

function M:OnConfirmKeyReleased()
  self.Key_Confirm:OnShortCutPressed()
  if self.ConfirmTimer then
    self:RemoveTimer(self.ConfirmTimer)
  end
  self.ConfirmTimer = self:AddTimer(self.Key_Confirm.Press:GetEndTime(), function()
    self.Key_Confirm:OnShortCutReleased()
    self.ConfirmTimer = nil
  end)
end

function M:OnReviewKeyPressed()
  self.Key_Story_Review:OnShortCutPressed()
end

function M:OnReviewKeyReleased()
  self.Key_Story_Review:OnShortCutReleased()
  self.Key_Story_Review:OnButtonReleasedInsideButtonFrame()
end

function M:OnWikiKeyPressed()
  self.Key_Encyclopedia:OnShortCutPressed()
end

function M:OnWikiKeyReleased()
  self.Key_Encyclopedia:OnShortCutReleased()
  self:OpenEncyclopedia()
end

function M:OnActive()
  DebugPrint("WBP_Story_PlayKey:Active")
  self:PlayAnimation(self.In)
end

function M:OnDeactive()
  DebugPrint("WBP_Story_PlayKey:Deactive")
  self:PlayAnimation(self.Out)
end

function M:ShowEncyclopedia()
  self.Key_Encyclopedia:SetVisibility(UE4.ESlateVisibility.Visible)
  if self.Image_52 then
    self.Image_52:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  end
end

function M:HideEncyclopedia()
  self.Key_Encyclopedia:SetVisibility(UE4.ESlateVisibility.Collapsed)
end

function M:BindOnOpenEncyclopedia(OnOpenEncyclopedia)
  self.OnOpenEncyclopedia = OnOpenEncyclopedia
end

function M:UnbindOnOpenEncyclopedia()
  self.OnOpenEncyclopedia = nil
end

function M:OpenEncyclopedia()
  if self.WikiCallback then
    self.WikiCallback.Func(self.WikiCallback.Obj)
  end
end

function M:Destruct()
  if self.AutoPlayTimer then
    self:RemoveTimer(self.AutoPlayTimer)
  end
  if self.ConfirmTimer then
    self:RemoveTimer(self.ConfirmTimer)
  end
end

function M:Enable()
  for _, Key in ipairs(self.Keys) do
    if IsValid(Key) then
      Key:EnableKey()
    end
  end
end

function M:Disable()
  for _, Key in ipairs(self.Keys) do
    if IsValid(Key) then
      Key:DisableKey()
    end
  end
end

return M
