require("UnLua")
local UpgradeUtils = require("Utils.UpgradeUtils")
local ArmoryUtils = require("BluePrints.UI.WBP.Armory.ArmoryUtils")
local SkillUtils = require("Utils.SkillUtils")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})
M._components = {
  "BluePrints.UI.WBP.Armory.PetEntry_Component",
  "BluePrints.UI.BP_EMUserWidgetUtils_C"
}

function M:Construct()
  self.Btn_Intensify:BindEventOnClicked(self, self.OnIntensifyBtnClicked)
  self.Btn_Intensify:BindForbidStateExecuteEvent(self, self.OnForbiddenIntensifyBtnClicked)
  self.Btn_Replace:BindEventOnClicked(self, self.OnReplaceBtnClicked)
  self.Btn_Replace:BindForbidStateExecuteEvent(self, self.OnForbiddenReplaceBtnClicked)
  self.ConfirmBtns = {
    self.Btn_Intensify,
    self.Btn_Replace
  }
  self.Text_Skill:SetText(GText("UI_Armory_Skill"))
  self.List_Skill:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  self.List_Skill.bIsFocusable = false
  self:AddDispatcher(EventID.OnSwitchPet, self, self.OnSwitchPet)
end

function M:OnIntensifyBtnClicked()
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_confirm", nil, nil)
  if not self.Pet:IsFinalMaxLevel() then
    local PetId = self.Pet.PetId
    local Level = self.Pet.Level
    local Params = {
      Target = self.Pet,
      Type = CommonConst.ArmoryType.Pet,
      Tag = CommonConst.ArmoryType.Pet,
      HideItemTips = true
    }
    local BreakData = DataMgr.PetBreak[PetId]
    local BreakLevelInfo = BreakData and BreakData[self.Pet.BreakNum]
    local NextBreakLevelInfo = BreakData and BreakData[self.Pet.BreakNum + 1]
    local UIConfig = DataMgr.SystemUI.ArmoryCardLevelWeapon
    if NextBreakLevelInfo then
      if Level < BreakLevelInfo.PetBreakLevel then
        Params.BehaviourType = "LevelUp"
        UIManager(self):LoadUI(UIConst.LoadInConfig, UIConfig.UIName, self.Parent:GetZOrder(), CommonConst.ArmoryType.Pet, self.Pet, self, Params)
      else
        Params.BehaviourType = "BreakLevelUp"
        UIManager(self):LoadUI(UIConst.LoadInConfig, UIConfig.UIName, self.Parent:GetZOrder(), CommonConst.ArmoryType.Pet, self.Pet, self, Params)
      end
    else
      Params.BehaviourType = "LevelUp"
      UIManager(self):LoadUI(UIConst.LoadInConfig, UIConfig.UIName, self.Parent:GetZOrder(), CommonConst.ArmoryType.Pet, self.Pet, self, Params)
    end
  else
    UIManager(self):ShowUITip("CommonToastMain", GText("Max_Level_Achieved"))
  end
end

function M:OnReplaceBtnClicked()
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_confirm", nil, nil)
  local Avatar = ArmoryUtils:GetAvatar()
  if Avatar then
    self.Parent:BlockAllUIInput(true)
    Avatar:EquipPet(self.Pet.UniqueId)
  end
end

function M:OnSwitchPet()
  self.Parent:BlockAllUIInput(false)
end

function M:OnForbiddenIntensifyBtnClicked()
  UIManager(self):ShowUITip("CommonToastMain", GText("Max_Level_Achieved"))
end

function M:OnForbiddenReplaceBtnClicked()
end

function M:UpdateButtonStyle(CurPet, Pet)
  self.ButtonStyleInfo = {
    {},
    {}
  }
  local MaxLevel, RealMaxLevel = UpgradeUtils.GetMaxLevel(Pet, CommonConst.ArmoryType.Pet)
  if Pet:IsFinalMaxLevel() then
    self.ButtonStyleInfo[1].ForbidBtn = true
    self.ButtonStyleInfo[1].Visibility = UIConst.VisibilityOp.Collapsed
  else
    if Pet.Level >= (MaxLevel or RealMaxLevel) then
      self.ButtonStyleInfo[1].Text = GText("UI_FUNC_BREAKLEVELUP")
    else
      self.ButtonStyleInfo[1].Text = GText("UI_FUNC_LEVELUP")
    end
    self.ButtonStyleInfo[1].ForbidBtn = false
    self.ButtonStyleInfo[1].Visibility = UIConst.VisibilityOp.SelfHitTestInvisible
  end
  self.ButtonStyleInfo[2].Visibility = UIConst.VisibilityOp.SelfHitTestInvisible
  if CurPet == Pet then
    self.ButtonStyleInfo[2].Text = GText("UI_Armory_AlreadyPut")
    self.ButtonStyleInfo[2].ForbidBtn = true
  else
    self.ButtonStyleInfo[2].Text = GText("UI_Armory_PutOn")
    self.ButtonStyleInfo[2].ForbidBtn = false
  end
  if self.bHideDeployBtn then
    self.ButtonStyleInfo[2].Visibility = UIConst.VisibilityOp.Collapsed
  end
  for i, Param in ipairs(self.ButtonStyleInfo) do
    self.ConfirmBtns[i]:SetVisibility(Param.Visibility)
    self.ConfirmBtns[i]:SetText(Param.Text)
    self.ConfirmBtns[i]:ForbidBtn(Param.ForbidBtn)
  end
end

function M:GetButtonStyleInfo()
  return self.ButtonStyleInfo
end

function M:Init(Params)
  self.Parent = Params.Parent
  self.Pet = Params.Target
  self.IsPreviewMode = Params.IsPreviewMode
  self.bHideDeployBtn = Params.bHideDeployBtn
  self.bNeedPreviewSwitcher = Params.bNeedPreviewSwitcher
  self.Parent.ActorController:BindEvent(self, {
    OnPlayPetFresnel = self.OnPlayPetFresnel,
    OnCharModelChanged = self.OnCharModelChanged
  })
  if self.IsPreviewMode and self.bNeedPreviewSwitcher then
    self.PreviewTab:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  else
    self.PreviewTab:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  if self.IsPreviewMode then
    self.WidgetSwitcher_State:SetActiveWidgetIndex(1)
    self.PreviewTab:UpdateState()
  else
    self.WidgetSwitcher_State:SetActiveWidgetIndex(0)
  end
  self:UpdatePetInfos(self.Pet)
  self:UpdateSkillInfos(self.Pet)
  self:UpdateLevelUpBtn(self.Pet)
  self:UpdateEntryInfos(self.Pet)
  self:UpdateButtonStyle(Params.CurPet, self.Pet)
end

function M:UpdatePetInfos(Pet)
  if not Pet then
    return
  end
  local MaxLevel, FinalMaxLevel = UpgradeUtils.GetMaxLevel(Pet, "Pet")
  local RealMaxLevel = MaxLevel or FinalMaxLevel
  local LevelUpData = DataMgr.PetLevelUp[Pet.Level]
  local Percent = math.clamp(Pet.Exp / LevelUpData.PetLevelMaxExp, 0, 1)
  if RealMaxLevel <= Pet.Level then
    Percent = 1
  end
  local BreakLevelUpData = DataMgr.PetBreak[Pet.PetId]
  self.LevelInfo:Init(Pet.Level, RealMaxLevel, Percent, Pet.BreakNum or 0, BreakLevelUpData)
  local Data = DataMgr.Pet[Pet.PetId]
  if Data then
    self.Text_Describe:SetText(GText(Data.IpDes))
  end
end

function M:UpdateSkillInfos(Pet)
  local Avatar = GWorld:GetAvatar()
  if not Avatar or not Pet then
    return
  end
  self.List_Skill:ClearListItems()
  local Data = DataMgr.BattlePet[Pet:Data().BattlePetId]
  if not Data then
    return
  end
  if Data.SupportSkillId then
    local SkillDesc = SkillUtils.GetSkillDesc(Data.SupportSkillId, ArmoryUtils:GetPetSkillLevel(Pet.BreakNum))
    local Obj = NewObject(UIUtils.GetCommonItemContentClass())
    Obj.Owner = self
    Obj.Pet = Pet
    Obj.SkillId = Data.SupportSkillId
    Obj.SkillName = GText("UI_Armory_Pet_Positive")
    Obj.SkillDesc = SkillDesc
    local SkillData = DataMgr.Skill[Data.SupportSkillId]
    if SkillData and SkillData[1] and SkillData[1][0] then
      SkillData = SkillData[1][0]
      Obj.SkillData = SkillData
      Obj.SkillBtnDesc = GText(SkillData.SkillBtnDesc)
    end
    self.List_Skill:AddItem(Obj)
  end
  local PassiveEffectDesc = ArmoryUtils:GenPetPassiveEffectDesc(Data, ArmoryUtils:GetPetSkillLevel(Pet.BreakNum))
  if PassiveEffectDesc and "" ~= PassiveEffectDesc then
    local Obj = NewObject(UIUtils.GetCommonItemContentClass())
    Obj.Owner = self
    Obj.Pet = Pet
    Obj.SkillLevel = Pet.BreakNum + 1
    Obj.SkillName = GText("UI_Armory_Pet_Passive")
    Obj.SkillDesc = PassiveEffectDesc
    self.List_Skill:AddItem(Obj)
  end
end

function M:UpdateLevelUpBtn(Target)
  if not self.bHideReddot then
    local CanBreak = false
    if Target:IsMaxLevelBeforeBreak() and not Target:IsMaxBreak() then
      local Avatar = GWorld:GetAvatar()
      local BreakData = DataMgr.PetBreak[Target.PetId][Target.BreakNum]
      local ConsumeIds = BreakData.ConsumePetId
      for _, Pet in pairs(Avatar.Pets) do
        if CanBreak then
          break
        end
        for _, Id in pairs(ConsumeIds) do
          if Pet.UniqueId ~= Target.UniqueId and Id == Pet.PetId then
            CanBreak = true
            break
          end
        end
      end
      local ConsumeResources = BreakData.ConsumeResource or {}
      for ResourceId, _ in pairs(ConsumeResources) do
        local Resource = Avatar.Resources[ResourceId]
        if Resource and Resource.Count > 0 then
          CanBreak = true
          break
        end
      end
    end
    if CanBreak then
      self.Btn_Intensify:SetReddotVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    else
      self.Btn_Intensify:SetReddotVisibility(UIConst.VisibilityOp.Collapsed)
    end
  else
    self.Btn_Intensify:SetReddotVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

function M:PlayInAnim()
  if self:IsAnimationPlaying(self.In) or self:IsAnimationPlaying(self.Switch_Tab) then
    self:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    return
  end
  self:PlayAnimation(self.In)
  self:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.WB_EntryItem:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self:AddTimer(0.01, function()
    self.LevelInfo:PlayStarsInAnim()
    if rawget(self, "ShouldPlayNormalIn") then
      self.WB_EntryItem:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
      self:PlayEntriesInAnim()
    end
    self:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  end, false, 0, "PetInfoInAnim", true)
end

function M:PlayOutAnim()
  self:RemoveTimer("PetInfoInAnim")
  self:SetVisibility(UIConst.VisibilityOp.Collapsed)
end

function M:OnCharModelChanged()
  rawset(self, "ShouldPlayNormalIn", nil)
end

function M:OnPlayPetFresnel()
  rawset(self, "ShouldPlayNormalIn", true)
  self.WB_EntryItem:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  self:PlayEntriesInAnim()
end

AssembleComponents(M)
return M
