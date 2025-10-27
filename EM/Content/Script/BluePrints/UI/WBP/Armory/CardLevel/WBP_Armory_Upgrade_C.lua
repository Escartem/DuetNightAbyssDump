require("UnLua")
local SuccessText = {
  [CommonConst.ArmoryType.Char] = "Char_LevelUp_Success",
  [CommonConst.ArmoryType.Weapon] = "Weapon_LevelUp_Success",
  [CommonConst.ArmoryType.Mod] = "Mod_Upgrade_Success"
}
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C",
  "BluePrints.Common.TimerMgr"
})
M._components = {
  "BluePrints.UI.WBP.Armory.CardLevel.IntensifySubWidgetCommon"
}

function M:UpdateWidgetData(Params)
  self.Parent = Params.Parent
  self.Target = Params.Target
  self.Type = Params.Type
  self.Tag = Params.Tag
  if self.Type then
    self.SuccessToast.Text_Success:SetText(GText(SuccessText[self.Type]))
  end
  self.NowLevel = Params.NowLevel
  self.MaxLevel = Params.MaxLevel
  self.MinLevel = Params.MinLevel
  if self.NowLevel then
    self.Level_Now:SetText(self.NowLevel)
    self.PreviewLevel = Params.PreviewLevel or self.NowLevel + 1
    local bMax = Params.bMax
    if nil == bMax and self.MaxLevel then
      bMax = self.PreviewLevel == self.MaxLevel
    end
    self:SetLevelPreviewText(self.PreviewLevel, bMax)
    if bMax then
      self:ForbidIncBtn(true)
    else
      self:ForbidIncBtn(false)
    end
    self:ForbidDecBtn(true)
  end
  self:CallBtnClickCallback(self.PreviewLevel)
end

function M:ForbidIncBtn(bValue)
  self.Btn_Max:ForbidBtn(bValue)
  self.Btn_Add:ForbidBtn(bValue)
  if bValue then
    self.Key_Max:SetRenderOpacity(0.5)
    self.Key_Add:SetRenderOpacity(0.5)
  else
    self.Key_Max:SetRenderOpacity(1)
    self.Key_Add:SetRenderOpacity(1)
  end
end

function M:ForbidDecBtn(bValue)
  self.Btn_Min:ForbidBtn(bValue)
  self.Btn_Minus:ForbidBtn(bValue)
  if bValue then
    self.Key_Min:SetRenderOpacity(0.5)
    self.Key_Minus:SetRenderOpacity(0.5)
  else
    self.Key_Min:SetRenderOpacity(1)
    self.Key_Minus:SetRenderOpacity(1)
  end
end

function M:OverrideSound()
  self.Btn_Add:TryOverrideSoundFunc(function()
    AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_add", nil, nil)
  end)
  self.Btn_Max:TryOverrideSoundFunc(function()
    AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_addMulti", nil, nil)
  end)
  self.Btn_Minus:TryOverrideSoundFunc(function()
    AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_minus", nil, nil)
  end)
  self.Btn_Min:TryOverrideSoundFunc(function()
    AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_minusMulti", nil, nil)
  end)
end

function M:Init(Params)
  self:UpdateWidgetData(Params)
  self:OverrideSound()
  if self.MaxLevel then
    if self.PreviewLevel then
      self.Btn_Add:BindEventOnClicked(self, function()
        if self.PreviewLevel >= self.MaxLevel then
          return
        end
        if self.PreviewLevel + 1 == self.MaxLevel then
          self:ForbidIncBtn(true)
        end
        self:ForbidDecBtn(false)
        self:CallBtnClickCallback(self.PreviewLevel + 1)
      end)
    end
    self.Btn_Max:BindEventOnClicked(self, function()
      self:ForbidIncBtn(true)
      self:ForbidDecBtn(false)
      if self.Type == "Mod" then
        self:CallBtnClickCallback(self.Parent:GetMaxCanUpgradeLevel())
      else
        self:CallBtnClickCallback(self.MaxLevel)
      end
    end)
  end
  if self.MinLevel then
    if self.PreviewLevel then
      self.Btn_Minus:BindEventOnClicked(self, function()
        if self.PreviewLevel <= self.MinLevel then
          return
        end
        if self.PreviewLevel - 1 == self.MinLevel then
          self:ForbidDecBtn(true)
        end
        self:ForbidIncBtn(false)
        self:CallBtnClickCallback(self.PreviewLevel - 1)
      end)
    end
    self.Btn_Min:BindEventOnClicked(self, function()
      self:ForbidIncBtn(false)
      self:ForbidDecBtn(true)
      self:CallBtnClickCallback(self.MinLevel)
    end)
  end
  self.Key_Min:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "Left"}
    },
    Desc = GText("UI_SHOP_MIN")
  })
  self.Key_Minus:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "LT"}
    }
  })
  self.Key_Add:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "RT"}
    }
  })
  self.Key_Max:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "Right"}
    },
    Desc = GText("UI_SHOP_MAX")
  })
end

function M:SetCallbacks(Callbacks)
  self.OnBtnClickCallback = Callbacks.OnBtnClickCallback
  self.OnLevelUpSuccessCallback = Callbacks.OnLevelUpSuccessCallback
  self.OnLevelUpAnimFinishedCallback = Callbacks.OnLevelUpAnimFinishedCallback
  self.OnLevelUpFinalCallback = Callbacks.OnLevelUpFinalCallback
  self.OnLevelUpCloseCallback = Callbacks.OnLevelUpCloseCallback
end

function M:CallBtnClickCallback(InPreviewLevel)
  if not self.OnBtnClickCallback then
    return
  end
  local Attrs, ComparedAttrs, Desc, bMax, OutPreviewLevel = self.OnBtnClickCallback(self.Parent, InPreviewLevel)
  if Attrs and ComparedAttrs then
    self:UpdataAttrListView(Attrs, ComparedAttrs, true)
  end
  self.PreviewLevel = InPreviewLevel
  if OutPreviewLevel then
    self.PreviewLevel = OutPreviewLevel
  end
  if nil == bMax then
    bMax = self.PreviewLevel == self.MaxLevel
  end
  self:SetLevelPreviewText(self.PreviewLevel, bMax)
  self:UpdateDesc(Desc)
end

function M:Construct()
  self:BindToAnimationFinished(self.LevelUp_In, {
    self,
    self.OnLevelUpAnimFinished
  })
  self.SuccessToast:SetVisibility(UIConst.VisibilityOp.Visible)
  self.Text_Detail:SetVisibility(UIConst.VisibilityOp.Collapsed)
end

function M:Destruct()
  self:UnbindAllFromAnimationFinished(self.LevelUp_In)
  if self.PreviewLevel then
    self.Btn_Minus:UnBindEventOnClickedByObj(self)
    self.Btn_Add:UnBindEventOnClickedByObj(self)
    if self.MaxLevel then
      self.Btn_Max:UnBindEventOnClickedByObj(self)
    end
    if self.MinLevel then
      self.Btn_Min:UnBindEventOnClickedByObj(self)
    end
  end
  self:StopLevelUpSuccessTimer()
end

function M:OnLevelUpSuccess()
  if self.Parent.Key_Consume then
    self.Parent.Key_Consume:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  self.Num_LevelUp:SetText(self.PreviewLevel)
  self:PlayAnimation(self.LevelUp_In)
  AudioManager(self):PlayUISound(self, "event:/ui/armory/level_update_success", nil, nil)
  if not self.OnLevelUpSuccessCallback then
    return
  end
  local Attr, Desc, bMax = self.OnLevelUpSuccessCallback(self.Parent)
  if Attr then
    self:UpdataAttrListView(Attr, nil, true)
  end
  if Desc then
    self:UpdateDesc(Desc)
  end
  if nil == bMax then
    bMax = self.PreviewLevel == self.MaxLevel
  end
  self.bFinal = bMax
end

function M:SetLevelPreviewText(PreviewLevel, bMax)
  self.Switcher_Level:SetActiveWidgetIndex(bMax and 1 or 0)
  self.Level_Preview:SetText(PreviewLevel)
  self.Level_Preview_Max:SetText(PreviewLevel)
end

function M:OnLevelUpAnimFinished()
  self:StopLevelUpSuccessTimer()
  local _, TimerKey = self:AddTimer(1.5, function()
    if self.bFinal then
      self:PlayAnimation(self.LevelUp_MaxOut)
      if self.OnLevelUpFinalCallback then
        self.OnLevelUpFinalCallback(self.Parent, self.bFinal)
      end
      return
    end
    self:PlayAnimation(self.LevelUp_Out)
    if self.OnLevelUpAnimFinishedCallback then
      self.OnLevelUpAnimFinishedCallback(self.Parent)
    end
  end, false, 0, nil, true)
  self.LevelUpSuccessTimer = TimerKey
end

function M:StopLevelUpSuccessTimer()
  if self:IsExistTimer(self.LevelUpSuccessTimer) then
    self:RemoveTimer(self.LevelUpSuccessTimer)
    self.LevelUpSuccessTimer = nil
  end
end

AssembleComponents(M)
return M
