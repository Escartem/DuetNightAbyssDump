local WBP_Rouge_TalentEntrance_C = Class("BluePrints.UI.BP_UIState_C", "BluePrints.UI.BP_EMUserWidget_C")

function WBP_Rouge_TalentEntrance_C:Construct()
  self:BindToAnimationFinished(self.In, {
    self,
    self.SetEntranceSelfHitTestInvisible
  })
end

function WBP_Rouge_TalentEntrance_C:Init(Root, ReddotCondition, BranchId, BranchTalentNum, ActivedBranchTalentNum, IsFirst)
  self.Root = Root
  self.IsFirst = IsFirst
  self.BranchId = BranchId
  self.Btn_Click.OnClicked:Add(self, self.OnBtnClicked)
  self.Btn_Click.OnHovered:Add(self, self.OnBtnHovered)
  self.Text_Actived:SetText(ActivedBranchTalentNum)
  self.Text_All:SetText(BranchTalentNum)
  self.Text_Dimension:SetText(GText(DataMgr.RougeLikeTalentBranch[BranchId].Name))
  self.Text_Modified:SetText(GText(DataMgr.RougeLikeTalentBranch[BranchId].SubTitle))
  if ActivedBranchTalentNum == BranchTalentNum then
    local SlateColor = FSlateColor()
    SlateColor.SpecifiedColor = self.Color_Max
    self.Text_Actived:SetColorAndOpacity(SlateColor)
    self.Text_Split:SetColorAndOpacity(SlateColor)
    self.Text_All:SetColorAndOpacity(SlateColor)
  end
  if ReddotCondition then
    self.Reddot:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  else
    self.Reddot:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  local IconPath = DataMgr.RougeLikeTalentBranch[BranchId].Icon
  if IconPath then
    local image = LoadObject(IconPath)
    if image then
      self.Img_Icon:SetBrushFromTexture(image, true)
    end
  end
end

function WBP_Rouge_TalentEntrance_C:OnBtnClicked()
  AudioManager(self):PlayUISound(self, "event:/ui/roguelike/spectrum_page_select_click", nil, nil)
  self.Root:OpenTalentMenu(self.BranchId)
end

function WBP_Rouge_TalentEntrance_C:OnBtnHovered()
  AudioManager(self):PlayUISound(self, "event:/ui/roguelike/btn_black_hover", nil, nil)
end

function WBP_Rouge_TalentEntrance_C:SetEntranceSelfHitTestInvisible()
  self:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  if self.IsFirst then
    self:SetFocus()
  end
end

function WBP_Rouge_TalentEntrance_C:BP_GetDesiredFocusTarget()
  return self.Btn_Click
end

return WBP_Rouge_TalentEntrance_C
