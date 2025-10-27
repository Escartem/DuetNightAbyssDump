require("UnLua")
require("DataMgr")
local WBP_PrologueMapItem_C = Class("BluePrints.UI.BP_UIState_C")

function WBP_PrologueMapItem_C:Construct(...)
  self.BtnMainLevelList = {
    self.Level_1,
    self.Level_2,
    self.Level_3,
    self.Level,
    self.Level_4,
    self.Level_5,
    self.Level_6,
    self.Level_7
  }
  self.LevelNames = {
    "\231\148\159\230\156\186",
    "\229\164\177\232\144\189\231\154\132\233\129\151\232\191\185",
    "\229\189\146\230\157\165\232\128\133",
    nil,
    "\229\145\189\230\130\172\228\184\128\231\186\191",
    "\233\155\190\230\181\183"
  }
  self.LevelIndex = {
    1,
    3,
    5,
    7,
    2,
    4,
    6,
    8
  }
  self:InitMainLevel(1001)
  self:AddDispatcher(EventID.OnMatchStateChanged, self, self.OnMatchStateChanged)
  self:OnMatchStateChanged()
end

function WBP_PrologueMapItem_C:SetItemContent(Content)
  self.Content = Content
  Content.MainWidget = self
  self.Parent = Content.Parent
end

function WBP_PrologueMapItem_C:InitMainLevel(ChapterID)
  local ChapterData = DataMgr.Chapter[ChapterID]
  local DungeonListData = ChapterData.DungeonList
  local LastOpenIndex = -1
  for i = 1, #self.BtnMainLevelList do
    if i <= #DungeonListData then
      self.BtnMainLevelList[i]:SetVisibility(UIConst.VisibilityOp.Visible)
      local DungeonID = DungeonListData[i]
      local DungeonName = ""
      if DungeonID >= 10000 then
        DungeonName = DataMgr.Dungeon[DungeonID].DungeonName
      else
        DungeonName = DataMgr.Region[DungeonID].RegionName
      end
      self.BtnMainLevelList[i].Text_Level_Name:SetText(GText(DungeonName))
      self.BtnMainLevelList[i].Parent = self
      self.BtnMainLevelList[i].DungeonID = DungeonID
      LastOpenIndex = i
    else
      self.BtnMainLevelList[i].Parent = self
      self.BtnMainLevelList[i].Panel_Lock:SetVisibility(UIConst.VisibilityOp.Visible)
      if self.LevelNames[i] then
        self.BtnMainLevelList[i].Text_Level_Name:SetText(self.LevelNames[i])
      end
    end
    self.BtnMainLevelList[i].bg_slc:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.BtnMainLevelList[i].Text_Lv_num:SetText(self.LevelIndex[i])
  end
  self.BtnMainLevelList[LastOpenIndex].bg_slc:SetVisibility(UIConst.VisibilityOp.Visible)
  self.LastOffset = 0
end

function WBP_PrologueMapItem_C:EnterLevel(DungeonID)
  if self.Content.Parent == nil then
    return
  end
  self.Content.Parent:ClickToSelectLevel(DungeonID)
end

function WBP_PrologueMapItem_C:OnMatchStateChanged()
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  local UIManger = GameInstance:GetGameUIManager()
  if UIManger and UIManger:GetUI("DungeonMatchingFloat") then
    for i = 1, #self.BtnMainLevelList do
      self.BtnMainLevelList[i].Btn_Click:SetIsEnabled(false)
    end
  else
    for i = 1, #self.BtnMainLevelList do
      self.BtnMainLevelList[i].Btn_Click:SetIsEnabled(true)
    end
  end
end

return WBP_PrologueMapItem_C
