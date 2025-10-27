require("UnLua")
local NumberModel = require("BluePrints.UI.UI_PC.Archive.WBP_Archive_Number_Model")
local RewardModel = require("BluePrints.UI.UI_PC.Archive.WBP_Archive_Reward_Model")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:Construct()
  self.Btn_Click.OnClicked:Add(self, self.OnCellClicked)
  self.Btn_Click.OnHovered:Add(self, self.OnCellHovered)
  self.Btn_Click.OnUnhovered:Add(self, self.OnCellUnhovered)
  self.Btn_Click.OnPressed:Add(self, self.OnCellPressed)
  self.Btn_Click.OnReleased:Add(self, self.OnCellReleased)
  self.Name2Text = {
    Character = "UI_CharArchive_MainProgress",
    Melee = "UI_MeeleArchive_MainProgress",
    Ranged = "UI_RangedArchive_MainProgress",
    Resource = "UI_ItemArchive_MainProgress",
    Read = "UI_BookArchive_MainProgress",
    Enemy = "UI_EnemyArchive_MainProgress"
  }
  self.Name2TabNameText = {
    Character = "UI_CharArchive_SubProgress",
    Melee = "UI_WeaponArchive_SubProgress",
    Ranged = "UI_WeaponArchive_SubProgress",
    Resource = "UI_ItemArchive_SubProgress",
    Enemy = "UI_EnemyArchive_SubProgress"
  }
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
  if IsValid(self.GameInputModeSubsystem) then
    self:RefreshOpInfoByInputDevice(self.GameInputModeSubsystem:GetCurrentInputType(), self.GameInputModeSubsystem:GetCurrentGamepadName())
  end
  self:InitListenEvent()
end

function M:Destruct()
  self:ClearListenEvent()
end

function M:Init(Name, Type, Idx, TabText, Num_Now, Num_Total, ParentWidget)
  self.Name = Name
  self.Type = Type
  self.ParentWidget = ParentWidget
  if Num_Now then
    self.Num_Now = Num_Now
  else
    self.Num_Now = NumberModel:GetCurrentNumber(self.Type)
  end
  if Num_Total then
    self.Num_Total = Num_Total
  else
    self.Num_Total = NumberModel["Get" .. self.Name .. "SumNumber"](NumberModel)
  end
  if not Idx or 1 == Idx then
    self.Text_Desc:SetText(GText(self.Name2Text[self.Name]))
  else
    self.Text_Desc:SetText(string.format(GText(self.Name2TabNameText[self.Name]), TabText))
  end
  self.Text_Collect:SetText(string.format(GText("UI_Archive_Progress"), self.Num_Now, self.Num_Total))
  if not ReddotManager.GetTreeNode("ArchiveReward") then
    ReddotManager.AddNode("ArchiveReward")
  end
  ReddotManager.AddListener("ArchiveReward", self, self.RefreshReddot)
end

function M:RefreshReddot()
  local CacheDetail = ReddotManager.GetLeafNodeCacheDetail("ArchiveReward")
  if CacheDetail[self.Type] then
    self.Reddot:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  else
    self.Reddot:SetVisibility(ESlateVisibility.Collapsed)
  end
end

function M:CreateCommonKey(KeyInfoList)
  self.Key_Reward:CreateCommonKey(KeyInfoList)
end

function M:OnCellClicked()
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_small", nil, nil)
  self:PlayAnimation(self.Click)
  self:OpenReward()
end

function M:OpenReward()
  RewardModel:OpenReward(self.ParentWidget, self.Type)
end

function M:PlayClickAnim()
  self:PlayAnimation(self.Click)
end

function M:OnCellHovered()
  if not self:IsAnimationPlaying(self.Click) then
    self:StopAnimation(self.Normal)
    self:PlayAnimation(self.Hover)
  end
end

function M:OnCellUnhovered()
  if not self:IsAnimationPlaying(self.Click) then
    self:StopAnimation(self.Hover)
    self:StopAnimation(self.Press)
    self:PlayAnimation(self.Normal)
  end
end

function M:OnCellPressed()
  self:PlayAnimation(self.Press)
end

function M:OnCellReleased()
  self:StopAnimation(self.Press)
  self:PlayAnimation(self.Normal)
end

function M:InitListenEvent()
  if IsValid(self.GameInputModeSubsystem) then
    self.GameInputModeSubsystem.OnInputMethodChanged:Add(self, self.RefreshOpInfoByInputDevice)
  end
end

function M:ClearListenEvent()
  if IsValid(self.GameInputModeSubsystem) then
    self.GameInputModeSubsystem.OnInputMethodChanged:Remove(self, self.RefreshOpInfoByInputDevice)
  end
end

function M:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  if CurInputDevice == ECommonInputType.Touch then
    return
  end
  local IsUseKeyAndMouse = CurInputDevice == ECommonInputType.MouseAndKeyboard
  self:UpdateUIStyleInPlatform(IsUseKeyAndMouse)
end

function M:UpdateUIStyleInPlatform(IsUseKeyAndMouse)
  if IsUseKeyAndMouse then
    self:InitKeyboardView()
  else
    self:InitGamepadView()
  end
end

function M:InitGamepadView()
  self.Controller_Reward:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
end

function M:InitKeyboardView()
  self.Controller_Reward:SetVisibility(UIConst.VisibilityOp.Collapsed)
end

return M
