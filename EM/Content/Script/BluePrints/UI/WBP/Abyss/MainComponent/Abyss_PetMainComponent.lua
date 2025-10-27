local ArmoryUtils = require("BluePrints.UI.WBP.Armory.ArmoryUtils")
local Component = {}

function Component:PetMain_Init()
  if not self.PetItemContentsArray then
    self:PetMain_CreateItemContents()
  end
  self:SetContentIsChosen(self.PetMain_CurContent, false)
  self:PetMain_InitListView()
end

function Component:PetMain_InitWidget()
  self.PetItemContentsMap = nil
  self.PetItemContentsArray = nil
  self.BP_PetItemContents:Clear()
  self.CurrentPetUuid = nil
  self.PetMain_CurContent = nil
end

function Component:PetMain_InitListView()
  if self.PetMain_CurContent then
    self.PetMain_CurContent = nil
  end
  if self.CurrentPetUuid then
    self.PetMain_CurContent = self.PetItemContentsMap[self.CurrentPetUuid]
    self.PetMain_CurContent.IsSelected = true
  end
  ArmoryUtils:SortItemContents(self.PetItemContentsArray, {
    "Level",
    "Rarity",
    "SortPriority",
    "UnitId"
  }, CommonConst.DESC, self.PetMain_CurContent)
end

function Component:PetMain_CreateItemContents()
  local Avatar = ArmoryUtils:GetAvatar()
  self.PetItemContentsMap = {}
  self.PetItemContentsArray = {}
  self.BP_PetItemContents:Clear()
  local Obj
  for UniqueId, Pet in pairs(Avatar.Pets) do
    if self:CheckPetType(Pet.PetId) then
      Obj = self:NewPetItemContent(Pet)
      self.BP_PetItemContents:Add(Obj)
      self.PetItemContentsMap[UniqueId] = Obj
      table.insert(self.PetItemContentsArray, Obj)
    end
  end
end

function Component:CheckPetType(PetId)
  return 1 == DataMgr.Pet[PetId].PetType
end

function Component:PetMain_OnListItemClicked(Content)
  if self.PetMain_CurContent == Content then
    self.PetMain_CurContent = nil
    return
  end
  self.CurrentPetUuid = Content.Uuid
  if self.CurSlotType == "Pet" then
    self:PetMain_SelectListItem(Content)
  end
end

function Component:PetMain_SelectListItem(Content)
  if Content then
    Content.TeamIdx = self.CurDungeonPanel.DungeonIndex
  end
  self:SetContentIsChosen(self.PetMain_CurContent, false)
  self:SetContentIsChosen(Content, true)
  self.PetMain_CurContent = Content
  if self.CurDungeonPanel then
    self.CurDungeonPanel:UpdateSlot(self.CurSlotName, Content)
  else
    DebugPrint("lhr@CharMain_SelectListItem\239\188\154\233\152\181\229\174\185\233\157\162\230\157\191\229\164\177\230\149\136\230\136\150\229\136\157\229\167\139\229\140\150\229\164\177\232\180\165")
  end
end

return Component
