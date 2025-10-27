require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:Init(DispatchDetail)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  self.DispatchDetail = DispatchDetail
  self.WBox_Ability:ClearChildren()
  for Id, Items in pairs(self.DispatchDetail.SpecialAbility) do
    local Char = Avatar.Chars[CommonUtils.Str2ObjId(Id)]
    local Tag = Char:GetCurrentUnlockDispatchTag()
    for Type, Count in pairs(Tag) do
      for i = 1, Count do
        local TypeInfo = DataMgr.CharDispatchTag[Type]
        if 1 == TypeInfo.IsBuff then
          local Path = "/Game/UI/WBP/Map/Widget/Dispatch/WBP_Map_AbilityDetailItem.WBP_Map_AbilityDetailItem"
          local Item = UIManager(self):CreateWidget(Path)
          Item.Icon:PlayAnimation(Item.Icon.Special)
          Item.Icon.Icon_Ability:SetBrushResourceObject(LoadObject(TypeInfo.Icon))
          Item.Text_Describe:SetText(GText(TypeInfo.Description))
          self.WBox_Ability:AddChildToWrapBox(Item)
        end
      end
    end
  end
end

function M:GetIdByUuid(Uuid)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  for _, Char in pairs(Avatar.Chars) do
    if CommonUtils.ObjId2Str(Char.Uuid) == Uuid then
      return Char.CharId
    end
  end
end

return M
