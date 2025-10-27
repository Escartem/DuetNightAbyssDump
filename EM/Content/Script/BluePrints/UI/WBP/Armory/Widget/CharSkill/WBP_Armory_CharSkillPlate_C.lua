require("UnLua")
local SkillUtils = require("Utils.SkillUtils")
local ArmoryUtils = require("BluePrints.UI.WBP.Armory.ArmoryUtils")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:Construct()
  self.TreeNodeWidget = {
    self.Skill_Main,
    self.Skill_Sub01,
    self.Skill_Sub02
  }
  self.MaxNodeNumber = #self.TreeNodeWidget
  EventManager:AddEvent(EventID.OnResourcesChanged, self, self.OnResourcesChanged)
end

function M:Destruct()
  EventManager:RemoveEvent(EventID.OnResourcesChanged, self)
end

function M:GetChar(BranchInfo)
  return ArmoryUtils:GetCharByUuid(BranchInfo.Target.Uuid) or BranchInfo.Target
end

function M:Init(SkillTreeBranchInfo, IsPreviewMode)
  self.IsPreviewMode = IsPreviewMode
  self.SkillTreeBranchInfo = SkillTreeBranchInfo
  SkillTreeBranchInfo.UI = self
  local SkillItemWidget, SkillTreeNodeInfo
  for NodeIdx = 1, self.MaxNodeNumber do
    SkillTreeNodeInfo = SkillTreeBranchInfo[NodeIdx] or {}
    SkillItemWidget = self.TreeNodeWidget[NodeIdx]
    local CharSkill = SkillTreeNodeInfo.Skill
    local AttrId = SkillTreeNodeInfo.AttrId
    local Char = self:GetChar(SkillTreeBranchInfo)
    local BranchIdx = SkillTreeBranchInfo.BranchIdx
    SkillTreeNodeInfo.IsActivated = Char:CheckSkillTreeNodeIsActive(BranchIdx, NodeIdx)
    if CharSkill then
      if 1 == NodeIdx then
        SkillTreeNodeInfo.IsActivated = true
        SkillTreeNodeInfo.Level = CharSkill.Level
        SkillTreeNodeInfo.MaxLevel = SkillUtils.GetMaxLevel(CharSkill.SkillId)
      end
      local SkillData = DataMgr.Skill[CharSkill.SkillId]
      if SkillData and SkillData[1] and SkillData[1][0] then
        local Data = SkillData[1][0]
        local IconName = Data.SkillBtnIcon
        if IconName then
          SkillTreeNodeInfo.IconPath = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_" .. IconName .. ".T_" .. IconName
        end
        if SkillTreeNodeInfo.IsActivated then
          SkillTreeNodeInfo.IsLocked = false
        else
          SkillTreeNodeInfo.IsLocked = CharSkill:IsLocked()
        end
        if 1 == NodeIdx then
          if Data.SkillType == "Passive" then
            self.Text_SkillType:SetText(GText("UI_Armory_Passive"))
            self.Text_World:SetText(EnText("UI_Armory_Passive"))
          else
            self.Text_SkillType:SetText(GText(Data.SkillBtnDesc))
            self.Text_World:SetText(EnText(Data.SkillBtnDesc))
          end
        end
        if IsPreviewMode then
          SkillTreeNodeInfo.bCanUpgrad = false
        elseif 1 == NodeIdx then
          local Ret = SkillUtils.CalcSkillCanLvup(CharSkill.SkillId, CharSkill.Level, CharSkill.Level + 1, SkillTreeBranchInfo.Target.Uuid)
          SkillTreeNodeInfo.bCanUpgrad = Ret.CanLevelUp
        else
          self:UpdateSubNodeWidget(SkillTreeBranchInfo, SkillTreeNodeInfo)
        end
      end
    elseif AttrId then
      self:UpdateSubNodeWidget(SkillTreeBranchInfo, SkillTreeNodeInfo)
    end
    SkillTreeNodeInfo.IconPath = SkillTreeNodeInfo.IconPath or "/Game/UI/Texture/Dynamic/Atlas/Skill/T_Skill_Heitao_Skill01.T_Skill_Heitao_Skill01"
    SkillTreeNodeInfo.OnClickedFunc = self.OnNodeClicked
    SkillTreeNodeInfo.OnClickedObj = self
    SkillItemWidget:Init(SkillTreeNodeInfo)
  end
end

function M:UpdateSubNodeWidget(SkillTreeBranchInfo, SkillTreeNodeInfo)
  self:UpdateSubNodeInfo(SkillTreeBranchInfo, SkillTreeNodeInfo)
  if SkillTreeNodeInfo.IsLocked then
    self["WS_Line_" .. SkillTreeNodeInfo.NodeIdx - 1]:SetActiveWidget(0)
  else
    self:PlayAnimation(self["Unlock_0" .. SkillTreeNodeInfo.NodeIdx - 1], 0, 1, 0, 1000)
  end
end

function M:UpdateSubNodeInfo(BracnInfo, NodeInfo)
  local AttrData = DataMgr.CharAddonAttr[NodeInfo.AttrId]
  if AttrData then
    NodeInfo.IconPath = AttrData.Icon
  end
  local Char = self:GetChar(BracnInfo)
  local Res
  if self.IsPreviewMode then
    Res = {IsResourceNeed = true}
  else
    Res = SkillUtils.CanSkillTreeNodeUnlock(Char, BracnInfo.BranchIdx, NodeInfo.NodeIdx)
  end
  NodeInfo.CanUnlock = Res.CanUnlock
  NodeInfo.IsResourceNeed = Res.IsResourceNeed
  NodeInfo.ResourceUse = Res.ResourceUse
  local PreNodeInfo = BracnInfo[NodeInfo.NodeIdx - 1]
  NodeInfo.bCanUpgrad = false
  if Res.IsPreNodeNeed then
    NodeInfo.IsLocked = true
    NodeInfo.LockReasonText = GText("UI_Need_Preceding_Node")
  elseif NodeInfo.IsActivated then
    NodeInfo.IsLocked = false
  elseif self.IsPreviewMode then
    NodeInfo.IsLocked = true
  elseif Res.BreakLevelNeed then
    NodeInfo.IsLocked = true
    NodeInfo.LockReasonText = string.format(GText("UI_COMMONPOP_TEXT_100029"), Res.BreakLevelNeed or "")
  elseif Res.LevelNeed then
    NodeInfo.IsLocked = true
    NodeInfo.LockReasonText = string.format(GText("UI_SkillTree_NeedLevel"), Res.LevelNeed or "")
  elseif Res.SkillNeed then
    NodeInfo.IsLocked = true
    local SkillName = SkillUtils.GetSkillName(Res.SkillNeed) or ""
    NodeInfo.LockReasonText = string.format(GText("UI_SkillTree_NeedSkill"), SkillName, Res.SkillLevelNeed or "")
  elseif Res.ConditionNeed then
    NodeInfo.IsLocked = true
    local ConditionData = DataMgr.Condition[Res.ConditionNeed] or {}
    NodeInfo.LockReasonText = GText(ConditionData.ConditionText)
  else
    NodeInfo.IsLocked = false
    if Res.IsResourceNeed then
      NodeInfo.LockReasonText = GText("UI_Prop_Notenough")
    else
      NodeInfo.bCanUpgrad = true
    end
  end
end

function M:OnNodeClicked(TreeNodeInfo)
  local BranchInfo = self.SkillTreeBranchInfo
  if not BranchInfo then
    return
  end
  if BranchInfo.OnNodeClickedFunc then
    BranchInfo.OnNodeClickedFunc(BranchInfo.Owner, BranchInfo, TreeNodeInfo)
  end
end

function M:UpdateNodeSate()
  local SkillTreeBranchInfo = self.SkillTreeBranchInfo
  local SkillTreeNodeInfo, SkillItemWidget
  for i = 1, self.MaxNodeNumber do
    SkillTreeNodeInfo = SkillTreeBranchInfo[i]
    if not SkillTreeNodeInfo then
      break
    end
    SkillItemWidget = self.TreeNodeWidget[i]
    if 1 == i then
      local CharSkill = SkillTreeNodeInfo.Skill
      local Ret = SkillUtils.CalcSkillCanLvup(CharSkill.SkillId, CharSkill.Level, CharSkill.Level + 1, SkillTreeBranchInfo.CharUuid)
      SkillTreeNodeInfo.bCanUpgrad = Ret.CanLevelUp
      SkillItemWidget:SetCanUpgrade(SkillTreeNodeInfo.bCanUpgrad)
    else
      local Char = self:GetChar(SkillTreeBranchInfo)
      local IsActivated = Char:CheckSkillTreeNodeIsActive(SkillTreeBranchInfo.BranchIdx, i)
      if IsActivated and not SkillTreeNodeInfo.IsActivated then
        SkillTreeNodeInfo.IsActivated = IsActivated
        SkillItemWidget:OnActice()
      end
      local IsLockedBefore = SkillTreeNodeInfo.IsLocked
      self:UpdateSubNodeInfo(SkillTreeBranchInfo, SkillTreeNodeInfo)
      SkillItemWidget:SetCanUpgrade(SkillTreeNodeInfo.bCanUpgrad)
      local IsLockedAfter = SkillTreeNodeInfo.IsLocked
      if IsLockedBefore and not IsLockedAfter then
        SkillTreeNodeInfo.IsLocked = IsLockedAfter
        self:PlayAnimation(self["Unlock_0" .. i - 1])
        SkillItemWidget:UnLock()
        break
      end
    end
  end
end

function M:OnFocusReceived(MyGeometry, InFocusEvent)
  return UWidgetBlueprintLibrary.SetUserFocus(UWidgetBlueprintLibrary.Handled(), self.TreeNodeWidget[1])
end

function M:OnResourcesChanged(ResourceId)
  local BranchInfo = self.SkillTreeBranchInfo
  if not BranchInfo then
    return
  end
  self:UpdateNodeSate()
  if BranchInfo.OnTreeNodeStateChanged then
    for NodeIdx = 1, self.MaxNodeNumber do
      local NodeInfo = BranchInfo[NodeIdx]
      if NodeInfo then
        BranchInfo.OnTreeNodeStateChanged(BranchInfo.Owner, BranchInfo, NodeInfo)
      end
    end
  end
end

return M
