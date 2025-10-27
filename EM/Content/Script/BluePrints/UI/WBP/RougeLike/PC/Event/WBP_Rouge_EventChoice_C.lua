require("UnLua")
local M = Class("BluePrints.UI.BP_UIState_C")

function M:Construct()
  self.BtnCD = 0.5
  self.IsCoinEnough = true
end

function M:BindChooseEvent()
  self.StartTime = UE4.UGameplayStatics.GetRealTimeSeconds(self)
  if self.Parent then
    self.Btn_Click.OnClicked:Add(self, self.OnBtnClicked)
  end
  local Avatar = GWorld:GetAvatar()
  assert(Avatar, "\230\137\190\228\184\141\229\136\176Avatar")
  local Currency = Avatar.Resources:QueryResourceCount(self.Parent.CoinId)
  if self.SelectId then
    self.ChoicePrice = DataMgr.RougeLikeEventSelect[self.SelectId].Price
  end
  if self.ChoicePrice and Currency < self.ChoicePrice then
    self:PlayAnimationForward(self.Forbidden)
    self.IsCoinEnough = false
  end
end

function M:OnBtnClicked()
  self.CurrentTime = UE4.UGameplayStatics.GetRealTimeSeconds(self)
  if self.CurrentTime - self.StartTime < self.BtnCD then
    self:PlayAnimationForward(self.Normal)
    return
  end
  if not self.Parent.CanInteractChoices then
    self:PlayAnimationForward(self.Normal)
    return
  end
  local Avatar = GWorld:GetAvatar()
  assert(Avatar, "\230\137\190\228\184\141\229\136\176Avatar")
  local UIManager = GWorld.GameInstance:GetGameUIManager()
  assert(UIManager, "\230\137\190\228\184\141\229\136\176UIManager")
  local Currency = Avatar.Resources:QueryResourceCount(self.Parent.CoinId)
  if self.ChoicePrice and Currency < self.ChoicePrice then
    UIManager:ShowUITip(UIConst.Tip_CommonToast, GText("RL_Event_CantSelect"))
    return
  end
  self:PlayAnimation(self.Click)
  AudioManager(self):PlayUISound(self, "event:/ui/roguelike/level_event_select_btn_click", nil, nil)
  self.StartTime = UE4.UGameplayStatics.GetRealTimeSeconds(self)
  self.Parent:CloseChoiceExcept(self.OptionIndex)
  self:AddTimer(self.Click:GetEndTime(), function()
    self.Parent:ChooseItem(self.OptionIndex)
  end)
end

return M
