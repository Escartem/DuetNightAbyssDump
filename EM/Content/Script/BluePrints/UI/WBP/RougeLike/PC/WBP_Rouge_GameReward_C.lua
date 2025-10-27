require("UnLua")
local M = Class({
  "BluePrints.UI.BP_UIState_C"
})

function M:Construct()
  self:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.EMScrollBox_138:SetControlScrollbarInside(false)
  self.Text_Target:SetText(GText("RougeMiniGamePointsReach"))
end

function M:InitScoreInfo(Score)
  self.Text_Score:SetText(Score)
end

function M:SetIsEmpty(IsEmpty)
  self.IsEmpty = IsEmpty
end

function M:PlayInAnim()
  self:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  if self.IsEmpty then
    self:PlayAnimation(self.Fail)
  else
    self:PlayAnimation(self.Get)
  end
end

function M:InitReward(EventId, CurIndex, Index, Rewards)
  if 1 == Index then
    local TokenAward = DataMgr.RougeLikeEventSelect[EventId].TokenAward
    if TokenAward and TokenAward[Index] and TokenAward[Index] > 0 then
      local TokenItem = self:CreateWidgetNew("RougeGameCurrency")
      TokenItem:InitInfo("/Game/UI/Texture/Dynamic/Atlas/RougeLike/T_Rouge_Icon_Yujing.T_Rouge_Icon_Yujing", TokenAward[Index])
      self.WrapBox_Reward:AddChild(TokenItem)
    end
  elseif 2 == Index then
    if Index <= CurIndex then
      self:AddBlessing(Rewards)
    else
      self:AddBlessing_NotGot()
    end
  elseif 3 == Index then
    if Index <= CurIndex then
      self:AddTreasure(Rewards)
    else
      self:AddTreasure_NotGot()
    end
  end
end

function M:AddBlessing(Rewards)
  for k, Info in pairs(Rewards) do
    if Info.BlessingId then
      local BlessingData = self:GetBlessingData(Info.BlessingId)
      local BlessingItem = self:CreateWidgetNew("RougeSettlementBlessItem")
      BlessingItem:InitInfo(BlessingData)
      self.WrapBox_Reward:AddChild(BlessingItem)
      
      local function Callback(bIsOpen)
        self.IsShowTips = bIsOpen
      end
      
      BlessingItem.ItemDetails_MenuAnchor.ItemDetailsMenuAnchor.OnMenuOpenChanged:Add(self, Callback)
    end
  end
end

function M:AddBlessing_NotGot()
  local BlessingItem = self:CreateWidgetNew("RougeSettlementBlessItem")
  BlessingItem:SetDefault()
  self.WrapBox_Reward:AddChild(BlessingItem)
  
  local function Callback(bIsOpen)
    self.IsShowTips = bIsOpen
  end
  
  BlessingItem.ItemDetails_MenuAnchor.ItemDetailsMenuAnchor.OnMenuOpenChanged:Add(self, Callback)
end

function M:AddTreasure(Rewards)
  for k, Info in pairs(Rewards) do
    if Info.TreasureId then
      local TreasureData = self:GetTreasueData(Info.TreasureId)
      local TreasureItem = self:CreateWidgetNew("RougeSettlementTreasureItem")
      TreasureItem:InitInfo(TreasureData)
      self.WrapBox_Reward:AddChild(TreasureItem)
      
      local function Callback(bIsOpen)
        self.IsShowTips = bIsOpen
      end
      
      TreasureItem.ItemDetails_MenuAnchor.ItemDetailsMenuAnchor.OnMenuOpenChanged:Add(self, Callback)
    end
  end
end

function M:AddTreasure_NotGot()
  local TreasureItem = self:CreateWidgetNew("RougeSettlementTreasureItem")
  TreasureItem:SetDefault()
  self.WrapBox_Reward:AddChild(TreasureItem)
  
  local function Callback(bIsOpen)
    self.IsShowTips = bIsOpen
  end
  
  TreasureItem.ItemDetails_MenuAnchor.ItemDetailsMenuAnchor.OnMenuOpenChanged:Add(self, Callback)
end

function M:GetBlessingData(BlessingId)
  local BlessingData = {}
  local BlessingInfo = DataMgr.RougeLikeBlessing[BlessingId]
  if not BlessingInfo then
    DebugPrint("RougeSettlement: Error! \230\137\190\228\184\141\229\136\176\229\175\185\229\186\148Blessing\232\161\168\233\135\140\231\154\132\230\149\176\230\141\174\239\188\140BlessingId:", BlessingId)
    return BlessingData
  end
  for k, v in pairs(BlessingInfo) do
    BlessingData[k] = v
  end
  BlessingData.ItemType = "Blessing"
  return BlessingData
end

function M:GetTreasueData(TreasureId)
  local TreasureData = {}
  local TreasureInfo = DataMgr.RougeLikeTreasure[TreasureId]
  if not TreasureInfo then
    DebugPrint("RougeSettlement: Error! \230\137\190\228\184\141\229\136\176\229\175\185\229\186\148Treasue\232\161\168\233\135\140\231\154\132\230\149\176\230\141\174\239\188\140TreasureId:", TreasureId)
    return TreasureInfo
  end
  for k, v in pairs(TreasureInfo) do
    TreasureData[k] = v
  end
  TreasureData.ItemType = "Treasure"
  return TreasureData
end

return M
