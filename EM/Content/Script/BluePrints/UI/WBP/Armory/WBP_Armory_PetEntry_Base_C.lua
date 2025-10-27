require("UnLua")
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
  self.Btn_Intensify:BindEventOnClicked(self, self.OnBtnEntryBreakClicked)
  self.Btn_Intensify:BindForbidStateExecuteEvent(self, self.OnForbiddenBtnEntryBreakClicked)
  self.Btn_Mix:BindEventOnClicked(self, self.OnFuseBtnClicked)
  self.Btn_Mix:BindForbidStateExecuteEvent(self, self.OnForbiddenBtnFuseClicked)
  self.ConfirmBtns = {
    self.Btn_Intensify,
    self.Btn_Mix
  }
  self.Btn_Index:BindEventOnClicked(self, self.OnIndexBtnClicked)
  self.Bg_Empty.Text_Empty:SetText(GText("Pet_Affix_Without"))
  self.Btn_Index:SetText(GText("Pet_Affix_Archive"))
  self.ReddotNodeName = "PetEntry"
  if not ReddotManager.GetTreeNode(self.ReddotNodeName) then
    ReddotManager.AddNode(self.ReddotNodeName, nil, 1)
  end
  ReddotManager.AddListenerEx(self.ReddotNodeName, self, self.OnReddotChanged)
end

function M:OnReddotChanged()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  local CacheDetail = ReddotManager.GetLeafNodeCacheDetail(self.ReddotNodeName) or {}
  local IsNew = false
  for key, value in pairs(Avatar.PetUnlockedEntrys) do
    if not CacheDetail[key] then
      IsNew = true
      break
    end
  end
  if IsNew then
    self.Btn_Index.New:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  else
    self.Btn_Index.New:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

function M:OnPetEntryDestructed(OnDestructObj)
  OnDestructObj:OnReddotChanged()
end

function M:OnBtnEntryBreakClicked(bIsGamePad)
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_confirm", nil, nil)
  local EntryContent = self.CurEntryContent
  if self.CurEntryContent.Widget and not self.CurEntryContent.Widget.IsSelected then
    EntryContent = nil
  end
  if bIsGamePad then
    for i, widget in ipairs(self.DisplayEntryItemWidgets) do
      if widget:HasFocusedDescendants() then
        EntryContent = widget.Content
        break
      end
    end
  end
  UIManager(self):LoadUINew("PetEnhance", self.Pet, EntryContent)
end

function M:OnFuseBtnClicked()
  self:OpenPetMix()
end

function M:OnForbiddenBtnEntryBreakClicked()
  UIManager(self):ShowUITip("CommonToastMain", self.ButtonStyleInfo[1].ErrorText)
end

function M:OnForbiddenBtnFuseClicked()
  UIManager(self):ShowUITip("CommonToastMain", self.ButtonStyleInfo[2].ErrorText)
end

function M:OnIndexBtnClicked()
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_mid", nil, nil)
  local UIConfig = DataMgr.SystemUI.PetEntry
  UIManager(self):LoadUI(UIConst.LoadInConfig, UIConfig.UIName, self.Parent:GetZOrder(), {
    OnDestructObj = self,
    OnDestructCallback = self.OnPetEntryDestructed,
    Type = 2
  })
end

function M:UpdateButtonStyle(Content)
  self.ButtonStyleInfo = {
    {},
    {}
  }
  self.ButtonStyleInfo[1].Text = GText("Pet_Affix_Break")
  self.ButtonStyleInfo[2].Text = GText("Pet_Affix_Fuse")
  self.ButtonStyleInfo[1].Visibility = UIConst.VisibilityOp.SelfHitTestInvisible
  if self.Pet:IsResourcePet() then
    self.ButtonStyleInfo[2].Visibility = UIConst.VisibilityOp.Collapsed
  else
    self.ButtonStyleInfo[2].Visibility = UIConst.VisibilityOp.SelfHitTestInvisible
  end
  local IsAllLocked = true
  local IsAllEmpty = true
  local IsAllMax = true
  for key, Content in pairs(self.EntryContents) do
    if not Content.IsLocked then
      IsAllLocked = false
    end
    if not Content.IsEmpty then
      IsAllEmpty = false
    end
    local Data = DataMgr.PetEntry[Content.EntryId]
    if Data and Data.PetEntryUPID then
      IsAllMax = false
    end
  end
  self.ButtonStyleInfo[1].ForbidBtn = false
  self.ButtonStyleInfo[2].ForbidBtn = false
  if IsAllLocked then
    self.ButtonStyleInfo[1].ForbidBtn = true
    self.ButtonStyleInfo[2].ForbidBtn = true
    self.ButtonStyleInfo[1].ErrorText = GText("Pet_AffixSlot_LockToast")
    self.ButtonStyleInfo[2].ErrorText = GText("Pet_AffixSlot_LockToast")
  elseif IsAllEmpty then
    self.ButtonStyleInfo[1].ForbidBtn = true
    self.ButtonStyleInfo[1].ErrorText = GText("UI_Pet_Affix_Without")
    self.ButtonStyleInfo[2].ForbidBtn = false
  elseif IsAllMax then
    self.ButtonStyleInfo[1].ForbidBtn = true
    self.ButtonStyleInfo[1].ErrorText = GText("Pet_Affix_Break_LevelMax")
  else
    self.ButtonStyleInfo[1].ForbidBtn = false
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
  self:UpdatePetInfos(self.Pet)
  self:UpdateEntryInfos(self.Pet)
  self:UpdateButtonStyle(self.CurEntryContent)
end

function M:UpdatePetInfos(Pet)
  if not Pet or not Pet:IsResourcePet() then
    self.LevelInfo:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.Text_Describe:SetVisibility(UIConst.VisibilityOp.Collapsed)
    return
  end
  self.LevelInfo:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  self.Text_Describe:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  local MaxLevel = Pet.Level
  local LevelUpData = DataMgr.PetLevelUp[Pet.Level]
  local Percent = math.clamp(Pet.Exp / LevelUpData.PetLevelMaxExp, 0, 1)
  local BreakLevelUpData = DataMgr.PetBreak[Pet.PetId]
  self.LevelInfo:Init(Pet.Level, MaxLevel, Percent, 0, BreakLevelUpData)
  local Data = DataMgr.Pet[Pet.PetId]
  if Data then
    self.Text_Describe:SetText(GText(Data.IpDes))
  end
end

function M:OnEntryContentCreated(Content)
end

function M:OnEntryClicked(Content)
  self:UpdateButtonStyle(Content)
end

function M:PlayInAnim()
  self:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  if self:IsAnimationPlaying(self.In) then
    return
  end
  self:StopAnimation(self.Out)
  self:PlayAnimation(self.In)
  self:PlayEntriesInAnim()
end

function M:PlayOutAnim()
  self:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  self:StopAnimation(self.In)
  self:PlayAnimation(self.Out)
end

AssembleComponents(M)
return M
