require("UnLua")
local Common_Dialog_LuaModel_BatchProduce = Class("BluePrints.UI.UI_PC.Common.Common_Dialog.Common_Dialog_LuaModel.Common_Dialog_LuaModel_Base")

function Common_Dialog_LuaModel_BatchProduce:Initialize()
  DebugPrint("Tianyi@ Common_Dialog_LuaModel_BatchProduce Initialize")
  self.Forging_Batch:BindOnProduceValueChange(self, self.OnProduceValueChange)
end

function Common_Dialog_LuaModel_BatchProduce:OnProduceValueChange(NewValue)
  self.Item_ForgingCostTip:UpdateDialogCostTip(NewValue)
end

return Common_Dialog_LuaModel_BatchProduce
