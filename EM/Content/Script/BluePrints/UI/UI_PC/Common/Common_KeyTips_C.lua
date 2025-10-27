require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:UpdateKeyInfo(BottomKeyInfo)
  self.Panel_Key:ClearChildren()
  self.ComKeys = {}
  for i, KeyInfo in ipairs(BottomKeyInfo) do
    local KeyWidget = UIManager(self):_CreateWidgetNew("ComKeyTextDesc")
    self.Panel_Key:AddChild(KeyWidget)
    table.insert(self.ComKeys, KeyWidget)
    if #KeyInfo.KeyInfoList > 1 then
      KeyWidget:CreateSubKeyDesc(KeyInfo)
    else
      KeyWidget:CreateCommonKey(KeyInfo)
    end
  end
end

function M:UpdateKeyInfoNew(BottomKeyInfo)
  self.ComKeys = self.ComKeys or {}
  for i, _ in ipairs(BottomKeyInfo) do
    local BottomKeyWidget = self.ComKeys[i]
    if not IsValid(BottomKeyWidget) then
      BottomKeyWidget = UIManager(self):_CreateWidgetNew("ComKeyTextDesc")
      self.ComKeys[i] = BottomKeyWidget
      self.Panel_Key:AddChild(BottomKeyWidget)
    else
      BottomKeyWidget:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    end
  end
  for i = #BottomKeyInfo + 1, #self.ComKeys do
    local BottomKeyWidget = self.ComKeys[i]
    if IsValid(BottomKeyWidget) then
      BottomKeyWidget:RemoveFromParent()
    end
    self.ComKeys[i] = nil
  end
  for i, KeyInfo in ipairs(BottomKeyInfo) do
    local KeyWidget = self.ComKeys[i]
    if #KeyInfo.KeyInfoList > 1 then
      KeyWidget:CreateSubKeyDesc(KeyInfo)
    else
      KeyWidget:CreateCommonKey(KeyInfo)
    end
  end
end

function M:GetComKeyById(Index)
  return self.ComKeys[Index]
end

function M:ClearChildren()
  self.Panel_Key:ClearChildren()
  self.ComKeys = nil
end

return M
