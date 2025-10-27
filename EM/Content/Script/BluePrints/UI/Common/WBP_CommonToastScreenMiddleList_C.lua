require("UnLua")
local WBP_CommonToastScreenMiddleList_C = Class("BluePrints.UI.BP_UIState_C")

function WBP_CommonToastScreenMiddleList_C:Initialize(Initializer)
  self.Super.Initialize(self)
  self.LatestSubUI = nil
  self.CurrentCount = 0
  self.CurrentVisibleCount = 0
  self.MaxCount = 3
  self.IsTimer = false
end

function WBP_CommonToastScreenMiddleList_C:OnLoaded(...)
  self.Super.OnLoaded(self, ...)
  self.RootWidget:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  if self.IsTimer then
    self:RemoveTimer("CloseBattleMiddleList")
    self.IsTimer = false
  end
  self:LoadSubUI(...)
end

function WBP_CommonToastScreenMiddleList_C:RefreshShowText(newText)
  if self.IsTimer then
    self:RemoveTimer("CloseBattleMiddleList")
    self.IsTimer = false
  end
  if self.LatestSubUI and newText == self.LatestSubUI.ShowText then
    if self.LatestSubUI:GetVisibility() == UE4.ESlateVisibility.Collapsed then
      self.CurrentVisibleCount = self.CurrentVisibleCount + 1
    end
    self.LatestSubUI:RefreshShowText(newText)
  else
    local NewSubUI
    for i = self.Panel_List:GetChildrenCount() - 1, 0, -1 do
      local SubUI = self.Panel_List:GetChildAt(i)
      if SubUI.ShowText == newText then
        NewSubUI = SubUI
        break
      end
    end
    if not NewSubUI and self.CurrentCount >= self.MaxCount then
      NewSubUI = self.Panel_List:GetChildAt(0)
    end
    if NewSubUI then
      self.Panel_List:RemoveChild(NewSubUI)
      self.Panel_List:AddChild(NewSubUI)
      self.LatestSubUI = NewSubUI
      if NewSubUI:GetVisibility() == UE4.ESlateVisibility.Collapsed then
        self.CurrentVisibleCount = self.CurrentVisibleCount + 1
      end
      NewSubUI:RefreshShowText(newText)
    else
      self:LoadSubUI(2, newText, 0)
    end
  end
end

function WBP_CommonToastScreenMiddleList_C:LoadSubUI(...)
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  local UIManager = GameInstance:GetGameUIManager()
  local SubUI
  if nil ~= UIManager then
    SubUI = self:CreateWidgetNew("BattleMiddleText")
    SubUI:InitWidget(...)
  end
  if nil ~= SubUI then
    SubUI.Parent = self
    self.LatestSubUI = SubUI
    self.Panel_List:AddChild(SubUI)
    self.CurrentCount = self.CurrentCount + 1
    self.CurrentVisibleCount = self.CurrentVisibleCount + 1
    SubUI:PlayAnimAndCollapsed()
  end
end

function WBP_CommonToastScreenMiddleList_C:ReduceSubUI()
  self.CurrentVisibleCount = self.CurrentVisibleCount - 1
  if self.CurrentVisibleCount <= 0 then
    self:AddTimer(0.1, self.Close, false, 10, "CloseBattleMiddleList", nil)
    self.IsTimer = true
  end
end

function WBP_CommonToastScreenMiddleList_C:Close()
  self.RootWidget:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self.CurrentCount = 0
  self.CurrentVisibleCount = 0
  self.LatestSubUI = nil
  for i = self.Panel_List:GetChildrenCount() - 1, 0, -1 do
    self.Panel_List:GetChildAt(i):Close()
  end
  self.Panel_List:ClearChildren()
  self.Super.Close(self)
end

return WBP_CommonToastScreenMiddleList_C
