require("UnLua")
local WBP_Rouge_DifficultyListItem_C = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function WBP_Rouge_DifficultyListItem_C:Construct()
  self.Text_LvName:SetText(GText("UI_RL_LevelLimit"))
  self.Bg_List:BindEventOnClicked(self, self.OnSubCellClicked)
  self.Bg_List:TryOverrideSoundFunc(function()
    AudioManager(self):PlayUISound(self, "event:/ui/common/click_mid", nil, nil)
  end)
end

function WBP_Rouge_DifficultyListItem_C:BindEventOnClicked(Obj, Func, ...)
  if not Obj or not Func then
    return
  end
  self.Obj = Obj
  self.Func = Func
  self.Params = {
    ...
  }
end

function WBP_Rouge_DifficultyListItem_C:ItemSetNavigationRuleCustom(Obj, Func)
  self:SetNavigationRuleCustom(EUINavigation.Up, {Obj, Func})
  self:SetNavigationRuleCustom(EUINavigation.Down, {Obj, Func})
end

function WBP_Rouge_DifficultyListItem_C:InitInfo(DifficultyId, Index, Unlock)
  self.DifficultyId = DifficultyId
  local RougeLikeDifficulty = DataMgr.RougeLikeDifficulty
  self.UnlockLevel = RougeLikeDifficulty[DifficultyId].RecommendLevel
  self.Title_Level:SetText(GText("RL_Difficulty_" .. Index))
  self.Text_Lv:SetText(self.UnlockLevel)
  self:RefreshState(Unlock)
  self:PlayAnimation(self.Normal)
  self.Bg_List:PlayAnimation(self.Bg_List.Normal)
end

function WBP_Rouge_DifficultyListItem_C:OnSubCellClicked()
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    if Avatar:IsRougeLikeInProgress() and Avatar.RougeLike.ProgressingDifficultyId == self.DifficultyId then
      self:PlayAnimation(self.Select)
    elseif not Avatar:IsRougeLikeInProgress() then
      self:PlayAnimation(self.Select)
    end
  end
  if self.Obj and self.Func then
    return self.Func(self.Obj, table.unpack(self.Params))
  end
end

function WBP_Rouge_DifficultyListItem_C:UnSelected()
  self:StopAllAnimations()
  self:PlayAnimationReverse(self.Select)
  self.Bg_List:StopAllAnimations()
  self.Bg_List:PlayAnimation(self.Bg_List.Normal)
  self.Bg_List.IsSelect = false
  self.IsSelect = false
end

function WBP_Rouge_DifficultyListItem_C:Selected()
  self:StopAllAnimations()
  self:PlayAnimation(self.Select)
  self.Bg_List:StopAllAnimations()
  self.Bg_List:PlayAnimation(self.Bg_List.Select)
  self.Bg_List.IsSelect = true
  self.IsSelect = true
end

function WBP_Rouge_DifficultyListItem_C:RefreshState(Unlock)
  local Avatar = GWorld:GetAvatar()
  if nil == Unlock then
    self.Unlock = false
    local UnlockCondition = DataMgr.RougeLikeDifficulty[self.DifficultyId].UnlockCondition
    if UnlockCondition then
      if Avatar then
        self.Unlock = Avatar:CheckCondition(UnlockCondition)
      end
    else
      self.Unlock = true
    end
  else
    self.Unlock = Unlock
  end
  self.Bg_List.IsCantInteractable = true
  if Avatar and not Avatar:IsRougeLikeInProgress() then
    self.Bg_List.IsCantInteractable = false
  end
  if self.Unlock then
    self.Image_Lock:SetVisibility(ESlateVisibility.Collapsed)
  else
    self.Image_Lock:SetVisibility(ESlateVisibility.Visible)
  end
end

return WBP_Rouge_DifficultyListItem_C
