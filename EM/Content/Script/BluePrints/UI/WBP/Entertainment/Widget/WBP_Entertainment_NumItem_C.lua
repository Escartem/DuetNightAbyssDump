require("UnLua")

local function GetIndexText(Index)
  if not Index then
    UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "\233\130\128\231\186\166\231\179\187\231\187\159\233\148\153\232\175\175", "\232\142\183\229\143\150\233\130\128\231\186\166\229\186\143\229\143\183\229\164\177\232\180\165\239\188\140\229\186\143\229\143\183\228\184\186\231\169\186\227\128\130")
    return nil
  end
  local IndexText = tostring(Index)
  if Index < 10 then
    IndexText = "0" .. IndexText
  end
  return IndexText
end

local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:SetIndex(Index)
  self.Index = Index
  local IndexText = GetIndexText(Index)
  self.Text_Num:SetText(IndexText)
end

function M:BindOnClicked(OnClicked)
  self.OnClicked = OnClicked
end

function M:ExecuteOnClicked()
  if self.OnClicked then
    self.OnClicked(self.Index)
  end
end

function M:SetSelected(bIsSelected)
  if self.bIsSelected == bIsSelected then
    return
  end
  self:StopAllAnimations()
  if bIsSelected then
    self:PlayAnimation(self.SelectAnimation)
  else
    self:PlayAnimation(self.UnselectAnimation)
  end
  self.bIsSelected = bIsSelected
end

function M:EnableReddot(bEnable)
  if bEnable then
    self.Reddot:SetVisibility(UE4.ESlateVisibility.Visible)
  else
    self.Reddot:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
end

function M:Initialize(Initializer)
  self.Index = 0
  self.OnClicked = nil
  self.bIsSelected = false
  self.ClickSound = "event:/ui/common/click_btn_sort_tab"
end

function M:Construct()
  self.SelectAnimation = self.Click
  self.UnselectAnimation = self.Normal
  self.Btn_Click.OnClicked:Add(self, self.HandleOnButtonClicked)
  self.Btn_Click.OnPressed:Add(self, self.HandleOnButtonPressed)
  self.Btn_Click.OnReleased:Add(self, self.HandleOnButtonReleased)
  self.Btn_Click.OnHovered:Add(self, self.HandleOnButtonHovered)
  self.Btn_Click.OnUnhovered:Add(self, self.HandleOnButtonUnhovered)
end

function M:Destruct()
  self.Btn_Click.OnClicked:Remove(self, self.HandleOnButtonClicked)
  self.Btn_Click.OnPressed:Remove(self, self.HandleOnButtonPressed)
  self.Btn_Click.OnReleased:Remove(self, self.HandleOnButtonReleased)
  self.Btn_Click.OnHovered:Remove(self, self.HandleOnButtonHovered)
  self.Btn_Click.OnUnhovered:Remove(self, self.HandleOnButtonUnhovered)
end

function M:HandleOnButtonClicked()
  if self.bIsSelected then
    return
  end
  self:ExecuteOnClicked()
  AudioManager(self):PlayUISound(self, self.ClickSound, nil, nil)
end

function M:HandleOnButtonPressed()
  if self.bIsSelected then
    return
  end
  self:StopAllAnimations()
  self:PlayAnimation(self.Press)
end

function M:HandleOnButtonReleased()
  if self.bIsSelected then
    return
  end
  self:StopAllAnimations()
  self:PlayAnimation(self.Normal)
end

function M:HandleOnButtonHovered()
  if self.bIsSelected then
    return
  end
  self:StopAllAnimations()
  self:PlayAnimation(self.Hover)
end

function M:HandleOnButtonUnhovered()
  if self.bIsSelected then
    return
  end
  self:StopAllAnimations()
  self:PlayAnimation(self.Unhover)
end

return M
