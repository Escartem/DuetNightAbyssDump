require("UnLua")
local AttrModel = require("BluePrints.UI.UI_PC.Experience.WBP_Experience_Attr_Model")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:Construct()
  self.Avatar = GWorld:GetAvatar()
end

function M:Destruct()
  local GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(self)
  if IsValid(GameInputModeSubsystem) then
    self:RefreshOpInfoByInputDevice(GameInputModeSubsystem:GetCurrentInputType())
    GameInputModeSubsystem.OnInputMethodChanged:Remove(self, self.RefreshOpInfoByInputDevice)
  end
end

function M:InitContent(Params, PopupData, Owner)
  self.Owner = Owner
  self.Parent = Params.Parent
  self:Init()
  local GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(self)
  if IsValid(GameInputModeSubsystem) then
    self:RefreshOpInfoByInputDevice(GameInputModeSubsystem:GetCurrentInputType())
    GameInputModeSubsystem.OnInputMethodChanged:Add(self, self.RefreshOpInfoByInputDevice)
  end
end

function M:Init()
  self.CurrentLevel = self.Avatar.Level
  self.BuffId = DataMgr.PlayerLevelUp[self.CurrentLevel].PlayerBuffId
  self.BuffLevel = DataMgr.PlayerLevelUp[self.CurrentLevel].PlayerBuffLevel
  local AttrName2Info = AttrModel:GetAttrName2Info(self.BuffId, self.BuffLevel)
  local PlayerBuffAttrs = {}
  for Attr, Info in pairs(DataMgr.PlayerBuffAttrs) do
    table.insert(PlayerBuffAttrs, Info)
  end
  table.sort(PlayerBuffAttrs, function(a, b)
    return a.UnlockLevel < b.UnlockLevel
  end)
  self.List_Buff:ClearListItems()
  for Index, Info in ipairs(PlayerBuffAttrs) do
    local Content = NewObject(UIUtils.GetCommonItemContentClass())
    Content.Icon = Info.Icon
    Content.Attr = Info.Attr
    Content.AttrName = Info.AttrName
    Content.UnlockLevel = Info.UnlockLevel
    Content.PlayerBuffLockedTips = Info.PlayerBuffLockedTips
    Content.Index = Index
    if AttrName2Info[Info.Attr] then
      Content.Unlock = true
      Content.ValueStr = AttrName2Info[Info.Attr]
    else
      Content.Unlock = false
    end
    self.List_Buff:AddItem(Content)
  end
end

function M:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  local IsUseKeyAndMouse = CurInputDevice == ECommonInputType.MouseAndKeyboard
  if IsUseKeyAndMouse then
    self:InitKeyBoardView()
  else
    self:InitGamepadView()
  end
end

function M:InitGamepadView()
  self:SetFocus()
end

function M:InitKeyBoardView()
  self:SetFocus()
end

return M
