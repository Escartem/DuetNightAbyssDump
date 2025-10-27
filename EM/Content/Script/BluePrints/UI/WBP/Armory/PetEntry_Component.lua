require("UnLua")
local ArmoryUtils = require("BluePrints.UI.WBP.Armory.ArmoryUtils")
local SkillUtils = require("Utils.SkillUtils")
local M = {}

function M:Construct()
  if self.WB_Entry then
    self.EntryInfoWidgets = self.WB_Entry:GetAllChildren():ToTable()
  end
  self.EntryWidgets = {
    self.EntryItem_1,
    self.EntryItem_2,
    self.EntryItem_3,
    self.EntryItem_4
  }
end

function M:OnFuseBtnClicked()
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_confirm", nil, nil)
  local UIConfig = DataMgr.SystemUI.PetMix
  local Params = {
    Parent = self,
    Target = self.Pet,
    User = CommonConst.ArmoryType.Pet,
    CurEntryContent = self.CurEntryContent,
    IsPreviewMode = self.IsPreviewMode
  }
  UIManager(self):LoadUI(UIConst.LoadInConfig, UIConfig.UIName, self.Parent:GetZOrder(), Params)
end

function M:UpdateEntryInfos(Pet)
  if not Pet or not Pet.Entry then
    return
  end
  local Data, EntryId
  local BreakData = DataMgr.PetBreak[Pet.PetId]
  local MaxEntry = 0
  if BreakData then
    MaxEntry = BreakData[#BreakData].EntryNum or 0
  end
  local UnlockedEntryNum = BreakData[Pet.BreakNum].EntryNum or 0
  local EntryItemWidgets
  if Pet:IsResourcePet() then
    MaxEntry = 1
    for i = 1, 4 do
      self["EntryItem_" .. i]:SetVisibility(UIConst.VisibilityOp.Collapsed)
    end
    EntryItemWidgets = {
      self.EntryItem_3
    }
    self.EntryItem_3:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  else
    for i = 1, 4 do
      self["EntryItem_" .. i]:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    end
    if Pet:IsPremium() then
      EntryItemWidgets = {
        self.EntryItem_1,
        self.EntryItem_3,
        self.EntryItem_4,
        self.EntryItem_2
      }
    else
      EntryItemWidgets = {
        self.EntryItem_1,
        self.EntryItem_3,
        self.EntryItem_2
      }
      self.EntryItem_4:SetVisibility(UIConst.VisibilityOp.Collapsed)
    end
  end
  self.DisplayEntryItemWidgets = EntryItemWidgets
  self.EntryContents = {}
  local HasAnyEntry = false
  for i = 1, 4 do
    EntryId = Pet.Entry[i]
    Data = DataMgr.PetEntry[EntryId]
    local Content = {
      Index = i,
      Owner = self,
      OnClicked = self.OnEntryClicked
    }
    if Data then
      Content.EntryId = EntryId
      Content.Name = GText(Data.PetEntryName)
      Content.Rarity = Data.Rarity
      Content.Desc = SkillUtils.CalcPetEntryDesc(EntryId)
    end
    Content.IsResourcePet = Pet:IsResourcePet()
    Content.IsEmpty = not EntryId or EntryId <= 0
    Content.IsLocked = UnlockedEntryNum < i
    self:OnEntryContentCreated(Content)
    local Widget = self.EntryInfoWidgets and self.EntryInfoWidgets[i]
    if MaxEntry < i or Content.IsLocked or Content.IsEmpty then
      if Widget then
        Widget:SetVisibility(UIConst.VisibilityOp.Collapsed)
      end
    else
      if Widget then
        Widget:Init(Content)
        Widget:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
      end
      HasAnyEntry = true
    end
    if EntryItemWidgets[i] then
      EntryItemWidgets[i]:Init(Content)
    end
    table.insert(self.EntryContents, Content)
  end
  self.CurEntryContent = self.EntryContents[1]
  if self.WB_Entry then
    if HasAnyEntry then
      self.WB_Entry:SetVisibility(UIConst.VisibilityOp.Visible)
      self.Bg_Empty:SetVisibility(UIConst.VisibilityOp.Collapsed)
    else
      self.WB_Entry:SetVisibility(UIConst.VisibilityOp.Collapsed)
      self.Bg_Empty:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    end
  end
end

function M:OnEntryContentCreated(Content)
  Content.OnAddedToFocusPath = self.OnEntryWidgetAddedToFocusPath
  Content.OnRemovedFromFocusPath = self.OnEntryWidgetRemovedFromFocusPath
end

function M:OnEntryWidgetAddedToFocusPath(Widget)
  self.IsEntryWidgetInFocusPath = true
  self.CurFocusEntryWidget = Widget
  self:OnFocusChanged()
end

function M:OnFocusChanged()
end

function M:OnEntryWidgetRemovedFromFocusPath(Widget)
  self.IsEntryWidgetInFocusPath = false
end

function M:OnEntrySelectd(Content)
  AudioManager(self):PlayUISound(self, "event:/ui/common/pet_potential_click", nil, nil)
  ArmoryUtils:SetContentIsSelected(self.CurEntryContent, false)
  self.CurEntryContent = Content
  ArmoryUtils:SetContentIsSelected(self.CurEntryContent, true)
  Content.Widget:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
end

function M:OnEntryClicked(Content, Widget)
  if self.IsPreviewMode then
    return
  end
  self:OnEntrySelectd(Content)
  if Content then
    if Content.IsLocked then
      UIManager(self):ShowUITip(UIConst.Tip_CommonToast, GText("Pet_AffixSlot_LockToast"))
    elseif not Content.IsResourcePet and Content.Widget == Widget then
      self:OpenPetMix(Content)
    end
  end
end

function M:OpenPetMix()
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_confirm", nil, nil)
  local UIConfig = DataMgr.SystemUI.PetMix
  local Params = {
    Parent = self,
    Target = self.Pet,
    User = CommonConst.ArmoryType.Pet,
    CurEntryContent = self.CurEntryContent,
    IsPreviewMode = self.IsPreviewMode
  }
  UIManager(self):LoadUI(UIConst.LoadInConfig, UIConfig.UIName, self.Parent:GetZOrder(), Params)
end

function M:InitNavigationRules()
  self.LastTopFocusedEntryWidget = nil
  if 1 == #self.DisplayEntryItemWidgets then
    local Widget = self.DisplayEntryItemWidgets[1]
    Widget:SetNavigationRuleBase(EUINavigation.Up, EUINavigationRule.Stop)
    Widget:SetNavigationRuleBase(EUINavigation.Right, EUINavigationRule.Stop)
    Widget:SetNavigationRuleBase(EUINavigation.Down, EUINavigationRule.Stop)
    Widget:SetNavigationRuleBase(EUINavigation.Left, EUINavigationRule.Escape)
  elseif 2 == #self.DisplayEntryItemWidgets then
    local Widget1 = self.DisplayEntryItemWidgets[1]
    local Widget2 = self.DisplayEntryItemWidgets[2]
    Widget1:SetNavigationRuleBase(EUINavigation.Up, EUINavigationRule.Stop)
    Widget1:SetNavigationRuleBase(EUINavigation.Down, EUINavigationRule.Stop)
    Widget1:SetNavigationRuleExplicit(EUINavigation.Right, Widget2)
    Widget1:SetNavigationRuleBase(EUINavigation.Left, EUINavigationRule.Escape)
    Widget2:SetNavigationRuleBase(EUINavigation.Up, EUINavigationRule.Stop)
    Widget2:SetNavigationRuleBase(EUINavigation.Down, EUINavigationRule.Stop)
    Widget2:SetNavigationRuleExplicit(EUINavigation.Left, Widget2)
    Widget2:SetNavigationRuleBase(EUINavigation.Right, EUINavigationRule.Stop)
  elseif 3 == #self.DisplayEntryItemWidgets then
    local Widget1, Widget2, Widget3 = self.EntryItem_1, self.EntryItem_2, self.EntryItem_3
    Widget1:SetNavigationRuleBase(EUINavigation.Up, EUINavigationRule.Stop)
    Widget1:SetNavigationRuleBase(EUINavigation.Left, EUINavigationRule.Escape)
    Widget1:SetNavigationRuleExplicit(EUINavigation.Right, Widget2)
    Widget1:SetNavigationRuleCustom(EUINavigation.Down, {
      self,
      function()
        self.LastTopFocusedEntryWidget = Widget1
        return Widget3
      end
    })
    Widget2:SetNavigationRuleBase(EUINavigation.Up, EUINavigationRule.Stop)
    Widget2:SetNavigationRuleBase(EUINavigation.Right, EUINavigationRule.Stop)
    Widget2:SetNavigationRuleExplicit(EUINavigation.Left, Widget1)
    Widget2:SetNavigationRuleCustom(EUINavigation.Down, {
      self,
      function()
        self.LastTopFocusedEntryWidget = Widget2
        return Widget3
      end
    })
    Widget3:SetNavigationRuleExplicit(EUINavigation.Left, Widget1)
    Widget3:SetNavigationRuleExplicit(EUINavigation.Right, Widget2)
    Widget3:SetNavigationRuleBase(EUINavigation.Down, EUINavigationRule.Stop)
    Widget3:SetNavigationRuleCustom(EUINavigation.Up, {
      self,
      function()
        if self.LastTopFocusedEntryWidget then
          return self.LastTopFocusedEntryWidget
        else
          return Widget1
        end
      end
    })
  elseif 4 == #self.DisplayEntryItemWidgets then
    local Widget1, Widget2, Widget3, Widget4 = self.EntryItem_1, self.EntryItem_2, self.EntryItem_3, self.EntryItem_4
    Widget1:SetNavigationRuleBase(EUINavigation.Up, EUINavigationRule.Stop)
    Widget1:SetNavigationRuleExplicit(EUINavigation.Down, Widget3)
    Widget1:SetNavigationRuleExplicit(EUINavigation.Right, Widget2)
    Widget1:SetNavigationRuleBase(EUINavigation.Left, EUINavigationRule.Escape)
    Widget2:SetNavigationRuleBase(EUINavigation.Up, EUINavigationRule.Stop)
    Widget2:SetNavigationRuleExplicit(EUINavigation.Down, Widget4)
    Widget2:SetNavigationRuleExplicit(EUINavigation.Left, Widget1)
    Widget2:SetNavigationRuleBase(EUINavigation.Right, EUINavigationRule.Stop)
    Widget3:SetNavigationRuleExplicit(EUINavigation.Up, Widget1)
    Widget3:SetNavigationRuleBase(EUINavigation.Down, EUINavigationRule.Stop)
    Widget3:SetNavigationRuleBase(EUINavigation.Left, EUINavigationRule.Escape)
    Widget3:SetNavigationRuleExplicit(EUINavigation.Right, Widget4)
    Widget4:SetNavigationRuleExplicit(EUINavigation.Up, Widget2)
    Widget4:SetNavigationRuleBase(EUINavigation.Down, EUINavigationRule.Stop)
    Widget4:SetNavigationRuleExplicit(EUINavigation.Left, Widget3)
    Widget4:SetNavigationRuleBase(EUINavigation.Right, EUINavigationRule.Stop)
  end
end

function M:PlayEntriesInAnim()
  for index, value in ipairs(self.DisplayEntryItemWidgets) do
    value:PlayInAnim()
  end
end

return M
