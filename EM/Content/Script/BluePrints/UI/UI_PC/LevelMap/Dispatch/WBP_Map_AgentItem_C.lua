require("UnLua")
local M = Class({
  "BluePrints.UI.BP_UIState_C"
})
local AgentEnum = {Dispatching = 2, NotDispatched = 3}

function M:Initialize(Initializer)
  self.Super.Initialize(self)
  self.IsChoose = false
  self.Owner = nil
end

function M:Construct()
  self.Btn_Minus.Button_Area.OnClicked:Add(self, self.OnClickMinus)
  self.Btn_Click.OnClicked:Add(self, self.OnClick)
  self.Btn_Click.OnPressed:Add(self, self.OnPressed)
  self.Btn_Click.OnReleased:Add(self, self.OnReleased)
  self.Btn_Click.OnHovered:Add(self, self.OnHovered)
  self.Btn_Click.OnUnhovered:Add(self, self.OnUnhovered)
end

function M:OnListItemObjectSet(Content)
  self.Id = Content.Id
  self.Uuid = Content.Uuid
  self.Owner = Content.Owner
  self.State = Content.State
  if -1 == self.Id then
    self.WS_Type:SetActiveWidgetIndex(1)
    return
  end
  Content.UI = self
  self.Content = Content
  local IsChoose = self.Content.Parent.ChooseAgentList[self.Uuid] and true or false
  self.Content.IsChoose = IsChoose
  self.State = Content.State
  self:SetCharInfo(self.Id)
  self:SetCharAbility(self.Uuid)
  self:SetCharState()
end

function M:BP_OnEntryReleased()
  self.Content.UI = nil
end

function M:OnClick()
  if self.Content.Parent ~= nil then
    AudioManager(self):PlayUISound(self, "event:/ui/common/team_avatar_click", "", nil)
    self.Content.Parent:OnListItemClicked(self.Content)
  end
end

function M:OnClickMinus()
  if self.Content.Parent ~= nil then
    self.Content.Parent:OnListItemClicked(self.Content)
  end
end

function M:SetCharInfo(Id)
  local Path = DataMgr.Char[Id].Icon
  if nil == Path then
    DebugPrint(Id .. "\229\155\190\231\137\135\232\183\175\229\190\132\228\184\141\229\173\152\229\156\168")
    return
  end
  self.Icon_Head:SetBrushResourceObject(LoadObject(Path))
  self.Text_Name:SetText(GText(DataMgr.Char[Id].CharName))
end

function M:SetCharState()
  self:StopAllAnimations()
  if self.State == AgentEnum.Dispatching then
    self.Text_Dispatching:SetText(GText("UI_Disptach_Agent_State_Doing"))
    self:PlayAnimation(self.Dispatching)
  elseif self.State == AgentEnum.NotDispatched then
    self.Text_Dispatching:SetText(GText("UI_Disptach_Agent_State_Release"))
    self:PlayAnimation(self.Normal)
  end
  if self.Content.IsChoose == true then
    self:StopAllAnimations()
    self:PlayAnimation(self.Select)
  end
end

function M:SetCharAbility(UuId)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  self.WBox_Ability:ClearChildren()
  local Path = "/Game/UI/WBP/Map/Widget/Dispatch/WBP_Map_Ability_S.WBP_Map_Ability_S"
  local Char = Avatar.Chars[CommonUtils.Str2ObjId(UuId)]
  local Tag = Char:GetCurrentUnlockDispatchTag()
  for Type, Count in pairs(Tag) do
    for i = 1, Count do
      local AbilityItem = UIManager(self):CreateWidget(Path)
      if nil ~= AbilityItem then
        local IconPath = DataMgr.CharDispatchTag[Type].Icon
        local Icon = LoadObject(IconPath)
        AbilityItem.Icon_Ability:SetBrushResourceObject(Icon)
        self:SetColor(AbilityItem, Type)
        self.WBox_Ability:AddChildToWrapBox(AbilityItem)
      end
    end
  end
end

function M:SetColor(Item, Type)
  if "Battle" == Type then
    Item.BG:SetColorAndOpacity(Item.Color_BG_Red)
    Item:PlayAnimation(Item.Active)
  elseif "Collect" == Type or "Mine" == Type or "Fish" == Type or "Pet" == Type then
    Item.BG:SetColorAndOpacity(Item.Color_BG_Blue)
    Item:PlayAnimation(Item.Active)
  elseif "Workaholic" == Type or "Rigorous" == Type or "Skilled" == Type or "Lucky" == Type then
    Item:PlayAnimation(Item.Special)
  else
    Item.BG:SetColorAndOpacity(Item.Color_BG_Green)
    Item:PlayAnimation(Item.Active)
  end
end

function M:OnUnhovered()
  if self.Content.IsChoose then
    return
  end
  self:PlayAnimation(self.Unhover)
end

function M:OnPressed()
  if self.Content.IsChoose then
    return
  end
  self:PlayAnimation(self.Press)
end

function M:OnReleased()
  if self.Content.IsChoose or self.State == AgentEnum.Dispatching then
    return
  end
  self:PlayAnimation(self.Normal)
end

function M:OnHovered()
  if self.Content.IsChoose then
    return
  end
  self:PlayAnimation(self.Hover)
end

return M
