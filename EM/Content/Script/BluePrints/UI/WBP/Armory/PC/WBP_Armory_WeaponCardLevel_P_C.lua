require("UnLua")
local SkillUtils = require("Utils.SkillUtils")
local ArmoryUtils = require("BluePrints.UI.WBP.Armory.ArmoryUtils")
local M = Class("BluePrints.UI.BP_EMUserWidget_C")

function M:Construct()
  self:UnbindAllFromAnimationFinished(self.Auto_In)
  self:UnbindAllFromAnimationFinished(self.Auto_Out)
  self:UnbindAllFromAnimationFinished(self.LevelUp)
  self:BindToAnimationFinished(self.Auto_In, {
    self,
    self.OnInAnimFinished
  })
  self:BindToAnimationFinished(self.Auto_Out, {
    self,
    self.OnOutAnimFinished
  })
  self:BindToAnimationFinished(self.LevelUp, {
    self,
    self.OnLevelUpAnimFinished
  })
  self.Btn_up:BindEventOnClicked(self, self.OnConfirmBtnClicked)
  self.Btn_voluntarily:BindEventOnClicked(self, self.OnAutoFilListBtnClicked)
  self.Btn_up:BindForbidStateExecuteEvent(self, self.OnForbiddenConfirmBtnClicked)
  self.Btn_voluntarily:BindForbidStateExecuteEvent(self, self.OnForbiddenAutoFilListBtnClicked)
  self.ListView_Item.BP_OnEntryInitialized:Clear()
  self.ListView_Item.BP_OnEntryInitialized:Add(self, self.OnListEntryInitialized)
  self.ListView_Item.BP_OnItemClicked:Clear()
  self.ListView_Item.BP_OnItemClicked:Add(self, self.OnListItemClicked)
  self.ListView_Item:DisableScroll(true)
  self.Btn_voluntarily:SetText(GText("UI_WeaponStrength_Auto"))
  self.Btn_up:SetText(GText("UI_WeaponStrength_Strengthen"))
  self.Text_tips03:SetText(GText("UI_WeaponStrength_Level"))
  local Font = self.Common_DialogTitle_PC.Text_Title.Font
  Font.Size = 24
  self.Common_DialogTitle_PC.Text_Title:SetFont(Font)
  self:SetVisibility(UIConst.VisibilityOp.Collapsed)
end

function M:Init(Parent, TargetWeapon)
  self.Parent = Parent
  self.TargetWeapon = TargetWeapon
  self.MaxGradeLevel = DataMgr.WeaponCardLevel[self.TargetWeapon.WeaponId].CardLevelMax
  self.MaxItemCount = self.MaxGradeLevel
  self.ListView_Item:ClearListItems()
  self.Contents = {}
  self.Common_DialogTitle_PC.Text_Title:SetText(GText(self.TargetWeapon.WeaponName))
  self:FillEmptyItmes(self.MaxItemCount)
  self:UpdateGradeLevelInfo()
  self:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
end

function M:FillListView(Contents)
  self.ListView_Item:ClearListItems()
  for _, Content in ipairs(Contents) do
    self.ListView_Item:AddItem(Content)
  end
  self:FillEmptyItmes(self.MaxItemCount - #Contents)
  self.ListView_Item:RegenerateAllEntries()
end

function M:FillEmptyItmes(ItemCount)
  for i = 1, ItemCount do
    local Obj = NewObject(UIUtils.GetCommonItemContentClass())
    
    function Obj.OnBtnAddClicked(Content)
      self:OnListItemClicked(Content)
    end
    
    self.ListView_Item:AddItem(Obj)
  end
end

function M:OnListEntryInitialized(Content, Widget)
  if Content.Icon then
    Widget:ShowAddIcon(false)
    Widget:SetMinusBtn(true, self, self.OnListItemClicked)
  else
    Widget:ShowAddIcon(true)
    Widget:SetInteractivity(true)
    Widget:SetMinusBtn(false)
  end
end

function M:PlayLevelUpAnim()
  self.Text_Num:SetText(self.TargetWeapon.GradeLevel)
  self:PlayAnimation(self.LevelUp, 0, 1, 0, 1, true)
  self.Btn_voluntarily:ForbidBtn(true)
  self.Btn_up:ForbidBtn(true)
  self:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
end

function M:OnLevelUpAnimFinished()
  self:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  self:UpdateGradeLevelInfo()
end

function M:PlayInAnim(CallBack)
  self.InAnimFinishedCallBack = CallBack
  self:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  self:StopAllAnimations()
  self:FlushAnimations()
  self:PlayAnimation(self.Auto_In)
end

function M:OnInAnimFinished()
  if self.InAnimFinishedCallBack then
    self.InAnimFinishedCallBack(self.Parent)
  end
end

function M:PlayOutAnim(CallBack)
  self.OutAnimFinishedCallBack = CallBack
  self:PlayAnimation(self.Auto_Out)
end

function M:OnOutAnimFinished()
  self:SetVisibility(UIConst.VisibilityOp.Collapsed)
  if self.OutAnimFinishedCallBack then
    self.OutAnimFinishedCallBack(self.Parent)
  end
end

function M:BindEvents(Params)
  self.Obj = Params.Obj
  self.OnListItemClickedEvent = Params.OnListItemClickedEvent
  self.OnAutoFilListBtnClickedEvent = Params.OnAutoFilListBtnClickedEvent
  self.OnConfirmBtnClickedEvent = Params.OnConfirmBtnClickedEvent
end

function M:OnListItemClicked(Content)
  if self.OnListItemClickedEvent then
    self.OnListItemClickedEvent(self.Obj, Content)
  end
end

function M:OnAutoFilListBtnClicked()
  if self.OnAutoFilListBtnClickedEvent then
    self.OnAutoFilListBtnClickedEvent(self.Obj)
  end
end

function M:ClearItems(NeedGradeLevelInfo)
  self.Contents = {}
  self:FillListView(self.Contents)
  if NeedGradeLevelInfo then
    self:UpdateGradeLevelInfo()
  end
end

function M:OnForbiddenAutoFilListBtnClicked()
end

function M:OnConfirmBtnClicked()
  if self.OnConfirmBtnClickedEvent then
    self.OnConfirmBtnClickedEvent(self.Obj)
  end
end

function M:OnForbiddenConfirmBtnClicked()
end

function M:RemoveItem(Content)
  local RemoveIdx
  for index, value in ipairs(self.Contents) do
    if value.Uuid == Content.Uuid then
      RemoveIdx = index
      break
    end
  end
  if RemoveIdx then
    table.remove(self.Contents, RemoveIdx)
    self:FillListView(self.Contents)
    self:UpdateGradeLevelInfo()
  end
end

function M:AddItemToLast(Content)
  local Obj = ArmoryUtils:CopyCharOrWeaponItemContent(Content)
  Obj.IsNew = false
  table.insert(self.Contents, Obj)
  self:FillListView(self.Contents)
  self:UpdateGradeLevelInfo()
end

function M:UpdateGradeLevelInfo()
  self.ListView_Item:SetRenderOpacity(1)
  self.ListView_Item:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  local AddLevel = 0
  for _, value in ipairs(self.Contents) do
    AddLevel = AddLevel + value.GradeLevel + 1
  end
  local ComparedGradeLevel = self.TargetWeapon.GradeLevel + AddLevel
  local SkillDesc
  if ComparedGradeLevel == self.TargetWeapon.GradeLevel then
    self.Text_Polarity03:SetText(ComparedGradeLevel)
    self.Present:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.Preview:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.Image_2:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.Default:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    self.Text_Polarity01:SetText(self.TargetWeapon.GradeLevel)
    self.Text_tips02:SetText(GText("UI_WeaponStrength_Curent"))
    SkillDesc = SkillUtils.CalcWeaponPassiveEffectsDesc(self.TargetWeapon, self.TargetWeapon.GradeLevel)
    self.Btn_up:ForbidBtn(true)
    if ComparedGradeLevel >= self.MaxGradeLevel then
      self.Btn_voluntarily:ForbidBtn(true)
      self.ListView_Item:SetRenderOpacity(0)
      self.ListView_Item:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
      self.Panel_Yellow:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
      self.Text_Tips:SetText(GText("UI_WeaponStrength_Max"))
    else
      self.Btn_voluntarily:ForbidBtn(false)
      self.Panel_Yellow:SetVisibility(UIConst.VisibilityOp.Collapsed)
    end
    if ComparedGradeLevel >= self.MaxGradeLevel then
      self:SetMaxLevelColor(self.Bg_Polarity_2, self.Text_Polarity03)
    else
      self:SetNormalColor(self.Bg_Polarity_2, self.Text_Polarity03)
    end
  else
    if ComparedGradeLevel >= self.MaxGradeLevel then
      ComparedGradeLevel = self.MaxGradeLevel
      self:SetMaxLevelColor(self.Bg_Polarity, self.Text_Polarity02)
    else
      self:SetNormalColor(self.Bg_Polarity, self.Text_Polarity02)
    end
    self.Btn_voluntarily:ForbidBtn(false)
    self.Btn_up:ForbidBtn(false)
    self.Text_Polarity01:SetText(self.TargetWeapon.GradeLevel)
    self.Text_Polarity02:SetText(ComparedGradeLevel)
    self.Present:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    self.Preview:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    self.Image_2:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    self.Default:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.Text_tips02:SetText(GText("UI_WeaponStrength_After"))
    SkillDesc = SkillUtils.CalcWeaponPassiveEffectsDesc(self.TargetWeapon, self.TargetWeapon.GradeLevel, ComparedGradeLevel)
  end
  self.Text_Details:SetText(SkillDesc)
end

function M:Destruct()
  self:StopAllAnimations()
end

return M
