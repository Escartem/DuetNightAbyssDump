require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C",
  "BluePrints.Common.TimerMgr"
})

function M:Init(Params)
  self.Parent = Params.Parent
  self.Target = Params.Target
  self.Type = Params.Type
  self.Tag = Params.Tag
  self.StarNum = Params.MaxBreakLevel
  for i = 1, self.StarNum do
    local Star = self["WBP_Armory_Star_" .. i]
    if IsValid(Star) then
      Star:SetVisibility(UIConst.VisibilityOp.Visible)
    end
  end
  if self.Type == CommonConst.ArmoryType.Char then
    self.SuccessToast.Text_Success:SetText(GText("Char_BreakLevelUp_Success"))
  elseif self.Type == CommonConst.ArmoryType.Weapon then
    self.SuccessToast.Text_Success:SetText(GText("Weapon_BreakLevelUp_Success"))
  end
end

function M:Construct()
  self:BindToAnimationFinished(self.LevelUp_In, {
    self,
    self.OnBreakLevelUpAnimFinished
  })
end

function M:Destruct()
  self:UnbindAllFromAnimationFinished(self.LevelUp_In)
end

function M:SetCallbacks(Callbacks)
  self.OnBreakLevelUpSuccessCallback = Callbacks.OnBreakLevelUpSuccessCallback
end

function M:OnBreakLevelUpSuccess(NewEnhanceLevel)
  self:SetBreakLevelStars(NewEnhanceLevel)
  self:PlayAnimation(self.LevelUp_In)
  AudioManager(self):PlayUISound(self, "event:/ui/armory/level_update_success_star_shinny", nil, nil)
  AudioManager(self):PlayUISound(self, "event:/ui/armory/level_update_success", nil, nil)
  if not self.OnBreakLevelUpSuccessCallback then
    return
  end
  local Attr = self.OnBreakLevelUpSuccessCallback(self.Parent)
  if Attr then
    self:UpdataAttrListView(Attr, nil)
  end
  self:AddTimer(0.1, function()
    self:PlayAttrAnim()
  end, false, 0, nil, true)
end

function M:UpdataAttrListView(Attrs, ComparedAttrs)
  self.Attrs = Attrs
  self.ComparedAttrs = ComparedAttrs
  self.List_Atrr:ClearListItems()
  local Obj
  local Idx = 1
  for i, Attr in ipairs(self.Attrs) do
    if Attr.IsDispatchTag then
      Obj = NewObject(UIUtils.GetCommonItemContentClass())
      Obj.IsDispatchTag = true
      Obj.Idx = Idx
      Obj.Icon = Attr.DispatchTagData.Icon
      Obj.Name = GText(Attr.DispatchTagData.Name)
      Obj.DispatchTag = Attr.DispatchTagData.DispatchTag
      Obj.Description = GText(Attr.DispatchTagData.Description)
      Obj.Style = Attr.Style or "ShowValue"
      local UnlockLevel = Attr.DispatchTagData.UnlockLevel
      if UnlockLevel then
        if UnlockLevel <= self.Target.EnhanceLevel then
          Obj.Unlocked = true
        else
          Obj.Unlocked = false
        end
      end
    elseif ComparedAttrs and not table.isempty(ComparedAttrs) then
      if Attr.AttrValue ~= self.ComparedAttrs[i].AttrValue then
        Obj = NewObject(UIUtils.GetCommonItemContentClass())
        Obj.Name = GText(Attr.AttrName)
        Obj.Value = Attr.AttrValue or 0
        Obj.CmpValue = self.ComparedAttrs[i].AttrValue or 0
        Obj.Desc = Attr.Desc
        Obj.Idx = Idx
        Obj.Style = Attr.Style or "ShowValue"
      end
    else
      Obj = NewObject(UIUtils.GetCommonItemContentClass())
      Obj.Name = GText(Attr.AttrName)
      Obj.Value = Attr.AttrValue or 0
      Obj.Desc = Attr.Desc
      Obj.Idx = Idx
      Obj.Style = Attr.Style or "ShowValue"
    end
    self.List_Atrr:AddItem(Obj)
    Idx = Idx + 1
  end
end

function M:PlayAttrAnim()
  local ListView = self.List_Atrr
  local Items = ListView:GetListItems():ToTable()
  for i, Item in ipairs(Items) do
    local EntryWidget = UE4.URuntimeCommonFunctionLibrary.GetEntryWidgetFromItem(ListView, i - 1)
    if EntryWidget then
      EntryWidget:PlayAnimation(EntryWidget.In)
      if Item.DispatchTag then
        EntryWidget:SetIsBreak(true)
      end
    end
  end
end

function M:InitBreakLevelStars(BreakLevel)
  for i = 1, self.StarNum do
    local Star = self["WBP_Armory_Star_" .. i]
    if IsValid(Star) then
      Star.Main:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
      if i < BreakLevel then
        Star.Switcher_Star:SetActiveWidgetIndex(0)
      elseif i == BreakLevel then
        Star:PlayAnimation(Star.Loop)
      else
        Star:PlayAnimation(Star.In)
      end
    end
  end
end

function M:SetBreakLevelStars(BreakLevel)
  local Stars = BreakLevel
  for i = 1, self.StarNum do
    local Star = self["WBP_Armory_Star_" .. i]
    if IsValid(Star) then
      if i <= Stars then
        Star:PlayAnimation(Star.Golden_In)
      else
        Star:PlayAnimation(Star.In)
      end
    end
  end
end

function M:OnBreakLevelUpAnimFinished()
  self:AddTimer(1.5, function()
    self:PlayAnimation(self.LevelUp_Out)
    self.Parent:OnBreakLevelUpAnimFinishedCallback()
  end, false, 0, nil, true)
end

return M
