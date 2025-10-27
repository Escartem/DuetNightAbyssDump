require("UnLua")
local SkillUtils = require("Utils.SkillUtils")
local Component = {}

function Component:Construct()
end

function Component:PreLevel()
end

function Component:NextLevel()
end

function Component:InitContent(Params, PopupData, Owner)
  self.Super.InitContent(self, Params, PopupData, Owner)
  self.Params = Params
  if self.Owner then
    self.Owner.RightBtnCallbackObj = self
    self.Owner.RightBtnClickedCallback = self.UpgradeSkill
    self.Owner.ForbiddenRightBtnCallbackObj = self
    self.Owner.ForbiddenRightBtnClickedCallback = self.ForbiddenUpgradeBtnClicked
  end
  self:AddDispatcher(EventID.OnCharSkillLevelUp, self, self.OnCharSkillLevelUp)
  self:InitView(Params.CharUuid, Params.Skill)
end

function Component:InitView(CharUuid, Skill)
  self.CharUuid = CharUuid
  self.Skill = Skill
  self.MaxLevel = 1
  self.SkillId = self.Skill.SkillId
  self.Level = self.Skill.Level
  self.MaxLevel = SkillUtils.GetMaxLevel(self.SkillId)
  if self.Level >= self.MaxLevel then
    return
  end
  self.ComparedLevel = self.Level + 1
  self.Btn_Add:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Btn_Reduce:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Btn_Reduce_Max:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Btn_Add_Max:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self:UpdateSkillLevelUpInfo(self.Level, self.ComparedLevel)
end

function Component:UpdateSkillLevelUpInfo(Level, ComparedLevel)
  if ComparedLevel > self.MaxLevel then
    return
  end
  local ExtraLevel = self.Skill.ExtraLevel or 0
  if ExtraLevel > 0 then
    self.Text_Intensify_Level:SetText("\239\188\136" .. GText("UI_Armory_Trace") .. "+" .. ExtraLevel .. "\239\188\137")
    self.Text_Intensify_Level:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  else
    self.Text_Intensify_Level:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  self.Current_Value:SetText(Level)
  self.Preview_Value:SetText(ComparedLevel)
  if ComparedLevel >= self.MaxLevel then
    self.Preview_Value_MAX:SetText(self.MaxLevel)
    self.Switcher:SetActiveWidgetIndex(1)
  else
    self.Switcher:SetActiveWidgetIndex(0)
  end
  local Res = SkillUtils.CalcSkillCanLvup(self.SkillId, Level, ComparedLevel, self.CharUuid)
  self.ResourceUse = Res.ResourceUse
  self.CanUpgrade = Res.CanLevelUp
  self.IsResourceEnough = Res.IsResourceEnough
  self.IsBreakLevelEnough = Res.IsBreakLevelEnough
  self.BreakLevelNeed = Res.BreakLevelNeed
  self.Owner:UpdateResourceInfos(self, Res)
  self:UpdateSkillAttrView(Level + ExtraLevel, ComparedLevel + ExtraLevel)
  if self.Owner and self.Owner:GetButtonBar().Btn_Yes then
    if self.CanUpgrade then
      self.Owner:GetButtonBar().Btn_Yes:ForbidBtn(false)
    else
      self.Owner:GetButtonBar().Btn_Yes:ForbidBtn(true)
    end
  end
  if not self.CanUpgrade then
    if not self.IsBreakLevelEnough then
      self.ErrorText = string.format(GText("UI_COMMONPOP_TEXT_100029"), self.BreakLevelNeed)
    elseif not self.IsResourceEnough then
      self.ErrorText = "UI_Prop_Notenough"
    end
    self.Params.bHideDialogItem = self.IsBreakLevelEnough
    self.Params.DialogItemIndex = 1
    self.Params.Tips = self.Params.Tips or {}
    self.Params.Tips[1] = self.ErrorText
    self:BroadcastDialogEvent("UpdateDialogTipText", self.Params)
    self:BroadcastDialogEvent(DialogEvent.HideDialogItem, self.Params)
  else
    self.Params.bHideDialogItem = true
    self.Params.DialogItemIndex = 1
    self:BroadcastDialogEvent(DialogEvent.HideDialogItem, self.Params)
  end
  self.Params.bShouldPlayAnim = true
  self.Level = Level
  self.ComparedLevel = ComparedLevel
end

function Component:UpdateSkillAttrView(Level, ComparedLevel)
  local Avatar = GWorld:GetAvatar()
  local Char = Avatar.Chars[self.CharUuid]
  local CurLevelAttrTable = SkillUtils.GetSkillAllDesc(self.SkillId, Level, nil, Avatar, Char)
  local ComparedLevelAttrTable = SkillUtils.GetSkillAllDesc(self.SkillId, ComparedLevel, nil, Avatar, Char)
  self.Attrs = {}
  self.ComparedAttrs = {}
  for i, Attr in ipairs(CurLevelAttrTable) do
    if Attr.Value ~= ComparedLevelAttrTable[i].Value then
      table.insert(self.Attrs, {
        AttrName = Attr.Desc,
        AttrValue = Attr.Value,
        AttrDesc = Attr.Hint
      })
      table.insert(self.ComparedAttrs, {
        AttrValue = ComparedLevelAttrTable[i].Value,
        Delta = 1
      })
    end
  end
  self:BroadcastDialogEvent("UpdateAttrList", self.Attrs, self.ComparedAttrs)
end

function Component:UpgradeSkill()
  local Avatar = GWorld:GetAvatar()
  if nil == Avatar then
    return
  end
  if self.CanUpgrade then
    self.Owner:BlockAllUIInput(true)
    Avatar:UpSkillLevel(CommonConst.AllType.Char, self.CharUuid, self.SkillId, self.Level)
  else
    UIManager(self):ShowUITip("CommonToastMain", GText(self.ErrorText))
  end
end

function Component:ForbiddenUpgradeBtnClicked()
  UIManager(self):ShowUITip("CommonToastMain", GText(self.ErrorText))
end

function Component:OnCharSkillLevelUp(Ret, SkillId, Level, NewLevel)
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  local UIManager = GameInstance:GetGameUIManager()
  if not UIManager then
    return
  end
  if Ret == ErrorCode.RET_SUCCESS then
    self.Skill.Level = NewLevel
    
    local function Callback()
      self.Owner:BlockAllUIInput(false)
      if NewLevel >= self.MaxLevel then
        self.Owner:OnCloseBtnClicked()
        return
      else
        self.Owner:SetFocus()
        self:InitView(self.CharUuid, self.Skill)
      end
    end
    
    self.Owner:BlockAllUIInput(true)
    UIManager:LoadUI(nil, "UpgradePrompt", self.Owner:GetZOrder(), "LevelUp", "Skill", Level, NewLevel, self.Attrs, self.ComparedAttrs, self, Callback)
  else
    UIManager:ShowError(Ret, 1.5)
    self.Owner:OnCloseBtnClicked()
  end
end

return Component
