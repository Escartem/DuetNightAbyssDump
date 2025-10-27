require("UnLua")
require("DataMgr")
local UIUtils = require("Utils.UIUtils")
local M = Class("BluePrints.UI.BP_UIState_C")

function M:OnLoaded(...)
  self.Super.OnLoaded(self, ...)
end

function M:Construct()
  self:BindToAnimationFinished(self.In, {
    self,
    self.PlayOutAnim
  })
  self:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self.Common_Key_Show_Desc_PC:CreateCommonKey({
    KeyInfoList = {
      {Type = "Text", Text = "Tab"}
    },
    Desc = GText("UI_DETAILS")
  })
end

function M:CheckAndStartNextPropAnim(PropInfo)
  if PropInfo then
    local TableName = PropInfo.TableTypeName
    local PropName = ItemUtils:GetDropName(PropInfo.ItemId, TableName)
    local Icon = ItemUtils.GetItemIcon(PropInfo.ItemId, TableName)
    local Rarity = ItemUtils.GetItemRarity(PropInfo.ItemId, TableName)
    local Describe = ""
    local Data = DataMgr[TableName][PropInfo.ItemId]
    self.ItemId = PropInfo.ItemId
    if CommonUtils.GetDeviceTypeByPlatformName(self) == "PC" and Data and Data.Type == "Read" then
      self.Common_Key_Show_Desc_PC:SetVisibility(ESlateVisibility.Visible)
      self.Bg_Key:SetVisibility(ESlateVisibility.Visible)
      self:ListenForInputAction("ItemDetail", UE4.EInputEvent.IE_Pressed, true, {
        self,
        self.TryToViewItemDetail
      })
    else
      self:StopListeningForAllInputActions()
      Describe = ItemUtils.GetItemDescribe(PropInfo.ItemId, TableName)
      self.Common_Key_Show_Desc_PC:SetVisibility(ESlateVisibility.Collapsed)
      self.Bg_Key:SetVisibility(ESlateVisibility.Collapsed)
    end
    if "Resource" == TableName and Data.FunctionDes then
      Describe = Data.FunctionDes
    end
    self.Text_Name:SetText(GText(PropName))
    self.Icon_Prop:SetBrushResourceObject(Icon)
    self.Text_Intro:SetText(GText(Describe))
    local SlateColor = FSlateColor()
    if Rarity > 4 then
      local LinearColor = FLinearColor(1, 0.874406, 0.578125, 1)
      SlateColor.SpecifiedColor = LinearColor
      self.VX_Bg_glow:SetColorAndOpacity(LinearColor)
      self.VX_Bg_glowline:SetColorAndOpacity(LinearColor)
      self.VX_Bg_glowline_1:SetColorAndOpacity(LinearColor)
      self.VX_Bg_glowline_1:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
      self.VX_par_yellow:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
      self.VX_par_purple:SetVisibility(UE4.ESlateVisibility.Collapsed)
      self.Text_Name:SetFont(self.Font_Yellow)
    elseif Rarity > 3 then
      local LinearColor = FLinearColor(0.719169, 0.458233, 1, 1)
      SlateColor.SpecifiedColor = LinearColor
      self.VX_Bg_glow:SetColorAndOpacity(LinearColor)
      self.VX_Bg_glowline:SetColorAndOpacity(LinearColor)
      self.VX_Bg_glowline_1:SetColorAndOpacity(LinearColor)
      self.VX_Bg_glowline_1:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
      self.VX_par_purple:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
      self.VX_par_yellow:SetVisibility(UE4.ESlateVisibility.Collapsed)
      self.Text_Name:SetFont(self.Font_Purple)
    else
      SlateColor.SpecifiedColor = FLinearColor(1, 1, 1, 1)
      self.VX_Bg_glowline:SetColorAndOpacity(FLinearColor(1, 1, 1, 1))
      self.VX_Bg_glow:SetColorAndOpacity(FLinearColor(1, 1, 1, 0.35))
      self.VX_Bg_glowline_1:SetVisibility(UE4.ESlateVisibility.Collapsed)
      self.VX_par_yellow:SetVisibility(UE4.ESlateVisibility.Collapsed)
      self.VX_par_purple:SetVisibility(UE4.ESlateVisibility.Collapsed)
      self.Text_Name:SetFont(self.Font_White)
    end
    self:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    self:PlayAnimation(self.In)
  else
    self:Close()
  end
end

function M:TryToViewItemDetail()
  local ItemInformationPanel = UIManager(self):GetUI("ItemInformation")
  if nil == ItemInformationPanel then
    UIManager(self):LoadUINew("ItemInformation", self.ItemId, "Read")
  else
    ItemInformationPanel:Close()
  end
end

function M:PlayOutAnim()
  local function func()
    self:StopListeningForAllInputActions()
    
    self:PlayAnimation(self.Out)
  end
  
  self:AddTimer(3, func, false, nil, "PlayOutAnim")
end

function M:OnAnimationFinished(Anim)
  if Anim == self.Out then
    UIUtils.ShowTopTips()
  end
end

return M
