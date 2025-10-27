require("UnLua")
local Common_Button_Close_PC = Class("BluePrints.UI.UI_PC.Common.Common_Button.Common_Button_PC")

function Common_Button_Close_PC:Construct()
  self.Super.Construct(self, self.Btn_Close)
end

function Common_Button_Close_PC:SwitchNormalAnimation()
  self:StopAllAnimations()
  self:PlayAnimation(self.Normal)
end

return Common_Button_Close_PC
