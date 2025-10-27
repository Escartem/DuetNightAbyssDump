require("UnLua")
local CommonUtils = require("Utils.CommonUtils")
local ArmoryUtils = require("BluePrints.UI.WBP.Armory.ArmoryUtils")
local ModModel = ModController:GetModel()
local M = Class("BluePrints.UI.BP_UIState_C")

function M:InitItemInfo(ItemType, ItemId, UnitId)
  self.EffectDetails:ClearChildren()
  local ModInfo = DataMgr.Mod[ItemId]
  local ModName = GText(ModInfo.TypeName) .. GText(ModInfo.Name)
  if ModCommon.DebugMode then
    ModName = ModName .. "_" .. ItemId
  end
  self.ParentWidget.Text_ItemName:SetText(ModName)
  if ModInfo and ModInfo.FunctionDes then
    self.Text_Describe:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self.Text_Describe:SetText(GText(ModInfo.FunctionDes))
  else
    self.Text_Describe:SetVisibility(ESlateVisibility.Collapsed)
  end
  self.Text_Polarity01:SetText(GText("UI_Tips_Polarity_Cost"))
  if ModInfo.Polarity ~= CommonConst.NonePolarity then
    self.Text_Polarity:SetVisibility(UIConst.VisibilityOp.Visible)
    local PolarityText = ModModel:GetPolarityText(ModInfo.Polarity)
    self.Text_Polarity:SetText(PolarityText)
  else
    self.Text_Polarity:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  self.Text_MaxLevel:SetText(ModInfo.MaxLevel)
  local ModLevel, ModCost, ModServerData
  local ModCardLvel = 0
  local Count = 0
  local PlayerAvatar = ModController:GetAvatar()
  if PlayerAvatar and ItemId and PlayerAvatar.GetModCount2ModId then
    Count = PlayerAvatar:GetModCount2ModId(ItemId)
  end
  if UnitId then
    if type(UnitId) == "string" and CommonUtils.IsObjIdStr(UnitId) then
      UnitId = CommonUtils.Str2ObjId(UnitId)
    end
    ModServerData = PlayerAvatar.Mods[UnitId]
    assert(ModServerData)
    if ModModel:IsBugMod(UnitId) then
      if self.ParentWidget then
        self.ParentWidget.ParentWidget:CloseItemDetailsWidget()
      end
      return
    end
    ModLevel = ModServerData.Level
    ModCost = ModServerData.CostMod
    ModCardLvel = ModServerData.CurrentModCardLevel or 0
  else
    self.ParentWidget:SetConflictLine(true, GText("UI_ModTips_MaxLvPreview"), 2)
    ModLevel = ModInfo.MaxLevel
    ModCost = ModInfo.Cost + ModInfo.MaxLevel * ModInfo.CostChange
  end
  if self.ParentWidget.Content.Cost then
    ModCost = self.ParentWidget.Content.Cost
  end
  self.Text_Level:SetText(ModLevel)
  if ModLevel >= ModInfo.MaxLevel then
    local MatPath = "/Game/UI/UI_PC/Common/UIVX/Material/MI_Word_Wavenew.MI_Word_Wavenew"
    UResourceLibrary.LoadObjectAsync(self, MatPath, {
      self,
      function(self, Mat)
        self.Text_Level.Font.FontMaterial = Mat
        self.Text_Level:SetColorAndOpacity(UUIFunctionLibrary.StringToSlateColor("FFFFFFFF"))
        self.Text_Plus.Font.FontMaterial = Mat
        self.Text_Plus:SetColorAndOpacity(UUIFunctionLibrary.StringToSlateColor("FFFFFFFF"))
      end
    })
  end
  self.Text_Polarity02:SetText(ModCost)
  self:UpdataEffectDetails(ModInfo, ModLevel, ModServerData)
  self.ParentWidget.Text_Hold02:SetText(Count)
  if self.Text_Tag then
    self.Text_Tag:SetVisibility(UIConst.VisibilityOp.Visible)
    local AppTypeTexts = {}
    for i, TagText in ipairs(DataMgr.ModTag[ModInfo.ApplicationType].ModTagText) do
      table.insert(AppTypeTexts, GText(TagText))
    end
    local AppTypeText = GText("UI_Tips_ModApplicationType") .. table.concat(AppTypeTexts, ", ")
    self.Text_Tag:SetText(AppTypeText)
  end
  if ModServerData and ModServerData:HasCardLevel() then
    self:ShowModStarLevel(ModServerData)
  else
    self.ParentWidget.List_ModStar:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  if self.ParentWidget.Img_Aura then
    if ModInfo.ApplySlot and 1 == #ModInfo.ApplySlot and 9 == ModInfo.ApplySlot[1] then
      self.ParentWidget.Img_Aura:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    else
      self.ParentWidget.Img_Aura:SetVisibility(ESlateVisibility.Collapsed)
    end
  end
  self:OnInitItemInfo(ModInfo, ModServerData)
end

function M:ShowModStarLevel(Target)
  self.ParentWidget.List_ModStar:SetVisibility(UIConst.VisibilityOp.Visible)
  self.ParentWidget.List_ModStar:ClearListItems()
  for i = 1, Target.ModCardLevelMax do
    local StarContent = NewObject(UIUtils.GetCommonItemContentClass())
    StarContent.Idx = i
    StarContent.bActivate = i <= Target.CurrentModCardLevel
    StarContent.bGolden = false
    self.ParentWidget.List_ModStar:AddItem(StarContent)
  end
  self.ParentWidget.List_ModStar:RegenerateAllEntries()
end

function M:OnInitItemInfo(ModInfo, ModServerData)
end

function M:UpdataEffectDetails(ModDataInfo, ModLevel, ModServerData)
  local ModAttrs = ModDataInfo.AddAttrs
  if ModAttrs then
    for _, ModAttr in ipairs(ModAttrs) do
      local AttrConfig = DataMgr.AttrConfig[ModAttr.AttrName]
      if not AttrConfig then
      else
        local _, ValueStr = ArmoryUtils:GenModAttrData(ModAttr, ModLevel, AttrConfig, ModDataInfo.Id)
        local ModAttrText = GText(AttrConfig.Name) .. ValueStr
        local EffectItem = UIManager(self):_CreateWidgetNew("CommonItemDetailsEffect")
        EffectItem.Text_Effect:SetText(ModAttrText)
        EffectItem.Switch_Type:SetActiveWidgetIndex(0)
        self.EffectDetails:AddChild(EffectItem)
      end
    end
  end
  if ModServerData and ModServerData.AddCharModCost then
    local ValueStr = "+" .. ModServerData:CalcExtralCharVolume()
    local ModAttrText = GText("UI_Mod_CostIncrease") .. ValueStr
    local EffectItem = UIManager(self):_CreateWidgetNew("CommonItemDetailsEffect")
    EffectItem.Text_Effect:SetText(ModAttrText)
    EffectItem.Switch_Type:SetActiveWidgetIndex(0)
    self.EffectDetails:AddChild(EffectItem)
  end
  if ModDataInfo.PassiveEffectsDesc then
    local ModDescText = ArmoryUtils:GenModPassiveEffectDesc(ModDataInfo, ModLevel)
    local EffectItem = UIManager(self):_CreateWidgetNew("CommonItemDetailsEffect")
    EffectItem.Text_Effect01:SetText(GText("UI_MOD_Effect") .. ModDescText)
    EffectItem.Switch_Type:SetActiveWidgetIndex(1)
    self.EffectDetails:AddChild(EffectItem)
  end
end

return M
