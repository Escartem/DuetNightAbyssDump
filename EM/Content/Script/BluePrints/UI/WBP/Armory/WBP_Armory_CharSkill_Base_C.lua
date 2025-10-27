require("UnLua")
local ArmoryUtils = require("BluePrints.UI.WBP.Armory.ArmoryUtils")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})
M._components = {
  "BluePrints.UI.BP_EMUserWidgetUtils_C"
}

function M:Construct()
  self.BranchWidgets = {
    self.CharSkill_1,
    self.CharSkill_2,
    self.CharSkill_3
  }
  self:UnbindAllFromAnimationFinished(self.Out)
  self:BindToAnimationFinished(self.Out, {
    self,
    self.OnOutAnimFinished
  })
end

function M:Init(Params)
  self.Parent = Params.Parent
  self.Target = Params.Target
  self.IsPreviewMode = Params.IsPreviewMode or Params.IsTargetUnowned
  self.bNeedPreviewSwitcher = Params.bNeedPreviewSwitcher
  self.OnTreeNodeClickedCallback = Params.OnTreeNodeClicked
  self.OnTreeNodeStateChangedCallback = Params.OnTreeNodeStateChanged
  self:UpdateSkillInfos(self.Target)
end

function M:UpdateSkillInfos(Target)
  local Char = ArmoryUtils:GetCharByUuid(Target.Uuid) or Target
  local SkillTreeData = DataMgr.SkillTree[Char.CharId]
  if not SkillTreeData then
    return
  end
  local BranchIdx, SkillTreeBranchInfo, SkillTreeNodeInfo
  local SkillTreeInfo = {}
  for key, BranchData in pairs(SkillTreeData) do
    BranchIdx = tonumber(string.sub(key, 6, 6))
    if BranchIdx then
      SkillTreeInfo[BranchIdx] = SkillTreeInfo[BranchIdx] or {
        BranchIdx = BranchIdx,
        Target = Target,
        IsPreviewMode = self.IsPreviewMode,
        Owner = self,
        OnNodeClickedFunc = self.OnTreeNodeClicked,
        OnTreeNodeStateChanged = self.OnTreeNodeStateChanged
      }
      SkillTreeBranchInfo = SkillTreeInfo[BranchIdx]
      for NodeIdx, NodeData in ipairs(BranchData) do
        SkillTreeBranchInfo[NodeIdx] = SkillTreeBranchInfo[NodeIdx] or {BranchIdx = BranchIdx, NodeIdx = NodeIdx}
        SkillTreeNodeInfo = SkillTreeBranchInfo[NodeIdx]
        if NodeData.Skill then
          SkillTreeNodeInfo.SkillId = NodeData.Skill
          for _, CharSkill in pairs(Char.Skills) do
            if CharSkill.SkillId == SkillTreeNodeInfo.SkillId then
              SkillTreeNodeInfo.Skill = CharSkill
            end
          end
        elseif NodeData.Attr then
          SkillTreeNodeInfo.AttrId = NodeData.Attr
        end
      end
    end
  end
  self.SkillTreeInfo = SkillTreeInfo
  for index, BranchWidget in ipairs(self.BranchWidgets) do
    BranchWidget:Init(SkillTreeInfo[index], self.IsPreviewMode)
  end
end

function M:GetSkillTreeInfo()
  return self.SkillTreeInfo
end

function M:PlayInAnim()
  self.IsShowed = true
  self:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  self:StopAnimation(self.Out)
  self:PlayAnimationForward(self.In)
end

function M:PlayOutAnim()
  self.IsShowed = false
  self:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  self:StopAnimation(self.In)
  self:PlayAnimationForward(self.Out)
end

function M:OnOutAnimFinished()
  if not self.IsShowed then
    self:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

function M:OnTreeNodeClicked(BranchInfo, TreeNodeInfo)
  if self.OnTreeNodeClickedCallback then
    self.OnTreeNodeClickedCallback(self.Parent, BranchInfo, TreeNodeInfo)
  else
    self:LoadSkillDetailsUI(TreeNodeInfo)
  end
end

function M:OnTreeNodeStateChanged(BranchInfo, TreeNodeInfo)
  if self.OnTreeNodeStateChangedCallback then
    self.OnTreeNodeStateChangedCallback(self.Parent, BranchInfo, TreeNodeInfo)
  end
end

function M:LoadSkillDetailsUI(TreeNodeInfo)
  TreeNodeInfo = TreeNodeInfo or {}
  local UIConfig = DataMgr.SystemUI.SkillDetails
  UIManager(self):LoadUI(UIConst.LoadInConfig, UIConfig.UIName, self.Parent:GetZOrder(), {
    CharUuid = self.Target.Uuid,
    Target = self.Target,
    SelectedSkillId = TreeNodeInfo.Skill and TreeNodeInfo.Skill.SkillId,
    SelectedAttrId = TreeNodeInfo.AttrId,
    OutAnimStyle = 2,
    OnClosedObj = self,
    OnClosedCallback = self.OnSkillDetailsClosed,
    OnDestructObj = self,
    OnDestructCallback = self.OnSkillDetailsDestruct,
    IsPreviewMode = self.IsPreviewMode
  })
end

function M:OnSkillDetailsClosed()
  self:UpdateSkillInfos(self.Target)
  local ArmoryMain = UIManager(self):GetArmoryUIObj()
  if ArmoryMain then
    ArmoryMain:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
    ArmoryMain.Panel_SubUI:SetVisibility(UIConst.VisibilityOp.Hidden)
    ArmoryMain:PlayAnimation(ArmoryMain.RoleList_In)
    ArmoryMain:PlayAnimation(ArmoryMain.BG_BackFirst)
    ArmoryMain.Tab_Arm:PlayInAnim()
    ArmoryMain.ReceiveEnterStateNoAnim = true
    ArmoryMain:UpdateMontageAndCamera()
  end
end

function M:OnSkillDetailsDestruct()
  local ArmoryMain = UIManager(self):GetArmoryUIObj()
  if ArmoryMain then
    ArmoryMain:SetVisibility(UIConst.VisibilityOp.Collapsed)
    ArmoryMain.Panel_SubUI:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  end
end

AssembleComponents(M)
return M
