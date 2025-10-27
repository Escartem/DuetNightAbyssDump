require("UnLua")
local WBP_PrologueInfo_C = Class("BluePrints.UI.BP_UIState_C")

function WBP_PrologueInfo_C:Initialize(Initializer)
  self.Super.Initialize(self, Initializer)
  self.DungeonId = -1
end

function WBP_PrologueInfo_C:Construct()
  self.Super.Construct(self)
end

function WBP_PrologueInfo_C:OnLoaded(DungeonId, ...)
  self.Super.OnLoaded(self, DungeonId, ...)
  self.Btn_Single.OnClicked:Add(self, self.OnClick_Single)
  self.Btn_Team.OnClicked:Add(self, self.OnClick_Team)
  self.Btn_Close.OnClicked:Add(self, self.Close)
  self.DungeonId = DungeonId
  local DungeonData = DataMgr.Dungeon[self.DungeonId]
  assert(DungeonData, "\229\137\175\230\156\172ID\233\148\153\232\175\175" .. tostring(self.DungeonId))
  self.Text_Info:SetText(GText(DungeonData.DungeonName))
  self.Text_Single:SetText(GText(self.TextMap_Single))
  self.Text_Team:SetText(GText(self.TextMap_Match))
end

function WBP_PrologueInfo_C:Tick(MyGeometry, InDeltaTime)
  self.Super.Tick(self, MyGeometry, InDeltaTime)
end

function WBP_PrologueInfo_C:OnClick_Single()
  if -1 == self.DungeonId then
    return
  end
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    Avatar:EnterDungeon(self.DungeonId)
  else
    WorldTravelSubsystem(self):ChangeDungeonByDungeonId(self.DungeonId, CommonConst.DungeonNetMode.Standalone)
  end
end

function WBP_PrologueInfo_C:OnClick_Team()
  if -1 == self.DungeonId then
    return
  end
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    Avatar:EnterDungeon(self.DungeonId, CommonConst.DungeonNetMode.DedicatedServer)
  else
    assert(false)
  end
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  local UIManger = GameInstance:GetGameUIManager()
  if UIManger then
    UIManger:LoadUI(UIConst.DUNGEONMATCHINGFLOAT, "DungeonMatchingFloat", UIConst.ZORDER_FOR_COMMON_TIP, self.DungeonId)
  end
  self:Close()
end

return WBP_PrologueInfo_C
