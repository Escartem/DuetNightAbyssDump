require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:Construct()
  self.Text_Lv:SetText(GText("UI_LEVEL_NAME"))
  self.Text_CD:SetText(GText("UI_Pet_Skill_CD"))
  self:SetNavigationRuleBase(EUINavigation.Right, EUINavigationRule.Stop)
  self.GameInputSubsystem = UIManager(self):GetGameInputModeSubsystem()
  self.GameInputSubsystem.OnInputMethodChanged:Add(self, self.OnUpdateUIStyleByInputTypeChange)
  self:OnUpdateUIStyleByInputTypeChange(UIUtils.UtilsGetCurrentInputType())
end

function M:OnListItemObjectSet(Content)
  self.Content = Content
  self.SkillData = Content.SkillData
  self.Text_Skill_Name_1:SetText(Content.SkillName)
  self.Text_Level:SetText(Content.Pet:GetSkillLevel())
  self.TextBlock:SetText(GText(Content.SkillDesc) or "")
  if self.SkillData and self.SkillData.CD then
    self.Num_CD:SetText((self.SkillData.CD or "") .. "s")
    self.Num_CD:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    self.Text_CD:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
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
      KeyInfo.KeyInfoList = {
        {
          Type = "Text",
          Text = CommonUtils:GetKeyText(Key)
        }
      }
      self.Skill_Key:CreateCommonKey(KeyInfo)
    end
    self.Border_Key:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  else
    self.Border_Key:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

return M
