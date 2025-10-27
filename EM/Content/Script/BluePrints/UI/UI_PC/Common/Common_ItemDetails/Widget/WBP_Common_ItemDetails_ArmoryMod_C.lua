require("UnLua")
local ModModel = ModController:GetModel()
local M = Class({
  "BluePrints.UI.UI_PC.Common.Common_ItemDetails.Widget.WBP_Common_ItemDetails_Mod_Base"
})
M._components = {
  "BluePrints.UI.WBP.Armory.Armory_List_Attr_Compoment"
}

function M:InitAttrList()
  self.Attrs = {}
  self.ComparedAttrs = nil
  self.Index2AttrKey = {}
  self.ComparedTarget = false
  self:RegisterListAttrBtn(self.List_PreviewAttr)
  self.List_PreviewAttr:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  self.List_PreviewAttr:DisableScroll(true)
end

function M:Construct()
  M.Super.Construct(self)
end

function M:OnInitItemInfo(ModInfo, ModServerData)
  self.ParentWidget.EMScrollBox_1.OnMouseButtonDown:Remove(self, self.OnBtnPressed)
  self.ParentWidget.EMScrollBox_1.OnMouseButtonDown:Add(self, self.OnBtnPressed)
  if not self.ParentWidget.Content.IsArmoryMod then
    return
  end
  if not ModServerData then
    return
  end
  self:InitAttrList()
  self.ModServerData = ModServerData
  local Platfrom = CommonUtils.GetDeviceTypeByPlatformName(self)
  self.ParentWidget.Panel_Extra:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  self.ParentWidget.Switch_Bg:SetActiveWidgetIndex(1)
  self.ParentWidget.Switch_Frame:SetActiveWidgetIndex(1)
  self.Text_Plus:SetText("+")
  local LineWidget = self.ParentWidget.Line
  local BtnWidget = self.ParentWidget.Panel_Button
  local Btn = self.ParentWidget.Btn02_Mod
  local BtnUnEquip = self.ParentWidget.Btn01_Mod
  if "Mobile" == Platfrom then
    Btn:SwitchNormalAnimation()
    BtnUnEquip:SwitchNormalAnimation()
    self.ParentWidget.Btn01_Mod:SetIconPanelVisibility(UIConst.VisibilityOp.Collapsed)
    self.ParentWidget.Btn02_Mod:SetIconPanelVisibility(UIConst.VisibilityOp.Collapsed)
  end
  self.ParentWidget.Btn01_Mod:SetDefaultGamePadImg("X")
  self.ParentWidget.Btn02_Mod:SetDefaultGamePadImg("Y")
  if not ModModel:IsModUINormal() then
    LineWidget:SetVisibility(UIConst.VisibilityOp.Collapsed)
    BtnWidget:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  if not ModServerData:IsOriginalMaxLevel() or not ModServerData:IsFinalMaxLevel() then
    LineWidget.Switch_Line:SetActiveWidgetIndex(0)
    LineWidget:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.Panel_Preview:SetVisibility(UIConst.VisibilityOp.Collapsed)
    if self.ParentWidget.Content.bIsHoverState then
      self.ParentWidget.Panel_Extra:SetVisibility(UIConst.VisibilityOp.Collapsed)
      BtnWidget:SetVisibility(UIConst.VisibilityOp.Collapsed)
      self.ParentWidget.Switch_Bg:SetActiveWidgetIndex(0)
      self.ParentWidget.Switch_Frame:SetActiveWidgetIndex(0)
      LineWidget.Switch_Bg:SetActiveWidgetIndex(0)
    elseif ModModel:IsModUINormal() then
      LineWidget.Switch_Bg:SetActiveWidgetIndex(1)
      BtnWidget:SetVisibility(UIConst.VisibilityOp.Visible)
      Btn:SetVisibility(UIConst.VisibilityOp.Visible)
      if ModServerData:HasCardLevel() and ModServerData:IsOriginalMaxLevel() then
        Btn:SetText(GText("UI_Mod_CardLevelUp"))
      else
        Btn:SetText(GText("UI_FUNC_LEVELUP"))
      end
      if not self.Btn2Binded then
        Btn:BindEventOnPressed(self, self.OnBtnPressed)
        Btn:BindEventOnReleased(self, self.OnBtnIntensifyClicked)
        self.Btn2Binded = true
      end
      BtnUnEquip:SetVisibility(UIConst.VisibilityOp.Visible)
      local SelectStuff = ModModel:GetSelectStuff()
      if SelectStuff:IsSlot() then
        BtnUnEquip:SetText(GText("UI_Armory_Weapon_Remove"))
      else
        BtnUnEquip:SetText(GText("UI_Mod_QuickEquip"))
      end
      DebugPrint(ErrorTag, "\231\187\145\229\174\154 ArmoryMod Tips \230\140\137\233\146\174\233\135\140\233\157\162\231\154\132\229\155\158\232\176\131", self.ModServerData:GetName())
      BtnUnEquip.ReleaseLogics = {}
      BtnUnEquip.PressLogics = {}
      BtnUnEquip:BindEventOnPressed(self, self.OnBtnPressed)
      BtnUnEquip:BindEventOnReleased(self, self.OnBtnUnEquipMod)
      self.EnableBtn = true
    end
  elseif ModModel:IsModUINormal() then
    if self.ParentWidget.Content.bIsHoverState then
      BtnWidget:SetVisibility(UIConst.VisibilityOp.Collapsed)
      LineWidget.Switch_Line:SetActiveWidgetIndex(1)
      LineWidget.Switch_Bg:SetActiveWidgetIndex(0)
    else
      BtnWidget:SetVisibility(UIConst.VisibilityOp.Visible)
      Btn:SetVisibility(UIConst.VisibilityOp.Collapsed)
      BtnUnEquip:SetVisibility(UIConst.VisibilityOp.Visible)
      local SelectStuff = ModModel:GetSelectStuff()
      if SelectStuff:IsSlot() then
        BtnUnEquip:SetText(GText("UI_Armory_Weapon_Remove"))
      else
        BtnUnEquip:SetText(GText("UI_Mod_QuickEquip"))
      end
      BtnUnEquip.ReleaseLogics = {}
      BtnUnEquip.PressLogics = {}
      BtnUnEquip:BindEventOnPressed(self, self.OnBtnPressed)
      BtnUnEquip:BindEventOnReleased(self, self.OnBtnUnEquipMod)
      LineWidget.Switch_Line:SetActiveWidgetIndex(0)
      LineWidget.Switch_Bg:SetActiveWidgetIndex(1)
    end
    LineWidget:SetVisibility(UIConst.VisibilityOp.Visible)
    if LineWidget.White then
      LineWidget.Bg02_Straight:SetColorAndOpacity(LineWidget.White)
      LineWidget.Bg02:SetColorAndOpacity(LineWidget.White)
    end
    LineWidget.Text_Level:SetText(GText("Max_Level_Achieved"))
  end
  self:UpdateAttrList()
  if self.ModServerData.ConflictUuids:Length() > 0 and ModModel:IsModUINormal() then
    self.ParentWidget.Panel_Extra:SetVisibility(UIConst.VisibilityOp.Visible)
    LineWidget:SetVisibility(UIConst.VisibilityOp.Visible)
    self.ParentWidget.Switch_Bg:SetActiveWidgetIndex(1)
    self.ParentWidget.Switch_Frame:SetActiveWidgetIndex(1)
    LineWidget.Switch_Line:SetActiveWidgetIndex(1)
    LineWidget.Bg02_Straight:SetColorAndOpacity(LineWidget.Red)
    LineWidget.Bg02:SetColorAndOpacity(LineWidget.Red)
    local ConflictMod = ModModel:GetMod(self.ModServerData.ConflictUuids[1])
    local Text = string.format(GText("UI_Armory_ConflictWithMod"), GText(ConflictMod:Data().Name))
    BtnUnEquip:SetVisibility(UIConst.VisibilityOp.Collapsed)
    if ModServerData:IsFinalMaxLevel() then
      BtnWidget:SetVisibility(UIConst.VisibilityOp.Collapsed)
      LineWidget.Switch_Line:SetActiveWidgetIndex(0)
    end
    LineWidget.Text_Level:SetText(Text)
  end
end

function M:IsRecommendAttr(AttrKey)
  return ModModel:IsRecommendAttr(AttrKey), true
end

function M:UpdateAttrList()
  if self.ParentWidget.Content.bIsHoverState then
    return
  end
  self.Panel_Preview:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  local ModMainView = ModController:GetView(self)
  local SelectStuff = ModModel:GetSelectStuff()
  if SelectStuff:IsSlot() then
    self.Text_Preview:SetText(GText("UI_Mod_TakeOffPreview"))
  else
    self.Text_Preview:SetText(GText("UI_Mod_EquipPreview"))
  end
  local PureTargetAttrs = ModMainView:GetPureAttrsOfTarget()
  local PreAttrs = ModMainView:GetCurrentAttrs()
  local NowAttrs = ModMainView:GetCurrentAttrs(self.ModServerData)
  local ExtraVolume
  if ModModel:GetTarget():GetTypeName() == "Char" then
    local ExtraVolume = 0
    if self.ModServerData.AddCharModCost then
      ExtraVolume = self.ModServerData:CalcExtralCharVolume()
    end
    self.Index2AttrKey = {"ModVolume"}
  end
  self.ComparedTarget, self.ComparedAttrs, self.Attrs = ModModel:GenerateAttrList(PreAttrs, NowAttrs, self.Index2AttrKey, true, PureTargetAttrs, nil, ExtraVolume)
  if not self.ComparedTarget then
    self.Attrs = self.ComparedAttrs
    return
  end
  self:UpdateAttrListView(true, self.List_Attribute)
end

function M:Destruct()
  self:UnRegisterListAttrBtn()
  if not self.EnableBtn then
    return
  end
  DebugPrint(ErrorTag, "\232\167\163\231\187\145 ArmoryMod Tips \230\140\137\233\146\174\233\135\140\233\157\162\231\154\132\229\155\158\232\176\131 Destruct", self.ModServerData:GetName())
  self.ParentWidget.Btn02_Mod:UnBindEventOnReleased(self, self.OnBtnIntensifyClicked)
  self.ParentWidget.Btn02_Mod:UnBindEventOnPressed(self, self.OnBtnPressed)
  self.ParentWidget.Btn01_Mod:UnBindEventOnReleased(self, self.OnBtnUnEquipMod)
  self.ParentWidget.Btn01_Mod:UnBindEventOnPressed(self, self.OnBtnPressed)
end

function M:OnBtnIntensifyClicked()
  self:OnBtnPressed()
  self.ParentWidget.Btn02_Mod:StopAllAnimations()
  ModController:OpenModIntensify()
end

function M:OnBtnPressed()
  self.ParentWidget:OnMouseButtonDown()
end

function M:OnBtnUnEquipMod()
  self:OnBtnPressed()
  DebugPrint(ErrorTag, "\232\167\166\229\143\145\228\186\134ArmoryMod Tips \230\140\137\233\146\174\233\135\140\233\157\162\231\154\132\229\155\158\232\176\131", self.ModServerData:GetName())
  self.ParentWidget.Btn01_Mod:StopAllAnimations()
  local SelectStuff = ModModel:GetSelectStuff()
  if SelectStuff and SelectStuff:IsSlot() then
    local EquipedSlotId = SelectStuff.SlotId
    ModController:SendTakeOffMod(ModModel:GetTarget(), EquipedSlotId)
  else
    ModController:QuickEquipMod(self.ModServerData.Uuid)
  end
end

AssembleComponents(M)
return M
