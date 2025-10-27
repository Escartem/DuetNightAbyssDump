require("UnLua")
local WBP_ImpressionItem_PC = Class("BluePrints.Story.Talk.UI.Common.WBP_ImpressionItem_Common")

function WBP_ImpressionItem_PC:AdaptPlatform()
  self:InitPickUpKey()
  self.KeyNode:SetVisibility(ESlateVisibility.Collapsed)
end

function WBP_ImpressionItem_PC:InitPickUpKey()
  self.Key_PickUp:CreateCommonKey({
    KeyInfoList = {
      {
        Type = "Text",
        Text = CommonUtils:GetActionMappingKeyName("TalkOption")
      }
    }
  })
  self.Key_Controller:CreateCommonKey({
    KeyInfoList = {
      {
        Type = "Img",
        ImgShortPath = CommonUtils:GetKeyText(CommonUtils:GetActionMappingKeyName("TalkOption", true))
      }
    }
  })
end

function WBP_ImpressionItem_PC:OnSelectedByPlatform(bIsSelect)
  DebugPrint("WBP_ImpressionItem_PC:OnSelectByPlatform", bIsSelect)
  if bIsSelect then
    self:StopAnimation(self.UnHover)
    self:StopAnimation(self.Forbidden_UnHover)
    if self:IsSelfEnabled() then
      self:PlayAnimation(self.Hover, 0, 1)
    else
      self:PlayAnimation(self.Forbidden_Hover)
    end
  else
    self:StopAnimation(self.Hover)
    self:StopAnimation(self.Forbidden_Hover)
    self:PlayAnimationByEnabled(self.UnHover, self.Forbidden_UnHover)
  end
  if bIsSelect then
    self.KeyNode:SetVisibility(ESlateVisibility.HitTestInvisible)
  else
    self.KeyNode:SetVisibility(ESlateVisibility.Collapsed)
  end
end

function WBP_ImpressionItem_PC:ClearByPlatform()
  self.KeyNode:SetVisibility(ESlateVisibility.Collapsed)
end

function WBP_ImpressionItem_PC:OnReleasedByPlatform()
  if self:IsSelfEnabled() then
    self:PlayAnimation(self.Hover, 0, 1)
  else
    self:PlayAnimationReverse(self.Forbidden_Hover)
    self:StopAnimation(self.Forbidden_Hover)
  end
end

function WBP_ImpressionItem_PC:OnHoveredByPlatform()
  DebugPrint("WBP_ImpressionItem_PC: OnHovered", self, self.ItemIndex)
  self:FireButtonDelegate(self.OnHoveredEvent, self.ItemIndex)
end

function WBP_ImpressionItem_PC:OnUnhoveredByPlatform()
  DebugPrint("WBP_ImpressionItem_PC: OnUnhovered", self, self.ItemIndex)
  self:FireButtonDelegate(self.OnUnhoveredEvent, self.ItemIndex)
end

function WBP_ImpressionItem_PC:SetOnHovered(Delegate)
  self.OnHoveredEvent = Delegate
end

function WBP_ImpressionItem_PC:SetOnUnhovered(Delegate)
  self.OnUnhoveredEvent = Delegate
end

function WBP_ImpressionItem_PC:UpdateKeyImg(IsGamePad)
  if IsGamePad then
    self.WS_Node:SetActiveWidgetIndex(1)
  else
    self.WS_Node:SetActiveWidgetIndex(0)
  end
end

return WBP_ImpressionItem_PC
