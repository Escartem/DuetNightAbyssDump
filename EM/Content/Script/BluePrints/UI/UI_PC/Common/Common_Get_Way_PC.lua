require("UnLua")
local Common_Get_Way_PC = Class("BluePrints.UI.BP_EMUserWidget_C")

function Common_Get_Way_PC:Construct()
  self:InitButtonLogic()
end

function Common_Get_Way_PC:Destruct()
  self.Btn_Get_Way_3.OnClicked:Clear()
end

function Common_Get_Way_PC:InitButtonLogic()
  self.Btn_Get_Way_3.OnClicked:Add(self, self.OnButtonClicked)
end

function Common_Get_Way_PC:OnButtonClicked()
  UIUtils.PlayCommonBtnSe(self)
end

return Common_Get_Way_PC
