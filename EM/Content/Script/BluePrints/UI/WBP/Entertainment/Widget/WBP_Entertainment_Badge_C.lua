require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:OpenPanel(bIsUnlock)
  if self:IsPanelOpened() then
    return
  end
  self.bIsOpened = true
  self:StopAllAnimations()
  self:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  if bIsUnlock then
    self:PlayAnimation(self.In)
    AudioManager(self):PlayUISound(self, self.BadgeUnlockSound, nil, nil)
  else
    self:PlayAnimation(self.Normal_In)
  end
end

function M:ClosePanel()
  if not self:IsPanelOpened() then
    return
  end
  self.bIsOpened = false
  self:StopAllAnimations()
  self:PlayAnimation(self.Out)
end

function M:IsPanelOpened()
  return self.bIsOpened
end

function M:SetMemory(MemoryName, MemoryDescription, MemoryIconPath)
  self.MemoryName = MemoryName
  self.MemoryDescription = MemoryDescription
  self.MemoryIconPath = MemoryIconPath
  if not MemoryIconPath then
    return
  end
  local IconBadgeDynamicMaterial = self.Icon_Badge:GetDynamicMaterial()
  IconBadgeDynamicMaterial:SetTextureParameterValue("MainTex", LoadObject(MemoryIconPath))
  self.Icon_Empty:SetVisibility(ESlateVisibility.Collapsed)
  self.Bg:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  self.Icon_Badge:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
end

function M:SetEmpty()
  self.MemoryName = nil
  self.MemoryDescription = nil
  self.MemoryIconPath = nil
  self.Icon_Empty:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  self.Bg:SetVisibility(ESlateVisibility.Collapsed)
  self.Icon_Badge:SetVisibility(ESlateVisibility.Collapsed)
end

function M:BindOnDisplayMemory(OnDisplayMemory)
  self.OnDisplayMemory = OnDisplayMemory
end

function M:ExecuteOnDisplayMemory(MemoryName, MemoryDescription, MemoryIconPath)
  if self.OnDisplayMemory then
    self.OnDisplayMemory(MemoryName, MemoryDescription, MemoryIconPath)
  end
end

function M:Initialize(Initializer)
  self.bIsOpened = true
  self.MemoryName = nil
  self.MemoryDescription = nil
  self.MemoryIconPath = nil
  self.BadgeUnlockSound = "event:/ui/common/invite_char_unlock"
end

function M:Construct()
  self.Btn_Click.OnClicked:Add(self, self.HandleOnButtonClicked)
  self:BindToAnimationFinished(self.In, {
    self,
    self.HandleOnInAnimationFinished
  })
  self:BindToAnimationFinished(self.Out, {
    self,
    self.HandleOnOutAnimationFinished
  })
end

function M:Destruct()
  self.Btn_Click.OnClicked:Remove(self, self.HandleOnButtonClicked)
  self:UnbindFromAnimationFinished(self.In, {
    self,
    self.HandleOnInAnimationFinished
  })
  self:UnbindFromAnimationFinished(self.Out, {
    self,
    self.HandleOnOutAnimationFinished
  })
end

function M:HandleOnInAnimationFinished()
end

function M:HandleOnOutAnimationFinished()
  self:SetVisibility(ESlateVisibility.Collapsed)
end

function M:HandleOnButtonClicked()
  if not self.MemoryIconPath then
    return
  end
  self:ExecuteOnDisplayMemory(self.MemoryName, self.MemoryDescription, self.MemoryIconPath)
end

return M
