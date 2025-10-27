require("UnLua")
local SkillUtils = require("Utils.SkillUtils")
local CommonUtils = require("Utils.CommonUtils")
local ArmoryUtils = require("BluePrints.UI.WBP.Armory.ArmoryUtils")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:Construct()
  self.Pet_AttTips_List01.SkillName:SetText(GText("UI_Armory_Pet_Positive"))
  self.Pet_AttTips_List02.SkillName:SetText(GText("UI_Armory_Pet_Passive"))
  self.Pet_AttTips_List01.SkillCD:SetText(GText("UI_CD"))
  self.Pet_AttTips_List02.SkillCD:SetText(GText("UI_CD"))
  self.ParentWidget.Text_PetAlive:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
end

function M:InitItemInfo(ItemType, ItemId, UnitId, Content)
  local PetData = DataMgr.Pet[ItemId]
  local BattlePetData = DataMgr.BattlePet[PetData.BattlePetId]
  local Avatar = GWorld:GetAvatar()
  local PetServerData
  local Level = 1
  local MaxLevel = 1
  local EnhanceLevel, MaxEnhanceLevel = 0, 0
  PetServerData = Avatar.Pets[UnitId]
  if PetServerData then
    Level = PetServerData.Level
    EnhanceLevel = PetServerData.BreakNum
    if PetServerData.Name ~= "" then
      self.ParentWidget.Text_ItemName:SetText(PetServerData.Name)
    end
  end
  self.Pet_AttTips_List01:SetVisibility(ESlateVisibility.Collapsed)
  self.Pet_AttTips_List02:SetVisibility(ESlateVisibility.Collapsed)
  self.ParentWidget.Star:SetVisibility(ESlateVisibility.Collapsed)
  self.ParentWidget.Text_Split:SetVisibility(ESlateVisibility.Collapsed)
  self.ParentWidget.Text_WeaponLevel03:SetVisibility(ESlateVisibility.Collapsed)
  self.Pet_AttTips_List01.TextItem:ClearChildren()
  self.Pet_AttTips_List02.TextItem:ClearChildren()
  self.ParentWidget.Text_WeaponLevel02:SetText(Level)
  self.ParentWidget.Text_PetAlive:SetText(GText("Pet_ResourcePet"))
  if 1 == PetData.PetType then
    self.ParentWidget.Text_PetAlive:SetText(GText("Pet_BattlePet"))
    self.ParentWidget.Star:SetVisibility(ESlateVisibility.Visible)
    for _, v in pairs(DataMgr.PetBreak[ItemId]) do
      if EnhanceLevel >= v.PetBreakNum and v.PetBreakLevel then
        MaxLevel = v.PetBreakLevel
      end
      MaxEnhanceLevel = v.PetBreakNum
    end
    self:SetPetEnhanceLevel(EnhanceLevel, MaxEnhanceLevel)
    self.ParentWidget.Text_Split:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self.ParentWidget.Text_WeaponLevel03:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self.ParentWidget.Text_WeaponLevel03:SetText(MaxLevel)
    local SkillId = BattlePetData.SupportSkillId
    local SkillLevel = ArmoryUtils:GetPetSkillLevel(EnhanceLevel)
    local SkillDesc = SkillUtils.GetSkillDesc(SkillId, SkillLevel) or ""
    if "" ~= SkillDesc then
      local TextItem = UIManager(self):_CreateWidgetNew("ItemDetailPetTextItem")
      TextItem.Text_PetSkill_Describe:SetText(GText(SkillDesc))
      self.Pet_AttTips_List01.TextItem:AddChild(TextItem)
      self.Pet_AttTips_List01:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    else
      DebugPrint("ZDX_\229\174\160\231\137\169Tips\228\184\187\229\138\168\230\138\128\232\131\189\230\143\143\232\191\176\228\184\186\231\169\186")
    end
    local PassiveEffectDesc = ArmoryUtils:GenPetPassiveEffectDesc(BattlePetData, SkillLevel)
    if "" == PassiveEffectDesc then
      DebugPrint("ZDX_\229\174\160\231\137\169Tips\232\162\171\229\138\168\230\138\128\232\131\189\230\143\143\232\191\176\228\184\186\231\169\186")
    else
      local TextItem = UIManager(self):_CreateWidgetNew("ItemDetailPetTextItem")
      TextItem.Text_PetSkill_Describe:SetText(GText(PassiveEffectDesc))
      self.Pet_AttTips_List02.TextItem:AddChild(TextItem)
      self.Pet_AttTips_List02:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    end
    local CD = ""
    if DataMgr.Skill[SkillId] and DataMgr.Skill[SkillId][SkillLevel] then
      CD = DataMgr.Skill[SkillId][SkillLevel][0].CD
    end
    if "" == CD then
      DebugPrint("ZDX_\229\174\160\231\137\169TipsCD\228\184\186\231\169\186")
      self.Pet_AttTips_List01.SkillCD:SetVisibility(ESlateVisibility.Collapsed)
      self.Pet_AttTips_List01.SkillCD_Num:SetVisibility(ESlateVisibility.Collapsed)
    else
      self.Pet_AttTips_List01.SkillCD_Num:SetText(CD .. "s")
      self.Pet_AttTips_List01.SkillCD_Num:SetVisibility(ESlateVisibility.Visible)
    end
    self.Pet_AttTips_List02.SkillCD:SetVisibility(ESlateVisibility.Collapsed)
    self.Pet_AttTips_List02.SkillCD_Num:SetVisibility(ESlateVisibility.Collapsed)
  end
  self.HB_Tag:ClearChildren()
  if PetServerData then
    for _, v in pairs(PetServerData.Entry) do
      local Widget = UIManager(self):_CreateWidgetNew("PetEntryItemDetails")
      if DataMgr.PetEntry[v] then
        assert(DataMgr.PetEntry[v].IconS, "\230\156\170\233\133\141\231\189\174\229\174\160\231\137\169\229\164\169\232\181\139IconS", v)
        Widget.Icon_Entry:SetBrushResourceObject(LoadObject(DataMgr.PetEntry[v].IconS))
        Widget.Text_Entry:SetText(GText(DataMgr.PetEntry[v].PetEntryName))
        if 3 == DataMgr.PetEntry[v].Rarity then
          Widget.Icon_Entry:SetColorAndOpacity(Widget.Blue)
        elseif 4 == DataMgr.PetEntry[v].Rarity then
          Widget.Icon_Entry:SetColorAndOpacity(Widget.Purple)
        elseif 5 == DataMgr.PetEntry[v].Rarity then
          Widget.Icon_Entry:SetColorAndOpacity(Widget.Yellow)
        end
        self.HB_Tag:AddChild(Widget)
      end
    end
  end
  self.Text_Pet_Describe:SetText(GText(PetData.IpDes))
end

function M:SetPetEnhanceLevel(EnhanceLevel, MaxEnhanceLevel)
  for i = 1, 6 do
    local str = "Switch_Star0" .. i
    local StarWidget = self.ParentWidget[str]
    if StarWidget then
      if i <= EnhanceLevel then
        StarWidget:SetActiveWidgetIndex(0)
      elseif i <= MaxEnhanceLevel then
        StarWidget:SetActiveWidgetIndex(1)
      else
        StarWidget:SetVisibility(ESlateVisibility.Collapsed)
      end
    end
  end
end

return M
