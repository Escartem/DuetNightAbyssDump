require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:Init(Content)
  self:OnListItemObjectSet(Content)
end

function M:OnListItemObjectSet(Content)
  if Content.ShopItemId == nil then
    self.WidgetSwitcher_State:SetActiveWidgetIndex(1)
    return
  end
  self.WidgetSwitcher_State:SetActiveWidgetIndex(0)
  self:SetIcon(Content.Icon)
  self:SetRarity(Content.Rarity)
end

function M:SetIcon(IconPath)
  if self.ItemType == "Walnut" then
    IconPath = DataMgr.Walnut[self.Id].Icon
    self:SetWalnutNum(self.Id)
  end
  if self.bAsyncLoadIcon then
    self:LoadTextureAsync(IconPath, function(Texture)
      if not Texture then
        Texture = LoadObject("Texture2D'/Game/UI/Texture/Dynamic/Image/Head/Monster/T_Head_Empty.T_Head_Empty'")
        DebugPrint(ErrorTag, string.format("\231\148\168\233\148\153\229\155\190\230\160\135\232\183\175\229\190\132\228\186\134\239\188\129\239\188\129\239\188\129\232\191\153\233\135\140\231\148\168\233\187\152\232\174\164\231\154\132\229\155\190\230\160\135\233\161\182\228\184\128\228\184\139\n \233\148\153\232\175\175\231\154\132\232\183\175\229\190\132\230\152\175\239\188\154%s", IconPath))
      end
      if Texture then
        local __IconDynaMaterial = self.Item_BG:GetDynamicMaterial()
        if __IconDynaMaterial then
          __IconDynaMaterial:SetTextureParameterValue("IconMap", Texture)
        end
      end
    end, "LoadIcon")
  else
    assert(IconPath, "\233\129\147\229\133\183\230\161\134\228\188\160\229\133\165Icon\232\183\175\229\190\132\228\184\186\231\169\186")
    local Icon = LoadObject(IconPath)
    if not Icon then
      Icon = LoadObject("Texture2D'/Game/UI/Texture/Dynamic/Image/Head/Monster/T_Head_Empty.T_Head_Empty'")
      DebugPrint(ErrorTag, string.format("\231\148\168\233\148\153\229\155\190\230\160\135\232\183\175\229\190\132\228\186\134\239\188\129\239\188\129\239\188\129\232\191\153\233\135\140\231\148\168\233\187\152\232\174\164\231\154\132\229\155\190\230\160\135\233\161\182\228\184\128\228\184\139\n \233\148\153\232\175\175\231\154\132\232\183\175\229\190\132\230\152\175\239\188\154%s", IconPath))
    end
    local DynamicMaterial = self.Item_BG:GetDynamicMaterial()
    if not IsValid(DynamicMaterial) then
      DebugPrint("ZDX_DynamicMaterial\228\184\141\229\144\136\230\179\149")
    end
    DynamicMaterial:SetTextureParameterValue("IconMap", Icon)
  end
end

function M:LoadTextureAsync(TexturePath, cb, TaskName)
  rawset(self, "LoadResourceID", nil)
  local Handle = UE.UResourceLibrary.LoadObjectAsyncWithId(self, TexturePath, {
    self,
    function(self, Texture, ResourceID)
      if not IsValid(self) or nil ~= ResourceID and rawget(self, "LoadResourceID") ~= ResourceID then
        return
      end
      cb(Texture)
    end
  })
  if Handle then
    rawset(self, "LoadResourceID", Handle.ResourceID)
  end
end

function M:SetRarity(Rarity)
  local DynamicMaterial = self.Item_BG:GetDynamicMaterial()
  DynamicMaterial:SetScalarParameterValue("IconOpacity", 1)
  if not IsValid(DynamicMaterial) then
    DebugPrint("ZDX_DynamicMaterial\228\184\141\229\144\136\230\179\149")
  end
  if not Rarity or Rarity < 1 or Rarity > 6 then
    DynamicMaterial:SetScalarParameterValue("Index", 0)
    return
  end
  DynamicMaterial:SetScalarParameterValue("Index", Rarity)
end

function M:OnAnimationFinished(Anim)
  if Anim == self.UnHover then
    self:PlayAnimation(self.Normal)
  end
end

return M
