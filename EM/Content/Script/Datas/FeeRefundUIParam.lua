local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("FeeRefundUIParam", {
  Coin1_Large = {
    ParamName = "Coin1_Large",
    ParamValue = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Prop/Item/T_Coin_Main_Lv1_4.T_Coin_Main_Lv1_4'"
  },
  Coin1_Mid = {
    ParamName = "Coin1_Mid",
    ParamValue = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Prop/Item/T_Coin_Main_Lv1_3.T_Coin_Main_Lv1_3'"
  },
  Coin1_Small = {
    ParamName = "Coin1_Small",
    ParamValue = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Prop/Item/T_Coin_Main_Lv1_1.T_Coin_Main_Lv1_1'"
  },
  MonthlyCard = {
    ParamName = "MonthlyCard",
    ParamValue = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Prop/Item/T_RechargeRebate_MonthCard.T_RechargeRebate_MonthCard'"
  },
  Phoxene = {
    ParamName = "Phoxene",
    ParamValue = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Prop/Item/T_Coin_Main_Lv1_4.T_Coin_Main_Lv1_4'"
  },
  RechargeRebateTip = {
    ParamName = "RechargeRebateTip",
    ParamValue = "/Game/UI/WBP/Activity/Widget/RechargeRebate/WBP_Activity_RechargeRebate_Tips.WBP_Activity_RechargeRebate_Tips"
  }
})
