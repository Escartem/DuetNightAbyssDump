require("UnLua")
local ArmoryUtils = require("BluePrints.UI.WBP.Armory.ArmoryUtils")
local ModModel = ModController:GetModel()
local M = Class("BluePrints.UI.BP_EMUserWidget_C")

function M:OnListItemObjectSet(Content)
  self:SetVisibility(UIConst.VisibilityOp.Visible)
  self.Content = Content
  self.Parent = self.Content.Parent
  self.Target = ModModel:GetTarget()
  self.SkillId = Content.Skill.SkillId
  Content.UI = self
  local SkillData = DataMgr.Skill[Content.Skill.SkillId]
  if SkillData and SkillData[1] and SkillData[1][0] then
    local Data = SkillData[1][0]
    local IconName = Data.SkillBtnIcon
    local Icon
    if IconName then
      Icon = LoadObject("/Game/UI/Texture/Dynamic/Atlas/Skill/T_" .. IconName .. ".T_" .. IconName)
    end
    Icon = Icon or LoadObject("/Game/UI/Texture/Dynamic/Atlas/Skill/T_Skill_Heitao_Skill01.T_Skill_Heitao_Skill01")
    self.Icon_Skill_1:GetDynamicMaterial():SetTextureParameterValue("Mask", Icon)
    if Data.SkillType == "Passive" then
      self.Text_Skill_Name_1:SetText(GText("UI_Armory_Passive"))
    else
      self.Text_Skill_Name_1:SetText(GText(Data.SkillBtnDesc))
    end
  end
  self.Line_1:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  if Content.bHideLine then
    self.Line_1:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  if Content.LineOffset then
    self.Line_1:SetRenderTranslation(FVector2D(Content.LineOffset, 0))
  end
end

function M:Construct()
  self.BtnArea.OnClicked:Add(self, self.OnBtnClick)
end

function M:Destruct()
  self.BtnArea.OnClicked:Remove(self, self.OnBtnClick)
end

function M:OnBtnClick()
  self:LoadSkillDetailsUI()
  AudioManager(self):PlayUISound(self, "event:/ui/armory/click_skill_icon", nil, nil)
end

function M:LoadSkillDetailsUI()
  local UIConfig = DataMgr.SystemUI.SkillDetails
  UIManager(self):LoadUI(UIConst.LoadInConfig, UIConfig.UIName, self.Parent:GetZOrder(), {
    CharUuid = self.Target.Uuid,
    SelectedSkillId = self.SkillId,
    OnClosedObj = self,
    OnClosedCallback = self.OnSkillDetailsClosed,
    IsPreviewMode = ArmoryUtils:GetIsPreviewMode()
  })
end

function M:OnSkillDetailsClosed()
  if self.Content.Parent and self.Content.Parent.CurrentMontageTags then
    local ArmoryMain = UIManager(self):GetArmoryUIObj()
    if ArmoryMain and ArmoryMain.ActorController then
      ArmoryMain.ActorController:SetMontageAndCamera(table.unpack(self.Content.Parent.CurrentMontageTags))
    end
  end
end

return M
