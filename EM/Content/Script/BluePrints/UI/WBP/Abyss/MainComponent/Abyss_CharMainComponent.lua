local ArmoryUtils = require("BluePrints.UI.WBP.Armory.ArmoryUtils")
local Component = {}

function Component:CharMain_Init()
  if not self.CharItemContentsMap then
    self:CharMain_CreateItemContents()
  end
  self:SetContentIsChosen(self.CharMain_CurContent, false)
  self:CharMain_InitListView()
end

function Component:CharMain_InitWidget()
  self.CharItemContentsMap = nil
  self.CharItemContentsArray = nil
  self.BP_CharItemContents:Clear()
  self.CurrentCharUuid = nil
  self.CharMain_CurContent = nil
end

function Component:CharMain_CreateItemContents()
  local Avatar = ArmoryUtils:GetAvatar()
  self.CharItemContentsMap = {}
  self.CharItemContentsArray = {}
  self.BP_CharItemContents:Clear()
  local Obj
  for Uuid, Char in pairs(Avatar.Chars) do
    Obj = self:NewItemContent(Char, CommonConst.ArmoryType.Char, CommonConst.ArmoryTag.Char)
    self.CharItemContentsMap[Uuid] = Obj
    self.BP_CharItemContents:Add(Obj)
    table.insert(self.CharItemContentsArray, Obj)
  end
end

function Component:CharMain_InitListView()
  self:CharMain_InitContentState()
  self:CharMain_SortItemContents()
end

function Component:CharMain_InitContentState()
  if self.CharMain_CurContent then
    self.CharMain_CurContent = nil
  end
  if self.CurrentCharUuid then
    self.CharMain_CurContent = self.CharItemContentsMap[self.CurrentCharUuid]
    self.CharMain_CurContent.IsSelected = true
  end
end

function Component:CharMain_SortItemContents()
  ArmoryUtils:SortItemContents(self.CharItemContentsArray, {
    "Level",
    "Rarity",
    "SortPriority",
    "UnitId"
  }, CommonConst.DESC, self.CharMain_CurContent)
end

function Component:CharMain_OnListItemClicked(Content)
  if self.CharMain_CurContent == Content then
    self.CharMain_CurContent = nil
    return
  end
  self.CurrentCharUuid = Content.Uuid
  if self.CurSlotType == "Char" then
    self:CharMain_SelectListItem(Content)
  end
end

function Component:CharMain_SelectListItem(Content)
  if Content then
    Content.TeamIdx = self.CurDungeonPanel.DungeonIndex
  end
  self:SetContentIsChosen(self.CharMain_CurContent, false)
  self:SetContentIsChosen(Content, true)
  self.CharMain_CurContent = Content
  if self.CurDungeonPanel then
    self.CurDungeonPanel:UpdateSlot(self.CurSlotName, Content)
  else
    DebugPrint("lhr@CharMain_SelectListItem\239\188\154\233\152\181\229\174\185\233\157\162\230\157\191\229\164\177\230\149\136\230\136\150\229\136\157\229\167\139\229\140\150\229\164\177\232\180\165")
  end
end

return Component
