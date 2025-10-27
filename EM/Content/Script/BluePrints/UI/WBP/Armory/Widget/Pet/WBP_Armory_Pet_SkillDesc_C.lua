require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:Construct()
  self.Text_Level:SetText(GText("UI_LEVEL_NAME"))
  self.Text_CD:SetText(GText("UI_Pet_Skill_CD"))
  self:SetNavigationRuleBase(EUINavigation.Right, EUINavigationRule.Stop)
  self.GameInputSubsystem = UIManager(self):GetGameInputModeSubsystem()
  self.GameInputSubsystem.OnInputMethodChanged:Add(self, self.OnUpdateUIStyleByInputTypeChange)
  self:OnUpdateUIStyleByInputTypeChange(UIUtils.UtilsGetCurrentInputType())
end

function M:OnListItemObjectSet(Content)
  self.Content = Content
  self.SkillData = Content.SkillData
  self.Text_Skill_Name:SetText(Content.SkillName)
  self.Num_Level:SetText(Content.Pet:GetSkillLevel())
  self.Text_SkillDesc:SetText(GText(Content.SkillDesc) or "")
  if self.SkillData and self.SkillData.CD then
    self.Num_CD:SetText((self.SkillData.CD or "") .. "s")
    self.Num_CD:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    self.Text_CD:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    local Icon
    local IconName = self.SkillData.SkillBtnIcon
    if IconName then
      Icon = LoadObject("/Game/UI/Texture/Dynamic/Atlas/Skill/T_" .. IconName .. ".T_" .. IconName)
    else
      Icon = LoadObject("/Game/UI/Texture/Dynamic/Atlas/Armory/T_Armory_Pet_PassiveSkill01.T_Armory_Pet_PassiveSkill01")
    end
    self.Icon_Skill:SetBrushResourceObject(Icon)
  else
    self.Num_CD:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.Text_CD:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  self:UpdateKeyInfo(self.Content)
  self:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
end

function M:OnUpdateUIStyleByInputTypeChange(CurInputDevice, CurGamepadName)
  self.IsGamepadInput = CurInputDevice == ECommonInputType.Gamepad
  if self.Content then
    self:UpdateKeyInfo(self.Content)
  end
end

function M:UpdateKeyInfo(Params)
  local Key = Params.SkillData and CommonUtils:GetActionMappingKeyName("Skill3")
  self.Skill_Key.Key:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  if Key and "" ~= Key then
    local KeyInfo = {
      Desc = Params.SkillBtnDesc
    }
    if self.IsGamepadInput then
      local IconList = UIUtils.GetIconListByActionName("Skill3")
      if IconList then
        if #IconList > 1 then
          KeyInfo.Type = "Add"
          KeyInfo.KeyInfoList = {}
          for _, value in ipairs(IconList) do
            table.insert(KeyInfo.KeyInfoList, {Type = "Img", ImgShortPath = value})
          end
          self.Skill_Key:CreateSubKeyDesc(KeyInfo)
        else
          KeyInfo.KeyInfoList = {
            {
              Type = "Img",
              ImgShortPath = IconList[1]
            }
          }
          self.Skill_Key:CreateCommonKey(KeyInfo)
        end
      end
    else
      local Text
      if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Touch then
        self.Skill_Key.Key:SetVisibility(UIConst.VisibilityOp.Collapsed)
      else
        Text = CommonUtils:GetKeyText(Key)
      end
      KeyInfo.KeyInfoList = {
        {Type = "Text", Text = Text}
      }
      self.Skill_Key:CreateCommonKey(KeyInfo)
    end
    self.Panel_Key:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  else
    self.Panel_Key:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

return M
