local TimeUtils = require("Utils.TimeUtils")
local WBP_Forging_DialogItem_CostTip_C = Class("BluePrints.UI.UI_PC.Common.Common_Dialog.Common_Dialog_ContentBase")

function WBP_Forging_DialogItem_CostTip_C:PreInitContent(Params, PopupData, Owner)
  self.Super.PreInitContent(self, Params, PopupData, Owner)
  self:BindDialogEvent("UpdateDialogCostTip", self.UpdateDialogCostTip)
end

function WBP_Forging_DialogItem_CostTip_C:InitContent(Params, PopupData, Owner)
  self.Super.InitContent(self, Params, PopupData, Owner)
  local ForgeItemContent = Params.ForgeItemContent
  local DraftInfo = DataMgr.Draft[ForgeItemContent.Id]
  local ProduceNum = Params.ProduceNum or 1
  for FoundryId, CostNum in pairs(DraftInfo.FoundryCost) do
    self.FoundryId = FoundryId
    self.FoundryCost = CostNum
    break
  end
  self.TimeCost = DraftInfo.Time
  self:UpdateDialogCostTip(ProduceNum)
  self.Cost:SwitchToPC()
end

function WBP_Forging_DialogItem_CostTip_C:UpdateDialogCostTip(ProduceNum)
  self.Cost:InitContent({
    ResourceId = self.FoundryId,
    Numerator = self.FoundryCost * ProduceNum
  })
  if self.TimeCost > 0 then
    local EndTime = TimeUtils.NowTime() + self.TimeCost * 60 * ProduceNum
    local RemainTimeDict, TimeCount = UIUtils.GetLeftTimeStrStyle2(EndTime)
    self.Time:SetTimeText("", RemainTimeDict)
  else
    self.Time:SetTimeText("")
  end
end

return WBP_Forging_DialogItem_CostTip_C
