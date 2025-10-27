require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:Construct()
  self.Head_Anchor.OnGetMenuContentEvent:Bind(self, self.OnGetMenuContent)
  self.Head_Anchor.OnMenuOpenChanged:Add(self, self.OnMenuOpenChanged)
end

function M:OnMenuOpenChanged(bOpen)
  if true == bOpen then
    local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
    self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
    if IsValid(self.GameInputModeSubsystem) then
      local Offset = FMargin()
      if self.GameInputModeSubsystem:GetCurrentInputType() == ECommonInputType.Gamepad then
        Offset.Top = -40
      else
        Offset.Top = 0
      end
      self.Head_Anchor.Slot:SetOffsets(Offset)
    end
  end
  self:OnMenuOpenChangedComp(bOpen)
end

function M:OnGetMenuContent(Anchor)
  return self:OnGetMenuContentComp(Anchor)
end

function M:OnAnimationFinished(InAnim)
  self:OnAnimationFinishedComp(InAnim)
end

function M:Destruct()
  self.Head_Anchor.OnGetMenuContentEvent:Unbind()
  self.Head_Anchor.OnMenuOpenChanged:Remove(self, self.OnMenuOpenChanged)
end

function M:Init(User, ...)
  if not User or "" == User then
    return
  end
  if not self._components then
    if User == TeamCommon.HeadUser.Team then
      self._components = {
        "BluePrints.UI.WBP.Team.View.WBP_Team_Head_TeamComp_C"
      }
    elseif User == TeamCommon.HeadUser.Vote then
      self._components = {
        "BluePrints.UI.UI_PC.Vote.Widget.WBP_Team_Head_VoteComp_C"
      }
    elseif User == TeamCommon.HeadUser.Walnut then
      self._components = {
        "BluePrints.UI.WBP.Walnut.WalnutReward.WBP_Team_Head_WalnutComp_C"
      }
    end
    AssembleComponents(self)
  end
  self:InitComp(...)
end

function M:InitComp(...)
end

function M:OnGetMenuContentComp(Anchor)
end

function M:OnMenuOpenChangedComp(bOpen)
end

function M:OnAnimationFinishedComp(InAnim)
end

function M:UpdateTag()
end

function M:SetHeadState()
end

return M
