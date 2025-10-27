require("UnLua")
local M = Class({
  "BluePrints.Common.TimerMgr",
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:Construct()
  self.Btn_Click.OnHovered:Add(self, self.OnBtnHovered)
  self.Btn_Click.OnUnhovered:Add(self, self.OnBtnUnhovered)
  self.Btn_Click.OnPressed:Add(self, self.OnBtnPressed)
  self.Btn_Click.OnClicked:Add(self, self.OnBtnClicked)
  self.BtnCD = 0.5
  self.IsForbidden = false
  self.IconPathMaps = {
    [0] = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Talk.T_Interactive_Talk'",
    [1] = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/RougeLike/T_Rouge_Event_IconSelectionGift.T_Rouge_Event_IconSelectionGift'",
    [2] = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/RougeLike/T_Rouge_Event_IconSelectionBattle.T_Rouge_Event_IconSelectionBattle'",
    [3] = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/RougeLike/T_Rouge_Event_IconSelectionGame.T_Rouge_Event_IconSelectionGame'"
  }
end

function M:InitUI(SelectionInfo)
  self.StartTime = UE4.UGameplayStatics.GetRealTimeSeconds(self)
  self:PlayAnimation(self.In)
  self.Text_Selection:SetText(SelectionInfo.SelectionText)
  self.DescribeText = SelectionInfo.DescribeText
  if self.DescribeText then
    self.Text_Describe:SetText(self.DescribeText)
  end
  self.IsKeyOption = SelectionInfo.IsKeyOption
  self.SelectId = SelectionInfo.SelectId or nil
  self.OptionIndex = SelectionInfo.SelectIndex
  self.DialogueId = SelectionInfo.DialogueId
  self.SelectionText = SelectionInfo.SelectionText
  self.IsFromArchive = SelectionInfo.IsFromArchive
  self.Parent = SelectionInfo.Parent
  if self.SelectId then
    local IconType = DataMgr.RougeLikeEventSelect[self.SelectId].IconType or 0
    local IconPath = self.IconPathMaps[IconType]
    self.Icon:SetBrushResourceObject(LoadObject(IconPath))
  end
  if not self.IsFromArchive then
    local Avatar = GWorld:GetAvatar()
    assert(Avatar, "\230\137\190\228\184\141\229\136\176Avatar")
    local Currency = Avatar:GetCurrentRougeLikeToken()
    if self.SelectId then
      self.ChoicePrice = DataMgr.RougeLikeEventSelect[self.SelectId].Price
    end
    if self.ChoicePrice and Currency < self.ChoicePrice then
      self:PlayAnimationForward(self.Forbidden)
      self.IsForbidden = true
    end
  end
end

function M:OnBtnHovered()
  if self.IsSelected then
    return
  end
  AudioManager(self):PlayUISound(self, "event:/ui/roguelike/level_event_select_btn_hover", nil, nil)
  self:PlayAnimation(self.Hover)
end

function M:OnBtnUnhovered()
  if self.IsSelected then
    return
  end
  self:StopAnimation(self.Hover)
  self:PlayAnimation(self.Unhover)
end

function M:OnBtnPressed()
  if self.IsForbidden or self.IsSelected then
    return
  end
  self:PlayAnimation(self.Press)
end

function M:OnBtnClicked()
  if not self.IsFromArchive then
    local Avatar = GWorld:GetAvatar()
    assert(Avatar, "\230\137\190\228\184\141\229\136\176Avatar")
    local UIManager = GWorld.GameInstance:GetGameUIManager()
    assert(UIManager, "\230\137\190\228\184\141\229\136\176UIManager")
    local Currency = Avatar:GetCurrentRougeLikeToken()
    if self.ChoicePrice and Currency < self.ChoicePrice then
      UIManager:ShowUITip(UIConst.Tip_CommonToast, GText("RL_Event_CantSelect"))
      return
    end
  end
  if self.CurrentTime and self.CurrentTime - self.StartTime < self.BtnCD then
    return
  end
  self.CurrentTime = UE4.UGameplayStatics.GetRealTimeSeconds(self)
  if not self.Parent.CanInteractChoices then
    return
  end
  AudioManager(self):PlayUISound(self, "event:/ui/roguelike/level_event_select_btn_click", nil, nil)
  self.StartTime = UE4.UGameplayStatics.GetRealTimeSeconds(self)
  self.Parent:CloseExcept(self.OptionIndex)
  self:PlayAnimation(self.Confirm)
  if self.Parent.IsSkipping then
    self.Parent:ChooseItem(self.OptionIndex, self.IsKeyOption, self.DialogueId, self.SelectionText)
  else
    self:AddTimer(self.Confirm:GetEndTime(), function()
      self.Parent:ChooseItem(self.OptionIndex, self.IsKeyOption, self.DialogueId, self.SelectionText)
    end, false, nil, nil, true)
  end
  self.IsSelected = true
  self:PlayAnimation(self.Click)
end

return M
