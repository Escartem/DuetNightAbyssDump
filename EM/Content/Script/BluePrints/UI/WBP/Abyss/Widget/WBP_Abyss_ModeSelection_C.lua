require("UnLua")
local WBP_Abyss_ModeSelection_C = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function WBP_Abyss_ModeSelection_C:Construct()
  self.Btn_Click.OnClicked:Add(self, self.OnCellClicked)
  self.Btn_Click.OnHovered:Add(self, self.OnCellHovered)
  self.Btn_Click.OnUnhovered:Add(self, self.OnCellUnhovered)
  self.Btn_Click.OnPressed:Add(self, self.OnCellPressed)
  self.Btn_Click.OnReleased:Add(self, self.OnCellReleased)
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
end

function WBP_Abyss_ModeSelection_C:BindEventOnClicked(Obj, Func, ...)
  if not Obj or not Func then
    return
  end
  self.Obj = Obj
  self.Func = Func
  self.Params = {
    ...
  }
end

function WBP_Abyss_ModeSelection_C:Init(Root, Index, AbyssId, IsLocked, FirstSelectedAbyssId)
  self.Root = Root
  self.Index = Index
  self.AbyssId = AbyssId
  self.IsLocked = IsLocked
  self.IsSelect = false
  self.Text_Name:SetText(GText(DataMgr.AbyssSeason[self.AbyssId].AbyssIdName))
  self:InitNavigation()
  local AbyssType = DataMgr.AbyssSeason[self.AbyssId].AbyssType
  self.Icon:SetBrush(self["Icon_" .. AbyssType])
  self.BG:SetBrush(self["BG_" .. AbyssType])
  if self.IsLocked then
    self:PlayAnimation(self.Locked_Normal)
  else
    self:PlayAnimation(self.Normal)
  end
  if not ReddotManager.GetTreeNode("AbyssReward") then
    ReddotManager.AddNode("AbyssReward")
  end
  ReddotManager.RemoveListener("AbyssReward", self)
  ReddotManager.AddListener("AbyssReward", self, self.RefreshReddot)
  if FirstSelectedAbyssId then
    if self.AbyssId == FirstSelectedAbyssId then
      self:OnCellClicked()
    end
  elseif 1 == self.Index then
    self:OnCellClicked(true)
  end
end

function WBP_Abyss_ModeSelection_C:RefreshReddot()
  local CacheDetail = ReddotManager.GetLeafNodeCacheDetail("AbyssReward")
  if not CacheDetail[self.AbyssId] then
    self.Reddot:SetVisibility(ESlateVisibility.Collapsed)
  else
    self.Reddot:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  end
end

function WBP_Abyss_ModeSelection_C:InitNavigation()
  self.Btn_Click:SetNavigationRuleCustom(EUINavigation.Up, {
    self,
    self.TryChangeSelectedTab
  })
  self.Btn_Click:SetNavigationRuleCustom(EUINavigation.Down, {
    self,
    self.TryChangeSelectedTab
  })
  self.Btn_Click:SetNavigationRuleCustom(EUINavigation.Right, {
    self.Root,
    self.Root.FocusToFirstMission
  })
end

function WBP_Abyss_ModeSelection_C:TryChangeSelectedTab(NavigationDirection)
  return self.Root:TryChangeSelectedTab(NavigationDirection, self.Index)
end

function WBP_Abyss_ModeSelection_C:UnSelected()
  self:StopAllAnimations()
  self:PlayAnimation(self.Normal)
  self.IsSelect = false
end

function WBP_Abyss_ModeSelection_C:Selected(DoNotPlaySound)
  self:StopAllAnimations()
  if not DoNotPlaySound then
    AudioManager(self):PlayUISound(self, "event:/ui/activity/drama_story_btn_click", nil, nil)
  end
  self:PlayAnimation(self.Click)
  self.IsSelect = true
end

function WBP_Abyss_ModeSelection_C:OnCellClicked(DoNotPlaySound)
  if self.IsSelect then
    return
  end
  if self.Obj and self.Func then
    self.Func(self.Obj, table.unpack(self.Params), DoNotPlaySound)
  end
end

function WBP_Abyss_ModeSelection_C:OnCellHovered()
  self.IsHovering = true
  if self.IsSelect then
    return
  end
  if self.IsLocked then
    self:StopAllAnimations()
    self:PlayAnimation(self.Locked_Normal)
    self:PlayAnimation(self.Locked_Hover)
    return
  end
  self:StopAllAnimations()
  self:PlayAnimation(self.Normal)
  self:PlayAnimation(self.Hover)
end

function WBP_Abyss_ModeSelection_C:OnCellUnhovered()
  self.IsHovering = false
  if self.IsSelect then
    return
  end
  if self.IsLocked then
    self:StopAllAnimations()
    self:PlayAnimation(self.Locked_UnHover)
    return
  end
  if not self.IsPressing then
    if self.GameInputModeSubsystem:GetCurrentInputType() ~= ECommonInputType.Gamepad then
      self:StopAllAnimations()
    end
    self:PlayAnimation(self.Unhover)
  end
end

function WBP_Abyss_ModeSelection_C:OnCellPressed()
  self.IsPressing = true
  if self.IsLocked or self.IsSelect then
    return
  end
  self:StopAllAnimations()
  self:PlayAnimation(self.Press)
end

function WBP_Abyss_ModeSelection_C:OnCellReleased()
  self.IsPressing = false
  if self.IsLocked or self.IsSelect then
    return
  end
  if not self.IsHovering then
    self:StopAllAnimations()
    self:PlayAnimationReverse(self.Press)
  else
    self:StopAllAnimations()
    self:PlayAnimation(self.Normal)
  end
end

return WBP_Abyss_ModeSelection_C
