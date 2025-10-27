require("UnLua")
local M = Class({
  "BluePrints.UI.BP_UIState_C"
})
local AgentEnum = {
  Dispatching = 2,
  NotDispatched = 3,
  Fighting = 1
}

function M:Initialize(Initializer)
  self.Super.Initialize(self)
  self.IsChoose = false
  self.Owner = nil
  self.AbilityList = {}
end

function M:Construct()
end

function M:OnListItemObjectSet(Content)
  self.Id = Content.Id
  self.Uuid = Content.Uuid
  self.Owner = Content.Owner
  self.State = Content.State
  if -1 == self.Id then
    self.Item.Switch_Type:SetActiveWidgetIndex(1)
    return
  end
  self.Content = Content
  Content.UI = self
  local CharInfo = DataMgr.Char[self.Id]
  self.Item.Content = {}
  self.Item:SetInteractivity(true)
  self.Item:SetMinusBtn(true, self, self.OnClickMinus)
  self.Item.Minus:SetVisibility(ESlateVisibility.Collapsed)
  self.Item:SetIcon(CharInfo.Icon)
  self.Item:SetRarity(CharInfo.CharRarity)
  if self.State == AgentEnum.Dispatching then
    self.Item:SetDispatchAgent(self.State, GText("UI_Disptach_Agent_State_Doing"))
  elseif self.State == AgentEnum.Fighting then
    self.Item:SetDispatchAgent(self.State, GText("UI_Disptach_Agent_State_Busy"))
  else
    self.Item:SetDispatchAgent(self.State, nil)
  end
  self.Item.VerticalBox_NameLevelNum:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self.WBox_Ability:ClearChildren()
  self:AddAbility()
end

function M:BP_OnEntryReleased()
  if self.conten then
    self.Content.UI = nil
  end
end

function M:OnClickMinus()
  self:CancelChoose()
  self.Owner.DispatchDetail:RemoveAgentData(nil, self.Uuid)
end

function M:AddAbility()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  local Char = Avatar.Chars[CommonUtils.Str2ObjId(self.Uuid)]
  self.AbilityList = Char:GetCurrentUnlockDispatchTag()
  for Type, Count in pairs(self.AbilityList) do
    for i = 1, Count do
      local TagInfo = DataMgr.CharDispatchTag[Type]
      local Path = "/Game/UI/WBP/Map/Widget/Dispatch/WBP_Map_Ability_S.WBP_Map_Ability_S"
      local Item = UIManager(self):CreateWidget(Path)
      Item.Icon_Ability:SetBrushResourceObject(LoadObject(TagInfo.Icon))
      self:SetColor(Item, TagInfo.DispatchTag)
      self.WBox_Ability:AddChildToWrapBox(Item)
    end
  end
end

function M:SetColor(Item, Type)
  local ColorName = UIUtils.GetDispathchColorNameByType(Type)
  if ColorName and Item["Color_BG_" .. ColorName] then
    Item.BG:SetColorAndOpacity(Item["Color_BG_" .. ColorName])
  else
    Item:PlayAnimation(Item.Special)
  end
end

function M:CancelChoose()
  if self.State == AgentEnum.Dispatching or self.State == AgentEnum.Fighting then
    return
  end
  local Info = self.Item.Set:GetChildAt(0)
  Info.Img_Mask:SetVisibility(ESlateVisibility.Collapsed)
  Info.TipText:SetVisibility(ESlateVisibility.Collapsed)
  self.Item.Minus:SetVisibility(ESlateVisibility.Collapsed)
  self.IsChoose = false
end

return M
