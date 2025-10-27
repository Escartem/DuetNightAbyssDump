require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:Initialize(Initializer)
end

function M:Construct()
  self.Btn_Click.OnClicked:Add(self, self.JumpToTaskPanel)
end

function M:Destruct()
end

function M:JumpToTaskPanel()
  if not self.QuestChainId then
    return
  end
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  local UIManager = GameInstance:GetGameUIManager()
  UIManager:LoadUINew("TaskPanel", self.QuestChainId)
end

function M:OnListItemObjectSet(Item)
  self.Text_Name:SetText(Item.QuestTypeName .. "\239\188\154" .. Item.QuestChainName)
  self.QuestChainId = Item.QuestChainId
  local Avatar = GWorld:GetAvatar()
  if Avatar:IsQuestChainUnlock(self.QuestChainId) then
    self.Switch_State:SetActiveWidgetIndex(2)
    self.Text_Name:SetRenderOpacity(0.2)
    self.Bg:SetColorAndOpacity(UE4.UUIFunctionLibrary.StringToLinearColor("000000FF"))
    self.Btn_Click:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  elseif Avatar:IsQuestChainLock(self.QuestChainId) or Avatar:IsQuestChainDoing(self.QuestChainId) then
    self.Switch_State:SetActiveWidgetIndex(0)
    self.Text_Name:SetRenderOpacity(1)
    self.Bg:SetColorAndOpacity(UE4.UUIFunctionLibrary.StringToLinearColor("4D4334FF"))
    self.Btn_Click:SetVisibility(ESlateVisibility.Visible)
  elseif Item.bIsFinished then
    self.Switch_State:SetActiveWidgetIndex(1)
    self.Text_Name:SetRenderOpacity(0.2)
    self.Bg:SetColorAndOpacity(UE4.UUIFunctionLibrary.StringToLinearColor("000000FF"))
    self.Btn_Click:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  else
    self.Switch_State:SetActiveWidgetIndex(2)
    self.Text_Name:SetRenderOpacity(0.2)
    self.Bg:SetColorAndOpacity(UE4.UUIFunctionLibrary.StringToLinearColor("000000FF"))
    self.Btn_Click:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  end
end

return M
