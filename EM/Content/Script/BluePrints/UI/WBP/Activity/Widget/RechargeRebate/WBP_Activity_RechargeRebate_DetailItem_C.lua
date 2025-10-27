require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:InitItem(bShowOnly, LoadImgName, Level, ChargeFund, NumHave)
  local Img = LoadObject(DataMgr.FeeRefundUIParam[LoadImgName].ParamValue)
  self.Image_Icon:SetBrushFromTexture(Img)
  if bShowOnly then
    self.Group_DetailNum:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.Text_RechargeDetail:SetVisibility(UIConst.VisibilityOp.Collapsed)
  else
    self.Group_DetailNum:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    self.Text_RechargeDetail:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    self.PayProportion = DataMgr.FeeRefund[1].PayProportion
    self.Level = Level
    self.ChargeFund = ChargeFund
    self:InitRechargeDetail()
    self["InitNumInfo" .. Level](self, NumHave)
  end
end

function M:InitNumInfo1(NumHave)
  local MaxPhoxeneNum = self:GetStageMaxPhoxeneByLevel(self.Level)
  local num, _ = math.modf(MaxPhoxeneNum)
  self.Text_NumMax:SetText(num)
  if NumHave > num then
    self.Text_NumHave:SetText(num)
  else
    self.Text_NumHave:SetText(NumHave)
  end
end

function M:InitNumInfo2(NumHave)
  local MaxPhoxeneNum = self:GetStageMaxPhoxeneByLevel(self.Level)
  local num, _ = math.modf(MaxPhoxeneNum)
  self.Text_NumMax:SetText(num)
  if NumHave > num then
    self.Text_NumHave:SetText(num)
  else
    local Num = NumHave - self:GetStageMaxPhoxeneByLevel(1)
    if Num < 0 then
      Num = 0
    end
    self.Text_NumHave:SetText(Num)
  end
end

function M:InitNumInfo3(NumHave)
  self.Group_Have:SetVisibility(UIConst.VisibilityOp.Collapsed)
  if self.ChargeFund >= DataMgr.FeeRefund[1].ProgressMax then
    local PhoxeneNum = NumHave - self:GetStageMaxPhoxeneByLevel(2) - self:GetStageMaxPhoxeneByLevel(1)
    self.Text_NumMax:SetText(PhoxeneNum)
  else
    self.Text_NumMax:SetText(0)
  end
end

function M:InitRechargeDetail()
  local Num, _ = math.modf(self:GetStageRefundRatioByLevel(self.Level) * 100)
  local RechargeStr = string.format(GText("UI_RefundLevel"), tostring(Num) .. "%")
  self.Text_RechargeDetail:SetText(RechargeStr)
end

function M:GetProgress()
  local StageFund = self:GetStageFundByLevel(self.Level)
  local ChargeFundInStage = self:GetChargeFundInStagenyLevel(self.Level)
  return ChargeFundInStage * 1.0 / (StageFund * 3.0)
end

function M:GetStageFundByLevel(Level)
  if 1 == Level then
    return DataMgr.FeeRefund[1].PayLevel2 - DataMgr.FeeRefund[1].PayLevel1
  elseif 2 == Level then
    return DataMgr.FeeRefund[1].PayLevel3 - DataMgr.FeeRefund[1].PayLevel2
  elseif 3 == Level then
    return DataMgr.FeeRefund[1].ProgressMax - DataMgr.FeeRefund[1].PayLevel3
  end
  return 0
end

function M:GetChargeFundInStagenyLevel(Level)
  local Num = 0
  if 1 == Level then
    if self.ChargeFund < DataMgr.FeeRefund[1].PayLevel2 then
      Num = self.ChargeFund - DataMgr.FeeRefund[1].PayLevel1
    else
      Num = DataMgr.FeeRefund[1].PayLevel2 - DataMgr.FeeRefund[1].PayLevel1
    end
  elseif 2 == Level then
    if self.ChargeFund < DataMgr.FeeRefund[1].PayLevel3 then
      Num = self.ChargeFund - DataMgr.FeeRefund[1].PayLevel2
    else
      Num = DataMgr.FeeRefund[1].PayLevel3 - DataMgr.FeeRefund[1].PayLevel2
    end
  elseif 3 == Level then
    if self.ChargeFund < DataMgr.FeeRefund[1].ProgressMax then
      Num = self.ChargeFund - DataMgr.FeeRefund[1].PayLevel3
    else
      Num = DataMgr.FeeRefund[1].ProgressMax - DataMgr.FeeRefund[1].PayLevel3
    end
  end
  if Num < 0 then
    Num = 0
  end
  return Num
end

function M:GetStageRefundRatioByLevel(Level)
  local StageRefundRatio = 0
  if 1 == Level then
    StageRefundRatio = DataMgr.FeeRefund[1].RefundLevel1
  elseif 2 == Level then
    StageRefundRatio = DataMgr.FeeRefund[1].RefundLevel2
  elseif 3 == Level then
    StageRefundRatio = DataMgr.FeeRefund[1].RefundLevel3
  end
  return StageRefundRatio
end

function M:GetStageMaxPhoxeneByLevel(Level)
  local Fund = 0
  if 1 == Level then
    Fund = self:GetStageFundByLevel(Level)
  elseif 2 == Level then
    Fund = self:GetStageFundByLevel(Level)
  elseif 3 == Level then
    Fund = self:GetStageFundByLevel(Level)
  end
  Fund = Fund * self.PayProportion * self:GetStageRefundRatioByLevel(Level)
  local num, _ = math.modf(Fund)
  return num
end

return M
