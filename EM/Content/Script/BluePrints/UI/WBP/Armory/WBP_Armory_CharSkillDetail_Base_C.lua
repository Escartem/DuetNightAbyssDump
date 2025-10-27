require("UnLua")
local SkillUtils = require("Utils.SkillUtils")
local ArmoryUtils = require("BluePrints.UI.WBP.Armory.ArmoryUtils")
local M = Class("BluePrints.UI.BP_UIState_C")
M._components = {
  "BluePrints.UI.WBP.Armory.MainComponent.Armory_PointerInputComponent"
}

function M:AddReddotListener()
  self:RemoveReddotListener()
end

function M:RemoveReddotListener()
end

function M:Construct()
  M.Super.Construct(self)
  self.CharSkillTipPath = "/Game/UI/WBP/Armory/Widget/CharSkill/WBP_Armory_CharSkillTip.WBP_Armory_CharSkillTip_C"
  self.CharSkillDescPath = "/Game/UI/WBP/Armory/Widget/CharSkill/WBP_Armory_CharSkillDesc.WBP_Armory_CharSkillDesc"
  self.Text_AtrrTitle:SetText(GText("UI_Current_Attr"))
  self.Text_Lv:SetText(GText("UI_LEVEL_NAME"))
  self.Text_Consume:SetText(GText("UI_CTL_Armory_Consumables"))
  self.Btn_LevelUp:BindEventOnClicked(self, self.OnLevelUpBtnClicked)
  self.Btn_LevelUp:BindForbidStateExecuteEvent(self, self.OnForbiddenLevelUpBtnClicked)
  self.Btn_LevelUp:SetReddotVisibility(UIConst.VisibilityOp.Collapsed)
  self.Btn_LevelUp:SetDefaultGamePadImg("Y")
  self.IsShowDesDetail = false
  self.IsShowAttrDetail = false
  self.Video_Skill:HideSkipButton(true)
  self.Tab_SkillDetail:Init({
    LeftKey = self.TabLeftKey,
    RightKey = self.TabRightKey,
    LeftGamePadKey = self.TabLeftGamePadKey,
    RightGamePadKey = self.TabRightGamePadKey,
    Tabs = {
      {
        Text = GText("UI_Armory_Introduce"),
        Idx = 1
      },
      {
        Text = GText("UI_Armory_Numerical"),
        Idx = 2
      }
    }
  })
  self.Preview_Skill:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Bg_Preview:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Btn_Check:BindEventOnClicked(self, self.OnBtnChekClicked)
  self.Image_Click.OnMouseButtonDownEvent:Unbind()
  self.Image_Click.OnMouseButtonDownEvent:Bind(self, self.On_Image_Click_MouseButtonDown)
  self:AddDispatcher(EventID.OnCharSkillLevelUp, self, self.OnCharSkillLevelUp)
  self:AddDispatcher(EventID.OnCharSkillTreeNodeActivated, self, self.OnCharSkillTreeNodeActivated)
  self.WidgetSwitcher_Page:SetActiveWidgetIndex(0)
end

function M:On_Image_Click_MouseButtonDown(MyGeometry, MouseEvent)
  if self.IsHyperLinkTipOpened then
    return UIUtils.Unhandled
  end
  return self:OnPointerDown(MyGeometry, MouseEvent)
end

function M:OnMouseButtonUp(MyGeometry, MouseEvent)
  return self:OnPointerUp(MyGeometry, MouseEvent)
end

function M:OnMouseMove(MyGeometry, MouseEvent)
  return UIUtils.Unhandled
end

function M:OnTouchMoved(MyGeometry, InTouchEvent)
  return UIUtils.Unhandled
end

function M:OnMouseCaptureLost()
  self:OnPointerCaptureLost()
end

function M:OnBackgroundClicked()
  self:OnCloseBtnClicked()
end

function M:OnCloseBtnClicked()
  if self.IsHyperLinkTipOpened then
  elseif self.IsNexLevelInfoShowed then
    self:ShowNextLevelInfo(not self.IsNexLevelInfoShowed)
  else
    AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_return", nil, nil)
    self:PlayOutAnim()
  end
end

function M:OnLevelUpBtnClicked()
  if not self.CurrentNodeInfo or not self.CanUpgrade then
    return
  end
  local Avatar = GWorld:GetAvatar()
  if nil == Avatar then
    return
  end
  if 1 == self.CurrentNodeInfo.NodeIdx then
    self:BlockAllUIInput(true)
    Avatar:UpSkillLevel(CommonConst.AllType.Char, self.Target.Uuid, self.CurrentNodeInfo.Skill.SkillId, self.CurrentNodeInfo.Skill.Level)
  else
    self:BlockAllUIInput(true)
    Avatar:ActivateCharSkillTreeNode(self.Target.Uuid, self.CurrentNodeInfo.BranchIdx, self.CurrentNodeInfo.NodeIdx)
  end
end

function M:OnCharSkillLevelUp(Ret, SkillId, Level, NewLevel)
  self:BlockAllUIInput(false)
  if not ErrorCode:Check(Ret) then
    return
  end
  local BranchInfo, SkillNodeInfo = self:FindTreeNodeInfo(self.SkillTreeInfo, SkillId)
  
  local function Callback()
    if SkillNodeInfo == self.CurrentNodeInfo then
      self:UpdateSkillNodeDetails(SkillNodeInfo)
    end
    if BranchInfo.UI then
      BranchInfo.UI:UpdateNodeSate()
    end
    if SkillNodeInfo.UI then
      SkillNodeInfo.UI:OnActice(NewLevel)
    end
    self:SetFocus()
  end
  
  local ExLevel = SkillNodeInfo.Skill.ExtraLevel
  local ExText
  if ExLevel and ExLevel > 0 then
    ExText = GText("(") .. GText("UI_Armory_Trace") .. " +" .. ExLevel .. GText(")")
  end
  UIManager(self):LoadUI(nil, "SkillLevelUp", self:GetZOrder(), {
    Level = Level,
    NewLevel = NewLevel,
    ExText = ExText,
    Attrs = self.Attrs,
    ComparedAttrs = self.ComparedAttrs,
    SkillId = SkillNodeInfo.Skill.SkillId,
    OnClosedCallbackObj = self,
    OnClosedCallbackFunc = Callback
  })
  SkillNodeInfo.Skill.Level = NewLevel
  if SkillNodeInfo == self.CurrentNodeInfo then
    self:UpdateLevelInfos(SkillNodeInfo.Skill)
    self:UpdateSkillNodeDetails(self.CurrentNodeInfo)
  end
end

function M:OnCharSkillTreeNodeActivated(Ret, CharUuid, TreeIndex, NodeIndex)
  self:BlockAllUIInput(false)
  if not ErrorCode:Check(Ret) then
    return
  end
  local BranchInfo = self.SkillTreeInfo[TreeIndex]
  local NodeInfo = BranchInfo and BranchInfo[NodeIndex]
  if not NodeInfo then
    return
  end
  AudioManager(self):PlayUISound(nil, "event:/ui/armory/skill_unlock", nil, nil)
  if BranchInfo.UI then
    BranchInfo.UI:UpdateNodeSate()
  end
  if NodeInfo.UI then
    NodeInfo.UI:OnActice()
  end
  if NodeInfo == self.CurrentNodeInfo then
    if self.CurrentNodeInfo.Skill then
      self:UpdateSkillNodeDetails(self.CurrentNodeInfo)
    else
      self:UpdateAttrNodeDetails(self.CurrentNodeInfo)
    end
  end
end

function M:OnForbiddenLevelUpBtnClicked()
end

function M:InitUIInfo(Name, IsInUIMode, EventList, Params)
  M.Super.InitUIInfo(self, Name, IsInUIMode, EventList, Params)
  local CharUuid = Params.CharUuid
  local Target = Params.Target
  local SelectedSkillId = Params.SelectedSkillId
  local SelectedAttrId = Params.SelectedAttrId
  self.OutAnimStyle = Params.OutAnimStyle or 1
  self.OnClosedObj = Params.OnClosedObj
  self.OnClosedCallback = Params.OnClosedCallback
  self.OnDestructCallback = Params.OnDestructCallback
  self.OnDestructObj = Params.OnDestructObj
  self.IsPreviewMode = Params.IsPreviewMode
  self.PreviewCharInfo = Params.PreviewCharInfo
  if self.PreviewCharInfo and not ArmoryUtils:GetDummyAvatar() then
    self.bDestroyDummyAvatarWhenClose = true
    ArmoryUtils:CreateDummyAvatarByDumpInfo({
      CharInfos = {
        self.PreviewCharInfo
      }
    })
    ArmoryUtils:SwitchPreviewTargetState(ArmoryUtils.PreviewTargetStates.Custom)
  end
  local Avatar = ArmoryUtils:GetAvatar()
  if not Avatar then
    return
  end
  CharUuid = Target and Target.Uuid or CharUuid or Avatar.CurrentChar
  CharUuid = CharUuid or Avatar.Chars and next(Avatar.Chars)
  local ArmoryMain = UIManager(self):GetArmoryUIObj()
  if ArmoryMain and ArmoryMain.ActorController then
    self.ActorController = ArmoryMain.ActorController
    self.ActorController:SetMontageAndCamera(CommonConst.ArmoryType.Char, nil, CommonConst.ArmoryType.Skill, "Detail")
  end
  if self.ActorController then
    self.Bg_Blur:SetVisibility(UIConst.VisibilityOp.Collapsed)
  else
    self.Bg_Blur:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  end
  self.Target = Params.Target or Avatar.Chars[CharUuid]
  self:UpdateTargetInfo(self.Target)
  if not SelectedSkillId and not SelectedAttrId then
    SelectedSkillId, SelectedAttrId = self:FindFirtSkillIdOrAttrId(self.Target)
  end
  if not SelectedSkillId and not SelectedAttrId then
    self:Close()
    return
  end
  local _Params = {
    Parent = self,
    Target = self.Target,
    IsPreviewMode = self.IsPreviewMode,
    OnTreeNodeClicked = self.OnTreeNodeClicked,
    OnTreeNodeStateChanged = self.OnTreeNodeStateChanged
  }
  self:ModifyCharSkillInitParams(_Params)
  self.CharSkill:Init(_Params)
  self.SkillTreeInfo = self.CharSkill:GetSkillTreeInfo()
  local FirtBranchInfo, FirtNodeInfo = self:FindTreeNodeInfo(self.SkillTreeInfo, SelectedSkillId, SelectedAttrId)
  if not FirtNodeInfo then
    self:Close()
    return
  end
  FirtNodeInfo.IsSelected = true
  self.Tab_SkillDetail:BindEventOnTabSelected(nil, nil)
  self.Tab_SkillDetail:SelectTab(1)
  self.Tab_SkillDetail:BindEventOnTabSelected(self, self.OnTabSelected)
  self:OnTreeNodeClicked(FirtBranchInfo, FirtNodeInfo)
  if not self.IsPreviewMode then
    self:AddReddotListener()
  end
  self:PlayInAnim()
  self:SetFocus()
end

function M:ModifyCharSkillInitParams(Params)
end

function M:UpdateTargetInfo(Char)
  local CharId = Char.CharId
  local Data = DataMgr.Char[CharId]
  self:SetStars(Data.CharRarity or 0)
  local AttrName = DataMgr.BattleChar[CharId].Attribute
  self.Text_RoleName:SetText(GText(Char.CharName))
  local IconName = "Armory_" .. AttrName
  local AttributeIcon = LoadObject("/Game/UI/Texture/Dynamic/Atlas/Armory/T_" .. IconName .. ".T_" .. IconName)
  self.Image_Attribute:SetBrushResourceObject(AttributeIcon or LoadObject("/Game/UI/Texture/Dynamic/Atlas/Armory/T_Armory_Default.T_Armory_Default"))
end

function M:SetStars(StarNum)
  local StarWidgets = self.Star:GetAllChildren()
  local Length = StarWidgets:Length()
  for i = 1, Length do
    local Widget = StarWidgets[i]
    if i <= StarNum then
      Widget:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    else
      Widget:SetVisibility(UIConst.VisibilityOp.Collapsed)
    end
  end
end

function M:FindFirtSkillIdOrAttrId(Char)
  local SkillId, AttrId
  local SkillTreeData = DataMgr.SkillTree[Char.CharId]
  if SkillTreeData and SkillTreeData.Skill1 then
    for Key, Value in ipairs(SkillTreeData.Skill1) do
      SkillId = SkillId or Value.Skill
      AttrId = AttrId or Value.Attr
    end
  end
  return SkillId, AttrId
end

function M:FindTreeNodeInfo(SkillTreeInfo, SkillId, AttrId)
  for BranchIdx, BranchInfo in ipairs(SkillTreeInfo) do
    for NodeIdx, NodeInfo in ipairs(BranchInfo) do
      if NodeInfo.Skill then
        if NodeInfo.Skill.SkillId == SkillId then
          return BranchInfo, NodeInfo
        end
      elseif NodeInfo.AttrId and NodeInfo.AttrId == AttrId then
        return BranchInfo, NodeInfo
      end
    end
  end
end

function M:OnTreeNodeClicked(BranchInfo, NodeInfo)
  if self.CurrentNodeInfo and self.CurrentNodeInfo.UI then
    self.CurrentNodeInfo.UI:SetIsSelected(false)
  end
  if NodeInfo.UI then
    NodeInfo.UI:SetIsSelected(true)
  end
  self.CurrentBranchInfo = BranchInfo
  self.CurrentNodeInfo = NodeInfo
  if NodeInfo.Skill then
    self:UpdateSkillNodeDetails(NodeInfo)
  elseif NodeInfo.AttrId then
    self:UpdateAttrNodeDetails(NodeInfo)
  end
end

function M:UpdateSkillNodeDetails(NodeInfo)
  self.ScrollBox_Detail:ScrollToStart()
  self.Panel_Key:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  self.WidgetSwitcher_Page:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  local CharSkill = NodeInfo.Skill
  local Data = DataMgr.Skill[CharSkill.SkillId]
  local SkillData = Data and Data[1] and Data[1][0]
  if not SkillData then
    return
  end
  if 1 == NodeInfo.NodeIdx then
    self.Panel_Level:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    self:UpdateLevelInfos(CharSkill)
  else
    self.ShouldShowBtnCheck = false
    self.Panel_Level:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.Text_SkillName:SetText(GText(SkillData.SkillName))
    self:UpdateSubNodeCommon(NodeInfo)
  end
  self:SetDetailsIcon(UIUtils.LoadSkillIconById(CharSkill.SkillId))
  self:UpdateAttrList(CharSkill, SkillData)
  self:InitSkillKeyInfo(SkillData)
  self:InitSkillDemo(SkillData)
  self:InitSkillDesc(SkillData)
  if self.ScrollBox_Attr:GetChildrenCount() <= 0 then
    self.Panel_Tab:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.WidgetSwitcher_Page:SetActiveWidgetIndex(0)
  else
    local PageIdx = self.Tab_SkillDetail:GetCurrentTabIndex() or 1
    self.WidgetSwitcher_Page:SetActiveWidgetIndex(PageIdx - 1)
    self.Panel_Tab:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  end
  self:UpdateBtnCheckVisibility()
end

function M:UpdateSubNodeCommon(NodeInfo)
  if self.IsPreviewMode then
    self:SetSkillUpgradeWidgetsVisibility(UIConst.VisibilityOp.Collapsed)
    return
  else
    self:SetSkillUpgradeWidgetsVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  end
  self.IsLocked = NodeInfo.IsLocked
  self.CanUpgrade = NodeInfo.CanUnlock
  if self.IsLocked then
    self.WidgetSwitcher_Btn:SetActiveWidgetIndex(1)
    self.Hint_Skill:SetStyle(2)
    self.Hint_Skill:SetText(NodeInfo.LockReasonText)
  elseif NodeInfo.IsActivated then
    self.HB_Item:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.HB_Consume:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.WidgetSwitcher_Btn:SetActiveWidgetIndex(1)
    self.Hint_Skill:SetStyle(1)
    self.Hint_Skill:SetText(GText("UI_Activated"))
  else
    self.WidgetSwitcher_Btn:SetActiveWidgetIndex(0)
    if NodeInfo.IsResourceNeed then
      self.Btn_LevelUp:ForbidBtn(true)
      self.Btn_LevelUp:SetText(GText("UI_Prop_Notenough"))
    else
      self.Btn_LevelUp:ForbidBtn(false)
      self.Btn_LevelUp:SetText(GText("UI_UNLOCK"))
    end
  end
  self:UpdateResourceList(NodeInfo.ResourceUse)
end

function M:InitSkillDesc(SkillData)
  self.Text_SkillName:SetText(GText(SkillData.SkillName))
  if SkillData.SkillType == "Passive" then
    self.Text_SkillType:SetText(GText("UI_Armory_Passive"))
  else
    self.Text_SkillType:SetText(GText(SkillData.SkillBtnDesc))
  end
  local SkillDesc = GText(SkillData.SkillDesc) or ""
  local Terms = {}
  for CombatProperTermId, value in pairs(DataMgr.CombatProperTerm) do
    table.insert(Terms, CombatProperTermId)
  end
  self.DisplayedHyperLinkTers = {}
  local SkillDescText = self:CreateDescWidthHyperLink(SkillDesc, Terms)
  local SkillDescInfos = {
    {
      Title = GText(SkillData.SkillName) or "",
      Desc = SkillDescText,
      Owner = self,
      OnHyperLinkClicked = self.OnRichTextHyperLinkClicked
    }
  }
  local ExplainList = SkillData.ExplanationId or {}
  for _, Item in ipairs(ExplainList) do
    local CombatTermData = DataMgr.CombatTerm[Item]
    if CombatTermData then
      local CombatTerm = CombatTermData.CombatTerm
      local CombatExplanation = CombatTermData.CombatTermExplaination
      table.insert(SkillDescInfos, {
        Title = GText(CombatTerm),
        Desc = GText(CombatExplanation),
        Owner = self,
        OnHyperLinkClicked = self.OnRichTextHyperLinkClicked
      })
    else
      DebugPrint("Error: \230\137\190\228\184\141\229\136\176CombatTerm:" .. Item)
    end
  end
  self:UpdateDesc(SkillDescInfos)
  self.SkillDescInfos = SkillDescInfos
end

function M:UpdateDesc(DescInfos)
  local DescWidgetIdx = 1
  for index, DescInfo in ipairs(DescInfos) do
    local DescWidget = self.ScrollBox_Detail:GetChildAt(DescWidgetIdx)
    if not IsValid(DescWidget) then
      DescWidget = Utils.UIManager(self):CreateWidget(self.CharSkillDescPath, false)
      self.ScrollBox_Detail:AddChild(DescWidget)
    end
    DescWidget:Init(DescInfo)
    DescWidgetIdx = DescWidgetIdx + 1
  end
  local TotalChildCount = self.ScrollBox_Detail:GetChildrenCount()
  for i = DescWidgetIdx + 1, TotalChildCount do
    self.ScrollBox_Detail:GetChildAt(self.ScrollBox_Detail:GetChildrenCount() - 1):RemoveFromParent()
  end
end

function M:InitSkillKeyInfo(SkillData)
  local IsMobile = CommonUtils.GetDeviceTypeByPlatformName(self) == "Mobile"
  local Key = CommonUtils:GetActionMappingKeyName(SkillData.SkillType)
  if not IsMobile and Key and "" ~= Key then
    self.Text_SkillType:SetVisibility(UIConst.VisibilityOp.Collapsed)
    local KeyInfo = {
      Desc = GText(SkillData.SkillBtnDesc)
    }
    if self.IsGamepadInput then
      local IconList = UIUtils.GetIconListByActionName(SkillData.SkillType)
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
    self.Skill_Key:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  else
    self.Text_SkillType:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    self.Skill_Key:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

function M:InitSkillDemo(SkillData)
  if SkillData.SkillDemo then
    local VideoName = "Video_" .. SkillData.SkillDemo
    self.Video_Skill:Stop()
    local path = "/Game/Asset/UIVideo/" .. VideoName .. "." .. VideoName
    self.Video_Skill:SetUrlByMediaSource(LoadObject(path))
    self.Video_Skill:SetLooping(true)
    self.Video_Skill:Play()
    self.Panel_Video:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  else
    self.Video_Skill:Stop()
    self.Panel_Video:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

function M:CreateDescWidthHyperLink(SkillDesc, Terms)
  local results = {SkillDesc}
  self:AddHyperLink(results, Terms, 1)
  local DescText = ""
  for index, value in ipairs(results) do
    DescText = DescText .. value
  end
  return DescText
end

function M:AddHyperLink(StrArray, Terms, TermIdx)
  if TermIdx > #Terms then
    return
  end
  local Term = GText(Terms[TermIdx])
  local LStr, RStr, bSuccess = UKismetStringLibrary.Split(StrArray[#StrArray], Term)
  if not bSuccess then
    self:AddHyperLink(StrArray, Terms, TermIdx + 1)
  else
    StrArray[#StrArray] = LStr
    self:AddHyperLink(StrArray, Terms, TermIdx + 1)
    table.insert(StrArray, "<a href=\"" .. Terms[TermIdx] .. "\"" .. " color=\"#FFFFFF\">" .. Term .. "</>")
    table.insert(StrArray, RStr)
    table.insert(self.DisplayedHyperLinkTers, Terms[TermIdx])
    self:AddHyperLink(StrArray, Terms, TermIdx)
  end
end

function M:UpdateAttrList(CharSkill, SkillData)
  local Avatar = ArmoryUtils:GetAvatar()
  local Char = Avatar.Chars[self.Target.Uuid] or self.Target
  local Level = CharSkill.Level + (CharSkill.ExtraLevel or 0)
  self.Attrs = SkillUtils.GetSkillAllDesc(CharSkill.SkillId, Level, nil, Avatar, Char)
  self.ComparedAttrs = SkillUtils.GetSkillAllDesc(CharSkill.SkillId, Level + 1, nil, Avatar, Char)
  local Obj
  local ComparedContents = {}
  local UIManager = UIManager(self)
  local ContentArray = {}
  for Index, Item in ipairs(self.Attrs) do
    Obj = {}
    Obj.Name = Item.Desc
    Obj.Value = Item.Value
    Obj.Desc = Item.Hint
    Obj.Style = 0
    Obj.Index = Index
    Obj.Owner = self
    Obj.OnBtnClicked = self.OnSkillAttrBtnCLicked
    self:OnSkillAttrContentCreated(Obj)
    table.insert(ContentArray, Obj)
    local ComparedAttr = self.ComparedAttrs[Index]
    ComparedContents[Index] = {
      Name = ComparedAttr.Desc,
      Value = ComparedAttr.Value,
      Desc = Item.Hint,
      Index = Index,
      Style = ComparedAttr.Value == Item.Value and 0 or 1,
      bHideBtn = true,
      bHideArrow = true
    }
  end
  local ContentGroups = {}
  local ContentInGroup = {}
  if SkillData and SkillData.SkillDescGroups then
    for GroupIdx, Group in pairs(SkillData.SkillDescGroups) do
      for GroupName, DescIdxs in pairs(Group) do
        if DescIdxs and #DescIdxs > 0 then
          local _Group = {
            Name = GText(GroupName),
            DescIdxs = {}
          }
          for _, DescIdx in ipairs(DescIdxs) do
            table.insert(_Group.DescIdxs, DescIdx)
            ContentInGroup[DescIdx] = true
          end
          table.insert(ContentGroups, {key = GroupIdx, value = _Group})
          break
        end
      end
    end
    table.sort(ContentGroups, function(Group1, Group2)
      return Group1.key < Group2.key
    end)
    local NewContentGroups = ContentGroups
    ContentGroups = {}
    for _, value in ipairs(NewContentGroups) do
      table.insert(ContentGroups, value.value)
    end
  end
  self.ScrollBox_Attr:ClearChildren()
  for index, Obj in ipairs(ContentArray) do
    if not ContentInGroup[index] then
      local Widget = UIManager:_CreateWidgetNew("CharSkillAttrItem")
      Widget:OnListItemObjectSet(Obj)
      self.ScrollBox_Attr:AddChild(Widget)
    end
  end
  for _, Group in ipairs(ContentGroups) do
    local TitleWidget = UIManager:_CreateWidgetNew("CharSkillAtrrTitle")
    TitleWidget:SetText(Group.Name)
    self.ScrollBox_Attr:AddChild(TitleWidget)
    for _, DescIdx in ipairs(Group.DescIdxs) do
      if ContentArray[DescIdx] then
        local Widget = UIManager:_CreateWidgetNew("CharSkillAttrItem")
        Widget:OnListItemObjectSet(ContentArray[DescIdx])
        self.ScrollBox_Attr:AddChild(Widget)
      end
    end
  end
  self.ComparedSkillAttrContents = ComparedContents
  self.Preview_Skill:Init({
    Contents = ComparedContents,
    ContentInGroup = ContentInGroup,
    ContentGroups = ContentGroups
  })
end

function M:OnSkillAttrContentCreated(Content)
end

function M:OnSkillAttrBtnCLicked(Content)
  Content.IsShowDesc = not Content.IsShowDesc
  if Content.UI then
    Content.UI:ShowDesc(Content.IsShowDesc, true)
  end
  local ComparedContent = self.ComparedSkillAttrContents[Content.Index]
  if not ComparedContent then
    return
  end
  ComparedContent.IsShowDesc = Content.IsShowDesc
  if ComparedContent.UI then
    ComparedContent.UI:ShowDesc(ComparedContent.IsShowDesc, true)
  end
end

function M:OnBtnChekClicked()
  self:ShowNextLevelInfo(not self.IsNexLevelInfoShowed)
end

function M:ShowNextLevelInfo(bShow)
  self.IsNexLevelInfoShowed = bShow
  if bShow then
    self.CharSkill:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
    self.WidgetSwitcher_State:SetActiveWidgetIndex(1)
    self.Preview_Skill:PlayInAnim()
    self.Bg_Preview:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
    self:PlayAnimation(self.Preview_In)
  else
    self.CharSkill:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    self.WidgetSwitcher_State:SetActiveWidgetIndex(0)
    self.Preview_Skill:PlayOutAnim()
    self:PlayAnimation(self.Preview_Out)
  end
end

function M:UpdateLevelInfos(Skill)
  self.ShouldShowBtnCheck = false
  self.IsLocked = Skill:IsLocked()
  self.Text_Level:SetText(Skill.Level)
  if Skill.ExtraLevel and Skill.ExtraLevel > 0 then
    self.Text_Intensify_Level:SetText(GText("(") .. GText("UI_Armory_Trace") .. " +" .. Skill.ExtraLevel .. GText(")"))
    self.Text_Intensify_Level:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  else
    self.Text_Intensify_Level:SetText("")
    self.Text_Intensify_Level:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  self.Text_Lv:SetText(GText("UI_LEVEL_NAME"))
  self.Text_Level:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  local MaxLevel = Skill:GetMaxLevel()
  self.Text_Level_Max:SetText(MaxLevel)
  if self.IsPreviewMode then
    self:SetSkillUpgradeWidgetsVisibility(UIConst.VisibilityOp.Collapsed)
    return
  end
  self:SetSkillUpgradeWidgetsVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  self.CanUpgrade = false
  if MaxLevel and MaxLevel > Skill.Level then
    self.ShouldShowBtnCheck = true
    local Res = SkillUtils.CalcSkillCanLvup(Skill.SkillId, Skill.Level, Skill.Level + 1, self.Target.Uuid)
    self.CanUpgrade = Res.CanLevelUp
    self:UpdateResourceList(Res.ResourceUse)
    if Res.CanLevelUp then
      self.WidgetSwitcher_Btn:SetActiveWidgetIndex(0)
      self.Btn_LevelUp:SetText(GText("UI_FUNC_LEVELUP"))
      self.Btn_LevelUp:ForbidBtn(false)
    elseif not Res.IsBreakLevelEnough then
      self.WidgetSwitcher_Btn:SetActiveWidgetIndex(1)
      self.Hint_Skill:SetStyle(2)
      self.Hint_Skill:SetText(string.format(GText("UI_COMMONPOP_TEXT_100029"), Res.BreakLevelNeed))
    elseif not Res.IsResourceEnough then
      self.WidgetSwitcher_Btn:SetActiveWidgetIndex(0)
      self.Btn_LevelUp:ForbidBtn(true)
      self.Btn_LevelUp:SetText(GText("UI_Prop_Notenough"))
    end
  else
    self.HB_Consume:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.HB_Item:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.WidgetSwitcher_Btn:SetActiveWidgetIndex(1)
    self.Hint_Skill:SetStyle(1)
    self.Hint_Skill:SetText(GText("Max_Level_Achieved"))
  end
end

function M:SetSkillUpgradeWidgetsVisibility(VisibilityOp)
  self.HB_Consume:SetVisibility(VisibilityOp)
  self.HB_Item:SetVisibility(VisibilityOp)
  self.Panel_LevelUp:SetVisibility(VisibilityOp)
end

function M:UpdateBtnCheckVisibility()
  if self.ShouldShowBtnCheck and 1 == self.WidgetSwitcher_Page:GetActiveWidgetIndex() then
    self.SizeBox_Check:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  else
    self.SizeBox_Check:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

function M:OnTabSelected(Tab)
  self:PlayAnimation(self.Tab_Switch)
  if 1 == Tab.Idx then
    self:OnSkillTab1Clicked()
  else
    self:OnSkillTab2Clicked()
  end
end

function M:OnSkillTab1Clicked()
  self.WidgetSwitcher_Page:SetActiveWidgetIndex(0)
  self:UpdateBtnCheckVisibility()
  if self.IsNexLevelInfoShowed then
    self:ShowNextLevelInfo(not self.self.IsNexLevelInfoShowed)
  end
end

function M:OnSkillTab2Clicked()
  self.WidgetSwitcher_Page:SetActiveWidgetIndex(1)
  self:UpdateBtnCheckVisibility()
end

function M:OnRichTextHyperLinkClicked(Term)
  local TermData = DataMgr.CombatProperTerm[Term]
  if not TermData then
    return
  end
  self.HyperLinkTipWidget = UIManager(self):CreateWidget(self.CharSkillTipPath, true, self:GetZOrder())
  if not self.HyperLinkTipWidget then
    return
  end
  self.HyperLinkTipWidget:Init({
    Title = GText(Term),
    Desc = GText(TermData.CombatProperTermExplaination),
    Owner = self,
    OnClosed = self.OnRichTextHyperLinkTipClosed
  })
  local Success, X, Y = ULowEntryExtendedStandardLibrary.GetMousePosition()
  self.HyperLinkTipWidget:SetPositionInViewport(FVector2D(X, Y), true)
  self.IsHyperLinkTipOpened = Success
end

function M:OnRichTextHyperLinkTipClosed()
  self.IsHyperLinkTipOpened = false
end

function M:UpdateAttrNodeDetails(NodeInfo)
  self.Panel_Tab:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Panel_Level:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Panel_Key:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.WidgetSwitcher_Page:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  self.SizeBox_Check:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Panel_Video:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.WidgetSwitcher_Page:SetActiveWidgetIndex(0)
  self.ScrollBox_Attr:ClearChildren()
  local Data = DataMgr.CharAddonAttr[NodeInfo.AttrId]
  if not Data or not Data.AddAttrs then
    return
  end
  self:SetDetailsIcon(LoadObject(NodeInfo.IconPath))
  local AttrConfig = DataMgr.AttrConfig[Data.AddAttrs.AttrName]
  local IsRate, Value
  if Data.AddAttrs.Value then
    IsRate = false
    Value = Data.AddAttrs.Value
  else
    if Data.AddAttrs.Rate then
      IsRate = true
      Value = Data.AddAttrs.Rate
    else
    end
  end
  Value = tonumber(Value)
  local str = CommonUtils.AttrValueToString(AttrConfig, Value, IsRate)
  local Name = GText(AttrConfig.Name) or ""
  self:UpdateDesc({
    {
      Title = "",
      Desc = Name .. " +" .. str,
      Owner = self,
      OnHyperLinkClicked = self.OnRichTextHyperLinkClicked
    }
  })
  self.IsLocked = NodeInfo.IsLocked
  self.Text_SkillName:SetText(Name .. GText("UI_SkillTree_Attr_Add"))
  self:UpdateSubNodeCommon(NodeInfo)
end

function M:SetDetailsIcon(IconObj)
  local DMI = self.Icon_CharSkill:GetDynamicMaterial()
  if DMI then
    DMI:SetTextureParameterValue("IconTex", IconObj)
  end
end

function M:OnTreeNodeStateChanged(BranchInfo, NodeInfo)
  if NodeInfo == self.CurrentNodeInfo then
    if 1 == NodeInfo.NodeIdx then
      self:UpdateLevelInfos(NodeInfo.Skill)
    else
      self:UpdateSubNodeCommon(NodeInfo)
    end
  end
end

function M:UpdateResourceList(ResourcesUse)
  local Avatar = GWorld:GetAvatar()
  local Content, ResourceId
  for Index, Resource in ipairs(ResourcesUse) do
    if Resource.Count > 0 then
      ResourceId = Resource.ResourceId
      local ResourceData = DataMgr.Resource[ResourceId]
      local ServerResource = Avatar.Resources[ResourceId] or {Count = 0}
      Content = {
        Owner = self,
        Id = ResourceId,
        Icon = ResourceData.Icon,
        Count = ServerResource.Count,
        NeedCount = Resource.Count,
        ItemType = "Resource",
        Rarity = ResourceData.Rarity,
        IsShowDetails = true
      }
      self:OnResourceContentCreated(Content)
      local Widget = self.HB_Item:GetChildAt(Index - 1)
      if not Widget then
        Widget = self:CreateWidgetNew("ComItemUniversalM")
        self.HB_Item:AddChild(Widget)
      end
      Widget:Init(Content)
    end
  end
  local ChildrenCount = self.HB_Item:GetChildrenCount()
  for i = ChildrenCount - 1, #ResourcesUse, -1 do
    self.HB_Item:RemoveChildAt(i)
  end
end

function M:OnResourceContentCreated(Content)
end

function M:PlayInAnim()
  self:StopAnimation(self.Out)
  self:PlayAnimation(self.In)
  self:StopAnimation(self.Detail_Out)
  self:UnbindAllFromAnimationFinished(self.Detail_In)
  self:BindToAnimationFinished(self.Detail_In, {
    self,
    self.OnInAnimationFinished
  })
  self:BlockAllUIInput(true)
  self:PlayAnimation(self.Detail_In)
  self:SetVisibility(UIConst.VisibilityOp.Visible)
end

function M:OnInAnimationFinished()
  self:BlockAllUIInput(false)
end

function M:PlayOutAnim()
  self:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  self:StopAnimation(self.In)
  self:StopAnimation(self.Detail_In)
  if 1 == self.OutAnimStyle then
    self:UnbindAllFromAnimationFinished(self.Out)
    self:BindToAnimationFinished(self.Out, {
      self,
      self.OnOutAnimationFinished
    })
    self:PlayAnimation(self.Out)
  elseif 2 == self.OutAnimStyle then
    self:UnbindAllFromAnimationFinished(self.Detail_Out)
    self:BindToAnimationFinished(self.Detail_Out, {
      self,
      self.OnOutAnimationFinished
    })
    self:PlayAnimation(self.Detail_Out)
  end
  if self.OnClosedCallback then
    self.OnClosedCallback(self.OnClosedObj)
  end
end

function M:OnOutAnimationFinished()
  self:Close()
end

function M:Destruct()
  self:UnbindAllFromAnimationFinished(self.Out)
  self:RemoveReddotListener()
  if self.bDestroyDummyAvatarWhenClose then
    ArmoryUtils:DestroyDummyAvatar()
  end
  if self.OnDestructCallback then
    self.OnDestructCallback(self.OnDestructObj, self.CurrentNodeInfo)
  end
  M.Super.Destruct(self)
end

AssembleComponents(M)
return M
