require("UnLua")
require("DataMgr")
local WBP_Piano_MusicScore = Class("BluePrints.UI.BP_UIState_C")

function WBP_Piano_MusicScore:Destruct()
  self.Btn_Album.OnClicked:Remove(self, self.OnBtnClicked)
  self.Btn_Album.OnHovered:Remove(self, self.OnBtnHovered)
  self.Btn_Album.OnUnHovered:Remove(self, self.OnBtnUnHovered)
  self:UnBindInputMethodChangedDelegate()
  WBP_Piano_MusicScore.Super.Destruct(self)
end

function WBP_Piano_MusicScore:OnListItemObjectSet(ListItemObject)
  self:PlayAnimation(self.Normal)
  self.DataObject = ListItemObject
  self.ParentUI = ListItemObject.Owner
  self.MusicScoreId = ListItemObject.MusicScoreId
  self.IsLocked = ListItemObject.bIsLocked
  self.ListViewIndex = ListItemObject.Index
  self.ReddotNum = ListItemObject.ReddotNum
  self.IsSelected = false
  self.IsStoredCustomBGMMusicScore = false
  self.bCanPlayAnimation = true
  self.IsEmptyMusicScore = ListItemObject.bIsEmptyMusicScore
  if self.IsEmptyMusicScore then
    self.WidgetSwitcher_State:SetActiveWidgetIndex(1)
    return
  end
  self:InitUI()
  self:AddDispatcher(EventID.ChangeSelectMusicScore, self, self.OnSelectMusicScoreChanged)
  self:AddDispatcher(EventID.ChangeStoredCustomBGM, self, self.OnStoredCustomBGMChanged)
  self:AddDispatcher(EventID.ChangeMusicItemNewState, self, self.OnMusicItemNewStateChange)
  self:BindInputMethodChangedDelegate()
  self.bIsOnListItemSet = true
  if self.MusicScoreId == DataMgr.Music[self.ParentUI.CurrentHomeBaseBGM].MusicScoreId then
    if self.ParentUI.IsFirstOpen then
      self:OnBtnClicked()
      self.ParentUI.IsFirstOpen = false
    end
    self:IsStoredBGMMusicScore()
  end
  if self.ParentUI.CurrentSelectMusicScore == self.MusicScoreId then
    self:Selected()
  end
  self.bIsOnListItemSet = false
end

function WBP_Piano_MusicScore:OnMusicItemNewStateChange(MusicId)
  if DataMgr.Music[MusicId].MusicScoreId == self.MusicScoreId then
    self.ReddotNum = self.ReddotNum - 1
    if self.ReddotNum <= 0 then
      self.New:SetVisibility(UIConst.VisibilityOp.Collapsed)
    end
  end
end

function WBP_Piano_MusicScore:InitUI()
  self.WidgetSwitcher_State:SetActiveWidgetIndex(0)
  local MusicScoreInfo = DataMgr.MusicScore[self.MusicScoreId]
  self.Img_Album:SetBrushFromTexture(LoadObject(MusicScoreInfo.MusicScorePic))
  self.Icon_Music:SetVisibility(UIConst.VisibilityOp.Collapsed)
  if self.IsLocked then
    self:StopAllAnimations()
    self.Btn_Album:SetForbidden(true)
    self:PlayAnimation(self.Forbidden)
  else
    self.Btn_Album:SetForbidden(false)
  end
  if self.ReddotNum and self.ReddotNum > 0 then
    self.New:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  else
    self.New:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  self.Btn_Album.OnClicked:Add(self, self.OnBtnClicked)
  self.Btn_Album.OnHovered:Add(self, self.OnBtnHovered)
  self.Btn_Album.OnUnHovered:Add(self, self.OnBtnUnHovered)
end

function WBP_Piano_MusicScore:OnBtnClicked()
  if self.IsLocked then
    UIManager(self):ShowUITip(UIConst.Tip_CommonToast, GText("HomePiano_NoMusicBeenIncluded"), 5)
    return
  end
  if self.IsSelected then
    return
  end
  self:SetFocus()
  self.ParentUI:ChangeCurrentSelectMusicScore(self.ListViewIndex)
  if not self.bIsOnListItemSet then
    AudioManager(self):PlayUISound(self, "event:/ui/armory/click_crystal_btn_tab", nil, nil)
  end
end

function WBP_Piano_MusicScore:OnBtnHovered()
  if self.IsLocked or not self.bCanPlayAnimation then
    return
  end
  self:PlayAnimation(self.Hover)
end

function WBP_Piano_MusicScore:OnBtnUnHovered()
  if self.IsLocked or not self.bCanPlayAnimation then
    return
  end
  self:PlayAnimation(self.Unhover)
end

function WBP_Piano_MusicScore:OnSelectMusicScoreChanged(NewMusicScoreId)
  if NewMusicScoreId == self.MusicScoreId then
    self:Selected()
  else
    self:Deselected()
  end
end

function WBP_Piano_MusicScore:Selected()
  if self.IsSelected then
    return
  end
  self.IsSelected = true
  self:StopAllAnimations()
  self:PlayAnimation(self.Click)
  self.bCanPlayAnimation = false
end

function WBP_Piano_MusicScore:Deselected()
  if not self.IsSelected then
    return
  end
  self.IsSelected = false
  self.bCanPlayAnimation = true
  self:StopAllAnimations()
  self:PlayAnimation(self.Normal)
end

function WBP_Piano_MusicScore:OnStoredCustomBGMChanged(NewMusicId)
  local NewMusicScoreId = DataMgr.Music[NewMusicId].MusicScoreId
  if NewMusicScoreId == self.MusicScoreId then
    self:IsStoredBGMMusicScore()
  else
    self:IsNotStoredBGMMusicScore()
  end
end

function WBP_Piano_MusicScore:IsStoredBGMMusicScore()
  if self.IsStoredCustomBGMMusicScore then
    return
  end
  self.IsStoredCustomBGMMusicScore = true
  self.Icon_Music:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
end

function WBP_Piano_MusicScore:IsNotStoredBGMMusicScore()
  if not self.IsStoredCustomBGMMusicScore then
    return
  end
  self.IsStoredCustomBGMMusicScore = false
  self.Icon_Music:SetVisibility(UIConst.VisibilityOp.Collapsed)
end

function WBP_Piano_MusicScore:BindInputMethodChangedDelegate()
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  local GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
  if IsValid(GameInputModeSubsystem) then
    GameInputModeSubsystem.OnInputMethodChanged:Add(self, self.OnInputMethodChanged)
  end
end

function WBP_Piano_MusicScore:UnBindInputMethodChangedDelegate()
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  local GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
  if IsValid(GameInputModeSubsystem) then
    GameInputModeSubsystem.OnInputMethodChanged:Remove(self, self.OnInputMethodChanged)
  end
end

function WBP_Piano_MusicScore:OnInputMethodChanged(NewGameInputType, NewGamepadName)
  if NewGameInputType == ECommonInputType.Gamepad and self.IsSelected then
    self:SetFocus()
  end
end

return WBP_Piano_MusicScore
