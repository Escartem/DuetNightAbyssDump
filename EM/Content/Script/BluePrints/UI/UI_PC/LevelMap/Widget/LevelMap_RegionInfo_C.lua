require("UnLua")
local ImpressionTypes = require("BluePrints.UI.UI_PC.Impression.ImpressionConst").ImpressionTypes
local M = Class("BluePrints.UI.BP_EMUserWidget_C")

function M:Construct()
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(self)
  self.GameInputModeSubsystem.OnInputMethodChanged:Add(self, self.RefreshOpInfoByInputDevice)
end

function M:Destruct()
  self.GameInputModeSubsystem.OnInputMethodChanged:Remove(self, self.RefreshOpInfoByInputDevice)
end

function M:Init(RegionId, Spacer)
  local Avatar = GWorld:GetAvatar()
  local TaskUtils = require("BluePrints.UI.TaskPanel.TaskUtils")
  local IconTexture = TaskUtils:GetIconTextureByTrackQuestChainType()
  if IconTexture then
    self.GuidePoint.Img_GuidePoint_Icon:SetBrushResourceObject(IconTexture)
  end
  self:Show()
  self.Text_AreaName:SetText(GText(DataMgr.Region[RegionId].RegionName))
  self:RefreshOpInfoByInputDevice(self.GameInputModeSubsystem:GetCurrentInputType())
  if not ConditionUtils.CheckCondition(Avatar, 30) then
    self.Panel_Impression:SetVisibility(ESlateVisibility.Collapsed)
    Spacer:SetVisibility(ESlateVisibility.Collapsed)
    self.Spacer_Impression:SetVisibility(ESlateVisibility.Collapsed)
    return
  else
    self.Panel_Impression:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    Spacer:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self.Spacer_Impression:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  end
  self.Impression_Dimension:Init(RegionId)
end

function M:Show()
  if self:GetVisibility() == ESlateVisibility.Collapsed or self:IsAnimationPlaying(self.Auto_Out) then
    self:StopAllAnimations()
    self:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self:PlayAnimation(self.Auto_In)
  end
end

function M:Close()
  if self:GetVisibility() == ESlateVisibility.SelfHitTestInvisible then
    self:StopAllAnimations()
    self:PlayAnimation(self.Auto_Out)
  end
end

function M:OnAnimationFinished(Animation)
  if Animation == self.Auto_Out then
    self:SetVisibility(ESlateVisibility.Collapsed)
    self.GuidePoint:SetLoopUISoundEnable(false)
  end
end

function M:OnAnimationStarted(Animation)
  if Animation == self.Auto_In then
    self.GuidePoint:SetLoopUISoundEnable(true)
  end
end

function M:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  if self.Key_Controller then
    if CurInputDevice == ECommonInputType.Gamepad then
      self.Key_Controller:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
      self.Key_Controller:CreateCommonKey({
        KeyInfoList = {
          {Type = "Img", ImgShortPath = "Y"}
        }
      })
    else
      self.Key_Controller:SetVisibility(ESlateVisibility.Collapsed)
    end
  end
end

return M
