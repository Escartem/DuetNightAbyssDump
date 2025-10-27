require("UnLua")
local SkillUtils = require("Utils.SkillUtils")
local M = Class("BluePrints.UI.BP_UIState_C")

function M:Construct()
  self.TabUI = {
    self.First,
    self.Second
  }
  self.WBP_VideoPlayer:HideSkipButton(true)
end

function M:SetKeyInfo(SwitchKey, DetailsKey)
  self.SwitchKey = SwitchKey
  self.DetailsKey = DetailsKey
  if SwitchKey then
    self.Btn_Switch:CreateCommonKey({
      KeyInfoList = {
        {Type = "Text", Text = SwitchKey}
      },
      bLongPress = false,
      Desc = GText("UI_SWITCH")
    })
    self.Btn_Switch02:CreateCommonKey({
      KeyInfoList = {
        {Type = "Text", Text = SwitchKey}
      },
      bLongPress = false,
      Desc = GText("UI_SWITCH")
    })
  end
  if DetailsKey then
    self.Btn_Details:CreateCommonKey({
      KeyInfoList = {
        {Type = "Text", Text = DetailsKey}
      },
      bLongPress = false,
      Desc = GText("UI_DETAILS")
    })
    self.Btn_Details02:CreateCommonKey({
      KeyInfoList = {
        {Type = "Text", Text = DetailsKey}
      },
      bLongPress = false,
      Desc = GText("UI_DETAILS")
    })
  end
end

function M:UpdateInfos(SkillId, Level, WeaponId)
  self.SkillId = SkillId
  self.Level = Level
  self.CurrentTab = 1
  self.AttrCount = 0
  self.Key:SetVisibility(UIConst.VisibilityOp.Collapsed)
  local NameAndLevel = ""
  local SkillDesc = ""
  if WeaponId then
    self.Type = "Weapon"
    local data = DataMgr.BattleWeapon[WeaponId]
    if data and data.PassiveEffectsDesc then
      SkillDesc = GText(data.PassiveEffectsDesc)
      if data.PassiveEffectsDescValues then
        for i, value in ipairs(data.PassiveEffectsDescValues) do
          local valueStr = SkillUtils.CalcSkillDesc(value, 0)
          local index = string.find(valueStr, "%%", 1)
          if index then
            valueStr = valueStr .. "%"
          end
          SkillDesc = string.gsub(SkillDesc, "#" .. i, valueStr)
        end
      end
    end
    self.Btn_Details:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.Text_Passive:SetText(GText("UI_WEAPON_PASSIVE"))
    self.Text_Passive02:SetText(GText("UI_WEAPON_PASSIVE"))
    self.Text_Passive:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    self.Text_Passive02:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    self.Key:SetVisibility(UIConst.VisibilityOp.Collapsed)
  else
    local SkillData = DataMgr.Skill[SkillId]
    if SkillData and SkillData[1] and SkillData[1][0] then
      local data = SkillData[1][0]
      self.SkillData = data
      NameAndLevel = GText(data.SkillName) .. " " .. GText("UI_LEVEL_NAME") .. Level
      local SkillLevelUpInfo = DataMgr.SkillLevelUp[self.SkillId]
      if SkillLevelUpInfo and Level >= #SkillLevelUpInfo + 1 then
        NameAndLevel = GText(data.SkillName) .. " " .. GText("Max_Level_Achieved")
      end
      self.Type = "Char"
      if self.DetailsKey then
        self.Btn_Details:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
        self.Btn_Details02:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
      else
        self.Btn_Details:SetVisibility(UIConst.VisibilityOp.Collapsed)
        self.Btn_Details02:SetVisibility(UIConst.VisibilityOp.Collapsed)
      end
      self.Text_Passive:SetVisibility(UIConst.VisibilityOp.Collapsed)
      self.Text_Passive02:SetVisibility(UIConst.VisibilityOp.Collapsed)
      SkillDesc = GText(data.SkillDesc)
      local SKillAttrs = SkillUtils.GetSkillAllDesc(SkillId, Level)
      self.AttrCount = #SKillAttrs
      self.ListView_Att:ClearListItems()
      for Index, Item in ipairs(SKillAttrs) do
        local Obj = NewObject(self.SkillAttrContentClass)
        Obj.AttrName = Item.Desc
        Obj.AttrValue = Item.Value
        self.ListView_Att:AddItem(Obj)
      end
      local Avatar = GWorld:GetAvatar()
      local Key
      if Avatar and Avatar.ActionMapping then
        Key = Avatar.ActionMapping[data.SkillType]
      end
      if not Key and DataMgr.KeyboardMap[data.SkillType] then
        Key = DataMgr.KeyboardMap[data.SkillType].Key
      end
      if Key then
        self.Key:CreateCommonKey({
          KeyInfoList = {
            {Type = "Text", Text = Key}
          }
        })
        self.Key:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
      end
    end
  end
  self.Text_SkillDescribe:SetText(SkillDesc)
  self.Text_SkillName:SetText(NameAndLevel)
  self.Text_SkillName02:SetText(NameAndLevel)
  self.VerticalBox_75:SetRenderOpacity(1)
  self.WBP_VideoPlayer:SetRenderOpacity(1)
  self.Second:SetRenderOpacity(0)
  if self.AttrCount <= 0 then
    self.Btn_Switch:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.HorizontalBox_Dot:SetVisibility(UIConst.VisibilityOp.Collapsed)
  else
    self.Btn_Switch:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    self.HorizontalBox_Dot:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  end
end

function M:PlayInAnim()
  if self.SkillData and self.SkillData.SkillDemo then
    local VideoName = "Video_" .. self.SkillData.SkillDemo
    self.WBP_VideoPlayer:Stop()
    local path = "/Game/Asset/UIVideo/" .. VideoName .. "." .. VideoName
    self.WBP_VideoPlayer:SetUrlByMediaSource(LoadObject(path))
    self.WBP_VideoPlayer:SetLooping(true)
    self.WBP_VideoPlayer:Play()
    self.WBP_VideoPlayer:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  else
    self.WBP_VideoPlayer:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  self:StopAnimation(self.Out)
  self:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  self:PlayAnimation(self.In)
end

function M:PlayOutAnim()
  self.WBP_VideoPlayer:Stop()
  self:StopAnimation(self.In)
  self:PlayAnimation(self.Out)
  self:UnbindAllFromAnimationFinished(self.Out)
  self:BindToAnimationFinished(self.Out, {
    self,
    self.OnOutAnimFinished
  })
end

function M:OnOutAnimFinished()
  self:SetVisibility(UIConst.VisibilityOp.Collapsed)
end

function M:SwitchPage(Page)
  if self.Type == "Weapon" or self.AttrCount <= 0 then
    return
  end
  if Page then
    self.CurrentTab = Page
  else
    self.CurrentTab = self.CurrentTab % 2 + 1
  end
  if 1 == self.CurrentTab % 2 then
    self:PlayAnimation(self.Change, 0, 1, EUMGSequencePlayMode.Reverse)
  else
    self:PlayAnimation(self.Change)
  end
end

return M
