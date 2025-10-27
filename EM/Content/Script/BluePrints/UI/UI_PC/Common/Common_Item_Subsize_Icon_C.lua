require("UnLua")
local M = Class("BluePrints.UI.UI_PC.Common.Common_Item_Subsize_Small_Base_C")

function M:InitView()
  self:SetIcon()
end

local function _RealSetIcon(self, Texture)
  if Texture then
    self.Img_Icon:SetBrushResourceObject(Texture)
    local __IconDynaMaterial = self.VX_Img_Icon:GetDynamicMaterial()
    if __IconDynaMaterial then
      __IconDynaMaterial:SetTextureParameterValue("MainTex", Texture)
    end
  end
end

function M:SetIcon()
  if type(self.Icon) == "string" then
    self:LoadTextureAsync(self.Icon, function(Texture)
      if not Texture then
        Texture = LoadObject("Texture2D'/Game/UI/Texture/Dynamic/Image/Head/Monster/T_Head_Empty.T_Head_Empty'")
        DebugPrint(ErrorTag, string.format("\231\148\168\233\148\153\229\155\190\230\160\135\232\183\175\229\190\132\228\186\134\239\188\129\239\188\129\239\188\129\232\191\153\233\135\140\231\148\168\233\187\152\232\174\164\231\154\132\229\155\190\230\160\135\233\161\182\228\184\128\228\184\139\n \233\148\153\232\175\175\231\154\132\232\183\175\229\190\132\230\152\175\239\188\154%s", self.Icon))
      end
      _RealSetIcon(self, Texture)
    end, "LoadIcon")
  else
    _RealSetIcon(self, self.Icon)
  end
end

function M:OnMouseEnter(MyGeometry, MouseEvent)
  if not self.Content then
    return
  end
  if self.NotInteractive or self.Content.IsSelect or self.Content.IsShowTips then
    return
  end
  self.IsHovering = true
  self:StopAnimation(self.UnHover)
  self:PlayAnimationForward(self.Hover)
end

function M:OnMouseLeave(MyGeometry, MouseEvent)
  if not self.Content then
    return
  end
  if self.NotInteractive or self.Content.IsSelect or self.Content.IsShowTips then
    return
  end
  self.IsHovering = false
  self:StopAnimation(self.Hover)
  self:PlayAnimationForward(self.UnHover)
end

function M:OnMouseButtonDown(MyGeometry, MouseEvent)
  if self.NotInteractive or self.IsShowDetails and self.ItemDetails_MenuAnchor.ItemDetailsMenuAnchor:IsOpen() then
    return UWidgetBlueprintLibrary.Unhandled()
  end
  self:StopAnimation(self.Hover)
  self:PlayAnimation(self.Press)
  if self.HandleMouseDown then
    return UWidgetBlueprintLibrary.Handled()
  end
  return UWidgetBlueprintLibrary.Unhandled()
end

function M:OnCloseMenuAnchor(IsNeedMenuChangedCallback)
  if self.IsShowDetails and self.ItemDetails_MenuAnchor.ItemDetailsMenuAnchor:IsOpen() then
    self.ItemDetails_MenuAnchor:ClearMenuOpenChangedListen()
    if IsNeedMenuChangedCallback then
      self.ItemDetails_MenuAnchor:InitMenuOpenChangedListen()
    end
    self.ItemDetails_MenuAnchor:CloseItemDetailsWidget()
  else
    self.ItemDetails_MenuAnchor:OnMenuClose(false)
  end
end

function M:PlayInAnimation()
end

function M:OnAnimationFinished(InAnimation)
  if InAnimation == self.UnHover and not self.IsHovering then
    self:PlayAnimationForward(self.Normal)
  end
end

return M
