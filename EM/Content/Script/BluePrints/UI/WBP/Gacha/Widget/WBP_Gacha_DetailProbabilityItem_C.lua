require("UnLua")
local GachaCommon = require("BluePrints.UI.WBP.Gacha.GachaCommon")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:Construct()
end

function M:OnListItemObjectSet(Content)
  local ProbabilityText = "Probability"
  local Probability
  if 5 == Content.GachaItemRarity then
    ProbabilityText = ProbabilityText .. "Gold"
    Probability = DataMgr.GachaProbability[DataMgr.SkinGacha[Content.GachaId].ProbabilityId][ProbabilityText] or 0
  elseif 4 == Content.GachaItemRarity then
    ProbabilityText = ProbabilityText .. "Purple"
    Probability = DataMgr.GachaProbability[DataMgr.SkinGacha[Content.GachaId].ProbabilityId][ProbabilityText] or 0
  else
    local Probability5 = DataMgr.GachaProbability[DataMgr.SkinGacha[Content.GachaId].ProbabilityId][ProbabilityText .. "Gold"] or 0
    local Probability4 = DataMgr.GachaProbability[DataMgr.SkinGacha[Content.GachaId].ProbabilityId][ProbabilityText .. "Purple"] or 0
    Probability = GachaCommon.GACHA_PROBABILITY_BASE - Probability5 - Probability4
  end
  local Rate = math.min(math.max(Probability / GachaCommon.GACHA_PROBABILITY_BASE, 0), 1) * 100
  if 5 == Content.GachaItemRarity then
    self.Text_Title:SetText(string.format(GText("UI_SkinGacha_Gold"), Rate))
  elseif 4 == Content.GachaItemRarity then
    self.Text_Title:SetText(string.format(GText("UI_SkinGacha_Purple"), Rate))
  elseif 3 == Content.GachaItemRarity then
    self.Text_Title:SetText(string.format(GText("UI_SkinGacha_Blue"), Rate))
  end
  self.List_Probability:ClearChildren()
  for _, ItemData in ipairs(Content.ItemLst) do
    local Probability = math.min(math.max(ItemData.Probability / GachaCommon.GACHA_PROBABILITY_BASE, 0), 1) * 100
    local Content = NewObject(UIUtils.GetCommonItemContentClass())
    local Type = GachaCommon.GachaItemTypeMap[ItemData.Type]
    Content.Id = ItemData.Id
    Content.Icon = ItemUtils.GetItemIconPath(ItemData.Id, Type)
    Content.ParentWidget = self
    Content.ItemType = Type
    if "Skin" == Type or "CharAccessory" == Type or "WeaponSkin" == Type or "WeaponAccessory" == Type or "Resource" == Type and DataMgr.Resource[ItemData.Id].ResourceSType == "GestureItem" then
    else
      Content.Count = ItemData.Count
    end
    Content.Rarity = DataMgr[Type][ItemData.Id].Rarity or 1
    Content.IsShowDetails = true
    Content.bDisableCommonClick = true
    Content.OnMouseButtonUpEvents = {
      Obj = self,
      Callback = function()
        if Content.ItemType == "Skin" then
          PageJumpUtils:CloseFrontDialog()
          UIManager(self):LoadUINew("ArmorySkin", {
            Type = "Char",
            SkinId = Content.Id,
            OnCloseCallback = function()
              local GachaMain = UIManager(self):GetUIObj("GachaMain")
              if GachaMain then
                GachaMain:OnClickBtnDetails()
              end
            end
          })
        elseif Content.ItemType == "WeaponSkin" then
          PageJumpUtils:CloseFrontDialog()
          UIManager(self):LoadUINew("ArmorySkin", {
            Type = "Weapon",
            SkinId = Content.Id,
            OnCloseCallback = function()
              local GachaMain = UIManager(self):GetUIObj("GachaMain")
              if GachaMain then
                GachaMain:OnClickBtnDetails()
              end
            end
          })
        end
      end
    }
    Content.JumpReturnCallBack = {
      CallBack = function()
        local GachaMain = UIManager(self):GetUIObj("GachaMain")
        if GachaMain then
          GachaMain:OnClickBtnDetails()
        end
      end
    }
    Content.HandleMouseDown = true
    Content.UIName = "GachaMain"
    local Widget = UIManager(self):_CreateWidgetNew("ComItemUniversalM")
    self.List_Probability:AddChild(Widget)
    Widget:Init(Content)
  end
end

function M:BP_GetDesiredFocusTarget()
  return self.List_Probability:GetChildAt(0)
end

return M
