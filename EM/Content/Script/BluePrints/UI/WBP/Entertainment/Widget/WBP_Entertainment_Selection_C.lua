require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:SetText(Text)
  self.Text_Name:SetText(Text)
end

function M:EnableReddot(bEnable)
  if bEnable then
    self.Reddot:SetVisibility(UE4.ESlateVisibility.Visible)
  else
    self.Reddot:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
end

function M:BindOnClicked(OnClicked)
  self.OnClicked = OnClicked
end

function M:ExecuteOnClicked()
  if self.OnClicked then
    self.OnClicked()
  end
end

function M:Initialize(Initializer)
  self.ClickSound = "event:/ui/common/click_btn_large"
end

function M:SetIcon(IconPath)
  self.IconPath = IconPath
  UResourceLibrary.LoadObjectAsync(self, IconPath, {
    self,
    function(_, Icon)
      if self.IconPath ~= IconPath then
        return
      end
      local IconDynaMaterial = self.Icon_HandBood:GetDynamicMaterial()
      IconDynaMaterial:SetTextureParameterValue("Mask", Icon)
    end
  })
end

function M:Construct()
  self:BindToAnimationFinished(self.Click, {
    self,
    self.HandleOnClickAnimationFinished
  })
  self.Btn_Click.OnClicked:Add(self, self.HandleOnButtonClicked)
  self.Btn_Click.OnPressed:Add(self, self.HandleOnButtonPressed)
  self.Btn_Click.OnReleased:Add(self, self.HandleOnButtonReleased)
  self.Btn_Click.OnHovered:Add(self, self.HandleOnButtonHovered)
  self.Btn_Click.OnUnhovered:Add(self, self.HandleOnButtonUnhovered)
end

function M:Destruct()
  self:UnbindFromAnimationFinished(self.Click, {
    self,
    self.HandleOnClickAnimationFinished
  })
  self.Btn_Click.OnClicked:Remove(self, self.HandleOnButtonClicked)
  self.Btn_Click.OnPressed:Remove(self, self.HandleOnButtonPressed)
  self.Btn_Click.OnReleased:Remove(self, self.HandleOnButtonReleased)
  self.Btn_Click.OnHovered:Remove(self, self.HandleOnButtonHovered)
  self.Btn_Click.OnUnhovered:Remove(self, self.HandleOnButtonUnhovered)
end

function M:HandleOnButtonClicked()
  self:PlayAnimation(self.Click)
  AudioManager(self):PlayUISound(self, self.ClickSound, nil, nil)
end

function M:HandleOnButtonPressed()
  self:PlayAnimation(self.Press)
end

function M:HandleOnButtonReleased()
  self:PlayAnimation(self.Normal)
end

function M:HandleOnButtonHovered()
  self:PlayAnimation(self.Hover)
end

function M:HandleOnButtonUnhovered()
  self:PlayAnimation(self.Unhover)
end

function M:HandleOnClickAnimationFinished()
  self:ExecuteOnClicked()
end

return M
